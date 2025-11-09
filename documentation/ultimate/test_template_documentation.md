# test_template.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 1,166 bytes
**Last Modified**: 2025-11-09 01:03:35
**Git Status**: ✅ Tracked and clean

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 1,166 bytes
- **Line Count**: 49
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
  "test_suite": "DQ3R SNES Tests",
  "version": "1.0",
  "tests": [
    {
      "name": "boot_sequence",
      "description": "Test ROM boot sequence",
      "commands": [
        "reset",
        "run_frames 300",
        "screenshot boot_sequence.png"
      ],
      "expected_outcomes": [
        "ROM boots without errors",
        "Title screen appears"
      ]
    },
    {
      "name": "character_creation",
      "description": "Test character creation system",
      "commands": [
        "reset",
        "run_frames 300",
        "input START",
        "run_frames 60",
        "input A",
        "run_frames 180"
      ],
      "expected_outcomes": [
        "Character creation screen accessible",
        "All character classes available"
      ]
    },
    {
      "name": "save_load",
      "description": "Test save/load functionality",
      "commands": [
        "reset",
        "load_save_state test.sfc",
        "run_frames 60",
        "save_state test_result.sfc"
      ],
      "expected_outcomes": [
        "Save state loads correctly",
        "Game state preserved"
      ]
    }
  ]
}
```

**Lines shown**: 49 of 49 total

