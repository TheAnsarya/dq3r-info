;==============================================================================
; SNES Memory Map Constants
; Dragon Quest III ROM Disassembly - HiROM Format
;==============================================================================
; Generated: 2025-11-10 14:39:12
;==============================================================================

;==============================================================================
; HIROM MEMORY LAYOUT
;==============================================================================
; ROM banks are mapped to $80-$FF and $00-$3F
; SRAM is typically at $70-$7D (if present)

;==============================================================================
; BANK RANGES
;==============================================================================
BANK_SYSTEM_START       = $00     ; System banks (0x00-0x03)  
BANK_SYSTEM_END         = $03
BANK_GAME_LOGIC_START   = $04     ; Game logic banks (0x04-0x1F)
BANK_GAME_LOGIC_END     = $1F  
BANK_AUDIO_START        = $20     ; Audio banks (0x20-0x27)
BANK_AUDIO_END          = $27
BANK_GRAPHICS_START     = $28     ; Graphics banks (0x28-0x37)
BANK_GRAPHICS_END       = $37
BANK_TEXT_START         = $38     ; Text data banks (0x38-0x3F)
BANK_TEXT_END           = $3F

;==============================================================================
; MEMORY REGIONS
;==============================================================================
WRAM_START              = $7E0000 ; Work RAM start
WRAM_END                = $7FFFFF ; Work RAM end
SRAM_START              = $700000 ; Save RAM start (if present)
SRAM_END                = $707FFF ; Save RAM end

;==============================================================================
; ROM HEADER LOCATION (HiROM)
;==============================================================================
ROM_HEADER              = $FFB0   ; ROM header start
ROM_TITLE               = $FFC0   ; Game title (21 bytes)
ROM_MAP_MODE            = $FFD5   ; Memory map mode
ROM_TYPE                = $FFD6   ; ROM type
ROM_SIZE                = $FFD7   ; ROM size
ROM_SRAM_SIZE           = $FFD8   ; SRAM size

; Last Modified: 2025-11-10 14:39:12
