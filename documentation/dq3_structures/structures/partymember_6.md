# PartyMember_6 Data Structure

Character data structure for PartyMember_6

**Base Address:** `$3A51`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `6_Level`

**Offset:** `+00` (`$3A51`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $3A51


### `6_XP`

**Offset:** `+01` (`$3A52`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #6 - XP

**Notes:** Raw offset: $3A52


### `6_HP_Max`

**Offset:** `+04` (`$3A55`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Max HP

**Notes:** Raw offset: $3A55


### `6_HP`

**Offset:** `+06` (`$3A57`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Current HP

**Notes:** Raw offset: $3A57


### `6_MP_Max`

**Offset:** `+08` (`$3A59`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Max MP

**Notes:** Raw offset: $3A59


### `6_MP`

**Offset:** `+0A` (`$3A5B`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #6 - Current HP

**Notes:** Raw offset: $3A5B


### `6_Strength`

**Offset:** `+0C` (`$3A5D`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Strength stat

**Notes:** Raw offset: $3A5D


### `6_Agility`

**Offset:** `+0D` (`$3A5E`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Agility stat

**Notes:** Raw offset: $3A5E


### `6_Stamina`

**Offset:** `+0E` (`$3A5F`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Stamina stat

**Notes:** Raw offset: $3A5F


### `6_Wisdom`

**Offset:** `+0F` (`$3A60`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Wisdom stat

**Notes:** Raw offset: $3A60


### `6_Luck`

**Offset:** `+10` (`$3A61`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Luck stat, excluding equipment

**Notes:** Raw offset: $3A61


### `6_Name`

**Offset:** `+16` (`$3A67`)
**Size:** 5 bytes
**Type:** `string`

Party member #6 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $3A67


### `6_Bag_Number_Equiped`

**Offset:** `+2E` (`$3A7F`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Number of items equipped

**Notes:** Raw offset: $3A7F


### `6_Bag_Number_Carried`

**Offset:** `+2F` (`$3A80`)
**Size:** 1 byte
**Type:** `uint8`

Party member #6 - Number of items in bag

**Notes:** Raw offset: $3A80


### `6_Bag_Items`

**Offset:** `+30` (`$3A81`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #6 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3A81

