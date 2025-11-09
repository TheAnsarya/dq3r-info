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

Party member #9 - Current HP

**Notes:** Raw offset: $3b0b


### `9_MP_Max`

**Offset:** `+08` (`$3b0d`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #9 - Max MP

**Notes:** Raw offset: $3b0d


### `9_MP`

**Offset:** `+0A` (`$3b0f`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #9 - Current HP

**Notes:** Raw offset: $3b0f


### `9_Strength`

**Offset:** `+0C` (`$3b11`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Strength stat

**Notes:** Raw offset: $3b11


### `9_Agility`

**Offset:** `+0D` (`$3b12`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Agility stat

**Notes:** Raw offset: $3b12


### `9_Stamina`

**Offset:** `+0E` (`$3b13`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Stamina stat

**Notes:** Raw offset: $3b13


### `9_Wisdom`

**Offset:** `+0F` (`$3b14`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Wisdom stat

**Notes:** Raw offset: $3b14


### `9_Luck`

**Offset:** `+10` (`$3b15`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Luck stat, excluding equipment

**Notes:** Raw offset: $3b15


### `9_Name`

**Offset:** `+16` (`$3b1b`)
**Size:** 5 bytes
**Type:** `string`

Party member #9 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3b1b


### `9_Bag_Number_Equiped`

**Offset:** `+2E` (`$3b33`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Number of items equipped

**Notes:** Raw offset: $3b33


### `9_Bag_Number_Carried`

**Offset:** `+2F` (`$3b34`)
**Size:** 1 byte
**Type:** `uint8`

Party member #9 - Number of items in bag

**Notes:** Raw offset: $3b34


### `9_Bag_Items`

**Offset:** `+30` (`$3b35`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #9 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3b35

