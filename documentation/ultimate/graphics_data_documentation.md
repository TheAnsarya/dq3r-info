# graphics_data.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 3,821 bytes
**Last Modified**: 2025-11-09 04:24:11
**Git Status**: 🔄 M analysis/graphics_engine/graphics_data.json

## Overview
This file handles graphics processing and conversion for SNES tile data.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 3,821 bytes
- **Line Count**: 193
- **Character Encoding**: UTF-8 (auto-detected)
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 0
- **Comment Lines**: 0

## Source Code Preview

```json
{
  "functions": [
    {
      "name": "gfx_func_84be",
      "address": 33982,
      "purpose": "Display control",
      "ppu_registers": [
        "INIDISP"
      ],
      "complexity": 23
    },
    {
      "name": "gfx_func_86b7",
      "address": 34487,
      "purpose": "General graphics operation",
      "ppu_registers": [],
      "complexity": 10
    },
    {
      "name": "gfx_func_88f0",
      "address": 35056,
      "purpose": "VRAM data transfer",
      "ppu_registers": [
        "VMADD"
      ],
      "complexity": 62
    },
    {
      "name": "gfx_func_8c98",
      "address": 35992,
      "purpose": "General graphics operation",
      "ppu_registers": [],
      "complexity": 4
    },
    {
      "name": "gfx_func_a4ab",
      "address": 42155,
      "purpose": "General graphics operation",
      "ppu_registers": [],
      "complexity": 1
    },
    {
      "name": "gfx_func_84ad",
      "address": 33965,
      "purpose": "General graphics operation",
      "ppu_registers": [
        "M7SEL",
        "M7A"
      ],
      "complexity": 80
...
```

**Lines shown**: 50 of 193 total

