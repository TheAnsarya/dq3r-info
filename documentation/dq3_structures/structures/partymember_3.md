# PartyMember_3 Data Structure

Character data structure for PartyMember_3

**Base Address:** `$399d`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 60.0% documented

## Field Definitions

### `3_Level`

**Offset:** `+00` (`$399d`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Level\nTop 7 bits are level, bottom bit unknown

**Notes:** Raw offset: $399d


### `3_XP`

**Offset:** `+01` (`$399e`)
**Size:** 3 bytes
**Type:** `uint24`

Party member #3 - XP

**Notes:** Raw offset: $399e


### `3_HP_Max`

**Offset:** `+04` (`$39a1`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Max HP

**Notes:** Raw offset: $39a1


### `3_HP`

**Offset:** `+06` (`$39a3`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Current HP

**Notes:** Raw offset: $39a3


### `3_MP_Max`

**Offset:** `+08` (`$39a5`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Max MP

**Notes:** Raw offset: $39a5


### `3_MP`

**Offset:** `+0A` (`$39a7`)
**Size:** 2 bytes
**Type:** `uint16`

Party member #3 - Current HP

**Notes:** Raw offset: $39a7


### `3_Strength`

**Offset:** `+0C` (`$39a9`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Strength stat

**Notes:** Raw offset: $39a9


### `3_Agility`

**Offset:** `+0D` (`$39aa`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Agility stat

**Notes:** Raw offset: $39aa


### `3_Stamina`

**Offset:** `+0E` (`$39ab`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Stamina stat

**Notes:** Raw offset: $39ab


### `3_Wisdom`

**Offset:** `+0F` (`$39ac`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Wisdom stat

**Notes:** Raw offset: $39ac


### `3_Luck`

**Offset:** `+10` (`$39ad`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Luck stat, excluding equipment

**Notes:** Raw offset: $39ad


### `3_Name`

**Offset:** `+16` (`$39b3`)
**Size:** 5 bytes
**Type:** `string`

Party member #3 - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $39b3


### `3_Bag_Number_Equiped`

**Offset:** `+2E` (`$39cb`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Number of items equipped

**Notes:** Raw offset: $39cb


### `3_Bag_Number_Carried`

**Offset:** `+2F` (`$39cc`)
**Size:** 1 byte
**Type:** `uint8`

Party member #3 - Number of items in bag

**Notes:** Raw offset: $39cc


### `3_Bag_Items`

**Offset:** `+30` (`$39cd`)
**Size:** 12 bytes
**Type:** `item_id`

Party member #3 - Each byte is which item is in the bag slot

**Notes:** Raw offset: $39cd

