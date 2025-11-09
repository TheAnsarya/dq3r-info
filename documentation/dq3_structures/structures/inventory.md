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

