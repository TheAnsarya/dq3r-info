/* PartyMember_6 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3A51 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_6_H
#define DQ3_PARTYMEMBER_6_H

#include <stdint.h>

#define PARTYMEMBER_6_BASE_ADDR 0x3A51
#define PARTYMEMBER_6_SIZE 60

typedef struct {
	uint8_t 6_Level; /* Party member #6 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 6_XP; /* Party member #6 - XP */
	uint16_t 6_HP_Max; /* Party member #6 - Max HP */
	uint16_t 6_HP; /* Party member #6 - Current HP */
	uint16_t 6_MP_Max; /* Party member #6 - Max MP */
	uint16_t 6_MP; /* Party member #6 - Current HP */
	uint8_t 6_Strength; /* Party member #6 - Strength stat */
	uint8_t 6_Agility; /* Party member #6 - Agility stat */
	uint8_t 6_Stamina; /* Party member #6 - Stamina stat */
	uint8_t 6_Wisdom; /* Party member #6 - Wisdom stat */
	uint8_t 6_Luck; /* Party member #6 - Luck stat, excluding equipment */
	char 6_Name[5]; /* Party member #6 - Name, 4 characters max, ends in AC */
	uint8_t 6_Bag_Number_Equiped; /* Party member #6 - Number of items equipped */
	uint8_t 6_Bag_Number_Carried; /* Party member #6 - Number of items in bag */
	uint8_t 6_Bag_Items; /* Party member #6 - Each byte is which item is in the bag slot */
} PartyMember_6_t;

#endif /* DQ3_PARTYMEMBER_6_H */
