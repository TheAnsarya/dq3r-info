/* PartyMember_8 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3AC9 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_8_H
#define DQ3_PARTYMEMBER_8_H

#include <stdint.h>

#define PARTYMEMBER_8_BASE_ADDR 0x3AC9
#define PARTYMEMBER_8_SIZE 60

typedef struct {
	uint8_t 8_Level; /* Party member #8 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 8_XP; /* Party member #8 - XP */
	uint16_t 8_HP_Max; /* Party member #8 - Max HP */
	uint16_t 8_HP; /* Party member #8 - Current HP */
	uint16_t 8_MP_Max; /* Party member #8 - Max MP */
	uint16_t 8_MP; /* Party member #8 - Current HP */
	uint8_t 8_Strength; /* Party member #8 - Strength stat */
	uint8_t 8_Agility; /* Party member #8 - Agility stat */
	uint8_t 8_Stamina; /* Party member #8 - Stamina stat */
	uint8_t 8_Wisdom; /* Party member #8 - Wisdom stat */
	uint8_t 8_Luck; /* Party member #8 - Luck stat, excluding equipment */
	char 8_Name[5]; /* Party member #8 - Name, 4 characters max, ends in AC */
	uint8_t 8_Bag_Number_Equiped; /* Party member #8 - Number of items equipped */
	uint8_t 8_Bag_Number_Carried; /* Party member #8 - Number of items in bag */
	uint8_t 8_Bag_Items; /* Party member #8 - Each byte is which item is in the bag slot */
} PartyMember_8_t;

#endif /* DQ3_PARTYMEMBER_8_H */
