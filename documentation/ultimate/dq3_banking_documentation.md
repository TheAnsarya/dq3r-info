# dq3_banking.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 47,245 bytes
**Last Modified**: 2025-11-09 04:24:11
**Git Status**: 🔄 M analysis/dq3_basic/dq3_banking.json

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

🔧 Medium complexity file with moderate control flow.

## Technical Details
- **File Size**: 47,245 bytes
- **Line Count**: 1536
- **Character Encoding**: UTF-8 (auto-detected)
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 10/10

## Code Metrics
- **Complexity Score**: 27/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 0
- **Comment Lines**: 0

## Source Code Preview

```json
{
	"rom_type": "HiROM",
	"total_banks": 64,
	"rom_size": 6291456,
	"banks": {
		"$00": {
			"rom_offset": "$000000",
			"snes_range": "$0000-$ffff",
			"size": 65536,
			"description": "System/Boot code",
			"content_analysis": {
				"code_density": 0.595947265625,
				"graphics_probability": 0.015625,
				"text_probability": 0.5880271306399292,
				"audio_probability": 1.0,
				"patterns": [
					"Function: sub_00_0803 (subroutine)",
					"Function: sub_00_0589 (subroutine)",
					"Function: sub_00_0514 (subroutine)",
					"Function: sub_00_06e1 (subroutine)",
					"Function: sub_00_06a1 (subroutine)",
					"Function: sub_00_0704 (subroutine)",
					"Function: sub_00_0e4c (interrupt)",
					"Function: sub_00_0c46 (subroutine)",
					"Function: sub_00_0d2e (subroutine)",
					"Function: sub_00_0c94 (subroutine)",
					"Function: sub_00_0ce0 (subroutine)",
					"Function: sub_00_0d7d (subroutine)",
					"Function: sub_00_0dcc (interrupt)",
					"Function: sub_00_0e0c (interrupt)",
					"Function: sub_00_0858 (subroutine)",
					"Function: sub_00_0704 (subroutine)",
					"Function: sub_00_0733 (subroutine)",
					"Function: sub_00_0b16 (subroutine)",
					"Function: sub_00_0766 (subroutine)",
					"Function: sub_00_0f2a (subroutine)"
				],
				"functions_detected": 20
			}
		},
		"$01": {
			"rom_offset": "$010000",
			"snes_range": "$0000-$ffff",
			"size": 65536,
			"description": "Program code",
			"content_analysis": {
				"code_density": 0.30517578125,
				"graphics_probability": 0.0390625,
				"text_probability": 0.3700314555333143,
				"audio_probability": 1.0,
...
```

**Lines shown**: 50 of 1536 total

