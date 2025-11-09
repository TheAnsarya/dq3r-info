/* PartyMember_12 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3bb9 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_12_H
#define DQ3_PARTYMEMBER_12_H

#include <stdint.h>

#define PARTYMEMBER_12_BASE_ADDR 0x3bb9
#define PARTYMEMBER_12_SIZE 60

typedef struct {
	uint8_t 12_Level; /* Party member #12 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 12_XP; /* Party member #12 - XP */
	uint16_t 12_HP_Max; /* Party member #12 - Max HP */
	uint16_t 12_HP; /* Party member #12 - Current HP */
	uint16_t 12_MP_Max; /* Party member #12 - Max MP */
	uint16_t 12_MP; /* Party member #12 - Current HP */
	uint8_t 12_Strength; /* Party member #12 - Strength stat */
	uint8_t 12_Agility; /* Party member #12 - Agility stat */
	uint8_t 12_Stamina; /* Party member #12 - Stamina stat */
	uint8_t 12_Wisdom; /* Party member #12 - Wisdom stat */
	uint8_t 12_Luck; /* Party member #12 - Luck stat, excluding equipment */
	char 12_Name[5]; /* Party member #12 - Name, 4 characters max, ends in AC */
	uint8_t 12_Bag_Number_Equiped; /* Party member #12 - Number of items equipped */
	uint8_t 12_Bag_Number_Carried; /* Party member #12 - Number of items in bag */
	uint8_t 12_Bag_Items; /* Party member #12 - Each byte is which item is in the bag slot */
} PartyMember_12_t;

#endif /* DQ3_PARTYMEMBER_12_H */
