# Code Documentation: tools\analysis\ultimate_disassembler.py

**File Type:** .py
**File Size:** 36,181 bytes
**Lines of Code:** 837
**Generated:** 2025-11-09 10:29:38.273912

## File Analysis Summary

- **Cyclomatic Complexity:** 169
- **Maintainability Index:** 88.0
- **Comment Ratio:** 6.1%

## Functions

### __init__
- **Line:** 45
- **Arguments:** `self, rom_path: str`
- **Complexity:** 1

### generate_ultimate_assembly
- **Line:** 373
- **Arguments:** `self, max_instructions: int = 20000`
- **Complexity:** 11
- **Description:** Generate ultimate annotated assembly source

### _write_assembly_header
- **Line:** 447
- **Arguments:** `self, f`
- **Complexity:** 3
- **Description:** Write comprehensive assembly file header

### _write_annotated_instruction
- **Line:** 713
- **Arguments:** `self, f, instruction: AnnotatedInstruction`
- **Complexity:** 7
- **Description:** Write fully annotated instruction to file

### _generate_symbol_table
- **Line:** 742
- **Arguments:** `self, asm_dir: Path`
- **Complexity:** 3
- **Description:** Generate symbol table file

### _generate_cross_ref_docs
- **Line:** 780
- **Arguments:** `self, asm_dir: Path`
- **Complexity:** 5
- **Description:** Generate cross-reference documentation

### main
- **Line:** 810
- **Arguments:** ``
- **Complexity:** 5
- **Description:** Main entry point

## Classes

### AnnotatedInstruction
- **Line:** 23
- **Description:** Instruction with complete analysis annotations
### UltimateDisassembler
- **Line:** 40
- **Description:** Creates the ultimate annotated assembly source
#### Methods
- **__init__** (line 45) [private]
- **generate_ultimate_assembly** (line 373)
- **_write_assembly_header** (line 447) [private]
- **_write_annotated_instruction** (line 713) [private]
- **_generate_symbol_table** (line 742) [private]
- **_generate_cross_ref_docs** (line 780) [private]
- **main** (line 810)

## Imports

- Line 11: `import struct`
- Line 12: `import os`
- Line 13: `import json`
- Line 14: `import csv`
- Line 15: `import time`
- Line 16: `from pathlib import Path`
- Line 17: `from typing import Dict, List, Tuple, Any, Optional, Set`
- Line 18: `from dataclasses import dataclass`
- Line 19: `from collections import defaultdict, Counter`
- Line 20: `import hashlib`
- Line 696: `import re`

