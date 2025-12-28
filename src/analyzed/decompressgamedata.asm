;==============================================================================
; DecompressGameData
; Type: General Purpose
; Address: $C08FD7
; Size: 12 bytes
; Instructions: 4
;==============================================================================
; Hardware Registers Used:
;   $2120 - STA operation
;   $211A - STA operation
;==============================================================================
DecompressGameData:
    STA $002120          ; 8F 20 21 00 | Configure PPU register $2120
    LDA $7FAC            ; AD AC 7F | Load from absolute address into accumulator
    STA $00211A          ; 8F 1A 21 00 | Configure PPU register $211A
    RTS                  ; 60 | Return from subroutine
