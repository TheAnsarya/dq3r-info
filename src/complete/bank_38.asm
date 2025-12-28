;==============================================================================
; Dragon Quest III - Bank $38
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $DC0000-$DC7FFF
; Instructions: 11013
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_38"

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_000
; Address: $DC8040
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_000:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $5F00,X          ; 1D 00 5F | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $21              ; 05 21 | PPU graphics register access
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    LDX $C76E            ; AE 6E C7 | Load from absolute address into X register
    LSR $96              ; 46 96 | Logical shift right (zero page)
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    BPL $02              ; 10 02 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $2E1E,X          ; 1D 1E 2E | Logical OR with accumulator (absolute,X)
    JMP $8105            ; 4C 05 81 | Jump to address
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_001
; Address: $DC8123
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_001:
    BMI $D5              ; 30 D5 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    TAX                  ; AA | Transfer accumulator to X register
    BVC $67              ; 50 67 | Branch if overflow clear
    ADC $2823,Y          ; 79 23 28 | Add with carry (absolute,Y)
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    ASL $0255            ; 0E 55 02 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$15             ; 09 15 | Logical OR with accumulator (immediate)
    ORA $0621,Y          ; 19 21 06 | Logical OR with accumulator (absolute,Y)
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    INC $EA06            ; EE 06 EA | Increment (absolute)
    PLX                  ; FA | Pull X register from stack
    WDM #$FE             ; 42 FE | Reserved instruction
    INC $FE92,X          ; FE 92 FE | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    CPY $42              ; C4 42 | Hardware register operation
    STZ $02              ; 64 02 | Store zero to zero page
    BVC $92              ; 50 92 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    TXA                  ; 8A | Transfer X register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    INC $1A1A            ; EE 1A 1A | Increment (absolute)
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    DEC $9A              ; C6 9A | Decrement (zero page)
    LDX $7A06,Y          ; BE 06 7A | Load from absolute,Y into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $020C            ; EC 0C 02 | Compare X register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    PEA #$E48A           ; F4 8A E4 | Push effective address to stack
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    ROR $DA80            ; 6E 80 DA | Rotate right (absolute)
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    SBC #$64             ; E9 64 | Subtract with carry (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    TAY                  ; A8 | Transfer accumulator to Y register
    TXA                  ; 8A | Transfer X register to accumulator
    DEY                  ; 88 | Decrement Y register
    PLX                  ; FA | Pull X register from stack
    BEQ $74              ; F0 74 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    LDA $7036,Y          ; B9 36 70 | Read graphics status
    CLD                  ; D8 | Clear decimal mode flag
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_002
; Address: $DC8196
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_002:
    CPX $FCFC            ; EC FC FC | Compare X register (absolute)
    STY $74              ; 84 74 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0E04,Y          ; 19 04 0E | Logical OR with accumulator (absolute,Y)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    TSX                  ; BA | Transfer stack pointer to X register
    DEC                  ; 3A | Decrement accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    STA $006C            ; 8D 6C 00 | Update graphics data
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    BPL $02              ; 10 02 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $5F3F,X          ; 1D 3F 5F | Logical OR with accumulator (absolute,X)
    ASL $C64E,X          ; 1E 4E C6 | Arithmetic shift left (absolute,X)
    STA ($18),Y          ; 91 18 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    BMI $65              ; 30 65 | Branch if negative
    AND $003E,Y          ; 39 3E 00 | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $6545            ; 2C 45 65 | Test bits in accumulator (absolute)
    STZ $2A              ; 64 2A | Store zero to zero page
    AND #$15             ; 29 15 | Logical AND with accumulator (immediate)
    ORA $0001,Y          ; 19 01 00 | Logical OR with accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    WDM #$FD             ; 42 FD | Reserved instruction
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    AND ($FD,X)          ; 21 FD | Logical AND with accumulator ((zero page,X))
    STA ($00),Y          ; 91 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY $42              ; C4 42 | Hardware register operation
    CPX $01              ; E4 01 | Compare X register (zero page)
    AND ($BA,X)          ; 21 BA | Logical AND with accumulator ((zero page,X))
    STA ($DA),Y          ; 91 DA | Update graphics data
    SBC $1D19            ; ED 19 1D | Subtract with carry (absolute)
    STA $F5              ; 85 F5 | Update graphics data
    ORA $E9              ; 05 E9 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_003
; Address: $DC8229
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_003:
    STA ($43),Y          ; 91 43 | Update graphics data
    LDA $780D,X          ; BD 0D 78 | Read graphics status
    ORA ($DA,X)          ; 01 DA | Logical OR with accumulator ((zero page,X))
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    STA $E2              ; 85 E2 | Update graphics data
    ORA $42              ; 05 42 | Hardware register operation
    STA $92              ; 85 92 | Update graphics data
    TSX                  ; BA | Transfer stack pointer to X register
    ADC #$86             ; 69 86 | Add with carry (immediate)
    SBC #$08             ; E9 08 | Subtract with carry (immediate)
    SBC #$26             ; E9 26 | Subtract with carry (immediate)
    BVS $5E              ; 70 5E | Branch if overflow set
    JMP $9EECEE          ; 5C EE EC 9E | Jump to address long
    BCC $78              ; 90 78 | Branch if carry clear
    BVS $DC              ; 70 DC | Branch if overflow set
    BCS $36              ; B0 36 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CPX $9C9C            ; EC 9C 9C | Compare X register (absolute)
    STZ $08              ; 64 08 | Store zero to zero page
    BEQ $80              ; F0 80 | Branch if equal
    BVS $45              ; 70 45 | Branch if overflow set
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA #$3F             ; 09 3F | Logical OR with accumulator (immediate)
    ROL $0001,X          ; 3E 01 00 | Rotate left (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    ORA $0704            ; 0D 04 07 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $020C            ; 0E 0C 02 | Arithmetic shift left (absolute)
    ASL $0401            ; 0E 01 04 | Arithmetic shift left (absolute)
    BPL $17              ; 10 17 | Branch if positive
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $2B              ; 06 2B | Arithmetic shift left (zero page)
    ROL $0C2F            ; 2E 2F 0C | Rotate left (absolute)
    ROR $280C            ; 6E 0C 28 | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    AND ($C0),Y          ; 31 C0 | Logical AND with accumulator ((zero page),Y)
    JMP $99F0            ; 4C F0 99 | Jump to address
    ASL $183F,X          ; 1E 3F 18 | Arithmetic shift left (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BVS $6F              ; 70 6F | Branch if overflow set
    BRA $1F              ; 80 1F | Branch always
    ASL $0080,X          ; 1E 80 00 | Arithmetic shift left (absolute,X)
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_004
; Address: $DC82C6
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_004:
    PLX                  ; FA | Pull X register from stack
    DEC                  ; 3A | Decrement accumulator
    PLX                  ; FA | Pull X register from stack
    TXS                  ; 9A | Transfer X register to stack pointer
    SBC $8D8D            ; ED 8D 8D | Subtract with carry (absolute)
    EOR $9D05,X          ; 5D 05 9D | Exclusive OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    DEC                  ; 3A | Decrement accumulator
    BIT $D49A            ; 2C 9A D4 | Test bits in accumulator (absolute)
    STA $1DF6            ; 8D F6 1D | Update graphics data
    INC $1D              ; E6 1D | Increment (zero page)
    SEP #$AD             ; E2 AD | Set processor status bits
    LDA $D5B5,X          ; BD B5 D5 | Read graphics status
    ORA $0DD5            ; 0D D5 0D | Logical OR with accumulator (absolute)
    SBC $67              ; E5 67 | Subtract with carry (zero page)
    INC $30F4,X          ; FE F4 30 | Increment (absolute,X)
    JMP $924D            ; 4C 4D 92 | Jump to address
    ORA $2502            ; 0D 02 25 | Logical OR with accumulator (absolute)
    ORA $42              ; 05 42 | Hardware register operation
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    SBC ($64),Y          ; F1 64 | Subtract with carry ((zero page),Y)
    STA ($4E,X)          ; 81 4E | Update graphics data
    ORA ($B8),Y          ; 11 B8 | Logical OR with accumulator ((zero page),Y)
    STA ($56),Y          ; 91 56 | Update graphics data
    PLX                  ; FA | Pull X register from stack
    BCC $38              ; 90 38 | Branch if carry clear
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BVS $F8              ; 70 F8 | Branch if overflow set
    BMI $80              ; 30 80 | Branch if negative
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    BRA $04              ; 80 04 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BCC $60              ; 90 60 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ROR $00              ; 66 00 | Rotate right (zero page)
    STA                  ; 9F 03 7F 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    ROR $0015,X          ; 7E 15 00 | Rotate right (absolute,X)
    ORA $0D08,Y          ; 19 08 0D | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    ASL $020C            ; 0E 0C 02 | Arithmetic shift left (absolute)
    ASL $0401            ; 0E 01 04 | Arithmetic shift left (absolute)
    LSR $003E,X          ; 5E 3E 00 | Logical shift right (absolute,X)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_005
; Address: $DC835D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_005:
    ROL $2C0F            ; 2E 0F 2C | Rotate left (absolute)
    JMP $692D            ; 4C 2D 69 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    ASL $341D,X          ; 1E 1D 34 | Arithmetic shift left (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_006
; Address: $DC836B
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_006:
    JSL $03437F          ; 22 7F 43 03 | Jump to subroutine long
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA $1E38,Y          ; 19 38 1E | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $3419,X          ; 1E 19 34 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    BPL $E8              ; 10 E8 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PEA #$FA14           ; F4 14 FA | Push effective address to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    PLX                  ; FA | Pull X register from stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $34              ; 10 34 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $EC9A            ; CC 9A EC | Compare Y register (absolute)
    INC                  ; 1A | Increment accumulator
    CPX $1A              ; E4 1A | Compare X register (zero page)
    CPX $AA              ; E4 AA | Compare X register (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $6CEE,X          ; 1E EE 6C | Arithmetic shift left (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $E8              ; F0 E8 | Branch if equal
    BCC $4A              ; 90 4A | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_007
; Address: $DC83B4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_007:
    JSL $440204          ; 22 04 02 44 | Jump to subroutine long
    ASL $E204            ; 0E 04 E2 | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    SEP #$6C             ; E2 6C | Set processor status bits
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_008
; Address: $DC83C0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_008:
    JSL $A8247C          ; 22 7C 24 A8 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    BVS $90              ; 70 90 | Branch if overflow set
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_00A
; Address: $DC83CD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_00A:
    JSR $E0F0            ; 20 F0 E0 | Game work RAM access
    BPL $E8              ; 10 E8 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    BPL $C0              ; 10 C0 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_00B
; Address: $DC83E3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_00B:
    JSR $6077            ; 20 77 60 | Jump to subroutine
    EOR ($5F,X)          ; 41 5F | Exclusive OR with accumulator ((zero page,X))
    WDM #$5E             ; 42 5E | Reserved instruction
    WDM #$5C             ; 42 5C | Reserved instruction
    EOR #$50             ; 49 50 | Exclusive OR with accumulator (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_00D
; Address: $DC83F5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_00D:
    JSR $2341            ; 20 41 23 | Jump to subroutine
    WDM #$22             ; 42 22 | Reserved instruction
    WDM #$2B             ; 42 2B | Reserved instruction
    EOR #$3E             ; 49 3E | Exclusive OR with accumulator (immediate)
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    BVC $52              ; 50 52 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $5658,X          ; 5D 58 56 | Exclusive OR with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $7E6E5C          ; 5C 5C 6E 7E | Jump to address long
    PLP                  ; 28 | Pull processor status from stack
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_00E
; Address: $DC8413
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_00E:
    JSR $2052            ; 20 52 20 | Jump to subroutine
    BVC $21              ; 50 21 | PPU graphics register access
    JMP $5F2C            ; 4C 2C 5F | Jump to address
    ROL $66              ; 26 66 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    WDM #$01             ; 42 01 | Reserved instruction
    WDM #$16             ; 42 16 | Reserved instruction
    ROL $1D              ; 26 1D | Rotate left (zero page)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    BMI $08              ; 30 08 | Branch if negative
    AND ($0B),Y          ; 31 0B | Logical AND with accumulator ((zero page),Y)
    BMI $07              ; 30 07 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_00F
; Address: $DC8440
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_00F:
    JSR $CC00            ; 20 00 CC | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_010
; Address: $DC8449
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_010:
    JSR $207C            ; 20 7C 20 | Jump to subroutine
    ROL $0E84,X          ; 3E 84 0E | Rotate left (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_012
; Address: $DC845A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_012:
    JSR $84E0            ; 20 E0 84 | Jump to subroutine
    BRA $78              ; 80 78 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BCS $04              ; B0 04 | Branch if carry set
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    AND $FB32,X          ; 3D 32 FB | Logical AND with accumulator (absolute,X)
    SEP #$19             ; E2 19 | Set processor status bits
    CPX $24              ; E4 24 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $F8              ; 30 F8 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_013
; Address: $DC847C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_013:
    BEQ $C4              ; F0 C4 | Branch if equal
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    EOR #$74             ; 49 74 | Exclusive OR with accumulator (immediate)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $C8              ; 84 C8 | Store Y register to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BVS $92              ; 70 92 | Branch if overflow set
    BRA $F0              ; 80 F0 | Branch always
    SED                  ; F8 | Set decimal mode flag
    STY $78              ; 84 78 | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $70              ; 80 70 | Branch always
    BPL $2B              ; 10 2B | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_014
; Address: $DC84A5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_014:
    JSR $505F            ; 20 5F 50 | Jump to subroutine
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    LDX #$BC             ; A2 BC | Load immediate value into X register
    LDA #$B0             ; A9 B0 | Read graphics status
    STA ($00,X)          ; 81 00 | Update graphics data
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_015
; Address: $DC84B4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_015:
    JSR $5010            ; 20 10 50 | Jump to subroutine
    AND ($41),Y          ; 31 41 | Logical AND with accumulator ((zero page),Y)
    LDX #$6B             ; A2 6B | Load immediate value into X register
    LDA #$7E             ; A9 7E | Read graphics status
    STA ($5E,X)          ; 81 5E | Update graphics data
    BRA $82              ; 80 82 | Branch always
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_016
; Address: $DC84C5
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_016:
    LDA $86A0            ; AD A0 86 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    PHB                  ; 8B | Push data bank register to stack
    LDX $3B87,Y          ; BE 87 3B | Load from absolute,Y into X register
    LDA $58              ; A5 58 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $A2              ; 50 A2 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR $5C9C,Y          ; 59 9C 5C | Exclusive OR with accumulator (absolute,Y)
    LSR $CE              ; 46 CE | Logical shift right (zero page)
    BVS $82              ; 70 82 | Branch if overflow set
    STX $6E              ; 86 6E | Store X register to zero page
    BIT $587F            ; 2C 7F 58 | Test bits in accumulator (absolute)
    AND ($13,X)          ; 21 13 | Logical AND with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ORA $0E1E,Y          ; 19 1E 0E | Logical OR with accumulator (absolute,Y)
    BVC $10              ; 50 10 | Branch if overflow clear
    ADC ($17,X)          ; 61 17 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_017
; Address: $DC84F5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_017:
    JSR $005F            ; 20 5F 00 | Jump to subroutine
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BRA $FA              ; 80 FA | Branch always
    BPL $7E              ; 10 7E | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_018
; Address: $DC850B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_018:
    JSR $803C            ; 20 3C 80 | Jump to subroutine
    ASL $00F4            ; 0E F4 00 | Arithmetic shift left (absolute)
    BRA $88              ; 80 88 | Branch always
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_019
; Address: $DC851A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_019:
    JSR $80E0            ; 20 E0 80 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    STY $7C              ; 84 7C | Store Y register to zero page
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    ROL $F930,X          ; 3E 30 F9 | Rotate left (absolute,X)
    CPX #$33             ; E0 33 | Compare X register (immediate)
    DEC $24              ; C6 24 | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BMI $F8              ; 30 F8 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_01B
; Address: $DC8541
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_01B:
    SEP #$53             ; E2 53 | Set processor status bits
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    STX $C439            ; 8E 39 C4 | Store X register to absolute address
    INC $70F8,X          ; FE F8 70 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    STY $08              ; 84 08 | Store Y register to zero page
    BRA $E4              ; 80 E4 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    BVS $80              ; 70 80 | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $3F10,X          ; 1E 10 3F | Arithmetic shift left (absolute,X)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    AND #$67             ; 29 67 | Logical AND with accumulator (immediate)
    ADC ($71,X)          ; 61 71 | Add with carry ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_01C
; Address: $DC856F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_01C:
    ADC $0000,Y          ; 79 00 00 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    AND #$0B             ; 29 0B | Logical AND with accumulator (immediate)
    ADC ($3F,X)          ; 61 3F | Add with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    EOR $4B4D,X          ; 5D 4D 4B | Exclusive OR with accumulator (absolute,X)
    BVC $4B              ; 50 4B | Branch if overflow clear
    BVC $4D              ; 50 4D | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $64              ; 64 64 | Store zero to zero page
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    AND #$50             ; 29 50 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_01F
; Address: $DC859B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_01F:
    JSR $134C            ; 20 4C 13 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $1C07,Y          ; 19 07 1C | Logical OR with accumulator (absolute,Y)
    ASL $010D,X          ; 1E 0D 01 | Arithmetic shift left (absolute,X)
    EOR $0124,Y          ; 59 24 01 | Exclusive OR with accumulator (absolute,Y)
    BMI $01              ; 30 01 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_020
; Address: $DC85C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_020:
    JMP ($FC00)          ; 6C 00 FC | Jump to address (absolute indirect)
    PLX                  ; FA | Pull X register from stack
    BRA $FC              ; 80 FC | Branch always
    BCC $FC              ; 90 FC | Branch if carry clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_023
; Address: $DC85DA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_023:
    JSR $20B0            ; 20 B0 20 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $1C              ; F0 1C | Branch if equal
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    BVS $30              ; 70 30 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_025
; Address: $DC85EB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_025:
    STZ $EA              ; 64 EA | Store zero to zero page
    JMP ($BCFA)          ; 6C FA BC | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    BRA $30              ; 80 30 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_026
; Address: $DC85FA
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_026:
    PLX                  ; FA | Pull X register from stack
    PEA #$7460           ; F4 60 74 | Push effective address to stack
    BMI $F6              ; 30 F6 | Branch if negative
    BCS $D4              ; B0 D4 | Branch if carry set
    BCS $F8              ; B0 F8 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    LDY $6C8E,X          ; BC 8E 6C | Load from absolute,X into Y register
    AND ($F8),Y          ; 31 F8 | Logical AND with accumulator ((zero page),Y)
    BEQ $3C              ; F0 3C | Branch if equal
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    JMP $01F60E          ; 5C 0E F6 01 | Jump to address long
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $11              ; F0 11 | Branch if equal
    BPL $2F              ; 10 2F | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    LSR $5F54,X          ; 5E 54 5F | Logical shift right (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF A1 A7 A1 | Read graphics status
    LDA ($AA),Y          ; B1 AA | Read graphics status
    LDY #$B9             ; A0 B9 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_027
; Address: $DC8632
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_027:
    PLP                  ; 28 | Pull processor status from stack
    BPL $54              ; 10 54 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BIT $6BA1            ; 2C A1 6B | Test bits in accumulator (absolute)
    LDA ($7F,X)          ; A1 7F | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    LDA $ABAD,X          ; BD AD AB | Read graphics status
    BCS $AB              ; B0 AB | Branch if carry set
    BCS $AD              ; B0 AD | Branch if carry set
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    EOR #$B0             ; 49 B0 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $40              ; A4 40 | Load from zero page into Y register
    LDY #$42             ; A0 42 | Hardware register operation
    CPX #$40             ; E0 40 | Compare X register (immediate)
    STA                  ; 9F 21 9F 66 | Update graphics data
    LDX $8855            ; AE 55 88 | Load from absolute address into X register
    WDM #$21             ; 42 21 | PPU graphics register access
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $090E            ; 0D 0E 09 | Logical OR with accumulator (absolute)
    ORA $1402,X          ; 1D 02 14 | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $1071            ; 0E 71 10 | Arithmetic shift left (absolute)
    BIT $1C              ; 24 1C | Test bits in accumulator (zero page)
    ASL $0800            ; 0E 00 08 | Arithmetic shift left (absolute)
    BCC $00              ; 90 00 | Branch if carry clear
    ROR $00              ; 66 00 | Rotate right (zero page)
    SBC $FEC0,Y          ; F9 C0 FE | Subtract with carry (absolute,Y)
    BPL $F8              ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_029
; Address: $DC8695
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_029:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $B0              ; 10 B0 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_02A
; Address: $DC869C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_02A:
    JSR $28E0            ; 20 E0 28 | Jump to subroutine
    INX                  ; E8 | Increment X register
    CPX #$68             ; E0 68 | Compare X register (immediate)
    BVS $30              ; 70 30 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_02B
; Address: $DC86AA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_02B:
    JSR $2820            ; 20 20 28 | Jump to subroutine
    DEC                  ; 3A | Decrement accumulator
    CPX $F000            ; EC 00 F0 | Compare X register (absolute)
    BRA $30              ; 80 30 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_02C
; Address: $DC86B8
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_02C:
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $0A              ; 30 0A | Branch if negative
    LDY $B6              ; A4 B6 | Load from zero page into Y register
    LDY #$BC             ; A0 BC | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    BIT $D6C8            ; 2C C8 D6 | Test bits in accumulator (absolute)
    INC $C0C2,X          ; FE C2 C0 | Increment (absolute,X)
    BRA $4C              ; 80 4C | Branch always
    PHP                  ; 08 | Push processor status to stack
    JMP $4A08            ; 4C 08 4A | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $020C            ; 2C 0C 02 | Test bits in accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0E04,Y          ; 19 04 0E | Logical OR with accumulator (absolute,Y)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    BVS $1E              ; 70 1E | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PHY                  ; 5A | Push Y register to stack
    INC                  ; 1A | Increment accumulator
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $02              ; 10 02 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $2F1F,X          ; 1D 1F 2F | Logical OR with accumulator (absolute,X)
    LDA $D60C            ; AD 0C D6 | Read graphics status
    LDA ($68),Y          ; B1 68 | Read graphics status
    BIT $35              ; 24 35 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BIT $212D            ; 2C 2D 21 | PPU graphics register access
    ASL $5E1C,X          ; 1E 1C 5E | Arithmetic shift left (absolute,X)
    ASL $452C            ; 0E 2C 45 | Arithmetic shift left (absolute)
    ORA $62              ; 05 62 | Logical OR with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    BIT $0A              ; 24 0A | Test bits in accumulator (zero page)
    AND ($0D,X)          ; 21 0D | Logical AND with accumulator ((zero page,X))
    ORA ($1D),Y          ; 11 1D | Logical OR with accumulator ((zero page),Y)
    CPX $04              ; E4 04 | Compare X register (zero page)
    INC $FA0E,X          ; FE 0E FA | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    WDM #$FA             ; 42 FA | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_02D
; Address: $DC874E
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_02D:
    PLX                  ; FA | Pull X register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $8204            ; 0E 04 82 | Arithmetic shift left (absolute)
    CPY $42              ; C4 42 | Hardware register operation
    CPX $0A              ; E4 0A | Compare X register (zero page)
    PEA #$FC22           ; F4 22 FC | Push effective address to stack
    SEP #$1A             ; E2 1A | Set processor status bits
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $5E9A,X          ; FE 9A 5E | Increment (absolute,X)
    ROL $3A8A            ; 2E 8A 3A | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$E48A           ; F4 8A E4 | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    STY $8E              ; 84 8E | Store Y register to zero page
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    BVS $7C              ; 70 7C | Branch if overflow set
    NOP                  ; EA | No operation
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    BIT $72F6            ; 2C F6 72 | Test bits in accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    STZ $F8DC            ; 9C DC F8 | Store zero to absolute
    INX                  ; E8 | Increment X register
    ROR                  ; 6A | Rotate right (accumulator)
    STY $D8              ; 84 D8 | Store Y register to zero page
    CLV                  ; B8 | Clear overflow flag
    PLY                  ; 7A | Pull Y register from stack
    SEI                  ; 78 | Set interrupt disable flag
    DEC $EEFC,X          ; DE FC EE | Decrement (absolute,X)
    STZ $689C            ; 9C 9C 68 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    ASL $2F04            ; 0E 04 2F | Arithmetic shift left (absolute)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_02E
; Address: $DC87C2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_02E:
    BMI $1E              ; 30 1E | Branch if negative
    SEC                  ; 38 | Set carry flag
    ROL $470E            ; 2E 0E 47 | Rotate left (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BPL $02              ; 10 02 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $0E3E,X          ; 1D 3E 0E | Logical OR with accumulator (absolute,X)
    EOR ($48,X)          ; 41 48 | Exclusive OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BIT $232F            ; 2C 2F 23 | Test bits in accumulator (absolute)
    AND #$2B             ; 29 2B | Logical AND with accumulator (immediate)
    BIT $7505            ; 2C 05 75 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_02F
; Address: $DC87F3
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_02F:
    JSL $24257A          ; 22 7A 25 24 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($0D,X)          ; 21 0D | Logical AND with accumulator ((zero page,X))
    ORA ($39),Y          ; 11 39 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    PEA #$FA04           ; F4 04 FA | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    WDM #$FD             ; 42 FD | Reserved instruction
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA $0000,Y          ; 99 00 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    CPX $42              ; E4 42 | Hardware register operation
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    STA ($FA),Y          ; 91 FA | Update graphics data
    SBC $99              ; E5 99 | Subtract with carry (zero page)
    ORA $1D79            ; 0D 79 1D | Logical OR with accumulator (absolute)
    STA $F5              ; 85 F5 | Update graphics data
    LDA $783189          ; AF 89 31 78 | Read graphics status
    STA ($FA,X)          ; 81 FA | Update graphics data
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    STA $E2              ; 85 E2 | Update graphics data
    WDM #$8F             ; 42 8F | Reserved instruction
    LDX #$07             ; A2 07 | Load immediate value into X register
    BVS $69              ; 70 69 | Branch if overflow set
    STX $E9              ; 86 E9 | Store X register to zero page
    SBC #$2A             ; E9 2A | Subtract with carry (immediate)
    INC $546C            ; EE 6C 54 | Increment (absolute)
    LDY $8CAC            ; AC AC 8C | Load from absolute address into Y register
    STY $E4E4            ; 8C E4 E4 | Store Y register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    LDY $7C32,X          ; BC 32 7C | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_030
; Address: $DC8855
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_030:
    BVS $DC              ; 70 DC | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    CPX $FCF8            ; EC F8 FC | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    STZ $B868            ; 9C 68 B8 | Store zero to absolute
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    INC $0005,X          ; FE 05 00 | Increment (absolute,X)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ADC ($1F),Y          ; 71 1F | Add with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ASL $0C01,X          ; 1E 01 0C | Arithmetic shift left (absolute,X)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    WDM #$22             ; 42 22 | Reserved instruction
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $0808            ; 0E 08 08 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ROL $3C31,X          ; 3E 31 3C | Rotate left (absolute,X)
    BPL $06              ; 10 06 | Branch if positive
    ORA $2F05            ; 0D 05 2F | Logical OR with accumulator (absolute)
    ASL $1C7F            ; 0E 7F 1C | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BPL $2F              ; 10 2F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$FA24           ; F4 24 FA | Push effective address to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    CMP $0000            ; CD 00 00 | Compare accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_031
; Address: $DC88D8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_031:
    BIT $B8              ; 24 B8 | Test bits in accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$E21D           ; F4 1D E2 | Push effective address to stack
    EOR $DD              ; 45 DD | Exclusive OR with accumulator (zero page)
    ADC $856D            ; 6D 6D 85 | Add with carry (absolute)
    AND $0DD5            ; 2D D5 0D | Logical AND with accumulator (absolute)
    SBC $63              ; E5 63 | Subtract with carry (zero page)
    ORA $8DE2,X          ; 1D E2 8D | Logical OR with accumulator (absolute,X)
    AND $0502            ; 2D 02 05 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_032
; Address: $DC88F8
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_032:
    ORA $42              ; 05 42 | Hardware register operation
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    STZ $F0              ; 64 F0 | Store zero to zero page
    JMP $F8B0            ; 4C B0 F8 | Jump to address
    BVS $36              ; 70 36 | Branch if overflow set
    PLX                  ; FA | Pull X register from stack
    PEA #$5800           ; F4 00 58 | Push effective address to stack
    BCS $F0              ; B0 F0 | Branch if carry set
    BRA $40              ; 80 40 | Branch always
    CMP ($0E,X)          ; C1 0E | Compare accumulator ((zero page,X))
    STA $7A              ; 85 7A | Update graphics data
    ORA #$B6             ; 09 B6 | Logical OR with accumulator (immediate)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ROR $0005,X          ; 7E 05 00 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    AND $0F04,X          ; 3D 04 0F | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($1F),Y          ; F1 1F | Subtract with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ASL $0C01,X          ; 1E 01 0C | Arithmetic shift left (absolute,X)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $2647            ; 0E 47 26 | Arithmetic shift left (absolute)
    AND $0828            ; 2D 28 08 | Logical AND with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    AND ($2E),Y          ; 31 2E | Logical AND with accumulator ((zero page),Y)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    BIT $183F            ; 2C 3F 18 | Test bits in accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BEQ $10              ; F0 10 | Branch if equal
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    PEA #$F414           ; F4 14 F4 | Push effective address to stack
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    PHY                  ; 5A | Push Y register to stack
    DEX                  ; CA | Decrement X register
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_033
; Address: $DC8997
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_033:
    BVC $14              ; 50 14 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$E41A           ; F4 1A E4 | Push effective address to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    PHX                  ; DA | Push X register to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $6AEE,X          ; 1E EE 6A | Arithmetic shift left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    CPX $8A              ; E4 8A | Compare X register (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $E604            ; 0E 04 E6 | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    JMP ($90E0)          ; 6C E0 90 | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_034
; Address: $DC89C4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_034:
    PEA #$7868           ; F4 68 78 | Push effective address to stack
    BCC $38              ; 90 38 | Branch if carry clear
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    TXA                  ; 8A | Transfer X register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_035
; Address: $DC89DC
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_035:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    JMP $5C5952          ; 5C 52 59 5C | Jump to address long
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    BVC $2F              ; 50 2F | Branch if overflow clear
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($50),Y          ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
    BVC $55              ; 50 55 | Branch if overflow clear
    PHY                  ; 5A | Push Y register to stack
    EOR $5650,X          ; 5D 50 56 | Exclusive OR with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $6E4C            ; 4C 4C 6E | Jump to address
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($38),Y          ; 51 38 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BMI $50              ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_036
; Address: $DC8A17
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_036:
    JSR $2158            ; 20 58 21 | PPU graphics register access
    JMP $265F2C          ; 5C 2C 5F 26 | Jump to address long
    ROR $5733            ; 6E 33 57 | Rotate right (absolute)
    WDM #$01             ; 42 01 | Reserved instruction
    WDM #$16             ; 42 16 | Reserved instruction
    WDM #$36             ; 42 36 | Reserved instruction
    ROL $131D            ; 2E 1D 13 | Rotate left (absolute)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    BMI $08              ; 30 08 | Branch if negative
    AND ($0A),Y          ; 31 0A | Logical AND with accumulator ((zero page),Y)
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_037
; Address: $DC8A4B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_037:
    JSR $603C            ; 20 3C 60 | Jump to subroutine
    STZ $0030,X          ; 9E 30 00 | Store zero to absolute,X
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $20              ; 30 20 | Branch if negative
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $7C              ; 80 7C | Branch always
    ASL $A498            ; 0E 98 A4 | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_038
; Address: $DC8A6A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_038:
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BMI $38              ; 30 38 | Branch if negative
    BEQ $EC              ; F0 EC | Branch if equal
    BRA $7C              ; 80 7C | Branch always
    CLC                  ; 18 | Clear carry flag
    BVC $08              ; 50 08 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BRA $38              ; 80 38 | Branch always
    BMI $FC              ; 30 FC | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_039
; Address: $DC8A7E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_039:
    PLX                  ; FA | Pull X register from stack
    CPY $12              ; C4 12 | Compare Y register (zero page)
    INC $FA0E            ; EE 0E FA | Increment (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    JMP $E434            ; 4C 34 E4 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    BEQ $10              ; F0 10 | Branch if equal
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    CPX #$39             ; E0 39 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_03A
; Address: $DC8A91
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_03A:
    ASL $99              ; 06 99 | Arithmetic shift left (zero page)
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    BRA $FC              ; 80 FC | Branch always
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_03C
; Address: $DC8AB8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_03C:
    JSR $4103            ; 20 03 41 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDA ($6E,X)          ; A1 6E | Read graphics status
    LDA ($A0),Y          ; B1 A0 | Read graphics status
    LDY $A6              ; A4 A6 | Load from zero page into Y register
    BCS $B5              ; B0 B5 | Branch if carry set
    TAX                  ; AA | Transfer accumulator to X register
    LDA $A6A0            ; AD A0 A6 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    LDX $AE              ; A6 AE | Load from zero page into X register
    LDA ($6E,X)          ; A1 6E | Read graphics status
    LDA ($58,X)          ; A1 58 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($BC,X)          ; 41 BC | Exclusive OR with accumulator ((zero page,X))
    JMP $56EF            ; 4C EF 56 | Jump to address
    DEC $8723,X          ; DE 23 87 | Decrement (absolute,X)
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ROR $2C46            ; 6E 46 2C | Rotate right (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_03D
; Address: $DC8AF3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_03D:
    RTI                  ; 40 | Return from interrupt
    BPL $61              ; 10 61 | Branch if positive
    AND ($5F,X)          ; 21 5F | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    BPL $3E              ; 10 3E | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_03E
; Address: $DC8B0E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_03E:
    STZ $0030            ; 9C 30 00 | Store zero to absolute
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_03F
; Address: $DC8B1C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_03F:
    JSR $80F8            ; 20 F8 80 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    ASL $A698            ; 0E 98 A6 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_040
; Address: $DC8B23
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_040:
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_041
; Address: $DC8B2A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_041:
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BEQ $E8              ; F0 E8 | Branch if equal
    BRA $7C              ; 80 7C | Branch always
    CLC                  ; 18 | Clear carry flag
    BVC $08              ; 50 08 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BRA $38              ; 80 38 | Branch always
    BMI $FC              ; 30 FC | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_042
; Address: $DC8B3E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_042:
    INC $28C0,X          ; FE C0 28 | Increment (absolute,X)
    CPX $6C5E            ; EC 5E 6C | Compare X register (absolute)
    BVS $68              ; 70 68 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_043
; Address: $DC8B4B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_043:
    JSR $0070            ; 20 70 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    STY $8070            ; 8C 70 80 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    AND #$21             ; 29 21 | PPU graphics register access
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $0B29            ; 0D 29 0B | Logical OR with accumulator (absolute)
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($4B,X)          ; 41 4B | Exclusive OR with accumulator ((zero page,X))
    BVC $4D              ; 50 4D | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $64              ; 64 64 | Store zero to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    EOR $0758,Y          ; 59 58 07 | Exclusive OR with accumulator (absolute,Y)
    EOR ($28),Y          ; 51 28 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_046
; Address: $DC8B9D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_046:
    JSL $0A156E          ; 22 6E 15 0A | Jump to subroutine long
    ORA $030F,Y          ; 19 0F 03 | Logical OR with accumulator (absolute,Y)
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    JMP $5835            ; 4C 35 58 | Jump to address
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_047
; Address: $DC8BB7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_047:
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF80,X          ; FE 80 FF | Increment (absolute,X)
    BCC $FE              ; 90 FE | Branch if carry clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_048
; Address: $DC8BCD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_048:
    JSR $A07F            ; 20 7F A0 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BNE $90              ; D0 90 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_049
; Address: $DC8BDC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_049:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$8E             ; E0 8E | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    JMP ($3C58)          ; 6C 58 3C | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $70              ; 80 70 | Branch always
    BVC $A2              ; 50 A2 | Branch if overflow clear
    LDY $00              ; A4 00 | Load from zero page into Y register
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $18              ; 80 18 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_04A
; Address: $DC8BFA
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_04A:
    BRA $80              ; 80 80 | Branch always
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    DEC                  ; 3A | Decrement accumulator
    LDY $B074,X          ; BC 74 B0 | Load from absolute,X into Y register
    BCC $10              ; 90 10 | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    BIT $9CCC            ; 2C CC 9C | Test bits in accumulator (absolute)
    JMP ($6008)          ; 6C 08 60 | Jump to address (absolute indirect)
    BCS $A0              ; B0 A0 | Branch if carry set
    BCS $3E              ; B0 3E | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $BC78,X          ; 1E 78 BC | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPX $1000            ; EC 00 10 | Compare X register (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $2F              ; 10 2F | Branch if positive
    BIT $5F              ; 24 5F | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    EOR ($A1,X)          ; 41 A1 | Exclusive OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_04B
; Address: $DC8C36
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_04B:
    BIT $16              ; 24 16 | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    AND $2B41            ; 2D 41 2B | Logical AND with accumulator (absolute)
    LDA ($7F,X)          ; A1 7F | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX #$9B             ; A2 9B | Load immediate value into X register
    LDA ($AB,X)          ; A1 AB | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    BCS $AD              ; B0 AD | Branch if carry set
    INY                  ; C8 | Increment Y register
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ORA #$29             ; 09 29 | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA ($48),Y          ; B1 48 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$42             ; A0 42 | Hardware register operation
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BIT $9E              ; 24 9E | Test bits in accumulator (zero page)
    ASL $0F1D            ; 0E 1D 0F | Arithmetic shift left (absolute)
    EOR #$28             ; 49 28 | Exclusive OR with accumulator (immediate)
    BIT $160B            ; 2C 0B 16 | Test bits in accumulator (absolute)
    ORA $040B,Y          ; 19 0B 04 | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY $8E51            ; AC 51 8E | Load from absolute address into Y register
    BVS $18              ; 70 18 | Branch if overflow set
    ROL $1F              ; 26 1F | Rotate left (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FFC0,X          ; FE C0 FF | Increment (absolute,X)
    BPL $7E              ; 10 7E | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BPL $BC              ; 10 BC | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_04C
; Address: $DC8C9E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_04C:
    JSR $1FF0            ; 20 F0 1F | Jump to subroutine
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROR $3C58            ; 6E 58 3C | Rotate right (absolute)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BRA $70              ; 80 70 | Branch always
    BVC $50              ; 50 50 | Branch if overflow clear
    BIT $A0              ; 24 A0 | Test bits in accumulator (zero page)
    INX                  ; E8 | Increment X register
    BRA $18              ; 80 18 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_04E
; Address: $DC8CBC
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_04E:
    BEQ $60              ; F0 60 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BCS $12              ; B0 12 | Branch if carry set
    PEA #$D8D0           ; F4 D0 D8 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    JMP ($748C)          ; 6C 8C 74 | Jump to address (absolute indirect)
    BRA $38              ; 80 38 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    ASL $3ED8,X          ; 1E D8 3E | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    EOR ($46,X)          ; 41 46 | Exclusive OR with accumulator ((zero page,X))
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    BPL $17              ; 10 17 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_04F
; Address: $DC8D02
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_04F:
    CPY $27              ; C4 27 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA $9324,X          ; 1D 24 93 | Logical OR with accumulator (absolute,X)
    LDY $BEC3,X          ; BC C3 BE | Load from absolute,X into Y register
    STA ($E0,X)          ; 81 E0 | Game work RAM access
    BVS $77              ; 70 77 | Branch if overflow set
    LDY $D71F,X          ; BC 1F D7 | Load from absolute,X into Y register
    LDY #$D7             ; A0 D7 | Load immediate value into Y register
    LDY $D1              ; A4 D1 | Load from zero page into Y register
    LSR $8FA0            ; 4E A0 8F | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_050
; Address: $DC8D27
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_050:
    JSR $0253            ; 20 53 02 | Jump to subroutine
    ADC ($1F),Y          ; 71 1F | Add with carry ((zero page),Y)
    BIT $3213            ; 2C 13 32 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    BNE $11              ; D0 11 | Branch if not equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_051
; Address: $DC8D34
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_051:
    JSR $60B1            ; 20 B1 60 | Jump to subroutine
    BMI $02              ; 30 02 | Branch if negative
    ROR $3F1F            ; 6E 1F 3F | Rotate right (absolute)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA $A9              ; 05 A9 | Logical OR with accumulator (zero page)
    ORA ($A3),Y          ; 11 A3 | Logical OR with accumulator ((zero page),Y)
    ORA #$F3             ; 09 F3 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_052
; Address: $DC8D4D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_052:
    ORA #$EF             ; 09 EF | Logical OR with accumulator (immediate)
    BRA $02              ; 80 02 | Branch always
    BRA $C5              ; 80 C5 | Branch always
    LDX #$F1             ; A2 F1 | Load immediate value into X register
    LDX $F9              ; A6 F9 | Load from zero page into X register
    STZ $FEF9,X          ; 9E F9 FE | Store zero to absolute,X
    PLX                  ; FA | Pull X register from stack
    ORA $F5              ; 05 F5 | Logical OR with accumulator (zero page)
    ROL $E0              ; 26 E0 | Game work RAM access
    LSR $27A0,X          ; 5E A0 27 | Logical shift right (absolute,X)
    CMP ($27,X)          ; C1 27 | Compare accumulator ((zero page,X))
    CMP ($4F),Y          ; D1 4F | Compare accumulator ((zero page),Y)
    BCS $0F              ; B0 0F | Branch if carry set
    BEQ $F5              ; F0 F5 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    SBC #$F0             ; E9 F0 | Subtract with carry (immediate)
    ROL $E4FD,X          ; 3E FD E4 | Rotate left (absolute,X)
    SBC $F1F0,Y          ; F9 F0 F1 | Subtract with carry (absolute,Y)
    SBC ($F3),Y          ; F1 F3 | Subtract with carry ((zero page),Y)
    CPX #$23             ; E0 23 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_053
; Address: $DC8D86
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_053:
    BEQ $00              ; F0 00 | Branch if equal
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    STY $0ED8            ; 8C D8 0E | Store Y register to absolute address
    ASL $48              ; 06 48 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    EOR ($46,X)          ; 41 46 | Exclusive OR with accumulator ((zero page,X))
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    BPL $17              ; 10 17 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    STZ $07              ; 64 07 | Store zero to zero page
    BEQ $00              ; F0 00 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    ORA $F4              ; 05 F4 | Logical OR with accumulator (zero page)
    INC $F081,X          ; FE 81 F0 | Increment (absolute,X)
    STA $971F0F          ; 8F 0F 1F 97 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    STA $4F8F0F          ; 8F 0F 8F 4F | Update graphics data

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_054
; Address: $DC8DE0
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_054:
    CPX #$87             ; E0 87 | Compare X register (immediate)
    LDY $91              ; A4 91 | Load from zero page into Y register
    DEC $B0              ; C6 B0 | Decrement (zero page)
    RTI                  ; 40 | Return from interrupt
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$51             ; E0 51 | Compare X register (immediate)
    BMI $BB              ; 30 BB | Branch if negative
    ASL $001F,X          ; 1E 1F 00 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $05              ; 65 05 | Add with carry (zero page)
    STA $A90D,X          ; 9D 0D A9 | Update graphics data
    ORA ($A3),Y          ; 11 A3 | Logical OR with accumulator ((zero page),Y)
    ORA #$F3             ; 09 F3 | Logical OR with accumulator (immediate)
    ORA #$ED             ; 09 ED | Logical OR with accumulator (immediate)
    ORA $8002,X          ; 1D 02 80 | Logical OR with accumulator (absolute,X)
    ORA $82              ; 05 82 | Logical OR with accumulator (zero page)
    CMP $F1A2            ; CD A2 F1 | Compare accumulator (absolute)
    LDX $F9              ; A6 F9 | Load from zero page into X register
    STZ $FEF9,X          ; 9E F9 FE | Store zero to absolute,X
    SBC $07FA,X          ; FD FA 07 | Subtract with carry (absolute,X)
    SBC ($23),Y          ; F1 23 | Subtract with carry ((zero page),Y)
    CPX $0E              ; E4 0E | Compare X register (zero page)
    LDA $C927,Y          ; B9 27 C9 | Read graphics status
    BNE $4F              ; D0 4F | Branch if not equal
    BCS $07              ; B0 07 | Branch if carry set
    BEQ $F1              ; F0 F1 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $1FF6            ; EE F6 1F | Increment (absolute)
    INC $3C3D            ; EE 3D 3C | Increment (absolute)
    SBC $F1E8,Y          ; F9 E8 F1 | Subtract with carry (absolute,Y)
    SBC ($F3),Y          ; F1 F3 | Subtract with carry ((zero page),Y)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_055
; Address: $DC8E42
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_055:
    JSR $7088            ; 20 88 70 | Jump to subroutine
    BEQ $04              ; F0 04 | Branch if equal
    DEX                  ; CA | Decrement X register
    RTI                  ; 40 | Return from interrupt
    STX $34F8            ; 8E F8 34 | Store X register to absolute address
    INY                  ; C8 | Increment Y register
    JMP $1C00            ; 4C 00 1C | Jump to address
    PHP                  ; 08 | Push processor status to stack
    STY $06D8            ; 8C D8 06 | Store Y register to absolute address
    STY $0C06            ; 8C 06 0C | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_056
; Address: $DC8E66
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_056:
    ORA $1F0C            ; 0D 0C 1F | Logical OR with accumulator (absolute)
    ORA $1D2F            ; 0D 2F 1D | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA $1D07            ; 0D 07 1D | Logical OR with accumulator (absolute)
    EOR $1D              ; 45 1D | Exclusive OR with accumulator (zero page)
    ORA $0525,X          ; 1D 25 05 | Logical OR with accumulator (absolute,X)
    ORA $2D05,X          ; 1D 05 2D | Logical OR with accumulator (absolute,X)
    AND $7F05,X          ; 3D 05 7F | Logical AND with accumulator (absolute,X)
    ORA $1D3A,X          ; 1D 3A 1D | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    AND $7D1A,X          ; 3D 1A 7D | Logical AND with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    ASL $0301,X          ; 1E 01 03 | Arithmetic shift left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SEI                  ; 78 | Set interrupt disable flag
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BVS $60              ; 70 60 | Branch if overflow set
    BMI $20              ; 30 20 | Branch if negative
    LDY $A0              ; A4 A0 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$30             ; E0 30 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BCC $38              ; 90 38 | Branch if carry clear
    BNE $A0              ; D0 A0 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BVS $40              ; 70 40 | Branch if overflow set
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $1C              ; F0 1C | Branch if equal
    CPX #$62             ; E0 62 | Compare X register (immediate)
    STY $0EFD            ; 8C FD 0E | Store Y register to absolute address
    STX $35              ; 86 35 | Store X register to zero page
    DEC $58              ; C6 58 | Decrement (zero page)
    BCC $C0              ; 90 C0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_058
; Address: $DC8EFB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_058:
    ROR $E6E8            ; 6E E8 E6 | Rotate right (absolute)
    INX                  ; E8 | Increment X register
    INC $A5              ; E6 A5 | Increment (zero page)
    ASL $95              ; 06 95 | Arithmetic shift left (zero page)
    LSR $29              ; 46 29 | Logical shift right (zero page)
    CPY $AE              ; C4 AE | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_05A
; Address: $DC8F0F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_05A:
    JSR $0658            ; 20 58 06 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    SEP #$FC             ; E2 FC | Set processor status bits

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_05B
; Address: $DC8F16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_05B:
    JSR $0078            ; 20 78 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_05C
; Address: $DC8F1F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_05C:
    CPX #$03             ; E0 03 | Compare X register (immediate)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    ASL $27              ; 06 27 | Arithmetic shift left (zero page)
    LSR $3A              ; 46 3A | Logical shift right (zero page)
    ASL $1D              ; 06 1D | Arithmetic shift left (zero page)
    ORA $1B0F,Y          ; 19 0F 1B | Logical OR with accumulator (absolute,Y)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ROL $4E3D,X          ; 3E 3D 4E | Rotate left (absolute,X)
    ASL $0222,X          ; 1E 22 02 | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ASL $1E3D,X          ; 1E 3D 1E | Arithmetic shift left (absolute,X)
    AND $1D02,X          ; 3D 02 1D | Logical AND with accumulator (absolute,X)
    ASL $3E0D            ; 0E 0D 3E | Arithmetic shift left (absolute)
    ORA $1032,X          ; 1D 32 10 | Logical OR with accumulator (absolute,X)
    BPL $41              ; 10 41 | Branch if positive
    JMP ($1843)          ; 6C 43 18 | Jump to address (absolute indirect)
    BPL $51              ; 10 51 | Branch if positive
    ASL $013A            ; 0E 3A 01 | Arithmetic shift left (absolute)
    BVC $30              ; 50 30 | Branch if overflow clear
    JMP ($187E)          ; 6C 7E 18 | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    BPL $10              ; 10 10 | Branch if positive
    ROL $0B1F,X          ; 3E 1F 0B | Rotate left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCS $B0              ; B0 B0 | Branch if carry set
    BCC $90              ; 90 90 | Branch if carry clear
    BNE $D0              ; D0 D0 | Branch if not equal
    BNE $94              ; D0 94 | Branch if not equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_05D
; Address: $DC8F8D
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_05D:
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $80              ; B0 80 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCS $40              ; B0 40 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    BEQ $C0              ; F0 C0 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $88              ; F0 88 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BCC $F4              ; 90 F4 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    BPL $80              ; 10 80 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $10              ; 80 10 | Branch always
    CPX #$68             ; E0 68 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_05E
; Address: $DC8FBD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_05E:
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$A8             ; A0 A8 | Load immediate value into Y register
    CPX $08              ; E4 08 | Compare X register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BIT $A840            ; 2C 40 A8 | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    BMI $90              ; 30 90 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_061
; Address: $DC8FD9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_061:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    LDA $E5AA            ; AD AA E5 | Read graphics status
    ROR $F4              ; 66 F4 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_062
; Address: $DC8FEE
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_062:
    INC $64              ; E6 64 | Increment (zero page)
    ORA ($42,X)          ; 01 42 | Hardware register operation
    ORA ($B2,X)          ; 01 B2 | Logical OR with accumulator ((zero page,X))
    LDA $FB6757          ; AF 57 67 FB | Read graphics status
    PLX                  ; FA | Pull X register from stack
    ROR $FB              ; 66 FB | Rotate right (zero page)
    PLB                  ; AB | Pull data bank register from stack
    LDY $9F98            ; AC 98 9F | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    STX $B8              ; 86 B8 | Store X register to zero page
    LDA $80              ; A5 80 | Read graphics status
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ORA $51A9            ; 0D A9 51 | Logical OR with accumulator (absolute)
    BCS $40              ; B0 40 | Branch if carry set
    BRA $41              ; 80 41 | Branch always
    LDY $BE78,X          ; BC 78 BE | Load from absolute,X into Y register
    STZ $9B              ; 64 9B | Store zero to zero page
    INC $ED6E            ; EE 6E ED | Increment (absolute)
    SBC $0676            ; ED 76 06 | Subtract with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_063
; Address: $DC9023
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_063:
    ORA ($41),Y          ; 11 41 | Logical OR with accumulator ((zero page),Y)
    BMI $0D              ; 30 0D | Branch if negative
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    ADC ($95,X)          ; 61 95 | Add with carry ((zero page,X))
    ADC ($13,X)          ; 61 13 | Add with carry ((zero page,X))
    ASL $1E3D,X          ; 1E 3D 1E | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_064
; Address: $DC9042
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_064:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $AA              ; 10 AA | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCC $08              ; 90 08 | Branch if carry clear
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $40              ; 80 40 | Branch always
    CPY #$A2             ; C0 A2 | Compare Y register (immediate)
    BEQ $B6              ; F0 B6 | Branch if equal
    LDX $78              ; A6 78 | Load from zero page into X register
    STZ $7C98,X          ; 9E 98 7C | Store zero to absolute,X
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $C2              ; F0 C2 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    CPY #$AD             ; C0 AD | Compare Y register (immediate)
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))
    ORA ($47,X)          ; 01 47 | Logical OR with accumulator ((zero page,X))
    STA $0B98,X          ; 9D 98 0B | Update graphics data
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_065
; Address: $DC9077
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_065:
    ORA $2B78,X          ; 1D 78 2B | Logical OR with accumulator (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    ADC $6B              ; 65 6B | Add with carry (zero page)
    ORA $8B              ; 05 8B | Logical OR with accumulator (zero page)
    ORA $71              ; 05 71 | Logical OR with accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    STX $0488            ; 8E 88 04 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    JMP $1800            ; 4C 00 18 | Jump to address
    PHB                  ; 8B | Push data bank register to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $CD              ; A4 CD | Load from zero page into Y register
    ASL $8C              ; 06 8C | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCS $A8              ; B0 A8 | Branch if carry set
    TAX                  ; AA | Transfer accumulator to X register
    SBC $66              ; E5 66 | Subtract with carry (zero page)
    PEA #$E536           ; F4 36 E5 | Push effective address to stack
    STZ $AA              ; 64 AA | Store zero to zero page
    LDY $0140            ; AC 40 01 | Load from absolute address into Y register
    EOR ($AA,X)          ; 41 AA | Exclusive OR with accumulator ((zero page,X))
    ADC $FA              ; 65 FA | Add with carry (zero page)
    LDX $9357            ; AE 57 93 | Load from absolute address into X register
    STZ $9FA8            ; 9C A8 9F | Store zero to absolute
    CLV                  ; B8 | Clear overflow flag
    STX $B8              ; 86 B8 | Store X register to zero page
    SBC $C0              ; E5 C0 | Subtract with carry (zero page)
    ORA $49B9            ; 0D B9 49 | Logical OR with accumulator (absolute)
    BCC $50              ; 90 50 | Branch if carry clear
    LDY #$61             ; A0 61 | Load immediate value into Y register
    LDY $9E78,X          ; BC 78 9E | Load from absolute,X into Y register
    XBA                  ; EB | Exchange accumulator bytes
    INC $EDEE            ; EE EE ED | Increment (absolute)
    ADC $1666            ; 6D 66 16 | Add with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    AND ($09),Y          ; 31 09 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_066
; Address: $DC90E5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_066:
    JSR $200E            ; 20 0E 20 | Jump to subroutine
    LSR $7100,X          ; 5E 00 71 | Logical shift right (absolute,X)
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($35),Y          ; 11 35 | Logical OR with accumulator ((zero page),Y)
    ADC $33              ; 65 33 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_068
; Address: $DC90F7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_068:
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ADC $3F11            ; 6D 11 3F | Add with carry (absolute)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_069
; Address: $DC9102
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_069:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $AA              ; 10 AA | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCC $08              ; 90 08 | Branch if carry clear
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $40              ; 80 40 | Branch always
    CPY #$A2             ; C0 A2 | Compare Y register (immediate)
    BEQ $B6              ; F0 B6 | Branch if equal
    LDX $78              ; A6 78 | Load from zero page into X register
    STZ $7C98,X          ; 9E 98 7C | Store zero to absolute,X
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $C0              ; F0 C0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    CPY #$AD             ; C0 AD | Compare Y register (immediate)
    PHX                  ; DA | Push X register to stack
    PLX                  ; FA | Pull X register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    STZ $0998            ; 9C 98 09 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    AND $781C,X          ; 3D 1C 78 | Logical AND with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    BNE $F7              ; D0 F7 | Branch if not equal
    BVS $77              ; 70 77 | Branch if overflow set
    BCS $B7              ; B0 B7 | Branch if carry set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEY                  ; 88 | Decrement Y register
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BPL $87              ; 10 87 | Branch if positive
    LDY #$D7             ; A0 D7 | Load immediate value into Y register
    LDY #$D7             ; A0 D7 | Load immediate value into Y register
    BRA $CA              ; 80 CA | Branch always
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    BCS $BC              ; B0 BC | Branch if carry set
    LDA ($F8),Y          ; B1 F8 | Read graphics status
    CPX #$A2             ; E0 A2 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_06A
; Address: $DC916C
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_06A:
    SBC #$B0             ; E9 B0 | Subtract with carry (immediate)
    SBC ($E6,X)          ; E1 E6 | Subtract with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($07,X)          ; 41 07 | Exclusive OR with accumulator ((zero page,X))
    LSR $5DBF            ; 4E BF 5D | Logical shift right (absolute)
    PHX                  ; DA | Push X register to stack
    CMP $E7              ; C5 E7 | Compare accumulator (zero page)
    LDY $B8A3            ; AC A3 B8 | Load from absolute address into Y register
    LDX $AFB0            ; AE B0 AF | Load from absolute address into X register
    LDA #$A7             ; A9 A7 | Read graphics status
    LDX $FFA1,Y          ; BE A1 FF | Load from absolute,Y into X register
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    LDA $A049,Y          ; B9 49 A0 | Read graphics status
    EOR ($A0,X)          ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDA ($41,X)          ; A1 41 | Read graphics status
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPX $E6              ; E4 E6 | Compare X register (zero page)
    INC $E6              ; E6 E6 | Increment (zero page)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    RTI                  ; 40 | Return from interrupt
    ASL $1E06            ; 0E 06 1E | Arithmetic shift left (absolute)
    ASL $0C00,X          ; 1E 00 0C | Arithmetic shift left (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $D0              ; 10 D0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $C8              ; 80 C8 | Branch always
    STY $18              ; 84 18 | Store Y register to zero page
    SEP #$1C             ; E2 1C | Set processor status bits
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BNE $F8              ; D0 F8 | Branch if not equal
    BRA $F0              ; 80 F0 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BVS $7F              ; 70 7F | Branch if overflow set
    BEQ $6F              ; F0 6F | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_06B
; Address: $DC91EF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_06B:
    BVS $F8              ; 70 F8 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    JMP ($F000)          ; 6C 00 F0 | Jump to address (absolute indirect)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $EE              ; F0 EE | Branch if equal
    BEQ $6C              ; F0 6C | Branch if equal
    PEA #$F462           ; F4 62 F4 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_06C
; Address: $DC9208
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_06C:
    INC $FC00            ; EE 00 FC | Increment (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    BEQ $06              ; F0 06 | Branch if equal
    PEA #$F60C           ; F4 0C F6 | Push effective address to stack
    ROR $1C00            ; 6E 00 1C | Rotate right (absolute)
    BPL $E0              ; 10 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_06D
; Address: $DC9221
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_06D:
    JSR $5859            ; 20 59 58 | Jump to subroutine
    BVC $7C              ; 50 7C | Branch if overflow clear
    ADC ($78),Y          ; 71 78 | Add with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_06E
; Address: $DC922C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_06E:
    ADC #$70             ; 69 70 | Add with carry (immediate)
    ADC ($66,X)          ; 61 66 | Add with carry ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    EOR $5727,Y          ; 59 27 57 | Exclusive OR with accumulator (absolute,Y)
    ROL $7D7F            ; 2E 7F 7D | Rotate left (absolute)
    PHY                  ; 5A | Push Y register to stack
    EOR $67              ; 45 67 | Exclusive OR with accumulator (zero page)
    JMP $5843            ; 4C 43 58 | Jump to address
    LSR $4F50            ; 4E 50 4F | Logical shift right (absolute)
    EOR $7E56,Y          ; 59 56 7E | Exclusive OR with accumulator (absolute,Y)
    ROR $7A01,X          ; 7E 01 7A | Rotate right (absolute,X)
    ORA ($59,X)          ; 01 59 | Logical OR with accumulator ((zero page,X))
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_06F
; Address: $DC9255
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_06F:
    JSR $2050            ; 20 50 20 | Jump to subroutine
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    BVS $75              ; 70 75 | Branch if overflow set
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    ROL $2A01,X          ; 3E 01 2A | Rotate left (absolute,X)
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1E06            ; 0D 06 1E | Logical OR with accumulator (absolute)
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_070
; Address: $DC9284
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_070:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $D0              ; 10 D0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $C8              ; 80 C8 | Branch always
    STY $18              ; 84 18 | Store Y register to zero page
    SEP #$1C             ; E2 1C | Set processor status bits
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BNE $F8              ; D0 F8 | Branch if not equal
    BRA $F0              ; 80 F0 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    CPY $00              ; C4 00 | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    JMP $E0F8E0          ; 5C E0 F8 E0 | Game work RAM access
    CPX #$DC             ; E0 DC | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    BPL $D0              ; 10 D0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_071
; Address: $DC92C4
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_071:
    JSL $18C2D6          ; 22 D6 C2 18 | Jump to subroutine long
    CPX $F600            ; EC 00 F6 | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    TXA                  ; 8A | Transfer X register to accumulator
    BVS $5C              ; 70 5C | Branch if overflow set
    BRA $0C              ; 80 0C | Branch always
    CPX #$0A             ; E0 0A | Compare X register (immediate)
    CPX $DE16            ; EC 16 DE | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    ROL $1400,X          ; 3E 00 14 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BNE $F0              ; D0 F0 | Branch if not equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_072
; Address: $DC92E5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_072:
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_073
; Address: $DC9302
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_073:
    JSR $300F            ; 20 0F 30 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $98              ; A6 98 | Load from zero page into X register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $F7              ; F0 F7 | Branch if equal
    ASL $3EBF            ; 0E BF 3E | Arithmetic shift left (absolute)
    LDX #$81             ; A2 81 | Load immediate value into X register
    LDY #$C3             ; A0 C3 | Load immediate value into Y register
    ROL $CC              ; 26 CC | Rotate left (zero page)
    STX $0F91            ; 8E 91 0F | Store X register to absolute address
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    BPL $C1              ; 10 C1 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ADC $8C              ; 65 8C | Add with carry (zero page)
    LDY $18              ; A4 18 | Load from zero page into Y register
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA #$F3             ; 09 F3 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BRA $65              ; 80 65 | Branch always
    SEP #$D4             ; E2 D4 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF FA AF F9 | Read graphics status
    STZ $FEF9,X          ; 9E F9 FE | Store zero to absolute,X
    STA $0579            ; 8D 79 05 | Update graphics data
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    SEP #$1E             ; E2 1E | Set processor status bits
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    LDA ($19,X)          ; A1 19 | Read graphics status
    BMI $85              ; 30 85 | Branch if negative
    EOR $F981            ; 4D 81 F9 | Exclusive OR with accumulator (absolute)
    INC $F8F3,X          ; FE F3 F8 | Increment (absolute,X)
    ROR $FEB9,X          ; 7E B9 FE | Rotate right (absolute,X)
    SBC $FCCF,X          ; FD CF FC | Subtract with carry (absolute,X)
    ORA ($61),Y          ; 11 61 | Logical OR with accumulator ((zero page),Y)
    EOR ($06,X)          ; 41 06 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_074
; Address: $DC9384
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_074:
    SBC #$36             ; E9 36 | Subtract with carry (immediate)
    DEC $0870            ; CE 70 08 | Decrement (absolute)
    BMI $70              ; 30 70 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ADC $7AF2,X          ; 7D F2 7A | Add with carry (absolute,X)
    DEC $80              ; C6 80 | Decrement (zero page)
    STX $00              ; 86 00 | Store X register to zero page
    BEQ $30              ; F0 30 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_075
; Address: $DC93C2
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_075:
    JSR $300F            ; 20 0F 30 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    TXA                  ; 8A | Transfer X register to accumulator
    STY $E6              ; 84 E6 | Store Y register to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $F7              ; F0 F7 | Branch if equal
    LSR $3EBF            ; 4E BF 3E | Logical shift right (absolute)
    LDA                  ; BF 75 DF 82 | Read graphics status
    SBC ($F0,X)          ; E1 F0 | Subtract with carry ((zero page,X))
    LDY $4EF3            ; AC F3 4E | Load from absolute address into Y register
    BVC $0C              ; 50 0C | Branch if overflow clear
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA ($00,X)          ; A1 00 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $05              ; 65 05 | Add with carry (zero page)
    ADC $8C              ; 65 8C | Add with carry (zero page)
    LDY $18              ; A4 18 | Load from zero page into Y register
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA #$F3             ; 09 F3 | Logical OR with accumulator (immediate)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA $82              ; 05 82 | Logical OR with accumulator (zero page)
    ADC $E2              ; 65 E2 | Add with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF FA AF F9 | Read graphics status
    STZ $FEF9,X          ; 9E F9 FE | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_076
; Address: $DC9420
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_076:
    STA $0579            ; 8D 79 05 | Update graphics data
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    SEP #$1E             ; E2 1E | Set processor status bits
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    LDY #$19             ; A0 19 | Load immediate value into Y register
    AND ($85),Y          ; 31 85 | Logical AND with accumulator ((zero page),Y)
    EOR $F981            ; 4D 81 F9 | Exclusive OR with accumulator (absolute)
    INC $F8F3,X          ; FE F3 F8 | Increment (absolute,X)
    ROR $FFB8,X          ; 7E B8 FF | Rotate right (absolute,X)
    ORA ($66),Y          ; 11 66 | Logical OR with accumulator ((zero page),Y)
    EOR ($06,X)          ; 41 06 | Exclusive OR with accumulator ((zero page,X))
    INC $30              ; E6 30 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    BVS $88              ; 70 88 | Branch if overflow set
    BEQ $88              ; F0 88 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_077
; Address: $DC944F
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_077:
    JSR $F67A            ; 20 7A F6 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    DEC $88              ; C6 88 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    LDY #$E0             ; A0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA $1D12,X          ; 1D 12 1D | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0D02,X          ; 1D 02 0D | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    ORA $0A02            ; 0D 02 0A | Logical OR with accumulator (absolute)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0262            ; 0E 62 02 | Arithmetic shift left (absolute)
    LDY #$13             ; A0 13 | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    INC                  ; 1A | Increment accumulator
    ORA $1D2E            ; 0D 2E 1D | Logical OR with accumulator (absolute)
    ROL $721D            ; 2E 1D 72 | Rotate left (absolute)
    ADC $F15F            ; 6D 5F F1 | Add with carry (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_078
; Address: $DC94A0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_078:
    EOR $3432            ; 4D 32 34 | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_079
; Address: $DC94B1
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_079:
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $0509            ; 0D 09 05 | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BCS $80              ; B0 80 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$8C             ; C0 8C | Compare Y register (immediate)
    CPX #$82             ; E0 82 | Compare X register (immediate)
    LDY #$CA             ; A0 CA | Load immediate value into Y register
    STY $00              ; 84 00 | Store Y register to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BEQ $38              ; F0 38 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    INC $F06C,X          ; FE 6C F0 | Increment (absolute,X)
    BIT $50EC            ; 2C EC 50 | Test bits in accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STY $B8              ; 84 B8 | Store Y register to zero page
    STY $12F0            ; 8C F0 12 | Store Y register to absolute address
    STY $B645            ; 8C 45 B6 | Store Y register to absolute address
    EOR #$B2             ; 49 B2 | Exclusive OR with accumulator (immediate)
    BEQ $7C              ; F0 7C | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_07A
; Address: $DC94FB
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_07A:
    STY $8688            ; 8C 88 86 | Store Y register to absolute address
    LDY $A1BA,X          ; BC BA A1 | Load from absolute,X into Y register
    PHY                  ; 5A | Push Y register to stack
    LDA $8D66,X          ; BD 66 8D | Read graphics status
    STX $F442            ; 8E 42 F4 | Store X register to absolute address
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    CPX #$54             ; E0 54 | Compare X register (immediate)
    BRA $1C              ; 80 1C | Branch always
    INC                  ; 1A | Increment accumulator
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    ASL $3438            ; 0E 38 34 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    BPL $30              ; 10 30 | Branch if positive
    BPL $E0              ; 10 E0 | Game work RAM access
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $10              ; 10 10 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_07B
; Address: $DC9529
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_07B:
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_07C
; Address: $DC9548
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_07C:
    BPL $42              ; 10 42 | Hardware register operation
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA $48              ; A5 48 | Read graphics status
    JMP ($F25F)          ; 6C 5F F2 | Jump to address (absolute indirect)
    ROR $7E6C,X          ; 7E 6C 7E | Rotate right (absolute,X)
    EOR #$30             ; 49 30 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ROL $0C38,X          ; 3E 38 0C | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCS $A0              ; B0 A0 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    LDY #$AC             ; A0 AC | Load immediate value into Y register
    LDY #$A2             ; A0 A2 | Load immediate value into Y register
    LDY #$AA             ; A0 AA | Load immediate value into Y register
    LDY $40              ; A4 40 | Load from zero page into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BCS $58              ; B0 58 | Branch if carry set
    LDY $BE58,X          ; BC 58 BE | Load from absolute,X into Y register
    JMP $4CB0            ; 4C B0 4C | Jump to address
    LDY $B250            ; AC 50 B2 | Load from absolute address into Y register
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    PEA #$18F8           ; F4 F8 18 | Push effective address to stack
    BEQ $14              ; F0 14 | Branch if equal
    INX                  ; E8 | Increment X register
    BIT $62              ; 24 62 | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    BCS $5C              ; B0 5C | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_07D
; Address: $DC95BC
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_07D:
    INX                  ; E8 | Increment X register
    CPX $1C              ; E4 1C | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    BNE $FA              ; D0 FA | Branch if not equal
    BIT $8A              ; 24 8A | Test bits in accumulator (zero page)
    STY $88A4            ; 8C A4 88 | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    LDY #$D8             ; A0 D8 | Load immediate value into Y register
    BRA $78              ; 80 78 | Branch always
    BRA $60              ; 80 60 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    BVS $0C              ; 70 0C | Branch if overflow set
    BVS $28              ; 70 28 | Branch if overflow set
    BVS $30              ; 70 30 | Branch if overflow set
    BMI $10              ; 30 10 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY $A0              ; A4 A0 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$B5             ; A2 B5 | Load immediate value into X register
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    LDY #$B2             ; A0 B2 | Load immediate value into Y register
    LDA #$B0             ; A9 B0 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LDY #$41             ; A0 41 | Load immediate value into Y register
    LDX #$41             ; A2 41 | Load immediate value into X register
    LDX #$47             ; A2 47 | Load immediate value into X register
    LDA                  ; BF 57 B6 5B | Read graphics status
    LDA $AE5E,Y          ; B9 5E AE | Read graphics status
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $B6A8            ; AD A8 B6 | Read graphics status
    INX                  ; E8 | Increment X register
    SEP #$F6             ; E2 F6 | Set processor status bits
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDX $BA4F,Y          ; BE 4F BA | Load from absolute,Y into X register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BVC $B0              ; 50 B0 | Branch if overflow clear
    EOR ($FC),Y          ; 51 FC | Exclusive OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$6E6E           ; F4 6E 6E | Push effective address to stack
    ADC $9C6E            ; 6D 6E 9C | Add with carry (absolute)
    ADC ($98,X)          ; 61 98 | Add with carry ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_07E
; Address: $DC9624
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_07E:
    STZ $0D              ; 64 0D | Store zero to zero page
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ASL $0F11            ; 0E 11 0F | Arithmetic shift left (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    WDM #$60             ; 42 60 | Reserved instruction
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_07F
; Address: $DC9635
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_07F:
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_080
; Address: $DC9644
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_080:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $AA              ; 10 AA | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCC $08              ; 90 08 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPY #$A3             ; C0 A3 | Compare Y register (immediate)
    BEQ $B3              ; F0 B3 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    STZ $7C98,X          ; 9E 98 7C | Store zero to absolute,X
    BVS $04              ; 70 04 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ADC #$95             ; 69 95 | Add with carry (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    JMP $0E0A08          ; 5C 08 0A 0E | Jump to address long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $1C1E,X          ; 3E 1E 1C | Rotate left (absolute,X)
    BIT $7770            ; 2C 70 77 | Test bits in accumulator (absolute)
    BCS $77              ; B0 77 | Branch if carry set
    DEC                  ; 3A | Decrement accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $7232            ; 8D 32 72 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_081
; Address: $DC9692
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_081:
    JSR $C007            ; 20 07 C0 | Jump to subroutine
    CPY #$87             ; C0 87 | Compare Y register (immediate)
    BEQ $B2              ; F0 B2 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY $A0              ; A4 A0 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX #$B5             ; A2 B5 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_082
; Address: $DC96A9
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_082:
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    LDY #$B2             ; A0 B2 | Load immediate value into Y register
    LDA #$B0             ; A9 B0 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    EOR ($A2,X)          ; 41 A2 | Exclusive OR with accumulator ((zero page,X))
    LDA                  ; BF 57 B6 5B | Read graphics status
    LDA $AE5E,Y          ; B9 5E AE | Read graphics status
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $B6A8            ; AD A8 B6 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    SEP #$06             ; E2 06 | Set processor status bits
    SBC #$F4             ; E9 F4 | Subtract with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDX $BA4F,Y          ; BE 4F BA | Load from absolute,Y into X register
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BVC $B0              ; 50 B0 | Branch if overflow clear
    EOR ($BC),Y          ; 51 BC | Exclusive OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    ASL $6DFE            ; 0E FE 6D | Arithmetic shift left (absolute)
    ROR $01FC            ; 6E FC 01 | Rotate right (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_083
; Address: $DC96E4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_083:
    BCC $6D              ; 90 6D | Branch if carry clear
    ADC #$0C             ; 69 0C | Add with carry (immediate)
    ORA ($0C),Y          ; 11 0C | Logical OR with accumulator ((zero page),Y)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_085
; Address: $DC96F5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_085:
    ADC ($13,X)          ; 61 13 | Add with carry ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $0001            ; 0D 01 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_086
; Address: $DC9704
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_086:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $AA              ; 10 AA | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCC $08              ; 90 08 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    CPY #$A3             ; C0 A3 | Compare Y register (immediate)
    BEQ $B3              ; F0 B3 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    STZ $7C98,X          ; 9E 98 7C | Store zero to absolute,X
    BVS $04              ; 70 04 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$CE             ; C0 CE | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_087
; Address: $DC972B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_087:
    RTI                  ; 40 | Return from interrupt
    ADC $2995            ; 6D 95 29 | Add with carry (absolute)
    JMP $0E0A08          ; 5C 08 0A 0E | Jump to address long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $1C1E,X          ; 3E 1E 1C | Rotate left (absolute,X)
    AND $7370            ; 2D 70 73 | Logical AND with accumulator (absolute)
    BCS $73              ; B0 73 | Branch if carry set
    STA ($15,X)          ; 81 15 | Update graphics data
    BIT $B3              ; 24 B3 | Test bits in accumulator (zero page)
    AND ($49),Y          ; 31 49 | Logical AND with accumulator ((zero page),Y)
    BVS $88              ; 70 88 | Branch if overflow set
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_088
; Address: $DC974F
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_088:
    JSR $0340            ; 20 40 03 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    STA ($80,X)          ; 81 80 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    LDY #$E0             ; A0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY #$AC             ; A0 AC | Load immediate value into Y register
    LDY #$B8             ; A0 B8 | Load immediate value into Y register
    BCS $A7              ; B0 A7 | Branch if carry set
    LDA ($A4,X)          ; A1 A4 | Read graphics status
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    LDA $5BBF5C          ; AF 5C BF 5B | Read graphics status
    LDA                  ; BF 57 AF 55 | Read graphics status
    LDA $B7A0A0          ; AF A0 A0 B7 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$9D             ; A0 9D | Load immediate value into Y register
    BEQ $CE              ; F0 CE | Branch if equal
    BCC $F0              ; 90 F0 | Branch if carry clear
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    PEA #$AF09           ; F4 09 AF | Push effective address to stack
    PLB                  ; AB | Pull data bank register from stack
    STA ($40,X)          ; 81 40 | Update graphics data
    BRA $42              ; 80 42 | Hardware register operation
    CMP ($60,X)          ; C1 60 | Compare accumulator ((zero page,X))
    STA $617260          ; 8F 60 72 61 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    ORA $5B              ; 05 5B | Logical OR with accumulator (zero page)
    ORA $0741,X          ; 1D 41 07 | Logical OR with accumulator (absolute,X)
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_089
; Address: $DC97AC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_089:
    CLC                  ; 18 | Clear carry flag
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    LDY #$43             ; A0 43 | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $90              ; 10 90 | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_08A
; Address: $DC97CF
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_08A:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $30              ; 80 30 | Branch always
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    BCC $F8              ; 90 F8 | Branch if carry clear
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$28             ; E0 28 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    BEQ $06              ; F0 06 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    WDM #$45             ; 42 45 | Reserved instruction
    PLP                  ; 28 | Pull processor status from stack
    BIT $D285            ; 2C 85 D2 | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $F4              ; F0 F4 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$CEF8           ; F4 F8 CE | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    SBC $6F7F            ; ED 7F 6F | Subtract with carry (absolute)
    LDX $DE36,Y          ; BE 36 DE | Load from absolute,Y into X register
    CPY $C0AC            ; CC AC C0 | Compare Y register (absolute)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BCS $C0              ; B0 C0 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    BRA $C8              ; 80 C8 | Branch always
    BPL $70              ; 10 70 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $C0              ; 10 C0 | Branch if positive
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BRA $30              ; 80 30 | Branch always
    BPL $A0              ; 10 A0 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_08C
; Address: $DC9822
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_08C:
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $5C              ; 50 5C | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    EOR ($44),Y          ; 51 44 | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_08D
; Address: $DC9833
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_08D:
    JSR $2F53            ; 20 53 2F | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BVC $57              ; 50 57 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $7D              ; 70 7D | Branch if overflow set
    BVC $6C              ; 50 6C | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    ADC ($03),Y          ; 71 03 | Add with carry ((zero page),Y)
    EOR ($20,X)          ; 41 20 | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_08E
; Address: $DC9857
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_08E:
    JSL $342043          ; 22 43 20 34 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    BVS $27              ; 70 27 | Branch if overflow set
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BVC $27              ; 50 27 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_08F
; Address: $DC9872
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_08F:
    JSR $0007            ; 20 07 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $90              ; 10 90 | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_090
; Address: $DC988F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_090:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BRA $30              ; 80 30 | Branch always
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    BCC $F8              ; 90 F8 | Branch if carry clear
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$28             ; E0 28 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $10              ; 10 10 | Branch if positive
    BEQ $06              ; F0 06 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    WDM #$45             ; 42 45 | Reserved instruction
    PLP                  ; 28 | Pull processor status from stack
    LDY $92A5            ; AC A5 92 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_091
; Address: $DC98B0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_091:
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $F4              ; F0 F4 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$CEF8           ; F4 F8 CE | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    SBC $6F7F            ; ED 7F 6F | Subtract with carry (absolute)
    LDX $BE76,Y          ; BE 76 BE | Load from absolute,Y into X register
    STY $805C            ; 8C 5C 80 | Store Y register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_092
; Address: $DC98C8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_092:
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $E0              ; 10 E0 | Game work RAM access
    LDY #$40             ; A0 40 | Load immediate value into Y register
    STZ $8020            ; 9C 20 80 | Store zero to absolute
    BPL $80              ; 10 80 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_093
; Address: $DC98DA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_093:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BPL $1F              ; 10 1F | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    BCS $6F              ; B0 6F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_095
; Address: $DC98EF
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_095:
    BCS $08              ; B0 08 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $6F              ; D0 6F | Branch if not equal
    BNE $B7              ; D0 B7 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    LDY $AFB0            ; AC B0 AF | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA $B7A7AF          ; AF AF A7 B7 | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $3B              ; E6 3B | Increment (zero page)
    BIT $2FB3            ; 2C B3 2F | Test bits in accumulator (absolute)
    BEQ $AF              ; F0 AF | Branch if equal
    RTI                  ; 40 | Return from interrupt
    LDA $40AF40          ; AF 40 AF 40 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BVC $0C              ; 50 0C | Branch if overflow clear
    BMI $0F              ; 30 0F | Branch if negative
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $EF              ; F0 EF | Branch if equal
    BVC $AE              ; 50 AE | Branch if overflow clear
    STA ($A7),Y          ; 91 A7 | Update graphics data

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_096
; Address: $DC9925
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_096:
    CLD                  ; D8 | Clear decimal mode flag
    LDY #$C7             ; A0 C7 | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    CMP $DEBE,Y          ; D9 BE DE | Compare accumulator (absolute,Y)
    LDY #$DE             ; A0 DE | Load immediate value into Y register
    SBC ($EA),Y          ; F1 EA | Subtract with carry ((zero page),Y)
    BVC $8F              ; 50 8F | Branch if overflow clear
    BVC $C7              ; 50 C7 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    CMP $C606,Y          ; D9 06 C6 | Compare accumulator (absolute,Y)
    ORA $1EC1,Y          ; 19 C1 1E | Logical OR with accumulator (absolute,Y)
    STA ($5E,X)          ; 81 5E | Update graphics data
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    PEA #$B81C           ; F4 1C B8 | Push effective address to stack
    JMP $24DC            ; 4C DC 24 | Jump to address
    JMP ($18E8)          ; 6C E8 18 | Jump to address (absolute indirect)
    BPL $E0              ; 10 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $08              ; 30 08 | Branch if negative
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E4             ; E0 E4 | Compare X register (immediate)
    BPL $6E              ; 10 6E | Branch if positive
    CPY $0AF3            ; CC F3 0A | Compare Y register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BMI $0C              ; 30 0C | Branch if negative
    BEQ $0C              ; F0 0C | Branch if equal
    PEA #$A00A           ; F4 0A A0 | Push effective address to stack
    EOR $BB40,Y          ; 59 40 BB | Exclusive OR with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $7C              ; F0 7C | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    BVC $00              ; 50 00 | Branch if overflow clear
    PEA #$F40B           ; F4 0B F4 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_097
; Address: $DC9994
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_097:
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$18             ; E0 18 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $80              ; F0 80 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    BVS $EF              ; 70 EF | Branch if overflow set
    LDY #$AF             ; A0 AF | Load immediate value into Y register
    LDY #$B7             ; A0 B7 | Load immediate value into Y register
    BCS $08              ; B0 08 | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    LDA $50AF50          ; AF 50 AF 50 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LDY $AFB0            ; AC B0 AF | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA $3707CF          ; AF CF 07 37 | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $FB              ; 26 FB | Rotate left (zero page)
    CPX $AF73            ; EC 73 AF | Compare X register (absolute)
    BCC $AF              ; 90 AF | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    LDA $40AF40          ; AF 40 AF 40 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    BNE $0C              ; D0 0C | Branch if not equal
    BEQ $0F              ; F0 0F | Branch if equal
    BVS $8F              ; 70 8F | Branch if overflow set
    BVC $8D              ; 50 8D | Branch if overflow clear
    STX $AFD1            ; 8E D1 AF | Store X register to absolute address
    BNE $A0              ; D0 A0 | Branch if not equal
    LDY #$CF             ; A0 CF | Load immediate value into Y register
    INC $1BD0,X          ; FE D0 1B | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $EF              ; 10 EF | Branch if positive
    BPL $CF              ; 10 CF | Branch if positive
    BPL $C7              ; 10 C7 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BCC $4F              ; 90 4F | Branch if carry clear
    CMP ($10,X)          ; C1 10 | Compare accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    PEA #$B81C           ; F4 1C B8 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_098
; Address: $DC9A09
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_098:
    JMP $24DC            ; 4C DC 24 | Jump to address
    JMP ($18E8)          ; 6C E8 18 | Jump to address (absolute indirect)
    BPL $E0              ; 10 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $08              ; 30 08 | Branch if negative
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    STZ $DC              ; 64 DC | Store zero to zero page
    CPY $1AE1            ; CC E1 1A | Compare Y register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    BEQ $0C              ; F0 0C | Branch if equal
    PEA #$C50A           ; F4 0A C5 | Push effective address to stack
    ROL $F806,X          ; 3E 06 F8 | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    BVC $F0              ; 50 F0 | Branch if overflow clear
    ASL $08F0            ; 0E F0 08 | Arithmetic shift left (absolute)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_09A
; Address: $DC9A59
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_09A:
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    AND ($30,X)          ; 21 30 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_09B
; Address: $DC9A6A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_09B:
    JSR $283F            ; 20 3F 28 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BPL $31              ; 10 31 | Branch if positive
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    ORA $1F03,X          ; 1D 03 1F | Logical OR with accumulator (absolute,X)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $0E03            ; 0E 03 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_09C
; Address: $DC9A89
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_09C:
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $0B              ; 10 0B | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    AND #$37             ; 29 37 | Logical AND with accumulator (immediate)
    AND #$33             ; 29 33 | Logical AND with accumulator (immediate)
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    BMI $5B              ; 30 5B | Branch if negative
    ORA $060B            ; 0D 0B 06 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_09D
; Address: $DC9AB0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_09D:
    JSR $2017            ; 20 17 20 | Jump to subroutine
    ORA $0420,Y          ; 19 20 04 | Logical OR with accumulator (absolute,Y)
    ORA $0600            ; 0D 00 06 | Logical OR with accumulator (absolute)
    STZ $B6E4            ; 9C E4 B6 | Store zero to absolute
    LSR $A5              ; 46 A5 | Logical shift right (zero page)
    EOR $06              ; 45 06 | Exclusive OR with accumulator (zero page)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    SBC $FD5D,X          ; FD 5D FD | Subtract with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    STZ $B660            ; 9C 60 B6 | Store zero to absolute
    PHA                  ; 48 | Push accumulator to stack
    LDA $5A              ; A5 5A | Read graphics status
    CMP $DD22,X          ; DD 22 DD | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_09E
; Address: $DC9ADF
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_09E:
    JSL $A5B5F5          ; 22 F5 B5 A5 | Jump to subroutine long
    ORA $1DDD            ; 0D DD 1D | Logical OR with accumulator (absolute)
    ADC $3B              ; 65 3B | Add with carry (zero page)
    CMP ($B1,X)          ; C1 B1 | Compare accumulator ((zero page,X))
    LDA $CFB6,Y          ; B9 B6 CF | Read graphics status
    CMP $028D,Y          ; D9 8D 02 | Compare accumulator (absolute,Y)
    ORA $2502            ; 0D 02 25 | Logical OR with accumulator (absolute)
    ORA $82              ; 05 82 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $50              ; 06 50 | Arithmetic shift left (zero page)
    LDX $29              ; A6 29 | Load from zero page into X register
    BNE $8D              ; D0 8D | Branch if not equal
    ORA $5FCD,X          ; 1D CD 5F | Logical OR with accumulator (absolute,X)
    ORA $0DFF            ; 0D FF 0D | Logical OR with accumulator (absolute)
    SBC $EB              ; E5 EB | Subtract with carry (zero page)
    SBC $EB              ; E5 EB | Subtract with carry (zero page)
    PHP                  ; 08 | Push processor status to stack
    BCC $6D              ; 90 6D | Branch if carry clear
    BVC $0F              ; 50 0F | Branch if overflow clear
    BEQ $E7              ; F0 E7 | Branch if equal
    BPL $13              ; 10 13 | Branch if positive
    INX                  ; E8 | Increment X register
    ORA ($EA),Y          ; 11 EA | Logical OR with accumulator ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A0
; Address: $DC9B2A
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A0:
    JSR $283F            ; 20 3F 28 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BPL $31              ; 10 31 | Branch if positive
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    ORA $1F03,X          ; 1D 03 1F | Logical OR with accumulator (absolute,X)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $0E03            ; 0E 03 0E | Arithmetic shift left (absolute)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $0B              ; 10 0B | Branch if positive
    AND ($16,X)          ; 21 16 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $B4E4            ; 9C E4 B4 | Store zero to absolute
    LDX $46              ; A6 46 | Load from zero page into X register
    ORA $F5              ; 05 F5 | Logical OR with accumulator (zero page)
    ORA $F5              ; 05 F5 | Logical OR with accumulator (zero page)
    ASL $FA              ; 06 FA | Arithmetic shift left (zero page)
    PHY                  ; 5A | Push Y register to stack
    PLX                  ; FA | Pull X register from stack
    SEC                  ; 38 | Set carry flag
    STZ $B460            ; 9C 60 B4 | Store zero to absolute
    PHA                  ; 48 | Push accumulator to stack
    LDX $5C              ; A6 5C | Load from zero page into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    PHX                  ; DA | Push X register to stack
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    BIT $F2              ; 24 F2 | Test bits in accumulator (zero page)
    LDX #$52             ; A2 52 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHX                  ; DA | Push X register to stack
    INC                  ; 1A | Increment accumulator
    DEC                  ; 3A | Decrement accumulator
    REP #$B6             ; C2 B6 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    STZ $048A            ; 9C 8A 04 | Store zero to absolute
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A1
; Address: $DC9BB4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A1:
    JSL $840204          ; 22 04 02 84 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $28              ; 24 28 | Test bits in accumulator (zero page)
    LDX $1AD2            ; AE D2 1A | Load from absolute address into X register
    DEX                  ; CA | Decrement X register
    INC                  ; 1A | Increment accumulator
    INC $1EEA            ; EE EA 1E | Increment (absolute)
    REP #$CE             ; C2 CE | Reset processor status bits

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A2
; Address: $DC9BCB
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A2:
    STX $C67A            ; 8E 7A C6 | Store X register to absolute address
    ROL $02CE            ; 2E CE 02 | Rotate left (absolute)
    BNE $0A              ; D0 0A | Branch if not equal
    CPX $0E              ; E4 0E | Compare X register (zero page)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BPL $36              ; 10 36 | Branch if positive
    INY                  ; C8 | Increment Y register
    ROR $88              ; 66 88 | Rotate right (zero page)
    CPY $0E              ; C4 0E | Compare Y register (zero page)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ROL $28              ; 26 28 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BIT $0813            ; 2C 13 08 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)
    ORA $0A01            ; 0D 01 0A | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    ROL $336C,X          ; 3E 6C 33 | Rotate left (absolute,X)
    STY $0052            ; 8C 52 00 | Store Y register to absolute address
    BPL $04              ; 10 04 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ROL $AC51            ; 2E 51 AC | Rotate left (absolute)
    BVS $6E              ; 70 6E | Branch if overflow set
    BPL $20              ; 10 20 | Branch if positive
    ASL $0720,X          ; 1E 20 07 | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA $1E3E,Y          ; 19 3E 1E | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A3
; Address: $DC9C2C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A3:
    JSR $111E            ; 20 1E 11 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0611            ; 0E 11 06 | Arithmetic shift left (absolute)
    ORA $0619,Y          ; 19 19 06 | Logical OR with accumulator (absolute,Y)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $F010            ; 0E 10 F0 | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0D36            ; 0E 36 0D | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A4
; Address: $DC9C4C
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A4:
    INC                  ; 1A | Increment accumulator
    SEP #$37             ; E2 37 | Set processor status bits
    CMP $E010            ; CD 10 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    BPL $64              ; 10 64 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $6DD0            ; 2E D0 6D | Rotate left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PHX                  ; DA | Push X register to stack
    ORA $5D02,X          ; 1D 02 5D | Logical OR with accumulator (absolute,X)
    LDA $0D              ; A5 0D | Read graphics status
    STA $75              ; 85 75 | Update graphics data
    AND $0D              ; 25 0D | Logical AND with accumulator (zero page)
    SBC $7C47,X          ; FD 47 7C | Subtract with carry (absolute,X)
    CMP #$34             ; C9 34 | Compare accumulator (immediate)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)
    ORA $8D02            ; 0D 02 8D | Logical OR with accumulator (absolute)
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    BCC $6C              ; 90 6C | Branch if carry clear
    BMI $CB              ; 30 CB | Branch if negative
    BVS $8B              ; 70 8B | Branch if overflow set
    ORA $7D              ; 05 7D | Logical OR with accumulator (zero page)
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA $F7              ; 05 F7 | Logical OR with accumulator (zero page)
    ADC $DD0F,X          ; 7D 0F DD | Add with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    TXA                  ; 8A | Transfer X register to accumulator
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $87              ; F0 87 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ORA $72              ; 05 72 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROL $28              ; 26 28 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BIT $0813            ; 2C 13 08 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)
    ORA $0A01            ; 0D 01 0A | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A5
; Address: $DC9CC8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A5:
    JSR $620F            ; 20 0F 62 | Jump to subroutine
    ROL $336C,X          ; 3E 6C 33 | Rotate left (absolute,X)
    CPY $0052            ; CC 52 00 | Compare Y register (absolute)
    BPL $04              ; 10 04 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ROL $0C51            ; 2E 51 0C | Rotate left (absolute)
    BCC $0E              ; 90 0E | Branch if carry clear
    BNE $EE              ; D0 EE | Branch if not equal
    BPL $24              ; 10 24 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A6
; Address: $DC9CE8
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A6:
    JSR $3E0F            ; 20 0F 3E | Jump to subroutine
    BPL $1B              ; 10 1B | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $2ED3            ; 2C D3 2E | Test bits in accumulator (absolute)
    CMP ($0E),Y          ; D1 0E | Compare accumulator ((zero page),Y)
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BPL $F0              ; 10 F0 | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    ORA $75              ; 05 75 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $35E5,X          ; 1D E5 35 | Logical OR with accumulator (absolute,X)
    CMP $E010            ; CD 10 E0 | Game work RAM access
    NOP                  ; EA | No operation
    BPL $65              ; 10 65 | Branch if positive
    TXS                  ; 9A | Transfer X register to stack pointer
    ROL                  ; 2A | Rotate left (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ADC $DD92            ; 6D 92 DD | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A7
; Address: $DC9D1D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A7:
    JSL $5D021D          ; 22 1D 02 5D | Jump to subroutine long
    LDA $0D              ; A5 0D | Read graphics status
    STA $75              ; 85 75 | Update graphics data
    BIT $0C              ; 24 0C | Test bits in accumulator (zero page)
    SBC $7B44,Y          ; F9 44 7B | Subtract with carry (absolute,Y)
    CPY $5D25            ; CC 25 5D | Compare Y register (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)
    ORA $8C02            ; 0D 02 8C | Logical OR with accumulator (absolute)
    BMI $0B              ; 30 0B | Branch if negative
    BCC $6B              ; 90 6B | Branch if carry clear
    INY                  ; C8 | Increment Y register
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A8
; Address: $DC9D46
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A8:
    ORA $E7              ; 05 E7 | Logical OR with accumulator (zero page)
    ORA $7F9F,X          ; 1D 9F 7F | Logical OR with accumulator (absolute,X)
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    BVC $37              ; 50 37 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 60 65 9A | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $02              ; 70 02 | Branch if overflow set
    ASL $2739,X          ; 1E 39 27 | Arithmetic shift left (absolute,X)
    AND $2522            ; 2D 22 25 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0A9
; Address: $DC9D68
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0A9:
    JSL $2D252E          ; 22 2E 25 2D | Jump to subroutine long
    AND $3D              ; 25 3D | Logical AND with accumulator (zero page)
    ASL $1C02,X          ; 1E 02 1C | Arithmetic shift left (absolute,X)
    AND $2D06,Y          ; 39 06 2D | Logical AND with accumulator (absolute,Y)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    ROL $2D11            ; 2E 11 2D | Rotate left (absolute)
    AND $1A03,X          ; 3D 03 1A | Logical AND with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ASL $040E            ; 0E 0E 04 | Arithmetic shift left (absolute)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1F12,X          ; 1E 12 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0AA
; Address: $DC9DA6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0AA:
    JSL $17263B          ; 22 3B 26 17 | Jump to subroutine long
    ROL $1E17            ; 2E 17 1E | Rotate left (absolute)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $0C13            ; 0D 13 0C | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    STY $8C              ; 84 8C | Store Y register to zero page
    JMP ($E89C)          ; 6C 9C E8 | Jump to address (absolute indirect)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0AB
; Address: $DC9DD6
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0AB:
    BEQ $08              ; F0 08 | Branch if equal
    STY $7C70            ; 8C 70 7C | Store Y register to absolute address
    BRA $7C              ; 80 7C | Branch always
    BRA $F8              ; 80 F8 | Branch always
    CLV                  ; B8 | Clear overflow flag
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    BEQ $C0              ; F0 C0 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    BCC $30              ; 90 30 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVC $20              ; 50 20 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    BCC $08              ; 90 08 | Branch if carry clear
    BNE $E4              ; D0 E4 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    CPY $88              ; C4 88 | Compare Y register (zero page)
    STY $F8              ; 84 F8 | Store Y register to zero page
    CPX $E8              ; E4 E8 | Compare X register (zero page)
    PLX                  ; FA | Pull X register from stack
    PEA #$E0F6           ; F4 F6 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0AC
; Address: $DC9E0C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0AC:
    JSR $A0C0            ; 20 C0 A0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BPL $68              ; 10 68 | Branch if positive
    BCS $08              ; B0 08 | Branch if carry set
    BRA $78              ; 80 78 | Branch always
    BCC $68              ; 90 68 | Branch if carry clear
    BRA $74              ; 80 74 | Branch always
    BRA $60              ; 80 60 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    ASL $2739,X          ; 1E 39 27 | Arithmetic shift left (absolute,X)
    AND $2522            ; 2D 22 25 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0AD
; Address: $DC9E27
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0AD:
    JSL $222F23          ; 22 23 2F 22 | Jump to subroutine long
    ROL $3E26            ; 2E 26 3E | Rotate left (absolute)
    AND $2D06,Y          ; 39 06 2D | Logical AND with accumulator (absolute,Y)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    AND $2E12            ; 2D 12 2E | Logical AND with accumulator (absolute)
    ORA ($3A),Y          ; 11 3A | Logical OR with accumulator ((zero page),Y)
    ORA $1B              ; 05 1B | Logical OR with accumulator (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($1B),Y          ; 11 1B | Logical OR with accumulator ((zero page),Y)
    ORA $1D07,Y          ; 19 07 1D | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0AE
; Address: $DC9E4A
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0AE:
    ORA $090F            ; 0D 0F 09 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1F31,X          ; 3D 31 1F | Logical AND with accumulator (absolute,X)
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)
    AND #$0F             ; 29 0F | Logical AND with accumulator (immediate)
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $0E11            ; 2C 11 0E | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA $1126,Y          ; 19 26 11 | Logical OR with accumulator (absolute,Y)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    JMP $BCA4            ; 4C A4 BC | Jump to address
    LDY $68DC            ; AC DC 68 | Load from absolute address into Y register
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    JMP $BCB0            ; 4C B0 BC | Jump to address
    CPY #$BC             ; C0 BC | Compare Y register (immediate)
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $40              ; 70 40 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    JMP $F43A            ; 4C 3A F4 | Jump to address
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $08              ; 80 08 | Branch always
    BMI $04              ; 30 04 | Branch if negative
    INY                  ; C8 | Increment Y register
    PEA #$14F2           ; F4 F2 14 | Push effective address to stack
    STZ $68              ; 64 68 | Store zero to zero page
    JMP $44F8            ; 4C F8 44 | Jump to address
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0AF
; Address: $DC9EC8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0AF:
    PLY                  ; 7A | Pull Y register from stack
    CPX $F0EE            ; EC EE F0 | Compare X register (absolute)
    BVC $E0              ; 50 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BVC $A8              ; 50 A8 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BMI $F0              ; 30 F0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BIT $C0              ; 24 C0 | Test bits in accumulator (zero page)
    BMI $40              ; 30 40 | Branch if negative
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BVS $AF              ; 70 AF | Branch if overflow set
    LDY #$6F             ; A0 6F | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B0
; Address: $DC9EEF
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B0:
    BVC $08              ; 50 08 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    LDA $D06F50          ; AF 50 6F D0 | Read graphics status
    INX                  ; E8 | Increment X register
    LDY $AFB0            ; AC B0 AF | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA $A5              ; A5 A5 | Read graphics status
    LDA ($A1,X)          ; A1 A1 | Read graphics status
    SBC ($A1,X)          ; E1 A1 | Subtract with carry ((zero page,X))
    LDA $40AF40          ; AF 40 AF 40 | Read graphics status
    BVC $BF              ; 50 BF | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $F57C,X          ; BC 7C F5 | Load from absolute,X into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    CPY $D7B0            ; CC B0 D7 | Compare Y register (absolute)
    LDX $ABE8,Y          ; BE E8 AB | Load from absolute,Y into X register
    INC $E1              ; E6 E1 | Increment (zero page)
    CPX #$0D             ; E0 0D | Compare X register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    SBC ($08,X)          ; E1 08 | Subtract with carry ((zero page,X))
    LDY #$46             ; A0 46 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B1
; Address: $DC9F44
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B1:
    CPX $FC              ; E4 FC | Compare X register (zero page)
    PEA #$B81C           ; F4 1C B8 | Push effective address to stack
    JMP $24DC            ; 4C DC 24 | Jump to address
    JMP ($18E8)          ; 6C E8 18 | Jump to address (absolute indirect)
    BPL $E0              ; 10 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $08              ; 30 08 | Branch if negative
    BEQ $14              ; F0 14 | Branch if equal
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    PEA #$B4B4           ; F4 B4 B4 | Push effective address to stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX $FC08            ; EC 08 FC | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $B2              ; F0 B2 | Branch if equal
    TAX                  ; AA | Transfer accumulator to X register
    BPL $CC              ; 10 CC | Branch if positive
    BMI $88              ; 30 88 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B2
; Address: $DC9F88
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B2:
    CLC                  ; 18 | Clear carry flag
    BCC $78              ; 90 78 | Branch if carry clear
    BVS $10              ; 70 10 | Branch if overflow set
    CPX #$10             ; E0 10 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B3
; Address: $DC9F8F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B3:
    JSR $E4F8            ; 20 F8 E4 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $30              ; 80 30 | Branch always
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B4
; Address: $DC9F99
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B4:
    BCC $80              ; 90 80 | Branch if carry clear
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BPL $1F              ; 10 1F | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    BCS $6F              ; B0 6F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B6
; Address: $DC9FAF
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B6:
    BCS $08              ; B0 08 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $6F              ; D0 6F | Branch if not equal
    BNE $B7              ; D0 B7 | Branch if not equal
    PHA                  ; 48 | Push accumulator to stack
    LDY $AFB0            ; AC B0 AF | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA $A5              ; A5 A5 | Read graphics status
    SBC ($A1,X)          ; E1 A1 | Subtract with carry ((zero page,X))
    STA ($21,X)          ; 81 21 | PPU graphics register access
    LDA $40AF40          ; AF 40 AF 40 | Read graphics status
    BVC $BF              ; 50 BF | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $8DB5,X          ; BC B5 8D | Load from absolute,X into Y register
    INC $E6B1            ; EE B1 E6 | Increment (absolute)
    CLV                  ; B8 | Clear overflow flag
    SBC #$BE             ; E9 BE | Subtract with carry (immediate)
    INC $E7E8            ; EE E8 E7 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    STA $8737            ; 8D 37 87 | Update graphics data
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC #$06             ; E9 06 | Subtract with carry (immediate)
    INC $09              ; E6 09 | Increment (zero page)
    LDA ($4E,X)          ; A1 4E | Read graphics status
    CPX #$07             ; E0 07 | Compare X register (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    PEA #$B81C           ; F4 1C B8 | Push effective address to stack
    JMP $24DC            ; 4C DC 24 | Jump to address
    JMP ($18E8)          ; 6C E8 18 | Jump to address (absolute indirect)
    BPL $E0              ; 10 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $08              ; 30 08 | Branch if negative
    BEQ $14              ; F0 14 | Branch if equal
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    PEA #$B4B4           ; F4 B4 B4 | Push effective address to stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROR $64              ; 66 64 | Rotate right (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B7
; Address: $DCA034
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B7:
    CPX $FC08            ; EC 08 FC | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    PEA #$B4B1           ; F4 B1 B4 | Push effective address to stack
    LDA ($B6,X)          ; A1 B6 | Read graphics status
    NOP                  ; EA | No operation
    BVC $C4              ; 50 C4 | Branch if overflow clear
    BMI $0C              ; 30 0C | Branch if negative
    INX                  ; E8 | Increment X register
    SEI                  ; 78 | Set interrupt disable flag
    BPL $D0              ; 10 D0 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B8
; Address: $DCA04E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B8:
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    INC $E8              ; E6 E8 | Increment (zero page)
    CPX $10              ; E4 10 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    BMI $10              ; 30 10 | Branch if negative
    INX                  ; E8 | Increment X register
    BRA $10              ; 80 10 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0B9
; Address: $DCA065
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0B9:
    CLC                  ; 18 | Clear carry flag
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    BMI $2F              ; 30 2F | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $31              ; 10 31 | Branch if positive
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    ORA $2F03,X          ; 1D 03 2F | Logical OR with accumulator (absolute,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0BA
; Address: $DCA088
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0BA:
    JSL $696922          ; 22 22 69 69 | Jump to subroutine long
    ADC $65              ; 65 65 | Add with carry (zero page)
    ADC $25              ; 65 25 | Add with carry (zero page)
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ROL $3E37,X          ; 3E 37 3E | Rotate left (absolute,X)
    AND $240C            ; 2D 0C 24 | Logical AND with accumulator (absolute)
    ROL $1E3D,X          ; 3E 3D 1E | Rotate left (absolute,X)
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    STZ $B4E4            ; 9C E4 B4 | Store zero to absolute
    LDY $44              ; A4 44 | Load from zero page into Y register
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    ORA $F5              ; 05 F5 | Logical OR with accumulator (zero page)
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0BB
; Address: $DCA0CE
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0BB:
    LSR $40FA,X          ; 5E FA 40 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    STZ $B460            ; 9C 60 B4 | Store zero to absolute
    PHA                  ; 48 | Push accumulator to stack
    LDY $58              ; A4 58 | Load from zero page into Y register
    JMP $4AB5            ; 4C B5 4A | Jump to address
    CMP $DA22,X          ; DD 22 DA | Compare accumulator (absolute,X)
    BIT $CA              ; 24 CA | Test bits in accumulator (zero page)
    NOP                  ; EA | No operation
    ROL                  ; 2A | Rotate left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEP #$66             ; E2 66 | Set processor status bits
    WDM #$92             ; 42 92 | Reserved instruction
    NOP                  ; EA | No operation
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    STY $22              ; 84 22 | Store Y register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    RTI                  ; 40 | Return from interrupt
    BVC $AC              ; 50 AC | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    LDX $1ADA            ; AE DA 1A | Load from absolute address into X register
    TAX                  ; AA | Transfer accumulator to X register
    TXS                  ; 9A | Transfer X register to stack pointer
    ROR $EA              ; 66 EA | Rotate right (zero page)
    STX $9A              ; 86 9A | Store X register to zero page
    LDX $6EDA            ; AE DA 6E | Load from absolute address into X register
    ROR $20AE            ; 6E AE 20 | Rotate right (absolute)
    CPY #$0A             ; C0 0A | Compare Y register (immediate)
    BNE $0A              ; D0 0A | Branch if not equal
    CPX $06              ; E4 06 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0BC
; Address: $DCA117
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0BC:
    BRA $4E              ; 80 4E | Branch always
    LDY #$4A             ; A0 4A | Load immediate value into Y register
    BIT $2E              ; 24 2E | Test bits in accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    BMI $2F              ; 30 2F | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    BPL $31              ; 10 31 | Branch if positive
    ASL $003F            ; 0E 3F 00 | Arithmetic shift left (absolute)
    ORA $2F03,X          ; 1D 03 2F | Logical OR with accumulator (absolute,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0BE
; Address: $DCA14E
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0BE:
    ADC $25              ; 65 25 | Add with carry (zero page)
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    ROL $3E37,X          ; 3E 37 3E | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA #$2C             ; 09 2C | Logical OR with accumulator (immediate)
    ORA #$24             ; 09 24 | Logical OR with accumulator (immediate)
    ORA $060B            ; 0D 0B 06 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $1318,X          ; 3D 18 13 | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $10              ; 24 10 | Test bits in accumulator (zero page)
    ORA $0600            ; 0D 00 06 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    STZ $B6E4            ; 9C E4 B6 | Store zero to absolute
    LSR $A5              ; 46 A5 | Logical shift right (zero page)
    EOR $06              ; 45 06 | Exclusive OR with accumulator (zero page)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    SBC $FD5D,X          ; FD 5D FD | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    STZ $B660            ; 9C 60 B6 | Store zero to absolute
    PHA                  ; 48 | Push accumulator to stack
    LDA $5A              ; A5 5A | Read graphics status
    CMP $DD22,X          ; DD 22 DD | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0BF
; Address: $DCA19F
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0BF:
    JSL $2DE9CD          ; 22 CD E9 2D | Jump to subroutine long
    EOR $D50D,Y          ; 59 0D D5 | Exclusive OR with accumulator (absolute,Y)
    ORA $93B5            ; 0D B5 93 | Logical OR with accumulator (absolute)
    SBC ($41,X)          ; E1 41 | Subtract with carry ((zero page,X))
    WDM #$91             ; 42 91 | Reserved instruction
    CMP $52D9,Y          ; D9 D9 52 | Compare accumulator (absolute,Y)
    BIT #$82             ; 89 82 | Test bits in accumulator (immediate)
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    ORA $42              ; 05 42 | Hardware register operation
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LSR $58              ; 46 58 | Logical shift right (zero page)
    LDX $29              ; A6 29 | Load from zero page into X register
    BNE $AD              ; D0 AD | Branch if not equal
    STA $B755,X          ; 9D 55 B7 | Update graphics data
    CMP $CFF7            ; CD F7 CF | Compare accumulator (absolute)
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BCS $4D              ; B0 4D | Branch if carry set
    LDY #$17             ; A0 17 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C0
; Address: $DCA1D7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C0:
    LDY #$05             ; A0 05 | Load immediate value into Y register
    BNE $00              ; D0 00 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C1
; Address: $DCA1DF
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C1:
    BEQ $08              ; F0 08 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    ROL $28              ; 26 28 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ASL $180D            ; 0E 0D 18 | Arithmetic shift left (absolute)
    ORA $1E18,X          ; 1D 18 1E | Logical OR with accumulator (absolute,X)
    ROL $142A            ; 2E 2A 14 | Rotate left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL $0806            ; 0E 06 08 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    ROL $19              ; 26 19 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    ASL $0708            ; 0E 08 07 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $29              ; 06 29 | Arithmetic shift left (zero page)
    ORA $0609            ; 0D 09 06 | Logical OR with accumulator (absolute)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    BPL $F0              ; 10 F0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0D76            ; 0E 76 0D | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register
    BPL $E0              ; 10 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    BPL $64              ; 10 64 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $6ED0            ; 2C D0 6E | Test bits in accumulator (absolute)
    BCC $6D              ; 90 6D | Branch if carry clear
    PHX                  ; DA | Push X register to stack
    SBC $7D              ; E5 7D | Subtract with carry (zero page)
    ORA $0DAD            ; 0D AD 0D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C2
; Address: $DCA267
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C2:
    SBC $F535            ; ED 35 F5 | Subtract with carry (absolute)
    ADC $2F5D            ; 6D 5D 2F | Add with carry (absolute)
    CMP $5221,Y          ; D9 21 52 | Compare accumulator (absolute,Y)
    SEP #$35             ; E2 35 | Set processor status bits
    EOR $1D1A,X          ; 5D 1A 1D | Exclusive OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $A51A,X          ; 3D 1A A5 | Logical AND with accumulator (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    AND ($D8,X)          ; 21 D8 | Logical AND with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ADC ($05),Y          ; 71 05 | Add with carry ((zero page),Y)
    ORA $F7              ; 05 F7 | Logical OR with accumulator (zero page)
    ORA $7DEF            ; 0D EF 7D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C3
; Address: $DCA290
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C3:
    JSR $69D6            ; 20 D6 69 | Jump to subroutine
    BCC $6D              ; 90 6D | Branch if carry clear
    BMI $17              ; 30 17 | Branch if negative
    INX                  ; E8 | Increment X register
    BPL $05              ; 10 05 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROL $28              ; 26 28 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ASL $180D            ; 0E 0D 18 | Arithmetic shift left (absolute)
    ORA $1E18,X          ; 1D 18 1E | Logical OR with accumulator (absolute,X)
    ROL $143A,X          ; 3E 3A 14 | Rotate left (absolute,X)
    STZ $2A              ; 64 2A | Store zero to zero page
    ASL $0806            ; 0E 06 08 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    AND #$84             ; 29 84 | Logical AND with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    STX $68              ; 86 68 | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C4
; Address: $DCA2E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C4:
    JSL $17300D          ; 22 0D 30 17 | Jump to subroutine long
    ASL $0B08,X          ; 1E 08 0B | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C5
; Address: $DCA2F3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C5:
    ADC #$06             ; 69 06 | Add with carry (immediate)
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $F0              ; 10 F0 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    ASL $0D36            ; 0E 36 0D | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $E0              ; 10 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    BPL $64              ; 10 64 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $6DD0            ; 2E D0 6D | Rotate left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C6
; Address: $DCA31F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C6:
    JSL $7DE5FD          ; 22 FD E5 7D | Jump to subroutine long
    ORA $0DAD            ; 0D AD 0D | Logical OR with accumulator (absolute)
    SBC $F535            ; ED 35 F5 | Subtract with carry (absolute)
    EOR $DA29,X          ; 5D 29 DA | Exclusive OR with accumulator (absolute,X)
    AND ($56,X)          ; 21 56 | Logical AND with accumulator ((zero page,X))
    SEP #$35             ; E2 35 | Set processor status bits
    EOR $1D1A,X          ; 5D 1A 1D | Exclusive OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $A51A,X          ; 3D 1A A5 | Logical AND with accumulator (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C7
; Address: $DCA33C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C7:
    JSR $68DE            ; 20 DE 68 | Jump to subroutine
    AND ($0D),Y          ; 31 0D | Logical AND with accumulator ((zero page),Y)
    ORA $0D77            ; 0D 77 0D | Logical OR with accumulator (absolute)
    ORA $7D97,X          ; 1D 97 7D | Logical OR with accumulator (absolute,X)
    BPL $20              ; 10 20 | Branch if positive
    AND ($D0,X)          ; 21 D0 | Logical AND with accumulator ((zero page,X))
    ADC $92              ; 65 92 | Add with carry (zero page)
    BCS $97              ; B0 97 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C8
; Address: $DCA359
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C8:
    BCC $85              ; 90 85 | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$02             ; E0 02 | Compare X register (immediate)
    ASL $2739,X          ; 1E 39 27 | Arithmetic shift left (absolute,X)
    AND $2522            ; 2D 22 25 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0C9
; Address: $DCA368
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0C9:
    JSL $2D252E          ; 22 2E 25 2D | Jump to subroutine long
    AND $3D              ; 25 3D | Logical AND with accumulator (zero page)
    ASL $1C02,X          ; 1E 02 1C | Arithmetic shift left (absolute,X)
    AND $2D06,Y          ; 39 06 2D | Logical AND with accumulator (absolute,Y)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    ROL $2D11            ; 2E 11 2D | Rotate left (absolute)
    AND $1A03,X          ; 3D 03 1A | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0CA
; Address: $DCA385
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0CA:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $060A            ; 0E 0A 06 | Arithmetic shift left (absolute)
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0B              ; 10 0B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1F2A,X          ; 1E 2A 1F | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    STY $4C84            ; 8C 84 4C | Store Y register to absolute address
    JMP $E89460          ; 5C 60 94 E8 | Jump to address long
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    STY $7C70            ; 8C 70 7C | Store Y register to absolute address
    BRA $78              ; 80 78 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    CLV                  ; B8 | Clear overflow flag
    CPY #$F4             ; C0 F4 | Compare Y register (immediate)
    CPX $A4              ; E4 A4 | Compare X register (zero page)
    LDY $EC              ; A4 EC | Load from zero page into Y register
    CPX $C4C4            ; EC C4 C4 | Compare X register (absolute)
    LDX $26              ; A6 26 | Load from zero page into X register
    LDX $A4              ; A6 A4 | Load from zero page into X register
    BEQ $00              ; F0 00 | Branch if equal
    CPX $FC08            ; EC 08 FC | Compare X register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    DEC $6E7C,X          ; DE 7C 6E | Decrement (absolute,X)
    CPX $D27C            ; EC 7C D2 | Compare X register (absolute)
    BNE $B4              ; D0 B4 | Branch if not equal
    BCS $A4              ; B0 A4 | Branch if carry set
    INX                  ; E8 | Increment X register
    CPX $E8              ; E4 E8 | Compare X register (zero page)
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0CB
; Address: $DCA409
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0CB:
    CPX $F6              ; E4 F6 | Compare X register (zero page)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BCC $68              ; 90 68 | Branch if carry clear
    BCC $68              ; 90 68 | Branch if carry clear
    BCC $64              ; 90 64 | Branch if carry clear
    BRA $60              ; 80 60 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ASL $2739,X          ; 1E 39 27 | Arithmetic shift left (absolute,X)
    AND $2522            ; 2D 22 25 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0CD
; Address: $DCA42C
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0CD:
    JSL $1E1A3E          ; 22 3E 1A 1E | Jump to subroutine long
    AND $2D06,Y          ; 39 06 2D | Logical AND with accumulator (absolute,Y)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    AND $2D12            ; 2D 12 2D | Logical AND with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    ORA $3C19,Y          ; 19 19 3C | Logical OR with accumulator (absolute,Y)
    EOR $293F,Y          ; 59 3F 29 | Exclusive OR with accumulator (absolute,Y)
    ORA $0F13            ; 0D 13 0F | Logical OR with accumulator (absolute)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($0D),Y          ; 11 0D | Logical OR with accumulator ((zero page),Y)
    ORA #$4A             ; 09 4A | Logical OR with accumulator (immediate)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    STY $4C84            ; 8C 84 4C | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0CE
; Address: $DCA48C
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0CE:
    LDY $B4A0,X          ; BC A0 B4 | Load from absolute,X into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    STY $7C70            ; 8C 70 7C | Store Y register to absolute address
    BRA $B8              ; 80 B8 | Branch always
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $6C              ; 64 6C | Store zero to zero page
    JMP ($4444)          ; 6C 44 44 | Jump to address (absolute indirect)
    INC $66              ; E6 66 | Increment (zero page)
    ROR $A4              ; 66 A4 | Rotate right (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    JMP ($7C88)          ; 6C 88 7C | Jump to address (absolute indirect)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    LSR $6EBC,X          ; 5E BC 6E | Logical shift right (absolute,X)
    LDY $B072,X          ; BC 72 B0 | Load from absolute,X into Y register
    PEA #$6470           ; F4 70 64 | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    ROR                  ; 6A | Rotate right (accumulator)
    CPX $CC5A            ; EC 5A CC | Compare X register (absolute)
    ROR $50F0            ; 6E F0 50 | Rotate right (absolute)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    LDY $0878,X          ; BC 78 08 | Load from absolute,X into Y register
    BVC $A8              ; 50 A8 | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    AND $0E36,Y          ; 39 36 0E | Logical AND with accumulator (absolute,Y)
    ORA $0E09            ; 0D 09 0E | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ADC ($0E),Y          ; 71 0E | Add with carry ((zero page),Y)
    BMI $3F              ; 30 3F | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    ROR $344E,X          ; 7E 4E 34 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D0
; Address: $DCA51F
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D0:
    JSR $6798            ; 20 98 67 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    JMP $487F43          ; 5C 43 7F 48 | Jump to address long
    ROR $78              ; 66 78 | Rotate right (zero page)
    ASL $000F,X          ; 1E 0F 00 | Arithmetic shift left (absolute,X)
    ROR $3F01,X          ; 7E 01 3F | Rotate right (absolute,X)
    ASL $8000,X          ; 1E 00 80 | Arithmetic shift left (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    BVS $90              ; 70 90 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    DEX                  ; CA | Decrement X register
    BMI $80              ; 30 80 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    ASL $7E1C            ; 0E 1C 7E | Arithmetic shift left (absolute)
    BVS $3E              ; 70 3E | Branch if overflow set
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    CLC                  ; 18 | Clear carry flag
    BEQ $64              ; F0 64 | Branch if equal
    STA ($6C),Y          ; 91 6C | Update graphics data
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX $5C00            ; EC 00 5C | Compare X register (absolute)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    LDY $A6              ; A4 A6 | Load from zero page into Y register
    SEC                  ; 38 | Set carry flag
    WDM #$7C             ; 42 7C | Reserved instruction
    ROR $783C            ; 6E 3C 78 | Rotate right (absolute)
    DEY                  ; 88 | Decrement Y register
    BNE $40              ; D0 40 | Branch if not equal
    LDX $BC40,Y          ; BE 40 BC | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt
    BRA $FC              ; 80 FC | Branch always
    BRA $88              ; 80 88 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D2
; Address: $DCA5A2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D2:
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    AND $0E36,Y          ; 39 36 0E | Logical AND with accumulator (absolute,Y)
    ORA $0E09            ; 0D 09 0E | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ADC ($0E),Y          ; 71 0E | Add with carry ((zero page),Y)
    BMI $3F              ; 30 3F | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    ROR $344E,X          ; 7E 4E 34 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    PLY                  ; 7A | Pull Y register from stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D3
; Address: $DCA5DB
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D3:
    JSR $007F            ; 20 7F 00 | Jump to subroutine
    BVS $2F              ; 70 2F | Branch if overflow set
    JMP $477846          ; 5C 46 78 47 | Jump to address long
    BVC $6F              ; 50 6F | Branch if overflow clear
    JMP ($3E70)          ; 6C 70 3E | Jump to address (absolute indirect)
    AND ($1B),Y          ; 31 1B | Logical AND with accumulator ((zero page),Y)
    LDA                  ; BF 00 7F 00 | Read graphics status
    ROR $7F01,X          ; 7E 01 7F | Rotate right (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    BVS $90              ; 70 90 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $80              ; 30 80 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $02              ; F0 02 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $02              ; F0 02 | Branch if equal
    INX                  ; E8 | Increment X register
    ASL $7E1C            ; 0E 1C 7E | Arithmetic shift left (absolute)
    BVS $3E              ; 70 3E | Branch if overflow set
    CPY $FE              ; C4 FE | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D4
; Address: $DCA62A
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D4:
    INC $70              ; E6 70 | Increment (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $11              ; 64 11 | Store zero to zero page
    CPX $00E0            ; EC E0 00 | Compare X register (absolute)
    CPX $5C00            ; EC 00 5C | Compare X register (absolute)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    PEA #$FE08           ; F4 08 FE | Push effective address to stack
    ADC ($AE),Y          ; 71 AE | Add with carry ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    LSR $78              ; 46 78 | Logical shift right (zero page)
    INC $9A3C            ; EE 3C 9A | Increment (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $70              ; F0 70 | Branch if equal
    LDX $7C40,Y          ; BE 40 7C | Load from absolute,Y into X register
    BRA $FC              ; 80 FC | Branch always
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    CPY $63B0            ; CC B0 63 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $2C              ; 05 2C | Logical OR with accumulator (zero page)
    ROL $003C            ; 2E 3C 00 | Rotate left (absolute)
    BPL $07              ; 10 07 | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ROL $3111            ; 2E 11 31 | Rotate left (absolute)
    BVS $6F              ; 70 6F | Branch if overflow set
    ADC $3C43,Y          ; 79 43 3C | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D5
; Address: $DCA689
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D5:
    JSR $4C7F            ; 20 7F 4C | Jump to subroutine
    XBA                  ; EB | Exchange accumulator bytes
    STX $C9              ; 86 C9 | Store X register to zero page
    ROL $2C00            ; 2E 00 2C | Rotate left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D6
; Address: $DCA696
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D6:
    JMP ($2E00)          ; 6C 00 2E | Jump to address (absolute indirect)
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    BPL $CA              ; 10 CA | Branch if positive
    PLB                  ; AB | Pull data bank register from stack
    CPY $B9              ; C4 B9 | Compare Y register (zero page)
    CMP $5D              ; C5 5D | Compare accumulator (zero page)
    ADC #$7A             ; 69 7A | Add with carry (immediate)
    ROR $B563,X          ; 7E 63 B5 | Rotate right (absolute,X)
    DEC $787F            ; CE 7F 78 | Decrement (absolute)
    SBC $6D02            ; ED 02 6D | Subtract with carry (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D7
; Address: $DCA6BC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D7:
    INC $7800            ; EE 00 78 | Increment (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$20             ; A0 20 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0D8
; Address: $DCA6CA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0D8:
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BVS $90              ; 70 90 | Branch if overflow set
    BMI $70              ; 30 70 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BVC $80              ; 50 80 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0DA
; Address: $DCA6E6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0DA:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    BVC $88              ; 50 88 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    SEP #$10             ; E2 10 | Set processor status bits
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0DB
; Address: $DCA6F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0DB:
    JSR $50F0            ; 20 F0 50 | Jump to subroutine
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$4C             ; E0 4C | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0DD
; Address: $DCA700
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0DD:
    JSL $BA76FC          ; 22 FC 76 BA | Jump to subroutine long
    STZ $9070            ; 9C 70 90 | Store zero to absolute
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    BCS $90              ; B0 90 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    BCC $C0              ; 90 C0 | Branch if carry clear
    CPY $63B0            ; CC B0 63 | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $1012,Y          ; 19 12 10 | Logical OR with accumulator (absolute,Y)
    ORA ($21),Y          ; 11 21 | PPU graphics register access
    AND ($3C),Y          ; 31 3C | Logical AND with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    AND ($3B),Y          ; 31 3B | Logical AND with accumulator ((zero page),Y)
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    ADC $3C43,X          ; 7D 43 3C | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0DE
; Address: $DCA749
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0DE:
    BMI $3F              ; 30 3F | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    CMP $3AA3,Y          ; D9 A3 3A | Compare accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    DEC                  ; 3A | Decrement accumulator
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    LDA #$93             ; A9 93 | Read graphics status
    CPX $D0AB            ; EC AB D0 | Compare X register (absolute)
    LSR $BD68,X          ; 5E 68 BD | Logical shift right (absolute,X)
    SBC ($BD),Y          ; F1 BD | Subtract with carry ((zero page),Y)
    SBC ($EE),Y          ; F1 EE | Subtract with carry ((zero page),Y)
    STA ($FD),Y          ; 91 FD | Update graphics data
    CPY #$E1             ; C0 E1 | Compare Y register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    SBC $F102,Y          ; F9 02 F1 | Subtract with carry (absolute,Y)
    CPY #$0A             ; C0 0A | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BVS $90              ; 70 90 | Branch if overflow set
    BMI $70              ; 30 70 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BVC $80              ; 50 80 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E0
; Address: $DCA7A6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E0:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    BVC $88              ; 50 88 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E1
; Address: $DCA7B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E1:
    JSR $50F0            ; 20 F0 50 | Jump to subroutine
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$4C             ; E0 4C | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E2
; Address: $DCA7BE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E2:
    BCC $08              ; 90 08 | Branch if carry clear
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    JMP ($B8B4)          ; 6C B4 B8 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E3
; Address: $DCA7C5
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E3:
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $90              ; F0 90 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$F800           ; F4 00 F8 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    BPL $18              ; 10 18 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    CPX #$21             ; E0 21 | PPU graphics register access
    JMP $1140            ; 4C 40 11 | Jump to address
    ROR $2D              ; 66 2D | Rotate right (zero page)
    BVS $06              ; 70 06 | Branch if overflow set
    ADC $E621,Y          ; 79 21 E6 | Add with carry (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $AD              ; 80 AD | Branch always
    PLP                  ; 28 | Pull processor status from stack
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    AND ($07,X)          ; 21 07 | Logical AND with accumulator ((zero page,X))
    LDX #$1B             ; A2 1B | Load immediate value into X register
    SED                  ; F8 | Set decimal mode flag
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LDX $F565,Y          ; BE 65 F5 | Load from absolute,Y into X register
    STZ $BEE2            ; 9C E2 BE | Store zero to absolute
    ADC $6C3B            ; 6D 3B 6C | Add with carry (absolute)
    EOR $0F1E,Y          ; 59 1E 0F | Exclusive OR with accumulator (absolute,Y)
    ASL $000F            ; 0E 0F 00 | Arithmetic shift left (absolute)
    STA $BE02,X          ; 9D 02 BE | Update graphics data
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ASL $F000            ; 0E 00 F0 | Arithmetic shift left (absolute)
    BEQ $6E              ; F0 6E | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E4
; Address: $DCA843
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E4:
    ASL $3EC2,X          ; 1E C2 3E | Arithmetic shift left (absolute,X)
    STY $7074            ; 8C 74 70 | Store Y register to absolute address
    BRA $90              ; 80 90 | Branch always
    BVS $08              ; 70 08 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    BEQ $00              ; F0 00 | Branch if equal
    ROR $FE80,X          ; 7E 80 FE | Rotate right (absolute,X)
    PEA #$C000           ; F4 00 C0 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STY $30              ; 84 30 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    STZ $B4              ; 64 B4 | Store zero to zero page
    ASL $3C60            ; 0E 60 3C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E5
; Address: $DCA867
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E5:
    JSR $9A96            ; 20 96 9A | Jump to subroutine
    EOR $354B            ; 4D 4B 35 | Exclusive OR with accumulator (absolute)
    STA $FE              ; 85 FE | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E6
; Address: $DCA875
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E6:
    BRA $18              ; 80 18 | Branch always
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $FE              ; 80 FE | Branch always
    DEC $1CE6,X          ; DE E6 1C | Decrement (absolute,X)
    WDM #$3E             ; 42 3E | Reserved instruction
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    ASL $24BC            ; 0E BC 24 | Arithmetic shift left (absolute)
    SBC $7E00,X          ; FD 00 7E | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    CPY #$8E             ; C0 8E | Compare Y register (immediate)
    BIT $60              ; 24 60 | Test bits in accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    BPL $18              ; 10 18 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    CPX $17              ; E4 17 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($66),Y          ; 11 66 | Logical OR with accumulator ((zero page),Y)
    AND $0670            ; 2D 70 06 | Logical AND with accumulator (absolute)
    BIT $E9              ; 24 E9 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E7
; Address: $DCA8C9
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E7:
    STA ($96,X)          ; 81 96 | Update graphics data
    LDX $20              ; A6 20 | Load from zero page into X register
    LDA $2863,X          ; BD 63 28 | Read graphics status
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    LDA ($17,X)          ; A1 17 | Read graphics status
    EOR #$0F             ; 49 0F | Exclusive OR with accumulator (immediate)
    CPX $E595            ; EC 95 E5 | Compare X register (absolute)
    LDY $3E42,X          ; BC 42 3E | Load from absolute,X into Y register
    EOR $6C3B            ; 4D 3B 6C | Exclusive OR with accumulator (absolute)
    BPL $0D              ; 10 0D | Branch if positive
    STA $BD02,X          ; 9D 02 BD | Update graphics data
    ROL $3F01,X          ; 3E 01 3F | Rotate left (absolute,X)
    ROL $1101,X          ; 3E 01 11 | Rotate left (absolute,X)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    BEQ $6E              ; F0 6E | Branch if equal
    ASL $3EC2,X          ; 1E C2 3E | Arithmetic shift left (absolute,X)
    STY $7074            ; 8C 74 70 | Store Y register to absolute address
    BRA $90              ; 80 90 | Branch always
    BVS $08              ; 70 08 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    BEQ $00              ; F0 00 | Branch if equal
    ROR $FE80,X          ; 7E 80 FE | Rotate right (absolute,X)
    PEA #$C000           ; F4 00 C0 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STY $30              ; 84 30 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    STZ $B4              ; 64 B4 | Store zero to zero page
    ASL $3C60            ; 0E 60 3C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E8
; Address: $DCA927
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E8:
    JSR $849C            ; 20 9C 84 | Jump to subroutine
    ROR $465A            ; 6E 5A 46 | Rotate right (absolute)
    DEC                  ; 3A | Decrement accumulator
    PHB                  ; 8B | Push data bank register to stack
    SBC ($14),Y          ; F1 14 | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0E9
; Address: $DCA935
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0E9:
    BRA $18              ; 80 18 | Branch always
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    CPX #$5E             ; E0 5E | Compare X register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    INC $C610            ; EE 10 C6 | Increment (absolute)
    PLX                  ; FA | Pull X register from stack
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    ASL $3ECE,X          ; 1E CE 3E | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0EA
; Address: $DCA950
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0EA:
    BEQ $04              ; F0 04 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ROR $FE80,X          ; 7E 80 FE | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $4C09            ; 0E 09 4C | Arithmetic shift left (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    SEP #$07             ; E2 07 | Set processor status bits
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    ORA #$54             ; 09 54 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0EC
; Address: $DCA98D
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0EC:
    JSL $086897          ; 22 97 68 08 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0F14            ; 0E 14 0F | Arithmetic shift left (absolute)
    DEC                  ; 3A | Decrement accumulator
    CLD                  ; D8 | Clear decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $09              ; 46 09 | Logical shift right (zero page)
    LDY $9F              ; A4 9F | Load from zero page into Y register
    DEC $5EBD            ; CE BD 5E | Decrement (absolute)
    AND $296E,Y          ; 39 6E 29 | Logical AND with accumulator (absolute,Y)
    ORA $DF09            ; 0D 09 DF | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 3F 00 | Read graphics status
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    ORA $3EC6            ; 0D C6 3E | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    BMI $3F              ; 30 3F | Branch if negative
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $8C              ; 80 8C | Branch always
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    ASL $9EFE            ; 0E FE 9E | Arithmetic shift left (absolute)
    REP #$3C             ; C2 3C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0ED
; Address: $DCA9EA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0ED:
    INC $DB32,X          ; FE 32 DB | Increment (absolute,X)
    ADC ($93,X)          ; 61 93 | Add with carry ((zero page,X))
    SBC $7C              ; E5 7C | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0EE
; Address: $DCA9F3
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0EE:
    JSR $000E            ; 20 0E 00 | Jump to subroutine
    ROL $7C00,X          ; 3E 00 7C | Rotate left (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    SBC ($08,X)          ; E1 08 | Subtract with carry ((zero page,X))
    LDA $23DD            ; AD DD 23 | Read graphics status
    STA $BAA3,X          ; 9D A3 BA | Update graphics data
    LSR $7ECE,X          ; 5E CE 7E | Logical shift right (absolute,X)
    DEC $73AD            ; CE AD 73 | Decrement (absolute)
    INC $E13E,X          ; FE 3E E1 | Increment (absolute,X)
    LDA                  ; BF 40 BE 40 | Read graphics status
    DEC $FE20,X          ; DE 20 FE | Decrement (absolute,X)
    ROL $0080,X          ; 3E 80 00 | Rotate left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $0C09            ; 0E 09 0C | Arithmetic shift left (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0EF
; Address: $DCAA39
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0EF:
    JSL $0F7007          ; 22 07 70 0F | Jump to subroutine long
    BVS $0A              ; 70 0A | Branch if overflow set
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    ORA #$24             ; 09 24 | Logical OR with accumulator (immediate)
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    WDM #$47             ; 42 47 | Reserved instruction
    BPL $08              ; 10 08 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0F04            ; 0E 04 0F | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F0
; Address: $DCAA5F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F0:
    JSR $374C            ; 20 4C 37 | Jump to subroutine
    EOR $5A7D            ; 4D 7D 5A | Exclusive OR with accumulator (absolute)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA $1936,Y          ; 19 36 19 | Logical OR with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    ORA $0707,X          ; 1D 07 07 | Logical OR with accumulator (absolute,X)
    ORA $3EC6            ; 0D C6 3E | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    BMI $3F              ; 30 3F | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F1
; Address: $DCAA95
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F1:
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $8C              ; 80 8C | Branch always
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    ASL $9EFE            ; 0E FE 9E | Arithmetic shift left (absolute)
    REP #$7C             ; C2 7C | Reset processor status bits
    ROR                  ; 6A | Rotate right (accumulator)
    PLB                  ; AB | Pull data bank register from stack
    CMP $7C              ; C5 7C | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F2
; Address: $DCAAB3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F2:
    JSR $000E            ; 20 0E 00 | Jump to subroutine
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    BRA $7C              ; 80 7C | Branch always
    INC $DF00,X          ; FE 00 DF | Increment (absolute,X)
    CMP #$37             ; C9 37 | Compare accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    LDA $BD8F,X          ; BD 8F BD | Read graphics status
    STA $BF8977          ; 8F 77 89 BF | Update graphics data

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F3
; Address: $DCAAD1
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F3:
    JSR $0087            ; 20 87 00 | Jump to subroutine
    ROR $BF80,X          ; 7E 80 BF | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 8F 00 | Read graphics status
    BVS $01              ; 70 01 | Branch if overflow set
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BPL $72              ; 10 72 | Branch if positive
    ORA $0235            ; 0D 35 02 | Logical OR with accumulator (absolute)
    BPL $0B              ; 10 0B | Branch if positive
    SEC                  ; 38 | Set carry flag
    BIT $0363            ; 2C 63 03 | Test bits in accumulator (absolute)
    BVS $30              ; 70 30 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    CMP $0D              ; C5 0D | Compare accumulator (zero page)
    AND $0D3F            ; 2D 3F 0D | Logical AND with accumulator (absolute)
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    ORA $3F40            ; 0D 40 3F | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F4
; Address: $DCAB4C
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F4:
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    DEC $0030,X          ; DE 30 00 | Decrement (absolute,X)
    BRA $30              ; 80 30 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    PEA #$AE08           ; F4 08 AE | Push effective address to stack
    BVC $64              ; 50 64 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    BNE $1E              ; D0 1E | Branch if not equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $FC0C            ; 0E 0C FC | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    XBA                  ; EB | Exchange accumulator bytes
    CPX #$D3             ; E0 D3 | Compare X register (immediate)
    BEQ $3C              ; F0 3C | Branch if equal
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    INC $BE1F,X          ; FE 1F BE | Increment (absolute,X)
    ASL $F818            ; 0E 18 F8 | Arithmetic shift left (absolute)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $F608,X          ; FE 08 F6 | Increment (absolute,X)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BPL $72              ; 10 72 | Branch if positive
    ORA $0235            ; 0D 35 02 | Logical OR with accumulator (absolute)
    BPL $0B              ; 10 0B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BVS $30              ; 70 30 | Branch if overflow set
    BMI $0F              ; 30 0F | Branch if negative
    JMP $6F03            ; 4C 03 6F | Jump to address
    LDX #$7F             ; A2 7F | Load immediate value into X register
    INC $77              ; E6 77 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F5
; Address: $DCABEB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F5:
    PHP                  ; 08 | Push processor status to stack
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F6
; Address: $DCABFB
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F6:
    CLC                  ; 18 | Clear carry flag
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    DEC $0030,X          ; DE 30 00 | Decrement (absolute,X)
    BRA $30              ; 80 30 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    PEA #$AE08           ; F4 08 AE | Push effective address to stack
    BVC $64              ; 50 64 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BNE $1C              ; D0 1C | Branch if not equal
    BVS $CE              ; 70 CE | Branch if overflow set
    CPY $E0              ; C4 E0 | Game work RAM access
    ASL $FC0C            ; 0E 0C FC | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CPX $D3              ; E4 D3 | Compare X register (zero page)
    BMI $C0              ; 30 C0 | Branch if negative
    BCS $B0              ; B0 B0 | Branch if carry set
    JMP ($76FC)          ; 6C FC 76 | Jump to address (absolute indirect)
    LSR $A80E,X          ; 5E 0E A8 | Logical shift right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    JMP $02B0            ; 4C B0 02 | Jump to address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F7
; Address: $DCAC58
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F7:
    JSR $10DE            ; 20 DE 10 | Jump to subroutine
    INX                  ; E8 | Increment X register
    BRA $00              ; 80 00 | Branch always
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA $190E            ; 0D 0E 19 | Logical OR with accumulator (absolute)
    ASL $0F1F,X          ; 1E 1F 0F | Arithmetic shift left (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $3A              ; 05 3A | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    ASL $0F0F,X          ; 1E 0F 0F | Arithmetic shift left (absolute,X)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $1514            ; 0D 14 15 | Logical OR with accumulator (absolute)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0F9
; Address: $DCACA9
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0F9:
    SEC                  ; 38 | Set carry flag
    LSR $F939,X          ; 5E 39 F9 | Logical shift right (absolute,X)
    ASL $0609            ; 0E 09 06 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BNE $B0              ; D0 B0 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0FB
; Address: $DCACD7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0FB:
    BRA $F0              ; 80 F0 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0FC
; Address: $DCACE2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0FC:
    JSR $08D0            ; 20 D0 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $94              ; B0 94 | Branch if carry set
    CPX #$56             ; E0 56 | Compare X register (immediate)
    BVC $3C              ; 50 3C | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0FD
; Address: $DCACED
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0FD:
    JSR $5024            ; 20 24 50 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BRA $20              ; 80 20 | Branch always
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $40              ; 10 40 | Branch if positive
    LDY #$80             ; A0 80 | Load immediate value into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0FE
; Address: $DCAD04
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0FE:
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    STY $DC24            ; 8C 24 DC | Store Y register to absolute address
    PLX                  ; FA | Pull X register from stack
    ASL $BC              ; 06 BC | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BRA $20              ; 80 20 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $3E10            ; EC 10 3E | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_0FF
; Address: $DCAD1F
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_0FF:
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    ORA $190E            ; 0D 0E 19 | Logical OR with accumulator (absolute)
    ASL $0F1F,X          ; 1E 1F 0F | Arithmetic shift left (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $3A              ; 05 3A | Logical OR with accumulator (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    ASL $0F0F,X          ; 1E 0F 0F | Arithmetic shift left (absolute,X)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    ADC $3C              ; 65 3C | Add with carry (zero page)
    ADC $FA3A            ; 6D 3A FA | Add with carry (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    BVS $0F              ; 70 0F | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BNE $B0              ; D0 B0 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_101
; Address: $DCAD97
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_101:
    BRA $F0              ; 80 F0 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_102
; Address: $DCADA2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_102:
    JSR $08D0            ; 20 D0 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $90              ; B0 90 | Branch if carry set
    CPX #$54             ; E0 54 | Compare X register (immediate)
    BVC $36              ; 50 36 | Branch if overflow clear
    BMI $1C              ; 30 1C | Branch if negative
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    PHA                  ; 48 | Push accumulator to stack
    BCS $A0              ; B0 A0 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BCC $B4              ; 90 B4 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_104
; Address: $DCADC8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_104:
    LDY $8C44,X          ; BC 44 8C | Load from absolute,X into Y register
    ROR $EE82,X          ; 7E 82 EE | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_105
; Address: $DCADD1
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_105:
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX $8E10            ; EC 10 8E | Compare X register (absolute)
    BMI $01              ; 30 01 | Branch if negative
    ASL $1A0C            ; 0E 0C 1A | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    ORA $0570            ; 0D 70 05 | Logical OR with accumulator (absolute)
    BMI $06              ; 30 06 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $031E,X          ; 1E 1E 03 | Arithmetic shift left (absolute,X)
    ORA $0C0C,Y          ; 19 0C 0C | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    BMI $18              ; 30 18 | Branch if negative
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_107
; Address: $DCAE25
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_107:
    JSR $0877            ; 20 77 08 | Jump to subroutine
    AND $1F1F,Y          ; 39 1F 1F | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_109
; Address: $DCAE35
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_109:
    JSR $000F            ; 20 0F 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $50              ; D0 50 | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $0CA0            ; 0E A0 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_10A
; Address: $DCAE67
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_10A:
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BNE $7C              ; D0 7C | Branch if not equal
    BVS $B8              ; 70 B8 | Branch if overflow set
    BRA $CC              ; 80 CC | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    JMP $08180C          ; 5C 0C 18 08 | Jump to address long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_10B
; Address: $DCAE78
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_10B:
    JSR $8013            ; 20 13 80 | Jump to subroutine
    LSR $80              ; 46 80 | Logical shift right (zero page)
    BMI $D8              ; 30 D8 | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    STY $B644            ; 8C 44 B6 | Store Y register to absolute address
    BIT $D6              ; 24 D6 | Test bits in accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $E8EC            ; 9C EC E8 | Store zero to absolute
    CLC                  ; 18 | Clear carry flag
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BMI $C2              ; 30 C2 | Branch if negative
    SBC $B906,Y          ; F9 06 B9 | Subtract with carry (absolute,Y)
    LSR $FD              ; 46 FD | Logical shift right (zero page)
    INC $1800,X          ; FE 00 18 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1A0C            ; 0E 0C 1A | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    ORA $0570            ; 0D 70 05 | Logical OR with accumulator (absolute)
    BMI $06              ; 30 06 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ASL $031E,X          ; 1E 1E 03 | Arithmetic shift left (absolute,X)
    ORA $0C30,X          ; 1D 30 0C | Logical OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    BMI $18              ; 30 18 | Branch if negative
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    AND ($1C,X)          ; 21 1C | Logical AND with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    BIT $16              ; 24 16 | Test bits in accumulator (zero page)
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    LSR $59              ; 46 59 | Logical shift right (zero page)
    AND $1F37,Y          ; 39 37 1F | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ADC ($0C,X)          ; 61 0C | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_10C
; Address: $DCAEF6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_10C:
    ORA $BF02,X          ; 1D 02 BF | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $50              ; D0 50 | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $0CA0            ; 0E A0 0C | Arithmetic shift left (absolute)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BNE $78              ; D0 78 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_10D
; Address: $DCAF2C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_10D:
    BEQ $80              ; F0 80 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    PLP                  ; 28 | Pull processor status from stack
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    JMP $08180C          ; 5C 0C 18 08 | Jump to address long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_10E
; Address: $DCAF38
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_10E:
    JSR $8016            ; 20 16 80 | Jump to subroutine
    ROL $0C              ; 26 0C | Rotate left (zero page)
    BRA $04              ; 80 04 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_10F
; Address: $DCAF40
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_10F:
    BCS $60              ; B0 60 | Branch if carry set
    PLA                  ; 68 | Pull accumulator from stack
    STY $36C4            ; 8C C4 36 | Store Y register to absolute address
    LDY $56              ; A4 56 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_110
; Address: $DCAF49
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_110:
    JSL $F89C6C          ; 22 6C 9C F8 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_112
; Address: $DCAF59
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_112:
    JSL $F800FE          ; 22 FE 00 F8 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA $0C1A            ; 0D 1A 0C | Logical OR with accumulator (absolute)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0701            ; 0E 01 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_113
; Address: $DCAF84
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_113:
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    EOR #$07             ; 49 07 | Exclusive OR with accumulator (immediate)
    ROR $3C0A            ; 6E 0A 3C | Rotate right (absolute)
    STZ $4A              ; 64 4A | Store zero to zero page
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    REP #$00             ; C2 00 | Reset processor status bits
    BRA $11              ; 80 11 | Branch always
    PHP                  ; 08 | Push processor status to stack
    EOR $01              ; 45 01 | Exclusive OR with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    BIT $1C1D            ; 2C 1D 1C | Test bits in accumulator (absolute)
    ASL $15              ; 06 15 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ROL $2431            ; 2E 31 24 | Rotate left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_114
; Address: $DCAFAE
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_114:
    AND $0230,X          ; 3D 30 02 | Logical AND with accumulator (absolute,X)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BMI $03              ; 30 03 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BVC $A0              ; 50 A0 | Branch if overflow clear
    JMP $5028A0          ; 5C A0 28 50 | Jump to address long
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $70              ; F0 70 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_116
; Address: $DCB002
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_116:
    JSR $28B0            ; 20 B0 28 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$30             ; A0 30 | Load immediate value into Y register
    PLY                  ; 7A | Pull Y register from stack
    STZ $6E9F            ; 9C 9F 6E | Store zero to absolute
    INC $9070,X          ; FE 70 90 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_117
; Address: $DCB012
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_117:
    INY                  ; C8 | Increment Y register
    BMI $C4              ; 30 C4 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_119
; Address: $DCB01D
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_119:
    ASL $0070            ; 0E 70 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA $0C1A            ; 0D 1A 0C | Logical OR with accumulator (absolute)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0701            ; 0E 01 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    LSR $6C0A            ; 4E 0A 6C | Logical shift right (absolute)
    SEC                  ; 38 | Set carry flag
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA $4205            ; 0D 05 42 | Hardware register operation
    STZ $49              ; 64 49 | Store zero to zero page
    AND $1C1F            ; 2D 1F 1C | Logical AND with accumulator (absolute)
    ORA $3D12,X          ; 1D 12 3D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_11A
; Address: $DCB069
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_11A:
    JSL $7E2E31          ; 22 31 2E 7E | Jump to subroutine long
    EOR ($77,X)          ; 41 77 | Exclusive OR with accumulator ((zero page,X))
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    INC                  ; 1A | Increment accumulator
    ROL $3700,X          ; 3E 00 37 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_11B
; Address: $DCB086
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_11B:
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    BCS $70              ; B0 70 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BVC $A0              ; 50 A0 | Branch if overflow clear
    JMP $5028A0          ; 5C A0 28 50 | Jump to address long
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $70              ; F0 70 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_11C
; Address: $DCB0C2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_11C:
    JSR $2030            ; 20 30 20 | Jump to subroutine
    LDY #$A8             ; A0 A8 | Load immediate value into Y register
    PLP                  ; 28 | Pull processor status from stack
    LDX $3C              ; A6 3C | Load from zero page into X register
    JMP $FEAE5F          ; 5C 5F AE FE | Jump to address long
    BEQ $90              ; F0 90 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_11D
; Address: $DCB0D2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_11D:
    INY                  ; C8 | Increment Y register
    BMI $C8              ; 30 C8 | Branch if negative
    BMI $C4              ; 30 C4 | Branch if negative
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ORA $1F01,X          ; 1D 01 1F | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0F01            ; 0E 01 0F | Arithmetic shift left (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BPL $2E              ; 10 2E | Branch if positive
    BPL $3D              ; 10 3D | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    WDM #$DD             ; 42 DD | Reserved instruction

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_11F
; Address: $DCB110
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_11F:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ROR $BE02,X          ; 7E 02 BE | Rotate right (absolute,X)
    STA ($2E),Y          ; 91 2E | Update graphics data
    ADC #$18             ; 69 18 | Add with carry (immediate)
    EOR $6C62,X          ; 5D 62 6C | Exclusive OR with accumulator (absolute,X)
    AND ($1E),Y          ; 31 1E | Logical AND with accumulator ((zero page),Y)
    ORA $000F            ; 0D 0F 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1840            ; 0E 40 18 | Arithmetic shift left (absolute)
    ASL $007E            ; 0E 7E 00 | Arithmetic shift left (absolute)
    BPL $01              ; 10 01 | Branch if positive
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $D8              ; 10 D8 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_120
; Address: $DCB156
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_120:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BVS $40              ; 70 40 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    STY $52FE            ; 8C FE 52 | Store Y register to absolute address
    CPY $BA40            ; CC 40 BA | Compare Y register (absolute)
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    STY $80              ; 84 80 | Store Y register to zero page
    LSR $40              ; 46 40 | Logical shift right (zero page)
    ROR $7D40,X          ; 7E 40 7D | Rotate right (absolute,X)
    ROL $3000,X          ; 3E 00 30 | Rotate left (absolute,X)
    INC $8C18            ; EE 18 8C | Increment (absolute)
    STZ $48B4,X          ; 9E B4 48 | Store zero to absolute,X
    STY $1868            ; 8C 68 18 | Store Y register to absolute address
    BPL $B8              ; 10 B8 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_121
; Address: $DCB18F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_121:
    JSR $0078            ; 20 78 00 | Jump to subroutine
    BVS $FE              ; 70 FE | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_123
; Address: $DCB1AC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_123:
    ORA $1F01,X          ; 1D 01 1F | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0F01            ; 0E 01 0F | Arithmetic shift left (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BPL $2E              ; 10 2E | Branch if positive
    BMI $7D              ; 30 7D | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    EOR $9F40,X          ; 5D 40 9F | Exclusive OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_125
; Address: $DCB1D4
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_125:
    JSR $6001            ; 20 01 60 | Jump to subroutine
    ROR $BE02,X          ; 7E 02 BE | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    AND ($20),Y          ; 31 20 | Logical AND with accumulator ((zero page),Y)
    LSR $79              ; 46 79 | Logical shift right (zero page)
    AND $3112            ; 2D 12 31 | Logical AND with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $0F0F,X          ; 1D 0F 0F | Logical OR with accumulator (absolute,X)
    ASL $3000,X          ; 1E 00 30 | Arithmetic shift left (absolute,X)
    ASL $007F            ; 0E 7F 00 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $D8              ; 10 D8 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_126
; Address: $DCB216
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_126:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BVS $40              ; 70 40 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    DEC $BB42            ; CE 42 BB | Decrement (absolute)
    STY $21              ; 84 21 | PPU graphics register access
    PHX                  ; DA | Push X register to stack
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    ROR $7D40,X          ; 7E 40 7D | Rotate right (absolute,X)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_127
; Address: $DCB240
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_127:
    BIT #$74             ; 89 74 | Test bits in accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    TSX                  ; BA | Transfer stack pointer to X register
    LSR $36              ; 46 36 | Logical shift right (zero page)
    CPY $788C            ; CC 8C 78 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    BVS $02              ; 70 02 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    BVS $7E              ; 70 7E | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BRA $B0              ; 80 B0 | Branch always
    ASL $1F02            ; 0E 02 1F | Arithmetic shift left (absolute)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ROL $7712            ; 2E 12 77 | Rotate left (absolute)
    ORA #$6E             ; 09 6E | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CMP ($10),Y          ; D1 10 | Compare accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    LDY #$1E             ; A0 1E | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $19              ; 26 19 | Rotate left (zero page)
    BIT $1C13            ; 2C 13 1C | Test bits in accumulator (absolute)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BRA $9C              ; 80 9C | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_129
; Address: $DCB2D9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_129:
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    BPL $E8              ; 10 E8 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $08              ; F0 08 | Branch if equal
    BVS $30              ; 70 30 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_12A
; Address: $DCB2EE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_12A:
    STY $0478            ; 8C 78 04 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_12C
; Address: $DCB300
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_12C:
    JSL $04E2C0          ; 22 C0 E2 04 | Jump to subroutine long
    LDY $4830            ; AC 30 48 | Load from absolute address into Y register
    LDY #$64             ; A0 64 | Load immediate value into Y register
    BCC $38              ; 90 38 | Branch if carry clear
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $E8              ; 80 E8 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    BPL $30              ; 10 30 | Branch if positive
    BVS $E0              ; 70 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_12D
; Address: $DCB31C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_12D:
    JSR $8080            ; 20 80 80 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $1F02            ; 0E 02 1F | Arithmetic shift left (absolute)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ROL $3712            ; 2E 12 37 | Rotate left (absolute)
    ORA #$66             ; 09 66 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CMP $D410,Y          ; D9 10 D4 | Compare accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $4800,Y          ; 19 00 48 | Logical OR with accumulator (absolute,Y)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_12E
; Address: $DCB364
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_12E:
    ASL $2F13,X          ; 1E 13 2F | Arithmetic shift left (absolute,X)
    BMI $39              ; 30 39 | Branch if negative
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    ORA $1D              ; 05 1D | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BRA $9C              ; 80 9C | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_12F
; Address: $DCB38E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_12F:
    STZ $00F0            ; 9C F0 00 | Store zero to absolute
    BMI $40              ; 30 40 | Branch if negative
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CLD                  ; D8 | Clear decimal mode flag
    BPL $E8              ; 10 E8 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $08              ; F0 08 | Branch if equal
    BVS $30              ; 70 30 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_130
; Address: $DCB3AE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_130:
    BRA $70              ; 80 70 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $C8              ; 10 C8 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_131
; Address: $DCB3C1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_131:
    JSR $8028            ; 20 28 80 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BNE $C8              ; D0 C8 | Branch if not equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_134
; Address: $DCB3D0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_134:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BVC $10              ; 50 10 | Branch if overflow clear
    BPL $20              ; 10 20 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    ORA $1F01,X          ; 1D 01 1F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_135
; Address: $DCB3EB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_135:
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA $3530,X          ; 1D 30 35 | Logical OR with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LSR $83B8            ; 4E B8 83 | Logical shift right (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    DEC $9C              ; C6 9C | Decrement (zero page)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_136
; Address: $DCB410
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_136:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_137
; Address: $DCB417
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_137:
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 06 7F 03 | Read graphics status
    ASL $7003,X          ; 1E 03 70 | Arithmetic shift left (absolute,X)
    ASL $2330,X          ; 1E 30 23 | Arithmetic shift left (absolute,X)
    JMP $2471            ; 4C 71 24 | Jump to address
    ORA $1730,Y          ; 19 30 17 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ORA $0B0F,X          ; 1D 0F 0B | Logical OR with accumulator (absolute,X)
    ASL $3303,X          ; 1E 03 33 | Arithmetic shift left (absolute,X)
    ORA $1702,X          ; 1D 02 17 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_139
; Address: $DCB456
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_139:
    JSR $4060            ; 20 60 40 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    BNE $5C              ; D0 5C | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    TAY                  ; A8 | Transfer accumulator to Y register
    PEA #$C21E           ; F4 1E C2 | Push effective address to stack
    DEC $29              ; C6 29 | Decrement (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    ROL $FD00            ; 2E 00 FD | Rotate left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_13B
; Address: $DCB47D
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_13B:
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    REP #$89             ; C2 89 | Reset processor status bits
    INY                  ; C8 | Increment Y register
    DEC                  ; 3A | Decrement accumulator
    STX $1E              ; 86 1E | Store X register to zero page
    LDY $0C              ; A4 0C | Load from zero page into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    BEQ $C0              ; F0 C0 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CPY #$BC             ; C0 BC | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BRA $B0              ; 80 B0 | Branch always
    ORA $1F01,X          ; 1D 01 1F | Logical OR with accumulator (absolute,X)
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA $1530,X          ; 1D 30 15 | Logical OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    ROL $4378            ; 2E 78 43 | Rotate left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    DEC $EC              ; C6 EC | Decrement (zero page)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_13D
; Address: $DCB4D6
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_13D:
    JSR $7401            ; 20 01 74 | Jump to subroutine
    LDA                  ; BF 06 1F 03 | Read graphics status
    ASL $9043            ; 0E 43 90 | Arithmetic shift left (absolute)
    ROR $1368            ; 6E 68 13 | Rotate right (absolute)
    JMP $257861          ; 5C 61 78 25 | Jump to address long
    BMI $1F              ; 30 1F | Branch if negative
    ORA $000F            ; 0D 0F 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1B03            ; 0E 03 1B | Arithmetic shift left (absolute)
    AND $1F02,X          ; 3D 02 1F | Logical AND with accumulator (absolute,X)
    BPL $01              ; 10 01 | Branch if positive
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_140
; Address: $DCB516
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_140:
    JSR $4060            ; 20 60 40 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    BNE $5C              ; D0 5C | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    LDY $F21E            ; AC 1E F2 | Load from absolute address into Y register
    ORA $1BC1,X          ; 1D C1 1B | Logical OR with accumulator (absolute,X)
    AND $1DC0,Y          ; 39 C0 1D | Logical AND with accumulator (absolute,Y)
    ROR $0004            ; 6E 04 00 | Rotate right (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $FE60,X          ; FD 60 FE | Subtract with carry (absolute,X)
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    CPY #$8E             ; C0 8E | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY $32              ; C4 32 | Compare Y register (zero page)
    STX $9824            ; 8E 24 98 | Store X register to absolute address
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BPL $B8              ; 10 B8 | Branch if positive
    BEQ $D0              ; F0 D0 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    BEQ $3E              ; F0 3E | Branch if equal
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BPL $F0              ; 10 F0 | Branch if positive
    BEQ $40              ; F0 40 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_141
; Address: $DCB56B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_141:
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $31              ; 06 31 | Arithmetic shift left (zero page)
    ASL $0020,X          ; 1E 20 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_142
; Address: $DCB592
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_142:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_144
; Address: $DCB5A7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_144:
    ORA $26              ; 05 26 | Logical OR with accumulator (zero page)
    ORA #$1C             ; 09 1C | Logical OR with accumulator (immediate)
    ASL $0505            ; 0E 05 05 | Arithmetic shift left (absolute)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0807            ; 0E 07 08 | Arithmetic shift left (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    BVS $40              ; 70 40 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_145
; Address: $DCB5DF
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_145:
    BPL $F8              ; 10 F8 | Branch if positive
    BRA $78              ; 80 78 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    INC $7690            ; EE 90 76 | Increment (absolute)
    BEQ $EB              ; F0 EB | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PHB                  ; 8B | Push data bank register to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    CMP $0518            ; CD 18 05 | Compare accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    STZ $98              ; 64 98 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_148
; Address: $DCB615
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_148:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($39,X)          ; 01 39 | Logical OR with accumulator ((zero page,X))
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0020            ; 0E 20 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_149
; Address: $DCB652
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_149:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    AND ($0E,X)          ; 21 0E | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    BVS $40              ; 70 40 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_14A
; Address: $DCB69F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_14A:
    BPL $F8              ; 10 F8 | Branch if positive
    BRA $78              ; 80 78 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    CPX $6690            ; EC 90 66 | Compare X register (absolute)
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    BPL $9B              ; 10 9B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_14B
; Address: $DCB6B2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_14B:
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $1A              ; 30 1A | Branch if negative
    BEQ $78              ; F0 78 | Branch if equal
    INY                  ; C8 | Increment Y register
    PEA #$9C0C           ; F4 0C 9C | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_14D
; Address: $DCB6CF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_14D:
    JSR $00C8            ; 20 C8 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    BRA $3C              ; 80 3C | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $30              ; 80 30 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_14E
; Address: $DCB6DE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_14E:
    JSR $0070            ; 20 70 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    STZ $0002,X          ; 9E 02 00 | Store zero to absolute,X
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ROR $CF68            ; 6E 68 CF | Rotate right (absolute)
    STA $5F0F02          ; 8F 02 0F 5F | Update graphics data
    BPL $27              ; 10 27 | Branch if positive
    BPL $17              ; 10 17 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_150
; Address: $DCB712
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_150:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA #$3C             ; 09 3C | Logical OR with accumulator (immediate)
    BIT #$5E             ; 89 5E | Test bits in accumulator (immediate)
    STX $792F            ; 8E 2F 79 | Store X register to absolute address
    ORA ($3C),Y          ; 11 3C | Logical OR with accumulator ((zero page),Y)
    BMI $0F              ; 30 0F | Branch if negative
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    EOR ($19,X)          ; 41 19 | Exclusive OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_151
; Address: $DCB747
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_151:
    JSR $10FF            ; 20 FF 10 | Jump to subroutine
    BPL $DB              ; 10 DB | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_153
; Address: $DCB75D
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_153:
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $F9              ; F0 F9 | Branch if equal
    SBC $F400,Y          ; F9 00 F4 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CPX $08              ; E4 08 | Compare X register (zero page)
    CPX $4634            ; EC 34 46 | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    STA $3AC3,X          ; 9D C3 3A | Update graphics data
    CPX #$04             ; E0 04 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BCC $3E              ; 90 3E | Branch if carry clear
    BMI $FF              ; 30 FF | Branch if negative
    BEQ $FE              ; F0 FE | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INC $88E8            ; EE E8 88 | Increment (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $18              ; E4 18 | Compare X register (zero page)
    DEY                  ; 88 | Decrement Y register
    BIT $D8              ; 24 D8 | Test bits in accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    BCS $D0              ; B0 D0 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BEQ $C0              ; F0 C0 | Branch if equal
    INX                  ; E8 | Increment X register
    BPL $98              ; 10 98 | Branch if positive
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $40              ; F0 40 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_154
; Address: $DCB7A4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_154:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    STZ $0002,X          ; 9E 02 00 | Store zero to absolute,X
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ROR $CF68            ; 6E 68 CF | Rotate right (absolute)
    STA $9F0F02          ; 8F 02 0F 9F | Update graphics data
    STA                  ; 9F 00 2F 10 | Update graphics data
    BPL $27              ; 10 27 | Branch if positive
    INC $99              ; E6 99 | Increment (zero page)
    JMP $0700            ; 4C 00 07 | Jump to address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_155
; Address: $DCB7D2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_155:
    JSR $0002            ; 20 02 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA #$7C             ; 09 7C | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA $3E11,Y          ; 19 11 3E | Logical OR with accumulator (absolute,Y)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_156
; Address: $DCB7EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_156:
    ORA $0B0D,Y          ; 19 0D 0B | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1F07,Y          ; 19 07 1F | Logical OR with accumulator (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_157
; Address: $DCB807
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_157:
    JSR $10FF            ; 20 FF 10 | Jump to subroutine
    BPL $DB              ; 10 DB | Branch if positive
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_158
; Address: $DCB816
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_158:
    JSR $18E0            ; 20 E0 18 | Jump to subroutine
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $FA              ; F0 FA | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PEA #$E408           ; F4 08 E4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    BMI $4C              ; 30 4C | Branch if negative
    ROL $DA              ; 26 DA | Rotate left (zero page)
    DEX                  ; CA | Decrement X register
    CPX #$04             ; E0 04 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BPL $90              ; 10 90 | Branch if positive
    BMI $FE              ; 30 FE | Branch if negative
    BEQ $FE              ; F0 FE | Branch if equal
    CPX #$91             ; E0 91 | Compare X register (immediate)
    PLY                  ; 7A | Pull Y register from stack
    ADC ($F4),Y          ; 71 F4 | Add with carry ((zero page),Y)
    STX $7498            ; 8E 98 74 | Store X register to absolute address
    DEY                  ; 88 | Decrement Y register
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BNE $20              ; D0 20 | Branch if not equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_159
; Address: $DCB85D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_159:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    AND $5F04,X          ; 3D 04 5F | Logical AND with accumulator (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    BPL $45              ; 10 45 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    EOR $0E02,X          ; 5D 02 0E | Exclusive OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_15A
; Address: $DCB88C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_15A:
    CLC                  ; 18 | Clear carry flag
    ASL $1F06            ; 0E 06 1F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $6A              ; 10 6A | Branch if positive
    ORA ($21),Y          ; 11 21 | PPU graphics register access
    ORA $1F06,Y          ; 19 06 1F | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ROL $19              ; 26 19 | Rotate left (zero page)
    ORA $0303,X          ; 1D 03 03 | Logical OR with accumulator (absolute,X)
    BMI $18              ; 30 18 | Branch if negative
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $B8              ; 30 B8 | Branch if negative
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_15B
; Address: $DCB8CD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_15B:
    JSR $A8FC            ; 20 FC A8 | Jump to subroutine
    BMI $B0              ; 30 B0 | Branch if negative
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_15C
; Address: $DCB8E2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_15C:
    JSR $08D0            ; 20 D0 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_15D
; Address: $DCB8F4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_15D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $20              ; F0 20 | Branch if equal
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_15F
; Address: $DCB904
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_15F:
    JSR $7020            ; 20 20 70 | Jump to subroutine
    BRA $38              ; 80 38 | Branch always
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BPL $C0              ; 10 C0 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_161
; Address: $DCB91F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_161:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    AND $5F04,X          ; 3D 04 5F | Logical AND with accumulator (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    BPL $45              ; 10 45 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    STA $0E02,X          ; 9D 02 0E | Update graphics data
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_162
; Address: $DCB962
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_162:
    JSR $3213            ; 20 13 32 | Jump to subroutine
    ORA #$17             ; 09 17 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $4C              ; 10 4C | Branch if positive
    ORA $1F01            ; 0D 01 1F | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0810,X          ; 1E 10 08 | Arithmetic shift left (absolute,X)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $B8              ; 30 B8 | Branch if negative
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_163
; Address: $DCB98D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_163:
    JSR $A8FC            ; 20 FC A8 | Jump to subroutine
    BMI $B0              ; 30 B0 | Branch if negative
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_164
; Address: $DCB9A2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_164:
    JSR $08D0            ; 20 D0 08 | Jump to subroutine
    BNE $08              ; D0 08 | Branch if not equal
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_165
; Address: $DCB9B4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_165:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $20              ; F0 20 | Branch if equal
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_168
; Address: $DCB9C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_168:
    BCS $98              ; B0 98 | Branch if carry set
    BVS $F8              ; 70 F8 | Branch if overflow set
    BCC $80              ; 90 80 | Branch if carry clear
    CPX #$50             ; E0 50 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_16A
; Address: $DCB9D8
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_16A:
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BCC $10              ; 90 10 | Branch if carry clear
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $DF41,X          ; FD 41 DF | Subtract with carry (absolute,X)
    ORA $9F              ; 05 9F | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    ADC ($CF,X)          ; 61 CF | Add with carry ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($5D,X)          ; 01 5D | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_16B
; Address: $DCBA06
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_16B:
    JSR $1815            ; 20 15 18 | Jump to subroutine
    ASL $332C            ; 0E 2C 33 | Arithmetic shift left (absolute)
    JMP ($5350)          ; 6C 50 53 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_16C
; Address: $DCBA12
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_16C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STY $8E28            ; 8C 28 8E | Store Y register to absolute address
    ROR $1159            ; 6E 59 11 | Rotate right (absolute)
    DEC                  ; 3A | Decrement accumulator
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $1E45,X          ; 1E 45 1E | Arithmetic shift left (absolute,X)
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_16D
; Address: $DCBA4D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_16D:
    JSR $10FB            ; 20 FB 10 | Jump to subroutine
    LDY #$A8             ; A0 A8 | Load immediate value into Y register
    SEP #$44             ; E2 44 | Set processor status bits
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA $A950,Y          ; B9 50 A9 | Read graphics status
    BVC $5C              ; 50 5C | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ROL $DA              ; 26 DA | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_16E
; Address: $DCBA6D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_16E:
    ORA $3AC3,X          ; 1D C3 3A | Logical OR with accumulator (absolute,X)
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    ASL $FF18,X          ; 1E 18 FF | Arithmetic shift left (absolute,X)
    BMI $FE              ; 30 FE | Branch if negative
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    ROR $8868            ; 6E 68 88 | Rotate right (absolute)
    BCC $E4              ; 90 E4 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    STY $98F0            ; 8C F0 98 | Store Y register to absolute address
    BCS $F0              ; B0 F0 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BVS $A0              ; 70 A0 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    BCC $10              ; 90 10 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_16F
; Address: $DCBA96
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_16F:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $40              ; F0 40 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_170
; Address: $DCBAA4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_170:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $DF41,X          ; FD 41 DF | Subtract with carry (absolute,X)
    ORA $9F              ; 05 9F | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    ADC ($CF,X)          ; 61 CF | Add with carry ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_171
; Address: $DCBAC6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_171:
    JSR $2815            ; 20 15 28 | Jump to subroutine
    ROL $4B74,X          ; 3E 74 4B | Rotate left (absolute,X)
    CPX $D390            ; EC 90 D3 | Compare X register (absolute)
    JMP $0000            ; 4C 00 00 | Jump to address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_172
; Address: $DCBAD2
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_172:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $11              ; 30 11 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    ORA $3A11,Y          ; 19 11 3A | Logical OR with accumulator (absolute,Y)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ASL $3B              ; 06 3B | Arithmetic shift left (zero page)
    ORA $0F0D,Y          ; 19 0D 0F | Logical OR with accumulator (absolute,Y)
    ASL $1605            ; 0E 05 16 | Arithmetic shift left (absolute)
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_173
; Address: $DCBAFB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_173:
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_174
; Address: $DCBB0D
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_174:
    JSR $10FB            ; 20 FB 10 | Jump to subroutine
    LDY #$A8             ; A0 A8 | Load immediate value into Y register
    SEP #$44             ; E2 44 | Set processor status bits
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    TSX                  ; BA | Transfer stack pointer to X register
    BVC $AA              ; 50 AA | Branch if overflow clear
    BVC $5C              ; 50 5C | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    BEQ $24              ; F0 24 | Branch if equal
    ROL $1A              ; 26 1A | Rotate left (zero page)
    DEX                  ; CA | Decrement X register
    BMI $00              ; 30 00 | Branch if negative
    BVC $00              ; 50 00 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    INC $FC30,X          ; FE 30 FC | Increment (absolute,X)
    BEQ $31              ; F0 31 | Branch if equal
    ADC ($76),Y          ; 71 76 | Add with carry ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    LDX #$78             ; A2 78 | Load immediate value into X register
    BRA $1C              ; 80 1C | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_175
; Address: $DCBB56
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_175:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_176
; Address: $DCBB5B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_176:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA $3F05,X          ; 1D 05 3F | Logical OR with accumulator (absolute,X)
    ORA $0F05            ; 0D 05 0F | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_177
; Address: $DCBBA3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_177:
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $1C01            ; 0E 01 1C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BPL $BC              ; 10 BC | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_178
; Address: $DCBBC9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_178:
    JSR $C0FA            ; 20 FA C0 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $30              ; 10 30 | Branch if positive
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    PEA #$A208           ; F4 08 A2 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    BRA $FA              ; 80 FA | Branch always
    RTI                  ; 40 | Return from interrupt
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $60              ; 80 60 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_179
; Address: $DCBBEF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_179:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BVS $60              ; 70 60 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    STY $28              ; 84 28 | Store Y register to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_17A
; Address: $DCBC06
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_17A:
    SED                  ; F8 | Set decimal mode flag
    CPX $6410            ; EC 10 64 | Compare X register (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    BCC $00              ; 90 00 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA $3F05,X          ; 1D 05 3F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_17B
; Address: $DCBC37
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_17B:
    ORA $0F05            ; 0D 05 0F | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $0E19            ; 0D 19 0E | Logical OR with accumulator (absolute)
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BPL $BC              ; 10 BC | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_17C
; Address: $DCBC89
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_17C:
    JSR $C0FA            ; 20 FA C0 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $30              ; 10 30 | Branch if positive
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    PEA #$A208           ; F4 08 A2 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    BRA $F9              ; 80 F9 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA $7040,Y          ; B9 40 70 | Read graphics status
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $C0              ; 30 C0 | Branch if negative
    BNE $20              ; D0 20 | Branch if not equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BMI $40              ; 30 40 | Branch if negative
    BMI $04              ; 30 04 | Branch if negative
    INY                  ; C8 | Increment Y register
    JMP $E890            ; 4C 90 E8 | Jump to address
    BPL $F4              ; 10 F4 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY $F02C            ; CC 2C F0 | Compare Y register (absolute)
    BCS $80              ; B0 80 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    BPL $78              ; 10 78 | Branch if positive
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_17D
; Address: $DCBCD4
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_17D:
    BPL $20              ; 10 20 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BPL $E0              ; 10 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    ORA $1404            ; 0D 04 14 | Logical OR with accumulator (absolute)
    AND $2300            ; 2D 00 23 | Logical AND with accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BIT $0300            ; 2C 00 03 | Test bits in accumulator (absolute)
    AND $3E08,Y          ; 39 08 3E | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    JMP $AE23            ; 4C 23 AE | Jump to address
    ADC ($C8,X)          ; 61 C8 | Add with carry ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $2E              ; 10 2E | Branch if positive
    ORA ($40),Y          ; 11 40 | Logical OR with accumulator ((zero page),Y)
    AND ($63),Y          ; 31 63 | Logical AND with accumulator ((zero page),Y)
    ROL $2806,X          ; 3E 06 28 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $20              ; 30 20 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    BPL $B8              ; 10 B8 | Branch if positive
    BVC $FC              ; 50 FC | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    BNE $3C              ; D0 3C | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_17E
; Address: $DCBD52
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_17E:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SBC $FD50,Y          ; F9 50 FD | Subtract with carry (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    SBC $FDD0,X          ; FD D0 FD | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $08CD,Y          ; F9 CD 08 | Subtract with carry (absolute,Y)
    ORA $7D11,X          ; 1D 11 7D | Logical OR with accumulator (absolute,X)
    EOR ($E9),Y          ; 51 E9 | Exclusive OR with accumulator ((zero page),Y)
    AND ($49,X)          ; 21 49 | Logical AND with accumulator ((zero page,X))
    SBC ($0B,X)          ; E1 0B | Subtract with carry ((zero page,X))
    STA ($07),Y          ; 91 07 | Update graphics data
    ROL $56              ; 26 56 | Rotate left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_17F
; Address: $DCBD71
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_17F:
    SED                  ; F8 | Set decimal mode flag
    ORA ($F8),Y          ; 11 F8 | Logical OR with accumulator ((zero page),Y)
    EOR ($E8,X)          ; 41 E8 | Exclusive OR with accumulator ((zero page,X))
    ORA ($C0),Y          ; 11 C0 | Logical OR with accumulator ((zero page),Y)
    AND $9910            ; 2D 10 99 | Logical AND with accumulator (absolute)
    STZ $30              ; 64 30 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    BVS $89              ; 70 89 | Branch if overflow set
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    SBC $F9FD,X          ; FD FD F9 | Subtract with carry (absolute,X)
    ORA $F808            ; 0D 08 F8 | Logical OR with accumulator (absolute)
    AND ($F0,X)          ; 21 F0 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $08              ; F0 08 | Branch if equal
    ORA $39E0,X          ; 1D E0 39 | Logical OR with accumulator (absolute,X)
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_180
; Address: $DCBD9A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_180:
    JSR $0071            ; 20 71 00 | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA $1404            ; 0D 04 14 | Logical OR with accumulator (absolute)
    AND $2300            ; 2D 00 23 | Logical AND with accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BIT $0300            ; 2C 00 03 | Test bits in accumulator (absolute)
    AND $3E08,Y          ; 39 08 3E | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    JMP $AC22            ; 4C 22 AC | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_181
; Address: $DCBDD2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_181:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($0C),Y          ; 11 0C | Logical OR with accumulator ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_182
; Address: $DCBDE3
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_182:
    JSL $6F3747          ; 22 47 37 6F | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    AND $9306,Y          ; 39 06 93 | Logical AND with accumulator (absolute,Y)
    BIT $3708            ; 2C 08 37 | Test bits in accumulator (absolute)
    ASL $37              ; 06 37 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $20              ; 30 20 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    BPL $B8              ; 10 B8 | Branch if positive
    BVC $FC              ; 50 FC | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    BNE $3E              ; D0 3E | Branch if not equal
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_184
; Address: $DCBE12
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_184:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    BVC $FE              ; 50 FE | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    INC $FED0,X          ; FE D0 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    DEC $1E0A            ; CE 0A 1E | Decrement (absolute)
    ROR $EA52,X          ; 7E 52 EA | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_185
; Address: $DCBE27
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_185:
    JSL $0BC25A          ; 22 5A C2 0B | Jump to subroutine long
    BMI $00              ; 30 00 | Branch if negative
    STZ $97              ; 64 97 | Store zero to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    WDM #$E8             ; 42 E8 | Reserved instruction
    CPY #$1E             ; C0 1E | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_186
; Address: $DCBE39
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_186:
    JSR $C438            ; 20 38 C4 | Jump to subroutine
    BIT #$F0             ; 89 F0 | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BIT $FE26            ; 2C 26 FE | Test bits in accumulator (absolute)
    INC $0CF8,X          ; FE F8 0C | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_187
; Address: $DCBE4F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_187:
    JSR $08F0            ; 20 F0 08 | Jump to subroutine
    ASL $38E0,X          ; 1E E0 38 | Arithmetic shift left (absolute,X)
    BEQ $08              ; F0 08 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_188
; Address: $DCBE5E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_188:
    JSR $0F20            ; 20 20 0F | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ADC $E328,Y          ; 79 28 E3 | Add with carry (absolute,Y)
    WDM #$DF             ; 42 DF | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    LDA $0330,Y          ; B9 30 03 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ROR $FE42,X          ; 7E 42 FE | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INC $FE30,X          ; FE 30 FE | Increment (absolute,X)
    ROR $FD              ; 66 FD | Rotate right (zero page)
    EOR $3578,X          ; 5D 78 35 | Exclusive OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND #$30             ; 29 30 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_189
; Address: $DCBE8C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_189:
    BMI $2A              ; 30 2A | Branch if negative
    STZ $66              ; 64 66 | Store zero to zero page
    PHY                  ; 5A | Push Y register to stack
    CLI                  ; 58 | Clear interrupt disable flag
    SEC                  ; 38 | Set carry flag
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ASL $3E              ; 06 3E | Arithmetic shift left (zero page)
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    LSR $4F23,X          ; 5E 23 4F | Logical shift right (absolute,X)
    BMI $20              ; 30 20 | Branch if negative
    ADC ($31),Y          ; 71 31 | Add with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_18A
; Address: $DCBEAB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_18A:
    JSR $0031            ; 20 31 00 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_18B
; Address: $DCBEBA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_18B:
    JSR $003F            ; 20 3F 00 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $10              ; 90 10 | Branch if carry clear
    BNE $50              ; D0 50 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_18C
; Address: $DCBECA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_18C:
    RTI                  ; 40 | Return from interrupt
    BMI $48              ; 30 48 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    BRA $C0              ; 80 C0 | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    BVC $70              ; 50 70 | Branch if overflow clear
    BPL $A0              ; 10 A0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BCS $38              ; B0 38 | Branch if carry set
    BRA $38              ; 80 38 | Branch always
    BRA $48              ; 80 48 | Branch always
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_18D
; Address: $DCBEE3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_18D:
    JSR $A0C0            ; 20 C0 A0 | Jump to subroutine
    BEQ $C0              ; F0 C0 | Branch if equal
    BNE $A0              ; D0 A0 | Branch if not equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BCC $E0              ; 90 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    BRA $90              ; 80 90 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_18E
; Address: $DCBEFE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_18E:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVC $20              ; 50 20 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_18F
; Address: $DCBF06
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_18F:
    BCC $80              ; 90 80 | Branch if carry clear
    BCS $A0              ; B0 A0 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    BRA $20              ; 80 20 | Branch always
    BPL $60              ; 10 60 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $0F              ; 80 0F | Branch always
    PHP                  ; 08 | Push processor status to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ADC $E528,X          ; 7D 28 E5 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CMP $BD18,X          ; DD 18 BD | Compare accumulator (absolute,X)
    BMI $03              ; 30 03 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ADC $7A28,X          ; 7D 28 7A | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    BMI $FA              ; 30 FA | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_190
; Address: $DCBF43
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_190:
    EOR $377A,X          ; 5D 7A 37 | Exclusive OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $47              ; 26 47 | Rotate left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_191
; Address: $DCBF52
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_191:
    CLI                  ; 58 | Clear interrupt disable flag
    PHY                  ; 5A | Push Y register to stack
    SEC                  ; 38 | Set carry flag
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA ($71,X)          ; 01 71 | Logical OR with accumulator ((zero page,X))
    EOR $596C,Y          ; 59 6C 59 | Exclusive OR with accumulator (absolute,Y)
    ROR $4E              ; 66 4E | Rotate right (zero page)
    BMI $42              ; 30 42 | Hardware register operation
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_193
; Address: $DCBF72
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_193:
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $10              ; 90 10 | Branch if carry clear
    BNE $50              ; D0 50 | Branch if not equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_194
; Address: $DCBF88
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_194:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BMI $08              ; 30 08 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    BRA $C0              ; 80 C0 | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BEQ $38              ; F0 38 | Branch if equal
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$70             ; A0 70 | Load immediate value into Y register
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_195
; Address: $DCBFA9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_195:
    JSR $40E0            ; 20 E0 40 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BNE $04              ; D0 04 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    BMI $00              ; 30 00 | Branch if negative
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_196
; Address: $DCBFBC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_196:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BRA $4C              ; 80 4C | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    CLC                  ; 18 | Clear carry flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    BCC $80              ; 90 80 | Branch if carry clear
    BMI $20              ; 30 20 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_197
; Address: $DCBFCC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_197:
    JSR $F000            ; 20 00 F0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_199
; Address: $DCBFD5
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_199:
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $20              ; 80 20 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA $1C0C            ; 0D 0C 1C | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BPL $26              ; 10 26 | Branch if positive
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 10 BF 00 | Update graphics data
    LDA                  ; BF 01 BE 05 | Read graphics status
    STZ $0BAC,X          ; 9E AC 0B | Store zero to absolute,X
    LDY #$95             ; A0 95 | Load immediate value into Y register
    STA ($8A),Y          ; 91 8A | Update graphics data
    STZ $B1CF            ; 9C CF B1 | Store zero to absolute
    CPY #$7A             ; C0 7A | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $04              ; 80 04 | Branch always
    CLV                  ; B8 | Clear overflow flag
    BCC $00              ; 90 00 | Branch if carry clear
    ORA $1804,Y          ; 19 04 18 | Logical OR with accumulator (absolute,Y)
    STY $2B              ; 84 2B | Store Y register to zero page
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_19A
; Address: $DCC023
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_19A:
    JSL $BFA7B4          ; 22 B4 A7 BF | Jump to subroutine long
    STA                  ; 9F B0 10 1F | Update graphics data
    STY $0F              ; 84 0F | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    AND $B006,Y          ; 39 06 B0 | Logical AND with accumulator (absolute,Y)
    STZ $100F            ; 9C 0F 10 | Store zero to absolute
    STX $8400            ; 8E 00 84 | Store X register to absolute address
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $20              ; 30 20 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    BPL $F8              ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_19B
; Address: $DCC047
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_19B:
    JSR $303C            ; 20 3C 30 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_19D
; Address: $DCC056
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_19D:
    JSR $30F8            ; 20 F8 30 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BRA $78              ; 80 78 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_19E
; Address: $DCC05E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_19E:
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    JMP $04A8            ; 4C A8 04 | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BVS $C0              ; 70 C0 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    STX $4E55            ; 8E 55 4E | Store X register to absolute address
    EOR $0842,X          ; 5D 42 08 | Exclusive OR with accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    ASL $0900,X          ; 1E 00 09 | Arithmetic shift left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_19F
; Address: $DCC07D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_19F:
    JSR $A018            ; 20 18 A0 | Jump to subroutine
    BRA $20              ; 80 20 | Branch always
    BIT $DCC6            ; 2C C6 DC | Test bits in accumulator (absolute)
    INC $7CDC            ; EE DC 7C | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A0
; Address: $DCC08B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A0:
    BPL $88              ; 10 88 | Branch if positive
    BEQ $20              ; F0 20 | Branch if equal
    BVS $D2              ; 70 D2 | Branch if overflow set
    BIT $DC20            ; 2C 20 DC | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A1
; Address: $DCC099
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A1:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $20              ; F0 20 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A2
; Address: $DCC0A2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A2:
    ORA $1C0C            ; 0D 0C 1C | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BPL $26              ; 10 26 | Branch if positive
    ORA ($29,X)          ; 01 29 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BPL $7F              ; 10 7F | Branch if positive
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    JMP ($724B)          ; 6C 4B 72 | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A3
; Address: $DCC0C6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A3:
    EOR ($4A),Y          ; 51 4A | Exclusive OR with accumulator ((zero page),Y)
    JMP $2031EF          ; 5C EF 31 20 | Jump to address long
    TSX                  ; BA | Transfer stack pointer to X register
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    ORA ($48),Y          ; 11 48 | Logical OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A4
; Address: $DCC0DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A4:
    BPL $00              ; 10 00 | Branch if positive
    ORA $1844,Y          ; 19 44 18 | Logical OR with accumulator (absolute,Y)
    BIT $74              ; 24 74 | Test bits in accumulator (zero page)
    BMI $50              ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A5
; Address: $DCC0EA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A5:
    JSR $1940            ; 20 40 19 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BVS $0F              ; 70 0F | Branch if overflow set
    BPL $5F              ; 10 5F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $C0              ; 06 C0 | Arithmetic shift left (zero page)
    CPY #$30             ; C0 30 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A7
; Address: $DCC107
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A7:
    JSR $303C            ; 20 3C 30 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1A9
; Address: $DCC116
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1A9:
    JSR $30F8            ; 20 F8 30 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BRA $78              ; 80 78 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    JMP $04A8            ; 4C A8 04 | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BVS $C0              ; 70 C0 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    PEA #$528C           ; F4 8C 52 | Push effective address to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $0842,Y          ; 59 42 08 | Exclusive OR with accumulator (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $1020,X          ; 9D 20 10 | Update graphics data
    LDY $99              ; A4 99 | Load from zero page into Y register
    STX $6E              ; 86 6E | Store X register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1AA
; Address: $DCC144
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1AA:
    SEP #$EC             ; E2 EC | Set processor status bits
    CPX $101C            ; EC 1C 10 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1AB
; Address: $DCC14B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1AB:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    BPL $60              ; 10 60 | Branch if positive
    BIT #$70             ; 89 70 | Test bits in accumulator (immediate)
    BPL $EC              ; 10 EC | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1AF
; Address: $DCC15D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1AF:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $1E              ; 10 1E | Branch if positive
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $2F              ; 10 2F | Branch if positive
    ORA $3303,X          ; 1D 03 33 | Logical OR with accumulator (absolute,X)
    ROL $252E            ; 2E 2E 25 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B0
; Address: $DCC184
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B0:
    JSR $2E25            ; 20 25 2E | Jump to subroutine
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR #$2B             ; 49 2B | Exclusive OR with accumulator (immediate)
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B2
; Address: $DCC196
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B2:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($23,X)          ; 21 23 | Logical AND with accumulator ((zero page,X))
    ROL $29              ; 26 29 | Rotate left (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B3
; Address: $DCC1AB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B3:
    JSR $010F            ; 20 0F 01 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B4
; Address: $DCC1BB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B4:
    JSR $0101            ; 20 01 01 | Jump to subroutine
    BEQ $C0              ; F0 C0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BPL $24              ; 10 24 | Branch if positive
    INC $1EA8            ; EE A8 1E | Increment (absolute)
    REP #$7B             ; C2 7B | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    ORA $C00C,X          ; 1D 0C C0 | Logical OR with accumulator (absolute,X)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B5
; Address: $DCC1D7
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B5:
    INC $FE14,X          ; FE 14 FE | Increment (absolute,X)
    REP #$FF             ; C2 FF | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    INC $BF              ; E6 BF | Increment (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ASL $1CAC,X          ; 1E AC 1C | Arithmetic shift left (absolute,X)
    BVC $68              ; 50 68 | Branch if overflow clear
    CPX #$94             ; E0 94 | Compare X register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $66              ; 26 66 | Rotate left (zero page)
    ROR $1A5A,X          ; 7E 5A 1A | Rotate right (absolute,X)
    JMP $201C            ; 4C 1C 20 | Jump to address
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B6
; Address: $DCC1FD
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B6:
    BRA $5E              ; 80 5E | Branch always
    INC                  ; 1A | Increment accumulator
    LDX $3A              ; A6 3A | Load from zero page into X register
    CPY $F2              ; C4 F2 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    STX $068C            ; 8E 8C 06 | Store X register to absolute address
    STY $F800            ; 8C 00 F8 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    LSR $1C00            ; 4E 00 1C | Logical shift right (absolute)
    SED                  ; F8 | Set decimal mode flag
    STY $04FC            ; 8C FC 04 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $1E              ; 10 1E | Branch if positive
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $4F              ; 10 4F | Branch if positive
    ORA $5343,X          ; 1D 43 53 | Logical OR with accumulator (absolute,X)
    ASL $454E            ; 0E 4E 45 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $4E              ; 45 4E | Exclusive OR with accumulator (zero page)
    WDM #$68             ; 42 68 | Reserved instruction
    BCC $56              ; 90 56 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B7
; Address: $DCC258
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B7:
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    AND ($92,X)          ; 21 92 | Logical AND with accumulator ((zero page,X))
    ROR $6A              ; 66 6A | Rotate right (zero page)
    EOR #$41             ; 49 41 | Exclusive OR with accumulator (immediate)
    JMP $0804            ; 4C 04 08 | Jump to address
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BEQ $C0              ; F0 C0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BPL $24              ; 10 24 | Branch if positive
    INC $1EA8            ; EE A8 1E | Increment (absolute)
    REP #$7B             ; C2 7B | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    ORA $C00C,X          ; 1D 0C C0 | Logical OR with accumulator (absolute,X)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $FE14,X          ; FE 14 FE | Increment (absolute,X)
    REP #$FF             ; C2 FF | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    INC $BF              ; E6 BF | Increment (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ASL $1CAC,X          ; 1E AC 1C | Arithmetic shift left (absolute,X)
    BVC $68              ; 50 68 | Branch if overflow clear
    CPX #$94             ; E0 94 | Compare X register (immediate)
    BIT $E264            ; 2C 64 E2 | Test bits in accumulator (absolute)
    ROR $7E              ; 66 7E | Rotate right (zero page)
    PHY                  ; 5A | Push Y register to stack
    INC                  ; 1A | Increment accumulator
    JMP $201C            ; 4C 1C 20 | Jump to address
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B8
; Address: $DCC2BC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B8:
    JMP $008E80          ; 5C 80 8E 00 | Jump to address long
    TXS                  ; 9A | Transfer X register to stack pointer
    TSX                  ; BA | Transfer stack pointer to X register
    ROR $72              ; 66 72 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $E0              ; 10 E0 | Game work RAM access
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    BRA $FC              ; 80 FC | Branch always
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1B9
; Address: $DCC2DB
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1B9:
    SED                  ; F8 | Set decimal mode flag
    BPL $D0              ; 10 D0 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $16              ; 10 16 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $191F,X          ; 1D 1F 19 | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ROL $3F17,X          ; 3E 17 3F | Rotate left (absolute,X)
    ORA #$12             ; 09 12 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA ($B6),Y          ; B1 B6 | Read graphics status
    LDX #$AF             ; A2 AF | Load immediate value into X register
    DEC $E1              ; C6 E1 | Decrement (zero page)
    STX $3FA1            ; 8E A1 3F | Store X register to absolute address
    EOR $AD0D,X          ; 5D 0D AD | Exclusive OR with accumulator (absolute,X)
    EOR $AE              ; 45 AE | Exclusive OR with accumulator (zero page)
    WDM #$BC             ; 42 BC | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    EOR #$CF             ; 49 CF | Exclusive OR with accumulator (immediate)
    BPL $8C              ; 10 8C | Branch if positive
    LDA #$56             ; A9 56 | Read graphics status
    ASL $0B1B,X          ; 1E 1B 0B | Arithmetic shift left (absolute,X)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BCC $A0              ; 90 A0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BCC $08              ; 90 08 | Branch if carry clear
    BCC $48              ; 90 48 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BPL $60              ; 10 60 | Branch if positive
    BRA $F0              ; 80 F0 | Branch always
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $B8              ; F0 B8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1BA
; Address: $DCC359
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1BA:
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    BCC $48              ; 90 48 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    CPY $28              ; C4 28 | Compare Y register (zero page)
    INX                  ; E8 | Increment X register
    PHA                  ; 48 | Push accumulator to stack
    BEQ $28              ; F0 28 | Branch if equal
    INY                  ; C8 | Increment Y register
    ADC ($86,X)          ; 61 86 | Add with carry ((zero page,X))
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BCS $70              ; B0 70 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1BB
; Address: $DCC376
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1BB:
    BEQ $C0              ; F0 C0 | Branch if equal
    BMI $00              ; 30 00 | Branch if negative
    INC $10              ; E6 10 | Increment (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    BCC $98              ; 90 98 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1BC
; Address: $DCC381
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1BC:
    STZ $9C60            ; 9C 60 9C | Store zero to absolute
    LDA ($7E),Y          ; B1 7E | Read graphics status
    SBC $8EF6,X          ; FD F6 8E | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CPY #$E4             ; C0 E4 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    SBC $F806,Y          ; F9 06 F8 | Subtract with carry (absolute,Y)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $16              ; 10 16 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $191F,X          ; 1D 1F 19 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1BD
; Address: $DCC3BA
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1BD:
    INC                  ; 1A | Increment accumulator
    ROL $3F17,X          ; 3E 17 3F | Rotate left (absolute,X)
    AND #$32             ; 29 32 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BVC $57              ; 50 57 | Branch if overflow clear
    ADC ($56),Y          ; 71 56 | Add with carry ((zero page),Y)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    EOR $5E2D,X          ; 5D 2D 5E | Exclusive OR with accumulator (absolute,X)
    ROL $5F              ; 26 5F | Rotate left (zero page)
    JMP $286720          ; 5C 20 67 28 | Jump to address long
    ROR $09              ; 66 09 | Rotate right (zero page)
    PHP                  ; 08 | Push processor status to stack
    AND ($3D,X)          ; 21 3D | Logical AND with accumulator ((zero page,X))
    AND $3F3E            ; 2D 3E 3F | Logical AND with accumulator (absolute)
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BCC $A0              ; 90 A0 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BCC $08              ; 90 08 | Branch if carry clear
    BCC $48              ; 90 48 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BPL $60              ; 10 60 | Branch if positive
    BRA $F0              ; 80 F0 | Branch always
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $B8              ; F0 B8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    BCC $48              ; 90 48 | Branch if carry clear
    BEQ $00              ; F0 00 | Branch if equal
    CPY $28              ; C4 28 | Compare Y register (zero page)
    STY $4868            ; 8C 68 48 | Store Y register to absolute address
    BEQ $08              ; F0 08 | Branch if equal
    INX                  ; E8 | Increment X register
    AND ($C4,X)          ; 21 C4 | Logical AND with accumulator ((zero page,X))
    BMI $C6              ; 30 C6 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    BCS $B0              ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1BE
; Address: $DCC435
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1BE:
    LDY #$70             ; A0 70 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    CPX $10              ; E4 10 | Compare X register (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    BCC $39              ; 90 39 | Branch if carry clear
    CPY #$45             ; C0 45 | Compare Y register (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP ($ECFA)          ; 6C FA EC | Jump to address (absolute indirect)
    STZ $F080            ; 9C 80 F0 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1BF
; Address: $DCC44C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1BF:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    BMI $F1              ; 30 F1 | Branch if negative
    BEQ $0C              ; F0 0C | Branch if equal
    CPX #$2C             ; E0 2C | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C0
; Address: $DCC463
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C0:
    JSL $224F30          ; 22 30 4F 22 | Jump to subroutine long
    LSR $DC24,X          ; 5E 24 DC | Logical shift right (absolute,X)
    ROR $5C91            ; 6E 91 5C | Rotate right (absolute)
    LDX #$59             ; A2 59 | Load immediate value into X register
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    ROL $793E,X          ; 3E 3E 79 | Rotate left (absolute,X)
    BVS $7F              ; 70 7F | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    INC $EDEB            ; EE EB ED | Increment (absolute)
    EOR ($A4),Y          ; 51 A4 | Exclusive OR with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    BRA $10              ; 80 10 | Branch always
    CMP $C508            ; CD 08 C5 | Compare accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    SBC $CAEF            ; ED EF CA | Subtract with carry (absolute)
    INC $C6CC            ; EE CC C6 | Increment (absolute)
    CPY $03              ; C4 03 | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0F0B            ; 0E 0B 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C1
; Address: $DCC4BF
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C1:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BCC $24              ; 90 24 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $B47C            ; EC 7C B4 | Compare X register (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    DEC $7A48,X          ; DE 48 7A | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $EE12,X          ; FE 12 EE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ASL $DA              ; 06 DA | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    ROR                  ; 6A | Rotate right (accumulator)
    LSR $121C            ; 4E 1C 12 | Logical shift right (absolute)
    LDX $A6              ; A6 A6 | Load from zero page into X register
    STX $84              ; 86 84 | Store X register to zero page
    BIT $82              ; 24 82 | Test bits in accumulator (zero page)
    NOP                  ; EA | No operation
    CPY $4A34            ; CC 34 4A | Compare Y register (absolute)
    LDY $402C            ; AC 2C 40 | Load from absolute address into Y register
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BCC $10              ; 90 10 | Branch if carry clear
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C2
; Address: $DCC50C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C2:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BMI $08              ; 30 08 | Branch if negative
    BCC $0C              ; 90 0C | Branch if carry clear
    BMI $08              ; 30 08 | Branch if negative
    BVS $18              ; 70 18 | Branch if overflow set
    BVS $20              ; 70 20 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C3
; Address: $DCC523
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C3:
    JSL $224F30          ; 22 30 4F 22 | Jump to subroutine long
    DEC $DC24,X          ; DE 24 DC | Decrement (absolute,X)
    ROR $5C91            ; 6E 91 5C | Rotate right (absolute)
    LDX #$59             ; A2 59 | Load immediate value into X register
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    ROL $793E,X          ; 3E 3E 79 | Rotate left (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C4
; Address: $DCC53D
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C4:
    INC $EDEB            ; EE EB ED | Increment (absolute)
    AND ($44),Y          ; 31 44 | Logical AND with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    RTI                  ; 40 | Return from interrupt
    BPL $6D              ; 10 6D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND $04              ; 25 04 | Logical AND with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ADC $6A6F            ; 6D 6F 6A | Add with carry (absolute)
    ROR $366C            ; 6E 6C 36 | Rotate right (absolute)
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $0408            ; 0E 08 04 | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BCC $24              ; 90 24 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $B47C            ; EC 7C B4 | Compare X register (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    DEC $7A48,X          ; DE 48 7A | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $ED11,X          ; FE 11 ED | Increment (absolute,X)
    SBC $D905,Y          ; F9 05 D9 | Subtract with carry (absolute,Y)
    ORA $9775,X          ; 1D 75 97 | Logical OR with accumulator (absolute,X)
    ROR $4B              ; 66 4B | Rotate right (zero page)
    ASL $9612,X          ; 1E 12 96 | Arithmetic shift left (absolute,X)
    LDX $A6              ; A6 A6 | Load from zero page into X register
    STA $86              ; 85 86 | Update graphics data
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STA $02              ; 85 02 | Update graphics data
    INC $C802            ; EE 02 C8 | Increment (absolute)
    BMI $C9              ; 30 C9 | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    STX $3C64            ; 8E 64 3C | Store X register to absolute address
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BVC $90              ; 50 90 | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C5
; Address: $DCC5CD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C5:
    BPL $CC              ; 10 CC | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    JMP $AC30            ; 4C 30 AC | Jump to address
    BVC $CC              ; 50 CC | Branch if overflow clear
    BMI $48              ; 30 48 | Branch if negative
    BCS $18              ; B0 18 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    BVS $10              ; 70 10 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BPL $14              ; 10 14 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C6
; Address: $DCC5ED
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C6:
    JSR $2412            ; 20 12 24 | Jump to subroutine
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1F04            ; 2D 04 1F | Logical AND with accumulator (absolute)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    BPL $06              ; 10 06 | Branch if positive
    ADC ($A9,X)          ; 61 A9 | Add with carry ((zero page,X))
    AND $0819,Y          ; 39 19 08 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ASL $42              ; 06 42 | Hardware register operation
    ROL $3880,X          ; 3E 80 38 | Rotate left (absolute,X)
    STA ($71,X)          ; 81 71 | Update graphics data
    LDY $716C,X          ; BC 6C 71 | Load from absolute,X into Y register
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ROL $1B              ; 26 1B | Rotate left (zero page)
    ASL $0F61,X          ; 1E 61 0F | Arithmetic shift left (absolute,X)
    JMP ($1F01)          ; 6C 01 1F | Jump to address (absolute indirect)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C7
; Address: $DCC643
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C7:
    JSR $8020            ; 20 20 80 | Jump to subroutine
    BRA $50              ; 80 50 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C8
; Address: $DCC649
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C8:
    BCC $10              ; 90 10 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $C0E0            ; AC E0 C0 | Load from absolute address into Y register
    BEQ $60              ; F0 60 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1C9
; Address: $DCC654
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1C9:
    BVS $A0              ; 70 A0 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BEQ $58              ; F0 58 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $ECFC            ; EC FC EC | Compare X register (absolute)
    BCC $EC              ; 90 EC | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    ROL                  ; 2A | Rotate left (accumulator)
    DEX                  ; CA | Decrement X register
    INC $86              ; E6 86 | Increment (zero page)
    LDX $7CCE            ; AE CE 7C | Load from absolute address into X register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $6694            ; 2E 94 66 | Rotate left (absolute)
    BPL $3A              ; 10 3A | Branch if positive
    JMP $842C1A          ; 5C 1A 2C 84 | Jump to address long
    TYA                  ; 98 | Transfer Y register to accumulator
    SEC                  ; 38 | Set carry flag
    BMI $98              ; 30 98 | Branch if negative
    BRA $F0              ; 80 F0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1CA
; Address: $DCC68C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1CA:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BRA $38              ; 80 38 | Branch always
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    BMI $80              ; 30 80 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BPL $14              ; 10 14 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1CB
; Address: $DCC6AD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1CB:
    JSR $2412            ; 20 12 24 | Jump to subroutine
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $1F04            ; 2D 04 1F | Logical AND with accumulator (absolute)
    ORA $1F22,X          ; 1D 22 1F | Logical OR with accumulator (absolute,X)
    BPL $06              ; 10 06 | Branch if positive
    AND ($98,X)          ; 21 98 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1CC
; Address: $DCC6D2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1CC:
    AND $0819,Y          ; 39 19 08 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    LDY #$5E             ; A0 5E | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    EOR ($39,X)          ; 41 39 | Exclusive OR with accumulator ((zero page,X))
    JMP $013934          ; 5C 34 39 01 | Jump to address long
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $338C            ; 0D 8C 33 | Logical OR with accumulator (absolute)
    ASL $0731            ; 0E 31 07 | Arithmetic shift left (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1CD
; Address: $DCC703
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1CD:
    JSR $8020            ; 20 20 80 | Jump to subroutine
    BRA $50              ; 80 50 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1CE
; Address: $DCC709
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1CE:
    BCC $10              ; 90 10 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY $C0E0            ; AC E0 C0 | Load from absolute address into Y register
    BEQ $60              ; F0 60 | Branch if equal
    BVS $A0              ; 70 A0 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    BVC $F8              ; 50 F8 | Branch if overflow clear
    BEQ $58              ; F0 58 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $ECFC            ; EC FC EC | Compare X register (absolute)
    INC $FD45            ; EE 45 FD | Increment (absolute)
    EOR $45BD            ; 4D BD 45 | Exclusive OR with accumulator (absolute)
    SBC $E505,X          ; FD 05 E5 | Subtract with carry (absolute,X)
    LDA ($C2),Y          ; B1 C2 | Read graphics status
    ROR $3D7C,X          ; 7E 7C 3D | Rotate right (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA $0702,X          ; 1D 02 07 | Logical OR with accumulator (absolute,X)
    BCC $74              ; 90 74 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    ORA ($62),Y          ; 11 62 | Logical OR with accumulator ((zero page),Y)
    ASL $8414            ; 0E 14 84 | Arithmetic shift left (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $88              ; 30 88 | Branch if negative
    BRA $08              ; 80 08 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $30              ; 80 30 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1CF
; Address: $DCC74F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1CF:
    CPY #$74             ; C0 74 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    SEC                  ; 38 | Set carry flag
    BRA $F0              ; 80 F0 | Branch always
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D0
; Address: $DCC76B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D0:
    JSR $2409            ; 20 09 24 | Jump to subroutine
    JMP $0000            ; 4C 00 00 | Jump to address
    ASL $1F0F            ; 0E 0F 1F | Arithmetic shift left (absolute)
    ROL $3F2D,X          ; 3E 2D 3F | Rotate left (absolute,X)
    EOR $127B,Y          ; 59 7B 12 | Exclusive OR with accumulator (absolute,Y)
    LSR $7F10,X          ; 5E 10 7F | Logical shift right (absolute,X)
    ORA #$37             ; 09 37 | Logical OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $1E22,X          ; 1E 22 1E | Arithmetic shift left (absolute,X)
    ASL $060A            ; 0E 0A 06 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ADC #$65             ; 69 65 | Add with carry (immediate)
    ADC $21              ; 65 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D1
; Address: $DCC795
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D1:
    JSR $010A            ; 20 0A 01 | Jump to subroutine
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    BMI $6E              ; 30 6E | Branch if negative
    AND $1E3F,X          ; 3D 3F 1E | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $0936,X          ; 1E 36 09 | Arithmetic shift left (absolute,X)
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    BPL $0E              ; 10 0E | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $3800,X          ; 1E 00 38 | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    BIT #$3A             ; 89 3A | Test bits in accumulator (immediate)
    EOR $9A              ; 45 9A | Exclusive OR with accumulator (zero page)
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    STZ $0FFE,X          ; 9E FE 0F | Store zero to absolute,X
    STY $5C22            ; 8C 22 5C | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D2
; Address: $DCC7E6
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D2:
    BCC $A4              ; 90 A4 | Branch if carry clear
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    INC $B6              ; E6 B6 | Increment (zero page)
    CPX $C024            ; EC 24 C0 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $50              ; 10 50 | Branch if positive
    BMI $D0              ; 30 D0 | Branch if negative
    BVS $90              ; 70 90 | Branch if overflow set
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVS $20              ; 70 20 | Branch if overflow set
    BEQ $60              ; F0 60 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BMI $40              ; 30 40 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D4
; Address: $DCC82B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D4:
    JSR $2409            ; 20 09 24 | Jump to subroutine
    JMP $0000            ; 4C 00 00 | Jump to address
    ASL $1F0F            ; 0E 0F 1F | Arithmetic shift left (absolute)
    ROL $3F2D,X          ; 3E 2D 3F | Rotate left (absolute,X)
    EOR $127B,Y          ; 59 7B 12 | Exclusive OR with accumulator (absolute,Y)
    LSR $7F14,X          ; 5E 14 7F | Logical shift right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1D18            ; 0E 18 1D | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ADC #$65             ; 69 65 | Add with carry (immediate)
    ADC ($23,X)          ; 61 23 | Add with carry ((zero page,X))
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $2813,Y          ; 19 13 28 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BMI $08              ; 30 08 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D5
; Address: $DCC876
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D5:
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    BIT #$3A             ; 89 3A | Test bits in accumulator (immediate)
    EOR $9A              ; 45 9A | Exclusive OR with accumulator (zero page)
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    STZ $0EFE,X          ; 9E FE 0E | Store zero to absolute,X
    INC $FF0F,X          ; FE 0F FF | Increment (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    AND $5A              ; 25 5A | Logical AND with accumulator (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $A3              ; 10 A3 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D6
; Address: $DCC8A8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D6:
    JSR $4040            ; 20 40 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D7
; Address: $DCC8C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D7:
    BVS $90              ; 70 90 | Branch if overflow set
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BMI $20              ; 30 20 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D8
; Address: $DCC8CB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D8:
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1D9
; Address: $DCC8D8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1D9:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $0C              ; 10 0C | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL $1B07            ; 0E 07 1B | Arithmetic shift left (absolute)
    ORA $0C0F,Y          ; 19 0F 0C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1DA
; Address: $DCC900
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1DA:
    AND ($16),Y          ; 31 16 | Logical AND with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    STY $0C              ; 84 0C | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    SBC $BE56,Y          ; F9 56 BE | Subtract with carry (absolute,Y)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $5FC0,X          ; 1E C0 5F | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    AND $5CFE,Y          ; 39 FE 5C | Logical AND with accumulator (absolute,Y)
    BIT $32              ; 24 32 | Test bits in accumulator (zero page)
    AND $1C03,Y          ; 39 03 1C | Logical AND with accumulator (absolute,Y)
    ROL $7F              ; 26 7F | Rotate left (zero page)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    BRA $0E              ; 80 0E | Branch always
    STX $1F91            ; 8E 91 1F | Store X register to absolute address
    EOR $2F              ; 45 2F | Exclusive OR with accumulator (zero page)
    CMP $851F            ; CD 1F 85 | Compare accumulator (absolute)
    ORA $C537            ; 0D 37 C5 | Logical OR with accumulator (absolute)
    BRA $4E              ; 80 4E | Branch always
    BRA $BB              ; 80 BB | Branch always
    CPY $75              ; C4 75 | Compare Y register (zero page)
    NOP                  ; EA | No operation
    BEQ $9F              ; F0 9F | Branch if equal
    BEQ $35              ; F0 35 | Branch if equal
    SBC ($FA),Y          ; F1 FA | Subtract with carry ((zero page),Y)
    STA $116B            ; 8D 6B 11 | Update graphics data
    AND $37              ; 25 37 | Logical AND with accumulator (zero page)
    SBC $10              ; E5 10 | Subtract with carry (zero page)
    STA $7960,Y          ; 99 60 79 | Update graphics data
    BNE $57              ; D0 57 | Branch if not equal
    PLY                  ; 7A | Pull Y register from stack
    ASL $EBF4            ; 0E F4 EB | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    AND $F8F2,X          ; 3D F2 F8 | Logical AND with accumulator (absolute,X)
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    BPL $1E              ; 10 1E | Branch if positive
    TXS                  ; 9A | Transfer X register to stack pointer
    INC $2054,X          ; FE 54 20 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1DB
; Address: $DCC983
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1DB:
    JSR $2C48            ; 20 48 2C | Jump to subroutine
    JMP $C0BE20          ; 5C 20 BE C0 | Jump to address long
    LDX $7CC8,Y          ; BE C8 7C | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    BPL $70              ; 10 70 | Branch if positive
    STZ $F8              ; 64 F8 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1DC
; Address: $DCC994
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1DC:
    ROR $62FC            ; 6E FC 62 | Rotate right (absolute)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY $CCC8            ; CC C8 CC | Compare Y register (absolute)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    BPL $30              ; 10 30 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $0C              ; 10 0C | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL $1B07            ; 0E 07 1B | Arithmetic shift left (absolute)
    ORA $0C0F,Y          ; 19 0F 0C | Logical OR with accumulator (absolute,Y)
    AND ($16),Y          ; 31 16 | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    STA $9E06,Y          ; 99 06 9E | Update graphics data
    NOP                  ; EA | No operation
    LSR $2F70,X          ; 5E 70 2F | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    EOR $3CFE,Y          ; 59 FE 3C | Exclusive OR with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ADC $7D03,X          ; 7D 03 7D | Add with carry (absolute,X)
    ROL $3F10,X          ; 3E 10 3F | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $263F            ; 0E 3F 26 | Arithmetic shift left (absolute)
    LSR $07              ; 46 07 | Logical shift right (zero page)
    ORA ($18),Y          ; 11 18 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL $118E            ; 0E 8E 11 | Arithmetic shift left (absolute)
    STA                  ; 9F 95 1F 4D | Update graphics data
    CMP $17              ; C5 17 | Compare accumulator (zero page)
    STA $17              ; 85 17 | Update graphics data
    ORA $C537            ; 0D 37 C5 | Logical OR with accumulator (absolute)
    ASL $5B80            ; 0E 80 5B | Arithmetic shift left (absolute)
    STY $B5              ; 84 B5 | Store Y register to zero page
    DEX                  ; CA | Decrement X register
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    BEQ $9D              ; F0 9D | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STA $136B            ; 8D 6B 13 | Update graphics data
    AND ($30,X)          ; 21 30 | Logical AND with accumulator ((zero page,X))
    SBC ($10,X)          ; E1 10 | Subtract with carry ((zero page,X))
    STA                  ; 9F 6A 7D D8 | Update graphics data

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1DD
; Address: $DCCA2D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1DD:
    SEI                  ; 78 | Set interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    XBA                  ; EB | Exchange accumulator bytes
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    NOP                  ; EA | No operation
    INC $1F1C            ; EE 1C 1F | Increment (absolute)
    STZ $3A7F            ; 9C 7F 3A | Store zero to absolute
    LSR $24              ; 46 24 | Logical shift right (zero page)
    JMP $4628            ; 4C 28 46 | Jump to address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1DE
; Address: $DCCA45
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1DE:
    JSR $2046            ; 20 46 20 | Jump to subroutine
    LSR $9C28            ; 4E 28 9C | Logical shift right (absolute)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    STZ $FE              ; 64 FE | Store zero to zero page
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E0
; Address: $DCCA58
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E0:
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $70              ; 30 70 | Branch if negative
    ADC ($8B),Y          ; 71 8B | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    LDX $B0F8            ; AE F8 B0 | Load from absolute address into X register
    SED                  ; F8 | Set decimal mode flag
    LDA ($E0,X)          ; A1 E0 | Game work RAM access
    BEQ $B2              ; F0 B2 | Branch if equal
    BMI $79              ; 30 79 | Branch if negative
    LDX $F857            ; AE 57 F8 | Load from absolute address into X register
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    LDX $A05F,Y          ; BE 5F A0 | Load from absolute,Y into X register
    SBC $F7A4,Y          ; F9 A4 F7 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $83              ; 84 83 | Store Y register to zero page
    BCS $E3              ; B0 E3 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC ($60),Y          ; F1 60 | Subtract with carry ((zero page),Y)
    ROR $1EF8            ; 6E F8 1E | Rotate right (absolute)
    PEA #$881C           ; F4 1C 88 | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    BIT #$71             ; 89 71 | Test bits in accumulator (immediate)
    STZ $A774            ; 9C 74 A7 | Store zero to absolute
    EOR $3F6E,X          ; 5D 6E 3F | Exclusive OR with accumulator (absolute,X)
    BMI $12              ; 30 12 | Branch if negative
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ASL $1470,X          ; 1E 70 14 | Arithmetic shift left (absolute,X)
    BVS $04              ; 70 04 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E1
; Address: $DCCAAA
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E1:
    ROR $7F00,X          ; 7E 00 7F | Rotate right (absolute,X)
    ROL $07              ; 26 07 | Rotate left (zero page)
    ROL $141F,X          ; 3E 1F 14 | Rotate left (absolute,X)
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $88              ; 10 88 | Branch if positive
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    BVC $00              ; 50 00 | Branch if overflow clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    BEQ $90              ; F0 90 | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $0C              ; 80 0C | Branch always
    PEA #$BC04           ; F4 04 BC | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    DEC                  ; 3A | Decrement accumulator
    CPY #$F5             ; C0 F5 | Compare Y register (immediate)
    ORA #$68             ; 09 68 | Logical OR with accumulator (immediate)
    AND $1C70,Y          ; 39 70 1C | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F2              ; F0 F2 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $7E80            ; 6E 80 7E | Rotate right (absolute)
    ASL $0C60            ; 0E 60 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E2
; Address: $DCCB06
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E2:
    ASL $E0              ; 06 E0 | Game work RAM access
    ASL $1CE0            ; 0E E0 1C | Arithmetic shift left (absolute)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BCC $68              ; 90 68 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    STZ $F860            ; 9C 60 F8 | Store zero to absolute
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E3
; Address: $DCCB23
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E3:
    BMI $03              ; 30 03 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    LDA #$F8             ; A9 F8 | Read graphics status
    BNE $92              ; D0 92 | Branch if not equal
    BMI $08              ; 30 08 | Branch if negative
    ROR $D80F,X          ; 7E 0F D8 | Rotate right (absolute,X)
    LDA #$57             ; A9 57 | Read graphics status
    INC $801F,X          ; FE 1F 80 | Increment (absolute,X)
    CMP $D784,Y          ; D9 84 D7 | Compare accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY $0380            ; CC 80 03 | Compare Y register (absolute)
    BCC $01              ; 90 01 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    LSR $5CB4,X          ; 5E B4 5C | Logical shift right (absolute,X)
    SBC $E909,Y          ; F9 09 E9 | Subtract with carry (absolute,Y)
    ORA ($8C),Y          ; 11 8C | Logical OR with accumulator ((zero page),Y)
    SBC $5FBE,X          ; FD BE 5F | Subtract with carry (absolute,X)
    LDY #$EE             ; A0 EE | Load immediate value into Y register
    BVS $42              ; 70 42 | Hardware register operation
    CLC                  ; 18 | Clear carry flag
    BPL $16              ; 10 16 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E4
; Address: $DCCB6A
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E4:
    BVS $03              ; 70 03 | Branch if overflow set
    LDX $425F            ; AE 5F 42 | Hardware register operation
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $C8              ; 10 C8 | Branch if positive
    BMI $84              ; 30 84 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    BNE $0C              ; D0 0C | Branch if not equal
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    STA $7978            ; 8D 78 79 | Update graphics data
    BRA $F9              ; 80 F9 | Branch always
    ASL $3464            ; 0E 64 34 | Arithmetic shift left (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E5
; Address: $DCCBB5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E5:
    REP #$F8             ; C2 F8 | Reset processor status bits
    BEQ $F6              ; F0 F6 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ASL $6C9C            ; 0E 9C 6C | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E8
; Address: $DCCBC8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E8:
    ASL $3E24,X          ; 1E 24 3E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BCC $68              ; 90 68 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    STZ $F860            ; 9C 60 F8 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1E9
; Address: $DCCBD7
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1E9:
    BEQ $24              ; F0 24 | Branch if equal
    CPX $08              ; E4 08 | Compare X register (zero page)
    CPY $0800            ; CC 00 08 | Compare Y register (absolute)
    BMI $70              ; 30 70 | Branch if negative
    ADC ($88),Y          ; 71 88 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    LDA #$F8             ; A9 F8 | Read graphics status
    PEA #$ECA2           ; F4 A2 EC | Push effective address to stack
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    LDA ($E0),Y          ; B1 E0 | Game work RAM access
    BNE $70              ; D0 70 | Branch if not equal
    ORA ($DA,X)          ; 01 DA | Logical OR with accumulator ((zero page,X))
    AND ($AD,X)          ; 21 AD | Logical AND with accumulator ((zero page,X))
    INC $B80F,X          ; FE 0F B8 | Increment (absolute,X)
    EOR #$DE             ; 49 DE | Exclusive OR with accumulator (immediate)
    CMP $DF81,Y          ; D9 81 DF | Compare accumulator (absolute,Y)
    BCC $8F              ; 90 8F | Branch if carry clear
    STY $F4BB            ; 8C BB F4 | Store Y register to absolute address
    LDY $ABFB,X          ; BC FB AB | Load from absolute,X into Y register
    PEA #$57C1           ; F4 C1 57 | Push effective address to stack
    CLD                  ; D8 | Clear decimal mode flag
    CMP ($30),Y          ; D1 30 | Compare accumulator ((zero page),Y)
    BCS $5C              ; B0 5C | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag
    ADC ($24,X)          ; 61 24 | Add with carry ((zero page,X))
    BMI $12              ; 30 12 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1EA
; Address: $DCCC25
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1EA:
    ASL $62              ; 06 62 | Arithmetic shift left (zero page)
    AND $1C03,Y          ; 39 03 1C | Logical AND with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1EB
; Address: $DCCC44
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1EB:
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BPL $88              ; 10 88 | Branch if positive
    BIT $0008            ; 2C 08 00 | Test bits in accumulator (absolute)
    BRA $40              ; 80 40 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$78             ; E0 78 | Compare X register (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BCC $78              ; 90 78 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $8498            ; 4C 98 84 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $C5              ; F0 C5 | Branch if equal
    BMI $D9              ; 30 D9 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1EC
; Address: $DCCC69
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1EC:
    JSR $D039            ; 20 39 D0 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    STX $18E4            ; 8E E4 18 | Store X register to absolute address
    SEC                  ; 38 | Set carry flag
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    CPY #$42             ; C0 42 | Hardware register operation
    INX                  ; E8 | Increment X register
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    BNE $DE              ; D0 DE | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    INC $2084            ; EE 84 20 | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BIT $205C            ; 2C 5C 20 | Test bits in accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    INY                  ; C8 | Increment Y register
    LDX $7CC0,Y          ; BE C0 7C | Load from absolute,Y into X register
    BEQ $00              ; F0 00 | Branch if equal
    BVC $AC              ; 50 AC | Branch if overflow clear
    STZ $D8              ; 64 D8 | Store zero to zero page
    ROR $62FC            ; 6E FC 62 | Rotate right (absolute)
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    CPY $CCC0            ; CC C0 CC | Compare Y register (absolute)
    BRA $10              ; 80 10 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1ED
; Address: $DCCC9F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1ED:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    BIT #$F8             ; 89 F8 | Test bits in accumulator (immediate)
    LDA $FCB2FC          ; AF FC B2 FC | Read graphics status
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    CPX $B0              ; E4 B0 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1EE
; Address: $DCCCAF
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1EE:
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    ORA ($DD,X)          ; 01 DD | Logical OR with accumulator ((zero page,X))
    LDA $0FFE57          ; AF 57 FE 0F | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    STZ $B059,X          ; 9E 59 B0 | Store zero to absolute,X
    CMP ($A2),Y          ; D1 A2 | Compare accumulator ((zero page),Y)
    CMP $AFB1,X          ; DD B1 AF | Compare accumulator (absolute,X)
    STY $8B              ; 84 8B | Store Y register to zero page
    STY $BC              ; 84 BC | Store Y register to zero page
    XBA                  ; EB | Exchange accumulator bytes
    PLB                  ; AB | Pull data bank register from stack
    PEA #$E7B1           ; F4 B1 E7 | Push effective address to stack
    PHX                  ; DA | Push X register to stack
    BNE $10              ; D0 10 | Branch if not equal
    LDA $44              ; A5 44 | Read graphics status
    STA                  ; 9F 6E 87 77 | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    BCS $5C              ; B0 5C | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    EOR ($44,X)          ; 41 44 | Exclusive OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    EOR $7D13,X          ; 5D 13 7D | Exclusive OR with accumulator (absolute,X)
    ROL $0F00,X          ; 3E 00 0F | Rotate left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    ROL $1B              ; 26 1B | Rotate left (zero page)
    LSR $07              ; 46 07 | Logical shift right (zero page)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BPL $C8              ; 10 C8 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1EF
; Address: $DCCD0D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1EF:
    JSR $180C            ; 20 0C 18 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$78             ; E0 78 | Compare X register (immediate)
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $78              ; F0 78 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    WDM #$B0             ; 42 B0 | Reserved instruction
    STA ($F0,X)          ; 81 F0 | Update graphics data
    AND ($D0,X)          ; 21 D0 | Logical AND with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    AND $D5D8,X          ; 3D D8 D5 | Logical AND with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1F0
; Address: $DCCD2F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1F0:
    NOP                  ; EA | No operation
    CLI                  ; 58 | Clear interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ASL $A8              ; 06 A8 | Arithmetic shift left (zero page)
    ROL $F8              ; 26 F8 | Rotate left (zero page)
    NOP                  ; EA | No operation
    INC $DFDC            ; EE DC DF | Increment (absolute)
    INC                  ; 1A | Increment accumulator
    STX $24              ; 86 24 | Store X register to zero page
    PHA                  ; 48 | Push accumulator to stack
    ASL $60              ; 06 60 | Arithmetic shift left (zero page)
    LSR $20              ; 46 20 | Logical shift right (zero page)
    LSR $9C28            ; 4E 28 9C | Logical shift right (absolute)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    LDX $D868            ; AE 68 D8 | Load from absolute address into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1F2
; Address: $DCCD58
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1F2:
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    INX                  ; E8 | Increment X register
    LDA ($E8),Y          ; B1 E8 | Read graphics status
    BCS $D0              ; B0 D0 | Branch if carry set
    NOP                  ; EA | No operation
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    LDA $1AD549          ; AF 49 D5 1A | Read graphics status
    CPX #$01             ; E0 01 | Compare X register (immediate)
    BCS $CF              ; B0 CF | Branch if carry set
    BCS $CD              ; B0 CD | Branch if carry set
    BCS $EF              ; B0 EF | Branch if carry set
    LDX $ACF1            ; AE F1 AC | Load from absolute address into X register
    LDA $9690A0          ; AF A0 90 96 | Read graphics status
    STZ $988E            ; 9C 8E 98 | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    WDM #$EF             ; 42 EF | Reserved instruction
    LDA                  ; BF 4F B0 40 | Read graphics status
    STA $8176,Y          ; 99 76 81 | Update graphics data
    ROR $E6B0,X          ; 7E B0 E6 | Rotate right (absolute,X)
    BCS $F0              ; B0 F0 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1F3
; Address: $DCCDA5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1F3:
    LSR $60              ; 46 60 | Logical shift right (zero page)
    BVS $07              ; 70 07 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    LDA #$56             ; A9 56 | Read graphics status

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1F4
; Address: $DCCDB3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1F4:
    EOR $1F46,Y          ; 59 46 1F | Exclusive OR with accumulator (absolute,Y)
    STY $00C0            ; 8C C0 00 | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1F5
; Address: $DCCDC7
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1F5:
    BPL $00              ; 10 00 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    BEQ $0C              ; F0 0C | Branch if equal
    BCC $EC              ; 90 EC | Branch if carry clear
    INY                  ; C8 | Increment Y register
    BEQ $78              ; F0 78 | Branch if equal
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $88              ; F0 88 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    BEQ $21              ; F0 21 | PPU graphics register access
    CPY #$C9             ; C0 C9 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ASL $12C4            ; 0E C4 12 | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    ASL $74              ; 06 74 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BPL $1E              ; 10 1E | Branch if positive
    BCC $8E              ; 90 8E | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    ROL $DCE4            ; 2E E4 DC | Rotate left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    LDY $FC74,X          ; BC 74 FC | Load from absolute,X into Y register
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1F7
; Address: $DCCE09
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1F7:
    JSR $007E            ; 20 7E 00 | Jump to subroutine
    INC $F830,X          ; FE 30 F8 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    STZ $E0              ; 64 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1F9
; Address: $DCCE18
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1F9:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    STY $30              ; 84 30 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1FA
; Address: $DCCE22
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1FA:
    BVS $70              ; 70 70 | Branch if overflow set
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    CPX $D8A1            ; EC A1 D8 | Compare X register (absolute)
    BCS $D0              ; B0 D0 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 59 95 5A | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    BCS $CD              ; B0 CD | Branch if carry set
    BCS $CF              ; B0 CF | Branch if carry set
    LDA ($AE),Y          ; B1 AE | Read graphics status
    STX $DF81            ; 8E 81 DF | Store X register to absolute address
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    INC $AC              ; E6 AC | Increment (zero page)
    INC $00E0            ; EE E0 00 | Increment (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    LDA $6F9F4F          ; AF 4F 9F 6F | Read graphics status
    BNE $70              ; D0 70 | Branch if not equal
    LDA $B176,Y          ; B9 76 B1 | Read graphics status
    LSR $4650            ; 4E 50 46 | Logical shift right (absolute)
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1FB
; Address: $DCCE64
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1FB:
    JSR $3006            ; 20 06 30 | Jump to subroutine
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    BPL $3F              ; 10 3F | Branch if positive
    EOR #$16             ; 49 16 | Exclusive OR with accumulator (immediate)
    AND $1F06,Y          ; 39 06 1F | Logical AND with accumulator (absolute,Y)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    BIT $27              ; 24 27 | Test bits in accumulator (zero page)
    BPL $33              ; 10 33 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1FC
; Address: $DCCE87
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1FC:
    BPL $00              ; 10 00 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1FD
; Address: $DCCE90
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1FD:
    BEQ $0C              ; F0 0C | Branch if equal
    BPL $EC              ; 10 EC | Branch if positive
    INY                  ; C8 | Increment Y register
    BEQ $78              ; F0 78 | Branch if equal
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $88              ; F0 88 | Branch if equal
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BEQ $2C              ; F0 2C | Branch if equal
    CPY #$CA             ; C0 CA | Compare Y register (immediate)
    BMI $01              ; 30 01 | Branch if negative
    CPY #$09             ; C0 09 | Compare Y register (immediate)
    BRA $16              ; 80 16 | Branch always
    JMP ($7818)          ; 6C 18 78 | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BCC $90              ; 90 90 | Branch if carry clear
    BCC $8C              ; 90 8C | Branch if carry clear
    BMI $3E              ; 30 3E | Branch if negative
    BEQ $CE              ; F0 CE | Branch if equal
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    ASL $74              ; 06 74 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    ASL $E0              ; 06 E0 | Game work RAM access
    ASL $3CC0            ; 0E C0 3C | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    BEQ $6C              ; F0 6C | Branch if equal
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ADC $79              ; 65 79 | Add with carry (zero page)
    ORA $0605,X          ; 1D 05 06 | Logical OR with accumulator (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ADC $1F02,X          ; 7D 02 1F | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear
    ASL $1600            ; 0E 00 16 | Arithmetic shift left (absolute)
    BVC $39              ; 50 39 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1FE
; Address: $DCCF0E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1FE:
    JMP $482E            ; 4C 2E 48 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_1FF
; Address: $DCCF22
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_1FF:
    JSR $161C            ; 20 1C 16 | Jump to subroutine
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $0632            ; 0D 32 06 | Logical OR with accumulator (absolute)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $A444            ; 4C 44 A4 | Jump to address
    STZ $B8D8            ; 9C D8 B8 | Store zero to absolute
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    LSR $4CFE            ; 4E FE 4C | Logical shift right (absolute)
    BMI $BC              ; 30 BC | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $F860,X          ; FE 60 F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    INC $EE86            ; EE 86 EE | Increment (absolute)
    DEC $F4              ; C6 F4 | Decrement (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PEA #$BA44           ; F4 44 BA | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    BNE $42              ; D0 42 | Hardware register operation
    STZ $94              ; 64 94 | Store zero to zero page
    BCC $A8              ; 90 A8 | Branch if carry clear
    BEQ $48              ; F0 48 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_200
; Address: $DCCF8C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_200:
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $68              ; 90 68 | Branch if carry clear
    INX                  ; E8 | Increment X register
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_201
; Address: $DCCFA1
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_201:
    JSL $1B3925          ; 22 25 39 1B | Jump to subroutine long
    ORA $0507,X          ; 1D 07 05 | Logical OR with accumulator (absolute,X)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    AND $1F02,X          ; 3D 02 1F | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear
    ASL $1600            ; 0E 00 16 | Arithmetic shift left (absolute)
    BVC $39              ; 50 39 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    JMP $482E            ; 4C 2E 48 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    AND $170D            ; 2D 0D 17 | Logical AND with accumulator (absolute)
    ORA $0E13            ; 0D 13 0E | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $5712            ; 0D 12 57 | Logical OR with accumulator (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $A6              ; 46 A6 | Logical shift right (zero page)
    STZ $B8F8,X          ; 9E F8 B8 | Store zero to absolute,X
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    LSR $00FE            ; 4E FE 00 | Logical shift right (absolute)
    LSR $BE30            ; 4E 30 BE | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_202
; Address: $DCD01E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_202:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $F860,X          ; FE 60 F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    INC $EE86            ; EE 86 EE | Increment (absolute)
    DEC $F4              ; C6 F4 | Decrement (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PEA #$BA44           ; F4 44 BA | Push effective address to stack
    PLP                  ; 28 | Pull processor status from stack
    BNE $42              ; D0 42 | Hardware register operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_203
; Address: $DCD043
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_203:
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_204
; Address: $DCD046
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_204:
    BVC $E0              ; 50 E0 | Game work RAM access
    BNE $E0              ; D0 E0 | Game work RAM access
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_206
; Address: $DCD053
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_206:
    BRA $70              ; 80 70 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_207
; Address: $DCD063
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_207:
    JSR $3C22            ; 20 22 3C | Jump to subroutine
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ASL $3E              ; 06 3E | Arithmetic shift left (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    ASL $0C0F            ; 0E 0F 0C | Arithmetic shift left (absolute)
    ORA $1301            ; 0D 01 13 | Logical OR with accumulator (absolute)
    BPL $1D              ; 10 1D | Branch if positive
    ADC #$2D             ; 69 2D | Add with carry (immediate)
    ROR $36              ; 66 36 | Rotate right (zero page)
    DEY                  ; 88 | Decrement Y register
    ADC $0F10            ; 6D 10 0F | Add with carry (absolute)
    ORA $132C            ; 0D 2C 13 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_208
; Address: $DCD096
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_208:
    JSL $2C121C          ; 22 1C 12 2C | Jump to subroutine long
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_209
; Address: $DCD09F
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_209:
    JMP ($7AB8)          ; 6C B8 7A | Jump to address (absolute indirect)
    EOR #$2A             ; 49 2A | Exclusive OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $0507            ; 0D 07 05 | Logical OR with accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($28,X)          ; 01 28 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    PLA                  ; 68 | Pull accumulator from stack
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $D0              ; F0 D0 | Branch if equal
    BRA $60              ; 80 60 | Branch always
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $F8              ; 30 F8 | Branch if negative
    BVS $F2              ; 70 F2 | Branch if overflow set
    PLP                  ; 28 | Pull processor status from stack
    BPL $78              ; 10 78 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PEA #$8A08           ; F4 08 8A | Push effective address to stack
    ORA $DA              ; 05 DA | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    BMI $DA              ; 30 DA | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_20B
; Address: $DCD0EC
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_20B:
    JSR $9060            ; 20 60 90 | Jump to subroutine
    BEQ $01              ; F0 01 | Branch if equal
    STZ $9E01,X          ; 9E 01 9E | Store zero to absolute,X
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    BCS $60              ; B0 60 | Branch if carry set
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_20D
; Address: $DCD114
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_20D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BPL $12              ; 10 12 | Branch if positive
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    ASL $0C0F            ; 0E 0F 0C | Arithmetic shift left (absolute)
    ORA $1301            ; 0D 01 13 | Logical OR with accumulator (absolute)
    BPL $1D              ; 10 1D | Branch if positive
    ADC #$2D             ; 69 2D | Add with carry (immediate)
    ROR $36              ; 66 36 | Rotate right (zero page)
    DEY                  ; 88 | Decrement Y register
    ADC $0F10            ; 6D 10 0F | Add with carry (absolute)
    ORA $132C            ; 0D 2C 13 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_20E
; Address: $DCD156
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_20E:
    JSL $2C121C          ; 22 1C 12 2C | Jump to subroutine long
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    JMP ($78BC)          ; 6C BC 78 | Jump to address (absolute indirect)
    EOR #$26             ; 49 26 | Exclusive OR with accumulator (immediate)
    ASL $080B,X          ; 1E 0B 08 | Arithmetic shift left (absolute,X)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BIT $E8              ; 24 E8 | Test bits in accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $60              ; 80 60 | Branch always
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $F8              ; 30 F8 | Branch if negative
    BVS $F2              ; 70 F2 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$8A08           ; F4 08 8A | Push effective address to stack
    ORA $DA              ; 05 DA | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_211
; Address: $DCD1AC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_211:
    JSR $9060            ; 20 60 90 | Jump to subroutine
    BEQ $01              ; F0 01 | Branch if equal
    STZ $9E01,X          ; 9E 01 9E | Store zero to absolute,X
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    CPY $E0B4            ; CC B4 E0 | Game work RAM access
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_212
; Address: $DCD1CB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_212:
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    JMP ($F810)          ; 6C 10 F8 | Jump to address (absolute indirect)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_213
; Address: $DCD1D8
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_213:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC $79              ; 65 79 | Add with carry (zero page)
    ORA $0605,X          ; 1D 05 06 | Logical OR with accumulator (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ADC $1F02,X          ; 7D 02 1F | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear
    ORA $0F1A            ; 0D 1A 0F | Logical OR with accumulator (absolute)
    JMP $0E233B          ; 5C 3B 23 0E | Jump to address long
    LSR $4839            ; 4E 39 48 | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ASL $4B00            ; 0E 00 4B | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROL $1F              ; 26 1F | Rotate left (zero page)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $A444            ; 4C 44 A4 | Jump to address
    STZ $B8D8            ; 9C D8 B8 | Store zero to absolute
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    LDY #$78             ; A0 78 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_214
; Address: $DCD24A
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_214:
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    DEC $4CFE            ; CE FE 4C | Decrement (absolute)
    BMI $BC              ; 30 BC | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $F860,X          ; FE 60 F8 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDY $EE4A,X          ; BC 4A EE | Load from absolute,X into Y register
    ASL $EE              ; 06 EE | Arithmetic shift left (zero page)
    PHY                  ; 5A | Push Y register to stack
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CPX $02              ; E4 02 | Compare X register (zero page)
    BMI $48              ; 30 48 | Branch if negative
    BEQ $28              ; F0 28 | Branch if equal
    BEQ $48              ; F0 48 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_215
; Address: $DCD28C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_215:
    BCC $60              ; 90 60 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $08              ; F0 08 | Branch if equal
    INX                  ; E8 | Increment X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_216
; Address: $DCD2A1
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_216:
    JSL $1B3925          ; 22 25 39 1B | Jump to subroutine long
    ORA $0507,X          ; 1D 07 05 | Logical OR with accumulator (absolute,X)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    AND $1F02,X          ; 3D 02 1F | Logical AND with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BVC $2F              ; 50 2F | Branch if overflow clear
    ORA $0F1A            ; 0D 1A 0F | Logical OR with accumulator (absolute)
    JMP $2E433B          ; 5C 3B 43 2E | Jump to address long
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$48             ; 29 48 | Logical AND with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_217
; Address: $DCD2D7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_217:
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_218
; Address: $DCD2DD
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_218:
    JSR $140A            ; 20 0A 14 | Jump to subroutine
    AND #$2E             ; 29 2E | Logical AND with accumulator (immediate)
    ASL $0F13            ; 0E 13 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    BPL $57              ; 10 57 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $A6              ; 46 A6 | Logical shift right (zero page)
    STZ $B8F8,X          ; 9E F8 B8 | Store zero to absolute,X
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BCC $FC              ; 90 FC | Branch if carry clear
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    DEC $00FE            ; CE FE 00 | Decrement (absolute)
    LSR $BE30            ; 4E 30 BE | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX $18              ; E4 18 | Compare X register (zero page)
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $F860,X          ; FE 60 F8 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $EE06            ; AE 06 EE | Load from absolute address into X register
    PHY                  ; 5A | Push Y register to stack
    STZ $7E01            ; 9C 01 7E | Store zero to absolute
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CPX $02              ; E4 02 | Compare X register (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $64              ; 10 64 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_21B
; Address: $DCD354
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_21B:
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    INC                  ; 1A | Increment accumulator
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $141F,X          ; 1D 1F 14 | Logical OR with accumulator (absolute,X)
    ASL $144F            ; 0E 4F 14 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    BPL $51              ; 10 51 | Branch if positive
    ROL $3F40            ; 2E 40 3F | Rotate left (absolute)
    LDY #$5B             ; A0 5B | Load immediate value into Y register
    BMI $0D              ; 30 0D | Branch if negative
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BRA $79              ; 80 79 | Branch always
    BRA $79              ; 80 79 | Branch always
    BRA $70              ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_21C
; Address: $DCD397
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_21C:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BPL $1C              ; 10 1C | Branch if positive
    ORA $0706            ; 0D 06 07 | Logical OR with accumulator (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BRA $C0              ; 80 C0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_21F
; Address: $DCD3DC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_21F:
    BCC $60              ; 90 60 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    BCS $80              ; B0 80 | Branch if carry set
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    ROR $6C              ; 66 6C | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_220
; Address: $DCD3EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_220:
    JSL $B6116C          ; 22 6C 11 B6 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BEQ $48              ; F0 48 | Branch if equal
    BCS $34              ; B0 34 | Branch if carry set
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_221
; Address: $DCD3F8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_221:
    PHA                  ; 48 | Push accumulator to stack
    BCC $6C              ; 90 6C | Branch if carry clear
    BCC $6C              ; 90 6C | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    ORA $925E,X          ; 1D 5E 92 | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $90              ; D0 90 | Branch if not equal
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_222
; Address: $DCD411
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_222:
    STZ $1468,X          ; 9E 68 14 | Store zero to absolute,X
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_223
; Address: $DCD416
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_223:
    JSR $0010            ; 20 10 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BIT $1724            ; 2C 24 17 | Test bits in accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $141F,X          ; 1D 1F 14 | Logical OR with accumulator (absolute,X)
    ASL $004F            ; 0E 4F 00 | Arithmetic shift left (absolute)
    BIT $1F10            ; 2C 10 1F | Test bits in accumulator (absolute)
    BPL $51              ; 10 51 | Branch if positive
    ROL $3F40            ; 2E 40 3F | Rotate left (absolute)
    LDY #$5B             ; A0 5B | Load immediate value into Y register
    BMI $0D              ; 30 0D | Branch if negative
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BRA $79              ; 80 79 | Branch always
    BRA $79              ; 80 79 | Branch always
    BRA $70              ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_224
; Address: $DCD457
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_224:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    ORA $1700,Y          ; 19 00 17 | Logical OR with accumulator (absolute,Y)
    BPL $5E              ; 10 5E | Branch if positive
    AND $0507            ; 2D 07 05 | Logical AND with accumulator (absolute)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $3600            ; 0D 00 36 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_226
; Address: $DCD492
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_226:
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F0              ; 80 F0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_228
; Address: $DCD49C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_228:
    BCC $60              ; 90 60 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    BCS $80              ; B0 80 | Branch if carry set
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    ROR $6C              ; 66 6C | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_229
; Address: $DCD4AC
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_229:
    JSL $B6116C          ; 22 6C 11 B6 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BEQ $48              ; F0 48 | Branch if equal
    BCS $34              ; B0 34 | Branch if carry set
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BCC $6C              ; 90 6C | Branch if carry clear
    BCC $6C              ; 90 6C | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    AND $921E,X          ; 3D 1E 92 | Logical AND with accumulator (absolute,X)
    STZ $DC              ; 64 DC | Store zero to zero page
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    BNE $10              ; D0 10 | Branch if not equal
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    DEC $0408,X          ; DE 08 04 | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $20              ; 10 20 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    AND $3D2D            ; 2D 2D 3D | Logical AND with accumulator (absolute)
    AND $2A2A,X          ; 3D 2A 2A | Logical AND with accumulator (absolute,X)
    AND $65              ; 25 65 | Logical AND with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $1B0F            ; 0D 0F 1B | Logical OR with accumulator (absolute)
    ASL $1E3F,X          ; 1E 3F 1E | Arithmetic shift left (absolute,X)
    LDA $615F,X          ; BD 5F 61 | Read graphics status

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_22A
; Address: $DCD501
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_22A:
    ADC $5F10,Y          ; 79 10 5F | Add with carry (absolute,Y)
    JMP $1F7B3B          ; 5C 3B 7B 1F | Jump to address long
    ASL $5331,X          ; 1E 31 53 | Arithmetic shift left (absolute,X)
    LDX $69              ; A6 69 | Load from zero page into X register
    BCS $4F              ; B0 4F | Branch if carry set
    LDA                  ; BF 4F BF 5F | Read graphics status
    ROR                  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_22B
; Address: $DCD51B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_22B:
    JSR $003F            ; 20 3F 00 | Jump to subroutine
    STY $D163            ; 8C 63 D1 | Store Y register to absolute address
    STA $82AE87          ; 8F 87 AE 82 | Update graphics data
    AND $2789            ; 2D 89 27 | Logical AND with accumulator (absolute)
    EOR ($21,X)          ; 41 21 | PPU graphics register access
    BVC $2F              ; 50 2F | Branch if overflow clear
    LDA                  ; BF 00 DF 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_22C
; Address: $DCD537
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_22C:
    JSR $205F            ; 20 5F 20 | Jump to subroutine
    ORA ($2F),Y          ; 11 2F | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $CE              ; 10 CE | Branch if positive
    DEC $E2E3            ; CE E3 E2 | Decrement (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CPY $F4FC            ; CC FC F4 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $FAFC,X          ; DE FC FA | Decrement (absolute,X)
    INC $D8C2,X          ; FE C2 D8 | Increment (absolute,X)
    PEA #$888C           ; F4 8C 88 | Push effective address to stack
    ROR $F46C            ; 6E 6C F4 | Rotate right (absolute)
    BEQ $78              ; F0 78 | Branch if equal
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_22D
; Address: $DCD570
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_22D:
    CPX $FC              ; E4 FC | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_22E
; Address: $DCD57C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_22E:
    PEA #$FA00           ; F4 00 FA | Push effective address to stack
    DEX                  ; CA | Decrement X register
    LDY $2CD6,X          ; BC D6 2C | Load from absolute,X into Y register
    STX $5A72            ; 8E 72 5A | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_22F
; Address: $DCD588
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_22F:
    TXA                  ; 8A | Transfer X register to accumulator
    STY $705C            ; 8C 5C 70 | Store Y register to absolute address
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $8C              ; 30 8C | Branch if negative
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $80              ; 70 80 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    AND $3D2D            ; 2D 2D 3D | Logical AND with accumulator (absolute)
    AND $6A2A,X          ; 3D 2A 6A | Logical AND with accumulator (absolute,X)
    ADC $65              ; 65 65 | Add with carry (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $1B0F            ; 0D 0F 1B | Logical OR with accumulator (absolute)
    ASL $1E7F,X          ; 1E 7F 1E | Arithmetic shift left (absolute,X)
    LDA $215F,X          ; BD 5F 21 | PPU graphics register access
    ADC $5F10,Y          ; 79 10 5F | Add with carry (absolute,Y)
    JMP $1F7B1B          ; 5C 1B 7B 1F | Jump to address long
    LSR $A611,X          ; 5E 11 A6 | Logical shift right (absolute,X)
    ADC #$8C             ; 69 8C | Add with carry (immediate)
    BCS $4F              ; B0 4F | Branch if carry set
    LDA                  ; BF 4F 9F 6F | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $1F              ; 10 1F | Branch if positive
    CMP $9797,Y          ; D9 97 97 | Compare accumulator (absolute,Y)
    LDX $BC9B,Y          ; BE 9B BC | Load from absolute,Y into X register
    AND $339D,Y          ; 39 9D 33 | Logical AND with accumulator (absolute,Y)
    PHY                  ; 5A | Push Y register to stack
    ROL $002E            ; 2E 2E 00 | Rotate left (absolute)
    LDA                  ; BF 00 DF 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_231
; Address: $DCD5F9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_231:
    JSR $2E01            ; 20 01 2E | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BPL $CE              ; 10 CE | Branch if positive
    DEC $E2E3            ; CE E3 E2 | Decrement (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    CPY $F4FC            ; CC FC F4 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_232
; Address: $DCD61A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_232:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $FAFC,X          ; DE FC FA | Decrement (absolute,X)
    INC $D8C2,X          ; FE C2 D8 | Increment (absolute,X)
    PEA #$888C           ; F4 8C 88 | Push effective address to stack
    ROR $F46C            ; 6E 6C F4 | Rotate right (absolute)
    BEQ $78              ; F0 78 | Branch if equal
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    STY $26D8            ; 8C D8 26 | Store Y register to absolute address
    CPX $FC              ; E4 FC | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    STZ $00              ; 64 00 | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    SBC $DD00,Y          ; F9 00 DD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_233
; Address: $DCD641
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_233:
    JSL $3A6C96          ; 22 96 6C 3A | Jump to subroutine long
    DEC $DC5A,X          ; DE 5A DC | Decrement (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    STY $181C            ; 8C 1C 18 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    BEQ $68              ; F0 68 | Branch if equal
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    INC $DC00,X          ; FE 00 DC | Increment (absolute,X)
    BMI $8C              ; 30 8C | Branch if negative
    BVS $18              ; 70 18 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    BVC $51              ; 50 51 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_234
; Address: $DCD66E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_234:
    JSR $0727            ; 20 27 07 | Jump to subroutine
    AND $7F73,X          ; 3D 73 7F | Logical AND with accumulator (absolute,X)
    AND $1F0F,X          ; 3D 0F 1F | Logical AND with accumulator (absolute,X)
    LSR $383F,X          ; 5E 3F 38 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_235
; Address: $DCD680
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_235:
    JSL $2D6C0E          ; 22 0E 6C 2D | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    ADC $3F2D            ; 6D 2D 3F | Add with carry (absolute)
    ORA $1913,X          ; 1D 13 19 | Logical OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND $13              ; 25 13 | Logical AND with accumulator (zero page)
    ORA $3A3E,X          ; 1D 3E 3A | Logical OR with accumulator (absolute,X)
    ROL $0F34,X          ; 3E 34 0F | Rotate left (absolute,X)
    ASL $3E00,X          ; 1E 00 3E | Arithmetic shift left (absolute,X)
    ROL $6E57            ; 2E 57 6E | Rotate left (absolute)
    STA $BCED,X          ; 9D ED BC | Update graphics data
    JMP $08F8            ; 4C F8 08 | Jump to address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_236
; Address: $DCD6AE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_236:
    PHP                  ; 08 | Push processor status to stack
    ORA $3E              ; 05 3E | Logical OR with accumulator (zero page)
    ROR $FD02,X          ; 7E 02 FD | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_237
; Address: $DCD6C9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_237:
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    PEA #$8080           ; F4 80 80 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_238
; Address: $DCD6D3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_238:
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CPX #$1A             ; E0 1A | Compare X register (immediate)
    CPX $92              ; E4 92 | Compare X register (zero page)
    LDY #$D4             ; A0 D4 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $EC              ; 10 EC | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_239
; Address: $DCD6E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_239:
    PHA                  ; 48 | Push accumulator to stack
    STY $1228            ; 8C 28 12 | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $040A,X          ; BC 0A 04 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_23A
; Address: $DCD6F2
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_23A:
    JSL $840204          ; 22 04 02 84 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BNE $08              ; D0 08 | Branch if not equal
    CPX #$04             ; E0 04 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $D8              ; 30 D8 | Branch if negative
    BNE $38              ; D0 38 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    STZ $78              ; 64 78 | Store zero to zero page
    SED                  ; F8 | Set decimal mode flag
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $10              ; 80 10 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BMI $C8              ; 30 C8 | Branch if negative
    BVS $88              ; 70 88 | Branch if overflow set
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_23B
; Address: $DCD72A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_23B:
    DEC                  ; 3A | Decrement accumulator
    INC                  ; 1A | Increment accumulator
    BVC $51              ; 50 51 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_23C
; Address: $DCD72E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_23C:
    JSR $0727            ; 20 27 07 | Jump to subroutine
    AND $7F73,X          ; 3D 73 7F | Logical AND with accumulator (absolute,X)
    AND $1F0F,X          ; 3D 0F 1F | Logical AND with accumulator (absolute,X)
    LSR $383F,X          ; 5E 3F 38 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_23D
; Address: $DCD740
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_23D:
    JSL $2D6C0E          ; 22 0E 6C 2D | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    ADC $3F2D            ; 6D 2D 3F | Add with carry (absolute)
    BPL $19              ; 10 19 | Branch if positive
    ROL $13              ; 26 13 | Rotate left (zero page)
    ORA $3A3E,X          ; 1D 3E 3A | Logical OR with accumulator (absolute,X)
    ROL $0F34,X          ; 3E 34 0F | Rotate left (absolute,X)
    AND $3900,Y          ; 39 00 39 | Logical AND with accumulator (absolute,Y)
    BIT $79              ; 24 79 | Test bits in accumulator (zero page)
    LSR $67              ; 46 67 | Logical shift right (zero page)
    EOR $1EE6,Y          ; 59 E6 1E | Exclusive OR with accumulator (absolute,Y)
    CPY $5E3C            ; CC 3C 5E | Compare Y register (absolute)
    ROL $073B            ; 2E 3B 07 | Rotate left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $02              ; 30 02 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    ADC $7E01,Y          ; 79 01 7E | Add with carry (absolute,Y)
    ROL $0D              ; 26 0D | Rotate left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_23E
; Address: $DCD789
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_23E:
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$DA             ; C0 DA | Compare Y register (immediate)
    PHX                  ; DA | Push X register to stack
    CLD                  ; D8 | Clear decimal mode flag
    PLX                  ; FA | Pull X register from stack
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_23F
; Address: $DCD793
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_23F:
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $E6              ; F0 E6 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CMP $19E6,Y          ; D9 E6 19 | Compare accumulator (absolute,Y)
    INC $9D              ; E6 9D | Increment (zero page)
    LDY #$D2             ; A0 D2 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $E4              ; 10 E4 | Branch if positive
    ROR $44              ; 66 44 | Rotate right (zero page)
    STA ($24,X)          ; 81 24 | Update graphics data
    BIT #$CE             ; 89 CE | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_240
; Address: $DCD7B0
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_240:
    ORA $2502            ; 0D 02 25 | Logical OR with accumulator (absolute)
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $84              ; F0 84 | Branch if equal
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    CPX $6C78            ; EC 78 6C | Compare X register (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    BMI $D8              ; 30 D8 | Branch if negative
    BEQ $08              ; F0 08 | Branch if equal
    BCS $FA              ; B0 FA | Branch if carry set
    STY $FA              ; 84 FA | Store Y register to zero page
    PLY                  ; 7A | Pull Y register from stack
    STY $38              ; 84 38 | Store Y register to zero page
    CPY $38              ; C4 38 | Compare Y register (zero page)
    CPX $38              ; E4 38 | Compare X register (zero page)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ROR $242E            ; 6E 2E 24 | Rotate right (absolute)
    ORA $70              ; 05 70 | Logical OR with accumulator (zero page)
    CPY #$4A             ; C0 4A | Compare Y register (immediate)
    ORA $371D,X          ; 1D 1D 37 | Logical OR with accumulator (absolute,X)
    ROL $1D3F            ; 2E 3F 1D | Rotate left (absolute)
    ASL $3E79,X          ; 1E 79 3E | Arithmetic shift left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $0D00,X          ; 1D 00 0D | Logical OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    JMP ($222B)          ; 6C 2B 22 | Jump to address (absolute indirect)
    ASL $2C              ; 06 2C | Arithmetic shift left (zero page)
    BVC $19              ; 50 19 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_241
; Address: $DCD80F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_241:
    JSR $1008            ; 20 08 10 | Jump to subroutine
    BPL $11              ; 10 11 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BMI $19              ; 30 19 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_242
; Address: $DCD81E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_242:
    EOR #$06             ; 49 06 | Exclusive OR with accumulator (immediate)
    STX $CFA0            ; 8E A0 CF | Store X register to absolute address
    BCS $BF              ; B0 BF | Branch if carry set
    JMP $7A9B            ; 4C 9B 7A | Jump to address
    EOR ($31),Y          ; 51 31 | Exclusive OR with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $11              ; C6 11 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_243
; Address: $DCD835
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_243:
    PHP                  ; 08 | Push processor status to stack
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $34              ; 70 34 | Branch if overflow set
    BCS $00              ; B0 00 | Branch if carry set
    LDX #$02             ; A2 02 | Load immediate value into X register
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCS $F0              ; B0 F0 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $78              ; F0 78 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    TSX                  ; BA | Transfer stack pointer to X register
    SEI                  ; 78 | Set interrupt disable flag
    STA $2976,Y          ; 99 76 29 | Update graphics data
    BVC $BA              ; 50 BA | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    NOP                  ; EA | No operation
    BMI $D6              ; 30 D6 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    STZ $26              ; 64 26 | Store zero to zero page
    CPY $E9              ; C4 E9 | Compare Y register (zero page)
    SBC $1506,Y          ; F9 06 15 | Subtract with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $0D02            ; 4D 02 0D | Exclusive OR with accumulator (absolute)
    ORA $9A16,Y          ; 19 16 9A | Logical OR with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    CPX #$14             ; E0 14 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ADC $C0              ; 65 C0 | Add with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_244
; Address: $DCD886
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_244:
    BCS $15              ; B0 15 | Branch if carry set
    SBC ($84),Y          ; F1 84 | Subtract with carry ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    STY $F064            ; 8C 64 F0 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_245
; Address: $DCD88F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_245:
    JSR $04F9            ; 20 F9 04 | Jump to subroutine
    STY $BB              ; 84 BB | Store Y register to zero page
    PLX                  ; FA | Pull X register from stack
    DEY                  ; 88 | Decrement Y register
    PEA #$F008           ; F4 08 F0 | Push effective address to stack
    BCC $60              ; 90 60 | Branch if carry clear
    ROR $242E            ; 6E 2E 24 | Rotate right (absolute)
    ORA $70              ; 05 70 | Logical OR with accumulator (zero page)
    CPY #$4A             ; C0 4A | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_246
; Address: $DCD8B4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_246:
    ORA $371D,X          ; 1D 1D 37 | Logical OR with accumulator (absolute,X)
    ROL $1D3F            ; 2E 3F 1D | Rotate left (absolute)
    ASL $3E79,X          ; 1E 79 3E | Arithmetic shift left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $0D00,X          ; 1D 00 0D | Logical OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    JMP ($222B)          ; 6C 2B 22 | Jump to address (absolute indirect)
    ASL $1C              ; 06 1C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_247
; Address: $DCD8CD
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_247:
    JSR $609B            ; 20 9B 60 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $12              ; 10 12 | Branch if positive
    BPL $11              ; 10 11 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BMI $19              ; 30 19 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    LDA $EF40,X          ; BD 40 EF | Read graphics status
    BCS $9F              ; B0 9F | Branch if carry set
    PLY                  ; 7A | Pull Y register from stack
    EOR ($31),Y          ; 51 31 | Exclusive OR with accumulator ((zero page),Y)
    BMI $10              ; 30 10 | Branch if negative
    BPL $04              ; 10 04 | Branch if positive
    ORA $BF02,X          ; 1D 02 BF | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    AND ($0E),Y          ; 31 0E | Logical AND with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    BRA $80              ; 80 80 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $04              ; B0 04 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCS $F0              ; B0 F0 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $7C              ; F0 7C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    TXS                  ; 9A | Transfer X register to stack pointer
    SEI                  ; 78 | Set interrupt disable flag
    AND #$F6             ; 29 F6 | Logical AND with accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    CLC                  ; 18 | Clear carry flag
    NOP                  ; EA | No operation
    BMI $D2              ; 30 D2 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ROR $20              ; 66 20 | Rotate right (zero page)
    CPY $D6              ; C4 D6 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_248
; Address: $DCD92D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_248:
    ORA $39              ; 05 39 | Logical OR with accumulator (zero page)
    REP #$11             ; C2 11 | Reset processor status bits
    ASL $024D            ; 0E 4D 02 | Arithmetic shift left (absolute)
    ORA $1D02            ; 0D 02 1D | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    STA $2A16,Y          ; 99 16 2A | Update graphics data
    CMP $F024,Y          ; D9 24 F0 | Compare accumulator (absolute,Y)
    STA $E6E6,Y          ; 99 E6 E6 | Update graphics data
    BCS $15              ; B0 15 | Branch if carry set
    BNE $05              ; D0 05 | Branch if not equal
    SBC ($84),Y          ; F1 84 | Subtract with carry ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    STY $00              ; 84 00 | Store Y register to zero page
    BEQ $00              ; F0 00 | Branch if equal
    SBC $BB04,Y          ; F9 04 BB | Subtract with carry (absolute,Y)
    BIT $FA              ; 24 FA | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    BRA $04              ; 80 04 | Branch always
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $061E,X          ; 1E 1E 06 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_249
; Address: $DCD96C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_249:
    JSR $183B            ; 20 3B 18 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $1F0F            ; 0D 0F 1F | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $060C            ; 0E 0C 06 | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $03              ; 10 03 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA ($1C),Y          ; 11 1C | Logical OR with accumulator ((zero page),Y)
    BMI $2D              ; 30 2D | Branch if negative
    BMI $0D              ; 30 0D | Branch if negative
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $1E01,X          ; 3E 01 1E | Rotate left (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    JMP $AC4C            ; 4C 4C AC | Jump to address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_24A
; Address: $DCD9C9
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_24A:
    LDY $585C            ; AC 5C 58 | Load from absolute address into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    CPX $E0              ; E4 E0 | Game work RAM access
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    LDY $FECE,X          ; BC CE FE | Load from absolute,X into Y register
    LDY $F8F0,X          ; BC F0 F8 | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    BVS $36              ; 70 36 | Branch if overflow set
    BNE $B6              ; D0 B6 | Branch if not equal
    LDY $FC              ; A4 FC | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_24B
; Address: $DCD9E9
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_24B:
    JSR $4838            ; 20 38 48 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    LDY $C8              ; A4 C8 | Load from zero page into Y register
    SEC                  ; 38 | Set carry flag
    LDY $301C,X          ; BC 1C 30 | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    JMP ($F02C)          ; 6C 2C F0 | Jump to address (absolute indirect)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $EAF4            ; EC F4 EA | Compare X register (absolute)
    AND $3D37,Y          ; 39 37 3D | Logical AND with accumulator (absolute,Y)
    BPL $BE              ; 10 BE | Branch if positive
    BMI $EC              ; 30 EC | Branch if negative
    BVS $10              ; 70 10 | Branch if overflow set
    LDY #$7C             ; A0 7C | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    ROR $BF40,X          ; 7E 40 BF | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_24E
; Address: $DCDA1D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_24E:
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $061E,X          ; 1E 1E 06 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_24F
; Address: $DCDA2C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_24F:
    JSR $1B3B            ; 20 3B 1B | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $1F0F            ; 0D 0F 1F | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA $0500,Y          ; 19 00 05 | Logical OR with accumulator (absolute,Y)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0E              ; 10 0E | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_250
; Address: $DCDA4A
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_250:
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($5B,X)          ; 01 5B | Logical OR with accumulator ((zero page,X))
    ASL $3416,X          ; 1E 16 34 | Arithmetic shift left (absolute,X)
    BIT $2C3C            ; 2C 3C 2C | Test bits in accumulator (absolute)
    BPL $0D              ; 10 0D | Branch if positive
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $3C01,X          ; 1E 01 3C | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    JMP $AC4C            ; 4C 4C AC | Jump to address
    LDY $585C            ; AC 5C 58 | Load from absolute address into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    STY $E0              ; 84 E0 | Game work RAM access
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    LDY $FECE,X          ; BC CE FE | Load from absolute,X into Y register
    LDY $F8F0,X          ; BC F0 F8 | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $C0              ; 84 C0 | Store Y register to zero page
    LSR $44              ; 46 44 | Logical shift right (zero page)
    BVC $16              ; 50 16 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $98C4            ; AC C4 98 | Load from absolute address into Y register
    PLA                  ; 68 | Pull accumulator from stack
    STZ $B06C            ; 9C 6C B0 | Store zero to absolute
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $B04C            ; AC 4C B0 | Load from absolute address into Y register
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_252
; Address: $DCDABD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_252:
    JSR $001C            ; 20 1C 00 | Jump to subroutine
    STZ $E662,X          ; 9E 62 E6 | Store zero to absolute,X
    TXA                  ; 8A | Transfer X register to accumulator
    PLP                  ; 28 | Pull processor status from stack
    BIT $2C1A            ; 2C 1A 2C | Test bits in accumulator (absolute)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    STY $0E20            ; 8C 20 0E | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_253
; Address: $DCDAD4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_253:
    STZ $5E80,X          ; 9E 80 5E | Store zero to absolute,X
    LDY #$5E             ; A0 5E | Load immediate value into Y register
    LDY #$4C             ; A0 4C | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_254
; Address: $DCDADD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_254:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $0079,Y          ; 79 79 00 | Add with carry (absolute,Y)
    ORA $26EF,Y          ; 19 EF 26 | Logical OR with accumulator (absolute,Y)
    ROR $6F20,X          ; 7E 20 6F | Rotate right (absolute,X)
    AND #$69             ; 29 69 | Logical AND with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_255
; Address: $DCDB0A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_255:
    ASL $9E1E,X          ; 1E 1E 9E | Arithmetic shift left (absolute,X)
    LSR $7A8F,X          ; 5E 8F 7A | Logical shift right (absolute,X)
    LDX $5F              ; A6 5F | Load from zero page into X register
    BCS $5F              ; B0 5F | Branch if carry set
    LDA                  ; BF 5F BF 5F | Read graphics status
    ROL $057F            ; 2E 7F 05 | Rotate left (absolute)
    ADC $0A              ; 65 0A | Add with carry (zero page)
    ORA $332C,Y          ; 19 2C 33 | Logical OR with accumulator (absolute,Y)
    JMP $275823          ; 5C 23 58 27 | Jump to address long
    SEI                  ; 78 | Set interrupt disable flag
    ORA $3F00,X          ; 1D 00 3F | Logical OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_257
; Address: $DCDB44
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_257:
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_258
; Address: $DCDB54
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_258:
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $DC              ; F0 DC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    JMP $7D65F8          ; 5C F8 65 7D | Jump to address long
    ROL $6B3C,X          ; 3E 3C 6B | Rotate left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    CMP $CADC,X          ; DD DC CA | Compare accumulator (absolute,X)
    CPY $5C7A            ; CC 7A 5C | Compare Y register (absolute)
    ADC $F8              ; 65 F8 | Add with carry (zero page)
    SBC $FEFE,X          ; FD FE FE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FED6,X          ; FE D6 FE | Increment (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_259
; Address: $DCDB7D
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_259:
    BCS $D8              ; B0 D8 | Branch if carry set
    CPY $D6              ; C4 D6 | Compare Y register (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $CF33            ; CD 33 CF | Compare accumulator (absolute)
    BMI $75              ; 30 75 | Branch if negative
    TXA                  ; 8A | Transfer X register to accumulator
    LDX $F0C0,Y          ; BE C0 F0 | Load from absolute,Y into X register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0039,Y          ; 19 39 00 | Logical OR with accumulator (absolute,Y)
    EOR $262F,Y          ; 59 2F 26 | Exclusive OR with accumulator (absolute,Y)
    ROL $2F20,X          ; 3E 20 2F | Rotate left (absolute,X)
    AND #$09             ; 29 09 | Logical AND with accumulator (immediate)
    LSR $4E3E,X          ; 5E 3E 4E | Logical shift right (absolute,X)
    ROL $1A3F,X          ; 3E 3F 1A | Rotate left (absolute,X)
    ROR $1F              ; 66 1F | Rotate right (zero page)
    BVS $1F              ; 70 1F | Branch if overflow set
    ASL $251F            ; 0E 1F 25 | Arithmetic shift left (absolute)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    ORA $3728,Y          ; 19 28 37 | Logical OR with accumulator (absolute,Y)
    EOR $7966,Y          ; 59 66 79 | Exclusive OR with accumulator (absolute,Y)
    ASL $57              ; 06 57 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ROL $0701,X          ; 3E 01 07 | Rotate left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $3F00,X          ; 1D 00 3F | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_25B
; Address: $DCDC04
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_25B:
    BCC $90              ; 90 90 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_25C
; Address: $DCDC14
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_25C:
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $DC              ; F0 DC | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_25D
; Address: $DCDC1D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_25D:
    SED                  ; F8 | Set decimal mode flag
    JMP $7D65F8          ; 5C F8 65 7D | Jump to address long
    ROL $6B3C,X          ; 3E 3C 6B | Rotate left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    CMP $CADC,X          ; DD DC CA | Compare accumulator (absolute,X)
    CPY $5E79            ; CC 79 5E | Compare Y register (absolute)
    ADC $F8              ; 65 F8 | Add with carry (zero page)
    SBC $FEFE,X          ; FD FE FE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FED6,X          ; FE D6 FE | Increment (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    SED                  ; F8 | Set decimal mode flag
    BCS $D8              ; B0 D8 | Branch if carry set
    DEC $D5              ; C6 D5 | Decrement (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    STZ $9D              ; 64 9D | Store zero to zero page
    STA $0F72            ; 8D 72 0F | Update graphics data
    BEQ $F6              ; F0 F6 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STZ $F0F0            ; 9C F0 F0 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_25E
; Address: $DCDC50
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_25E:
    SEC                  ; 38 | Set carry flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_25F
; Address: $DCDC62
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_25F:
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)
    ASL $1414,X          ; 1E 14 14 | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ROL $601F,X          ; 3E 1F 60 | Rotate left (absolute,X)
    LDX #$3E             ; A2 3E | Load immediate value into X register
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BVS $31              ; 70 31 | Branch if overflow set
    TAX                  ; AA | Transfer accumulator to X register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_260
; Address: $DCDC92
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_260:
    JSL $2F1F5F          ; 22 5F 1F 2F | Jump to subroutine long
    ROL $3E3E,X          ; 3E 3E 3E | Rotate left (absolute,X)
    ROR $5C1E            ; 6E 1E 5C | Rotate right (absolute)
    DEC                  ; 3A | Decrement accumulator
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    INC $DC9E            ; EE 9E DC | Increment (absolute)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_261
; Address: $DCDCA9
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_261:
    PLP                  ; 28 | Pull processor status from stack
    LDY $6E47            ; AC 47 6E | Load from absolute address into Y register
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA $3C              ; 05 3C | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    INC $7C07,X          ; FE 07 7C | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BNE $E0              ; D0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $60              ; F0 60 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PHX                  ; DA | Push X register to stack
    CPX #$18             ; E0 18 | Compare X register (immediate)
    SEP #$0C             ; E2 0C | Set processor status bits
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $EC              ; 10 EC | Branch if positive
    CPX #$48             ; E0 48 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $D6              ; 50 D6 | Branch if overflow clear
    TXA                  ; 8A | Transfer X register to accumulator
    STY $22              ; 84 22 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    BVC $08              ; 50 08 | Branch if overflow clear
    STZ $98A8            ; 9C A8 98 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_262
; Address: $DCDD04
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_262:
    BVS $18              ; 70 18 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    CPY $88              ; C4 88 | Compare Y register (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_265
; Address: $DCDD1A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_265:
    JSR $8008            ; 20 08 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)
    ASL $1414,X          ; 1E 14 14 | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ROL $601F,X          ; 3E 1F 60 | Rotate left (absolute,X)
    LDX #$3E             ; A2 3E | Load immediate value into X register
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BVS $31              ; 70 31 | Branch if overflow set
    TAX                  ; AA | Transfer accumulator to X register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_266
; Address: $DCDD52
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_266:
    JSL $2F1F5F          ; 22 5F 1F 2F | Jump to subroutine long
    ROL $3E3E,X          ; 3E 3E 3E | Rotate left (absolute,X)
    ROR $5C1E            ; 6E 1E 5C | Rotate right (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    ADC $6E56,Y          ; 79 56 6E | Add with carry (absolute,Y)
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    JMP $3435            ; 4C 35 34 | Jump to address
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    BVS $06              ; 70 06 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $50              ; 50 50 | Branch if overflow clear
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    INC                  ; 1A | Increment accumulator
    ASL $DA              ; 06 DA | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_267
; Address: $DCDD94
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_267:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BNE $E0              ; D0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BEQ $63              ; F0 63 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_268
; Address: $DCDDA1
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_268:
    JSL $085220          ; 22 20 52 08 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    BPL $E4              ; 10 E4 | Branch if positive
    CPX #$40             ; E0 40 | Compare X register (immediate)
    STZ $D255            ; 9C 55 D2 | Store zero to absolute
    STA $2582            ; 8D 82 25 | Update graphics data
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC $F000,X          ; DE 00 F0 | Decrement (absolute,X)
    BVS $0C              ; 70 0C | Branch if overflow set
    BIT $E020            ; 2C 20 E0 | Game work RAM access
    CPX $50              ; E4 50 | Compare X register (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($2C28)          ; 6C 28 2C | Jump to address (absolute indirect)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    LDY #$22             ; A0 22 | Load immediate value into Y register
    CPY #$2A             ; C0 2A | Compare Y register (immediate)
    CPY $5A              ; C4 5A | Compare Y register (zero page)
    CPX $6A              ; E4 6A | Compare X register (zero page)
    PEA #$F42A           ; F4 2A F4 | Push effective address to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $3130,X          ; 1D 30 31 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_269
; Address: $DCDDEE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_269:
    JSR $000E            ; 20 0E 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA $3D0E,X          ; 1D 0E 3D | Logical OR with accumulator (absolute,X)
    ASL $1F10,X          ; 1E 10 1F | Arithmetic shift left (absolute,X)
    LDA ($99,X)          ; A1 99 | Read graphics status
    AND ($A8),Y          ; 31 A8 | Logical AND with accumulator ((zero page),Y)
    AND $1658            ; 2D 58 16 | Logical AND with accumulator (absolute)
    LDX $432A            ; AE 2A 43 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_26A
; Address: $DCDE0D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_26A:
    JSR $2041            ; 20 41 20 | Jump to subroutine
    STA $1F              ; 85 1F | Update graphics data
    SEC                  ; 38 | Set carry flag
    LDY $783A,X          ; BC 3A 78 | Load from absolute,X into Y register
    BMI $31              ; 30 31 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_26B
; Address: $DCDE19
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_26B:
    SEI                  ; 78 | Set interrupt disable flag
    AND $1B50,X          ; 3D 50 1B | Logical AND with accumulator (absolute,X)
    ORA #$36             ; 09 36 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    ADC $994E,X          ; 7D 4E 99 | Add with carry (absolute,X)
    SBC $53B3,Y          ; F9 B3 53 | Subtract with carry (absolute,Y)
    ASL $0101            ; 0E 01 01 | Arithmetic shift left (absolute)
    SBC $730F,Y          ; F9 0F 73 | Subtract with carry (absolute,Y)
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_26C
; Address: $DCDE44
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_26C:
    JSR $D020            ; 20 20 D0 | Jump to subroutine
    BNE $30              ; D0 30 | Branch if not equal
    BMI $38              ; 30 38 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag
    STZ $760E,X          ; 9E 0E 76 | Store zero to absolute,X
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    LDA                  ; BF 70 B8 77 | Read graphics status
    PHX                  ; DA | Push X register to stack
    JMP ($04AE)          ; 6C AE 04 | Jump to address (absolute indirect)
    LDX $18              ; A6 18 | Load from zero page into X register
    INC $CC28            ; EE 28 CC | Increment (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    CMP ($12,X)          ; C1 12 | Compare accumulator ((zero page,X))
    STA ($0E,X)          ; 81 0E | Update graphics data
    EOR ($7A,X)          ; 41 7A | Exclusive OR with accumulator ((zero page,X))
    AND $5D3A,X          ; 3D 3A 5D | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    LDY $C800,X          ; BC 00 C8 | Load from absolute,X into Y register
    ROL $90              ; 26 90 | Rotate left (zero page)
    ROR $0E              ; 66 0E | Rotate right (zero page)
    BMI $B8              ; 30 B8 | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    ROL $1C1A,X          ; 3E 1A 1C | Rotate left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $E0              ; 30 E0 | Game work RAM access
    PLX                  ; FA | Pull X register from stack
    CPX $3A              ; E4 3A | Compare X register (zero page)
    PEA #$F418           ; F4 18 F4 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_26D
; Address: $DCDE98
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_26D:
    PHP                  ; 08 | Push processor status to stack
    PEA #$0014           ; F4 14 00 | Push effective address to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $3130,X          ; 1D 30 31 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_26E
; Address: $DCDEAE
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_26E:
    JSR $000E            ; 20 0E 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA $3D0E,X          ; 1D 0E 3D | Logical OR with accumulator (absolute,X)
    ASL $1F10,X          ; 1E 10 1F | Arithmetic shift left (absolute,X)
    LDA ($99,X)          ; A1 99 | Read graphics status
    AND ($A8),Y          ; 31 A8 | Logical AND with accumulator ((zero page),Y)
    AND $1658            ; 2D 58 16 | Logical AND with accumulator (absolute)
    LDX $432A            ; AE 2A 43 | Load from absolute address into X register
    BPL $41              ; 10 41 | Branch if positive
    BMI $85              ; 30 85 | Branch if negative
    SEC                  ; 38 | Set carry flag
    LDY $783A,X          ; BC 3A 78 | Load from absolute,X into Y register
    BMI $31              ; 30 31 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    AND $2B50,X          ; 3D 50 2B | Logical AND with accumulator (absolute,X)
    ORA #$26             ; 09 26 | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $1E6D            ; 2C 6D 1E | Test bits in accumulator (absolute)
    LDY $F9DC,X          ; BC DC F9 | Load from absolute,X into Y register
    ORA $11E1,Y          ; 19 E1 11 | Logical OR with accumulator (absolute,Y)
    BVC $07              ; 50 07 | Branch if overflow clear
    ADC $510F,Y          ; 79 0F 51 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_26F
; Address: $DCDF04
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_26F:
    JSR $D020            ; 20 20 D0 | Jump to subroutine
    BNE $30              ; D0 30 | Branch if not equal
    BMI $38              ; 30 38 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    BPL $90              ; 10 90 | Branch if positive
    BPL $7C              ; 10 7C | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BVS $E0              ; 70 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    BVS $BE              ; 70 BE | Branch if overflow set
    BVS $10              ; 70 10 | Branch if overflow set
    INC $CC5C            ; EE 5C CC | Increment (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    LDY $00              ; A4 00 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_270
; Address: $DCDF25
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_270:
    LDY $10              ; A4 10 | Load from zero page into Y register
    CPX $20              ; E4 20 | Compare X register (zero page)
    CPY $4C64            ; CC 64 4C | Compare Y register (absolute)
    CPY $10              ; C4 10 | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    ROR $3432            ; 6E 32 34 | Rotate right (absolute)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_271
; Address: $DCDF3D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_271:
    JSR $6C90            ; 20 90 6C | Jump to subroutine
    BIT $70BC            ; 2C BC 70 | Test bits in accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    TYA                  ; 98 | Transfer Y register to accumulator
    REP #$E8             ; C2 E8 | Reset processor status bits
    CPX $E8              ; E4 E8 | Compare X register (zero page)
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_272
; Address: $DCDF50
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_272:
    JSR $F0EC            ; 20 EC F0 | Jump to subroutine
    CPX #$B6             ; E0 B6 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    BPL $68              ; 10 68 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_273
; Address: $DCDF6C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_273:
    JSR $2038            ; 20 38 20 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $3A              ; 06 3A | Arithmetic shift left (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0A              ; 10 0A | Branch if positive
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0500            ; 0E 00 05 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_274
; Address: $DCDFB6
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_274:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $14CC            ; CC CC 14 | Compare Y register (absolute)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $A0              ; F0 A0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $CC              ; F0 CC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    DEC $C4              ; C6 C4 | Decrement (zero page)
    ORA $BC              ; 05 BC | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $0A8C            ; 0E 8C 0A | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register
    WDM #$55             ; 42 55 | Reserved instruction
    BPL $2E              ; 10 2E | Branch if positive
    STY $D83C            ; 8C 3C D8 | Store Y register to absolute address
    TSX                  ; BA | Transfer stack pointer to X register
    SEI                  ; 78 | Set interrupt disable flag
    LDY $DC3C,X          ; BC 3C DC | Load from absolute,X into Y register
    CLV                  ; B8 | Clear overflow flag
    INC                  ; 1A | Increment accumulator
    BIT $C4              ; 24 C4 | Test bits in accumulator (zero page)
    DEC $171A,X          ; DE 1A 17 | Decrement (absolute,X)
    EOR $5D1B,Y          ; 59 1B 5D | Exclusive OR with accumulator (absolute,Y)
    LDA $F646            ; AD 46 F6 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    BPL $A0              ; 10 A0 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    ROL $BF00,X          ; 3E 00 BF | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 50 B6 50 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_275
; Address: $DCE02C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_275:
    JSR $2038            ; 20 38 20 | Jump to subroutine
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_276
; Address: $DCE040
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_276:
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0B              ; 10 0B | Branch if positive
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1B08            ; 0E 08 1B | Arithmetic shift left (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $2C01,X          ; 1E 01 2C | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $14              ; 06 14 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CPY $54CC            ; CC CC 54 | Compare Y register (absolute)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $A0              ; F0 A0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $E8              ; F0 E8 | Branch if equal
    BEQ $CC              ; F0 CC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ASL $64              ; 06 64 | Arithmetic shift left (zero page)
    ADC $6C              ; 65 6C | Add with carry (zero page)
    INC                  ; 1A | Increment accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $0A4C            ; 0E 4C 0A | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    ROL $1C0C            ; 2E 0C 1C | Rotate left (absolute)
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    CLV                  ; B8 | Clear overflow flag
    LDY $BC5C,X          ; BC 5C BC | Load from absolute,X into Y register
    JMP $58669A          ; 5C 9A 66 58 | Jump to address long
    TAX                  ; AA | Transfer accumulator to X register
    JMP $44948C          ; 5C 8C 94 44 | Jump to address long
    STZ $666A,X          ; 9E 6A 66 | Store zero to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_277
; Address: $DCE0C9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_277:
    BIT $52              ; 24 52 | Test bits in accumulator (zero page)
    LDY $20DC            ; AC DC 20 | Load from absolute address into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PLA                  ; 68 | Pull accumulator from stack
    ASL $1E60            ; 0E 60 1E | Arithmetic shift left (absolute)
    BRA $5E              ; 80 5E | Branch always
    LDY #$56             ; A0 56 | Load immediate value into Y register
    LDY #$0C             ; A0 0C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_278
; Address: $DCE0DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_278:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $2608,X          ; 1E 08 26 | Arithmetic shift left (absolute,X)
    BMI $10              ; 30 10 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_279
; Address: $DCE6ED
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_279:
    JSR $0848            ; 20 48 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $3F              ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_27A
; Address: $DCE6FC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_27A:
    JSR $083F            ; 20 3F 08 | Jump to subroutine
    ROL $271E,X          ; 3E 1E 27 | Rotate left (absolute,X)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ROL $1B              ; 26 1B | Rotate left (zero page)
    SEC                  ; 38 | Set carry flag
    ORA $5E21,X          ; 1D 21 5E | Logical OR with accumulator (absolute,X)
    ASL $090F            ; 0E 0F 09 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $0C              ; 10 0C | Branch if positive
    BMI $C6              ; 30 C6 | Branch if negative
    ORA $5CC3,Y          ; 19 C3 5C | Logical OR with accumulator (absolute,Y)
    BEQ $0F              ; F0 0F | Branch if equal
    BPL $03              ; 10 03 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_27B
; Address: $DCE726
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_27B:
    JSR $0170            ; 20 70 01 | Jump to subroutine
    AND ($1B,X)          ; 21 1B | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $41              ; 05 41 | Logical OR with accumulator (zero page)
    LSR $2080            ; 4E 80 20 | Logical shift right (absolute)
    PLB                  ; AB | Pull data bank register from stack
    DEY                  ; 88 | Decrement Y register
    EOR ($0F),Y          ; 51 0F | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_27C
; Address: $DCE73A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_27C:
    JSL $080807          ; 22 07 08 08 | Jump to subroutine long
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BMI $0C              ; 30 0C | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_27D
; Address: $DCE758
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_27D:
    BMI $FC              ; 30 FC | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROL $FC24            ; 2E 24 FC | Rotate left (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPX $88              ; E4 88 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_27E
; Address: $DCE767
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_27E:
    JSR $D864            ; 20 64 D8 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    SED                  ; F8 | Set decimal mode flag
    BEQ $24              ; F0 24 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BCC $E0              ; 90 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $8E              ; F0 8E | Branch if equal
    BVS $57              ; 70 57 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    DEX                  ; CA | Decrement X register
    PEA #$929E           ; F4 9E 92 | Push effective address to stack
    PLY                  ; 7A | Pull Y register from stack
    BCS $40              ; B0 40 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    PLX                  ; FA | Pull X register from stack
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_281
; Address: $DCE7A2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_281:
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $2608,X          ; 1E 08 26 | Arithmetic shift left (absolute,X)
    BMI $10              ; 30 10 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_282
; Address: $DCE7AD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_282:
    JSR $0848            ; 20 48 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $3F              ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_283
; Address: $DCE7BC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_283:
    JSR $083F            ; 20 3F 08 | Jump to subroutine
    ROL $271E,X          ; 3E 1E 27 | Rotate left (absolute,X)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ROL $1B              ; 26 1B | Rotate left (zero page)
    SBC ($1E),Y          ; F1 1E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_284
; Address: $DCE7CE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_284:
    JSR $041F            ; 20 1F 04 | Jump to subroutine
    ASL $090F            ; 0E 0F 09 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $06              ; 10 06 | Branch if positive
    SEC                  ; 38 | Set carry flag
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    BPL $43              ; 10 43 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_285
; Address: $DCE7E6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_285:
    AND ($71,X)          ; 21 71 | Logical AND with accumulator ((zero page,X))
    ROL $1F              ; 26 1F | Rotate left (zero page)
    ORA $0102            ; 0D 02 01 | Logical OR with accumulator (absolute)
    CPX #$67             ; E0 67 | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    PLB                  ; AB | Pull data bank register from stack
    BIT #$07             ; 89 07 | Test bits in accumulator (immediate)
    LSR $0E              ; 46 0E | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_286
; Address: $DCE7FA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_286:
    JSR $0600            ; 20 00 06 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BMI $0C              ; 30 0C | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $FC              ; 30 FC | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROL $FC24            ; 2E 24 FC | Rotate left (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPX $88              ; E4 88 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_287
; Address: $DCE827
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_287:
    JSR $D864            ; 20 64 D8 | Jump to subroutine
    DEC $0C3C            ; CE 3C 0C | Decrement (absolute)
    SED                  ; F8 | Set decimal mode flag
    STY $7A              ; 84 7A | Store Y register to zero page
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    BCC $E0              ; 90 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    BCS $AA              ; B0 AA | Branch if carry set
    JMP $0FDBC5          ; 5C C5 DB 0F | Jump to address long
    ORA #$8B             ; 09 8B | Logical OR with accumulator (immediate)
    STA $46DE            ; 8D DE 46 | Update graphics data
    INX                  ; E8 | Increment X register
    BPL $50              ; 10 50 | Branch if positive
    LDY #$C2             ; A0 C2 | Load immediate value into Y register
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $8F              ; F0 8F | Branch if equal
    BEQ $46              ; F0 46 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_288
; Address: $DCE85B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_288:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BPL $E0              ; 10 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_289
; Address: $DCE868
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_289:
    JSL $002002          ; 22 02 20 00 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    STZ $24              ; 64 24 | Store zero to zero page
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    AND #$05             ; 29 05 | Logical AND with accumulator (immediate)
    AND $1E15,Y          ; 39 15 1E | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ROL $6E07,X          ; 3E 07 6E | Rotate left (absolute,X)
    ORA $1812,Y          ; 19 12 18 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $03              ; 10 03 | Branch if positive
    LSR $2F01            ; 4E 01 2F | Logical shift right (absolute)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ROL $3D0C,X          ; 3E 0C 3D | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0D1C            ; 0D 1C 0D | Logical OR with accumulator (absolute)
    ASL $1709            ; 0E 09 17 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TAY                  ; A8 | Transfer accumulator to Y register
    ROR $44              ; 66 44 | Rotate right (zero page)
    LDY $F0              ; A4 F0 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$70             ; E0 70 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_28A
; Address: $DCE8EF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_28A:
    BRA $88              ; 80 88 | Branch always
    JMP $A8D4            ; 4C D4 A8 | Jump to address
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BCC $40              ; 90 40 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BRA $52              ; 80 52 | Branch always
    LDY $CC22            ; AC 22 CC | Load from absolute address into Y register
    BRA $F0              ; 80 F0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_28B
; Address: $DCE908
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_28B:
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $F0              ; 90 F0 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    BCC $4C              ; 90 4C | Branch if carry clear
    LDY $4C9C            ; AC 9C 4C | Load from absolute address into Y register
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BCC $70              ; 90 70 | Branch if carry clear
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_28C
; Address: $DCE928
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_28C:
    JSL $002002          ; 22 02 20 00 | Jump to subroutine long
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    STZ $24              ; 64 24 | Store zero to zero page
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    AND #$05             ; 29 05 | Logical AND with accumulator (immediate)
    AND $1E15,Y          ; 39 15 1E | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL $3E0F,X          ; 1E 0F 3E | Arithmetic shift left (absolute,X)
    ORA $1812,Y          ; 19 12 18 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1F0D,X          ; 1D 0D 1F | Logical OR with accumulator (absolute,X)
    ORA $000E            ; 0D 0E 00 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_28D
; Address: $DCE99E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_28D:
    TYA                  ; 98 | Transfer Y register to accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TAY                  ; A8 | Transfer accumulator to Y register
    ROR $44              ; 66 44 | Rotate right (zero page)
    LDY $F0              ; A4 F0 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BMI $40              ; 30 40 | Branch if negative
    SEC                  ; 38 | Set carry flag
    LDY #$88             ; A0 88 | Load immediate value into Y register
    JMP $A8D4            ; 4C D4 A8 | Jump to address
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BVC $A0              ; 50 A0 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    BCS $40              ; B0 40 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_28E
; Address: $DCE9C7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_28E:
    JSR $60B0            ; 20 B0 60 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_28F
; Address: $DCE9CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_28F:
    JSR $8040            ; 20 40 80 | Jump to subroutine
    BMI $C0              ; 30 C0 | Branch if negative
    BVC $00              ; 50 00 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_290
; Address: $DCE9D5
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_290:
    JSR $9060            ; 20 60 90 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BIT $300C            ; 2C 0C 30 | Test bits in accumulator (absolute)
    BPL $63              ; 10 63 | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ROR $26              ; 66 26 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $1324            ; 0E 24 13 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    SBC ($1A),Y          ; F1 1A | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_291
; Address: $DCEA0E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_291:
    JSR $340B            ; 20 0B 34 | Jump to subroutine
    AND $0800            ; 2D 00 08 | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $04              ; 10 04 | Branch if positive
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    ADC ($0C),Y          ; 71 0C | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_292
; Address: $DCEA22
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_292:
    INC $7309,X          ; FE 09 73 | Increment (absolute,X)
    ADC $6F49,Y          ; 79 49 6F | Add with carry (absolute,Y)
    LSR $303F,X          ; 5E 3F 30 | Logical shift right (absolute,X)
    ORA $0102            ; 0D 02 01 | Logical OR with accumulator (absolute)
    JMP ($606F)          ; 6C 6F 60 | Jump to address (absolute indirect)
    ADC $7E07,Y          ; 79 07 7E | Add with carry (absolute,Y)
    ASL $30              ; 06 30 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    CPX #$78             ; E0 78 | Compare X register (immediate)
    BVC $24              ; 50 24 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_293
; Address: $DCEA49
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_293:
    JSR $080C            ; 20 0C 08 | Jump to subroutine
    ROL $24              ; 26 24 | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_294
; Address: $DCEA53
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_294:
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BVC $F8              ; 50 F8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_295
; Address: $DCEA58
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_295:
    JSR $08FC            ; 20 FC 08 | Jump to subroutine
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    STZ $E0AA            ; 9C AA E0 | Game work RAM access
    JMP $4CA8            ; 4C A8 4C | Jump to address
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BEQ $24              ; F0 24 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    INC $CC1C            ; EE 1C CC | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    STY $7A              ; 84 7A | Store Y register to zero page
    BPL $00              ; 10 00 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $08              ; 10 08 | Branch if positive
    BMI $0C              ; 30 0C | Branch if negative
    CLC                  ; 18 | Clear carry flag
    DEC                  ; 3A | Decrement accumulator
    BEQ $7E              ; F0 7E | Branch if equal
    DEY                  ; 88 | Decrement Y register
    CPY #$CA             ; C0 CA | Compare Y register (immediate)
    ASL $8480            ; 0E 80 84 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    BPL $50              ; 10 50 | Branch if positive
    LDY #$82             ; A0 82 | Load immediate value into Y register
    STA ($84,X)          ; 81 84 | Update graphics data
    CPX #$11             ; E0 11 | Compare X register (immediate)
    CPX #$8A             ; E0 8A | Compare X register (immediate)
    BEQ $44              ; F0 44 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_296
; Address: $DCEA9F
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_296:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BIT $300C            ; 2C 0C 30 | Test bits in accumulator (absolute)
    BPL $63              ; 10 63 | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ROR $26              ; 66 26 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $1324            ; 0E 24 13 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag
    AND ($1A),Y          ; 31 1A | Logical AND with accumulator ((zero page),Y)
    AND ($5A,X)          ; 21 5A | Logical AND with accumulator ((zero page,X))
    AND $0800            ; 2D 00 08 | Logical AND with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BPL $04              ; 10 04 | Branch if positive
    SEC                  ; 38 | Set carry flag
    CPY $1A              ; C4 1A | Compare Y register (zero page)
    CMP $5A              ; C5 5A | Compare accumulator (zero page)
    ORA $335C            ; 0D 5C 33 | Logical OR with accumulator (absolute)
    BEQ $90              ; F0 90 | Branch if equal
    CMP ($B1),Y          ; D1 B1 | Compare accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $43              ; 05 43 | Logical OR with accumulator (zero page)
    JMP $013F            ; 4C 3F 01 | Jump to address
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDY #$00             ; A0 00 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    CPX #$78             ; E0 78 | Compare X register (immediate)
    BVC $24              ; 50 24 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_297
; Address: $DCEB09
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_297:
    JSR $080C            ; 20 0C 08 | Jump to subroutine
    ROL $24              ; 26 24 | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_298
; Address: $DCEB13
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_298:
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    BVC $F8              ; 50 F8 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_299
; Address: $DCEB18
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_299:
    JSR $08FC            ; 20 FC 08 | Jump to subroutine
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    STZ $E0AA            ; 9C AA E0 | Game work RAM access
    JMP $4CA8            ; 4C A8 4C | Jump to address
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BEQ $24              ; F0 24 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    DEX                  ; CA | Decrement X register
    STA $F80478          ; 8F 78 04 F8 | Update graphics data
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_29A
; Address: $DCEB34
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_29A:
    BVC $00              ; 50 00 | Branch if overflow clear
    BMI $08              ; 30 08 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_29B
; Address: $DCEB3C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_29B:
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $6FE0,X          ; 1E E0 6F | Arithmetic shift left (absolute,X)
    BRA $C6              ; 80 C6 | Branch always
    INY                  ; C8 | Increment Y register
    STY $8E              ; 84 8E | Store Y register to zero page
    INX                  ; E8 | Increment X register
    STZ $F8              ; 64 F8 | Store zero to zero page
    BCS $40              ; B0 40 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    INC $86              ; E6 86 | Increment (zero page)
    CMP ($E0),Y          ; D1 E0 | Game work RAM access
    STA ($E0),Y          ; 91 E0 | Game work RAM access
    BVS $04              ; 70 04 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_29D
; Address: $DCEB66
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_29D:
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    ADC $592D            ; 6D 2D 59 | Add with carry (absolute)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    BIT $183E            ; 2C 3E 18 | Test bits in accumulator (absolute)
    ROL $1756,X          ; 3E 56 17 | Rotate left (absolute,X)
    JMP ($242B)          ; 6C 2B 24 | Jump to address (absolute indirect)
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    BMI $20              ; 30 20 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BPL $07              ; 10 07 | Branch if positive
    ORA $2F1E,X          ; 1D 1E 2F | Logical OR with accumulator (absolute,X)
    BMI $35              ; 30 35 | Branch if negative
    AND $302C            ; 2D 2C 30 | Logical AND with accumulator (absolute)
    ASL $1B02,X          ; 1E 02 1B | Arithmetic shift left (absolute,X)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $1C              ; 05 1C | Logical OR with accumulator (zero page)
    ROL $3D06,X          ; 3E 06 3D | Rotate left (absolute,X)
    BMI $07              ; 30 07 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $80              ; D0 80 | Branch if not equal
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_29E
; Address: $DCEBC7
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_29E:
    CPX #$44             ; E0 44 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    STX $84              ; 86 84 | Store X register to zero page
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDX $148C            ; AE 8C 14 | Load from absolute address into X register
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    BNE $30              ; D0 30 | Branch if not equal
    BPL $C0              ; 10 C0 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $7C              ; F0 7C | Branch if equal
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    BPL $30              ; 10 30 | Branch if positive
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_29F
; Address: $DCEBFB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_29F:
    BRA $80              ; 80 80 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    CPY $F800            ; CC 00 F8 | Compare Y register (absolute)
    CPY $10              ; C4 10 | Compare Y register (zero page)
    BIT $70              ; 24 70 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A1
; Address: $DCEC10
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A1:
    JSR $F000            ; 20 00 F0 | Jump to subroutine
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    BVC $80              ; 50 80 | Branch if overflow clear
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    ADC $592D            ; 6D 2D 59 | Add with carry (absolute)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)
    BIT $183E            ; 2C 3E 18 | Test bits in accumulator (absolute)
    ROL $1756,X          ; 3E 56 17 | Rotate left (absolute,X)
    JMP ($242B)          ; 6C 2B 24 | Jump to address (absolute indirect)
    BPL $0D              ; 10 0D | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A2
; Address: $DCEC48
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A2:
    PHP                  ; 08 | Push processor status to stack
    ASL $1400            ; 0E 00 14 | Arithmetic shift left (absolute)
    BIT $1405            ; 2C 05 14 | Test bits in accumulator (absolute)
    BMI $20              ; 30 20 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    BVC $60              ; 50 60 | Branch if overflow clear
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    ORA #$32             ; 09 32 | Logical OR with accumulator (immediate)
    ROR $7406,X          ; 7E 06 74 | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A3
; Address: $DCEC7A
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A3:
    PLP                  ; 28 | Pull processor status from stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $80              ; D0 80 | Branch if not equal
    INX                  ; E8 | Increment X register
    CPX #$44             ; E0 44 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    STX $84              ; 86 84 | Store X register to zero page
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDX $148C            ; AE 8C 14 | Load from absolute address into X register
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    BNE $30              ; D0 30 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    BNE $7C              ; D0 7C | Branch if not equal
    CPX #$76             ; E0 76 | Compare X register (immediate)
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    BPL $30              ; 10 30 | Branch if positive
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A5
; Address: $DCECBE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A5:
    PHP                  ; 08 | Push processor status to stack
    CPY #$72             ; C0 72 | Compare Y register (immediate)
    BRA $F4              ; 80 F4 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $24              ; 50 24 | Branch if overflow clear
    BVS $84              ; 70 84 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A6
; Address: $DCECCB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A6:
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    BPL $80              ; 10 80 | Branch if positive
    BCS $38              ; B0 38 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    CLD                  ; D8 | Clear decimal mode flag
    DEY                  ; 88 | Decrement Y register
    BPL $10              ; 10 10 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A7
; Address: $DCECEA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A7:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVC $10              ; 50 10 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $7F              ; 10 7F | Branch if positive
    STZ $24              ; 64 24 | Store zero to zero page
    BMI $10              ; 30 10 | Branch if negative
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $0C              ; 10 0C | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A8
; Address: $DCED1E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A8:
    JSR $7C0F            ; 20 0F 7C | Jump to subroutine
    ROR $3001,X          ; 7E 01 30 | Rotate right (absolute,X)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    AND ($26,X)          ; 21 26 | Logical AND with accumulator ((zero page,X))
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BEQ $34              ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2A9
; Address: $DCED49
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2A9:
    JSR $1034            ; 20 34 10 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2AB
; Address: $DCED5C
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2AB:
    PHP                  ; 08 | Push processor status to stack
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $4408            ; 0E 08 44 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    BNE $68              ; D0 68 | Branch if not equal
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    BVC $49              ; 50 49 | Branch if overflow clear
    PEA #$F040           ; F4 40 F0 | Push effective address to stack
    CPY #$E0             ; C0 E0 | Game work RAM access
    BMI $00              ; 30 00 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    INC $12              ; E6 12 | Increment (zero page)
    LDX $EC50            ; AE 50 EC | Load from absolute address into X register
    LSR $7EA6,X          ; 5E A6 7E | Logical shift right (absolute,X)
    ASL $4636            ; 0E 36 46 | Arithmetic shift left (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    PEA #$E600           ; F4 00 E6 | Push effective address to stack
    STX $E604            ; 8E 04 E6 | Store X register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2AC
; Address: $DCEDA2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2AC:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2AD
; Address: $DCEDAA
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2AD:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVC $10              ; 50 10 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $7F              ; 10 7F | Branch if positive
    STZ $24              ; 64 24 | Store zero to zero page
    BMI $10              ; 30 10 | Branch if negative
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $4F              ; 90 4F | Branch if carry clear
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $0C              ; 10 0C | Branch if positive
    ADC ($4E,X)          ; 61 4E | Add with carry ((zero page,X))
    CMP $7D26,Y          ; D9 26 7D | Compare accumulator (absolute,Y)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $000E,Y          ; 19 0E 00 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $03              ; 64 03 | Store zero to zero page
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2AE
; Address: $DCEDF6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2AE:
    AND $18              ; 25 18 | Logical AND with accumulator (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BEQ $34              ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2AF
; Address: $DCEE09
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2AF:
    JSR $1034            ; 20 34 10 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B0
; Address: $DCEE18
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B0:
    JSR $10FC            ; 20 FC 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $4408            ; 0E 08 44 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    BNE $68              ; D0 68 | Branch if not equal
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    BCS $9A              ; B0 9A | Branch if carry set
    BVS $00              ; 70 00 | Branch if overflow set
    PEA #$F040           ; F4 40 F0 | Push effective address to stack
    CPY #$E0             ; C0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    INX                  ; E8 | Increment X register
    BPL $C4              ; 10 C4 | Branch if positive
    BMI $9E              ; 30 9E | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B2
; Address: $DCEE45
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B2:
    JSR $44BC            ; 20 BC 44 | Jump to subroutine
    INC $FE06,X          ; FE 06 FE | Increment (absolute,X)
    ASL $A656            ; 0E 56 A6 | Arithmetic shift left (absolute)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPX $04              ; E4 04 | Compare X register (zero page)
    CPX $14              ; E4 14 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $E604            ; 0E 04 E6 | Arithmetic shift left (absolute)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ROL $370A            ; 2E 0A 37 | Rotate left (absolute)
    EOR $520D            ; 4D 0D 52 | Exclusive OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $127F            ; 0D 7F 12 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B3
; Address: $DCEE80
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B3:
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    ADC $25              ; 65 25 | Add with carry (zero page)
    ROR $282D            ; 6E 2D 28 | Rotate right (absolute)
    ORA $32              ; 05 32 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ROL $3E24,X          ; 3E 24 3E | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $07              ; 30 07 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B4
; Address: $DCEE9F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B4:
    ORA #$DC             ; 09 DC | Logical OR with accumulator (immediate)
    LDY #$DD             ; A0 DD | Load immediate value into Y register
    LDY #$EB             ; A0 EB | Load immediate value into Y register
    BCC $BF              ; 90 BF | Branch if carry clear
    BNE $6F              ; D0 6F | Branch if not equal
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    ORA $F0              ; 05 F0 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B5
; Address: $DCEEC6
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B5:
    BMI $20              ; 30 20 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    BPL $C4              ; 10 C4 | Branch if positive
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BNE $24              ; D0 24 | Branch if not equal
    CPX #$64             ; E0 64 | Compare X register (immediate)
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B6
; Address: $DCEEEA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B6:
    JSR $60C0            ; 20 C0 60 | Jump to subroutine
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B8
; Address: $DCEEFE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B8:
    JSR $90C0            ; 20 C0 90 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    RTI                  ; 40 | Return from interrupt
    BCC $80              ; 90 80 | Branch if carry clear
    BCC $80              ; 90 80 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2B9
; Address: $DCEF16
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2B9:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    ROL $370A            ; 2E 0A 37 | Rotate left (absolute)
    EOR $520D            ; 4D 0D 52 | Exclusive OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $127F            ; 0D 7F 12 | Logical OR with accumulator (absolute)
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    ADC $25              ; 65 25 | Add with carry (zero page)
    ROR $282D            ; 6E 2D 28 | Rotate right (absolute)
    ORA $32              ; 05 32 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF C3 00 3E | Read graphics status
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $07              ; 70 07 | Branch if overflow set
    CPX #$03             ; E0 03 | Compare X register (immediate)
    STA ($F7,X)          ; 81 F7 | Update graphics data
    BRA $FF              ; 80 FF | Branch always
    BRA $DF              ; 80 DF | Branch always
    SBC ($6F),Y          ; F1 6F | Subtract with carry ((zero page),Y)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    CPY $CE01            ; CC 01 CE | Compare Y register (absolute)
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    ASL $F1              ; 06 F1 | Arithmetic shift left (zero page)
    ORA ($67,X)          ; 01 67 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2BB
; Address: $DCEF88
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2BB:
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    BPL $C4              ; 10 C4 | Branch if positive
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $F8              ; 10 F8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BNE $24              ; D0 24 | Branch if not equal
    CPX #$64             ; E0 64 | Compare X register (immediate)
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2BC
; Address: $DCEFAA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2BC:
    JSR $60C0            ; 20 C0 60 | Jump to subroutine
    BPL $C0              ; 10 C0 | Branch if positive
    BPL $3C              ; 10 3C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2BD
; Address: $DCEFBE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2BD:
    JSR $28C0            ; 20 C0 28 | Jump to subroutine
    LDY #$58             ; A0 58 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    BCS $80              ; B0 80 | Branch if carry set
    BCS $80              ; B0 80 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $A0              ; 50 A0 | Branch if overflow clear
    BVC $A0              ; 50 A0 | Branch if overflow clear
    BCS $10              ; B0 10 | Branch if carry set
    BMI $90              ; 30 90 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    BIT $2E04            ; 2C 04 2E | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $7D              ; 10 7D | Branch if positive
    ROR $27              ; 66 27 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2BF
; Address: $DCF009
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2BF:
    ASL $0312            ; 0E 12 03 | Arithmetic shift left (absolute)
    ADC ($0C,X)          ; 61 0C | Add with carry ((zero page,X))
    BCC $4A              ; 90 4A | Branch if carry clear
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C0
; Address: $DCF012
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C0:
    JSR $0838            ; 20 38 08 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ADC $4A              ; 65 4A | Add with carry (zero page)
    AND $75              ; 25 75 | Logical AND with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ADC $7E78,X          ; 7D 78 7E | Add with carry (absolute,X)
    BVS $6C              ; 70 6C | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    ADC ($12,X)          ; 61 12 | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    BMI $71              ; 30 71 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C1
; Address: $DCF039
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C1:
    JSR $0667            ; 20 67 06 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C2
; Address: $DCF046
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C2:
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BRA $08              ; 80 08 | Branch always
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY $6CC8            ; CC C8 6C | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LDY #$30             ; A0 30 | Load immediate value into Y register
    CPX #$48             ; E0 48 | Compare X register (immediate)
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    BMI $3A              ; 30 3A | Branch if negative
    BVS $48              ; 70 48 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C3
; Address: $DCF074
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C3:
    JSR $5030            ; 20 30 50 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    BMI $84              ; 30 84 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C4
; Address: $DCF07F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C4:
    BVS $3E              ; 70 3E | Branch if overflow set
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    BPL $80              ; 10 80 | Branch if positive
    BMI $C8              ; 30 C8 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    BVC $A0              ; 50 A0 | Branch if overflow clear
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPX $0C0C            ; EC 0C 0C | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    BCS $48              ; B0 48 | Branch if carry set
    BMI $30              ; 30 30 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BIT $2E04            ; 2C 04 2E | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $7D              ; 10 7D | Branch if positive
    ROR $27              ; 66 27 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C5
; Address: $DCF0C6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C5:
    JSR $1C15            ; 20 15 1C | Jump to subroutine
    ASL $0312            ; 0E 12 03 | Arithmetic shift left (absolute)
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    BVC $0A              ; 50 0A | Branch if overflow clear
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C6
; Address: $DCF0D2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C6:
    JSR $0838            ; 20 38 08 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    AND $0A              ; 25 0A | Logical AND with accumulator (zero page)
    ORA $7D              ; 05 7D | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ROR $7E78,X          ; 7E 78 7E | Rotate right (absolute,X)
    BVS $6F              ; 70 6F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C7
; Address: $DCF0EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C7:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    AND ($32),Y          ; 31 32 | Logical AND with accumulator ((zero page),Y)
    BMI $04              ; 30 04 | Branch if negative
    ADC $7130,Y          ; 79 30 71 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C8
; Address: $DCF0F9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C8:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2C9
; Address: $DCF106
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2C9:
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    BRA $08              ; 80 08 | Branch always
    BPL $0C              ; 10 0C | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2CA
; Address: $DCF117
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2CA:
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPY $6CC8            ; CC C8 6C | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$08             ; A0 08 | Load immediate value into Y register
    LDY #$30             ; A0 30 | Load immediate value into Y register
    CPX #$48             ; E0 48 | Compare X register (immediate)
    CPY #$86             ; C0 86 | Compare Y register (immediate)
    BMI $39              ; 30 39 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2CB
; Address: $DCF134
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2CB:
    JSR $5030            ; 20 30 50 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    BMI $86              ; 30 86 | Branch if negative
    CPX $F6              ; E4 F6 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2CC
; Address: $DCF145
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2CC:
    JSR $6008            ; 20 08 60 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $40              ; 30 40 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2CD
; Address: $DCF15A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2CD:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1A04            ; 0D 04 1A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $340A,X          ; 1E 0A 34 | Arithmetic shift left (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $3F              ; 10 3F | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ROL $320E            ; 2E 0E 32 | Rotate left (absolute)
    BPL $05              ; 10 05 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($3B),Y          ; 11 3B | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2CE
; Address: $DCF193
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2CE:
    ORA $1118,Y          ; 19 18 11 | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1F06            ; 0D 06 1F | Logical OR with accumulator (absolute)
    ORA $0F18,X          ; 1D 18 0F | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ASL $21              ; 06 21 | PPU graphics register access
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    BPL $6C              ; 10 6C | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BMI $96              ; 30 96 | Branch if negative
    WDM #$40             ; 42 40 | Reserved instruction
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BMI $FC              ; 30 FC | Branch if negative
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)
    WDM #$40             ; 42 40 | Reserved instruction
    LDX $A4              ; A6 A4 | Load from zero page into X register
    LDY #$4C             ; A0 4C | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    BMI $1C              ; 30 1C | Branch if negative
    CPX $EE              ; E4 EE | Compare X register (zero page)
    RTI                  ; 40 | Return from interrupt
    LDY $FC              ; A4 FC | Load from zero page into Y register
    JMP $281840          ; 5C 40 18 28 | Jump to address long
    CLC                  ; 18 | Clear carry flag
    BEQ $30              ; F0 30 | Branch if equal
    CPX #$06             ; E0 06 | Compare X register (immediate)
    BCC $3B              ; 90 3B | Branch if carry clear
    ORA $BB              ; 05 BB | Logical OR with accumulator (zero page)
    ORA $D7              ; 05 D7 | Logical OR with accumulator (zero page)
    ORA #$BD             ; 09 BD | Logical OR with accumulator (immediate)
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $8F              ; 80 8F | Branch always
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2CF
; Address: $DCF21A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2CF:
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1A04            ; 0D 04 1A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $340A,X          ; 1E 0A 34 | Arithmetic shift left (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $3F              ; 10 3F | Branch if positive
    BPL $3F              ; 10 3F | Branch if positive
    ROL $320E            ; 2E 0E 32 | Rotate left (absolute)
    BPL $05              ; 10 05 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($3B),Y          ; 11 3B | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1118,Y          ; 19 18 11 | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2D0
; Address: $DCF263
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2D0:
    JSR $213C            ; 20 3C 21 | PPU graphics register access
    ORA ($1D),Y          ; 11 1D | Logical OR with accumulator ((zero page),Y)
    BPL $0D              ; 10 0D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $28              ; 05 28 | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2D1
; Address: $DCF276
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2D1:
    JSR $1201            ; 20 01 12 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $C0              ; F0 C0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    BPL $6C              ; 10 6C | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BMI $96              ; 30 96 | Branch if negative
    WDM #$40             ; 42 40 | Reserved instruction
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    BMI $FC              ; 30 FC | Branch if negative
    INC $FE40,X          ; FE 40 FE | Increment (absolute,X)
    WDM #$40             ; 42 40 | Reserved instruction
    LDX $A4              ; A6 A4 | Load from zero page into X register
    LDY #$4C             ; A0 4C | Load immediate value into Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2D2
; Address: $DCF2AA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2D2:
    SEC                  ; 38 | Set carry flag
    BMI $1E              ; 30 1E | Branch if negative
    INC $FD              ; E6 FD | Increment (zero page)
    RTI                  ; 40 | Return from interrupt
    LDY $FC              ; A4 FC | Load from zero page into Y register
    JMP $281840          ; 5C 40 18 28 | Jump to address long
    CLC                  ; 18 | Clear carry flag
    BEQ $30              ; F0 30 | Branch if equal
    ASL $07E0            ; 0E E0 07 | Arithmetic shift left (absolute)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    STA ($EF,X)          ; 81 EF | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    STA $D806F6          ; 8F F6 06 D8 | Update graphics data

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2D3
; Address: $DCF2CB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2D3:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $73              ; 80 73 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2D6
; Address: $DCF2DA
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2D6:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $2F              ; 10 2F | Branch if positive
    BPL $21              ; 10 21 | PPU graphics register access
    BIT $2C11            ; 2C 11 2C | Test bits in accumulator (absolute)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    BPL $31              ; 10 31 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BPL $16              ; 10 16 | Branch if positive
    ASL $0C14            ; 0E 14 0C | Arithmetic shift left (absolute)
    BPL $08              ; 10 08 | Branch if positive
    BIT $0411            ; 2C 11 04 | Test bits in accumulator (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2D7
; Address: $DCF382
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2D7:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2D9
; Address: $DCF395
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2D9:
    DEY                  ; 88 | Decrement Y register
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    STY $30              ; 84 30 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2DA
; Address: $DCF39D
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2DA:
    DEY                  ; 88 | Decrement Y register
    BMI $88              ; 30 88 | Branch if negative
    STY $00              ; 84 00 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $88              ; 30 88 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    BCC $68              ; 90 68 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $2F              ; 10 2F | Branch if positive
    BPL $21              ; 10 21 | PPU graphics register access
    BIT $2C11            ; 2C 11 2C | Test bits in accumulator (absolute)
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    BPL $31              ; 10 31 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BPL $16              ; 10 16 | Branch if positive
    ASL $0C14            ; 0E 14 0C | Arithmetic shift left (absolute)
    BPL $08              ; 10 08 | Branch if positive
    BIT $0411            ; 2C 11 04 | Test bits in accumulator (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2DB
; Address: $DCF442
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2DB:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2DD
; Address: $DCF455
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2DD:
    DEY                  ; 88 | Decrement Y register
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    STY $30              ; 84 30 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    BMI $88              ; 30 88 | Branch if negative
    STY $00              ; 84 00 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $88              ; 30 88 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2DE
; Address: $DCF472
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2DE:
    PLP                  ; 28 | Pull processor status from stack
    BCC $68              ; 90 68 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $40              ; 80 40 | Branch always
    LDA                  ; BF 40 BF 40 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $80              ; F0 80 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BCC $64              ; 90 64 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2DF
; Address: $DCF525
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2DF:
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    BEQ $78              ; F0 78 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    STZ $97              ; 64 97 | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack
    BEQ $04              ; F0 04 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    BRA $40              ; 80 40 | Branch always
    LDA                  ; BF 40 BF 40 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $80              ; F0 80 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E0
; Address: $DCF5D5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E0:
    PHP                  ; 08 | Push processor status to stack
    BCC $64              ; 90 64 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    ORA ($62,X)          ; 01 62 | Logical OR with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E1
; Address: $DCF5E5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E1:
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    BEQ $78              ; F0 78 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    STZ $97              ; 64 97 | Store zero to zero page
    PHP                  ; 08 | Push processor status to stack
    BEQ $04              ; F0 04 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    ASL $0E11            ; 0E 11 0E | Arithmetic shift left (absolute)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    BPL $2F              ; 10 2F | Branch if positive
    ASL $1200            ; 0E 00 12 | Arithmetic shift left (absolute)
    BPL $39              ; 10 39 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BIT $2D0C            ; 2C 0C 2D | Test bits in accumulator (absolute)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E2
; Address: $DCF650
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E2:
    JSR $2411            ; 20 11 24 | Jump to subroutine
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    BPL $03              ; 10 03 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BEQ $E0              ; F0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $60              ; 10 60 | Branch if positive
    BCC $60              ; 90 60 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    BVS $88              ; 70 88 | Branch if overflow set
    BVS $88              ; 70 88 | Branch if overflow set
    BVS $84              ; 70 84 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    STY $00              ; 84 00 | Store Y register to zero page
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E3
; Address: $DCF6A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E3:
    CPX $E0              ; E4 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    BIT $5890            ; 2C 90 58 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E4
; Address: $DCF6B5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E4:
    JSR $C018            ; 20 18 C0 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E5
; Address: $DCF6BC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E5:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    ASL $0E11            ; 0E 11 0E | Arithmetic shift left (absolute)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    BPL $2F              ; 10 2F | Branch if positive
    ASL $1200            ; 0E 00 12 | Arithmetic shift left (absolute)
    BPL $39              ; 10 39 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BIT $2D0C            ; 2C 0C 2D | Test bits in accumulator (absolute)
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E6
; Address: $DCF710
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E6:
    JSR $2411            ; 20 11 24 | Jump to subroutine
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    BPL $03              ; 10 03 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BEQ $E0              ; F0 E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $60              ; 10 60 | Branch if positive
    BCC $60              ; 90 60 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    BVS $88              ; 70 88 | Branch if overflow set
    BVS $88              ; 70 88 | Branch if overflow set
    BVS $84              ; 70 84 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    STY $00              ; 84 00 | Store Y register to zero page
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    CPX $E0              ; E4 E0 | Game work RAM access
    INY                  ; C8 | Increment Y register
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    BIT $5890            ; 2C 90 58 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E7
; Address: $DCF775
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E7:
    JSR $C018            ; 20 18 C0 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2E9
; Address: $DCF7A8
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2E9:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    AND $0000,Y          ; 39 00 00 | Logical AND with accumulator (absolute,Y)
    BPL $09              ; 10 09 | Branch if positive
    ROL $19              ; 26 19 | Rotate left (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA                  ; BF 00 BF 80 | Read graphics status
    LSR $49              ; 46 49 | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    ROR $60              ; 66 60 | Rotate right (zero page)
    BCS $30              ; B0 30 | Branch if carry set
    BCC $26              ; 90 26 | Branch if carry clear
    BIT #$10             ; 89 10 | Test bits in accumulator (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2EA
; Address: $DCF7D6
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2EA:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $01              ; F0 01 | Branch if equal
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    STA ($80,X)          ; 81 80 | Update graphics data
    ASL $7000            ; 0E 00 70 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    ROR $F000,X          ; 7E 00 F0 | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2EB
; Address: $DCF868
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2EB:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    AND $0000,Y          ; 39 00 00 | Logical AND with accumulator (absolute,Y)
    BPL $09              ; 10 09 | Branch if positive
    ROL $19              ; 26 19 | Rotate left (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LDA                  ; BF 00 BF 80 | Read graphics status
    LSR $49              ; 46 49 | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    ROR $60              ; 66 60 | Rotate right (zero page)
    BCS $30              ; B0 30 | Branch if carry set
    BCC $26              ; 90 26 | Branch if carry clear
    BIT #$10             ; 89 10 | Test bits in accumulator (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2ED
; Address: $DCF8C6
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2ED:
    BEQ $00              ; F0 00 | Branch if equal
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $01              ; F0 01 | Branch if equal
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    STA ($80,X)          ; 81 80 | Update graphics data
    ASL $7000            ; 0E 00 70 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    ROR $F000,X          ; 7E 00 F0 | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0E04,Y          ; 19 04 0E | Logical OR with accumulator (absolute,Y)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    BVS $1E              ; 70 1E | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    BPL $02              ; 10 02 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2EE
; Address: $DCF961
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2EE:
    JSR $6390            ; 20 90 63 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX $04              ; E4 04 | Compare X register (zero page)
    INC $FA0E,X          ; FE 0E FA | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    WDM #$FA             ; 42 FA | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $8204            ; 0E 04 82 | Arithmetic shift left (absolute)
    CPY $42              ; C4 42 | Hardware register operation
    CPX $0A              ; E4 0A | Compare X register (zero page)
    PEA #$FC22           ; F4 22 FC | Push effective address to stack
    SEP #$1A             ; E2 1A | Set processor status bits
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    INC                  ; 1A | Increment accumulator
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2EF
; Address: $DCF9A6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2EF:
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$E48A           ; F4 8A E4 | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $26              ; 24 26 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F0
; Address: $DCF9BD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F0:
    JSR $2022            ; 20 22 20 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    BVS $88              ; 70 88 | Branch if overflow set
    BEQ $90              ; F0 90 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F1
; Address: $DCF9CE
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F1:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BMI $0C              ; 30 0C | Branch if negative
    BEQ $F4              ; F0 F4 | Branch if equal
    INY                  ; C8 | Increment Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA #$08             ; 09 08 | Logical OR with accumulator (immediate)
    ASL $2F04            ; 0E 04 2F | Arithmetic shift left (absolute)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BMI $1E              ; 30 1E | Branch if negative
    SEC                  ; 38 | Set carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $1B              ; 10 1B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $02              ; 10 02 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)
    BCC $60              ; 90 60 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F2
; Address: $DCFA24
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F2:
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $0F11            ; 0E 11 0F | Arithmetic shift left (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F3
; Address: $DCFA42
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F3:
    BRA $00              ; 80 00 | Branch always
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    PEA #$FA04           ; F4 04 FA | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    WDM #$FD             ; 42 FD | Reserved instruction
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA $0000,Y          ; 99 00 00 | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    CPX $42              ; E4 42 | Hardware register operation
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    STA ($FA),Y          ; 91 FA | Update graphics data
    SBC $99              ; E5 99 | Subtract with carry (zero page)
    ORA $1D79            ; 0D 79 1D | Logical OR with accumulator (absolute)
    STA $F5              ; 85 F5 | Update graphics data
    EOR ($09),Y          ; 51 09 | Exclusive OR with accumulator ((zero page),Y)
    CMP $DC10,Y          ; D9 10 DC | Compare accumulator (absolute,Y)
    STA ($FA,X)          ; 81 FA | Update graphics data
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    STA $E2              ; 85 E2 | Update graphics data
    WDM #$29             ; 42 29 | Reserved instruction
    ROL $27              ; 26 27 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F4
; Address: $DCFA7D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F4:
    JSR $2621            ; 20 21 26 | Jump to subroutine
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $C2              ; 05 C2 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $30              ; 10 30 | Branch if positive
    BVC $60              ; 50 60 | Branch if overflow clear
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F5
; Address: $DCFA90
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F5:
    SED                  ; F8 | Set decimal mode flag
    BMI $02              ; 30 02 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BEQ $D0              ; F0 D0 | Branch if equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    INC $0005,X          ; FE 05 00 | Increment (absolute,X)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ADC ($1F),Y          ; 71 1F | Add with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ASL $0601,X          ; 1E 01 06 | Arithmetic shift left (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F6
; Address: $DCFACF
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F6:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $1204            ; 0D 04 12 | Logical OR with accumulator (absolute)
    ORA #$0C             ; 09 0C | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0C04            ; 0E 04 0C | Arithmetic shift left (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$FA24           ; F4 24 FA | Push effective address to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    CMP $0000            ; CD 00 00 | Compare accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F7
; Address: $DCFB18
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F7:
    BIT $B8              ; 24 B8 | Test bits in accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$E21D           ; F4 1D E2 | Push effective address to stack
    EOR $DD              ; 45 DD | Exclusive OR with accumulator (zero page)
    ADC $856D            ; 6D 6D 85 | Add with carry (absolute)
    AND $0DD5            ; 2D D5 0D | Logical AND with accumulator (absolute)
    ORA $E5              ; 05 E5 | Logical OR with accumulator (zero page)
    ORA $45              ; 05 45 | Logical OR with accumulator (zero page)
    ORA $8DE2,X          ; 1D E2 8D | Logical OR with accumulator (absolute,X)
    AND $0502            ; 2D 02 05 | Logical AND with accumulator (absolute)
    ORA $42              ; 05 42 | Hardware register operation
    WDM #$BB             ; 42 BB | Reserved instruction
    BCS $8C              ; B0 8C | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    CPX #$49             ; E0 49 | Compare X register (immediate)
    BNE $20              ; D0 20 | Branch if not equal
    BRA $F0              ; 80 F0 | Branch always
    LDY #$60             ; A0 60 | Load immediate value into Y register
    EOR ($0E,X)          ; 41 0E | Exclusive OR with accumulator ((zero page,X))
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    BRA $86              ; 80 86 | Branch always
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    BMI $20              ; 30 20 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F8
; Address: $DCFB5C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F8:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2F9
; Address: $DCFB6E
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2F9:
    ROR $0005,X          ; 7E 05 00 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    AND $0F04,X          ; 3D 04 0F | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($1F),Y          ; F1 1F | Subtract with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ASL $0601,X          ; 1E 01 06 | Arithmetic shift left (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0405            ; 0D 05 04 | Logical OR with accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BEQ $10              ; F0 10 | Branch if equal
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    PEA #$F414           ; F4 14 F4 | Push effective address to stack
    TXA                  ; 8A | Transfer X register to accumulator
    NOP                  ; EA | No operation
    PHY                  ; 5A | Push Y register to stack
    DEX                  ; CA | Decrement X register
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BVC $14              ; 50 14 | Branch if overflow clear
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PEA #$E41A           ; F4 1A E4 | Push effective address to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    PHX                  ; DA | Push X register to stack
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $2AEE            ; 0E EE 2A | Arithmetic shift left (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    BPL $D8              ; 10 D8 | Branch if positive
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2FA
; Address: $DCFBF1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2FA:
    CPX $8A              ; E4 8A | Compare X register (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $6604,X          ; 1E 04 66 | Arithmetic shift left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    BIT $1060            ; 2C 60 10 | Test bits in accumulator (absolute)
    CPY $6894            ; CC 94 68 | Compare Y register (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2FB
; Address: $DCFC0F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2FB:
    JSR $148A            ; 20 8A 14 | Jump to subroutine
    BIT $0800            ; 2C 00 08 | Test bits in accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2FE
; Address: $DCFC1E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2FE:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))
    JMP $5C5952          ; 5C 52 59 5C | Jump to address long
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    BVC $2F              ; 50 2F | Branch if overflow clear
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($50),Y          ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
    BVC $55              ; 50 55 | Branch if overflow clear
    PHY                  ; 5A | Push Y register to stack
    EOR $5658,X          ; 5D 58 56 | Exclusive OR with accumulator (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    BVC $4A              ; 50 4A | Branch if overflow clear
    STZ $75              ; 64 75 | Store zero to zero page
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($38),Y          ; 51 38 | Exclusive OR with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    BMI $50              ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_2FF
; Address: $DCFC57
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_2FF:
    JSR $2150            ; 20 50 21 | PPU graphics register access
    BIT $45              ; 24 45 | Test bits in accumulator (zero page)
    BIT $6E              ; 24 6E | Test bits in accumulator (zero page)
    ROL $5E5E,X          ; 3E 5E 5E | Rotate left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    ORA $3C48,Y          ; 19 48 3C | Logical OR with accumulator (absolute,Y)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    JMP $0E31            ; 4C 31 0E | Jump to address
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_300
; Address: $DCFC8B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_300:
    JSR $603C            ; 20 3C 60 | Jump to subroutine
    STZ $0030,X          ; 9E 30 00 | Store zero to absolute,X
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_301
; Address: $DCFC99
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_301:
    BMI $20              ; 30 20 | Branch if negative
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $7C              ; 80 7C | Branch always
    ASL $A498            ; 0E 98 A4 | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BNE $08              ; D0 08 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_302
; Address: $DCFCAE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_302:
    JSL $7C80AC          ; 22 AC 80 7C | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    BVC $08              ; 50 08 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_303
; Address: $DCFCBB
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_303:
    JSR $20A4            ; 20 A4 20 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    ADC #$66             ; 69 66 | Add with carry (immediate)
    ASL $E0              ; 06 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    BVS $90              ; 70 90 | Branch if overflow set
    CPX #$90             ; E0 90 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_304
; Address: $DCFCCE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_304:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BVS $C8              ; 70 C8 | Branch if overflow set
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_306
; Address: $DCFCF8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_306:
    JSR $4103            ; 20 03 41 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDA ($6E,X)          ; A1 6E | Read graphics status
    LDA ($A0),Y          ; B1 A0 | Read graphics status
    LDY $A6              ; A4 A6 | Load from zero page into Y register
    BCS $B5              ; B0 B5 | Branch if carry set
    TSX                  ; BA | Transfer stack pointer to X register
    LDA $A6A8            ; AD A8 A6 | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    BEQ $DA              ; F0 DA | Branch if equal
    LDY $B5              ; A4 B5 | Load from zero page into Y register
    LDA ($6E,X)          ; A1 6E | Read graphics status

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_307
; Address: $DCFD12
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_307:
    LDA ($58,X)          ; A1 58 | Read graphics status
    TAX                  ; AA | Transfer accumulator to X register
    BVC $A0              ; 50 A0 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LDY #$41             ; A0 41 | Load immediate value into Y register
    LDY $44              ; A4 44 | Load from zero page into Y register
    CMP $44              ; C5 44 | Compare accumulator (zero page)
    DEC $162E            ; CE 2E 16 | Decrement (absolute)
    BRA $07              ; 80 07 | Branch always
    BCC $71              ; 90 71 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_308
; Address: $DCFD28
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_308:
    JSL $0B110E          ; 22 0E 11 0B | Jump to subroutine long
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA                  ; 9F 6F 38 40 | Update graphics data
    ASL $136E,X          ; 1E 6E 13 | Arithmetic shift left (absolute,X)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    BPL $3E              ; 10 3E | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_309
; Address: $DCFD4E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_309:
    STZ $0030            ; 9C 30 00 | Store zero to absolute
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_30A
; Address: $DCFD5C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_30A:
    JSR $80F8            ; 20 F8 80 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    ASL $A698            ; 0E 98 A6 | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $10              ; B0 10 | Branch if carry set
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $80A4            ; 2E A4 80 | Rotate left (absolute)
    CLC                  ; 18 | Clear carry flag
    BVC $08              ; 50 08 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_30B
; Address: $DCFD7B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_30B:
    JSR $20A4            ; 20 A4 20 | Jump to subroutine
    BVS $70              ; 70 70 | Branch if overflow set
    STZ $12              ; 64 12 | Store zero to zero page
    JMP $901C            ; 4C 1C 90 | Jump to address
    BPL $30              ; 10 30 | Branch if positive
    BVC $60              ; 50 60 | Branch if overflow clear
    BEQ $60              ; F0 60 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_30E
; Address: $DCFD96
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_30E:
    BNE $C0              ; D0 C0 | Branch if not equal
    BRA $80              ; 80 80 | Branch always
    AND #$21             ; 29 21 | PPU graphics register access
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $0B29            ; 0D 29 0B | Logical OR with accumulator (absolute)
    AND ($1F,X)          ; 21 1F | Logical AND with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($4B,X)          ; 41 4B | Exclusive OR with accumulator ((zero page,X))
    BVC $4D              ; 50 4D | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_30F
; Address: $DCFDCD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_30F:
    ADC ($50,X)          ; 61 50 | Add with carry ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($28),Y          ; 51 28 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_312
; Address: $DCFDDD
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_312:
    JSL $0B1C6C          ; 22 6C 1C 0B | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    ORA #$44             ; 09 44 | Logical OR with accumulator (immediate)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    JMP $2A582C          ; 5C 2C 58 2A | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    BMI $1C              ; 30 1C | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    INC $FF80,X          ; FE 80 FF | Increment (absolute,X)
    BCC $FE              ; 90 FE | Branch if carry clear

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_313
; Address: $DCFE0D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_313:
    JSR $A07F            ; 20 7F A0 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BNE $90              ; D0 90 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_314
; Address: $DCFE1C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_314:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$8E             ; E0 8E | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    JMP ($3C58)          ; 6C 58 3C | Jump to address (absolute indirect)
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_315
; Address: $DCFE2C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_315:
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $18              ; 80 18 | Branch always
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_31A
; Address: $DCFE45
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_31A:
    JSR $D0D0            ; 20 D0 D0 | Jump to subroutine
    BPL $D0              ; 10 D0 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_31B
; Address: $DCFE4B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_31B:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_31C
; Address: $DCFE52
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_31C:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BVS $20              ; 70 20 | Branch if overflow set
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_31D
; Address: $DCFE5A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_31D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $2F              ; 10 2F | Branch if positive
    BIT $5F              ; 24 5F | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    EOR ($A1,X)          ; 41 A1 | Exclusive OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    BPL $00              ; 10 00 | Branch if positive
    BIT $16              ; 24 16 | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    AND $2B41            ; 2D 41 2B | Logical AND with accumulator (absolute)
    LDA ($7F,X)          ; A1 7F | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX #$9B             ; A2 9B | Load immediate value into X register
    LDA ($AB,X)          ; A1 AB | Read graphics status
    PLB                  ; AB | Pull data bank register from stack
    BCS $AD              ; B0 AD | Branch if carry set
    INY                  ; C8 | Increment Y register
    LDY #$A1             ; A0 A1 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA ($48),Y          ; B1 48 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$42             ; A0 42 | Hardware register operation
    CPX #$40             ; E0 40 | Compare X register (immediate)
    DEC $9C22,X          ; DE 22 9C | Decrement (absolute,X)
    JMP ($0504)          ; 6C 04 05 | Jump to address (absolute indirect)
    STY $74              ; 84 74 | Store Y register to zero page
    JMP $3027            ; 4C 27 30 | Jump to address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $0D03            ; 0E 03 0D | Arithmetic shift left (absolute)
    LDX $0F4E,Y          ; BE 4E 0F | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_31E
; Address: $DCFEB5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_31E:
    JSR $0707            ; 20 07 07 | Jump to subroutine
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FFC0,X          ; FE C0 FF | Increment (absolute,X)
    BPL $7E              ; 10 7E | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BPL $BC              ; 10 BC | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_31F
; Address: $DCFEDE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_31F:
    JSR $1FF0            ; 20 F0 1F | Jump to subroutine
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROR $3C58            ; 6E 58 3C | Rotate right (absolute)
    RTI                  ; 40 | Return from interrupt
    BVS $80              ; 70 80 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_320
; Address: $DCFEED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_320:
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BRA $18              ; 80 18 | Branch always
    BRA $20              ; 80 20 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_322
; Address: $DCFEFD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_322:
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_323
; Address: $DCFF01
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_323:
    JSR $3068            ; 20 68 30 | Jump to subroutine
    BMI $80              ; 30 80 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_326
; Address: $DCFF0C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_326:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BPL $80              ; 10 80 | Branch if positive
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY #$80             ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_327
; Address: $DCFF18
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_327:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_328
; Address: $DCFF33
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_328:
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_329
; Address: $DCFF42
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_329:
    JSR $300F            ; 20 0F 30 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $A6              ; 84 A6 | Store Y register to zero page
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $F7              ; F0 F7 | Branch if equal
    DEC $7EFF            ; CE FF 7E | Decrement (absolute)
    EOR ($94,X)          ; 41 94 | Exclusive OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BPL $01              ; 10 01 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ADC $05              ; 65 05 | Add with carry (zero page)
    ADC $8C              ; 65 8C | Add with carry (zero page)
    LDY $18              ; A4 18 | Load from zero page into Y register
    LDX #$0A             ; A2 0A | Load immediate value into X register
    ORA #$F3             ; 09 F3 | Logical OR with accumulator (immediate)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA $82              ; 05 82 | Logical OR with accumulator (zero page)
    ADC $E2              ; 65 E2 | Add with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF FA AF F9 | Read graphics status
    STZ $FEF9,X          ; 9E F9 FE | Store zero to absolute,X
    STA $0579            ; 8D 79 05 | Update graphics data
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    SEP #$1E             ; E2 1E | Set processor status bits
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    LDY #$19             ; A0 19 | Load immediate value into Y register
    BMI $85              ; 30 85 | Branch if negative
    JMP $F981            ; 4C 81 F9 | Jump to address
    INC $F8F3,X          ; FE F3 F8 | Increment (absolute,X)
    ROR $FFB8,X          ; 7E B8 FF | Rotate right (absolute,X)
    DEC $10FC            ; CE FC 10 | Decrement (absolute)
    ROR $61              ; 66 61 | Rotate right (zero page)
    ASL $E6              ; 06 E6 | Arithmetic shift left (zero page)
    BMI $C8              ; 30 C8 | Branch if negative
    BVS $D8              ; 70 D8 | Branch if overflow set
    BVS $18              ; 70 18 | Branch if overflow set
    BVS $88              ; 70 88 | Branch if overflow set
    BVS $40              ; 70 40 | Branch if overflow set
    BRA $7B              ; 80 7B | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $88              ; C6 88 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank38_GraphicsFunction_32A
; Address: $DCFFD5
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank38_GraphicsFunction_32A:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    BNE $E0              ; D0 E0 | Game work RAM access
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
