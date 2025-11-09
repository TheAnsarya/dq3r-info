# PartyMember_9 Data Structure

Character data structure for PartyMember_9

**Base Address:** `$3B05`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `9_Level`

**Offset:** `+00` (`$3B05`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3B05


### `9_XP`

**Offset:** `+01` (`$3B06`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #9 - XP

**Notes:** Raw offset: $3B06


### `9_HP_Max`

**Offset:** `+04` (`$3B09`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #9 - Max HP

**Notes:** Raw offset: $3B09


### `9_HP`

**Offset:** `+06` (`$3B0B`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #9 - Current HP

**Notes:** Raw offset: $3B0B


### `9_MP_Max`

**Offset:** `+08` (`$3B0D`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #9 - Max MP

**Notes:** Raw offset: $3B0D


### `9_MP`

**Offset:** `+0A` (`$3B0F`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #9 - Current HP

**Notes:** Raw offset: $3B0F


### `9_Strength`

**Offset:** `+0C` (`$3B11`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Strength stat

**Notes:** Raw offset: $3B11


### `9_Agility`

**Offset:** `+0D` (`$3B12`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Agility stat

**Notes:** Raw offset: $3B12


### `9_Stamina`

**Offset:** `+0E` (`$3B13`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Stamina stat

**Notes:** Raw offset: $3B13


### `9_Wisdom`

**Offset:** `+0F` (`$3B14`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Wisdom stat

**Notes:** Raw offset: $3B14


### `9_Luck`

**Offset:** `+10` (`$3B15`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Luck stat, excluding equipment

**Notes:** Raw offset: $3B15


### `9_Name`

**Offset:** `+16` (`$3B1B`)
**Size:** 5 bytes
**Type:** `string`

Party member #9 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3B1B


### `9_Bag_Number_Equiped`

**Offset:** `+2E` (`$3B33`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Number of items equipped

**Notes:** Raw offset: $3B33


### `9_Bag_Number_Carried`

**Offset:** `+2F` (`$3B34`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Number of items in bag

**Notes:** Raw offset: $3B34


### `9_Bag_Items`

**Offset:** `+30` (`$3B35`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #9 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3B35

