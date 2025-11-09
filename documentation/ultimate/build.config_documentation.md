# build.config.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 509 bytes
**Last Modified**: 2025-11-09 01:03:24
**Git Status**: ✅ Tracked and clean

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 509 bytes
- **Line Count**: 25
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
  "project": {
    "name": "DQ3R",
    "description": "Dragon Quest III Remake - SNES Disassembly",
    "version": "1.0.0"
  },
  "paths": {
    "assets": "assets",
    "docs": "docs",
    "static": "static"
  },
  "tools": {
    "assembler": "asar",
    "python": {
      "venv": "venv",
      "version": "3.8"
    },
    "emulator": "mesen-s"
  },
  "build": {
    "tempDir": "build\\temp",
    "mainSource": "src\\asm\\main.asm",
    "outputRom": "build\\dq3r-rebuilt.sfc"
  }
}

```

**Lines shown**: 25 of 25 total

