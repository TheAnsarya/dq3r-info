# dq3_memory_map.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 11,793 bytes
**Last Modified**: 2025-11-09 04:24:11
**Git Status**: 🔄 M analysis/dq3_basic/dq3_memory_map.json

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 11,793 bytes
- **Line Count**: 634
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
	"regions": [
		{
			"address": 0,
			"size": 8192,
			"name": "DirectPage",
			"description": "Direct page and stack space",
			"access_type": "rw",
			"data_type": "data",
			"bank": 0
		},
		{
			"address": 0,
			"size": 65536,
			"name": "Bank$00",
			"description": "System/Boot code",
			"access_type": "rx",
			"data_type": "code",
			"bank": 0
		},
		{
			"address": 8192,
			"size": 24576,
			"name": "SystemRAM",
			"description": "System work RAM",
			"access_type": "rw",
			"data_type": "data",
			"bank": 0
		},
		{
			"address": 8448,
			"size": 256,
			"name": "PPU",
			"description": "Picture Processing Unit registers",
			"access_type": "rw",
			"data_type": "data",
			"bank": 0
		},
		{
			"address": 16384,
			"size": 1024,
			"name": "Controllers",
			"description": "Controller and system registers",
			"access_type": "rw",
			"data_type": "data",
			"bank": 0
		},
		{
			"address": 24576,
			"size": 32768,
...
```

**Lines shown**: 50 of 634 total

