# dq3_structures_documentation.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 2,217 bytes
**Last Modified**: 2025-11-09 04:27:08
**Git Status**: 🔄 ?? documentation/ultimate/dq3_structures_documentation.md

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 2,217 bytes
- **Line Count**: 84
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 5
- **Documentation Coverage**: 6.6%
- **Estimated Complexity**: 2/10

## Code Metrics
- **Complexity Score**: 2/10
- **Documentation Coverage**: 6.6%
- **Function Count**: 0
- **Comment Lines**: 5

## Source Code Preview

```text
# dq3_structures.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 48,818 bytes
**Last Modified**: 2025-11-09 02:54:08
**Git Status**: 🔄 M documentation/dq3_structures/dq3_structures.json

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 48,818 bytes
- **Line Count**: 1985
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 166
- **Documentation Coverage**: 8.4%
- **Estimated Complexity**: 10/10

## Code Metrics
- **Complexity Score**: 12/10
- **Documentation Coverage**: 8.4%
- **Function Count**: 0
- **Comment Lines**: 166

## Source Code Preview

```json
{
	"Inventory": {
		"name": "Inventory",
		"base_address": "$3725",
		"total_size": 512,
		"structure_type": "item",
		"description": "Inventory and item management data",
		"field_coverage": 100.0,
		"completion_status": "partial",
		"fields": [
			{
				"name": "Bag_Items",
				"offset": 0,
				"absolute_address": "$3725",
				"size": 256,
				"data_type": "item_id",
				"description": "Each byte is which item is in bag slot, 0 means empty, game uses values $01-$e4",
				"valid_range": null,
				"notes": "Raw offset: $3725"
			},
			{
...
```

**Lines shown**: 50 of 84 total

