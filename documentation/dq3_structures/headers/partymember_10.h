/* PartyMember_10 Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3b41 */
/* Size: 60 bytes */

#ifndef DQ3_PARTYMEMBER_10_H
#define DQ3_PARTYMEMBER_10_H

#include <stdint.h>

#define PARTYMEMBER_10_BASE_ADDR 0x3b41
#define PARTYMEMBER_10_SIZE 60

typedef struct {
	uint8_t 10_Level; /* Party member #10 - Level\nTop 7 bits are level, bottom bit unknown */
	uint32_t 10_XP; /* Party member #10 - XP */
	uint16_t 10_HP_Max; /* Party member #10 - Max HP */
	uint16_t 10_HP; /* Party member #10 - Current HP */
	uint16_t 10_MP_Max; /* Party member #10 - Max MP */
	uint16_t 10_MP; /* Party member #10 - Current HP */
	uint8_t 10_Strength; /* Party member #10 - Strength stat */
	uint8_t 10_Agility; /* Party member #10 - Agility stat */
	uint8_t 10_Stamina; /* Party member #10 - Stamina stat */
	uint8_t 10_Wisdom; /* Party member #10 - Wisdom stat */
	uint8_t 10_Luck; /* Party member #10 - Luck stat, excluding equipment */
	char 10_Name[5]; /* Party member #10 - Name, 4 characters max, ends in AC */
	uint8_t 10_Bag_Number_Equiped; /* Party member #10 - Number of items equipped */
	uint8_t 10_Bag_Number_Carried; /* Party member #10 - Number of items in bag */
	uint8_t 10_Bag_Items; /* Party member #10 - Each byte is which item is in the bag slot */
} PartyMember_10_t;

#endif /* DQ3_PARTYMEMBER_10_H */
