# extraction_summary.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 17,536 bytes
**Last Modified**: 2025-11-09 04:23:21
**Git Status**: 🔄 M assets/dq3_extracted/extraction_summary.json

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

🔧 Medium complexity file with moderate control flow.

## Technical Details
- **File Size**: 17,536 bytes
- **Line Count**: 424
- **Character Encoding**: UTF-8 (auto-detected)
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 10/10

## Code Metrics
- **Complexity Score**: 43/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 0
- **Comment Lines**: 0

## Source Code Preview

```json
{
	"extraction_stats": {
		"graphics": 15,
		"audio": 4,
		"text": 1,
		"data": 8,
		"total_bytes": 788480
	},
	"total_assets": 28,
	"assets": [
		{
			"name": "character_sprites",
			"asset_format": "snes_4bpp",
			"source_address": 2097152,
			"source_bank": 32,
			"raw_size": 65536,
			"processed_size": 65536,
			"metadata": {
				"tile_count": 2048,
				"estimated_tiles": "2048 tiles"
			},
			"checksum": "ebb74803f46886cb",
			"extraction_notes": "Extracted from known location at $200000"
		},
		{
			"name": "monster_graphics",
			"asset_format": "snes_4bpp",
			"source_address": 2228224,
			"source_bank": 34,
			"raw_size": 131072,
			"processed_size": 131072,
			"metadata": {
				"tile_count": 4096,
				"estimated_tiles": "4096 tiles"
			},
			"checksum": "fa88d51f26e401cc",
			"extraction_notes": "Extracted from known location at $220000"
		},
		{
			"name": "world_tiles",
			"asset_format": "snes_2bpp",
			"source_address": 1572864,
			"source_bank": 24,
			"raw_size": 32768,
			"processed_size": 32768,
			"metadata": {
				"tile_count": 2048,
				"estimated_tiles": "2048 tiles"
			},
			"checksum": "650331b22b2c58ac",
...
```

**Lines shown**: 50 of 424 total

