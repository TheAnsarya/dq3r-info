# partymember_5.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 2,630 bytes
**Last Modified**: 2025-11-09 02:54:08
**Git Status**: 🔄 M documentation/dq3_structures/structures/partymember_5.md

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 2,630 bytes
- **Line Count**: 186
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 34
- **Documentation Coverage**: 33.0%
- **Estimated Complexity**: 1/10

## Code Metrics
- **Complexity Score**: 1/10
- **Documentation Coverage**: 33.0%
- **Function Count**: 0
- **Comment Lines**: 34

## Source Code Preview

```text
# PartyMember_5 Data Structure

Character data structure for PartyMember_5

**Base Address:** `$3a15`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 76.7% documented

## Field Definitions

### `5_Level`

**Offset:** `+00` (`$3a15`)
**Size:** 1 byte
**Type:** `uint8`

Party member #5 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3a15


### `5_XP`

**Offset:** `+01` (`$3a16`)
**Size:** 3 bytes
**Type:** `uint24`

Party Member #5 - XP

**Notes:** Raw offset: $3a16


### `5_HP_Max`

**Offset:** `+04` (`$3a19`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #5 - Max HP

**Notes:** Raw offset: $3a19


### `5_HP`

**Offset:** `+06` (`$3a1b`)
**Size:** 2 bytes
**Type:** `uint16`

...
```

**Lines shown**: 50 of 186 total

