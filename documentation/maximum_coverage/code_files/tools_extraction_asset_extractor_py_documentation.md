# Code Documentation: tools\extraction\asset_extractor.py

**File Type:** .py
**File Size:** 28,440 bytes
**Lines of Code:** 699
**Generated:** 2025-11-09 10:29:38.294634

## File Analysis Summary

- **Cyclomatic Complexity:** 168
- **Maintainability Index:** 85.0
- **Comment Ratio:** 5.7%

## Functions

### __post_init__
- **Line:** 59
- **Arguments:** `self`
- **Complexity:** 2

### save_to_file
- **Line:** 63
- **Arguments:** `self, output_path: Path, format_override: Optional[str] = None`
- **Complexity:** 5
- **Description:** Save asset to file with appropriate format

### __init__
- **Line:** 104
- **Arguments:** `self, rom_path: str`
- **Complexity:** 3

### _initialize_extraction_patterns
- **Line:** 124
- **Arguments:** `self`
- **Complexity:** 5
- **Description:** Initialize patterns for asset detection

### _generate_extraction_report
- **Line:** 571
- **Arguments:** `self, output_path: Path, results: Dict[str, Any]`
- **Complexity:** 10
- **Description:** Generate comprehensive extraction report

### main
- **Line:** 664
- **Arguments:** ``
- **Complexity:** 7
- **Description:** Main entry point for asset extraction

## Classes

### AssetFormat
- **Line:** 17
- **Base Classes:** `Enum`
- **Description:** Supported asset formats for extraction
### ExtractedAsset
- **Line:** 45
- **Description:** Represents an extracted game asset
#### Methods
- **__post_init__** (line 59) [private]
- **save_to_file** (line 63)

### DQ3AssetExtractor
- **Line:** 101
- **Description:** Comprehensive asset extraction for Dragon Quest III
#### Methods
- **__init__** (line 104) [private]
- **_initialize_extraction_patterns** (line 124) [private]
- **_generate_extraction_report** (line 571) [private]
- **main** (line 664)

## Imports

- Line 7: `import struct`
- Line 8: `import sys`
- Line 9: `import json`
- Line 10: `from pathlib import Path`
- Line 11: `from typing import Dict, List, Any, Optional, Tuple, Set`
- Line 12: `from dataclasses import dataclass, asdict, field`
- Line 13: `from enum import Enum`
- Line 14: `import hashlib`
- Line 666: `import argparse`

