# Dragon Quest III - API Reference

Complete API documentation for all analysis tools and utilities.

## Analysis Tools API

### ROM Map Analyzer

**Purpose:** Complete ROM coverage analysis using official specifications

```python
from tools.analysis.rom_map_analyzer import DQ3ROMMapAnalyzer

# Initialize analyzer
analyzer = DQ3ROMMapAnalyzer(project_root)

# Load ROM and analyze
analyzer.load_rom()
analyzer.analyze_overworld_data()
analyzer.analyze_monster_data()
analyzer.generate_coverage_report()
```

### Memory Banking Analyzer

**Purpose:** SNES LoROM banking system analysis

```python
from tools.analysis.memory_banking_analyzer import DQ3MemoryBankingAnalyzer

analyzer = DQ3MemoryBankingAnalyzer(project_root)
analyzer.load_rom()
analyzer.analyze_rom_header()
analyzer.analyze_bank_structure()
```

### Disassembly Engine

**Purpose:** 65816 instruction disassembly with cross-references

```python
from tools.analysis.disassembly_engine import DQ3DisassemblyEngine

engine = DQ3DisassemblyEngine(project_root)
engine.load_rom()
instructions = engine.disassemble_range(start_offset, length)
entry_points = engine.analyze_entry_points()
```

### Graphics Format Analyzer

**Purpose:** Multi-format graphics detection and analysis

```python
from tools.analysis.graphics_format_analyzer import DQ3GraphicsAnalyzer

analyzer = DQ3GraphicsAnalyzer(project_root)
analyzer.load_rom()
analyzer.find_graphics_chunks()
analyzer.find_palette_areas()
```

### Audio System Analyzer

**Purpose:** BRR sample detection and SPC-700 analysis

```python
from tools.analysis.audio_system_analyzer import DQ3AudioAnalyzer

analyzer = DQ3AudioAnalyzer(project_root)
analyzer.load_rom()
analyzer.detect_brr_samples()
analyzer.detect_audio_sequences()
```

## Data Structures

### Instruction Class

```python
@dataclass
class Instruction:
    address: int
    opcode: int
    mnemonic: str
    operands: List[int]
    addressing_mode: AddressMode
    size: int
    cycles: int
    target_address: Optional[int] = None
```

### Graphics Chunk

```python
@dataclass
class GraphicsChunk:
    offset: int
    size: int
    format: GraphicsFormat
    tile_count: int
    confidence: float
```

### BRR Sample

```python
@dataclass
class BRRSample:
    offset: int
    size: int
    loop_point: Optional[int]
    is_looped: bool
    quality_score: float
```

## Analysis Results Format

All analysis tools generate JSON reports with consistent structure:

```json
{
  "summary": {
    "total_elements": 0,
    "coverage_percentage": 0.0,
    "analysis_date": "2025-01-01T00:00:00"
  },
  "detailed_results": [
    // Specific analysis data
  ]
}
```

## Integration Examples

### Complete Analysis Pipeline

```python
def run_complete_analysis(project_root):
    """Run all analysis tools in sequence"""
    
    # ROM Coverage
    rom_analyzer = DQ3ROMMapAnalyzer(project_root)
    rom_analyzer.load_rom()
    rom_analyzer.analyze_all_systems()
    
    # Memory Banking
    bank_analyzer = DQ3MemoryBankingAnalyzer(project_root)
    bank_analyzer.load_rom()
    bank_analyzer.analyze_complete_banking()
    
    # Generate documentation
    doc_gen = DQ3DocumentationGenerator(project_root)
    doc_gen.load_analysis_results()
    doc_gen.generate_complete_documentation()
```

### Custom Analysis

```python
def analyze_specific_range(rom_path, start, end):
    """Analyze specific ROM range with all tools"""
    
    results = {}
    
    # Disassembly
    disasm = DQ3DisassemblyEngine('.')
    disasm.load_rom()
    instructions = disasm.disassemble_range(start, end - start)
    results['instructions'] = len(instructions)
    
    # Graphics
    graphics = DQ3GraphicsAnalyzer('.')
    graphics.load_rom()
    chunks = graphics.analyze_range(start, end - start)
    results['graphics_chunks'] = len(chunks)
    
    return results
```

## Error Handling

All analysis tools implement comprehensive error handling:

```python
try:
    analyzer = DQ3ROMMapAnalyzer(project_root)
    if not analyzer.load_rom():
        raise RuntimeError('Failed to load ROM')
    analyzer.analyze_all_systems()
except FileNotFoundError:
    print('ROM file not found')
except AnalysisError as e:
    print(f'Analysis failed: {e}')
except Exception as e:
    print(f'Unexpected error: {e}')
```

## Configuration Options

### Analysis Parameters

```python
# ROM Map Analyzer
config = {
    'coverage_threshold': 0.7,  # Minimum confidence
    'max_analysis_size': 0x200000,  # 2MB limit
    'enable_cross_references': True
}

# Graphics Analyzer
graphics_config = {
    'confidence_threshold': 0.7,
    'max_chunks_per_bank': 1000,
    'palette_detection': True
}
```

## Performance Guidelines

### Optimization Tips

1. **Memory Usage:** Large ROMs require significant RAM
2. **Processing Time:** Complete analysis may take several minutes
3. **Disk Space:** Reports can be several MB in size
4. **Parallel Processing:** Tools can run concurrently on different banks

### Best Practices

```python
# Efficient analysis for large ROMs
def efficient_analysis(project_root, bank_range=None):
    analyzer = DQ3ROMMapAnalyzer(project_root)
    analyzer.load_rom()
    
    if bank_range:
        # Analyze specific banks only
        start_bank, end_bank = bank_range
        analyzer.analyze_bank_range(start_bank, end_bank)
    else:
        # Full analysis with progress tracking
        analyzer.analyze_all_systems(progress_callback=print_progress)
```

---
*API Reference - Generated 2025-11-09 11:11:50*