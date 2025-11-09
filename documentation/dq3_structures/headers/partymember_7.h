/* PartyMember_7 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3a8d */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_7_H
#define DQ3_PARTYMEMBER_7_H

#include <stdint.h>

#define PARTYMEMBER_7_BASE_ADDR 0x3a8d
#define PARTYMEMBER_7_SIZE 60

typedef struct {
	uint8_t 7_Level; /* Party member #7 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 7_XP; /* Party member #7 - XP */
	uint16_t 7_HP_Max; /* Party member #7 - Max HP */
	uint16_t 7_HP; /* Party member #7 - Current HP */
	uint16_t 7_MP_Max; /* Party member #7 - Max MP */
	uint16_t 7_MP; /* Party member #7 - Current HP */
	uint8_t 7_Strength; /* Party member #7 - Strength stat */
	uint8_t 7_Agility; /* Party member #7 - Agility stat */
	uint8_t 7_Stamina; /* Party member #7 - Stamina stat */
	uint8_t 7_Wisdom; /* Party member #7 - Wisdom stat */
	uint8_t 7_Luck; /* Party member #7 - Luck stat, excluding equipment */
	char 7_Name[5]; /* Party member #7 - Name, 4 characters max, ends in AC */
	uint8_t 7_Bag_Number_Equiped; /* Party member #7 - Number of items equipped */
	uint8_t 7_Bag_Number_Carried; /* Party member #7 - Number of items in bag */
	uint8_t 7_Bag_Items; /* Party member #7 - Each byte is which item is in the bag slot */
} PartyMember_7_t;

#endif /* DQ3_PARTYMEMBER_7_H */
