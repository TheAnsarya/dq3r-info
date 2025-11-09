# PartyMember_7 Data Structure

Character data structure for PartyMember_7

**Base Address:** `$3a8d`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `7_Level`

**Offset:** `+00` (`$3a8d`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3a8d


### `7_XP`

**Offset:** `+01` (`$3a8e`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #7 - XP

**Notes:** Raw offset: $3a8e


### `7_HP_Max`

**Offset:** `+04` (`$3a91`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Max HP

**Notes:** Raw offset: $3a91


### `7_HP`

**Offset:** `+06` (`$3a93`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Current HP

**Notes:** Raw offset: $3a93


### `7_MP_Max`

**Offset:** `+08` (`$3a95`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Max MP

**Notes:** Raw offset: $3a95


### `7_MP`

**Offset:** `+0A` (`$3a97`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #7 - Current HP

**Notes:** Raw offset: $3a97


### `7_Strength`

**Offset:** `+0C` (`$3a99`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Strength stat

**Notes:** Raw offset: $3a99


### `7_Agility`

**Offset:** `+0D` (`$3a9a`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Agility stat

**Notes:** Raw offset: $3a9a


### `7_Stamina`

**Offset:** `+0E` (`$3a9b`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Stamina stat

**Notes:** Raw offset: $3a9b


### `7_Wisdom`

**Offset:** `+0F` (`$3a9c`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Wisdom stat

**Notes:** Raw offset: $3a9c


### `7_Luck`

**Offset:** `+10` (`$3a9d`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Luck stat, excluding equipment

**Notes:** Raw offset: $3a9d


### `7_Name`

**Offset:** `+16` (`$3aa3`)
**Size:** 5 bytes
**Type:** `string`

Party member #7 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3aa3


### `7_Bag_Number_Equiped`

**Offset:** `+2E` (`$3abb`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Number of items equipped

**Notes:** Raw offset: $3abb


### `7_Bag_Number_Carried`

**Offset:** `+2F` (`$3abc`)
**Size:** 1 byte
**Type:** `uint8`

Party member #7 - Number of items in bag

**Notes:** Raw offset: $3abc


### `7_Bag_Items`

**Offset:** `+30` (`$3abd`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #7 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3abd

