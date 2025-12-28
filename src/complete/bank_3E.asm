;==============================================================================
; Dragon Quest III - Bank $3E
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $DF0000-$DF7FFF
; Instructions: 11080
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_3E"

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_000
; Address: $DF8000
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_000:
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_001
; Address: $DF8007
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_001:
    CLC                  ; 18 | Clear carry flag
    BMI $8E              ; 30 8E | Branch if negative
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BRA $40              ; 80 40 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$60             ; E0 60 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BMI $BC              ; 30 BC | Branch if negative
    PEA #$EE00           ; F4 00 EE | Push effective address to stack
    BRA $EA              ; 80 EA | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ROL $202E            ; 2E 2E 20 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_002
; Address: $DF8049
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_002:
    JSR $3131            ; 20 31 31 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BNE $D0              ; D0 D0 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $D4              ; F0 D4 | Branch if equal
    REP #$C2             ; C2 C2 | Reset processor status bits
    STX $86              ; 86 86 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROR $66              ; 66 66 | Rotate right (zero page)
    CPY $38CC            ; CC CC 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_003
; Address: $DF8095
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_003:
    SED                  ; F8 | Set decimal mode flag
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_004
; Address: $DF80C6
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_004:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $1C              ; 10 1C | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BNE $D0              ; D0 D0 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $C6              ; C6 C6 | Decrement (zero page)
    STX $86              ; 86 86 | Store X register to zero page
    ROL $26              ; 26 26 | Rotate left (zero page)
    STZ $64              ; 64 64 | Store zero to zero page
    CPY $38CC            ; CC CC 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_005
; Address: $DF812E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_005:
    ORA $0019,Y          ; 19 19 00 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $350F,Y          ; 19 0F 35 | Logical OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_009
; Address: $DF8148
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_009:
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    LDY $8C8C            ; AC 8C 8C | Load from absolute address into Y register
    PEA #$24F4           ; F4 F4 24 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $8C              ; B0 8C | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    STY $FCA8            ; 8C A8 FC | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $1B07            ; 0D 07 1B | Logical OR with accumulator (absolute)
    ADC #$69             ; 69 69 | Add with carry (immediate)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_00B
; Address: $DF81C6
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_00B:
    BIT $372C            ; 2C 2C 37 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $88              ; B0 88 | Branch if carry set
    BNE $84              ; D0 84 | Branch if not equal
    PEA #$E4F4           ; F4 F4 E4 | Push effective address to stack
    CPX $54              ; E4 54 | Compare X register (zero page)
    BPL $08              ; 10 08 | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    STY $FCA8            ; 8C A8 FC | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    BPL $15              ; 10 15 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    AND $2F2F,X          ; 3D 2F 2F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_00C
; Address: $DF8228
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_00C:
    JSL $303120          ; 22 20 31 30 | Jump to subroutine long
    BPL $0A              ; 10 0A | Branch if positive
    SEC                  ; 38 | Set carry flag
    ORA $1A38,X          ; 1D 38 1A | Logical OR with accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $90              ; 90 90 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_00D
; Address: $DF8256
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_00D:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $84              ; F0 84 | Branch if equal
    LDX #$82             ; A2 82 | Load immediate value into X register
    STX $D6              ; 86 D6 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROL $06              ; 26 06 | Rotate left (zero page)
    CPY $380C            ; CC 0C 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    STY $8EA8            ; 8C A8 8E | Store Y register to absolute address
    STX $FEA8            ; 8E A8 FE | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BPL $15              ; 10 15 | Branch if positive
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    BPL $0A              ; 10 0A | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $2D28            ; 0D 28 2D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_00E
; Address: $DF82A7
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_00E:
    JSL $1C1011          ; 22 11 10 1C | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $90              ; 90 90 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STY $D4              ; 84 D4 | Store Y register to zero page
    LDY $84              ; A4 84 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_00F
; Address: $DF82DA
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_00F:
    SED                  ; F8 | Set decimal mode flag
    BEQ $8C              ; F0 8C | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    STY $86D8            ; 8C D8 86 | Store Y register to absolute address
    DEC $C6              ; C6 C6 | Decrement (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY $380C            ; CC 0C 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    STX $FEA8            ; 8E A8 FE | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ASL $0F06            ; 0E 06 0F | Arithmetic shift left (absolute)
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $1B              ; 10 1B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($3C),Y          ; 11 3C | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $1C              ; 80 1C | Branch always
    ROL $1F1E,X          ; 3E 1E 1F | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    ASL $003F,X          ; 1E 3F 00 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_011
; Address: $DF836B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_011:
    JSR $40FA            ; 20 FA 40 | Jump to subroutine
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_013
; Address: $DF837A
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_013:
    JSR $4070            ; 20 70 40 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    INC $F808,X          ; FE 08 F8 | Increment (absolute,X)
    BPL $FC              ; 10 FC | Branch if positive
    DEC $3E20            ; CE 20 3E | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $14              ; 10 14 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    ROL $FF11,X          ; 3E 11 FF | Rotate left (absolute,X)
    INC $2123,X          ; FE 23 21 | PPU graphics register access
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    BMI $EC              ; 30 EC | Branch if negative
    NOP                  ; EA | No operation
    PLA                  ; 68 | Pull accumulator from stack
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BPL $1B              ; 10 1B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_014
; Address: $DF83D7
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_014:
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($7C),Y          ; 11 7C | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    INC $F808,X          ; FE 08 F8 | Increment (absolute,X)
    BPL $FC              ; 10 FC | Branch if positive
    DEC $3E20            ; CE 20 3E | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $14              ; 10 14 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    BPL $FE              ; 10 FE | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $1101            ; 0E 01 11 | Arithmetic shift left (absolute)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $3E13,X          ; 3E 13 3E | Rotate left (absolute,X)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $0111,X          ; 1E 11 01 | Arithmetic shift left (absolute,X)
    BIT $0200            ; 2C 00 02 | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    ASL $011F,X          ; 1E 1F 01 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ADC $730C            ; 6D 0C 73 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_016
; Address: $DF8458
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_016:
    JSR $027F            ; 20 7F 02 | Jump to subroutine
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_018
; Address: $DF846D
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_018:
    JSR $20F8            ; 20 F8 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BVS $A8              ; 70 A8 | Branch if overflow set
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $30              ; 80 30 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVS $B0              ; 70 B0 | Branch if overflow set
    CPX #$98             ; E0 98 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    BPL $F0              ; 10 F0 | Branch if positive
    BMI $20              ; 30 20 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCS $A0              ; B0 A0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_019
; Address: $DF84B0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_019:
    JSR $60D4            ; 20 D4 60 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    CPY $E810            ; CC 10 E8 | Compare Y register (absolute)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ROL $3E13,X          ; 3E 13 3E | Rotate left (absolute,X)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_01A
; Address: $DF84D6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_01A:
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_01B
; Address: $DF84E5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_01B:
    JSR $0044            ; 20 44 00 | Jump to subroutine
    ROR $3100,X          ; 7E 00 31 | Rotate right (absolute,X)
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_01C
; Address: $DF84F4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_01C:
    JSR $003F            ; 20 3F 00 | Jump to subroutine
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $70D8            ; 0E D8 70 | Arithmetic shift left (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $60              ; 80 60 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_01D
; Address: $DF850E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_01D:
    BCC $30              ; 90 30 | Branch if carry clear
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_01E
; Address: $DF851D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_01E:
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BNE $40              ; D0 40 | Branch if not equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BMI $A0              ; 30 A0 | Branch if negative
    BCC $70              ; 90 70 | Branch if carry clear
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_01F
; Address: $DF8531
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_01F:
    BVC $60              ; 50 60 | Branch if overflow clear
    BVC $30              ; 50 30 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    BCC $E0              ; 90 E0 | Game work RAM access
    BEQ $40              ; F0 40 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $7E              ; 10 7E | Branch if positive
    INC                  ; 1A | Increment accumulator
    ORA $0D30            ; 0D 30 0D | Logical OR with accumulator (absolute)
    BVS $06              ; 70 06 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_020
; Address: $DF856D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_020:
    ORA #$C8             ; 09 C8 | Logical OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    BPL $18              ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_021
; Address: $DF8573
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_021:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($3C),Y          ; 11 3C | Logical OR with accumulator ((zero page),Y)
    ORA #$7E             ; 09 7E | Logical OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LSR $18              ; 46 18 | Logical shift right (zero page)
    ASL $1F39            ; 0E 39 1F | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA $4E04            ; 0D 04 4E | Logical OR with accumulator (absolute)
    ADC ($47),Y          ; 71 47 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    ASL $1F79            ; 0E 79 1F | Arithmetic shift left (absolute)
    AND $0F00,Y          ; 39 00 0F | Logical AND with accumulator (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_024
; Address: $DF85BA
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_024:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ROR $58C8,X          ; 7E C8 58 | Rotate right (absolute,X)
    BCS $0C              ; B0 0C | Branch if carry set
    BCS $0E              ; B0 0E | Branch if carry set
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BCC $3B              ; 90 3B | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    ROL $7F90,X          ; 3E 90 7F | Rotate left (absolute,X)
    BMI $F9              ; 30 F9 | Branch if negative
    AND #$22             ; 29 22 | Logical AND with accumulator (immediate)
    ROR $18              ; 66 18 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_025
; Address: $DF85E7
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_025:
    BPL $FC              ; 10 FC | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BMI $E5              ; 30 E5 | Branch if negative
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    BPL $FE              ; 10 FE | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    ROR $1A13,X          ; 7E 13 1A | Rotate right (absolute,X)
    ORA $0D30            ; 0D 30 0D | Logical OR with accumulator (absolute)
    BVS $06              ; 70 06 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    ORA #$DC             ; 09 DC | Logical OR with accumulator (immediate)
    BPL $18              ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_026
; Address: $DF8613
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_026:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($7C),Y          ; 11 7C | Logical OR with accumulator ((zero page),Y)
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    STZ $4690            ; 9C 90 46 | Store zero to absolute
    PLA                  ; 68 | Pull accumulator from stack
    ASL $68              ; 06 68 | Arithmetic shift left (zero page)
    ROR $19              ; 66 19 | Rotate right (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $07A1            ; 0E A1 07 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    ROR $F9              ; 66 F9 | Rotate right (zero page)
    ADC $1F00,Y          ; 79 00 1F | Add with carry (absolute,Y)
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ROR $58C8,X          ; 7E C8 58 | Rotate right (absolute,X)
    BCS $0C              ; B0 0C | Branch if carry set
    BCS $0E              ; B0 0E | Branch if carry set
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $90              ; 10 90 | Branch if positive
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    BCC $7E              ; 90 7E | Branch if carry clear
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_027
; Address: $DF8664
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_027:
    SEC                  ; 38 | Set carry flag
    BMI $1C              ; 30 1C | Branch if negative
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BCS $20              ; B0 20 | Branch if carry set
    INC $1FE2            ; EE E2 1F | Increment (absolute)
    BMI $FE              ; 30 FE | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BEQ $20              ; F0 20 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_028
; Address: $DF8681
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_028:
    PHP                  ; 08 | Push processor status to stack
    ROL $E3              ; 26 E3 | Rotate left (zero page)
    CPY $CD              ; C4 CD | Compare Y register (zero page)
    STA ($DB,X)          ; 81 DB | Update graphics data
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    ORA $77              ; 05 77 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_029
; Address: $DF8692
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_029:
    JSR $C066            ; 20 66 C0 | Jump to subroutine
    DEC $81              ; C6 81 | Decrement (zero page)
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    ORA $5F              ; 05 5F | Logical OR with accumulator (zero page)
    ORA $2D08            ; 0D 08 2D | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BIT $06              ; 24 06 | Test bits in accumulator (zero page)
    BIT $06              ; 24 06 | Test bits in accumulator (zero page)
    ORA $3D7C,X          ; 1D 7C 3D | Logical OR with accumulator (absolute,X)
    INC $A85E,X          ; FE 5E A8 | Increment (absolute,X)
    LSR $6E93            ; 4E 93 6E | Logical shift right (absolute)
    ASL $2811            ; 0E 11 28 | Arithmetic shift left (absolute)
    BMI $63              ; 30 63 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_02A
; Address: $DF86D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_02A:
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROL $C762,X          ; 3E 62 C7 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_02D
; Address: $DF86EB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_02D:
    BVC $7E              ; 50 7E | Branch if overflow clear
    BPL $FC              ; 10 FC | Branch if positive
    BCC $24              ; 90 24 | Branch if carry clear
    ROR $00              ; 66 00 | Rotate right (zero page)
    BRA $C1              ; 80 C1 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_02E
; Address: $DF86F9
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_02E:
    SBC ($50,X)          ; E1 50 | Subtract with carry ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    BPL $F0              ; 10 F0 | Branch if positive
    BCC $B4              ; 90 B4 | Branch if carry clear
    BCC $F8              ; 90 F8 | Branch if carry clear
    BPL $F8              ; 10 F8 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BEQ $28              ; F0 28 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $C0              ; 10 C0 | Branch if positive
    SEC                  ; 38 | Set carry flag
    STY $70              ; 84 70 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    CPX $90              ; E4 90 | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    BCS $24              ; B0 24 | Branch if carry set
    LDY #$24             ; A0 24 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    ROR $FE74,X          ; 7E 74 FE | Rotate right (absolute,X)
    CPX $E42A            ; EC 2A E4 | Compare X register (absolute)
    LDA $6A              ; A5 6A | Read graphics status
    STA $6A              ; 85 6A | Update graphics data
    REP #$F4             ; C2 F4 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_02F
; Address: $DF8728
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_02F:
    JSR $34D8            ; 20 D8 34 | Jump to subroutine
    JMP $0C0E            ; 4C 0E 0C | Jump to address
    BRA $FD              ; 80 FD | Branch always
    CPY $08F8            ; CC F8 08 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    ROR $8CFC,X          ; 7E FC 8C | Rotate right (absolute,X)
    BRA $3F              ; 80 3F | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($26),Y          ; 11 26 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BIT $06              ; 24 06 | Test bits in accumulator (zero page)
    BIT $06              ; 24 06 | Test bits in accumulator (zero page)
    ORA $2D7C,X          ; 1D 7C 2D | Logical OR with accumulator (absolute,X)
    ROR $FC36,X          ; 7E 36 FC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_030
; Address: $DF8761
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_030:
    BCC $F8              ; 90 F8 | Branch if carry clear
    BPL $F8              ; 10 F8 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BEQ $28              ; F0 28 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $C0              ; 10 C0 | Branch if positive
    SEC                  ; 38 | Set carry flag
    STY $0A70            ; 8C 70 0A | Store Y register to absolute address
    BEQ $90              ; F0 90 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    BCS $24              ; B0 24 | Branch if carry set
    LDY #$24             ; A0 24 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    ROR $FF7C,X          ; 7E 7C FF | Rotate right (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_032
; Address: $DF8787
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_032:
    JMP $006F            ; 4C 6F 00 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC ($08),Y          ; 71 08 | Add with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_033
; Address: $DF8792
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_033:
    JSR $4060            ; 20 60 40 | Jump to subroutine
    LSR $48              ; 46 48 | Logical shift right (zero page)
    JMP $5000            ; 4C 00 50 | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    EOR #$61             ; 49 61 | Exclusive OR with accumulator (immediate)
    BVC $FF              ; 50 FF | Branch if overflow clear
    BCC $FF              ; 90 FF | Branch if carry clear
    BIT #$FE             ; 89 FE | Test bits in accumulator (immediate)
    ORA #$6F             ; 09 6F | Logical OR with accumulator (immediate)
    WDM #$01             ; 42 01 | Reserved instruction
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BVC $F3              ; 50 F3 | Branch if overflow clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    ORA $33              ; 05 33 | Logical OR with accumulator (zero page)
    BMI $3E              ; 30 3E | Branch if negative
    AND #$24             ; 29 24 | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $11              ; 05 11 | Logical OR with accumulator (zero page)
    ORA #$21             ; 09 21 | PPU graphics register access
    ASL $0602,X          ; 1E 02 06 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_034
; Address: $DF87DB
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_034:
    ORA $0F09            ; 0D 09 0F | Logical OR with accumulator (absolute)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FE80,X          ; FE 80 FE | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PLP                  ; 28 | Pull processor status from stack
    STZ $80              ; 64 80 | Store zero to zero page
    PEA #$D280           ; F4 80 D2 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    BEQ $10              ; F0 10 | Branch if equal
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $04              ; 80 04 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_035
; Address: $DF8819
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_035:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BNE $40              ; D0 40 | Branch if not equal
    BCC $AC              ; 90 AC | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $44B8            ; 4C B8 44 | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    BNE $34              ; D0 34 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BNE $F0              ; D0 F0 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_037
; Address: $DF8835
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_037:
    JSR $2838            ; 20 38 28 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BNE $D0              ; D0 D0 | Branch if not equal
    PEA #$507F           ; F4 7F 50 | Push effective address to stack
    BCC $FF              ; 90 FF | Branch if carry clear
    BIT #$FE             ; 89 FE | Test bits in accumulator (immediate)
    ORA #$6F             ; 09 6F | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_038
; Address: $DF884C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_038:
    JSL $022401          ; 22 01 24 02 | Jump to subroutine long
    BVC $F3              ; 50 F3 | Branch if overflow clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_039
; Address: $DF885F
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_039:
    ASL $31              ; 06 31 | Arithmetic shift left (zero page)
    AND $2728,X          ; 3D 28 27 | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $0D01,X          ; 1E 01 0D | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BIT $05              ; 24 05 | Test bits in accumulator (zero page)
    LSR $03              ; 46 03 | Logical shift right (zero page)
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    BEQ $10              ; F0 10 | Branch if equal
    BRA $C0              ; 80 C0 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $04              ; 80 04 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_03A
; Address: $DF8899
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_03A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BNE $A0              ; D0 A0 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    LDY $50              ; A4 50 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $D0              ; 24 D0 | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_03C
; Address: $DF88AF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_03C:
    RTI                  ; 40 | Return from interrupt
    BEQ $E8              ; F0 E8 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BNE $88              ; D0 88 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    BNE $70              ; D0 70 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_03D
; Address: $DF88BC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_03D:
    JSR $1838            ; 20 38 18 | Jump to subroutine
    CPY $0C              ; C4 0C | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROL $E3              ; 26 E3 | Rotate left (zero page)
    CPY $CF              ; C4 CF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_03E
; Address: $DF88C7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_03E:
    BRA $DF              ; 80 DF | Branch always
    BIT $267F            ; 2C 7F 26 | Test bits in accumulator (absolute)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_03F
; Address: $DF88D2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_03F:
    JSR $C066            ; 20 66 C0 | Jump to subroutine
    DEC $80              ; C6 80 | Decrement (zero page)
    STY $04              ; 84 04 | Store Y register to zero page
    STX $7F0C            ; 8E 0C 7F | Store X register to absolute address
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ROL $3E01,X          ; 3E 01 3E | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_040
; Address: $DF88E6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_040:
    JSR $1815            ; 20 15 18 | Jump to subroutine
    ASL $1B04            ; 0E 04 1B | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ADC $FC3C,Y          ; 79 3C FC | Add with carry (absolute,Y)
    LSR $4E2A,X          ; 5E 2A 4E | Logical shift right (absolute,X)
    ADC $910E,Y          ; 79 0E 91 | Add with carry (absolute,Y)
    ROR $0866            ; 6E 66 08 | Rotate right (absolute)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    BIT $6430            ; 2C 30 64 | Test bits in accumulator (absolute)
    AND $3C              ; 25 3C | Logical AND with accumulator (zero page)
    INC $AF67,X          ; FE 67 AF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_041
; Address: $DF8913
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_041:
    JSR $282F            ; 20 2F 28 | Jump to subroutine
    ASL $3E0F,X          ; 1E 0F 3E | Arithmetic shift left (absolute,X)
    ADC $263E,X          ; 7D 3E 26 | Add with carry (absolute,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROL $C762,X          ; 3E 62 C7 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_042
; Address: $DF8925
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_042:
    JSR $00F3            ; 20 F3 00 | Jump to subroutine
    BIT $FE              ; 24 FE | Test bits in accumulator (zero page)
    BRA $24              ; 80 24 | Branch always
    ROR $00              ; 66 00 | Rotate right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    CPX $00              ; E4 00 | Compare X register (zero page)
    BRA $7C              ; 80 7C | Branch always
    BNE $5C              ; D0 5C | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $20              ; F0 20 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BVC $04              ; 50 04 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    BVC $00              ; 50 00 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_043
; Address: $DF895C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_043:
    STZ $1E34,X          ; 9E 34 1E | Store zero to absolute,X
    JMP ($2806)          ; 6C 06 28 | Jump to address (absolute indirect)
    PHB                  ; 8B | Push data bank register to stack
    STZ $97              ; 64 97 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    BIT $106C            ; 2C 6C 10 | Test bits in accumulator (absolute)
    ASL $FC0C            ; 0E 0C FC | Arithmetic shift left (absolute)
    BRA $3F              ; 80 3F | Branch always
    DEC $06F6            ; CE F6 06 | Decrement (absolute)
    SEP #$22             ; E2 22 | Set processor status bits
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    BVS $F0              ; 70 F0 | Branch if overflow set
    ROR $8CFC,X          ; 7E FC 8C | Rotate right (absolute,X)
    BRA $3E              ; 80 3E | Branch always
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_045
; Address: $DF898C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_045:
    JSL $15250A          ; 22 0A 25 15 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ADC $7C2C,Y          ; 79 2C 7C | Add with carry (absolute,Y)
    CMP ($26),Y          ; D1 26 | Compare accumulator ((zero page),Y)
    SBC $4E12            ; ED 12 4E | Subtract with carry (absolute)
    BMI $36              ; 30 36 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    AND $7231            ; 2D 31 72 | Logical AND with accumulator (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_046
; Address: $DF89B6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_046:
    ROL $27              ; 26 27 | Rotate left (zero page)
    ASL $7D0F            ; 0E 0F 7D | Arithmetic shift left (absolute)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    BRA $7C              ; 80 7C | Branch always
    BNE $5C              ; D0 5C | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $20              ; F0 20 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    JMP $0A50            ; 4C 50 0A | Jump to address
    BCC $00              ; 90 00 | Branch if carry clear
    BVC $00              ; 50 00 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    STZ $1F3C,X          ; 9E 3C 1F | Store zero to absolute,X
    PLY                  ; 7A | Pull Y register from stack
    STZ $8970,X          ; 9E 70 89 | Store zero to absolute,X
    DEC $30              ; C6 30 | Decrement (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_049
; Address: $DF89EF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_049:
    JSR $E63F            ; 20 3F E6 | Jump to subroutine
    PEA #$F814           ; F4 14 F8 | Push effective address to stack
    BEQ $7C              ; F0 7C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDX $447C,Y          ; BE 7C 44 | Load from absolute,Y into X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $1F09            ; 0E 09 1F | Arithmetic shift left (absolute)
    ORA $0C3F            ; 0D 3F 0C | Logical OR with accumulator (absolute)
    LDX #$BB             ; A2 BB | Load immediate value into X register
    EOR $9A5F,X          ; 5D 5F 9A | Exclusive OR with accumulator (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_04B
; Address: $DF8A3C
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_04B:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    AND $1E1E,X          ; 3D 1E 1E | Logical AND with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0D01            ; 0D 01 0D | Logical OR with accumulator (absolute)
    REP #$00             ; C2 00 | Reset processor status bits
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BIT $1200            ; 2C 00 12 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    BMI $B0              ; 30 B0 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    INC $DAC3,X          ; FE C3 DA | Increment (absolute,X)
    LDA $E4              ; A5 E4 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    JMP ($1A00)          ; 6C 00 1A | Jump to address (absolute indirect)
    BCS $6E              ; B0 6E | Branch if carry set
    JMP ($98DB)          ; 6C DB 98 | Jump to address (absolute indirect)
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    BRA $F8              ; 80 F8 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    BCC $00              ; 90 00 | Branch if carry clear
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_04C
; Address: $DF8ACB
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_04C:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $0702            ; 0E 02 07 | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_04D
; Address: $DF8B27
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_04D:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_04E
; Address: $DF8B32
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_04E:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $20              ; 10 20 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_04F
; Address: $DF8B3D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_04F:
    BPL $00              ; 10 00 | Branch if positive
    BVC $FC              ; 50 FC | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    BNE $C0              ; D0 C0 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_051
; Address: $DF8B4D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_051:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_054
; Address: $DF8B5D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_054:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1D01,X          ; 1E 01 1D | Arithmetic shift left (absolute,X)
    ORA $0B00            ; 0D 00 0B | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ROL $1D01,X          ; 3E 01 1D | Rotate left (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $3D0D            ; 0E 0D 3D | Arithmetic shift left (absolute)
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0D              ; 10 0D | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_055
; Address: $DF8BBD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_055:
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_057
; Address: $DF8BE1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_057:
    JSR $60D0            ; 20 D0 60 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_058
; Address: $DF8BE9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_058:
    JSR $20F8            ; 20 F8 20 | Jump to subroutine
    BNE $E0              ; D0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    LDY #$10             ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_059
; Address: $DF8BF1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_059:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BRA $40              ; 80 40 | Branch always
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_05A
; Address: $DF8C10
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_05A:
    JSR $C080            ; 20 80 C0 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_05B
; Address: $DF8C17
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_05B:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $3C              ; 80 3C | Branch always
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ROL $1F01,X          ; 3E 01 1F | Rotate left (absolute,X)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ASL $1000            ; 0E 00 10 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_05C
; Address: $DF8C46
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_05C:
    JSR $40A0            ; 20 A0 40 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BNE $C0              ; D0 C0 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_05D
; Address: $DF8C50
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_05D:
    JSR $C080            ; 20 80 C0 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_05F
; Address: $DF8C5A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_05F:
    JSR $2040            ; 20 40 20 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $0D02            ; 0D 02 0D | Logical OR with accumulator (absolute)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    ORA $0B16            ; 0D 16 0B | Logical OR with accumulator (absolute)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    BPL $03              ; 10 03 | Branch if positive
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BCS $40              ; B0 40 | Branch if carry set
    BCS $40              ; B0 40 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_060
; Address: $DF8CA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_060:
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$48             ; E0 48 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_062
; Address: $DF8CB9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_062:
    BPL $00              ; 10 00 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$AC             ; E0 AC | Compare X register (immediate)
    BCS $D8              ; B0 D8 | Branch if carry set
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_064
; Address: $DF8CD0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_064:
    JSR $8010            ; 20 10 80 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CPY #$88             ; C0 88 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_067
; Address: $DF8CDD
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_067:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ROL $3B02,X          ; 3E 02 3B | Rotate left (absolute,X)
    ORA $031B            ; 0D 1B 03 | Logical OR with accumulator (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    BPL $03              ; 10 03 | Branch if positive
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$5C             ; C0 5C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$AC             ; E0 AC | Compare X register (immediate)
    BCS $68              ; B0 68 | Branch if carry set
    BNE $30              ; D0 30 | Branch if not equal
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_068
; Address: $DF8D10
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_068:
    JSR $A010            ; 20 10 A0 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    BCC $00              ; 90 00 | Branch if carry clear
    BVC $00              ; 50 00 | Branch if overflow clear
    LDY $671C,X          ; BC 1C 67 | Load from absolute,X into Y register
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_06A
; Address: $DF8D4A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_06A:
    LDX #$62             ; A2 62 | Load immediate value into X register
    STY $44              ; 84 44 | Store Y register to zero page
    BCS $50              ; B0 50 | Branch if carry set
    BMI $08              ; 30 08 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    BPL $1F              ; 10 1F | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    AND ($15),Y          ; 31 15 | Logical AND with accumulator ((zero page),Y)
    ORA $0900,Y          ; 19 00 09 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_06B
; Address: $DF8D84
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_06B:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCC $0C              ; 90 0C | Branch if carry clear
    CPY #$E0             ; C0 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BCC $F8              ; 90 F8 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    BEQ $14              ; F0 14 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    DEC $04              ; C6 04 | Decrement (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    EOR $42              ; 45 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_06C
; Address: $DF8DAD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_06C:
    JSL $040C0E          ; 22 0E 0C 04 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    BPL $21              ; 10 21 | PPU graphics register access
    BPL $C9              ; 10 C9 | Branch if positive
    BMI $05              ; 30 05 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_06D
; Address: $DF8DBC
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_06D:
    JSR $0CF8            ; 20 F8 0C | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    ROL $7EC2,X          ; 3E C2 7E | Rotate left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    STX $A4              ; 86 A4 | Store X register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $1C              ; 30 1C | Branch if negative
    BEQ $FE              ; F0 FE | Branch if equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_06F
; Address: $DF8DE7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_06F:
    JSR $3171            ; 20 71 31 | Jump to subroutine
    JMP $00611C          ; 5C 1C 61 00 | Jump to address long
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_070
; Address: $DF8DF6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_070:
    JSR $317F            ; 20 7F 31 | Jump to subroutine
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_072
; Address: $DF8E0C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_072:
    JSR $2127            ; 20 27 21 | PPU graphics register access
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $2C              ; 10 2C | Branch if positive
    BPL $31              ; 10 31 | Branch if positive
    BMI $3F              ; 30 3F | Branch if negative
    LSR $5E71            ; 4E 71 5E | Logical shift right (absolute)
    ADC ($9F,X)          ; 61 9F | Add with carry ((zero page,X))
    SEP #$C4             ; E2 C4 | Set processor status bits
    BPL $78              ; 10 78 | Branch if positive
    INC $3C00,X          ; FE 00 3C | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_073
; Address: $DF8E44
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_073:
    BMI $20              ; 30 20 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_075
; Address: $DF8E4B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_075:
    JSR $30B8            ; 20 B8 30 | Jump to subroutine
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $F8              ; D0 F8 | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    BEQ $40              ; F0 40 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $98              ; F0 98 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BVC $40              ; 50 40 | Branch if overflow clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_079
; Address: $DF8E80
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_079:
    JSR $D880            ; 20 80 D8 | Jump to subroutine
    BMI $08              ; 30 08 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_07A
; Address: $DF8E89
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_07A:
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    BPL $78              ; 10 78 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)
    ASL $1E20            ; 0E 20 1E | Arithmetic shift left (absolute)
    AND ($1D,X)          ; 21 1D | Logical AND with accumulator ((zero page,X))
    ROL $18              ; 26 18 | Rotate left (zero page)
    AND $002E,Y          ; 39 2E 00 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    AND $3F34,Y          ; 39 34 3F | Logical AND with accumulator (absolute,Y)
    AND $302F,Y          ; 39 2F 30 | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    ORA $1817,X          ; 1D 17 18 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BMI $12              ; 30 12 | Branch if negative
    AND $3F00,Y          ; 39 00 3F | Logical AND with accumulator (absolute,Y)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $98              ; F0 98 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BVC $40              ; 50 40 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_07B
; Address: $DF8EED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_07B:
    JSR $0814            ; 20 14 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_07C
; Address: $DF8EFA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_07C:
    JSR $1080            ; 20 80 10 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$34             ; E0 34 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $90              ; F0 90 | Branch if equal
    BVS $90              ; 70 90 | Branch if overflow set
    BVS $20              ; 70 20 | Branch if overflow set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_07E
; Address: $DF8F13
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_07E:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $1801,X          ; 1E 01 18 | Arithmetic shift left (absolute,X)
    ORA $2F66,X          ; 1D 66 2F | Logical OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_080
; Address: $DF8F50
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_080:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LSR $1F30,X          ; 5E 30 1F | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LSR $7C6F,X          ; 5E 6F 7C | Logical shift right (absolute,X)
    ROR $5E41,X          ; 7E 41 5E | Rotate right (absolute,X)
    ADC ($25,X)          ; 61 25 | Add with carry ((zero page,X))
    AND $110C            ; 2D 0C 11 | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ROR $7F01,X          ; 7E 01 7F | Rotate right (absolute,X)
    ASL $E600            ; 0E 00 E6 | Arithmetic shift left (absolute)
    CPY #$19             ; C0 19 | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    CPY #$3D             ; C0 3D | Compare Y register (immediate)
    BMI $1E              ; 30 1E | Branch if negative
    CLC                  ; 18 | Clear carry flag
    STZ $4C40            ; 9C 40 4C | Store zero to absolute
    BCC $C0              ; 90 C0 | Branch if carry clear
    INC $00              ; E6 00 | Increment (zero page)
    INC $FCC0,X          ; FE C0 FC | Increment (absolute,X)
    BMI $FA              ; 30 FA | Branch if negative
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_081
; Address: $DF8F9E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_081:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    BEQ $18              ; F0 18 | Branch if equal
    BNE $B4              ; D0 B4 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_082
; Address: $DF8FA5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_082:
    JMP ($0EF2)          ; 6C F2 0E | Jump to address (absolute indirect)
    CPX #$06             ; E0 06 | Compare X register (immediate)
    SBC $26              ; E5 26 | Subtract with carry (zero page)
    CMP $23CA,Y          ; D9 CA 23 | Compare accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_083
; Address: $DF8FB3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_083:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BMI $44              ; 30 44 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_084
; Address: $DF8FBF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_084:
    CPY #$26             ; C0 26 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPX $14              ; E4 14 | Compare X register (zero page)
    CPX $8CF4            ; EC F4 8C | Compare X register (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_085
; Address: $DF8FCB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_085:
    JSR $0090            ; 20 90 00 | Jump to subroutine
    BNE $64              ; D0 64 | Branch if not equal
    BRA $FC              ; 80 FC | Branch always
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_086
; Address: $DF8FE0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_086:
    ASL $1801,X          ; 1E 01 18 | Arithmetic shift left (absolute,X)
    AND $4F36            ; 2D 36 4F | Logical AND with accumulator (absolute)
    BVS $07              ; 70 07 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_088
; Address: $DF8FF2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_088:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_089
; Address: $DF8FFC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_089:
    JSL $032006          ; 22 06 20 03 | Jump to subroutine long
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $18              ; F0 18 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    ROR $F4              ; 66 F4 | Rotate right (zero page)
    ASL $EA              ; 06 EA | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $C52A            ; ED 2A C5 | Subtract with carry (absolute)
    CPY #$0E             ; C0 0E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_08A
; Address: $DF9013
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_08A:
    JSR $0001            ; 20 01 00 | Jump to subroutine
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_08B
; Address: $DF901F
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_08B:
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $13              ; 06 13 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $060C            ; 0D 0C 06 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    BPL $0F              ; 10 0F | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $0719            ; 0D 19 07 | Logical OR with accumulator (absolute)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    BMI $04              ; 30 04 | Branch if negative
    INC                  ; 1A | Increment accumulator
    BPL $B5              ; 10 B5 | Branch if positive
    LDY #$2A             ; A0 2A | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    LDX $F230,Y          ; BE 30 F2 | Load from absolute,Y into X register
    BRA $E0              ; 80 E0 | Game work RAM access
    BEQ $30              ; F0 30 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    LDY #$FA             ; A0 FA | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    BMI $70              ; 30 70 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ORA $0719            ; 0D 19 07 | Logical OR with accumulator (absolute)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BPL $14              ; 10 14 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BRA $6F              ; 80 6F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY $675F,X          ; BC 5F 67 | Load from absolute,X into Y register
    BMI $0F              ; 30 0F | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    BPL $6F              ; 10 6F | Branch if positive
    BPL $2F              ; 10 2F | Branch if positive
    BPL $7F              ; 10 7F | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_08C
; Address: $DF90CD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_08C:
    JSR $047B            ; 20 7B 04 | Jump to subroutine
    BPL $38              ; 10 38 | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_08D
; Address: $DF90D3
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_08D:
    ORA $1F04,X          ; 1D 04 1F | Logical OR with accumulator (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $AC              ; 66 AC | Rotate right (zero page)
    WDM #$5B             ; 42 5B | Reserved instruction
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $191D,X          ; 1D 1D 19 | Logical OR with accumulator (absolute,X)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $0C              ; F0 0C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $3EF0            ; 0E F0 3E | Arithmetic shift left (absolute)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    DEC $0820,X          ; DE 20 08 | Decrement (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BNE $00              ; D0 00 | Branch if not equal
    BRA $04              ; 80 04 | Branch always
    BRA $0C              ; 80 0C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BIT $1F2C            ; 2C 2C 1F | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_08E
; Address: $DF9142
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_08E:
    AND $F546,Y          ; 39 46 F5 | Logical AND with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHX                  ; DA | Push X register to stack
    BIT $6C              ; 24 6C | Test bits in accumulator (zero page)
    BCC $98              ; 90 98 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_08F
; Address: $DF914C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_08F:
    BEQ $80              ; F0 80 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BRA $E6              ; 80 E6 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_090
; Address: $DF9151
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_090:
    ROR $D0              ; 66 D0 | Rotate right (zero page)
    BVC $38              ; 50 38 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    LDY $98BC,X          ; BC BC 98 | Load from absolute,X into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_092
; Address: $DF915E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_092:
    BRA $80              ; 80 80 | Branch always
    BPL $7F              ; 10 7F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $7B              ; 10 7B | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $1F04,X          ; 1D 04 1F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_093
; Address: $DF917A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_093:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    BPL $34              ; 10 34 | Branch if positive
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    DEC $0820,X          ; DE 20 08 | Decrement (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BNE $00              ; D0 00 | Branch if not equal
    BRA $04              ; 80 04 | Branch always
    BRA $0C              ; 80 0C | Branch always
    BIT $072C            ; 2C 2C 07 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_094
; Address: $DF91A6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_094:
    JSR $313F            ; 20 3F 31 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_095
; Address: $DF91B4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_095:
    JSR $401F            ; 20 1F 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_096
; Address: $DF91BC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_096:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F),Y          ; 11 7F | Logical OR with accumulator ((zero page),Y)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    BPL $38              ; 10 38 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    ORA $0A14            ; 0D 14 0A | Logical OR with accumulator (absolute)
    ROL $2B11            ; 2E 11 2B | Rotate left (absolute)
    ROL $1B              ; 26 1B | Rotate left (zero page)
    ORA $0E02            ; 0D 02 0E | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_097
; Address: $DF91F4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_097:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    BRA $20              ; 80 20 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $2C              ; F0 2C | Branch if equal
    CPX #$FC             ; E0 FC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_099
; Address: $DF9213
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_099:
    BRA $10              ; 80 10 | Branch always
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_09B
; Address: $DF9223
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_09B:
    BPL $E8              ; 10 E8 | Branch if positive
    BMI $C8              ; 30 C8 | Branch if negative
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BMI $40              ; 30 40 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_09C
; Address: $DF922F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_09C:
    JSR $E860            ; 20 60 E8 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_09E
; Address: $DF9241
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_09E:
    DEY                  ; 88 | Decrement Y register
    STZ $88              ; 64 88 | Store zero to zero page
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0A0
; Address: $DF9247
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0A0:
    JSR $9048            ; 20 48 90 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    BPL $20              ; 10 20 | Branch if positive
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BCC $80              ; 90 80 | Branch if carry clear
    BRA $60              ; 80 60 | Branch always
    BCS $B0              ; B0 B0 | Branch if carry set
    BEQ $D0              ; F0 D0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0A3
; Address: $DF925E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0A3:
    JSR $7FE0            ; 20 E0 7F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F),Y          ; 11 7F | Logical OR with accumulator ((zero page),Y)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    BPL $38              ; 10 38 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BPL $02              ; 10 02 | Branch if positive
    ROL $5B11            ; 2E 11 5B | Rotate left (absolute)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)
    ORA $1D02            ; 0D 02 1D | Logical OR with accumulator (absolute)
    ORA $3C3C,X          ; 1D 3C 3C | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0A4
; Address: $DF92A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0A4:
    BPL $E8              ; 10 E8 | Branch if positive
    BMI $C8              ; 30 C8 | Branch if negative
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0A5
; Address: $DF92AC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0A5:
    JSR $5040            ; 20 40 50 | Jump to subroutine
    LDY #$60             ; A0 60 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0A8
; Address: $DF92CB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0A8:
    JSR $8060            ; 20 60 80 | Jump to subroutine
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BCS $B0              ; B0 B0 | Branch if carry set
    BEQ $D0              ; F0 D0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0AA
; Address: $DF92DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0AA:
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BMI $1F              ; 30 1F | Branch if negative
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0AB
; Address: $DF92EF
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0AB:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    ASL $1F0A,X          ; 1E 0A 1F | Arithmetic shift left (absolute,X)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    WDM #$18             ; 42 18 | Reserved instruction
    ROR $0401,X          ; 7E 01 04 | Rotate right (absolute,X)
    ASL $2600            ; 0E 00 26 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    AND $3E18,X          ; 3D 18 3E | Logical AND with accumulator (absolute,X)
    STA $AE66,Y          ; 99 66 AE | Update graphics data
    EOR ($5A,X)          ; 41 5A | Exclusive OR with accumulator ((zero page,X))
    ORA $33              ; 05 33 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    ORA $1D1D,X          ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    REP #$F4             ; C2 F4 | Reset processor status bits
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    INC $2600,X          ; FE 00 26 | Increment (absolute,X)
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    INC $08              ; E6 08 | Increment (zero page)
    PEA #$F208           ; F4 08 F2 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BIT $BE              ; 24 BE | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LSR $1EA0,X          ; 5E A0 1E | Logical shift right (absolute,X)
    BCS $1E              ; B0 1E | Branch if carry set
    CPX #$26             ; E0 26 | Compare X register (immediate)
    CPY #$42             ; C0 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0AC
; Address: $DF936C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0AC:
    JSL $807EC8          ; 22 C8 7E 80 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    LDY $7C18,X          ; BC 18 7C | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0AD
; Address: $DF937D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0AD:
    INX                  ; E8 | Increment X register
    CPX $9FEC            ; EC EC 9F | Compare X register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0AF
; Address: $DF9387
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0AF:
    JSR $50EC            ; 20 EC 50 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B0
; Address: $DF938C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B0:
    BEQ $80              ; F0 80 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BRA $66              ; 80 66 | Branch always
    ROR $10              ; 66 10 | Rotate right (zero page)
    BCC $B0              ; 90 B0 | Branch if carry clear
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B2
; Address: $DF939E
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B2:
    BRA $80              ; 80 80 | Branch always
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    WDM #$18             ; 42 18 | Reserved instruction
    ROR $0401,X          ; 7E 01 04 | Rotate right (absolute,X)
    ASL $2600            ; 0E 00 26 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    AND $3E18,X          ; 3D 18 3E | Logical AND with accumulator (absolute,X)
    LDX $5E40,Y          ; BE 40 5E | Load from absolute,Y into X register
    LDY #$1E             ; A0 1E | Load immediate value into Y register
    BCS $1E              ; B0 1E | Branch if carry set
    CPX #$26             ; E0 26 | Compare X register (immediate)
    CPY #$42             ; C0 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    CPY $7E              ; C4 7E | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    LDY $7C18,X          ; BC 18 7C | Load from absolute,X into Y register
    CPX $ECEC            ; EC EC EC | Compare X register (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $01              ; 10 01 | Branch if positive
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B3
; Address: $DF93FD
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B3:
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    AND $180A,X          ; 3D 0A 18 | Logical AND with accumulator (absolute,X)
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BMI $F0              ; 30 F0 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    PEA #$EAA5           ; F4 A5 EA | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $E2F0,X          ; 3E F0 E2 | Rotate left (absolute,X)
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BEQ $04              ; F0 04 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$EA10           ; F4 10 EA | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B4
; Address: $DF943A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B4:
    JSR $00DC            ; 20 DC 00 | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    AND $180A,X          ; 3D 0A 18 | Logical AND with accumulator (absolute,X)
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0C08,X          ; 1E 08 0C | Arithmetic shift left (absolute,X)
    AND $04              ; 25 04 | Logical AND with accumulator (zero page)
    BMI $3F              ; 30 3F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $0F              ; 30 0F | Branch if negative
    ORA $0E0C,X          ; 1D 0C 0E | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    WDM #$02             ; 42 02 | Reserved instruction
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B5
; Address: $DF94CA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B5:
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BPL $FC              ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B6
; Address: $DF94E1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B6:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BEQ $10              ; F0 10 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B7
; Address: $DF94F0
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B7:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    LDX #$20             ; A2 20 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $04              ; E4 04 | Compare X register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCC $80              ; 90 80 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    BVC $E8              ; 50 E8 | Branch if overflow clear
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ROL $0C08,X          ; 3E 08 0C | Rotate left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BIT $4500            ; 2C 00 45 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B8
; Address: $DF9541
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B8:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $40              ; 10 40 | Branch if positive
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0B9
; Address: $DF9550
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0B9:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0BA
; Address: $DF955C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0BA:
    SEC                  ; 38 | Set carry flag
    LDY $20              ; A4 20 | Load from zero page into Y register
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $13              ; 24 13 | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0BB
; Address: $DF95B0
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0BB:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    INC $FE10,X          ; FE 10 FE | Increment (absolute,X)
    INC $3C00,X          ; FE 00 3C | Increment (absolute,X)
    BEQ $28              ; F0 28 | Branch if equal
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $BC              ; 10 BC | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0BC
; Address: $DF95F6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0BC:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BEQ $40              ; F0 40 | Branch if equal
    BMI $F0              ; 30 F0 | Branch if negative
    INX                  ; E8 | Increment X register
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0BD
; Address: $DF960F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0BD:
    JSR $4048            ; 20 48 40 | Jump to subroutine
    BNE $E0              ; D0 E0 | Game work RAM access
    BCC $E0              ; 90 E0 | Game work RAM access
    BNE $E0              ; D0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C0
; Address: $DF9627
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C0:
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BPL $0F              ; 10 0F | Branch if positive
    ORA $0901            ; 0D 01 09 | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    INC $FE10,X          ; FE 10 FE | Increment (absolute,X)
    INC $3C00,X          ; FE 00 3C | Increment (absolute,X)
    BEQ $28              ; F0 28 | Branch if equal
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $BC              ; 10 BC | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C1
; Address: $DF9676
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C1:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C4
; Address: $DF9685
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C4:
    JSR $A048            ; 20 48 A0 | Jump to subroutine
    BRA $60              ; 80 60 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVC $40              ; 50 40 | Branch if overflow clear
    BVC $60              ; 50 60 | Branch if overflow clear
    BPL $A0              ; 10 A0 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive
    BVS $60              ; 70 60 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C5
; Address: $DF969B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C5:
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    ROL $1A07,X          ; 3E 07 1A | Rotate left (absolute,X)
    ORA $0E18            ; 0D 18 0E | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$1C             ; 09 1C | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $02              ; 10 02 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C6
; Address: $DF96DB
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C6:
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ROL $04              ; 26 04 | Rotate left (zero page)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    EOR #$27             ; 49 27 | Exclusive OR with accumulator (immediate)
    BMI $0B              ; 30 0B | Branch if negative
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    LSR $06              ; 46 06 | Logical shift right (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C7
; Address: $DF970F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C7:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C8
; Address: $DF971E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C8:
    JSR $FC70            ; 20 70 FC | Jump to subroutine
    CPX #$58             ; E0 58 | Compare X register (immediate)
    BCS $10              ; B0 10 | Branch if carry set
    BEQ $14              ; F0 14 | Branch if equal
    CPY $99              ; C4 99 | Compare Y register (zero page)
    ROL $2800,X          ; 3E 00 28 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0C9
; Address: $DF973C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0C9:
    JSL $206008          ; 22 08 60 20 | Jump to subroutine long
    STA $06F6            ; 8D F6 06 | Update graphics data
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BCC $10              ; 90 10 | Branch if carry clear
    BMI $E8              ; 30 E8 | Branch if negative
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    CPX #$38             ; E0 38 | Compare X register (immediate)
    CPX #$68             ; E0 68 | Compare X register (immediate)
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    LDY #$88             ; A0 88 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BRA $E0              ; 80 E0 | Game work RAM access
    ROL $1A07,X          ; 3E 07 1A | Rotate left (absolute,X)
    ORA $0E08            ; 0D 08 0E | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    STA $007C,Y          ; 99 7C 00 | Update graphics data
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0CA
; Address: $DF9775
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0CA:
    BPL $02              ; 10 02 | Branch if positive
    BMI $01              ; 30 01 | Branch if negative
    BPL $06              ; 10 06 | Branch if positive
    CPX #$58             ; E0 58 | Compare X register (immediate)
    BCS $18              ; B0 18 | Branch if carry set
    BEQ $10              ; F0 10 | Branch if equal
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    STZ $20              ; 64 20 | Store zero to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $7F              ; 10 7F | Branch if positive
    LDY $900C            ; AC 0C 90 | Load from absolute address into Y register
    LDA ($21),Y          ; B1 21 | PPU graphics register access
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND ($EF,X)          ; 21 EF | Logical AND with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    ADC ($31),Y          ; 71 31 | Add with carry ((zero page),Y)
    ADC ($21,X)          ; 61 21 | PPU graphics register access
    PLP                  ; 28 | Pull processor status from stack
    AND $4707,X          ; 3D 07 47 | Logical AND with accumulator (absolute,X)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    AND ($7F),Y          ; 31 7F | Logical AND with accumulator ((zero page),Y)
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BNE $F0              ; D0 F0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0CB
; Address: $DF980E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0CB:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    BRA $20              ; 80 20 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0CC
; Address: $DF9825
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0CC:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    CPY #$31             ; C0 31 | Compare Y register (immediate)
    BMI $8B              ; 30 8B | Branch if negative
    BRA $95              ; 80 95 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $C0              ; 10 C0 | Branch if positive
    DEC $FF30            ; CE 30 FF | Decrement (absolute)
    BRA $FD              ; 80 FD | Branch always
    BCC $F8              ; 90 F8 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    AND $24              ; 25 24 | Logical AND with accumulator (zero page)
    BMI $34              ; 30 34 | Branch if negative
    TXS                  ; 9A | Transfer X register to stack pointer
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $30              ; F0 30 | Branch if equal
    BVS $C1              ; 70 C1 | Branch if overflow set
    DEC                  ; 3A | Decrement accumulator
    SBC ($1A),Y          ; F1 1A | Subtract with carry ((zero page),Y)
    BEQ $2A              ; F0 2A | Branch if equal
    BEQ $3A              ; F0 3A | Branch if equal
    BEQ $9C              ; F0 9C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $7F              ; 10 7F | Branch if positive
    JMP $1098            ; 4C 98 10 | Jump to address
    LDA $1039            ; AD 39 10 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    JMP $10EF            ; 4C EF 10 | Jump to address
    AND ($63,X)          ; 21 63 | Logical AND with accumulator ((zero page,X))
    JMP ($3A18)          ; 6C 18 3A | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0CD
; Address: $DF9887
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0CD:
    JSR $0444            ; 20 44 04 | Jump to subroutine
    JMP ($792C)          ; 6C 2C 79 | Jump to address (absolute indirect)
    AND $003F,Y          ; 39 3F 00 | Logical AND with accumulator (absolute,Y)
    ASL $23              ; 06 23 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0CE
; Address: $DF9896
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0CE:
    JSR $047F            ; 20 7F 04 | Jump to subroutine
    BIT $393F            ; 2C 3F 39 | Test bits in accumulator (absolute)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    CPY #$31             ; C0 31 | Compare Y register (immediate)
    BMI $89              ; 30 89 | Branch if negative
    BRA $9B              ; 80 9B | Branch always
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0CF
; Address: $DF98B5
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0CF:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $C0              ; 10 C0 | Branch if positive
    DEC $FF30            ; CE 30 FF | Decrement (absolute)
    BRA $FF              ; 80 FF | Branch always
    BCC $FD              ; 90 FD | Branch if carry clear
    LSR $37              ; 46 37 | Logical shift right (zero page)
    BMI $95              ; 30 95 | Branch if negative
    STA $84              ; 85 84 | Update graphics data
    CMP $C4              ; C5 C4 | Compare accumulator (zero page)
    BEQ $14              ; F0 14 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    BVS $C0              ; 70 C0 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SBC ($9A),Y          ; F1 9A | Subtract with carry ((zero page),Y)
    SBC ($8A),Y          ; F1 8A | Subtract with carry ((zero page),Y)
    BEQ $CA              ; F0 CA | Branch if equal
    BEQ $1A              ; F0 1A | Branch if equal
    BPL $04              ; 10 04 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA $0B12            ; 0D 12 0B | Logical OR with accumulator (absolute)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ROL $C0              ; 26 C0 | Rotate left (zero page)
    WDM #$B6             ; 42 B6 | Reserved instruction
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0D0
; Address: $DF9919
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0D0:
    JSR $6021            ; 20 21 60 | Jump to subroutine
    EOR $F8              ; 45 F8 | Exclusive OR with accumulator (zero page)
    AND ($F8),Y          ; 31 F8 | Logical AND with accumulator ((zero page),Y)
    CMP ($42,X)          ; C1 42 | Hardware register operation
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    PHA                  ; 48 | Push accumulator to stack
    BCS $02              ; B0 02 | Branch if carry set
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    ROR $4803,X          ; 7E 03 48 | Rotate right (absolute,X)
    PEA #$F048           ; F4 48 F0 | Push effective address to stack
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    ORA $30              ; 05 30 | Logical OR with accumulator (zero page)
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    EOR $0078,X          ; 5D 78 00 | Exclusive OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0D1
; Address: $DF9949
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0D1:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0D2
; Address: $DF9958
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0D2:
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    STY $44F8            ; 8C F8 44 | Store Y register to absolute address
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $00              ; A4 00 | Load from zero page into Y register
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0D4
; Address: $DF997C
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0D4:
    LDY #$58             ; A0 58 | Load immediate value into Y register
    BVC $08              ; 50 08 | Branch if overflow clear
    BPL $D4              ; 10 D4 | Branch if positive
    BCS $60              ; B0 60 | Branch if carry set
    BNE $B0              ; D0 B0 | Branch if not equal
    BEQ $80              ; F0 80 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    BRA $D8              ; 80 D8 | Branch always
    BVC $70              ; 50 70 | Branch if overflow clear
    BRA $10              ; 80 10 | Branch always
    BCC $BC              ; 90 BC | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $80              ; B0 80 | Branch if carry set
    BCC $80              ; 90 80 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    BVC $70              ; 50 70 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    ORA $0B12            ; 0D 12 0B | Logical OR with accumulator (absolute)
    AND $6601,X          ; 3D 01 66 | Logical AND with accumulator (absolute,X)
    BIT $D3              ; 24 D3 | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA $0200            ; 0D 00 02 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0D5
; Address: $DF99BB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0D5:
    JSR $7C25            ; 20 25 7C | Jump to subroutine
    INC $40C0,X          ; FE C0 40 | Increment (absolute,X)
    STY $01              ; 84 01 | Store Y register to zero page
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0D6
; Address: $DF99CC
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0D6:
    LDX $7930,Y          ; BE 30 79 | Load from absolute,Y into X register
    ASL $FD42            ; 0E 42 FD | Arithmetic shift left (absolute)
    LSR $70              ; 46 70 | Logical shift right (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    AND ($70),Y          ; 31 70 | Logical AND with accumulator ((zero page),Y)
    ASL $907C            ; 0E 7C 90 | Arithmetic shift left (absolute)
    BCS $A0              ; B0 A0 | Branch if carry set
    BPL $B0              ; 10 B0 | Branch if positive
    BMI $80              ; 30 80 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    BRA $98              ; 80 98 | Branch always
    BCC $F0              ; 90 F0 | Branch if carry clear
    BPL $14              ; 10 14 | Branch if positive
    BPL $3C              ; 10 3C | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $40              ; 30 40 | Branch if negative
    BPL $40              ; 10 40 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BVC $30              ; 50 30 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    ADC ($61),Y          ; 71 61 | Add with carry ((zero page),Y)
    BCC $20              ; 90 20 | Branch if carry clear
    NOP                  ; EA | No operation
    BPL $06              ; 10 06 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0D8
; Address: $DF9A41
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0D8:
    JSR $6A96            ; 20 96 6A | Jump to subroutine
    CPX $8700            ; EC 00 87 | Compare X register (absolute)
    STX $A922            ; 8E 22 A9 | Store X register to absolute address
    AND #$23             ; 29 23 | Logical AND with accumulator (immediate)
    WDM #$02             ; 42 02 | Reserved instruction
    BRA $53              ; 80 53 | Branch always
    PHB                  ; 8B | Push data bank register to stack
    EOR $530F,Y          ; 59 0F 53 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0DA
; Address: $DF9A66
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0DA:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BRA $20              ; 80 20 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCC $48              ; 90 48 | Branch if carry clear
    BRA $4E              ; 80 4E | Branch always
    SED                  ; F8 | Set decimal mode flag
    LDA $1019FA          ; AF FA 19 10 | Read graphics status
    STA $0F84            ; 8D 84 0F | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0DC
; Address: $DF9A9C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0DC:
    JSL $8820D6          ; 22 D6 20 88 | Jump to subroutine long
    ROR $3658            ; 6E 58 36 | Rotate right (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    ROR $F668            ; 6E 68 F6 | Rotate right (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    JMP $DE48            ; 4C 48 DE | Jump to address
    CPY $0E              ; C4 0E | Compare Y register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    DEC $C440,X          ; DE 40 C4 | Decrement (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    STA ($21),Y          ; 91 21 | PPU graphics register access
    BEQ $00              ; F0 00 | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0DE
; Address: $DF9AD7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0DE:
    BRA $80              ; 80 80 | Branch always
    WDM #$8C             ; 42 8C | Reserved instruction
    PHB                  ; 8B | Push data bank register to stack
    EOR ($9D,X)          ; 41 9D | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0DF
; Address: $DF9AE2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0DF:
    INC $0A              ; E6 0A | Increment (zero page)
    STY $8720            ; 8C 20 87 | Store Y register to absolute address
    LDX $2622            ; AE 22 26 | Load from absolute address into X register
    ROL $4F              ; 26 4F | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0E0
; Address: $DF9AED
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0E0:
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    BRA $53              ; 80 53 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    BCC $48              ; 90 48 | Branch if carry clear
    BRA $4C              ; 80 4C | Branch always
    SED                  ; F8 | Set decimal mode flag
    LDX $1FF8            ; AE F8 1F | Load from absolute address into X register
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    ORA $5704            ; 0D 04 57 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0E1
; Address: $DF9B13
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0E1:
    BMI $40              ; 30 40 | Branch if negative
    ASL $E7              ; 06 E7 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BIT $D7              ; 24 D7 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0E2
; Address: $DF9B1E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0E2:
    JSL $00B68E          ; 22 8E B6 00 | Jump to subroutine long
    JMP ($3658)          ; 6C 58 36 | Jump to address (absolute indirect)
    ROR                  ; 6A | Rotate right (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    BCC $CE              ; 90 CE | Branch if carry clear
    CPY $00FC            ; CC FC 00 | Compare Y register (absolute)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    DEC $C440,X          ; DE 40 C4 | Decrement (absolute,X)
    BCC $F8              ; 90 F8 | Branch if carry clear
    CPY $00FC            ; CC FC 00 | Compare Y register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0E5
; Address: $DF9B50
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0E5:
    JSR $000C            ; 20 0C 00 | Jump to subroutine
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    ASL $85              ; 06 85 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    TAX                  ; AA | Transfer accumulator to X register
    BPL $BF              ; 10 BF | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    EOR $0046            ; 4D 46 00 | Exclusive OR with accumulator (absolute)
    EOR $491F            ; 4D 1F 49 | Exclusive OR with accumulator (absolute)
    EOR ($41),Y          ; 51 41 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0E6
; Address: $DF9B6E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0E6:
    ASL $0801            ; 0E 01 08 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)
    LDA $A900,Y          ; B9 00 A9 | Read graphics status
    ORA $19A9,X          ; 1D A9 19 | Logical OR with accumulator (absolute,X)
    LDA ($1F,X)          ; A1 1F | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    ASL $0140            ; 0E 40 01 | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BCS $48              ; B0 48 | Branch if carry set
    BNE $68              ; D0 68 | Branch if not equal
    BNE $48              ; D0 48 | Branch if not equal
    BRA $3C              ; 80 3C | Branch always
    INC $24              ; E6 24 | Increment (zero page)
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0E7
; Address: $DF9B94
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0E7:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    STA $84              ; 85 84 | Update graphics data
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $0D              ; 80 0D | Branch always
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ROR $84C0,X          ; 7E C0 84 | Rotate right (absolute,X)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    BRA $EC              ; 80 EC | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0E8
; Address: $DF9BBA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0E8:
    JSR $1AFF            ; 20 FF 1A | Jump to subroutine
    ROL $C000,X          ; 3E 00 C0 | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0EB
; Address: $DF9BD0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0EB:
    JSR $000C            ; 20 0C 00 | Jump to subroutine
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $45              ; 06 45 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BPL $5F              ; 10 5F | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0EC
; Address: $DF9BE3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0EC:
    AND $0026            ; 2D 26 00 | Logical AND with accumulator (absolute)
    AND $290F            ; 2D 0F 29 | Logical AND with accumulator (absolute)
    AND ($21),Y          ; 31 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0ED
; Address: $DF9BF1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0ED:
    PHP                  ; 08 | Push processor status to stack
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)
    EOR $4900,Y          ; 59 00 49 | Exclusive OR with accumulator (absolute,Y)
    ORA $0959,X          ; 1D 59 09 | Logical OR with accumulator (absolute,X)
    EOR ($1F,X)          ; 41 1F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0EE
; Address: $DF9BFE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0EE:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BCS $48              ; B0 48 | Branch if carry set
    BNE $68              ; D0 68 | Branch if not equal
    BNE $4C              ; D0 4C | Branch if not equal
    BRA $36              ; 80 36 | Branch always
    INC                  ; 1A | Increment accumulator
    CMP $44              ; C5 44 | Compare accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0EF
; Address: $DF9C14
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0EF:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BMI $04              ; 30 04 | Branch if negative
    CPY $0E              ; C4 0E | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    LDA ($80,X)          ; A1 80 | Read graphics status
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STX $8380            ; 8E 80 83 | Store X register to absolute address
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ADC $9E0C,X          ; 7D 0C 9E | Add with carry (absolute,X)
    BVS $82              ; 70 82 | Branch if overflow set
    BRA $FF              ; 80 FF | Branch always
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    BPL $FF              ; 10 FF | Branch if positive
    STX $7000            ; 8E 00 70 | Store X register to absolute address
    ROL $3E01,X          ; 3E 01 3E | Rotate left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $7C              ; 80 7C | Branch always
    BNE $58              ; D0 58 | Branch if not equal
    LDY #$10             ; A0 10 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F0
; Address: $DF9C6B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F0:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    BPL $48              ; 10 48 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ROL $E3              ; 26 E3 | Rotate left (zero page)
    CPY $CF              ; C4 CF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F1
; Address: $DF9C89
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F1:
    BRA $DF              ; 80 DF | Branch always
    BIT $267F            ; 2C 7F 26 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F2
; Address: $DF9C94
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F2:
    JSR $C066            ; 20 66 C0 | Jump to subroutine
    DEC $80              ; C6 80 | Decrement (zero page)
    STY $04              ; 84 04 | Store Y register to zero page
    STX $7F0C            ; 8E 0C 7F | Store X register to absolute address
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROL $C762,X          ; 3E 62 C7 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F3
; Address: $DF9CC7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F3:
    JSR $00F3            ; 20 F3 00 | Jump to subroutine
    BIT $FE              ; 24 FE | Test bits in accumulator (zero page)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    CPX $FC              ; E4 FC | Compare X register (zero page)
    BRA $7C              ; 80 7C | Branch always
    BRA $7C              ; 80 7C | Branch always
    BNE $58              ; D0 58 | Branch if not equal
    LDY #$10             ; A0 10 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F5
; Address: $DF9CFA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F5:
    PHA                  ; 48 | Push accumulator to stack
    BPL $48              ; 10 48 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $080E            ; 0D 0E 08 | Logical OR with accumulator (absolute)
    ORA $111F,Y          ; 19 1F 11 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    AND $3D30            ; 2D 30 3D | Logical AND with accumulator (absolute)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F7
; Address: $DF9D38
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F7:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    BVC $3F              ; 50 3F | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    BIT $2C38            ; 2C 38 2C | Test bits in accumulator (absolute)
    BMI $2E              ; 30 2E | Branch if negative
    ORA $020F            ; 0D 0F 02 | Logical OR with accumulator (absolute)
    BVC $3F              ; 50 3F | Branch if overflow clear
    BVC $3F              ; 50 3F | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $0E1F            ; 2C 1F 0E | Test bits in accumulator (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BVC $30              ; 50 30 | Branch if overflow clear
    BCC $40              ; 90 40 | Branch if carry clear
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    BNE $48              ; D0 48 | Branch if not equal
    BCC $50              ; 90 50 | Branch if carry clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    BCC $D0              ; 90 D0 | Branch if carry clear
    BMI $80              ; 30 80 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F8
; Address: $DF9D88
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F8:
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    BEQ $D0              ; F0 D0 | Branch if equal
    BVS $D0              ; 70 D0 | Branch if overflow set
    PLP                  ; 28 | Pull processor status from stack
    BCC $28              ; 90 28 | Branch if carry clear
    BCS $C8              ; B0 C8 | Branch if carry set
    BEQ $98              ; F0 98 | Branch if equal
    CPX #$14             ; E0 14 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    BEQ $28              ; F0 28 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0F9
; Address: $DF9DA2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0F9:
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    BVC $A0              ; 50 A0 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    BCS $B0              ; B0 B0 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0FA
; Address: $DF9DAC
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0FA:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $090E            ; 0D 0E 09 | Logical OR with accumulator (absolute)
    ASL $1F18            ; 0E 18 1F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ROL $2E34,X          ; 3E 34 2E | Rotate left (absolute,X)
    BMI $3D              ; 30 3D | Branch if negative
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0FC
; Address: $DF9DF8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0FC:
    JSR $401F            ; 20 1F 40 | Jump to subroutine
    BVC $3F              ; 50 3F | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    AND $2C30            ; 2D 30 2C | Logical AND with accumulator (absolute)
    BMI $2C              ; 30 2C | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $1F09,X          ; 1E 09 1F | Arithmetic shift left (absolute,X)
    BVC $3F              ; 50 3F | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $061F            ; 2C 1F 06 | Test bits in accumulator (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0FD
; Address: $DF9E28
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0FD:
    JSR $B0A0            ; 20 A0 B0 | Jump to subroutine
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0FE
; Address: $DF9E30
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0FE:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    BVC $A0              ; 50 A0 | Branch if overflow clear
    BVC $A0              ; 50 A0 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LDY #$08             ; A0 08 | Load immediate value into Y register
    CPX #$A4             ; E0 A4 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_0FF
; Address: $DF9E42
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_0FF:
    JSR $40A0            ; 20 A0 40 | Jump to subroutine
    LDY #$84             ; A0 84 | Load immediate value into Y register
    STZ $24              ; 64 24 | Store zero to zero page
    CPX $28              ; E4 28 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$54             ; A0 54 | Load immediate value into Y register
    CPX #$9A             ; E0 9A | Compare X register (immediate)
    CPX $1A              ; E4 1A | Compare X register (zero page)
    CPX $14              ; E4 14 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $70              ; 10 70 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BCC $F0              ; 90 F0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_100
; Address: $DF9E6B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_100:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_101
; Address: $DF9E8D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_101:
    ORA #$1C             ; 09 1C | Logical OR with accumulator (immediate)
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $1D02            ; 0D 02 1D | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $39              ; 10 39 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_103
; Address: $DF9EA7
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_103:
    JSR $2236            ; 20 36 22 | Jump to subroutine
    ROR $7C52            ; 6E 52 7C | Rotate right (absolute)
    JMP $5068            ; 4C 68 50 | Jump to address
    CLC                  ; 18 | Clear carry flag
    AND $3106,Y          ; 39 06 31 | Logical AND with accumulator (absolute,Y)
    ASL $0934            ; 0E 34 09 | Arithmetic shift left (absolute)
    ORA #$7A             ; 09 7A | Logical OR with accumulator (immediate)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_104
; Address: $DF9EC3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_104:
    EOR $2C37,X          ; 5D 37 2C | Exclusive OR with accumulator (absolute,X)
    ASL $031F            ; 0E 1F 03 | Arithmetic shift left (absolute)
    ASL $0301            ; 0E 01 03 | Arithmetic shift left (absolute)
    ADC $3C00,X          ; 7D 00 3C | Add with carry (absolute,X)
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_105
; Address: $DF9EE7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_105:
    JSR $3070            ; 20 70 30 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_106
; Address: $DF9EF7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_106:
    BRA $70              ; 80 70 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BRA $78              ; 80 78 | Branch always
    BRA $D8              ; 80 D8 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $BC14,X          ; BC 14 BC | Load from absolute,X into Y register
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_107
; Address: $DF9F0B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_107:
    TAY                  ; A8 | Transfer accumulator to Y register
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_108
; Address: $DF9F13
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_108:
    JSR $6098            ; 20 98 60 | Jump to subroutine
    LDY $7C40,X          ; BC 40 7C | Load from absolute,X into Y register
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BRA $2C              ; 80 2C | Branch always
    LDY $A814            ; AC 14 A8 | Load from absolute address into Y register
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPY #$BC             ; C0 BC | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1E0C            ; 0E 0C 1E | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($18),Y          ; 11 18 | Logical OR with accumulator ((zero page),Y)
    ORA ($38),Y          ; 11 38 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_10A
; Address: $DF9F69
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_10A:
    JSR $4276            ; 20 76 42 | Hardware register operation
    ROR $52              ; 66 52 | Rotate right (zero page)
    JMP $021D            ; 4C 1D 02 | Jump to address
    ORA $3806,Y          ; 19 06 38 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ORA #$72             ; 09 72 | Logical OR with accumulator (immediate)
    ORA #$72             ; 09 72 | Logical OR with accumulator (immediate)
    ORA #$7C             ; 09 7C | Logical OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_10B
; Address: $DF9F85
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_10B:
    JMP $1B2C37          ; 5C 37 2C 1B | Jump to address long
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ASL $0301            ; 0E 01 03 | Arithmetic shift left (absolute)
    ADC $7C00,X          ; 7D 00 7C | Add with carry (absolute,X)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BEQ $50              ; F0 50 | Branch if equal
    BVS $50              ; 70 50 | Branch if overflow set
    BEQ $50              ; F0 50 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_10C
; Address: $DF9FAC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_10C:
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $00              ; F0 00 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $3E9A,X          ; 1E 9A 3E | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    LDY $DC14,X          ; BC 14 DC | Load from absolute,X into Y register
    LDY $CC              ; A4 CC | Load from zero page into Y register
    BRA $78              ; 80 78 | Branch always
    BRA $54              ; 80 54 | Branch always
    LDY #$9E             ; A0 9E | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_10D
; Address: $DF9FD8
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_10D:
    ROL $3CC0,X          ; 3E C0 3C | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDY $BC00,X          ; BC 00 BC | Load from absolute,X into Y register
    JMP $140C44          ; 5C 44 0C 14 | Jump to address long
    STY $98B4            ; 8C B4 98 | Store Y register to absolute address
    TAY                  ; A8 | Transfer accumulator to Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    JMP $E01CA0          ; 5C A0 1C E0 | Game work RAM access
    LDY $B840,X          ; BC 40 B8 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    AND ($0E,X)          ; 21 0E | Logical AND with accumulator ((zero page,X))
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    AND $3F06,Y          ; 39 06 3F | Logical AND with accumulator (absolute,Y)
    ASL $2D01,X          ; 1E 01 2D | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    JMP $001703          ; 5C 03 17 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_10E
; Address: $DFA034
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_10E:
    JSR $5801            ; 20 01 58 | Jump to subroutine
    STY $BE00            ; 8C 00 BE | Store Y register to absolute address
    ROR $3E00,X          ; 7E 00 3E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_10F
; Address: $DFA042
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_10F:
    CLC                  ; 18 | Clear carry flag
    ORA $1E0F,Y          ; 19 0F 1E | Logical OR with accumulator (absolute,Y)
    ASL $000B            ; 0E 0B 00 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_110
; Address: $DFA064
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_110:
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_111
; Address: $DFA06B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_111:
    JSR $10E4            ; 20 E4 10 | Jump to subroutine
    STY $70              ; 84 70 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_112
; Address: $DFA078
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_112:
    RTI                  ; 40 | Return from interrupt
    BVS $20              ; 70 20 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_113
; Address: $DFA07C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_113:
    CLC                  ; 18 | Clear carry flag
    BPL $D8              ; 10 D8 | Branch if positive
    BEQ $9C              ; F0 9C | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_114
; Address: $DFA082
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_114:
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $B0              ; 80 B0 | Branch always
    BVC $F0              ; 50 F0 | Branch if overflow clear
    ASL $1AEE            ; 0E EE 1A | Arithmetic shift left (absolute)
    EOR $C0BC            ; 4D BC C0 | Exclusive OR with accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BRA $1C              ; 80 1C | Branch always
    RTI                  ; 40 | Return from interrupt
    ADC $7900,Y          ; 79 00 79 | Add with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    AND #$D2             ; 29 D2 | Logical AND with accumulator (immediate)
    ORA $FEF6,X          ; 1D F6 FE | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    BIT $F838            ; 2C 38 F8 | Test bits in accumulator (absolute)
    BCS $78              ; B0 78 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_115
; Address: $DFA0AD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_115:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    PEA #$F000           ; F4 00 F0 | Push effective address to stack
    BEQ $08              ; F0 08 | Branch if equal
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    BCS $A0              ; B0 A0 | Branch if carry set
    BMI $00              ; 30 00 | Branch if negative
    AND $3F06,Y          ; 39 06 3F | Logical AND with accumulator (absolute,Y)
    ASL $0D01,X          ; 1E 01 0D | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_116
; Address: $DFA0C9
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_116:
    SEC                  ; 38 | Set carry flag
    BVS $77              ; 70 77 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    JMP $9E00            ; 4C 00 9E | Jump to address
    STZ $5E00,X          ; 9E 00 5E | Store zero to absolute,X
    STZ $F860            ; 9C 60 F8 | Store zero to absolute
    SEI                  ; 78 | Set interrupt disable flag
    BRA $B4              ; 80 B4 | Branch always
    PEA #$EA1E           ; F4 1E EA | Push effective address to stack
    INC                  ; 1A | Increment accumulator
    SBC #$18             ; E9 18 | Subtract with carry (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    CPY #$E0             ; C0 E0 | Game work RAM access
    BPL $04              ; 10 04 | Branch if positive
    BRA $1A              ; 80 1A | Branch always
    RTI                  ; 40 | Return from interrupt
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ADC $7E00,X          ; 7D 00 7E | Add with carry (absolute,X)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ROL $3001,X          ; 3E 01 30 | Rotate left (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    AND ($06),Y          ; 31 06 | Logical AND with accumulator ((zero page),Y)
    ORA $1613            ; 0D 13 16 | Logical OR with accumulator (absolute)
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    AND ($07,X)          ; 21 07 | Logical AND with accumulator ((zero page,X))
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ASL $0006            ; 0E 06 00 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $2100,Y          ; 19 00 21 | PPU graphics register access
    ORA $0E15,X          ; 1D 15 0E | Logical OR with accumulator (absolute,X)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $19              ; 05 19 | Logical OR with accumulator (zero page)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $1410            ; EC 10 14 | Compare X register (absolute)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_117
; Address: $DFA16F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_117:
    INX                  ; E8 | Increment X register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_118
; Address: $DFA17C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_118:
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    BMI $E8              ; 30 E8 | Branch if negative
    BVC $08              ; 50 08 | Branch if overflow clear
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BRA $C8              ; 80 C8 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_119
; Address: $DFA194
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_119:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    NOP                  ; EA | No operation
    ROR $3EB4            ; 6E B4 3E | Rotate right (absolute)
    PEA #$C8EC           ; F4 EC C8 | Push effective address to stack
    STZ $C0              ; 64 C0 | Store zero to zero page
    CPX #$BC             ; E0 BC | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_11A
; Address: $DFA1AE
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_11A:
    CPX $E000            ; EC 00 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    BCC $60              ; 90 60 | Branch if carry clear
    BVS $31              ; 70 31 | Branch if overflow set
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ORA $1613            ; 0D 13 16 | Logical OR with accumulator (absolute)
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ASL $0006            ; 0E 06 00 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $0F17,X          ; 1D 17 0F | Logical OR with accumulator (absolute,X)
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_11B
; Address: $DFA1F4
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_11B:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $E8              ; 30 E8 | Branch if negative
    BVC $08              ; 50 08 | Branch if overflow clear
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCS $00              ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_11C
; Address: $DFA214
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_11C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    BMI $38              ; 30 38 | Branch if negative
    BNE $28              ; D0 28 | Branch if not equal
    CPY #$E4             ; C0 E4 | Compare Y register (immediate)
    CPX #$DC             ; E0 DC | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    LDY $5880            ; AC 80 58 | Load from absolute address into Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    BVC $88              ; 50 88 | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$21             ; 09 21 | PPU graphics register access
    ASL $0639            ; 0E 39 06 | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ROL $3E03,X          ; 3E 03 3E | Rotate left (absolute,X)
    ORA $0D18            ; 0D 18 0D | Logical OR with accumulator (absolute)
    BPL $06              ; 10 06 | Branch if positive
    ROR $572C,X          ; 7E 2C 57 | Rotate right (absolute,X)
    LDY $0027,X          ; BC 27 00 | Load from absolute,X into Y register
    PLP                  ; 28 | Pull processor status from stack
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    STY $9C00            ; 8C 00 9C | Store Y register to absolute address
    JMP $9500            ; 4C 00 95 | Jump to address
    STA $746D,X          ; 9D 6D 74 | Update graphics data
    BPL $38              ; 10 38 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_11D
; Address: $DFA287
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_11D:
    CLC                  ; 18 | Clear carry flag
    ORA $041E            ; 0D 1E 04 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    CPX $90              ; E4 90 | Compare X register (zero page)
    STY $70              ; 84 70 | Store Y register to zero page
    STZ $0060            ; 9C 60 00 | Store zero to absolute
    CPY #$E0             ; C0 E0 | Game work RAM access
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_11E
; Address: $DFA2BA
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_11E:
    CLC                  ; 18 | Clear carry flag
    BPL $D8              ; 10 D8 | Branch if positive
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$7C             ; E0 7C | Compare X register (immediate)
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    BCS $18              ; B0 18 | Branch if carry set
    BCS $08              ; B0 08 | Branch if carry set
    CPX $34              ; E4 34 | Compare X register (zero page)
    DEC $7AE2,X          ; DE E2 7A | Decrement (absolute,X)
    CPX $EE35            ; EC 35 EE | Compare X register (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    LDA $B8A2F2          ; AF F2 A2 B8 | Read graphics status
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    JMP ($E838)          ; 6C 38 E8 | Jump to address (absolute indirect)
    BMI $78              ; 30 78 | Branch if negative
    BVS $D0              ; 70 D0 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $80              ; F0 80 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    ROL $180D,X          ; 3E 0D 18 | Rotate left (absolute,X)
    ORA $2610            ; 0D 10 26 | Logical OR with accumulator (absolute)
    BIT $477B            ; 2C 7B 47 | Test bits in accumulator (absolute)
    LSR $37AC,X          ; 5E AC 37 | Logical shift right (absolute,X)
    LDY $0077            ; AC 77 00 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_11F
; Address: $DFA314
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_11F:
    JSL $014800          ; 22 00 48 01 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    LDY $7C00            ; AC 00 7C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_120
; Address: $DFA322
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_120:
    EOR ($19,X)          ; 41 19 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ROL $361C            ; 2E 1C 36 | Rotate left (absolute)
    ASL $0B0E,X          ; 1E 0E 0B | Arithmetic shift left (absolute,X)
    ROL $3800,X          ; 3E 00 38 | Rotate left (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    BCS $18              ; B0 18 | Branch if carry set
    BCS $08              ; B0 08 | Branch if carry set
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX $7E              ; E4 7E | Compare X register (zero page)
    NOP                  ; EA | No operation
    AND $00E4,X          ; 3D E4 00 | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    AND $3200,Y          ; 39 00 32 | Logical AND with accumulator (absolute,Y)
    LDA #$F6             ; A9 F6 | Read graphics status
    BIT #$96             ; 89 96 | Test bits in accumulator (immediate)
    ROL $1C18,X          ; 3E 18 1C | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    JMP ($F838)          ; 6C 38 F8 | Jump to address (absolute indirect)
    BCS $78              ; B0 78 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_121
; Address: $DFA36D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_121:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $B0              ; 80 B0 | Branch always
    LDY #$30             ; A0 30 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1D08            ; 0E 08 1D | Arithmetic shift left (absolute)
    BPL $1F              ; 10 1F | Branch if positive
    ROL $3C03,X          ; 3E 03 3C | Rotate left (absolute,X)
    ROL $0006,X          ; 3E 06 00 | Rotate left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    JMP $275F20          ; 5C 20 5F 27 | Jump to address long
    ASL $130E,X          ; 1E 0E 13 | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_123
; Address: $DFA3E6
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_123:
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_125
; Address: $DFA3F8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_125:
    RTI                  ; 40 | Return from interrupt
    BVS $20              ; 70 20 | Branch if overflow set
    BVS $20              ; 70 20 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_126
; Address: $DFA404
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_126:
    PEA #$F808           ; F4 08 F8 | Push effective address to stack
    PEA #$7C28           ; F4 28 7C | Push effective address to stack
    CPY #$3C             ; C0 3C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_128
; Address: $DFA411
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_128:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$DD             ; E0 DD | Compare X register (immediate)
    DEC $3D              ; C6 3D | Decrement (zero page)
    PLX                  ; FA | Pull X register from stack
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BNE $F8              ; D0 F8 | Branch if not equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_129
; Address: $DFA433
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_129:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BPL $1F              ; 10 1F | Branch if positive
    ROL $3C03,X          ; 3E 03 3C | Rotate left (absolute,X)
    LSR $0006,X          ; 5E 06 00 | Logical shift right (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    EOR ($16,X)          ; 41 16 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_12A
; Address: $DFA45E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_12A:
    JSR $FC07            ; 20 07 FC | Jump to subroutine
    PEA #$F808           ; F4 08 F8 | Push effective address to stack
    PEA #$7C28           ; F4 28 7C | Push effective address to stack
    CPY #$3C             ; C0 3C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_12C
; Address: $DFA471
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_12C:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BRA $68              ; 80 68 | Branch always
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_12D
; Address: $DFA489
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_12D:
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    AND $0D00,X          ; 3D 00 0D | Logical AND with accumulator (absolute,X)
    ORA #$39             ; 09 39 | Logical OR with accumulator (immediate)
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    ORA #$24             ; 09 24 | Logical OR with accumulator (immediate)
    ASL $69              ; 06 69 | Arithmetic shift left (zero page)
    ASL $2A              ; 06 2A | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    BNE $08              ; D0 08 | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    CPX $EC30            ; EC 30 EC | Compare X register (absolute)
    BMI $E8              ; 30 E8 | Branch if negative
    BVC $28              ; 50 28 | Branch if overflow clear
    BEQ $08              ; F0 08 | Branch if equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$40             ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_12E
; Address: $DFA516
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_12E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCS $40              ; B0 40 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    BRA $D8              ; 80 D8 | Branch always
    BNE $28              ; D0 28 | Branch if not equal
    BPL $B0              ; 10 B0 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_130
; Address: $DFA52C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_130:
    BEQ $C0              ; F0 C0 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_131
; Address: $DFA536
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_131:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BVS $7F              ; 70 7F | Branch if overflow set
    ORA $1D              ; 05 1D | Logical OR with accumulator (zero page)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    CPX $EC30            ; EC 30 EC | Compare X register (absolute)
    BMI $E8              ; 30 E8 | Branch if negative
    BVC $28              ; 50 28 | Branch if overflow clear
    BEQ $08              ; F0 08 | Branch if equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_132
; Address: $DFA576
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_132:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_133
; Address: $DFA57E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_133:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    BRA $B0              ; 80 B0 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_134
; Address: $DFA587
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_134:
    JSR $0090            ; 20 90 00 | Jump to subroutine
    BNE $80              ; D0 80 | Branch if not equal
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $60              ; 10 60 | Branch if positive
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_135
; Address: $DFA596
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_135:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $0E08            ; 0E 08 0E | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROL $3E01,X          ; 3E 01 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_136
; Address: $DFA5C4
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_136:
    ROL $1A05,X          ; 3E 05 1A | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    LDY $5E48,X          ; BC 48 5E | Load from absolute,X into Y register
    ASL $1F0C,X          ; 1E 0C 1F | Arithmetic shift left (absolute,X)
    ORA $040D            ; 0D 0D 04 | Logical OR with accumulator (absolute)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_137
; Address: $DFA60B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_137:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BRA $7C              ; 80 7C | Branch always
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    LDY #$58             ; A0 58 | Load immediate value into Y register
    BEQ $14              ; F0 14 | Branch if equal
    INX                  ; E8 | Increment X register
    BIT $34C0            ; 2C C0 34 | Test bits in accumulator (absolute)
    BMI $3C              ; 30 3C | Branch if negative
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    PLY                  ; 7A | Pull Y register from stack
    BMI $78              ; 30 78 | Branch if negative
    BMI $D8              ; 30 D8 | Branch if negative
    BPL $50              ; 10 50 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_139
; Address: $DFA653
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_139:
    JSR $F000            ; 20 00 F0 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    BNE $A0              ; D0 A0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_13A
; Address: $DFA65D
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_13A:
    JSR $8080            ; 20 80 80 | Jump to subroutine
    ROL $3E01,X          ; 3E 01 3E | Rotate left (absolute,X)
    ROL $1A05,X          ; 3E 05 1A | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BIT $3C0C            ; 2C 0C 3C | Test bits in accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BRA $7C              ; 80 7C | Branch always
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    LDY #$58             ; A0 58 | Load immediate value into Y register
    BEQ $14              ; F0 14 | Branch if equal
    INX                  ; E8 | Increment X register
    BNE $3E              ; D0 3E | Branch if not equal
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $80              ; 10 80 | Branch if positive
    INX                  ; E8 | Increment X register
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_13C
; Address: $DFA6AD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_13C:
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_13D
; Address: $DFA6B3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_13D:
    ROR $60              ; 66 60 | Rotate right (zero page)
    ADC ($43),Y          ; 71 43 | Add with carry ((zero page),Y)
    BIT $0F              ; 24 0F | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $1D01,X          ; 1E 01 1D | Arithmetic shift left (absolute,X)
    JMP ($5C57)          ; 6C 57 5C | Jump to address (absolute indirect)
    ASL $4EEB,X          ; 1E EB 4E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_13E
; Address: $DFA6D2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_13E:
    JSR $4005            ; 20 05 40 | Jump to subroutine
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_13F
; Address: $DFA6E4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_13F:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    BPL $0E              ; 10 0E | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $0F1E,X          ; 1E 1E 0F | Arithmetic shift left (absolute,X)
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_141
; Address: $DFA704
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_141:
    BEQ $06              ; F0 06 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_144
; Address: $DFA712
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_144:
    ASL $66              ; 06 66 | Arithmetic shift left (zero page)
    ASL $8E              ; 06 8E | Arithmetic shift left (zero page)
    JMP ($7064)          ; 6C 64 70 | Jump to address (absolute indirect)
    BPL $70              ; 10 70 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $B8              ; 80 B8 | Branch always
    JMP $3EF8            ; 4C F8 3E | Jump to address
    CPY $36              ; C4 36 | Compare Y register (zero page)
    CPY $D57A            ; CC 7A D5 | Compare Y register (absolute)
    SBC #$62             ; E9 62 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_145
; Address: $DFA731
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_145:
    JSR $8004            ; 20 04 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $E606,X          ; 1D 06 E6 | Logical OR with accumulator (absolute,X)
    BPL $04              ; 10 04 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    BVS $F8              ; 70 F8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_146
; Address: $DFA74D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_146:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_147
; Address: $DFA75C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_147:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    ASL $1D01,X          ; 1E 01 1D | Arithmetic shift left (absolute,X)
    JMP ($5E33)          ; 6C 33 5E | Jump to address (absolute indirect)
    PLB                  ; AB | Pull data bank register from stack
    ROL $4797            ; 2E 97 47 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_149
; Address: $DFA778
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_149:
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    BVC $00              ; 50 00 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $B8              ; 80 B8 | Branch always
    JMP $36F4            ; 4C F4 36 | Jump to address
    NOP                  ; EA | No operation
    DEC                  ; 3A | Decrement accumulator
    CMP $D778            ; CD 78 D7 | Compare accumulator (absolute)
    SEP #$60             ; E2 60 | Set processor status bits

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_14A
; Address: $DFA791
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_14A:
    JSR $8004            ; 20 04 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROL $3C01,X          ; 3E 01 3C | Rotate left (absolute,X)
    AND $0002,X          ; 3D 02 00 | Logical AND with accumulator (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    AND #$11             ; 29 11 | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ASL $1F66            ; 0E 66 1F | Arithmetic shift left (absolute)
    ORA $1B6F,X          ; 1D 6F 1B | Logical OR with accumulator (absolute,X)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    BPL $06              ; 10 06 | Branch if positive
    BPL $01              ; 10 01 | Branch if positive
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_14B
; Address: $DFA7E6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_14B:
    JSL $152A1D          ; 22 1D 2A 15 | Jump to subroutine long
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    ORA $1D1D,X          ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
    ORA $090B,X          ; 1D 0B 09 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_14D
; Address: $DFA806
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_14D:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    LDY #$54             ; A0 54 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    BMI $E4              ; 30 E4 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_14E
; Address: $DFA80F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_14E:
    BMI $C6              ; 30 C6 | Branch if negative
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $DC02            ; CE 02 DC | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    LDY #$58             ; A0 58 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BCC $08              ; 90 08 | Branch if carry clear
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    BMI $FC              ; 30 FC | Branch if negative
    INY                  ; C8 | Increment Y register
    ASL $8AF4            ; 0E F4 8A | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_14F
; Address: $DFA83F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_14F:
    JSR $C45E            ; 20 5E C4 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BIT $1C              ; 24 1C | Test bits in accumulator (zero page)
    PEA #$34DC           ; F4 DC 34 | Push effective address to stack
    JMP ($049C)          ; 6C 9C 04 | Jump to address (absolute indirect)
    CPX #$EC             ; E0 EC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_150
; Address: $DFA850
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_150:
    JSR $F800            ; 20 00 F8 | Jump to subroutine
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $3F              ; 70 3F | Branch if overflow set
    AND #$11             ; 29 11 | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ASL $1F76            ; 0E 76 1F | Arithmetic shift left (absolute)
    ASL $0D67,X          ; 1E 67 0D | Arithmetic shift left (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BPL $06              ; 10 06 | Branch if positive
    BPL $01              ; 10 01 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ASL $0F10            ; 0E 10 0F | Arithmetic shift left (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0F0E            ; 0E 0E 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_151
; Address: $DFA8A0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_151:
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BCC $08              ; 90 08 | Branch if carry clear
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BEQ $88              ; F0 88 | Branch if equal
    BVC $08              ; 50 08 | Branch if overflow clear
    BPL $20              ; 10 20 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_152
; Address: $DFA8BF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_152:
    JSR $8058            ; 20 58 80 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    LDY $1C44,X          ; BC 44 1C | Load from absolute,X into Y register
    PEA #$749C           ; F4 9C 74 | Push effective address to stack
    LDY $3C5C            ; AC 5C 3C | Load from absolute address into Y register
    BRA $58              ; 80 58 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_153
; Address: $DFA8D0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_153:
    JSR $3800            ; 20 00 38 | Jump to subroutine
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX #$DC             ; E0 DC | Compare X register (immediate)
    BNE $C0              ; D0 C0 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $02              ; 80 02 | Branch always
    ORA #$64             ; 09 64 | Logical OR with accumulator (immediate)
    ORA $0860,Y          ; 19 60 08 | Logical OR with accumulator (absolute,Y)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    STZ $66              ; 64 66 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_154
; Address: $DFA8F7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_154:
    ROR $41              ; 66 41 | Rotate right (zero page)
    EOR $32              ; 45 32 | Exclusive OR with accumulator (zero page)
    ASL $0818            ; 0E 18 08 | Arithmetic shift left (absolute)
    ROL $180D,X          ; 3E 0D 18 | Rotate left (absolute,X)
    ASL $3418            ; 0E 18 34 | Arithmetic shift left (absolute)
    ROL $316D            ; 2E 6D 31 | Rotate left (absolute)
    LSR $2BA9,X          ; 5E A9 2B | Logical shift right (absolute,X)
    ADC $00              ; 65 00 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_155
; Address: $DFA912
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_155:
    JSR $4201            ; 20 01 42 | Hardware register operation
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    BVC $04              ; 50 04 | Branch if overflow clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_156
; Address: $DFA922
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_156:
    ROR $19              ; 66 19 | Rotate right (zero page)
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_157
; Address: $DFA93B
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_157:
    ASL $0C04            ; 0E 04 0C | Arithmetic shift left (absolute)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BCC $26              ; 90 26 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BRA $10              ; 80 10 | Branch always
    LDY #$94             ; A0 94 | Load immediate value into Y register
    BEQ $6C              ; F0 6C | Branch if equal
    BNE $30              ; D0 30 | Branch if not equal
    BMI $30              ; 30 30 | Branch if negative
    BMI $26              ; 30 26 | Branch if negative
    ROR $06              ; 66 06 | Rotate right (zero page)
    ROR $82              ; 66 82 | Rotate right (zero page)
    JMP ($4CA2)          ; 6C A2 4C | Jump to address (absolute indirect)
    BVS $18              ; 70 18 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    BCS $18              ; B0 18 | Branch if carry set
    BVS $18              ; 70 18 | Branch if overflow set
    BIT $4E2C            ; 2C 2C 4E | Test bits in accumulator (absolute)
    PLY                  ; 7A | Pull Y register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    STA $9578            ; 8D 78 95 | Update graphics data
    LDX #$00             ; A2 00 | Load immediate value into X register
    BRA $42              ; 80 42 | Hardware register operation
    BRA $91              ; 80 91 | Branch always
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_158
; Address: $DFA97D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_158:
    JSR $0058            ; 20 58 00 | Jump to subroutine
    STZ $98              ; 64 98 | Store zero to zero page
    STY $78              ; 84 78 | Store Y register to zero page
    CPY $5C70            ; CC 70 5C | Compare Y register (absolute)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BNE $08              ; D0 08 | Branch if not equal
    BEQ $D0              ; F0 D0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_159
; Address: $DFA9AD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_159:
    CLC                  ; 18 | Clear carry flag
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_15B
; Address: $DFA9C5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_15B:
    JSR $106F            ; 20 6F 10 | Jump to subroutine
    ROR $03              ; 66 03 | Rotate right (zero page)
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    BCS $60              ; B0 60 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $18              ; 10 18 | Branch if positive
    ROL $3E              ; 26 3E | Rotate left (zero page)
    ORA $7019,Y          ; 19 19 70 | Logical OR with accumulator (absolute,Y)
    BMI $27              ; 30 27 | Branch if negative
    ORA $0904,Y          ; 19 04 09 | Logical OR with accumulator (absolute,Y)
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ROR $00              ; 66 00 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_15E
; Address: $DFAA0B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_15E:
    JSR $18E4            ; 20 E4 18 | Jump to subroutine
    STY $78              ; 84 78 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_15F
; Address: $DFAA16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_15F:
    JSR $4070            ; 20 70 40 | Jump to subroutine
    BVS $20              ; 70 20 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_160
; Address: $DFAA1F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_160:
    JSR $609C            ; 20 9C 60 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    ROR $C0              ; 66 C0 | Rotate right (zero page)
    DEC $02C8            ; CE C8 02 | Decrement (absolute)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BNE $E0              ; D0 E0 | Game work RAM access
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_161
; Address: $DFAA41
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_161:
    ROR $7D              ; 66 7D | Rotate right (zero page)
    LSR $F6              ; 46 F6 | Logical shift right (zero page)
    BMI $D0              ; 30 D0 | Branch if negative
    BNE $9A              ; D0 9A | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_162
; Address: $DFAA4B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_162:
    DEY                  ; 88 | Decrement Y register
    STY $00              ; 84 00 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    BRA $90              ; 80 90 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    BMI $EE              ; 30 EE | Branch if negative
    CPY #$64             ; C0 64 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ROR $7801,X          ; 7E 01 78 | Rotate right (absolute,X)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_163
; Address: $DFAA7F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_163:
    JSR $0E79            ; 20 79 0E | Jump to subroutine
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $2A              ; 25 2A | Logical AND with accumulator (zero page)
    ADC $6201,X          ; 7D 01 62 | Add with carry (absolute,X)
    ADC $00              ; 65 00 | Add with carry (zero page)
    EOR $0E06            ; 4D 06 0E | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_164
; Address: $DFAA95
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_164:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    ORA $1A00            ; 0D 00 1A | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $14              ; 06 14 | Arithmetic shift left (zero page)
    BPL $22              ; 10 22 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_165
; Address: $DFAAA7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_165:
    JSL $CC66E6          ; 22 E6 66 CC | Jump to subroutine long
    JMP $004F            ; 4C 4F 00 | Jump to address
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_166
; Address: $DFAAB6
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_166:
    EOR $1900,X          ; 5D 00 19 | Exclusive OR with accumulator (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    ORA $0002            ; 0D 02 00 | Logical OR with accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $FC              ; 80 FC | Branch always
    BPL $14              ; 10 14 | Branch if positive
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_167
; Address: $DFAAE1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_167:
    BEQ $08              ; F0 08 | Branch if equal
    BNE $38              ; D0 38 | Branch if not equal
    BNE $08              ; D0 08 | Branch if not equal
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_168
; Address: $DFAAF2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_168:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_169
; Address: $DFAAFF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_169:
    BMI $C8              ; 30 C8 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BCC $00              ; 90 00 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    BPL $68              ; 10 68 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_16A
; Address: $DFAB08
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_16A:
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    JMP ($5848)          ; 6C 48 58 | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_16B
; Address: $DFAB10
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_16B:
    JSR $6010            ; 20 10 60 | Jump to subroutine
    BCC $18              ; 90 18 | Branch if carry clear
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    LDY #$18             ; A0 18 | Load immediate value into Y register
    ADC $7F0E,Y          ; 79 0E 7F | Add with carry (absolute,Y)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND $2A              ; 25 2A | Logical AND with accumulator (zero page)
    ADC $6201,X          ; 7D 01 62 | Add with carry (absolute,X)
    ADC $2300            ; 6D 00 23 | Add with carry (absolute)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_16C
; Address: $DFAB35
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_16C:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    ORA $1200            ; 0D 00 12 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $120C            ; 0E 0C 12 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $A311,X          ; 1D 11 A3 | Logical OR with accumulator (absolute,X)
    LDX $26              ; A6 26 | Load from zero page into X register
    AND $1102,X          ; 3D 02 11 | Logical AND with accumulator (absolute,X)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_16D
; Address: $DFAB58
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_16D:
    JMP $005900          ; 5C 00 59 00 | Jump to address long
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_16E
; Address: $DFAB62
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_16E:
    BPL $00              ; 10 00 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    BPL $68              ; 10 68 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_170
; Address: $DFAB6D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_170:
    JSR $4030            ; 20 30 40 | Jump to subroutine
    LDY #$10             ; A0 10 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $18              ; 10 18 | Branch if positive
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $1E21,Y          ; 19 21 1E | Logical OR with accumulator (absolute,Y)
    AND $0006,Y          ; 39 06 00 | Logical AND with accumulator (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    ORA $2D52            ; 0D 52 2D | Logical OR with accumulator (absolute)
    BVS $0E              ; 70 0E | Branch if overflow set
    JMP $1407            ; 4C 07 14 | Jump to address
    BPL $C8              ; 10 C8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_171
; Address: $DFABB5
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_171:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    ADC #$02             ; 69 02 | Add with carry (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($A6,X)          ; 01 A6 | Logical OR with accumulator ((zero page,X))
    LSR $5D              ; 46 5D | Logical shift right (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    BMI $53              ; 30 53 | Branch if negative
    ORA ($27),Y          ; 11 27 | Logical OR with accumulator ((zero page),Y)
    ORA $1804,Y          ; 19 04 18 | Logical OR with accumulator (absolute,Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))
    ROR $03              ; 66 03 | Rotate right (zero page)
    AND $1803            ; 2D 03 18 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_172
; Address: $DFABDD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_172:
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    CPX $98              ; E4 98 | Compare X register (zero page)
    STY $78              ; 84 78 | Store Y register to zero page
    STZ $0060            ; 9C 60 00 | Store zero to absolute
    CPY #$E0             ; C0 E0 | Game work RAM access
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_174
; Address: $DFABFD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_174:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    BCS $4A              ; B0 4A | Branch if carry set
    ASL $32F0            ; 0E F0 32 | Arithmetic shift left (absolute)
    CPX #$34             ; E0 34 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND $22              ; 25 22 | Logical AND with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    TXA                  ; 8A | Transfer X register to accumulator
    RTI                  ; 40 | Return from interrupt
    CPY #$58             ; C0 58 | Compare Y register (immediate)
    BRA $6D              ; 80 6D | Branch always
    ROR $B2              ; 66 B2 | Rotate right (zero page)
    STY $F2              ; 84 F2 | Store Y register to zero page
    BIT $505C            ; 2C 5C 50 | Test bits in accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CPX $7000            ; EC 00 70 | Compare X register (absolute)
    BRA $10              ; 80 10 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_175
; Address: $DFAC34
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_175:
    JSR $6220            ; 20 20 62 | Jump to subroutine
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CPY #$34             ; C0 34 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    ORA $2D52            ; 0D 52 2D | Logical OR with accumulator (absolute)
    BVS $0E              ; 70 0E | Branch if overflow set
    JMP $2C07            ; 4C 07 2C | Jump to address

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_176
; Address: $DFAC4B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_176:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    LDY $44              ; A4 44 | Load from zero page into Y register
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_178
; Address: $DFAC5A
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_178:
    EOR ($02),Y          ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
    JMP ($1A03)          ; 6C 03 1A | Jump to address (absolute indirect)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    BCS $4A              ; B0 4A | Branch if carry set
    ASL $32F0            ; 0E F0 32 | Arithmetic shift left (absolute)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND #$26             ; 29 26 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BIT $50C0            ; 2C C0 50 | Test bits in accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $083F            ; 0E 3F 08 | Arithmetic shift left (absolute)
    ROL $1511            ; 2E 11 15 | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $1F04,X          ; 1D 04 1F | Logical OR with accumulator (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $3300            ; 2E 00 33 | Rotate left (absolute)
    WDM #$2D             ; 42 2D | Reserved instruction
    EOR $3F33,X          ; 5D 33 3F | Exclusive OR with accumulator (absolute,X)
    ORA $0212            ; 0D 12 02 | Logical OR with accumulator (absolute)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    LSR $1F00            ; 4E 00 1F | Logical shift right (absolute)
    ASL $1201            ; 0E 01 12 | Arithmetic shift left (absolute)
    ORA $020D            ; 0D 0D 02 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_179
; Address: $DFACEA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_179:
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_17A
; Address: $DFACEF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_17A:
    JSR $8080            ; 20 80 80 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BVS $20              ; 70 20 | Branch if overflow set
    BVS $FC              ; 70 FC | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_17B
; Address: $DFAD01
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_17B:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    PEA #$7400           ; F4 00 74 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    LDY #$50             ; A0 50 | Load immediate value into Y register
    PEA #$E53C           ; F4 3C E5 | Push effective address to stack
    ASL $3020,X          ; 1E 20 30 | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_17C
; Address: $DFAD15
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_17C:
    JSR $4800            ; 20 00 48 | Jump to subroutine
    BRA $0C              ; 80 0C | Branch always
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    CMP ($32,X)          ; C1 32 | Compare accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $F0              ; 10 F0 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    BEQ $E8              ; F0 E8 | Branch if equal
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BRA $7C              ; 80 7C | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $08              ; 80 08 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ROL $0511            ; 2E 11 05 | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ORA $1F04,X          ; 1D 04 1F | Logical OR with accumulator (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    JMP $0E00            ; 4C 00 0E | Jump to address

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_17E
; Address: $DFAD69
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_17E:
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BMI $E0              ; 30 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_180
; Address: $DFAD75
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_180:
    JSR $4800            ; 20 00 48 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_181
; Address: $DFAD81
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_181:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_183
; Address: $DFAD93
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_183:
    JSR $2040            ; 20 40 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BPL $01              ; 10 01 | Branch if positive
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    AND $0D00,X          ; 3D 00 0D | Logical AND with accumulator (absolute,X)
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0500,Y          ; 19 00 05 | Logical OR with accumulator (absolute,Y)
    AND $12              ; 25 12 | Logical AND with accumulator (zero page)
    ORA $0101,Y          ; 19 01 01 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_184
; Address: $DFADD0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_184:
    JSR $0300            ; 20 00 03 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $C0              ; 80 C0 | Branch always
    BPL $B0              ; 10 B0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    BPL $EC              ; 10 EC | Branch if positive
    BMI $EC              ; 30 EC | Branch if negative
    BMI $E8              ; 30 E8 | Branch if negative
    BVC $28              ; 50 28 | Branch if overflow clear
    BEQ $08              ; F0 08 | Branch if equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$40             ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_186
; Address: $DFAE18
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_186:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BCS $00              ; B0 00 | Branch if carry set
    BEQ $70              ; F0 70 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BVC $80              ; 50 80 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $D8              ; 10 D8 | Branch if positive
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_187
; Address: $DFAE3D
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_187:
    JSR $2040            ; 20 40 20 | Jump to subroutine
    AND $0D00,X          ; 3D 00 0D | Logical AND with accumulator (absolute,X)
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    ORA $39              ; 05 39 | Logical OR with accumulator (zero page)
    ASL $1700            ; 0E 00 17 | Arithmetic shift left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $16              ; 30 16 | Branch if negative
    ORA $0603,Y          ; 19 03 06 | Logical OR with accumulator (absolute,Y)
    ORA $180F,Y          ; 19 0F 18 | Logical OR with accumulator (absolute,Y)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA $1900,Y          ; 19 00 19 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $EC              ; 10 EC | Branch if positive
    BMI $EC              ; 30 EC | Branch if negative
    BMI $E8              ; 30 E8 | Branch if negative
    BVC $28              ; 50 28 | Branch if overflow clear
    BEQ $08              ; F0 08 | Branch if equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_188
; Address: $DFAE98
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_188:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $70              ; F0 70 | Branch if equal
    BVC $70              ; 50 70 | Branch if overflow clear
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_18A
; Address: $DFAEA7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_18A:
    BRA $90              ; 80 90 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BRA $70              ; 80 70 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BVC $80              ; 50 80 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_18B
; Address: $DFAEB7
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_18B:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $0E08            ; 0E 08 0E | Arithmetic shift left (absolute)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ROL $1A05,X          ; 3E 05 1A | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $0300            ; 0E 00 03 | Arithmetic shift left (absolute)
    ASL $001A            ; 0E 1A 00 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    AND $3200            ; 2D 00 32 | Logical AND with accumulator (absolute)
    LSR $4933            ; 4E 33 49 | Logical shift right (absolute)
    ROL $0A0E,X          ; 3E 0E 0A | Rotate left (absolute,X)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_18C
; Address: $DFAF32
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_18C:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BVS $FC              ; 70 FC | Branch if overflow set
    BRA $7C              ; 80 7C | Branch always
    BRA $7C              ; 80 7C | Branch always
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    LDY #$58             ; A0 58 | Load immediate value into Y register
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    CPY $5E69            ; CC 69 5E | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    EOR $7EF6,X          ; 5D F6 7E | Exclusive OR with accumulator (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVC $30              ; 50 30 | Branch if overflow clear
    BEQ $70              ; F0 70 | Branch if equal
    INX                  ; E8 | Increment X register
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BRA $78              ; 80 78 | Branch always
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ROL $1A05,X          ; 3E 05 1A | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $3320            ; 0E 20 33 | Arithmetic shift left (absolute)
    PLY                  ; 7A | Pull Y register from stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $01              ; 30 01 | Branch if negative
    JMP $1D00            ; 4C 00 1D | Jump to address
    BRA $7C              ; 80 7C | Branch always
    BRA $7C              ; 80 7C | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_18D
; Address: $DFAFA5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_18D:
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    LDY #$58             ; A0 58 | Load immediate value into Y register
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    STZ $03              ; 64 03 | Store zero to zero page
    ORA $000F,Y          ; 19 0F 00 | Logical OR with accumulator (absolute,Y)
    ASL $6D0C            ; 0E 0C 6D | Arithmetic shift left (absolute)
    ROR $78              ; 66 78 | Rotate right (zero page)
    STZ $48              ; 64 48 | Store zero to zero page
    BMI $40              ; 30 40 | Branch if negative
    BMI $20              ; 30 20 | Branch if negative
    BPL $13              ; 10 13 | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_18E
; Address: $DFAFF4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_18E:
    JSR $0407            ; 20 07 04 | Jump to subroutine
    DEC $AC00,X          ; DE 00 AC | Decrement (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    PHB                  ; 8B | Push data bank register to stack
    BMI $4C              ; 30 4C | Branch if negative
    BMI $35              ; 30 35 | Branch if negative
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ORA $0949            ; 0D 49 09 | Logical OR with accumulator (absolute)
    BPL $3D              ; 10 3D | Branch if positive
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    STY $D284            ; 8C 84 D2 | Store Y register to absolute address
    CPY #$35             ; C0 35 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_18F
; Address: $DFB02F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_18F:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $D6              ; F0 D6 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_190
; Address: $DFB039
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_190:
    JSR $0073            ; 20 73 00 | Jump to subroutine
    AND $C800            ; 2D 00 C8 | Logical AND with accumulator (absolute)
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    LDX $AE80,Y          ; BE 80 AE | Load from absolute,Y into X register
    LDY $AF              ; A4 AF | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_191
; Address: $DFB047
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_191:
    LDY $3F              ; A4 3F | Load from zero page into Y register
    INC                  ; 1A | Increment accumulator
    STX $FC88            ; 8E 88 FC | Store X register to absolute address
    BMI $00              ; 30 00 | Branch if negative
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($04),Y          ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
    BVC $04              ; 50 04 | Branch if overflow clear
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    STY $18              ; 84 18 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_192
; Address: $DFB074
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_192:
    JSR $4407            ; 20 07 44 | Jump to subroutine
    INC $D400            ; EE 00 D4 | Increment (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    EOR $5119,Y          ; 59 19 51 | Exclusive OR with accumulator (absolute,Y)
    ORA ($73),Y          ; 11 73 | Logical OR with accumulator ((zero page),Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ROL $0C00            ; 2E 00 0C | Rotate left (absolute)
    INY                  ; C8 | Increment Y register
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    DEX                  ; CA | Decrement X register
    REP #$32             ; C2 32 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_193
; Address: $DFB0AF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_193:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $D6              ; F0 D6 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_194
; Address: $DFB0B9
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_194:
    JSR $007F            ; 20 7F 00 | Jump to subroutine
    CMP $D500            ; CD 00 D5 | Compare accumulator (absolute)
    LDA $AE86,Y          ; B9 86 AE | Read graphics status
    LDY #$BE             ; A0 BE | Load immediate value into Y register
    STA                  ; 9F 94 1F 14 | Update graphics data
    NOP                  ; EA | No operation
    LDY $28E0,X          ; BC E0 28 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_195
; Address: $DFB0DA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_195:
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BPL $04              ; 10 04 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_196
; Address: $DFB0FA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_196:
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $0B17            ; 0D 17 0B | Logical OR with accumulator (absolute)
    ASL $1E0B,X          ; 1E 0B 1E | Arithmetic shift left (absolute,X)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_197
; Address: $DFB10F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_197:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BVS $16              ; 70 16 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    STA ($12),Y          ; 91 12 | Update graphics data
    LDA ($36),Y          ; B1 36 | Read graphics status

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_199
; Address: $DFB12D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_199:
    JSL $68037E          ; 22 7E 03 68 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $02              ; 30 02 | Branch if negative
    INY                  ; C8 | Increment Y register
    CPX #$02             ; E0 02 | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_19A
; Address: $DFB149
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_19A:
    JSR $ACAC            ; 20 AC AC | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $CE              ; C6 CE | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_19B
; Address: $DFB156
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_19B:
    JSR $00DC            ; 20 DC 00 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    LDY $FC58            ; AC 58 FC | Load from absolute address into Y register
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $F880            ; EC 80 F8 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    BRA $A4              ; 80 A4 | Branch always
    PEA #$0480           ; F4 80 04 | Push effective address to stack
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_19C
; Address: $DFB179
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_19C:
    BMI $00              ; 30 00 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $88              ; 80 88 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BVC $48              ; 50 48 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_19D
; Address: $DFB184
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_19D:
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $F8              ; 10 F8 | Branch if positive
    BNE $80              ; D0 80 | Branch if not equal
    INX                  ; E8 | Increment X register
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_19E
; Address: $DFB18D
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_19E:
    JSR $8070            ; 20 70 80 | Jump to subroutine
    BEQ $8C              ; F0 8C | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BCC $78              ; 90 78 | Branch if carry clear
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ORA $0B17            ; 0D 17 0B | Logical OR with accumulator (absolute)
    ASL $1B0B,X          ; 1E 0B 1B | Arithmetic shift left (absolute,X)
    ORA $0001            ; 0D 01 00 | Logical OR with accumulator (absolute)
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    JMP ($FC1D)          ; 6C 1D FC | Jump to address (absolute indirect)
    BMI $30              ; 30 30 | Branch if negative
    LDY #$21             ; A0 21 | PPU graphics register access
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ORA $110C            ; 0D 0C 11 | Logical OR with accumulator (absolute)
    BPL $8F              ; 10 8F | Branch if positive
    ADC $CE0E,Y          ; 79 0E CE | Add with carry (absolute,Y)
    ORA ($5E,X)          ; 01 5E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    INC $7000            ; EE 00 70 | Increment (absolute)
    ASL $C8C8            ; 0E C8 C8 | Arithmetic shift left (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $F880            ; EC 80 F8 | Compare X register (absolute)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY $80              ; C4 80 | Compare Y register (zero page)
    STZ $80              ; 64 80 | Store zero to zero page
    PEA #$0420           ; F4 20 04 | Push effective address to stack
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_19F
; Address: $DFB1F9
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_19F:
    BMI $00              ; 30 00 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A0
; Address: $DFB1FE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A0:
    JSR $5828            ; 20 28 58 | Jump to subroutine
    BCC $48              ; 90 48 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    BPL $78              ; 10 78 | Branch if positive
    BRA $50              ; 80 50 | Branch always
    BRA $E8              ; 80 E8 | Branch always
    BRA $F8              ; 80 F8 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A1
; Address: $DFB20D
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A1:
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BMI $0C              ; 30 0C | Branch if negative
    SEC                  ; 38 | Set carry flag
    BPL $38              ; 10 38 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BCS $00              ; B0 00 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    BCC $00              ; 90 00 | Branch if carry clear
    STZ $01              ; 64 01 | Store zero to zero page
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA $0F0F            ; 0D 0F 0F | Logical OR with accumulator (absolute)
    ASL $6D0C            ; 0E 0C 6D | Arithmetic shift left (absolute)
    ROR $78              ; 66 78 | Rotate right (zero page)
    ROR $49              ; 66 49 | Rotate right (zero page)
    EOR $32              ; 45 32 | Exclusive OR with accumulator (zero page)
    ROL $1918            ; 2E 18 19 | Rotate left (absolute)
    ORA $0312,Y          ; 19 12 03 | Logical OR with accumulator (absolute,Y)
    ROL $381D,X          ; 3E 1D 38 | Rotate left (absolute,X)
    ASL $0878,X          ; 1E 78 08 | Arithmetic shift left (absolute,X)
    BEQ $60              ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A2
; Address: $DFB24D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A2:
    JSR $047E            ; 20 7E 04 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ROR $2B80            ; 6E 80 2B | Rotate right (absolute)
    STY $05              ; 84 05 | Store Y register to zero page
    STA $9428,X          ; 9D 28 94 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A4
; Address: $DFB267
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A4:
    JSR $24D6            ; 20 D6 24 | Jump to subroutine
    INC $7A2C,X          ; FE 2C 7A | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    LSR $08              ; 46 08 | Logical shift right (zero page)
    STY $03              ; 84 03 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A5
; Address: $DFB277
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A5:
    JSR $2308            ; 20 08 23 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0A16,X          ; 1E 16 0A | Arithmetic shift left (absolute,X)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A6
; Address: $DFB28F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A6:
    JSR $6018            ; 20 18 60 | Jump to subroutine
    BMI $02              ; 30 02 | Branch if negative
    BRA $41              ; 80 41 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A7
; Address: $DFB299
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A7:
    LDY #$85             ; A0 85 | Load immediate value into Y register
    BVS $06              ; 70 06 | Branch if overflow set
    BNE $28              ; D0 28 | Branch if not equal
    LDY #$B4             ; A0 B4 | Load immediate value into Y register
    BPL $24              ; 10 24 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    CPX $760C            ; EC 0C 76 | Compare X register (absolute)
    BPL $EA              ; 10 EA | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPX #$08             ; E0 08 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A8
; Address: $DFB2B2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A8:
    INC                  ; 1A | Increment accumulator
    CPX #$26             ; E0 26 | Compare X register (immediate)
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    CPX #$19             ; E0 19 | Compare X register (immediate)
    ORA $0312,Y          ; 19 12 03 | Logical OR with accumulator (absolute,Y)
    ROL $781D,X          ; 3E 1D 78 | Rotate left (absolute,X)
    ASL $68F8,X          ; 1E F8 68 | Arithmetic shift left (absolute,X)
    BVC $20              ; 50 20 | Branch if overflow clear
    STZ $1824,X          ; 9E 24 18 | Store zero to absolute,X
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $01              ; 80 01 | Branch always
    ADC $81              ; 65 81 | Add with carry (zero page)
    ROL $0B80            ; 2E 80 0B | Rotate left (absolute)
    EOR $9D              ; 45 9D | Exclusive OR with accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1A9
; Address: $DFB2E5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1A9:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    INC $7A2C,X          ; FE 2C 7A | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BPL $3C              ; 10 3C | Branch if positive
    ASL $88              ; 06 88 | Arithmetic shift left (zero page)
    STY $23              ; 84 23 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1AA
; Address: $DFB2F7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1AA:
    JSR $2300            ; 20 00 23 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BPL $0E              ; 10 0E | Branch if positive
    ASL $2A              ; 06 2A | Arithmetic shift left (zero page)
    ADC ($20),Y          ; 71 20 | Add with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1AB
; Address: $DFB313
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1AB:
    BMI $00              ; 30 00 | Branch if negative
    BRA $47              ; 80 47 | Branch always
    LDY #$81             ; A0 81 | Load immediate value into Y register
    BVS $05              ; 70 05 | Branch if overflow set
    BNE $2E              ; D0 2E | Branch if not equal
    LDY #$B6             ; A0 B6 | Load immediate value into Y register
    BPL $24              ; 10 24 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    ROR $762C            ; 6E 2C 76 | Rotate right (absolute)
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1AC
; Address: $DFB332
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1AC:
    CLC                  ; 18 | Clear carry flag
    CPX #$26             ; E0 26 | Compare X register (immediate)
    CPY #$16             ; C0 16 | Compare Y register (immediate)
    BPL $C0              ; 10 C0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND #$19             ; 29 19 | Logical AND with accumulator (immediate)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    REP #$03             ; C2 03 | Reset processor status bits
    SBC ($C1,X)          ; E1 C1 | Subtract with carry ((zero page,X))
    LDA $40              ; A5 40 | Read graphics status
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1AD
; Address: $DFB357
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1AD:
    JSR $0C30            ; 20 30 0C | Jump to subroutine
    DEC $5A00,X          ; DE 00 5A | Decrement (absolute,X)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    BVC $FA              ; 50 FA | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 40 AB 41 | Read graphics status
    SBC $4E44,X          ; FD 44 4E | Subtract with carry (absolute,X)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LSR $5C00            ; 4E 00 5C | Logical shift right (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $E8              ; B0 E8 | Branch if carry set
    BNE $78              ; D0 78 | Branch if not equal
    BNE $58              ; D0 58 | Branch if not equal
    BRA $B8              ; 80 B8 | Branch always
    BMI $C0              ; 30 C0 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1AE
; Address: $DFB38D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1AE:
    CPY #$A4             ; C0 A4 | Compare Y register (immediate)
    LDY $08              ; A4 08 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1AF
; Address: $DFB398
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1AF:
    JSR $7600            ; 20 00 76 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    CPY #$DB             ; C0 DB | Compare Y register (immediate)
    BRA $19              ; 80 19 | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA $450C            ; 0D 0C 45 | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B0
; Address: $DFB3A8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B0:
    BIT $1820            ; 2C 20 18 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    ROR $E6C0,X          ; 7E C0 E6 | Rotate right (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    DEC                  ; 3A | Decrement accumulator
    CPY #$13             ; C0 13 | Compare Y register (immediate)
    AND #$19             ; 29 19 | Logical AND with accumulator (immediate)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    WDM #$03             ; 42 03 | Reserved instruction
    ADC ($41,X)          ; 61 41 | Add with carry ((zero page,X))
    ADC $00              ; 65 00 | Add with carry (zero page)
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B1
; Address: $DFB3D7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B1:
    JSR $0C30            ; 20 30 0C | Jump to subroutine
    LSR $1A00,X          ; 5E 00 1A | Logical shift right (absolute,X)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    BMI $7A              ; 30 7A | Branch if negative
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B3
; Address: $DFB3ED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B3:
    JSL $0A002F          ; 22 2F 00 0A | Jump to subroutine long
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B4
; Address: $DFB3F7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B4:
    JSR $2E00            ; 20 00 2E | Jump to subroutine
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $E8              ; B0 E8 | Branch if carry set
    BNE $78              ; D0 78 | Branch if not equal
    BNE $58              ; D0 58 | Branch if not equal
    BRA $78              ; 80 78 | Branch always
    BMI $C0              ; 30 C0 | Branch if negative
    CPY #$92             ; C0 92 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B5
; Address: $DFB418
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B5:
    JSR $B600            ; 20 00 B6 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    CPY #$ED             ; C0 ED | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B6
; Address: $DFB41F
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B6:
    BRA $0C              ; 80 0C | Branch always
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    STA ($80),Y          ; 91 80 | Update graphics data
    INC $30C0            ; EE C0 30 | Increment (absolute)
    BMI $88              ; 30 88 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    STZ $F370,X          ; 9E 70 F3 | Store zero to absolute,X
    PLX                  ; FA | Pull X register from stack
    ROR $1000            ; 6E 00 10 | Rotate right (absolute)
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    BVS $03              ; 70 03 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BPL $1F              ; 10 1F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $063B,X          ; 1E 3B 06 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    BPL $17              ; 10 17 | Branch if positive
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ASL $0701,X          ; 1E 01 07 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ROL $31              ; 26 31 | Rotate left (zero page)
    BMI $EB              ; 30 EB | Branch if negative
    ROR                  ; 6A | Rotate right (accumulator)
    PLX                  ; FA | Pull X register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear
    LSR $1400            ; 4E 00 14 | Logical shift right (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $3F              ; 10 3F | Branch if positive
    ROL $1C0E            ; 2E 0E 1C | Rotate left (absolute)
    ASL $0612            ; 0E 12 06 | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPX $18              ; E4 18 | Compare X register (zero page)
    CPY $78              ; C4 78 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B7
; Address: $DFB4B2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B7:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1B9
; Address: $DFB4BA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1B9:
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $E0              ; 80 E0 | Game work RAM access
    BPL $F8              ; 10 F8 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    STY $D40C            ; 8C 0C D4 | Store Y register to absolute address
    LSR $FD5A,X          ; 5E 5A FD | Logical shift right (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BRA $08              ; 80 08 | Branch always
    ROL                  ; 2A | Rotate left (accumulator)
    LDA ($00,X)          ; A1 00 | Read graphics status
    SBC $F6F6,X          ; FD F6 F6 | Subtract with carry (absolute,X)
    CPY #$D4             ; C0 D4 | Compare Y register (immediate)
    BPL $78              ; 10 78 | Branch if positive
    BVS $68              ; 70 68 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1BA
; Address: $DFB4EA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1BA:
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1BB
; Address: $DFB4FA
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1BB:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA $2914,Y          ; 19 14 29 | Logical OR with accumulator (absolute,Y)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1BC
; Address: $DFB550
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1BC:
    JSR $1002            ; 20 02 10 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1BE
; Address: $DFB566
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1BE:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    LDY #$54             ; A0 54 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    BMI $E4              ; 30 E4 | Branch if negative
    BVS $C6              ; 70 C6 | Branch if overflow set
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $DC02            ; CE 02 DC | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    LDY #$58             ; A0 58 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BRA $E8              ; 80 E8 | Branch always
    BCC $08              ; 90 08 | Branch if carry clear
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    INX                  ; E8 | Increment X register
    CPX #$44             ; E0 44 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $20              ; 30 20 | Branch if negative
    BPL $A0              ; 10 A0 | Branch if positive
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    INX                  ; E8 | Increment X register
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BNE $D0              ; D0 D0 | Branch if not equal
    BPL $D0              ; 10 D0 | Branch if positive
    BEQ $A0              ; F0 A0 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1BF
; Address: $DFB5B9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1BF:
    JSR $4010            ; 20 10 40 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C0
; Address: $DFB5CC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C0:
    EOR $1E0D            ; 4D 0D 1E | Exclusive OR with accumulator (absolute)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C1
; Address: $DFB5E0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C1:
    ASL $3F16,X          ; 1E 16 3F | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ROL $2D0F            ; 2E 0F 2D | Rotate left (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C2
; Address: $DFB5F4
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C2:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BPL $01              ; 10 01 | Branch if positive
    BPL $02              ; 10 02 | Branch if positive
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BRA $E8              ; 80 E8 | Branch always
    BCC $08              ; 90 08 | Branch if carry clear
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $20              ; 30 20 | Branch if negative
    BCC $20              ; 90 20 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C3
; Address: $DFB620
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C3:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    BMI $F0              ; 30 F0 | Branch if negative
    BPL $A0              ; 10 A0 | Branch if positive
    LDY #$20             ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C4
; Address: $DFB62B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C4:
    JSR $1058            ; 20 58 10 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    BVC $08              ; 50 08 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $1802,Y          ; 19 02 18 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    ROL $0107,X          ; 3E 07 01 | Rotate left (absolute,X)
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ORA $1D18,Y          ; 19 18 1D | Logical OR with accumulator (absolute,Y)
    ORA $0403            ; 0D 03 04 | Logical OR with accumulator (absolute)
    ASL $0800            ; 0E 00 08 | Arithmetic shift left (absolute)
    DEC                  ; 3A | Decrement accumulator
    ORA $0E00            ; 0D 00 0E | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    AND ($2F),Y          ; 31 2F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C5
; Address: $DFB66B
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C5:
    ROL $1252            ; 2E 52 12 | Rotate left (absolute)
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    PHA                  ; 48 | Push accumulator to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    LDY #$0D             ; A0 0D | Load immediate value into Y register
    ORA $6EBE            ; 0D BE 6E | Logical OR with accumulator (absolute)
    ROR $3F06            ; 6E 06 3F | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    ROL $160E            ; 2E 0E 16 | Rotate left (absolute)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    JMP $7000B0          ; 5C B0 00 70 | Jump to address long
    CLC                  ; 18 | Clear carry flag
    BMI $38              ; 30 38 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($F48C)          ; 6C 8C F4 | Jump to address (absolute indirect)
    BVS $4A              ; 70 4A | Branch if overflow set
    LSR                  ; 4A | Logical shift right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BRA $40              ; 80 40 | Branch always
    BRA $84              ; 80 84 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCS $00              ; B0 00 | Branch if carry set
    BCS $7C              ; B0 7C | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C6
; Address: $DFB6C4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C6:
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BVS $38              ; 70 38 | Branch if overflow set
    BVS $48              ; 70 48 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C7
; Address: $DFB6CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C7:
    BEQ $00              ; F0 00 | Branch if equal
    BRA $04              ; 80 04 | Branch always
    BRA $84              ; 80 84 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C8
; Address: $DFB6D7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C8:
    JSR $2088            ; 20 88 20 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BCC $60              ; 90 60 | Branch if carry clear
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1C9
; Address: $DFB704
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1C9:
    BPL $0F              ; 10 0F | Branch if positive
    ORA $1D30,X          ; 1D 30 1D | Logical OR with accumulator (absolute,X)
    ORA $0E0E,Y          ; 19 0E 0E | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $01              ; 10 01 | Branch if positive
    BPL $01              ; 10 01 | Branch if positive
    BPL $01              ; 10 01 | Branch if positive
    ROL $11              ; 26 11 | Rotate left (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    BCC $F0              ; 90 F0 | Branch if carry clear
    BRA $F0              ; 80 F0 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $4C              ; F0 4C | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1CA
; Address: $DFB74D
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1CA:
    JSR $9080            ; 20 80 90 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BRA $08              ; 80 08 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $E4              ; 80 E4 | Branch always
    DEY                  ; 88 | Decrement Y register
    LDY $5474            ; AC 74 54 | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    ROL                  ; 2A | Rotate left (accumulator)
    PEA #$EA15           ; F4 15 EA | Push effective address to stack
    CPX $FE32            ; EC 32 FE | Compare X register (absolute)
    INY                  ; C8 | Increment Y register
    BIT $0ADC            ; 2C DC 0A | Test bits in accumulator (absolute)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPX $10              ; E4 10 | Compare X register (zero page)
    ASL $37E0            ; 0E E0 37 | Arithmetic shift left (absolute)
    SBC $FA00,Y          ; F9 00 FA | Subtract with carry (absolute,Y)
    CPX $10              ; E4 10 | Compare X register (zero page)
    PLP                  ; 28 | Pull processor status from stack
    TSX                  ; BA | Transfer stack pointer to X register
    STZ $6A              ; 64 6A | Store zero to zero page
    CPY $A448            ; CC 48 A4 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1CB
; Address: $DFB78D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1CB:
    JSR $0088            ; 20 88 00 | Jump to subroutine
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1CC
; Address: $DFB79D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1CC:
    JSR $2050            ; 20 50 20 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    AND $723A,X          ; 3D 3A 72 | Logical AND with accumulator (absolute,X)
    ADC $0007,X          ; 7D 07 00 | Add with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    AND ($14,X)          ; 21 14 | Logical AND with accumulator ((zero page,X))
    AND ($14,X)          ; 21 14 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1CD
; Address: $DFB7BA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1CD:
    JSR $2816            ; 20 16 28 | Jump to subroutine
    EOR $6D20,X          ; 5D 20 6D | Exclusive OR with accumulator (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1CE
; Address: $DFB7C5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1CE:
    ROL $1C3A,X          ; 3E 3A 1C | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    AND #$17             ; 29 17 | Logical AND with accumulator (immediate)
    ORA $0122,X          ; 1D 22 01 | Logical OR with accumulator (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)
    BPL $17              ; 10 17 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND $461E,Y          ; 39 1E 46 | Logical AND with accumulator (absolute,Y)
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    BPL $0C              ; 10 0C | Branch if positive
    SEC                  ; 38 | Set carry flag
    BVS $1E              ; 70 1E | Branch if overflow set
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BMI $E0              ; 30 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BEQ $94              ; F0 94 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    CPY $38              ; C4 38 | Compare Y register (zero page)
    BIT $10F8            ; 2C F8 10 | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    PEA #$00E0           ; F4 E0 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D0
; Address: $DFB815
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D0:
    JSR $20D8            ; 20 D8 20 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $84              ; 10 84 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BRA $30              ; 80 30 | Branch always
    BVC $08              ; 50 08 | Branch if overflow clear
    BNE $08              ; D0 08 | Branch if not equal
    BCS $90              ; B0 90 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D1
; Address: $DFB827
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D1:
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D4
; Address: $DFB832
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D4:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BNE $00              ; D0 00 | Branch if not equal
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D5
; Address: $DFB83D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D5:
    BPL $A0              ; 10 A0 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BRA $38              ; 80 38 | Branch always
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D6
; Address: $DFB845
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D6:
    JSR $70FC            ; 20 FC 70 | Jump to subroutine
    CPX $5AA0            ; EC A0 5A | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $30              ; 10 30 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    LDY #$10             ; A0 10 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D7
; Address: $DFB85C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D7:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    ADC $6A73            ; 6D 73 6A | Add with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D8
; Address: $DFB865
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D8:
    ROL $1C3A,X          ; 3E 3A 1C | Rotate left (absolute,X)
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    ASL $0C35            ; 0E 35 0C | Arithmetic shift left (absolute)
    ORA $0122,X          ; 1D 22 01 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ORA $26              ; 05 26 | Logical OR with accumulator (zero page)
    ORA ($15),Y          ; 11 15 | Logical OR with accumulator ((zero page),Y)
    ASL $1E23            ; 0E 23 1E | Arithmetic shift left (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA $0601            ; 0D 01 06 | Logical OR with accumulator (absolute)
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    BVC $08              ; 50 08 | Branch if overflow clear
    BNE $08              ; D0 08 | Branch if not equal
    BCS $90              ; B0 90 | Branch if carry set
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BVC $80              ; 50 80 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1D9
; Address: $DFB8AC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1D9:
    DEY                  ; 88 | Decrement Y register
    CPX #$CA             ; E0 CA | Compare X register (immediate)
    BIT $88              ; 24 88 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1DA
; Address: $DFB8B2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1DA:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BNE $00              ; D0 00 | Branch if not equal
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1DC
; Address: $DFB8BF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1DC:
    BPL $5A              ; 10 5A | Branch if positive
    BRA $D8              ; 80 D8 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1DD
; Address: $DFB8C6
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1DD:
    LDY $5870,X          ; BC 70 58 | Load from absolute,X into Y register
    CPX #$30             ; E0 30 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$30             ; A0 30 | Load immediate value into Y register
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $0A              ; 80 0A | Branch always
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    ORA $1900            ; 0D 00 19 | Logical OR with accumulator (absolute)
    ORA $1904,Y          ; 19 04 19 | Logical OR with accumulator (absolute,Y)
    STZ $14              ; 64 14 | Store zero to zero page
    ORA $1560            ; 0D 60 15 | Logical OR with accumulator (absolute)
    BCS $47              ; B0 47 | Branch if carry set
    LDY $7153            ; AC 53 71 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    ADC $5451,X          ; 7D 51 54 | Add with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    BCC $66              ; 90 66 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    PHA                  ; 48 | Push accumulator to stack
    BVS $04              ; 70 04 | Branch if overflow set
    TAX                  ; AA | Transfer accumulator to X register
    STZ $BE02            ; 9C 02 BE | Store zero to absolute
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA #$99             ; 09 99 | Logical OR with accumulator (immediate)
    AND ($6F,X)          ; 21 6F | Logical AND with accumulator ((zero page,X))
    BPL $5D              ; 10 5D | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1DE
; Address: $DFB925
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1DE:
    JSL $3D3857          ; 22 57 38 3D | Jump to subroutine long
    BPL $15              ; 10 15 | Branch if positive
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    AND $1000,Y          ; 39 00 10 | Logical AND with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1560            ; 0D 60 15 | Logical OR with accumulator (absolute)
    BCS $47              ; B0 47 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1DF
; Address: $DFB946
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1DF:
    CPX $7113            ; EC 13 71 | Compare X register (absolute)
    PHA                  ; 48 | Push accumulator to stack
    EOR $B411,X          ; 5D 11 B4 | Exclusive OR with accumulator (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    BCS $06              ; B0 06 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    PLA                  ; 68 | Pull accumulator from stack
    BMI $04              ; 30 04 | Branch if negative
    TXA                  ; 8A | Transfer X register to accumulator
    LDY $1E02,X          ; BC 02 1E | Load from absolute,X into Y register
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ROL $18              ; 26 18 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2C01,X          ; 1E 01 2C | Arithmetic shift left (absolute,X)
    BPL $56              ; 10 56 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BIT $000E            ; 2C 0E 00 | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $D62D            ; 6D 2D D6 | Add with carry (absolute)
    ROR $99              ; 66 99 | Rotate right (zero page)
    ADC ($1C,X)          ; 61 1C | Add with carry ((zero page,X))
    ROL $1031            ; 2E 31 10 | Rotate left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LSR $2118,X          ; 5E 18 21 | PPU graphics register access
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E0
; Address: $DFB9C5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E0:
    BIT $2161            ; 2C 61 21 | PPU graphics register access
    AND $120C            ; 2D 0C 12 | Logical AND with accumulator (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $84              ; 70 84 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E1
; Address: $DFB9FA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E1:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    DEX                  ; CA | Decrement X register
    BEQ $00              ; F0 00 | Branch if equal
    BPL $53              ; 10 53 | Branch if positive
    CPX $9CE6            ; EC E6 9C | Compare X register (absolute)
    STY $F8              ; 84 F8 | Store Y register to zero page
    PEA #$080C           ; F4 0C 08 | Push effective address to stack
    BEQ $FC              ; F0 FC | Branch if equal
    CPX $AC00            ; EC 00 AC | Compare X register (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    DEC $24              ; C6 24 | Decrement (zero page)
    BRA $CC              ; 80 CC | Branch always
    PHA                  ; 48 | Push accumulator to stack
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $64              ; 10 64 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E2
; Address: $DFBA2F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E2:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    BRA $FC              ; 80 FC | Branch always
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E3
; Address: $DFBA3C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E3:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ROL $18              ; 26 18 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2C01,X          ; 1E 01 2C | Arithmetic shift left (absolute,X)
    BPL $56              ; 10 56 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BIT $000E            ; 2C 0E 00 | Test bits in accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $364D            ; CD 4D 36 | Compare accumulator (absolute)
    ROR $39              ; 66 39 | Rotate right (zero page)
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))
    ROL $1031            ; 2E 31 10 | Rotate left (absolute)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ROL $4118,X          ; 3E 18 41 | Rotate left (absolute,X)
    BIT $40              ; 24 40 | Test bits in accumulator (zero page)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E4
; Address: $DFBA8E
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E4:
    ROL $04              ; 26 04 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ASL $0004,X          ; 1E 04 00 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $84              ; 70 84 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    DEX                  ; CA | Decrement X register
    BEQ $00              ; F0 00 | Branch if equal
    BPL $10              ; 10 10 | Branch if positive
    XBA                  ; EB | Exchange accumulator bytes
    INC $99              ; E6 99 | Increment (zero page)
    STX $F8              ; 86 F8 | Store X register to zero page
    PEA #$080C           ; F4 0C 08 | Push effective address to stack
    BEQ $FC              ; F0 FC | Branch if equal
    CPX $A800            ; EC 00 A8 | Compare X register (absolute)
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E5
; Address: $DFBAE0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E5:
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    STY $F8              ; 84 F8 | Store Y register to zero page
    STX $84              ; 86 84 | Store X register to zero page
    CPY $B4C8            ; CC C8 B4 | Compare Y register (absolute)
    BMI $48              ; 30 48 | Branch if negative
    STY $00              ; 84 00 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PEA #$84FC           ; F4 FC 84 | Push effective address to stack
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    BMI $00              ; 30 00 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E6
; Address: $DFBB0E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E6:
    ROL $18              ; 26 18 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2E01,X          ; 1E 01 2E | Arithmetic shift left (absolute,X)
    BPL $56              ; 10 56 | Branch if positive
    SEC                  ; 38 | Set carry flag
    JMP $00000E          ; 5C 0E 00 00 | Jump to address long
    BPL $15              ; 10 15 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E7
; Address: $DFBB2B
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E7:
    AND $27              ; 25 27 | Logical AND with accumulator (zero page)
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $0608            ; 0D 08 06 | Logical OR with accumulator (absolute)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    AND #$09             ; 29 09 | Logical AND with accumulator (immediate)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BPL $0C              ; 10 0C | Branch if positive
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $0017            ; 0E 17 00 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $C4              ; 70 C4 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STZ $18              ; 64 18 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $20              ; 70 20 | Branch if overflow set
    BNE $30              ; D0 30 | Branch if not equal
    BEQ $20              ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1E8
; Address: $DFBB8B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1E8:
    BEQ $24              ; F0 24 | Branch if equal
    BCC $18              ; 90 18 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F4              ; 80 F4 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1EB
; Address: $DFBBA9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1EB:
    JSR $64A6            ; 20 A6 64 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1EC
; Address: $DFBBB8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1EC:
    JSR $E818            ; 20 18 E8 | Jump to subroutine
    BPL $E0              ; 10 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ROL $18              ; 26 18 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2E01,X          ; 1E 01 2E | Arithmetic shift left (absolute,X)
    BPL $56              ; 10 56 | Branch if positive
    SEC                  ; 38 | Set carry flag
    JMP $00000E          ; 5C 0E 00 00 | Jump to address long
    BPL $15              ; 10 15 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1ED
; Address: $DFBBEB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1ED:
    AND $27              ; 25 27 | Logical AND with accumulator (zero page)
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ROL $1C              ; 26 1C | Rotate left (zero page)
    ORA $110C,Y          ; 19 0C 11 | Logical OR with accumulator (absolute,Y)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1EE
; Address: $DFBC16
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1EE:
    PHP                  ; 08 | Push processor status to stack
    ORA $0F04,Y          ; 19 04 0F | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $C4              ; 70 C4 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STZ $18              ; 64 18 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $20              ; 70 20 | Branch if overflow set
    BNE $30              ; D0 30 | Branch if not equal
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $24              ; F0 24 | Branch if equal
    BCC $18              ; 90 18 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F4              ; 80 F4 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1EF
; Address: $DFBC61
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1EF:
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BPL $E8              ; 10 E8 | Branch if positive
    BEQ $18              ; F0 18 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F0
; Address: $DFBC79
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F0:
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ROL $18              ; 26 18 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2C01,X          ; 1E 01 2C | Arithmetic shift left (absolute,X)
    BPL $56              ; 10 56 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BIT $020E            ; 2C 0E 02 | Test bits in accumulator (absolute)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ROL $0E              ; 26 0E | Rotate left (zero page)
    LSR $24              ; 46 24 | Logical shift right (zero page)
    LDA ($60),Y          ; B1 60 | Read graphics status
    ROL $1031            ; 2E 31 10 | Rotate left (absolute)
    SEC                  ; 38 | Set carry flag
    BPL $01              ; 10 01 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    BVC $C6              ; 50 C6 | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    AND $2D1E,Y          ; 39 1E 2D | Logical AND with accumulator (absolute,Y)
    ASL $0113            ; 0E 13 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $84              ; 70 84 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    DEX                  ; CA | Decrement X register
    BEQ $40              ; F0 40 | Branch if equal
    LDY #$C2             ; A0 C2 | Load immediate value into Y register
    BEQ $63              ; F0 63 | Branch if equal
    ADC $A4              ; 65 A4 | Add with carry (zero page)
    STA $F802            ; 8D 02 F8 | Update graphics data
    PEA #$080C           ; F4 0C 08 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F1
; Address: $DFBD15
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F1:
    BEQ $1C              ; F0 1C | Branch if equal
    JMP $0C00            ; 4C 00 0C | Jump to address
    INC                  ; 1A | Increment accumulator
    BVS $00              ; 70 00 | Branch if overflow set
    ORA $7A0A,X          ; 1D 0A 7A | Logical OR with accumulator (absolute,X)
    BPL $EC              ; 10 EC | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    CPY $20              ; C4 20 | Compare Y register (zero page)
    STY $40              ; 84 40 | Store Y register to zero page
    LDY $D868            ; AC 68 D8 | Load from absolute address into Y register
    BCC $6C              ; 90 6C | Branch if carry clear
    PLP                  ; 28 | Pull processor status from stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STY $00              ; 84 00 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ROL $18              ; 26 18 | Rotate left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2C01,X          ; 1E 01 2C | Arithmetic shift left (absolute,X)
    BPL $56              ; 10 56 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BIT $020E            ; 2C 0E 02 | Test bits in accumulator (absolute)
    ORA $43              ; 05 43 | Logical OR with accumulator (zero page)
    DEC $4E              ; C6 4E | Decrement (zero page)
    LDX $24              ; A6 24 | Load from zero page into X register
    LDA ($40),Y          ; B1 40 | Read graphics status
    ROL $1031            ; 2E 31 10 | Rotate left (absolute)
    SEC                  ; 38 | Set carry flag
    BMI $01              ; 30 01 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    BVC $5E              ; 50 5E | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    ASL $0423,X          ; 1E 23 04 | Arithmetic shift left (absolute,X)
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F2
; Address: $DFBD9C
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F2:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $84              ; 70 84 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    DEX                  ; CA | Decrement X register
    BEQ $40              ; F0 40 | Branch if equal
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BEQ $64              ; F0 64 | Branch if equal
    BEQ $62              ; F0 62 | Branch if equal
    LDY $8D              ; A4 8D | Load from zero page into Y register
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    PEA #$080C           ; F4 0C 08 | Push effective address to stack
    BEQ $1C              ; F0 1C | Branch if equal
    JMP $0800            ; 4C 00 08 | Jump to address
    CLC                  ; 18 | Clear carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $6CF2,X          ; 1E F2 6C | Arithmetic shift left (absolute,X)
    CPY $9C30            ; CC 30 9C | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $C8              ; 70 C8 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    CPX $00              ; E4 00 | Compare X register (zero page)
    BRA $00              ; 80 00 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ROL $18              ; 26 18 | Rotate left (zero page)
    ASL $0B04            ; 0E 04 0B | Arithmetic shift left (absolute)
    BIT $09              ; 24 09 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F3
; Address: $DFBE2E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F3:
    CLC                  ; 18 | Clear carry flag
    ASL $2F01,X          ; 1E 01 2F | Arithmetic shift left (absolute,X)
    BPL $20              ; 10 20 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F4
; Address: $DFBE3A
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F4:
    JSR $0210            ; 20 10 02 | Jump to subroutine
    BPL $07              ; 10 07 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ORA $1B04,Y          ; 19 04 1B | Logical OR with accumulator (absolute,Y)
    ADC $26              ; 65 26 | Add with carry (zero page)
    ASL $1800,X          ; 1E 00 18 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BCC $60              ; 90 60 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    BMI $64              ; 30 64 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $74              ; 80 74 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $A4              ; 06 A4 | Arithmetic shift left (zero page)
    CPX $80              ; E4 80 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F5
; Address: $DFBE90
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F5:
    SEI                  ; 78 | Set interrupt disable flag
    BRA $74              ; 80 74 | Branch always
    STY $F004            ; 8C 04 F0 | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BCS $10              ; B0 10 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F7
; Address: $DFBEA6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F7:
    CPY $30              ; C4 30 | Compare Y register (zero page)
    STY $80              ; 84 80 | Store Y register to zero page
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    BCC $78              ; 90 78 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BMI $38              ; 30 38 | Branch if negative
    BRA $F8              ; 80 F8 | Branch always
    CPY $70              ; C4 70 | Compare Y register (zero page)
    INX                  ; E8 | Increment X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ROL $18              ; 26 18 | Rotate left (zero page)
    ASL $0B04            ; 0E 04 0B | Arithmetic shift left (absolute)
    BIT $09              ; 24 09 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $2F01,X          ; 1E 01 2F | Arithmetic shift left (absolute,X)
    BPL $20              ; 10 20 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F8
; Address: $DFBEFA
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F8:
    JSR $0210            ; 20 10 02 | Jump to subroutine
    BPL $07              ; 10 07 | Branch if positive
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $1C              ; 10 1C | Branch if positive
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BCC $60              ; 90 60 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    BMI $64              ; 30 64 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1F9
; Address: $DFBF3E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1F9:
    SEI                  ; 78 | Set interrupt disable flag
    BRA $74              ; 80 74 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $A4              ; 06 A4 | Arithmetic shift left (zero page)
    CPX $80              ; E4 80 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1FA
; Address: $DFBF50
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1FA:
    SEI                  ; 78 | Set interrupt disable flag
    BRA $74              ; 80 74 | Branch always
    STY $F004            ; 8C 04 F0 | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BNE $64              ; D0 64 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $88              ; 30 88 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1FD
; Address: $DFBF71
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1FD:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1FE
; Address: $DFBF7A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1FE:
    JSR $D0F0            ; 20 F0 D0 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ROL $202E            ; 2E 2E 20 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_1FF
; Address: $DFBFC9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_1FF:
    JSR $3131            ; 20 31 31 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BNE $D0              ; D0 D0 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_200
; Address: $DFC016
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_200:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $D4              ; F0 D4 | Branch if equal
    REP #$C2             ; C2 C2 | Reset processor status bits
    STX $86              ; 86 86 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROR $66              ; 66 66 | Rotate right (zero page)
    CPY $38CC            ; CC CC 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_201
; Address: $DFC086
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_201:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $1C              ; 10 1C | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BNE $D0              ; D0 D0 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $C6              ; C6 C6 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_202
; Address: $DFC0E2
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_202:
    STX $86              ; 86 86 | Store X register to zero page
    ROL $26              ; 26 26 | Rotate left (zero page)
    STZ $64              ; 64 64 | Store zero to zero page
    CPY $38CC            ; CC CC 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0019,Y          ; 19 19 00 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $350F,Y          ; 19 0F 35 | Logical OR with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_206
; Address: $DFC148
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_206:
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    LDY $8C8C            ; AC 8C 8C | Load from absolute address into Y register
    PEA #$24F4           ; F4 F4 24 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $8C              ; B0 8C | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    STY $FCA8            ; 8C A8 FC | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_207
; Address: $DFC1BB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_207:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $1B07            ; 0D 07 1B | Logical OR with accumulator (absolute)
    ADC #$69             ; 69 69 | Add with carry (immediate)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_209
; Address: $DFC206
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_209:
    BIT $372C            ; 2C 2C 37 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $88              ; B0 88 | Branch if carry set
    BNE $84              ; D0 84 | Branch if not equal
    PEA #$E4F4           ; F4 F4 E4 | Push effective address to stack
    CPX $54              ; E4 54 | Compare X register (zero page)
    BPL $08              ; 10 08 | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    STY $FCA8            ; 8C A8 FC | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_20A
; Address: $DFC2AC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_20A:
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    BPL $15              ; 10 15 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    AND $2F2F,X          ; 3D 2F 2F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_20B
; Address: $DFC2C8
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_20B:
    JSL $303120          ; 22 20 31 30 | Jump to subroutine long
    BPL $0A              ; 10 0A | Branch if positive
    SEC                  ; 38 | Set carry flag
    ORA $1A38,X          ; 1D 38 1A | Logical OR with accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $90              ; 90 90 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $84              ; F0 84 | Branch if equal
    LDX #$82             ; A2 82 | Load immediate value into X register
    STX $D6              ; 86 D6 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROL $06              ; 26 06 | Rotate left (zero page)
    CPY $380C            ; CC 0C 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    STY $8EA8            ; 8C A8 8E | Store Y register to absolute address
    STX $FEA8            ; 8E A8 FE | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BPL $15              ; 10 15 | Branch if positive
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_20C
; Address: $DFC374
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_20C:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    BPL $0A              ; 10 0A | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $2D28            ; 0D 28 2D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_20D
; Address: $DFC387
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_20D:
    JSL $1C1011          ; 22 11 10 1C | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $90              ; 90 90 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STY $D4              ; 84 D4 | Store Y register to zero page
    LDY $84              ; A4 84 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $8C              ; F0 8C | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    STY $86D8            ; 8C D8 86 | Store Y register to absolute address
    DEC $C6              ; C6 C6 | Decrement (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY $380C            ; CC 0C 38 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    STX $FEA8            ; 8E A8 FE | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $351B,Y          ; 19 1B 35 | Logical OR with accumulator (absolute,Y)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_20E
; Address: $DFC44B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_20E:
    JSR $1C1C            ; 20 1C 1C | Jump to subroutine
    ORA $310D,Y          ; 19 0D 31 | Logical OR with accumulator (absolute,Y)
    AND ($15),Y          ; 31 15 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_20F
; Address: $DFC484
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_20F:
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BMI $E0              ; 30 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $AC              ; F0 AC | Branch if equal
    LDY $D2D2            ; AC D2 D2 | Load from absolute address into Y register
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPX $38EC            ; EC EC 38 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX $FEF8            ; EC F8 FE | Compare X register (absolute)
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FCE8,X          ; FE E8 FC | Increment (absolute,X)
    BPL $F8              ; 10 F8 | Branch if positive
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $151B,Y          ; 19 1B 15 | Logical OR with accumulator (absolute,Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $110D,Y          ; 19 0D 11 | Logical OR with accumulator (absolute,Y)
    AND ($2B,X)          ; 21 2B | Logical AND with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_210
; Address: $DFC507
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_210:
    JSL $1C1008          ; 22 08 10 1C | Jump to subroutine long
    AND ($15),Y          ; 31 15 | Logical AND with accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $90              ; 90 90 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $A4EC            ; EC EC A4 | Compare X register (absolute)
    LDY $80              ; A4 80 | Load from zero page into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BCS $E0              ; B0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_211
; Address: $DFC55A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_211:
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $96F8            ; EC F8 96 | Compare X register (absolute)
    STX $86              ; 86 86 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPX $38EC            ; EC EC 38 | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    BPL $F8              ; 10 F8 | Branch if positive
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDY $A50C            ; AC 0C A5 | Load from absolute address into Y register
    ORA $E7              ; 05 E7 | Logical OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_212
; Address: $DFC58A
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_212:
    SED                  ; F8 | Set decimal mode flag
    BMI $FF              ; 30 FF | Branch if negative
    ADC $0018            ; 6D 18 00 | Add with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    WDM #$47             ; 42 47 | Reserved instruction
    EOR ($6F,X)          ; 41 6F | Exclusive OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ADC $FF7C            ; 6D 7C FF | Add with carry (absolute)
    PLB                  ; AB | Pull data bank register from stack
    LDA #$FF             ; A9 FF | Read graphics status
    ORA #$BE             ; 09 BE | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    INC $FCD2,X          ; FE D2 FC | Increment (absolute,X)
    BCC $2F              ; 90 2F | Branch if carry clear
    ROR $3E2B,X          ; 7E 2B 3E | Rotate right (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    ROL $3EA9,X          ; 3E A9 3E | Rotate left (absolute,X)
    ORA #$3E             ; 09 3E | Logical OR with accumulator (immediate)
    EOR $1DD3,X          ; 5D D3 1D | Exclusive OR with accumulator (absolute,X)
    SBC $FBA1,X          ; FD A1 FB | Subtract with carry (absolute,X)
    ASL $A1              ; 06 A1 | Arithmetic shift left (zero page)
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    BPL $6C              ; 10 6C | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $BA              ; 10 BA | Branch if positive
    SEC                  ; 38 | Set carry flag
    LSR $7474,X          ; 5E 74 74 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_213
; Address: $DFC5DD
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_213:
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BCS $E5              ; B0 E5 | Branch if carry set
    CPX #$D7             ; E0 D7 | Compare X register (immediate)
    ASL $9F              ; 06 9F | Arithmetic shift left (zero page)
    STY $DAFF            ; 8C FF DA | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    BEQ $42              ; F0 42 | Hardware register operation
    CPX #$82             ; E0 82 | Compare X register (immediate)
    SEP #$F6             ; E2 F6 | Set processor status bits
    CPX $DA6E            ; EC 6E DA | Compare X register (absolute)
    ASL $B6FF,X          ; 1E FF B6 | Arithmetic shift left (absolute,X)
    PEA #$D4FE           ; F4 FE D4 | Push effective address to stack
    INC $FFD4,X          ; FE D4 FF | Increment (absolute,X)
    STA ($7D),Y          ; 91 7D | Update graphics data
    CLI                  ; 58 | Clear interrupt disable flag
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $7EF4,X          ; 3E F4 7E | Rotate left (absolute,X)
    STA ($7C),Y          ; 91 7C | Update graphics data
    PHX                  ; DA | Push X register to stack
    TSX                  ; BA | Transfer stack pointer to X register
    DEX                  ; CA | Decrement X register
    CLV                  ; B8 | Clear overflow flag
    LDA $FE88,X          ; BD 88 FE | Read graphics status
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BPL $DC              ; 10 DC | Branch if positive
    BVC $54              ; 50 54 | Branch if overflow clear
    BPL $BA              ; 10 BA | Branch if positive
    SEC                  ; 38 | Set carry flag
    DEX                  ; CA | Decrement X register
    PHX                  ; DA | Push X register to stack
    CPY $DC              ; C4 DC | Compare Y register (zero page)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BEQ $F4              ; F0 F4 | Branch if equal
    BVS $30              ; 70 30 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDA $A70D            ; AD 0D A7 | Read graphics status
    XBA                  ; EB | Exchange accumulator bytes
    BEQ $60              ; F0 60 | Branch if equal
    SBC $FF31,Y          ; F9 31 FF | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    WDM #$07             ; 42 07 | Reserved instruction
    EOR ($4F,X)          ; 41 4F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_214
; Address: $DFC65F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_214:
    SEI                  ; 78 | Set interrupt disable flag
    ADC $2FFF            ; 6D FF 2F | Add with carry (absolute)
    LDA #$FF             ; A9 FF | Read graphics status
    BIT #$BE             ; 89 BE | Test bits in accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    INC $6D52,X          ; FE 52 6D | Increment (absolute,X)
    ROR $3E2B,X          ; 7E 2B 3E | Rotate right (absolute,X)
    ROL $3EA9,X          ; 3E A9 3E | Rotate left (absolute,X)
    BIT #$3E             ; 89 3E | Test bits in accumulator (immediate)
    EOR $1D53,X          ; 5D 53 1D | Exclusive OR with accumulator (absolute,X)
    LDA $7F11,X          ; BD 11 7F | Read graphics status
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    EOR $001C,X          ; 5D 1C 00 | Exclusive OR with accumulator (absolute,X)
    ASL $1C0C            ; 0E 0C 1C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_215
; Address: $DFC69D
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_215:
    JSL $1A0000          ; 22 00 00 1A | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BMI $A5              ; 30 A5 | Branch if negative
    LDY #$E7             ; A0 E7 | Load immediate value into Y register
    SEP #$DF             ; E2 DF | Set processor status bits
    PHX                  ; DA | Push X register to stack
    CLC                  ; 18 | Clear carry flag
    BMI $02              ; 30 02 | Branch if negative
    CPX #$42             ; E0 42 | Hardware register operation
    SEP #$82             ; E2 82 | Set processor status bits
    INC $EC              ; E6 EC | Increment (zero page)
    INC $1EDA            ; EE DA 1E | Increment (absolute)
    ROL $F4FF,X          ; 3E FF F4 | Rotate left (absolute,X)
    INC $FFD4,X          ; FE D4 FF | Increment (absolute,X)
    BCC $7D              ; 90 7D | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    ROR $7CD4,X          ; 7E D4 7C | Rotate right (absolute,X)
    BCC $7C              ; 90 7C | Branch if carry clear
    PHX                  ; DA | Push X register to stack
    TSX                  ; BA | Transfer stack pointer to X register
    CLV                  ; B8 | Clear overflow flag
    CMP #$D8             ; C9 D8 | Compare accumulator (immediate)
    LDA                  ; BF 85 DF C0 | Read graphics status
    ROR $8560            ; 6E 60 85 | Rotate right (absolute)
    BRA $D9              ; 80 D9 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    EOR $C51C,X          ; 5D 1C C5 | Exclusive OR with accumulator (absolute,X)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BEQ $F4              ; F0 F4 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_216
; Address: $DFC6F6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_216:
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    ROL $1C2E            ; 2E 2E 1C | Rotate left (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_217
; Address: $DFC6FF
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_217:
    JSL $0A0004          ; 22 04 00 0A | Jump to subroutine long
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $3F0C,X          ; 1E 0C 3F | Arithmetic shift left (absolute,X)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $1E12,X          ; 1E 12 1E | Arithmetic shift left (absolute,X)
    ROL $2D7F,X          ; 3E 7F 2D | Rotate left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    AND $2D              ; 25 2D | Logical AND with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $3E2A,X          ; 3E 2A 3E | Rotate left (absolute,X)
    AND #$3D             ; 29 3D | Logical AND with accumulator (immediate)
    AND #$3D             ; 29 3D | Logical AND with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    AND $3D              ; 25 3D | Logical AND with accumulator (zero page)
    ORA ($3E),Y          ; 11 3E | Logical OR with accumulator ((zero page),Y)
    BPL $1E              ; 10 1E | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $1100            ; 0D 00 11 | Logical OR with accumulator (absolute)
    ORA $1D11,X          ; 1D 11 1D | Logical OR with accumulator (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_218
; Address: $DFC764
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_218:
    JSR $5820            ; 20 20 58 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $44              ; 64 44 | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag
    SBC $EDEC,X          ; FD EC ED | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_21A
; Address: $DFC777
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_21A:
    JSR $185C            ; 20 5C 18 | Jump to subroutine
    JMP $66EEEE          ; 5C EE EE 66 | Jump to address long
    LDX $94B8            ; AE B8 94 | Load from absolute address into X register
    STZ $081A            ; 9C 1A 08 | Store zero to absolute
    DEX                  ; CA | Decrement X register
    STY $64              ; 84 64 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    CPX #$BE             ; E0 BE | Compare X register (immediate)
    LDY $7AFF,X          ; BC FF 7A | Load from absolute,X into Y register
    CPX #$58             ; E0 58 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_21B
; Address: $DFC792
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_21B:
    PEA #$FC68           ; F4 68 FC | Push effective address to stack
    PEA #$3CBC           ; F4 BC 3C | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$80             ; E0 80 | Compare X register (immediate)
    PEA #$6A7A           ; F4 7A 6A | Push effective address to stack
    CMP $07C0            ; CD C0 07 | Compare accumulator (absolute)
    ROL $20              ; 26 20 | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_21C
; Address: $DFC7AA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_21C:
    INC $9580,X          ; FE 80 95 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TXA                  ; 8A | Transfer X register to accumulator
    BEQ $F2              ; F0 F2 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $08              ; 80 08 | Branch always
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ROL $7F1C,X          ; 3E 1C 7F | Rotate left (absolute,X)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_21D
; Address: $DFC7D2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_21D:
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $3E              ; 26 3E | Rotate left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_21E
; Address: $DFC7EE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_21E:
    INC $5B4A,X          ; FE 4A 5B | Increment (absolute,X)
    ROR $7E54,X          ; 7E 54 7E | Rotate right (absolute,X)
    ADC $7D55,X          ; 7D 55 7D | Add with carry (absolute,X)
    AND ($7D,X)          ; 21 7D | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_21F
; Address: $DFC803
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_21F:
    JSR $163E            ; 20 3E 16 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($39,X)          ; 21 39 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_220
; Address: $DFC812
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_220:
    JSL $11173A          ; 22 3A 17 11 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_221
; Address: $DFC822
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_221:
    JSR $5820            ; 20 20 58 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $44              ; 64 44 | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag
    SBC $6DEC,X          ; FD EC 6D | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_224
; Address: $DFC835
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_224:
    JSR $185C            ; 20 5C 18 | Jump to subroutine
    JMP $E6EEEE          ; 5C EE EE E6 | Jump to address long
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_225
; Address: $DFC83F
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_225:
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $889A            ; 9C 9A 88 | Store zero to absolute
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $80              ; A4 80 | Load from zero page into Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $FD              ; 80 FD | Branch always
    BEQ $F4              ; F0 F4 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    LDY $B8BC,X          ; BC BC B8 | Load from absolute,X into Y register
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $64              ; 64 64 | Store zero to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    DEC $3408,X          ; DE 08 34 | Decrement (absolute,X)
    BIT $8C20            ; 2C 20 8C | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    BMI $18              ; 30 18 | Branch if negative
    BPL $A8              ; 10 A8 | Branch if positive
    NOP                  ; EA | No operation
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVC $58              ; 50 58 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    LDY $A50C            ; AC 0C A5 | Load from absolute address into Y register
    ORA $E6              ; 05 E6 | Logical OR with accumulator (zero page)
    LSR $FD              ; 46 FD | Logical shift right (zero page)
    ADC #$F5             ; 69 F5 | Add with carry (immediate)
    AND ($FB,X)          ; 21 FB | Logical AND with accumulator ((zero page,X))
    AND $0EFB,X          ; 3D FB 0E | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    WDM #$47             ; 42 47 | Reserved instruction
    EOR ($6B,X)          ; 41 6B | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_226
; Address: $DFC89C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_226:
    AND $0875,Y          ; 39 75 08 | Logical AND with accumulator (absolute,Y)
    ROR $ED              ; 66 ED | Rotate right (zero page)
    NOP                  ; EA | No operation
    PHX                  ; DA | Push X register to stack
    CMP ($BD),Y          ; D1 BD | Compare accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $AF18,X          ; BC 18 AF | Load from absolute,X into Y register
    INC $FCEE,X          ; FE EE FC | Increment (absolute,X)
    JMP $2FEF5C          ; 5C 5C EF 2F | Jump to address long
    SBC #$41             ; E9 41 | Subtract with carry (immediate)
    ROR $26              ; 66 26 | Rotate right (zero page)
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    BMI $6C              ; 30 6C | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    TAX                  ; AA | Transfer accumulator to X register
    ROR $7474,X          ; 7E 74 74 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BCS $65              ; B0 65 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_227
; Address: $DFC8EA
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_227:
    LDA $BCDF86          ; AF 86 DF BC | Read graphics status
    CLC                  ; 18 | Clear carry flag
    BEQ $42              ; F0 42 | Hardware register operation
    CPX #$82             ; E0 82 | Compare X register (immediate)
    REP #$D6             ; C2 D6 | Reset processor status bits
    STZ $14AE            ; 9C AE 14 | Store zero to absolute
    ROR $BF              ; 66 BF | Rotate right (zero page)
    INX                  ; E8 | Increment X register
    STX $BB              ; 86 BB | Store X register to zero page
    DEC                  ; 3A | Decrement accumulator
    ADC $3B74,X          ; 7D 74 3B | Add with carry (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    TAY                  ; A8 | Transfer accumulator to Y register
    LSR $EC              ; 46 EC | Logical shift right (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    INC $D7EC            ; EE EC D7 | Increment (absolute)
    PHX                  ; DA | Push X register to stack
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    INC $BDEC            ; EE EC BD | Increment (absolute)
    INC $FAC4            ; EE C4 FA | Increment (absolute)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BVC $44              ; 50 44 | Branch if overflow clear
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_228
; Address: $DFC932
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_228:
    CPY $D4              ; C4 D4 | Compare Y register (zero page)
    CPX #$E4             ; E0 E4 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $30              ; 70 30 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDA $A60D            ; AD 0D A6 | Read graphics status
    ASL $ED              ; 06 ED | Arithmetic shift left (zero page)
    EOR #$F5             ; 49 F5 | Exclusive OR with accumulator (immediate)
    ADC ($FB,X)          ; 61 FB | Add with carry ((zero page,X))
    AND $2EFB,X          ; 3D FB 2E | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    WDM #$07             ; 42 07 | Reserved instruction
    EOR ($4B,X)          ; 41 4B | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_22A
; Address: $DFC95C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_22A:
    AND $2875,Y          ; 39 75 28 | Logical AND with accumulator (absolute,Y)
    ROR $FD              ; 66 FD | Rotate right (zero page)
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_22B
; Address: $DFC963
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_22B:
    JSL $DD61EA          ; 22 EA 61 DD | Jump to subroutine long
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    JMP $DC2EBE          ; 5C BE 2E DC | Jump to address long
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_22C
; Address: $DFC97A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_22C:
    JMP $6F6F5C          ; 5C 5C 6F 6F | Jump to address long
    LDA $7729,X          ; BD 29 77 | Read graphics status
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_22F
; Address: $DFC998
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_22F:
    ASL $1C0C            ; 0E 0C 1C | Arithmetic shift left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    BMI $A5              ; 30 A5 | Branch if negative
    LDY #$67             ; A0 67 | Load immediate value into Y register
    LDA                  ; BF 96 AF 84 | Read graphics status
    LDY $70DF,X          ; BC DF 70 | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    BMI $02              ; 30 02 | Branch if negative
    CPX #$42             ; E0 42 | Hardware register operation
    SEP #$82             ; E2 82 | Set processor status bits
    DEC $D4              ; C6 D4 | Decrement (zero page)
    STZ $10AE            ; 9C AE 10 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_230
; Address: $DFC9BF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_230:
    ROR $B7              ; 66 B7 | Rotate right (zero page)
    CPX $57              ; E4 57 | Compare X register (zero page)
    LSR $5B              ; 46 5B | Logical shift right (zero page)
    PHB                  ; 8B | Push data bank register to stack
    LDA $3D19,X          ; BD 19 3D | Read graphics status
    CLC                  ; 18 | Clear carry flag
    BMI $7F              ; 30 7F | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    LDY $EE4A            ; AC 4A EE | Load from absolute address into Y register
    LDY $EEEF            ; AC EF EE | Load from absolute address into Y register
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    PEA #$EAEA           ; F4 EA EA | Push effective address to stack
    CMP $66D0,X          ; DD D0 66 | Compare accumulator (absolute,X)
    STZ $87              ; 64 87 | Store zero to zero page
    STX $DD              ; 86 DD | Store X register to zero page

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_231
; Address: $DFC9EC
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_231:
    JSL $005500          ; 22 00 55 00 | Jump to subroutine long
    SEP #$EA             ; E2 EA | Set processor status bits
    BEQ $E2              ; F0 E2 | Branch if equal
    INC $2E7E,X          ; FE 7E 2E | Increment (absolute,X)
    ROL $181C            ; 2E 1C 18 | Rotate left (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ROL $22              ; 26 22 | Rotate left (zero page)
    LDA                  ; BF 37 B7 2E | Read graphics status
    ASL $3A04,X          ; 1E 04 3A | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    ROR $6A              ; 66 6A | Rotate right (zero page)
    ORA $3929,X          ; 1D 29 39 | Logical OR with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $53              ; 10 53 | Branch if positive
    AND ($26,X)          ; 21 26 | Logical AND with accumulator ((zero page,X))
    ADC $FF3D,X          ; 7D 3D FF | Add with carry (absolute,X)
    LSR $1A07,X          ; 5E 07 1A | Logical shift right (absolute,X)
    AND $1B3C,X          ; 3D 3C 1B | Logical AND with accumulator (absolute,X)
    ORA $0107,Y          ; 19 07 01 | Logical OR with accumulator (absolute,Y)
    LSR $EF56,X          ; 5E 56 EF | Logical shift right (absolute,X)
    EOR ($B3,X)          ; 41 B3 | Exclusive OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STZ $04              ; 64 04 | Store zero to zero page
    ROL $7F06,X          ; 3E 06 7F | Rotate left (absolute,X)
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    EOR ($51,X)          ; 41 51 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_232
; Address: $DFCA5F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_232:
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear
    BNE $80              ; D0 80 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    BMI $78              ; 30 78 | Branch if negative
    BMI $FC              ; 30 FC | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    INC $006C,X          ; FE 6C 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_233
; Address: $DFCA73
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_233:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($FE7C)          ; 6C 7C FE | Jump to address (absolute indirect)
    INC $FED4,X          ; FE D4 FE | Increment (absolute,X)
    INC $FE54,X          ; FE 54 FE | Increment (absolute,X)
    INC $FE94,X          ; FE 94 FE | Increment (absolute,X)
    INC $B4A4,X          ; FE A4 B4 | Increment (absolute,X)
    LDY $BC94,X          ; BC 94 BC | Load from absolute,X into Y register
    LDY $BC              ; A4 BC | Load from zero page into Y register
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    BRA $18              ; 80 18 | Branch always
    BPL $B0              ; 10 B0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    BNE $90              ; D0 90 | Branch if not equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ROL $22              ; 26 22 | Rotate left (zero page)
    LDA                  ; BF 37 B6 2E | Read graphics status
    ASL $3A04,X          ; 1E 04 3A | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_236
; Address: $DFCAE5
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_236:
    JSR $0022            ; 20 22 00 | Jump to subroutine
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    EOR $AF00,Y          ; 59 00 AF | Exclusive OR with accumulator (absolute,Y)
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    ROL $3D3D            ; 2E 3D 3D | Rotate left (absolute)
    ORA $1B1D,X          ; 1D 1D 1B | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ROL $26              ; 26 26 | Rotate left (zero page)
    EOR ($50),Y          ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
    BPL $2C              ; 10 2C | Branch if positive
    AND ($10),Y          ; 31 10 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $14              ; 10 14 | Branch if positive
    ASL $0F1E,X          ; 1E 1E 0F | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $28              ; 80 28 | Branch always
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    INC $FEAC,X          ; FE AC FE | Increment (absolute,X)
    STZ $FF              ; 64 FF | Store zero to zero page
    BRA $10              ; 80 10 | Branch always
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LDY $643C            ; AC 3C 64 | Load from absolute address into Y register
    INC $DAFF,X          ; FE FF DA | Increment (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    DEX                  ; CA | Decrement X register
    PHX                  ; DA | Push X register to stack
    INC $FE6A,X          ; FE 6A FE | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $7E2A,X          ; 7E 2A 7E | Rotate right (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    LDX $BEAA,Y          ; BE AA BE | Load from absolute,Y into X register
    DEX                  ; CA | Decrement X register
    DEC $DED2,X          ; DE D2 DE | Decrement (absolute,X)
    INC $BE84,X          ; FE 84 BE | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_238
; Address: $DFCB6C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_238:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STY $9C              ; 84 9C | Store Y register to zero page
    JMP $2088E8          ; 5C E8 88 20 | Jump to address long
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ASL $1F3E            ; 0E 3E 1F | Arithmetic shift left (absolute)
    ADC ($2F,X)          ; 61 2F | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_23A
; Address: $DFCBA8
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_23A:
    JSR $601B            ; 20 1B 60 | Jump to subroutine
    BNE $2B              ; D0 2B | Branch if not equal
    BNE $2F              ; D0 2F | Branch if not equal
    JMP ($7031)          ; 6C 31 70 | Jump to address (absolute indirect)
    AND $1E3C,X          ; 3D 3C 1E | Logical AND with accumulator (absolute,X)
    ADC $793F,X          ; 7D 3F 79 | Add with carry (absolute,X)
    AND $3F3B,X          ; 3D 3B 3F | Logical AND with accumulator (absolute,X)
    AND $458A            ; 2D 8A 45 | Logical AND with accumulator (absolute)
    ADC ($22,X)          ; 61 22 | Add with carry ((zero page,X))
    BIT $7F2D            ; 2C 2D 7F | Test bits in accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ORA $3F7F,X          ; 1D 7F 3F | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    BMI $80              ; 30 80 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $7C              ; F0 7C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY $84F8            ; CC F8 84 | Compare Y register (absolute)
    BEQ $40              ; F0 40 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    BRA $BC              ; 80 BC | Branch always
    PHP                  ; 08 | Push processor status to stack
    BCS $0E              ; B0 0E | Branch if carry set
    BCC $07              ; 90 07 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_23B
; Address: $DFCC0F
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_23B:
    CPX $34              ; E4 34 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    ROL $BE7C,X          ; 3E 7C BE | Rotate left (absolute,X)
    LDX $BCFC,Y          ; BE FC BC | Load from absolute,Y into X register
    LDX $F6EE,Y          ; BE EE F6 | Load from absolute,Y into X register
    INC $37              ; E6 37 | Increment (zero page)
    CPY #$31             ; C0 31 | Compare Y register (immediate)
    CPY $844A            ; CC 4A 84 | Compare Y register (absolute)
    INC $74FC,X          ; FE FC 74 | Increment (absolute,X)
    BVS $08              ; 70 08 | Branch if overflow set
    BCS $80              ; B0 80 | Branch if carry set
    SEP #$EA             ; E2 EA | Set processor status bits
    SEP #$E0             ; E2 E0 | Game work RAM access
    BEQ $D0              ; F0 D0 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $F870            ; EC 70 F8 | Compare X register (absolute)
    BRA $70              ; 80 70 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    AND ($12,X)          ; 21 12 | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ASL $1F3E            ; 0E 3E 1F | Arithmetic shift left (absolute)
    ADC ($2F,X)          ; 61 2F | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_23C
; Address: $DFCC61
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_23C:
    JSL $013202          ; 22 02 32 01 | Jump to subroutine long
    ORA $2D10,X          ; 1D 10 2D | Logical OR with accumulator (absolute,X)
    BMI $0D              ; 30 0D | Branch if negative
    BVS $09              ; 70 09 | Branch if overflow set
    CPX #$15             ; E0 15 | Compare X register (immediate)
    BNE $27              ; D0 27 | Branch if not equal
    JMP ($7031)          ; 6C 31 70 | Jump to address (absolute indirect)
    AND $1E3C,X          ; 3D 3C 1E | Logical AND with accumulator (absolute,X)
    ADC $7D3F,X          ; 7D 3F 7D | Add with carry (absolute,X)
    AND $7D3B,X          ; 3D 3B 7D | Logical AND with accumulator (absolute,X)
    CPX $8C03            ; EC 03 8C | Compare X register (absolute)
    AND ($6C,X)          ; 21 6C | Logical AND with accumulator ((zero page,X))
    EOR $3F7F            ; 4D 7F 3F | Exclusive OR with accumulator (absolute)
    ROL $100E            ; 2E 0E 10 | Rotate left (absolute)
    ORA $4701            ; 0D 01 47 | Logical OR with accumulator (absolute)
    ORA $373F,Y          ; 19 3F 37 | Logical OR with accumulator (absolute,Y)
    ASL $011F            ; 0E 1F 01 | Arithmetic shift left (absolute)
    ASL $0102            ; 0E 02 01 | Arithmetic shift left (absolute)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    BMI $80              ; 30 80 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_23D
; Address: $DFCCAF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_23D:
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $7C              ; F0 7C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY $84F8            ; CC F8 84 | Compare Y register (absolute)
    BEQ $40              ; F0 40 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    BRA $BC              ; 80 BC | Branch always
    LDY $D804,X          ; BC 04 D8 | Load from absolute,X into Y register
    ASL $D8              ; 06 D8 | Arithmetic shift left (zero page)
    PEA #$0834           ; F4 34 08 | Push effective address to stack
    CLV                  ; B8 | Clear overflow flag
    ROL $BE7C,X          ; 3E 7C BE | Rotate left (absolute,X)
    STZ $DCBC,X          ; 9E BC DC | Store zero to absolute,X
    DEC $FEFE,X          ; DE FE FE | Decrement (absolute,X)
    INC $B449,X          ; FE 49 B4 | Increment (absolute,X)
    EOR ($A2),Y          ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
    STX $44              ; 86 44 | Store X register to zero page
    INC $1AFE,X          ; FE FE 1A | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPY $C0              ; C4 C0 | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_23E
; Address: $DFCCF0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_23E:
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    BEQ $FC              ; F0 FC | Branch if equal
    INY                  ; C8 | Increment Y register
    CLV                  ; B8 | Clear overflow flag
    INC $18FC,X          ; FE FC 18 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_23F
; Address: $DFCCFC
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_23F:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ROL $39              ; 26 39 | Rotate left (zero page)
    ASL $7F97,X          ; 1E 97 7F | Arithmetic shift left (absolute,X)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    JMP $8822            ; 4C 22 88 | Jump to address
    STA                  ; 9F 5F BE 7C | Update graphics data
    LDX $BF7C,Y          ; BE 7C BF | Load from absolute,Y into X register
    ROR $2F3E            ; 6E 3E 2F | Rotate right (absolute)
    BCC $4C              ; 90 4C | Branch if carry clear
    EOR $2647,X          ; 5D 47 26 | Exclusive OR with accumulator (absolute,X)
    AND $482D            ; 2D 2D 48 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_240
; Address: $DFCD49
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_240:
    PHA                  ; 48 | Push accumulator to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ASL $7C              ; 06 7C | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    JMP $3F2A3E          ; 5C 3E 2A 3F | Jump to address long
    PLX                  ; FA | Pull X register from stack
    ADC $7805,X          ; 7D 05 78 | Add with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STZ $FEF8            ; 9C F8 FE | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$DCA0           ; F4 A0 DC | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    PEA #$B008           ; F4 08 B0 | Push effective address to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_241
; Address: $DFCD8D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_241:
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    DEC $9EDC,X          ; DE DC 9E | Decrement (absolute,X)
    STZ $0C0E            ; 9C 0E 0C | Store zero to absolute
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BEQ $E0              ; F0 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BEQ $78              ; F0 78 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    BCS $80              ; B0 80 | Branch if carry set
    BVS $E0              ; 70 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_242
; Address: $DFCDB3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_242:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BVS $60              ; 70 60 | Branch if overflow set
    BEQ $E0              ; F0 E0 | Game work RAM access
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_243
; Address: $DFCDBB
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_243:
    BEQ $80              ; F0 80 | Branch if equal
    BVS $40              ; 70 40 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ROL $39              ; 26 39 | Rotate left (zero page)
    ASL $7F97,X          ; 1E 97 7F | Arithmetic shift left (absolute,X)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    LDA #$08             ; A9 08 | Read graphics status
    ROL $58              ; 26 58 | Rotate left (zero page)
    ASL $94              ; 06 94 | Arithmetic shift left (zero page)
    JMP $1F5F            ; 4C 5F 1F | Jump to address
    STA                  ; 9F 5F BE 7C | Update graphics data
    ROL $7F7C,X          ; 3E 7C 7F | Rotate left (absolute,X)
    LDX $1F3E            ; AE 3E 1F | Load from absolute address into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    BIT #$66             ; 89 66 | Test bits in accumulator (immediate)
    AND $27              ; 25 27 | Logical AND with accumulator (zero page)
    ROR $EE6E            ; 6E 6E EE | Rotate right (absolute)
    INC $00E0            ; EE E0 00 | Increment (absolute)
    ADC $7801,X          ; 7D 01 78 | Add with carry (absolute,X)
    BVS $60              ; 70 60 | Branch if overflow set
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    INC $0177,X          ; FE 77 01 | Increment (absolute,X)
    ROR $0102,X          ; 7E 02 01 | Rotate right (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STZ $FEF8            ; 9C F8 FE | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$DCA0           ; F4 A0 DC | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    PEA #$B008           ; F4 08 B0 | Push effective address to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_244
; Address: $DFCE4D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_244:
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    DEC $9EDC,X          ; DE DC 9E | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_245
; Address: $DFCE53
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_245:
    STZ $0C0E            ; 9C 0E 0C | Store zero to absolute
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BCC $00              ; 90 00 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BCC $14              ; 90 14 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BVC $38              ; 50 38 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BMI $A0              ; 30 A0 | Branch if negative
    PEA #$00E8           ; F4 E8 00 | Push effective address to stack
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BEQ $58              ; F0 58 | Branch if equal
    BCS $A0              ; B0 A0 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $1F2F            ; 0E 2F 1F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STZ $1B              ; 64 1B | Store zero to zero page
    DEC $26              ; C6 26 | Decrement (zero page)
    LDA ($61,X)          ; A1 61 | Read graphics status
    ADC $303D,X          ; 7D 3D 30 | Add with carry (absolute,X)
    BPL $12              ; 10 12 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ADC $7C              ; 65 7C | Add with carry (zero page)
    ADC $7F              ; 65 7F | Add with carry (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    STZ $26              ; 64 26 | Store zero to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    AND ($03,X)          ; 21 03 | Logical AND with accumulator ((zero page,X))
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_246
; Address: $DFCEDD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_246:
    CLC                  ; 18 | Clear carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $E0              ; 10 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $FCF8            ; EC F8 FC | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_247
; Address: $DFCF00
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_247:
    JSR $00D8            ; 20 D8 00 | Jump to subroutine
    BVC $BC              ; 50 BC | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    ASL $26E0            ; 0E E0 26 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    JMP ($8681)          ; 6C 81 86 | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $0E3C,X          ; 3E 3C 0E | Rotate left (absolute,X)
    LSR $1C0C            ; 4E 0C 1C | Logical shift right (absolute)
    LDX $A63E            ; AE 3E A6 | Load from absolute address into X register
    INC $0601,X          ; FE 01 06 | Increment (absolute,X)
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    STZ $E6              ; 64 E6 | Store zero to zero page
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    PEA #$F0F4           ; F4 F4 F0 | Push effective address to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    BEQ $80              ; F0 80 | Branch if equal
    ROR $FE              ; 66 FE | Rotate right (zero page)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BNE $F8              ; D0 F8 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $F8F0            ; EC F0 F8 | Compare X register (absolute)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $1F2F            ; 0E 2F 1F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STZ $1B              ; 64 1B | Store zero to zero page

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_248
; Address: $DFCF6C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_248:
    INC $16              ; E6 16 | Increment (zero page)
    CMP ($21,X)          ; C1 21 | PPU graphics register access
    ADC $303D,X          ; 7D 3D 30 | Add with carry (absolute,X)
    BPL $12              ; 10 12 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ADC $7F              ; 65 7F | Add with carry (zero page)
    BRA $60              ; 80 60 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $22              ; 50 22 | Branch if overflow clear
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $E0              ; 10 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $FCF8            ; EC F8 FC | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_249
; Address: $DFCFC0
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_249:
    JSR $00D8            ; 20 D8 00 | Jump to subroutine
    BVC $BC              ; 50 BC | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    ASL $26E0            ; 0E E0 26 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    STZ $85              ; 64 85 | Store zero to zero page
    STX $7C              ; 86 7C | Store X register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    ROL $0E3C,X          ; 3E 3C 0E | Rotate left (absolute,X)
    LSR $1C0C            ; 4E 0C 1C | Logical shift right (absolute)
    LDX $3E              ; A6 3E | Load from zero page into X register
    LDX $FE              ; A6 FE | Load from zero page into X register
    ORA $491E,Y          ; 19 1E 49 | Logical OR with accumulator (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    PEA #$3EF4           ; F4 F4 3E | Push effective address to stack
    ROL $181A,X          ; 3E 1A 18 | Rotate left (absolute,X)
    STY $C0              ; 84 C0 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_24A
; Address: $DFCFF0
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_24A:
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    BEQ $3C              ; F0 3C | Branch if equal
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_24C
; Address: $DFCFFC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_24C:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $2B00,Y          ; 19 00 2B | Logical OR with accumulator (absolute,Y)
    AND $7F1F,Y          ; 39 1F 7F | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_24D
; Address: $DFD020
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_24D:
    JSR $101F            ; 20 1F 10 | Jump to subroutine
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $7B0E            ; 0E 0E 7B | Arithmetic shift left (absolute)
    ADC $7039,Y          ; 79 39 70 | Add with carry (absolute,Y)
    BMI $24              ; 30 24 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_24E
; Address: $DFD037
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_24E:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1016,X          ; 1E 16 10 | Arithmetic shift left (absolute,X)
    ORA $0E01            ; 0D 01 0E | Logical OR with accumulator (absolute)
    ASL $0F06            ; 0E 06 0F | Arithmetic shift left (absolute)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_250
; Address: $DFD06A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_250:
    JSR $90C8            ; 20 C8 90 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    STZ $9C              ; 64 9C | Store zero to zero page
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BMI $FE              ; 30 FE | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    CMP $FAFE,Y          ; D9 FE FA | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BRA $78              ; 80 78 | Branch always
    BVC $AC              ; 50 AC | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_251
; Address: $DFD08A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_251:
    JSR $3254            ; 20 54 32 | Jump to subroutine
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC $7DFA,Y          ; F9 FA 7D | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_252
; Address: $DFD097
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_252:
    ROL $3E7D,X          ; 3E 7D 3E | Rotate left (absolute,X)
    SBC $7C76,X          ; FD 76 7C | Subtract with carry (absolute,X)
    PEA #$FA3E           ; F4 3E FA | Push effective address to stack
    ORA #$32             ; 09 32 | Logical OR with accumulator (immediate)
    EOR ($BA,X)          ; 41 BA | Exclusive OR with accumulator ((zero page,X))
    SEP #$64             ; E2 64 | Set processor status bits
    EOR $0359,Y          ; 59 59 03 | Exclusive OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    ROL $3E60            ; 2E 60 3E | Rotate left (absolute)
    PLX                  ; FA | Pull X register from stack
    ASL $7C3A,X          ; 1E 3A 7C | Arithmetic shift left (absolute,X)
    INX                  ; E8 | Increment X register
    INC $5FFC,X          ; FE FC 5F | Increment (absolute,X)
    LDX $1EA0,Y          ; BE A0 1E | Load from absolute,Y into X register
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    ORA $2B00,Y          ; 19 00 2B | Logical OR with accumulator (absolute,Y)
    AND $7F1F,Y          ; 39 1F 7F | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_253
; Address: $DFD0E0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_253:
    JSR $101F            ; 20 1F 10 | Jump to subroutine
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $7B0E            ; 0E 0E 7B | Arithmetic shift left (absolute)
    ADC $7039,Y          ; 79 39 70 | Add with carry (absolute,Y)
    BMI $24              ; 30 24 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_254
; Address: $DFD0F7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_254:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $0907,X          ; 1E 07 09 | Arithmetic shift left (absolute,X)
    ORA #$28             ; 09 28 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    BPL $02              ; 10 02 | Branch if positive
    ORA $2F              ; 05 2F | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $0805            ; 0D 05 08 | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_256
; Address: $DFD12A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_256:
    JSR $90C8            ; 20 C8 90 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    STZ $9C              ; 64 9C | Store zero to zero page
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BMI $FE              ; 30 FE | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    CMP $FAFE,Y          ; D9 FE FA | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_257
; Address: $DFD13F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_257:
    SED                  ; F8 | Set decimal mode flag
    BRA $78              ; 80 78 | Branch always
    BVC $AC              ; 50 AC | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $64              ; 10 64 | Branch if positive
    INC                  ; 1A | Increment accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_258
; Address: $DFD14E
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_258:
    AND #$32             ; 29 32 | Logical AND with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC $7DFA,Y          ; F9 FA 7D | Subtract with carry (absolute,Y)
    ROL $3E7C,X          ; 3E 7C 3E | Rotate left (absolute,X)
    INC $7C75,X          ; FE 75 7C | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ROL $19DA,X          ; 3E DA 19 | Rotate left (absolute,X)
    STA ($66),Y          ; 91 66 | Update graphics data
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    CPY $76              ; C4 76 | Compare Y register (zero page)
    LDX $1E80,Y          ; BE 80 1E | Load from absolute,Y into X register
    NOP                  ; EA | No operation
    ASL $8C06            ; 0E 06 8C | Arithmetic shift left (absolute)
    STY $D8DC            ; 8C DC D8 | Store Y register to absolute address
    INC $7FDC,X          ; FE DC 7F | Increment (absolute,X)
    INC $7E80            ; EE 80 7E | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    SEC                  ; 38 | Set carry flag
    LDA $D3DE            ; AD DE D3 | Read graphics status
    LDY $ABD4            ; AC D4 AB | Load from absolute address into Y register
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_259
; Address: $DFD1B4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_259:
    JSR $0407            ; 20 07 04 | Jump to subroutine
    STA                  ; 9F 74 5E 33 | Update graphics data
    EOR $7B              ; 45 7B | Exclusive OR with accumulator (zero page)
    EOR $6B33            ; 4D 33 6B | Exclusive OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    AND $4405,X          ; 3D 05 44 | Logical AND with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_25A
; Address: $DFD1F8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_25A:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack
    AND $DA35,X          ; 3D 35 DA | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $D6              ; F0 D6 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SBC $F800,X          ; FD 00 F8 | Subtract with carry (absolute,X)
    CMP ($A5,X)          ; C1 A5 | Compare accumulator ((zero page,X))
    CPY $35              ; C4 35 | Compare Y register (zero page)
    CPX $B0              ; E4 B0 | Compare X register (zero page)
    PEA #$F85A           ; F4 5A F8 | Push effective address to stack
    BMI $00              ; 30 00 | Branch if negative
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    SEC                  ; 38 | Set carry flag
    STA $ABEE,X          ; 9D EE AB | Update graphics data
    STY $107B            ; 8C 7B 10 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_25C
; Address: $DFD281
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_25C:
    CLC                  ; 18 | Clear carry flag
    ROL $6523,X          ; 3E 23 65 | Rotate left (absolute,X)
    EOR $5C73            ; 4D 73 5C | Exclusive OR with accumulator (absolute)
    ADC $6A3F            ; 6D 3F 6A | Add with carry (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_25D
; Address: $DFD2B8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_25D:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_25E
; Address: $DFD2CC
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_25E:
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    CMP $0008,X          ; DD 08 00 | Compare accumulator (absolute,X)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $D6              ; F0 D6 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SBC $F500,X          ; FD 00 F5 | Subtract with carry (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    DEC $27              ; C6 27 | Decrement (zero page)
    SBC ($A5),Y          ; F1 A5 | Subtract with carry ((zero page),Y)
    CPY $D5              ; C4 D5 | Compare Y register (zero page)
    CPX $F0              ; E4 F0 | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    LDY #$38             ; A0 38 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    INC                  ; 1A | Increment accumulator
    LDY $E0              ; A4 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA $0B12            ; 0D 12 0B | Logical OR with accumulator (absolute)
    ORA ($76),Y          ; 11 76 | Logical OR with accumulator ((zero page),Y)
    ROR $E0              ; 66 E0 | Game work RAM access
    DEC $10D8,X          ; DE D8 10 | Decrement (absolute,X)
    ADC #$10             ; 69 10 | Add with carry (immediate)
    STA $78              ; 85 78 | Update graphics data
    CMP $F960,Y          ; D9 60 F9 | Compare accumulator (absolute,Y)
    NOP                  ; EA | No operation
    LDA $A6CE,Y          ; B9 CE A6 | Read graphics status
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    BCS $CA              ; B0 CA | Branch if carry set
    TXS                  ; 9A | Transfer X register to stack pointer
    SEP #$BA             ; E2 BA | Set processor status bits
    PHY                  ; 5A | Push Y register to stack
    ROR $F802,X          ; 7E 02 F8 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ADC $3500,Y          ; 79 00 35 | Add with carry (absolute,Y)
    CMP $FD00            ; CD 00 FD | Compare accumulator (absolute)
    ADC $0200,X          ; 7D 00 02 | Add with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_25F
; Address: $DFD378
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_25F:
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    STY $44F8            ; 8C F8 44 | Store Y register to absolute address
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $80              ; A4 80 | Load from zero page into Y register
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_261
; Address: $DFD39C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_261:
    LDY #$58             ; A0 58 | Load immediate value into Y register
    BNE $88              ; D0 88 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    BEQ $90              ; F0 90 | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_262
; Address: $DFD3AE
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_262:
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $B4              ; F0 B4 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    BMI $F8              ; 30 F8 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA $0B12            ; 0D 12 0B | Logical OR with accumulator (absolute)
    BPL $71              ; 10 71 | Branch if positive
    ADC ($EC),Y          ; 71 EC | Add with carry ((zero page),Y)
    LDY $FAE7            ; AC E7 FA | Load from absolute address into Y register
    BPL $00              ; 10 00 | Branch if positive
    ORA $7200,X          ; 1D 00 72 | Logical OR with accumulator (absolute,X)
    LDA $FE72            ; AD 72 FE | Read graphics status
    RTI                  ; 40 | Return from interrupt
    PHX                  ; DA | Push X register to stack
    INC $92              ; E6 92 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_263
; Address: $DFD404
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_263:
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    CPY $98F2            ; CC F2 98 | Compare Y register (absolute)
    INC $70BE            ; EE BE 70 | Increment (absolute)
    ADC $FE08,Y          ; 79 08 FE | Add with carry (absolute,Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ROL $4700,X          ; 3E 00 47 | Rotate left (absolute,X)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    STY $04F8            ; 8C F8 04 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    STZ $0498            ; 9C 98 04 | Store zero to absolute
    BRA $A4              ; 80 A4 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_264
; Address: $DFD454
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_264:
    BPL $00              ; 10 00 | Branch if positive
    BRA $3C              ; 80 3C | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_265
; Address: $DFD45B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_265:
    JSR $1860            ; 20 60 18 | Jump to subroutine
    BVC $08              ; 50 08 | Branch if overflow clear
    STY $74              ; 84 74 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BPL $B0              ; 10 B0 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    BCC $F0              ; 90 F0 | Branch if carry clear
    BMI $34              ; 30 34 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BMI $78              ; 30 78 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_266
; Address: $DFD49A
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_266:
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    ADC ($61),Y          ; 71 61 | Add with carry ((zero page),Y)
    BCC $A0              ; 90 A0 | Branch if carry clear
    NOP                  ; EA | No operation
    BRA $10              ; 80 10 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPY $0B              ; C4 0B | Compare Y register (zero page)
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    BIT $6A9B            ; 2C 9B 6A | Test bits in accumulator (absolute)
    CPX $8C              ; E4 8C | Compare X register (zero page)
    STA $278CA3          ; 8F A3 8C 27 | Update graphics data
    LDA $2B2E2D          ; AF 2D 2E 2B | Read graphics status
    LSR $0A              ; 46 0A | Logical shift right (zero page)
    STZ $DF03            ; 9C 03 DF | Store zero to absolute

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_267
; Address: $DFD4DE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_267:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_268
; Address: $DFD4F8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_268:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCC $48              ; 90 48 | Branch if carry clear
    BRA $4E              ; 80 4E | Branch always
    PLX                  ; FA | Pull X register from stack
    LDA $1FFB            ; AD FB 1F | Read graphics status
    ORA ($8B),Y          ; 11 8B | Logical OR with accumulator ((zero page),Y)
    STA $0D              ; 85 0D | Update graphics data
    ASL $56              ; 06 56 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_269
; Address: $DFD513
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_269:
    BMI $42              ; 30 42 | Hardware register operation
    CPX #$47             ; E0 47 | Compare X register (immediate)
    BMI $26              ; 30 26 | Branch if negative
    BNE $28              ; D0 28 | Branch if not equal
    BRA $F4              ; 80 F4 | Branch always
    LSR $362A,X          ; 5E 2A 36 | Logical shift right (absolute,X)
    INC $DA              ; E6 DA | Increment (zero page)
    INY                  ; C8 | Increment Y register
    CPX $1CF6            ; EC F6 1C | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_26A
; Address: $DFD52F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_26A:
    JSR $603C            ; 20 3C 60 | Jump to subroutine
    LSR $3EE0,X          ; 5E E0 3E | Logical shift right (absolute,X)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_26B
; Address: $DFD53E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_26B:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 78 68 91 | Update graphics data
    LDA ($F0,X)          ; A1 F0 | Read graphics status
    BRA $8A              ; 80 8A | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_26C
; Address: $DFD56F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_26C:
    JSR $0610            ; 20 10 06 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $07              ; 80 07 | Branch always
    REP #$0C             ; C2 0C | Reset processor status bits
    STY $0B              ; 84 0B | Store Y register to zero page
    EOR ($9F,X)          ; 41 9F | Exclusive OR with accumulator ((zero page,X))
    JMP ($8AEB)          ; 6C EB 8A | Jump to address (absolute indirect)
    STY $AC              ; 84 AC | Store Y register to zero page
    LDA $2B23            ; AD 23 2B | Read graphics status
    CLC                  ; 18 | Clear carry flag
    ASL $9A              ; 06 9A | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_26D
; Address: $DFD5B8
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_26D:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCC $48              ; 90 48 | Branch if carry clear
    BRA $4C              ; 80 4C | Branch always
    SED                  ; F8 | Set decimal mode flag
    LDX $19FA            ; AE FA 19 | Load from absolute address into X register
    STA $050B81          ; 8F 81 0B 05 | Update graphics data
    ASL $6008            ; 0E 08 60 | Arithmetic shift left (absolute)
    BMI $40              ; 30 40 | Branch if negative
    CPX #$47             ; E0 47 | Compare X register (immediate)
    BMI $27              ; 30 27 | Branch if negative
    BNE $2E              ; D0 2E | Branch if not equal
    BRA $F6              ; 80 F6 | Branch always
    SEC                  ; 38 | Set carry flag
    JMP $F2362A          ; 5C 2A 36 F2 | Jump to address long
    DEC $EC32            ; CE 32 EC | Decrement (absolute)
    INC $76B4,X          ; FE B4 76 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_26E
; Address: $DFD5F2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_26E:
    JMP $C03EE0          ; 5C E0 3E C0 | Jump to address long
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    ASL $130F            ; 0E 0F 13 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_26F
; Address: $DFD61E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_26F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_271
; Address: $DFD62C
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_271:
    JSR $4540            ; 20 40 45 | Jump to subroutine
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    ASL $85              ; 06 85 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    PLB                  ; AB | Pull data bank register from stack
    ORA ($BE),Y          ; 11 BE | Logical OR with accumulator ((zero page),Y)
    LDA $524D            ; AD 4D 52 | Read graphics status
    ASL $0F5D,X          ; 1E 5D 0F | Arithmetic shift left (absolute,X)
    EOR #$55             ; 49 55 | Exclusive OR with accumulator (immediate)
    LSR $0E              ; 46 0E | Logical shift right (zero page)
    ORA $B31E            ; 0D 1E B3 | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 AF 00 | Read graphics status
    LDA                  ; BF 00 AE 00 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_272
; Address: $DFD67A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_272:
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    BCS $48              ; B0 48 | Branch if carry set
    BNE $68              ; D0 68 | Branch if not equal
    BNE $48              ; D0 48 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ROL $A736,X          ; 3E 36 A7 | Rotate left (absolute,X)
    LDA ($5B,X)          ; A1 5B | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_273
; Address: $DFD694
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_273:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LDA ($DE,X)          ; A1 DE | Read graphics status

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_274
; Address: $DFD69F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_274:
    STX $9F              ; 86 9F | Store X register to zero page
    AND $65F3            ; 2D F3 65 | Logical AND with accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    STY $D32D            ; 8C 2D D3 | Store Y register to absolute address
    AND $DDE7,Y          ; 39 E7 DD | Logical AND with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    ROR $FF40,X          ; 7E 40 FF | Rotate right (absolute,X)
    INC $EC00,X          ; FE 00 EC | Increment (absolute,X)
    ROL $4000,X          ; 3E 00 40 | Rotate left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $130F            ; 0E 0F 13 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_275
; Address: $DFD6DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_275:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_277
; Address: $DFD6EC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_277:
    JSR $2500            ; 20 00 25 | Jump to subroutine
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $45              ; 06 45 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ORA ($5E),Y          ; 11 5E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_278
; Address: $DFD701
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_278:
    JSL $322D6D          ; 22 6D 2D 32 | Jump to subroutine long
    ASL $0A3D,X          ; 1E 3D 0A | Arithmetic shift left (absolute,X)
    AND $3936            ; 2D 36 39 | Logical AND with accumulator (absolute)
    AND $0F2B,X          ; 3D 2B 0F | Logical AND with accumulator (absolute,X)
    ORA $531E            ; 0D 1E 53 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_279
; Address: $DFD71E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_279:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_27A
; Address: $DFD73A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_27A:
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    BCS $48              ; B0 48 | Branch if carry set
    BNE $68              ; D0 68 | Branch if not equal
    BNE $48              ; D0 48 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ROL $26              ; 26 26 | Rotate left (zero page)
    LDA ($57),Y          ; B1 57 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_27B
; Address: $DFD754
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_27B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    INC $38              ; E6 38 | Increment (zero page)
    LDA ($CE),Y          ; B1 CE | Read graphics status
    STA $FA25F3          ; 8F F3 25 FA | Update graphics data
    STA ($6E),Y          ; 91 6E | Update graphics data
    DEC $B330            ; CE 30 B3 | Decrement (absolute)
    STA $FDF7,Y          ; 99 F7 FD | Update graphics data
    STX $109E            ; 8E 9E 10 | Store X register to absolute address
    INC $EE00,X          ; FE 00 EE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    STX $1000            ; 8E 00 10 | Store X register to absolute address
    BVS $20              ; 70 20 | Branch if overflow set
    BVC $03              ; 50 03 | Branch if overflow clear
    BVC $05              ; 50 05 | Branch if overflow clear
    BVC $1F              ; 50 1F | Branch if overflow clear
    DEC                  ; 3A | Decrement accumulator
    ASL $0C2C            ; 0E 2C 0C | Arithmetic shift left (absolute)
    ROR $162E            ; 6E 2E 16 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_27C
; Address: $DFD791
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_27C:
    JSR $7304            ; 20 04 73 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ROL $B16E            ; 2E 6E B1 | Rotate left (absolute)
    ADC ($9D),Y          ; 71 9D | Add with carry ((zero page),Y)
    BIT #$57             ; 89 57 | Test bits in accumulator (immediate)
    ORA ($3E),Y          ; 11 3E | Logical OR with accumulator ((zero page),Y)
    LDA $1A              ; A5 1A | Read graphics status
    STA ($0E),Y          ; 91 0E | Update graphics data
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_27D
; Address: $DFD7B9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_27D:
    JSR $0008            ; 20 08 00 | Jump to subroutine
    ROR $3F              ; 66 3F | Rotate right (zero page)
    ADC $323C,Y          ; 79 3C 32 | Add with carry (absolute,Y)
    BPL $22              ; 10 22 | Branch if positive
    DEX                  ; CA | Decrement X register
    CPY #$6A             ; C0 6A | Compare Y register (immediate)
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BVS $34              ; 70 34 | Branch if overflow set
    BMI $76              ; 30 76 | Branch if negative
    JMP ($C06C)          ; 6C 6C C0 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_27E
; Address: $DFD7F2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_27E:
    JSR $10CE            ; 20 CE 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    BRA $7C              ; 80 7C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $88              ; F0 88 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_27F
; Address: $DFD7FF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_27F:
    CPX $5A5A            ; EC 5A 5A | Compare X register (absolute)
    STA $C6              ; 85 C6 | Update graphics data
    PEA #$FCB4           ; F4 B4 FC | Push effective address to stack
    CPY $F8              ; C4 F8 | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    LDA $58              ; A5 58 | Read graphics status
    EOR #$30             ; 49 30 | Exclusive OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    ROL $5EFC,X          ; 3E FC 5E | Rotate left (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    CLV                  ; B8 | Clear overflow flag
    LSR $6C              ; 46 6C | Logical shift right (zero page)
    CPY $40              ; C4 40 | Compare Y register (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BRA $10              ; 80 10 | Branch always
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_280
; Address: $DFD840
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_280:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BVC $05              ; 50 05 | Branch if overflow clear
    BVC $1F              ; 50 1F | Branch if overflow clear
    DEC                  ; 3A | Decrement accumulator
    ASL $0C2C            ; 0E 2C 0C | Arithmetic shift left (absolute)
    ROR $162E            ; 6E 2E 16 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_281
; Address: $DFD851
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_281:
    JSR $7304            ; 20 04 73 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ADC $A16D            ; 6D 6D A1 | Add with carry (absolute)
    CMP #$6F             ; C9 6F | Compare accumulator (immediate)
    ADC #$2F             ; 69 2F | Add with carry (immediate)
    AND $233F            ; 2D 3F 23 | Logical AND with accumulator (absolute)
    LDA $1A              ; A5 1A | Read graphics status
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    ORA $3662,X          ; 1D 62 36 | Logical OR with accumulator (absolute,X)
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_282
; Address: $DFD88C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_282:
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $0700,X          ; 1E 00 07 | Arithmetic shift left (absolute,X)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    DEX                  ; CA | Decrement X register
    CPY #$6A             ; C0 6A | Compare Y register (immediate)
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BVS $34              ; 70 34 | Branch if overflow set
    BMI $76              ; 30 76 | Branch if negative
    JMP ($C06C)          ; 6C 6C C0 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_283
; Address: $DFD8B2
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_283:
    JSR $10CE            ; 20 CE 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    BRA $7C              ; 80 7C | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $88              ; F0 88 | Branch if equal
    CPX $5A58            ; EC 58 5A | Compare X register (absolute)
    STA $B98E            ; 8D 8E B9 | Update graphics data
    INC $EA91            ; EE 91 EA | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    PEA #$F8C4           ; F4 C4 F8 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    LDA $58              ; A5 58 | Read graphics status
    BIT #$70             ; 89 70 | Test bits in accumulator (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    BMI $FC              ; 30 FC | Branch if negative
    ROR $FC              ; 66 FC | Rotate right (zero page)
    INC $FC              ; E6 FC | Increment (zero page)
    STZ $4C3C,X          ; 9E 3C 4C | Store zero to absolute,X
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $0F0C            ; 0E 0C 0F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $020F,Y          ; 19 0F 02 | Logical OR with accumulator (absolute,Y)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_284
; Address: $DFD91D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_284:
    PHP                  ; 08 | Push processor status to stack
    AND $1019,Y          ; 39 19 10 | Logical AND with accumulator (absolute,Y)
    BIT $2F              ; 24 2F | Test bits in accumulator (zero page)
    WDM #$1E             ; 42 1E | Reserved instruction
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_285
; Address: $DFD92A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_285:
    JSR $250F            ; 20 0F 25 | Jump to subroutine
    PHY                  ; 5A | Push Y register to stack
    ADC $1906,X          ; 7D 06 19 | Add with carry (absolute,X)
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ROL $6400,X          ; 3E 00 64 | Rotate left (absolute,X)
    ROR $3F70,X          ; 7E 70 3F | Rotate right (absolute,X)
    EOR ($1A),Y          ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
    CMP ($5E),Y          ; D1 5E | Compare accumulator ((zero page),Y)
    STY $00              ; 84 00 | Store Y register to zero page
    JMP $003C18          ; 5C 18 3C 00 | Jump to address long
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_286
; Address: $DFD954
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_286:
    JSR $2004            ; 20 04 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_287
; Address: $DFD95C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_287:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BCC $70              ; 90 70 | Branch if carry clear
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BEQ $78              ; F0 78 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    STZ $5CF8            ; 9C F8 5C | Store zero to absolute
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BIT $C8              ; 24 C8 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BRA $78              ; 80 78 | Branch always
    CLV                  ; B8 | Clear overflow flag
    BCS $90              ; B0 90 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $80              ; 30 80 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    BCS $30              ; B0 30 | Branch if carry set
    BCC $30              ; 90 30 | Branch if carry clear
    BVC $40              ; 50 40 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_288
; Address: $DFD991
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_288:
    BCS $20              ; B0 20 | Branch if carry set
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BMI $38              ; 30 38 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_289
; Address: $DFD9A3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_289:
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $A8              ; F0 A8 | Branch if equal
    CPX #$CC             ; E0 CC | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    JMP $006000          ; 5C 00 60 00 | Jump to address long
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_28A
; Address: $DFD9BC
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_28A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $0F0C            ; 0E 0C 0F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $020F,Y          ; 19 0F 02 | Logical OR with accumulator (absolute,Y)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND $2011,Y          ; 39 11 20 | Logical AND with accumulator (absolute,Y)
    ROL $1B00            ; 2E 00 1B | Rotate left (absolute)
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    STA ($59,X)          ; 81 59 | Update graphics data
    STX $7B              ; 86 7B | Store X register to zero page
    AND $1522,Y          ; 39 22 15 | Logical AND with accumulator (absolute,Y)
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    EOR ($20),Y          ; 51 20 | Exclusive OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_28B
; Address: $DFD9F6
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_28B:
    BRA $00              ; 80 00 | Branch always
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_28C
; Address: $DFD9FC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_28C:
    JSR $4104            ; 20 04 41 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    JMP $7F4863          ; 5C 63 48 7F | Jump to address long
    ROL $2E2F            ; 2E 2F 2E | Rotate left (absolute)
    ASL $0906            ; 0E 06 09 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_28E
; Address: $DFDA12
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_28E:
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $40              ; 80 40 | Branch always
    BCC $70              ; 90 70 | Branch if carry clear
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BEQ $78              ; F0 78 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    STZ $5CF8            ; 9C F8 5C | Store zero to absolute
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BIT $C8              ; 24 C8 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BRA $78              ; 80 78 | Branch always
    CLV                  ; B8 | Clear overflow flag
    BCS $90              ; B0 90 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BEQ $64              ; F0 64 | Branch if equal
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCS $20              ; B0 20 | Branch if carry set
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BMI $B8              ; 30 B8 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_28F
; Address: $DFDA5E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_28F:
    CPX #$20             ; E0 20 | Compare X register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_290
; Address: $DFDA63
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_290:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_291
; Address: $DFDA67
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_291:
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_294
; Address: $DFDA80
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_294:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BVC $05              ; 50 05 | Branch if overflow clear
    EOR ($1F),Y          ; 51 1F | Exclusive OR with accumulator ((zero page),Y)
    AND ($07),Y          ; 31 07 | Logical AND with accumulator ((zero page),Y)
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_295
; Address: $DFDA91
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_295:
    JSR $7304            ; 20 04 73 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    INC $77              ; E6 77 | Increment (zero page)
    STA $7E9939          ; 8F 39 99 7E | Update graphics data
    EOR ($38),Y          ; 51 38 | Exclusive OR with accumulator ((zero page),Y)
    AND #$3D             ; 29 3D | Logical AND with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    BMI $06              ; 30 06 | Branch if negative
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ORA ($4A,X)          ; 01 4A | Logical OR with accumulator ((zero page,X))
    ADC $6F3D            ; 6D 3D 6F | Add with carry (absolute)
    AND $1C36,X          ; 3D 36 1C | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_296
; Address: $DFDAC8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_296:
    JSL $105400          ; 22 00 54 10 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    CPY #$EA             ; C0 EA | Compare Y register (immediate)
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX $D4E0            ; EC E0 D4 | Compare X register (absolute)
    BCC $F6              ; 90 F6 | Branch if carry clear
    PEA #$ECED           ; F4 ED EC | Push effective address to stack
    CPY #$04             ; C0 04 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_297
; Address: $DFDAF2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_297:
    JSR $10CE            ; 20 CE 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    BPL $EC              ; 10 EC | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BCC $08              ; 90 08 | Branch if carry clear
    PEA #$EC12           ; F4 12 EC | Push effective address to stack
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    AND ($E7,X)          ; 21 E7 | Logical AND with accumulator ((zero page,X))
    CPX $98F8            ; EC F8 98 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_298
; Address: $DFDB12
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_298:
    EOR #$B0             ; 49 B0 | Exclusive OR with accumulator (immediate)
    CPX #$6E             ; E0 6E | Compare X register (immediate)
    BRA $88              ; 80 88 | Branch always
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$2080           ; F4 80 20 | Push effective address to stack
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SEP #$E4             ; E2 E4 | Set processor status bits
    LSR                  ; 4A | Logical shift right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ROL $E200,X          ; 3E 00 E2 | Rotate left (absolute,X)
    REP #$00             ; C2 00 | Reset processor status bits
    BRA $18              ; 80 18 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_29A
; Address: $DFDB40
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_29A:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    BVC $05              ; 50 05 | Branch if overflow clear
    EOR ($1F),Y          ; 51 1F | Exclusive OR with accumulator ((zero page),Y)
    AND ($07),Y          ; 31 07 | Logical AND with accumulator ((zero page),Y)
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_29B
; Address: $DFDB51
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_29B:
    JSR $7304            ; 20 04 73 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    AND $846D            ; 2D 6D 84 | Logical AND with accumulator (absolute)
    LDA #$69             ; A9 69 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    ROR $3F4C            ; 6E 4C 3F | Rotate right (absolute)
    ORA $AC1F,Y          ; 19 1F AC | Logical OR with accumulator (absolute,Y)
    ORA $07D8            ; 0D D8 07 | Logical OR with accumulator (absolute)
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ROL $386A,X          ; 3E 6A 38 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_29C
; Address: $DFDB8A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_29C:
    JSL $105200          ; 22 00 52 10 | Jump to subroutine long
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    CPY #$EA             ; C0 EA | Compare Y register (immediate)
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX $D4E0            ; EC E0 D4 | Compare X register (absolute)
    BCC $F6              ; 90 F6 | Branch if carry clear
    PEA #$EAEB           ; F4 EB EA | Push effective address to stack
    CPY #$04             ; C0 04 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_29D
; Address: $DFDBB2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_29D:
    JSR $10CE            ; 20 CE 10 | Jump to subroutine
    INC $FE00            ; EE 00 FE | Increment (absolute)
    BPL $EC              ; 10 EC | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BCC $08              ; 90 08 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_29E
; Address: $DFDBBD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_29E:
    PEA #$EA14           ; F4 14 EA | Push effective address to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX $EE67            ; AE 67 EE | Load from absolute address into X register
    SBC ($9C),Y          ; F1 9C | Subtract with carry ((zero page),Y)
    STA $8A7E,Y          ; 99 7E 8A | Update graphics data
    CPY $BC94            ; CC 94 BC | Compare Y register (absolute)
    CPY $D02B            ; CC 2B D0 | Compare Y register (absolute)
    EOR ($A0),Y          ; 51 A0 | Exclusive OR with accumulator ((zero page),Y)
    BPL $E0              ; 10 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_29F
; Address: $DFDBDC
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_29F:
    STY $20              ; 84 20 | Store Y register to zero page
    REP #$80             ; C2 80 | Reset processor status bits
    LDY $BCF6,X          ; BC F6 BC | Load from absolute,X into Y register
    JMP ($4438)          ; 6C 38 44 | Jump to address (absolute indirect)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ASL $1E0F            ; 0E 0F 1E | Arithmetic shift left (absolute)
    AND $3A1F,Y          ; 39 1F 3A | Logical AND with accumulator (absolute,Y)
    ASL $0003,X          ; 1E 03 00 | Arithmetic shift left (absolute,X)
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A0
; Address: $DFDC18
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A0:
    JSR $241F            ; 20 1F 24 | Jump to subroutine
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA $090D,X          ; 1D 0D 09 | Logical OR with accumulator (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0D0F            ; 0E 0F 0D | Arithmetic shift left (absolute)
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0304            ; 0D 04 03 | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A2
; Address: $DFDC65
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A2:
    JSR $3070            ; 20 70 30 | Jump to subroutine
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    BPL $98              ; 10 98 | Branch if positive
    BEQ $40              ; F0 40 | Branch if equal
    BRA $20              ; 80 20 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    BEQ $9C              ; F0 9C | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    BIT $F4              ; 24 F4 | Test bits in accumulator (zero page)
    WDM #$78             ; 42 78 | Reserved instruction
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $A4              ; F0 A4 | Branch if equal
    PHY                  ; 5A | Push Y register to stack
    LDX $9860,Y          ; BE 60 98 | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $00              ; 84 00 | Store Y register to zero page
    STY $20              ; 84 20 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    ROL $00              ; 26 00 | Rotate left (zero page)
    DEC $7E              ; C6 7E | Decrement (zero page)
    ASL $8AFC            ; 0E FC 8A | Arithmetic shift left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    PHB                  ; 8B | Push data bank register to stack
    PLY                  ; 7A | Pull Y register from stack
    CMP $3C              ; C5 3C | Compare accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A3
; Address: $DFDCB5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A3:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ASL $1E0F            ; 0E 0F 1E | Arithmetic shift left (absolute)
    AND $3A1F,Y          ; 39 1F 3A | Logical AND with accumulator (absolute,Y)
    ASL $0003,X          ; 1E 03 00 | Arithmetic shift left (absolute,X)
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A5
; Address: $DFDCDE
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A5:
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA $090D,X          ; 1D 0D 09 | Logical OR with accumulator (absolute,X)
    BPL $0F              ; 10 0F | Branch if positive
    ROL $17              ; 26 17 | Rotate left (zero page)
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    ORA $0304            ; 0D 04 03 | Logical OR with accumulator (absolute)
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A6
; Address: $DFDD25
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A6:
    JSR $3070            ; 20 70 30 | Jump to subroutine
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    BPL $98              ; 10 98 | Branch if positive
    BEQ $40              ; F0 40 | Branch if equal
    BRA $20              ; 80 20 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    BEQ $9C              ; F0 9C | Branch if equal
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    INC $9A81,X          ; FE 81 9A | Increment (absolute,X)
    ADC ($DE,X)          ; 61 DE | Add with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    STZ $A844            ; 9C 44 A8 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A7
; Address: $DFDD51
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A7:
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A8
; Address: $DFDD5D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A8:
    JSR $1082            ; 20 82 10 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    DEC $12              ; C6 12 | Decrement (zero page)
    INC $F474,X          ; FE 74 F4 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2A9
; Address: $DFDD67
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2A9:
    PEA #$F038           ; F4 38 F0 | Push effective address to stack
    BVS $60              ; 70 60 | Branch if overflow set
    BCC $80              ; 90 80 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2AB
; Address: $DFDD89
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2AB:
    JSR $427D            ; 20 7D 42 | Hardware register operation
    ADC $7846,Y          ; 79 46 78 | Add with carry (absolute,Y)
    BPL $7F              ; 10 7F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    CPX #$BC             ; E0 BC | Compare X register (immediate)
    LDA                  ; BF 60 3F 00 | Read graphics status
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2AC
; Address: $DFDDC7
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2AC:
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $5A41,X          ; 7E 41 5A | Rotate right (absolute,X)
    ADC $24              ; 65 24 | Add with carry (zero page)
    LDA                  ; BF 00 7F 00 | Read graphics status
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CPX $1C              ; E4 1C | Compare X register (zero page)
    PEA #$F20C           ; F4 0C F2 | Push effective address to stack
    ASL $0EF2            ; 0E F2 0E | Arithmetic shift left (absolute)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPY $18E4            ; CC E4 18 | Compare Y register (absolute)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPX $12F4            ; EC F4 12 | Compare X register (absolute)
    DEC $3601            ; CE 01 36 | Decrement (absolute)
    SBC $FC0E,X          ; FD 0E FC | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX $00              ; E4 00 | Compare X register (zero page)
    ASL $3F00            ; 0E 00 3F | Arithmetic shift left (absolute)
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    ASL $EA              ; 06 EA | Arithmetic shift left (zero page)
    STX $24AC            ; 8E AC 24 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2AD
; Address: $DFDE36
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2AD:
    ASL $FE00,X          ; 1E 00 FE | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BMI $2F              ; 30 2F | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2AE
; Address: $DFDE49
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2AE:
    JSR $427D            ; 20 7D 42 | Hardware register operation
    ADC $7846,Y          ; 79 46 78 | Add with carry (absolute,Y)
    BPL $7F              ; 10 7F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    BRA $6C              ; 80 6C | Branch always
    LDA                  ; BF 70 3F 00 | Read graphics status
    BVS $00              ; 70 00 | Branch if overflow set
    STA                  ; 9F 60 7F 00 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2AF
; Address: $DFDE87
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2AF:
    PLA                  ; 68 | Pull accumulator from stack
    ROR $3571            ; 6E 71 35 | Rotate right (absolute)
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ROL                  ; 2A | Rotate left (accumulator)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CPX $1C              ; E4 1C | Compare X register (zero page)
    PEA #$F20C           ; F4 0C F2 | Push effective address to stack
    ASL $0EF2            ; 0E F2 0E | Arithmetic shift left (absolute)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPY $18E4            ; CC E4 18 | Compare Y register (absolute)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPX $12F4            ; EC F4 12 | Compare X register (absolute)
    DEX                  ; CA | Decrement X register
    AND $FDC6,X          ; 3D C6 FD | Logical AND with accumulator (absolute,X)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX $00              ; E4 00 | Compare X register (zero page)
    ASL $3F00            ; 0E 00 3F | Arithmetic shift left (absolute)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ASL $E4              ; 06 E4 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ROR $5A82,X          ; 7E 82 5A | Rotate right (absolute,X)
    LDX $24              ; A6 24 | Load from zero page into X register
    BMI $F8              ; 30 F8 | Branch if negative
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    INC $00              ; E6 00 | Increment (zero page)
    ASL $FE00,X          ; 1E 00 FE | Arithmetic shift left (absolute,X)
    DEC $C820,X          ; DE 20 C8 | Decrement (absolute,X)
    BPL $2F              ; 10 2F | Branch if positive
    BMI $5E              ; 30 5E | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B0
; Address: $DFDF0B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B0:
    ADC ($5C,X)          ; 61 5C | Add with carry ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($7D,X)          ; 81 7D | Update graphics data
    STX $7B              ; 86 7B | Store X register to zero page
    JMP $3C33            ; 4C 33 3C | Jump to address
    ASL $0E03,X          ; 1E 03 0E | Arithmetic shift left (absolute,X)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    JMP $047E            ; 4C 7E 04 | Jump to address
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    AND $3F00,Y          ; 39 00 3F | Logical AND with accumulator (absolute,Y)
    ADC $7900,X          ; 7D 00 79 | Add with carry (absolute,X)
    JMP $6679            ; 4C 79 66 | Jump to address
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    JMP ($203C)          ; 6C 3C 20 | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $00              ; 70 00 | Branch if overflow set
    AND $5F00,Y          ; 39 00 5F | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B2
; Address: $DFDF63
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B2:
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BMI $E8              ; 30 E8 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B3
; Address: $DFDF6B
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B3:
    BEQ $06              ; F0 06 | Branch if equal
    JMP ($0060)          ; 6C 60 00 | Jump to address (absolute indirect)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $F0              ; 70 F0 | Branch if overflow set
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BNE $10              ; D0 10 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BCS $30              ; B0 30 | Branch if carry set
    LDY #$28             ; A0 28 | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    BNE $38              ; D0 38 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B4
; Address: $DFDF92
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B4:
    PLP                  ; 28 | Pull processor status from stack
    BRA $30              ; 80 30 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BPL $20              ; 10 20 | Branch if positive
    CPY $F4              ; C4 F4 | Compare Y register (zero page)
    PEA #$D808           ; F4 08 D8 | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BCS $D0              ; B0 D0 | Branch if carry set
    BEQ $00              ; F0 00 | Branch if equal
    ROL                  ; 2A | Rotate left (accumulator)
    BNE $30              ; D0 30 | Branch if not equal
    INY                  ; C8 | Increment Y register
    PEA #$C008           ; F4 08 C0 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B5
; Address: $DFDFBB
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B5:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BPL $2F              ; 10 2F | Branch if positive
    BMI $5E              ; 30 5E | Branch if negative
    ADC ($5C,X)          ; 61 5C | Add with carry ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($7D,X)          ; 81 7D | Update graphics data
    STX $7B              ; 86 7B | Store X register to zero page
    JMP $3C33            ; 4C 33 3C | Jump to address
    ASL $0E03,X          ; 1E 03 0E | Arithmetic shift left (absolute,X)
    AND ($19),Y          ; 31 19 | Logical AND with accumulator ((zero page),Y)
    ROL $1A              ; 26 1A | Rotate left (zero page)
    ADC $7E              ; 65 7E | Add with carry (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    AND $3F00,Y          ; 39 00 3F | Logical AND with accumulator (absolute,Y)
    EOR ($77),Y          ; 51 77 | Exclusive OR with accumulator ((zero page),Y)
    JMP $077B            ; 4C 7B 07 | Jump to address
    RTI                  ; 40 | Return from interrupt
    BVC $5D              ; 50 5D | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B6
; Address: $DFE00B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B6:
    JSL $3F0D6A          ; 22 6A 0D 3F | Jump to subroutine long
    ROR $3F00,X          ; 7E 00 3F | Rotate right (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    AND $1102,X          ; 3D 02 11 | Logical AND with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B7
; Address: $DFE023
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B7:
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BMI $E8              ; 30 E8 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2B9
; Address: $DFE02B
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2B9:
    BEQ $06              ; F0 06 | Branch if equal
    JMP ($0060)          ; 6C 60 00 | Jump to address (absolute indirect)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $F0              ; 70 F0 | Branch if overflow set
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BNE $10              ; D0 10 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BCS $30              ; B0 30 | Branch if carry set
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVC $F0              ; 50 F0 | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $30              ; 80 30 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    BPL $20              ; 10 20 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CPY $F4              ; C4 F4 | Compare Y register (zero page)
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    BCC $70              ; 90 70 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BVC $14              ; 50 14 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPX #$08             ; E0 08 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    BMI $2E              ; 30 2E | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2BA
; Address: $DFE089
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2BA:
    JSL $604778          ; 22 78 47 60 | Jump to subroutine long
    JMP $000B63          ; 5C 63 0B 00 | Jump to address long
    ROL $7C13            ; 2E 13 7C | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $0D20            ; 2D 20 0D | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2BB
; Address: $DFE0A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2BB:
    BPL $1E              ; 10 1E | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    STA ($75),Y          ; 91 75 | Update graphics data
    NOP                  ; EA | No operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2BD
; Address: $DFE0B4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2BD:
    JSR $2301            ; 20 01 23 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    INC $0200,X          ; FE 00 02 | Increment (absolute,X)
    ORA $4C92            ; 0D 92 4C | Logical OR with accumulator (absolute)
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LSR $6E61,X          ; 5E 61 6E | Logical shift right (absolute,X)
    ADC ($35),Y          ; 71 35 | Add with carry ((zero page),Y)
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    AND $011E            ; 2D 1E 01 | Logical AND with accumulator (absolute)
    LSR $7001            ; 4E 01 70 | Logical shift right (absolute)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    PEA #$540C           ; F4 0C 54 | Push effective address to stack
    JMP ($FEC2)          ; 6C C2 FE | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2BE
; Address: $DFE0EC
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2BE:
    JSL $D4C23E          ; 22 3E C2 D4 | Jump to subroutine long
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPX #$DE             ; E0 DE | Compare X register (immediate)
    BMI $3C              ; 30 3C | Branch if negative
    BPL $52              ; 10 52 | Branch if positive
    BCS $08              ; B0 08 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    BIT $543E            ; 2C 3E 54 | Test bits in accumulator (absolute)
    SEP #$8F             ; E2 8F | Set processor status bits
    LDA $4D46,X          ; BD 46 4D | Read graphics status
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    DEC $00              ; C6 00 | Decrement (zero page)
    ROL $1F00            ; 2E 00 1F | Rotate left (absolute)
    JMP $4EB0            ; 4C B0 4E | Jump to address
    BMI $7E              ; 30 7E | Branch if negative
    ROR $5A92            ; 6E 92 5A | Rotate right (absolute)
    LDX $24              ; A6 24 | Load from zero page into X register
    BMI $F8              ; 30 F8 | Branch if negative
    JMP $7CB0            ; 4C B0 7C | Jump to address
    BRA $72              ; 80 72 | Branch always
    BRA $0E              ; 80 0E | Branch always
    BRA $EE              ; 80 EE | Branch always
    BPL $DE              ; 10 DE | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C1
; Address: $DFE149
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C1:
    JSL $604778          ; 22 78 47 60 | Jump to subroutine long
    JMP $000B63          ; 5C 63 0B 00 | Jump to address long
    ROL $7C13            ; 2E 13 7C | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $0D20            ; 2D 20 0D | Logical AND with accumulator (absolute)
    BPL $1E              ; 10 1E | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    SBC ($BD),Y          ; F1 BD | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C3
; Address: $DFE174
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C3:
    JSR $6301            ; 20 01 63 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    ROL $3200,X          ; 3E 00 32 | Rotate left (absolute,X)
    ORA $0C72            ; 0D 72 0C | Logical OR with accumulator (absolute)
    ROR $3E00,X          ; 7E 00 3E | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $7641,X          ; 3E 41 76 | Rotate left (absolute,X)
    EOR #$5A             ; 49 5A | Exclusive OR with accumulator (immediate)
    ADC $24              ; 65 24 | Add with carry (zero page)
    ORA $013E            ; 0D 3E 01 | Logical OR with accumulator (absolute)
    LSR $7001            ; 4E 01 70 | Logical shift right (absolute)
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    PEA #$540C           ; F4 0C 54 | Push effective address to stack
    JMP ($FEC2)          ; 6C C2 FE | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C4
; Address: $DFE1AC
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C4:
    JSL $D4C23E          ; 22 3E C2 D4 | Jump to subroutine long
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPX #$DE             ; E0 DE | Compare X register (immediate)
    BMI $3C              ; 30 3C | Branch if negative
    BPL $52              ; 10 52 | Branch if positive
    BCS $08              ; B0 08 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    BIT $543C            ; 2C 3C 54 | Test bits in accumulator (absolute)
    INC $89              ; E6 89 | Increment (zero page)
    LDX $4957            ; AE 57 49 | Load from absolute address into X register
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ROL $1F00            ; 2E 00 1F | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    BCS $49              ; B0 49 | Branch if carry set
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C5
; Address: $DFE1E7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C5:
    STX $76              ; 86 76 | Store X register to zero page
    STX $24AC            ; 8E AC 24 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $72              ; 80 72 | Branch always
    BRA $0E              ; 80 0E | Branch always
    BRA $FE              ; 80 FE | Branch always
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C6
; Address: $DFE20F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C6:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0E31            ; 0E 31 0E | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0312,X          ; 1E 12 03 | Arithmetic shift left (absolute,X)
    BPL $0D              ; 10 0D | Branch if positive
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C7
; Address: $DFE234
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C7:
    JSR $0C01            ; 20 01 0C | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BMI $6C              ; 30 6C | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C8
; Address: $DFE245
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C8:
    JSR $102F            ; 20 2F 10 | Jump to subroutine
    ORA $0F0B            ; 0D 0B 0F | Logical OR with accumulator (absolute)
    BPL $03              ; 10 03 | Branch if positive
    BPL $1C              ; 10 1C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $D8              ; 30 D8 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PEA #$7A0C           ; F4 0C 7A | Push effective address to stack
    STX $3A              ; 86 3A | Store X register to zero page
    DEC $11              ; C6 11 | Decrement (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2C9
; Address: $DFE277
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2C9:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    STA ($BE,X)          ; 81 BE | Update graphics data
    ADC ($DE,X)          ; 61 DE | Add with carry ((zero page,X))
    CPY $E83C            ; CC 3C E8 | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    STY $14F8            ; 8C F8 14 | Store Y register to absolute address
    CPX $7E32            ; EC 32 7E | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2CB
; Address: $DFE296
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2CB:
    PHP                  ; 08 | Push processor status to stack
    STZ $FC00            ; 9C 00 FC | Store zero to absolute
    LDX $9E00,Y          ; BE 00 9E | Load from absolute,Y into X register
    STZ $FA66,X          ; 9E 66 FA | Store zero to absolute,X
    INC $CE02,X          ; FE 02 CE | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $0E40,X          ; 1E 40 0E | Arithmetic shift left (absolute,X)
    STZ $FA00            ; 9C 00 FA | Store zero to absolute
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC $C400,X          ; FE 00 C4 | Increment (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2CC
; Address: $DFE2CF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2CC:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0E31            ; 0E 31 0E | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0312,X          ; 1E 12 03 | Arithmetic shift left (absolute,X)
    BPL $0D              ; 10 0D | Branch if positive
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0010,Y          ; 19 10 00 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2CD
; Address: $DFE2F4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2CD:
    JSR $0C01            ; 20 01 0C | Jump to subroutine
    ORA $0408,X          ; 1D 08 04 | Logical OR with accumulator (absolute,X)
    ORA ($2C),Y          ; 11 2C | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2CE
; Address: $DFE305
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2CE:
    JSR $102F            ; 20 2F 10 | Jump to subroutine
    BMI $16              ; 30 16 | Branch if negative
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    BPL $0A              ; 10 0A | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $2C              ; 10 2C | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $D8              ; 30 D8 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PEA #$7A0C           ; F4 0C 7A | Push effective address to stack
    STX $3A              ; 86 3A | Store X register to zero page
    DEC $11              ; C6 11 | Decrement (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2CF
; Address: $DFE337
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2CF:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    STA ($BE,X)          ; 81 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D0
; Address: $DFE342
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D0:
    ADC ($DE,X)          ; 61 DE | Add with carry ((zero page,X))
    CPY $E83C            ; CC 3C E8 | Compare Y register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    STY $6498            ; 8C 98 64 | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    LDX $7E              ; A6 7E | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D1
; Address: $DFE351
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D1:
    JSR $001E            ; 20 1E 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STZ $FC00            ; 9C 00 FC | Store zero to absolute
    INC $F600,X          ; FE 00 F6 | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    INC $DE32            ; EE 32 DE | Increment (absolute)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TSX                  ; BA | Transfer stack pointer to X register
    BCS $FC              ; B0 FC | Branch if carry set
    INC $7E00,X          ; FE 00 7E | Increment (absolute,X)
    ASL $BC00            ; 0E 00 BC | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BMI $03              ; 30 03 | Branch if negative
    WDM #$35             ; 42 35 | Reserved instruction
    BIT $5062            ; 2C 62 50 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D2
; Address: $DFE396
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D2:
    STA                  ; 9F 6E 37 1F | Update graphics data
    ORA $2C20,Y          ; 19 20 2C | Logical OR with accumulator (absolute,Y)
    ORA ($1A),Y          ; 11 1A | Logical OR with accumulator ((zero page),Y)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    BIT $5113            ; 2C 13 51 | Test bits in accumulator (absolute)
    ROL $36C9            ; 2E C9 36 | Rotate left (absolute)
    STZ $0B              ; 64 0B | Store zero to zero page
    ADC $7D3F,Y          ; 79 3F 7D | Add with carry (absolute,Y)
    PHY                  ; 5A | Push Y register to stack
    AND $30              ; 25 30 | Logical AND with accumulator (zero page)
    BPL $1C              ; 10 1C | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D3
; Address: $DFE3C6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D3:
    JSR $2C33            ; 20 33 2C | Jump to subroutine
    BPL $46              ; 10 46 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BIT $131F            ; 2C 1F 13 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    STZ $18              ; 64 18 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D4
; Address: $DFE3EB
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D4:
    CPX $28              ; E4 28 | Compare X register (zero page)
    DEC $48              ; C6 48 | Decrement (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    CPX $FC7C            ; EC 7C FC | Compare X register (absolute)
    INC $CEFE            ; EE FE CE | Increment (absolute)
    INC $08B4,X          ; FE B4 08 | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $AC              ; 50 AC | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $4C              ; 64 4C | Store zero to zero page
    BCS $4A              ; B0 4A | Branch if carry set
    JMP ($9462)          ; 6C 62 94 | Jump to address (absolute indirect)
    LDX $BEFC,Y          ; BE FC BE | Load from absolute,Y into X register
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $49              ; F0 49 | Branch if equal
    LDX $0D              ; A6 0D | Load from zero page into X register
    DEX                  ; CA | Decrement X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D5
; Address: $DFE425
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D5:
    JSR $D804            ; 20 04 D8 | Jump to subroutine
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BRA $90              ; 80 90 | Branch always
    BRA $38              ; 80 38 | Branch always
    BPL $D0              ; 10 D0 | Branch if positive
    BMI $20              ; 30 20 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BMI $03              ; 30 03 | Branch if negative
    WDM #$35             ; 42 35 | Reserved instruction
    BIT $5062            ; 2C 62 50 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D6
; Address: $DFE456
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D6:
    STA                  ; 9F 6E 37 1F | Update graphics data
    ORA $2C20,Y          ; 19 20 2C | Logical OR with accumulator (absolute,Y)
    ORA ($1A),Y          ; 11 1A | Logical OR with accumulator ((zero page),Y)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    BIT $5113            ; 2C 13 51 | Test bits in accumulator (absolute)
    ROL $36C9            ; 2E C9 36 | Rotate left (absolute)
    ADC $7D3F,Y          ; 79 3F 7D | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D7
; Address: $DFE480
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D7:
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $B0              ; 65 B0 | Add with carry (zero page)
    BVC $04              ; 50 04 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D8
; Address: $DFE486
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D8:
    JSR $241B            ; 20 1B 24 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $013E,X          ; 3E 3E 01 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    STZ $18              ; 64 18 | Store zero to zero page
    CPX $28              ; E4 28 | Compare X register (zero page)
    DEC $48              ; C6 48 | Decrement (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    CPX $FC7C            ; EC 7C FC | Compare X register (absolute)
    INC $CEFE            ; EE FE CE | Increment (absolute)
    INC $08B4,X          ; FE B4 08 | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $AC              ; 50 AC | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $4C              ; 64 4C | Store zero to zero page
    BCS $4A              ; B0 4A | Branch if carry set
    JMP ($9066)          ; 6C 66 90 | Jump to address (absolute indirect)
    LDX $BEFC,Y          ; BE FC BE | Load from absolute,Y into X register
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    PEA #$A44A           ; F4 4A A4 | Push effective address to stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CPY $3034            ; CC 34 30 | Compare Y register (absolute)
    CPY $6208            ; CC 08 62 | Compare Y register (absolute)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2D9
; Address: $DFE4EF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2D9:
    JSR $8090            ; 20 90 80 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BPL $C8              ; 10 C8 | Branch if positive
    BMI $34              ; 30 34 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2DB
; Address: $DFE4FE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2DB:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $2D              ; 10 2D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    EOR ($1F,X)          ; 41 1F | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2DD
; Address: $DFE517
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2DD:
    AND $3F2F,X          ; 3D 2F 3F | Logical AND with accumulator (absolute,X)
    BIT $2A13            ; 2C 13 2A | Test bits in accumulator (absolute)
    ROL $19              ; 26 19 | Rotate left (zero page)
    BIT $4912            ; 2C 12 49 | Test bits in accumulator (absolute)
    AND #$64             ; 29 64 | Logical AND with accumulator (immediate)
    ADC $393D,X          ; 7D 3D 39 | Add with carry (absolute,X)
    ORA $3C7C,Y          ; 19 7C 3C | Logical OR with accumulator (absolute,Y)
    ROL $7EFE,X          ; 3E FE 7E | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2DE
; Address: $DFE546
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2DE:
    JSR $2029            ; 20 29 20 | Jump to subroutine
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ADC ($30),Y          ; 71 30 | Add with carry ((zero page),Y)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA $171F,Y          ; 19 1F 17 | Logical OR with accumulator (absolute,Y)
    ASL $013E            ; 0E 3E 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BNE $50              ; D0 50 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BMI $24              ; 30 24 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $DC              ; F0 DC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY $FEF8,X          ; BC F8 FE | Load from absolute,X into Y register
    DEC $58DC,X          ; DE DC 58 | Decrement (absolute,X)
    LDY $A0              ; A4 A0 | Load from zero page into Y register
    JMP $04F428          ; 5C 28 F4 04 | Jump to address long
    BCS $1C              ; B0 1C | Branch if carry set
    CPX #$66             ; E0 66 | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2DF
; Address: $DFE58D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2DF:
    SEI                  ; 78 | Set interrupt disable flag
    STZ $DE70            ; 9C 70 DE | Store zero to absolute
    STX $248C            ; 8E 8C 24 | Store X register to absolute address
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $3C1C            ; 9C 1C 3C | Store zero to absolute
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    TXA                  ; 8A | Transfer X register to accumulator
    CPX $3C              ; E4 3C | Compare X register (zero page)
    BEQ $08              ; F0 08 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    LDX #$C0             ; A2 C0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E0
; Address: $DFE5AF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E0:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    BMI $88              ; 30 88 | Branch if negative
    BCS $B8              ; B0 B8 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E1
; Address: $DFE5BE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E1:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $2D              ; 10 2D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    EOR ($1F,X)          ; 41 1F | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E3
; Address: $DFE5D7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E3:
    AND $3F2F,X          ; 3D 2F 3F | Logical AND with accumulator (absolute,X)
    BIT $2A13            ; 2C 13 2A | Test bits in accumulator (absolute)
    ROL $19              ; 26 19 | Rotate left (zero page)
    BIT $4912            ; 2C 12 49 | Test bits in accumulator (absolute)
    AND #$62             ; 29 62 | Logical AND with accumulator (immediate)
    ORA $3F7F,X          ; 1D 7F 3F | Logical OR with accumulator (absolute,X)
    ADC $393D,X          ; 7D 3D 39 | Add with carry (absolute,X)
    ORA $3C7C,Y          ; 19 7C 3C | Logical OR with accumulator (absolute,Y)
    ROL $7EFE,X          ; 3E FE 7E | Rotate left (absolute,X)
    AND $0B02            ; 2D 02 0B | Logical AND with accumulator (absolute)
    BPL $18              ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E4
; Address: $DFE606
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E4:
    JSR $2132            ; 20 32 21 | PPU graphics register access
    ORA ($66),Y          ; 11 66 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    AND $121F            ; 2D 1F 12 | Logical AND with accumulator (absolute)
    ASL $1C0C,X          ; 1E 0C 1C | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E5
; Address: $DFE623
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E5:
    BRA $40              ; 80 40 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BNE $50              ; D0 50 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BMI $24              ; 30 24 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $DC              ; F0 DC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY $FEF8,X          ; BC F8 FE | Load from absolute,X into Y register
    DEC $58DC,X          ; DE DC 58 | Decrement (absolute,X)
    LDY $A0              ; A4 A0 | Load from zero page into Y register
    JMP $04F428          ; 5C 28 F4 04 | Jump to address long
    BCS $1C              ; B0 1C | Branch if carry set
    CPX #$66             ; E0 66 | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    JMP $DCDEB0          ; 5C B0 DE DC | Jump to address long
    STX $248C            ; 8E 8C 24 | Store X register to absolute address
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $3C1C            ; 9C 1C 3C | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $90              ; 80 90 | Branch always
    BVC $08              ; 50 08 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    CPY $40              ; C4 40 | Compare Y register (zero page)
    LDY $C238,X          ; BC 38 C2 | Load from absolute,X into Y register
    BRA $FC              ; 80 FC | Branch always
    BRA $10              ; 80 10 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BMI $88              ; 30 88 | Branch if negative
    BCS $38              ; B0 38 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E6
; Address: $DFE686
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E6:
    PHP                  ; 08 | Push processor status to stack
    BPL $27              ; 10 27 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ADC ($0C,X)          ; 61 0C | Add with carry ((zero page,X))
    ASL $1E1F            ; 0E 1F 1E | Arithmetic shift left (absolute)
    PLY                  ; 7A | Pull Y register from stack
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E7
; Address: $DFE6A0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E7:
    JSR $261F            ; 20 1F 26 | Jump to subroutine
    ORA $0712,X          ; 1D 12 07 | Logical OR with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    ROL $1FC8            ; 2E C8 1F | Rotate left (absolute)
    ROR $783E,X          ; 7E 3E 78 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    BPL $70              ; 10 70 | Branch if positive
    AND ($7C,X)          ; 21 7C | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2E9
; Address: $DFE6BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2E9:
    ROR $40              ; 66 40 | Rotate right (zero page)
    ROL $10              ; 26 10 | Rotate left (zero page)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2EA
; Address: $DFE6C6
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2EA:
    JSR $2012            ; 20 12 20 | Jump to subroutine
    EOR #$08             ; 49 08 | Exclusive OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $131F            ; 0D 1F 13 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $3E36,X          ; 1E 36 3E | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BIT $DE2C            ; 2C 2C DE | Test bits in accumulator (absolute)
    BPL $6C              ; 10 6C | Branch if positive
    BIT $58C0            ; 2C C0 58 | Test bits in accumulator (absolute)
    STX $64              ; 86 64 | Store X register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $E2C0            ; CC C0 E2 | Compare Y register (absolute)
    JMP ($DEC1)          ; 6C C1 DE | Jump to address (absolute indirect)
    SEP #$6C             ; E2 6C | Set processor status bits
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    DEC $FEFE,X          ; DE FE FE | Decrement (absolute,X)
    INC $F804,X          ; FE 04 F8 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2EB
; Address: $DFE703
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2EB:
    LDY $E840,X          ; BC 40 E8 | Load from absolute,X into Y register
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $7C7E            ; EC 7E 7C | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2EC
; Address: $DFE712
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2EC:
    ASL $5C1C,X          ; 1E 1C 5C | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $3E0C            ; 0E 0C 3E | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2ED
; Address: $DFE721
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2ED:
    BEQ $08              ; F0 08 | Branch if equal
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STY $4C              ; 84 4C | Store Y register to zero page
    STY $30              ; 84 30 | Store Y register to zero page
    BCC $AA              ; 90 AA | Branch if carry clear
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2EE
; Address: $DFE72F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2EE:
    JSR $0012            ; 20 12 00 | Jump to subroutine
    BPL $F8              ; 10 F8 | Branch if positive
    BMI $34              ; 30 34 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2EF
; Address: $DFE73E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2EF:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $27              ; 10 27 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ADC ($0C,X)          ; 61 0C | Add with carry ((zero page,X))
    ASL $1E1F            ; 0E 1F 1E | Arithmetic shift left (absolute)
    PLY                  ; 7A | Pull Y register from stack
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F0
; Address: $DFE760
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F0:
    JSR $261F            ; 20 1F 26 | Jump to subroutine
    ORA $0712,X          ; 1D 12 07 | Logical OR with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    ROL $1FF0            ; 2E F0 1F | Rotate left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ROR $783E,X          ; 7E 3E 78 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    BPL $70              ; 10 70 | Branch if positive
    AND ($7C,X)          ; 21 7C | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F2
; Address: $DFE77C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F2:
    LSR $40              ; 46 40 | Logical shift right (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $13              ; 10 13 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    AND ($32,X)          ; 21 32 | Logical AND with accumulator ((zero page,X))
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F3
; Address: $DFE78A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F3:
    ROL                  ; 2A | Rotate left (accumulator)
    ORA #$55             ; 09 55 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $121E            ; 2C 1E 12 | Test bits in accumulator (absolute)
    ASL $1C14,X          ; 1E 14 1C | Arithmetic shift left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BIT $DE2C            ; 2C 2C DE | Test bits in accumulator (absolute)
    BPL $6C              ; 10 6C | Branch if positive
    BIT $58C0            ; 2C C0 58 | Test bits in accumulator (absolute)
    STX $64              ; 86 64 | Store X register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $E2C0            ; CC C0 E2 | Compare Y register (absolute)
    JMP ($DEC1)          ; 6C C1 DE | Jump to address (absolute indirect)
    SEP #$6C             ; E2 6C | Set processor status bits
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    DEC $FEFE,X          ; DE FE FE | Decrement (absolute,X)
    INC $F804,X          ; FE 04 F8 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F4
; Address: $DFE7C3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F4:
    LDY $E840,X          ; BC 40 E8 | Load from absolute,X into Y register
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F5
; Address: $DFE7CE
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F5:
    JSL $7C7EF0          ; 22 F0 7E 7C | Jump to subroutine long
    ASL $5C1C,X          ; 1E 1C 5C | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $3E0C            ; 0E 0C 3E | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROR $02              ; 66 02 | Rotate right (zero page)
    STZ $08              ; 64 08 | Store zero to zero page
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BMI $AC              ; 30 AC | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    BPL $FC              ; 10 FC | Branch if positive
    BRA $00              ; 80 00 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BEQ $30              ; F0 30 | Branch if equal
    BCS $F8              ; B0 F8 | Branch if carry set
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BVC $78              ; 50 78 | Branch if overflow clear
    JMP ($807C)          ; 6C 7C 80 | Jump to address (absolute indirect)
    BRA $00              ; 80 00 | Branch always
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F6
; Address: $DFE808
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F6:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F7
; Address: $DFE80E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F7:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND $7F1F,X          ; 3D 1F 7F | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F8
; Address: $DFE826
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F8:
    JSR $380D            ; 20 0D 38 | Jump to subroutine
    ROR $1A              ; 66 1A | Rotate right (zero page)
    ADC #$1E             ; 69 1E | Add with carry (immediate)
    AND $7B0E,Y          ; 39 0E 7B | Logical AND with accumulator (absolute,Y)
    ADC ($31),Y          ; 71 31 | Add with carry ((zero page),Y)
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    BPL $02              ; 10 02 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    AND $3C38,Y          ; 39 38 3C | Logical AND with accumulator (absolute,Y)
    BMI $1E              ; 30 1E | Branch if negative
    BPL $51              ; 10 51 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2F9
; Address: $DFE848
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2F9:
    JSL $1A3F00          ; 22 00 3F 1A | Jump to subroutine long
    EOR $03              ; 45 03 | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    ORA $001D,X          ; 1D 1D 00 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    PHY                  ; 5A | Push Y register to stack
    LDY $D824,X          ; BC 24 D8 | Load from absolute,X into Y register
    JMP $06F882          ; 5C 82 F8 06 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $BC              ; 80 BC | Branch always
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    DEC $E6              ; C6 E6 | Decrement (zero page)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $C834,X          ; FE 34 C8 | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLP                  ; 28 | Pull processor status from stack
    BNE $64              ; D0 64 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    JMP ($946B)          ; 6C 6B 94 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2FA
; Address: $DFE88E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2FA:
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    INC $BEFC,X          ; FE FC BE | Increment (absolute,X)
    LDY $989C,X          ; BC 9C 98 | Load from absolute,X into Y register
    ROL $FE3C,X          ; 3E 3C FE | Rotate left (absolute,X)
    ROR $3E3E,X          ; 7E 3E 3E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2FB
; Address: $DFE8A1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2FB:
    JSR $90D0            ; 20 D0 90 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2FC
; Address: $DFE8AB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2FC:
    BPL $8E              ; 10 8E | Branch if positive
    BRA $08              ; 80 08 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    INX                  ; E8 | Increment X register
    BMI $6C              ; 30 6C | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BVS $7C              ; 70 7C | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2FD
; Address: $DFE8CE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2FD:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND $7F1F,X          ; 3D 1F 7F | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2FE
; Address: $DFE8E6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2FE:
    JSR $380D            ; 20 0D 38 | Jump to subroutine
    ROR $1A              ; 66 1A | Rotate right (zero page)
    ADC #$1E             ; 69 1E | Add with carry (immediate)
    DEC                  ; 3A | Decrement accumulator
    ORA $3B7B            ; 0D 7B 3B | Logical OR with accumulator (absolute)
    ADC ($31),Y          ; 71 31 | Add with carry ((zero page),Y)
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    BPL $02              ; 10 02 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    AND $3C38,Y          ; 39 38 3C | Logical AND with accumulator (absolute,Y)
    BMI $1C              ; 30 1C | Branch if negative
    BPL $14              ; 10 14 | Branch if positive
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $10              ; 10 10 | Branch if positive
    AND $431C,X          ; 3D 1C 43 | Logical AND with accumulator (absolute,X)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_2FF
; Address: $DFE90F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_2FF:
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    ASL $1E02,X          ; 1E 02 1E | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    PHY                  ; 5A | Push Y register to stack
    LDY $D824,X          ; BC 24 D8 | Load from absolute,X into Y register
    JMP $06F882          ; 5C 82 F8 06 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $BC              ; 80 BC | Branch always
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    DEC $E6              ; C6 E6 | Decrement (zero page)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $C834,X          ; FE 34 C8 | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLP                  ; 28 | Pull processor status from stack
    BNE $64              ; D0 64 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    JMP ($946B)          ; 6C 6B 94 | Jump to address (absolute indirect)
    LSR $B8              ; 46 B8 | Logical shift right (zero page)
    INC $BEFC,X          ; FE FC BE | Increment (absolute,X)
    LDY $989C,X          ; BC 9C 98 | Load from absolute,X into Y register
    ROL $FE3C,X          ; 3E 3C FE | Rotate left (absolute,X)
    ROR $3E3E,X          ; 7E 3E 3E | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BNE $D0              ; D0 D0 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    JMP $3084            ; 4C 84 30 | Jump to address
    CPY $6688            ; CC 88 66 | Compare Y register (absolute)
    CPY $3C              ; C4 3C | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_300
; Address: $DFE96F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_300:
    JSR $0008            ; 20 08 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    INX                  ; E8 | Increment X register
    BMI $B4              ; 30 B4 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    BMI $38              ; 30 38 | Branch if negative
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_301
; Address: $DFE97E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_301:
    JSR $0CE0            ; 20 E0 0C | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ROL $E3              ; 26 E3 | Rotate left (zero page)
    CPY $CC              ; C4 CC | Compare Y register (zero page)
    CMP #$04             ; C9 04 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_302
; Address: $DFE98B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_302:
    ROL $7F              ; 26 7F | Rotate left (zero page)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_303
; Address: $DFE992
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_303:
    JSR $C066            ; 20 66 C0 | Jump to subroutine
    CPY $80              ; C4 80 | Compare Y register (zero page)
    ROL $04              ; 26 04 | Rotate left (zero page)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_304
; Address: $DFE9A5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_304:
    JSL $2F122F          ; 22 2F 12 2F | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ROL $0604            ; 2E 04 06 | Rotate left (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ROL $1DA8,X          ; 3E A8 1D | Rotate left (absolute,X)
    EOR $76CF,Y          ; 59 CF 76 | Exclusive OR with accumulator (absolute,Y)
    LDX $F6              ; A6 F6 | Load from zero page into X register
    ROL $AC              ; 26 AC | Rotate left (zero page)
    JMP $5998            ; 4C 98 59 | Jump to address
    ROL $013F,X          ; 3E 3F 01 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    ROL $3F              ; 26 3F | Rotate left (zero page)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    JMP $597F            ; 4C 7F 59 | Jump to address
    BMI $3E              ; 30 3E | Branch if negative
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_308
; Address: $DFE9F5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_308:
    JSL $00C100          ; 22 00 C1 00 | Jump to subroutine long
    SBC ($40,X)          ; E1 40 | Subtract with carry ((zero page,X))
    ROR $20              ; 66 20 | Rotate right (zero page)
    LDY $20              ; A4 20 | Load from zero page into Y register
    LDY #$FC             ; A0 FC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_309
; Address: $DFEA01
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_309:
    JSR $20FE            ; 20 FE 20 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    CMP $58              ; C5 58 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_30A
; Address: $DFEA10
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_30A:
    JSR $20A0            ; 20 A0 20 | Jump to subroutine
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_30C
; Address: $DFEA1B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_30C:
    LSR $20              ; 46 20 | Logical shift right (zero page)
    STZ $7E80,X          ; 9E 80 7E | Store zero to absolute,X
    LDX $EA9B,Y          ; BE 9B EA | Load from absolute,Y into X register
    ADC $1D68,Y          ; 79 68 1D | Add with carry (absolute,Y)
    ASL $2508            ; 0E 08 25 | Arithmetic shift left (absolute)
    INC $FD              ; E6 FD | Increment (zero page)
    DEC $A03E,X          ; DE 3E A0 | Decrement (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    INC $F614,X          ; FE 14 F6 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    DEC $FE              ; C6 FE | Decrement (zero page)
    DEC $E000,X          ; DE 00 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_30D
; Address: $DFEA45
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_30D:
    JSL $2F122F          ; 22 2F 12 2F | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ROL $0604            ; 2E 04 06 | Rotate left (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ROR $1DA8,X          ; 7E A8 1D | Rotate right (absolute,X)
    SBC $EE7F,Y          ; F9 7F EE | Subtract with carry (absolute,Y)
    ROR $4CEC            ; 6E EC 4C | Rotate right (absolute)
    JMP $9C0C            ; 4C 0C 9C | Jump to address
    LDA                  ; BF 7B 7C 05 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    ADC $6EFF,Y          ; 79 FF 6E | Add with carry (absolute,Y)
    JMP $0C7F            ; 4C 7F 0C | Jump to address
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_30E
; Address: $DFEA81
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_30E:
    JSR $20FE            ; 20 FE 20 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_310
; Address: $DFEA90
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_310:
    JSR $20A0            ; 20 A0 20 | Jump to subroutine
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_311
; Address: $DFEA96
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_311:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $44              ; 10 44 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_312
; Address: $DFEA9C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_312:
    JSR $809C            ; 20 9C 80 | Jump to subroutine
    ROR $BC17,X          ; 7E 17 BC | Rotate right (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BMI $1E              ; 30 1E | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    BRA $14              ; 80 14 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_313
; Address: $DFEAB1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_313:
    INC $FF9A,X          ; FE 9A FF | Increment (absolute,X)
    INC $F630,X          ; FE 30 F6 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    STX $FE              ; 86 FE | Store X register to zero page
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_315
; Address: $DFEAC7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_315:
    JMP $006F            ; 4C 6F 00 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $08              ; 70 08 | Branch if overflow set
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_316
; Address: $DFEAD2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_316:
    JSR $4060            ; 20 60 40 | Jump to subroutine
    LSR $48              ; 46 48 | Logical shift right (zero page)
    JMP $5000            ; 4C 00 50 | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_317
; Address: $DFEADF
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_317:
    BEQ $7F              ; F0 7F | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BRA $FD              ; 80 FD | Branch always
    INC $6701            ; EE 01 67 | Increment (absolute)
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR ($0A,X)          ; 41 0A | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $63EE,X          ; 1D EE 63 | Logical OR with accumulator (absolute,X)
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1F17            ; 0E 17 1F | Arithmetic shift left (absolute)
    ROL $1C              ; 26 1C | Rotate left (zero page)
    BPL $63              ; 10 63 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BRA $78              ; 80 78 | Branch always
    BRA $FE              ; 80 FE | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_318
; Address: $DFEB41
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_318:
    CLC                  ; 18 | Clear carry flag
    INC $1C              ; E6 1C | Increment (zero page)
    PHA                  ; 48 | Push accumulator to stack
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    BCS $C8              ; B0 C8 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    BRA $44              ; 80 44 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_319
; Address: $DFEB52
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_319:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BCS $00              ; B0 00 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    WDM #$98             ; 42 98 | Reserved instruction
    EOR ($18,X)          ; 41 18 | Exclusive OR with accumulator ((zero page,X))
    LDA ($60,X)          ; A1 60 | Read graphics status
    STZ $7860,X          ; 9E 60 78 | Store zero to absolute,X
    BPL $B0              ; 10 B0 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    BIT $4C              ; 24 4C | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    LDY $BE18,X          ; BC 18 BE | Load from absolute,X into Y register
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BPL $98              ; 10 98 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_31A
; Address: $DFEB7D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_31A:
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CPY $407F            ; CC 7F 40 | Compare Y register (absolute)
    BRA $FD              ; 80 FD | Branch always
    INC $6701            ; EE 01 67 | Increment (absolute)
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_31B
; Address: $DFEB8C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_31B:
    JSR $2107            ; 20 07 21 | PPU graphics register access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0C              ; 10 0C | Branch if positive
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($26,X)          ; 01 26 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_31C
; Address: $DFEBAF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_31C:
    SEC                  ; 38 | Set carry flag
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    INC $1C              ; E6 1C | Increment (zero page)
    PHA                  ; 48 | Push accumulator to stack
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    BRA $F8              ; 80 F8 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_31E
; Address: $DFEBD2
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_31E:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BRA $04              ; 80 04 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    STY $30              ; 84 30 | Store Y register to zero page
    BMI $42              ; 30 42 | Hardware register operation
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    STY $04D4            ; 8C D4 04 | Store Y register to absolute address
    BVS $30              ; 70 30 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BMI $7C              ; 30 7C | Branch if negative
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    PEA #$080C           ; F4 0C 08 | Push effective address to stack
    ROL $E3              ; 26 E3 | Rotate left (zero page)
    CPY $CF              ; C4 CF | Compare Y register (zero page)
    BRA $CC              ; 80 CC | Branch always
    SED                  ; F8 | Set decimal mode flag
    ROL $77              ; 26 77 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_31F
; Address: $DFEC12
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_31F:
    JSR $C066            ; 20 66 C0 | Jump to subroutine
    CPY $80              ; C4 80 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_320
; Address: $DFEC20
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_320:
    ROL $7C03,X          ; 3E 03 7C | Rotate left (absolute,X)
    LSR $2A29,X          ; 5E 29 2A | Logical shift right (absolute,X)
    ORA $0E38,X          ; 1D 38 0E | Logical OR with accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    LSR $03              ; 46 03 | Logical shift right (zero page)
    WDM #$18             ; 42 18 | Reserved instruction
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ORA $413C,Y          ; 19 3C 41 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    AND ($60,X)          ; 21 60 | Logical AND with accumulator ((zero page,X))
    STA                  ; 9F 61 7A 1A | Update graphics data
    LDA $65              ; A5 65 | Read graphics status
    LDA $7C7A,X          ; BD 7A 7C | Read graphics status
    CLC                  ; 18 | Clear carry flag
    LDX $9E00,Y          ; BE 00 9E | Load from absolute,Y into X register
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 90 DF 62 | Update graphics data
    ADC $7840,X          ; 7D 40 78 | Add with carry (absolute,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROL $C762,X          ; 3E 62 C7 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_321
; Address: $DFEC65
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_321:
    JSR $00F3            ; 20 F3 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    STZ $EE              ; 64 EE | Store zero to zero page
    BRA $24              ; 80 24 | Branch always
    ROR $00              ; 66 00 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_322
; Address: $DFEC75
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_322:
    JSL $000100          ; 22 00 01 00 | Jump to subroutine long
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPY #$7A             ; C0 7A | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CPX #$44             ; E0 44 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    WDM #$74             ; 42 74 | Reserved instruction

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_323
; Address: $DFEC92
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_323:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BCC $80              ; 90 80 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_324
; Address: $DFEC9C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_324:
    JSR $801C            ; 20 1C 80 | Jump to subroutine
    ROR $B812,X          ; 7E 12 B8 | Rotate right (absolute,X)
    PEA #$6463           ; F4 63 64 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_325
; Address: $DFECAA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_325:
    STA $729A,Y          ; 99 9A 72 | Update graphics data
    BRA $14              ; 80 14 | Branch always
    PLX                  ; FA | Pull X register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC ($68),Y          ; F1 68 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_326
; Address: $DFECB5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_326:
    SBC ($60),Y          ; F1 60 | Subtract with carry ((zero page),Y)
    INC $FE1A,X          ; FE 1A FE | Increment (absolute,X)
    STY $00FC            ; 8C FC 00 | Store Y register to absolute address
    BRA $3E              ; 80 3E | Branch always
    LSR $3A29,X          ; 5E 29 3A | Logical shift right (absolute,X)
    ORA $24              ; 05 24 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_328
; Address: $DFECCE
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_328:
    JSR $000C            ; 20 0C 00 | Jump to subroutine
    ORA $1D01,Y          ; 19 01 1D | Logical OR with accumulator (absolute,Y)
    ASL $5F0C,X          ; 1E 0C 5F | Arithmetic shift left (absolute,X)
    BVC $70              ; 50 70 | Branch if overflow clear
    BMI $7B              ; 30 7B | Branch if negative
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    LDX #$63             ; A2 63 | Load immediate value into X register
    STA $7E7E            ; 8D 7E 7E | Update graphics data
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    BRA $48              ; 80 48 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BPL $5F              ; 10 5F | Branch if positive
    ADC ($7F,X)          ; 61 7F | Add with carry ((zero page,X))
    ROR $0100,X          ; 7E 00 01 | Rotate right (absolute,X)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPY #$7A             ; C0 7A | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CPX #$44             ; E0 44 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    REP #$74             ; C2 74 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_329
; Address: $DFED12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_329:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BCC $80              ; 90 80 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_32A
; Address: $DFED1C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_32A:
    JSR $001C            ; 20 1C 00 | Jump to subroutine
    ROR $3C97,X          ; 7E 97 3C | Rotate right (absolute,X)
    STA                  ; 9F 78 69 6A | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_32B
; Address: $DFED2A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_32B:
    ADC $7E7A,Y          ; 79 7A 7E | Add with carry (absolute,Y)
    STZ $203C            ; 9C 3C 20 | Store zero to absolute
    CLC                  ; 18 | Clear carry flag
    ADC $F86C,X          ; 7D 6C F8 | Add with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_32C
; Address: $DFED37
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_32C:
    SBC $FE36,X          ; FD 36 FE | Subtract with carry (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ROR $1C00,X          ; 7E 00 1C | Rotate right (absolute,X)
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ADC $2912            ; 6D 12 29 | Add with carry (absolute)
    BVC $1D              ; 50 1D | Branch if overflow clear
    EOR ($1F,X)          ; 41 1F | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_32D
; Address: $DFED4C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_32D:
    PHA                  ; 48 | Push accumulator to stack
    ORA $1240            ; 0D 40 12 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_32E
; Address: $DFED58
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_32E:
    JSR $1802            ; 20 02 18 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    BVC $20              ; 50 20 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $38              ; 24 38 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $1914            ; 0D 14 19 | Logical OR with accumulator (absolute)
    ORA $3224,X          ; 1D 24 32 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_32F
; Address: $DFED70
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_32F:
    JSR $041F            ; 20 1F 04 | Jump to subroutine
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    ASL $1C06,X          ; 1E 06 1C | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ADC $2912            ; 6D 12 29 | Add with carry (absolute)
    BNE $1D              ; D0 1D | Branch if not equal
    STA ($1F,X)          ; 81 1F | Update graphics data
    DEY                  ; 88 | Decrement Y register
    ORA $1280            ; 0D 80 12 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_330
; Address: $DFED98
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_330:
    JSR $3802            ; 20 02 38 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    ADC ($2C,X)          ; 61 2C | Add with carry ((zero page,X))
    STY $13              ; 84 13 | Store Y register to zero page
    BCS $60              ; B0 60 | Branch if carry set
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC #$7A             ; 69 7A | Add with carry (immediate)
    ORA ($18),Y          ; 11 18 | Logical OR with accumulator ((zero page),Y)
    BPL $0C              ; 10 0C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ROL $2B31,X          ; 3E 31 2B | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_331
; Address: $DFEDB0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_331:
    JSR $015F            ; 20 5F 01 | Jump to subroutine
    ASL $1C08,X          ; 1E 08 1C | Arithmetic shift left (absolute,X)
    BPL $1C              ; 10 1C | Branch if positive
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    AND #$38             ; 29 38 | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BMI $D0              ; 30 D0 | Branch if negative
    BRA $68              ; 80 68 | Branch always
    CPY #$68             ; C0 68 | Compare Y register (immediate)
    CPY #$68             ; C0 68 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_332
; Address: $DFEDC9
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_332:
    RTI                  ; 40 | Return from interrupt
    CPY $80              ; C4 80 | Compare Y register (zero page)
    STZ $E0              ; 64 E0 | Game work RAM access
    DEC $001C,X          ; DE 1C 00 | Decrement (absolute,X)
    BEQ $80              ; F0 80 | Branch if equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BRA $B8              ; 80 B8 | Branch always
    DEY                  ; 88 | Decrement Y register
    BEQ $20              ; F0 20 | Branch if equal
    ORA $0F0D            ; 0D 0D 0F | Logical OR with accumulator (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $0D05            ; 0D 05 0D | Logical OR with accumulator (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $10              ; 30 10 | Branch if negative
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $3F              ; 10 3F | Branch if positive
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    ASL $1A0C,X          ; 1E 0C 1A | Arithmetic shift left (absolute,X)
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    ASL $1104,X          ; 1E 04 11 | Arithmetic shift left (absolute,X)
    ROL $3F12,X          ; 3E 12 3F | Rotate left (absolute,X)
    ASL $1E0C,X          ; 1E 0C 1E | Arithmetic shift left (absolute,X)
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    BCS $B0              ; B0 B0 | Branch if carry set
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCS $A0              ; B0 A0 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_333
; Address: $DFEE52
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_333:
    BEQ $20              ; F0 20 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    BMI $DC              ; 30 DC | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CPX $1CC0            ; EC C0 1C | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    STY $8488            ; 8C 88 84 | Store Y register to absolute address
    BRA $84              ; 80 84 | Branch always
    BRA $C4              ; 80 C4 | Branch always
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    BRA $7C              ; 80 7C | Branch always
    BRA $7C              ; 80 7C | Branch always
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY $C0              ; C4 C0 | Compare Y register (zero page)
    INX                  ; E8 | Increment X register
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BEQ $78              ; F0 78 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_334
; Address: $DFEE9B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_334:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $46              ; C6 46 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA ($01,X)          ; 81 01 | Update graphics data
    STA $00              ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_335
; Address: $DFEED1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_335:
    JSR $793F            ; 20 3F 79 | Jump to subroutine
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_336
; Address: $DFEEE4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_336:
    STY $9E00            ; 8C 00 9E | Store Y register to absolute address
    STZ $BF04,X          ; 9E 04 BF | Store zero to absolute,X
    BIT $F7              ; 24 F7 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_337
; Address: $DFEEEF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_337:
    JSR $7F03            ; 20 03 7F | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    PEA #$6424           ; F4 24 64 | Push effective address to stack
    WDM #$20             ; 42 20 | Reserved instruction
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_338
; Address: $DFEF00
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_338:
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    LSR $EE5E,X          ; 5E 5E EE | Logical shift right (absolute,X)
    INC $F3F3            ; EE F3 F3 | Increment (absolute)
    CMP $A1C5            ; CD C5 A1 | Compare accumulator (absolute)
    BRA $A1              ; 80 A1 | Branch always
    STA ($78,X)          ; 81 78 | Update graphics data
    LSR $EE20,X          ; 5E 20 EE | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ROL $76C5,X          ; 3E C5 76 | Rotate left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    STA ($FF,X)          ; 81 FF | Update graphics data
    LDA ($A1),Y          ; B1 A1 | Read graphics status
    AND $1B31,Y          ; 39 31 1B | Logical AND with accumulator (absolute,Y)
    ASL $3C18,X          ; 1E 18 3C | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    ASL $1E1C,X          ; 1E 1C 1E | Arithmetic shift left (absolute,X)
    ASL $A104            ; 0E 04 A1 | Arithmetic shift left (absolute)
    AND ($F7),Y          ; 31 F7 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC $FE14,X          ; FE 14 FE | Increment (absolute,X)
    INC $008C,X          ; FE 8C 00 | Increment (absolute,X)
    CPY $E480            ; CC 80 E4 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    PEA #$F260           ; F4 60 F2 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    NOP                  ; EA | No operation
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BRA $FC              ; 80 FC | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_339
; Address: $DFEF58
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_339:
    RTI                  ; 40 | Return from interrupt
    LSR $CCC0,X          ; 5E C0 CC | Logical shift right (absolute,X)
    STX $02              ; 86 02 | Store X register to zero page
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    DEC $46              ; C6 46 | Decrement (zero page)
    STY $04              ; 84 04 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_33B
; Address: $DFEF71
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_33B:
    JSR $793F            ; 20 3F 79 | Jump to subroutine
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($A7,X)          ; 01 A7 | Logical OR with accumulator ((zero page,X))
    BIT $73              ; 24 73 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_33C
; Address: $DFEF89
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_33C:
    JSR $68FB            ; 20 FB 68 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BIT $6D              ; 24 6D | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_33D
; Address: $DFEF98
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_33D:
    JSR $682D            ; 20 2D 68 | Jump to subroutine
    ADC $4600            ; 6D 00 46 | Add with carry (absolute)
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    ROR $EE6E            ; 6E 6E EE | Rotate right (absolute)
    INC $F3F3            ; EE F3 F3 | Increment (absolute)
    CMP $A1C5            ; CD C5 A1 | Compare accumulator (absolute)
    BRA $A1              ; 80 A1 | Branch always
    STA ($38,X)          ; 81 38 | Update graphics data
    ROR $EE10            ; 6E 10 EE | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    ROL $76C5,X          ; 3E C5 76 | Rotate left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    STA ($FF,X)          ; 81 FF | Update graphics data
    LDA ($A1),Y          ; B1 A1 | Read graphics status
    AND $1B31,Y          ; 39 31 1B | Logical AND with accumulator (absolute,Y)
    ASL $9C18,X          ; 1E 18 9C | Arithmetic shift left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX $1EBC,Y          ; BE BC 1E | Load from absolute,Y into X register
    ASL $A114,X          ; 1E 14 A1 | Arithmetic shift left (absolute,X)
    AND ($F7),Y          ; 31 F7 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $14FE,X          ; BC FE 14 | Load from absolute,X into Y register
    INC $FE14,X          ; FE 14 FE | Increment (absolute,X)
    STZ $9C08            ; 9C 08 9C | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    LDX $2E04            ; AE 04 2E | Load from absolute address into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    INC $E604            ; EE 04 E6 | Increment (absolute)
    DEC $00              ; C6 00 | Decrement (zero page)
    BRA $80              ; 80 80 | Branch always
    ORA $0F0D            ; 0D 0D 0F | Logical OR with accumulator (absolute)
    ORA $0D0D            ; 0D 0D 0D | Logical OR with accumulator (absolute)
    ORA $080A            ; 0D 0A 08 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_33E
; Address: $DFF00E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_33E:
    SEC                  ; 38 | Set carry flag
    BPL $0D              ; 10 0D | Branch if positive
    ORA $0D03            ; 0D 03 0D | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $3F10,X          ; 1D 10 3F | Logical OR with accumulator (absolute,X)
    BIT $3C08            ; 2C 08 3C | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $63              ; 05 63 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_33F
; Address: $DFF029
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_33F:
    JSL $662767          ; 22 67 27 66 | Jump to subroutine long
    ROL $26              ; 26 26 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $3D              ; 05 3D | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_340
; Address: $DFF038
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_340:
    JSL $7F277F          ; 22 7F 27 7F | Jump to subroutine long
    ROL $7F              ; 26 7F | Rotate left (zero page)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    BPL $14              ; 10 14 | Branch if positive
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BPL $3C              ; 10 3C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BCS $B0              ; B0 B0 | Branch if carry set
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BCS $B0              ; B0 B0 | Branch if carry set
    BCS $B0              ; B0 B0 | Branch if carry set
    BVC $10              ; 50 10 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BCS $00              ; B0 00 | Branch if carry set
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    BCS $40              ; B0 40 | Branch if carry set
    BCS $E0              ; B0 E0 | Game work RAM access
    BPL $A0              ; 10 A0 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    BPL $3C              ; 10 3C | Branch if positive
    BPL $6C              ; 10 6C | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    INC $A4              ; E6 A4 | Increment (zero page)
    INC $64              ; E6 64 | Increment (zero page)
    ROR $64              ; 66 64 | Rotate right (zero page)
    BPL $FC              ; 10 FC | Branch if positive
    BPL $FC              ; 10 FC | Branch if positive
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_341
; Address: $DFF096
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_341:
    LDY $BE              ; A4 BE | Load from zero page into Y register
    STZ $FE              ; 64 FE | Store zero to zero page
    INC $FE64,X          ; FE 64 FE | Increment (absolute,X)
    CPX $20              ; E4 20 | Compare X register (zero page)
    LDY $3818,X          ; BC 18 38 | Load from absolute,X into Y register
    BPL $78              ; 10 78 | Branch if positive
    BMI $78              ; 30 78 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_342
; Address: $DFF0B0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_342:
    JSR $18FC            ; 20 FC 18 | Jump to subroutine
    LDY $1810,X          ; BC 10 18 | Load from absolute,X into Y register
    BMI $38              ; 30 38 | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $2E              ; 06 2E | Arithmetic shift left (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_343
; Address: $DFF0CD
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_343:
    JSR $11A0            ; 20 A0 11 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    ASL $4431            ; 0E 31 44 | Arithmetic shift left (absolute)
    BCS $5F              ; B0 5F | Branch if carry set
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    STA $1F006B          ; 8F 6B 00 1F | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    ORA $AAFA            ; 0D FA AA | Logical OR with accumulator (absolute)
    CPX $EA              ; E4 EA | Compare X register (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    BPL $F6              ; 10 F6 | Branch if positive
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    SBC #$EA             ; E9 EA | Subtract with carry (immediate)
    SED                  ; F8 | Set decimal mode flag
    BPL $E0              ; 10 E0 | Game work RAM access
    BMI $1A              ; 30 1A | Branch if negative
    PLX                  ; FA | Pull X register from stack
    INC $FFCB,X          ; FE CB FF | Increment (absolute,X)
    NOP                  ; EA | No operation
    INC $5FB0,X          ; FE B0 5F | Increment (absolute,X)
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_344
; Address: $DFF12D
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_344:
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    ORA $AAFA            ; 0D FA AA | Logical OR with accumulator (absolute)
    CPX $EA              ; E4 EA | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    PEA #$CAC9           ; F4 C9 CA | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $E0              ; 10 E0 | Game work RAM access
    BMI $18              ; 30 18 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PEA #$CAFC           ; F4 FC CA | Push effective address to stack
    INC $FE1B,X          ; FE 1B FE | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    LSR $7E              ; 46 7E | Logical shift right (zero page)
    ORA $7671,Y          ; 19 71 76 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    STA ($7E,X)          ; 81 7E | Update graphics data
    STX $70              ; 86 70 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_346
; Address: $DFF182
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_346:
    JSL $133105          ; 22 05 31 13 | Jump to subroutine long
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $112E            ; 0D 2E 11 | Logical OR with accumulator (absolute)
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    BPL $14              ; 10 14 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    AND $7938,X          ; 3D 38 79 | Logical AND with accumulator (absolute,X)
    ADC $0000,X          ; 7D 00 00 | Add with carry (absolute,X)
    CPY $F8C8            ; CC C8 F8 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $9828            ; 2C 28 98 | Test bits in accumulator (absolute)
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    JMP ($249C)          ; 6C 9C 24 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_347
; Address: $DFF1B9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_347:
    SED                  ; F8 | Set decimal mode flag
    PEA #$0808           ; F4 08 08 | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $28              ; B0 28 | Branch if carry set
    BNE $18              ; D0 18 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    LDY $C4A0            ; AC A0 C4 | Load from absolute address into Y register
    PLA                  ; 68 | Pull accumulator from stack
    BRA $90              ; 80 90 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_349
; Address: $DFF1D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_349:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    BCS $00              ; B0 00 | Branch if carry set
    BVS $32              ; 70 32 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_34A
; Address: $DFF1E2
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_34A:
    JSL $133105          ; 22 05 31 13 | Jump to subroutine long
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    BPL $14              ; 10 14 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $3F0E,X          ; 1E 0E 3F | Arithmetic shift left (absolute,X)
    ASL $1E7E,X          ; 1E 7E 1E | Arithmetic shift left (absolute,X)
    ROR $B058,X          ; 7E 58 B0 | Rotate right (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BNE $18              ; D0 18 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    LDY $C4A0            ; AC A0 C4 | Load from absolute address into Y register
    BRA $C4              ; 80 C4 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BRA $30              ; 80 30 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_34B
; Address: $DFF215
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_34B:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3050,X          ; 1E 50 30 | Arithmetic shift left (absolute,X)
    LDA #$09             ; A9 09 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_34C
; Address: $DFF236
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_34C:
    STZ $1B              ; 64 1B | Store zero to zero page
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    BIT $3640            ; 2C 40 36 | Test bits in accumulator (absolute)
    LDY $4B              ; A4 4B | Load from zero page into Y register
    AND $3D58            ; 2D 58 3D | Logical AND with accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $04              ; 10 04 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $BF0C,X          ; BD 0C BF | Read graphics status
    AND $D2              ; 25 D2 | Logical AND with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    LDY $D054,X          ; BC 54 D0 | Load from absolute,X into Y register
    BIT $28              ; 24 28 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_34D
; Address: $DFF26A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_34D:
    JSL $36481C          ; 22 1C 48 36 | Jump to subroutine long
    STA $7A              ; 85 7A | Update graphics data
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_34E
; Address: $DFF272
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_34E:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_34F
; Address: $DFF277
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_34F:
    JSL $1FCD1E          ; 22 1E CD 1F | Jump to subroutine long
    DEC $B617,X          ; DE 17 B6 | Decrement (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    PLX                  ; FA | Pull X register from stack
    LDY $4B              ; A4 4B | Load from zero page into Y register
    AND $3D58            ; 2D 58 3D | Logical AND with accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    SEC                  ; 38 | Set carry flag
    LDA ($6E),Y          ; B1 6E | Read graphics status
    BPL $00              ; 10 00 | Branch if positive
    BPL $04              ; 10 04 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    LDA $0F0C,X          ; BD 0C 0F | Read graphics status
    AND $D2              ; 25 D2 | Logical AND with accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    LDY $D054,X          ; BC 54 D0 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_350
; Address: $DFF2A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_350:
    JSR $2428            ; 20 28 24 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    STX $78              ; 86 78 | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_353
; Address: $DFF2B7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_353:
    JSR $CA1C            ; 20 1C CA | Jump to subroutine
    ASL $17DD,X          ; 1E DD 17 | Arithmetic shift left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC                  ; 1A | Increment accumulator
    ORA $0B14            ; 0D 14 0B | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $23              ; 05 23 | Logical OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_354
; Address: $DFF2D4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_354:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    ASL $DC01,X          ; 1E 01 DC | Arithmetic shift left (absolute,X)
    JMP $44A8            ; 4C A8 44 | Jump to address
    LDY #$8C             ; A0 8C | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_355
; Address: $DFF2EA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_355:
    CLC                  ; 18 | Clear carry flag
    CPX #$24             ; E0 24 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $08              ; 10 08 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_356
; Address: $DFF2F7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_356:
    JSR $78E0            ; 20 E0 78 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    DEC $DC1C,X          ; DE 1C DC | Decrement (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $0B14            ; 0D 14 0B | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $23              ; 05 23 | Logical OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_357
; Address: $DFF314
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_357:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    ASL $1C01,X          ; 1E 01 1C | Arithmetic shift left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_358
; Address: $DFF320
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_358:
    JMP $44A8            ; 4C A8 44 | Jump to address
    LDY #$8C             ; A0 8C | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_35A
; Address: $DFF330
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_35A:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $08              ; 10 08 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    BVC $20              ; 50 20 | Branch if overflow clear
    CPX #$7C             ; E0 7C | Compare X register (immediate)
    INC $DCDC,X          ; FE DC DC | Increment (absolute,X)
    ASL $0C09            ; 0E 09 0C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BEQ $DF              ; F0 DF | Branch if equal
    STZ $E8E3            ; 9C E3 E8 | Store zero to absolute
    LDA                  ; BF F3 5F 40 | Read graphics status
    BRA $6F              ; 80 6F | Branch always
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 00 1F 00 | Read graphics status
    STA                  ; 9F 00 1F 00 | Update graphics data
    INY                  ; C8 | Increment Y register
    INC $E767,X          ; FE 67 E7 | Increment (absolute,X)
    SBC $661C,X          ; FD 1C 66 | Subtract with carry (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BPL $F0              ; 10 F0 | Branch if positive
    BMI $E0              ; 30 E0 | Game work RAM access
    PLP                  ; 28 | Pull processor status from stack
    BEQ $EC              ; F0 EC | Branch if equal
    PEA #$F8CC           ; F4 CC F8 | Push effective address to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$F800           ; F4 00 F8 | Push effective address to stack
    SBC $37F7,Y          ; F9 F7 37 | Subtract with carry (absolute,Y)
    CMP #$E3             ; C9 E3 | Compare accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    STX $FA              ; 86 FA | Store X register to zero page
    PLX                  ; FA | Pull X register from stack
    LSR $FC              ; 46 FC | Logical shift right (zero page)
    ROR $FC              ; 66 FC | Rotate right (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    DEC $E7              ; C6 E7 | Decrement (zero page)
    LDX $7CDF,Y          ; BE DF 7C | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_35B
; Address: $DFF3EA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_35B:
    INC $4678,X          ; FE 78 46 | Increment (absolute,X)
    BPL $FE              ; 10 FE | Branch if positive
    INC $C600,X          ; FE 00 C6 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    CPY #$5F             ; C0 5F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_35C
; Address: $DFF408
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_35C:
    JSR $E25F            ; 20 5F E2 | Jump to subroutine
    ROR $3F              ; 66 3F | Rotate right (zero page)
    STA                  ; 9F 00 9F 00 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    SBC $FA8F,X          ; FD 8F FA | Subtract with carry (absolute,X)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC $F800,X          ; FD 00 F8 | Subtract with carry (absolute,X)
    SBC $F800,Y          ; F9 00 F8 | Subtract with carry (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_35D
; Address: $DFF460
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_35D:
    JSL $6E5F3D          ; 22 3D 5F 6E | Jump to subroutine long
    SBC $F7BD            ; ED BD F7 | Subtract with carry (absolute)
    LDX $DEBD,Y          ; BE BD DE | Load from absolute,Y into X register
    LDA $3DEF,Y          ; B9 EF 3D | Read graphics status
    ROR $C700            ; 6E 00 C7 | Rotate right (absolute)
    DEY                  ; 88 | Decrement Y register
    STX $00              ; 86 00 | Store X register to zero page
    DEC $00              ; C6 00 | Decrement (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ADC $50BF            ; 6D BF 50 | Add with carry (absolute)
    LDA                  ; BF 5F BF 6F | Read graphics status
    EOR $0702            ; 4D 02 07 | Exclusive OR with accumulator (absolute)
    ADC $5000            ; 6D 00 50 | Add with carry (absolute)
    JMP $006000          ; 5C 00 60 00 | Jump to address long
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_35E
; Address: $DFF4A0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_35E:
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $10              ; F0 10 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BIT $54E8            ; 2C E8 54 | Test bits in accumulator (absolute)
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_35F
; Address: $DFF4BB
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_35F:
    BPL $C0              ; 10 C0 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BPL $14              ; 10 14 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    STX $FA74            ; 8E 74 FA | Store X register to absolute address
    STY $7074            ; 8C 74 70 | Store Y register to absolute address
    NOP                  ; EA | No operation
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    AND ($D2),Y          ; 31 D2 | Logical AND with accumulator ((zero page),Y)
    ROR $80              ; 66 80 | Rotate right (zero page)
    SED                  ; F8 | Set decimal mode flag
    STY $8800            ; 8C 00 88 | Store Y register to absolute address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEC $D800            ; CE 00 D8 | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    BPL $CC              ; 10 CC | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    CPX $F8F8            ; EC F8 F8 | Compare X register (absolute)
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $30              ; 80 30 | Branch always
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $3E2F            ; 2D 2F 3E | Logical AND with accumulator (absolute)
    ADC $5B7D,X          ; 7D 7D 5B | Add with carry (absolute,X)
    ROR $DDB5            ; 6E B5 DD | Rotate right (absolute)
    LDA                  ; BF DF BE EF | Read graphics status
    LDX $3DF7,Y          ; BE F7 3D | Load from absolute,Y into X register
    ROL $7B00,X          ; 3E 00 7B | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_360
; Address: $DFF53A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_360:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    LDA                  ; BF 68 BF 6F | Read graphics status
    LDX $FE5F,Y          ; BE 5F FE | Load from absolute,Y into X register
    ROL $1669,X          ; 3E 69 16 | Rotate left (absolute,X)
    ASL $6800,X          ; 1E 00 68 | Arithmetic shift left (absolute,X)
    ADC #$00             ; 69 00 | Add with carry (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_361
; Address: $DFF558
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_361:
    BMI $00              ; 30 00 | Branch if negative
    ROL $1E00,X          ; 3E 00 1E | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STX $FA74            ; 8E 74 FA | Store X register to absolute address
    STY $F0F4            ; 8C F4 F0 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    JMP $5CB4            ; 4C B4 5C | Jump to address
    CPX $B8              ; E4 B8 | Compare X register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    STY $0800            ; 8C 00 08 | Store Y register to absolute address
    STZ $00              ; 64 00 | Store zero to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    STZ $7EF8            ; 9C F8 7E | Store zero to absolute
    INC $7F3C,X          ; FE 3C 7F | Increment (absolute,X)
    ROL $387E,X          ; 3E 7E 38 | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_362
; Address: $DFF59A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_362:
    ROL $3800,X          ; 3E 00 38 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $1E09            ; 0E 09 1E | Arithmetic shift left (absolute)
    AND $6A25,X          ; 3D 25 6A | Logical AND with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $9D              ; E5 9D | Subtract with carry (zero page)
    AND $5802            ; 2D 02 58 | Logical AND with accumulator (absolute)
    ORA $DD              ; 05 DD | Logical OR with accumulator (zero page)
    STA $FFA3FC          ; 8F FC A3 FF | Update graphics data
    JMP $6F7B            ; 4C 7B 6F | Jump to address
    ADC #$E6             ; 69 E6 | Add with carry (immediate)
    EOR $EF37            ; 4D 37 EF | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    ADC $7E4F,X          ; 7D 4F 7E | Add with carry (absolute,X)
    ASL $673F            ; 0E 3F 67 | Arithmetic shift left (absolute)
    ROL $1C3D,X          ; 3E 3D 1C | Rotate left (absolute,X)
    ROR $3C              ; 66 3C | Rotate right (zero page)
    JMP $6700            ; 4C 00 67 | Jump to address
    INC                  ; 1A | Increment accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BMI $D0              ; 30 D0 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_363
; Address: $DFF606
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_363:
    BPL $E0              ; 10 E0 | Game work RAM access
    PHA                  ; 48 | Push accumulator to stack
    BEQ $AE              ; F0 AE | Branch if equal
    INC                  ; 1A | Increment accumulator
    LDA $BB              ; A5 BB | Read graphics status
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    INC                  ; 1A | Increment accumulator
    LDY #$BB             ; A0 BB | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    EOR #$F7             ; 49 F7 | Exclusive OR with accumulator (immediate)
    CMP #$FB             ; C9 FB | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_364
; Address: $DFF625
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_364:
    JSL $CEF2DE          ; 22 DE F2 CE | Jump to subroutine long
    PLY                  ; 7A | Pull Y register from stack
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    LDX $7EFE,Y          ; BE FE 7E | Load from absolute,Y into X register
    INC $FCF4,X          ; FE F4 FC | Increment (absolute,X)
    INC $7C              ; E6 7C | Increment (zero page)
    ROR $3C              ; 66 3C | Rotate right (zero page)
    SEC                  ; 38 | Set carry flag
    ROR                  ; 6A | Rotate right (accumulator)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    SEP #$00             ; E2 00 | Set processor status bits
    REP #$00             ; C2 00 | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $1E09            ; 0E 09 1E | Arithmetic shift left (absolute)
    ADC $EA65,X          ; 7D 65 EA | Add with carry (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $9D              ; E5 9D | Subtract with carry (zero page)
    ADC $D802            ; 6D 02 D8 | Add with carry (absolute)
    ORA $DD              ; 05 DD | Logical OR with accumulator (zero page)
    LSR $4DAF,X          ; 5E AF 4D | Logical shift right (absolute,X)
    SEP #$03             ; E2 03 | Set processor status bits
    ADC $EF3F,X          ; 7D 3F EF | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_365
; Address: $DFF694
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_365:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    JMP $003000          ; 5C 00 30 00 | Jump to address long
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BMI $D0              ; 30 D0 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_366
; Address: $DFF6A6
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_366:
    BPL $E0              ; 10 E0 | Game work RAM access
    PHA                  ; 48 | Push accumulator to stack
    BEQ $AC              ; F0 AC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    LDA $BA              ; A5 BA | Read graphics status
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    LDY #$BA             ; A0 BA | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    EOR #$F7             ; 49 F7 | Exclusive OR with accumulator (immediate)
    CMP $32FF            ; CD FF 32 | Compare accumulator (absolute)
    DEC $FAF6,X          ; DE F6 FA | Decrement (absolute,X)
    ROR $96EC            ; 6E EC 96 | Rotate right (absolute)
    PHX                  ; DA | Push X register to stack
    CPX $00F7            ; EC F7 00 | Compare X register (absolute)
    CMP $1000            ; CD 00 10 | Compare accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $1E00,X          ; 1D 00 1E | Logical OR with accumulator (absolute,X)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    AND #$2F             ; 29 2F | Logical AND with accumulator (immediate)
    STZ $43              ; 64 43 | Store zero to zero page
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $67              ; 10 67 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    STA $5B6E,Y          ; 99 6E 5B | Update graphics data
    BIT $0D3A            ; 2C 3A 0D | Test bits in accumulator (absolute)
    EOR $673E            ; 4D 3E 67 | Exclusive OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_367
; Address: $DFF71D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_367:
    BMI $08              ; 30 08 | Branch if negative
    BRA $40              ; 80 40 | Branch always
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BMI $28              ; 30 28 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    ADC $4C86            ; 6D 86 4C | Add with carry (absolute)
    BRA $40              ; 80 40 | Branch always
    LDY #$10             ; A0 10 | Load immediate value into Y register
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BPL $F4              ; 10 F4 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPX $C812            ; EC 12 C8 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_368
; Address: $DFF741
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_368:
    STX $2ED9            ; 8E D9 2E | Store X register to absolute address
    NOP                  ; EA | No operation
    INC $DC04,X          ; FE 04 DC | Increment (absolute,X)
    LDY $F702,X          ; BC 02 F7 | Load from absolute,X into Y register
    PHP                  ; 08 | Push processor status to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    CMP $B920,Y          ; D9 20 B9 | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    INC $F500,X          ; FE 00 F5 | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    SBC #$36             ; E9 36 | Subtract with carry (immediate)
    INC $AC34            ; EE 34 AC | Increment (absolute)
    LSR $DEEA,X          ; 5E EA DE | Logical shift right (absolute,X)
    CPX $80CC            ; EC CC 80 | Compare X register (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC $F102,Y          ; F9 02 F1 | Subtract with carry (absolute,Y)
    ASL $E8              ; 06 E8 | Arithmetic shift left (zero page)
    BCS $80              ; B0 80 | Branch if carry set
    INC $9EA1,X          ; FE A1 9E | Increment (absolute,X)
    ADC ($56),Y          ; 71 56 | Add with carry ((zero page),Y)
    AND $706B,Y          ; 39 6B 70 | Logical AND with accumulator (absolute,Y)
    ADC #$50             ; 69 50 | Add with carry (immediate)
    JMP ($FF10)          ; 6C 10 FF | Jump to address (absolute indirect)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA                  ; BF 00 1F 00 | Read graphics status
    ADC $3C06,Y          ; 79 06 3C | Add with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $BB4E,Y          ; 19 4E BB | Logical OR with accumulator (absolute,Y)
    JMP $0D3A            ; 4C 3A 0D | Jump to address
    EOR $677E            ; 4D 7E 67 | Exclusive OR with accumulator (absolute)
    ADC $3337            ; 6D 37 33 | Add with carry (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 1F 00 | Read graphics status
    STA                  ; 9F 40 8F 60 | Update graphics data
    BMI $0D              ; 30 0D | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BMI $2A              ; 30 2A | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    JMP ($4C87)          ; 6C 87 4C | Jump to address (absolute indirect)
    BRA $40              ; 80 40 | Branch always
    LDY #$10             ; A0 10 | Load immediate value into Y register
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BPL $F4              ; 10 F4 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $C913            ; EC 13 C9 | Compare X register (absolute)
    STA $2ED9            ; 8D D9 2E | Update graphics data

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_369
; Address: $DFF7E4
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_369:
    NOP                  ; EA | No operation
    ASL $DC              ; 06 DC | Arithmetic shift left (zero page)
    LDA                  ; BF 00 F7 08 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $F800,X          ; FD 00 F8 | Subtract with carry (absolute,X)
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    CMP $BC20,Y          ; D9 20 BC | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    SBC #$36             ; E9 36 | Subtract with carry (immediate)
    INC $AC34            ; EE 34 AC | Increment (absolute)
    JMP $F6DCEA          ; 5C EA DC F6 | Jump to address long
    INC $2C2C,X          ; FE 2C 2C | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FB00,X          ; FE 00 FB | Increment (absolute,X)
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)
    BPL $C0              ; 10 C0 | Branch if positive
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $190B            ; 0D 0B 19 | Logical OR with accumulator (absolute)
    AND $2327,Y          ; 39 27 23 | Logical AND with accumulator (absolute,Y)
    ROL $322D,X          ; 3E 2D 32 | Rotate left (absolute,X)
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    AND $3729            ; 2D 29 37 | Logical AND with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_36A
; Address: $DFF847
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_36A:
    AND #$5D             ; 29 5D | Logical AND with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    STZ $21              ; 64 21 | PPU graphics register access
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    BMI $07              ; 30 07 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STY $75              ; 84 75 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $58              ; F0 58 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_36B
; Address: $DFF869
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_36B:
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    EOR #$38             ; 49 38 | Exclusive OR with accumulator (immediate)
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    JMP $4D18            ; 4C 18 4D | Jump to address
    INC                  ; 1A | Increment accumulator
    ORA $353A,X          ; 1D 3A 35 | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_36C
; Address: $DFF882
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_36C:
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$04             ; E0 04 | Compare X register (immediate)
    STZ $F40C            ; 9C 0C F4 | Store zero to absolute
    LDX $CE62,Y          ; BE 62 CE | Load from absolute,Y into X register
    BNE $00              ; D0 00 | Branch if not equal
    INX                  ; E8 | Increment X register
    BPL $48              ; 10 48 | Branch if positive
    BCS $0C              ; B0 0C | Branch if carry set
    BEQ $FC              ; F0 FC | Branch if equal
    DEC $DE00,X          ; DE 00 DE | Decrement (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_36D
; Address: $DFF8A2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_36D:
    JSL $F42CDC          ; 22 DC 2C F4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BNE $CC              ; D0 CC | Branch if not equal
    STY $2400            ; 8C 00 24 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $E0              ; 10 E0 | Game work RAM access
    BRA $E0              ; 80 E0 | Game work RAM access
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    BMI $64              ; 30 64 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHX                  ; DA | Push X register to stack
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_36E
; Address: $DFF8D2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_36E:
    JSR $D040            ; 20 40 D0 | Jump to subroutine
    BMI $98              ; 30 98 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPY $24FC            ; CC FC 24 | Compare Y register (absolute)
    CPY #$32             ; C0 32 | Compare Y register (immediate)
    AND $3729            ; 2D 29 37 | Logical AND with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_36F
; Address: $DFF8EA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_36F:
    ROR                  ; 6A | Rotate right (accumulator)
    AND ($B1),Y          ; 31 B1 | Logical AND with accumulator ((zero page),Y)
    ROR $B5              ; 66 B5 | Rotate right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_370
; Address: $DFF8F4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_370:
    SEI                  ; 78 | Set interrupt disable flag
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    STX $73              ; 86 73 | Store X register to zero page
    ADC ($F3,X)          ; 61 F3 | Add with carry ((zero page,X))
    LSR $7EC6,X          ; 5E C6 7E | Logical shift right (absolute,X)
    JMP ($4C3E)          ; 6C 3E 4C | Jump to address (absolute indirect)
    ROL $3C5A,X          ; 3E 5A 3C | Rotate left (absolute,X)
    ROL $7802,X          ; 3E 02 78 | Rotate left (absolute,X)
    JMP ($4C00)          ; 6C 00 4C | Jump to address (absolute indirect)
    ASL $3E79,X          ; 1E 79 3E | Arithmetic shift left (absolute,X)
    ROL $3E33,X          ; 3E 33 3E | Rotate left (absolute,X)
    AND $3C              ; 25 3C | Logical AND with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_371
; Address: $DFF922
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_371:
    JSL $F42CDC          ; 22 DC 2C F4 | Jump to subroutine long
    STY $5834            ; 8C 34 58 | Store Y register to absolute address
    TAY                  ; A8 | Transfer accumulator to Y register
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$88             ; A0 88 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPY $8C00            ; CC 00 8C | Compare Y register (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $18              ; 80 18 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    LDY #$10             ; A0 10 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_372
; Address: $DFF940
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_372:
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $80              ; 50 80 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    BMI $24              ; 30 24 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BNE $30              ; D0 30 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    JMP $4CBC            ; 4C BC 4C | Jump to address
    CLV                  ; B8 | Clear overflow flag
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ASL $1E10            ; 0E 10 1E | Arithmetic shift left (absolute)
    BMI $2C              ; 30 2C | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_373
; Address: $DFF96A
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_373:
    STZ $5F              ; 64 5F | Store zero to zero page
    ADC $744F,Y          ; 79 4F 74 | Add with carry (absolute,Y)
    ASL $1A01            ; 0E 01 1A | Arithmetic shift left (absolute)
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROR $3600,X          ; 7E 00 36 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    WDM #$3D             ; 42 3D | Reserved instruction
    TSX                  ; BA | Transfer stack pointer to X register
    CLC                  ; 18 | Clear carry flag
    INC $53A4            ; EE A4 53 | Increment (absolute)
    STA $802F,Y          ; 99 2F 80 | Update graphics data
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    SBC ($18,X)          ; E1 18 | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STA $040C,X          ; 9D 0C 04 | Update graphics data
    JMP $3036            ; 4C 36 30 | Jump to address
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    LSR $3F              ; 46 3F | Logical shift right (zero page)
    BIT #$46             ; 89 46 | Test bits in accumulator (immediate)
    EOR #$AD             ; 49 AD | Exclusive OR with accumulator (immediate)
    AND $395F            ; 2D 5F 39 | Logical AND with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BPL $FC              ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_374
; Address: $DFF9DF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_374:
    JSR $CE39            ; 20 39 CE | Jump to subroutine
    WDM #$BC             ; 42 BC | Reserved instruction
    LSR $1EF2,X          ; 5E F2 1E | Logical shift right (absolute,X)
    ROL $CA              ; 26 CA | Rotate left (zero page)
    STA ($FB),Y          ; 91 FB | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    LDA                  ; BF 30 2F F8 | Read graphics status
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_375
; Address: $DFFA03
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_375:
    ADC $8B15            ; 6D 15 8B | Add with carry (absolute)
    ROR $FC              ; 66 FC | Rotate right (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    STA ($60,X)          ; 81 60 | Update graphics data
    BRA $91              ; 80 91 | Branch always
    PEA #$FC98           ; F4 98 FC | Push effective address to stack
    CPY $E0FC            ; CC FC E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    WDM #$3D             ; 42 3D | Reserved instruction
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF B8 5E 04 | Read graphics status
    ADC $800F,Y          ; 79 0F 80 | Add with carry (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    EOR ($18,X)          ; 41 18 | Exclusive OR with accumulator ((zero page,X))
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    JMP $0784            ; 4C 84 07 | Jump to address
    STY $7076            ; 8C 76 70 | Store Y register to absolute address
    ROL $00              ; 26 00 | Rotate left (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    STY $781F            ; 8C 1F 78 | Store Y register to absolute address
    BIT #$06             ; 89 06 | Test bits in accumulator (immediate)
    LDA                  ; BF 49 B9 5F | Read graphics status
    LDA $335F,Y          ; B9 5F 33 | Read graphics status
    ORA $1567            ; 0D 67 15 | Logical OR with accumulator (absolute)
    SBC $F84A,Y          ; F9 4A F8 | Subtract with carry (absolute,Y)
    CPX $3030            ; EC 30 30 | Compare X register (absolute)
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    STA ($60),Y          ; 91 60 | Update graphics data
    SBC #$90             ; E9 90 | Subtract with carry (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $10FC            ; 9C FC 10 | Store zero to absolute
    BMI $00              ; 30 00 | Branch if negative
    CPY #$51             ; C0 51 | Compare Y register (immediate)
    ROL $3B44            ; 2E 44 3B | Rotate left (absolute)
    BVC $2D              ; 50 2D | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    ROL                  ; 2A | Rotate left (accumulator)
    RTI                  ; 40 | Return from interrupt
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_377
; Address: $DFFA9B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_377:
    JSR $0748            ; 20 48 07 | Jump to subroutine
    ORA #$27             ; 09 27 | Logical OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_378
; Address: $DFFAA6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_378:
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    BIT $0C1F            ; 2C 1F 0C | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    AND $0301,Y          ; 39 01 03 | Logical AND with accumulator (absolute,Y)
    BIT $3F59            ; 2C 59 3F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_379
; Address: $DFFABC
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_379:
    JSR $0138            ; 20 38 01 | Jump to subroutine
    JMP $94B4            ; 4C B4 94 | Jump to address
    CPX $D6EA            ; EC EA D6 | Compare X register (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PHX                  ; DA | Push X register to stack
    JMP ($8C96)          ; 6C 96 8C | Jump to address (absolute indirect)
    ORA $ADE6            ; 0D E6 AD | Logical OR with accumulator (absolute)
    LSR $84              ; 46 84 | Logical shift right (zero page)
    STY $1E00            ; 8C 00 1E | Store Y register to absolute address
    INC $1EE0,X          ; FE E0 1E | Increment (absolute,X)
    CMP ($6E),Y          ; D1 6E | Compare accumulator ((zero page),Y)
    LDX $2F              ; A6 2F | Load from zero page into X register
    PHY                  ; 5A | Push Y register to stack
    PLX                  ; FA | Pull X register from stack
    ROR $FC              ; 66 FC | Rotate right (zero page)
    ASL $1600            ; 0E 00 16 | Arithmetic shift left (absolute)
    BRA $D2              ; 80 D2 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $ECFC            ; 8C FC EC | Store Y register to absolute address
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    BMI $0D              ; 30 0D | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    STX $5672            ; 8E 72 56 | Store X register to absolute address
    BMI $13              ; 30 13 | Branch if negative
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BPL $20              ; 10 20 | Branch if positive
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR #$07             ; 49 07 | Exclusive OR with accumulator (immediate)
    EOR #$12             ; 49 12 | Exclusive OR with accumulator (immediate)
    EOR $3432,Y          ; 59 32 34 | Exclusive OR with accumulator (absolute,Y)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $4C1F            ; 0E 1F 4C | Arithmetic shift left (absolute)
    EOR $3E1E            ; 4D 1E 3E | Exclusive OR with accumulator (absolute)
    ROL $04              ; 26 04 | Rotate left (zero page)
    EOR $513F,Y          ; 59 3F 51 | Exclusive OR with accumulator (absolute,Y)
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    STX $CF              ; 86 CF | Store X register to zero page
    PLY                  ; 7A | Pull Y register from stack
    INC $FC36,X          ; FE 36 FC | Increment (absolute,X)
    PHX                  ; DA | Push X register to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_37A
; Address: $DFFB50
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_37A:
    ASL $3600,X          ; 1E 00 36 | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STZ $C8FC,X          ; 9E FC C8 | Store zero to absolute,X
    CPY $24FC            ; CC FC 24 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $37              ; 10 37 | Branch if positive
    BPL $7B              ; 10 7B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    BPL $1C              ; 10 1C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ASL $3303,X          ; 1E 03 33 | Arithmetic shift left (absolute,X)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $0A00            ; 0E 00 0A | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BMI $5A              ; 30 5A | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ASL $0405            ; 0E 05 04 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BRA $20              ; 80 20 | Branch always
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    INC $FE10,X          ; FE 10 FE | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_37B
; Address: $DFFBD5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_37B:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BPL $18              ; 10 18 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $38              ; 10 38 | Branch if positive
    BMI $78              ; 30 78 | Branch if negative
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_37C
; Address: $DFFBE4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_37C:
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    REP #$CA             ; C2 CA | Reset processor status bits
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    BEQ $41              ; F0 41 | Branch if equal
    BVC $00              ; 50 00 | Branch if overflow clear
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $42              ; 05 42 | Hardware register operation
    ORA #$C6             ; 09 C6 | Logical OR with accumulator (immediate)
    ORA $19EC,Y          ; 19 EC 19 | Logical OR with accumulator (absolute,Y)
    ORA $1A1A,X          ; 1D 1A 1A | Logical OR with accumulator (absolute,X)
    BPL $28              ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_37D
; Address: $DFFC07
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_37D:
    JSL $B03238          ; 22 38 32 B0 | Jump to subroutine long
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_37E
; Address: $DFFC0F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_37E:
    BRA $30              ; 80 30 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    BEQ $25              ; F0 25 | Branch if equal
    LDX #$E0             ; A2 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_37F
; Address: $DFFC1E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_37F:
    BRA $80              ; 80 80 | Branch always
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ROL $5303            ; 2E 03 53 | Rotate left (absolute)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $0A00            ; 0E 00 0A | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $03              ; 10 03 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_380
; Address: $DFFC42
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_380:
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $1509,Y          ; 59 09 15 | Exclusive OR with accumulator (absolute,Y)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA $0F05            ; 0D 05 0F | Logical OR with accumulator (absolute)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_381
; Address: $DFFC62
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_381:
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    REP #$CC             ; C2 CC | Reset processor status bits
    NOP                  ; EA | No operation
    RTI                  ; 40 | Return from interrupt
    BEQ $40              ; F0 40 | Branch if equal
    BVC $01              ; 50 01 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    EOR $0A01,Y          ; 59 01 0A | Exclusive OR with accumulator (absolute,Y)
    ORA $42              ; 05 42 | Hardware register operation
    ORA $CA              ; 05 CA | Logical OR with accumulator (zero page)
    ORA $16EE,Y          ; 19 EE 16 | Logical OR with accumulator (absolute,Y)
    CPY #$15             ; C0 15 | Compare Y register (immediate)
    ASL $0609            ; 0E 09 06 | Arithmetic shift left (absolute)
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    BVS $A0              ; 70 A0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_382
; Address: $DFFC8E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_382:
    JSR $21C0            ; 20 C0 21 | PPU graphics register access
    CPY $20C0            ; CC C0 20 | Compare Y register (absolute)
    BEQ $01              ; F0 01 | Branch if equal
    BEQ $15              ; F0 15 | Branch if equal

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_383
; Address: $DFFC9C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_383:
    JSL $C04020          ; 22 20 40 C0 | Jump to subroutine long
    BPL $7F              ; 10 7F | Branch if positive
    ROR $0001,X          ; 7E 01 00 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    ADC ($0D),Y          ; 71 0D | Add with carry ((zero page),Y)
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    BMI $04              ; 30 04 | Branch if negative
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_384
; Address: $DFFCD1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_384:
    JSR $2001            ; 20 01 20 | Jump to subroutine
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    BPL $09              ; 10 09 | Branch if positive
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_386
; Address: $DFFCF7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_386:
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    CPX $18              ; E4 18 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BRA $FC              ; 80 FC | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_387
; Address: $DFFD22
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_387:
    LDY $08D0            ; AC D0 08 | Load from absolute address into Y register
    BNE $08              ; D0 08 | Branch if not equal
    BCS $98              ; B0 98 | Branch if carry set
    CPX #$78             ; E0 78 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $A0              ; 30 A0 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_388
; Address: $DFFD34
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_388:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $64              ; F0 64 | Branch if equal
    CPX #$04             ; E0 04 | Compare X register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $20              ; 30 20 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    BCS $A0              ; B0 A0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_389
; Address: $DFFD4E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_389:
    JSR $10C0            ; 20 C0 10 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_38A
; Address: $DFFD55
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_38A:
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $20              ; F0 20 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_38C
; Address: $DFFD5E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_38C:
    RTI                  ; 40 | Return from interrupt
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ROR $7800,X          ; 7E 00 78 | Rotate right (absolute,X)
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    BPL $02              ; 10 02 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_38D
; Address: $DFFD71
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_38D:
    JSR $2001            ; 20 01 20 | Jump to subroutine
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $1502            ; 0D 02 15 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    BPL $02              ; 10 02 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_38E
; Address: $DFFD90
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_38E:
    JSR $281E            ; 20 1E 28 | Jump to subroutine
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$80             ; E0 80 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_38F
; Address: $DFFDA4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_38F:
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $40              ; F0 40 | Branch if equal
    BMI $20              ; 30 20 | Branch if negative
    BCS $A0              ; B0 A0 | Branch if carry set
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $10              ; 80 10 | Branch always
    CPX #$10             ; E0 10 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_392
; Address: $DFFDB8
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_392:
    JSR $A0E0            ; 20 E0 A0 | Jump to subroutine
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $1C01            ; 0E 01 1C | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $7809,X          ; 3E 09 78 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_393
; Address: $DFFDD8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_393:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $1700,Y          ; 19 00 17 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL $62              ; 06 62 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_394
; Address: $DFFDE4
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_394:
    JSR $38D5            ; 20 D5 38 | Jump to subroutine
    LSR $38              ; 46 38 | Logical shift right (zero page)
    LSR $4F04            ; 4E 04 4F | Logical shift right (absolute)
    STY $0A04            ; 8C 04 0A | Store Y register to absolute address
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    EOR ($84,X)          ; 41 84 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDY #$4E             ; A0 4E | Load immediate value into Y register
    BCS $4F              ; B0 4F | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    JMP $050D            ; 4C 0D 05 | Jump to address
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $4F              ; A4 4F | Load from zero page into Y register
    LDY $454F            ; AC 4F 45 | Load from absolute address into Y register
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BVC $7C              ; 50 7C | Branch if overflow clear
    BCC $1C              ; 90 1C | Branch if carry clear
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BNE $10              ; D0 10 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    BPL $98              ; 10 98 | Branch if positive
    INX                  ; E8 | Increment X register
    BPL $FE              ; 10 FE | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_395
; Address: $DFFE42
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_395:
    LSR $A8              ; 46 A8 | Logical shift right (zero page)
    ASL $A8              ; 06 A8 | Arithmetic shift left (zero page)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    BVS $24              ; 70 24 | Branch if overflow set
    BEQ $CA              ; F0 CA | Branch if equal
    INX                  ; E8 | Increment X register
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_397
; Address: $DFFE58
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_397:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BVS $08              ; 70 08 | Branch if overflow set
    BEQ $18              ; F0 18 | Branch if equal
    CPX $D619            ; EC 19 D6 | Compare X register (absolute)
    ORA $5A1A,X          ; 1D 1A 5A | Logical OR with accumulator (absolute,X)
    BVC $48              ; 50 48 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BPL $90              ; 10 90 | Branch if positive
    BRA $70              ; 80 70 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    BVC $F0              ; 50 F0 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_399
; Address: $DFFE84
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_399:
    JSR $3855            ; 20 55 38 | Jump to subroutine
    LSR $38              ; 46 38 | Logical shift right (zero page)
    LSR $0F64            ; 4E 64 0F | Logical shift right (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY $8A              ; C4 8A | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $41              ; 80 41 | Branch always
    STY $40              ; 84 40 | Store Y register to zero page
    LDY #$4E             ; A0 4E | Load immediate value into Y register
    BCC $0F              ; 90 0F | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_39A
; Address: $DFFEA2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_39A:
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BPL $40              ; 10 40 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $0E09,Y          ; 19 09 0E | Logical OR with accumulator (absolute,Y)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    LDY #$4F             ; A0 4F | Load immediate value into Y register
    LDY #$4F             ; A0 4F | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    INC $4660,X          ; FE 60 46 | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_39B
; Address: $DFFEC4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_39B:
    ASL $A8              ; 06 A8 | Arithmetic shift left (zero page)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    BVS $24              ; 70 24 | Branch if overflow set
    BEQ $CC              ; F0 CC | Branch if equal
    INX                  ; E8 | Increment X register
    BMI $20              ; 30 20 | Branch if negative
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_39C
; Address: $DFFED8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_39C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BVS $08              ; 70 08 | Branch if overflow set
    BEQ $18              ; F0 18 | Branch if equal
    INX                  ; E8 | Increment X register
    CPY #$32             ; C0 32 | Compare Y register (immediate)
    BIT $949A            ; 2C 9A 94 | Test bits in accumulator (absolute)
    LDY $28A0            ; AC A0 28 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_39D
; Address: $DFFEE9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_39D:
    JSR $A0B0            ; 20 B0 A0 | Jump to subroutine
    BEQ $40              ; F0 40 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_39E
; Address: $DFFEEF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_39E:
    BRA $20              ; 80 20 | Branch always
    CPY $20E0            ; CC E0 20 | Compare Y register (absolute)
    BCC $F0              ; 90 F0 | Branch if carry clear
    LDY #$F0             ; A0 F0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_39F
; Address: $DFFEF8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_39F:
    JSR $A0F0            ; 20 F0 A0 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3A0
; Address: $DFFEFE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3A0:
    BRA $80              ; 80 80 | Branch always
    ASL $35              ; 06 35 | Arithmetic shift left (zero page)
    BPL $6B              ; 10 6B | Branch if positive
    BPL $2D              ; 10 2D | Branch if positive
    ORA $1E27,Y          ; 19 27 1E | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3A1
; Address: $DFFF0B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3A1:
    JSL $39250C          ; 22 0C 25 39 | Jump to subroutine long
    WDM #$02             ; 42 02 | Reserved instruction
    STY $60              ; 84 60 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3A3
; Address: $DFFF1B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3A3:
    JSL $402552          ; 22 52 25 40 | Jump to subroutine long
    LSR $17              ; 46 17 | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    ASL $0C22            ; 0E 22 0C | Arithmetic shift left (absolute)
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    ORA $0405            ; 0D 05 04 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    LSR $5201            ; 4E 01 52 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3A4
; Address: $DFFF3A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3A4:
    JSR $0407            ; 20 07 04 | Jump to subroutine
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    INC $3E00,X          ; FE 00 3E | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $FE40,X          ; 3E 40 FE | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3A5
; Address: $DFFF47
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3A5:
    BRA $FC              ; 80 FC | Branch always
    INX                  ; E8 | Increment X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $04              ; 80 04 | Branch always
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    PLP                  ; 28 | Pull processor status from stack
    BCC $08              ; 90 08 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BCC $68              ; 90 68 | Branch if carry clear
    BVC $20              ; 50 20 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    BPL $88              ; 10 88 | Branch if positive
    BRA $D8              ; 80 D8 | Branch always
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BRA $94              ; 80 94 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $10              ; 80 10 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    BVS $40              ; 70 40 | Branch if overflow set
    BVS $60              ; 70 60 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3A6
; Address: $DFFF7E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3A6:
    BRA $80              ; 80 80 | Branch always
    ASL $35              ; 06 35 | Arithmetic shift left (zero page)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $2D              ; 10 2D | Branch if positive
    ORA $1E07,Y          ; 19 07 1E | Logical OR with accumulator (absolute,Y)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3A9
; Address: $DFFFA4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3A9:
    JSL $021711          ; 22 11 17 02 | Jump to subroutine long
    BPL $05              ; 10 05 | Branch if positive
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    AND #$17             ; 29 17 | Logical AND with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $3E00,X          ; FE 00 3E | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank3E_GraphicsFunction_3AA
; Address: $DFFFC4
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank3E_GraphicsFunction_3AA:
    ROL $FE40,X          ; 3E 40 FE | Rotate left (absolute,X)
    BRA $FC              ; 80 FC | Branch always
    INX                  ; E8 | Increment X register
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BRA $04              ; 80 04 | Branch always
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    PHA                  ; 48 | Push accumulator to stack
    BMI $18              ; 30 18 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BCC $10              ; 90 10 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$B8             ; A0 B8 | Load immediate value into Y register
    LDY #$70             ; A0 70 | Load immediate value into Y register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $20              ; F0 20 | Branch if equal
    BVS $20              ; 70 20 | Branch if overflow set
    BVS $20              ; 70 20 | Branch if overflow set
