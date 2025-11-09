# PartyMember_8 Data Structure

Character data structure for PartyMember_8

**Base Address:** `$3AC9`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `8_Level`

**Offset:** `+00` (`$3AC9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3AC9


### `8_XP`

**Offset:** `+01` (`$3ACA`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #8 - XP

**Notes:** Raw offset: $3ACA


### `8_HP_Max`

**Offset:** `+04` (`$3ACD`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Max HP

**Notes:** Raw offset: $3ACD


### `8_HP`

**Offset:** `+06` (`$3ACF`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Current HP

**Notes:** Raw offset: $3ACF


### `8_MP_Max`

**Offset:** `+08` (`$3AD1`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Max MP

**Notes:** Raw offset: $3AD1


### `8_MP`

**Offset:** `+0A` (`$3AD3`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #8 - Current HP

**Notes:** Raw offset: $3AD3


### `8_Strength`

**Offset:** `+0C` (`$3AD5`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Strength stat

**Notes:** Raw offset: $3AD5


### `8_Agility`

**Offset:** `+0D` (`$3AD6`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Agility stat

**Notes:** Raw offset: $3AD6


### `8_Stamina`

**Offset:** `+0E` (`$3AD7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Stamina stat

**Notes:** Raw offset: $3AD7


### `8_Wisdom`

**Offset:** `+0F` (`$3AD8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Wisdom stat

**Notes:** Raw offset: $3AD8


### `8_Luck`

**Offset:** `+10` (`$3AD9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Luck stat, excluding equipment

**Notes:** Raw offset: $3AD9


### `8_Name`

**Offset:** `+16` (`$3ADF`)
**Size:** 5 bytes
**Type:** `string`

Party member #8 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3ADF


### `8_Bag_Number_Equiped`

**Offset:** `+2E` (`$3AF7`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Number of items equipped

**Notes:** Raw offset: $3AF7


### `8_Bag_Number_Carried`

**Offset:** `+2F` (`$3AF8`)
**Size:** 1 byte
**Type:** `uint8`

Party member #8 - Number of items in bag

**Notes:** Raw offset: $3AF8


### `8_Bag_Items`

**Offset:** `+30` (`$3AF9`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #8 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3AF9

