# PartyMember_6 Data Structure

Character data structure for PartyMember_6

**Base Address:** `$3a51`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `6_Level`

**Offset:** `+00` (`$3a51`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3a51


### `6_XP`

**Offset:** `+01` (`$3a52`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #6 - XP

**Notes:** Raw offset: $3a52


### `6_HP_Max`

**Offset:** `+04` (`$3a55`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Max HP

**Notes:** Raw offset: $3a55


### `6_HP`

**Offset:** `+06` (`$3a57`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Current HP

**Notes:** Raw offset: $3a57


### `6_MP_Max`

**Offset:** `+08` (`$3a59`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Max MP

**Notes:** Raw offset: $3a59


### `6_MP`

**Offset:** `+0A` (`$3a5b`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Current HP

**Notes:** Raw offset: $3a5b


### `6_Strength`

**Offset:** `+0C` (`$3a5d`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Strength stat

**Notes:** Raw offset: $3a5d


### `6_Agility`

**Offset:** `+0D` (`$3a5e`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Agility stat

**Notes:** Raw offset: $3a5e


### `6_Stamina`

**Offset:** `+0E` (`$3a5f`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Stamina stat

**Notes:** Raw offset: $3a5f


### `6_Wisdom`

**Offset:** `+0F` (`$3a60`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Wisdom stat

**Notes:** Raw offset: $3a60


### `6_Luck`

**Offset:** `+10` (`$3a61`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Luck stat, excluding equipment

**Notes:** Raw offset: $3a61


### `6_Name`

**Offset:** `+16` (`$3a67`)
**Size:** 5 bytes
**Type:** `string`

Party member #6 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3a67


### `6_Bag_Number_Equiped`

**Offset:** `+2E` (`$3a7f`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Number of items equipped

**Notes:** Raw offset: $3a7f


### `6_Bag_Number_Carried`

**Offset:** `+2F` (`$3a80`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Number of items in bag

**Notes:** Raw offset: $3a80


### `6_Bag_Items`

**Offset:** `+30` (`$3a81`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #6 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3a81

