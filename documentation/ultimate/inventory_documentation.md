# inventory.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 619 bytes
**Last Modified**: 2025-11-09 01:22:12
**Git Status**: ✅ Tracked and clean

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 619 bytes
- **Line Count**: 32
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 4
- **Documentation Coverage**: 21.1%
- **Estimated Complexity**: 0/10

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 21.1%
- **Function Count**: 0
- **Comment Lines**: 4

## Source Code Preview

```text
# Inventory Data Structure

Inventory and item management data

**Base Address:** `$3725`  
**Total Size:** 512 bytes  
**Type:** Item  
**Coverage:** 100.0% documented

## Field Definitions

### `Bag_Items`

**Offset:** `+00` (`$3725`)
**Size:** 256 bytes
**Type:** `item_id`

Each byte is which item is in bag slot, 0 means empty, game uses values $01-$e4

**Notes:** Raw offset: $3725


### `Items_Amounts`

**Offset:** `+100` (`$3825`)
**Size:** 256 bytes
**Type:** `uint16`

Each byte is amount of the item in the bag slot, game allows up to 99 ($63)

**Notes:** Raw offset: $3825


```

**Lines shown**: 32 of 32 total

