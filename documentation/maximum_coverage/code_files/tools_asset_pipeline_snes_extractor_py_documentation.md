# Code Documentation: tools\asset_pipeline\snes_extractor.py

**File Type:** .py
**File Size:** 22,390 bytes
**Lines of Code:** 683
**Generated:** 2025-11-09 10:29:38.275456

## File Analysis Summary

- **Cyclomatic Complexity:** 126
- **Maintainability Index:** 88.0
- **Comment Ratio:** 7.9%

## Functions

### decompress
- **Line:** 24
- **Arguments:** `self, data, algorithm`
- **Complexity:** 1

### compress
- **Line:** 27
- **Arguments:** `self, data, algorithm`
- **Complexity:** 1

### get_compression_engine
- **Line:** 30
- **Arguments:** ``
- **Complexity:** 1

### __post_init__
- **Line:** 45
- **Arguments:** `self`
- **Complexity:** 2

### __post_init__
- **Line:** 78
- **Arguments:** `self`
- **Complexity:** 2

### __init__
- **Line:** 87
- **Arguments:** `self, rom_path: Path`
- **Complexity:** 1

## Classes

### StubCompressionEngine
- **Line:** 23
#### Methods
- **decompress** (line 24)
- **compress** (line 27)
- **get_compression_engine** (line 30)

### AssetInfo
- **Line:** 35
- **Description:** Information about a ROM asset
#### Methods
- **__post_init__** (line 45) [private]

### GraphicsAsset
- **Line:** 51
- **Base Classes:** `AssetInfo`
- **Description:** Graphics asset with SNES-specific properties
### AudioAsset
- **Line:** 62
- **Base Classes:** `AssetInfo`
- **Description:** Audio asset with SPC700 properties
### DialogAsset
- **Line:** 71
- **Base Classes:** `AssetInfo`
- **Description:** Dialog text asset
#### Methods
- **__post_init__** (line 78) [private]

### SNESROMAnalyzer
- **Line:** 84
- **Description:** Analyzes SNES ROM structure and identifies assets
#### Methods
- **__init__** (line 87) [private]

## Imports

- Line 8: `import os`
- Line 9: `import sys`
- Line 10: `import struct`
- Line 11: `from pathlib import Path`
- Line 12: `from typing import List, Dict, Any, Optional, Tuple, Union`
- Line 13: `import json`
- Line 14: `from dataclasses import dataclass`
- Line 15: `import time`
- Line 20: `from compression.compression_engine import get_compression_engine, CompressionEngine`
- Line 652: `import argparse`

