# Code Documentation: tools\automation\complete_disassembly.py

**File Type:** .py
**File Size:** 30,737 bytes
**Lines of Code:** 870
**Generated:** 2025-11-09 10:29:38.277684

## File Analysis Summary

- **Cyclomatic Complexity:** 163
- **Maintainability Index:** 89.0
- **Comment Ratio:** 8.9%

## Functions

### __init__
- **Line:** 45
- **Arguments:** `self, repo_path: str, rom_path: str`
- **Complexity:** 2

### start_automated_disassembly
- **Line:** 344
- **Arguments:** `self`
- **Complexity:** 4
- **Description:** Begin the complete automated disassembly process

### _create_all_issues
- **Line:** 374
- **Arguments:** `self`
- **Complexity:** 4
- **Description:** Create GitHub issues for all disassembly targets

### _process_disassembly_target
- **Line:** 388
- **Arguments:** `self, target: DisassemblyTarget`
- **Complexity:** 14
- **Description:** Process a single disassembly target with full automation

### _disassemble_code_region
- **Line:** 462
- **Arguments:** `self, target: DisassemblyTarget`
- **Complexity:** 2
- **Description:** Disassemble a code region with comprehensive analysis

### _analyze_data_region
- **Line:** 512
- **Arguments:** `self, target: DisassemblyTarget`
- **Complexity:** 3
- **Description:** Analyze and document a data region

### _extract_graphics_assets
- **Line:** 539
- **Arguments:** `self, target: DisassemblyTarget`
- **Complexity:** 2
- **Description:** Extract and document graphics assets

### _extract_audio_assets
- **Line:** 564
- **Arguments:** `self, target: DisassemblyTarget`
- **Complexity:** 2
- **Description:** Extract and document audio assets

### _generate_final_analysis
- **Line:** 799
- **Arguments:** `self`
- **Complexity:** 4
- **Description:** Generate comprehensive final analysis report

### main
- **Line:** 851
- **Arguments:** ``
- **Complexity:** 4
- **Description:** Main entry point for complete disassembly automation

## Classes

### DisassemblyTarget
- **Line:** 29
- **Description:** Represents a specific disassembly target
### CompleteDisassemblyEngine
- **Line:** 42
- **Description:** Master engine for complete ROM disassembly automation
#### Methods
- **__init__** (line 45) [private]
- **start_automated_disassembly** (line 344)
- **_create_all_issues** (line 374) [private]
- **_process_disassembly_target** (line 388) [private]
- **_disassemble_code_region** (line 462) [private]
- **_analyze_data_region** (line 512) [private]
- **_extract_graphics_assets** (line 539) [private]
- **_extract_audio_assets** (line 564) [private]
- **_generate_final_analysis** (line 799) [private]
- **main** (line 851)

## Imports

- Line 10: `import os`
- Line 11: `import sys`
- Line 12: `import time`
- Line 13: `import json`
- Line 14: `from pathlib import Path`
- Line 15: `from typing import Dict, List, Tuple, Any`
- Line 16: `from dataclasses import dataclass`
- Line 21: `from session.session_manager import DQ3SessionManager, GitHubIssue`
- Line 22: `from disassembly.snes_disasm import SNES65816Disassembler`
- Line 23: `from analysis.dq3_analyzer import DQ3Analyzer`
- Line 24: `from extraction.asset_extractor import DQ3AssetExtractor`
- Line 25: `from visualization.progress_tracker import DQ3ProgressTracker`
- Line 458: `import subprocess`

