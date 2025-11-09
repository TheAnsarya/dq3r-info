# PartyMember_7 Data Structure

Character data structure for PartyMember_7

**Base Address:** `$3A8D`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `7_Level`

**Offset:** `+00` (`$3A8D`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3A8D


### `7_XP`

**Offset:** `+01` (`$3A8E`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #7 - XP

**Notes:** Raw offset: $3A8E


### `7_HP_Max`

**Offset:** `+04` (`$3A91`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Max HP

**Notes:** Raw offset: $3A91


### `7_HP`

**Offset:** `+06` (`$3A93`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Current HP

**Notes:** Raw offset: $3A93


### `7_MP_Max`

**Offset:** `+08` (`$3A95`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Max MP

**Notes:** Raw offset: $3A95


### `7_MP`

**Offset:** `+0A` (`$3A97`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Current HP

**Notes:** Raw offset: $3A97


### `7_Strength`

**Offset:** `+0C` (`$3A99`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Strength stat

**Notes:** Raw offset: $3A99


### `7_Agility`

**Offset:** `+0D` (`$3A9A`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Agility stat

**Notes:** Raw offset: $3A9A


### `7_Stamina`

**Offset:** `+0E` (`$3A9B`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Stamina stat

**Notes:** Raw offset: $3A9B


### `7_Wisdom`

**Offset:** `+0F` (`$3A9C`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Wisdom stat

**Notes:** Raw offset: $3A9C


### `7_Luck`

**Offset:** `+10` (`$3A9D`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Luck stat, excluding equipment

**Notes:** Raw offset: $3A9D


### `7_Name`

**Offset:** `+16` (`$3AA3`)
**Size:** 5 bytes
**Type:** `string`

Party member #7 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3AA3


### `7_Bag_Number_Equiped`

**Offset:** `+2E` (`$3ABB`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Number of items equipped

**Notes:** Raw offset: $3ABB


### `7_Bag_Number_Carried`

**Offset:** `+2F` (`$3ABC`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Number of items in bag

**Notes:** Raw offset: $3ABC


### `7_Bag_Items`

**Offset:** `+30` (`$3ABD`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #7 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3ABD

