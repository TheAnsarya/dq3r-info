# hero.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 2,467 bytes
**Last Modified**: 2025-11-09 02:54:08
**Git Status**: 🔄 M documentation/dq3_structures/structures/hero.md

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 2,467 bytes
- **Line Count**: 186
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 18
- **Documentation Coverage**: 17.5%
- **Estimated Complexity**: 1/10

## Code Metrics
- **Complexity Score**: 1/10
- **Documentation Coverage**: 17.5%
- **Function Count**: 0
- **Comment Lines**: 18

## Source Code Preview

```text
# Hero Data Structure

Character data structure for Hero

**Base Address:** `$3925`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 76.7% documented

## Field Definitions

### `Hero_Level`

**Offset:** `+00` (`$3925`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Level\nTop 7 bits are Hero's level, bottom bit unknown

**Notes:** Raw offset: $3925


### `Hero_XP`

**Offset:** `+01` (`$3926`)
**Size:** 3 bytes
**Type:** `uint24`

Hero - XP

**Notes:** Raw offset: $3926


### `HP_Max`

**Offset:** `+04` (`$3929`)
**Size:** 2 bytes
**Type:** `uint16`

Hero - Max HP

**Notes:** Raw offset: $3929


### `Hero_HP`

**Offset:** `+06` (`$392b`)
**Size:** 2 bytes
**Type:** `uint16`

...
```

**Lines shown**: 50 of 186 total

