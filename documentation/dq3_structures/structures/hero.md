# Hero Data Structure

Character data structure for Hero

**Base Address:** `$3925`  
**Total Size:** 60 bytes  
**Type:** Character  
**Coverage:** 76.7% documented

## Field Definitions

### `Hero_Level`

**Offset:** `+00` (`$3925`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Level\nTop 7 bits are Hero's level, bottom bit unknown

**Notes:** Raw offset: $3925


### `Hero_XP`

**Offset:** `+01` (`$3926`)
**Size:** 3 bytes
**Type:** `uint24`

Hero - XP

**Notes:** Raw offset: $3926


### `HP_Max`

**Offset:** `+04` (`$3929`)
**Size:** 2 bytes
**Type:** `uint16`

Hero - Max HP

**Notes:** Raw offset: $3929


### `Hero_HP`

**Offset:** `+06` (`$392B`)
**Size:** 2 bytes
**Type:** `uint16`

Hero - Current HP

**Notes:** Raw offset: $392B


### `MP_Max`

**Offset:** `+08` (`$392D`)
**Size:** 2 bytes
**Type:** `uint16`

Hero - Max MP

**Notes:** Raw offset: $392D


### `Hero_MP`

**Offset:** `+0A` (`$392F`)
**Size:** 2 bytes
**Type:** `uint16`

Hero - Current MP

**Notes:** Raw offset: $392F


### `Hero_Strength`

**Offset:** `+0C` (`$3931`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Strength stat

**Notes:** Raw offset: $3931


### `Hero_Agility`

**Offset:** `+0D` (`$3932`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Agility stat

**Notes:** Raw offset: $3932


### `Hero_Stamina`

**Offset:** `+0E` (`$3933`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Stamina stat

**Notes:** Raw offset: $3933


### `Hero_Wisdom`

**Offset:** `+0F` (`$3934`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Wisdom stat

**Notes:** Raw offset: $3934


### `Hero_Luck`

**Offset:** `+10` (`$3935`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Luck stat, excluding equipment

**Notes:** Raw offset: $3935


### `Hero_Name`

**Offset:** `+16` (`$393B`)
**Size:** 5 bytes
**Type:** `string`

Hero - Name, 4 characters max, ends in AC

**Notes:** Raw offset: $393B


### `Hero_Spells`

**Offset:** `+24` (`$3949`)
**Size:** 10 bytes
**Type:** `spell_flags`

Hero spells flags

**Notes:** Raw offset: $3949


### `Bag_Number_Equiped`

**Offset:** `+2E` (`$3953`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Number of items equipped

**Notes:** Raw offset: $3953


### `Bag_Number_Carried`

**Offset:** `+2F` (`$3954`)
**Size:** 1 byte
**Type:** `uint8`

Hero - Number of items in bag

**Notes:** Raw offset: $3954


### `Bag_Items`

**Offset:** `+30` (`$3955`)
**Size:** 12 bytes
**Type:** `item_id`

Hero - Each byte is which item is in the bag slot

**Notes:** Raw offset: $3955

