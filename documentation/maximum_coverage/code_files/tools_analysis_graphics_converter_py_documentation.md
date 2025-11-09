# Code Documentation: tools\analysis\graphics_converter.py

**File Type:** .py
**File Size:** 18,333 bytes
**Lines of Code:** 511
**Generated:** 2025-11-09 10:29:38.259739

## File Analysis Summary

- **Cyclomatic Complexity:** 132
- **Maintainability Index:** 83.0
- **Comment Ratio:** 9.0%

## Functions

### __init__
- **Line:** 29
- **Arguments:** `self, assets_dir: str = "extracted_assets", output_dir: str = "converted_graphics"`
- **Complexity:** 2

### install_pillow
- **Line:** 57
- **Arguments:** `self`
- **Complexity:** 5
- **Description:** Install Pillow if not available

### convert_palettes
- **Line:** 195
- **Arguments:** `self`
- **Complexity:** 8
- **Description:** Convert palette files to PNG format

### convert_tiles
- **Line:** 232
- **Arguments:** `self`
- **Complexity:** 20
- **Description:** Convert tile files to PNG format using available palettes

### create_tileset_images
- **Line:** 313
- **Arguments:** `self`
- **Complexity:** 14
- **Description:** Create larger tileset images by combining multiple tiles

### analyze_graphics_usage
- **Line:** 391
- **Arguments:** `self`
- **Complexity:** 8
- **Description:** Analyze graphics patterns and create usage report

### run_full_conversion
- **Line:** 461
- **Arguments:** `self`
- **Complexity:** 6
- **Description:** Run complete graphics conversion pipeline

### main
- **Line:** 491
- **Arguments:** ``
- **Complexity:** 5
- **Description:** Main entry point for graphics conversion

## Classes

### SNESGraphicsConverter
- **Line:** 24
- **Description:** Converts SNES graphics data to modern image formats
#### Methods
- **__init__** (line 29) [private]
- **install_pillow** (line 57)
- **convert_palettes** (line 195)
- **convert_tiles** (line 232)
- **create_tileset_images** (line 313)
- **analyze_graphics_usage** (line 391)
- **run_full_conversion** (line 461)
- **main** (line 491)

## Imports

- Line 10: `import struct`
- Line 11: `import os`
- Line 12: `import json`
- Line 13: `from pathlib import Path`
- Line 14: `from typing import Dict, List, Tuple, Any, Optional`
- Line 15: `import time`
- Line 18: `from PIL import Image`
- Line 60: `import subprocess`
- Line 61: `import sys`

