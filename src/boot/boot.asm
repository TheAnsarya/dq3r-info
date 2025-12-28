;==============================================================================
; Dragon Quest III - Corrected Boot Sequence
; Boot code at proper ROM addresses
;==============================================================================

.include "hardware.inc"

.segment "BOOT_CODE"

ResetHandler:
    ; Actual boot sequence from $FFB6
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $1900FF,X        ; FF FF 00 19
    TSB $1A              ; 04 1A
    BPL $000D            ; 10 07
    PHP                  ; 08
    TRB $0905            ; 1C 05 09
    ORA $1B140A,X        ; 1F 0A 14 1B
    JSR $4B16            ; 20 16 4B
    AND $0D              ; 21 0D
    PHD                  ; 0B
    CLC                  ; 18
    TSB $00C4            ; 0C C4 00
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $03              ; 00 03
    BRK $04              ; 00 04
    BRK $05              ; 00 05
    BRK $06              ; 00 06
    BRK $07              ; 00 07
    BRK $08              ; 00 08
    BRK $09              ; 00 09
    BRK $0A              ; 00 0A
    BRK $0B              ; 00 0B
    BRK $0C              ; 00 0C
    BRK $0D              ; 00 0D
    BRK $0E              ; 00 0E
    BRK $0F              ; 00 0F
    BRK $10              ; 00 10
    BRK $11              ; 00 11
    BRK $12              ; 00 12
    BRK $13              ; 00 13
    BRK $14              ; 00 14
    BRK $15              ; 00 15

;==============================================================================
; Interrupt Handlers
;==============================================================================

NMIHandler:
    rti

IRQHandler:
    rti

;==============================================================================
; Hardware Vectors
;==============================================================================

.segment "VECTORS"

; Native mode vectors
.word 0, 0, 0, 0, 0, NMIHandler, ResetHandler, IRQHandler

; Emulation mode vectors
.word 0, 0, 0, 0, 0, NMIHandler, ResetHandler, IRQHandler
