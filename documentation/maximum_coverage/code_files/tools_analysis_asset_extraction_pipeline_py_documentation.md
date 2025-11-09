# Code Documentation: tools\analysis\asset_extraction_pipeline.py

**File Type:** .py
**File Size:** 27,511 bytes
**Lines of Code:** 788
**Generated:** 2025-11-09 10:29:38.231043

## File Analysis Summary

- **Cyclomatic Complexity:** 161
- **Maintainability Index:** 87.0
- **Comment Ratio:** 8.1%

## Functions

### __init__
- **Line:** 41
- **Arguments:** `self, rom_path: str, output_dir: str = "extracted_assets"`
- **Complexity:** 1

### main
- **Line:** 757
- **Arguments:** ``
- **Complexity:** 7
- **Description:** Main entry point for asset extraction

## Classes

### ExtractedAsset
- **Line:** 22
- **Description:** Represents an extracted asset from the ROM
### AssetExtractionPipeline
- **Line:** 35
- **Description:** Comprehensive asset extraction pipeline for Dragon Quest III ROM.
Extracts all assets with format specifications for reconstruction.
#### Methods
- **__init__** (line 41) [private]
- **main** (line 757)

## Imports

- Line 10: `import struct`
- Line 11: `import os`
- Line 12: `import json`
- Line 13: `import time`
- Line 14: `import hashlib`
- Line 15: `from pathlib import Path`
- Line 16: `from typing import Dict, List, Tuple, Any, Optional, Set`
- Line 17: `from dataclasses import dataclass, field`
- Line 18: `from collections import defaultdict, Counter`
- Line 19: `import math`

