# partymember_9.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 2,482 bytes
**Last Modified**: 2025-11-09 02:54:08
**Git Status**: 🔄 M documentation/dq3_structures/structures/partymember_9.md

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 2,482 bytes
- **Line Count**: 175
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 32
- **Documentation Coverage**: 33.0%
- **Estimated Complexity**: 1/10

## Code Metrics
- **Complexity Score**: 1/10
- **Documentation Coverage**: 33.0%
- **Function Count**: 0
- **Comment Lines**: 32

## Source Code Preview

```text
# PartyMember_9 Data Structure

Character data structure for PartyMember_9

**Base Address:** `$3b05`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `9_Level`

**Offset:** `+00` (`$3b05`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3b05


### `9_XP`

**Offset:** `+01` (`$3b06`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #9 - XP

**Notes:** Raw offset: $3b06


### `9_HP_Max`

**Offset:** `+04` (`$3b09`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #9 - Max HP

**Notes:** Raw offset: $3b09


### `9_HP`

**Offset:** `+06` (`$3b0b`)
**Size:** 2 bytes
**Type:** `uint16`

...
```

**Lines shown**: 50 of 175 total

