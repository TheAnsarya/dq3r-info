# partymember_4.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 2,482 bytes
**Last Modified**: 2025-11-09 02:54:08
**Git Status**: 🔄 M documentation/dq3_structures/structures/partymember_4.md

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
# PartyMember_4 Data Structure

Character data structure for PartyMember_4

**Base Address:** `$39d9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `4_Level`

**Offset:** `+00` (`$39d9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #4 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $39d9


### `4_XP`

**Offset:** `+01` (`$39da`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #4 - XP

**Notes:** Raw offset: $39da


### `4_HP_Max`

**Offset:** `+04` (`$39dd`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #4 - Max HP

**Notes:** Raw offset: $39dd


### `4_HP`

**Offset:** `+06` (`$39df`)
**Size:** 2 bytes
**Type:** `uint16`

...
```

**Lines shown**: 50 of 175 total

