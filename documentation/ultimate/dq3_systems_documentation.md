# dq3_systems.json
**Project**: Dragon Quest III ROM Analysis
**Type**: JSON Configuration
**Size**: 3,637 bytes
**Last Modified**: 2025-11-09 01:16:57
**Git Status**: ✅ Tracked and clean

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 3,637 bytes
- **Line Count**: 142
- **Character Encoding**: UTF-8 (auto-detected)
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 2/10

## Code Metrics
- **Complexity Score**: 2/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 0
- **Comment Lines**: 0

## Source Code Preview

```json
{
	"SystemCore": {
		"name": "SystemCore",
		"description": "Core system initialization, interrupt handlers, and main loop",
		"start_address": 32768,
		"end_address": 65535,
		"banks": [
			0
		],
		"functions": [],
		"data_structures": [],
		"variables": {},
		"documentation": "Handles system startup, IRQ/NMI processing, and main game loop",
		"completion_percentage": 0.0
	},
	"BattleEngine": {
		"name": "BattleEngine",
		"description": "Combat system, AI, damage calculations, and battle UI",
		"start_address": 32768,
		"end_address": 65535,
		"banks": [
			1,
			2,
			3
		],
		"functions": [],
		"data_structures": [],
		"variables": {},
		"documentation": "Complete battle system implementation including turn order, spells, and AI",
		"completion_percentage": 0.0
	},
	"WorldEngine": {
		"name": "WorldEngine",
		"description": "Overworld navigation, collision detection, and map management",
		"start_address": 32768,
		"end_address": 65535,
		"banks": [
			4,
			5
		],
		"functions": [],
		"data_structures": [],
		"variables": {},
		"documentation": "Handles world map movement, transitions, and collision systems",
		"completion_percentage": 0.0
	},
	"MenuSystem": {
		"name": "MenuSystem",
		"description": "UI management, inventory, character status, and save/load",
		"start_address": 32768,
...
```

**Lines shown**: 50 of 142 total

