# Code Documentation: tools\disassembly\snes_disasm.py

**File Type:** .py
**File Size:** 33,310 bytes
**Lines of Code:** 851
**Generated:** 2025-11-09 10:29:38.286176

## File Analysis Summary

- **Cyclomatic Complexity:** 196
- **Maintainability Index:** 86.0
- **Comment Ratio:** 9.2%

## Functions

### add_instruction
- **Line:** 137
- **Arguments:** `self, instruction: Instruction`
- **Complexity:** 6
- **Description:** Add instruction to function

### __init__
- **Line:** 156
- **Arguments:** `self, rom_data: bytes`
- **Complexity:** 1

### _build_instruction_table
- **Line:** 176
- **Arguments:** `self`
- **Complexity:** 3
- **Description:** Build 65816 instruction decode table

## Classes

### AddressingMode
- **Line:** 16
- **Base Classes:** `Enum`
- **Description:** 65816 Addressing modes
### Instruction
- **Line:** 46
- **Description:** Represents a 65816 instruction
### Function
- **Line:** 119
- **Description:** Represents a discovered function
#### Methods
- **add_instruction** (line 137)

### SNES65816Disassembler
- **Line:** 153
- **Description:** Advanced 65816 disassembler with banking support
#### Methods
- **__init__** (line 156) [private]
- **_build_instruction_table** (line 176) [private]

## Imports

- Line 7: `import struct`
- Line 8: `import sys`
- Line 9: `from pathlib import Path`
- Line 10: `from typing import Dict, List, Any, Optional, Tuple, Set`
- Line 11: `from dataclasses import dataclass, field`
- Line 12: `from enum import Enum`
- Line 13: `import json`
- Line 782: `import argparse`

