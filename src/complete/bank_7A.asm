;==============================================================================
; Dragon Quest III - Bank $7A
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $FD0000-$FD7FFF
; Instructions: 8656
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_7A"

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_000
; Address: $FD8000
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_000:
    BNE $60              ; D0 60 | Branch if not equal
    BVS $A0              ; 70 A0 | Branch if overflow set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_001
; Address: $FD8012
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_001:
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_002
; Address: $FD8023
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_002:
    ADC $7F80,X          ; 7D 80 7F | Add with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    LDY $9F5B,X          ; BC 5B 9F | Load from absolute,X into Y register
    AND $40              ; 25 40 | Logical AND with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ADC $6340,X          ; 7D 40 63 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_003
; Address: $FD8041
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_003:
    BEQ $82              ; F0 82 | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$D43A           ; F4 3A D4 | Push effective address to stack
    PLY                  ; 7A | Pull Y register from stack
    CPX $4800            ; EC 00 48 | Compare X register (absolute)
    STZ $7C04            ; 9C 04 7C | Store zero to absolute
    STY $FC04            ; 8C 04 FC | Store Y register to absolute address
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF 5F 9F 6F | Read graphics status
    JMP $4033            ; 4C 33 40 | Jump to address
    ADC $6340,X          ; 7D 40 63 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_004
; Address: $FD807C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_004:
    JSR $303F            ; 20 3F 30 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    PEA #$F4FA           ; F4 FA F4 | Push effective address to stack
    CPX $C8B4            ; EC B4 C8 | Compare X register (absolute)
    STZ $98              ; 64 98 | Store zero to zero page
    STY $FC04            ; 8C 04 FC | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_005
; Address: $FD809D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_005:
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    INC $778F            ; EE 8F 77 | Increment (absolute)
    AND $6826,X          ; 3D 26 68 | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    ADC ($74),Y          ; 71 74 | Add with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    PLA                  ; 68 | Pull accumulator from stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_006
