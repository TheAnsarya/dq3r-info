# graphics_analysis.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 4,639 bytes
**Last Modified**: 2025-11-09 04:24:11
**Git Status**: 🔄 M analysis/graphics_engine/graphics_analysis.md

## Overview
This file handles graphics processing and conversion for SNES tile data.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 4,639 bytes
- **Line Count**: 175
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 20
- **Documentation Coverage**: 12.9%
- **Estimated Complexity**: 0/10

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 12.9%
- **Function Count**: 0
- **Comment Lines**: 20

## Source Code Preview

```text
# Dragon Quest III - Graphics Engine Analysis

## Analysis Summary
- **ROM:** Dragon Quest III - english (patched).smc
- **Graphics Functions:** 16
- **PPU Accesses:** 149
- **Sprite Data Structures:** 0
- **Palette Data:** 0

## Graphics Functions

### gfx_func_84be
- **Address:** $84be
- **Purpose:** Display control
- **Size:** 162 bytes
- **PPU Registers:** INIDISP
- **Complexity:** 23

### gfx_func_86b7
- **Address:** $86b7
- **Purpose:** General graphics operation
- **Size:** 530 bytes
- **PPU Registers:** 
- **Complexity:** 10

### gfx_func_88f0
- **Address:** $88f0
- **Purpose:** VRAM data transfer
- **Size:** 403 bytes
- **PPU Registers:** VMADD
- **Complexity:** 62

### gfx_func_8c98
- **Address:** $8c98
- **Purpose:** General graphics operation
- **Size:** 121 bytes
- **PPU Registers:** 
- **Complexity:** 4

### gfx_func_a4ab
- **Address:** $a4ab
- **Purpose:** General graphics operation
- **Size:** 560 bytes
- **PPU Registers:** 
- **Complexity:** 1

### gfx_func_84ad
- **Address:** $84ad
- **Purpose:** General graphics operation
- **Size:** 480 bytes
...
```

**Lines shown**: 50 of 175 total

