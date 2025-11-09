# audio_data.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 108,420 bytes
**Last Modified**: 2025-11-09 04:23:21
**Git Status**: 🔄 M analysis/audio_system/audio_data.json

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 108,420 bytes
- **Line Count**: 6886
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
  "audio_functions": [
    {
      "name": "audio_func_d8aa",
      "address": 55466,
      "purpose": "Audio driver interface",
      "audio_type": "driver",
      "complexity": 28,
      "spc_commands": [
        "CALL_ $408d",
        "CALL_ $cca9"
      ]
    },
    {
      "name": "audio_func_d8e1",
      "address": 55521,
      "purpose": "APU communication",
      "audio_type": "communication",
      "complexity": 56,
      "spc_commands": [
        "APU_PORT_2",
        "APU_PORT_1",
        "CALL_ $50b7",
        "APU_PORT_0",
        "CALL_ $01e0"
      ]
    },
    {
      "name": "audio_func_f57a",
      "address": 62842,
      "purpose": "General audio operation",
      "audio_type": "general",
      "complexity": 6,
      "spc_commands": []
    },
    {
      "name": "audio_func_c7fb",
      "address": 51195,
      "purpose": "APU communication",
      "audio_type": "communication",
      "complexity": 11,
      "spc_commands": [
        "APU_PORT_0"
      ]
    }
  ],
  "music_tracks": [
    {
      "id": 4,
      "name": "Track_04",
...
```

**Lines shown**: 50 of 6886 total

