;==============================================================================
; SNES Hardware Constants
; Dragon Quest III ROM Disassembly
;==============================================================================
; Generated: 2025-11-10 14:39:12
;==============================================================================

;==============================================================================
; PPU REGISTERS
;==============================================================================
INIDISP     = $2100    ; Screen display register
OBSEL       = $2101    ; Object size and character size register
OAMADDL     = $2102    ; OAM address register (low)
OAMADDH     = $2103    ; OAM address register (high)
OAMDATA     = $2104    ; OAM data write register

;==============================================================================
; AUDIO REGISTERS (SPC700)
;==============================================================================
APUIO0      = $2140    ; Audio port 0
APUIO1      = $2141    ; Audio port 1  
APUIO2      = $2142    ; Audio port 2
APUIO3      = $2143    ; Audio port 3

;==============================================================================
; DMA REGISTERS
;==============================================================================
DMAP0       = $4300    ; DMA control register for channel 0
BBAD0       = $4301    ; DMA destination register for channel 0
A1T0L       = $4302    ; DMA source address register (low) for channel 0
A1T0H       = $4303    ; DMA source address register (high) for channel 0

;==============================================================================
; CONTROLLER REGISTERS  
;==============================================================================
JOYSER0     = $4016    ; Controller port 1
JOYSER1     = $4017    ; Controller port 2

;==============================================================================
; 65C816 PROCESSOR VECTORS
;==============================================================================
VEC_COP     = $FFE4    ; COP vector
VEC_BRK     = $FFE6    ; BRK vector  
VEC_ABORT   = $FFE8    ; ABORT vector
VEC_NMI     = $FFEA    ; NMI vector
VEC_RESET   = $FFEC    ; RESET vector
VEC_IRQ     = $FFEE    ; IRQ vector

; Last Modified: 2025-11-10 14:39:12
