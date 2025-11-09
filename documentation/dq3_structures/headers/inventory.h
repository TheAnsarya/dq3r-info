/* Inventory Data Structure */
/* Generated from Dragon Quest III analysis */
/* Base Address: $3725 */
/* Size: 512 bytes */

#ifndef DQ3_INVENTORY_H
#define DQ3_INVENTORY_H

#include <stdint.h>

#define INVENTORY_BASE_ADDR 0x3725
#define INVENTORY_SIZE 512

typedef struct {
	uint8_t Bag_Items; /* Each byte is which item is in bag slot, 0 means empty, game uses values $01-$e4 */
	uint16_t Items_Amounts; /* Each byte is amount of the item in the bag slot, game allows up to 99 ($63) */
} Inventory_t;

#endif /* DQ3_INVENTORY_H */
