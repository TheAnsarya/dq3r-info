# graphics_converter.py
**Project**: Dragon Quest III ROM Analysis
**Type**: Python Source Code
**Size**: 18,333 bytes
**Last Modified**: 2025-11-09 02:52:42
**Git Status**: 🔄 M tools/analysis/graphics_converter.py

## Overview
This file handles graphics processing and conversion for SNES tile data.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 18,333 bytes
- **Line Count**: 511
- **Character Encoding**: UTF-8 (auto-detected)
- **Dependencies**: struct, json, os, pathlib, time, typing
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 0
- **Comment Lines**: 0

## Source Code Preview

```python
#!/usr/bin/env python3
"""
Dragon Quest III - Graphics Converter
=====================================

Converts extracted graphics assets (tiles, palettes) to PNG images
using the SNES graphics formats and proper palette mapping.
"""

import struct
import os
import json
from pathlib import Path
from typing import Dict, List, Tuple, Any, Optional
import time

try:
    from PIL import Image
    PIL_AVAILABLE = True
except ImportError:
    PIL_AVAILABLE = False
    print("WARNING: PIL (Pillow) not available. Installing...")

class SNESGraphicsConverter:
    """
    Converts SNES graphics data to modern image formats
    """

    def __init__(self, assets_dir: str = "extracted_assets", output_dir: str = "converted_graphics"):
        self.assets_dir = Path(assets_dir)
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)

        # Graphics directories
        self.graphics_dir = self.assets_dir / "graphics"
        self.palette_output = self.output_dir / "palettes"
        self.tiles_output = self.output_dir / "tiles"
        self.sprites_output = self.output_dir / "sprites"

        # Create output subdirectories
        self.palette_output.mkdir(exist_ok=True)
        self.tiles_output.mkdir(exist_ok=True)
        self.sprites_output.mkdir(exist_ok=True)

        # Load metadata
        metadata_file = self.assets_dir / "extraction_metadata.json"
        if metadata_file.exists():
            with open(metadata_file, 'r') as f:
                self.metadata = json.load(f)
        else:
...
```

**Lines shown**: 50 of 511 total

