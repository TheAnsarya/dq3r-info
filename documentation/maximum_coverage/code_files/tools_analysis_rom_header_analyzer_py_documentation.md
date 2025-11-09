# Code Documentation: tools\analysis\rom_header_analyzer.py

**File Type:** .py
**File Size:** 21,322 bytes
**Lines of Code:** 591
**Generated:** 2025-11-09 10:29:38.270381

## File Analysis Summary

- **Cyclomatic Complexity:** 170
- **Maintainability Index:** 82.0
- **Comment Ratio:** 6.6%

## Functions

### __init__
- **Line:** 47
- **Arguments:** `self, rom_path: str`
- **Complexity:** 1

### _analyze_init_sequence
- **Line:** 243
- **Arguments:** `self, code: bytes, analysis: Dict[str, Any]`
- **Complexity:** 24
- **Description:** Analyze initialization code sequence

### generate_header_report
- **Line:** 334
- **Arguments:** `self, output_path: str`
- **Complexity:** 19
- **Description:** Generate comprehensive header analysis report

### generate_initialization_disassembly
- **Line:** 501
- **Arguments:** `self, output_path: str`
- **Complexity:** 6
- **Description:** Generate assembly disassembly of initialization code

### run_complete_analysis
- **Line:** 543
- **Arguments:** `self, output_dir: str`
- **Complexity:** 3
- **Description:** Run complete header and initialization analysis

### main
- **Line:** 578
- **Arguments:** ``
- **Complexity:** 3
- **Description:** Main entry point for ROM header analysis

## Classes

### SNESHeader
- **Line:** 18
- **Description:** SNES ROM header structure
### InterruptVector
- **Line:** 35
- **Description:** Interrupt vector information
### DQ3ROMHeaderAnalyzer
- **Line:** 44
- **Description:** Comprehensive ROM header and system analysis
#### Methods
- **__init__** (line 47) [private]
- **_analyze_init_sequence** (line 243) [private]
- **generate_header_report** (line 334)
- **generate_initialization_disassembly** (line 501)
- **run_complete_analysis** (line 543)
- **main** (line 578)

## Imports

- Line 10: `import struct`
- Line 11: `import sys`
- Line 12: `from pathlib import Path`
- Line 13: `from typing import Dict, List, Tuple, Any`
- Line 14: `from dataclasses import dataclass`

