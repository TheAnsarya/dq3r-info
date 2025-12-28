;==============================================================================
; Dragon Quest III - Bank $5E
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $EF0000-$EF7FFF
; Instructions: 7996
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_5E"

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_000
; Address: $EF800E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_000:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF F0 0F 18 | Read graphics status
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ADC $FD02,X          ; 7D 02 FD | Add with carry (absolute,X)
    SBC $E718,X          ; FD 18 E7 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_002
; Address: $EF8064
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_002:
    JSR $FE20            ; 20 20 FE | Jump to subroutine
    INC $4C4C,X          ; FE 4C 4C | Increment (absolute,X)
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    CPX $1FEC            ; EC EC 1F | Compare X register (absolute)
    SEP #$1D             ; E2 1D | Set processor status bits
    CPX #$09             ; E0 09 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    INC $E6              ; E6 E6 | Increment (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    ORA $FC00,Y          ; 19 00 FC | Logical OR with accumulator (absolute,Y)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    CMP $FF00,Y          ; D9 00 FF | Compare accumulator (absolute,Y)
    ASL $C000            ; 0E 00 C0 | Arithmetic shift left (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    CMP $3FCD            ; CD CD 3F | Compare accumulator (absolute)
    SEP #$00             ; E2 00 | Set processor status bits
    INC $03FE,X          ; FE FE 03 | Increment (absolute,X)
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $6700            ; CC 00 67 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $FF9C            ; 9C 9C FF | Store zero to absolute
    PLX                  ; FA | Pull X register from stack
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_003
; Address: $EF816A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_003:
    ROL $BB00            ; 2E 00 BB | Rotate left (absolute)
    ADC $65              ; 65 65 | Add with carry (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    SEC                  ; 38 | Set carry flag
    LDA                  ; BF 00 F7 00 | Read graphics status
    LDA                  ; BF BF FF 00 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 1C 00 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    LDY $00              ; A4 00 | Load from zero page into Y register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    STZ $04              ; 64 04 | Store zero to zero page
    STZ $009C            ; 9C 9C 00 | Store zero to absolute
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    EOR $0606,Y          ; 59 06 06 | Exclusive OR with accumulator (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ROL $BB02            ; 2E 02 BB | Rotate left (absolute)
    ADC $65              ; 65 65 | Add with carry (zero page)
    LDX $00              ; A6 00 | Load from zero page into X register
    SBC $3F00,Y          ; F9 00 3F | Subtract with carry (absolute,Y)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_004
; Address: $EF8201
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_004:
    JSR $00CF            ; 20 CF 00 | Jump to subroutine
    JMP ($6C60)          ; 6C 60 6C | Jump to address (absolute indirect)
    ROR $58E1,X          ; 7E E1 58 | Rotate right (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_006
; Address: $EF8220
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_006:
    STA $009F50          ; 8F 50 9F 00 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    STZ $78              ; 64 78 | Store zero to zero page
    DEC $30E1,X          ; DE E1 30 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_008
; Address: $EF8237
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_008:
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $992C            ; 2C 2C 99 | Test bits in accumulator (absolute)
    STA                  ; 9F 50 7F 06 | Update graphics data
    DEC $3F              ; C6 3F | Decrement (zero page)
    AND $1E1E,Y          ; 39 1E 1E | Logical AND with accumulator (absolute,Y)
    LDA $007F20          ; AF 20 7F 00 | Read graphics status
    AND $6205,X          ; 3D 05 62 | Logical AND with accumulator (absolute,X)
    WDM #$42             ; 42 42 | Hardware register operation
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_009
; Address: $EF8276
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_009:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $1D              ; 80 1D | Branch always
    BRA $3D              ; 80 3D | Branch always
    INC $00              ; E6 00 | Increment (zero page)
    STY $3F8C            ; 8C 8C 3F | Store Y register to absolute address
    BVS $05              ; 70 05 | Branch if overflow set
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    BVS $7F              ; 70 7F | Branch if overflow set
    BRA $0F              ; 80 0F | Branch always
    BRA $02              ; 80 02 | Branch always
    SED                  ; F8 | Set decimal mode flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    AND $CF00,Y          ; 39 00 CF | Logical AND with accumulator (absolute,Y)
    LSR $FF5E,X          ; 5E 5E FF | Logical shift right (absolute,X)
    LDA ($00,X)          ; A1 00 | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA $0000,X          ; 1D 00 00 | Logical OR with accumulator (absolute,X)
    BVS $70              ; 70 70 | Branch if overflow set
    ORA $E000            ; 0D 00 E0 | Game work RAM access
    STA $00FF00          ; 8F 00 FF 00 | Update graphics data
    AND $0000            ; 2D 00 00 | Logical AND with accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_00A
; Address: $EF8335
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_00A:
    STA                  ; 9F 00 00 00 | Update graphics data
    CMP $C4              ; C5 C4 | Compare accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_00B
; Address: $EF8353
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_00B:
    JSR $0700            ; 20 00 07 | Jump to subroutine
    INC $3D00,X          ; FE 00 3D | Increment (absolute,X)
    AND $0000            ; 2D 00 00 | Logical AND with accumulator (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    BRA $1B              ; 80 1B | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_00C
; Address: $EF837D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_00C:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $6C              ; 10 6C | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_00F
; Address: $EF8397
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_00F:
    SEI                  ; 78 | Set interrupt disable flag
    BMI $0F              ; 30 0F | Branch if negative
    BMI $0F              ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_010
; Address: $EF83A4
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_010:
    JSR $0FD8            ; 20 D8 0F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA $5CB9,Y          ; B9 B9 5C | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    BNE $D0              ; D0 D0 | Branch if not equal
    LDA                  ; BF 00 E5 00 | Read graphics status
    BRA $1B              ; 80 1B | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $3E3E0F          ; AF 0F 3E 3E | Read graphics status
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    BVS $70              ; 70 70 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STA ($81,X)          ; 81 81 | Update graphics data
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCS $B0              ; B0 B0 | Branch if carry set
    STZ $FF00            ; 9C 00 FF | Store zero to absolute
    STA $00E700          ; 8F 00 E7 00 | Update graphics data
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    INC $4F00,X          ; FE 00 4F | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_011
; Address: $EF8480
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_011:
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    AND $C039,Y          ; 39 39 C0 | Logical AND with accumulator (absolute,Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    DEC $00              ; C6 00 | Decrement (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    SBC $00FF,X          ; FD FF 00 | Subtract with carry (absolute,X)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $07              ; 80 07 | Branch always
    INC $000E            ; EE 0E 00 | Increment (absolute)
    BRA $BF              ; 80 BF | Branch always
    BRA $00              ; 80 00 | Branch always
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $01              ; F0 01 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $00              ; C6 00 | Decrement (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    AND $0000,Y          ; 39 00 00 | Logical AND with accumulator (absolute,Y)
    STZ $079E,X          ; 9E 9E 07 | Store zero to absolute,X
    EOR $4959,Y          ; 59 59 49 | Exclusive OR with accumulator (absolute,Y)
    ORA $7B19,Y          ; 19 19 7B | Logical OR with accumulator (absolute,Y)
    PEA #$9191           ; F4 91 91 | Push effective address to stack
    INC $FF              ; E6 FF | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $2701,X          ; FE 01 27 | Increment (absolute,X)
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCS $B0              ; B0 B0 | Branch if carry set
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    INX                  ; E8 | Increment X register
    INC $4F00,X          ; FE 00 4F | Increment (absolute,X)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_012
; Address: $EF85BA
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_012:
    AND $0000            ; 2D 00 00 | Logical AND with accumulator (absolute)
    INC $FF00            ; EE 00 FF | Increment (absolute)
    ROR $FF6E            ; 6E 6E FF | Rotate right (absolute)
    BRA $00              ; 80 00 | Branch always
    BCC $01              ; 90 01 | Branch if carry clear
    AND $FF2D            ; 2D 2D FF | Logical AND with accumulator (absolute)
    SBC $3FF9,Y          ; F9 F9 3F | Subtract with carry (absolute,Y)
    ASL $C50E            ; 0E 0E C5 | Arithmetic shift left (absolute)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($3A),Y          ; F1 3A | Subtract with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    JMP ($FF6C)          ; 6C 6C FF | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BIT $0093            ; 2C 93 00 | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$F1             ; 09 F1 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $C5              ; 30 C5 | Branch if negative
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    SBC #$D3             ; E9 D3 | Subtract with carry (immediate)
    CMP $DBD1,Y          ; D9 D1 DB | Compare accumulator (absolute,Y)
    ORA #$37             ; 09 37 | Logical OR with accumulator (immediate)
    PEA #$2110           ; F4 10 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_013
; Address: $EF8653
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_013:
    JSR $3101            ; 20 01 31 | Jump to subroutine
    CMP ($C1),Y          ; D1 C1 | Compare accumulator ((zero page),Y)
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    BRA $40              ; 80 40 | Branch always
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    ORA $FFFF,X          ; 1D FF FF | Logical OR with accumulator (absolute,X)
    STX $60              ; 86 60 | Store X register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STZ $64              ; 64 64 | Store zero to zero page
    BRA $9C              ; 80 9C | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_015
; Address: $EF86C1
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_015:
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $BB2E            ; 2E 2E BB | Rotate left (absolute)
    ADC $00              ; 65 00 | Add with carry (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    LDX $E700,Y          ; BE 00 E7 | Load from absolute,Y into X register
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    SEP #$E2             ; E2 E2 | Set processor status bits
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDX $FFBE,Y          ; BE BE FF | Load from absolute,Y into X register
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ORA $FE00,X          ; 1D 00 FE | Logical OR with accumulator (absolute,X)
    STA $0041,X          ; 9D 41 00 | Update graphics data
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    AND $FF00,Y          ; 39 00 FF | Logical AND with accumulator (absolute,Y)
    STY $00              ; 84 00 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_016
; Address: $EF8732
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_016:
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF BF 20 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_017
; Address: $EF8744
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_017:
    JSR $9B20            ; 20 20 9B | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $00              ; 80 00 | Branch always
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    ORA $7B19,Y          ; 19 19 7B | Logical OR with accumulator (absolute,Y)
    PEA #$9191           ; F4 91 91 | Push effective address to stack
    INC $FF              ; E6 FF | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BMI $EF              ; 30 EF | Branch if negative
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_018
; Address: $EF8792
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_018:
    BMI $FF              ; 30 FF | Branch if negative
    INC $2701,X          ; FE 01 27 | Increment (absolute,X)
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    DEC                  ; 3A | Decrement accumulator
    DEC $39CE            ; CE CE 39 | Decrement (absolute)
    AND $E6E6,Y          ; 39 E6 E6 | Logical AND with accumulator (absolute,Y)
    STA $6899,Y          ; 99 99 68 | Update graphics data
    ADC #$03             ; 69 03 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_019
; Address: $EF87B5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_019:
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    LSR $86              ; 46 86 | Logical shift right (zero page)
    BPL $C9              ; 10 C9 | Branch if positive
    SBC $E7A7,Y          ; F9 A7 E7 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $6F6C,Y          ; 99 6C 6F | Update graphics data
    BCC $C3              ; 90 C3 | Branch if carry clear
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ROL $F6              ; 26 F6 | Rotate left (zero page)
    INY                  ; C8 | Increment Y register
    BPL $20              ; 10 20 | Branch if positive
    LSR $80              ; 46 80 | Logical shift right (zero page)
    BPL $00              ; 10 00 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_01C
; Address: $EF87E1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_01C:
    JSR $04CB            ; 20 CB 04 | Jump to subroutine
    CMP ($5C),Y          ; D1 5C | Compare accumulator ((zero page),Y)
    JMP ($6C60)          ; 6C 60 6C | Jump to address (absolute indirect)
    ROR $58E1,X          ; 7E E1 58 | Rotate right (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BMI $01              ; 30 01 | Branch if negative
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDA ($00,X)          ; A1 00 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_01D
; Address: $EF8801
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_01D:
    JSR $01CE            ; 20 CE 01 | Jump to subroutine
    JMP $414ED2          ; 5C D2 4E 41 | Jump to address long
    ADC $4C61            ; 6D 61 4C | Add with carry (absolute)
    LSR $58C1,X          ; 5E C1 58 | Logical shift right (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BMI $C0              ; 30 C0 | Branch if negative
    SBC ($10,X)          ; E1 10 | Subtract with carry ((zero page,X))
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_01F
; Address: $EF881E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_01F:
    ADC ($82,X)          ; 61 82 | Add with carry ((zero page,X))
    ORA #$E7             ; 09 E7 | Logical OR with accumulator (immediate)
    STY $83              ; 84 83 | Store Y register to zero page
    SBC #$D8             ; E9 D8 | Subtract with carry (immediate)
    STY $11              ; 84 11 | Store Y register to zero page
    ORA ($D3,X)          ; 01 D3 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    ADC $B5FF,Y          ; 79 FF B5 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_020
; Address: $EF884C
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_020:
    JSL $B6AAEA          ; 22 EA AA B6 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    AND $CF00,Y          ; 39 00 CF | Logical AND with accumulator (absolute,Y)
    LSR $FC5E,X          ; 5E 5E FC | Logical shift right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA ($00,X)          ; A1 00 | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register from stack
    BRA $7F              ; 80 7F | Branch always
    BEQ $03              ; F0 03 | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    INC $6700,X          ; FE 00 67 | Increment (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    EOR $0000,X          ; 5D 00 00 | Exclusive OR with accumulator (absolute,X)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    LDA                  ; BF BF F0 F0 | Read graphics status
    PEA #$00F4           ; F4 F4 00 | Push effective address to stack
    BRA $00              ; 80 00 | Branch always
    INC $0000            ; EE 00 00 | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    ROL $F33E,X          ; 3E 3E F3 | Rotate left (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $FF              ; 10 FF | Branch if positive
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA ($91),Y          ; 91 91 | Update graphics data
    STA ($81,X)          ; 81 81 | Update graphics data
    ASL $9F9F            ; 0E 9F 9F | Arithmetic shift left (absolute)
    ASL $0060            ; 0E 60 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_021
; Address: $EF891A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_021:
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_022
; Address: $EF8920
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_022:
    INC                  ; 1A | Increment accumulator
    ADC #$D3             ; 69 D3 | Add with carry (immediate)
    ORA $1AD1,Y          ; 19 D1 1A | Logical OR with accumulator (absolute,Y)
    ORA #$37             ; 09 37 | Logical OR with accumulator (immediate)
    PEA #$2100           ; F4 00 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_023
; Address: $EF8933
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_023:
    JSR $3100            ; 20 00 31 | Jump to subroutine
    EOR ($C1),Y          ; 51 C1 | Exclusive OR with accumulator ((zero page),Y)
    AND ($C5),Y          ; 31 C5 | Logical AND with accumulator ((zero page),Y)
    BMI $C5              ; 30 C5 | Branch if negative
    BRA $40              ; 80 40 | Branch always
    PHP                  ; 08 | Push processor status to stack
    INC $FF1F,X          ; FE 1F FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX $B8F7            ; EC F7 B8 | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA $FF1F,X          ; 1D 1F FF | Logical OR with accumulator (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BCC $C7              ; 90 C7 | Branch if carry clear
    BMI $C3              ; 30 C3 | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_026
; Address: $EF8966
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_026:
    JSL $FA0AFA          ; 22 FA 0A FA | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    TAX                  ; AA | Transfer accumulator to X register
    ADC ($69,X)          ; 61 69 | Add with carry ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $01              ; 80 01 | Branch always
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    JMP $0AA202          ; 5C 02 A2 0A | Jump to address long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$AA             ; A2 AA | Load immediate value into X register
    AND $1D2F            ; 2D 2F 1D | Logical AND with accumulator (absolute)
    LDA                  ; BF 0F 50 30 | Read graphics status
    CMP $40              ; C5 40 | Compare accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    ASL $FEC0,X          ; 1E C0 FE | Arithmetic shift left (absolute,X)
    INC $0800,X          ; FE 00 08 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    STA $10              ; 85 10 | Update graphics data
    JMP ($8787)          ; 6C 87 87 | Jump to address (absolute indirect)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_027
; Address: $EF89B1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_027:
    BPL $00              ; 10 00 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    BPL $68              ; 10 68 | Branch if positive
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_029
; Address: $EF89E0
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_029:
    CPX #$E0             ; E0 E0 | Game work RAM access
    ADC $84E0,Y          ; 79 E0 84 | Add with carry (absolute,Y)
    BRA $01              ; 80 01 | Branch always
    ORA ($B0,X)          ; 01 B0 | Logical OR with accumulator ((zero page,X))
    BCS $9C              ; B0 9C | Branch if carry set
    INC $4F00,X          ; FE 00 4F | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $9E              ; 80 9E | Branch always
    BCS $B3              ; B0 B3 | Branch if carry set
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ADC ($40,X)          ; 61 40 | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $81              ; 80 81 | Branch always
    DEC                  ; 3A | Decrement accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROR $8300,X          ; 7E 00 83 | Rotate right (absolute,X)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    INC $1F1F,X          ; FE 1F 1F | Increment (absolute,X)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    BCS $B0              ; B0 B0 | Branch if carry set
    AND $0039,Y          ; 39 39 00 | Logical AND with accumulator (absolute,Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDX $FF00,Y          ; BE 00 FF | Load from absolute,Y into X register
    INX                  ; E8 | Increment X register
    DEC $00              ; C6 00 | Decrement (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_02A
; Address: $EF8A62
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_02A:
    JSR $8020            ; 20 20 80 | Jump to subroutine
    STY $00              ; 84 00 | Store Y register to zero page
    BCC $18              ; 90 18 | Branch if carry clear
    INC                  ; 1A | Increment accumulator
    BCS $B0              ; B0 B0 | Branch if carry set
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_02C
; Address: $EF8A8C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_02C:
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    DEC $0700,X          ; DE 00 07 | Decrement (absolute,X)
    DEC $FF00            ; CE 00 FF | Decrement (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $079E,X          ; 9E 9E 07 | Store zero to absolute,X
    EOR $4959,Y          ; 59 59 49 | Exclusive OR with accumulator (absolute,Y)
    ORA $6999,Y          ; 19 99 69 | Logical OR with accumulator (absolute,Y)
    ADC #$20             ; 69 20 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_02D
; Address: $EF8AC5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_02D:
    JSR $2D2D            ; 20 2D 2D | Jump to subroutine
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROL $26              ; 26 26 | Rotate left (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_02E
; Address: $EF8AD3
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_02E:
    BRA $5F              ; 80 5F | Branch always
    BRA $5B              ; 80 5B | Branch always
    BRA $5B              ; 80 5B | Branch always
    BRA $59              ; 80 59 | Branch always
    BRA $5B              ; 80 5B | Branch always
    BRA $5A              ; 80 5A | Branch always
    BRA $9B              ; 80 9B | Branch always
    LDA                  ; BF B3 B7 95 | Read graphics status
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LDX $BE00,Y          ; BE 00 BE | Load from absolute,Y into X register
    LDX $B600,Y          ; BE 00 B6 | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROR $006E            ; 6E 6E 00 | Rotate right (absolute)
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    BCC $01              ; 90 01 | Branch if carry clear
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $C5              ; 05 C5 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register
    REP #$01             ; C2 01 | Reset processor status bits
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    REP #$02             ; C2 02 | Reset processor status bits
    REP #$02             ; C2 02 | Reset processor status bits
    SEP #$02             ; E2 02 | Set processor status bits
    TAY                  ; A8 | Transfer accumulator to Y register
    SEC                  ; 38 | Set carry flag
    AND $3C02,X          ; 3D 02 3C | Logical AND with accumulator (absolute,X)
    AND $3D00,X          ; 3D 00 3D | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_02F
; Address: $EF8B5F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_02F:
    ORA $FFFF,X          ; 1D FF FF | Logical OR with accumulator (absolute,X)
    ROL $26              ; 26 26 | Rotate left (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $F800            ; EE 00 F8 | Increment (absolute)
    SED                  ; F8 | Set decimal mode flag
    BCC $9F              ; 90 9F | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_030
; Address: $EF8BA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_030:
    CMP $4040,Y          ; D9 40 40 | Compare accumulator (absolute,Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDA                  ; BF 00 FF 00 | Read graphics status
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_031
; Address: $EF8BC6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_031:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    INC $C000,X          ; FE 00 C0 | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    PHB                  ; 8B | Push data bank register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    INC $3F00,X          ; FE 00 3F | Increment (absolute,X)
    PEA #$C000           ; F4 00 C0 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_032
; Address: $EF8C08
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_032:
    JSR $00A0            ; 20 A0 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$F1             ; 09 F1 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $C7              ; 30 C7 | Branch if negative
    BMI $C5              ; 30 C5 | Branch if negative
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    ORA #$A4             ; 09 A4 | Logical OR with accumulator (immediate)
    ORA #$A4             ; 09 A4 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_033
; Address: $EF8C55
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_033:
    LDY $08              ; A4 08 | Load from zero page into Y register
    LDY $09              ; A4 09 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $08              ; A4 08 | Load from zero page into Y register
    LDY $01              ; A4 01 | Load from zero page into Y register
    LDY $69              ; A4 69 | Load from zero page into Y register
    ADC #$4B             ; 69 4B | Add with carry (immediate)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    LDA $8BAD            ; AD AD 8B | Read graphics status
    PHB                  ; 8B | Push data bank register to stack
    STZ $9C40,X          ; 9E 40 9C | Store zero to absolute,X
    RTI                  ; 40 | Return from interrupt
    LDX $B640,Y          ; BE 40 B6 | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_034
; Address: $EF8C82
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_034:
    JSR $58EF            ; 20 EF 58 | Jump to subroutine
    STY $87              ; 84 87 | Store Y register to zero page
    SBC #$D8             ; E9 D8 | Subtract with carry (immediate)
    STY $FF              ; 84 FF | Store Y register to zero page
    LDA $CF8F47          ; AF 47 8F CF | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $E700            ; 0E 00 E7 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    REP #$00             ; C2 00 | Reset processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX $0C              ; E4 0C | Compare X register (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEP #$02             ; E2 02 | Set processor status bits
    SEP #$02             ; E2 02 | Set processor status bits
    BEQ $82              ; F0 82 | Branch if equal
    TSX                  ; BA | Transfer stack pointer to X register
    LDY #$28             ; A0 28 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_035
; Address: $EF8CCC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_035:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    EOR $C0              ; 45 C0 | Exclusive OR with accumulator (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC $0000,X          ; 7D 00 00 | Add with carry (absolute,X)
    LSR $46              ; 46 46 | Logical shift right (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    LDA $0000,Y          ; B9 00 00 | Read graphics status
    SBC $2F00,X          ; FD 00 2F | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_036
; Address: $EF8D07
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_036:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BNE $00              ; D0 00 | Branch if not equal
    ROL $E000,X          ; 3E 00 E0 | Game work RAM access
    PEA #$3E00           ; F4 00 3E | Push effective address to stack
    ADC $8000,X          ; 7D 00 80 | Add with carry (absolute,X)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_038
; Address: $EF8D31
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_038:
    JSR $0B00            ; 20 00 0B | Jump to subroutine
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INC $0000            ; EE 00 00 | Increment (absolute)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    INC $E000,X          ; FE 00 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA ($00,X)          ; 81 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    ORA ($A4,X)          ; 01 A4 | Logical OR with accumulator ((zero page,X))
    LDY $01              ; A4 01 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $81              ; A4 81 | Load from zero page into Y register
    STA ($B5,X)          ; 81 B5 | Update graphics data
    STA ($91),Y          ; 91 91 | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    AND $3E3D,X          ; 3D 3D 3E | Logical AND with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    ROL $0E40            ; 2E 40 0E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $70              ; 80 70 | Branch always
    BEQ $01              ; F0 01 | Branch if equal
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    BRA $68              ; 80 68 | Branch always
    BRA $68              ; 80 68 | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_039
; Address: $EF8DB9
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_039:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP $CDCD            ; CD CD CD | Compare accumulator (absolute)
    CMP $CDCD            ; CD CD CD | Compare accumulator (absolute)
    ADC $65              ; 65 65 | Add with carry (zero page)
    ADC $65              ; 65 65 | Add with carry (zero page)
    ADC $65              ; 65 65 | Add with carry (zero page)
    ADC $65              ; 65 65 | Add with carry (zero page)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ASL $1E80,X          ; 1E 80 1E | Arithmetic shift left (absolute,X)
    BRA $1E              ; 80 1E | Branch always
    BRA $1E              ; 80 1E | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC ($66),Y          ; F1 66 | Subtract with carry ((zero page),Y)
    STA $CF30,Y          ; 99 30 CF | Update graphics data
    ROL $6100,X          ; 3E 00 61 | Rotate left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STZ $3000,X          ; 9E 00 30 | Store zero to absolute,X
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $0F              ; 80 0F | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    LDA                  ; BF 00 FE 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_03A
; Address: $EF8E13
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_03A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $E0              ; E6 E0 | Game work RAM access
    BEQ $0F              ; F0 0F | Branch if equal
    ROR $00              ; 66 00 | Rotate right (zero page)
    INC $1900,X          ; FE 00 19 | Increment (absolute,X)
    STA $F000,Y          ; 99 00 F0 | Update graphics data
    PHB                  ; 8B | Push data bank register to stack
    CLC                  ; 18 | Clear carry flag
    INC $00              ; E6 00 | Increment (zero page)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $00              ; A4 00 | Load from zero page into Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX $BD              ; E4 BD | Compare X register (zero page)
    LDA $B9B9,X          ; BD B9 B9 | Read graphics status
    AND $BD39,Y          ; 39 39 BD | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_03B
; Address: $EF8E89
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_03B:
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $BDB9,Y          ; B9 B9 BD | Read graphics status
    LDA $4002,X          ; BD 02 40 | Read graphics status
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    STX $40              ; 86 40 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR ($46,X)          ; 41 46 | Exclusive OR with accumulator ((zero page,X))
    EOR ($46,X)          ; 41 46 | Exclusive OR with accumulator ((zero page,X))
    EOR ($4E,X)          ; 41 4E | Exclusive OR with accumulator ((zero page,X))
    EOR ($4E,X)          ; 41 4E | Exclusive OR with accumulator ((zero page,X))
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    ADC ($6E,X)          ; 61 6E | Add with carry ((zero page,X))
    ADC ($6E,X)          ; 61 6E | Add with carry ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $FE              ; 90 FE | Branch if carry clear
    ADC $FC7F,X          ; 7D 7F FC | Add with carry (absolute,X)
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    STA ($79,X)          ; 81 79 | Update graphics data
    STA ($79,X)          ; 81 79 | Update graphics data
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $C5              ; 06 C5 | Arithmetic shift left (zero page)
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    CMP $CDCD            ; CD CD CD | Compare accumulator (absolute)
    CMP $6565            ; CD 65 65 | Compare accumulator (absolute)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ASL $1E80,X          ; 1E 80 1E | Arithmetic shift left (absolute,X)
    BRA $1E              ; 80 1E | Branch always
    ASL $0800,X          ; 1E 00 08 | Arithmetic shift left (absolute,X)
    INC $1300,X          ; FE 00 13 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_03C
; Address: $EF8F2A
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_03C:
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    STA ($7E,X)          ; 81 7E | Update graphics data
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    LDY $0043,X          ; BC 43 00 | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $00              ; 84 00 | Store Y register to zero page
    BEQ $00              ; F0 00 | Branch if equal
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    ADC $00FF,X          ; 7D FF 00 | Add with carry (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    INC $D301,X          ; FE 01 D3 | Increment (absolute,X)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    STA ($00,X)          ; 81 00 | Update graphics data
    SBC $0000            ; ED 00 00 | Subtract with carry (absolute)
    CPX $00              ; E4 00 | Compare X register (zero page)
    PEA #$B400           ; F4 00 B4 | Push effective address to stack
    LDY $BC00,X          ; BC 00 BC | Load from absolute,X into Y register
    LDY $AC00            ; AC 00 AC | Load from absolute address into Y register
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $4002,X          ; BD 02 40 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC ($6E,X)          ; 61 6E | Add with carry ((zero page,X))
    ADC ($6E,X)          ; 61 6E | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_03F
; Address: $EF8FEE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_03F:
    EOR ($4E,X)          ; 41 4E | Exclusive OR with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCS $FE              ; B0 FE | Branch if carry set

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_040
; Address: $EF9001
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_040:
    ADC $7DFE,X          ; 7D FE 7D | Add with carry (absolute,X)
    ADC $23DC,X          ; 7D DC 23 | Add with carry (absolute,X)
    STZ $7C              ; 64 7C | Store zero to zero page
    ROL $7981,X          ; 3E 81 79 | Rotate left (absolute,X)
    STA ($79,X)          ; 81 79 | Update graphics data
    BRA $74              ; 80 74 | Branch always
    BRA $34              ; 80 34 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $30              ; 80 30 | Branch always
    BRA $70              ; 80 70 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP $87CD            ; CD CD 87 | Compare accumulator (absolute)
    STA $CDC98F          ; 8F 8F C9 CD | Update graphics data
    LDA #$AD             ; A9 AD | Read graphics status
    LDA $A5              ; A5 A5 | Read graphics status
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    ROL $1E00,X          ; 3E 00 1E | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_041
; Address: $EF9054
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_041:
    LSR $3E20,X          ; 5E 20 3E | Logical shift right (absolute,X)
    ASL $1E40,X          ; 1E 40 1E | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CMP $FF26,Y          ; D9 26 FF | Compare accumulator (absolute,Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BRA $1F              ; 80 1F | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    EOR $1959,Y          ; 59 59 19 | Exclusive OR with accumulator (absolute,Y)
    ORA $1818,Y          ; 19 18 18 | Logical OR with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDX $00              ; A6 00 | Load from zero page into X register
    INC $00              ; E6 00 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX $BD              ; E4 BD | Compare X register (zero page)
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    LDA $BDBD,X          ; BD BD BD | Read graphics status
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_042
; Address: $EF9115
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_042:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ASL $00E0            ; 0E E0 00 | Arithmetic shift left (absolute)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($8A,X)          ; 01 8A | Logical OR with accumulator ((zero page,X))
    AND ($2E,X)          ; 21 2E | Logical AND with accumulator ((zero page,X))
    LSR $49              ; 46 49 | Logical shift right (zero page)
    AND ($22,X)          ; 21 22 | Logical AND with accumulator ((zero page,X))
    AND ($26,X)          ; 21 26 | Logical AND with accumulator ((zero page,X))
    AND $002A            ; 2D 2A 00 | Logical AND with accumulator (absolute)
    PEA #$7400           ; F4 00 74 | Push effective address to stack
    BNE $00              ; D0 00 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $40              ; B0 40 | Branch if carry set
    STZ $9840            ; 9C 40 98 | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    STZ $04FB            ; 9C FB 04 | Store zero to absolute
    ROR $64FB            ; 6E FB 64 | Rotate right (absolute)
    INC $D143,X          ; FE 43 D1 | Increment (absolute,X)
    ROL $03FD            ; 2E FD 03 | Rotate left (absolute)
    ROR $4F00            ; 6E 00 4F | Rotate right (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_044
; Address: $EF9157
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_044:
    PLY                  ; 7A | Pull Y register from stack
    RTI                  ; 40 | Return from interrupt
    ASL $8D00,X          ; 1E 00 8D | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BRA $70              ; 80 70 | Branch always
    BCC $6C              ; 90 6C | Branch if carry clear
    STA ($75,X)          ; 81 75 | Update graphics data
    CMP #$3B             ; C9 3B | Compare accumulator (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_045
; Address: $EF916B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_045:
    STZ $A181,X          ; 9E 81 A1 | Store zero to absolute,X
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $8740,X          ; 5E 40 87 | Logical shift right (absolute,X)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    AND $272D            ; 2D 2D 27 | Logical AND with accumulator (absolute)
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    ROL $1E00,X          ; 3E 00 1E | Rotate left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0EC0,X          ; 1E C0 0E | Arithmetic shift left (absolute,X)
    BVS $1E              ; 70 1E | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_046
; Address: $EF91A8
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_046:
    STA $808700          ; 8F 00 87 80 | Update graphics data
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $3F              ; 80 3F | Branch always
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC $0B79,Y          ; 79 79 0B | Add with carry (absolute,Y)
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    LSR $4140,X          ; 5E 40 41 | Logical shift right (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    PEA #$8600           ; F4 00 86 | Push effective address to stack
    BPL $00              ; 10 00 | Branch if positive
    LDA ($00,X)          ; A1 00 | Read graphics status
    LDX $2C00,Y          ; BE 00 2C | Load from absolute,Y into X register
    ADC $7400,X          ; 7D 00 74 | Add with carry (absolute,X)
    LDA $1DBD,X          ; BD BD 1D | Read graphics status
    ORA $9191,X          ; 1D 91 91 | Logical OR with accumulator (absolute,X)
    ORA #$E9             ; 09 E9 | Logical OR with accumulator (immediate)
    ROL $A7A0,X          ; 3E A0 A7 | Rotate left (absolute,X)
    BCS $B0              ; B0 B0 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    CPX #$02             ; E0 02 | Compare X register (immediate)
    JMP ($0020)          ; 6C 20 00 | Jump to address (absolute indirect)
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    AND $2A              ; 25 2A | Logical AND with accumulator (zero page)
    ASL $0B51,X          ; 1E 51 0B | Arithmetic shift left (absolute,X)
    BIT $1D              ; 24 1D | Test bits in accumulator (zero page)
    LDA                  ; BF C0 BD C2 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    CMP $FD00,X          ; DD 00 FD | Compare accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    PLY                  ; 7A | Pull Y register from stack
    NOP                  ; EA | No operation
    XBA                  ; EB | Exchange accumulator bytes
    ROL                  ; 2A | Rotate left (accumulator)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_047
; Address: $EF9267
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_047:
    JSL $D903DB          ; 22 DB 03 D9 | Jump to subroutine long
    ORA ($CC,X)          ; 01 CC | Logical OR with accumulator ((zero page,X))
    INC $0002            ; EE 02 00 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_048
; Address: $EF9279
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_048:
    BIT $2600            ; 2C 00 26 | Test bits in accumulator (absolute)
    ORA ($80),Y          ; 11 80 | Logical OR with accumulator ((zero page),Y)
    CMP $FBE0,Y          ; D9 E0 FB | Compare accumulator (absolute,Y)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    BCS $BF              ; B0 BF | Branch if carry set
    BCC $BF              ; 90 BF | Branch if carry clear
    STA                  ; 9F B0 87 98 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    LDX $20              ; A6 20 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_04B
; Address: $EF929F
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_04B:
    BEQ $51              ; F0 51 | Branch if equal
    LDA ($55),Y          ; B1 55 | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    STA                  ; 9F 78 8F 74 | Update graphics data
    STX $2DD5            ; 8E D5 2D | Store X register to absolute address
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    LDA ($0E),Y          ; B1 0E | Read graphics status
    BVS $0C              ; 70 0C | Branch if overflow set
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BEQ $1C              ; F0 1C | Branch if equal
    ORA ($E1),Y          ; 11 E1 | Logical OR with accumulator ((zero page),Y)
    CPY $C3              ; C4 C3 | Compare Y register (zero page)
    BIT #$CA             ; 89 CA | Test bits in accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SBC $0FF9,Y          ; F9 F9 0F | Subtract with carry (absolute,Y)
    BEQ $0E              ; F0 0E | Branch if equal
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BMI $C5              ; 30 C5 | Branch if negative
    ORA ($C6,X)          ; 01 C6 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    CPY $FFCC            ; CC CC FF | Compare Y register (absolute)
    BMI $03              ; 30 03 | Branch if negative
    DEC $3F00            ; CE 00 3F | Decrement (absolute)
    SBC $1800,X          ; FD 00 18 | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$07             ; E0 07 | Compare X register (immediate)
    STA $30308C          ; 8F 8C 30 30 | Update graphics data
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $FC              ; 30 FC | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_04C
; Address: $EF935B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_04C:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $12              ; F0 12 | Branch if equal
    PHX                  ; DA | Push X register to stack
    BPL $D8              ; 10 D8 | Branch if positive
    BPL $F4              ; 10 F4 | Branch if positive
    CPX $08              ; E4 08 | Compare X register (zero page)
    INC $F200            ; EE 00 F2 | Increment (absolute)
    SBC $2500,Y          ; F9 00 25 | Subtract with carry (absolute,Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    ASL $9E              ; 06 9E | Arithmetic shift left (zero page)
    DEC $9999,X          ; DE 99 99 | Decrement (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    ORA $45              ; 05 45 | Logical OR with accumulator (zero page)
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    STZ $00              ; 64 00 | Store zero to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    LDY $AC00,X          ; BC 00 AC | Load from absolute,X into Y register
    STY $181F            ; 8C 1F 18 | Store Y register to absolute address
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    JMP $9EE0FB          ; 5C FB E0 9E | Jump to address long
    WDM #$72             ; 42 72 | Reserved instruction
    BMI $C8              ; 30 C8 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_04D
; Address: $EF93B1
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_04D:
    INC $00              ; E6 00 | Increment (zero page)
    BNE $07              ; D0 07 | Branch if not equal
    SBC $3D80,Y          ; F9 80 3D | Subtract with carry (absolute,Y)
    INC $0A              ; E6 0A | Increment (zero page)
    ORA $39              ; 05 39 | Logical OR with accumulator (zero page)
    WDM #$27             ; 42 27 | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 07 E7 00 | Read graphics status
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BIT $F000            ; 2C 00 F0 | Test bits in accumulator (absolute)
    AND $6D12,X          ; 3D 12 6D | Logical AND with accumulator (absolute,X)
    BCC $E3              ; 90 E3 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    ROR $04              ; 66 04 | Rotate right (zero page)
    SBC $D200,Y          ; F9 00 D2 | Subtract with carry (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    ORA ($BE,X)          ; 01 BE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_04E
; Address: $EF93FA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_04E:
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    ROL $AD6E,X          ; 3E 6E AD | Rotate left (absolute,X)
    ORA $32CC            ; 0D CC 32 | Logical OR with accumulator (absolute)
    DEC $C2              ; C6 C2 | Decrement (zero page)
    ASL $7E              ; 06 7E | Arithmetic shift left (zero page)
    ASL $E606            ; 0E 06 E6 | Arithmetic shift left (absolute)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    SBC ($0C,X)          ; E1 0C | Subtract with carry ((zero page,X))
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_04F
; Address: $EF9425
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_04F:
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $35              ; 80 35 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    INY                  ; C8 | Increment Y register
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BVC $1F              ; 50 1F | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_050
; Address: $EF9439
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_050:
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA $2808            ; 0D 08 28 | Logical OR with accumulator (absolute)
    BNE $F8              ; D0 F8 | Branch if not equal
    SBC ($C0,X)          ; E1 C0 | Subtract with carry ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    STA ($82,X)          ; 81 82 | Update graphics data
    SEC                  ; 38 | Set carry flag
    ROL $7D00,X          ; 3E 00 7D | Rotate left (absolute,X)
    BCS $FF              ; B0 FF | Branch if carry set
    BPL $FF              ; 10 FF | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $7CAF,X          ; 7E AF 7C | Rotate right (absolute,X)
    AND $3DD6,X          ; 3D D6 3D | Logical AND with accumulator (absolute,X)
    REP #$4C             ; C2 4C | Reset processor status bits
    INC $A700            ; EE 00 A7 | Increment (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_051
; Address: $EF947E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_051:
    AND $4300,X          ; 3D 00 43 | Logical AND with accumulator (absolute,X)
    STA ($47,X)          ; 81 47 | Update graphics data
    STA ($C7,X)          ; 81 C7 | Update graphics data
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_052
; Address: $EF9489
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_052:
    ORA #$9D             ; 09 9D | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    STA $BB18,X          ; 9D 18 BB | Update graphics data
    CLC                  ; 18 | Clear carry flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    STA                  ; 9F F7 9F 7F | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    STX $00F9            ; 8E F9 00 | Store X register to absolute address
    ROL $FF00            ; 2E 00 FF | Rotate left (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROL $00DC,X          ; 3E DC 00 | Rotate left (absolute,X)
    STA                  ; 9F 9F 00 00 | Update graphics data
    BMI $00              ; 30 00 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_053
; Address: $EF9520
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_053:
    SEI                  ; 78 | Set interrupt disable flag
    STX $01              ; 86 01 | Store X register to zero page
    SBC $0303,Y          ; F9 03 03 | Subtract with carry (absolute,Y)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    STZ $00              ; 64 00 | Store zero to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCS $B0              ; B0 B0 | Branch if carry set
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    ADC $0600,Y          ; 79 00 06 | Add with carry (absolute,Y)
    ASL $FF00            ; 0E 00 FF | Arithmetic shift left (absolute)
    INC $4F00,X          ; FE 00 4F | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CPY $03              ; C4 03 | Compare Y register (zero page)
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    BRA $FA              ; 80 FA | Branch always
    CPY #$E1             ; C0 E1 | Compare Y register (immediate)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    CPY #$AE             ; C0 AE | Compare Y register (immediate)
    BRA $BB              ; 80 BB | Branch always
    ADC $65              ; 65 65 | Add with carry (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_054
; Address: $EF9581
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_054:
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    STZ $97E4,X          ; 9E E4 97 | Store zero to absolute,X
    CPX $BF              ; E4 BF | Compare X register (zero page)
    SBC $FE              ; E5 FE | Subtract with carry (zero page)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    ORA $2B00,Y          ; 19 00 2B | Logical OR with accumulator (absolute,Y)
    AND ($DB),Y          ; 31 DB | Logical AND with accumulator ((zero page),Y)
    ADC $7DFB,X          ; 7D FB 7D | Add with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    ADC $CED7,X          ; 7D D7 CE | Add with carry (absolute,X)
    ADC $4D00            ; 6D 00 4D | Add with carry (absolute)
    CPY $8600            ; CC 00 86 | Compare Y register (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    PLB                  ; AB | Pull data bank register from stack
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 1F BF 3F | Read graphics status
    LDA                  ; BF 3F 7D BD | Read graphics status
    EOR $6FF7,X          ; 5D F7 6F | Exclusive OR with accumulator (absolute,X)
    ROL $36FF            ; 2E FF 36 | Rotate left (absolute)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    STA                  ; 9F 00 EB F7 | Update graphics data
    CMP $99E1,Y          ; D9 E1 99 | Compare accumulator (absolute,Y)
    SBC #$3F             ; E9 3F | Subtract with carry (immediate)
    STA                  ; 9F FF 3F FD | Update graphics data
    AND $031F,X          ; 3D 1F 03 | Logical AND with accumulator (absolute,X)
    LDA                  ; BF 07 2F 01 | Read graphics status
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA ($E5,X)          ; 81 E5 | Update graphics data
    LDA                  ; BF FF BF BF | Read graphics status
    LDA                  ; BF FF FF FB | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    STY $FF8C            ; 8C 8C FF | Store Y register to absolute address
    BVS $FF              ; 70 FF | Branch if overflow set
    INC $7EFE,X          ; FE FE 7E | Increment (absolute,X)
    ROR $383B,X          ; 7E 3B 38 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_055
; Address: $EF96DE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_055:
    SBC $C1FF,X          ; FD FF C1 | Subtract with carry (absolute,X)
    CMP ($F8,X)          ; C1 F8 | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$46             ; C0 46 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_056
; Address: $EF96EC
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_056:
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    STY $0F              ; 84 0F | Store Y register to zero page
    SEP #$FF             ; E2 FF | Set processor status bits
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR $46              ; 46 46 | Logical shift right (zero page)
    STA $0F231F          ; 8F 1F 23 0F | Update graphics data
    BPL $70              ; 10 70 | Branch if positive
    AND $03FF,Y          ; 39 FF 03 | Logical AND with accumulator (absolute,Y)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    STA ($81,X)          ; 81 81 | Update graphics data
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    SBC $FD07,X          ; FD 07 FD | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    STA $FB8EFB          ; 8F FB 8E FB | Update graphics data
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $A400            ; 8D 00 A4 | Update graphics data
    AND $7BFA,X          ; 3D FA 7B | Logical AND with accumulator (absolute,X)
    CPY $66              ; C4 66 | Compare Y register (zero page)
    STA $9758,Y          ; 99 58 97 | Update graphics data
    DEC $9C07,X          ; DE 07 9C | Decrement (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    BVC $08              ; 50 08 | Branch if overflow clear
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    LDY #$86             ; A0 86 | Load immediate value into Y register
    STZ $C4FF            ; 9C FF C4 | Store zero to absolute
    CPY $07              ; C4 07 | Compare Y register (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    BCS $85              ; B0 85 | Branch if carry set
    BMI $70              ; 30 70 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_058
; Address: $EF9805
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_058:
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA ($FF,X)          ; 81 FF | Update graphics data
    STA $FFFFFF          ; 8F FF FF FF | Update graphics data
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    STA $1F1F8F          ; 8F 8F 1F 1F | Update graphics data
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INC $F0FE,X          ; FE FE F0 | Increment (absolute,X)
    BEQ $EF              ; F0 EF | Branch if equal
    BVS $FF              ; 70 FF | Branch if overflow set
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDA                  ; BF FF FF FF | Read graphics status
    BEQ $FF              ; F0 FF | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_059
; Address: $EF9842
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_059:
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    ADC $FF7D,X          ; 7D 7D FF | Add with carry (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    STX $FF              ; 86 FF | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_05A
; Address: $EF9862
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_05A:
    JSR $8E60            ; 20 60 8E | Jump to subroutine
    STX $1C1C            ; 8E 1C 1C | Store X register to absolute address
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    STA                  ; 9F 9F 1F 1F | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_05B
; Address: $EF9880
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_05B:
    JSR $C7E0            ; 20 E0 C7 | Jump to subroutine
    DEC $C6              ; C6 C6 | Decrement (zero page)
    BMI $30              ; 30 30 | Branch if negative
    LDX $A7              ; A6 A7 | Load from zero page into X register
    STY $9C8C            ; 8C 8C 9C | Store Y register to absolute address
    STZ $B8B8,X          ; 9E B8 B8 | Store zero to absolute,X
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SBC $70F9,Y          ; F9 F9 70 | Subtract with carry (absolute,Y)
    BVS $0E              ; 70 0E | Branch if overflow set
    INC $3000,X          ; FE 00 30 | Increment (absolute,X)
    ROL $617F,X          ; 3E 7F 61 | Rotate left (absolute,X)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    ASL $FFFF,X          ; 1E FF FF | Arithmetic shift left (absolute,X)
    SBC #$19             ; E9 19 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_05C
; Address: $EF98EA
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_05C:
    JMP ($080C)          ; 6C 0C 08 | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt
    CMP ($E0,X)          ; C1 E0 | Game work RAM access
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $93ED            ; ED ED 93 | Subtract with carry (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$F3             ; C0 F3 | Compare Y register (immediate)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BMI $38              ; 30 38 | Branch if negative
    LSR $40              ; 46 40 | Logical shift right (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    JMP $81B844          ; 5C 44 B8 81 | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_05D
; Address: $EF9964
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_05D:
    JSR $1860            ; 20 60 18 | Jump to subroutine
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    SBC $EDFA            ; ED FA ED | Subtract with carry (absolute)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    INC $EBFB            ; EE FB EB | Increment (absolute)
    INC $F9FE,X          ; FE FE F9 | Increment (absolute,X)
    SBC $FAFA,Y          ; F9 FA FA | Subtract with carry (absolute,Y)
    INC $FD1F,X          ; FE 1F FD | Increment (absolute,X)
    BRA $82              ; 80 82 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDA $AD              ; A5 AD | Read graphics status
    SBC ($E3,X)          ; E1 E3 | Subtract with carry ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    STA $FFC6FF          ; 8F FF C6 FF | Update graphics data
    CPX $FF              ; E4 FF | Compare X register (zero page)
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    STA ($81,X)          ; 81 81 | Update graphics data
    STX $87              ; 86 87 | Store X register to zero page
    ORA ($91,X)          ; 01 91 | Logical OR with accumulator ((zero page,X))
    STA ($81,X)          ; 81 81 | Update graphics data
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_05E
; Address: $EF99F8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_05E:
    ASL $7EFF            ; 0E FF 7E | Arithmetic shift left (absolute)
    LDA                  ; BF 82 FF 60 | Read graphics status
    ROR $0F0E,X          ; 7E 0E 0F | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BIT $F02C            ; 2C 2C F0 | Test bits in accumulator (absolute)
    BEQ $80              ; F0 80 | Branch if equal
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    BCC $1B              ; 90 1B | Branch if carry clear
    BRA $D3              ; 80 D3 | Branch always
    ASL $1C0E            ; 0E 0E 1C | Arithmetic shift left (absolute)
    BMI $3F              ; 30 3F | Branch if negative
    BEQ $FC              ; F0 FC | Branch if equal
    CPY #$E0             ; C0 E0 | Game work RAM access
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STY $CC              ; 84 CC | Store Y register to zero page
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_05F
; Address: $EF9A6B
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_05F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BRA $81              ; 80 81 | Branch always
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    INC $604E,X          ; FE 4E 60 | Increment (absolute,X)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $F0FF,X          ; FE FF F0 | Increment (absolute,X)
    CPX #$3C             ; E0 3C | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    DEC $0500,X          ; DE 00 05 | Decrement (absolute,X)
    BVC $02              ; 50 02 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    STX $001F            ; 8E 1F 00 | Store X register to absolute address
    BMI $BF              ; 30 BF | Branch if negative
    SBC $FF0C,X          ; FD 0C FF | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_060
; Address: $EF9AE4
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_060:
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    STZ $04              ; 64 04 | Store zero to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STX $CF              ; 86 CF | Store X register to zero page
    STA ($00,X)          ; 81 00 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    BMI $3F              ; 30 3F | Branch if negative
    BRA $CC              ; 80 CC | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDA                  ; BF 00 03 00 | Read graphics status
    ASL $803F,X          ; 1E 3F 80 | Arithmetic shift left (absolute,X)
    SBC $FC00,Y          ; F9 00 FC | Subtract with carry (absolute,Y)
    ASL $7F80,X          ; 1E 80 7F | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    INC $F9FE,X          ; FE FE F9 | Increment (absolute,X)
    SBC $FAFA,Y          ; F9 FA FA | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    INC $FD1F,X          ; FE 1F FD | Increment (absolute,X)
    INC $78EE            ; EE EE 78 | Increment (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    LDY $FEBC,X          ; BC BC FE | Load from absolute,X into Y register
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    SBC $F8FF,X          ; FD FF F8 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC $F9FF,X          ; FD FF F9 | Subtract with carry (absolute,X)
    BEQ $3F              ; F0 3F | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BIT $303C            ; 2C 3C 30 | Test bits in accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    BEQ $FC              ; F0 FC | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_061
; Address: $EF9BEA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_061:
    JSR $7860            ; 20 60 78 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $F0              ; 80 F0 | Branch always
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_062
; Address: $EF9C3C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_062:
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    INC $F863,X          ; FE 63 F8 | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BMI $07              ; 30 07 | Branch if negative
    BRA $C3              ; 80 C3 | Branch always
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BMI $FF              ; 30 FF | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STZ $22FF            ; 9C FF 22 | Store zero to absolute
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_063
; Address: $EF9C94
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_063:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$01             ; E0 01 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    STX $008E            ; 8E 8E 00 | Store X register to absolute address
    LDX $FF00,Y          ; BE 00 FF | Load from absolute,Y into X register
    INC $04FE,X          ; FE FE 04 | Increment (absolute,X)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ROL $3030,X          ; 3E 30 30 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    ASL $1CC1            ; 0E C1 1C | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    BVS $3F              ; 70 3F | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_064
; Address: $EF9DA7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_064:
    RTI                  ; 40 | Return from interrupt
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 01 F8 00 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_066
; Address: $EF9DCE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_066:
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BMI $C0              ; 30 C0 | Branch if negative
    STA                  ; 9F 00 00 FF | Update graphics data
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_068
; Address: $EF9DEE
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_068:
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BMI $C0              ; 30 C0 | Branch if negative
    STA                  ; 9F 00 00 FF | Update graphics data
    BPL $E3              ; 10 E3 | Branch if positive
    BMI $C3              ; 30 C3 | Branch if negative
    BPL $60              ; 10 60 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    BPL $E3              ; 10 E3 | Branch if positive
    AND ($C3),Y          ; 31 C3 | Logical AND with accumulator ((zero page),Y)
    BEQ $03              ; F0 03 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SBC $7F0C,Y          ; F9 0C 7F | Subtract with carry (absolute,Y)
    BMI $3D              ; 30 3D | Branch if negative
    BPL $FD              ; 10 FD | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    STA                  ; 9F 00 FF 00 | Update graphics data
    ROR $FC00,X          ; 7E 00 FC | Rotate right (absolute,X)
    BPL $C3              ; 10 C3 | Branch if positive
    BMI $C3              ; 30 C3 | Branch if negative
    BPL $60              ; 10 60 | Branch if positive
    BMI $10              ; 30 10 | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    CPX $CC00            ; EC 00 CC | Compare X register (absolute)
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    DEC                  ; 3A | Decrement accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    STZ $DCBB            ; 9C BB DC | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC $DF05,X          ; FD 05 DF | Subtract with carry (absolute,X)
    ORA $4F              ; 05 4F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_069
; Address: $EF9E7C
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_069:
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    ADC ($FB,X)          ; 61 FB | Add with carry ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    INY                  ; C8 | Increment Y register
    ROR                  ; 6A | Rotate right (accumulator)
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    BCC $F4              ; 90 F4 | Branch if carry clear
    STZ $A7E2,X          ; 9E E2 A7 | Store zero to absolute,X
    SEP #$81             ; E2 81 | Set processor status bits
    CPX #$F2             ; E0 F2 | Compare X register (immediate)
    CPY #$F9             ; C0 F9 | Compare Y register (immediate)
    BPL $FB              ; 10 FB | Branch if positive
    LDA                  ; BF 7F EF DF | Read graphics status
    STA                  ; 9F 5F 2F 5F | Update graphics data
    EOR $F371            ; 4D 71 F3 | Exclusive OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BMI $C9              ; 30 C9 | Branch if negative
    ADC ($82),Y          ; 71 82 | Add with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    REP #$37             ; C2 37 | Reset processor status bits
    BPL $9F              ; 10 9F | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_06A
; Address: $EF9EE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_06A:
    JSR $143A            ; 20 3A 14 | Jump to subroutine
    EOR #$72             ; 49 72 | Exclusive OR with accumulator (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    ASL $0D01            ; 0E 01 0D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_06B
; Address: $EF9EF2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_06B:
    JSR $C04E            ; 20 4E C0 | Jump to subroutine
    ORA $E01E,X          ; 1D 1E E0 | Game work RAM access
    ADC ($0C,X)          ; 61 0C | Add with carry ((zero page,X))
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    BRA $79              ; 80 79 | Branch always
    BEQ $03              ; F0 03 | Branch if equal
    BMI $98              ; 30 98 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    ASL $B6              ; 06 B6 | Arithmetic shift left (zero page)
    INC $1A87,X          ; FE 87 1A | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_06C
; Address: $EF9F11
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_06C:
    CLD                  ; D8 | Clear decimal mode flag
    STZ $00              ; 64 00 | Store zero to zero page
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    ASL $81              ; 06 81 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_06D
; Address: $EF9F24
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_06D:
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA $E790FF          ; 8F FF 90 E7 | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    CMP $C121            ; CD 21 C1 | Compare accumulator (absolute)
    CPX $CD              ; E4 CD | Compare X register (zero page)
    ROR $1A97            ; 6E 97 1A | Rotate right (absolute)
    AND ($88,X)          ; 21 88 | Logical AND with accumulator ((zero page,X))
    BRA $CB              ; 80 CB | Branch always
    INY                  ; C8 | Increment Y register
    CPY $D2              ; C4 D2 | Compare Y register (zero page)
    CPY #$D3             ; C0 D3 | Compare Y register (immediate)
    CMP $D0C2            ; CD C2 D0 | Compare accumulator (absolute)
    LSR $80              ; 46 80 | Logical shift right (zero page)
    BRA $3A              ; 80 3A | Branch always
    STX $36              ; 86 36 | Store X register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    BRA $06              ; 80 06 | Branch always
    STX $00              ; 86 00 | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BRA $07              ; 80 07 | Branch always
    AND $F340,Y          ; 39 40 F3 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_06E
; Address: $EF9F83
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_06E:
    JSR $8BF8            ; 20 F8 8B | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $36              ; 06 36 | Arithmetic shift left (zero page)
    LDX $1A87,Y          ; BE 87 1A | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_06F
; Address: $EF9F8F
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_06F:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    BRA $84              ; 80 84 | Branch always
    STA $00              ; 85 00 | Update graphics data
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $01              ; C6 01 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    LDX $3F7B,Y          ; BE 7B 3F | Load from absolute,Y into X register
    LDA                  ; BF FB FB FF | Read graphics status
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_070
; Address: $EF9FD0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_070:
    CLV                  ; B8 | Clear overflow flag
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    EOR $4309,Y          ; 59 09 43 | Exclusive OR with accumulator (absolute,Y)
    CPY #$B3             ; C0 B3 | Compare Y register (immediate)
    SBC ($BF,X)          ; E1 BF | Subtract with carry ((zero page,X))
    LDA $FF6FFF          ; AF FF 6F FF | Read graphics status
    SBC ($41),Y          ; F1 41 | Subtract with carry ((zero page),Y)
    CMP $DDC0,X          ; DD C0 DD | Compare accumulator (absolute,X)
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    LDA $FF6FFF          ; AF FF 6F FF | Read graphics status
    INX                  ; E8 | Increment X register
    BNE $00              ; D0 00 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    SEP #$57             ; E2 57 | Set processor status bits
    LDA ($46,X)          ; A1 46 | Read graphics status
    BCS $4F              ; B0 4F | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 10 0D 00 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STA ($0B,X)          ; 81 0B | Update graphics data
    ROL $253E,X          ; 3E 3E 25 | Rotate left (absolute,X)
    BIT $FB              ; 24 FB | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPY #$0F             ; C0 0F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_071
; Address: $EFA02D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_071:
    JSR $837C            ; 20 7C 83 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    SEC                  ; 38 | Set carry flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($98,X)          ; 61 98 | Add with carry ((zero page,X))
    ADC ($88,X)          ; 61 88 | Add with carry ((zero page,X))
    ADC ($E1,X)          ; 61 E1 | Add with carry ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $FF              ; 10 FF | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $C207,Y          ; F9 07 C2 | Subtract with carry (absolute,Y)
    ROL $1FE4,X          ; 3E E4 1F | Rotate left (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_072
; Address: $EFA08C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_072:
    JSR $CFEF            ; 20 EF CF | Jump to subroutine
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA $BFBCFF          ; 8F FF BC BF | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BPL $E8              ; 10 E8 | Branch if positive
    ORA ($B7,X)          ; 01 B7 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $3C              ; 80 3C | Branch always
    BRA $43              ; 80 43 | Branch always
    BVS $07              ; 70 07 | Branch if overflow set
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $8F              ; 80 8F | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY $1F              ; C4 1F | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_073
; Address: $EFA0ED
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_073:
    JSR $07F8            ; 20 F8 07 | Jump to subroutine
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    CMP ($08,X)          ; C1 08 | Compare accumulator ((zero page,X))
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    BRA $FF              ; 80 FF | Branch always
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    DEC $0000,X          ; DE 00 00 | Decrement (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $FDFE,X          ; FE FE FD | Increment (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    PEA #$8000           ; F4 00 80 | Push effective address to stack
    STA                  ; 9F FF 0F FF | Update graphics data
    STA $FF8FFF          ; 8F FF 8F FF | Update graphics data
    LDA $FF8FFF          ; AF FF 8F FF | Read graphics status
    LDA                  ; BF BF FB FB | Read graphics status
    SBC $FFFD,X          ; FD FD FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_074
; Address: $EFA1E8
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_074:
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FE1F,X          ; FE 1F FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC ($66,X)          ; 61 66 | Add with carry ((zero page,X))
    ADC ($66,X)          ; 61 66 | Add with carry ((zero page,X))
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $80              ; 80 80 | Branch always
    LDA                  ; BF 7F 3F FF | Read graphics status
    LDA                  ; BF FF FF FF | Read graphics status
    LDA                  ; BF FF 3F FF | Read graphics status
    LDA                  ; BF FF FF FF | Read graphics status
    SBC $E33F,Y          ; F9 3F E3 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    WDM #$4D             ; 42 4D | Reserved instruction
    JMP $6D62            ; 4C 62 6D | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_075
; Address: $EFA2ED
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_075:
    JMP $005C43          ; 5C 43 5C 00 | Jump to address long
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    LDY $BC7F,X          ; BC 7F BC | Load from absolute,X into Y register
    CLV                  ; B8 | Clear overflow flag
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_076
; Address: $EFA30F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_076:
    CLI                  ; 58 | Clear interrupt disable flag
    STA $86FF,Y          ; 99 FF 86 | Update graphics data
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    STZ $80FF            ; 9C FF 80 | Store zero to absolute
    SEI                  ; 78 | Set interrupt disable flag
    BRA $78              ; 80 78 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_077
; Address: $EFA325
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_077:
    BCC $A0              ; 90 A0 | Branch if carry clear
    BVC $A1              ; 50 A1 | Branch if overflow clear
    EOR $59A1,Y          ; 59 A1 59 | Exclusive OR with accumulator (absolute,Y)
    LDY #$58             ; A0 58 | Load immediate value into Y register
    LDY #$58             ; A0 58 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_07A
; Address: $EFA33E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_07A:
    JSR $F3E7            ; 20 E7 F3 | Jump to subroutine
    SBC $FCFF,X          ; FD FF FC | Subtract with carry (absolute,X)
    SBC $FB0F,Y          ; F9 0F FB | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_07B
; Address: $EFA382
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_07B:
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC $FFF9,Y          ; F9 F9 FF | Subtract with carry (absolute,Y)
    SBC $FFFD,X          ; FD FD FF | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_07C
; Address: $EFA3A1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_07C:
    JSR $40BF            ; 20 BF 40 | Jump to subroutine
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 40 BE 41 | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_07D
; Address: $EFA3AD
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_07D:
    JSR $649B            ; 20 9B 64 | Jump to subroutine
    ORA $0FFF            ; 0D FF 0F | Logical OR with accumulator (absolute)
    LDA $08F750          ; AF 50 F7 08 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BNE $8F              ; D0 8F | Branch if not equal
    BVS $87              ; 70 87 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    CPY $FC33            ; CC 33 FC | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    DEC $DDFF,X          ; DE FF DD | Decrement (absolute,X)
    SBC $F7FD,X          ; FD FD F7 | Subtract with carry (absolute,X)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    CPX $FF13            ; EC 13 FF | Compare X register (absolute)
    BPL $E6              ; 10 E6 | Branch if positive
    ORA $03FC,Y          ; 19 FC 03 | Logical OR with accumulator (absolute,Y)
    STY $FF              ; 84 FF | Store Y register to zero page
    STY $FF              ; 84 FF | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    LDX $DB2A,Y          ; BE 2A DB | Load from absolute,Y into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $0DFE            ; 2D FE 0D | Logical AND with accumulator (absolute)
    INC $F21D,X          ; FE 1D F2 | Increment (absolute,X)
    EOR $D1FA            ; 4D FA D1 | Exclusive OR with accumulator (absolute)
    INC $FF00            ; EE 00 FF | Increment (absolute)
    ADC ($6E,X)          ; 61 6E | Add with carry ((zero page,X))
    ADC ($6E,X)          ; 61 6E | Add with carry ((zero page,X))
    AND ($2E,X)          ; 21 2E | Logical AND with accumulator ((zero page,X))
    AND ($2E,X)          ; 21 2E | Logical AND with accumulator ((zero page,X))
    ADC ($7E,X)          ; 61 7E | Add with carry ((zero page,X))
    ADC ($7E,X)          ; 61 7E | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_07E
; Address: $EFA42C
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_07E:
    EOR ($4E,X)          ; 41 4E | Exclusive OR with accumulator ((zero page,X))
    EOR ($4E,X)          ; 41 4E | Exclusive OR with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BCS $00              ; B0 00 | Branch if carry set
    BCS $81              ; B0 81 | Branch if carry set
    ADC $7981,Y          ; 79 81 79 | Add with carry (absolute,Y)
    BRA $74              ; 80 74 | Branch always
    BRA $74              ; 80 74 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $70              ; 80 70 | Branch always
    BRA $70              ; 80 70 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP $C7CD            ; CD CD C7 | Compare accumulator (absolute)
    CMP $ADCD            ; CD CD AD | Compare accumulator (absolute)
    LDA $A5A5            ; AD A5 A5 | Read graphics status
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ASL $1E40,X          ; 1E 40 1E | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    JMP $4D42            ; 4C 42 4D | Jump to address
    RTI                  ; 40 | Return from interrupt
    EOR $4D52            ; 4D 52 4D | Exclusive OR with accumulator (absolute)
    JMP $4F53            ; 4C 53 4F | Jump to address
    LDA $906F50          ; AF 50 6F 90 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    CPX #$18             ; E0 18 | Compare X register (immediate)
    LDY #$58             ; A0 58 | Load immediate value into Y register
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    SBC ($19,X)          ; E1 19 | Subtract with carry ((zero page,X))
    CMP ($39,X)          ; C1 39 | Compare accumulator ((zero page,X))
    SBC ($D9,X)          ; E1 D9 | Subtract with carry ((zero page,X))
    CMP ($79,X)          ; C1 79 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_081
; Address: $EFA4D7
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_081:
    SEP #$E0             ; E2 E0 | Game work RAM access
    INC $E0              ; E6 E0 | Game work RAM access
    INC $C0              ; E6 C0 | Increment (zero page)
    DEC $40              ; C6 40 | Decrement (zero page)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    SBC $FCFF,X          ; FD FF FC | Subtract with carry (absolute,X)
    SBC $FBFA,X          ; FD FA FB | Subtract with carry (absolute,X)
    CPY $C6              ; C4 C6 | Compare Y register (zero page)
    STA $9798,Y          ; 99 98 97 | Update graphics data
    INC $FC07,X          ; FE 07 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDA                  ; BF 40 FA 85 | Read graphics status
    SEI                  ; 78 | Set interrupt disable flag
    ADC $8086,Y          ; 79 86 80 | Add with carry (absolute,Y)
    BRA $23              ; 80 23 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_082
; Address: $EFA54E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_082:
    JSR $0D27            ; 20 27 0D | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP ($3C,X)          ; C1 3C | Compare accumulator ((zero page,X))
    LDX $8E71,Y          ; BE 71 8E | Load from absolute,Y into X register
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $FA              ; 80 FA | Branch always
    SED                  ; F8 | Set decimal mode flag
    SBC $01FF,Y          ; F9 FF 01 | Subtract with carry (absolute,Y)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    CPY #$38             ; C0 38 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_083
; Address: $EFA58C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_083:
    JSR $00DC            ; 20 DC 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BEQ $FF              ; F0 FF | Branch if equal
    LDA #$9A             ; A9 9A | Read graphics status
    DEC $3B              ; C6 3B | Decrement (zero page)
    DEC $19              ; C6 19 | Decrement (zero page)
    INC $03              ; E6 03 | Increment (zero page)
    ORA $75              ; 05 75 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_084
; Address: $EFA5BC
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_084:
    ASL $90              ; 06 90 | Arithmetic shift left (zero page)
    ASL $0160            ; 0E 60 01 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    AND ($2E,X)          ; 21 2E | Logical AND with accumulator ((zero page,X))
    AND ($2E,X)          ; 21 2E | Logical AND with accumulator ((zero page,X))
    EOR ($46,X)          ; 41 46 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BCS $00              ; B0 00 | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    SBC $FF7E,X          ; FD 7E FF | Subtract with carry (absolute,X)
    BRA $74              ; 80 74 | Branch always
    BRA $74              ; 80 74 | Branch always
    STA ($71,X)          ; 81 71 | Update graphics data
    STA ($71,X)          ; 81 71 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    ROL $1E00,X          ; 3E 00 1E | Rotate left (absolute,X)
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_085
; Address: $EFA647
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_085:
    AND $7E61            ; 2D 61 7E | Logical AND with accumulator (absolute)
    ADC ($7E,X)          ; 61 7E | Add with carry ((zero page,X))
    EOR ($4E,X)          ; 41 4E | Exclusive OR with accumulator ((zero page,X))
    EOR ($4E,X)          ; 41 4E | Exclusive OR with accumulator ((zero page,X))
    ORA ($D1,X)          ; 01 D1 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BCS $00              ; B0 00 | Branch if carry set
    BCS $FB              ; B0 FB | Branch if carry set
    DEC $FFFB            ; CE FB FF | Decrement (absolute)
    NOP                  ; EA | No operation
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_086
; Address: $EFA66D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_086:
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    INC $FFFB,X          ; FE FB FF | Increment (absolute,X)
    NOP                  ; EA | No operation
    INC $FCDC,X          ; FE DC FC | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA ($F9,X)          ; 81 F9 | Update graphics data
    STA ($79,X)          ; 81 79 | Update graphics data
    BRA $74              ; 80 74 | Branch always
    BRA $74              ; 80 74 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BRA $70              ; 80 70 | Branch always
    BRA $70              ; 80 70 | Branch always
    BRA $86              ; 80 86 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BVS $70              ; 70 70 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STA ($6F,X)          ; 81 6F | Update graphics data
    BCS $B0              ; B0 B0 | Branch if carry set
    STA $F801,X          ; 9D 01 F8 | Update graphics data
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    ROR $F000,X          ; 7E 00 F0 | Rotate right (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    JMP $800B98          ; 5C 98 0B 80 | Jump to address long
    STA $050616          ; 8F 16 06 05 | Update graphics data
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA $E0EF,Y          ; 19 EF E0 | Game work RAM access
    BRA $23              ; 80 23 | Branch always
    BEQ $04              ; F0 04 | Branch if equal
    BVS $F8              ; 70 F8 | Branch if overflow set
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$06             ; E0 06 | Compare X register (immediate)
    BVS $1F              ; 70 1F | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    STZ $929C            ; 9C 9C 92 | Store zero to absolute
    BCC $0F              ; 90 0F | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA ($81,X)          ; 81 81 | Update graphics data
    ASL $200E            ; 0E 0E 20 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_087
; Address: $EFA70E
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_087:
    DEY                  ; 88 | Decrement Y register
    ROR $0100,X          ; 7E 00 01 | Rotate right (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $F9              ; 80 F9 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BPL $FF              ; 10 FF | Branch if positive
    SBC $FF16,X          ; FD 16 FF | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BMI $28              ; 30 28 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $7F30            ; 0E 30 7F | Arithmetic shift left (absolute)
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    ASL $001C,X          ; 1E 1C 00 | Arithmetic shift left (absolute,X)
    BMI $44              ; 30 44 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    INC $C5FE,X          ; FE FE C5 | Increment (absolute,X)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    JMP ($FF6C)          ; 6C 6C FF | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    AND $C0              ; 25 C0 | Logical AND with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BIT $0093            ; 2C 93 00 | Test bits in accumulator (absolute)
    BEQ $E9              ; F0 E9 | Branch if equal
    CPX $97              ; E4 97 | Compare X register (zero page)
    CPY $27              ; C4 27 | Compare Y register (zero page)
    PLY                  ; 7A | Pull Y register from stack
    LDY $69              ; A4 69 | Load from zero page into Y register
    CMP ($07,X)          ; C1 07 | Compare accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $FEFF14          ; 8F 14 FF FE | Update graphics data
    SBC $DFFE,X          ; FD FE DF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_088
; Address: $EFA7D9
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_088:
    INC $FEBF,X          ; FE BF FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BMI $F4              ; 30 F4 | Branch if negative
    BMI $F6              ; 30 F6 | Branch if negative
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $86              ; F0 86 | Branch if equal
    BPL $A1              ; 10 A1 | Branch if positive
    LDA #$77             ; A9 77 | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $60              ; 84 60 | Store Y register to zero page
    BRA $12              ; 80 12 | Branch always
    INY                  ; C8 | Increment Y register
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    ADC $5F78,Y          ; 79 78 5F | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    INX                  ; E8 | Increment X register
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $18FF,Y          ; F9 FF 18 | Subtract with carry (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BPL $80              ; 10 80 | Branch if positive
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    JMP $002F            ; 4C 2F 00 | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    XBA                  ; EB | Exchange accumulator bytes
    BCC $EE              ; 90 EE | Branch if carry clear
    BNE $1B              ; D0 1B | Branch if not equal
    LDY $F887,X          ; BC 87 F8 | Load from absolute,X into Y register
    CLD                  ; D8 | Clear decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX $DB              ; E4 DB | Compare X register (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    STY $60              ; 84 60 | Store Y register to zero page
    CPX #$03             ; E0 03 | Compare X register (immediate)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    STA $00FF00          ; 8F 00 FF 00 | Update graphics data
    BVS $07              ; 70 07 | Branch if overflow set
    PEA #$3000           ; F4 00 30 | Push effective address to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $57              ; D0 57 | Branch if not equal
    BNE $61              ; D0 61 | Branch if not equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_089
; Address: $EFA88B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_089:
    PEA #$7482           ; F4 82 74 | Push effective address to stack
    STA ($77,X)          ; 81 77 | Update graphics data
    SBC $7CAC,X          ; FD AC 7C | Subtract with carry (absolute,X)
    LDX $AE7E            ; AE 7E AE | Load from absolute address into X register
    ROR $7F9E,X          ; 7E 9E 7F | Rotate right (absolute,X)
    LDA $8F7F5F          ; AF 5F 7F 8F | Read graphics status
    ROR $1E8F,X          ; 7E 8F 1E | Rotate right (absolute,X)
    LSR $60BC,X          ; 5E BC 60 | Logical shift right (absolute,X)
    LDA $C500,X          ; BD 00 C5 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_08A
; Address: $EFA8A9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_08A:
    JSR $A0DF            ; 20 DF A0 | Jump to subroutine
    CPY #$A7             ; C0 A7 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    CPX #$62             ; E0 62 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_08D
; Address: $EFA8BA
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_08D:
    JSR $3FE1            ; 20 E1 3F | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $03              ; 80 03 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $73              ; 80 73 | Branch always
    CPY #$73             ; C0 73 | Compare Y register (immediate)
    CPY #$F3             ; C0 F3 | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY $CC03            ; CC 03 CC | Compare Y register (absolute)
    BEQ $03              ; F0 03 | Branch if equal
    BMI $08              ; 30 08 | Branch if negative
    ORA #$FB             ; 09 FB | Logical OR with accumulator (immediate)
    ORA $61FF,Y          ; 19 FF 61 | Logical OR with accumulator (absolute,Y)
    SBC $F4              ; E5 F4 | Subtract with carry (zero page)
    PHB                  ; 8B | Push data bank register to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    INC $1F              ; E6 1F | Increment (zero page)
    STZ $7F7F,X          ; 9E 7F 7F | Store zero to absolute,X
    BVC $71              ; 50 71 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_08F
; Address: $EFA930
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_08F:
    JSR $A0FF            ; 20 FF A0 | Jump to subroutine
    LDA $FFBFFF          ; AF FF BF FF | Read graphics status
    BMI $F4              ; 30 F4 | Branch if negative
    BMI $F6              ; 30 F6 | Branch if negative
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_090
; Address: $EFA960
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_090:
    SED                  ; F8 | Set decimal mode flag
    CPY $D3              ; C4 D3 | Compare Y register (zero page)
    PEA #$FA1F           ; F4 1F FA | Push effective address to stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ASL $0838,X          ; 1E 38 08 | Arithmetic shift left (absolute,X)
    CPY $74              ; C4 74 | Compare Y register (zero page)
    CPY $30              ; C4 30 | Compare Y register (zero page)
    BRA $30              ; 80 30 | Branch always
    BRA $00              ; 80 00 | Branch always
    STY $8808            ; 8C 08 88 | Store Y register to absolute address
    BMI $B0              ; 30 B0 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    JMP $44B3            ; 4C B3 44 | Jump to address
    JMP $62A3            ; 4C A3 62 | Jump to address
    CMP $3E              ; C5 3E | Compare accumulator (zero page)
    CPX #$16             ; E0 16 | Compare X register (immediate)
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    SBC $FF0D,X          ; FD 0D FF | Subtract with carry (absolute,X)
    SBC $5D0A,Y          ; F9 0A 5D | Subtract with carry (absolute,Y)
    LDA                  ; BF 3B DF 1F | Read graphics status
    SBC $F70C            ; ED 0C F7 | Subtract with carry (absolute)
    ASL $02F7            ; 0E F7 02 | Arithmetic shift left (absolute)
    SBC ($34),Y          ; F1 34 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    STX $A6              ; 86 A6 | Store X register to zero page
    BCC $D0              ; 90 D0 | Branch if carry clear
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SBC $CFDF            ; ED DF CF | Subtract with carry (absolute)
    ADC $FFFF,Y          ; 79 FF FF | Add with carry (absolute,Y)
    LDA                  ; BF FF 83 A8 | Read graphics status
    BNE $57              ; D0 57 | Branch if not equal
    BNE $61              ; D0 61 | Branch if not equal
    PEA #$F402           ; F4 02 F4 | Push effective address to stack
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    SBC $7CAC,X          ; FD AC 7C | Subtract with carry (absolute,X)
    LDX $AE7E            ; AE 7E AE | Load from absolute address into X register
    ROR $7F9E,X          ; 7E 9E 7F | Rotate right (absolute,X)
    LDA $0FFF5F          ; AF 5F FF 0F | Read graphics status
    INC $040F,X          ; FE 0F 04 | Increment (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LDX $26              ; A6 26 | Load from zero page into X register
    ADC #$48             ; 69 48 | Add with carry (immediate)
    BEQ $07              ; F0 07 | Branch if equal
    PEA #$E868           ; F4 68 E8 | Push effective address to stack
    BPL $70              ; 10 70 | Branch if positive
    DEC $1D              ; C6 1D | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_091
; Address: $EFAA13
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_091:
    INC $1C              ; E6 1C | Increment (zero page)
    LDA                  ; BF 18 FF 77 | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$30             ; E0 30 | Compare X register (immediate)
    LDY $4080,X          ; BC 80 40 | Load from absolute,X into Y register
    BRA $44              ; 80 44 | Branch always
    CPY $4C00            ; CC 00 4C | Compare Y register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    STY $5C2C            ; 8C 2C 5C | Store Y register to absolute address
    JMP ($4CB3)          ; 6C B3 4C | Jump to address (absolute indirect)
    CPY $CC33            ; CC 33 CC | Compare Y register (absolute)
    CPY $CCF3            ; CC F3 CC | Compare Y register (absolute)
    CPX $E07F            ; EC 7F E0 | Game work RAM access
    LDA $10F660          ; AF 60 F6 10 | Read graphics status
    PEA #$F513           ; F4 13 F5 | Push effective address to stack
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)
    PEA #$F602           ; F4 02 F6 | Push effective address to stack
    ASL $03FF            ; 0E FF 03 | Arithmetic shift left (absolute)
    ASL $0EF1            ; 0E F1 0E | Arithmetic shift left (absolute)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $39              ; 10 39 | Branch if positive
    STA ($AE),Y          ; 91 AE | Update graphics data
    CPY #$D3             ; C0 D3 | Compare Y register (immediate)
    LDX #$85             ; A2 85 | Load immediate value into X register
    ROL $0F              ; 26 0F | Rotate left (zero page)
    LDA #$49             ; A9 49 | Read graphics status
    BVC $FF              ; 50 FF | Branch if overflow clear
    LDA                  ; BF FF 14 F6 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    INC $CC              ; E6 CC | Increment (zero page)
    ADC ($D9,X)          ; 61 D9 | Add with carry ((zero page,X))
    CPY $CC47            ; CC 47 CC | Compare Y register (absolute)
    CPY $E21D            ; CC 1D E2 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 50 FF 1F | Read graphics status
    LSR $F8BF,X          ; 5E BF F8 | Logical shift right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STA $588F78          ; 8F 78 8F 58 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BIT $4870            ; 2C 70 48 | Test bits in accumulator (absolute)
    BEQ $8C              ; F0 8C | Branch if equal
    LDY $A00C,X          ; BC 0C A0 | Load from absolute,X into Y register
    STY $A34C            ; 8C 4C A3 | Store Y register to absolute address
    STZ $E3              ; 64 E3 | Store zero to zero page
    JMP ($E4CB)          ; 6C CB E4 | Jump to address (absolute indirect)
    CPY $CC03            ; CC 03 CC | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_092
; Address: $EFAABB
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_092:
    BRA $53              ; 80 53 | Branch always
    STY $C03F            ; 8C 3F C0 | Store Y register to absolute address
    ORA ($F3,X)          ; 01 F3 | Logical OR with accumulator ((zero page,X))
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    ORA ($F3,X)          ; 01 F3 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA $0DF3            ; 0D F3 0D | Logical OR with accumulator (absolute)
    BCS $AB              ; B0 AB | Branch if carry set
    AND #$2D             ; 29 2D | Logical AND with accumulator (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($91),Y          ; 11 91 | Logical OR with accumulator ((zero page),Y)
    EOR $4F0C,Y          ; 59 0C 4F | Exclusive OR with accumulator (absolute,Y)
    LDA                  ; BF D7 2F F5 | Read graphics status
    SBC $DEFF,X          ; FD FF DE | Subtract with carry (absolute,X)
    SBC ($CF,X)          ; E1 CF | Subtract with carry ((zero page,X))
    BMI $FF              ; 30 FF | Branch if negative
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    SEP #$05             ; E2 05 | Set processor status bits
    INC $F600,X          ; FE 00 F6 | Increment (absolute,X)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA $0FFD            ; 0D FD 0F | Logical OR with accumulator (absolute)
    ORA #$FA             ; 09 FA | Logical OR with accumulator (immediate)
    CMP $FB3F,X          ; DD 3F FB | Compare accumulator (absolute,X)
    ORA $07FC            ; 0D FC 07 | Logical OR with accumulator (absolute)
    INC $F207,X          ; FE 07 F2 | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX $D8C7            ; EC C7 D8 | Compare X register (absolute)
    BPL $6D              ; 10 6D | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    LDA $E538            ; AD 38 E5 | Read graphics status
    BEQ $C5              ; F0 C5 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    ADC $08              ; 65 08 | Add with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA $3DD2,X          ; 1D D2 3D | Logical OR with accumulator (absolute,X)
    AND $3DDA,X          ; 3D DA 3D | Logical AND with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $1D9A,X          ; 1D 9A 1D | Logical OR with accumulator (absolute,X)
    BRA $40              ; 80 40 | Branch always
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    CPY #$4C             ; C0 4C | Compare Y register (immediate)
    CPY $4C              ; C4 4C | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    JMP $4CCC            ; 4C CC 4C | Jump to address
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    CPY #$4C             ; C0 4C | Compare Y register (immediate)
    CPY $8C73            ; CC 73 8C | Compare Y register (absolute)
    STY $8877            ; 8C 77 88 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_093
; Address: $EFAB59
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_093:
    STY $7F              ; 84 7F | Store Y register to zero page
    BRA $73              ; 80 73 | Branch always
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    CMP ($0C,X)          ; C1 0C | Compare accumulator ((zero page,X))
    JMP $4E4F            ; 4C 4F 4E | Jump to address
    PHY                  ; 5A | Push Y register to stack
    ROR $77              ; 66 77 | Rotate right (zero page)
    LSR $67              ; 46 67 | Logical shift right (zero page)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    BEQ $14              ; F0 14 | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    INC $FF02,X          ; FE 02 FF | Increment (absolute,X)
    INC $FB1F            ; EE 1F FB | Increment (absolute)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    SBC $6503,X          ; FD 03 65 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    EOR $48              ; 45 48 | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $27              ; 80 27 | Branch always
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $1DFA,X          ; 1D FA 1D | Logical OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA $1D58,X          ; 1D 58 1D | Logical OR with accumulator (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    ORA $1DD8,X          ; 1D D8 1D | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA $1D18,X          ; 1D 18 1D | Logical OR with accumulator (absolute,X)
    CPY #$4C             ; C0 4C | Compare Y register (immediate)
    CPY #$4C             ; C0 4C | Compare Y register (immediate)
    JMP $4CDC            ; 4C DC 4C | Jump to address
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    CMP ($44,X)          ; C1 44 | Compare accumulator ((zero page,X))
    CMP $DC4C            ; CD 4C DC | Compare accumulator (absolute)
    JMP $8C73            ; 4C 73 8C | Jump to address
    STY $806F            ; 8C 6F 80 | Store Y register to absolute address
    BRA $73              ; 80 73 | Branch always
    STY $72              ; 84 72 | Store Y register to zero page
    STY $807E            ; 8C 7E 80 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_094
; Address: $EFABFF
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_094:
    BRA $F3              ; 80 F3 | Branch always
    ASL $0CE1            ; 0E E1 0C | Arithmetic shift left (absolute)
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    JMP ($2C00)          ; 6C 00 2C | Jump to address (absolute indirect)
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    CPY #$36             ; C0 36 | Compare Y register (immediate)
    CPY #$36             ; C0 36 | Compare Y register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    SBC $FE03,X          ; FD 03 FE | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $2701,X          ; FE 01 27 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    LDA $08AF18          ; AF 18 AF 08 | Read graphics status
    CLD                  ; D8 | Clear decimal mode flag
    BNE $1D              ; D0 1D | Branch if not equal
    BPL $1D              ; 10 1D | Branch if positive
    BVC $1F              ; 50 1F | Branch if overflow clear
    BVC $1D              ; 50 1D | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    ORA $1FD8,X          ; 1D D8 1F | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CMP $C14C,X          ; DD 4C C1 | Compare accumulator (absolute,X)
    CMP ($4C,X)          ; C1 4C | Compare accumulator ((zero page,X))
    CMP $4C              ; C5 4C | Compare accumulator (zero page)
    SBC $C94C,X          ; FD 4C C9 | Subtract with carry (absolute,X)
    JMP $4CFD            ; 4C FD 4C | Jump to address
    SBC $6E4C,X          ; FD 4C 6E | Subtract with carry (absolute,X)
    BRA $72              ; 80 72 | Branch always
    STY $8C72            ; 8C 72 8C | Store Y register to absolute address
    DEY                  ; 88 | Decrement Y register
    LSR $7A80            ; 4E 80 7A | Logical shift right (absolute)
    STY $4E              ; 84 4E | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_095
; Address: $EFAC9D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_095:
    BRA $4E              ; 80 4E | Branch always
    BRA $F3              ; 80 F3 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CMP ($0C,X)          ; C1 0C | Compare accumulator ((zero page,X))
    JMP $4C6C            ; 4C 6C 4C | Jump to address
    JMP ($7941)          ; 6C 41 79 | Jump to address (absolute indirect)
    EOR ($79,X)          ; 41 79 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_097
; Address: $EFACCE
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_097:
    JSR $C027            ; 20 27 C0 | Jump to subroutine
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $F7              ; 10 F7 | Branch if positive
    BPL $F7              ; 10 F7 | Branch if positive
    BPL $F7              ; 10 F7 | Branch if positive
    BPL $E7              ; 10 E7 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $1F08,X          ; 1D 08 1F | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SBC $FF18,X          ; FD 18 FF | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SBC $E14C            ; ED 4C E1 | Subtract with carry (absolute)
    JMP $4CE1            ; 4C E1 4C | Jump to address
    SBC $FD4C,X          ; FD 4C FD | Subtract with carry (absolute,X)
    JMP $4CE5            ; 4C E5 4C | Jump to address
    LDA $B14C,X          ; BD 4C B1 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LSR $5280,X          ; 5E 80 52 | Logical shift right (absolute,X)
    STY $8C52            ; 8C 52 8C | Store Y register to absolute address
    LSR $4E80            ; 4E 80 4E | Logical shift right (absolute)
    BRA $56              ; 80 56 | Branch always
    DEY                  ; 88 | Decrement Y register
    ASL $0EC0            ; 0E C0 0E | Arithmetic shift left (absolute)
    CPY #$F3             ; C0 F3 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_098
; Address: $EFAD40
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_098:
    JSR $233C            ; 20 3C 23 | Jump to subroutine
    BMI $38              ; 30 38 | Branch if negative
    BMI $3C              ; 30 3C | Branch if negative
    BVC $7F              ; 50 7F | Branch if overflow clear
    BMI $3C              ; 30 3C | Branch if negative
    BMI $3C              ; 30 3C | Branch if negative
    BVC $7F              ; 50 7F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_099
; Address: $EFAD50
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_099:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BNE $2F              ; D0 2F | Branch if not equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BNE $2F              ; D0 2F | Branch if not equal
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    JMP $FB4C            ; 4C 4C FB | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    BPL $09              ; 10 09 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    PLX                  ; FA | Pull X register from stack
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SBC $FF40,X          ; FD 40 FF | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 70 00 | Read graphics status
    BVS $70              ; 70 70 | Branch if overflow set
    LDA ($A1,X)          ; A1 A1 | Read graphics status
    STA $80428F          ; 8F 8F 42 80 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    STA                  ; 9F 40 20 8F | Update graphics data
    BPL $70              ; 10 70 | Branch if positive
    STA $FF00FF          ; 8F FF 00 FF | Update graphics data
    INC $8AFE,X          ; FE FE 8A | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    WDM #$42             ; 42 42 | Hardware register operation
    BRA $00              ; 80 00 | Branch always
    PHB                  ; 8B | Push data bank register to stack
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    ORA $3FC0,X          ; 1D C0 3F | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCC $FC              ; 90 FC | Branch if carry clear
    LSR $E700            ; 4E 00 E7 | Logical shift right (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STY $7C              ; 84 7C | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    LDA ($04),Y          ; B1 04 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF 00 00 78 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    CMP $4CCC            ; CD CC 4C | Compare accumulator (absolute)
    JMP $0033            ; 4C 33 00 | Jump to address

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_09A
; Address: $EFAE10
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_09A:
    LDA                  ; BF 00 9C 00 | Read graphics status
    INY                  ; C8 | Increment Y register
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPY $0023            ; CC 23 00 | Compare Y register (absolute)
    STA ($00,X)          ; 81 00 | Update graphics data
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CMP ($F2,X)          ; C1 F2 | Compare accumulator ((zero page,X))
    BRA $31              ; 80 31 | Branch always
    WDM #$BA             ; 42 BA | Reserved instruction
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF FF 3F 7F | Read graphics status
    SBC $FE7F,X          ; FD 7F FE | Subtract with carry (absolute,X)
    ASL $87              ; 06 87 | Arithmetic shift left (zero page)
    LDA                  ; BF 53 3F C5 | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    BRA $81              ; 80 81 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_09C
; Address: $EFAE50
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_09C:
    INC $FFC1,X          ; FE C1 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F FF 0F F0 | Update graphics data
    BEQ $00              ; F0 00 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    DEC $01              ; C6 01 | Decrement (zero page)
    DEX                  ; CA | Decrement X register
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ADC $4D00,X          ; 7D 00 4D | Add with carry (absolute,X)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $D7              ; 10 D7 | Branch if positive
    STY $80              ; 84 80 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $C79B1B          ; 8F 1B 9B C7 | Update graphics data
    LSR $0101,X          ; 5E 01 01 | Logical shift right (absolute,X)
    DEX                  ; CA | Decrement X register
    INC $F701,X          ; FE 01 F7 | Increment (absolute,X)
    CPX $7F              ; E4 7F | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$00F4           ; F4 F4 00 | Push effective address to stack
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BRA $9E              ; 80 9E | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_09D
; Address: $EFAEE8
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_09D:
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    AND $96FF,Y          ; 39 FF 96 | Logical AND with accumulator (absolute,Y)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    EOR ($F2,X)          ; 41 F2 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    SBC ($42),Y          ; F1 42 | Hardware register operation
    TSX                  ; BA | Transfer stack pointer to X register
    STA ($F9,X)          ; 81 F9 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 7F BF 7F | Read graphics status
    SBC $7E7F,X          ; FD 7F 7E | Subtract with carry (absolute,X)
    DEC $E731            ; CE 31 E7 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA #$FB             ; 09 FB | Logical OR with accumulator (immediate)
    STA $00CF38          ; 8F 38 CF 00 | Update graphics data
    ORA #$EE             ; 09 EE | Logical OR with accumulator (immediate)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    BVC $8F              ; 50 8F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_09E
; Address: $EFAF39
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_09E:
    JSR $00CF            ; 20 CF 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPX #$07             ; E0 07 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A0
; Address: $EFAFD5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A0:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    INC $0501,X          ; FE 01 05 | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    XBA                  ; EB | Exchange accumulator bytes
    BIT $1CF3            ; 2C F3 1C | Test bits in accumulator (absolute)
    ASL $E9              ; 06 E9 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A1
; Address: $EFB00E
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A1:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    BRA $3F              ; 80 3F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0B              ; F0 0B | Branch if equal
    INX                  ; E8 | Increment X register
    CPX $0013            ; EC 13 00 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    INC $7484,X          ; FE 84 74 | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDX #$00             ; A2 00 | Load immediate value into X register
    SBC ($10,X)          ; E1 10 | Subtract with carry ((zero page,X))
    BCC $F9              ; 90 F9 | Branch if carry clear
    PEA #$F003           ; F4 03 F0 | Push effective address to stack
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    STY $A8              ; 84 A8 | Store Y register to zero page
    CPX $1A              ; E4 1A | Compare X register (zero page)
    DEC $0021,X          ; DE 21 00 | Decrement (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $1F              ; 80 1F | Branch always
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDY $20              ; A4 20 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    STA ($FF,X)          ; 81 FF | Update graphics data
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $7C03,X          ; FE 03 7C | Increment (absolute,X)
    STA ($02,X)          ; 81 02 | Update graphics data
    CPX #$01             ; E0 01 | Compare X register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $83              ; 80 83 | Branch always
    BVS $B1              ; 70 B1 | Branch if overflow set
    JMP $1AE4            ; 4C E4 1A | Jump to address
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC ($BF),Y          ; F1 BF | Subtract with carry ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$3F             ; A0 3F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A2
; Address: $EFB0BF
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A2:
    BRA $00              ; 80 00 | Branch always
    STA ($FF,X)          ; 81 FF | Update graphics data
    STA ($FF,X)          ; 81 FF | Update graphics data
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $7C83,X          ; FE 83 7C | Increment (absolute,X)
    BEQ $8F              ; F0 8F | Branch if equal
    SBC $FE32,X          ; FD 32 FE | Subtract with carry (absolute,X)
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    BRA $1A              ; 80 1A | Branch always
    SBC $33EC,X          ; FD EC 33 | Subtract with carry (absolute,X)
    STX $D751            ; 8E 51 D7 | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    SBC $BC              ; E5 BC | Subtract with carry (zero page)
    PLY                  ; 7A | Pull Y register from stack
    LDA $FF              ; A5 FF | Read graphics status
    ROR $03FC,X          ; 7E FC 03 | Rotate right (absolute,X)
    BEQ $07              ; F0 07 | Branch if equal
    BNE $27              ; D0 27 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    AND ($E4,X)          ; 21 E4 | Logical AND with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $402F            ; CC 2F 40 | Compare Y register (absolute)
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A4
; Address: $EFB12A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A4:
    JSR $62BB            ; 20 BB 62 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A5
; Address: $EFB130
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A5:
    LDA #$06             ; A9 06 | Read graphics status
    PHB                  ; 8B | Push data bank register to stack
    INY                  ; C8 | Increment Y register
    LDY $40              ; A4 40 | Load from zero page into Y register
    ORA $D310,Y          ; 19 10 D3 | Logical OR with accumulator (absolute,Y)
    BRA $2F              ; 80 2F | Branch always
    DEC $DE00            ; CE 00 DE | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $DF00,X          ; 5D 00 DF | Exclusive OR with accumulator (absolute,X)
    STX $60              ; 86 60 | Store X register to zero page
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BCC $40              ; 90 40 | Branch if carry clear
    BVC $21              ; 50 21 | PPU graphics register access
    BMI $01              ; 30 01 | Branch if negative
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A6
; Address: $EFB15D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A6:
    JSL $002006          ; 22 06 20 00 | Jump to subroutine long
    ASL $E1              ; 06 E1 | Arithmetic shift left (zero page)
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    ROR $00              ; 66 00 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A7
; Address: $EFB16D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A7:
    CLC                  ; 18 | Clear carry flag
    LDA $003F,X          ; BD 3F 00 | Read graphics status
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0A8
; Address: $EFB178
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0A8:
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    WDM #$A5             ; 42 A5 | Reserved instruction
    WDM #$40             ; 42 40 | Reserved instruction
    CLD                  ; D8 | Clear decimal mode flag
    PHB                  ; 8B | Push data bank register to stack
    INY                  ; C8 | Increment Y register
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    ORA $99              ; 05 99 | Logical OR with accumulator (zero page)
    CMP $F626,Y          ; D9 26 F6 | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ADC $6F02,X          ; 7D 02 6F | Add with carry (absolute,X)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    DEC $FE20            ; CE 20 FE | Decrement (absolute)
    LDY #$9D             ; A0 9D | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0AA
; Address: $EFB1B4
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0AA:
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BNE $21              ; D0 21 | PPU graphics register access
    SED                  ; F8 | Set decimal mode flag
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    WDM #$FF             ; 42 FF | Reserved instruction
    ASL $67E1,X          ; 1E E1 67 | Arithmetic shift left (absolute,X)
    STZ $6719,X          ; 9E 19 67 | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    LDA $00FF,X          ; BD FF 00 | Read graphics status
    BRA $1F              ; 80 1F | Branch always
    LDY #$03             ; A0 03 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CMP $D734,Y          ; D9 34 D7 | Compare accumulator (absolute,Y)
    PHB                  ; 8B | Push data bank register to stack
    INY                  ; C8 | Increment Y register
    CPX $DF              ; E4 DF | Compare X register (zero page)
    ADC $F9              ; 65 F9 | Add with carry (zero page)
    STZ $FB              ; 64 FB | Store zero to zero page

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0AB
; Address: $EFB1F1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0AB:
    JSR $08F7            ; 20 F7 08 | Jump to subroutine
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    SBC $9E              ; E5 9E | Subtract with carry (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $FD2A            ; ED 2A FD | Subtract with carry (absolute)
    CMP ($3A),Y          ; D1 3A | Compare accumulator ((zero page),Y)
    DEC $FC21,X          ; DE 21 FC | Decrement (absolute,X)
    STZ $DE23,X          ; 9E 23 DE | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0AC
; Address: $EFB210
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0AC:
    INC $EC01,X          ; FE 01 EC | Increment (absolute,X)
    ORA ($FC),Y          ; 11 FC | Logical OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    ORA $DE              ; 05 DE | Logical OR with accumulator (zero page)
    AND ($FC,X)          ; 21 FC | Logical AND with accumulator ((zero page,X))
    LDX $FE40,Y          ; BE 40 FE | Load from absolute,Y into X register
    BRA $7F              ; 80 7F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0AD
; Address: $EFB223
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0AD:
    STA                  ; 9F 30 CF 14 | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    DEC $66              ; C6 66 | Decrement (zero page)
    BRA $3F              ; 80 3F | Branch always
    DEY                  ; 88 | Decrement Y register
    STX $1F              ; 86 1F | Store X register to zero page
    BRA $0B              ; 80 0B | Branch always
    STA ($0D,X)          ; 81 0D | Update graphics data
    BRA $0A              ; 80 0A | Branch always
    BRA $0F              ; 80 0F | Branch always
    CLC                  ; 18 | Clear carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CPX #$7D             ; E0 7D | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0AE
; Address: $EFB268
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0AE:
    JSR $40FD            ; 20 FD 40 | Jump to subroutine
    ADC $7D22,X          ; 7D 22 7D | Add with carry (absolute,X)
    ADC $00E1,X          ; 7D E1 00 | Add with carry (absolute,X)
    BPL $90              ; 10 90 | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0AF
; Address: $EFB275
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0AF:
    JSR $02E0            ; 20 E0 02 | Jump to subroutine
    BEQ $02              ; F0 02 | Branch if equal
    INC $3F00,X          ; FE 00 3F | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    LDA $DB18,X          ; BD 18 DB | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0B0
; Address: $EFB285
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0B0:
    CMP $DD44,Y          ; D9 44 DD | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $40              ; 66 40 | Rotate right (zero page)
    CMP $9900,Y          ; D9 00 99 | Compare accumulator (absolute,Y)
    WDM #$A4             ; 42 A4 | Reserved instruction
    BIT #$10             ; 89 10 | Test bits in accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BIT $42              ; 24 42 | Hardware register operation
    LDA $00B700          ; AF 00 B7 00 | Read graphics status
    DEY                  ; 88 | Decrement Y register
    PHB                  ; 8B | Push data bank register to stack
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    STX $0053            ; 8E 53 00 | Store X register to absolute address
    EOR ($08,X)          ; 41 08 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0B1
; Address: $EFB2B4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0B1:
    PHA                  ; 48 | Push accumulator to stack
    BIT $46              ; 24 46 | Test bits in accumulator (zero page)
    AND ($44),Y          ; 31 44 | Logical AND with accumulator ((zero page),Y)
    BMI $42              ; 30 42 | Hardware register operation
    BMI $45              ; 30 45 | Branch if negative
    BMI $C0              ; 30 C0 | Branch if negative
    AND ($E0),Y          ; 31 E0 | Game work RAM access
    BPL $EF              ; 10 EF | Branch if positive
    BMI $DF              ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0B2
; Address: $EFB2C6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0B2:
    JSL $DD023D          ; 22 3D 02 DD | Jump to subroutine long
    LDA $5D02,X          ; BD 02 5D | Read graphics status
    ADC $18E7,X          ; 7D E7 18 | Add with carry (absolute,X)
    BRA $2F              ; 80 2F | Branch always
    LDA $DB18,X          ; BD 18 DB | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0B3
; Address: $EFB2E5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0B3:
    CMP $BD24,Y          ; D9 24 BD | Compare accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $99              ; E6 99 | Increment (zero page)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    ROR $BD              ; 66 BD | Rotate right (zero page)
    STA ($42,X)          ; 81 42 | Hardware register operation
    CPX $00              ; E4 00 | Compare X register (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 FF 00 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    BIT $179B            ; 2C 9B 17 | Test bits in accumulator (absolute)
    STX $8F04            ; 8E 04 8F | Store X register to absolute address
    STX $CA40            ; 8E 40 CA | Store X register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0B5
; Address: $EFB317
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0B5:
    JSR $3047            ; 20 47 30 | Jump to subroutine
    WDM #$31             ; 42 31 | Reserved instruction
    CMP $30              ; C5 30 | Compare accumulator (zero page)
    CPX #$11             ; E0 11 | Compare X register (immediate)
    INC $13              ; E6 13 | Increment (zero page)
    INC $DE33            ; EE 33 DE | Increment (absolute)
    ROR $FE23,X          ; 7E 23 FE | Rotate right (absolute,X)
    ROR $FEA3,X          ; 7E A3 FE | Rotate right (absolute,X)
    ROR $19E6,X          ; 7E E6 19 | Rotate right (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    STA ($FE,X)          ; 81 FE | Update graphics data
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    STA ($04,X)          ; 81 04 | Update graphics data
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0B6
; Address: $EFB36E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0B6:
    PHP                  ; 08 | Push processor status to stack
    BRA $0F              ; 80 0F | Branch always
    BRA $0B              ; 80 0B | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($09,X)          ; 81 09 | Update graphics data
    STA ($09,X)          ; 81 09 | Update graphics data
    BVS $00              ; 70 00 | Branch if overflow set
    SBC $9D02,X          ; FD 02 9D | Subtract with carry (absolute,X)
    ORA $5D40,X          ; 1D 40 5D | Logical OR with accumulator (absolute,X)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$21             ; C0 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0B9
; Address: $EFB3C2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0B9:
    JSR $20FB            ; 20 FB 20 | Jump to subroutine
    STZ $D9              ; 64 D9 | Store zero to zero page
    ROR $DB              ; 66 DB | Rotate right (zero page)
    ROL $9B              ; 26 9B | Rotate left (zero page)
    LDA $BD02,X          ; BD 02 BD | Read graphics status
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    PEA #$FE00           ; F4 00 FE | Push effective address to stack
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0BA
; Address: $EFB3E2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0BA:
    BPL $8B              ; 10 8B | Branch if positive
    DEY                  ; 88 | Decrement Y register
    STY $8800            ; 8C 00 88 | Store Y register to absolute address
    TXA                  ; 8A | Transfer X register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0BB
; Address: $EFB3F1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0BB:
    BPL $50              ; 10 50 | Branch if positive
    BIT $4C              ; 24 4C | Test bits in accumulator (zero page)
    LSR $31              ; 46 31 | Logical shift right (zero page)
    BMI $C5              ; 30 C5 | Branch if negative
    BMI $C4              ; 30 C4 | Branch if negative
    BMI $E4              ; 30 E4 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    SBC $9D00,X          ; FD 00 9D | Subtract with carry (absolute,X)
    ORA $5D40,X          ; 1D 40 5D | Logical OR with accumulator (absolute,X)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR $BDA0,X          ; 5D A0 BD | Exclusive OR with accumulator (absolute,X)
    CPX #$FD             ; E0 FD | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0BE
; Address: $EFB41C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0BE:
    JSR $3042            ; 20 42 30 | Jump to subroutine
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    STA $9900,Y          ; 99 00 99 | Update graphics data
    LDA $BD00,X          ; BD 00 BD | Read graphics status
    BIT $43              ; 24 43 | Test bits in accumulator (zero page)
    BIT $42              ; 24 42 | Hardware register operation
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$70             ; 42 70 | Reserved instruction
    CPY $CC75            ; CC 75 CC | Compare Y register (absolute)
    CPY $CC74            ; CC 74 CC | Compare Y register (absolute)
    STY $8C14            ; 8C 14 8C | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SBC $7C02,X          ; FD 02 7C | Subtract with carry (absolute,X)
    JMP $FE0323          ; 5C 23 03 FE | Jump to address long
    STZ $1E03,X          ; 9E 03 1E | Store zero to absolute,X
    CMP ($5C,X)          ; C1 5C | Compare accumulator ((zero page,X))
    ORA $3D20,X          ; 1D 20 3D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0BF
; Address: $EFB46C
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0BF:
    JSR $223D            ; 20 3D 22 | Jump to subroutine
    ASL $2E01,X          ; 1E 01 2E | Arithmetic shift left (absolute,X)
    EOR ($26,X)          ; 41 26 | Exclusive OR with accumulator ((zero page,X))
    CMP ($A2,X)          ; C1 A2 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    STY $7B              ; 84 7B | Store Y register to zero page
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    PEA #$FC0B           ; F4 0B FC | Push effective address to stack
    BRA $10              ; 80 10 | Branch always
    PHB                  ; 8B | Push data bank register to stack
    BEQ $30              ; F0 30 | Branch if equal
    STA                  ; 9F 2F CF 30 | Update graphics data
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $6F              ; F0 6F | Branch if equal
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    DEC $38              ; C6 38 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    STA $01              ; 85 01 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    ORA $00E6,Y          ; 19 E6 00 | Logical OR with accumulator (absolute,Y)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C0
; Address: $EFB500
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C0:
    INX                  ; E8 | Increment X register
    BPL $F7              ; 10 F7 | Branch if positive
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    PEA #$2F08           ; F4 08 2F | Push effective address to stack
    BNE $3F              ; D0 3F | Branch if not equal
    BPL $0F              ; 10 0F | Branch if positive
    BEQ $01              ; F0 01 | Branch if equal
    BPL $0C              ; 10 0C | Branch if positive
    DEX                  ; CA | Decrement X register
    DEC $0202            ; CE 02 02 | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    DEC $39              ; C6 39 | Decrement (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    STA $00              ; 85 00 | Update graphics data
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    BCS $00              ; B0 00 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BVS $FF              ; 70 FF | Branch if overflow set
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    INX                  ; E8 | Increment X register
    CPX $13              ; E4 13 | Compare X register (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $3E3B            ; CE 3B 3E | Decrement (absolute)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    CMP $FC              ; C5 FC | Compare accumulator (zero page)
    INC $BE00,X          ; FE 00 BE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    INC $3401,X          ; FE 01 34 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SBC $01FE,Y          ; F9 FE 01 | Subtract with carry (absolute,Y)
    LDA                  ; BF 40 26 D9 | Read graphics status
    NOP                  ; EA | No operation
    ASL $08F1            ; 0E F1 08 | Arithmetic shift left (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C1
; Address: $EFB5C6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C1:
    JSR $18DF            ; 20 DF 18 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    BPL $DF              ; 10 DF | Branch if positive
    BCC $DF              ; 90 DF | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    STX $A7              ; 86 A7 | Store X register to zero page
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C3
; Address: $EFB5F6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C3:
    SEI                  ; 78 | Set interrupt disable flag
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $2CE1,X          ; 1E E1 2C | Arithmetic shift left (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $4F              ; B0 4F | Branch if carry set

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C4
; Address: $EFB60E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C4:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    SBC $F700,X          ; FD 00 F7 | Subtract with carry (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C5
; Address: $EFB61A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C5:
    JSR $009F            ; 20 9F 00 | Jump to subroutine
    STA                  ; 9F 40 3F C0 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 30 CF 08 | Read graphics status
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CMP $F708            ; CD 08 F7 | Compare accumulator (absolute)
    STY $0173            ; 8C 73 01 | Store Y register to absolute address
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CMP $46              ; C5 46 | Compare accumulator (zero page)
    LDA ($7E,X)          ; A1 7E | Read graphics status
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C6
; Address: $EFB686
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C6:
    DEC $9CF0            ; CE F0 9C | Decrement (absolute)
    CLV                  ; B8 | Clear overflow flag
    LDX $F1              ; A6 F1 | Load from zero page into X register
    INC $5E91            ; EE 91 5E | Increment (absolute)
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    INC $FAB0,X          ; FE B0 FA | Increment (absolute,X)
    AND ($FC,X)          ; 21 FC | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C7
; Address: $EFB699
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C7:
    PLX                  ; FA | Pull X register from stack
    EOR ($F6,X)          ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
    INC $FEE0,X          ; FE E0 FE | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0C9
; Address: $EFB6AB
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0C9:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ROL $0041,X          ; 3E 41 00 | Rotate left (absolute,X)
    BRA $3F              ; 80 3F | Branch always
    BRA $3F              ; 80 3F | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Update graphics data
    CPX $F00F            ; EC 0F F0 | Compare X register (absolute)
    CPY #$7B             ; C0 7B | Compare Y register (immediate)
    STY $E1              ; 84 E1 | Store Y register to zero page
    ASL $8778,X          ; 1E 78 87 | Arithmetic shift left (absolute,X)
    JMP $43B3            ; 4C B3 43 | Jump to address
    LDY $FF00,X          ; BC 00 FF | Load from absolute,X into Y register
    LDA                  ; BF 80 3F 80 | Read graphics status
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $7F01,X          ; FE 01 7F | Increment (absolute,X)
    BRA $3F              ; 80 3F | Branch always
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    ROR                  ; 6A | Rotate right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $CEA9            ; CD A9 CE | Compare accumulator (absolute)
    INC $9E31            ; EE 31 9E | Increment (absolute)
    SBC ($BA,X)          ; E1 BA | Subtract with carry ((zero page,X))
    STY $22              ; 84 22 | Store Y register to zero page
    JMP $F1DC62          ; 5C 62 DC F1 | Jump to address long
    INC $FEF0,X          ; FE F0 FE | Increment (absolute,X)
    BVS $FE              ; 70 FE | Branch if overflow set
    CMP ($F6,X)          ; C1 F6 | Compare accumulator ((zero page,X))
    INC $FE41,X          ; FE 41 FE | Increment (absolute,X)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    STA ($DE,X)          ; 81 DE | Update graphics data
    ROL $6EC1,X          ; 3E C1 6E | Rotate left (absolute,X)
    BCC $66              ; 90 66 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $413E            ; 4C 3E 41 | Jump to address
    JMP ($6C10)          ; 6C 10 6C | Jump to address (absolute indirect)
    BPL $00              ; 10 00 | Branch if positive
    BMI $01              ; 30 01 | Branch if negative
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    STA ($1E,X)          ; 81 1E | Update graphics data
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    BVS $8F              ; 70 8F | Branch if overflow set
    ROR $7F81,X          ; 7E 81 7F | Rotate right (absolute,X)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0CA
; Address: $EFB76C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0CA:
    LDX $5E41,Y          ; BE 41 5E | Load from absolute,Y into X register
    LDA ($80,X)          ; A1 80 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    BRA $0D              ; 80 0D | Branch always
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BNE $01              ; D0 01 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0CB
; Address: $EFB77E
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0CB:
    STA ($30,X)          ; 81 30 | Update graphics data
    NOP                  ; EA | No operation
    REP #$3D             ; C2 3D | Reset processor status bits
    CPX $7C42            ; EC 42 7C | Compare X register (absolute)
    JMP $C29CE2          ; 5C E2 9C C2 | Jump to address long
    AND $FD82,X          ; 3D 82 FD | Logical AND with accumulator (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($FE,X)          ; 81 FE | Update graphics data
    STA ($FE,X)          ; 81 FE | Update graphics data
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STZ $9A              ; 64 9A | Store zero to zero page
    ROR $98              ; 66 98 | Rotate right (zero page)
    STZ $1B              ; 64 1B | Store zero to zero page
    STZ $1B              ; 64 1B | Store zero to zero page
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    BRA $3C              ; 80 3C | Branch always
    BRA $3C              ; 80 3C | Branch always
    BRA $3C              ; 80 3C | Branch always
    INC $19              ; E6 19 | Increment (zero page)
    LDA                  ; BF 40 9F 60 | Read graphics status
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    LDX $DF00,Y          ; BE 00 DF | Load from absolute,Y into X register
    ADC $FE00,X          ; 7D 00 FE | Add with carry (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    JMP ($6E10)          ; 6C 10 6E | Jump to address (absolute indirect)
    STZ $18              ; 64 18 | Store zero to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    STA ($3C,X)          ; 81 3C | Update graphics data
    STA ($3C,X)          ; 81 3C | Update graphics data
    BRA $3C              ; 80 3C | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0CC
; Address: $EFB820
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0CC:
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ROR $7E81,X          ; 7E 81 7E | Rotate right (absolute,X)
    STA ($7F,X)          ; 81 7F | Update graphics data
    BRA $FF              ; 80 FF | Branch always
    ROR $6C81,X          ; 7E 81 6C | Rotate right (absolute,X)
    STA ($74,X)          ; 81 74 | Update graphics data
    BRA $78              ; 80 78 | Branch always
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $017C,X          ; FE 7C 01 | Increment (absolute,X)
    ROR $6E12            ; 6E 12 6E | Rotate right (absolute)
    ROR $1A              ; 66 1A | Rotate right (zero page)
    ROR $1A              ; 66 1A | Rotate right (zero page)
    ROR $1A              ; 66 1A | Rotate right (zero page)
    ROR $1A              ; 66 1A | Rotate right (zero page)
    STZ $18              ; 64 18 | Store zero to zero page
    STA ($3C,X)          ; 81 3C | Update graphics data
    STA ($3C,X)          ; 81 3C | Update graphics data
    STA ($3C,X)          ; 81 3C | Update graphics data
    STA ($3C,X)          ; 81 3C | Update graphics data
    STA ($3C,X)          ; 81 3C | Update graphics data
    STA ($3C,X)          ; 81 3C | Update graphics data
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    ROR $3F80,X          ; 7E 80 3F | Rotate right (absolute,X)
    BRA $4E              ; 80 4E | Branch always
    ADC $7C00,Y          ; 79 00 7C | Add with carry (absolute,Y)
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    ADC $FD02,X          ; 7D 02 FD | Add with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    STZ $18              ; 64 18 | Store zero to zero page
    BIT $5A              ; 24 5A | Test bits in accumulator (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    ROL $DB              ; 26 DB | Rotate left (zero page)
    STZ $9B              ; 64 9B | Store zero to zero page
    ADC $9B              ; 65 9B | Add with carry (zero page)
    ADC $9B              ; 65 9B | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0CD
; Address: $EFB8CE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0CD:
    STZ $9B              ; 64 9B | Store zero to zero page
    CMP ($3C,X)          ; C1 3C | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    WDM #$3C             ; 42 3C | Reserved instruction
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0CE
; Address: $EFB8EB
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0CE:
    JSR $30CF            ; 20 CF 30 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    BRA $7E              ; 80 7E | Branch always
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 00 FF 00 | Read graphics status
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA                  ; 9F 00 FF 00 | Update graphics data
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    SBC $1B              ; E5 1B | Subtract with carry (zero page)
    DEY                  ; 88 | Decrement Y register
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    BRA $1C              ; 80 1C | Branch always
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BNE $2F              ; D0 2F | Branch if not equal
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0CF
; Address: $EFBA0C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0CF:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SEP #$1D             ; E2 1D | Set processor status bits
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PEA #$F70B           ; F4 0B F7 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    INC $19              ; E6 19 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    BRA $3C              ; 80 3C | Branch always
    BRA $3D              ; 80 3D | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SBC $0002,X          ; FD 02 00 | Subtract with carry (absolute,X)
    NOP                  ; EA | No operation
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    BRA $DF              ; 80 DF | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D1
; Address: $EFBACC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D1:
    ROR $B89F,X          ; 7E 9F B8 | Rotate right (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    PHX                  ; DA | Push X register to stack
    AND $3CDB,X          ; 3D DB 3C | Logical AND with accumulator (absolute,X)
    STA $7E8570          ; 8F 70 85 7E | Update graphics data
    STA                  ; 9F 93 7E 71 | Update graphics data
    INC $F778,X          ; FE 78 F7 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    BRA $7F              ; 80 7F | Branch always
    BRA $DF              ; 80 DF | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D2
; Address: $EFBB05
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D2:
    JSR $609F            ; 20 9F 60 | Jump to subroutine
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    INC $471F,X          ; FE 1F 47 | Increment (absolute,X)
    BVC $00              ; 50 00 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D3
; Address: $EFBB1F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D3:
    PHP                  ; 08 | Push processor status to stack
    AND $3DDB,X          ; 3D DB 3D | Logical AND with accumulator (absolute,X)
    STA $7F8571          ; 8F 71 85 7F | Update graphics data
    STZ $7E92,X          ; 9E 92 7E | Store zero to absolute,X
    ROR $FF71,X          ; 7E 71 FF | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC $F0FE,Y          ; F9 FE F0 | Subtract with carry (absolute,Y)
    ORA $FD02            ; 0D 02 FD | Logical OR with accumulator (absolute)
    BVS $FF              ; 70 FF | Branch if overflow set
    ROL $4000,X          ; 3E 00 40 | Rotate left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D4
; Address: $EFBB66
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D4:
    DEC $FE00,X          ; DE 00 FE | Decrement (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $FF              ; 30 FF | Branch if negative
    BRA $FF              ; 80 FF | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $9FFF,X          ; 3E FF 9F | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D5
; Address: $EFBB84
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D5:
    STA                  ; 9F 00 3F 00 | Update graphics data
    INC $FF3C,X          ; FE 3C FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    INC $B300,X          ; FE 00 B3 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    STA $86              ; 85 86 | Update graphics data
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STZ $81              ; 64 81 | Store zero to zero page
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    STY $8F70            ; 8C 70 8F | Store Y register to absolute address
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    ORA $C7EE,Y          ; 19 EE C7 | Logical OR with accumulator (absolute,Y)
    DEC $04A4            ; CE A4 04 | Decrement (absolute)
    DEX                  ; CA | Decrement X register
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D6
; Address: $EFBC02
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D6:
    CPY $F83F            ; CC 3F F8 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    INC $80FF,X          ; FE FF 80 | Increment (absolute,X)
    STY $04              ; 84 04 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    SBC $71F7,Y          ; F9 F7 71 | Subtract with carry (absolute,Y)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    TAX                  ; AA | Transfer accumulator to X register
    BPL $10              ; 10 10 | Branch if positive
    BVS $70              ; 70 70 | Branch if overflow set
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    DEC $C6              ; C6 C6 | Decrement (zero page)
    INC $FFC0,X          ; FE C0 FF | Increment (absolute,X)
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    BRA $F0              ; 80 F0 | Branch always
    CPX #$FD             ; E0 FD | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D7
; Address: $EFBC81
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D7:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA $38FB,X          ; 1D FB 38 | Logical OR with accumulator (absolute,X)
    ROL $38C7,X          ; 3E C7 38 | Rotate left (absolute,X)
    LDY $CE80,X          ; BC 80 CE | Load from absolute,X into Y register
    ASL $CF              ; 06 CF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    SBC $CF38,Y          ; F9 38 CF | Subtract with carry (absolute,Y)
    BNE $D0              ; D0 D0 | Branch if not equal
    STA ($6E),Y          ; 91 6E | Update graphics data
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ASL $140E            ; 0E 0E 14 | Arithmetic shift left (absolute)
    BCS $CF              ; B0 CF | Branch if carry set
    BVS $4F              ; 70 4F | Branch if overflow set
    EOR $F47B            ; 4D 7B F4 | Exclusive OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D8
; Address: $EFBCF4
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D8:
    LDY $9E80,X          ; BC 80 9E | Load from absolute,X into Y register
    STZ $8080,X          ; 9E 80 80 | Store zero to absolute,X
    BRA $00              ; 80 00 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    BNE $D0              ; D0 D0 | Branch if not equal
    STA ($6E),Y          ; 91 6E | Update graphics data
    ROL $F8FF,X          ; 3E FF F8 | Rotate left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    INC $E1F0,X          ; FE F0 E1 | Increment (absolute,X)
    ASL $3000            ; 0E 00 30 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $C0F8,X          ; FE F8 C0 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BEQ $9F              ; F0 9F | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $F0FC,X          ; 3E FC F0 | Rotate left (absolute,X)
    DEC $8000,X          ; DE 00 80 | Decrement (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $FB              ; 30 FB | Branch if negative
    BEQ $FD              ; F0 FD | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ASL $3FFF            ; 0E FF 3F | Arithmetic shift left (absolute)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BMI $FC              ; 30 FC | Branch if negative
    BRA $D0              ; 80 D0 | Branch always
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    BVS $F8              ; 70 F8 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SBC $DCF9,Y          ; F9 F9 DC | Subtract with carry (absolute,Y)
    CPX #$DD             ; E0 DD | Compare X register (immediate)
    SBC $E1              ; E5 E1 | Subtract with carry (zero page)
    SBC $C7C3,X          ; FD C3 C7 | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    REP #$FE             ; C2 FE | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    CMP $23              ; C5 23 | Compare accumulator (zero page)
    AND ($B9,X)          ; 21 B9 | Logical AND with accumulator ((zero page,X))
    STA ($B9,X)          ; 81 B9 | Update graphics data
    STA ($85,X)          ; 81 85 | Update graphics data
    STA $59              ; 85 59 | Update graphics data
    LDA                  ; BF 7B DF 5B | Read graphics status
    STA $F2E18F          ; 8F 8F E1 F2 | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0D9
; Address: $EFBE0A
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0D9:
    BCS $BC              ; B0 BC | Branch if carry set
    BPL $10              ; 10 10 | Branch if positive
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    CMP ($51),Y          ; D1 51 | Compare accumulator ((zero page),Y)
    BEQ $80              ; F0 80 | Branch if equal
    BIT $5320            ; 2C 20 53 | Test bits in accumulator (absolute)
    BPL $D8              ; 10 D8 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEP #$83             ; E2 83 | Set processor status bits
    ADC $25DB            ; 6D DB 25 | Add with carry (absolute)
    EOR #$40             ; 49 40 | Exclusive OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ADC $7B9F,Y          ; 79 9F 7B | Add with carry (absolute,Y)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    ASL $38FE            ; 0E FE 38 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    REP #$FF             ; C2 FF | Reset processor status bits
    ROL $E0FF,X          ; 3E FF E0 | Game work RAM access
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDA                  ; BF 80 CC C3 | Read graphics status
    INC $3CFF,X          ; FE FF 3C | Increment (absolute,X)
    AND $CDCC,X          ; 3D CC CD | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0DA
; Address: $EFBF06
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0DA:
    CMP $D9FD            ; CD FD D9 | Compare accumulator (absolute)
    INC $F1FF,X          ; FE FF F1 | Increment (absolute,X)
    INC $FBF4,X          ; FE F4 FB | Increment (absolute,X)
    DEC $04              ; C6 04 | Decrement (zero page)
    ROL $430C,X          ; 3E 0C 43 | Rotate left (absolute,X)
    EOR ($58,X)          ; 41 58 | Exclusive OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $26              ; 26 26 | Rotate left (zero page)
    BPL $10              ; 10 10 | Branch if positive
    INC $C0FE,X          ; FE FE C0 | Increment (absolute,X)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    ROR $5E7E,X          ; 7E 7E 5E | Rotate right (absolute,X)
    DEC $F074            ; CE 74 F0 | Decrement (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    BRA $B6              ; 80 B6 | Branch always
    STX $8D              ; 86 8D | Store X register to zero page
    AND $4B1C            ; 2D 1C 4B | Logical AND with accumulator (absolute)
    CPX $BDEF            ; EC EF BD | Compare X register (absolute)
    LDY #$59             ; A0 59 | Load immediate value into Y register
    LDX $FEBF,Y          ; BE BF FE | Load from absolute,Y into X register
    LDA                  ; BF FE BE FF | Read graphics status
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $0201,Y          ; 19 01 02 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LDX $2EAE            ; AE AE 2E | Load from absolute address into X register
    ROL $0A0A            ; 2E 0A 0A | Rotate left (absolute)
    SBC $80              ; E5 80 | Subtract with carry (zero page)
    LDA ($DF,X)          ; A1 DF | Read graphics status
    LDA $2D73            ; AD 73 2D | Read graphics status
    AND $FFF7            ; 2D F7 FF | Logical AND with accumulator (absolute)
    LDA                  ; BF EF FF 37 | Read graphics status
    STA ($81,X)          ; 81 81 | Update graphics data
    AND ($21,X)          ; 21 21 | PPU graphics register access
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BVS $7F              ; 70 7F | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0DB
; Address: $EFBF9A
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0DB:
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ROL $F8FF,X          ; 3E FF F8 | Rotate left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    ASL $3000            ; 0E 00 30 | Arithmetic shift left (absolute)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    BEQ $30              ; F0 30 | Branch if equal
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $1F              ; F0 1F | Branch if equal
    PLX                  ; FA | Pull X register from stack
    SBC $FFF8,X          ; FD F8 FF | Subtract with carry (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    ORA $EF01            ; 0D 01 EF | Logical OR with accumulator (absolute)
    INC $E6              ; E6 E6 | Increment (zero page)
    CMP #$C9             ; C9 C9 | Compare accumulator (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    STA                  ; 9F FF 8F FF | Update graphics data
    CPY $C0D9            ; CC D9 C0 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0DC
; Address: $EFC037
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0DC:
    JSR $2016            ; 20 16 20 | Jump to subroutine
    STX $90              ; 86 90 | Store X register to zero page
    BCC $90              ; 90 90 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0DD
; Address: $EFC049
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0DD:
    PEA #$BF43           ; F4 43 BF | Push effective address to stack
    LDA                  ; BF 0F F3 7F | Read graphics status
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0DF
; Address: $EFC060
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0DF:
    STA $99F9,Y          ; 99 F9 99 | Update graphics data
    SBC $E2DC,Y          ; F9 DC E2 | Subtract with carry (absolute,Y)
    DEC $BE46            ; CE 46 BE | Decrement (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STZ $9E98,X          ; 9E 98 9E | Store zero to absolute,X
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E0
; Address: $EFC074
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E0:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $84              ; 85 84 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FE0E,X          ; FE 0E FE | Increment (absolute,X)
    BEQ $EF              ; F0 EF | Branch if equal
    CPX #$9C             ; E0 9C | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    STA ($00,X)          ; 81 00 | Update graphics data
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BEQ $C0              ; F0 C0 | Branch if equal
    SBC ($30),Y          ; F1 30 | Subtract with carry ((zero page),Y)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$C6             ; E0 C6 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$A7             ; C0 A7 | Compare Y register (immediate)
    BRA $7E              ; 80 7E | Branch always
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    STA $CDCD8F          ; 8F 8F CD CD | Update graphics data
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    ADC $107D            ; 6D 7D 10 | Add with carry (absolute)
    BRA $10              ; 80 10 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E1
; Address: $EFC114
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E1:
    JSL $BC3310          ; 22 10 33 BC | Jump to subroutine long
    LDA $F42E            ; AD 2E F4 | Read graphics status
    SBC ($66,X)          ; E1 66 | Subtract with carry ((zero page,X))
    BIT #$A6             ; 89 A6 | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR ($C1,X)          ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    SBC $4CFD,X          ; FD FD 4C | Subtract with carry (absolute,X)
    JMP $0000            ; 4C 00 00 | Jump to address

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E2
; Address: $EFC13B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E2:
    BRA $BF              ; 80 BF | Branch always
    EOR ($4F,X)          ; 41 4F | Exclusive OR with accumulator ((zero page,X))
    ADC ($EA),Y          ; 71 EA | Add with carry ((zero page),Y)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $0FFE,X          ; FE FE 0F | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    AND ($30),Y          ; 31 30 | Logical AND with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SEP #$1C             ; E2 1C | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E4
; Address: $EFC164
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E4:
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E5
; Address: $EFC171
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E5:
    JSR $019E            ; 20 9E 01 | Jump to subroutine
    ASL $0E01            ; 0E 01 0E | Arithmetic shift left (absolute)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    BVS $0F              ; 70 0F | Branch if overflow set
    SBC $E2FE,Y          ; F9 FE E2 | Subtract with carry (absolute,Y)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDX $1C71,Y          ; BE 71 1C | Load from absolute,Y into X register
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    STZ $F0FF            ; 9C FF F0 | Store zero to absolute
    ROL $84FF,X          ; 3E FF 84 | Rotate left (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E6
; Address: $EFC1E1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E6:
    STA                  ; 9F 0F C0 FF | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $F0FF,X          ; FE FF F0 | Increment (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STY $00              ; 84 00 | Store Y register to zero page
    SBC $C000,Y          ; F9 00 C0 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E8
; Address: $EFC240
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E8:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BMI $FC              ; 30 FC | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    STA ($00,X)          ; 81 00 | Update graphics data
    PHB                  ; 8B | Push data bank register to stack
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $3301            ; CE 01 33 | Decrement (absolute)
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ORA #$3D             ; 09 3D | Logical OR with accumulator (immediate)
    AND $1010,X          ; 3D 10 10 | Logical AND with accumulator (absolute,X)
    EOR $3299,Y          ; 59 99 32 | Exclusive OR with accumulator (absolute,Y)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    BIT $0CC3            ; 2C C3 0C | Test bits in accumulator (absolute)
    EOR #$B9             ; 49 B9 | Exclusive OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $DFFF,X          ; FD FF DF | Subtract with carry (absolute,X)
    SEP #$E2             ; E2 E2 | Set processor status bits
    BCS $B0              ; B0 B0 | Branch if carry set
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $F9FA            ; 0E FA F9 | Arithmetic shift left (absolute)
    STA $A08D            ; 8D 8D A0 | Update graphics data
    BRA $A0              ; 80 A0 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($5C,X)          ; 41 5C | Exclusive OR with accumulator ((zero page,X))
    EOR ($0E,X)          ; 41 0E | Exclusive OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $44EE            ; 6E EE 44 | Rotate right (absolute)
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    CPX #$81             ; E0 81 | Compare X register (immediate)
    ASL $5E              ; 06 5E | Arithmetic shift left (zero page)
    BVS $70              ; 70 70 | Branch if overflow set
    ORA $001C,X          ; 1D 1C 00 | Logical OR with accumulator (absolute,X)
    AND #$37             ; 29 37 | Logical AND with accumulator (immediate)
    AND #$37             ; 29 37 | Logical AND with accumulator (immediate)
    ADC $7E9F            ; 6D 9F 7E | Add with carry (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0E9
; Address: $EFC2FF
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0E9:
    ROR $00              ; 66 00 | Rotate right (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    AND $C700,Y          ; 39 00 C7 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ROL $E0FF,X          ; 3E FF E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $F000,X          ; 3E 00 F0 | Rotate left (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $FF01,X          ; 1E 01 FF | Arithmetic shift left (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BVS $80              ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0EA
; Address: $EFC3C1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0EA:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BCS $30              ; B0 30 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    CPX #$60             ; E0 60 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0EB
; Address: $EFC3EC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0EB:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $0C              ; 10 0C | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    AND ($BE,X)          ; 21 BE | Logical AND with accumulator ((zero page,X))
    BVC $9C              ; 50 9C | Branch if overflow clear
    STZ $8758            ; 9C 58 87 | Store zero to absolute
    BIT $90C3            ; 2C C3 90 | Test bits in accumulator (absolute)
    BCC $14              ; 90 14 | Branch if carry clear
    INX                  ; E8 | Increment X register
    CPX $CEC4            ; EC C4 CE | Compare X register (absolute)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    EOR $8132,X          ; 5D 32 81 | Exclusive OR with accumulator (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    AND $4C              ; 25 4C | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $54              ; 06 54 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0EC
; Address: $EFC41D
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0EC:
    LDY $ED              ; A4 ED | Load from zero page into Y register
    ORA $FC7C,Y          ; 19 7C FC | Logical OR with accumulator (absolute,Y)
    EOR ($D1),Y          ; 51 D1 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($D1),Y          ; 51 D1 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF BF BF BF | Read graphics status
    ROL $2E00            ; 2E 00 2E | Rotate left (absolute)
    ORA $5001,Y          ; 19 01 50 | Logical OR with accumulator (absolute,Y)
    BVC $8C              ; 50 8C | Branch if overflow clear
    STY $80C0            ; 8C C0 80 | Store Y register to absolute address
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    INC $DCFE,X          ; FE FE DC | Increment (absolute,X)
    INC $FEDC,X          ; FE DC FE | Increment (absolute,X)
    CMP $9CDF,Y          ; D9 DF 9C | Compare accumulator (absolute,Y)
    STZ $9E9E,X          ; 9E 9E 9E | Store zero to absolute,X
    EOR $44              ; 45 44 | Exclusive OR with accumulator (zero page)
    EOR $44              ; 45 44 | Exclusive OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ADC $04              ; 65 04 | Add with carry (zero page)
    ASL $46              ; 06 46 | Arithmetic shift left (zero page)
    LSR $3B              ; 46 3B | Logical shift right (zero page)
    AND $F701,X          ; 3D 01 F7 | Logical AND with accumulator (absolute,X)
    ASL $1C3F            ; 0E 3F 1C | Arithmetic shift left (absolute)
    BMI $FF              ; 30 FF | Branch if negative
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    ROL $78FF,X          ; 3E FF 78 | Rotate left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ASL $3000            ; 0E 00 30 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    DEC $FA02            ; CE 02 FA | Decrement (absolute)
    ASL $0EF2            ; 0E F2 0E | Arithmetic shift left (absolute)
    ORA $7EF0            ; 0D F0 7E | Logical OR with accumulator (absolute)
    STA ($10,X)          ; 81 10 | Update graphics data
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    LDA ($01,X)          ; A1 01 | Read graphics status
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    ADC ($71,X)          ; 61 71 | Add with carry ((zero page,X))
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    INC $FC              ; E6 FC | Increment (zero page)
    ASL $0FF8            ; 0E F8 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0ED
; Address: $EFC4D3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0ED:
    ADC $F10F,Y          ; 79 0F F1 | Add with carry (absolute,Y)
    SBC ($73),Y          ; F1 73 | Subtract with carry ((zero page),Y)
    SBC $60EE            ; ED EE 60 | Subtract with carry (absolute)
    ROR $60              ; 66 60 | Rotate right (zero page)
    LDY $A7              ; A4 A7 | Load from zero page into Y register
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0EE
; Address: $EFC4EF
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0EE:
    CPX #$F1             ; E0 F1 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $2481            ; 0E 81 24 | Arithmetic shift left (absolute)
    EOR ($5E,X)          ; 41 5E | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STA $3D70            ; 8D 70 3D | Update graphics data
    CPY #$26             ; C0 26 | Compare Y register (immediate)
    CMP ($76,X)          ; C1 76 | Compare accumulator ((zero page,X))
    STA ($76,X)          ; 81 76 | Update graphics data
    STA ($7C,X)          ; 81 7C | Update graphics data
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $E1FE,X          ; FE FE E1 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $033E,X          ; 3E 3E 03 | Rotate left (absolute,X)
    ASL $7F00,X          ; 1E 00 7F | Arithmetic shift left (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0EF
; Address: $EFC598
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0EF:
    BEQ $00              ; F0 00 | Branch if equal
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    INC $F0FF,X          ; FE FF F0 | Increment (absolute,X)
    ROL $9BFF,X          ; 3E FF 9B | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F0
; Address: $EFC5E5
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F0:
    RTI                  ; 40 | Return from interrupt
    ASL $03FF,X          ; 1E FF 03 | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    SBC $E2FE,Y          ; F9 FE E2 | Subtract with carry (absolute,Y)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BVS $FF              ; 70 FF | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $FF              ; 30 FF | Branch if negative
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BRA $E3              ; 80 E3 | Branch always
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    CPX #$FB             ; E0 FB | Compare X register (immediate)
    BVS $7F              ; 70 7F | Branch if overflow set
    BMI $FF              ; 30 FF | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    JMP $407F80          ; 5C 80 7F 40 | Jump to address long
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F1
; Address: $EFC678
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F1:
    JSR $B0AF            ; 20 AF B0 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $9E9F,X          ; FE 9F 9E | Increment (absolute,X)
    ASL $040E            ; 0E 0E 04 | Arithmetic shift left (absolute)
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    ASL $501F,X          ; 1E 1F 50 | Arithmetic shift left (absolute,X)
    AND ($C9),Y          ; 31 C9 | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC ($8C,X)          ; 61 8C | Add with carry ((zero page,X))
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    SBC $7F6F,X          ; FD 6F 7F | Subtract with carry (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F2
; Address: $EFC6A8
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F2:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $E6              ; 80 E6 | Branch always
    INC $AC              ; E6 AC | Increment (zero page)
    BIT $2CAC            ; 2C AC 2C | Test bits in accumulator (absolute)
    BCS $5E              ; B0 5E | Branch if carry set
    EOR ($3C,X)          ; 41 3C | Exclusive OR with accumulator ((zero page,X))
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($58,X)          ; 41 58 | Exclusive OR with accumulator ((zero page,X))
    ASL $1E16,X          ; 1E 16 1E | Arithmetic shift left (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    AND $C4              ; 25 C4 | Logical AND with accumulator (zero page)
    AND $C4              ; 25 C4 | Logical AND with accumulator (zero page)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ASL $081F            ; 0E 1F 08 | Arithmetic shift left (absolute)
    STA                  ; 9F 0E 1F 0F | Update graphics data
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $F000            ; EE 00 F0 | Increment (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BNE $1E              ; D0 1E | Branch if not equal
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BIT $10              ; 24 10 | Test bits in accumulator (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    BCC $02              ; 90 02 | Branch if carry clear
    STA ($00,X)          ; 81 00 | Update graphics data
    AND ($3B),Y          ; 31 3B | Logical AND with accumulator ((zero page),Y)
    INC $CC01,X          ; FE 01 CC | Increment (absolute,X)
    STZ $7861,X          ; 9E 61 78 | Store zero to absolute,X
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA #$49             ; 09 49 | Logical OR with accumulator (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F3
; Address: $EFC744
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F3:
    STA                  ; 9F 00 3F 00 | Update graphics data
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STX $03F1            ; 8E F1 03 | Store X register to absolute address
    INC $B310            ; EE 10 B3 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F4
; Address: $EFC767
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F4:
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA $7B              ; 85 7B | Update graphics data
    LDY $F040,X          ; BC 40 F0 | Load from absolute,X into Y register
    STA $000000          ; 8F 00 00 00 | Update graphics data
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPY $3303            ; CC 03 33 | Compare Y register (absolute)
    BIT $0E0F            ; 2C 0F 0E | Test bits in accumulator (absolute)
    STA $1F97,X          ; 9D 97 1F | Update graphics data
    ORA $8E0D            ; 0D 0D 8E | Logical OR with accumulator (absolute)
    ASL $0686            ; 0E 86 06 | Arithmetic shift left (absolute)
    CPY $E21F            ; CC 1F E2 | Compare Y register (absolute)
    BMI $58              ; 30 58 | Branch if negative
    LDA ($55),Y          ; B1 55 | Read graphics status
    BCS $44              ; B0 44 | Branch if carry set
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack
    ROL $D7              ; 26 D7 | Rotate left (zero page)
    BIT $DD              ; 24 DD | Test bits in accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BRA $F8              ; 80 F8 | Branch always
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPX #$1A             ; E0 1A | Compare X register (immediate)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    SBC $11              ; E5 11 | Subtract with carry (zero page)
    INC $F708            ; EE 08 F7 | Increment (absolute)
    BRA $FF              ; 80 FF | Branch always
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F6
; Address: $EFC802
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F6:
    BPL $10              ; 10 10 | Branch if positive
    STA                  ; 9F 00 EF 00 | Update graphics data
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F7
; Address: $EFC81C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F7:
    JSR $41DF            ; 20 DF 41 | Jump to subroutine
    LDX $0202,Y          ; BE 02 02 | Load from absolute,Y into X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0F8
; Address: $EFC84E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0F8:
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPY $FF33            ; CC 33 FF | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    INC                  ; 1A | Increment accumulator
    BPL $00              ; 10 00 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    STA $18              ; 85 18 | Update graphics data
    BVC $0F              ; 50 0F | Branch if overflow clear
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    ORA ($8E),Y          ; 11 8E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0FA
; Address: $EFC8A5
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0FA:
    JSR $2097            ; 20 97 20 | Jump to subroutine
    STA $152A            ; 8D 2A 15 | Update graphics data
    ASL $15              ; 06 15 | Arithmetic shift left (zero page)
    ASL $AD              ; 06 AD | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CMP $D8DB,Y          ; D9 DB D8 | Compare accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    CMP $F9D8,X          ; DD D8 F9 | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $FCFC,X          ; FD FC FC | Subtract with carry (absolute,X)
    BEQ $BF              ; F0 BF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    INC $FE0F,X          ; FE 0F FE | Increment (absolute,X)
    INC $270F,X          ; FE 0F 27 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0FB
; Address: $EFC8D1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0FB:
    JSR $80B8            ; 20 B8 80 | Jump to subroutine
    INC $0800            ; EE 00 08 | Increment (absolute)
    INC $3E0E            ; EE 0E 3E | Increment (absolute)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    DEC $86              ; C6 86 | Decrement (zero page)
    REP #$F0             ; C2 F0 | Reset processor status bits
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    LDY $FCF0,X          ; BC F0 FC | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    ROL $4D              ; 26 4D | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0FD
; Address: $EFC8F6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0FD:
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 00 CD 00 | Update graphics data
    LSR $BE70,X          ; 5E 70 BE | Logical shift right (absolute,X)
    BCS $5E              ; B0 5E | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    CPY $EEEF            ; CC EF EE | Compare Y register (absolute)
    DEC $F1              ; C6 F1 | Decrement (zero page)
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    STA $18DF90          ; 8F 90 DF 18 | Update graphics data
    BNE $E3              ; D0 E3 | Branch if not equal
    LDY $C2BD            ; AC BD C2 | Load from absolute address into Y register
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_0FE
; Address: $EFC924
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_0FE:
    JSR $4120            ; 20 20 41 | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDA                  ; BF 7F BE BE | Read graphics status
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    BNE $2F              ; D0 2F | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $7F              ; 80 7F | Branch always
    BRA $BF              ; 80 BF | Branch always
    BRA $BF              ; 80 BF | Branch always
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Read graphics status
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND #$63             ; 29 63 | Logical AND with accumulator (immediate)
    ADC ($E7,X)          ; 61 E7 | Add with carry ((zero page,X))
    ASL $5D07            ; 0E 07 5D | Arithmetic shift left (absolute)
    STZ $B3              ; 64 B3 | Store zero to zero page
    PHX                  ; DA | Push X register to stack
    ORA $3F80,X          ; 1D 80 3F | Logical OR with accumulator (absolute,X)
    AND $0EC2,X          ; 3D C2 0E | Logical AND with accumulator (absolute,X)
    SBC #$0F             ; E9 0F | Subtract with carry (immediate)
    LDA #$AD             ; A9 AD | Read graphics status
    ADC $387F,Y          ; 79 7F 38 | Add with carry (absolute,Y)
    ROL $1F1D,X          ; 3E 1D 1F | Rotate left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    ASL $53              ; 06 53 | Arithmetic shift left (zero page)
    STA ($00,X)          ; 81 00 | Update graphics data
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_100
; Address: $EFC9A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_100:
    JSR $301F            ; 20 1F 30 | Jump to subroutine
    STA $67449B          ; 8F 9B 44 67 | Update graphics data
    BRA $70              ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_101
; Address: $EFC9AF
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_101:
    JSR $7F7F            ; 20 7F 7F | Jump to subroutine
    LDA                  ; BF 3F FF 5F | Read graphics status
    STA                  ; 9F 55 A6 E0 | Update graphics data
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    CMP #$1F             ; C9 1F | Compare accumulator (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    LDX $F8              ; A6 F8 | Load from zero page into X register
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    BRA $37              ; 80 37 | Branch always
    STA                  ; 9F 9F 06 06 | Update graphics data
    JMP $B04C            ; 4C 4C B0 | Jump to address
    BMI $60              ; 30 60 | Branch if negative
    SBC $1C00,Y          ; F9 00 1C | Subtract with carry (absolute,Y)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FF8B,X          ; FE 8B FF | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    LDY $A5              ; A4 A5 | Load from zero page into Y register
    LDA $A5              ; A5 A5 | Read graphics status
    LDA $29AD            ; AD AD 29 | Read graphics status
    AND #$A1             ; 29 A1 | Logical AND with accumulator (immediate)
    LDA ($A1,X)          ; A1 A1 | Read graphics status
    LDA ($C1,X)          ; A1 C1 | Read graphics status
    CMP ($08,X)          ; C1 08 | Compare accumulator ((zero page,X))
    ORA $0357            ; 0D 57 03 | Logical OR with accumulator (absolute)
    ORA #$5B             ; 09 5B | Logical OR with accumulator (immediate)
    ORA ($D7,X)          ; 01 D7 | Logical OR with accumulator ((zero page,X))
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    DEC $BF01,X          ; DE 01 BF | Decrement (absolute,X)
    BRA $80              ; 80 80 | Branch always
    STA $D59D,X          ; 9D 9D D5 | Update graphics data
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($AA),Y          ; 11 AA | Logical OR with accumulator ((zero page),Y)
    BRA $AE              ; 80 AE | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    ROL $04              ; 26 04 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_102
; Address: $EFCA6C
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_102:
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BCC $6F              ; 90 6F | Branch if carry clear
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($D8,X)          ; 21 D8 | Logical AND with accumulator ((zero page,X))
    BCC $6B              ; 90 6B | Branch if carry clear
    BCC $6B              ; 90 6B | Branch if carry clear
    ROL $383F,X          ; 3E 3F 38 | Rotate left (absolute,X)
    BVS $7F              ; 70 7F | Branch if overflow set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA                  ; 9F 00 FF 00 | Update graphics data
    BCC $C6              ; 90 C6 | Branch if carry clear
    BNE $FD              ; D0 FD | Branch if not equal
    BVC $6F              ; 50 6F | Branch if overflow clear
    ADC $F20A,X          ; 7D 0A F2 | Add with carry (absolute,X)
    CPY #$C5             ; C0 C5 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BPL $8F              ; 10 8F | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    REP #$B3             ; C2 B3 | Reset processor status bits
    STZ $BF3C            ; 9C 3C BF | Store zero to absolute
    LDA $7F3F,X          ; BD 3F 7F | Read graphics status
    BEQ $7F              ; F0 7F | Branch if equal
    SEP #$7E             ; E2 7E | Set processor status bits
    ROR $30D0,X          ; 7E D0 30 | Rotate right (absolute,X)
    JMP $C10C            ; 4C 0C C1 | Jump to address
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    LDA ($30),Y          ; B1 30 | Read graphics status
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $00FF,X          ; FD FF 00 | Subtract with carry (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    INC $F05F,X          ; FE 5F F0 | Increment (absolute,X)
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BMI $FF              ; 30 FF | Branch if negative
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_103
; Address: $EFCB44
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_103:
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    STA $BDF9,Y          ; 99 F9 BD | Update graphics data
    SBC $FD3D,X          ; FD 3D FD | Subtract with carry (absolute,X)
    INC $D701,X          ; FE 01 D7 | Increment (absolute,X)
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_104
; Address: $EFCB62
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_104:
    JSL $00AA00          ; 22 00 AA 00 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    BPL $8B              ; 10 8B | Branch if positive
    LDA $FA0500          ; AF 00 05 FA | Read graphics status
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA $00EF10          ; AF 10 EF 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_105
; Address: $EFCB80
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_105:
    JSL $000A00          ; 22 00 0A 00 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    LDX $1400            ; AE 00 14 | Load from absolute address into X register
    XBA                  ; EB | Exchange accumulator bytes
    BPL $EF              ; 10 EF | Branch if positive
    STX $8C8F            ; 8E 8F 8C | Store X register to absolute address
    STA $BD9F99          ; 8F 99 9F BD | Update graphics data
    LDA                  ; BF B8 BF 62 | Read graphics status
    BRA $E9              ; 80 E9 | Branch always
    BRA $EF              ; 80 EF | Branch always
    BRA $F7              ; 80 F7 | Branch always
    SBC $CFF7,X          ; FD F7 CF | Subtract with carry (absolute,X)
    CMP ($0F,X)          ; C1 0F | Compare accumulator ((zero page,X))
    BMI $0B              ; 30 0B | Branch if negative
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    ORA #$40             ; 09 40 | Logical OR with accumulator (immediate)
    STA $CF30            ; 8D 30 CF | Update graphics data
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    LDY $FE01,X          ; BC 01 FE | Load from absolute,X into Y register
    INC $CF3E,X          ; FE 3E CF | Increment (absolute,X)
    STY $810C            ; 8C 0C 81 | Store Y register to absolute address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $007E,X          ; 7E 7E 00 | Rotate right (absolute,X)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_106
; Address: $EFCBF2
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_106:
    BMI $C0              ; 30 C0 | Branch if negative
    BRA $62              ; 80 62 | Branch always
    STZ $03FC            ; 9C FC 03 | Store zero to absolute
    STA ($00,X)          ; 81 00 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    INC $F903,X          ; FE 03 F9 | Increment (absolute,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF FC FF C0 | Read graphics status
    ROL $E0FF,X          ; 3E FF E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    STA                  ; 9F FF E7 FF | Update graphics data
    BEQ $20              ; F0 20 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA ($AA,X)          ; 01 AA | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    TXA                  ; 8A | Transfer X register to accumulator
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_107
; Address: $EFCCA8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_107:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BRA $22              ; 80 22 | Branch always
    BRA $4F              ; 80 4F | Branch always
    RTI                  ; 40 | Return from interrupt
    CMP $22              ; C5 22 | Compare accumulator (zero page)
    STY $5562            ; 8C 62 55 | Store Y register to absolute address
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    INC $EE00,X          ; FE 00 EE | Increment (absolute,X)
    LDA                  ; BF 00 BF 00 | Read graphics status
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $F681,X          ; FD 81 F6 | Subtract with carry (absolute,X)
    SEP #$31             ; E2 31 | Set processor status bits
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    BIT $E7E6            ; 2C E6 E7 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF F0 0F 9D | Read graphics status
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    DEC $CF10            ; CE 10 CF | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_108
; Address: $EFCCFC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_108:
    BIT $EFD0            ; 2C D0 EF | Test bits in accumulator (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_109
; Address: $EFCD0E
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_109:
    INC $037F,X          ; FE 7F 03 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STX $6008            ; 8E 08 60 | Store X register to absolute address
    SBC ($2C),Y          ; F1 2C | Subtract with carry ((zero page),Y)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    AND $A000,Y          ; 39 00 A0 | Logical AND with accumulator (absolute,Y)
    BRA $C3              ; 80 C3 | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    BPL $EF              ; 10 EF | Branch if positive
    BPL $49              ; 10 49 | Branch if positive
    AND $20C6,Y          ; 39 C6 20 | Logical AND with accumulator (absolute,Y)
    BIT $E22C            ; 2C 2C E2 | Test bits in accumulator (absolute)
    SEP #$E2             ; E2 E2 | Set processor status bits
    SEP #$BC             ; E2 BC | Set processor status bits
    ROR $080E,X          ; 7E 0E 08 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BIT $E2D3            ; 2C D3 E2 | Test bits in accumulator (absolute)
    ORA $1DE2,X          ; 1D E2 1D | Logical OR with accumulator (absolute,X)
    STY $6E73            ; 8C 73 6E | Store Y register to absolute address
    STA ($08),Y          ; 91 08 | Update graphics data
    BNE $E9              ; D0 E9 | Branch if not equal
    ORA #$6B             ; 09 6B | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $070C0F          ; AF 0F 0C 07 | Read graphics status
    ORA $EE              ; 05 EE | Logical OR with accumulator (zero page)
    INC $01              ; E6 01 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_10A
; Address: $EFCD72
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_10A:
    JSL $10EED4          ; 22 D4 EE 10 | Jump to subroutine long
    LDA $F00350          ; AF 50 03 F0 | Read graphics status
    BPL $EC              ; 10 EC | Branch if positive
    DEX                  ; CA | Decrement X register
    SBC #$10             ; E9 10 | Subtract with carry (immediate)
    STA ($01),Y          ; 91 01 | Update graphics data
    LDY #$9A             ; A0 9A | Load immediate value into Y register
    BCC $D7              ; 90 D7 | Branch if carry clear
    BRA $1D              ; 80 1D | Branch always
    BPL $29              ; 10 29 | Branch if positive
    ROR $20              ; 66 20 | Rotate right (zero page)
    LDA $EFFF2F          ; AF 2F FF EF | Read graphics status
    SBC $EBCD            ; ED CD EB | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    AND $1412            ; 2D 12 14 | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    AND $BF0E,X          ; 3D 0E BF | Logical AND with accumulator (absolute,X)
    BRA $CF              ; 80 CF | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_10B
; Address: $EFCDBD
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_10B:
    BRA $FF              ; 80 FF | Branch always
    BNE $B7              ; D0 B7 | Branch if not equal
    BRA $F7              ; 80 F7 | Branch always
    LDA ($FF,X)          ; A1 FF | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    JMP $B0BC58          ; 5C 58 BC B0 | Jump to address long
    SEI                  ; 78 | Set interrupt disable flag
    EOR #$A7             ; 49 A7 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    JMP $47B8A3          ; 5C A3 B8 47 | Jump to address long
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SBC #$D9             ; E9 D9 | Subtract with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    ORA $00D4,Y          ; 19 D4 00 | Logical OR with accumulator (absolute,Y)
    ORA #$8B             ; 09 8B | Logical OR with accumulator (immediate)
    LDA ($B2),Y          ; B1 B2 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    ORA $0A00,X          ; 1D 00 0A | Logical OR with accumulator (absolute,X)
    AND #$32             ; 29 32 | Logical AND with accumulator (immediate)
    CMP #$CD             ; C9 CD | Compare accumulator (immediate)
    BMI $85              ; 30 85 | Branch if negative
    LDA                  ; BF C5 60 06 | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    BVC $0F              ; 50 0F | Branch if overflow clear
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_10D
; Address: $EFCE23
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_10D:
    JSR $208A            ; 20 8A 20 | Jump to subroutine
    AND ($89),Y          ; 31 89 | Logical AND with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $D8FD17          ; AF 17 FD D8 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SBC $DDD8,X          ; FD D8 DD | Subtract with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    DEC $FCD0,X          ; DE D0 FC | Decrement (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $FFF9,Y          ; F9 F9 FF | Subtract with carry (absolute,Y)
    ROR $FBFF,X          ; 7E FF FB | Rotate right (absolute,X)
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    CPY #$7B             ; C0 7B | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $BA              ; 90 BA | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_10F
; Address: $EFCE5D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_10F:
    BNE $E3              ; D0 E3 | Branch if not equal
    LDY #$E0             ; A0 E0 | Game work RAM access
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $6B16,X          ; 1E 16 6B | Arithmetic shift left (absolute,X)
    INC $EDE2            ; EE E2 ED | Increment (absolute)
    CPX $0077            ; EC 77 00 | Compare X register (absolute)
    LDA $03F791          ; AF 91 F7 03 | Read graphics status
    CPX $0D12            ; EC 12 0D | Compare X register (absolute)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_111
; Address: $EFCE84
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_111:
    JSR $301F            ; 20 1F 30 | Jump to subroutine
    BRA $E8              ; 80 E8 | Branch always
    BVC $E0              ; 50 E0 | Game work RAM access
    LDA                  ; BF 3F FF DF | Read graphics status
    BVC $A4              ; 50 A4 | Branch if overflow clear
    SBC ($09,X)          ; E1 09 | Subtract with carry ((zero page,X))
    CMP ($0E,X)          ; C1 0E | Compare accumulator ((zero page,X))
    DEC $9B19            ; CE 19 9B | Decrement (absolute)
    ORA ($97),Y          ; 11 97 | Logical OR with accumulator ((zero page),Y)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BEQ $ED              ; F0 ED | Branch if equal
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    CPX #$F5             ; E0 F5 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_112
; Address: $EFCEBE
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_112:
    JSR $FF38            ; 20 38 FF | Jump to subroutine
    INC $E0EF,X          ; FE EF E0 | Game work RAM access
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BCS $B6              ; B0 B6 | Branch if carry set
    BCS $E0              ; B0 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    ORA $0609            ; 0D 09 06 | Logical OR with accumulator (absolute)
    SBC $0A              ; E5 0A | Subtract with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    EOR $3FFD,Y          ; 59 FD 3F | Exclusive OR with accumulator (absolute,Y)
    BNE $3F              ; D0 3F | Branch if not equal
    PLY                  ; 7A | Pull Y register from stack
    STA ($FD,X)          ; 81 FD | Update graphics data
    STA $B087FD          ; 8F FD 87 B0 | Update graphics data
    BVS $46              ; 70 46 | Branch if overflow set
    INC $9D              ; E6 9D | Increment (zero page)
    EOR $4484,X          ; 5D 84 44 | Exclusive OR with accumulator (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    STX $7E              ; 86 7E | Store X register to zero page
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_113
; Address: $EFCEFE
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_113:
    BEQ $08              ; F0 08 | Branch if equal
    ROR $C1              ; 66 C1 | Rotate right (zero page)
    CMP ($E1),Y          ; D1 E1 | Compare accumulator ((zero page),Y)
    SBC ($21),Y          ; F1 21 | PPU graphics register access
    PEA #$F48C           ; F4 8C F4 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    BNE $01              ; D0 01 | Branch if not equal
    ASL $DE21,X          ; 1E 21 DE | Arithmetic shift left (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    STZ $6CE3            ; 9C E3 6C | Store zero to absolute
    SBC $D500,Y          ; F9 00 D5 | Subtract with carry (absolute,Y)
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    INX                  ; E8 | Increment X register
    SBC $1406,Y          ; F9 06 14 | Subtract with carry (absolute,Y)
    XBA                  ; EB | Exchange accumulator bytes
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 80 6C 83 | Read graphics status
    ADC #$96             ; 69 96 | Add with carry (immediate)
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    LDA                  ; BF 40 6F 00 | Read graphics status
    BRA $07              ; 80 07 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BCC $F6              ; 90 F6 | Branch if carry clear
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    BRA $03              ; 80 03 | Branch always
    SED                  ; F8 | Set decimal mode flag
    ROR $E800,X          ; 7E 00 E8 | Rotate right (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $27              ; C5 27 | Compare accumulator (zero page)
    STA                  ; 9F 02 46 B9 | Update graphics data
    BNE $FE              ; D0 FE | Branch if not equal
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $03              ; F0 03 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_114
; Address: $EFCFA0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_114:
    BEQ $90              ; F0 90 | Branch if equal
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    BPL $5E              ; 10 5E | Branch if positive
    LDA $BD02,X          ; BD 02 BD | Read graphics status
    LDA $9002,X          ; BD 02 90 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ROL $FA05,X          ; 3E 05 FA | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_115
; Address: $EFCFB7
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_115:
    SBC #$06             ; E9 06 | Subtract with carry (immediate)
    LDA $7B84,Y          ; B9 84 7B | Read graphics status
    STY $7B              ; 84 7B | Store Y register to zero page
    STY $7B              ; 84 7B | Store Y register to zero page
    DEC                  ; 3A | Decrement accumulator
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    BRA $7F              ; 80 7F | Branch always
    BRA $79              ; 80 79 | Branch always
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $6886,Y          ; 79 86 68 | Add with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_116
; Address: $EFCFE2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_116:
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    EOR $9F              ; 45 9F | Exclusive OR with accumulator (zero page)
    LDA                  ; BF 20 EE 60 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_117
; Address: $EFCFF2
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_117:
    INX                  ; E8 | Increment X register
    CMP $30              ; C5 30 | Compare accumulator (zero page)
    SBC $CC33            ; ED 33 CC | Subtract with carry (absolute)
    ROR $FB11            ; 6E 11 FB | Rotate right (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    CMP $7600,X          ; DD 00 76 | Compare accumulator (absolute,X)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    CMP $7622,X          ; DD 22 76 | Compare accumulator (absolute,X)
    BIT #$C6             ; 89 C6 | Test bits in accumulator (immediate)
    AND $0407,Y          ; 39 07 04 | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 00 E5 00 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF BF 40 E5 | Read graphics status
    INC                  ; 1A | Increment accumulator
    BCS $80              ; B0 80 | Branch if carry set
    TXA                  ; 8A | Transfer X register to accumulator
    LDA                  ; BF 20 9F 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_118
; Address: $EFD04B
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_118:
    RTI                  ; 40 | Return from interrupt
    ADC #$80             ; 69 80 | Add with carry (immediate)
    BRA $80              ; 80 80 | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    LDA                  ; BF 40 94 6B | Read graphics status
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ADC #$80             ; 69 80 | Add with carry (immediate)
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 00 E5 00 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF BF 40 E5 | Read graphics status
    INC                  ; 1A | Increment accumulator
    STA $009502          ; 8F 02 95 00 | Update graphics data
    LDA $9D24,X          ; BD 24 9D | Read graphics status
    CMP $7B40,Y          ; D9 40 7B | Compare accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    PHB                  ; 8B | Push data bank register to stack
    BVS $91              ; 70 91 | Branch if overflow set
    ROR                  ; 6A | Rotate right (accumulator)
    LDA $9542,X          ; BD 42 95 | Read graphics status
    ROR                  ; 6A | Rotate right (accumulator)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STY $03BC            ; 8C BC 03 | Store Y register to absolute address
    ADC $3EC2,X          ; 7D C2 3E | Add with carry (absolute,X)
    BRA $78              ; 80 78 | Branch always
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    BCC $CB              ; 90 CB | Branch if carry clear
    WDM #$9D             ; 42 9D | Reserved instruction
    BRA $7F              ; 80 7F | Branch always
    PLB                  ; AB | Pull data bank register from stack
    ROL $18D1            ; 2E D1 18 | Rotate left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    BPL $E9              ; 10 E9 | Branch if positive
    STY $C773            ; 8C 73 C7 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    DEC                  ; 3A | Decrement accumulator
    ORA $BB              ; 05 BB | Logical OR with accumulator (zero page)
    PLB                  ; AB | Pull data bank register from stack
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_119
; Address: $EFD0CE
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_119:
    DEX                  ; CA | Decrement X register
    STA ($7E,X)          ; 81 7E | Update graphics data
    EOR ($9E,X)          ; 41 9E | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ADC $9C81,X          ; 7D 81 9C | Add with carry (absolute,X)
    CPX #$C6             ; E0 C6 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    AND ($DC,X)          ; 21 DC | Logical AND with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_11A
; Address: $EFD105
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_11A:
    CLC                  ; 18 | Clear carry flag
    SBC ($06,X)          ; E1 06 | Subtract with carry ((zero page,X))
    SBC ($A6),Y          ; F1 A6 | Subtract with carry ((zero page),Y)
    SBC $E0A6,Y          ; F9 A6 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    STY $18              ; 84 18 | Store Y register to zero page
    BPL $EF              ; 10 EF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCS $00              ; B0 00 | Branch if carry set
    SEC                  ; 38 | Set carry flag
    BIT #$3E             ; 89 3E | Test bits in accumulator (immediate)
    STZ $DF3F            ; 9C 3F DF | Store zero to absolute
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_11B
; Address: $EFD12F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_11B:
    JSR $3D82            ; 20 82 3D | Jump to subroutine
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 0F | Read graphics status
    BEQ $7E              ; F0 7E | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $BF              ; 50 BF | Branch if overflow clear
    STA $9266,Y          ; 99 66 92 | Update graphics data
    INC $FF              ; E6 FF | Increment (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $EF              ; 10 EF | Branch if positive
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_11C
; Address: $EFD15A
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_11C:
    CLC                  ; 18 | Clear carry flag
    STZ $9999            ; 9C 99 99 | Store zero to absolute
    ROR $02              ; 66 02 | Rotate right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROR $7A05,X          ; 7E 05 7A | Rotate right (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    STA $0066,Y          ; 99 66 00 | Update graphics data
    ROR $7F80,X          ; 7E 80 7F | Rotate right (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $F1ED,X          ; FE ED F1 | Increment (absolute,X)
    BVS $B7              ; 70 B7 | Branch if overflow set
    BIT #$01             ; 89 01 | Test bits in accumulator (immediate)
    INC $847A,X          ; FE 7A 84 | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    CPX $03              ; E4 03 | Compare X register (zero page)
    STA $00ED            ; 8D ED 00 | Update graphics data
    BVS $0E              ; 70 0E | Branch if overflow set
    JMP $00FE01          ; 5C 01 FE 00 | Jump to address long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $01FD,X          ; FD FD 01 | Subtract with carry (absolute,X)
    ORA $7B84,Y          ; 19 84 7B | Logical OR with accumulator (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$649A           ; F4 9A 64 | Push effective address to stack
    STY $FB              ; 84 FB | Store Y register to zero page
    WDM #$BD             ; 42 BD | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    ADC #$96             ; 69 96 | Add with carry (immediate)
    INX                  ; E8 | Increment X register
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $F681,X          ; FD 81 F6 | Subtract with carry (absolute,X)
    SEP #$31             ; E2 31 | Set processor status bits
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    BIT $EFE2            ; 2C E2 EF | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF F0 0F 9D | Read graphics status
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    DEC $CF10            ; CE 10 CF | Decrement (absolute)
    BIT $EFD0            ; 2C D0 EF | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_11D
; Address: $EFD1FF
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_11D:
    BPL $0F              ; 10 0F | Branch if positive
    CMP ($2F),Y          ; D1 2F | Compare accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $2F              ; F0 2F | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    AND $2000,Y          ; 39 00 20 | Logical AND with accumulator (absolute,Y)
    BEQ $0F              ; F0 0F | Branch if equal
    BPL $EF              ; 10 EF | Branch if positive
    BPL $09              ; 10 09 | Branch if positive
    AND $20C6,Y          ; 39 C6 20 | Logical AND with accumulator (absolute,Y)
    PEA #$FD0B           ; F4 0B FD | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    BRA $7F              ; 80 7F | Branch always
    BMI $CF              ; 30 CF | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $7E              ; 10 7E | Branch if positive
    STA ($FF,X)          ; 81 FF | Update graphics data
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    CPX #$F2             ; E0 F2 | Compare X register (immediate)
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    CPX #$FA             ; E0 FA | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $C906,Y          ; F9 06 C9 | Subtract with carry (absolute,Y)
    INX                  ; E8 | Increment X register
    ORA $E0              ; 05 E0 | Game work RAM access
    ORA $05E8            ; 0D E8 05 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA $35              ; 05 35 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 00 FE 00 | Read graphics status
    PLX                  ; FA | Pull X register from stack
    ORA $6F              ; 05 6F | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BMI $CF              ; 30 CF | Branch if negative
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_11E
; Address: $EFD296
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_11E:
    JSR $21DF            ; 20 DF 21 | PPU graphics register access
    DEC $51AE,X          ; DE AE 51 | Decrement (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $68              ; 45 68 | Exclusive OR with accumulator (zero page)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    STY $BC70            ; 8C 70 BC | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_11F
; Address: $EFD2AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_11F:
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    STY $F8              ; 84 F8 | Store Y register to zero page
    CPY $FC03            ; CC 03 FC | Compare Y register (absolute)
    SBC $3FC0,X          ; FD C0 3F | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_120
; Address: $EFD2BC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_120:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    SBC #$09             ; E9 09 | Subtract with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_121
; Address: $EFD2C3
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_121:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $0D              ; E5 0D | Subtract with carry (zero page)
    LDA $030B0F          ; AF 0F 0B 03 | Read graphics status
    BPL $00              ; 10 00 | Branch if positive
    NOP                  ; EA | No operation
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $AF12            ; ED 12 AF | Subtract with carry (absolute)
    BVC $03              ; 50 03 | Branch if overflow clear
    PEA #$EF10           ; F4 10 EF | Push effective address to stack
    DEX                  ; CA | Decrement X register
    XBA                  ; EB | Exchange accumulator bytes
    PLB                  ; AB | Pull data bank register from stack
    STX $06              ; 86 06 | Store X register to zero page
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    STA ($80,X)          ; 81 80 | Update graphics data
    CMP #$C9             ; C9 C9 | Compare accumulator (immediate)
    CMP $0000,Y          ; D9 00 00 | Compare accumulator (absolute,Y)
    BEQ $4B              ; F0 4B | Branch if equal
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    BRA $7E              ; 80 7E | Branch always
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    CMP $F026,Y          ; D9 26 F0 | Compare accumulator (absolute,Y)
    SBC $EF0D            ; ED 0D EF | Subtract with carry (absolute)
    BPL $38              ; 10 38 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    ADC ($31),Y          ; 71 31 | Add with carry ((zero page),Y)
    DEC $975E,X          ; DE 5E 97 | Decrement (absolute,X)
    BPL $A9              ; 10 A9 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    SBC $9012            ; ED 12 90 | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    AND ($8E),Y          ; 31 8E | Logical AND with accumulator ((zero page),Y)
    STY $DE              ; 84 DE | Store Y register to zero page
    AND ($17,X)          ; 21 17 | Logical AND with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_122
; Address: $EFD31F
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_122:
    ASL $B7              ; 06 B7 | Arithmetic shift left (zero page)
    BRA $F7              ; 80 F7 | Branch always
    LDA ($7F,X)          ; A1 7F | Read graphics status
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF B8 5C 58 | Read graphics status
    LDY $7FB0,X          ; BC B0 7F | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    EOR #$A7             ; 49 A7 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ADC $BF86,Y          ; 79 86 BF | Add with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    JMP $47B8A3          ; 5C A3 B8 47 | Jump to address long
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROR $1B70,X          ; 7E 70 1B | Rotate right (absolute,X)
    ORA ($DB),Y          ; 11 DB | Logical OR with accumulator ((zero page),Y)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BPL $18              ; 10 18 | Branch if positive
    CPX #$39             ; E0 39 | Compare X register (immediate)
    DEC $7C              ; C6 7C | Decrement (zero page)
    CPX $DB              ; E4 DB | Compare X register (zero page)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    INC $9011            ; EE 11 90 | Increment (absolute)
    PLX                  ; FA | Pull X register from stack
    BMI $99              ; 30 99 | Branch if negative
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    BEQ $03              ; F0 03 | Branch if equal
    BCC $38              ; 90 38 | Branch if carry clear
    ORA $98              ; 05 98 | Logical OR with accumulator (zero page)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($F3,X)          ; 01 F3 | Logical OR with accumulator ((zero page,X))
    BCC $0C              ; 90 0C | Branch if carry clear
    STX $3970            ; 8E 70 39 | Store X register to absolute address
    CPY #$EB             ; C0 EB | Compare Y register (immediate)
    LDA $101F20          ; AF 20 1F 10 | Read graphics status
    INC $FB80            ; EE 80 FB | Increment (absolute)
    BRA $7F              ; 80 7F | Branch always
    BMI $CF              ; 30 CF | Branch if negative
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_123
; Address: $EFD396
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_123:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    ADC $F40B,X          ; 7D 0B F4 | Add with carry (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    EOR $BB              ; 45 BB | Exclusive OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_125
; Address: $EFD3B6
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_125:
    JSL $DC23DD          ; 22 DD 23 DC | Jump to subroutine long
    JMP $B10FF0          ; 5C F0 0F B1 | Jump to address long
    LSR $F313            ; 4E 13 F3 | Logical shift right (absolute)
    ROL $BF              ; 26 BF | Rotate left (zero page)
    ASL $0FCF            ; 0E CF 0F | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    ROL $08              ; 26 08 | Rotate left (zero page)
    ROL $CFC0,X          ; 3E C0 CF | Rotate left (absolute,X)
    BMI $87              ; 30 87 | Branch if negative
    BVS $3C              ; 70 3C | Branch if overflow set
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    CPX $94              ; E4 94 | Compare X register (zero page)
    ORA $E6              ; 05 E6 | Logical OR with accumulator (zero page)
    SBC ($10),Y          ; F1 10 | Subtract with carry ((zero page),Y)
    SBC $1FF0,Y          ; F9 F0 1F | Subtract with carry (absolute,Y)
    INC $8877,X          ; FE 77 88 | Increment (absolute,X)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    ASL $06F9            ; 0E F9 06 | Arithmetic shift left (absolute)
    INC $8800,X          ; FE 00 88 | Increment (absolute,X)
    STY $FF              ; 84 FF | Store Y register to zero page
    SBC $3AAE,X          ; FD AE 3A | Subtract with carry (absolute,X)
    PEA #$2344           ; F4 44 23 | Push effective address to stack
    STY $00              ; 84 00 | Store Y register to zero page
    LDX $1A00            ; AE 00 1A | Load from absolute address into X register
    SBC $74              ; E5 74 | Subtract with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP ($2E27)          ; 6C 27 2E | Jump to address (absolute indirect)
    CPY #$BB             ; C0 BB | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BRA $BA              ; 80 BA | Branch always
    RTI                  ; 40 | Return from interrupt
    JMP ($2E90)          ; 6C 90 2E | Jump to address (absolute indirect)
    BNE $53              ; D0 53 | Branch if not equal
    LDY #$48             ; A0 48 | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    BVC $40              ; 50 40 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    STA $40DF07          ; 8F 07 DF 40 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    DEC $FBC0,X          ; DE C0 FB | Decrement (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    BVC $AF              ; 50 AF | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    BVS $42              ; 70 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_126
; Address: $EFD459
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_126:
    LDA $AE51,X          ; BD 51 AE | Read graphics status
    AND $04FB            ; 2D FB 04 | Logical AND with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    STA ($91),Y          ; 91 91 | Update graphics data
    LSR $46              ; 46 46 | Logical shift right (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    STA ($6E),Y          ; 91 6E | Update graphics data
    PLP                  ; 28 | Pull processor status from stack
    BEQ $0F              ; F0 0F | Branch if equal
    BIT #$46             ; 89 46 | Test bits in accumulator (immediate)
    LDA $0407,Y          ; B9 07 04 | Read graphics status
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF 00 E5 00 | Read graphics status
    XBA                  ; EB | Exchange accumulator bytes
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 3F C0 E5 | Read graphics status
    INC                  ; 1A | Increment accumulator
    BCS $C0              ; B0 C0 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_127
; Address: $EFD4A9
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_127:
    JSR $3AE5            ; 20 E5 3A | Jump to subroutine
    LDA                  ; BF 3F BF BF | Read graphics status
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LDA                  ; BF 40 BF 40 | Read graphics status
    ADC ($31),Y          ; 71 31 | Add with carry ((zero page),Y)
    INC $DF7E,X          ; FE 7E DF | Increment (absolute,X)
    BPL $A9              ; 10 A9 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    AND ($8E),Y          ; 31 8E | Logical AND with accumulator ((zero page),Y)
    STY $FE              ; 84 FE | Store Y register to zero page
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    LDY #$17             ; A0 17 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    ASL $B4              ; 06 B4 | Arithmetic shift left (zero page)
    SBC $79D3,Y          ; F9 D3 79 | Subtract with carry (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    BPL $FF              ; 10 FF | Branch if positive
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    SBC #$07             ; E9 07 | Subtract with carry (immediate)
    STA ($DB,X)          ; 81 DB | Update graphics data
    STY $BA              ; 84 BA | Store Y register to zero page
    EOR $19              ; 45 19 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_128
; Address: $EFD4F7
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_128:
    CPX $FF              ; E4 FF | Compare X register (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BNE $A1              ; D0 A1 | Branch if not equal
    BVC $FF              ; 50 FF | Branch if overflow clear
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    LDA $7986,Y          ; B9 86 79 | Read graphics status
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ORA $0FF0            ; 0D F0 0F | Logical OR with accumulator (absolute)
    LDA ($5E,X)          ; A1 5E | Read graphics status
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY $B002            ; CC 02 B0 | Compare Y register (absolute)
    ASL $0CF2            ; 0E F2 0C | Arithmetic shift left (absolute)
    STY $847A            ; 8C 7A 84 | Store Y register to absolute address
    PLX                  ; FA | Pull X register from stack
    INY                  ; C8 | Increment Y register
    BPL $EF              ; 10 EF | Branch if positive
    BNE $2F              ; D0 2F | Branch if not equal
    BVC $AF              ; 50 AF | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 71 8E 70 | Read graphics status
    STA $E79E61          ; 8F 61 9E E7 | Update graphics data
    BIT $74FF            ; 2C FF 74 | Test bits in accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    INC $FFF6,X          ; FE F6 FF | Increment (absolute,X)
    CPX $0FEC            ; EC EC 0F | Compare X register (absolute)
    BVS $AC              ; 70 AC | Branch if overflow set
    BPL $F4              ; 10 F4 | Branch if positive
    PEA #$1443           ; F4 43 14 | Push effective address to stack
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    CPX $7513            ; EC 13 75 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_12A
; Address: $EFD575
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_12A:
    JSR $DD22            ; 20 22 DD | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    REP #$3D             ; C2 3D | Reset processor status bits
    SEC                  ; 38 | Set carry flag
    STY $C4              ; 84 C4 | Store Y register to zero page
    STX $E0CE            ; 8E CE E0 | Game work RAM access
    LDY $CF              ; A4 CF | Load from zero page into Y register
    BNE $CF              ; D0 CF | Branch if not equal
    BPL $C4              ; 10 C4 | Branch if positive
    DEC $FF31            ; CE 31 FF | Decrement (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    BNE $20              ; D0 20 | Branch if not equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_12B
; Address: $EFD59B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_12B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BCC $60              ; 90 60 | Branch if carry clear
    LSR $0F              ; 46 0F | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_12C
; Address: $EFD5A5
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_12C:
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $F5              ; 80 F5 | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BCS $46              ; B0 46 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA $0689            ; 0D 89 06 | Logical OR with accumulator (absolute)
    SBC $0A              ; E5 0A | Subtract with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    ADC $9C81,X          ; 7D 81 9C | Add with carry (absolute,X)
    CPX #$C6             ; E0 C6 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FFF8,X          ; FE F8 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SBC ($06,X)          ; E1 06 | Subtract with carry ((zero page,X))
    SBC ($A6),Y          ; F1 A6 | Subtract with carry ((zero page),Y)
    SBC $E0A6,Y          ; F9 A6 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $C0              ; F0 C0 | Branch if equal
    LDA                  ; BF 87 38 89 | Read graphics status
    ROL $1FBC,X          ; 3E BC 1F | Rotate left (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    REP #$3D             ; C2 3D | Reset processor status bits
    BRA $3F              ; 80 3F | Branch always
    BEQ $7E              ; F0 7E | Branch if equal
    LDY $BB5C,X          ; BC 5C BB | Load from absolute,X into Y register
    STA $9266,Y          ; 99 66 92 | Update graphics data
    SEC                  ; 38 | Set carry flag
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SBC $FDAE,X          ; FD AE FD | Subtract with carry (absolute,X)
    LDX $0036            ; AE 36 00 | Load from absolute address into X register
    STY $53              ; 84 53 | Store Y register to zero page
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    LDX $AE00            ; AE 00 AE | Load from absolute address into X register
    SBC #$BC             ; E9 BC | Subtract with carry (immediate)
    BIT $1BE4            ; 2C E4 1B | Test bits in accumulator (absolute)
    SBC $EF83            ; ED 83 EF | Subtract with carry (absolute)
    STA $87C7            ; 8D C7 87 | Update graphics data
    BVC $71              ; 50 71 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_12D
; Address: $EFD66F
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_12D:
    EOR ($A3),Y          ; 51 A3 | Exclusive OR with accumulator ((zero page),Y)
    BVC $ED              ; 50 ED | Branch if overflow clear
    BPL $87              ; 10 87 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    CMP #$17             ; C9 17 | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    BIT #$51             ; 89 51 | Test bits in accumulator (immediate)
    STX $04FB            ; 8E FB 04 | Store X register to absolute address
    LDX $FD00,Y          ; BE 00 FD | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    SBC $20              ; E5 20 | Subtract with carry (zero page)
    DEY                  ; 88 | Decrement Y register
    STY $1073            ; 8C 73 10 | Store Y register to absolute address
    ADC $9A              ; 65 9A | Add with carry (zero page)
    LDA                  ; BF 00 BF 00 | Read graphics status
    PHB                  ; 8B | Push data bank register to stack
    BMI $CF              ; 30 CF | Branch if negative
    JMP $CC33            ; 4C 33 CC | Jump to address
    CPY $BC43            ; CC 43 BC | Compare Y register (absolute)
    LDY $748B,X          ; BC 8B 74 | Load from absolute,X into Y register
    CPY $87              ; C4 87 | Compare Y register (zero page)
    STY $C7              ; 84 C7 | Store Y register to zero page
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    BNE $5F              ; D0 5F | Branch if not equal
    INC $C701,X          ; FE 01 C7 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    STA $7A              ; 85 7A | Update graphics data
    CMP ($3A,X)          ; C1 3A | Compare accumulator ((zero page,X))
    BNE $20              ; D0 20 | Branch if not equal
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    LDX $FD02            ; AE 02 FD | Load from absolute address into X register
    ORA ($7D,X)          ; 01 7D | Logical OR with accumulator ((zero page,X))
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    SBC $4002,X          ; FD 02 40 | Subtract with carry (absolute,X)
    LDY $7C83,X          ; BC 83 7C | Load from absolute,X into Y register
    LDX $DD51            ; AE 51 DD | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_12E
; Address: $EFD6F9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_12E:
    JSL $413AC5          ; 22 C5 3A 41 | Jump to subroutine long
    ROL $3748,X          ; 3E 48 37 | Rotate left (absolute,X)
    LSR $BFB1,X          ; 5E B1 BF | Logical shift right (absolute,X)
    LDA                  ; BF 49 49 80 | Read graphics status
    BRA $44              ; 80 44 | Branch always
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    PEA #$77CC           ; F4 CC 77 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_12F
; Address: $EFD711
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_12F:
    DEY                  ; 88 | Decrement Y register
    LDA ($00),Y          ; B1 00 | Read graphics status
    LDA                  ; BF 40 49 B6 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    CPY $E803            ; CC 03 E8 | Compare Y register (absolute)
    CPX $EF00            ; EC 00 EF | Compare X register (absolute)
    BPL $CF              ; 10 CF | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $6C              ; F0 6C | Branch if equal
    BPL $6F              ; 10 6F | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $FB              ; 10 FB | Branch if positive
    BRA $83              ; 80 83 | Branch always
    BRA $FF              ; 80 FF | Branch always
    STA                  ; 9F 1C EF 00 | Update graphics data
    CPY #$F9             ; C0 F9 | Compare Y register (immediate)
    ASL $81              ; 06 81 | Arithmetic shift left (zero page)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    SBC $9D02,X          ; FD 02 9D | Subtract with carry (absolute,X)
    SBC $E912            ; ED 12 E9 | Subtract with carry (absolute)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    BNE $D0              ; D0 D0 | Branch if not equal
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BNE $2F              ; D0 2F | Branch if not equal
    SBC $08F7,X          ; FD F7 08 | Subtract with carry (absolute,X)
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    STA                  ; 9F 00 80 00 | Update graphics data
    ROR $F800,X          ; 7E 00 F8 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_130
; Address: $EFD792
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_130:
    BRA $7F              ; 80 7F | Branch always
    BRA $67              ; 80 67 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    LSR $D8B1            ; 4E B1 D8 | Logical shift right (absolute)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    LDY $0F00,X          ; BC 00 0F | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    BMI $CF              ; 30 CF | Branch if negative
    STY $0F73            ; 8C 73 0F | Store Y register to absolute address
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $6F              ; F0 6F | Branch if equal
    BCC $8F              ; 90 8F | Branch if carry clear
    SEP #$FD             ; E2 FD | Set processor status bits
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_131
; Address: $EFD7CF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_131:
    BPL $CF              ; 10 CF | Branch if positive
    BMI $FD              ; 30 FD | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_132
; Address: $EFD7D9
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_132:
    JSR $2083            ; 20 83 20 | Jump to subroutine
    BCC $60              ; 90 60 | Branch if carry clear
    BEQ $80              ; F0 80 | Branch if equal
    BRA $FD              ; 80 FD | Branch always
    BCS $F3              ; B0 F3 | Branch if carry set
    BEQ $0F              ; F0 0F | Branch if equal
    BMI $BD              ; 30 BD | Branch if negative
    INC $19              ; E6 19 | Increment (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BPL $FB              ; 10 FB | Branch if positive
    LDA                  ; BF 40 FE 01 | Read graphics status
    LDA ($5E,X)          ; A1 5E | Read graphics status
    STX $79              ; 86 79 | Store X register to zero page
    BMI $CF              ; 30 CF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_133
; Address: $EFD819
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_133:
    STA                  ; 9F 0D F2 7E | Update graphics data
    STA ($21,X)          ; 81 21 | PPU graphics register access
    DEC $748B,X          ; DE 8B 74 | Decrement (absolute,X)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    PEA #$946B           ; F4 6B 94 | Push effective address to stack
    STY $7B              ; 84 7B | Store Y register to zero page
    STY $43              ; 84 43 | Store Y register to zero page
    LDY $DE21,X          ; BC 21 DE | Load from absolute,X into Y register
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    ROL $653E,X          ; 3E 3E 65 | Rotate left (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $E01F            ; 0E 1F E0 | Game work RAM access
    CMP $3E00            ; CD 00 3E | Compare accumulator (absolute)
    CMP ($9A,X)          ; C1 9A | Compare accumulator ((zero page,X))
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    SBC $0E00,X          ; FD 00 0E | Subtract with carry (absolute,X)
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    CMP $4832            ; CD 32 48 | Compare accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $14              ; 06 14 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_134
; Address: $EFD87B
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_134:
    XBA                  ; EB | Exchange accumulator bytes
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    CPY $888B            ; CC 8B 88 | Compare Y register (absolute)
    BRA $03              ; 80 03 | Branch always
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 80 CC 23 | Read graphics status
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    LDA                  ; BF 40 0C 0C | Read graphics status
    LDA                  ; BF 0F EF EF | Read graphics status
    STA ($73,X)          ; 81 73 | Update graphics data
    INC $0C00,X          ; FE 00 0C | Increment (absolute,X)
    CPY $30              ; C4 30 | Compare Y register (zero page)
    BNE $EF              ; D0 EF | Branch if not equal
    BPL $B5              ; 10 B5 | Branch if positive
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_135
; Address: $EFD8BA
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_135:
    JSR $0BDF            ; 20 DF 0B | Jump to subroutine
    PEA #$01FE           ; F4 FE 01 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $3300,X          ; 1E 00 33 | Arithmetic shift left (absolute,X)
    BMI $1F              ; 30 1F | Branch if negative
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CPX $0E              ; E4 0E | Compare X register (zero page)
    SBC ($30),Y          ; F1 30 | Subtract with carry ((zero page),Y)
    STX $86              ; 86 86 | Store X register to zero page
    STA ($E4),Y          ; 91 E4 | Update graphics data
    CPX #$07             ; E0 07 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    STX $79              ; 86 79 | Store X register to zero page
    STA ($6A),Y          ; 91 6A | Update graphics data
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF F0 0F 00 | Read graphics status
    EOR $1C41,Y          ; 59 41 1C | Exclusive OR with accumulator (absolute,Y)
    PHB                  ; 8B | Push data bank register to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $E10E            ; EE 0E E1 | Increment (absolute)
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    BVS $68              ; 70 68 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_136
; Address: $EFD918
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_136:
    INX                  ; E8 | Increment X register
    ASL $01F1            ; 0E F1 01 | Arithmetic shift left (absolute)
    INC $E013,X          ; FE 13 E0 | Game work RAM access
    LDA $0F0FAF          ; AF AF 0F 0F | Read graphics status
    BNE $7D              ; D0 7D | Branch if not equal
    BVS $F8              ; 70 F8 | Branch if overflow set
    BEQ $38              ; F0 38 | Branch if equal
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_137
; Address: $EFD92D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_137:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    LDA $F00F50          ; AF 50 0F F0 | Read graphics status
    TXA                  ; 8A | Transfer X register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_138
; Address: $EFD93C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_138:
    JSR $C0DF            ; 20 DF C0 | Jump to subroutine
    LSR $BFB1,X          ; 5E B1 BF | Logical shift right (absolute,X)
    LDA                  ; BF 49 49 81 | Read graphics status
    STA ($44,X)          ; 81 44 | Update graphics data
    PEA #$772C           ; F4 2C 77 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    LDA ($00),Y          ; B1 00 | Read graphics status
    LDA                  ; BF 40 49 B6 | Read graphics status
    STA ($7E,X)          ; 81 7E | Update graphics data
    BIT $FA03            ; 2C 03 FA | Test bits in accumulator (absolute)
    BPL $F2              ; 10 F2 | Branch if positive
    INC                  ; 1A | Increment accumulator
    BPL $FB              ; 10 FB | Branch if positive
    BPL $F9              ; 10 F9 | Branch if positive
    STA ($80,X)          ; 81 80 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    ORA $2CD3            ; 0D D3 2C | Logical OR with accumulator (absolute)
    CPX $18              ; E4 18 | Compare X register (zero page)
    SBC $79              ; E5 79 | Subtract with carry (zero page)
    STY $09              ; 84 09 | Store Y register to zero page
    ASL $81              ; 06 81 | Arithmetic shift left (zero page)
    ROR $3CC3,X          ; 7E C3 3C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_139
; Address: $EFD983
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_139:
    JSR $009F            ; 20 9F 00 | Jump to subroutine
    LDX $FE01,Y          ; BE 01 FE | Load from absolute,Y into X register
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    CPX $1B              ; E4 1B | Compare X register (zero page)
    STA $7A              ; 85 7A | Update graphics data
    LDY $21DE,X          ; BC DE 21 | PPU graphics register access
    STZ $B6              ; 64 B6 | Store zero to zero page
    EOR #$E6             ; 49 E6 | Exclusive OR with accumulator (immediate)
    ORA $7F80,Y          ; 19 80 7F | Logical OR with accumulator (absolute,Y)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    INC $18              ; E6 18 | Increment (zero page)
    BMI $9E              ; 30 9E | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_13A
; Address: $EFD9A7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_13A:
    ADC ($3C,X)          ; 61 3C | Add with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STZ $9D62            ; 9C 62 9D | Store zero to absolute
    CPY $0C33            ; CC 33 0C | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $CF              ; 30 CF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_13B
; Address: $EFD9BD
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_13B:
    STA                  ; 9F C3 3C 00 | Update graphics data
    SBC $2E02,X          ; FD 02 2E | Subtract with carry (absolute,X)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPX $F0              ; E4 F0 | Compare X register (zero page)
    SBC $E718,X          ; FD 18 E7 | Subtract with carry (absolute,X)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    LDY $0343,X          ; BC 43 03 | Load from absolute,X into Y register
    BIT $7788            ; 2C 88 77 | Test bits in accumulator (absolute)
    STY $6680            ; 8C 80 66 | Store Y register to absolute address
    SBC $0102,X          ; FD 02 01 | Subtract with carry (absolute,X)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    ROR $99              ; 66 99 | Rotate right (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $CBE7,X          ; FD E7 CB | Subtract with carry (absolute,X)
    SBC $00FF            ; ED FF 00 | Subtract with carry (absolute)
    DEC $46              ; C6 46 | Decrement (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    DEC $39              ; C6 39 | Decrement (zero page)
    BPL $9F              ; 10 9F | Branch if positive
    BPL $9F              ; 10 9F | Branch if positive
    BPL $B9              ; 10 B9 | Branch if positive
    BMI $B8              ; 30 B8 | Branch if negative
    BMI $8C              ; 30 8C | Branch if negative
    STA                  ; 9F 60 9F 60 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    LDA ($4E),Y          ; B1 4E | Read graphics status
    BCS $4F              ; B0 4F | Branch if carry set
    BRA $7F              ; 80 7F | Branch always
    BEQ $03              ; F0 03 | Branch if equal
    PEA #$F0FC           ; F4 FC F0 | Push effective address to stack
    STA $1C90,X          ; 9D 90 1C | Update graphics data
    BPL $18              ; 10 18 | Branch if positive
    BPL $D9              ; 10 D9 | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_13C
; Address: $EFDA69
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_13C:
    CMP ($FE),Y          ; D1 FE | Compare accumulator ((zero page),Y)
    BEQ $77              ; F0 77 | Branch if equal
    PEA #$950B           ; F4 0B 95 | Push effective address to stack
    ROR                  ; 6A | Rotate right (accumulator)
    CLC                  ; 18 | Clear carry flag
    CMP $FE26,Y          ; D9 26 FE | Compare accumulator (absolute,Y)
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    SBC $F7DD,X          ; FD DD F7 | Subtract with carry (absolute,X)
    SBC ($A1,X)          ; E1 A1 | Subtract with carry ((zero page,X))
    SBC $36F8,Y          ; F9 F8 36 | Subtract with carry (absolute,Y)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA ($1E,X)          ; A1 1E | Read graphics status
    SBC $0006,Y          ; F9 06 00 | Subtract with carry (absolute,Y)
    XBA                  ; EB | Exchange accumulator bytes
    CLD                  ; D8 | Clear decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_13D
; Address: $EFDAA4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_13D:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_13E
; Address: $EFDAB1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_13E:
    BCC $67              ; 90 67 | Branch if carry clear
    BCC $E8              ; 90 E8 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $DA              ; F0 DA | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_13F
; Address: $EFDABB
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_13F:
    JSR $30CF            ; 20 CF 30 | Jump to subroutine
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    PEA #$D4DC           ; F4 DC D4 | Push effective address to stack
    PHB                  ; 8B | Push data bank register to stack
    DEY                  ; 88 | Decrement Y register
    BRA $03              ; 80 03 | Branch always
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    CPX $03              ; E4 03 | Compare X register (zero page)
    PEA #$D403           ; F4 03 D4 | Push effective address to stack
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    CMP #$14             ; C9 14 | Compare accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    TXS                  ; 9A | Transfer X register to stack pointer
    TYA                  ; 98 | Transfer Y register to accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    DEC                  ; 3A | Decrement accumulator
    SBC $B818,X          ; FD 18 B8 | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_140
; Address: $EFDAED
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_140:
    BCC $77              ; 90 77 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $BB              ; 65 BB | Add with carry (zero page)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_141
; Address: $EFDAF7
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_141:
    JSL $FBC738          ; 22 38 C7 FB | Jump to subroutine long
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    LDA                  ; BF 40 FB 04 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    CPX $DE11            ; EC 11 DE | Compare X register (absolute)
    AND ($94,X)          ; 21 94 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ADC ($AE),Y          ; 71 AE | Add with carry ((zero page),Y)
    STY $7B              ; 84 7B | Store Y register to zero page
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    STY $7B              ; 84 7B | Store Y register to zero page
    XBA                  ; EB | Exchange accumulator bytes
    PLP                  ; 28 | Pull processor status from stack
    BVS $8F              ; 70 8F | Branch if overflow set
    DEC $38              ; C6 38 | Decrement (zero page)
    STA $E01F70          ; 8F 70 1F E0 | Game work RAM access
    ASL $3EE1,X          ; 1E E1 3E | Arithmetic shift left (absolute,X)
    CMP ($7C,X)          ; C1 7C | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    ASL $0CF1            ; 0E F1 0C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_142
; Address: $EFDB3F
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_142:
    STA                  ; 9F 6D FC C7 | Update graphics data
    SBC $04E7,X          ; FD E7 04 | Subtract with carry (absolute,X)
    BRA $21              ; 80 21 | PPU graphics register access
    DEC $02FC,X          ; DE FC 02 | Decrement (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    STA ($FF,X)          ; 81 FF | Update graphics data
    AND $3FC0,X          ; 3D C0 3F | Logical AND with accumulator (absolute,X)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ADC $007B,X          ; 7D 7B 00 | Add with carry (absolute,X)
    STA ($18,X)          ; 81 18 | Update graphics data
    STA $C23D70          ; 8F 70 3D C2 | Update graphics data
    CMP $D121,X          ; DD 21 D1 | Compare accumulator (absolute,X)
    SEP #$00             ; E2 00 | Set processor status bits
    STA $00DD            ; 8D DD 00 | Update graphics data
    CMP ($0E),Y          ; D1 0E | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_143
; Address: $EFDB97
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_143:
    ORA $FC03            ; 0D 03 FC | Logical OR with accumulator (absolute)
    BRA $7F              ; 80 7F | Branch always
    ADC $D39B,X          ; 7D 9B D3 | Add with carry (absolute,X)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BPL $82              ; 10 82 | Branch if positive
    ADC $009B,X          ; 7D 9B 00 | Add with carry (absolute,X)
    BMI $77              ; 30 77 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    INC $19              ; E6 19 | Increment (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($48,X)          ; 01 48 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    ADC $9A              ; 65 9A | Add with carry (zero page)
    ROR $E081,X          ; 7E 81 E0 | Game work RAM access
    STY $F073            ; 8C 73 F0 | Store Y register to absolute address
    SBC $00ED            ; ED ED 00 | Subtract with carry (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    WDM #$BD             ; 42 BD | Reserved instruction
    BNE $ED              ; D0 ED | Branch if not equal
    SBC $45BA,X          ; FD BA 45 | Subtract with carry (absolute,X)
    ROR $FF91            ; 6E 91 FF | Rotate right (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $10              ; 50 10 | Branch if overflow clear
    LDY #$60             ; A0 60 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$D3             ; A0 D3 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_145
; Address: $EFDC1C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_145:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive
    BVS $7C              ; 70 7C | Branch if overflow set
    BVS $0F              ; 70 0F | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_146
; Address: $EFDC3C
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_146:
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    LDA                  ; BF 80 00 00 | Read graphics status
    BRA $CE              ; 80 CE | Branch always
    LSR $FD00,X          ; 5E 00 FD | Logical shift right (absolute,X)
    LDA                  ; BF 40 00 FF | Read graphics status
    DEX                  ; CA | Decrement X register
    LSR $01A1,X          ; 5E A1 01 | Logical shift right (absolute,X)
    INC $01F6,X          ; FE F6 01 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$93             ; E0 93 | Compare X register (immediate)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    SBC $04FB,Y          ; F9 FB 04 | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    JMP ($E31C)          ; 6C 1C E3 | Jump to address (absolute indirect)
    STZ $38C7            ; 9C C7 38 | Store zero to absolute
    BEQ $1E              ; F0 1E | Branch if equal
    CPX #$3D             ; E0 3D | Compare X register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CMP ($78,X)          ; C1 78 | Compare accumulator ((zero page,X))
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Update graphics data
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $1EF2            ; 0D F2 1E | Logical OR with accumulator (absolute)
    SBC ($38,X)          ; E1 38 | Subtract with carry ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $DC00,X          ; FE 00 DC | Increment (absolute,X)
    STX $86              ; 86 86 | Store X register to zero page
    EOR $BC7B,X          ; 5D 7B BC | Exclusive OR with accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    SBC $738C,X          ; FD 8C 73 | Subtract with carry (absolute,X)
    STX $79              ; 86 79 | Store X register to zero page
    EOR $BC00,X          ; 5D 00 BC | Exclusive OR with accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    STZ $04              ; 64 04 | Store zero to zero page
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_147
; Address: $EFDCEB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_147:
    TXS                  ; 9A | Transfer X register to stack pointer
    BNE $DF              ; D0 DF | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    CMP #$64             ; C9 64 | Compare accumulator (immediate)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_148
; Address: $EFDCFD
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_148:
    JSR $27D8            ; 20 D8 27 | Jump to subroutine
    STA $C100            ; 8D 00 C1 | Update graphics data
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ROR $E95F,X          ; 7E 5F E9 | Rotate right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    INC $4000,X          ; FE 00 40 | Increment (absolute,X)
    LDA                  ; BF 71 8E 8D | Read graphics status
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ROR $E900,X          ; 7E 00 E9 | Rotate right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    BVS $8F              ; 70 8F | Branch if overflow set
    LDX $8000,Y          ; BE 00 80 | Load from absolute,Y into X register
    BMI $EE              ; 30 EE | Branch if negative
    ROL $00C1,X          ; 3E C1 00 | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    BMI $80              ; 30 80 | Branch if negative
    BRA $47              ; 80 47 | Branch always
    CLV                  ; B8 | Clear overflow flag
    ROR $426D            ; 6E 6D 42 | Hardware register operation
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    ORA ($C6,X)          ; 01 C6 | Logical OR with accumulator ((zero page,X))
    INC $FF09            ; EE 09 FF | Increment (absolute)
    BPL $10              ; 10 10 | Branch if positive
    JMP ($4293)          ; 6C 93 42 | Hardware register operation
    LDA $FD02,X          ; BD 02 FD | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    BRA $FD              ; 80 FD | Branch always
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_149
; Address: $EFDD6B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_149:
    JSR $407F            ; 20 7F 40 | Jump to subroutine
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    CPX $00EC            ; EC EC 00 | Compare X register (absolute)
    STA $FE00,Y          ; 99 00 FE | Update graphics data
    BNE $BA              ; D0 BA | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    STA $7866,Y          ; 99 66 78 | Update graphics data
    CLV                  ; B8 | Clear overflow flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_14A
; Address: $EFDDA9
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_14A:
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $EF              ; 10 EF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SBC $0102,X          ; FD 02 01 | Subtract with carry (absolute,X)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    CMP $DD76,X          ; DD 76 DD | Compare accumulator (absolute,X)
    AND ($D1,X)          ; 21 D1 | Logical AND with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $DD00,X          ; DD 00 DD | Compare accumulator (absolute,X)
    CMP ($0E),Y          ; D1 0E | Compare accumulator ((zero page),Y)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    CMP $44              ; C5 44 | Compare accumulator (zero page)
    ROR $7E9A,X          ; 7E 9A 7E | Rotate right (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEX                  ; CA | Decrement X register
    REP #$0C             ; C2 0C | Reset processor status bits
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    BIT #$C5             ; 89 C5 | Test bits in accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    SED                  ; F8 | Set decimal mode flag
    BNE $0F              ; D0 0F | Branch if not equal
    BNE $0F              ; D0 0F | Branch if not equal
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    BNE $2F              ; D0 2F | Branch if not equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CMP ($3D,X)          ; C1 3D | Compare accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_14C
; Address: $EFDE52
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_14C:
    JSR $80DF            ; 20 DF 80 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    SBC $FF04,Y          ; F9 04 FF | Subtract with carry (absolute,Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ASL $00E1,X          ; 1E E1 00 | Arithmetic shift left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_14D
; Address: $EFDE87
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_14D:
    JSR $817E            ; 20 7E 81 | Jump to subroutine
    JMP $F708A3          ; 5C A3 08 F7 | Jump to address long
    BRA $7F              ; 80 7F | Branch always
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $F7              ; 80 F7 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_14E
; Address: $EFDEAA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_14E:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    STA $837C,X          ; 9D 7C 83 | Update graphics data
    BRA $61              ; 80 61 | Branch always
    STZ $DF20,X          ; 9E 20 DF | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_14F
; Address: $EFDEBA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_14F:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SBC $CACB,Y          ; F9 CB CA | Subtract with carry (absolute,Y)
    INC $0003,X          ; FE 03 00 | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    DEX                  ; CA | Decrement X register
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    AND $0100            ; 2D 00 01 | Logical AND with accumulator (absolute)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    INC $2C01,X          ; FE 01 2C | Increment (absolute,X)
    ORA $01F2            ; 0D F2 01 | Logical OR with accumulator (absolute)
    INC $837C,X          ; FE 7C 83 | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_150
; Address: $EFDEFC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_150:
    JSR $5FDF            ; 20 DF 5F | Jump to subroutine
    LDY #$93             ; A0 93 | Load immediate value into Y register
    BCC $01              ; 90 01 | Branch if carry clear
    STA ($6E),Y          ; 91 6E | Update graphics data
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    ROR $1F80,X          ; 7E 80 1F | Rotate right (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_151
; Address: $EFDF34
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_151:
    ASL $0FF1            ; 0E F1 0F | Arithmetic shift left (absolute)
    BEQ $01              ; F0 01 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FF00            ; EE 00 FF | Increment (absolute)
    STA $00EF            ; 8D EF 00 | Update graphics data
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    STY $0073            ; 8C 73 00 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 70 8F 7E | Read graphics status
    PHX                  ; DA | Push X register to stack
    INC $EF10            ; EE 10 EF | Increment (absolute)
    BPL $87              ; 10 87 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BIT #$E6             ; 89 E6 | Test bits in accumulator (immediate)
    ORA $FF00,Y          ; 19 00 FF | Logical OR with accumulator (absolute,Y)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    ASL $3DF0            ; 0E F0 3D | Arithmetic shift left (absolute)
    CPX #$7D             ; E0 7D | Compare X register (immediate)
    CPY #$7A             ; C0 7A | Compare Y register (immediate)
    STA ($F5,X)          ; 81 F5 | Update graphics data
    SEP #$07             ; E2 07 | Set processor status bits
    INY                  ; C8 | Increment Y register
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA $1CF2            ; 0D F2 1C | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_152
; Address: $EFDF9D
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_152:
    STA                  ; 9F C8 37 57 | Update graphics data
    ASL $BDFF,X          ; 1E FF BD | Arithmetic shift left (absolute,X)
    INC $FE1D,X          ; FE 1D FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    STA ($FE,X)          ; 81 FE | Update graphics data
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $01              ; F0 01 | Branch if equal
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    INC $C9              ; E6 C9 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    SBC $00FF            ; ED FF 00 | Subtract with carry (absolute)
    LSR $01              ; 46 01 | Logical shift right (zero page)
    INC $01E6,X          ; FE E6 01 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_153
; Address: $EFDFD4
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_153:
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    BMI $30              ; 30 30 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    ROL $18D1            ; 2E D1 18 | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    BMI $CF              ; 30 CF | Branch if negative
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    STA ($00,X)          ; 81 00 | Update graphics data
    BEQ $F0              ; F0 F0 | Branch if equal
    LDA $42BD50          ; AF 50 BD 42 | Hardware register operation
    JMP ($00FF)          ; 6C FF 00 | Jump to address (absolute indirect)
    STA ($7E,X)          ; 81 7E | Update graphics data
    BEQ $0F              ; F0 0F | Branch if equal
    DEY                  ; 88 | Decrement Y register
    CPY $0833            ; CC 33 08 | Compare Y register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SBC $2402,X          ; FD 02 24 | Subtract with carry (absolute,X)
    LDA $0000,Y          ; B9 00 00 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $7CFF,X          ; 7E FF 7C | Rotate right (absolute,X)
    SBC #$D8             ; E9 D8 | Subtract with carry (immediate)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ROR $7C00,X          ; 7E 00 7C | Rotate right (absolute,X)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BVS $8F              ; 70 8F | Branch if overflow set
    BRA $7F              ; 80 7F | Branch always
    REP #$42             ; C2 42 | Hardware register operation
    LDA                  ; BF 7F 20 7F | Read graphics status
    WDM #$BD             ; 42 BD | Reserved instruction
    BRA $3F              ; 80 3F | Branch always
    BRA $BF              ; 80 BF | Branch always
    BRA $42              ; 80 42 | Hardware register operation
    LDA $9F60,X          ; BD 60 9F | Read graphics status
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    CMP ($1F,X)          ; C1 1F | Compare accumulator ((zero page,X))
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_154
; Address: $EFE0B4
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_154:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA ($FE,X)          ; 81 FE | Update graphics data
    PEA #$C4E8           ; F4 E8 C4 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    DEX                  ; CA | Decrement X register
    BEQ $9A              ; F0 9A | Branch if equal
    CPX #$63             ; E0 63 | Compare X register (immediate)
    BRA $CF              ; 80 CF | Branch always
    LDA                  ; BF 00 F7 00 | Read graphics status
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ADC $DF9B,X          ; 7D 9B DF | Add with carry (absolute,X)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BPL $82              ; 10 82 | Branch if positive
    ADC $009B,X          ; 7D 9B 00 | Add with carry (absolute,X)
    DEC $7631            ; CE 31 76 | Decrement (absolute)
    BIT #$E4             ; 89 E4 | Test bits in accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BCC $90              ; 90 90 | Branch if carry clear
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    BCC $FF              ; 90 FF | Branch if carry clear
    DEC $90FF,X          ; DE FF 90 | Decrement (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    BMI $CF              ; 30 CF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ADC $00FF,X          ; 7D FF 00 | Add with carry (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $80              ; 80 80 | Branch always
    BMI $CF              ; 30 CF | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    STA $80FF            ; 8D FF 80 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $303C,X          ; 3D 3C 30 | Logical AND with accumulator (absolute,X)
    BMI $0F              ; 30 0F | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    ROR $5C81,X          ; 7E 81 5C | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_155
; Address: $EFE198
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_155:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCC $27              ; 90 27 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_156
; Address: $EFE1B0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_156:
    JSL $C33CDD          ; 22 DD 3C C3 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    STA $DD22,X          ; 9D 22 DD | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_157
; Address: $EFE1BA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_157:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA $1F3E            ; 0D 3E 1F | Logical OR with accumulator (absolute)
    STZ $9D38,X          ; 9E 38 9D | Store zero to absolute,X
    SEC                  ; 38 | Set carry flag
    STZ $9930            ; 9C 30 99 | Store zero to absolute
    BMI $BB              ; 30 BB | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_158
; Address: $EFE1CD
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_158:
    JSR $C0E7            ; 20 E7 C0 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $4F              ; F0 4F | Branch if equal
    BEQ $5F              ; F0 5F | Branch if equal
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ADC $7A85,X          ; 7D 85 7A | Add with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDX #$22             ; A2 22 | Load immediate value into X register
    ROL $B2              ; 26 B2 | Rotate left (zero page)
    EOR $43BC            ; 4D BC 43 | Exclusive OR with accumulator (absolute)
    STA $7A              ; 85 7A | Update graphics data
    ROR $99              ; 66 99 | Rotate right (zero page)
    LDX #$5D             ; A2 5D | Load immediate value into X register
    ROR $80              ; 66 80 | Rotate right (zero page)
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STY $7F              ; 84 7F | Store Y register to zero page
    BRA $FE              ; 80 FE | Branch always
    CMP $7F4C            ; CD 4C 7F | Compare accumulator (absolute)
    SBC $B002,X          ; FD 02 B0 | Subtract with carry (absolute,X)
    ROR $CD91            ; 6E 91 CD | Rotate right (absolute)
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    LDA                  ; BF 00 87 00 | Read graphics status
    ADC $7F38,Y          ; 79 38 7F | Add with carry (absolute,Y)
    SBC $C03F,X          ; FD 3F C0 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BRA $B7              ; 80 B7 | Branch always
    ADC $4686,Y          ; 79 86 46 | Add with carry (absolute,Y)
    LDA $FD02,Y          ; B9 02 FD | Read graphics status
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    ADC $8200,X          ; 7D 00 82 | Add with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_159
; Address: $EFE254
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_159:
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    ADC $8282,X          ; 7D 82 82 | Add with carry (absolute,X)
    ADC $20D7,X          ; 7D D7 20 | Add with carry (absolute,X)
    LDA                  ; BF 40 00 FF | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    SBC $00FF            ; ED FF 00 | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    DEC                  ; 3A | Decrement accumulator
    CMP $BF              ; C5 BF | Compare accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    INC $19              ; E6 19 | Increment (zero page)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    BMI $CF              ; 30 CF | Branch if negative
    BVC $AF              ; 50 AF | Branch if overflow clear
    BPL $EF              ; 10 EF | Branch if positive
    LDA                  ; BF 02 C1 C1 | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    JMP $3EC1            ; 4C C1 3E | Jump to address
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $FD              ; 80 FD | Branch always
    LSR $4E7D            ; 4E 7D 4E | Logical shift right (absolute)
    JMP ($4E93)          ; 6C 93 4E | Jump to address (absolute indirect)
    LDA ($4E),Y          ; B1 4E | Read graphics status
    STA ($00,X)          ; 81 00 | Update graphics data
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_15A
; Address: $EFE2C6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_15A:
    JSR $2FDF            ; 20 DF 2F | Jump to subroutine
    BNE $20              ; D0 20 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    BMI $CF              ; 30 CF | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    BRA $7F              ; 80 7F | Branch always
    BRA $F7              ; 80 F7 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_15B
; Address: $EFE30A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_15B:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BVS $FF              ; 70 FF | Branch if overflow set
    STA $807F,X          ; 9D 7F 80 | Update graphics data
    ADC $6182,X          ; 7D 82 61 | Add with carry (absolute,X)
    STZ $DF20,X          ; 9E 20 DF | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_15E
; Address: $EFE329
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_15E:
    BMI $20              ; 30 20 | Branch if negative
    LDA $F70850          ; AF 50 08 F7 | Read graphics status
    BRA $09              ; 80 09 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    WDM #$BD             ; 42 BD | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $4B              ; 80 4B | Branch always
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    STA $00              ; 85 00 | Update graphics data
    JMP ($8000)          ; 6C 00 80 | Jump to address (absolute indirect)
    ORA $FF19,Y          ; 19 19 FF | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ROL $E700,X          ; 3E 00 E7 | Rotate left (absolute,X)
    INC $00              ; E6 00 | Increment (zero page)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    DEC $CE01            ; CE 01 CE | Decrement (absolute)
    AND ($BB),Y          ; 31 BB | Logical AND with accumulator ((zero page),Y)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_15F
; Address: $EFE3F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_15F:
    JSR $3400            ; 20 00 34 | Jump to subroutine
    ASL $FF00            ; 0E 00 FF | Arithmetic shift left (absolute)
    ADC $7D00,X          ; 7D 00 7D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_160
; Address: $EFE400
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_160:
    JSR $2400            ; 20 00 24 | Jump to subroutine
    BPL $0E              ; 10 0E | Branch if positive
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    AND $3944,Y          ; 39 44 39 | Logical AND with accumulator (absolute,Y)
    STX $FF71            ; 8E 71 FF | Store X register to absolute address
    INC $CE01,X          ; FE 01 CE | Increment (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_161
; Address: $EFE421
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_161:
    JSR $24DB            ; 20 DB 24 | Jump to subroutine
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    DEC $CE31            ; CE 31 CE | Decrement (absolute)
    AND ($BB),Y          ; 31 BB | Logical AND with accumulator ((zero page),Y)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    BPL $FF              ; 10 FF | Branch if positive
    BMI $CF              ; 30 CF | Branch if negative
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_162
; Address: $EFE43E
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_162:
    STX $0071            ; 8E 71 00 | Store X register to absolute address
    BCC $B5              ; 90 B5 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    INC $18              ; E6 18 | Increment (zero page)
    BRA $98              ; 80 98 | Branch always
    CMP ($80),Y          ; D1 80 | Compare accumulator ((zero page),Y)
    CMP $84              ; C5 84 | Compare accumulator (zero page)
    LDA ($80,X)          ; A1 80 | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    EOR ($16,X)          ; 41 16 | Exclusive OR with accumulator ((zero page,X))
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))
    BRA $4D              ; 80 4D | Branch always
    LDA                  ; BF 00 FF 00 | Read graphics status
    ROL $3A51            ; 2E 51 3A | Rotate left (absolute)
    EOR ($5E,X)          ; 41 5E | Exclusive OR with accumulator ((zero page,X))
    AND ($D4,X)          ; 21 D4 | Logical AND with accumulator ((zero page,X))
    LDA $1A              ; A5 1A | Read graphics status
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $00FF            ; 4D FF 00 | Exclusive OR with accumulator (absolute)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    LDA ($5E,X)          ; A1 5E | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    LDA $16              ; A5 16 | Read graphics status
    SBC #$D5             ; E9 D5 | Subtract with carry (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR $AEB2            ; 4D B2 AE | Exclusive OR with accumulator (absolute)
    EOR ($BE),Y          ; 51 BE | Exclusive OR with accumulator ((zero page),Y)
    EOR ($DE,X)          ; 41 DE | Exclusive OR with accumulator ((zero page,X))
    AND ($D4,X)          ; 21 D4 | Logical AND with accumulator ((zero page,X))
    CPX $1B              ; E4 1B | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    TAX                  ; AA | Transfer accumulator to X register
    EOR $FF00            ; 4D 00 FF | Exclusive OR with accumulator (absolute)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    CPY $0333            ; CC 33 03 | Compare Y register (absolute)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    ROL $DBD1            ; 2E D1 DB | Rotate left (absolute)
    LDA $FF46,Y          ; B9 46 FF | Read graphics status
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    STA ($BA,X)          ; 81 BA | Update graphics data
    STA ($7E,X)          ; 81 7E | Update graphics data
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    ROR $DA01            ; 6E 01 DA | Rotate right (absolute)
    AND $0C              ; 25 0C | Logical AND with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_163
; Address: $EFE502
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_163:
    EOR $3A              ; 45 3A | Exclusive OR with accumulator (zero page)
    STA ($7E,X)          ; 81 7E | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    STA ($6E),Y          ; 91 6E | Update graphics data
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    INC $DA01,X          ; FE 01 DA | Increment (absolute,X)
    AND $8C              ; 25 8C | Logical AND with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $7E              ; 45 7E | Exclusive OR with accumulator (zero page)
    STA ($F4,X)          ; 81 F4 | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    ROR $DA91            ; 6E 91 DA | Rotate right (absolute)
    AND $0C              ; 25 0C | Logical AND with accumulator (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    BRA $7F              ; 80 7F | Branch always
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $6F              ; 90 6F | Branch if carry clear
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_164
; Address: $EFE544
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_164:
    JSR $0DDF            ; 20 DF 0D | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY $FF              ; C4 FF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_165
; Address: $EFE555
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_165:
    JSR $01FE            ; 20 FE 01 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA #$56             ; A9 56 | Read graphics status
    LDA #$56             ; A9 56 | Read graphics status
    LDA ($5E,X)          ; A1 5E | Read graphics status
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($8A,X)          ; 01 8A | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDA #$56             ; A9 56 | Read graphics status
    LDA #$5E             ; A9 5E | Read graphics status
    LDA ($F4,X)          ; A1 F4 | Read graphics status
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_166
; Address: $EFE5A6
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_166:
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    BRA $7F              ; 80 7F | Branch always
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    BCC $6F              ; 90 6F | Branch if carry clear
    LDY $639C,X          ; BC 9C 63 | Load from absolute,X into Y register
    STY $738C            ; 8C 8C 73 | Store Y register to absolute address
    SBC $6F06,Y          ; F9 06 6F | Subtract with carry (absolute,Y)
    BCC $BC              ; 90 BC | Branch if carry clear
    STZ $738C            ; 9C 8C 73 | Store zero to absolute
    STY $23DC            ; 8C DC 23 | Store Y register to absolute address
    LDA ($5E,X)          ; A1 5E | Read graphics status
    BRA $00              ; 80 00 | Branch always
    ORA $A601,X          ; 1D 01 A6 | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    BVS $7F              ; 70 7F | Branch if overflow set
    BRA $FE              ; 80 FE | Branch always
    ORA ($D8,X)          ; 01 D8 | Logical OR with accumulator ((zero page,X))
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $FC00,X          ; 1E 00 FC | Arithmetic shift left (absolute,X)
    LDY $FF03,X          ; BC 03 FF | Load from absolute,X into Y register
    CLD                  ; D8 | Clear decimal mode flag
    LSR $D8A1,X          ; 5E A1 D8 | Logical shift right (absolute,X)
    BRA $E2              ; 80 E2 | Branch always
    EOR $E7A6,Y          ; 59 A6 E7 | Exclusive OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    BVS $8F              ; 70 8F | Branch if overflow set
    BRA $7F              ; 80 7F | Branch always
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDA                  ; BF 40 1F E0 | Read graphics status
    STA $807F70          ; 8F 70 7F 80 | Update graphics data
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$E1             ; C0 E1 | Compare Y register (immediate)
    ASL $FC03,X          ; 1E 03 FC | Arithmetic shift left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $FF00,X          ; BC 00 FF | Load from absolute,X into Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    ORA $A6E2,X          ; 1D E2 A6 | Logical OR with accumulator (absolute,X)
    EOR $E718,Y          ; 59 18 E7 | Exclusive OR with accumulator (absolute,Y)
    STA $807F70          ; 8F 70 7F 80 | Update graphics data
    BRA $E3              ; 80 E3 | Branch always
    ORA $07E6,Y          ; 19 E6 07 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_167
; Address: $EFE67B
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_167:
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ASL $FCE1,X          ; 1E E1 FC | Arithmetic shift left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $FF43,X          ; BC 43 FF | Load from absolute,X into Y register
    CPY #$E1             ; C0 E1 | Compare Y register (immediate)
    ASL $FC03,X          ; 1E 03 FC | Arithmetic shift left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF C4 | Read graphics status
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    DEC $FF31            ; CE 31 FF | Decrement (absolute)
    STZ $0163            ; 9C 63 01 | Store zero to absolute
    INC $33CC,X          ; FE CC 33 | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY $CE              ; C4 CE | Compare Y register (zero page)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    DEC $FF00            ; CE 00 FF | Decrement (absolute)
    STZ $01FE            ; 9C FE 01 | Store zero to absolute
    CPY $01FE            ; CC FE 01 | Compare Y register (absolute)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BMI $FF              ; 30 FF | Branch if negative
    LDA #$56             ; A9 56 | Read graphics status
    JMP ($2E51)          ; 6C 51 2E | Jump to address (absolute indirect)
    BMI $CF              ; 30 CF | Branch if negative
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $30F1            ; 0E F1 30 | Arithmetic shift left (absolute)
    LDA #$6C             ; A9 6C | Read graphics status
    LDX $0051            ; AE 51 00 | Load from absolute address into X register
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC $2FD0            ; 6D D0 2F | Add with carry (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SBC $E916,X          ; FD 16 E9 | Subtract with carry (absolute,X)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC $AF50            ; 6D 50 AF | Add with carry (absolute)
    BRA $7F              ; 80 7F | Branch always
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STA $9866,Y          ; 99 66 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_168
; Address: $EFE764
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_168:
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $08              ; 10 08 | Branch if positive
    ORA $8A00,Y          ; 19 00 8A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_169
; Address: $EFE76D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_169:
    JSL $BB22AA          ; 22 AA 22 BB | Jump to subroutine long
    BIT #$66             ; 89 66 | Test bits in accumulator (immediate)
    BIT #$66             ; 89 66 | Test bits in accumulator (immediate)
    STA $9966,Y          ; 99 66 99 | Update graphics data
    ROR $9B              ; 66 9B | Rotate right (zero page)
    STZ $BB              ; 64 BB | Store zero to zero page
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $0D              ; 80 0D | Branch always
    CPX $FF              ; E4 FF | Compare X register (zero page)
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_16A
; Address: $EFE7A0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_16A:
    JSL $EE01DD          ; 22 DD 01 EE | Jump to subroutine long
    ORA ($88,X)          ; 01 88 | Logical OR with accumulator ((zero page,X))
    STA ($08),Y          ; 91 08 | Update graphics data
    BRA $19              ; 80 19 | Branch always
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_16B
; Address: $EFE7AC
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_16B:
    JSR $31B9            ; 20 B9 31 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $9966,Y          ; 99 66 99 | Update graphics data
    ROR $99              ; 66 99 | Rotate right (zero page)
    ROR $99              ; 66 99 | Rotate right (zero page)
    ROR $99              ; 66 99 | Rotate right (zero page)
    ROR $99              ; 66 99 | Rotate right (zero page)
    ROR $B9              ; 66 B9 | Rotate right (zero page)
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    LSR $99              ; 46 99 | Logical shift right (zero page)
    ROR $98              ; 66 98 | Rotate right (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    STA ($19),Y          ; 91 19 | Update graphics data
    BRA $88              ; 80 88 | Branch always
    ORA ($99),Y          ; 11 99 | Logical OR with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    STA ($6E),Y          ; 91 6E | Update graphics data
    BRA $7F              ; 80 7F | Branch always
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    STA ($08),Y          ; 91 08 | Update graphics data
    BRA $19              ; 80 19 | Branch always
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    STA $8811,Y          ; 99 11 88 | Update graphics data
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_179
; Address: $EFE85E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_179:
    JSL $8910DD          ; 22 DD 10 89 | Jump to subroutine long
    STA $B920,Y          ; 99 20 B9 | Update graphics data
    BMI $A9              ; 30 A9 | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_17E
; Address: $EFE87C
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_17E:
    JSL $DD22DD          ; 22 DD 22 DD | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    SEP #$05             ; E2 05 | Set processor status bits
    REP #$3D             ; C2 3D | Reset processor status bits
    DEC                  ; 3A | Decrement accumulator
    PLB                  ; AB | Pull data bank register from stack
    SBC $E400,Y          ; F9 00 E4 | Subtract with carry (absolute,Y)
    SBC $E700,X          ; FD 00 E7 | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $60              ; 10 60 | Branch if positive
    SEP #$1D             ; E2 1D | Set processor status bits
    LDX $AAA1,Y          ; BE A1 AA | Load from absolute,Y into X register
    LDA ($A2,X)          ; A1 A2 | Read graphics status
    LDA ($24,X)          ; A1 24 | Read graphics status
    STZ $9C60            ; 9C 60 9C | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_183
; Address: $EFE8D3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_183:
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $1F              ; 80 1F | Branch always
    DEC                  ; 3A | Decrement accumulator
    AND $3E3D,X          ; 3D 3D 3E | Logical AND with accumulator (absolute,X)
    AND $6F68,Y          ; 39 68 6F | Logical AND with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_184
; Address: $EFE8F0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_184:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    STZ $1C9C            ; 9C 9C 1C | Store zero to absolute
    ORA $E4              ; 05 E4 | Logical OR with accumulator (zero page)
    CMP $E4              ; C5 E4 | Compare accumulator (zero page)
    CPX $58              ; E4 58 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_185
; Address: $EFE90E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_185:
    BIT $6330            ; 2C 30 63 | Test bits in accumulator (absolute)
    STA                  ; 9F 00 DF 00 | Update graphics data
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    STA ($6F),Y          ; 91 6F | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_187
; Address: $EFE945
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_187:
    JSL $9922BB          ; 22 BB 22 99 | Jump to subroutine long
    ROR $99              ; 66 99 | Rotate right (zero page)
    STA $9900,Y          ; 99 00 99 | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_18B
; Address: $EFE964
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_18B:
    JSL $BB22BB          ; 22 BB 22 BB | Jump to subroutine long
    STA $9900,Y          ; 99 00 99 | Update graphics data
    STA $DD22,Y          ; 99 22 DD | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_18D
; Address: $EFE976
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_18D:
    JSL $FF00DD          ; 22 DD 00 FF | Jump to subroutine long
    ORA ($40),Y          ; 11 40 | Logical OR with accumulator ((zero page),Y)
    ORA $44              ; 05 44 | Logical OR with accumulator (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    ORA ($35,X)          ; 01 35 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA $FF40            ; AD 40 FF | Read graphics status
    DEY                  ; 88 | Decrement Y register
    PHB                  ; 8B | Push data bank register to stack
    DEY                  ; 88 | Decrement Y register
    BRA $26              ; 80 26 | Branch always
    ORA ($4E,X)          ; 01 4E | Logical OR with accumulator ((zero page,X))
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    STA ($8D,X)          ; 81 8D | Update graphics data
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ROR $FE01,X          ; 7E 01 FE | Rotate right (absolute,X)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_18E
; Address: $EFE9C1
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_18E:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    LDY $AC90            ; AC 90 AC | Load from absolute address into Y register
    BCC $4C              ; 90 4C | Branch if carry clear
    BVC $FC              ; 50 FC | Branch if overflow clear
    JMP $00DFA0          ; 5C A0 DF 00 | Jump to address long
    LDA                  ; BF 00 0F F0 | Read graphics status
    STA $353D70          ; 8F 70 3D 35 | Update graphics data
    DEC                  ; 3A | Decrement accumulator
    AND $2A              ; 25 2A | Logical AND with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    JMP $6543            ; 4C 43 65 | Jump to address
    DEX                  ; CA | Decrement X register
    CMP $DE00            ; CD 00 DE | Compare accumulator (absolute)
    ORA ($DC,X)          ; 01 DC | Logical OR with accumulator ((zero page,X))
    STZ $9803            ; 9C 03 98 | Store zero to absolute
    CLV                  ; B8 | Clear overflow flag
    STZ $2C01,X          ; 9E 01 2C | Store zero to absolute,X
    BMI $76              ; 30 76 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $D02F10          ; 8F 10 2F D0 | Update graphics data
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_18F
; Address: $EFEA19
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_18F:
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $24              ; F0 24 | Branch if equal
    JMP $6A5028          ; 5C 28 50 6A | Jump to address long
    BPL $6B              ; 10 6B | Branch if positive
    BPL $6D              ; 10 6D | Branch if positive
    JMP ($AB13)          ; 6C 13 AB | Jump to address (absolute indirect)
    PLB                  ; AB | Pull data bank register from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_190
; Address: $EFEA41
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_190:
    JSL $9822BB          ; 22 BB 22 98 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $0011            ; EE 11 00 | Increment (absolute)
    LDA $2242,X          ; BD 42 22 | Read graphics status
    CMP $DD22,X          ; DD 22 DD | Compare accumulator (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    WDM #$BD             ; 42 BD | Reserved instruction
    LDA $BB20,Y          ; B9 20 BB | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_191
; Address: $EFEA63
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_191:
    JSL $996699          ; 22 99 66 99 | Jump to subroutine long
    ROR $EE              ; 66 EE | Rotate right (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_192
; Address: $EFEA70
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_192:
    JSR $22DF            ; 20 DF 22 | Jump to subroutine
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_193
; Address: $EFEA80
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_193:
    JSR $22B9            ; 20 B9 22 | Jump to subroutine
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    WDM #$BD             ; 42 BD | Reserved instruction

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_194
; Address: $EFEA90
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_194:
    JSR $22DF            ; 20 DF 22 | Jump to subroutine
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    STA $B920,Y          ; 99 20 B9 | Update graphics data
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_195
; Address: $EFEAB2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_195:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    AND ($5A,X)          ; 21 5A | Logical AND with accumulator ((zero page,X))
    LDA ($3E,X)          ; A1 3E | Read graphics status
    CMP ($B4,X)          ; C1 B4 | Compare accumulator ((zero page,X))
    STX $1A61            ; 8E 61 1A | Store X register to absolute address
    SBC $8C              ; E5 8C | Subtract with carry (zero page)
    STA $7A              ; 85 7A | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_196
; Address: $EFEAE3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_196:
    ORA $6D              ; 05 6D | Logical OR with accumulator (zero page)
    LDY $AD03            ; AC 03 AD | Load from absolute address into Y register
    ADC $0A              ; 65 0A | Add with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY #$5C             ; C0 5C | Compare Y register (immediate)
    LDY #$4C             ; A0 4C | Load immediate value into Y register
    BCS $8C              ; B0 8C | Branch if carry set
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $9C              ; 70 9C | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_197
; Address: $EFEB0E
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_197:
    STZ $1F60            ; 9C 60 1F | Store zero to absolute
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $6A              ; 80 6A | Branch always
    ADC #$2B             ; 69 2B | Add with carry (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ADC $3A78,Y          ; 79 78 3A | Add with carry (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    BVC $AF              ; 50 AF | Branch if overflow clear
    SBC $FD02            ; ED 02 FD | Subtract with carry (absolute)
    LDX #$5D             ; A2 5D | Load immediate value into X register
    LDA ($9E,X)          ; A1 9E | Read graphics status
    STA $50AF70          ; 8F 70 AF 50 | Update graphics data
    BPL $FF              ; 10 FF | Branch if positive
    LDY $1B              ; A4 1B | Load from zero page into Y register
    CPX $1B              ; E4 1B | Compare X register (zero page)
    SEP #$1D             ; E2 1D | Set processor status bits
    SEP #$1D             ; E2 1D | Set processor status bits
    SEP #$1D             ; E2 1D | Set processor status bits
    SEP #$1D             ; E2 1D | Set processor status bits
    ORA #$E6             ; 09 E6 | Logical OR with accumulator (immediate)
    ORA $07F8,Y          ; 19 F8 07 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_198
; Address: $EFEB72
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_198:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Update graphics data
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 81 7E 40 | Read graphics status
    LDA                  ; BF 00 FF 00 | Read graphics status
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $7D82,X          ; FD 82 7D | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 01 FE 00 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 01 FE 00 | Read graphics status
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    SBC $5FA0,X          ; FD A0 5F | Subtract with carry (absolute,X)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    JMP $59B3            ; 4C B3 59 | Jump to address
    LDX $BF              ; A6 BF | Load from zero page into X register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 FF 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_199
; Address: $EFEC19
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_199:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    LDX $59              ; A6 59 | Load from zero page into X register
    ORA $0AF5            ; 0D F5 0A | Logical OR with accumulator (absolute)
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    LDA $5A              ; A5 5A | Read graphics status
    EOR #$BE             ; 49 BE | Exclusive OR with accumulator (immediate)
    EOR ($FC,X)          ; 41 FC | Exclusive OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $E8              ; 05 E8 | Logical OR with accumulator (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    STZ $9C60            ; 9C 60 9C | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_19C
; Address: $EFEC4C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_19C:
    STZ $8E60,X          ; 9E 60 8E | Store zero to absolute,X
    BVS $7F              ; 70 7F | Branch if overflow set
    BRA $7F              ; 80 7F | Branch always
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $1F              ; 80 1F | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_19D
; Address: $EFEC68
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_19D:
    JSL $232A23          ; 22 23 2A 23 | Jump to subroutine long
    ASL $E007,X          ; 1E 07 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY $DC00            ; CC 00 DC | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    LDA ($9E,X)          ; A1 9E | Read graphics status
    CMP ($DE,X)          ; C1 DE | Compare accumulator ((zero page,X))
    CMP ($CE),Y          ; D1 CE | Compare accumulator ((zero page),Y)
    SEP #$ED             ; E2 ED | Set processor status bits
    NOP                  ; EA | No operation
    SBC $EA              ; E5 EA | Subtract with carry (zero page)
    SBC $FD              ; E5 FD | Subtract with carry (zero page)
    INC $19              ; E6 19 | Increment (zero page)
    SEP #$1D             ; E2 1D | Set processor status bits
    LDX #$5D             ; A2 5D | Load immediate value into X register
    LDX #$5D             ; A2 5D | Load immediate value into X register
    LDX #$5D             ; A2 5D | Load immediate value into X register
    SEP #$1D             ; E2 1D | Set processor status bits
    INC $19              ; E6 19 | Increment (zero page)
    INC $19              ; E6 19 | Increment (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA $FF07F8          ; 8F F8 07 FF | Update graphics data
    ROL $3FC1,X          ; 3E C1 3F | Rotate left (absolute,X)
    INC $1FF1            ; EE F1 1F | Increment (absolute)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA $FF07F8          ; 8F F8 07 FF | Update graphics data
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA                  ; 9F 1F E7 EF | Update graphics data
    ORA $F7E9,Y          ; 19 E9 F7 | Logical OR with accumulator (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_19E
; Address: $EFED2E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_19E:
    INC $9F60,X          ; FE 60 9F | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BEQ $CE              ; F0 CE | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    BRA $01              ; 80 01 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_19F
; Address: $EFED88
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_19F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($F3,X)          ; 01 F3 | Logical OR with accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    DEC $0247            ; CE 47 02 | Decrement (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $3F00,X          ; 3D 00 3F | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A0
; Address: $EFEDB9
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A0:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $0F7F,Y          ; F9 7F 0F | Subtract with carry (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    LDY #$A2             ; A0 A2 | Load immediate value into Y register
    EOR $0FF0,X          ; 5D F0 0F | Exclusive OR with accumulator (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    EOR $9FA6,Y          ; 59 A6 9F | Exclusive OR with accumulator (absolute,Y)
    BVS $80              ; 70 80 | Branch if overflow set
    SBC $3E11            ; ED 11 3E | Subtract with carry (absolute)
    CPY #$6A             ; C0 6A | Compare Y register (immediate)
    BRA $69              ; 80 69 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    LDX $59              ; A6 59 | Load from zero page into X register
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    STA                  ; 9F 60 7F 80 | Update graphics data
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A1
; Address: $EFEE23
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A1:
    JSR $00CF            ; 20 CF 00 | Jump to subroutine
    ORA $E306,Y          ; 19 06 E3 | Logical OR with accumulator (absolute,Y)
    SBC $8406,Y          ; F9 06 84 | Subtract with carry (absolute,Y)
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A2
; Address: $EFEE3C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A2:
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    AND $27              ; 25 27 | Logical AND with accumulator (zero page)
    ASL $F81F,X          ; 1E 1F F8 | Arithmetic shift left (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    SBC $F8FB,Y          ; F9 FB F8 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A4
; Address: $EFEE6D
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A4:
    INX                  ; E8 | Increment X register
    ADC $0FEC            ; 6D EC 0F | Add with carry (absolute)
    PLX                  ; FA | Pull X register from stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $EA              ; 05 EA | Logical OR with accumulator (zero page)
    NOP                  ; EA | No operation
    SEP #$1D             ; E2 1D | Set processor status bits
    SEP #$1D             ; E2 1D | Set processor status bits
    STA $03FC            ; 8D FC 03 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BNE $DF              ; D0 DF | Branch if not equal
    BMI $7F              ; 30 7F | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($FC),Y          ; F1 FC | Subtract with carry ((zero page),Y)
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A5
; Address: $EFEF35
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A5:
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A6
; Address: $EFEF88
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A6:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC $F106,Y          ; F9 06 F1 | Subtract with carry (absolute,Y)
    ASL $05FA            ; 0E FA 05 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BNE $2F              ; D0 2F | Branch if not equal
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A7
; Address: $EFEFB6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A7:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    INC $9C01,X          ; FE 01 9C | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1A9
; Address: $EFEFC5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1A9:
    JSR $A05E            ; 20 5E A0 | Jump to subroutine
    JMP $E01CA0          ; 5C A0 1C E0 | Game work RAM access
    BEQ $2C              ; F0 2C | Branch if equal
    BNE $7F              ; D0 7F | Branch if not equal
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1AA
; Address: $EFEFDF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1AA:
    JSR $9F9E            ; 20 9E 9F | Jump to subroutine
    ASL $1E1F,X          ; 1E 1F 1E | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1AB
; Address: $EFEFF2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1AB:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    SBC $EDEC            ; ED EC ED | Subtract with carry (absolute)
    CPX $FCFD            ; EC FD FC | Compare X register (absolute)
    SBC $B9FC,X          ; FD FC B9 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1AC
; Address: $EFF00B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1AC:
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ORA $0C71            ; 0D 71 0C | Logical OR with accumulator (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR $6D11            ; 6E 11 6D | Rotate right (absolute)
    ADC $1A              ; 65 1A | Add with carry (zero page)
    BPL $6B              ; 10 6B | Branch if positive
    PLX                  ; FA | Pull X register from stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $FF              ; 30 FF | Branch if negative
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    JMP ($6C90)          ; 6C 90 6C | Jump to address (absolute indirect)
    BCC $4D              ; 90 4D | Branch if carry clear
    BCS $CD              ; B0 CD | Branch if carry set
    BMI $9D              ; 30 9D | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1AE
; Address: $EFF091
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1AE:
    JSR $E01F            ; 20 1F E0 | Game work RAM access
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $07              ; 80 07 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDY $B8FC,X          ; BC FC B8 | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    LDY $BCEC            ; AC EC BC | Load from absolute address into Y register
    LDY $3CFC,X          ; BC FC 3C | Load from absolute,X into Y register
    ADC #$16             ; 69 16 | Add with carry (immediate)
    JMP $017E23          ; 5C 23 7E 01 | Jump to address long
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1AF
; Address: $EFF0EC
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1AF:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $00F9,Y          ; F9 F9 00 | Subtract with carry (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    ASL $F4              ; 06 F4 | Arithmetic shift left (zero page)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BRA $D9              ; 80 D9 | Branch always
    ROL $F4              ; 26 F4 | Rotate left (zero page)
    ASL $E3E1,X          ; 1E E1 E3 | Arithmetic shift left (absolute,X)
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $E3              ; F0 E3 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    BVS $E1              ; 70 E1 | Branch if overflow set
    AND $CFC2,X          ; 3D C2 CF | Logical AND with accumulator (absolute,X)
    BMI $37              ; 30 37 | Branch if negative
    INY                  ; C8 | Increment Y register
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    CPX #$C2             ; E0 C2 | Compare X register (immediate)
    AND $0FF0,X          ; 3D F0 0F | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BVC $2F              ; 50 2F | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $E9              ; E6 E9 | Increment (zero page)
    CLV                  ; B8 | Clear overflow flag
    JMP $17E8            ; 4C E8 17 | Jump to address
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BPL $77              ; 10 77 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $FC06,Y          ; 19 06 FC | Logical OR with accumulator (absolute,Y)
    BRA $5F              ; 80 5F | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    STA ($10,X)          ; 81 10 | Update graphics data
    CPY #$0B             ; C0 0B | Compare Y register (immediate)
    CPX #$87             ; E0 87 | Compare X register (immediate)
    BVS $C5              ; 70 C5 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    CPY $619E            ; CC 9E 61 | Compare Y register (absolute)
    BVC $A0              ; 50 A0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B0
; Address: $EFF1B7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B0:
    BRA $3B              ; 80 3B | Branch always
    CPY $CD              ; C4 CD | Compare Y register (zero page)
    EOR $BD              ; 45 BD | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B1
; Address: $EFF1C2
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B1:
    JSL $6618DE          ; 22 DE 18 66 | Jump to subroutine long
    STY $C633            ; 8C 33 C6 | Store Y register to absolute address
    ORA $8C63,Y          ; 19 63 8C | Logical OR with accumulator (absolute,Y)
    STA $4C66,Y          ; 99 66 4C | Update graphics data
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    CMP $E720,X          ; DD 20 E7 | Compare accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SBC $FC06,Y          ; F9 06 FC | Subtract with carry (absolute,Y)
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    LDY $0B              ; A4 0B | Load from zero page into Y register
    EOR $D390            ; 4D 90 D3 | Exclusive OR with accumulator (absolute)
    BIT $0609            ; 2C 09 06 | Test bits in accumulator (absolute)
    BPL $F7              ; 10 F7 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    LDX $FE41,Y          ; BE 41 FE | Load from absolute,Y into X register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    WDM #$C1             ; 42 C1 | Reserved instruction
    EOR ($92),Y          ; 51 92 | Exclusive OR with accumulator ((zero page),Y)
    CMP $E20A            ; CD 0A E2 | Compare accumulator (absolute)
    BVS $CF              ; 70 CF | Branch if overflow set
    BMI $3B              ; 30 3B | Branch if negative
    CPY $4D              ; C4 4D | Compare Y register (zero page)
    STY $02BD            ; 8C BD 02 | Store Y register to absolute address
    INC $F301            ; EE 01 F3 | Increment (absolute)
    SBC $7F00,X          ; FD 00 7F | Subtract with carry (absolute,X)
    BRA $37              ; 80 37 | Branch always
    INY                  ; C8 | Increment Y register
    PEA #$F800           ; F4 00 F8 | Push effective address to stack
    EOR ($BC,X)          ; 41 BC | Exclusive OR with accumulator ((zero page,X))
    AND ($5E,X)          ; 21 5E | Logical AND with accumulator ((zero page,X))
    AND ($4E),Y          ; 31 4E | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B2
; Address: $EFF239
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B2:
    JSR $31CE            ; 20 CE 31 | Jump to subroutine
    AND ($5E,X)          ; 21 5E | Logical AND with accumulator ((zero page,X))
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $CE33            ; 4C 33 CE | Jump to address
    ORA ($47),Y          ; 11 47 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    STY $013D            ; 8C 3D 01 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B4
; Address: $EFF258
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B4:
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    LDX $01              ; A6 01 | Load from zero page into X register
    BRA $D7              ; 80 D7 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $F806,Y          ; F9 06 F8 | Subtract with carry (absolute,Y)
    STZ $9E60,X          ; 9E 60 9E | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B5
; Address: $EFF284
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B5:
    STZ $9C60,X          ; 9E 60 9C | Store zero to absolute,X
    STZ $9A60,X          ; 9E 60 9A | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B7
; Address: $EFF28E
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B7:
    STZ $7F60            ; 9C 60 7F | Store zero to absolute
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $3F              ; 80 3F | Branch always
    DEC                  ; 3A | Decrement accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STZ $9CFC            ; 9C FC 9C | Store zero to absolute
    LDY $BCFC,X          ; BC FC BC | Load from absolute,X into Y register
    LDY $03FC,X          ; BC FC 03 | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    WDM #$3D             ; 42 3D | Reserved instruction
    ORA $4D32,X          ; 1D 32 4D | Logical OR with accumulator (absolute,X)
    ADC $354A            ; 6D 4A 35 | Add with carry (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    CPY $EC33            ; CC 33 EC | Compare Y register (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $07FE,X          ; FE FE 07 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B8
; Address: $EFF31A
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B8:
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    INC $0700,X          ; FE 00 07 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROL $9F00,X          ; 3E 00 9F | Rotate left (absolute,X)
    STA $00              ; 85 00 | Update graphics data
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STZ $FFFF            ; 9C FF FF | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $3B              ; F0 3B | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $CF              ; 80 CF | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    SBC $F202,X          ; FD 02 F2 | Subtract with carry (absolute,X)
    ORA $00FC            ; 0D FC 00 | Logical OR with accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF 40 FF 00 | Read graphics status
    ORA $02FF,Y          ; 19 FF 02 | Logical OR with accumulator (absolute,Y)
    ORA $F8FF            ; 0D FF F8 | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ROR $BF80,X          ; 7E 80 BF | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BRA $E6              ; 80 E6 | Branch always
    SBC $80FF,Y          ; F9 FF 80 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    SBC $7B00,Y          ; F9 00 7B | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1B9
; Address: $EFF3D1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1B9:
    STY $FF              ; 84 FF | Store Y register to zero page
    STA $AD5270          ; 8F 70 52 AD | Update graphics data
    STZ $9C60            ; 9C 60 9C | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1BA
; Address: $EFF3E4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1BA:
    STZ $8C60            ; 9C 60 8C | Store zero to absolute
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $CC              ; 70 CC | Branch if overflow set
    BEQ $1C              ; F0 1C | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1BB
; Address: $EFF3ED
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1BB:
    JSR $203E            ; 20 3E 20 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $1F              ; 80 1F | Branch always
    ROL $3E3F,X          ; 3E 3F 3E | Rotate left (absolute,X)
    ROL $6D3F,X          ; 3E 3F 6D | Rotate left (absolute,X)
    ADC $696E            ; 6D 6E 69 | Add with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    LDY $FDEC            ; AC EC FD | Load from absolute address into Y register
    BIT $E4              ; 24 E4 | Test bits in accumulator (zero page)
    CPX $D4              ; E4 D4 | Compare X register (zero page)
    CPX $CC              ; E4 CC | Compare X register (zero page)
    PEA #$0013           ; F4 13 00 | Push effective address to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1BC
; Address: $EFF436
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1BC:
    XBA                  ; EB | Exchange accumulator bytes
    LDX #$1D             ; A2 1D | Load immediate value into X register
    ORA $8D32            ; 0D 32 8D | Logical OR with accumulator (absolute)
    CMP $0DB2            ; CD B2 0D | Compare accumulator (absolute)
    BVS $0F              ; 70 0F | Branch if overflow set
    LDY $FC03,X          ; BC 03 FC | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    JMP ($807F)          ; 6C 7F 80 | Jump to address (absolute indirect)
    INC $00              ; E6 00 | Increment (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1BD
; Address: $EFF4AE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1BD:
    CLC                  ; 18 | Clear carry flag
    JMP ($807F)          ; 6C 7F 80 | Jump to address (absolute indirect)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    JMP ($807E)          ; 6C 7E 80 | Jump to address (absolute indirect)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INC $B8FF,X          ; FE FF B8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TSX                  ; BA | Transfer stack pointer to X register
    ROL $00              ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1BE
; Address: $EFF506
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1BE:
    JSR $D8DF            ; 20 DF D8 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $FF              ; 10 FF | Branch if positive
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    BRA $E6              ; 80 E6 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BPL $AC              ; 10 AC | Branch if positive
    BCC $AE              ; 90 AE | Branch if carry clear
    BCC $6E              ; 90 6E | Branch if carry clear
    BPL $2E              ; 10 2E | Branch if positive
    BNE $5C              ; D0 5C | Branch if not equal
    LDY #$DC             ; A0 DC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1BF
; Address: $EFF54F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1BF:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    AND $2D35,X          ; 3D 35 2D | Logical AND with accumulator (absolute,X)
    AND $2D              ; 25 2D | Logical AND with accumulator (zero page)
    AND $A5              ; 25 A5 | Logical AND with accumulator (zero page)
    AND $2AA6            ; 2D A6 2A | Logical AND with accumulator (absolute)
    STA $0A              ; 85 0A | Update graphics data
    PHB                  ; 8B | Push data bank register to stack
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C0
; Address: $EFF574
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C0:
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    CMP $F800,X          ; DD 00 F8 | Compare accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    BVS $25              ; 70 25 | Branch if overflow set
    AND $2935,Y          ; 39 35 29 | Logical AND with accumulator (absolute,Y)
    AND #$30             ; 29 30 | Logical AND with accumulator (immediate)
    BIT $5C62            ; 2C 62 5C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C1
; Address: $EFF58C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C1:
    JSL $DE20DC          ; 22 DC 20 DE | Jump to subroutine long
    STA                  ; 9F 00 DE 00 | Update graphics data
    DEC $DE00,X          ; DE 00 DE | Decrement (absolute,X)
    LDA                  ; BF 00 1F E0 | Read graphics status
    CPX #$39             ; E0 39 | Compare X register (immediate)
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    ORA #$33             ; 09 33 | Logical OR with accumulator (immediate)
    ORA #$32             ; 09 32 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BVS $08              ; 70 08 | Branch if overflow set
    ORA $00FE            ; 0D FE 00 | Logical OR with accumulator (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C2
; Address: $EFF5C8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C2:
    SED                  ; F8 | Set decimal mode flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BPL $CF              ; 10 CF | Branch if positive
    BMI $DF              ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C3
; Address: $EFF617
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C3:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ASL $3000            ; 0E 00 30 | Arithmetic shift left (absolute)
    ORA ($6D,X)          ; 01 6D | Logical OR with accumulator ((zero page,X))
    LDY $0880            ; AC 80 08 | Load from absolute address into Y register
    INC $7B00,X          ; FE 00 7B | Increment (absolute,X)
    PEA #$0E08           ; F4 08 0E | Push effective address to stack
    BMI $CF              ; 30 CF | Branch if negative
    AND ($D8,X)          ; 21 D8 | Logical AND with accumulator ((zero page,X))
    LDY $3473,X          ; BC 73 34 | Load from absolute,X into Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    INC $E000,X          ; FE 00 E0 | Game work RAM access
    STZ $9960            ; 9C 60 99 | Store zero to absolute
    STZ $99              ; 64 99 | Store zero to zero page
    STZ $9B              ; 64 9B | Store zero to zero page
    STZ $97              ; 64 97 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    STA $9B66,Y          ; 99 66 9B | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C5
; Address: $EFF671
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C5:
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7B              ; 80 7B | Branch always
    STY $73              ; 84 73 | Store Y register to zero page
    STY $8E71            ; 8C 71 8E | Store Y register to absolute address
    ADC $C586,Y          ; 79 86 C5 | Add with carry (absolute,Y)
    DEX                  ; CA | Decrement X register
    ORA #$4F             ; 09 4F | Logical OR with accumulator (immediate)
    EOR $0E0C            ; 4D 0C 0E | Exclusive OR with accumulator (absolute)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    INC $F701,X          ; FE 01 F7 | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$C100           ; F4 00 C1 | Push effective address to stack
    ROL $BE41,X          ; 3E 41 BE | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 04 | Read graphics status
    STY $7B              ; 84 7B | Store Y register to zero page
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 FF 00 | Read graphics status
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA #$74             ; 09 74 | Logical OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    BIT #$36             ; 89 36 | Test bits in accumulator (immediate)
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STA $00FF00          ; 8F 00 FF 00 | Update graphics data
    INC $E100,X          ; FE 00 E1 | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $80              ; 80 80 | Branch always
    BMI $F0              ; 30 F0 | Branch if negative
    SBC ($DF),Y          ; F1 DF | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    DEC $F6              ; C6 F6 | Decrement (zero page)
    ORA $3EFF,X          ; 1D FF 3E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C6
; Address: $EFF752
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C6:
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA $7E              ; 85 7E | Update graphics data
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    STA $806F,Y          ; 99 6F 80 | Update graphics data
    AND $2A              ; 25 2A | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C8
; Address: $EFF76F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C8:
    JSR $50AC            ; 20 AC 50 | Jump to subroutine
    BCC $60              ; 90 60 | Branch if carry clear
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    STA $9360,X          ; 9D 60 93 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1C9
; Address: $EFF77A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1C9:
    LDY $B340,X          ; BC 40 B3 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 6A FF | Read graphics status
    JMP $E74D            ; 4C 4D E7 | Jump to address
    CPX $97              ; E4 97 | Compare X register (zero page)
    BRA $6C              ; 80 6C | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    CMP $14              ; C5 14 | Compare accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    STA $8D72            ; 8D 72 8D | Update graphics data
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    STZ $96              ; 64 96 | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHB                  ; 8B | Push data bank register to stack
    STY $7B              ; 84 7B | Store Y register to zero page
    STY $7F              ; 84 7F | Store Y register to zero page
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7B              ; 80 7B | Branch always
    STY $7B              ; 84 7B | Store Y register to zero page
    STY $7F              ; 84 7F | Store Y register to zero page
    BRA $4B              ; 80 4B | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    CPY $04              ; C4 04 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1CA
; Address: $EFF7CA
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1CA:
    CPY $04              ; C4 04 | Compare Y register (zero page)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    PEA #$F500           ; F4 00 F5 | Push effective address to stack
    CPY $BB              ; C4 BB | Compare Y register (zero page)
    CMP $BA              ; C5 BA | Compare accumulator (zero page)
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    LDA ($9E,X)          ; A1 9E | Read graphics status
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    CMP #$76             ; C9 76 | Compare accumulator (immediate)
    BIT #$56             ; 89 56 | Test bits in accumulator (immediate)
    LDA #$46             ; A9 46 | Read graphics status
    LDA $F906,Y          ; B9 06 F9 | Read graphics status
    ASL $4EF1            ; 0E F1 4E | Arithmetic shift left (absolute)
    LDA ($4A),Y          ; B1 4A | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BCS $4F              ; B0 4F | Branch if carry set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    SEC                  ; 38 | Set carry flag
    BRA $C1              ; 80 C1 | Branch always
    ROL $00FF,X          ; 3E FF 00 | Rotate left (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1CB
; Address: $EFF865
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1CB:
    STA                  ; 9F 12 EF 07 | Update graphics data
    ORA $07FF            ; 0D FF 07 | Logical OR with accumulator (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC $FD24,Y          ; F9 24 FD | Subtract with carry (absolute,Y)
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    STZ $3E7F            ; 9C 7F 3E | Store zero to absolute
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1CC
; Address: $EFF8A3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1CC:
    JSL $AB30CE          ; 22 CE 30 AB | Jump to subroutine long
    ORA ($AD),Y          ; 11 AD | Logical OR with accumulator ((zero page),Y)
    BPL $94              ; 10 94 | Branch if positive
    STA $9906,Y          ; 99 06 99 | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1CD
; Address: $EFF8AF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1CD:
    ASL $BB              ; 06 BB | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA $BF40,X          ; BD 40 BF | Read graphics status
    RTI                  ; 40 | Return from interrupt
    STZ $9F60,X          ; 9E 60 9F | Store zero to absolute,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1CE
; Address: $EFF8BA
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1CE:
    STA $718E70          ; 8F 70 8E 71 | Update graphics data
    ADC #$23             ; 69 23 | Add with carry (immediate)
    JMP ($DA45)          ; 6C 45 DA | Jump to address (absolute indirect)
    STA ($23),Y          ; 91 23 | Update graphics data
    ORA ($E5,X)          ; 01 E5 | Logical OR with accumulator ((zero page,X))
    AND $C9              ; 25 C9 | Logical AND with accumulator (zero page)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    CPY #$32             ; C0 32 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    TSX                  ; BA | Transfer stack pointer to X register
    ROR $FE00            ; 6E 00 FE | Rotate right (absolute)
    PHX                  ; DA | Push X register to stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    STA $748B70          ; 8F 70 8B 74 | Update graphics data
    BCS $F5              ; B0 F5 | Branch if carry set
    DEX                  ; CA | Decrement X register
    INC $FDF1,X          ; FE F1 FD | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $3B              ; 80 3B | Branch always
    CPY $0B              ; C4 0B | Compare Y register (zero page)
    PEA #$FE01           ; F4 01 FE | Push effective address to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    LDX #$1D             ; A2 1D | Load immediate value into X register
    LDX #$1D             ; A2 1D | Load immediate value into X register
    BPL $FF              ; 10 FF | Branch if positive
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    BRA $7F              ; 80 7F | Branch always
    BRA $5F              ; 80 5F | Branch always
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BCC $6F              ; 90 6F | Branch if carry clear
    STA ($6F),Y          ; 91 6F | Update graphics data
    STZ $7E9C            ; 9C 9C 7E | Store zero to absolute

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1CF
; Address: $EFF964
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1CF:
    PLY                  ; 7A | Pull Y register from stack
    ADC $FEED,X          ; 7D ED FE | Add with carry (absolute,X)
    CPY $C8FF            ; CC FF C8 | Compare Y register (absolute)
    SBC $9F67,Y          ; F9 67 9F | Subtract with carry (absolute,Y)
    INC $E7              ; E6 E7 | Increment (zero page)
    ROR $3E7F,X          ; 7E 7F 3E | Rotate right (absolute,X)
    LDA                  ; BF 2B 3B 35 | Read graphics status
    ORA $9F              ; 05 9F | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    SEP #$FF             ; E2 FF | Set processor status bits
    INC $FF              ; E6 FF | Increment (zero page)
    INC $FCFF            ; EE FF FC | Increment (absolute)
    INC $22FF,X          ; FE FF 22 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D1
; Address: $EFF9A6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D1:
    JSL $9867BB          ; 22 BB 67 98 | Jump to subroutine long
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $44BB,X          ; BD BB 44 | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $9B66,Y          ; 99 66 9B | Update graphics data
    STZ $BE              ; 64 BE | Store zero to zero page
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D2
; Address: $EFF9C0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D2:
    JSL $B628BB          ; 22 BB 28 B6 | Jump to subroutine long
    ROL $FB62,X          ; 3E 62 FB | Rotate left (absolute,X)
    ORA $CD              ; 05 CD | Logical OR with accumulator (zero page)
    EOR ($65,X)          ; 41 65 | Exclusive OR with accumulator ((zero page,X))
    LDA                  ; BF 40 B8 40 | Read graphics status
    DEY                  ; 88 | Decrement Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TXS                  ; 9A | Transfer X register to stack pointer
    PHB                  ; 8B | Push data bank register to stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    STZ $FA9E,X          ; 9E 9E FA | Store zero to absolute,X
    STA                  ; 9F F7 94 FD | Update graphics data
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D3
; Address: $EFF9EE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D3:
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHB                  ; 8B | Push data bank register to stack
    STA                  ; 9F 00 01 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    STA ($7E,X)          ; 81 7E | Update graphics data
    REP #$FD             ; C2 FD | Reset processor status bits
    CPY #$6F             ; C0 6F | Compare Y register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    AND $BF6A            ; 2D 6A BF | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    INC $3D01,X          ; FE 01 3D | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D4
; Address: $EFFA18
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D4:
    BMI $0F              ; 30 0F | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CPY $9603            ; CC 03 96 | Compare Y register (absolute)
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    STX $FF              ; 86 FF | Store X register to zero page

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D5
; Address: $EFFA25
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D5:
    JSR $07F8            ; 20 F8 07 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    SBC $0003,X          ; FD 03 00 | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D6
; Address: $EFFA69
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D6:
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BVS $FF              ; 70 FF | Branch if overflow set
    CMP $00FF            ; CD FF 00 | Compare accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    STZ $07FF            ; 9C FF 07 | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    PEA #$76FC           ; F4 FC 76 | Push effective address to stack
    ROR $7F59,X          ; 7E 59 7F | Rotate right (absolute,X)
    ADC ($75),Y          ; 71 75 | Add with carry ((zero page),Y)
    INX                  ; E8 | Increment X register
    CPX $FF07            ; EC 07 FF | Compare X register (absolute)
    STA ($7F,X)          ; 81 7F | Update graphics data
    BEQ $1F              ; F0 1F | Branch if equal
    DEC $BE3F,X          ; DE 3F BE | Decrement (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    STX $EEFF            ; 8E FF EE | Store X register to absolute address
    SBC $F9F9,Y          ; F9 F9 F9 | Subtract with carry (absolute,Y)
    SBC $FDF9,Y          ; F9 F9 FD | Subtract with carry (absolute,Y)
    STY $FEFE            ; 8C FE FE | Store Y register to absolute address
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $1FFF            ; EE FF 1F | Increment (absolute)
    STA                  ; 9F FF 24 B9 | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    BCS $68              ; B0 68 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SBC $5401,Y          ; F9 01 54 | Subtract with carry (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX $B740,Y          ; BE 40 B7 | Load from absolute,Y into X register
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    STA $10EC70          ; 8F 70 EC 10 | Update graphics data
    BEQ $0E              ; F0 0E | Branch if equal
    BEQ $EF              ; F0 EF | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D7
; Address: $EFFB1F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D7:
    BPL $16              ; 10 16 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA $1BA0            ; AD A0 1B | Read graphics status
    ROL $E0              ; 26 E0 | Game work RAM access
    PLY                  ; 7A | Pull Y register from stack
    AND ($05),Y          ; 31 05 | Logical AND with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    ORA #$6D             ; 09 6D | Logical OR with accumulator (immediate)
    LDA                  ; BF 00 5F 00 | Read graphics status
    SBC $FA00,X          ; FD 00 FA | Subtract with carry (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D8
; Address: $EFFB46
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D8:
    ORA $06F2            ; 0D F2 06 | Logical OR with accumulator (absolute)
    BEQ $F5              ; F0 F5 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $20              ; 85 20 | Update graphics data
    EOR ($5C),Y          ; 51 5C | Exclusive OR with accumulator ((zero page),Y)
    EOR $E77C            ; 4D 7C E7 | Exclusive OR with accumulator (absolute)
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    ROR $01              ; 66 01 | Rotate right (zero page)
    DEC $A201,X          ; DE 01 A2 | Decrement (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($E3,X)          ; 01 E3 | Logical OR with accumulator ((zero page,X))
    INC $C7FF,X          ; FE FF C7 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA $FFFFFF          ; 8F FF FF FF | Update graphics data
    LDA                  ; BF FF 2F 3F | Read graphics status
    AND $733E,X          ; 3D 3E 73 | Logical AND with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ROR $FF7F,X          ; 7E 7F FF | Rotate right (absolute,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    STA $EAA87F          ; 8F 7F A8 EA | Update graphics data
    BCS $B6              ; B0 B6 | Branch if carry set
    EOR $9906            ; 4D 06 99 | Exclusive OR with accumulator (absolute)
    ASL $89              ; 06 89 | Arithmetic shift left (zero page)
    BVC $07              ; 50 07 | Branch if overflow clear
    LDA                  ; BF FF FF FF | Read graphics status
    PLX                  ; FA | Pull X register from stack
    LDA $1E42,X          ; BD 42 1E | Read graphics status
    SBC ($03,X)          ; E1 03 | Subtract with carry ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $F00F,Y          ; F9 0F F0 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1D9
; Address: $EFFC15
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1D9:
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($B6),Y          ; 91 B6 | Update graphics data
    BIT $C8              ; 24 C8 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    BNE $CD              ; D0 CD | Branch if not equal
    SBC ($D8,X)          ; E1 D8 | Subtract with carry ((zero page,X))
    ROR $DB00            ; 6E 00 DB | Rotate right (absolute)
    LDA                  ; BF 00 FF 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1DA
; Address: $EFFC3B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1DA:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    SBC $0DC6,Y          ; F9 C6 0D | Subtract with carry (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1DB
; Address: $EFFC46
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1DB:
    ROR $60              ; 66 60 | Rotate right (zero page)
    STA                  ; 9F 00 C1 26 | Update graphics data
    ORA ($97,X)          ; 01 97 | Logical OR with accumulator ((zero page,X))
    STA $9F00,X          ; 9D 00 9F | Update graphics data
    STA                  ; 9F 00 FF 00 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA $D592,X          ; 9D 92 D5 | Update graphics data
    WDM #$3D             ; 42 3D | Reserved instruction

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1DC
; Address: $EFFC65
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1DC:
    JSL $C704EB          ; 22 EB 04 C7 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    LSR $39B1            ; 4E B1 39 | Logical shift right (absolute)
    DEC $10              ; C6 10 | Decrement (zero page)
    ROR $BE01            ; 6E 01 BE | Rotate right (absolute)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1DD
; Address: $EFFC7E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1DD:
    JSR $FFDF            ; 20 DF FF | Jump to subroutine
    BMI $77              ; 30 77 | Branch if negative
    ADC #$6A             ; 69 6A | Add with carry (immediate)
    JMP ($C47D)          ; 6C 7D C4 | Jump to address (absolute indirect)
    BNE $C9              ; D0 C9 | Branch if not equal
    STA ($CA),Y          ; 91 CA | Update graphics data
    CMP ($F6,X)          ; C1 F6 | Compare accumulator ((zero page,X))
    STA                  ; 9F 7F DF 7F | Update graphics data
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    CPX #$13             ; E0 13 | Compare X register (immediate)
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    STY $10FF            ; 8C FF 10 | Store Y register to absolute address
    BMI $DF              ; 30 DF | Branch if negative
    SEC                  ; 38 | Set carry flag
    CMP $FF3C,X          ; DD 3C FF | Compare accumulator (absolute,X)
    BIT $1305            ; 2C 05 13 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1DE
; Address: $EFFCE5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1DE:
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BIT #$53             ; 89 53 | Test bits in accumulator (immediate)
    STZ $DF60            ; 9C 60 DF | Store zero to absolute
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF 00 F8 00 | Read graphics status
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1DF
; Address: $EFFD01
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1DF:
    STA                  ; 9F 10 E7 2C | Update graphics data
    CMP #$59             ; C9 59 | Compare accumulator (immediate)
    BMI $91              ; 30 91 | Branch if negative
    CPY $59              ; C4 59 | Compare Y register (zero page)
    PHY                  ; 5A | Push Y register to stack
    CPY $D8              ; C4 D8 | Compare Y register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROL $3700,X          ; 3E 00 37 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    LDA $FF0010          ; AF 10 00 FF | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    LDA $5480,Y          ; B9 80 54 | Read graphics status
    BCS $AB              ; B0 AB | Branch if carry set
    SEC                  ; 38 | Set carry flag
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    LDX $2000,Y          ; BE 00 20 | Load from absolute,Y into X register
    ASL $31FF            ; 0E FF 31 | Arithmetic shift left (absolute)
    BMI $31              ; 30 31 | Branch if negative
    DEC $C4              ; C6 C4 | Decrement (zero page)
    ASL $BE              ; 06 BE | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    AND $F900,Y          ; 39 00 F9 | Logical AND with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    ORA $4000            ; 0D 00 40 | Logical OR with accumulator (absolute)
    CPX #$42             ; E0 42 | Hardware register operation
    SEP #$5A             ; E2 5A | Set processor status bits
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA $0100,X          ; 1D 00 01 | Logical OR with accumulator (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $19              ; F0 19 | Branch if equal
    SBC #$21             ; E9 21 | PPU graphics register access
    CPY #$53             ; C0 53 | Compare Y register (immediate)
    BRA $9F              ; 80 9F | Branch always
    CLC                  ; 18 | Clear carry flag
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E0
; Address: $EFFD97
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E0:
    BEQ $F6              ; F0 F6 | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $E7              ; 80 E7 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    LDA $9272            ; AD 72 92 | Read graphics status
    LDA $9E49,Y          ; B9 49 9E | Read graphics status
    STZ $DF              ; 64 DF | Store zero to zero page
    STA $3FC77F          ; 8F 7F C7 3F | Update graphics data
    BCC $6F              ; 90 6F | Branch if carry clear
    INY                  ; C8 | Increment Y register
    DEC $19              ; C6 19 | Decrement (zero page)
    DEC $C22F            ; CE 2F C2 | Decrement (absolute)
    STA ($6D,X)          ; 81 6D | Update graphics data
    AND $48FF,Y          ; 39 FF 48 | Logical AND with accumulator (absolute,Y)
    BIT #$0F             ; 89 0F | Test bits in accumulator (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($7F,X)          ; 81 7F | Update graphics data
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    NOP                  ; EA | No operation
    STZ $BED8            ; 9C D8 BE | Store zero to absolute
    LDA                  ; BF 0A 3D 22 | Read graphics status
    JMP ($EDAA)          ; 6C AA ED | Jump to address (absolute indirect)
    EOR $2051,X          ; 5D 51 20 | Exclusive OR with accumulator (absolute,X)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E1
; Address: $EFFDF6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E1:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BNE $00              ; D0 00 | Branch if not equal
    BVC $00              ; 50 00 | Branch if overflow clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR #$30             ; 49 30 | Exclusive OR with accumulator (immediate)
    ROL $C6D1            ; 2E D1 C6 | Rotate left (absolute)
    SBC $EE91,Y          ; F9 91 EE | Subtract with carry (absolute,Y)
    EOR $2AE0,X          ; 5D E0 2A | Exclusive OR with accumulator (absolute,X)
    LDX #$33             ; A2 33 | Load immediate value into X register
    BMI $4F              ; 30 4F | Branch if negative
    BMI $77              ; 30 77 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    AND $3E06,Y          ; 39 06 3E | Logical AND with accumulator (absolute,Y)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($55,X)          ; 01 55 | Logical OR with accumulator ((zero page,X))
    EOR $5A00,X          ; 5D 00 5A | Exclusive OR with accumulator (absolute,X)
    ROL $AF              ; 26 AF | Rotate left (zero page)
    ORA $31              ; 05 31 | Logical OR with accumulator (zero page)
    REP #$EC             ; C2 EC | Reset processor status bits
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E2
; Address: $EFFE29
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E2:
    LDX #$07             ; A2 07 | Load immediate value into X register
    BEQ $A9              ; F0 A9 | Branch if equal
    BPL $70              ; 10 70 | Branch if positive
    STA $F800C9          ; 8F C9 00 F8 | Update graphics data
    TXS                  ; 9A | Transfer X register to stack pointer
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E3
; Address: $EFFE38
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E3:
    SBC $FF10            ; ED 10 FF | Subtract with carry (absolute)
    BRA $8F              ; 80 8F | Branch always
    BVS $E9              ; 70 E9 | Branch if overflow set
    LSR $BD2E            ; 4E 2E BD | Logical shift right (absolute)
    CMP #$4E             ; C9 4E | Compare accumulator (immediate)
    AND ($B0),Y          ; 31 B0 | Logical AND with accumulator ((zero page),Y)
    ADC ($82),Y          ; 71 82 | Add with carry ((zero page),Y)
    ROL $3180,X          ; 3E 80 31 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E4
; Address: $EFFE56
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E4:
    LDA ($00),Y          ; B1 00 | Read graphics status
    TSX                  ; BA | Transfer stack pointer to X register
    TXA                  ; 8A | Transfer X register to accumulator
    AND $2DA3,Y          ; 39 A3 2D | Logical AND with accumulator (absolute,Y)
    REP #$24             ; C2 24 | Reset processor status bits
    AND $848C,Y          ; 39 8C 84 | Logical AND with accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    DEC $7B00            ; CE 00 7B | Decrement (absolute)
    BIT #$77             ; 89 77 | Test bits in accumulator (immediate)
    STA $EE              ; 85 EE | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    INC $00              ; E6 00 | Increment (zero page)
    JMP $0800            ; 4C 00 08 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    INC $FE64,X          ; FE 64 FE | Increment (absolute,X)
    SBC $52F8,X          ; FD F8 52 | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CPX #$C9             ; E0 C9 | Compare X register (immediate)
    CPX #$9B             ; E0 9B | Compare X register (immediate)
    CPY #$26             ; C0 26 | Compare Y register (immediate)
    STA ($FF,X)          ; 81 FF | Update graphics data
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $FFF0,X          ; FD F0 FF | Subtract with carry (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ROR $9C00            ; 6E 00 9C | Rotate right (absolute)
    AND $7F01,Y          ; 39 01 7F | Logical AND with accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E5
; Address: $EFFECB
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E5:
    RTI                  ; 40 | Return from interrupt
    ROL $E780,X          ; 3E 80 E7 | Rotate left (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CMP $1EE1,Y          ; D9 E1 1E | Compare accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $0006,X          ; FD 06 00 | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ASL $F1F3            ; 0E F3 F1 | Arithmetic shift left (absolute)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    LDX $37FE,Y          ; BE FE 37 | Load from absolute,Y into X register
    LDA                  ; BF 00 DF 00 | Read graphics status
    CMP $5500,X          ; DD 00 55 | Compare accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    AND $48              ; 25 48 | Logical AND with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)
    ADC $0F              ; 65 0F | Add with carry (zero page)
    SBC ($0B),Y          ; F1 0B | Subtract with carry ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    LSR                  ; 4A | Logical shift right (accumulator)
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $30              ; C5 30 | Compare accumulator (zero page)
    BMI $A0              ; 30 A0 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BCS $40              ; B0 40 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BRA $75              ; 80 75 | Branch always
    BRA $75              ; 80 75 | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $0D              ; 80 0D | Branch always
    LDY $A861            ; AC 61 A8 | Load from absolute address into Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    EOR #$84             ; 49 84 | Exclusive OR with accumulator (immediate)
    ORA ($84,X)          ; 01 84 | Logical OR with accumulator ((zero page,X))
    STY $7B              ; 84 7B | Store Y register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    BIT #$51             ; 89 51 | Test bits in accumulator (immediate)
    LSR $5750,X          ; 5E 50 57 | Logical shift right (absolute,X)
    STA ($80,X)          ; 81 80 | Update graphics data

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E6
; Address: $EFFF6F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E6:
    JSR $08F7            ; 20 F7 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ADC $AE06,Y          ; 79 06 AE | Add with carry (absolute,Y)
    ORA ($AF,X)          ; 01 AF | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5E_GraphicsFunction_1E7
; Address: $EFFF80
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank5E_GraphicsFunction_1E7:
    AND ($C2,X)          ; 21 C2 | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BVS $8F              ; 70 8F | Branch if overflow set
    CMP $3032            ; CD 32 30 | Compare accumulator (absolute)
    LDA $1F              ; A5 1F | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC ($9A),Y          ; F1 9A | Subtract with carry ((zero page),Y)
    LDA                  ; BF 40 8F 70 | Read graphics status
    CMP $20DF            ; CD DF 20 | Compare accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    ORA $76              ; 05 76 | Logical OR with accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    DEC $7100            ; CE 00 71 | Decrement (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR #$84             ; 49 84 | Exclusive OR with accumulator (immediate)
    JMP $7D22DD          ; 5C DD 22 7D | Jump to address long
    PHB                  ; 8B | Push data bank register to stack
    STA $FF00            ; 8D 00 FF | Update graphics data
    LDY #$62             ; A0 62 | Load immediate value into Y register
    STA $45BA,X          ; 9D BA 45 | Update graphics data
    STA $6B6B70          ; 8F 70 6B 6B | Update graphics data
    STY $DB              ; 84 DB | Store Y register to zero page
    LSR $B0              ; 46 B0 | Logical shift right (zero page)
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    JMP $C626D9          ; 5C D9 26 C6 | Jump to address long
    AND $0094,Y          ; 39 94 00 | Logical AND with accumulator (absolute,Y)
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    AND $F9FE,X          ; 3D FE F9 | Logical AND with accumulator (absolute,X)
    INC $DAF0            ; EE F0 DA | Increment (absolute)
    CPX $B5              ; E4 B5 | Compare X register (zero page)
    CPY #$5A             ; C0 5A | Compare Y register (immediate)
    STA ($FF,X)          ; 81 FF | Update graphics data
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
