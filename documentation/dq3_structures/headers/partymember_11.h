/* PartyMember_11 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3B7D */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_11_H
#define DQ3_PARTYMEMBER_11_H

#include <stdint.h>

#define PARTYMEMBER_11_BASE_ADDR 0x3B7D
#define PARTYMEMBER_11_SIZE 60

typedef struct {
	uint8_t 11_Level; /* Party member #11 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 11_XP; /* Party member #11 - XP */
	uint16_t 11_HP_Max; /* Party member #11 - Max HP */
	uint16_t 11_HP; /* Party member #11 - Current HP */
	uint16_t 11_MP_Max; /* Party member #11 - Max MP */
	uint16_t 11_MP; /* Party member #11 - Current HP */
	uint8_t 11_Strength; /* Party member #11 - Strength stat */
	uint8_t 11_Agility; /* Party member #11 - Agility stat */
	uint8_t 11_Stamina; /* Party member #11 - Stamina stat */
	uint8_t 11_Wisdom; /* Party member #11 - Wisdom stat */
	uint8_t 11_Luck; /* Party member #11 - Luck stat, excluding equipment */
	char 11_Name[5]; /* Party member #11 - Name, 4 characters max, ends in AC */
	uint8_t 11_Bag_Number_Equiped; /* Party member #11 - Number of items equipped */
	uint8_t 11_Bag_Number_Carried; /* Party member #11 - Number of items in bag */
	uint8_t 11_Bag_Items; /* Party member #11 - Each byte is which item is in the bag slot */
} PartyMember_11_t;

#endif /* DQ3_PARTYMEMBER_11_H */
