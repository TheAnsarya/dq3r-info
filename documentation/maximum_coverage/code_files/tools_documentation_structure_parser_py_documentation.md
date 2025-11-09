# Code Documentation: tools\documentation\structure_parser.py

**File Type:** .py
**File Size:** 22,465 bytes
**Lines of Code:** 628
**Generated:** 2025-11-09 10:29:38.290774

## File Analysis Summary

- **Cyclomatic Complexity:** 124
- **Maintainability Index:** 87.0
- **Comment Ratio:** 6.1%

## Functions

### add_field
- **Line:** 70
- **Arguments:** `self, field: MemoryField`
- **Complexity:** 2
- **Description:** Add field and maintain sorted order

### __init__
- **Line:** 104
- **Arguments:** `self`
- **Complexity:** 2

### _analyze_structures
- **Line:** 162
- **Arguments:** `self`
- **Complexity:** 3
- **Description:** Analyze raw entries to identify data structures

### generate_documentation
- **Line:** 299
- **Arguments:** `self, output_dir: str`
- **Complexity:** 1
- **Description:** Generate comprehensive documentation files

### _generate_master_doc
- **Line:** 323
- **Arguments:** `self, output_path: Path`
- **Complexity:** 7
- **Description:** Generate master documentation file

### _generate_structure_docs
- **Line:** 392
- **Arguments:** `self, output_path: Path`
- **Complexity:** 6
- **Description:** Generate individual structure documentation files

### _generate_json_export
- **Line:** 440
- **Arguments:** `self, output_path: Path`
- **Complexity:** 4
- **Description:** Generate JSON export for programmatic access

### _generate_c_headers
- **Line:** 473
- **Arguments:** `self, output_path: Path`
- **Complexity:** 9
- **Description:** Generate C header files for structure definitions

### _generate_analysis_report
- **Line:** 529
- **Arguments:** `self, output_path: Path`
- **Complexity:** 10
- **Description:** Generate analysis and statistics report

### main
- **Line:** 591
- **Arguments:** ``
- **Complexity:** 6
- **Description:** Main entry point for data structure documentation

## Classes

### DataStructureType
- **Line:** 16
- **Base Classes:** `Enum`
- **Description:** Types of game data structures
### MemoryField
- **Line:** 32
- **Description:** Individual field within a data structure
### DataStructure
- **Line:** 56
- **Description:** Complete game data structure definition
#### Methods
- **add_field** (line 70)

### DQ3StructureParser
- **Line:** 101
- **Description:** Parser for Dragon Quest III data structures from .mlb files
#### Methods
- **__init__** (line 104) [private]
- **_analyze_structures** (line 162) [private]
- **generate_documentation** (line 299)
- **_generate_master_doc** (line 323) [private]
- **_generate_structure_docs** (line 392) [private]
- **_generate_json_export** (line 440) [private]
- **_generate_c_headers** (line 473) [private]
- **_generate_analysis_report** (line 529) [private]
- **main** (line 591)

## Imports

- Line 7: `import re`
- Line 8: `import json`
- Line 9: `import sys`
- Line 10: `from pathlib import Path`
- Line 11: `from typing import Dict, List, Any, Optional, Tuple`
- Line 12: `from dataclasses import dataclass, asdict, field`
- Line 13: `from enum import Enum`
- Line 593: `import argparse`

