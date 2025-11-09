# dq3_vectors.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 2,087 bytes
**Last Modified**: 2025-11-09 04:24:11
**Git Status**: 🔄 M analysis/dq3_basic/dq3_vectors.json

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 2,087 bytes
- **Line Count**: 90
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
	"native_mode": {
		"COP": {
			"vector_address": "$ffe4",
			"handler_address": "$ffac",
			"handler_function": "sub_00_ffac",
			"handler_type": "subroutine",
			"handler_size": 1
		},
		"BRK": {
			"vector_address": "$ffe6",
			"handler_address": "$ffa8",
			"handler_function": "sub_00_ffa8",
			"handler_type": "subroutine",
			"handler_size": 1
		},
		"ABORT": {
			"vector_address": "$ffe8",
			"handler_address": "$ffa4",
			"handler_function": "sub_00_ffa4",
			"handler_type": "subroutine",
			"handler_size": 1
		},
		"NMI": {
			"vector_address": "$ffea",
			"handler_address": "$ffa0",
			"handler_function": "sub_00_ffa0",
			"handler_type": "subroutine",
			"handler_size": 1
		},
		"UNUSED": {
			"vector_address": "$ffec",
			"handler_address": "$ffa4",
			"handler_function": "sub_00_ffa4",
			"handler_type": "subroutine",
			"handler_size": 1
		},
		"IRQ": {
			"vector_address": "$ffee",
			"handler_address": "$ffa4",
			"handler_function": "sub_00_ffa4",
			"handler_type": "subroutine",
			"handler_size": 1
		}
	},
	"emulation_mode": {
		"COP": {
			"vector_address": "$fff4",
			"handler_address": "$ffa4",
			"handler_function": "sub_00_ffa4",
...
```

**Lines shown**: 50 of 90 total

