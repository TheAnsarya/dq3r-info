# Code Documentation: tools\analysis\advanced_disassembler.py

**File Type:** .py
**File Size:** 34,255 bytes
**Lines of Code:** 799
**Generated:** 2025-11-09 10:29:38.226397

## File Analysis Summary

- **Cyclomatic Complexity:** 189
- **Maintainability Index:** 86.0
- **Comment Ratio:** 8.1%

## Functions

### __init__
- **Line:** 39
- **Arguments:** `self, rom_path: str, coverage_data_path: Optional[str] = None`
- **Complexity:** 2

### generate_assembly_output
- **Line:** 630
- **Arguments:** `self, output_dir: str = "src"`
- **Complexity:** 3
- **Description:** Generate complete assembly source files from disassembled code

### _generate_main_assembly
- **Line:** 657
- **Arguments:** `self, filepath: Path`
- **Complexity:** 4
- **Description:** Generate main assembly file with includes and setup

### _generate_bank_assembly
- **Line:** 681
- **Arguments:** `self, filepath: Path, bank_num: int, regions: List[CodeRegion]`
- **Complexity:** 8
- **Description:** Generate assembly for a specific bank

### _generate_includes
- **Line:** 715
- **Arguments:** `self, output_dir: Path`
- **Complexity:** 3
- **Description:** Generate include files for constants and labels

### main
- **Line:** 760
- **Arguments:** ``
- **Complexity:** 7
- **Description:** Main entry point for code disassembly

## Classes

### CodeRegion
- **Line:** 20
- **Description:** Represents a region of code in the ROM
### SNESDisassembler
- **Line:** 34
- **Description:** Comprehensive SNES 65816 disassembler for Dragon Quest III
#### Methods
- **__init__** (line 39) [private]
- **generate_assembly_output** (line 630)
- **_generate_main_assembly** (line 657) [private]
- **_generate_bank_assembly** (line 681) [private]
- **_generate_includes** (line 715) [private]
- **main** (line 760)

## Imports

- Line 10: `import struct`
- Line 11: `import os`
- Line 12: `import json`
- Line 13: `from pathlib import Path`
- Line 14: `from typing import Dict, List, Tuple, Any, Optional, Set`
- Line 15: `from dataclasses import dataclass`
- Line 16: `from collections import defaultdict`
- Line 17: `import time`

