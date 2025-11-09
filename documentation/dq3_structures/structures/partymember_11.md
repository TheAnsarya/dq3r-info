# PartyMember_11 Data Structure

Character data structure for PartyMember_11

**Base Address:** `$3b7d`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `11_Level`

**Offset:** `+00` (`$3b7d`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3b7d


### `11_XP`

**Offset:** `+01` (`$3b7e`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #11 - XP

**Notes:** Raw offset: $3b7e


### `11_HP_Max`

**Offset:** `+04` (`$3b81`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Max HP

**Notes:** Raw offset: $3b81


### `11_HP`

**Offset:** `+06` (`$3b83`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Current HP

**Notes:** Raw offset: $3b83


### `11_MP_Max`

**Offset:** `+08` (`$3b85`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Max MP

**Notes:** Raw offset: $3b85


### `11_MP`

**Offset:** `+0A` (`$3b87`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #11 - Current HP

**Notes:** Raw offset: $3b87


### `11_Strength`

**Offset:** `+0C` (`$3b89`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Strength stat

**Notes:** Raw offset: $3b89


### `11_Agility`

**Offset:** `+0D` (`$3b8a`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Agility stat

**Notes:** Raw offset: $3b8a


### `11_Stamina`

**Offset:** `+0E` (`$3b8b`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Stamina stat

**Notes:** Raw offset: $3b8b


### `11_Wisdom`

**Offset:** `+0F` (`$3b8c`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Wisdom stat

**Notes:** Raw offset: $3b8c


### `11_Luck`

**Offset:** `+10` (`$3b8d`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Luck stat, excluding equipment

**Notes:** Raw offset: $3b8d


### `11_Name`

**Offset:** `+16` (`$3b93`)
**Size:** 5 bytes
**Type:** `string`

Party member #11 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3b93


### `11_Bag_Number_Equiped`

**Offset:** `+2E` (`$3bab`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Number of items equipped

**Notes:** Raw offset: $3bab


### `11_Bag_Number_Carried`

**Offset:** `+2F` (`$3bac`)
**Size:** 1 byte
**Type:** `uint8`

Party member #11 - Number of items in bag

**Notes:** Raw offset: $3bac


### `11_Bag_Items`

**Offset:** `+30` (`$3bad`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #11 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3bad