; Address: $FD80C1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_006:
    STZ $7FC8,X          ; 9E C8 7F | Store zero to absolute,X
    BRA $7F              ; 80 7F | Branch always
    INC $40              ; E6 40 | Increment (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_008
; Address: $FD80D5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_008:
    JSL $00C000          ; 22 00 C0 00 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_009
; Address: $FD80E1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_009:
    PLP                  ; 28 | Pull processor status from stack
    ASL $1C32,X          ; 1E 32 1C | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    JMP ($7C38)          ; 6C 38 7C | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    ORA $0A03            ; 0D 03 0A | Logical OR with accumulator (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    BVS $80              ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_00A
; Address: $FD8122
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_00A:
    JSR $10C0            ; 20 C0 10 | Jump to subroutine
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BVS $40              ; 70 40 | Branch if overflow set
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_00B
; Address: $FD812A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_00B:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    AND #$23             ; 29 23 | Logical AND with accumulator (immediate)
    BPL $15              ; 10 15 | Branch if positive
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_00C
; Address: $FD8151
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_00C:
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    AND $38              ; 25 38 | Logical AND with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BPL $0A              ; 10 0A | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    DEC $FC98            ; CE 98 FC | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$F000           ; F4 00 F0 | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ASL $2E0C,X          ; 1E 0C 2E | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BMI $30              ; 30 30 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_00D
; Address: $FD81B0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_00D:
    JSR $303F            ; 20 3F 30 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PEA #$E4E8           ; F4 E8 E4 | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $90              ; 30 90 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_00E
; Address: $FD81C8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_00E:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_00F
; Address: $FD81D7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_00F:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA $0406,Y          ; 19 06 04 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    INY                  ; C8 | Increment Y register
    BMI $30              ; 30 30 | Branch if negative
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_010
; Address: $FD822C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_010:
    ROL $3914,X          ; 3E 14 39 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND $11DC,X          ; 3D DC 11 | Logical AND with accumulator (absolute,X)
    LDA                  ; BF 00 00 00 | Read graphics status
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    SBC ($40,X)          ; E1 40 | Subtract with carry ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA $F603,X          ; 1D 03 F6 | Logical OR with accumulator (absolute,X)
    SBC #$DB             ; E9 DB | Subtract with carry (immediate)
    ROL $09              ; 26 09 | Rotate left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $E0              ; D0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_011
; Address: $FD827E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_011:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $3D0C,X          ; 1D 0C 3D | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $1303            ; 0E 03 13 | Arithmetic shift left (absolute)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ROL $041D            ; 2E 1D 04 | Rotate left (absolute)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    AND $1C1C            ; 2D 1C 1C | Logical AND with accumulator (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0292            ; 0D 92 02 | Logical OR with accumulator (absolute)
    CMP ($91),Y          ; D1 91 | Compare accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_014
; Address: $FD8313
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_014:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_015
; Address: $FD8320
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_015:
    CMP $3403,Y          ; D9 03 34 | Compare accumulator (absolute,Y)
    ORA ($6F,X)          ; 01 6F | Logical OR with accumulator ((zero page,X))
    BRA $FA              ; 80 FA | Branch always
    BCS $DA              ; B0 DA | Branch if carry set
    BNE $0B              ; D0 0B | Branch if not equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_016
; Address: $FD832B
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_016:
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    INC $7F6F,X          ; FE 6F 7F | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PHX                  ; DA | Push X register to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ASL $140B,X          ; 1E 0B 14 | Arithmetic shift left (absolute,X)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1434,X          ; 1E 34 14 | Arithmetic shift left (absolute,X)
    ROL $9E0A,X          ; 3E 0A 9E | Rotate left (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BNE $90              ; D0 90 | Branch if not equal
    PLX                  ; FA | Pull X register from stack
    TAX                  ; AA | Transfer accumulator to X register
    CMP $8085            ; CD 85 80 | Compare accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $90              ; 80 90 | Branch always
    STY $BA              ; 84 BA | Store Y register to zero page
    LDY $B88D,X          ; BC 8D B8 | Load from absolute,X into Y register
    ASL $1C0A,X          ; 1E 0A 1C | Arithmetic shift left (absolute,X)
    ASL $0F16            ; 0E 16 0F | Arithmetic shift left (absolute)
    ASL $0203            ; 0E 03 02 | Arithmetic shift left (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $8ABA,X          ; 1D BA 8A | Logical OR with accumulator (absolute,X)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    BCC $58              ; 90 58 | Branch if carry clear
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    SBC #$41             ; E9 41 | Subtract with carry (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    BPL $7C              ; 10 7C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $111C,X          ; 3E 1C 11 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_017
; Address: $FD83C5
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_017:
    ASL $0708            ; 0E 08 07 | Arithmetic shift left (absolute)
    ROR $1E00,X          ; 7E 00 1E | Rotate right (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ROR $1E00,X          ; 7E 00 1E | Rotate right (absolute,X)
    LDY $6433,X          ; BC 33 64 | Load from absolute,X into Y register
    INC                  ; 1A | Increment accumulator
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    LDY $64CD,X          ; BC CD 64 | Load from absolute,X into Y register
    SBC $7918,X          ; FD 18 79 | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INC $0D              ; E6 0D | Increment (zero page)
    SBC #$AA             ; E9 AA | Subtract with carry (immediate)
    JMP ($60FC)          ; 6C FC 60 | Jump to address (absolute indirect)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_018
; Address: $FD842B
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_018:
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    BEQ $30              ; F0 30 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CMP $D60D,Y          ; D9 0D D6 | Compare accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $800C            ; 4C 0C 80 | Jump to address
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    STA ($81,X)          ; 81 81 | Update graphics data
    STA ($80,X)          ; 81 80 | Update graphics data
    BVC $50              ; 50 50 | Branch if overflow clear
    AND $18              ; 25 18 | Logical AND with accumulator (zero page)
    SBC ($E6,X)          ; E1 E6 | Subtract with carry ((zero page,X))
    INC $00E7            ; EE E7 00 | Increment (absolute)
    BVC $20              ; 50 20 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $1AE0            ; 0D E0 1A | Logical OR with accumulator (absolute)
    BVS $F8              ; 70 F8 | Branch if overflow set
    INX                  ; E8 | Increment X register
    ORA $6000,Y          ; 19 00 60 | Logical OR with accumulator (absolute,Y)
    BEQ $30              ; F0 30 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    INC $FF00            ; EE 00 FF | Increment (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_019
; Address: $FD84AC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_019:
    INX                  ; E8 | Increment X register
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $0000,Y          ; BE 00 00 | Load from absolute,Y into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_01B
; Address: $FD84BB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_01B:
    JSL $001600          ; 22 00 16 00 | Jump to subroutine long
    BCC $00              ; 90 00 | Branch if carry clear
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_01C
; Address: $FD84C8
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_01C:
    JSR $3277            ; 20 77 32 | Jump to subroutine
    INC $7D02,X          ; FE 02 7D | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    JMP $30FF            ; 4C FF 30 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    JMP $4CB3E3          ; 5C E3 B3 4C | Jump to address long
    PHA                  ; 48 | Push accumulator to stack
    BEQ $26              ; F0 26 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $3000            ; 0E 00 30 | Arithmetic shift left (absolute)
    LDA                  ; BF 33 7F 08 | Read graphics status
    ASL $DF              ; 06 DF | Arithmetic shift left (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF07,X          ; FE 07 FF | Increment (absolute,X)
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_01D
; Address: $FD852A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_01D:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $1C00,X          ; 1E 00 1C | Arithmetic shift left (absolute,X)
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_01F
; Address: $FD8586
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_01F:
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_020
; Address: $FD8592
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_020:
    JSL $222222          ; 22 22 22 22 | Jump to subroutine long
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $47              ; 70 47 | Branch if overflow set
    BVC $17              ; 50 17 | Branch if overflow clear
    BEQ $CF              ; F0 CF | Branch if equal
    ADC $EB1D,X          ; 7D 1D EB | Add with carry (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    BEQ $AA              ; F0 AA | Branch if equal
    INX                  ; E8 | Increment X register
    BVS $3F              ; 70 3F | Branch if overflow set
    BVC $ED              ; 50 ED | Branch if overflow clear
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_021
; Address: $FD85D9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_021:
    ADC $D4              ; 65 D4 | Add with carry (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    AND ($DD,X)          ; 21 DD | Logical AND with accumulator ((zero page,X))
    SBC $DCA8,X          ; FD A8 DC | Subtract with carry (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    LSR $2E54            ; 4E 54 2E | Logical shift right (absolute)
    ROL $A0              ; 26 A0 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_023
; Address: $FD85F4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_023:
    JSR $3074            ; 20 74 30 | Jump to subroutine
    PEA #$F250           ; F4 50 F2 | Push effective address to stack
    BCC $FA              ; 90 FA | Branch if carry clear
    LDY #$FA             ; A0 FA | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_024
; Address: $FD85FE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_024:
    JSR $04F8            ; 20 F8 04 | Jump to subroutine
    ORA ($17),Y          ; 11 17 | Logical OR with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    PLP                  ; 28 | Pull processor status from stack
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BPL $08              ; 10 08 | Branch if positive
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_025
; Address: $FD861B
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_025:
    JSL $050227          ; 22 27 02 05 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BEQ $0B              ; F0 0B | Branch if equal
    INX                  ; E8 | Increment X register
    SBC ($1A),Y          ; F1 1A | Subtract with carry ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    EOR $0EBA,X          ; 5D BA 0E | Exclusive OR with accumulator (absolute,X)
    LDX $272E            ; AE 2E 27 | Load from absolute address into X register
    PHP                  ; 08 | Push processor status to stack
    INC $B70B            ; EE 0B B7 | Increment (absolute)
    DEC $C41A            ; CE 1A C4 | Decrement (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    INY                  ; C8 | Increment Y register
    CPX $264C            ; EC 4C 26 | Compare X register (absolute)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    BRA $00              ; 80 00 | Branch always
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_026
; Address: $FD8673
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_026:
    BPL $00              ; 10 00 | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $7906,X          ; FE 06 79 | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $16              ; 80 16 | Branch always
    LDY $EE64,X          ; BC 64 EE | Load from absolute,X into Y register
    ROR $F177            ; 6E 77 F1 | Rotate right (absolute)
    STY $583C            ; 8C 3C 58 | Store Y register to absolute address
    ROL $1710            ; 2E 10 17 | Rotate left (absolute)
    STX $0848            ; 8E 48 08 | Store X register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_028
; Address: $FD86C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_028:
    JMP ($344C)          ; 6C 4C 34 | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_02A
; Address: $FD86D6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_02A:
    JMP $146C            ; 4C 6C 14 | Jump to address
    ROL $DC37,X          ; 3E 37 DC | Rotate left (absolute,X)
    DEC $1C38            ; CE 38 1C | Decrement (absolute)
    BVS $38              ; 70 38 | Branch if overflow set
    CPX #$70             ; E0 70 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_02B
; Address: $FD86EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_02B:
    BRA $C0              ; 80 C0 | Branch always
    BRA $36              ; 80 36 | Branch always
    CPY $18CC            ; CC CC 18 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_02D
; Address: $FD86FA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_02D:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    LDX #$92             ; A2 92 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_02E
; Address: $FD8728
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_02E:
    JSR $6400            ; 20 00 64 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BCS $78              ; B0 78 | Branch if carry set
    BCS $70              ; B0 70 | Branch if carry set
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_02F
; Address: $FD8738
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_02F:
    JSR $60F0            ; 20 F0 60 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_030
; Address: $FD873E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_030:
    RTI                  ; 40 | Return from interrupt
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVS $F0              ; 70 F0 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    STZ $4E5C            ; 9C 5C 4E | Store zero to absolute
    LSR $0047            ; 4E 47 00 | Logical shift right (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_032
; Address: $FD8798
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_032:
    BCS $B0              ; B0 B0 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $464C            ; 4C 4C 46 | Jump to address
    LSR $06              ; 46 06 | Logical shift right (zero page)
    ORA $0F03,Y          ; 19 03 0F | Logical OR with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_033
; Address: $FD87A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_033:
    JSR $2C3E            ; 20 3E 2C | Jump to subroutine
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_034
; Address: $FD87B5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_034:
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ROL $1713,X          ; 3E 13 17 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_035
; Address: $FD87BB
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_035:
    JSL $050227          ; 22 27 02 05 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEP #$4C             ; E2 4C | Set processor status bits
    LDY $F115            ; AC 15 F1 | Load from absolute address into Y register
    PHY                  ; 5A | Push Y register to stack
    PLY                  ; 7A | Pull Y register from stack
    EOR $1AB2,X          ; 5D B2 1A | Exclusive OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    LDY $2C38            ; AC 38 2C | Load from absolute address into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCS $15              ; B0 15 | Branch if carry set
    DEC $845A            ; CE 5A 84 | Decrement (absolute)
    BNE $E8              ; D0 E8 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    ASL $0C17,X          ; 1E 17 0C | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0C08,X          ; 1E 08 0C | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_036
; Address: $FD8824
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_036:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_038
; Address: $FD8866
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_038:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_03A
; Address: $FD8876
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_03A:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    ROR $F066,X          ; 7E 66 F0 | Rotate right (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    ROR $7E              ; 66 7E | Rotate right (zero page)
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_03B
; Address: $FD88A1
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_03B:
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BMI $18              ; 30 18 | Branch if negative
    BMI $18              ; 30 18 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_03C
; Address: $FD890B
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_03C:
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $7E06            ; 0D 06 7E | Logical OR with accumulator (absolute)
    ADC #$91             ; 69 91 | Add with carry (immediate)
    ROR $026D            ; 6E 6D 02 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    BNE $4C              ; D0 4C | Branch if not equal
    BCS $FB              ; B0 FB | Branch if carry set

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_03D
; Address: $FD8965
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_03D:
    STY $F3              ; 84 F3 | Store Y register to zero page
    STZ $F3E3            ; 9C E3 F3 | Store zero to absolute
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_03E
; Address: $FD8971
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_03E:
    JSR $0038            ; 20 38 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $98              ; F0 98 | Branch if equal
    BVS $70              ; 70 70 | Branch if overflow set
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    STZ $03              ; 64 03 | Store zero to zero page
    LDY $0033,X          ; BC 33 00 | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ADC $FD64,Y          ; 79 64 FD | Add with carry (absolute,Y)
    LDY $30CD,X          ; BC CD 30 | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BEQ $60              ; F0 60 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_03F
; Address: $FD89C7
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_03F:
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP ($AAFC)          ; 6C FC AA | Jump to address (absolute indirect)
    ORA $16E9            ; 0D E9 16 | Logical OR with accumulator (absolute)
    INC $00              ; E6 00 | Increment (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $0C              ; 90 0C | Branch if carry clear
    BRA $0A              ; 80 0A | Branch always
    JMP $D60D            ; 4C 0D D6 | Jump to address
    CMP $1830,Y          ; D9 30 18 | Compare accumulator (absolute,Y)
    BMI $18              ; 30 18 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BCC $10              ; 90 10 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_040
; Address: $FD8A03
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_040:
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    STZ $3E14,X          ; 9E 14 3E | Store zero to absolute,X
    ASL $1434,X          ; 1E 34 14 | Arithmetic shift left (absolute,X)
    CMP $D685            ; CD 85 D6 | Compare accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    TAX                  ; AA | Transfer accumulator to X register
    BNE $90              ; D0 90 | Branch if not equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    STA $96B8            ; 8D B8 96 | Update graphics data
    LDY $94BA,X          ; BC BA 94 | Load from absolute,X into Y register
    BCC $84              ; 90 84 | Branch if carry clear
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BCS $80              ; B0 80 | Branch if carry set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BCC $E8              ; 90 E8 | Branch if carry clear
    BPL $D0              ; 10 D0 | Branch if positive
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_041
; Address: $FD8A67
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_041:
    JSR $A854            ; 20 54 A8 | Jump to subroutine
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    BVS $A0              ; 70 A0 | Branch if overflow set
    BEQ $B8              ; F0 B8 | Branch if equal
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    LDY $1CA0,X          ; BC A0 1C | Load from absolute,X into Y register
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_042
; Address: $FD8A92
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_042:
    CLC                  ; 18 | Clear carry flag
    ASL $0602            ; 0E 02 06 | Arithmetic shift left (absolute)
    LDY #$70             ; A0 70 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_044
; Address: $FD8AA7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_044:
    JSR $80C0            ; 20 C0 80 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    EOR #$3C             ; 49 3C | Exclusive OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_045
; Address: $FD8ACE
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_045:
    JSR $03DF            ; 20 DF 03 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROR $7C7F,X          ; 7E 7F 7C | Rotate right (absolute,X)
    INX                  ; E8 | Increment X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BVS $88              ; 70 88 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CPX $88              ; E4 88 | Compare X register (zero page)
    STZ $9A              ; 64 9A | Store zero to zero page
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    ROR $00FE,X          ; 7E FE 00 | Rotate right (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1C0F            ; 0E 0F 1C | Arithmetic shift left (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BCS $B0              ; B0 B0 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    BMI $C8              ; 30 C8 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_046
; Address: $FD8B3A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_046:
    BEQ $F0              ; F0 F0 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_047
; Address: $FD8B6C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_047:
    BRA $40              ; 80 40 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_04A
; Address: $FD8B7E
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_04A:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    LDA                  ; BF 11 2E 0E | Read graphics status
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    BMI $CE              ; 30 CE | Branch if negative
    LDY #$56             ; A0 56 | Load immediate value into Y register
    CPX #$14             ; E0 14 | Compare X register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BRA $60              ; 80 60 | Branch always
    CPY $0800            ; CC 00 08 | Compare Y register (absolute)
    ROL $B6FE,X          ; 3E FE B6 | Rotate left (absolute,X)
    PEA #$F0F4           ; F4 F4 F0 | Push effective address to stack
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$CC             ; E0 CC | Compare X register (immediate)
    CPY $0808            ; CC 08 08 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_04B
; Address: $FD8C20
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_04B:
    CLC                  ; 18 | Clear carry flag
    CPX $28              ; E4 28 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_04D
; Address: $FD8C2B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_04D:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_04E
; Address: $FD8C60
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_04E:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_04F
; Address: $FD8C70
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_04F:
    JSR $60E0            ; 20 E0 60 | Jump to subroutine
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR $120C            ; 4D 0C 12 | Exclusive OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    LDA $39              ; A5 39 | Read graphics status
    STX $2A              ; 86 2A | Store X register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $0373            ; 8C 73 03 | Store Y register to absolute address
    ASL $BD1E,X          ; 1E 1E BD | Arithmetic shift left (absolute,X)
    LDA $BFBF,X          ; BD BF BF | Read graphics status
    INC $CEFF            ; EE FF CE | Increment (absolute)
    STY $00FF            ; 8C FF 00 | Store Y register to absolute address
    BRA $10              ; 80 10 | Branch always
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY $08              ; C4 08 | Compare Y register (zero page)
    PLX                  ; FA | Pull X register from stack
    SBC $8080,X          ; FD 80 80 | Subtract with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $06FE            ; 0E FE 06 | Arithmetic shift left (absolute)
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $3C31            ; 0E 31 3C | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_050
; Address: $FD8CC8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_050:
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 41 BE C1 | Read graphics status
    ROL $7F80,X          ; 3E 80 7F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_052
; Address: $FD8CD8
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_052:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BRA $78              ; 80 78 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDX #$30             ; A2 30 | Load immediate value into X register
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    STY $7A              ; 84 7A | Store Y register to zero page
    BPL $EB              ; 10 EB | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEP #$38             ; E2 38 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $F777,X          ; FE 77 F7 | Increment (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BCC $18              ; 90 18 | Branch if carry clear
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    AND ($4E),Y          ; 31 4E | Logical AND with accumulator ((zero page),Y)
    EOR $0303            ; 4D 03 03 | Exclusive OR with accumulator (absolute)
    STA                  ; 9F 9F B8 BF | Update graphics data
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    ADC ($7F),Y          ; 71 7F | Add with carry ((zero page),Y)
    BEQ $80              ; F0 80 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    DEC $F4              ; C6 F4 | Decrement (zero page)
    ASL $99              ; 06 99 | Arithmetic shift left (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BEQ $F0              ; F0 F0 | Branch if equal
    ROL $F7FE,X          ; 3E FE F7 | Rotate left (absolute,X)
    STA                  ; 9F 9F 00 00 | Update graphics data
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $520C,Y          ; 19 0C 52 | Logical OR with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    LDY $08              ; A4 08 | Load from zero page into Y register
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    LSR $365E,X          ; 5E 5E 36 | Logical shift right (absolute,X)
    ROL $3C34,X          ; 3E 34 3C | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_053
; Address: $FD8D5C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_053:
    LDY $9DBC,X          ; BC BC 9D | Load from absolute,X into Y register
    STA $0000,X          ; 9D 00 00 | Update graphics data
    BVS $70              ; 70 70 | Branch if overflow set
    STY $3A04            ; 8C 04 3A | Store Y register to absolute address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BVS $70              ; 70 70 | Branch if overflow set
    ROL $063E,X          ; 3E 3E 06 | Rotate left (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    REP #$C2             ; C2 C2 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    BVS $8C              ; 70 8C | Branch if overflow set
    BRA $42              ; 80 42 | Hardware register operation
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_056
; Address: $FD8DB0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_056:
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    REP #$C2             ; C2 C2 | Reset processor status bits
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_058
; Address: $FD8DBC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_058:
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_059
; Address: $FD8DDA
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_059:
    WDM #$42             ; 42 42 | Hardware register operation
    WDM #$42             ; 42 42 | Hardware register operation
    AND ($21,X)          ; 21 21 | PPU graphics register access
    STX $79              ; 86 79 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9F 60 | Read graphics status
    STA                  ; 9F 20 5F 30 | Update graphics data
    ASL $0321,X          ; 1E 21 03 | Arithmetic shift left (absolute,X)
    STX $FF              ; 86 FF | Store X register to zero page
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_05A
; Address: $FD8E1A
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_05A:
    BVS $7F              ; 70 7F | Branch if overflow set
    ROL $0F3F,X          ; 3E 3F 0F | Rotate left (absolute,X)
    SBC $8D72,X          ; FD 72 8D | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    SBC $1C              ; E5 1C | Subtract with carry (zero page)
    NOP                  ; EA | No operation
    DEX                  ; CA | Decrement X register
    INX                  ; E8 | Increment X register
    BRA $48              ; 80 48 | Branch always
    ASL $3EFE,X          ; 1E FE 3E | Arithmetic shift left (absolute,X)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    WDM #$BD             ; 42 BD | Reserved instruction
    ORA $413E,X          ; 1D 3E 41 | Logical OR with accumulator (absolute,X)
    JMP $38B3            ; 4C B3 38 | Jump to address
    SEC                  ; 38 | Set carry flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    REP #$FF             ; C2 FF | Reset processor status bits
    ROR $FC7F,X          ; 7E 7F FC | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $18              ; F0 18 | Branch if equal
    SEP #$12             ; E2 12 | Set processor status bits
    INX                  ; E8 | Increment X register
    BMI $C2              ; 30 C2 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BCS $80              ; B0 80 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_05B
; Address: $FD8E6F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_05B:
    BRA $0B              ; 80 0B | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    PLX                  ; FA | Pull X register from stack
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_05C
; Address: $FD8E77
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_05C:
    PLX                  ; FA | Pull X register from stack
    BVS $F0              ; 70 F0 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ORA $0E66,Y          ; 19 66 0E | Logical OR with accumulator (absolute,Y)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    STX $7D02            ; 8E 02 7D | Store X register to absolute address
    EOR #$1E             ; 49 1E | Exclusive OR with accumulator (immediate)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ADC $1F7F,Y          ; 79 7F 1F | Add with carry (absolute,Y)
    STA $7F7E8F          ; 8F 8F 7E 7F | Update graphics data
    ROR $3F7F,X          ; 7E 7F 3F | Rotate right (absolute,X)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    ASL $C9              ; 06 C9 | Arithmetic shift left (zero page)
    STX $49              ; 86 49 | Store X register to zero page
    CPY $2A              ; C4 2A | Compare Y register (zero page)
    NOP                  ; EA | No operation
    STY $0810            ; 8C 10 08 | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    INC $6EEE            ; EE EE 6E | Increment (absolute)
    INC $9C9C            ; EE 9C 9C | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STY $6F00            ; 8C 00 6F | Store Y register to absolute address
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    CPY $6FCC            ; CC CC 6F | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)
    BRA $4C              ; 80 4C | Branch always
    CPY $2A              ; C4 2A | Compare Y register (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    STY $4A              ; 84 4A | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_05D
; Address: $FD8EEF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_05D:
    JSR $CCCC            ; 20 CC CC | Jump to subroutine
    INC $6EEE            ; EE EE 6E | Increment (absolute)
    INC $CECE            ; EE CE CE | Increment (absolute)
    STY $0C8C            ; 8C 8C 0C | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_061
; Address: $FD8F0B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_061:
    JSL $001C00          ; 22 00 1C 00 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_063
; Address: $FD8F16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_063:
    ROR $717F,X          ; 7E 7F 71 | Rotate right (absolute,X)
    ROL $1C3E,X          ; 3E 3E 1C | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_065
; Address: $FD8F30
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_065:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_068
; Address: $FD8F5A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_068:
    JSR $1820            ; 20 20 18 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_069
; Address: $FD8F6D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_069:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_06A
; Address: $FD8F7C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_06A:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $0C              ; F0 0C | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PEA #$D229           ; F4 29 D2 | Push effective address to stack
    ADC $0000            ; 6D 00 00 | Add with carry (absolute)
    ASL $FE00            ; 0E 00 FE | Arithmetic shift left (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_06D
; Address: $FD8FDE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_06D:
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_06E
; Address: $FD9007
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_06E:
    JSR $5030            ; 20 30 50 | Jump to subroutine
    BVC $90              ; 50 90 | Branch if overflow clear
    BVC $D0              ; 50 D0 | Branch if overflow clear
    BCC $B0              ; 90 B0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BPL $28              ; 10 28 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_06F
; Address: $FD9019
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_06F:
    JSR $4068            ; 20 68 40 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ROL $FEFF,X          ; 3E FF FE | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $70              ; 70 70 | Branch if overflow set
    SBC ($1F),Y          ; F1 1F | Subtract with carry ((zero page),Y)
    BNE $1F              ; D0 1F | Branch if not equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    INC $EF0E            ; EE 0E EF | Increment (absolute)
    DEC $000E            ; CE 0E 00 | Decrement (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $1825            ; 0D 25 18 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    ORA $10C2,X          ; 1D C2 10 | Logical OR with accumulator (absolute,X)
    ADC $10A1            ; 6D A1 10 | Add with carry (absolute)
    CMP #$32             ; C9 32 | Compare accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    STZ $84              ; 64 84 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_070
; Address: $FD90CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_070:
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_072
; Address: $FD90EE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_072:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$0B             ; E0 0B | Compare X register (immediate)
    ASL $1700,X          ; 1E 00 17 | Arithmetic shift left (absolute,X)
    ROR $9570,X          ; 7E 70 95 | Rotate right (absolute,X)
    ORA $21DF            ; 0D DF 21 | PPU graphics register access
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_073
; Address: $FD9119
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_073:
    ADC ($9B,X)          ; 61 9B | Add with carry ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    INC                  ; 1A | Increment accumulator
    BMI $18              ; 30 18 | Branch if negative
    SBC $793D,X          ; FD 3D 79 | Subtract with carry (absolute,X)
    DEX                  ; CA | Decrement X register
    PLY                  ; 7A | Pull Y register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    INC                  ; 1A | Increment accumulator
    LDA $FEA2,X          ; BD A2 FE | Read graphics status
    ADC $7CFF,Y          ; 79 FF 7C | Add with carry (absolute,Y)
    REP #$C0             ; C2 C0 | Reset processor status bits
    STA $80              ; 85 80 | Update graphics data
    SBC $40              ; E5 40 | Subtract with carry (zero page)
    REP #$80             ; C2 80 | Reset processor status bits
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($6C00)          ; 6C 00 6C | Jump to address (absolute indirect)
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    DEC $D647,X          ; DE 47 D6 | Decrement (absolute,X)
    LDA                  ; BF 86 AF 00 | Read graphics status
    STZ $9F00            ; 9C 00 9F | Store zero to absolute
    AND $3901,Y          ; 39 01 39 | Logical AND with accumulator (absolute,Y)
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF7E            ; EE 7E FF | Increment (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEP #$E0             ; E2 E0 | Game work RAM access
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_074
; Address: $FD918B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_074:
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $191F,X          ; 1E 1F 19 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_075
; Address: $FD91BC
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_075:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STA                  ; 9F FF 67 FF | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    SBC $C0FF,Y          ; F9 FF C0 | Subtract with carry (absolute,Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $F9              ; F0 F9 | Branch if equal
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    BEQ $FD              ; F0 FD | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    STA                  ; 9F E7 9F FF | Update graphics data
    STA $FF87FF          ; 8F FF 87 FF | Update graphics data
    STA ($EF,X)          ; 81 EF | Update graphics data
    BRA $FF              ; 80 FF | Branch always
    BRA $F7              ; 80 F7 | Branch always
    BRA $F3              ; 80 F3 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$C4FC           ; F4 FC C4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $0008,X          ; 9E 08 00 | Store zero to absolute,X
    PHP                  ; 08 | Push processor status to stack
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_076
; Address: $FD9257
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_076:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    BPL $00              ; 10 00 | Branch if positive
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $000700          ; 8F 00 07 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BCS $B0              ; B0 B0 | Branch if carry set
    ADC #$00             ; 69 00 | Add with carry (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCC $90              ; 90 90 | Branch if carry clear
    ORA $111F,Y          ; 19 1F 11 | Logical OR with accumulator (absolute,Y)
    ASL $3D37,X          ; 1E 37 3D | Arithmetic shift left (absolute,X)
    INC $FCF7,X          ; FE F7 FC | Increment (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROL $0C0E            ; 2E 0E 0C | Rotate left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $83AB            ; 2E AB 83 | Rotate left (absolute)
    ROR $79BE,X          ; 7E BE 79 | Rotate right (absolute,X)
    ADC $8787,Y          ; 79 87 87 | Add with carry (absolute,Y)
    JMP $4103            ; 4C 03 41 | Jump to address
    BMI $FF              ; 30 FF | Branch if negative
    BNE $BE              ; D0 BE | Branch if not equal
    STA ($8E,X)          ; 81 8E | Update graphics data
    STX $7676            ; 8E 76 76 | Store X register to absolute address
    INC $FAF8,X          ; FE F8 FA | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    CPX #$E5             ; E0 E5 | Compare X register (immediate)
    BVS $71              ; 70 71 | Branch if overflow set
    BVS $71              ; 70 71 | Branch if overflow set
    ADC ($FC),Y          ; 71 FC | Add with carry ((zero page),Y)
    SBC $F9EC,Y          ; F9 EC F9 | Subtract with carry (absolute,Y)
    BIT $F5              ; 24 F5 | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    STA $F88FF8          ; 8F F8 8F F8 | Update graphics data
    EOR ($ED,X)          ; 41 ED | Exclusive OR with accumulator ((zero page,X))
    EOR ($EB,X)          ; 41 EB | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_077
; Address: $FD9304
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_077:
    RTI                  ; 40 | Return from interrupt
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    BVC $E3              ; 50 E3 | Branch if overflow clear
    BVC $E0              ; 50 E0 | Game work RAM access
    EOR ($F8,X)          ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $4FFF,X          ; FE FF 4F | Increment (absolute,X)
    INC $3838,X          ; FE 38 38 | Increment (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    LDY #$20             ; A0 20 | Load immediate value into Y register
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BEQ $20              ; F0 20 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_078
; Address: $FD9352
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_078:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_079
; Address: $FD935E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_079:
    JSR $0300            ; 20 00 03 | Jump to subroutine
    ROL $7C03,X          ; 3E 03 7C | Rotate left (absolute,X)
    BMI $04              ; 30 04 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $FF3F,X          ; FD 3F FF | Subtract with carry (absolute,X)
    ROR $3FFC,X          ; 7E FC 3F | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FD              ; F0 FD | Branch if equal
    BRA $F8              ; 80 F8 | Branch always
    SEP #$C0             ; E2 C0 | Set processor status bits
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    STA ($C0,X)          ; 81 C0 | Update graphics data
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $02              ; 80 02 | Branch always
    ORA $FC00,X          ; 1D 00 FC | Logical OR with accumulator (absolute,X)
    SBC $FF78,X          ; FD 78 FF | Subtract with carry (absolute,X)
    BMI $FB              ; 30 FB | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_07A
; Address: $FD93B0
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_07A:
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    STA ($80,X)          ; 81 80 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $E0              ; 50 E0 | Game work RAM access
    CLI                  ; 58 | Clear interrupt disable flag
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    PEA #$FE22           ; F4 22 FE | Push effective address to stack
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    INC $DC40,X          ; FE 40 DC | Increment (absolute,X)
    BPL $F0              ; 10 F0 | Branch if positive
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDA $39E0,X          ; BD E0 39 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    ORA ($77),Y          ; 11 77 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    AND $48              ; 25 48 | Logical AND with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    DEC $C0              ; C6 C0 | Decrement (zero page)
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_07B
; Address: $FD9461
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_07B:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ADC #$F6             ; 69 F6 | Add with carry (immediate)
    CMP #$67             ; C9 67 | Compare accumulator (immediate)
    CPY $EF              ; C4 EF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_07C
; Address: $FD946C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_07C:
    BPL $DF              ; 10 DF | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_07D
; Address: $FD947C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_07D:
    JSR $4B00            ; 20 00 4B | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STA $A51D,X          ; 9D 1D A5 | Update graphics data
    LDA $DD              ; A5 DD | Read graphics status
    CMP $E0E0,X          ; DD E0 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    DEC $00              ; C6 00 | Decrement (zero page)
    STA                  ; 9F 10 7F FE | Update graphics data
    PHY                  ; 5A | Push Y register to stack
    ROL $3B              ; 26 3B | Rotate left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_07E
; Address: $FD949E
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_07E:
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CMP $FDFC,X          ; DD FC FD | Compare accumulator (absolute,X)
    SBC $7B78,X          ; FD 78 7B | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    INC $FC87,X          ; FE 87 FC | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SBC $FD08,Y          ; F9 08 FD | Subtract with carry (absolute,Y)
    BVC $EC              ; 50 EC | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ADC $FC8A,Y          ; 79 8A FC | Add with carry (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    PEA #$E804           ; F4 04 E8 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $B626,Y          ; F9 26 B6 | Subtract with carry (absolute,Y)
    EOR ($79,X)          ; 41 79 | Exclusive OR with accumulator ((zero page,X))
    BRA $CF              ; 80 CF | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_081
; Address: $FD94F4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_081:
    STX $00              ; 86 00 | Store X register to zero page
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    BRA $20              ; 80 20 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_082
; Address: $FD9512
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_082:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1F1F,X          ; 1E 1F 1F | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_084
; Address: $FD953C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_084:
    JSR $1F00            ; 20 00 1F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $FC03,X          ; FE 03 FC | Increment (absolute,X)
    STZ $E0FF            ; 9C FF E0 | Game work RAM access
    BPL $9B              ; 10 9B | Branch if positive
    STZ $30              ; 64 30 | Store zero to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_085
; Address: $FD9562
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_085:
    ASL $3FC1,X          ; 1E C1 3F | Arithmetic shift left (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ROR $FF81,X          ; 7E 81 FF | Rotate right (absolute,X)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    INC $F301,X          ; FE 01 F3 | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    ORA #$EB             ; 09 EB | Logical OR with accumulator (immediate)
    ROR $9F60,X          ; 7E 60 9F | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    BVS $AF              ; 70 AF | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_086
; Address: $FD95C3
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_086:
    BRA $20              ; 80 20 | Branch always
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BEQ $48              ; F0 48 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BCS $3F              ; B0 3F | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7F3F,X          ; 7E 3F 7F | Rotate right (absolute,X)
    ASL $6161,X          ; 1E 61 61 | Arithmetic shift left (absolute,X)
    STZ $FC83,X          ; 9E 83 FC | Store zero to absolute,X
    STA ($01,X)          ; 81 01 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BVS $FF              ; 70 FF | Branch if overflow set
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    ADC $AF92            ; 6D 92 AF | Add with carry (absolute)
    BVC $BB              ; 50 BB | Branch if overflow clear
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BPL $ED              ; 10 ED | Branch if positive
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $AE              ; 45 AE | Exclusive OR with accumulator (zero page)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    AND #$F2             ; 29 F2 | Logical AND with accumulator (immediate)
    ORA $2BD4            ; 0D D4 2B | Logical OR with accumulator (absolute)
    PHX                  ; DA | Push X register to stack
    AND $AD              ; 25 AD | Logical AND with accumulator (zero page)
    LDX $5B              ; A6 5B | Load from zero page into X register
    LSR $FFAB,X          ; 5E AB FF | Logical shift right (absolute,X)
    BRA $67              ; 80 67 | Branch always
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    SBC ($5F,X)          ; E1 5F | Subtract with carry ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_087
; Address: $FD9688
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_087:
    ADC #$BF             ; 69 BF | Add with carry (immediate)
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_088
; Address: $FD968E
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_088:
    JSR $FE36            ; 20 36 FE | Jump to subroutine
    SBC $4000,Y          ; F9 00 40 | Subtract with carry (absolute,Y)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BPL $1F              ; 10 1F | Branch if positive
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    EOR $34              ; 45 34 | Exclusive OR with accumulator (zero page)
    INX                  ; E8 | Increment X register
    LDA                  ; BF D5 3F EE | Read graphics status
    RTI                  ; 40 | Return from interrupt
    CPY #$6A             ; C0 6A | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_089
; Address: $FD9703
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_089:
    DEY                  ; 88 | Decrement Y register
    ADC $EF82,X          ; 7D 82 EF | Add with carry (absolute,X)
    BPL $5A              ; 10 5A | Branch if positive
    LDA $4A              ; A5 4A | Read graphics status
    LDY $FB              ; A4 FB | Load from zero page into Y register
    PLA                  ; 68 | Pull accumulator from stack
    INC $7511            ; EE 11 75 | Increment (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    LDY #$D5             ; A0 D5 | Load immediate value into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    STY $7B              ; 84 7B | Store Y register to zero page
    LDA #$56             ; A9 56 | Read graphics status

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_08A
; Address: $FD9746
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_08A:
    LSR $BD              ; 46 BD | Logical shift right (zero page)
    WDM #$BF             ; 42 BF | Reserved instruction
    SBC $E8A9,X          ; FD A9 E8 | Subtract with carry (absolute,X)
    SBC $E800,X          ; FD 00 E8 | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    INC $66C4,X          ; FE C4 66 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_08B
; Address: $FD9764
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_08B:
    JSR $21FB            ; 20 FB 21 | PPU graphics register access
    SBC $DE87,X          ; FD 87 DE | Subtract with carry (absolute,X)
    STA ($1F,X)          ; 81 1F | Update graphics data
    INC $00              ; E6 00 | Increment (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_08C
; Address: $FD9780
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_08C:
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $98              ; F0 98 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    INC $FCFC            ; EE FC FC | Increment (absolute)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    STZ $60              ; 64 60 | Store zero to zero page
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $10              ; 10 10 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $0C07            ; 0D 07 0C | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    PEA #$A857           ; F4 57 A8 | Push effective address to stack
    LDX #$5D             ; A2 5D | Load immediate value into X register
    WDM #$FD             ; 42 FD | Reserved instruction
    LDA $73FF            ; AD FF 73 | Read graphics status
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    BRA $FC              ; 80 FC | Branch always
    LDA                  ; BF 00 57 40 | Read graphics status
    STA ($80,X)          ; 81 80 | Update graphics data
    NOP                  ; EA | No operation
    ROR $D681,X          ; 7E 81 D6 | Rotate right (absolute,X)
    AND #$55             ; 29 55 | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_08D
; Address: $FD97EC
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_08D:
    PLA                  ; 68 | Pull accumulator from stack
    PLX                  ; FA | Pull X register from stack
    ORA $AA              ; 05 AA | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    SBC $DF20,X          ; FD 20 DF | Subtract with carry (absolute,X)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    PLX                  ; FA | Pull X register from stack
    BCC $90              ; 90 90 | Branch if carry clear
    PLX                  ; FA | Pull X register from stack
    BCC $00              ; 90 00 | Branch if carry clear
    EOR $31AF,Y          ; 59 AF 31 | Exclusive OR with accumulator (absolute,Y)
    LDY $7E              ; A4 7E | Load from zero page into Y register
    SBC $E9B8,X          ; FD B8 E9 | Subtract with carry (absolute,X)
    JMP $0341            ; 4C 41 03 | Jump to address
    INC $EE00,X          ; FE 00 EE | Increment (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $DF              ; 06 DF | Arithmetic shift left (zero page)
    SBC $7E3F            ; ED 3F 7E | Subtract with carry (absolute)
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    STA ($01,X)          ; 81 01 | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_08E
; Address: $FD9866
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_08E:
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_08F
; Address: $FD9872
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_08F:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $10              ; 80 10 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_090
; Address: $FD987E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_090:
    JSR $7800            ; 20 00 78 | Jump to subroutine
    ASL $350B            ; 0E 0B 35 | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_091
; Address: $FD9894
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_091:
    CLC                  ; 18 | Clear carry flag
    BVS $30              ; 70 30 | Branch if overflow set
    ORA $12DF            ; 0D DF 12 | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    BEQ $70              ; F0 70 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BEQ $10              ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_092
; Address: $FD98BA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_092:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA $92FF            ; 0D FF 92 | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_095
; Address: $FD98E0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_095:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_096
; Address: $FD9902
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_096:
    BPL $07              ; 10 07 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BEQ $30              ; F0 30 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY $8656,X          ; BC 56 86 | Load from absolute,X into Y register
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    WDM #$40             ; 42 40 | Reserved instruction
    INC $6868,X          ; FE 68 68 | Increment (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F FF 67 FF | Update graphics data
    CLC                  ; 18 | Clear carry flag
    AND #$7F             ; 29 7F | Logical AND with accumulator (immediate)
    AND $C07F,Y          ; 39 7F C0 | Logical AND with accumulator (absolute,Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $8C              ; 10 8C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $F33F,X          ; 1E 3F F3 | Arithmetic shift left (absolute,X)
    LDA                  ; BF 5C FF B1 | Read graphics status
    BEQ $90              ; F0 90 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDX $20B0,Y          ; BE B0 20 | Load from absolute,Y into X register
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_098
; Address: $FD9A00
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_098:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_099
; Address: $FD9A08
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_099:
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_09B
; Address: $FD9A17
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_09B:
    JSR $80E0            ; 20 E0 80 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 66 F7 00 | Update graphics data
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_09E
; Address: $FD9A3F
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_09E:
    JSR $FCF8            ; 20 F8 FC | Jump to subroutine
    INC $1FFA,X          ; FE FA 1F | Increment (absolute,X)
    SEP #$FF             ; E2 FF | Set processor status bits
    DEC $FF              ; C6 FF | Decrement (zero page)
    STY $10FE            ; 8C FE 10 | Store Y register to absolute address
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $130E            ; 0D 0E 13 | Logical OR with accumulator (absolute)
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $60              ; 80 60 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_09F
; Address: $FD9A8D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_09F:
    JSR $ECE0            ; 20 E0 EC | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A0
; Address: $FD9A9C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A0:
    BNE $40              ; D0 40 | Branch if not equal
    BCC $80              ; 90 80 | Branch if carry clear
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A1
; Address: $FD9AB2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A1:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ROL $FD7E,X          ; 3E 7E FD | Rotate left (absolute,X)
    STA $FD3D            ; 8D 3D FD | Update graphics data
    NOP                  ; EA | No operation
    PLY                  ; 7A | Pull Y register from stack
    STX $00              ; 86 00 | Store X register to zero page
    STA ($00,X)          ; 81 00 | Update graphics data
    BVS $02              ; 70 02 | Branch if overflow set
    STA $80              ; 85 80 | Update graphics data
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    BRA $B0              ; 80 B0 | Branch always
    BPL $70              ; 10 70 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A2
; Address: $FD9AEE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A2:
    JSR $0CE0            ; 20 E0 0C | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A3
; Address: $FD9AF5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A3:
    JSR $40E4            ; 20 E4 40 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $25              ; 06 25 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A4
; Address: $FD9B12
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A4:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ADC $25              ; 65 25 | Add with carry (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BEQ $3C              ; F0 3C | Branch if equal
    EOR $7BDB            ; 4D DB 7B | Exclusive OR with accumulator (absolute)
    INC $ED24,X          ; FE 24 ED | Increment (absolute,X)
    STY $809D            ; 8C 9D 80 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    ORA $B200            ; 0D 00 B2 | Logical OR with accumulator (absolute)
    BMI $84              ; 30 84 | Branch if negative
    BRA $01              ; 80 01 | Branch always
    BRA $62              ; 80 62 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $6402,X          ; 1E 02 64 | Arithmetic shift left (absolute,X)
    BIT $9888            ; 2C 88 98 | Test bits in accumulator (absolute)
    BPL $70              ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A5
; Address: $FD9B4A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A5:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A6
; Address: $FD9B52
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A6:
    ADC $D21C,X          ; 7D 1C D2 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STZ $00              ; 64 00 | Store zero to zero page
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0A7
; Address: $FD9B5E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0A7:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $7914,X          ; 1D 14 79 | Logical OR with accumulator (absolute,X)
    STZ $F9              ; 64 F9 | Store zero to zero page
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ROR $FFC6,X          ; 7E C6 FF | Rotate right (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    LDA                  ; BF F3 1F F7 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    STX $00              ; 86 00 | Store X register to zero page
    AND $7438,Y          ; 39 38 74 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0AC
; Address: $FD9BDF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0AC:
    JSR $F620            ; 20 20 F6 | Jump to subroutine
    EOR ($68,X)          ; 41 68 | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F C1 CE C0 | Update graphics data
    INY                  ; C8 | Increment Y register
    ORA ($67,X)          ; 01 67 | Logical OR with accumulator ((zero page,X))
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0AD
; Address: $FD9BFC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0AD:
    JSR $9800            ; 20 00 98 | Jump to subroutine
    BRA $BC              ; 80 BC | Branch always
    STY $B0              ; 84 B0 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0AE
; Address: $FD9C0E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0AE:
    BRA $00              ; 80 00 | Branch always
    WDM #$00             ; 42 00 | Reserved instruction
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0AF
; Address: $FD9C16
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0AF:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL $679D            ; 2E 9D 67 | Rotate left (absolute)
    LDA                  ; BF 8F 7F 02 | Read graphics status
    BRA $3E              ; 80 3E | Branch always
    BRA $1C              ; 80 1C | Branch always
    STY $420C            ; 8C 0C 42 | Hardware register operation
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    CPY #$22             ; C0 22 | Compare Y register (immediate)
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B0
; Address: $FD9C64
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B0:
    RTI                  ; 40 | Return from interrupt
    EOR ($3A,X)          ; 41 3A | Exclusive OR with accumulator ((zero page,X))
    ORA $1B2C,X          ; 1D 2C 1B | Logical OR with accumulator (absolute,X)
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    ROR $76              ; 66 76 | Rotate right (zero page)
    AND $8B31,Y          ; 39 31 8B | Logical AND with accumulator (absolute,Y)
    ASL $101A,X          ; 1E 1A 10 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    EOR ($89,X)          ; 41 89 | Exclusive OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    STA $BFD2,X          ; 9D D2 BF | Update graphics data
    LDA $FC7D,Y          ; B9 7D FC | Read graphics status
    INC $CFCE,X          ; FE CE CF | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SEP #$80             ; E2 80 | Set processor status bits
    BRA $02              ; 80 02 | Branch always
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    BMI $FC              ; 30 FC | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    CPY $E4F8            ; CC F8 E4 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B1
; Address: $FD9CA0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B1:
    JSR $40E0            ; 20 E0 40 | Jump to subroutine
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B3
; Address: $FD9CB2
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B3:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    EOR #$76             ; 49 76 | Exclusive OR with accumulator (immediate)
    EOR $3E39            ; 4D 39 3E | Exclusive OR with accumulator (absolute)
    AND $7E1B            ; 2D 1B 7E | Logical AND with accumulator (absolute)
    ROR $7171,X          ; 7E 71 71 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    STA $347FFF          ; 8F FF 7F 34 | Update graphics data
    BPL $7B              ; 10 7B | Branch if positive
    LDY $CEFF,X          ; BC FF CE | Load from absolute,X into Y register
    DEC $BFBF            ; CE BF BF | Decrement (absolute)
    PLX                  ; FA | Pull X register from stack
    BEQ $F7              ; F0 F7 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    AND ($FC),Y          ; 31 FC | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    CPY $F8              ; C4 F8 | Compare Y register (zero page)
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    BIT $0CF4            ; 2C F4 0C | Test bits in accumulator (absolute)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $383F,Y          ; 19 3F 38 | Logical OR with accumulator (absolute,Y)
    ORA $F5F9            ; 0D F9 F5 | Logical OR with accumulator (absolute)
    SBC $9DFB,X          ; FD FB 9D | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    CPX $F9              ; E4 F9 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B4
; Address: $FD9D48
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B4:
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    PHA                  ; 48 | Push accumulator to stack
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    ASL $09FF            ; 0E FF 09 | Arithmetic shift left (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $1F27            ; 0D 27 1F | Logical OR with accumulator (absolute)
    ROL $2E1F            ; 2E 1F 2E | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX $F4FE            ; EC FE F4 | Compare X register (absolute)
    ROL $7FF2,X          ; 3E F2 7F | Rotate left (absolute,X)
    INC $FE14,X          ; FE 14 FE | Increment (absolute,X)
    CPX $9E              ; E4 9E | Compare X register (zero page)
    LDA $00F4,Y          ; B9 F4 00 | Read graphics status
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    BMI $79              ; 30 79 | Branch if negative
    ADC $0707,Y          ; 79 07 07 | Add with carry (absolute,Y)
    ORA $091D,X          ; 1D 1D 09 | Logical OR with accumulator (absolute,X)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    BMI $1F              ; 30 1F | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B5
; Address: $FD9E37
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B5:
    BPL $1E              ; 10 1E | Branch if positive
    ROL $293F,X          ; 3E 3F 29 | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC ($F4),Y          ; F1 F4 | Subtract with carry ((zero page),Y)
    DEC $C8              ; C6 C8 | Decrement (zero page)
    INX                  ; E8 | Increment X register
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $FC              ; F0 FC | Branch if equal
    ROL $F43E,X          ; 3E 3E F4 | Rotate left (absolute,X)
    BIT $0CF5            ; 2C F5 0C | Test bits in accumulator (absolute)
    NOP                  ; EA | No operation
    CLC                  ; 18 | Clear carry flag
    BMI $F0              ; 30 F0 | Branch if negative
    BPL $F0              ; 10 F0 | Branch if positive
    INC $FFC1,X          ; FE C1 FF | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $0D1D,X          ; 1D 1D 0D | Logical OR with accumulator (absolute,X)
    ORA $1616            ; 0D 16 16 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $1E              ; 10 1E | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    AND #$3F             ; 29 3F | Logical AND with accumulator (immediate)
    ORA $041F,X          ; 1D 1F 04 | Logical OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $FC              ; F0 FC | Branch if equal
    ROR $9F7E,X          ; 7E 7E 9F | Rotate right (absolute,X)
    STA                  ; 9F E7 E7 53 | Update graphics data
    BCS $24              ; B0 24 | Branch if carry set
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    INC $FF81,X          ; FE 81 FF | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B6
; Address: $FD9EBE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B6:
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $0907            ; 0D 07 09 | Logical OR with accumulator (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    AND $7BFE,Y          ; 39 FE 7B | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B7
; Address: $FD9F04
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B7:
    SBC $EDF6            ; ED F6 ED | Subtract with carry (absolute)
    PHB                  ; 8B | Push data bank register to stack
    CPX $8A05            ; EC 05 8A | Compare X register (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    DEC $C6              ; C6 C6 | Decrement (zero page)
    STA $84              ; 85 84 | Update graphics data
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F 00 CC 37 | Update graphics data
    CMP ($2F),Y          ; D1 2F | Compare accumulator ((zero page),Y)
    BCS $4F              ; B0 4F | Branch if carry set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BNE $3F              ; D0 3F | Branch if not equal
    ADC ($9F,X)          ; 61 9F | Add with carry ((zero page,X))
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    LSR $DF              ; 46 DF | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B8
; Address: $FD9F46
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B8:
    JSR $48EF            ; 20 EF 48 | Jump to subroutine
    SBC $FE42,Y          ; F9 42 FE | Subtract with carry (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0B9
; Address: $FD9F60
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0B9:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BRA $10              ; 80 10 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BEQ $40              ; F0 40 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0BA
; Address: $FD9F74
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0BA:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BPL $28              ; 10 28 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0BB
; Address: $FD9F85
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0BB:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    LSR $BF43,X          ; 5E 43 BF | Logical shift right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0BC
; Address: $FD9FD6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0BC:
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    ROR $40              ; 66 40 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register
    AND ($B0),Y          ; 31 B0 | Logical AND with accumulator ((zero page),Y)
    ASL $02CE            ; 0E CE 02 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0BD
; Address: $FD9FEB
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0BD:
    JSR $7C0C            ; 20 0C 7C | Jump to subroutine
    ASL $9D              ; 06 9D | Arithmetic shift left (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    LSR $3700            ; 4E 00 37 | Logical shift right (absolute)
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $010F            ; 0E 0F 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $FECE            ; CE CE FE | Decrement (absolute)
    INC $3E3E,X          ; FE 3E 3E | Increment (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ROL $0C0C,X          ; 3E 0C 0C | Rotate left (absolute,X)
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    ADC ($7F,X)          ; 61 7F | Add with carry ((zero page,X))
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BMI $3F              ; 30 3F | Branch if negative
    AND $330C,Y          ; 39 0C 33 | Logical AND with accumulator (absolute,Y)
    ASL $0043            ; 0E 43 00 | Arithmetic shift left (absolute)
    BEQ $F5              ; F0 F5 | Branch if equal
    TAX                  ; AA | Transfer accumulator to X register
    SBC $DE42,X          ; FD 42 DE | Subtract with carry (absolute,X)
    LDA ($B5,X)          ; A1 B5 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $7EA2,X          ; 5D A2 7E | Exclusive OR with accumulator (absolute,X)
    STA ($DC,X)          ; 81 DC | Update graphics data
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 80 7F 00 | Read graphics status
    LSR $BF              ; 46 BF | Logical shift right (zero page)
    STX $79              ; 86 79 | Store X register to zero page
    STA $1373,X          ; 9D 73 13 | Update graphics data
    LDX $3EDF,Y          ; BE DF 3E | Load from absolute,Y into X register
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0BE
; Address: $FDA0E0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0BE:
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    EOR ($DD,X)          ; 41 DD | Exclusive OR with accumulator ((zero page,X))
    BRA $BF              ; 80 BF | Branch always
    CLV                  ; B8 | Clear overflow flag
    ROR $7F42,X          ; 7E 42 7F | Rotate right (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    STA ($7F,X)          ; 81 7F | Update graphics data
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDA $FE3C,X          ; BD 3C FE | Read graphics status
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)
    STY $7C              ; 84 7C | Store Y register to zero page
    BIT $DC              ; 24 DC | Test bits in accumulator (zero page)
    ROR $BE32,X          ; 7E 32 BE | Rotate right (absolute,X)
    ORA ($DF),Y          ; 11 DF | Logical OR with accumulator ((zero page),Y)
    ORA #$6F             ; 09 6F | Logical OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    LDA $FCAF8E          ; AF 8E AF FC | Read graphics status
    INC $7E00,X          ; FE 00 7E | Increment (absolute,X)
    STA                  ; 9F 00 5F 00 | Update graphics data
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0BF
; Address: $FDA161
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0BF:
    ASL $0202            ; 0E 02 02 | Arithmetic shift left (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    JMP ($5003)          ; 6C 03 50 | Jump to address (absolute indirect)
    ROR $19              ; 66 19 | Rotate right (zero page)
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    BVS $44              ; 70 44 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    INC $00C0,X          ; FE C0 00 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $60              ; 80 60 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C0
; Address: $FDA1CD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C0:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C2
; Address: $FDA1E0
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C2:
    CLC                  ; 18 | Clear carry flag
    AND ($4E),Y          ; 31 4E | Logical AND with accumulator ((zero page),Y)
    ASL $7421,X          ; 1E 21 74 | Arithmetic shift left (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    AND $1F3F            ; 2D 3F 1F | Logical AND with accumulator (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    DEY                  ; 88 | Decrement Y register
    ROR                  ; 6A | Rotate right (accumulator)
    LDA $5B53            ; AD 53 5B | Read graphics status
    LDA                  ; BF FF 00 FF | Read graphics status
    STA                  ; 9F 7E BF 7E | Update graphics data
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    LDA $BFD73F          ; AF 3F D7 BF | Read graphics status
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    ASL $840E            ; 0E 0E 84 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX $04              ; E4 04 | Compare X register (zero page)
    STA $DE9EAF          ; 8F AF 9E DE | Update graphics data
    STZ $9ADE,X          ; 9E DE 9A | Store zero to absolute,X
    PHX                  ; DA | Push X register to stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BMI $B0              ; 30 B0 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C3
; Address: $FDA26C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C3:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $5F              ; 80 5F | Branch always
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA #$9E             ; 09 9E | Logical OR with accumulator (immediate)
    ADC ($09,X)          ; 61 09 | Add with carry ((zero page,X))
    ROR $10              ; 66 10 | Rotate right (zero page)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $0300            ; 2C 00 03 | Test bits in accumulator (absolute)
    BIT $98              ; 24 98 | Test bits in accumulator (zero page)
    SEP #$18             ; E2 18 | Set processor status bits
    PLP                  ; 28 | Pull processor status from stack
    BPL $10              ; 10 10 | Branch if positive
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    BMI $04              ; 30 04 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C4
; Address: $FDA2AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C4:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C5
; Address: $FDA2BD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C5:
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $60              ; 10 60 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C6
; Address: $FDA2E2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C6:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C7
; Address: $FDA2EA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C7:
    BMI $70              ; 30 70 | Branch if negative
    BCC $38              ; 90 38 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $04              ; 80 04 | Branch always
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    ROL $7C67,X          ; 3E 67 7C | Rotate left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    INC $7EFF,X          ; FE FF 7E | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0C8
; Address: $FDA316
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0C8:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA $259D,X          ; 1D 9D 25 | Logical OR with accumulator (absolute,X)
    LDA $1D              ; A5 1D | Read graphics status
    CMP $E000,X          ; DD 00 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    DEC $00              ; C6 00 | Decrement (zero page)
    STA                  ; 9F 10 7F 7E | Update graphics data
    PHY                  ; 5A | Push Y register to stack
    ROL $3B              ; 26 3B | Rotate left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0CA
; Address: $FDA345
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0CA:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0506            ; 0E 06 05 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    LSR $7F              ; 46 7F | Logical shift right (zero page)
    BIT #$FE             ; 89 FE | Test bits in accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0CB
; Address: $FDA36D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0CB:
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0CC
; Address: $FDA37E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0CC:
    RTI                  ; 40 | Return from interrupt
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    LDA $355A,X          ; BD 5A 35 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $0B09,X          ; 3D 09 0B | Logical AND with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0CD
; Address: $FDA3D2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0CD:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0CE
; Address: $FDA404
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0CE:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0CF
; Address: $FDA413
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0CF:
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    AND ($3B),Y          ; 31 3B | Logical AND with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0D0
; Address: $FDA43A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0D0:
    JSR $2300            ; 20 00 23 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0D1
; Address: $FDA45F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0D1:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1D0E            ; 0E 0E 1D | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0D3
; Address: $FDA487
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0D3:
    LDY $FF              ; A4 FF | Load from zero page into Y register
    STA $9BFF            ; 8D FF 9B | Update graphics data
    CLC                  ; 18 | Clear carry flag
    LDY $723C,X          ; BC 3C 72 | Load from absolute,X into Y register
    STZ $64              ; 64 64 | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0D4
; Address: $FDA4BC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0D4:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0D7
; Address: $FDA4C8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0D7:
    JSR $1817            ; 20 17 18 | Jump to subroutine
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC $FCF1            ; EE F1 FC | Increment (absolute)
    EOR $32E7,Y          ; 59 E7 32 | Exclusive OR with accumulator (absolute,Y)
    LDA $DE              ; A5 DE | Read graphics status
    STZ $B847            ; 9C 47 B8 | Store zero to absolute
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0D8
; Address: $FDA50A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0D8:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $212F,X          ; 1E 2F 21 | PPU graphics register access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1000            ; 0E 00 10 | Arithmetic shift left (absolute)
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0D9
; Address: $FDA51F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0D9:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    CPX #$33             ; E0 33 | Compare X register (immediate)
    JMP $93E8            ; 4C E8 93 | Jump to address
    CMP ($07),Y          ; D1 07 | Compare accumulator ((zero page),Y)
    SBC $3F04            ; ED 04 3F | Subtract with carry (absolute)
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVC $40              ; 50 40 | Branch if overflow clear
    ROL $1202            ; 2E 02 12 | Rotate left (absolute)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0DA
; Address: $FDA543
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0DA:
    CPX #$E0             ; E0 E0 | Game work RAM access
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    ASL $067C,X          ; 1E 7C 06 | Arithmetic shift left (absolute,X)
    ROR $3C              ; 66 3C | Rotate right (zero page)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0DC
; Address: $FDA556
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0DC:
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CPX #$60             ; E0 60 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    SBC $FF1F,X          ; FD 1F FF | Subtract with carry (absolute,X)
    ROL $7FFC,X          ; 3E FC 7F | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $F9              ; 80 F9 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY $E0              ; C4 E0 | Game work RAM access
    CPX #$C1             ; E0 C1 | Compare X register (immediate)
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0DD
; Address: $FDA59A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0DD:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F0F            ; 0E 0F 0F | Arithmetic shift left (absolute)
    ASL $0013,X          ; 1E 13 00 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BIT $0E0C            ; 2C 0C 0E | Test bits in accumulator (absolute)
    ORA $190E,X          ; 1D 0E 19 | Logical OR with accumulator (absolute,X)
    STZ $FB              ; 64 FB | Store zero to zero page
    CPY $E9              ; C4 E9 | Compare Y register (zero page)
    LDY $6BF2,X          ; BC F2 6B | Load from absolute,X into Y register
    PEA #$65FA           ; F4 FA 65 | Push effective address to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $9F00            ; 0E 00 9F | Arithmetic shift left (absolute)
    BRA $FF              ; 80 FF | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    BRA $1F              ; 80 1F | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0DE
; Address: $FDA641
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0DE:
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0DF
; Address: $FDA65E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0DF:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    ADC $6D12,X          ; 7D 12 6D | Add with carry (absolute,X)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    INC $F689            ; EE 89 F6 | Increment (absolute)
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0E2
; Address: $FDA6B5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0E2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STA ($91,X)          ; 81 91 | Update graphics data
    LDX $CE13,Y          ; BE 13 CE | Load from absolute,Y into X register
    XBA                  ; EB | Exchange accumulator bytes
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0101            ; 0E 01 01 | Arithmetic shift left (absolute)
    ROR $4100            ; 6E 00 41 | Rotate right (absolute)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    DEC $FE              ; C6 FE | Decrement (zero page)
    BVS $DE              ; 70 DE | Branch if overflow set
    ROR $7C00,X          ; 7E 00 7C | Rotate right (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0E3
; Address: $FDA6F2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0E3:
    JSR $8020            ; 20 20 80 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    ASL $1C0F            ; 0E 0F 1C | Arithmetic shift left (absolute)
    ASL $1F0F,X          ; 1E 0F 1F | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0E5
; Address: $FDA724
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0E5:
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $FF0E,Y          ; F9 0E FF | Subtract with carry (absolute,Y)
    BMI $F7              ; 30 F7 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    STA $00C070          ; 8F 70 C0 00 | Update graphics data
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY $DC37            ; CC 37 DC | Compare Y register (absolute)
    CMP ($2F),Y          ; D1 2F | Compare accumulator ((zero page),Y)
    BCS $4F              ; B0 4F | Branch if carry set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ADC $9E              ; 65 9E | Add with carry (zero page)
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    LSR $DF              ; 46 DF | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0E6
; Address: $FDA766
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0E6:
    JSR $48EF            ; 20 EF 48 | Jump to subroutine
    SBC $FE42,Y          ; F9 42 FE | Subtract with carry (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    BRA $7F              ; 80 7F | Branch always
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0E7
; Address: $FDA778
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0E7:
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA $3D06,X          ; 1D 06 3D | Logical OR with accumulator (absolute,X)
    ASL $0D3B            ; 0E 3B 0D | Arithmetic shift left (absolute)
    AND ($7E,X)          ; 21 7E | Logical AND with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $39              ; 30 39 | Branch if negative
    ORA $3171,Y          ; 19 71 31 | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    STA ($01,X)          ; 81 01 | Update graphics data
    ADC $69D6            ; 6D D6 69 | Add with carry (absolute)
    LDA $DA              ; A5 DA | Read graphics status
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    SBC $FE3E,Y          ; F9 3E FE | Subtract with carry (absolute,Y)
    SBC $9F0F,X          ; FD 0F 9F | Subtract with carry (absolute,X)
    BRA $9F              ; 80 9F | Branch always
    BRA $3F              ; 80 3F | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    LDY #$47             ; A0 47 | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    AND ($E5,X)          ; 21 E5 | Logical AND with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    STA $8ED798          ; 8F 98 D7 8E | Update graphics data
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BPL $C0              ; 10 C0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    BRA $04              ; 80 04 | Branch always
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDY $2070            ; AC 70 20 | Load from absolute address into Y register
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ROR $3F00,X          ; 7E 00 3F | Rotate right (absolute,X)
    BPL $18              ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0E8
; Address: $FDA818
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0E8:
    SEC                  ; 38 | Set carry flag
    ROR $3F00,X          ; 7E 00 3F | Rotate right (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    STA $7166,X          ; 9D 66 71 | Update graphics data
    ROR $4C6E            ; 6E 6E 4C | Rotate right (absolute)
    JMP $0928            ; 4C 28 09 | Jump to address
    BMI $00              ; 30 00 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0E9
; Address: $FDA853
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0E9:
    JSR $6262            ; 20 62 62 | Jump to subroutine
    STX $C106            ; 8E 06 C1 | Store X register to absolute address
    RTI                  ; 40 | Return from interrupt
    CMP $1B48,Y          ; D9 48 1B | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    DEC $00              ; C6 00 | Decrement (zero page)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $20              ; 30 20 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0EA
; Address: $FDA87E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0EA:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    JMP $CBB9            ; 4C B9 CB | Jump to address
    PHB                  ; 8B | Push data bank register to stack
    STZ $17              ; 64 17 | Store zero to zero page
    CPX $27              ; E4 27 | Compare X register (zero page)
    LDX $37D7,Y          ; BE D7 37 | Load from absolute,Y into X register
    INC $FD00,X          ; FE 00 FD | Increment (absolute,X)
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $1FFC            ; 0E FC 1F | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $7D              ; F0 7D | Branch if equal
    BEQ $FD              ; F0 FD | Branch if equal
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    CPX #$F1             ; E0 F1 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$82             ; C0 82 | Compare Y register (immediate)
    BRA $02              ; 80 02 | Branch always
    STY $7C              ; 84 7C | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0EB
; Address: $FDA8E2
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0EB:
    BIT $DC              ; 24 DC | Test bits in accumulator (zero page)
    ROR $3E32,X          ; 7E 32 3E | Rotate right (absolute,X)
    ORA ($5F),Y          ; 11 5F | Logical OR with accumulator ((zero page),Y)
    ORA #$4F             ; 09 4F | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $FCCF,X          ; 1E CF FC | Arithmetic shift left (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LDA                  ; BF 00 BF 00 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PEA #$96E7           ; F4 E7 96 | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    XBA                  ; EB | Exchange accumulator bytes
    SBC #$D5             ; E9 D5 | Subtract with carry (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($AF),Y          ; 51 AF | Exclusive OR with accumulator ((zero page),Y)
    PHB                  ; 8B | Push data bank register to stack
    ADC #$61             ; 69 61 | Add with carry (immediate)
    JMP $001C40          ; 5C 40 1C 00 | Jump to address long
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    BEQ $82              ; F0 82 | Branch if equal
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CPX #$C4             ; E0 C4 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$C1             ; E0 C1 | Compare X register (immediate)
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    BRA $0B              ; 80 0B | Branch always
    ORA $1D00            ; 0D 00 1D | Logical OR with accumulator (absolute)
    DEC $27E9            ; CE E9 27 | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    STY $00              ; 84 00 | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0EC
; Address: $FDA980
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0EC:
    JSL $FE02FE          ; 22 FE 02 FE | Jump to subroutine long
    CMP #$BF             ; C9 BF | Compare accumulator (immediate)
    ADC ($AF),Y          ; 71 AF | Add with carry ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $F7              ; 05 F7 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0ED
; Address: $FDA990
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0ED:
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0EF
; Address: $FDA9F4
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0EF:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$C9             ; C2 C9 | Reset processor status bits
    INY                  ; C8 | Increment Y register
    PEA #$03C0           ; F4 C0 03 | Push effective address to stack
    CPX $FE33            ; EC 33 FE | Compare X register (absolute)
    BVS $87              ; 70 87 | Branch if overflow set
    ASL $0313            ; 0E 13 03 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F0
; Address: $FDAA7C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F0:
    JSR $1100            ; 20 00 11 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    JMP ($3EFC)          ; 6C FC 3E | Jump to address (absolute indirect)
    STA $7CCFFC          ; 8F FC CF 7C | Update graphics data
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $9090,X          ; FE 90 90 | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F1
; Address: $FDAAA2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F1:
    LDA $FC7B,X          ; BD 7B FC | Read graphics status
    ADC $FF7D,X          ; 7D 7D FF | Add with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $FBFC,X          ; FD FC FB | Subtract with carry (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    SBC $F9C2,Y          ; F9 C2 F9 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    EOR $064D            ; 4D 4D 06 | Exclusive OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F2
; Address: $FDAADD
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F2:
    JSR $00ED            ; 20 ED 00 | Jump to subroutine
    STA $FE1E3E          ; 8F 3E 1E FE | Update graphics data
    ROR $FAFA,X          ; 7E FA FA | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    DEC $7E00,X          ; DE 00 7E | Decrement (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ADC #$36             ; 69 36 | Add with carry (immediate)
    STX $2FD3            ; 8E D3 2F | Store X register to absolute address
    SBC #$95             ; E9 95 | Subtract with carry (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $FC02,X          ; FE 02 FC | Increment (absolute,X)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    LDA #$A0             ; A9 A0 | Read graphics status
    BVC $00              ; 50 00 | Branch if overflow clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F4
; Address: $FDAB64
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F4:
    BEQ $00              ; F0 00 | Branch if equal
    ROR $3801,X          ; 7E 01 38 | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $E0FD,X          ; FD FD E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    STA ($00,X)          ; 81 00 | Update graphics data
    DEC $00              ; C6 00 | Decrement (zero page)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $0F00,X          ; FD 00 0F | Subtract with carry (absolute,X)
    STA                  ; 9F FF 7F FF | Update graphics data
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $DCDC,X          ; FE DC DC | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BVS $18              ; 70 18 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    CPY $00              ; C4 00 | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STZ $0080            ; 9C 80 00 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F6
; Address: $FDAC54
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F6:
    SEI                  ; 78 | Set interrupt disable flag
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $001F            ; 0E 1F 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F7
; Address: $FDACB0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F7:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0506            ; 0E 06 05 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    LSR $7F              ; 46 7F | Logical shift right (zero page)
    BIT #$FE             ; 89 FE | Test bits in accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F8
; Address: $FDACCD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F8:
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0F9
; Address: $FDACDE
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0F9:
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative
    BCC $10              ; 90 10 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    BVS $C9              ; 70 C9 | Branch if overflow set
    CMP $68C1,X          ; DD C1 68 | Compare accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    STA $0388            ; 8D 88 03 | Update graphics data
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BMI $D1              ; 30 D1 | Branch if negative
    BPL $DE              ; 10 DE | Branch if positive
    SEC                  ; 38 | Set carry flag
    ORA $2F01            ; 0D 01 2F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0FA
; Address: $FDAD5D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0FA:
    ASL $CCE8            ; 0E E8 CC | Arithmetic shift left (absolute)
    BRA $B8              ; 80 B8 | Branch always
    CPX $FEBC            ; EC BC FE | Compare X register (absolute)
    BPL $01              ; 10 01 | Branch if positive
    STA $0001            ; 8D 01 00 | Update graphics data
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    CPX #$03             ; E0 03 | Compare X register (immediate)
    ASL $1B0F            ; 0E 0F 1B | Arithmetic shift left (absolute)
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0FB
; Address: $FDADAE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0FB:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $F0              ; 30 F0 | Branch if negative
    BPL $F0              ; 10 F0 | Branch if positive
    BCC $C0              ; 90 C0 | Branch if carry clear
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    INY                  ; C8 | Increment Y register
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    CPX #$68             ; E0 68 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0FC
; Address: $FDADDA
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0FC:
    PHP                  ; 08 | Push processor status to stack
    ASL $001C,X          ; 1E 1C 00 | Arithmetic shift left (absolute,X)
    ASL $3F00            ; 0E 00 3F | Arithmetic shift left (absolute)
    ASL $3F0E            ; 0E 0E 3F | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $7D3F,X          ; 3E 3F 7D | Rotate left (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEC $FF00            ; CE 00 FF | Decrement (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    STX $FFCE            ; 8E CE FF | Store X register to absolute address
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0FD
; Address: $FDAE65
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0FD:
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    BMI $3F              ; 30 3F | Branch if negative
    BMI $1F              ; 30 1F | Branch if negative
    ASL $8C3F            ; 0E 3F 8C | Arithmetic shift left (absolute)
    ROL $4F0E            ; 2E 0E 4F | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    NOP                  ; EA | No operation
    SBC ($E6,X)          ; E1 E6 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    STX $79              ; 86 79 | Store X register to zero page
    SBC $75              ; E5 75 | Subtract with carry (zero page)
    DEX                  ; CA | Decrement X register
    ADC $9A              ; 65 9A | Add with carry (zero page)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STX $8E80            ; 8E 80 8E | Store X register to absolute address
    BRA $1E              ; 80 1E | Branch always
    AND $7D01,X          ; 3D 01 7D | Logical AND with accumulator (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    STA $9F1FEF          ; 8F EF 1F 9F | Update graphics data
    SBC $FE1F,Y          ; F9 1F FE | Subtract with carry (absolute,Y)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $C3              ; 80 C3 | Branch always
    ORA $156F            ; 0D 6F 15 | Logical OR with accumulator (absolute)
    STX $E081            ; 8E 81 E0 | Game work RAM access
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    CPY $D0E8            ; CC E8 D0 | Compare Y register (absolute)
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0FE
; Address: $FDAF27
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0FE:
    INC $EECD,X          ; FE CD EE | Increment (absolute,X)
    ASL $82F0            ; 0E F0 82 | Arithmetic shift left (absolute)
    REP #$E4             ; C2 E4 | Reset processor status bits
    CPY $8C              ; C4 8C | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    BCC $40              ; 90 40 | Branch if carry clear
    BRA $10              ; 80 10 | Branch always
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_0FF
; Address: $FDAF41
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_0FF:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_100
; Address: $FDAF60
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_100:
    BPL $0D              ; 10 0D | Branch if positive
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC $FEE0,X          ; FE E0 FE | Increment (absolute,X)
    INC $E6C6,X          ; FE C6 E6 | Increment (absolute,X)
    LDX $DA              ; A6 DA | Load from zero page into X register
    JMP $C20C            ; 4C 0C C2 | Jump to address
    CPX #$C7             ; E0 C7 | Compare X register (immediate)
    ASL $0001,X          ; 1E 01 00 | Arithmetic shift left (absolute,X)
    ORA $0100,Y          ; 19 00 01 | Logical OR with accumulator (absolute,Y)
    BRA $9E              ; 80 9E | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_101
; Address: $FDAF9A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_101:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    BMI $0F              ; 30 0F | Branch if negative
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_102
; Address: $FDAFB8
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_102:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    SEP #$00             ; E2 00 | Set processor status bits
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY $E4              ; C4 E4 | Compare Y register (zero page)
    SEP #$36             ; E2 36 | Set processor status bits
    ROL $3F7F,X          ; 3E 7F 3F | Rotate left (absolute,X)
    LDX $E700,Y          ; BE 00 E7 | Load from absolute,Y into X register
    DEC $DF00            ; CE 00 DF | Decrement (absolute)
    STA $1C0300          ; 8F 00 03 1C | Update graphics data
    LDX $BE              ; A6 BE | Load from zero page into X register
    ASL $CE              ; 06 CE | Arithmetic shift left (zero page)
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_104
; Address: $FDB027
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_104:
    BVS $00              ; 70 00 | Branch if overflow set
    PEA #$F800           ; F4 00 F8 | Push effective address to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_107
; Address: $FDB037
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_107:
    BVS $20              ; 70 20 | Branch if overflow set
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    BRA $F8              ; 80 F8 | Branch always
    CPY #$13             ; C0 13 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    ROR $6D              ; 66 6D | Rotate right (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY #$6F             ; C0 6F | Compare Y register (immediate)
    CPY #$6F             ; C0 6F | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $39F3            ; EC F3 39 | Compare X register (absolute)
    STA $3BE7,Y          ; 99 E7 3B | Update graphics data
    DEC $37              ; C6 37 | Decrement (zero page)
    CPY $9C27            ; CC 27 9C | Compare Y register (absolute)
    CPY #$27             ; C0 27 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_108
; Address: $FDB073
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_108:
    JSR $000F            ; 20 0F 00 | Jump to subroutine
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    ORA #$C3             ; 09 C3 | Logical OR with accumulator (immediate)
    STA $FDCE36          ; 8F 36 CE FD | Update graphics data
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    AND $7DFF,X          ; 3D FF 7D | Logical AND with accumulator (absolute,X)
    INC $F7FF,X          ; FE FF F7 | Increment (absolute,X)
    REP #$C2             ; C2 C2 | Reset processor status bits
    SBC ($7A,X)          ; E1 7A | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_109
; Address: $FDB0E2
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_109:
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STY $80              ; 84 80 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_10A
; Address: $FDB11C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_10A:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_10B
; Address: $FDB146
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_10B:
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    ASL $82              ; 06 82 | Arithmetic shift left (zero page)
    ASL $09DA            ; 0E DA 09 | Arithmetic shift left (absolute)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDX $80              ; A6 80 | Load from zero page into X register
    EOR $2504,X          ; 5D 04 25 | Exclusive OR with accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $E6FE,X          ; FE FE E6 | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BMI $30              ; 30 30 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF 00 87 00 | Read graphics status
    BVS $78              ; 70 78 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BRA $BF              ; 80 BF | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_10C
; Address: $FDB1CD
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_10C:
    BMI $00              ; 30 00 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $3C43            ; 9C 43 3C | Store zero to absolute
    ADC $7D12,X          ; 7D 12 7D | Add with carry (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    STA $FE              ; 85 FE | Update graphics data
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    BIT $7E              ; 24 7E | Test bits in accumulator (zero page)
    STA ($7F,X)          ; 81 7F | Update graphics data
    BRA $FF              ; 80 FF | Branch always
    BMI $C1              ; 30 C1 | Branch if negative
    BMI $C7              ; 30 C7 | Branch if negative
    BPL $E7              ; 10 E7 | Branch if positive
    ORA ($E7),Y          ; 11 E7 | Logical OR with accumulator ((zero page),Y)
    STA ($67),Y          ; 91 67 | Update graphics data
    BCC $67              ; 90 67 | Branch if carry clear
    BNE $23              ; D0 23 | Branch if not equal
    INY                  ; C8 | Increment Y register
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $6700,X          ; FE 00 67 | Increment (absolute,X)
    STX $D7              ; 86 D7 | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack
    LDX $08              ; A6 08 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_10D
; Address: $FDB26D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_10D:
    JSL $006104          ; 22 04 61 00 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    SED                  ; F8 | Set decimal mode flag
    BEQ $7F              ; F0 7F | Branch if equal
    INC $FF1F,X          ; FE 1F FF | Increment (absolute,X)
    STY $7E              ; 84 7E | Store Y register to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_10E
; Address: $FDB2A5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_10E:
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_10F
; Address: $FDB2B0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_10F:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF 43 7F 58 | Read graphics status
    WDM #$41             ; 42 41 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX $40              ; E4 40 | Compare X register (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_110
; Address: $FDB2E3
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_110:
    JSR $7C08            ; 20 08 7C | Jump to subroutine
    ASL $9D              ; 06 9D | Arithmetic shift left (zero page)
    ASL $0404            ; 0E 04 04 | Arithmetic shift left (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0004            ; 0E 04 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $3D00,X          ; 3E 00 3D | Rotate left (absolute,X)
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $3D39,X          ; 3E 39 3D | Rotate left (absolute,X)
    AND $7F7D,Y          ; 39 7D 7F | Logical AND with accumulator (absolute,Y)
    INC $1F00,X          ; FE 00 1F | Increment (absolute,X)
    STA $00              ; 85 00 | Update graphics data
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $82              ; 80 82 | Branch always
    INC $1F01,X          ; FE 01 1F | Increment (absolute,X)
    BRA $85              ; 80 85 | Branch always
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $3E00,X          ; FE 00 3E | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STY $0EFE            ; 8C FE 0E | Store Y register to absolute address
    INC $FE1E,X          ; FE 1E FE | Increment (absolute,X)
    ROL $7C3E,X          ; 3E 3E 7C | Rotate left (absolute,X)
    INC $FE78,X          ; FE 78 FE | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_111
; Address: $FDB369
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_111:
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $0000            ; EE 00 00 | Increment (absolute)
    BMI $30              ; 30 30 | Branch if negative
    ADC ($63,X)          ; 61 63 | Add with carry ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_112
; Address: $FDB37F
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_112:
    INC $0300            ; EE 00 03 | Increment (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    CPX $C0              ; E4 C0 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA                  ; BF 00 0F 00 | Read graphics status
    ASL $0EBF            ; 0E BF 0E | Arithmetic shift left (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    JMP $2673            ; 4C 73 26 | Jump to address
    AND $3926,Y          ; 39 26 39 | Logical AND with accumulator (absolute,Y)
    AND ($3E,X)          ; 21 3E | Logical AND with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 40 36 C9 | Read graphics status
    DEY                  ; 88 | Decrement Y register
    BNE $2A              ; D0 2A | Branch if not equal
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $7F              ; 80 7F | Branch always
    LDY $5A              ; A4 5A | Load from zero page into Y register
    SEP #$1D             ; E2 1D | Set processor status bits
    BEQ $0F              ; F0 0F | Branch if equal
    BCS $4F              ; B0 4F | Branch if carry set
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC $00FF            ; 6D FF 00 | Add with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_113
; Address: $FDB422
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_113:
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_114
; Address: $FDB428
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_114:
    JSR $01DF            ; 20 DF 01 | Jump to subroutine
    LDA                  ; BF 9D 00 FE | Read graphics status
    BRA $78              ; 80 78 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_115
; Address: $FDB442
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_115:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$06             ; E0 06 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    AND ($31,X)          ; 21 31 | Logical AND with accumulator ((zero page,X))
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    STX $0E00            ; 8E 00 0E | Store X register to absolute address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $98              ; 80 98 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    STZ $0CDC            ; 9C DC 0C | Store zero to absolute
    STX $0E04            ; 8E 04 0E | Store X register to absolute address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    ROR $7F00,X          ; 7E 00 7F | Rotate right (absolute,X)
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    BPL $FC              ; 10 FC | Branch if positive
    ROR $7F03,X          ; 7E 03 7F | Rotate right (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_116
; Address: $FDB4E5
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_116:
    ROL $00              ; 26 00 | Rotate left (zero page)
    ROL $EC00            ; 2E 00 EC | Rotate left (absolute)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ROL $04              ; 26 04 | Rotate left (zero page)
    ROL $ECC0            ; 2E C0 EC | Rotate left (absolute)
    BRA $C4              ; 80 C4 | Branch always
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $8C00            ; 0E 00 8C | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL $8C00            ; 0E 00 8C | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $48DB            ; 2C DB 48 | Test bits in accumulator (absolute)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    BVC $6F              ; 50 6F | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    STZ $FD              ; 64 FD | Store zero to zero page
    STY $FF              ; 84 FF | Store Y register to zero page
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    AND #$F9             ; 29 F9 | Logical AND with accumulator (immediate)
    BCS $E0              ; B0 E0 | Game work RAM access
    SBC $E000,Y          ; F9 00 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_117
; Address: $FDB5A0
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_117:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_118
; Address: $FDB5DD
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_118:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($B1),Y          ; 91 B1 | Update graphics data
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BEQ $FC              ; F0 FC | Branch if equal
    STZ $DF00,X          ; 9E 00 DF | Store zero to absolute,X
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BVC $40              ; 50 40 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_11A
; Address: $FDB647
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_11A:
    JSR $C0F0            ; 20 F0 C0 | Jump to subroutine
    BMI $E0              ; 30 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $C0              ; D0 C0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_11B
; Address: $FDB658
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_11B:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $7F              ; 30 7F | Branch if negative
    ROR $00E6,X          ; 7E E6 00 | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_11C
; Address: $FDB67C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_11C:
    BRA $00              ; 80 00 | Branch always
    ORA $0018,Y          ; 19 18 00 | Logical OR with accumulator (absolute,Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SBC $FCFD,Y          ; F9 FD FC | Subtract with carry (absolute,Y)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_11D
; Address: $FDB6B6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_11D:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_11F
; Address: $FDB6D6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_11F:
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_121
; Address: $FDB715
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_121:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    SBC $3E3E,Y          ; F9 3E 3E | Subtract with carry (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    LDA                  ; BF C7 DF C3 | Read graphics status
    BEQ $6F              ; F0 6F | Branch if equal
    BEQ $EF              ; F0 EF | Branch if equal
    BEQ $EF              ; F0 EF | Branch if equal
    BNE $EF              ; D0 EF | Branch if not equal
    BNE $EF              ; D0 EF | Branch if not equal
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_122
; Address: $FDB792
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_122:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    LDX $0F              ; A6 0F | Load from zero page into X register
    LDA $83DF1F          ; AF 1F DF 83 | Read graphics status
    STA ($EF,X)          ; 81 EF | Update graphics data
    BRA $EF              ; 80 EF | Branch always
    DEY                  ; 88 | Decrement Y register
    CMP $D000,Y          ; D9 00 D0 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_123
; Address: $FDB7D6
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_123:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BRA $20              ; 80 20 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BPL $78              ; 10 78 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_125
; Address: $FDB839
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_125:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $3E07,X          ; 1D 07 3E | Logical OR with accumulator (absolute,X)
    BMI $67              ; 30 67 | Branch if negative
    BVS $6B              ; 70 6B | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CPX $1C              ; E4 1C | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_126
; Address: $FDB874
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_126:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $94              ; 10 94 | Branch if positive
    BPL $9B              ; 10 9B | Branch if positive
    CLC                  ; 18 | Clear carry flag
    STA $FFC1FF          ; 8F FF C1 FF | Update graphics data

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_127
; Address: $FDB884
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_127:
    JSR $08FF            ; 20 FF 08 | Jump to subroutine
    ROL $0E21            ; 2E 21 0E | Rotate left (absolute)
    STA ($01),Y          ; 91 01 | Update graphics data
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    BCC $EE              ; 90 EE | Branch if carry clear
    INX                  ; E8 | Increment X register
    PEA #$F078           ; F4 78 F0 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_129
; Address: $FDB8BA
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_129:
    JSL $909020          ; 22 20 90 90 | Jump to subroutine long
    BNE $D0              ; D0 D0 | Branch if not equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ORA #$8E             ; 09 8E | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $D0              ; 30 D0 | Branch if negative
    BVS $90              ; 70 90 | Branch if overflow set
    BEQ $10              ; F0 10 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 48 E8 58 | Read graphics status
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_12B
; Address: $FDB904
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_12B:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_12D
; Address: $FDB922
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_12D:
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    BCC $F0              ; 90 F0 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_12E
; Address: $FDB93C
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_12E:
    BVS $F0              ; 70 F0 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $BFF3,X          ; FE F3 BF | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF 40 CD 32 | Read graphics status
    BEQ $0F              ; F0 0F | Branch if equal
    STY $870C            ; 8C 0C 87 | Store Y register to absolute address
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    STZ $F6EF            ; 9C EF F6 | Store zero to absolute
    CLD                  ; D8 | Clear decimal mode flag
    ROR $99              ; 66 99 | Rotate right (zero page)
    LDA ($5E,X)          ; A1 5E | Read graphics status
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    STA $DD7A,X          ; 9D 7A DD | Update graphics data
    ROL $18ED,X          ; 3E ED 18 | Rotate left (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDA                  ; BF 3C C0 C0 | Read graphics status
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STY $CABB            ; 8C BB CA | Store Y register to absolute address
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    LDA                  ; BF C3 EF 10 | Read graphics status
    BRA $3D              ; 80 3D | Branch always
    DEC $FF4F            ; CE 4F FF | Decrement (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_131
; Address: $FDBA1A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_131:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    BRA $E8              ; 80 E8 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    BPL $F8              ; 10 F8 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SBC $FD3D,Y          ; F9 3D FD | Subtract with carry (absolute,Y)
    SBC $FE88,X          ; FD 88 FE | Subtract with carry (absolute,X)
    BRA $80              ; 80 80 | Branch always
    INX                  ; E8 | Increment X register
    CPX #$E5             ; E0 E5 | Compare X register (immediate)
    CPX #$C2             ; E0 C2 | Compare X register (immediate)
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $801848          ; 5C 48 18 80 | Jump to address long
    BCS $10              ; B0 10 | Branch if carry set
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_132
; Address: $FDBA4E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_132:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_133
; Address: $FDBA54
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_133:
    JSL $40E420          ; 22 20 E4 40 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    ASL $030B            ; 0E 0B 03 | Arithmetic shift left (absolute)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0500            ; 0E 00 05 | Arithmetic shift left (absolute)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    CPX $F63B            ; EC 3B F6 | Compare X register (absolute)
    SBC ($F3,X)          ; E1 F3 | Subtract with carry ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 80 CF C0 | Update graphics data
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    LDA                  ; BF 10 EF 44 | Read graphics status
    ROR                  ; 6A | Rotate right (accumulator)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    STA ($00,X)          ; 81 00 | Update graphics data
    LDA                  ; BF 7F 61 F9 | Read graphics status
    SBC #$76             ; E9 76 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_134
; Address: $FDBAC6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_134:
    SBC $C212            ; ED 12 C2 | Subtract with carry (absolute)
    STA ($62),Y          ; 91 62 | Update graphics data
    STA $8093,Y          ; 99 93 80 | Update graphics data
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_135
; Address: $FDBAD8
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_135:
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $07              ; 80 07 | Branch always
    DEY                  ; 88 | Decrement Y register
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    STY $DF              ; 84 DF | Store Y register to zero page
    LDA                  ; BF E1 1F 82 | Read graphics status
    ROL $1C95,X          ; 3E 95 1C | Rotate left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    BRA $3F              ; 80 3F | Branch always
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA                  ; 9F 99 8F BE | Update graphics data
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    BRA $07              ; 80 07 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_136
; Address: $FDBB0E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_136:
    BPL $03              ; 10 03 | Branch if positive
    INC $06              ; E6 06 | Increment (zero page)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BEQ $98              ; F0 98 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $FCF8            ; 9C F8 FC | Store zero to absolute
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_137
; Address: $FDBB32
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_137:
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_139
; Address: $FDBB3E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_139:
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    INC $CDFC,X          ; FE FC CD | Increment (absolute,X)
    STZ $8D              ; 64 8D | Store zero to zero page
    EOR ($9B,X)          ; 41 9B | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_13B
; Address: $FDBB4F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_13B:
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    BMI $72              ; 30 72 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_13C
; Address: $FDBB57
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_13C:
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_13D
; Address: $FDBB60
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_13D:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_13E
; Address: $FDBB74
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_13E:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    SBC ($BF,X)          ; E1 BF | Subtract with carry ((zero page,X))
    LSR $B1FF,X          ; 5E FF B1 | Logical shift right (absolute,X)
    BEQ $90              ; F0 90 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDX $20B0,Y          ; BE B0 20 | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_13F
; Address: $FDBBC0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_13F:
    JSR $2E07            ; 20 07 2E | Jump to subroutine
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_140
; Address: $FDBBE2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_140:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    LDY #$30             ; A0 30 | Load immediate value into Y register
    BCS $C0              ; B0 C0 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVC $40              ; 50 40 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $70              ; 10 70 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_141
; Address: $FDBC06
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_141:
    LDY $78BE,X          ; BC BE 78 | Load from absolute,X into Y register
    JMP ($6060)          ; 6C 60 60 | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_144
; Address: $FDBC10
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_144:
    INC $FCD1,X          ; FE D1 FC | Increment (absolute,X)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    CMP $9274,Y          ; D9 74 92 | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BCC $F0              ; 90 F0 | Branch if carry clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_145
; Address: $FDBC4A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_145:
    JSR $2222            ; 20 22 22 | Jump to subroutine
    ORA $5D              ; 05 5D | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_146
; Address: $FDBC5E
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_146:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    ADC $CF47,Y          ; 79 47 CF | Add with carry (absolute,Y)
    ORA $8FFF,X          ; 1D FF 8F | Logical OR with accumulator (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $002C            ; 2C 2C 00 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ORA $183D,X          ; 1D 3D 18 | Logical OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_147
; Address: $FDBCF2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_147:
    JSL $023222          ; 22 22 32 02 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDX $3C7A,Y          ; BE 7A 3C | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_148
; Address: $FDBD08
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_148:
    SEC                  ; 38 | Set carry flag
    AND $FBFB,Y          ; 39 FB FB | Logical AND with accumulator (absolute,Y)
    ORA $E3FF,X          ; 1D FF E3 | Logical OR with accumulator (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    BPL $05              ; 10 05 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    INC $3AEC            ; EE EC 3A | Increment (absolute)
    LDX $6CBC,Y          ; BE BC 6C | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    BEQ $38              ; F0 38 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    JMP ($202C)          ; 6C 2C 20 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_149
; Address: $FDBD37
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_149:
    JSR $3030            ; 20 30 30 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_14B
; Address: $FDBD44
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_14B:
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    LSR $495E,X          ; 5E 5E 49 | Logical shift right (absolute,X)
    BIT $3C3C            ; 2C 3C 3C | Test bits in accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $46              ; 66 46 | Rotate right (zero page)
    EOR ($41),Y          ; 51 41 | Exclusive OR with accumulator ((zero page),Y)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_14C
; Address: $FDBD5E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_14C:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    INX                  ; E8 | Increment X register
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $0D0D            ; 0E 0D 0D | Arithmetic shift left (absolute)
    ASL $0A0F            ; 0E 0F 0A | Arithmetic shift left (absolute)
    ORA ($13),Y          ; 11 13 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_14D
; Address: $FDBD90
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_14D:
    ORA $0C0D            ; 0D 0D 0C | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0A0C            ; 0D 0C 0A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_14E
; Address: $FDBDA5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_14E:
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $6C              ; F0 6C | Branch if equal
    TSX                  ; BA | Transfer stack pointer to X register
    LDX $7E7E,Y          ; BE 7E 7E | Load from absolute,Y into X register
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_150
; Address: $FDBDB6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_150:
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    JMP $424C            ; 4C 4C 42 | Hardware register operation
    TXS                  ; 9A | Transfer X register to stack pointer
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_151
; Address: $FDBDC0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_151:
    JSL $3F272E          ; 22 2E 27 3F | Jump to subroutine long
    ADC #$6F             ; 69 6F | Add with carry (immediate)
    ADC $B393,X          ; 7D 93 B3 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_153
; Address: $FDBDD6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_153:
    BVC $40              ; 50 40 | Branch if overflow clear
    WDM #$42             ; 42 42 | Hardware register operation
    CPY $D180            ; CC 80 D1 | Compare Y register (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_154
; Address: $FDBDFF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_154:
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_155
; Address: $FDBE05
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_155:
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BVS $E8              ; 70 E8 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PEA #$807C           ; F4 7C 80 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_157
; Address: $FDBE16
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_157:
    BVC $50              ; 50 50 | Branch if overflow clear
    BCC $10              ; 90 10 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$58F4           ; F4 F4 58 | Push effective address to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_158
; Address: $FDBE25
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_158:
    BMI $3B              ; 30 3B | Branch if negative
    SEC                  ; 38 | Set carry flag
    BMI $57              ; 30 57 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BMI $18              ; 30 18 | Branch if negative
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ADC ($7F),Y          ; 71 7F | Add with carry ((zero page),Y)
    SBC $F9C6,Y          ; F9 C6 F9 | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    ROR $BF8E,X          ; 7E 8E BF | Rotate right (absolute,X)
    STA ($79,X)          ; 81 79 | Update graphics data
    STX $F9              ; 86 F9 | Store X register to zero page
    ASL $1CFF            ; 0E FF 1C | Arithmetic shift left (absolute)
    INC $7800,X          ; FE 00 78 | Increment (absolute,X)
    BNE $70              ; D0 70 | Branch if not equal
    CPX #$38             ; E0 38 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_15A
; Address: $FDBE76
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_15A:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $0F1F            ; 0E 1F 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_15B
; Address: $FDBE8E
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_15B:
    ORA $001F,Y          ; 19 1F 00 | Logical OR with accumulator (absolute,Y)
    BIT $242C            ; 2C 2C 24 | Test bits in accumulator (absolute)
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    REP #$E3             ; C2 E3 | Reset processor status bits
    LDA                  ; BF 67 7F DF | Read graphics status
    SBC ($FB),Y          ; F1 FB | Subtract with carry ((zero page),Y)
    STZ $9CBF            ; 9C BF 9C | Store zero to absolute
    BRA $40              ; 80 40 | Branch always
    CMP $C1              ; C5 C1 | Compare accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    BRA $80              ; 80 80 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $040D            ; 0D 0D 04 | Logical OR with accumulator (absolute)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL $0606            ; 0E 06 06 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0407            ; 0D 07 04 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL $55              ; 06 55 | Arithmetic shift left (zero page)
    ROR $E7              ; 66 E7 | Rotate right (zero page)
    SBC $3EFF,X          ; FD FF 3E | Subtract with carry (absolute,X)
    LDA                  ; BF E0 FF 86 | Read graphics status
    PLY                  ; 7A | Pull Y register from stack
    ORA $7E15,X          ; 1D 15 7E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_15C
; Address: $FDBF13
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_15C:
    ROR $A4              ; 66 A4 | Rotate right (zero page)
    LDY $40              ; A4 40 | Load from zero page into Y register
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CMP $C1              ; C5 C1 | Compare accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$D3             ; E0 D3 | Compare X register (immediate)
    ADC $C07D,X          ; 7D 7D C0 | Add with carry (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_15E
; Address: $FDBF3A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_15E:
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    EOR $FEB9            ; 4D B9 FE | Exclusive OR with accumulator (absolute)
    INC $BEFE,X          ; FE FE BE | Increment (absolute,X)
    STA ($99),Y          ; 91 99 | Update graphics data
    PEA #$A8FF           ; F4 FF A8 | Push effective address to stack
    STA                  ; 9F 81 81 C1 | Update graphics data
    CMP ($FD,X)          ; C1 FD | Compare accumulator ((zero page,X))
    BCC $68              ; 90 68 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    INC $FFFB,X          ; FE FB FF | Increment (absolute,X)
    STX $28FF            ; 8E FF 28 | Store X register to absolute address
    DEC $0D7F,X          ; DE 7F 0D | Decrement (absolute,X)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    WDM #$42             ; 42 42 | Hardware register operation
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    DEC $C6              ; C6 C6 | Decrement (zero page)
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_160
; Address: $FDBF8E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_160:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ROR $3A7A            ; 6E 7A 3A | Rotate right (absolute)
    INC $FE66,X          ; FE 66 FE | Increment (absolute,X)
    LDX $4BDE            ; AE DE 4B | Load from absolute address into X register
    CMP $FEAE,Y          ; D9 AE FE | Compare accumulator (absolute,Y)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    DEC $46              ; C6 46 | Decrement (zero page)
    ROR $66              ; 66 66 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_161
; Address: $FDBFB8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_161:
    JSL $032722          ; 22 22 27 03 | Jump to subroutine long
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $161F,X          ; 1E 1F 16 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $181E,X          ; 1E 1E 18 | Arithmetic shift left (absolute,X)
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CMP $96FB            ; CD FB 96 | Compare accumulator (absolute)
    INC $DC2D,X          ; FE 2D DC | Increment (absolute,X)
    LSR $FE              ; 46 FE | Logical shift right (zero page)
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $1D11,X          ; 1E 11 1D | Arithmetic shift left (absolute,X)
    ROR $7F61,X          ; 7E 61 7F | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PEA #$F8FC           ; F4 FC F8 | Push effective address to stack
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    BNE $2A              ; D0 2A | Branch if not equal
    CMP ($DE,X)          ; C1 DE | Compare accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $C400,X          ; FE 00 C4 | Increment (absolute,X)
    CPY $F4              ; C4 F4 | Compare Y register (zero page)
    PEA #$00E0           ; F4 E0 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_163
; Address: $FDC01B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_163:
    JSL $FE0CFF          ; 22 FF 0C FE | Jump to subroutine long
    ASL $090F            ; 0E 0F 09 | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_164
; Address: $FDC040
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_164:
    JSL $3F3322          ; 22 22 33 3F | Jump to subroutine long
    LDA                  ; BF E7 E0 9F | Read graphics status
    STA                  ; 9F 7F 3F FF | Update graphics data
    BRA $7F              ; 80 7F | Branch always
    SBC $C320,X          ; FD 20 C3 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_165
; Address: $FDC056
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_165:
    STA                  ; 9F 90 7F 40 | Update graphics data
    BRA $FF              ; 80 FF | Branch always
    SEP #$FA             ; E2 FA | Set processor status bits
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    CPY $3C              ; C4 3C | Compare Y register (zero page)
    CPY $F4CE            ; CC CE F4 | Compare Y register (absolute)
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    LSR $42              ; 46 42 | Hardware register operation
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    STA $CD              ; 85 CD | Update graphics data
    STA $B3FF            ; 8D FF B3 | Update graphics data
    LDY $7F              ; A4 7F | Load from zero page into Y register
    CMP #$7F             ; C9 7F | Compare accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    STA ($81,X)          ; 81 81 | Update graphics data
    JMP $1C1F            ; 4C 1F 1C | Jump to address
    ASL $CF3F,X          ; 1E 3F CF | Arithmetic shift left (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $FEF9,X          ; FD F9 FE | Subtract with carry (absolute,X)
    ADC ($FE),Y          ; 71 FE | Add with carry ((zero page),Y)
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    INC $83FE,X          ; FE FE 83 | Increment (absolute,X)
    SBC $FE05,X          ; FD 05 FE | Subtract with carry (absolute,X)
    INC $6000,X          ; FE 00 60 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_166
; Address: $FDC0C2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_166:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_167
; Address: $FDC0C7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_167:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_169
; Address: $FDC0D7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_169:
    JSR $2020            ; 20 20 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_16A
; Address: $FDC0DC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_16A:
    BRA $80              ; 80 80 | Branch always
    PHX                  ; DA | Push X register to stack
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    AND $07FB,X          ; 3D FB 07 | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BIT #$81             ; 89 81 | Test bits in accumulator (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND $FC39,Y          ; 39 39 FC | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_16B
; Address: $FDC105
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_16B:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7BF5,X          ; 7E F5 7B | Rotate right (absolute,X)
    SBC $FB              ; E5 FB | Subtract with carry (zero page)
    CMP $FB              ; C5 FB | Compare accumulator (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    PLY                  ; 7A | Pull Y register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $F889,Y          ; 79 89 F8 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_16C
; Address: $FDC164
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_16C:
    JSR $E060            ; 20 60 E0 | Game work RAM access
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $28              ; F0 28 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_16D
; Address: $FDC16B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_16D:
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    LDY #$20             ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_16E
; Address: $FDC176
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_16E:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    BVC $08              ; 50 08 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_170
; Address: $FDC188
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_170:
    BMI $70              ; 30 70 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCS $30              ; B0 30 | Branch if carry set
    STZ $1414            ; 9C 14 14 | Store zero to absolute
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    NOP                  ; EA | No operation
    DEX                  ; CA | Decrement X register
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CMP ($51),Y          ; D1 51 | Compare accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    INC $FE              ; E6 FE | Increment (zero page)
    ORA $171E,Y          ; 19 1E 17 | Logical OR with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    LDA $6A7A,X          ; BD 7A 6A | Read graphics status
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SBC ($E0,X)          ; E1 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_171
; Address: $FDC1F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_171:
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_173
; Address: $FDC200
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_173:
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_174
; Address: $FDC207
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_174:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA $1817,X          ; 1D 17 18 | Logical OR with accumulator (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX $FBEC            ; EC EC FB | Compare X register (absolute)
    STA $F7              ; 85 F7 | Update graphics data
    LDA                  ; BF 6D CF 83 | Read graphics status
    DEX                  ; CA | Decrement X register
    CPX $1BEC            ; EC EC 1B | Compare X register (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    BIT $58              ; 24 58 | Test bits in accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    ADC $F9DA,X          ; 7D DA F9 | Add with carry (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $EB23,Y          ; F9 23 EB | Subtract with carry (absolute,Y)
    STA $80DF,X          ; 9D DF 80 | Update graphics data
    BRA $FC              ; 80 FC | Branch always
    STZ $269A,X          ; 9E 9A 26 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_175
; Address: $FDC27B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_175:
    JSL $A10014          ; 22 14 00 A1 | Jump to subroutine long
    STA ($00,X)          ; 81 00 | Update graphics data
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA $FAFA,X          ; 9D FA FA | Update graphics data
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_176
; Address: $FDC2A0
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_176:
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    ROL $F6FA,X          ; 3E FA F6 | Rotate left (absolute,X)
    ROR $F42C,X          ; 7E 2C F4 | Rotate right (absolute,X)
    ROR $CBFE,X          ; 7E FE CB | Rotate right (absolute,X)
    SBC $DEAE,Y          ; F9 AE DE | Subtract with carry (absolute,Y)
    ADC $24FB            ; 6D FB 24 | Add with carry (absolute)
    BIT $06              ; 24 06 | Test bits in accumulator (zero page)
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    DEC $24              ; C6 24 | Decrement (zero page)
    BIT $52              ; 24 52 | Test bits in accumulator (zero page)
    ROL $26              ; 26 26 | Rotate left (zero page)
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    INC $B5B1,X          ; FE B1 B5 | Increment (absolute,X)
    DEC $F17F            ; CE 7F F1 | Decrement (absolute)
    SBC $7F7F,X          ; FD 7F 7F | Subtract with carry (absolute,X)
    STA                  ; 9F 46 46 4B | Update graphics data
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    REP #$C2             ; C2 C2 | Reset processor status bits
    STX $06              ; 86 06 | Store X register to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    DEC $AF7E,X          ; DE 7E AF | Decrement (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    STA $85              ; 85 85 | Update graphics data
    ORA ($97),Y          ; 11 97 | Logical OR with accumulator ((zero page),Y)
    ADC $65              ; 65 65 | Add with carry (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_177
; Address: $FDC342
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_177:
    STZ $69F7,X          ; 9E F7 69 | Store zero to absolute,X
    LSR $7F7F,X          ; 5E 7F 7F | Logical shift right (absolute,X)
    BPL $10              ; 10 10 | Branch if positive
    LDA ($21),Y          ; B1 21 | PPU graphics register access
    STX $808E            ; 8E 8E 80 | Store X register to absolute address
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    PHX                  ; DA | Push X register to stack
    ROR $7EDE,X          ; 7E DE 7E | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $D0              ; 70 D0 | Branch if overflow set
    LDY #$E0             ; A0 E0 | Game work RAM access
    BRA $40              ; 80 40 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $32              ; 80 32 | Branch always
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    ROR $66              ; 66 66 | Rotate right (zero page)
    BNE $50              ; D0 50 | Branch if not equal
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPX $FE78            ; EC 78 FE | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_178
; Address: $FDC3B4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_178:
    JSR $2620            ; 20 20 26 | Jump to subroutine
    ROL $1E              ; 26 1E | Rotate left (zero page)
    ASL $0202,X          ; 1E 02 02 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $7E2838          ; AF 38 28 7E | Read graphics status
    INC $E6FE,X          ; FE FE E6 | Increment (absolute,X)
    BVS $EF              ; 70 EF | Branch if overflow set
    CPY $04              ; C4 04 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    STX $3D09            ; 8E 09 3D | Store X register to absolute address
    ROL $3E31,X          ; 3E 31 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_17A
; Address: $FDC3E0
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_17A:
    PEA #$FC1C           ; F4 1C FC | Push effective address to stack
    STZ $24D4            ; 9C D4 24 | Store zero to absolute
    PHX                  ; DA | Push X register to stack
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $1400,X          ; FE 00 14 | Increment (absolute,X)
    CPY $24              ; C4 24 | Compare Y register (zero page)
    BIT $DCD4            ; 2C D4 DC | Test bits in accumulator (absolute)
    BIT $EE              ; 24 EE | Test bits in accumulator (zero page)
    CPX $00FE            ; EC FE 00 | Compare X register (absolute)
    ORA $7EFF            ; 0D FF 7E | Logical OR with accumulator (absolute)
    ROR $FE9A,X          ; 7E 9A FE | Rotate right (absolute,X)
    INC $F0FE,X          ; FE FE F0 | Increment (absolute,X)
    BEQ $C0              ; F0 C0 | Branch if equal
    LDA ($B1),Y          ; B1 B1 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_17B
; Address: $FDC427
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_17B:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC $35FD,Y          ; F9 FD 35 | Subtract with carry (absolute,Y)
    LDA $FF              ; A5 FF | Read graphics status
    BEQ $70              ; F0 70 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ADC $C27D,X          ; 7D 7D C2 | Add with carry (absolute,X)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_17C
; Address: $FDC467
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_17C:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_17D
; Address: $FDC475
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_17D:
    RTI                  ; 40 | Return from interrupt
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDA                  ; BF 37 3F 7F | Read graphics status
    SBC $2D7F            ; ED 7F 2D | Subtract with carry (absolute)
    EOR ($DD),Y          ; 51 DD | Exclusive OR with accumulator ((zero page),Y)
    DEC $7B7D,X          ; DE 7D 7B | Decrement (absolute,X)
    ORA $CB              ; 05 CB | Logical OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BPL $31              ; 10 31 | Branch if positive
    BMI $B8              ; 30 B8 | Branch if negative
    SEC                  ; 38 | Set carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY $00CC            ; CC CC 00 | Compare Y register (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    JMP $FB4C            ; 4C 4C FB | Jump to address
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_17F
; Address: $FDC512
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_17F:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_180
; Address: $FDC528
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_180:
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CPX $EEFC            ; EC FC EE | Compare X register (absolute)
    ROR $8080,X          ; 7E 80 80 | Rotate right (absolute,X)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_181
; Address: $FDC537
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_181:
    LDY #$60             ; A0 60 | Load immediate value into Y register
    LDY #$70             ; A0 70 | Load immediate value into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    LDA $9EFD,X          ; BD FD 9E | Read graphics status
    ASL $EF6D,X          ; 1E 6D EF | Arithmetic shift left (absolute,X)
    STA                  ; 9F FF D7 7F | Update graphics data
    SBC $EDFF            ; ED FF ED | Subtract with carry (absolute)
    STX $8191            ; 8E 91 81 | Store X register to absolute address
    CMP ($41,X)          ; C1 41 | Compare accumulator ((zero page,X))
    ADC ($B1),Y          ; 71 B1 | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    CPX $5C54            ; EC 54 5C | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    PEA #$EF7C           ; F4 7C EF | Push effective address to stack
    ADC $5E52,X          ; 7D 52 5E | Add with carry (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX $F4EC            ; EC EC F4 | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$CDF4           ; F4 F4 CD | Push effective address to stack
    CMP $00A1            ; CD A1 00 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_182
; Address: $FDC5AA
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_182:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX $7CEC            ; EC EC 7C | Compare X register (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY $74AC            ; AC AC 74 | Load from absolute address into Y register
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    ASL $1EFF            ; 0E FF 1E | Arithmetic shift left (absolute)
    SBC ($11),Y          ; F1 11 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_184
; Address: $FDC602
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_184:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC $EDF7            ; ED F7 ED | Subtract with carry (absolute)
    SBC $C9F3            ; ED F3 C9 | Subtract with carry (absolute)
    CMP $30DD,X          ; DD DD 30 | Compare accumulator (absolute,X)
    BVS $C0              ; 70 C0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_185
; Address: $FDC632
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_185:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SBC $0FFF,X          ; FD FF 0F | Subtract with carry (absolute,X)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    SBC $7F              ; E5 7F | Subtract with carry (zero page)
    ORA $B9BF,Y          ; 19 BF B9 | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $30              ; F0 30 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    STY $C23E            ; 8C 3E C2 | Store Y register to absolute address
    JMP $40BCA0          ; 5C A0 BC 40 | Jump to address long
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_186
; Address: $FDC686
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_186:
    JSR $C0E0            ; 20 E0 C0 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_187
; Address: $FDC696
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_187:
    JSR $C020            ; 20 20 C0 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_188
; Address: $FDC69F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_188:
    CPY #$B6             ; C0 B6 | Compare Y register (immediate)
    INC $DF5F,X          ; FE 5F DF | Increment (absolute,X)
    STZ $B5DE,X          ; 9E DE B5 | Store zero to absolute,X
    JMP $FE6E7F          ; 5C 7F 6E FE | Jump to address long
    ROL $26              ; 26 26 | Rotate left (zero page)
    ADC $365D,X          ; 7D 5D 36 | Add with carry (absolute,X)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    STY $04              ; 84 04 | Store Y register to zero page
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_18A
; Address: $FDC6DE
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_18A:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC $1EEF            ; ED EF 1E | Subtract with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    STX $5C7C            ; 8E 7C 5C | Store X register to absolute address
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    INC $06              ; E6 06 | Increment (zero page)
    BNE $50              ; D0 50 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_18C
; Address: $FDC714
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_18C:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $30              ; F0 30 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_18D
; Address: $FDC751
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_18D:
    JSR $C03C            ; 20 3C C0 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $FB              ; C6 FB | Decrement (zero page)
    CMP $8FAC,X          ; DD AC 8F | Compare accumulator (absolute,X)
    DEC $1EDF            ; CE DF 1E | Decrement (absolute)
    INC $DF0A,X          ; FE 0A DF | Increment (absolute,X)
    AND $AF              ; 25 AF | Logical AND with accumulator (zero page)
    EOR ($CF),Y          ; 51 CF | Exclusive OR with accumulator ((zero page),Y)
    BMI $1F              ; 30 1F | Branch if negative
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    SBC $1D              ; E5 1D | Subtract with carry (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA ($93),Y          ; 91 93 | Update graphics data
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA ($83,X)          ; 81 83 | Update graphics data
    STZ $64              ; 64 64 | Store zero to zero page
    INC                  ; 1A | Increment accumulator
    ROR $3B4D,X          ; 7E 4D 3B | Rotate right (absolute,X)
    ORA $1E2F,X          ; 1D 2F 1E | Logical OR with accumulator (absolute,X)
    ORA $0F13            ; 0D 13 0F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_190
; Address: $FDC832
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_190:
    BCC $94              ; 90 94 | Branch if carry clear
    DEC $2F8E            ; CE 8E 2F | Decrement (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $0F27,X          ; 1D 27 0F | Logical OR with accumulator (absolute,X)
    ASL $0013            ; 0E 13 00 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    BRA $C0              ; 80 C0 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    AND ($3E,X)          ; 21 3E | Logical AND with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    WDM #$7C             ; 42 7C | Reserved instruction
    BEQ $38              ; F0 38 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    REP #$C2             ; C2 C2 | Reset processor status bits
    STY $7802            ; 8C 02 78 | Store Y register to absolute address
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCS $F0              ; B0 F0 | Branch if carry set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CMP ($F1),Y          ; D1 F1 | Compare accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_192
; Address: $FDC8C8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_192:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    BVS $40              ; 70 40 | Branch if overflow set
    BVS $80              ; 70 80 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_195
; Address: $FDC8DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_195:
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BVC $5F              ; 50 5F | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_197
; Address: $FDC8FF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_197:
    BRA $00              ; 80 00 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_19D
; Address: $FDC94E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_19D:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $10              ; 90 10 | Branch if carry clear
    BCC $10              ; 90 10 | Branch if carry clear
    BCC $10              ; 90 10 | Branch if carry clear
    BCC $10              ; 90 10 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_19E
; Address: $FDC95E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_19E:
    JSR $F120            ; 20 20 F1 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    DEC                  ; 3A | Decrement accumulator
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $3E              ; 80 3E | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_19F
; Address: $FDC977
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_19F:
    JSR $100F            ; 20 0F 10 | Jump to subroutine
    BPL $0F              ; 10 0F | Branch if positive
    BPL $17              ; 10 17 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    STA $469E            ; 8D 9E 46 | Update graphics data
    CMP $F637            ; CD 37 F6 | Compare accumulator (absolute)
    ORA $1EEA            ; 0D EA 1E | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A0
; Address: $FDC98B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A0:
    SBC $FFAF,X          ; FD AF FF | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    STA $DF0F            ; 8D 0F DF | Update graphics data
    INX                  ; E8 | Increment X register
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    DEC                  ; 3A | Decrement accumulator
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $3E              ; 80 3E | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A1
; Address: $FDC9B7
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A1:
    JSR $100F            ; 20 0F 10 | Jump to subroutine
    BPL $0F              ; 10 0F | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STA $86              ; 85 86 | Update graphics data
    LSR $C5              ; 46 C5 | Logical shift right (zero page)
    ORA $1EEA            ; 0D EA 1E | Logical OR with accumulator (absolute)
    SBC $FFAF,X          ; FD AF FF | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    STA $DF0F            ; 8D 0F DF | Update graphics data
    INX                  ; E8 | Increment X register
    ORA $0B03            ; 0D 03 0B | Logical OR with accumulator (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$98             ; 09 98 | Logical OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    PLX                  ; FA | Pull X register from stack
    PHB                  ; 8B | Push data bank register to stack
    STA ($9F),Y          ; 91 9F | Update graphics data
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    INC $FC98,X          ; FE 98 FC | Increment (absolute,X)
    BEQ $0C              ; F0 0C | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A3
; Address: $FDCA1F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A3:
    ASL $7C47            ; 0E 47 7C | Arithmetic shift left (absolute)
    STA $F956F8          ; 8F F8 56 F9 | Update graphics data
    ADC $22F2,X          ; 7D F2 22 | Add with carry (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    STA                  ; 9F 00 3F 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A4
; Address: $FDCA36
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A4:
    ROR $3C01,X          ; 7E 01 3C | Rotate right (absolute,X)
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    ADC $3775            ; 6D 75 37 | Add with carry (absolute)
    AND $1719,Y          ; 39 19 17 | Logical AND with accumulator (absolute,Y)
    ASL $0B0C,X          ; 1E 0C 0B | Arithmetic shift left (absolute,X)
    ASL $7B0C            ; 0E 0C 7B | Arithmetic shift left (absolute)
    PLY                  ; 7A | Pull Y register from stack
    LSR $3A7E,X          ; 5E 7E 3A | Logical shift right (absolute,X)
    ROL $3F27,X          ; 3E 27 3F | Rotate left (absolute,X)
    ASL $111F,X          ; 1E 1F 11 | Arithmetic shift left (absolute,X)
    ASL $F080            ; 0E 80 F0 | Arithmetic shift left (absolute)
    STA ($9F),Y          ; 91 9F | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    INC $7F64,X          ; FE 64 7F | Increment (absolute,X)
    ASL $080C            ; 0E 0C 08 | Arithmetic shift left (absolute)
    ORA $3710,Y          ; 19 10 37 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A5
; Address: $FDCA97
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A5:
    JSR $C0E7            ; 20 E7 C0 | Jump to subroutine
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$7C             ; E0 7C | Compare X register (immediate)
    BRA $B8              ; 80 B8 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    BNE $20              ; D0 20 | Branch if not equal
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $1F              ; 80 1F | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0701            ; 0E 01 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A6
; Address: $FDCAE6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A6:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    ORA ($39),Y          ; 11 39 | Logical OR with accumulator ((zero page),Y)
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    LSR $44              ; 46 44 | Logical shift right (zero page)
    EOR #$4D             ; 49 4D | Exclusive OR with accumulator (immediate)
    EOR #$4D             ; 49 4D | Exclusive OR with accumulator (immediate)
    EOR #$40             ; 49 40 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A7
; Address: $FDCB1E
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A7:
    JSR $5E20            ; 20 20 5E | Jump to subroutine
    INC $7C3C,X          ; FE 3C 7C | Increment (absolute,X)
    INC $63              ; E6 63 | Increment (zero page)
    INC $FC25            ; EE 25 FC | Increment (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    TXA                  ; 8A | Transfer X register to accumulator
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $83              ; 80 83 | Branch always
    BRA $01              ; 80 01 | Branch always
    SEC                  ; 38 | Set carry flag
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    BMI $04              ; 30 04 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR $3CFE,X          ; 5E FE 3C | Logical shift right (absolute,X)
    INC $63              ; E6 63 | Increment (zero page)
    INC $FC25            ; EE 25 FC | Increment (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $83              ; 80 83 | Branch always
    BRA $01              ; 80 01 | Branch always
    SEC                  ; 38 | Set carry flag
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    BMI $06              ; 30 06 | Branch if negative
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA $0601            ; 0D 01 06 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $F80766          ; 8F 66 07 F8 | Update graphics data

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A8
; Address: $FDCBA9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A8:
    LDY $48F4            ; AC F4 48 | Load from absolute address into Y register
    PHA                  ; 48 | Push accumulator to stack
    BCS $B0              ; B0 B0 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1A9
; Address: $FDCBB1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1A9:
    STX $0070            ; 8E 70 00 | Store X register to absolute address
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    CPY #$E4             ; C0 E4 | Compare Y register (immediate)
    BCS $E4              ; B0 E4 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1AA
; Address: $FDCBC5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1AA:
    CPY $C0              ; C4 C0 | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    BRA $08              ; 80 08 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1AB
; Address: $FDCBCD
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1AB:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BCS $30              ; B0 30 | Branch if carry set
    BVS $70              ; 70 70 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $34              ; 05 34 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1AD
; Address: $FDCBFF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1AD:
    JSR $F8F7            ; 20 F7 F8 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    STA $F81EFE          ; 8F FE 1E F8 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $01              ; 80 01 | Branch always
    ASL $F900            ; 0E 00 F9 | Arithmetic shift left (absolute)
    ORA $87              ; 05 87 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1AE
; Address: $FDCC22
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1AE:
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $20              ; 80 20 | Branch always
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1AF
; Address: $FDCC2B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1AF:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BMI $10              ; 30 10 | Branch if negative
    BVS $18              ; 70 18 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    JMP ($5A2C)          ; 6C 2C 5A | Jump to address (absolute indirect)
    ROL $1C26,X          ; 3E 26 1C | Rotate left (absolute,X)
    BIT $0010            ; 2C 10 00 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $40              ; 10 40 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1B1
; Address: $FDCC5D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1B1:
    JSL $252418          ; 22 18 24 25 | Jump to subroutine long
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $EF              ; 06 EF | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1B3
; Address: $FDCC70
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1B3:
    BPL $10              ; 10 10 | Branch if positive
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BMI $3E              ; 30 3E | Branch if negative
    EOR ($78,X)          ; 41 78 | Exclusive OR with accumulator ((zero page,X))
    STY $60              ; 84 60 | Store Y register to zero page
    BCC $00              ; 90 00 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1B4
; Address: $FDCC81
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1B4:
    INY                  ; C8 | Increment Y register
    ORA #$26             ; 09 26 | Logical OR with accumulator (immediate)
    CMP $2F88,Y          ; D9 88 2F | Compare accumulator (absolute,Y)
    INC $BF0F,X          ; FE 0F BF | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1B6
; Address: $FDCC93
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1B6:
    CMP $26B9,Y          ; D9 B9 26 | Compare accumulator (absolute,Y)
    BVC $6F              ; 50 6F | Branch if overflow clear
    BRA $F0              ; 80 F0 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1B8
; Address: $FDCC9F
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1B8:
    JSR $0817            ; 20 17 08 | Jump to subroutine
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0611            ; 0E 11 06 | Arithmetic shift left (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $001E            ; 0E 1E 00 | Arithmetic shift left (absolute)
    ASL $0021,X          ; 1E 21 00 | Arithmetic shift left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    WDM #$10             ; 42 10 | Reserved instruction
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $3A              ; 05 3A | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1E10            ; 0D 10 1E | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1B9
; Address: $FDCD3F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1B9:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1BE
; Address: $FDCD4C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1BE:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    BCC $10              ; 90 10 | Branch if carry clear
    BCC $10              ; 90 10 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    BVS $18              ; 70 18 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    STZ $24              ; 64 24 | Store zero to zero page
    PHY                  ; 5A | Push Y register to stack
    ROL $247A,X          ; 3E 7A 24 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1BF
; Address: $FDCD79
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1BF:
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BIT $1E52            ; 2C 52 1E | Test bits in accumulator (absolute)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1C6
; Address: $FDCDAE
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1C6:
    JSR $00C0            ; 20 C0 00 | Jump to subroutine
    BCC $10              ; 90 10 | Branch if carry clear
    BCC $10              ; 90 10 | Branch if carry clear
    BCC $10              ; 90 10 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $3E02,X          ; 1D 02 3E | Logical OR with accumulator (absolute,X)
    ORA ($77),Y          ; 11 77 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $201F,Y          ; 19 1F 20 | Logical OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$E0             ; A0 E0 | Game work RAM access
    BCS $D0              ; B0 D0 | Branch if carry set
    BEQ $B0              ; F0 B0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    STY $E5              ; 84 E5 | Store Y register to zero page
    SBC ($79),Y          ; F1 79 | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BNE $F0              ; D0 F0 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1C7
; Address: $FDCE19
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1C7:
    SED                  ; F8 | Set decimal mode flag
    LDA $1AFD            ; AD FD 1A | Read graphics status
    ASL $0686,X          ; 1E 86 06 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    ASL $00F9,X          ; 1E F9 00 | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ORA $3A              ; 05 3A | Logical OR with accumulator (zero page)
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    BPL $1F              ; 10 1F | Branch if positive
    AND ($08,X)          ; 21 08 | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BMI $38              ; 30 38 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    INC $FE3C,X          ; FE 3C FE | Increment (absolute,X)
    ASL $06FF            ; 0E FF 06 | Arithmetic shift left (absolute)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1C8
; Address: $FDCEED
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1C8:
    BVS $38              ; 70 38 | Branch if overflow set
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    BRA $80              ; 80 80 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    STY $428C            ; 8C 8C 42 | Hardware register operation
    WDM #$7D             ; 42 7D | Reserved instruction
    ASL $237C            ; 0E 7C 23 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1CA
; Address: $FDCF0A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1CA:
    DEY                  ; 88 | Decrement Y register
    LSR $3F              ; 46 3F | Logical shift right (zero page)
    BVC $3F              ; 50 3F | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1CB
; Address: $FDCF15
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1CB:
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F A0 BF 80 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    ASL $3FC0,X          ; 1E C0 3F | Arithmetic shift left (absolute,X)
    INC $FC0E,X          ; FE 0E FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ADC $B2F2            ; 6D F2 B2 | Add with carry (absolute)
    JMP $708C            ; 4C 8C 70 | Jump to address
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    BVS $8C              ; 70 8C | Branch if overflow set
    BRA $F0              ; 80 F0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1CE
; Address: $FDCFBC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1CE:
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $FE              ; E6 FE | Increment (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $9C00,Y          ; F9 00 9C | Subtract with carry (absolute,Y)
    LDX $DECC,Y          ; BE CC DE | Load from absolute,Y into X register
    STY $9E              ; 84 9E | Store Y register to zero page
    LDY #$AE             ; A0 AE | Load immediate value into Y register
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1CF
; Address: $FDCFEF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1CF:
    CPX #$41             ; E0 41 | Compare X register (immediate)
    EOR ($21,X)          ; 41 21 | PPU graphics register access
    AND ($61,X)          ; 21 61 | Logical AND with accumulator ((zero page,X))
    AND ($51,X)          ; 21 51 | Logical AND with accumulator ((zero page,X))
    ORA ($F2),Y          ; 11 F2 | Logical OR with accumulator ((zero page),Y)
    PEA #$8814           ; F4 14 88 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D0
; Address: $FDD014
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D0:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    INC $5E1E            ; EE 1E 5E | Increment (absolute)
    LDX $FCFC,Y          ; BE FC FC | Load from absolute,Y into X register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BPL $10              ; 10 10 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    ADC ($E1,X)          ; 61 E1 | Add with carry ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    CMP #$C1             ; C9 C1 | Compare accumulator (immediate)
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D2
; Address: $FDD089
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D2:
    BVS $E0              ; 70 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $FE              ; F0 FE | Branch if equal
    SBC $80FF,Y          ; F9 FF 80 | Subtract with carry (absolute,Y)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D3
; Address: $FDD094
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D3:
    JSR $9020            ; 20 20 90 | Jump to subroutine
    BPL $88              ; 10 88 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $0F11            ; 0E 11 0F | Arithmetic shift left (absolute)
    BMI $1F              ; 30 1F | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D4
; Address: $FDD0CD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D4:
    JSR $601F            ; 20 1F 60 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D5
; Address: $FDD0D7
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D5:
    JSR $202F            ; 20 2F 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F FC 1F FC | Update graphics data
    CPX $021F            ; EC 1F 02 | Compare X register (absolute)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D6
; Address: $FDD11A
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D6:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    BPL $C3              ; 10 C3 | Branch if positive
    ORA #$FB             ; 09 FB | Logical OR with accumulator (immediate)
    BEQ $FD              ; F0 FD | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $F608,X          ; FE 08 F6 | Increment (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CPX #$04             ; E0 04 | Compare X register (immediate)
    LDA $7FC6,Y          ; B9 C6 7F | Read graphics status
    LDA ($EF),Y          ; B1 EF | Read graphics status
    BVS $F0              ; 70 F0 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    BVS $0F              ; 70 0F | Branch if overflow set
    BRA $70              ; 80 70 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    ROL $0B              ; 26 0B | Rotate left (zero page)
    BVC $50              ; 50 50 | Branch if overflow clear
    BCC $97              ; 90 97 | Branch if carry clear
    BCC $A7              ; 90 A7 | Branch if carry clear
    LDY #$6F             ; A0 6F | Load immediate value into Y register
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D7
; Address: $FDD182
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D7:
    INC $E1FF,X          ; FE FF E1 | Increment (absolute,X)
    SBC $FEFE,X          ; FD FE FE | Subtract with carry (absolute,X)
    AND ($F1),Y          ; 31 F1 | Logical AND with accumulator ((zero page),Y)
    EOR ($F1),Y          ; 51 F1 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    STY $8E00            ; 8C 00 8E | Store Y register to absolute address
    DEC $EC00            ; CE 00 EC | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D8
; Address: $FDD1BD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D8:
    JSR $20EC            ; 20 EC 20 | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1D9
; Address: $FDD1C3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1D9:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $30              ; F0 30 | Branch if equal
    BVS $10              ; 70 10 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BPL $B8              ; 10 B8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    STY $30              ; 84 30 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1DA
; Address: $FDD1D0
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1DA:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    STY $84              ; 84 84 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA $060D            ; 0D 0D 06 | Logical OR with accumulator (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1DB
; Address: $FDD203
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1DB:
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    CPX #$4F             ; E0 4F | Compare X register (immediate)
    BEQ $C7              ; F0 C7 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1DC
; Address: $FDD20E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1DC:
    BEQ $7F              ; F0 7F | Branch if equal
    LDA                  ; BF 80 7F 00 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1DD
; Address: $FDD224
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1DD:
    INY                  ; C8 | Increment Y register
    STY $1E7F            ; 8C 7F 1E | Store Y register to absolute address
    INC $FE3F,X          ; FE 3F FE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1DE
; Address: $FDD240
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1DE:
    JSR $30B0            ; 20 B0 30 | Jump to subroutine
    BCS $10              ; B0 10 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    BPL $B8              ; 10 B8 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BIT $30              ; 24 30 | Test bits in accumulator (zero page)
    BMI $08              ; 30 08 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1DF
; Address: $FDD250
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1DF:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BCC $90              ; 90 90 | Branch if carry clear
    ASL $1F03            ; 0E 03 1F | Arithmetic shift left (absolute)
    ASL $1E03,X          ; 1E 03 1E | Arithmetic shift left (absolute,X)
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    BPL $3F              ; 10 3F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E0
; Address: $FDD27D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E0:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    SBC ($31,X)          ; E1 31 | Subtract with carry ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E1
; Address: $FDD29E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E1:
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    ORA $6E1F,X          ; 1D 1F 6E | Logical OR with accumulator (absolute,X)
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    LSR $7C7E,X          ; 5E 7E 7C | Logical shift right (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $007978          ; 8F 78 79 00 | Update graphics data
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $3B32            ; 0D 32 3B | Logical OR with accumulator (absolute)
    ADC $0082,Y          ; 79 82 00 | Add with carry (absolute,Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    SBC ($7F,X)          ; E1 7F | Subtract with carry ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    BRA $9F              ; 80 9F | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E2
; Address: $FDD2F7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E2:
    JSR $0887            ; 20 87 08 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    NOP                  ; EA | No operation
    CPY $ECE7            ; CC E7 EC | Compare Y register (absolute)
    CMP $00FF            ; CD FF 00 | Compare accumulator (absolute)
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E3
; Address: $FDD311
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E3:
    JSR $31D1            ; 20 D1 31 | Jump to subroutine
    BPL $DD              ; 10 DD | Branch if positive
    BMI $0C              ; 30 0C | Branch if negative
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E4
; Address: $FDD322
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E4:
    BPL $80              ; 10 80 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BEQ $FA              ; F0 FA | Branch if equal
    CPY $EF              ; C4 EF | Compare Y register (zero page)
    BMI $79              ; 30 79 | Branch if negative
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BCC $90              ; 90 90 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E6
; Address: $FDD334
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E6:
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    ROL $0641,X          ; 3E 41 06 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E7
; Address: $FDD34A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E7:
    AND $4702,X          ; 3D 02 47 | Logical AND with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $3C21,X          ; 1E 21 3C | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BMI $7C              ; 30 7C | Branch if negative
    STA                  ; 9F 03 F7 80 | Update graphics data
    SBC ($E0),Y          ; F1 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA                  ; BF 80 CF D0 | Read graphics status
    STZ $80              ; 64 80 | Store zero to zero page
    ADC ($E0,X)          ; 61 E0 | Game work RAM access
    ROR $FEF8,X          ; 7E F8 FE | Rotate right (absolute,X)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    SBC $E107,Y          ; F9 07 E1 | Subtract with carry (absolute,Y)
    ORA $33C3,X          ; 1D C3 33 | Logical OR with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E8
; Address: $FDD3A6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E8:
    SED                  ; F8 | Set decimal mode flag
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    DEC $F260,X          ; DE 60 F2 | Decrement (absolute,X)
    BCS $B0              ; B0 B0 | Branch if carry set
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1E9
; Address: $FDD3C1
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1E9:
    JSR $007F            ; 20 7F 00 | Jump to subroutine
    ROR $FE01,X          ; 7E 01 FE | Rotate right (absolute,X)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    AND ($9C,X)          ; 21 9C | Logical AND with accumulator ((zero page,X))
    STY $A873            ; 8C 73 A8 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $E6              ; 80 E6 | Branch always
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1EA
; Address: $FDD3EA
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1EA:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STZ $C3FB,X          ; 9E FB C3 | Store zero to absolute,X
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    BEQ $D0              ; F0 D0 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $D0              ; 10 D0 | Branch if positive
    JMP $E8FC            ; 4C FC E8 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCS $30              ; B0 30 | Branch if carry set
    BIT $C30C            ; 2C 0C C3 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1EB
; Address: $FDD44F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1EB:
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1EC
; Address: $FDD462
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1EC:
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    CPY $E3              ; C4 E3 | Compare Y register (zero page)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $FF              ; 64 FF | Store zero to zero page

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1ED
; Address: $FDD4A7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1ED:
    JSR $013E            ; 20 3E 01 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1EE
; Address: $FDD4C9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1EE:
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F0
; Address: $FDD4D7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F0:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ASL $383F,X          ; 1E 3F 38 | Arithmetic shift left (absolute,X)
    BMI $7F              ; 30 7F | Branch if negative
    BVS $7F              ; 70 7F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F2
; Address: $FDD512
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F2:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F3
; Address: $FDD52F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F3:
    BCS $00              ; B0 00 | Branch if carry set
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCC $90              ; 90 90 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    ASL $0A06            ; 0E 06 0A | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F4
; Address: $FDD57D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F4:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    ASL $0D05            ; 0E 05 0D | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F5
; Address: $FDD587
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F5:
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    AND $0B              ; 25 0B | Logical AND with accumulator (zero page)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F6
; Address: $FDD595
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F6:
    JSL $272425          ; 22 25 24 27 | Jump to subroutine long
    BIT $27              ; 24 27 | Test bits in accumulator (zero page)
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F7
; Address: $FDD59D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F7:
    JSR $1010            ; 20 10 10 | Jump to subroutine
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $7F              ; 70 7F | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    LDY $00BF,X          ; BC BF 00 | Load from absolute,X into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ASL $00FE,X          ; 1E FE 00 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $B8              ; 80 B8 | Branch always
    BNE $D8              ; D0 D8 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    STZ $ACA8            ; 9C A8 AC | Store zero to absolute
    BVS $6C              ; 70 6C | Branch if overflow set
    INX                  ; E8 | Increment X register
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F8
; Address: $FDD5F5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F8:
    JSL $F21252          ; 22 52 12 F2 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $0715            ; 0E 15 07 | Arithmetic shift left (absolute)
    ORA $1207,Y          ; 19 07 12 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1F9
; Address: $FDD615
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1F9:
    JSL $042109          ; 22 09 21 04 | Jump to subroutine long
    BPL $0C              ; 10 0C | Branch if positive
    BPL $0E              ; 10 0E | Branch if positive
    BPL $06              ; 10 06 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STA ($81,X)          ; 81 81 | Update graphics data
    STA ($81,X)          ; 81 81 | Update graphics data
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1FA
; Address: $FDD647
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1FA:
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1FC
; Address: $FDD67E
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1FC:
    JSR $0320            ; 20 20 03 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    CMP ($71),Y          ; D1 71 | Compare accumulator ((zero page),Y)
    BCC $10              ; 90 10 | Branch if carry clear
    BNE $10              ; D0 10 | Branch if not equal
    BEQ $10              ; F0 10 | Branch if equal
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    JMP $3030            ; 4C 30 30 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_1FF
; Address: $FDD6EB
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_1FF:
    JSR $0078            ; 20 78 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ROR $BF10,X          ; 7E 10 BF | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    BPL $68              ; 10 68 | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    CMP #$FB             ; C9 FB | Compare accumulator (immediate)
    BEQ $FD              ; F0 FD | Branch if equal
    ASL $3F00            ; 0E 00 3F | Arithmetic shift left (absolute)
    INC $F608,X          ; FE 08 F6 | Increment (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CPX #$04             ; E0 04 | Compare X register (immediate)
    LDY $D0              ; A4 D0 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    BRA $90              ; 80 90 | Branch always
    BEQ $FE              ; F0 FE | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_200
; Address: $FDD72B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_200:
    CLC                  ; 18 | Clear carry flag
    ORA $0606,Y          ; 19 06 06 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_202
; Address: $FDD736
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_202:
    BEQ $0C              ; F0 0C | Branch if equal
    ASL $0621,X          ; 1E 21 06 | Arithmetic shift left (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ASL $0A01            ; 0E 01 0A | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    WDM #$C3             ; 42 C3 | Reserved instruction
    STX $C5              ; 86 C5 | Store X register to zero page
    INC $4D              ; E6 4D | Increment (zero page)
    NOP                  ; EA | No operation
    STZ $ABFD,X          ; 9E FD AB | Store zero to absolute,X
    JMP ($23FB)          ; 6C FB 23 | Jump to address (absolute indirect)
    CPX $EF0F            ; EC 0F EF | Compare X register (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_203
; Address: $FDD794
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_203:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $91              ; F0 91 | Branch if equal
    BCS $10              ; B0 10 | Branch if carry set
    BCS $10              ; B0 10 | Branch if carry set
    BCC $10              ; 90 10 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CPY $04              ; C4 04 | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    ROR $00C0,X          ; 7E C0 00 | Rotate right (absolute,X)
    BRA $C7              ; 80 C7 | Branch always
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    STA $028F            ; 8D 8F 02 | Update graphics data
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $FE5E,X          ; 7E 5E FE | Rotate right (absolute,X)
    STZ $FC              ; 64 FC | Store zero to zero page
    INC $63              ; E6 63 | Increment (zero page)
    INC $7CA5            ; EE A5 7C | Increment (absolute)
    CLC                  ; 18 | Clear carry flag
    STA $87              ; 85 87 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_204
; Address: $FDD837
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_204:
    JSR $3801            ; 20 01 38 | Jump to subroutine
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    BRA $1F              ; 80 1F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_205
; Address: $FDD842
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_205:
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($AF,X)          ; 01 AF | Logical OR with accumulator ((zero page,X))
    ROL $E5              ; 26 E5 | Rotate left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_206
; Address: $FDD867
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_206:
    ROR $FB7D            ; 6E 7D FB | Rotate right (absolute)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    STA                  ; 9F 07 9D 8F | Update graphics data
    ASL $0B0F            ; 0E 0F 0B | Arithmetic shift left (absolute)
    ASL $0D1D            ; 0E 1D 0D | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_207
; Address: $FDD89A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_207:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0602            ; 0E 02 06 | Arithmetic shift left (absolute)
    ORA $0904            ; 0D 04 09 | Logical OR with accumulator (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ADC ($70,X)          ; 61 70 | Add with carry ((zero page,X))
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_209
; Address: $FDD94F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_209:
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_20A
; Address: $FDD955
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_20A:
    JSR $405F            ; 20 5F 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 80 BF 80 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA $040D            ; 0D 0D 04 | Logical OR with accumulator (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    CPX #$CE             ; E0 CE | Compare X register (immediate)
    SBC ($C0),Y          ; F1 C0 | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    CPY $3F              ; C4 3F | Compare Y register (zero page)
    STX $0F7F            ; 8E 7F 0F | Store X register to absolute address
    INC $00F8,X          ; FE F8 00 | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $1001,X          ; FE 01 10 | Increment (absolute,X)
    BNE $10              ; D0 10 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $18              ; 90 18 | Branch if carry clear
    STY $30              ; 84 30 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_20C
; Address: $FDD9F4
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_20C:
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $E4              ; 64 E4 | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    BVC $50              ; 50 50 | Branch if overflow clear
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $1A03            ; 0D 03 1A | Logical OR with accumulator (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 10 FB 70 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_20D
; Address: $FDDA4C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_20D:
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    STA                  ; 9F A0 C7 C8 | Update graphics data
    BVC $63              ; 50 63 | Branch if overflow clear
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_20E
; Address: $FDDA5B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_20E:
    BPL $E0              ; 10 E0 | Game work RAM access
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BEQ $0E              ; F0 0E | Branch if equal
    CMP ($39,X)          ; C1 39 | Compare accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_210
; Address: $FDDA84
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_210:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $D0              ; D0 D0 | Branch if not equal
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_211
; Address: $FDDA9C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_211:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 10 FB 70 | Read graphics status
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_213
; Address: $FDDACE
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_213:
    JSR $7FC0            ; 20 C0 7F | Jump to subroutine
    STA                  ; 9F A0 C7 C8 | Update graphics data
    BVC $63              ; 50 63 | Branch if overflow clear
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BEQ $0E              ; F0 0E | Branch if equal
    CMP ($39,X)          ; C1 39 | Compare accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_215
; Address: $FDDB04
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_215:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    BNE $D0              ; D0 D0 | Branch if not equal
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0007            ; 0D 07 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $FF32,X          ; 5D 32 FF | Exclusive OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_216
; Address: $FDDB45
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_216:
    JMP $BC43            ; 4C 43 BC | Jump to address
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_217
; Address: $FDDB4C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_217:
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $01              ; 80 01 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_218
; Address: $FDDBC3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_218:
    BRA $60              ; 80 60 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $0D01            ; 0E 01 0D | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_219
; Address: $FDDC04
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_219:
    JMP $102C20          ; 5C 20 2C 10 | Jump to address long
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    BIT $0F              ; 24 0F | Test bits in accumulator (zero page)
    ASL $1E49            ; 0E 49 1E | Arithmetic shift left (absolute)
    WDM #$1C             ; 42 1C | Reserved instruction
    LSR $18              ; 46 18 | Logical shift right (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_21A
; Address: $FDDC39
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_21A:
    ORA ($2E,X)          ; 01 2E | Logical OR with accumulator ((zero page,X))
    BIT $2802            ; 2C 02 28 | Test bits in accumulator (absolute)
    STZ $8E4F            ; 9C 4F 8E | Store zero to absolute
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    BCS $37              ; B0 37 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    STZ $1F1E            ; 9C 1E 1F | Store zero to absolute
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STZ $38              ; 64 38 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    BMI $30              ; 30 30 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    ASL $133F            ; 0E 3F 13 | Arithmetic shift left (absolute)
    BEQ $F8              ; F0 F8 | Branch if equal
    BMI $24              ; 30 24 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $48              ; 06 48 | Arithmetic shift left (zero page)
    ORA $5C              ; 05 5C | Logical OR with accumulator (zero page)
    AND $D1              ; 25 D1 | Logical AND with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_21B
; Address: $FDDCF8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_21B:
    JSL $000E00          ; 22 00 0E 00 | Jump to subroutine long
    STY $00              ; 84 00 | Store Y register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    STY $DDCD            ; 8C CD DD | Store Y register to absolute address
    ADC $006E,X          ; 7D 6E 00 | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_21C
; Address: $FDDD1C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_21C:
    JSL $008100          ; 22 00 81 00 | Jump to subroutine long
    BRA $C0              ; 80 C0 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    JMP $AEAE59          ; 5C 59 AE AE | Jump to address long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_21D
; Address: $FDDD46
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_21D:
    BVC $9F              ; 50 9F | Branch if overflow clear
    STA $1C473F          ; 8F 3F 47 1C | Update graphics data
    BVS $37              ; 70 37 | Branch if overflow set
    JMP $3E0000          ; 5C 00 00 3E | Jump to address long
    CLC                  ; 18 | Clear carry flag
    ADC ($20),Y          ; 71 20 | Add with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_21F
; Address: $FDDD5E
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_21F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $3870            ; 0E 70 38 | Arithmetic shift left (absolute)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROR $F87E,X          ; 7E 7E F8 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    BMI $30              ; 30 30 | Branch if negative
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0307            ; 0D 07 03 | Logical OR with accumulator (absolute)
    ASL $040A            ; 0E 0A 04 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $2E0E            ; 0E 0E 2E | Arithmetic shift left (absolute)
    BIT $5757            ; 2C 57 57 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BPL $30              ; 10 30 | Branch if positive
    STA ($83,X)          ; 81 83 | Update graphics data
    EOR ($44,X)          ; 41 44 | Exclusive OR with accumulator ((zero page,X))
    STX $84              ; 86 84 | Store X register to zero page
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_220
; Address: $FDDE29
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_220:
    JSL $36BE0C          ; 22 0C BE 36 | Jump to subroutine long
    LSR $E2              ; 46 E2 | Logical shift right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_222
; Address: $FDDE39
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_222:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    ORA $7000,Y          ; 19 00 70 | Logical OR with accumulator (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$82             ; E0 82 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    CMP $BD28,X          ; DD 28 BD | Compare accumulator (absolute,X)
    ADC $E2BC,X          ; 7D BC E2 | Add with carry (absolute,X)
    STA ($7E,X)          ; 81 7E | Update graphics data
    EOR ($F0,X)          ; 41 F0 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_223
; Address: $FDDE52
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_223:
    SEP #$9C             ; E2 9C | Set processor status bits
    ORA $3D22,X          ; 1D 22 3D | Logical OR with accumulator (absolute,X)
    WDM #$7D             ; 42 7D | Reserved instruction
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLV                  ; B8 | Clear overflow flag
    STA ($3E),Y          ; 91 3E | Update graphics data
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    ROL $38              ; 26 38 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_224
; Address: $FDDE8C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_224:
    BVS $80              ; 70 80 | Branch if overflow set
    BNE $10              ; D0 10 | Branch if not equal
    LDX $F85E,Y          ; BE 5E F8 | Load from absolute,Y into X register
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BNE $E0              ; D0 E0 | Game work RAM access
    INC                  ; 1A | Increment accumulator
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA $2219,X          ; 1D 19 22 | Logical OR with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_225
; Address: $FDDEB1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_225:
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    SBC $F373            ; ED 73 F3 | Subtract with carry (absolute)
    CPY #$E0             ; C0 E0 | Game work RAM access
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BVS $E0              ; 70 E0 | Game work RAM access
    BMI $E0              ; 30 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    JMP ($C746)          ; 6C 46 C7 | Jump to address (absolute indirect)
    ORA $000F            ; 0D 0F 00 | Logical OR with accumulator (absolute)
    STA ($00,X)          ; 81 00 | Update graphics data
    BEQ $40              ; F0 40 | Branch if equal
    BNE $00              ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_226
; Address: $FDDF04
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_226:
    LDY #$80             ; A0 80 | Load immediate value into Y register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BNE $70              ; D0 70 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_227
; Address: $FDDF18
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_227:
    JSR $F000            ; 20 00 F0 | Jump to subroutine
    LSR $C29C            ; 4E 9C C2 | Logical shift right (absolute)
    SED                  ; F8 | Set decimal mode flag
    TXA                  ; 8A | Transfer X register to accumulator
    LSR $3C35,X          ; 5E 35 3C | Logical shift right (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_228
; Address: $FDDF32
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_228:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ASL $0504            ; 0E 04 05 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $06              ; A4 06 | Load from zero page into Y register
    BPL $70              ; 10 70 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$F4             ; E0 F4 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $8478            ; 6E 78 84 | Rotate right (absolute)
    PEA #$4002           ; F4 02 40 | Push effective address to stack
    BRA $0F              ; 80 0F | Branch always
    BVS $3C              ; 70 3C | Branch if overflow set
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ASL $1B38            ; 0E 38 1B | Arithmetic shift left (absolute)
    ROL $4E27            ; 2E 27 4E | Rotate left (absolute)
    ADC ($7E,X)          ; 61 7E | Add with carry ((zero page,X))
    EOR $2F              ; 45 2F | Exclusive OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_229
; Address: $FDDFB0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_229:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_22B
; Address: $FDDFC3
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_22B:
    BNE $6B              ; D0 6B | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    JMP $31CF            ; 4C CF 31 | Jump to address
    BRA $EF              ; 80 EF | Branch always
    ADC $D2              ; 65 D2 | Add with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    SBC $7BAD,Y          ; F9 AD 7B | Subtract with carry (absolute,Y)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP ($1E),Y          ; D1 1E | Compare accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    CPX #$79             ; E0 79 | Compare X register (immediate)
    STX $EF              ; 86 EF | Store X register to zero page
    ORA $0006,X          ; 1D 06 00 | Logical OR with accumulator (absolute,X)
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    CPX $901F            ; EC 1F 90 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 90 2C 19 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCC $90              ; 90 90 | Branch if carry clear
    BMI $C3              ; 30 C3 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_22C
; Address: $FDE01D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_22C:
    JSR $609E            ; 20 9E 60 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_22D
; Address: $FDE02A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_22D:
    JSR $5028            ; 20 28 50 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $B8              ; B0 B8 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $28              ; 10 28 | Branch if positive
    BPL $C8              ; 10 C8 | Branch if positive
    BPL $B8              ; 10 B8 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $271E,X          ; 1E 1E 27 | Arithmetic shift left (absolute,X)
    AND ($5D,X)          ; 21 5D | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_22E
; Address: $FDE04B
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_22E:
    RTI                  ; 40 | Return from interrupt
    LSR $5E42,X          ; 5E 42 5E | Logical shift right (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    ASL $2300,X          ; 1E 00 23 | Arithmetic shift left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $8C              ; 80 8C | Branch always
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA $3B11,Y          ; 19 11 3B | Logical OR with accumulator (absolute,Y)
    BPL $3F              ; 10 3F | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $00              ; 30 00 | Branch if negative
    ROR $817E,X          ; 7E 7E 81 | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Update graphics data
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    LDY #$90             ; A0 90 | Load immediate value into Y register
    BVC $C0              ; 50 C0 | Branch if overflow clear
    BMI $E0              ; 30 E0 | Game work RAM access
    ROR $A100,X          ; 7E 00 A1 | Rotate right (absolute,X)
    LSR $01FE,X          ; 5E FE 01 | Logical shift right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_22F
; Address: $FDE0C6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_22F:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BNE $20              ; D0 20 | Branch if not equal
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $F4              ; 10 F4 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_230
; Address: $FDE0EA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_230:
    JSL $585226          ; 22 26 52 58 | Jump to subroutine long
    JMP $0049            ; 4C 49 00 | Jump to address
    ASL $1E0F            ; 0E 0F 1E | Arithmetic shift left (absolute)
    ORA $2638,Y          ; 19 38 26 | Logical OR with accumulator (absolute,Y)
    ADC ($35),Y          ; 71 35 | Add with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_231
; Address: $FDE109
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_231:
    RTI                  ; 40 | Return from interrupt
    BRA $88              ; 80 88 | Branch always
    BCC $D4              ; 90 D4 | Branch if carry clear
    BCC $D2              ; 90 D2 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    BEQ $D4              ; F0 D4 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA $3D12,Y          ; 19 12 3D | Logical OR with accumulator (absolute,Y)
    AND $7721,X          ; 3D 21 77 | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $3200,X          ; 1E 00 32 | Arithmetic shift left (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    BRA $C0              ; 80 C0 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    LDY #$90             ; A0 90 | Load immediate value into Y register
    BVC $C0              ; 50 C0 | Branch if overflow clear
    ROL $FFC1,X          ; 3E C1 FF | Rotate left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_232
; Address: $FDE166
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_232:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BNE $20              ; D0 20 | Branch if not equal
    BNE $20              ; D0 20 | Branch if not equal
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $03              ; 10 03 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    CPY #$A1             ; C0 A1 | Compare Y register (immediate)
    LDX $167F,Y          ; BE 7F 16 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_233
; Address: $FDE1A8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_233:
    AND $AC              ; 25 AC | Logical AND with accumulator (zero page)
    EOR $51              ; 45 51 | Exclusive OR with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR $0706,Y          ; 59 06 07 | Exclusive OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BVS $3E              ; 70 3E | Branch if overflow set
    CPX #$A4             ; E0 A4 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCS $10              ; B0 10 | Branch if carry set
    PHX                  ; DA | Push X register to stack
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    STY $DDCD            ; 8C CD DD | Store Y register to absolute address
    ADC $606E,X          ; 7D 6E 60 | Add with carry (absolute,X)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_235
; Address: $FDE1DC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_235:
    JSL $008100          ; 22 00 81 00 | Jump to subroutine long
    CPX $3E              ; E4 3E | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_236
; Address: $FDE1E3
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_236:
    DEC $CF74,X          ; DE 74 CF | Decrement (absolute,X)
    CPX $F649            ; EC 49 F6 | Compare X register (absolute)
    LDA $FA              ; A5 FA | Read graphics status
    BEQ $CF              ; F0 CF | Branch if equal
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    REP #$C2             ; C2 C2 | Reset processor status bits
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    ASL $DA3F,X          ; 1E 3F DA | Arithmetic shift left (absolute,X)
    INC $FEC4,X          ; FE C4 FE | Increment (absolute,X)
    INC $FC08,X          ; FE 08 FC | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $F8              ; 10 F8 | Branch if positive
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    LSR $1D              ; 46 1D | Logical shift right (zero page)
    JMP $7C3D            ; 4C 3D 7C | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_237
; Address: $FDE22C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_237:
    ASL $37              ; 06 37 | Arithmetic shift left (zero page)
    ORA #$21             ; 09 21 | PPU graphics register access
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_238
; Address: $FDE241
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_238:
    BIT $92              ; 24 92 | Test bits in accumulator (zero page)
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    SBC ($F0,X)          ; E1 F0 | Subtract with carry ((zero page,X))
    SBC ($1B),Y          ; F1 1B | Subtract with carry ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    ORA $C0EE,X          ; 1D EE C0 | Logical OR with accumulator (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $1E00,X          ; FE 00 1E | Increment (absolute,X)
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_23A
; Address: $FDE264
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_23A:
    JSL $7C227D          ; 22 7D 22 7C | Jump to subroutine long
    ROL $7A              ; 26 7A | Rotate left (zero page)
    ROL $7B              ; 26 7B | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_23E
; Address: $FDE276
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_23E:
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_241
; Address: $FDE280
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_241:
    JSR $00C0            ; 20 C0 00 | Jump to subroutine
    INC $02              ; E6 02 | Increment (zero page)
    ROL $6E06,X          ; 3E 06 6E | Rotate left (absolute,X)
    AND $0847,Y          ; 39 47 08 | Logical AND with accumulator (absolute,Y)
    CMP #$1A             ; C9 1A | Compare accumulator (immediate)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ORA $C106,Y          ; 19 06 C1 | Logical OR with accumulator (absolute,Y)
    STA ($60),Y          ; 91 60 | Update graphics data
    LDX $3940,Y          ; BE 40 39 | Load from absolute,Y into X register
    LSR $0B              ; 46 0B | Logical shift right (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BIT $DCD8            ; 2C D8 DC | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BNE $F8              ; D0 F8 | Branch if not equal
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    CPX $08              ; E4 08 | Compare X register (zero page)
    BIT $0C00            ; 2C 00 0C | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    TXS                  ; 9A | Transfer X register to stack pointer
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    JMP ($5223)          ; 6C 23 52 | Jump to address (absolute indirect)
    JMP ($0300)          ; 6C 00 03 | Jump to address (absolute indirect)
    CPY $17              ; C4 17 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_242
; Address: $FDE2D6
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_242:
    BPL $00              ; 10 00 | Branch if positive
    BIT $0300            ; 2C 00 03 | Test bits in accumulator (absolute)
    BEQ $F2              ; F0 F2 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$F4F8           ; F4 F8 F4 | Push effective address to stack
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_243
; Address: $FDE300
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_243:
    JSR $4077            ; 20 77 40 | Jump to subroutine
    CPX $42              ; E4 42 | Hardware register operation
    SBC $FC42            ; ED 42 FC | Subtract with carry (absolute)
    WDM #$FE             ; 42 FE | Reserved instruction
    WDM #$F7             ; 42 F7 | Reserved instruction
    WDM #$F5             ; 42 F5 | Reserved instruction
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    BNE $00              ; D0 00 | Branch if not equal
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BMI $E0              ; 30 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_244
; Address: $FDE322
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_244:
    JSR $00C0            ; 20 C0 00 | Jump to subroutine
    INC $02              ; E6 02 | Increment (zero page)
    ROL $6E06,X          ; 3E 06 6E | Rotate left (absolute,X)
    AND $0847,Y          ; 39 47 08 | Logical AND with accumulator (absolute,Y)
    CMP #$1A             ; C9 1A | Compare accumulator (immediate)
    ORA $C106,Y          ; 19 06 C1 | Logical OR with accumulator (absolute,Y)
    STA ($60),Y          ; 91 60 | Update graphics data
    LDX $3940,Y          ; BE 40 39 | Load from absolute,Y into X register
    LSR $0B              ; 46 0B | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $18              ; 10 18 | Branch if positive
    BVS $78              ; 70 78 | Branch if overflow set
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_245
; Address: $FDE353
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_245:
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $F8              ; 10 F8 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    BEQ $4F              ; F0 4F | Branch if equal
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    STA                  ; 9F E7 CF 00 | Update graphics data
    BVS $08              ; 70 08 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    BPL $F8              ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_246
; Address: $FDE382
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_246:
    JSR $C0F0            ; 20 F0 C0 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    AND ($2F,X)          ; 21 2F | Logical AND with accumulator ((zero page,X))
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$F094           ; F4 94 F0 | Push effective address to stack
    BEQ $90              ; F0 90 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $3F              ; 10 3F | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_249
; Address: $FDE425
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_249:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_24A
; Address: $FDE436
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_24A:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $1C0E            ; 0E 0E 1C | Arithmetic shift left (absolute)
    ORA $1717,X          ; 1D 17 17 | Logical OR with accumulator (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX $EAA8            ; EC A8 EA | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    BCC $EA              ; 90 EA | Branch if carry clear
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_24B
; Address: $FDE482
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_24B:
    JSR $207F            ; 20 7F 20 | Jump to subroutine
    BPL $3F              ; 10 3F | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_24D
; Address: $FDE496
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_24D:
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $0700            ; 0E 00 07 | Arithmetic shift left (absolute)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_24F
; Address: $FDE4C2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_24F:
    JSR $40F0            ; 20 F0 40 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_250
; Address: $FDE4C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_250:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_252
; Address: $FDE4D8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_252:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_254
; Address: $FDE50E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_254:
    JSR $00C0            ; 20 C0 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_256
; Address: $FDE51E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_256:
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $32              ; 10 32 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $88              ; 80 88 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_257
; Address: $FDE549
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_257:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_258
; Address: $FDE55A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_258:
    JSR $00E4            ; 20 E4 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $0B              ; 80 0B | Branch always
    SEC                  ; 38 | Set carry flag
    BPL $36              ; 10 36 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_259
; Address: $FDE571
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_259:
    BPL $0C              ; 10 0C | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    INC $F0              ; E6 F0 | Increment (zero page)
    SEP #$D0             ; E2 D0 | Set processor status bits
    CPY $00F0            ; CC F0 00 | Compare Y register (absolute)
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    CPY $C1FD            ; CC FD C1 | Compare Y register (absolute)
    INC $B761            ; EE 61 B7 | Increment (absolute)
    ADC $0000,Y          ; 79 00 00 | Add with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BRA $98              ; 80 98 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BPL $08              ; 10 08 | Branch if positive
    BPL $18              ; 10 18 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_25B
; Address: $FDE5EC
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_25B:
    JSR $60C0            ; 20 C0 60 | Jump to subroutine
    BRA $0C              ; 80 0C | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $1C0E            ; 0E 0E 1C | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_25D
; Address: $FDE64F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_25D:
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_25E
; Address: $FDE65E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_25E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_25F
; Address: $FDE66F
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_25F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ADC $BA5E,X          ; 7D 5E BA | Add with carry (absolute,X)
    STZ $9C73            ; 9C 73 9C | Store zero to absolute
    LDA #$7E             ; A9 7E | Read graphics status
    BIT $006E            ; 2C 6E 00 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $100F            ; 0E 0F 10 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($A3),Y          ; 71 A3 | Add with carry ((zero page),Y)
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$10             ; C0 10 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_260
; Address: $FDE6C7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_260:
    JSR $30A0            ; 20 A0 30 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    BPL $01              ; 10 01 | Branch if positive
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)
    ASL $1C1C,X          ; 1E 1C 1C | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_261
; Address: $FDE714
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_261:
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BVS $70              ; 70 70 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BMI $B0              ; 30 B0 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_263
; Address: $FDE74C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_263:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BVS $0C              ; 70 0C | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    STZ $10              ; 64 10 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_264
; Address: $FDE75B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_264:
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$5E             ; C0 5E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ASL $0140            ; 0E 40 01 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_265
; Address: $FDE766
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_265:
    JSR $3260            ; 20 60 32 | Jump to subroutine
    ROL $0916,X          ; 3E 16 09 | Rotate left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BPL $10              ; 10 10 | Branch if positive
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    ASL $EB6A            ; 0E 6A EB | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL $E0FF            ; 0E FF E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BMI $0F              ; 30 0F | Branch if negative
    TXA                  ; 8A | Transfer X register to accumulator
    STA $87              ; 85 87 | Update graphics data
    EOR $494E            ; 4D 4E 49 | Exclusive OR with accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($30),Y          ; 11 30 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_266
; Address: $FDE7B0
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_266:
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    ROL $00              ; 26 00 | Rotate left (zero page)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BRA $C0              ; 80 C0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    STA ($C7,X)          ; 81 C7 | Update graphics data
    ASL $A0E0,X          ; 1E E0 A0 | Arithmetic shift left (absolute,X)
    BVS $B1              ; 70 B1 | Branch if overflow set
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $2000            ; 0E 00 20 | Arithmetic shift left (absolute)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    BPL $7C              ; 10 7C | Branch if positive
    ROR $BF9C,X          ; 7E 9C BF | Rotate right (absolute,X)
    INC $E0AF            ; EE AF E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    JMP ($1E0C)          ; 6C 0C 1E | Jump to address (absolute indirect)
    ASL $001E            ; 0E 1E 00 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    ROL $F233,X          ; 3E 33 F2 | Rotate left (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1C18,X          ; 1D 18 1C | Logical OR with accumulator (absolute,X)
    BPL $78              ; 10 78 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_267
; Address: $FDE826
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_267:
    JSR $8701            ; 20 01 87 | Jump to subroutine
    STZ $6020,X          ; 9E 20 60 | Store zero to absolute,X
    CLV                  ; B8 | Clear overflow flag
    SBC $AD6F,Y          ; F9 6F AD | Subtract with carry (absolute,Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STA                  ; 9F 00 06 00 | Update graphics data
    BPL $00              ; 10 00 | Branch if positive
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_268
; Address: $FDE84A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_268:
    BVS $98              ; 70 98 | Branch if overflow set
    LDY $BEB8,X          ; BC B8 BE | Load from absolute,X into Y register
    CLD                  ; D8 | Clear decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_269
; Address: $FDE85C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_269:
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    JMP $AEAE59          ; 5C 59 AE AE | Jump to address long
    BVC $9F              ; 50 9F | Branch if overflow clear
    ROR $3F8E,X          ; 7E 8E 3F | Rotate right (absolute,X)
    BPL $6E              ; 10 6E | Branch if positive
    ROL $0040,X          ; 3E 40 00 | Rotate left (absolute,X)
    ROL $7118,X          ; 3E 18 71 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_26A
; Address: $FDE875
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_26A:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $01              ; 10 01 | Branch if positive
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BMI $18              ; 30 18 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_26B
; Address: $FDE883
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_26B:
    JSR $E010            ; 20 10 E0 | Game work RAM access
    BCS $C0              ; B0 C0 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_26C
; Address: $FDE88A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_26C:
    BRA $80              ; 80 80 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_26E
; Address: $FDE89C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_26E:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    STZ $5C73            ; 9C 73 5C | Store zero to absolute
    AND #$BE             ; 29 BE | Logical AND with accumulator (immediate)
    CPX $00EE            ; EC EE 00 | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    ORA #$27             ; 09 27 | Logical OR with accumulator (immediate)
    AND ($2F,X)          ; 21 2F | Logical AND with accumulator ((zero page,X))
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    INC $D6DC            ; EE DC D6 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_26F
; Address: $FDE903
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_26F:
    CPX $E8D4            ; EC D4 E8 | Compare X register (absolute)
    INY                  ; C8 | Increment Y register
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ADC $3928            ; 6D 28 39 | Add with carry (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    NOP                  ; EA | No operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_270
; Address: $FDE963
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_270:
    PEA #$F8FC           ; F4 FC F8 | Push effective address to stack
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    LSR $FEA1            ; 4E A1 FE | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA #$F2             ; 09 F2 | Logical OR with accumulator (immediate)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    JMP ($1C22)          ; 6C 22 1C | Jump to address (absolute indirect)
    SBC $7828            ; ED 28 78 | Subtract with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    STZ $FAC8,X          ; 9E C8 FA | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_271
; Address: $FDE9C4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_271:
    PEA #$FCF0           ; F4 F0 FC | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    CPY #$FA             ; C0 FA | Compare Y register (immediate)
    ROR $FEA1            ; 6E A1 FE | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ROL $0406,X          ; 3E 06 04 | Rotate left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_273
; Address: $FDEA36
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_273:
    PHP                  ; 08 | Push processor status to stack
    ROR $817E,X          ; 7E 7E 81 | Rotate right (absolute,X)
    STA ($80,X)          ; 81 80 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVC $7E              ; 50 7E | Branch if overflow clear
    STA ($7E,X)          ; 81 7E | Update graphics data
    ROR $FF01,X          ; 7E 01 FF | Rotate right (absolute,X)
    LDA                  ; BF 00 BF 00 | Read graphics status
    LDA $0F3010          ; AF 10 30 0F | Read graphics status
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $87              ; 05 87 | Logical OR with accumulator (zero page)
    ORA $094E            ; 0D 4E 09 | Logical OR with accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($30),Y          ; 11 30 | Logical OR with accumulator ((zero page),Y)
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    ROL $00              ; 26 00 | Rotate left (zero page)
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    AND $7B39,X          ; 3D 39 7B | Logical AND with accumulator (absolute,X)
    ADC $45              ; 65 45 | Add with carry (zero page)
    EOR #$4E             ; 49 4E | Exclusive OR with accumulator (immediate)
    ORA $0035,X          ; 1D 35 00 | Logical OR with accumulator (absolute,X)
    ASL $3C18,X          ; 1E 18 3C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_274
; Address: $FDEA95
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_274:
    JSR $003A            ; 20 3A 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $1319            ; 0E 19 13 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $58              ; 06 58 | Arithmetic shift left (zero page)
    AND $DC              ; 25 DC | Logical AND with accumulator (zero page)
    ADC ($FA,X)          ; 61 FA | Add with carry ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_276
; Address: $FDEB07
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_276:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $89              ; 85 89 | Update graphics data
    CMP $0000            ; CD 00 00 | Compare accumulator (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_278
; Address: $FDEB2D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_278:
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_279
; Address: $FDEB40
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_279:
    JSR $217C            ; 20 7C 21 | PPU graphics register access
    ROR $7927,X          ; 7E 27 79 | Rotate right (absolute,X)
    AND $7B              ; 25 7B | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_27A
; Address: $FDEB4A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_27A:
    JSL $7C237D          ; 22 7D 23 7C | Jump to subroutine long
    AND ($7E,X)          ; 21 7E | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_281
; Address: $FDEB60
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_281:
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    STX $D93E            ; 8E 3E D9 | Store X register to absolute address
    AND #$D2             ; 29 D2 | Logical AND with accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    XBA                  ; EB | Exchange accumulator bytes
    TXS                  ; 9A | Transfer X register to stack pointer
    STA ($BF,X)          ; 81 BF | Update graphics data
    BPL $57              ; 10 57 | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_282
; Address: $FDEB73
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_282:
    JSR $2609            ; 20 09 26 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1B              ; 25 1B | Logical AND with accumulator (zero page)
    BIT $47              ; 24 47 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_283
; Address: $FDEB7B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_283:
    JSR $3046            ; 20 46 30 | Jump to subroutine
    BPL $04              ; 10 04 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    STY $9C18            ; 8C 18 9C | Store Y register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BCC $F8              ; 90 F8 | Branch if carry clear
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    CPX $8C00            ; EC 00 8C | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ADC $3828            ; 6D 28 38 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_284
; Address: $FDEBC7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_284:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA $0105,X          ; 1D 05 01 | Logical OR with accumulator (absolute,X)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $0405            ; 0D 05 04 | Logical OR with accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_285
; Address: $FDEC06
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_285:
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_286
; Address: $FDEC0A
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_286:
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $A0              ; 80 A0 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    AND $0C2A,X          ; 3D 2A 0C | Logical AND with accumulator (absolute,X)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA $6B22,Y          ; 19 22 6B | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    SBC $7B              ; E5 7B | Subtract with carry (zero page)
    SBC $8303,X          ; FD 03 83 | Subtract with carry (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    ROR $67              ; 66 67 | Rotate right (zero page)
    ORA $000F            ; 0D 0F 00 | Logical OR with accumulator (absolute)
    STA ($00,X)          ; 81 00 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    BCC $80              ; 90 80 | Branch if carry clear
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BNE $70              ; D0 70 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_287
; Address: $FDEC90
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_287:
    BEQ $40              ; F0 40 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_288
; Address: $FDEC98
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_288:
    JSR $F000            ; 20 00 F0 | Jump to subroutine
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BMI $CF              ; 30 CF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_289
; Address: $FDECC0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_289:
    JSR $2420            ; 20 20 24 | Jump to subroutine
    BIT $48              ; 24 48 | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_28A
; Address: $FDECD1
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_28A:
    JSR $3410            ; 20 10 34 | Jump to subroutine
    BMI $78              ; 30 78 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    ROR $FCA8,X          ; 7E A8 FC | Rotate right (absolute,X)
    BCS $F8              ; B0 F8 | Branch if carry set
    BCS $F8              ; B0 F8 | Branch if carry set
    BCS $F0              ; B0 F0 | Branch if carry set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    LSR $214E            ; 4E 4E 21 | PPU graphics register access
    AND ($06,X)          ; 21 06 | Logical AND with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $317F,X          ; 3E 7F 31 | Rotate left (absolute,X)
    ASL $003F,X          ; 1E 3F 00 | Arithmetic shift left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $30              ; 30 30 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $30              ; 30 30 | Branch if negative
    SEC                  ; 38 | Set carry flag
    BMI $3C              ; 30 3C | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ROL $3E34,X          ; 3E 34 3E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_28B
; Address: $FDED20
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_28B:
    ASL $020E            ; 0E 0E 02 | Arithmetic shift left (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $041D,X          ; 1D 1D 04 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $0604            ; 0E 04 06 | Arithmetic shift left (absolute)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $140A,X          ; 1D 0A 14 | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ASL $0E1E            ; 0E 1E 0E | Arithmetic shift left (absolute)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)
    ASL $2323,X          ; 1E 23 23 | Arithmetic shift left (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    BVC $DC              ; 50 DC | Branch if overflow clear
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    STY $BF              ; 84 BF | Store Y register to zero page
    STX $BF              ; 86 BF | Store X register to zero page
    LDA                  ; BF 83 1E 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_28C
; Address: $FDED75
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_28C:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    LDA                  ; BF 44 BF 46 | Read graphics status
    LDA                  ; BF 47 BF 43 | Read graphics status
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_28D
; Address: $FDED88
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_28D:
    JSR $1030            ; 20 30 10 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BRA $08              ; 80 08 | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    INX                  ; E8 | Increment X register
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_28E
; Address: $FDEDC9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_28E:
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    CPY $F0              ; C4 F0 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BPL $18              ; 10 18 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $210C,X          ; 1E 0C 21 | PPU graphics register access
    AND $2E61,Y          ; 39 61 2E | Logical AND with accumulator (absolute,Y)
    WDM #$1E             ; 42 1E | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    ORA $0047,Y          ; 19 47 00 | Logical OR with accumulator (absolute,Y)
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_28F
; Address: $FDEDFE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_28F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($30),Y          ; 11 30 | Logical OR with accumulator ((zero page),Y)
    ROL $60              ; 26 60 | Rotate left (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR $4BC0            ; 4D C0 4B | Exclusive OR with accumulator (absolute)
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_290
; Address: $FDEE43
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_290:
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    ASL $1BFA,X          ; 1E FA 1B | Arithmetic shift left (absolute,X)
    NOP                  ; EA | No operation
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $1313            ; 0E 13 13 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_291
; Address: $FDEE76
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_291:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $20              ; 80 20 | Branch always
    BMI $60              ; 30 60 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    BRA $84              ; 80 84 | Branch always
    BRA $04              ; 80 04 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $060E            ; 0E 0E 06 | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $AF              ; 06 AF | Arithmetic shift left (zero page)
    BRA $A3              ; 80 A3 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 40 9F 40 | Read graphics status
    STA                  ; 9F 40 5F 20 | Update graphics data
    BRA $04              ; 80 04 | Branch always
    ROR $00              ; 66 00 | Rotate right (zero page)
    WDM #$20             ; 42 20 | Reserved instruction
    ROL $2B22            ; 2E 22 2B | Rotate left (absolute)
    ROL $77              ; 26 77 | Rotate left (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BVS $C4              ; 70 C4 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    LDY $A85C            ; AC 5C A8 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_292
; Address: $FDEEF9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_292:
    JMP $FC08F4          ; 5C F4 08 FC | Jump to address long
    LDY $B000,X          ; BC 00 B0 | Load from absolute,X into Y register
    PLA                  ; 68 | Pull accumulator from stack
    INY                  ; C8 | Increment Y register
    CPX $8C              ; E4 8C | Compare X register (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_293
; Address: $FDEF16
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_293:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $2F              ; 10 2F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $1807            ; 0E 07 18 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDY #$60             ; A0 60 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $C475            ; 0E 75 C4 | Arithmetic shift left (absolute)
    SBC $3F30,Y          ; F9 30 3F | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BCC $00              ; 90 00 | Branch if carry clear
    CPX $D816            ; EC 16 D8 | Compare X register (absolute)
    BEQ $38              ; F0 38 | Branch if equal
    LDY #$30             ; A0 30 | Load immediate value into Y register
    BRA $20              ; 80 20 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $08              ; 80 08 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BMI $5D              ; 30 5D | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_294
; Address: $FDEFD4
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_294:
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BVC $58              ; 50 58 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    JMP $0CF8            ; 4C F8 0C | Jump to address
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$F4             ; E0 F4 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $58              ; F0 58 | Branch if equal
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BPL $50              ; 10 50 | Branch if positive
    BPL $50              ; 10 50 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_295
; Address: $FDF031
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_295:
    JSR $204F            ; 20 4F 20 | Jump to subroutine
    BPL $27              ; 10 27 | Branch if positive
    BPL $13              ; 10 13 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_296
; Address: $FDF040
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_296:
    JSL $1F023F          ; 22 3F 02 1F | Jump to subroutine long
    ROL $7E3F,X          ; 3E 3F 7E | Rotate left (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $00D8,X          ; FE D8 00 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $B9B1,Y          ; 19 B1 B9 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_297
; Address: $FDF086
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_297:
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BVS $74              ; 70 74 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROL $E001,X          ; 3E 01 E0 | Game work RAM access
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    ASL $E001,X          ; 1E 01 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BIT $5C20            ; 2C 20 5C | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LSR $BF40,X          ; 5E 40 BF | Logical shift right (absolute,X)
    LDA                  ; BF 87 00 00 | Read graphics status
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BPL $5F              ; 10 5F | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_298
; Address: $FDF119
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_298:
    JSR $205F            ; 20 5F 20 | Jump to subroutine
    LDA                  ; BF 42 BF 47 | Read graphics status
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $18              ; 10 18 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    BRA $01              ; 80 01 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FC78,X          ; FE 78 FC | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STX $FC00            ; 8E 00 FC | Store X register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    CMP $E3C1,X          ; DD C1 E3 | Compare accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_299
; Address: $FDF170
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_299:
    JSL $000000          ; 22 00 00 00 | Jump to subroutine long
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_29A
; Address: $FDF1B6
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_29A:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $E2              ; 30 E2 | Branch if negative
    SBC ($A8),Y          ; F1 A8 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $9280,X          ; 1D 80 92 | Logical OR with accumulator (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $92E2,X          ; 1D E2 92 | Logical OR with accumulator (absolute,X)
    ADC ($E1,X)          ; 61 E1 | Add with carry ((zero page,X))
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $E0FE,X          ; FE FE E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDA                  ; BF 87 BF 83 | Read graphics status
    BRA $81              ; 80 81 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    LDA                  ; BF 43 BF 40 | Read graphics status
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 40 9F 40 | Read graphics status
    STA                  ; 9F 40 81 01 | Update graphics data
    STA ($21,X)          ; 81 21 | PPU graphics register access
    ORA $2159,Y          ; 19 59 21 | PPU graphics register access
    ADC #$21             ; 69 21 | PPU graphics register access
    ADC $2921,X          ; 7D 21 29 | Add with carry (absolute,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    INC $DE30            ; EE 30 DE | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_29B
; Address: $FDF256
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_29B:
    NOP                  ; EA | No operation
    JMP $A85EFC          ; 5C FC 5E A8 | Jump to address long
    LSR $5EA0,X          ; 5E A0 5E | Logical shift right (absolute,X)
    BIT $8000            ; 2C 00 80 | Test bits in accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_29C
; Address: $FDF276
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_29C:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_29F
; Address: $FDF286
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_29F:
    ASL $3B26            ; 0E 26 3B | Arithmetic shift left (absolute)
    ADC ($2F,X)          ; 61 2F | Add with carry ((zero page,X))
    WDM #$1E             ; 42 1E | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2A1
; Address: $FDF2AE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2A1:
    LDY #$E0             ; A0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ADC $7A81,Y          ; 79 81 7A | Add with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    BCC $07              ; 90 07 | Branch if carry clear
    LSR $001C,X          ; 5E 1C 00 | Logical shift right (absolute,X)
    ROL $7C00,X          ; 3E 00 7C | Rotate left (absolute,X)
    ROR $7C00,X          ; 7E 00 7C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2A2
; Address: $FDF2D9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2A2:
    JSR $307B            ; 20 7B 30 | Jump to subroutine
    BPL $21              ; 10 21 | PPU graphics register access
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2A3
; Address: $FDF2EE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2A3:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $3B0D            ; 0D 0D 3B | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    EOR $2F58,Y          ; 59 58 2F | Exclusive OR with accumulator (absolute,Y)
    LDA $000000          ; AF 00 00 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2A5
; Address: $FDF327
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2A5:
    CLC                  ; 18 | Clear carry flag
    PEA #$F8F4           ; F4 F4 F8 | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    CPX $00EC            ; EC EC 00 | Compare X register (absolute)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ROL $1F00,X          ; 3E 00 1F | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ROL $1F3E,X          ; 3E 3E 1F | Rotate left (absolute,X)
    ASL $1A0E            ; 0E 0E 1A | Arithmetic shift left (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $9A00            ; 0E 00 9A | Arithmetic shift left (absolute)
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $0F08            ; 0D 08 0F | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BNE $10              ; D0 10 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$E404           ; F4 04 E4 | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2A8
; Address: $FDF3D5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2A8:
    JSR $102F            ; 20 2F 10 | Jump to subroutine
    BPL $13              ; 10 13 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    AND ($2F,X)          ; 21 2F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2A9
; Address: $FDF3E4
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2A9:
    BPL $1F              ; 10 1F | Branch if positive
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    INC $FE10            ; EE 10 FE | Increment (absolute)
    CPX $00              ; E4 00 | Compare X register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B0
; Address: $FDF41E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B0:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $D0              ; 50 D0 | Branch if overflow clear
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    LDY #$68             ; A0 68 | Load immediate value into Y register
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B2
; Address: $FDF450
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B2:
    JSR $1004            ; 20 04 10 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ASL $1C              ; 06 1C | Arithmetic shift left (zero page)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B3
; Address: $FDF460
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B3:
    ASL $0336            ; 0E 36 03 | Arithmetic shift left (absolute)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    STX $B0              ; 86 B0 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B4
; Address: $FDF487
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B4:
    DEC                  ; 3A | Decrement accumulator
    CPY #$C2             ; C0 C2 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX $2E10            ; EC 10 2E | Compare X register (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $80              ; E6 80 | Increment (zero page)
    DEX                  ; CA | Decrement X register
    PLP                  ; 28 | Pull processor status from stack
    CPX $3E1C            ; EC 1C 3E | Compare X register (absolute)
    ASL $A383,X          ; 1E 83 A3 | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $1F              ; 80 1F | Branch always
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    JMP $8057A8          ; 5C A8 57 80 | Jump to address long
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPX $42EC            ; EC EC 42 | Hardware register operation
    WDM #$3D             ; 42 3D | Reserved instruction
    AND ($E2,X)          ; 21 E2 | Logical AND with accumulator ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $1E              ; 80 1E | Branch always
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL $E6              ; 26 E6 | Rotate left (zero page)
    CPX $7838            ; EC 38 78 | Compare X register (absolute)
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    WDM #$C6             ; 42 C6 | Reserved instruction
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    INC $98              ; E6 98 | Increment (zero page)
    CPX $78D0            ; EC D0 78 | Compare X register (absolute)
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    DEC $38              ; C6 38 | Decrement (zero page)
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B5
; Address: $FDF521
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B5:
    JSR $4073            ; 20 73 40 | Jump to subroutine
    ADC ($40),Y          ; 71 40 | Add with carry ((zero page),Y)
    BVC $C0              ; 50 C0 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B6
; Address: $FDF529
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B6:
    CPX #$11             ; E0 11 | Compare X register (immediate)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CMP $001C,X          ; DD 1C 00 | Compare accumulator (absolute,X)
    ROL $3F00,X          ; 3E 00 3F | Rotate left (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B7
; Address: $FDF540
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B7:
    CPX $04              ; E4 04 | Compare X register (zero page)
    SEP #$02             ; E2 02 | Set processor status bits
    REP #$02             ; C2 02 | Reset processor status bits
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $CEFF,X          ; 1E FF CE | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    WDM #$29             ; 42 29 | Reserved instruction
    LDA #$00             ; A9 00 | Read graphics status
    EOR ($3C,X)          ; 41 3C | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PEA #$9874           ; F4 74 98 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $78FF,X          ; FE FF 78 | Increment (absolute,X)
    STA ($00,X)          ; 81 00 | Update graphics data
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    LSR $0C              ; 46 0C | Logical shift right (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $6F3E,X          ; 5E 3E 6F | Logical shift right (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B8
; Address: $FDF62C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B8:
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2B9
; Address: $FDF638
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2B9:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVS $70              ; 70 70 | Branch if overflow set
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ROL $96DF            ; 2E DF 96 | Rotate left (absolute)
    CPX $E8D4            ; EC D4 E8 | Compare X register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $17              ; 80 17 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLB                  ; AB | Pull data bank register from stack
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BCS $BC              ; B0 BC | Branch if carry set
    BEQ $F2              ; F0 F2 | Branch if equal
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BCS $00              ; B0 00 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BPL $2F              ; 10 2F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STZ $64              ; 64 64 | Store zero to zero page
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA $0E0E,X          ; 1D 0E 0E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2BA
; Address: $FDF714
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2BA:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CPX #$84             ; E0 84 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    REP #$04             ; C2 04 | Reset processor status bits
    SBC ($02,X)          ; E1 02 | Subtract with carry ((zero page,X))
    BEQ $01              ; F0 01 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2BB
; Address: $FDF720
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2BB:
    JSR $3018            ; 20 18 30 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $060E            ; 0E 0E 06 | Arithmetic shift left (absolute)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1B1E            ; 0E 1E 1B | Arithmetic shift left (absolute)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $58              ; 06 58 | Arithmetic shift left (zero page)
    AND $C4              ; 25 C4 | Logical AND with accumulator (zero page)
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))
    CMP $00E3,X          ; DD E3 00 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2BC
; Address: $FDF776
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2BC:
    JSR $1A00            ; 20 00 1A | Jump to subroutine
    ASL $8400            ; 0E 00 84 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    STA $DECD            ; 8D CD DE | Update graphics data
    ADC $006C,Y          ; 79 6C 00 | Add with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $2F              ; 80 2F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 40 BF 40 | Read graphics status
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    SEP #$52             ; E2 52 | Set processor status bits
    CMP ($21,X)          ; C1 21 | PPU graphics register access
    BRA $2C              ; 80 2C | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2BD
; Address: $FDF7CD
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2BD:
    JMP $6040            ; 4C 40 60 | Jump to address
    BRA $FF              ; 80 FF | Branch always
    BRA $F9              ; 80 F9 | Branch always
    DEC $5DF2            ; CE F2 5D | Decrement (absolute)
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    LDY $CC7F            ; AC 7F CC | Load from absolute address into Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SBC $F800,Y          ; F9 00 F8 | Subtract with carry (absolute,Y)
    BRA $DC              ; 80 DC | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2C1
; Address: $FDF820
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2C1:
    ORA $0E12            ; 0D 12 0E | Logical OR with accumulator (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ROL $37              ; 26 37 | Rotate left (zero page)
    LSR $3C03,X          ; 5E 03 3C | Logical shift right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2C3
; Address: $FDF843
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2C3:
    JSR $F0E0            ; 20 E0 F0 | Jump to subroutine
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BNE $E0              ; D0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC #$44             ; 69 44 | Add with carry (immediate)
    DEC $02              ; C6 02 | Decrement (zero page)
    ASL $1406            ; 0E 06 14 | Arithmetic shift left (absolute)
    ASL $1E36            ; 0E 36 1E | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $40              ; F0 40 | Branch if equal
    BNE $00              ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2C5
; Address: $FDF887
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2C5:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ROL $172E            ; 2E 2E 17 | Rotate left (absolute)
    STA                  ; 9F 40 BF 40 | Update graphics data

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2C6
; Address: $FDF8B5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2C6:
    JSR $204F            ; 20 4F 20 | Jump to subroutine
    BPL $21              ; 10 21 | PPU graphics register access
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2C7
; Address: $FDF8C0
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2C7:
    JSR $1071            ; 20 71 10 | Jump to subroutine
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ROR $FEFF,X          ; 7E FF FE | Rotate right (absolute,X)
    INC $00C8,X          ; FE C8 00 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2C9
; Address: $FDF914
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2C9:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2CA
; Address: $FDF952
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2CA:
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    BEQ $FC              ; F0 FC | Branch if equal
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SBC ($FB),Y          ; F1 FB | Subtract with carry ((zero page),Y)
    SBC $FCFF,Y          ; F9 FF FC | Subtract with carry (absolute,Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($FB,X)          ; E1 FB | Subtract with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    INC $7FFF,X          ; FE FF 7F | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ROR $BE7F,X          ; 7E 7F BE | Rotate right (absolute,X)
    BRA $BE              ; 80 BE | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2CB
; Address: $FDFA5F
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2CB:
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2CC
; Address: $FDFA8A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2CC:
    ASL $1012,X          ; 1E 12 10 | Arithmetic shift left (absolute,X)
    ASL $1F00,X          ; 1E 00 1F | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1002,X          ; 1E 02 10 | Arithmetic shift left (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2CE
; Address: $FDFAA4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2CE:
    BVS $1C              ; 70 1C | Branch if overflow set
    EOR ($5E,X)          ; 41 5E | Exclusive OR with accumulator ((zero page,X))
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D0
; Address: $FDFAB8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D0:
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA $0D02            ; 0D 02 0D | Logical OR with accumulator (absolute)
    WDM #$8D             ; 42 8D | Reserved instruction

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D1
; Address: $FDFACA
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D1:
    JSL $7C83CD          ; 22 CD 83 7C | Jump to subroutine long
    INC $1101,X          ; FE 01 11 | Increment (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    LDX $00              ; A6 00 | Load from zero page into X register
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3F31            ; 0E 31 3F | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    STY $70              ; 84 70 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D2
; Address: $FDFB4F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D2:
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$80             ; E0 80 | Compare X register (immediate)
    SBC #$88             ; E9 88 | Subtract with carry (immediate)
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    CMP $FF1C,X          ; DD 1C FF | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D3
; Address: $FDFB89
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D3:
    JSR $7FFF            ; 20 FF 7F | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC $E01D,X          ; FE 1D E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BMI $17              ; 30 17 | Branch if negative
    ASL $3FC0            ; 0E C0 3F | Arithmetic shift left (absolute)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    ORA $FF0F,Y          ; 19 0F FF | Logical OR with accumulator (absolute,Y)
    STA                  ; 9F FF 7F 7F | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    ASL $0F0A            ; 0E 0A 0F | Arithmetic shift left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $1E08,X          ; 1E 08 1E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BPL $1B              ; 10 1B | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D4
; Address: $FDFBE3
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D4:
    JSR $401D            ; 20 1D 40 | Jump to subroutine
    ADC $6F80            ; 6D 80 6F | Add with carry (absolute)
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    STA ($E3,X)          ; 81 E3 | Update graphics data
    INC $FE7E,X          ; FE 7E FE | Increment (absolute,X)
    ASL $80FC,X          ; 1E FC 80 | Arithmetic shift left (absolute,X)
    DEC $DD              ; C6 DD | Decrement (zero page)
    ASL $43F3            ; 0E F3 43 | Arithmetic shift left (absolute)
    INC $6BC1,X          ; FE C1 6B | Increment (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    LDY $78FE,X          ; BC FE 78 | Load from absolute,X into Y register
    ROL $7FDC,X          ; 3E DC 7F | Rotate left (absolute,X)
    LDA                  ; BF E3 FF F0 | Read graphics status
    CPX $5C02            ; EC 02 5C | Compare X register (absolute)
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D5
; Address: $FDFC27
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D5:
    LDY #$DB             ; A0 DB | Load immediate value into Y register
    CPY #$D4             ; C0 D4 | Compare Y register (immediate)
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    LDA                  ; BF 3F BC 1F | Read graphics status
    STA                  ; 9F 81 08 00 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D6
; Address: $FDFC4A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D6:
    SED                  ; F8 | Set decimal mode flag
    BNE $F0              ; D0 F0 | Branch if not equal
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDY $FC08,X          ; BC 08 FC | Load from absolute,X into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    BPL $FC              ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D7
; Address: $FDFC5B
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D7:
    JSR $40F8            ; 20 F8 40 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    JMP $0010            ; 4C 10 00 | Jump to address
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BMI $34              ; 30 34 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    AND $75C6,Y          ; 39 C6 75 | Logical AND with accumulator (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D8
; Address: $FDFCA4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D8:
    SBC $AF12            ; ED 12 AF | Subtract with carry (absolute)
    BVC $3E              ; 50 3E | Branch if overflow clear
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ROL $817E,X          ; 3E 7E 81 | Rotate left (absolute,X)
    ROR $00C6,X          ; 7E C6 00 | Rotate right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $00              ; 50 00 | Branch if overflow clear
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ROL $8100,X          ; 3E 00 81 | Rotate left (absolute,X)
    ROR $E000,X          ; 7E 00 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STY $02              ; 84 02 | Store Y register to zero page
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2D9
; Address: $FDFCD2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2D9:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $33              ; 80 33 | Branch always
    ASL $3400            ; 0E 00 34 | Arithmetic shift left (absolute)
    BCC $6F              ; 90 6F | Branch if carry clear
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2DA
; Address: $FDFD08
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2DA:
    JSL $B24CDD          ; 22 DD 4C B2 | Jump to subroutine long
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $B0              ; A4 B0 | Load from zero page into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    STA ($00),Y          ; 91 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2DB
; Address: $FDFD1A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2DB:
    JSL $002400          ; 22 00 24 00 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$C0             ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2DC
; Address: $FDFD25
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2DC:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CPY $20              ; C4 20 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2DD
; Address: $FDFD32
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2DD:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPX #$18             ; E0 18 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E0
; Address: $FDFD6A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E0:
    JSR $4040            ; 20 40 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    DEC $20              ; C6 20 | Decrement (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $44              ; 30 44 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ASL $0F1F            ; 0E 1F 0F | Arithmetic shift left (absolute)
    LDA                  ; BF 6F 7F AF | Read graphics status
    INC $2E3F,X          ; FE 3F 2E | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ROL $FC              ; 26 FC | Rotate left (zero page)
    ASL $0CF0            ; 0E F0 0C | Arithmetic shift left (absolute)
    BEQ $A0              ; F0 A0 | Branch if equal

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E1
; Address: $FDFDD8
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E1:
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    CMP ($F1),Y          ; D1 F1 | Compare accumulator ((zero page),Y)
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    ROL $0880,X          ; 3E 80 08 | Rotate left (absolute,X)
    BRA $C1              ; 80 C1 | Branch always
    CMP ($E3,X)          ; C1 E3 | Compare accumulator ((zero page,X))
    ROL $FF3E,X          ; 3E 3E FF | Rotate left (absolute,X)
    ROL $1C3E,X          ; 3E 3E 1C | Rotate left (absolute,X)
    CMP #$C9             ; C9 C9 | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    SBC $FBFC,X          ; FD FC FB | Subtract with carry (absolute,X)
    INC $FFFB,X          ; FE FB FF | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    INC $7EBE,X          ; FE BE 7E | Increment (absolute,X)
    AND $8FFD,X          ; 3D FD 8F | Logical AND with accumulator (absolute,X)
    STA                  ; 9F B0 07 18 | Update graphics data
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    STA $C24745          ; 8F 45 47 C2 | Update graphics data
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    CPX #$28             ; E0 28 | Compare X register (immediate)
    CMP ($C8,X)          ; C1 C8 | Compare accumulator ((zero page,X))
    ORA $0D16            ; 0D 16 0D | Logical OR with accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SBC $FFFC,Y          ; F9 FC FF | Subtract with carry (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    BEQ $F7              ; F0 F7 | Branch if equal
    BRA $0F              ; 80 0F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E2
; Address: $FDFE4A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E2:
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    SBC $778F,X          ; FD 8F 77 | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E3
; Address: $FDFE5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E3:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BVS $90              ; 70 90 | Branch if overflow set
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E4
; Address: $FDFE6E
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E4:
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$78             ; E0 78 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BPL $10              ; 10 10 | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    BPL $07              ; 10 07 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $C8              ; 30 C8 | Branch if negative
    BVC $AC              ; 50 AC | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    SED                  ; F8 | Set decimal mode flag
    STZ $8C              ; 64 8C | Store zero to zero page
    BRA $60              ; 80 60 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E6
; Address: $FDFF3E
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E6:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    PEA #$FA0E           ; F4 0E FA | Push effective address to stack
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BMI $FE              ; 30 FE | Branch if negative
    INY                  ; C8 | Increment Y register
    PEA #$FAFF           ; F4 FF FA | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STA ($C0,X)          ; 81 C0 | Update graphics data
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    ROL $FF18,X          ; 3E 18 FF | Rotate left (absolute,X)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BVS $4F              ; 70 4F | Branch if overflow set
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    SBC $F807,X          ; FD 07 F8 | Subtract with carry (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$07             ; E0 07 | Compare X register (immediate)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    PLX                  ; FA | Pull X register from stack
    CMP $3E3F            ; CD 3F 3E | Compare accumulator (absolute)
    SBC $EDFD,Y          ; F9 FD ED | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ORA $3EFD            ; 0D FD 3E | Logical OR with accumulator (absolute)
    INC $FFF3,X          ; FE F3 FF | Increment (absolute,X)
    EOR $B6BE,X          ; 5D BE B6 | Exclusive OR with accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E7
; Address: $FDFFE7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E7:
    STZ $FF00            ; 9C 00 FF | Store zero to absolute
    STZ $887F            ; 9C 7F 88 | Store zero to absolute
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank7A_GraphicsFunction_2E8
; Address: $FDFFF1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank7A_GraphicsFunction_2E8:
    EOR #$EB             ; 49 EB | Exclusive OR with accumulator (immediate)
    BRA $80              ; 80 80 | Branch always
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    LDX #$22             ; A2 22 | Load immediate value into X register
    LDX #$36             ; A2 36 | Load immediate value into X register
    BRA $1C              ; 80 1C | Branch always
