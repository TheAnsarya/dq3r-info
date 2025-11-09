# PartyMember_10 Data Structure

Character data structure for PartyMember_10

**Base Address:** `$3b41`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `10_Level`

**Offset:** `+00` (`$3b41`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3b41


### `10_XP`

**Offset:** `+01` (`$3b42`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #10 - XP

**Notes:** Raw offset: $3b42


### `10_HP_Max`

**Offset:** `+04` (`$3b45`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #10 - Max HP

**Notes:** Raw offset: $3b45


### `10_HP`

**Offset:** `+06` (`$3b47`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #10 - Current HP

**Notes:** Raw offset: $3b47


### `10_MP_Max`

**Offset:** `+08` (`$3b49`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #10 - Max MP

**Notes:** Raw offset: $3b49


### `10_MP`

**Offset:** `+0A` (`$3b4b`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #10 - Current HP

**Notes:** Raw offset: $3b4b


### `10_Strength`

**Offset:** `+0C` (`$3b4d`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Strength stat

**Notes:** Raw offset: $3b4d


### `10_Agility`

**Offset:** `+0D` (`$3b4e`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Agility stat

**Notes:** Raw offset: $3b4e


### `10_Stamina`

**Offset:** `+0E` (`$3b4f`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Stamina stat

**Notes:** Raw offset: $3b4f


### `10_Wisdom`

**Offset:** `+0F` (`$3b50`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Wisdom stat

**Notes:** Raw offset: $3b50


### `10_Luck`

**Offset:** `+10` (`$3b51`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Luck stat, excluding equipment

**Notes:** Raw offset: $3b51


### `10_Name`

**Offset:** `+16` (`$3b57`)
**Size:** 5 bytes
**Type:** `string`

Party member #10 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3b57


### `10_Bag_Number_Equiped`

**Offset:** `+2E` (`$3b6f`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Number of items equipped

**Notes:** Raw offset: $3b6f


### `10_Bag_Number_Carried`

**Offset:** `+2F` (`$3b70`)
**Size:** 1 byte
**Type:** `uint8`

Party member #10 - Number of items in bag

**Notes:** Raw offset: $3b70


### `10_Bag_Items`

**Offset:** `+30` (`$3b71`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #10 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3b71

