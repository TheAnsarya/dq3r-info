;==============================================================================
; Dragon Quest III - Bank $4C
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $E60000-$E67FFF
; Instructions: 9145
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_4C"

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_000
; Address: $E68000
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_000:
    STA ($99),Y          ; 91 99 | Update graphics data
    STA                  ; 9F 9F 11 FF | Update graphics data
    ROR $FF              ; 66 FF | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    INC $7EFE,X          ; FE FE 7E | Increment (absolute,X)
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    BVC $FF              ; 50 FF | Branch if overflow clear
    ROR $FF              ; 66 FF | Rotate right (zero page)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    STZ $FF              ; 64 FF | Store zero to zero page
    LDA #$FF             ; A9 FF | Read graphics status
    ORA $BFFF            ; 0D FF BF | Logical OR with accumulator (absolute)
    LDA                  ; BF BF BF EF | Read graphics status
    LDA $FEFEAF          ; AF AF FE FE | Read graphics status
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FF36,X          ; FE 36 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_001
; Address: $E68056
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_001:
    JSL $FF53FF          ; 22 FF 53 FF | Jump to subroutine long
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    CPY $DFDF            ; CC DF DF | Compare Y register (absolute)
    BRA $B0              ; 80 B0 | Branch always
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    ORA ($19),Y          ; 11 19 | Logical OR with accumulator ((zero page),Y)
    STA $D4F5F5          ; 8F F5 F5 D4 | Update graphics data
    BNE $D0              ; D0 D0 | Branch if not equal
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BPL $FF              ; 10 FF | Branch if positive
    SEP #$FF             ; E2 FF | Set processor status bits
    PEA #$D5FF           ; F4 FF D5 | Push effective address to stack
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    STY $F30C            ; 8C 0C F3 | Store Y register to absolute address
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $1CF0            ; 0E F0 1C | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_002
; Address: $E680B0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_002:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STA                  ; 9F 60 E0 1F | Update graphics data
    BEQ $0E              ; F0 0E | Branch if equal
    INX                  ; E8 | Increment X register
    BPL $2C              ; 10 2C | Branch if positive
    BPL $60              ; 10 60 | Branch if positive
    BEQ $0F              ; F0 0F | Branch if equal
    ORA $1B1F,X          ; 1D 1F 1B | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_003
; Address: $E680E6
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_003:
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ORA $1715,X          ; 1D 15 17 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $D7CD            ; 8C CD D7 | Store Y register to absolute address
    ASL $6C0E            ; 0E 0E 6C | Arithmetic shift left (absolute)
    JMP ($BFBF)          ; 6C BF BF | Jump to address (absolute indirect)
    STY $D7FF            ; 8C FF D7 | Store Y register to absolute address
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $FF              ; 26 FF | Rotate left (zero page)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    ROL $73BE,X          ; 3E BE 73 | Rotate left (absolute,X)
    STA $1C99,Y          ; 99 99 1C | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $01FE,X          ; FE FE 01 | Increment (absolute,X)
    ROL $52FF            ; 2E FF 52 | Rotate left (absolute)
    STA $E3FF,Y          ; 99 FF E3 | Update graphics data
    LDA $D4FF            ; AD FF D4 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $5D              ; 90 5D | Branch if carry clear
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    STX $B6              ; 86 B6 | Store X register to zero page
    STX $BA8E            ; 8E 8E BA | Store X register to absolute address
    TSX                  ; BA | Transfer stack pointer to X register
    LDX $40BE,Y          ; BE BE 40 | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    INC $EEEE            ; EE EE EE | Increment (absolute)
    INC $FF07            ; EE 07 FF | Increment (absolute)
    ORA $2BFF            ; 0D FF 2B | Logical OR with accumulator (absolute)
    ORA $BFFF            ; 0D FF BF | Logical OR with accumulator (absolute)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $75              ; 80 75 | Branch always
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_004
; Address: $E68194
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_004:
    BPL $FF              ; 10 FF | Branch if positive
    AND $39FF,Y          ; 39 FF 39 | Logical AND with accumulator (absolute,Y)
    ASL $0C0E            ; 0E 0E 0C | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL $BF              ; 06 BF | Arithmetic shift left (zero page)
    LDA                  ; BF FF FF FE | Read graphics status
    INC $6E6E,X          ; FE 6E 6E | Increment (absolute,X)
    JMP $F7F75C          ; 5C 5C F7 F7 | Jump to address long
    STA ($81,X)          ; 81 81 | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    STA ($FF),Y          ; 91 FF | Update graphics data
    SEC                  ; 38 | Set carry flag
    ROR $76FF,X          ; 7E FF 76 | Rotate right (absolute,X)
    INC $AAEE            ; EE EE AA | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    STY $088C            ; 8C 8C 08 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    STY $84              ; 84 84 | Store Y register to zero page
    EOR $73FF,X          ; 5D FF 73 | Exclusive OR with accumulator (absolute,X)
    ADC $4DFF,Y          ; 79 FF 4D | Add with carry (absolute,Y)
    ADC $00FF            ; 6D FF 00 | Add with carry (absolute)
    SBC $A55A,X          ; FD 5A A5 | Subtract with carry (absolute,X)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    AND $00C6,Y          ; 39 C6 00 | Logical AND with accumulator (absolute,Y)
    INC $FAFE,X          ; FE FE FA | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ASL $FF1E,X          ; 1E 1E FF | Arithmetic shift left (absolute,X)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    ADC $FF              ; 65 FF | Add with carry (zero page)
    ROR $BEFF            ; 6E FF BE | Rotate right (absolute)
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    PEA #$2300           ; F4 00 23 | Push effective address to stack
    STY $25              ; 84 25 | Store Y register to zero page
    BRA $14              ; 80 14 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    JMP $3F3F            ; 4C 3F 3F | Jump to address
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_005
; Address: $E6826B
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_005:
    BVC $75              ; 50 75 | Branch if overflow clear
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    BRA $FF              ; 80 FF | Branch always
    STA $99FF,Y          ; 99 FF 99 | Update graphics data
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    AND $39FF,Y          ; 39 FF 39 | Logical AND with accumulator (absolute,Y)
    STX $13              ; 86 13 | Store X register to zero page
    STY $33              ; 84 33 | Store Y register to zero page
    STY $04              ; 84 04 | Store Y register to zero page
    BRA $32              ; 80 32 | Branch always
    STA $33              ; 85 33 | Update graphics data
    STY $27              ; 84 27 | Store Y register to zero page
    BRA $12              ; 80 12 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC $77BB            ; EE BB 77 | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    INC $AFBB            ; EE BB AF | Increment (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    INC $EABF            ; EE BF EA | Increment (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDA $ADFF            ; AD FF AD | Read graphics status
    LDA $EBFF            ; AD FF EB | Read graphics status
    LDY $5B              ; A4 5B | Load from zero page into Y register
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_006
; Address: $E68314
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_006:
    JSR $A8DF            ; 20 DF A8 | Jump to subroutine
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    STA ($7E,X)          ; 81 7E | Update graphics data
    LDA #$56             ; A9 56 | Read graphics status
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_007
; Address: $E68322
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_007:
    AND $ADFF            ; 2D FF AD | Logical AND with accumulator (absolute)
    LDA $BFFF,X          ; BD FF BF | Read graphics status
    LDA                  ; BF FF FF FF | Read graphics status
    PLP                  ; 28 | Pull processor status from stack
    BIT $2CD3            ; 2C D3 2C | Test bits in accumulator (absolute)
    BIT $BFD3            ; 2C D3 BF | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    STY $37              ; 84 37 | Store Y register to zero page
    BRA $34              ; 80 34 | Branch always
    BRA $23              ; 80 23 | Branch always
    STY $12              ; 84 12 | Store Y register to zero page
    STY $25              ; 84 25 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_008
; Address: $E6834D
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_008:
    BRA $14              ; 80 14 | Branch always
    BRA $00              ; 80 00 | Branch always
    BMI $87              ; 30 87 | Branch if negative
    BRA $2F              ; 80 2F | Branch always
    BRA $3F              ; 80 3F | Branch always
    BRA $64              ; 80 64 | Branch always
    CPX $80              ; E4 80 | Compare X register (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $98              ; 10 98 | Branch if positive
    STZ $9B              ; 64 9B | Store zero to zero page
    JMP $014C            ; 4C 4C 01 | Jump to address
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $18              ; 10 18 | Branch if positive
    JMP $00B3            ; 4C B3 00 | Jump to address
    EOR $5DB2            ; 4D B2 5D | Exclusive OR with accumulator (absolute)
    LDX #$5F             ; A2 5F | Load immediate value into X register
    LDY #$6D             ; A0 6D | Load immediate value into Y register
    LDA $AD52            ; AD 52 AD | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    JMP $0AF5            ; 4C F5 0A | Jump to address
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC #$C6             ; 69 C6 | Add with carry (immediate)
    AND $B946,Y          ; 39 46 B9 | Logical AND with accumulator (absolute,Y)
    JMP ($D593)          ; 6C 93 D5 | Jump to address (absolute indirect)
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $FA00            ; CD 00 FA | Compare accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_00E
; Address: $E6840C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_00E:
    JSL $36243A          ; 22 3A 24 36 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    ASL $3F00,X          ; 1E 00 3F | Arithmetic shift left (absolute,X)
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $75              ; 80 75 | Branch always
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    BRA $B7              ; 80 B7 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_00F
; Address: $E68483
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_00F:
    LDY #$22             ; A0 22 | Load immediate value into Y register
    CMP $FB04,X          ; DD 04 FB | Compare accumulator (absolute,X)
    BRA $F7              ; 80 F7 | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    STY $34              ; 84 34 | Store Y register to zero page
    CPX #$04             ; E0 04 | Compare X register (immediate)
    ROR                  ; 6A | Rotate right (accumulator)
    ADC $B845            ; 6D 45 B8 | Add with carry (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_010
; Address: $E684B5
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_010:
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    ROL $26              ; 26 26 | Rotate left (zero page)
    ROR $66              ; 66 66 | Rotate right (zero page)
    STZ $74              ; 64 74 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    LDY $6CAC            ; AC AC 6C | Load from absolute address into Y register
    JMP ($6C6C)          ; 6C 6C 6C | Jump to address (absolute indirect)
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    ROL $7E              ; 26 7E | Rotate left (zero page)
    ROL $7E              ; 26 7E | Rotate left (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    INC $FECA,X          ; FE CA FE | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $7E5E,X          ; 7E 5E 7E | Rotate right (absolute,X)
    ORA ($99),Y          ; 11 99 | Logical OR with accumulator ((zero page),Y)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BVC $F1              ; 50 F1 | Branch if overflow clear
    BVC $F1              ; 50 F1 | Branch if overflow clear
    BVC $F1              ; 50 F1 | Branch if overflow clear
    BVC $F3              ; 50 F3 | Branch if overflow clear
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    EOR $0159,Y          ; 59 59 01 | Exclusive OR with accumulator (absolute,Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA $85              ; 85 85 | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    EOR $01FF,Y          ; 59 FF 01 | Exclusive OR with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    WDM #$C7             ; 42 C7 | Reserved instruction
    WDM #$C7             ; 42 C7 | Reserved instruction
    WDM #$C7             ; 42 C7 | Reserved instruction
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    ORA ($99),Y          ; 11 99 | Logical OR with accumulator ((zero page),Y)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_011
; Address: $E6852B
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_011:
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    LSR $5EFF,X          ; 5E FF 5E | Logical shift right (absolute,X)
    LSR $5CFF,X          ; 5E FF 5C | Logical shift right (absolute,X)
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    EOR $0159,Y          ; 59 59 01 | Exclusive OR with accumulator (absolute,Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA $85              ; 85 85 | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    EOR $01FF,Y          ; 59 FF 01 | Exclusive OR with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    LSR                  ; 4A | Logical shift right (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    STZ $474B            ; 9C 4B 47 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FC              ; B0 FC | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    ROR $9EE8,X          ; 7E E8 9E | Rotate right (absolute,X)
    ADC ($40),Y          ; 71 40 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    STA ($FF,X)          ; 81 FF | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ROR                  ; 6A | Rotate right (accumulator)
    SBC $AF97,Y          ; F9 97 AF | Subtract with carry (absolute,Y)
    ROR $9FFA,X          ; 7E FA 9F | Rotate right (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    LDX $BBAE            ; AE AE BB | Load from absolute address into X register
    INC $BACD            ; EE CD BA | Increment (absolute)
    PLB                  ; AB | Pull data bank register from stack
    INC $FFAE,X          ; FE AE FF | Increment (absolute,X)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    INC $93EE            ; EE EE 93 | Increment (absolute)
    CPX $5A              ; E4 5A | Compare X register (zero page)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    TAX                  ; AA | Transfer accumulator to X register
    INC $A3F5,X          ; FE F5 A3 | Increment (absolute,X)
    LDX $ADEE,Y          ; BE EE AD | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_012
; Address: $E685F0
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_012:
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROR $7E4A,X          ; 7E 4A 7E | Rotate right (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    ROR $7E52,X          ; 7E 52 7E | Rotate right (absolute,X)
    ROR $7E6A,X          ; 7E 6A 7E | Rotate right (absolute,X)
    ROR $7E4A,X          ; 7E 4A 7E | Rotate right (absolute,X)
    STY $84              ; 84 84 | Store Y register to zero page
    STA $C39D,X          ; 9D 9D C3 | Update graphics data
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    STA                  ; 9F 9F 00 6C | Update graphics data
    LDY $FF              ; A4 FF | Load from zero page into Y register
    LDA ($FF,X)          ; A1 FF | Read graphics status
    SBC ($E3,X)          ; E1 E3 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_013
; Address: $E68637
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_013:
    SBC ($7F,X)          ; E1 7F | Subtract with carry ((zero page,X))
    ROL $80FF            ; 2E FF 80 | Rotate left (absolute)
    LDA                  ; BF FF E5 E5 | Read graphics status
    LDA                  ; BF BF 06 A6 | Read graphics status
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_014
; Address: $E68652
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_014:
    STX $FF              ; 86 FF | Store X register to zero page
    STA                  ; 9F 42 C7 7A | Update graphics data
    PHY                  ; 5A | Push Y register to stack
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    STY $84              ; 84 84 | Store Y register to zero page
    STA $C39D,X          ; 9D 9D C3 | Update graphics data
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    STA                  ; 9F 9F 00 6C | Update graphics data
    LDY $FF              ; A4 FF | Load from zero page into Y register
    LDA ($FF,X)          ; A1 FF | Read graphics status
    SBC $7EFF,X          ; FD FF 7E | Subtract with carry (absolute,X)
    ROL $80FF            ; 2E FF 80 | Rotate left (absolute)
    LDA                  ; BF FF E5 E5 | Read graphics status
    LDA                  ; BF BF 06 A6 | Read graphics status
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    STX $FF              ; 86 FF | Store X register to zero page

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_015
; Address: $E68694
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_015:
    SEP #$FF             ; E2 FF | Set processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    PHY                  ; 5A | Push Y register to stack
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)
    LSR $3E              ; 46 3E | Logical shift right (zero page)
    EOR $4E39,Y          ; 59 39 4E | Exclusive OR with accumulator (absolute,Y)
    ROL $3070,X          ; 3E 70 30 | Rotate left (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    ORA $38CF            ; 0D CF 38 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    STZ $62FF            ; 9C FF 62 | Store zero to absolute
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    STA $FE00,X          ; 9D 00 FE | Update graphics data
    PHP                  ; 08 | Push processor status to stack
    BNE $4E              ; D0 4E | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    ORA #$4E             ; 09 4E | Logical OR with accumulator (immediate)
    STA ($8E,X)          ; 81 8E | Update graphics data
    LDA $47BE,Y          ; B9 BE 47 | Read graphics status
    ROR $BEBF,X          ; 7E BF BE | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    DEC                  ; 3A | Decrement accumulator
    ROR $BADD,X          ; 7E DD BA | Rotate right (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    LDA                  ; BF 00 FF 00 | Read graphics status
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    PLX                  ; FA | Pull X register from stack
    LDX $A375,Y          ; BE 75 A3 | Load from absolute,Y into X register
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_016
; Address: $E68725
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_016:
    LDX $FFA9,Y          ; BE A9 FF | Load from absolute,Y into X register
    TSX                  ; BA | Transfer stack pointer to X register
    INC $ABDD            ; EE DD AB | Increment (absolute)
    LDX $ED              ; A6 ED | Load from zero page into X register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    STZ $64              ; 64 64 | Store zero to zero page
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_017
; Address: $E6874E
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_017:
    JSR $CA20            ; 20 20 CA | Jump to subroutine
    INC $FEDA,X          ; FE DA FE | Increment (absolute,X)
    INC $FCB4,X          ; FE B4 FC | Increment (absolute,X)
    LDY $FC              ; A4 FC | Load from zero page into Y register
    LDY $ACFC            ; AC FC AC | Load from absolute address into Y register
    JMP $A0A07C          ; 5C 7C A0 A0 | Jump to address long
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INC $EEEE            ; EE EE EE | Increment (absolute)
    INC $FCFC            ; EE FC FC | Increment (absolute)
    STA ($81,X)          ; 81 81 | Update graphics data
    STA ($FF),Y          ; 91 FF | Update graphics data
    STA ($FF),Y          ; 91 FF | Update graphics data
    ROR $1EFF,X          ; 7E FF 1E | Rotate right (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STX $FF8E            ; 8E 8E FF | Store X register to absolute address
    STY $E18C            ; 8C 8C E1 | Store Y register to absolute address
    LDA $23FF,Y          ; B9 FF 23 | Read graphics status
    ROL $F77B,X          ; 3E 7B F7 | Rotate left (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDX $D3FB,Y          ; BE FB D3 | Load from absolute,Y into X register
    ROL $FB7E            ; 2E 7E FB | Rotate left (absolute)
    STZ $64              ; 64 64 | Store zero to zero page
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    STA ($FF,X)          ; 81 FF | Update graphics data
    INC $77BB            ; EE BB 77 | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_018
; Address: $E687C4
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_018:
    INC $ABBB            ; EE BB AB | Increment (absolute)
    INC $BAFF,X          ; FE FF BA | Increment (absolute,X)
    ADC $4A4A,X          ; 7D 4A 4A | Add with carry (absolute,X)
    LDA                  ; BF 70 A6 EB | Read graphics status
    LDA                  ; BF A5 E3 F2 | Read graphics status
    INC $57E9,X          ; FE E9 57 | Increment (absolute,X)
    LDX $A6              ; A6 A6 | Load from zero page into X register
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    EOR $FFFF,Y          ; 59 FF FF | Exclusive OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $7F              ; 64 7F | Store zero to zero page
    BRA $FF              ; 80 FF | Branch always
    BPL $DF              ; 10 DF | Branch if positive
    BPL $DF              ; 10 DF | Branch if positive
    BPL $DF              ; 10 DF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_019
; Address: $E68857
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_019:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    BPL $20              ; 10 20 | Branch if positive
    BMI $3F              ; 30 3F | Branch if negative
    BMI $02              ; 30 02 | Branch if negative
    INC $FE3E,X          ; FE 3E FE | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_01A
; Address: $E68892
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_01A:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_01C
; Address: $E688AE
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_01C:
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    LDA $FF              ; A5 FF | Read graphics status
    LDA $FF2FFF          ; AF FF 2F FF | Read graphics status
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $10EFC0          ; 8F C0 EF 10 | Update graphics data
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    LDA $1F9F1F          ; AF 1F 9F 1F | Read graphics status
    STA                  ; 9F 70 00 10 | Update graphics data
    BMI $07              ; 30 07 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    BVS $1F              ; 70 1F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_01E
; Address: $E68904
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_01E:
    ORA $E3FF            ; 0D FF E3 | Logical OR with accumulator (absolute)
    CPX #$CC             ; E0 CC | Compare X register (immediate)
    PEA #$ECF0           ; F4 F0 EC | Push effective address to stack
    CPX $F7F7            ; EC F7 F7 | Compare X register (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC $F612            ; ED 12 F6 | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_01F
; Address: $E68934
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_01F:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $FECD            ; CC CD FE | Compare Y register (absolute)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    LDA $00B9,Y          ; B9 B9 00 | Read graphics status
    ROR $6E6E            ; 6E 6E 6E | Rotate right (absolute)
    ROR $FFCC            ; 6E CC FF | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    CMP $00FF,Y          ; D9 FF 00 | Compare accumulator (absolute,Y)
    ROL $F3BE,X          ; 3E BE F3 | Rotate left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROL $CB2E            ; 2E 2E CB | Rotate left (absolute)
    LDA                  ; BF BF 00 FF | Read graphics status
    ROL $D3FF            ; 2E FF D3 | Rotate left (absolute)
    CLC                  ; 18 | Clear carry flag
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    LSR $02FF            ; 4E FF 02 | Logical shift right (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    STA $0F0FAF          ; 8F AF 0F 0F | Update graphics data
    STA                  ; 9F DF 2F AF | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $1F              ; 70 1F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_020
; Address: $E689BF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_020:
    BVC $F7              ; 50 F7 | Branch if overflow clear
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    SBC $F5F0,Y          ; F9 F0 F5 | Subtract with carry (absolute,Y)
    SBC ($E5,X)          ; E1 E5 | Subtract with carry ((zero page,X))
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    CMP ($C0),Y          ; D1 C0 | Compare accumulator ((zero page),Y)
    REP #$F2             ; C2 F2 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_021
; Address: $E689D4
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_021:
    SED                  ; F8 | Set decimal mode flag
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ASL $1EE0            ; 0E E0 1E | Arithmetic shift left (absolute)
    BNE $2E              ; D0 2E | Branch if not equal
    BNE $2E              ; D0 2E | Branch if not equal
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STA $0A0A8F          ; 8F 8F 0A 0A | Update graphics data
    STX $86              ; 86 86 | Store X register to zero page
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLY                  ; 7A | Pull Y register from stack
    ADC $FFFF,Y          ; 79 FF FF | Add with carry (absolute,Y)
    ADC $FF              ; 65 FF | Add with carry (zero page)
    LDA                  ; BF FF 02 00 | Read graphics status
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    LDY $0D              ; A4 0D | Load from zero page into Y register
    ORA $83F9,Y          ; 19 F9 83 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    AND ($7E,X)          ; 21 7E | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_022
; Address: $E68A76
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_022:
    ORA $7A              ; 05 7A | Logical OR with accumulator (zero page)
    BMI $78              ; 30 78 | Branch if negative
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$34             ; C0 34 | Compare Y register (immediate)
    SBC ($ED,X)          ; E1 ED | Subtract with carry ((zero page,X))
    AND ($E1,X)          ; 21 E1 | Logical AND with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Update graphics data
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    ASL $0008,X          ; 1E 08 00 | Arithmetic shift left (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA $9B47,Y          ; 19 47 9B | Logical OR with accumulator (absolute,Y)
    LSR $2B              ; 46 2B | Logical shift right (zero page)
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    BCS $FF              ; B0 FF | Branch if carry set
    INC $C8F8,X          ; FE F8 C8 | Increment (absolute,X)
    ASL $80AF            ; 0E AF 80 | Arithmetic shift left (absolute)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 3F 0F FF | Update graphics data
    SEC                  ; 38 | Set carry flag
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_023
; Address: $E68B12
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_023:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SEC                  ; 38 | Set carry flag
    EOR $B01F,X          ; 5D 1F B0 | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_024
; Address: $E68B2B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_024:
    JSR $60FE            ; 20 FE 60 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_025
; Address: $E68B3C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_025:
    STA                  ; 9F 00 DF 00 | Update graphics data
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $FC04            ; 0D 04 FC | Logical OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    ROR $6E              ; 66 6E | Rotate right (zero page)
    ROL $2E              ; 26 2E | Rotate left (zero page)
    ADC $BF              ; 65 BF | Add with carry (zero page)
    STZ $BF              ; 64 BF | Store zero to zero page
    ADC ($7F),Y          ; 71 7F | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_026
; Address: $E68B78
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_026:
    JSL $7F267F          ; 22 7F 26 7F | Jump to subroutine long
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    JMP $2B40            ; 4C 40 2B | Jump to address
    EOR $25              ; 45 25 | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LSR $EC              ; 46 EC | Logical shift right (zero page)
    LSR $78              ; 46 78 | Logical shift right (zero page)
    PLB                  ; AB | Pull data bank register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    AND $FF0F,Y          ; 39 0F FF | Logical AND with accumulator (absolute,Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BEQ $C0              ; F0 C0 | Branch if equal
    SBC $FF38,X          ; FD 38 FF | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STA $F000,Y          ; 99 00 F0 | Update graphics data
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ROR $0F00,X          ; 7E 00 0F | Rotate right (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_027
; Address: $E68BE1
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_027:
    SBC $3F              ; E5 3F | Subtract with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    LDX #$4F             ; A2 4F | Load immediate value into X register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    STA                  ; 9F 40 80 90 | Update graphics data
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    PLY                  ; 7A | Pull Y register from stack
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    ADC $F2              ; 65 F2 | Add with carry (zero page)
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    SBC $6160,Y          ; F9 60 61 | Subtract with carry (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA                  ; 9F 00 EF 00 | Update graphics data
    PEA #$27FC           ; F4 FC 27 | Push effective address to stack
    ROR $6E              ; 66 6E | Rotate right (zero page)
    ROL $2E              ; 26 2E | Rotate left (zero page)
    LDA                  ; BF 74 BF 41 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_028
; Address: $E68C38
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_028:
    JSL $7F227F          ; 22 7F 22 7F | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    LDA $472160          ; AF 60 21 47 | Read graphics status
    PHB                  ; 8B | Push data bank register to stack
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF F0 FE 87 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    BPL $F2              ; 10 F2 | Branch if positive
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    INC $FFF0,X          ; FE F0 FF | Increment (absolute,X)
    ROL $0100,X          ; 3E 00 01 | Rotate left (absolute,X)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    INC $0FFC,X          ; FE FC 0F | Increment (absolute,X)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_029
; Address: $E68C9A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_029:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BIT $C0              ; 24 C0 | Test bits in accumulator (zero page)
    BVS $CF              ; 70 CF | Branch if overflow set
    CPY #$48             ; C0 48 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    LDA                  ; BF 0E 8E 58 | Read graphics status
    BRA $17              ; 80 17 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    LDA                  ; BF 00 BF 00 | Read graphics status
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    SBC $7984,X          ; FD 84 79 | Subtract with carry (absolute,X)
    SEP #$03             ; E2 03 | Set processor status bits
    BCS $B5              ; B0 B5 | Branch if carry set
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $0E              ; 45 0E | Exclusive OR with accumulator (zero page)
    ORA ($D0,X)          ; 01 D0 | Logical OR with accumulator ((zero page,X))
    ROL $00FF            ; 2E FF 00 | Rotate left (absolute)
    SBC $4B00,X          ; FD 00 4B | Subtract with carry (absolute,X)
    LDA                  ; BF 00 FF 00 | Read graphics status
    INC $D500,X          ; FE 00 D5 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA #$67             ; A9 67 | Read graphics status
    PHA                  ; 48 | Push accumulator to stack
    BIT $B140            ; 2C 40 B1 | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_02A
; Address: $E68CF0
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_02A:
    PLB                  ; AB | Pull data bank register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag
    STA                  ; 9F 00 8E 00 | Update graphics data
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INC $7F83,X          ; FE 83 7F | Increment (absolute,X)
    BEQ $8A              ; F0 8A | Branch if equal
    STA $F400,Y          ; 99 00 F4 | Update graphics data
    EOR $FFFF            ; 4D FF FF | Exclusive OR with accumulator (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_02B
; Address: $E68D56
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_02B:
    AND $39FF,Y          ; 39 FF 39 | Logical AND with accumulator (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    ADC $EF6D            ; 6D 6D EF | Add with carry (absolute)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    AND $F9FF,Y          ; 39 FF F9 | Logical AND with accumulator (absolute,Y)
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_02C
; Address: $E68D86
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_02C:
    JSR $4331            ; 20 31 43 | Jump to subroutine
    ROR $4C4A            ; 6E 4A 4C | Rotate right (absolute)
    BVC $52              ; 50 52 | Branch if overflow clear
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $3F01            ; 0E 01 3F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_02E
; Address: $E68D9C
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_02E:
    JSR $085F            ; 20 5F 08 | Jump to subroutine
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    INC $F6              ; E6 F6 | Increment (zero page)
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    ROR $EE7E            ; 6E 7E EE | Rotate right (absolute)
    INC $FCC0            ; EE C0 FC | Increment (absolute)
    ASL $06FD            ; 0E FD 06 | Arithmetic shift left (absolute)
    SBC $FEC2,X          ; FD C2 FE | Subtract with carry (absolute,X)
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    STY $FE              ; 84 FE | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    INC $FECC,X          ; FE CC FE | Increment (absolute,X)
    CPX $ECEC            ; EC EC EC | Compare X register (absolute)
    CPX $FEEE            ; EC EE FE | Compare X register (absolute)
    LDA                  ; BF 7F 7F 7F | Read graphics status
    DEC $FD              ; C6 FD | Decrement (zero page)
    SBC $FE0A,X          ; FD 0A FE | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    INC $FE8C,X          ; FE 8C FE | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    SBC $FD1E,X          ; FD 1E FD | Subtract with carry (absolute,X)
    INC $F7FE,X          ; FE FE F7 | Increment (absolute,X)
    BRA $75              ; 80 75 | Branch always
    REP #$FF             ; C2 FF | Reset processor status bits
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    SEC                  ; 38 | Set carry flag
    AND $00FF,Y          ; 39 FF 00 | Logical AND with accumulator (absolute,Y)
    CPX #$EC             ; E0 EC | Compare X register (immediate)
    BRA $75              ; 80 75 | Branch always
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_02F
; Address: $E68E16
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_02F:
    AND $F9FF,Y          ; 39 FF F9 | Logical AND with accumulator (absolute,Y)
    EOR ($53),Y          ; 51 53 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    EOR $085A,Y          ; 59 5A 08 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_030
; Address: $E68E32
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_030:
    JSR $085F            ; 20 5F 08 | Jump to subroutine
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    BVC $50              ; 50 50 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    BVS $70              ; 70 70 | Branch if overflow set
    ORA $007F            ; 0D 7F 00 | Logical OR with accumulator (absolute)
    ORA $0D7F            ; 0D 7F 0D | Logical OR with accumulator (absolute)
    ORA $0D7F            ; 0D 7F 0D | Logical OR with accumulator (absolute)
    ADC $727B,Y          ; 79 7B 72 | Add with carry (absolute,Y)
    BVS $70              ; 70 70 | Branch if overflow set
    ADC $3079,Y          ; 79 79 30 | Add with carry (absolute,Y)
    BMI $84              ; 30 84 | Branch if negative
    CPY $60              ; C4 60 | Compare Y register (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $0D7F            ; 0D 7F 0D | Logical OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    STA $0000FF          ; 8F FF 00 00 | Update graphics data
    ADC #$08             ; 69 08 | Add with carry (immediate)
    STX $72              ; 86 72 | Store X register to zero page
    ROL $AE              ; 26 AE | Rotate left (zero page)
    BIT $381E            ; 2C 1E 38 | Test bits in accumulator (absolute)
    ADC $D900,Y          ; 79 00 D9 | Add with carry (absolute,Y)
    LDX $BB00,Y          ; BE 00 BB | Load from absolute,Y into X register
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    CMP #$89             ; C9 89 | Compare accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $FF              ; 85 FF | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    STZ $01              ; 64 01 | Store zero to zero page
    LDA ($03),Y          ; B1 03 | Read graphics status
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    STX $3E              ; 86 3E | Store X register to zero page
    LSR $937F,X          ; 5E 7F 93 | Logical shift right (absolute,X)
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_031
; Address: $E68EF6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_031:
    ROL $4180,X          ; 3E 80 41 | Rotate left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $0600,X          ; 1D 00 06 | Logical OR with accumulator (absolute,X)
    CPY #$C5             ; C0 C5 | Compare Y register (immediate)
    CPX $C0              ; E4 C0 | Compare X register (zero page)
    DEC $1E6E            ; CE 6E 1E | Decrement (absolute)
    CMP #$EF             ; C9 EF | Compare accumulator (immediate)
    STA $F4              ; 85 F4 | Update graphics data
    CPY #$22             ; C0 22 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_032
; Address: $E68F12
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_032:
    JSR $1A19            ; 20 19 1A | Jump to subroutine
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_033
; Address: $E68F1A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_033:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BPL $1F              ; 10 1F | Branch if positive
    ASL $0E0C            ; 0E 0C 0E | Arithmetic shift left (absolute)
    BPL $1E              ; 10 1E | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $C4DF            ; CC DF C4 | Compare Y register (absolute)
    INY                  ; C8 | Increment Y register
    REP #$0C             ; C2 0C | Reset processor status bits
    STX $2EAC            ; 8E AC 2E | Store X register to absolute address
    EOR ($7E),Y          ; 51 7E | Exclusive OR with accumulator ((zero page),Y)
    PLB                  ; AB | Pull data bank register from stack
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_035
; Address: $E68F54
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_035:
    JSR $3D00            ; 20 00 3D | Jump to subroutine
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    STA ($00,X)          ; 81 00 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    LDY #$E0             ; A0 E0 | Game work RAM access
    LDA $00F89F          ; AF 9F F8 00 | Read graphics status
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_036
; Address: $E68F82
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_036:
    PHB                  ; 8B | Push data bank register to stack
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    LSR $937F,X          ; 5E 7F 93 | Logical shift right (absolute,X)
    BRA $44              ; 80 44 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    CPY $0043            ; CC 43 00 | Compare Y register (absolute)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_037
; Address: $E68F9C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_037:
    BRA $00              ; 80 00 | Branch always
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    BEQ $5B              ; F0 5B | Branch if equal
    CPY #$EE             ; C0 EE | Compare Y register (immediate)
    REP #$08             ; C2 08 | Reset processor status bits
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    CMP $81EF            ; CD EF 81 | Compare accumulator (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    BMI $04              ; 30 04 | Branch if negative
    BIT $11              ; 24 11 | Test bits in accumulator (zero page)
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ASL $AF00            ; 0E 00 AF | Arithmetic shift left (absolute)
    STA                  ; 9F 47 4F A0 | Update graphics data
    CPX #$40             ; E0 40 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_038
; Address: $E68FD2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_038:
    BCS $00              ; B0 00 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    EOR $267D,X          ; 5D 7D 26 | Exclusive OR with accumulator (absolute,X)
    ROR $3D              ; 66 3D | Rotate right (zero page)
    ADC $7F47,X          ; 7D 47 7F | Add with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC $07              ; C6 07 | Decrement (zero page)
    ADC $5001            ; 6D 01 50 | Add with carry (absolute)
    STA $8200,Y          ; 99 00 82 | Update graphics data
    BRA $00              ; 80 00 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_039
; Address: $E68FFB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_039:
    JSR $900E            ; 20 0E 90 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC $FC              ; E5 FC | Subtract with carry (zero page)
    INC $F81B,X          ; FE 1B F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_03A
; Address: $E69008
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_03A:
    JSL $E46DE0          ; 22 E0 6D E4 | Jump to subroutine long
    LDA $1680,X          ; BD 80 16 | Read graphics status
    BEQ $03              ; F0 03 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    BPL $76              ; 10 76 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_03B
; Address: $E69022
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_03B:
    PLA                  ; 68 | Pull accumulator from stack
    BCC $E8              ; 90 E8 | Branch if carry clear
    BPL $D6              ; 10 D6 | Branch if positive
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    CPX $6EEC            ; EC EC 6E | Compare X register (absolute)
    ROR $00F3            ; 6E F3 00 | Rotate right (absolute)
    STA ($00),Y          ; 91 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $60              ; F0 60 | Branch if equal
    EOR $9E4D            ; 4D 4D 9E | Exclusive OR with accumulator (absolute)
    ASL $0DCD,X          ; 1E CD 0D | Arithmetic shift left (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    LDA $06B8,Y          ; B9 B8 06 | Read graphics status
    SEI                  ; 78 | Set interrupt disable flag
    ADC $9F              ; 65 9F | Add with carry (zero page)
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    LDY $B87F            ; AC 7F B8 | Load from absolute address into Y register
    ROL $00              ; 26 00 | Rotate left (zero page)
    LDA $BE3C,X          ; BD 3C BE | Read graphics status
    ROL $9494,X          ; 3E 94 94 | Rotate left (absolute,X)
    LDA ($80,X)          ; A1 80 | Read graphics status
    ADC $BE7C,X          ; 7D 7C BE | Add with carry (absolute,X)
    LDX $3E18,Y          ; BE 18 3E | Load from absolute,Y into X register
    ROL $D5C1,X          ; 3E C1 D5 | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_03C
; Address: $E69078
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_03C:
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $0941,X          ; FE 41 09 | Increment (absolute,X)
    BEQ $60              ; F0 60 | Branch if equal
    STA $9E0D            ; 8D 0D 9E | Update graphics data
    ASL $8D4D,X          ; 1E 4D 8D | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_03D
; Address: $E6908C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_03D:
    JSL $38FD42          ; 22 42 FD 38 | Jump to subroutine long
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $9F              ; 65 9F | Add with carry (zero page)
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    ADC $C738,X          ; 7D 38 C7 | Add with carry (absolute,X)
    BIT $BE00            ; 2C 00 BE | Test bits in accumulator (absolute)
    LDA $953C,X          ; BD 3C 95 | Read graphics status
    LDX #$81             ; A2 81 | Load immediate value into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_03E
; Address: $E690AE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_03E:
    LDX $10BF,Y          ; BE BF 10 | Load from absolute,Y into X register
    REP #$3C             ; C2 3C | Reset processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_03F
; Address: $E690B8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_03F:
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    STZ $7CFE            ; 9C FE 7C | Store zero to absolute
    INC $6041,X          ; FE 41 60 | Increment (absolute,X)
    LDA $A33D,X          ; BD 3D A3 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_041
; Address: $E690CF
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_041:
    PHA                  ; 48 | Push accumulator to stack
    REP #$27             ; C2 27 | Reset processor status bits
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($57,X)          ; 01 57 | Logical OR with accumulator ((zero page,X))
    BPL $8E              ; 10 8E | Branch if positive
    STA ($34,X)          ; 81 34 | Update graphics data
    SBC $49F8,Y          ; F9 F8 49 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BMI $CF              ; 30 CF | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    BRA $7F              ; 80 7F | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    PEA #$74BF           ; F4 BF 74 | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    WDM #$00             ; 42 00 | Reserved instruction
    SEC                  ; 38 | Set carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    INC $D0FE,X          ; FE FE D0 | Increment (absolute,X)
    BNE $7F              ; D0 7F | Branch if not equal
    LDA $EABD,X          ; BD BD EA | Read graphics status
    NOP                  ; EA | No operation
    LDX $60BE,Y          ; BE BE 60 | Load from absolute,Y into X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDA $9F00            ; AD 00 9F | Read graphics status
    STA                  ; 9F F4 F4 FF | Update graphics data
    STA $F9F98F          ; 8F 8F F9 F9 | Update graphics data
    STX $00              ; 86 00 | Store X register to zero page
    EOR $6682,Y          ; 59 82 66 | Exclusive OR with accumulator (absolute,Y)
    STA ($B3,X)          ; 81 B3 | Update graphics data
    DEC $A8B6            ; CE B6 A8 | Decrement (absolute)
    BCC $15              ; 90 15 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BMI $CF              ; 30 CF | Branch if negative
    SBC $7F85,Y          ; F9 85 7F | Subtract with carry (absolute,Y)
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    LDA $04              ; A5 04 | Read graphics status
    JMP $9E32            ; 4C 32 9E | Jump to address
    ADC ($06,X)          ; 61 06 | Add with carry ((zero page,X))
    LDX #$04             ; A2 04 | Load immediate value into X register
    INC $E54B,X          ; FE 4B E5 | Increment (absolute,X)
    LDA                  ; BF 56 FB 2C | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_042
; Address: $E69178
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_042:
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STX $00              ; 86 00 | Store X register to zero page
    EOR $2682,Y          ; 59 82 26 | Exclusive OR with accumulator (absolute,Y)
    CMP ($13,X)          ; C1 13 | Compare accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_043
; Address: $E6918A
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_043:
    LSR $A8B6            ; 4E B6 A8 | Logical shift right (absolute)
    BPL $95              ; 10 95 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BMI $CF              ; 30 CF | Branch if negative
    SBC $FF05,Y          ; F9 05 FF | Subtract with carry (absolute,Y)
    CLI                  ; 58 | Clear interrupt disable flag
    EOR ($A2,X)          ; 41 A2 | Exclusive OR with accumulator ((zero page,X))
    ORA ($C4,X)          ; 01 C4 | Logical OR with accumulator ((zero page,X))
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)
    LDA ($62,X)          ; A1 62 | Read graphics status
    ORA ($A6,X)          ; 01 A6 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX $BF              ; E4 BF | Compare X register (zero page)
    BVC $FF              ; 50 FF | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    TAX                  ; AA | Transfer accumulator to X register
    PLP                  ; 28 | Pull processor status from stack
    BRA $77              ; 80 77 | Branch always
    INC $B50E,X          ; FE 0E B5 | Increment (absolute,X)
    AND $0C              ; 25 0C | Logical AND with accumulator (zero page)
    CPY $380C            ; CC 0C 38 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SBC ($2F),Y          ; F1 2F | Subtract with carry ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    WDM #$FF             ; 42 FF | Reserved instruction
    STX $5C01            ; 8E 01 5C | Store X register to absolute address
    AND ($33,X)          ; 21 33 | Logical AND with accumulator ((zero page,X))
    BIT $5223            ; 2C 23 52 | Test bits in accumulator (absolute)
    EOR ($E9),Y          ; 51 E9 | Exclusive OR with accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    STZ $FF              ; 64 FF | Store zero to zero page

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_045
; Address: $E691FA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_045:
    JSR $F0DF            ; 20 DF F0 | Jump to subroutine
    LDA $0017E8          ; AF E8 17 00 | Read graphics status
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CPX $0600            ; EC 00 06 | Compare X register (absolute)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BNE $00              ; D0 00 | Branch if not equal
    STA ($00,X)          ; 81 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_046
; Address: $E69212
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_046:
    DEC $13CE            ; CE CE 13 | Decrement (absolute)
    SBC $9EF9,Y          ; F9 F9 9E | Subtract with carry (absolute,Y)
    STZ $2F2F,X          ; 9E 2F 2F | Store zero to absolute,X
    ROR $007E,X          ; 7E 7E 00 | Rotate right (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCS $00              ; B0 00 | Branch if carry set
    PHX                  ; DA | Push X register to stack
    ORA $C000            ; 0D 00 C0 | Logical OR with accumulator (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    ADC $65              ; 65 65 | Add with carry (zero page)
    INC $4FFE,X          ; FE FE 4F | Increment (absolute,X)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    LDX #$20             ; A2 20 | Load immediate value into X register
    CMP $C240,Y          ; D9 40 C2 | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    STA $6241,Y          ; 99 41 62 | Update graphics data
    LDA                  ; BF 00 BF 00 | Read graphics status
    SED                  ; F8 | Set decimal mode flag
    LSR $0F20,X          ; 5E 20 0F | Logical shift right (absolute,X)
    BCC $00              ; 90 00 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    INC                  ; 1A | Increment accumulator
    ORA $28AA,Y          ; 19 AA 28 | Logical OR with accumulator (absolute,Y)
    ORA $E51C,X          ; 1D 1C E5 | Logical OR with accumulator (absolute,X)
    SEP #$DA             ; E2 DA | Set processor status bits
    CPY #$83             ; C0 83 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    INC $E7E0            ; EE E0 E7 | Increment (absolute)
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    ASL $3800,X          ; 1E 00 38 | Arithmetic shift left (absolute,X)
    ORA $6E              ; 05 6E | Logical OR with accumulator (zero page)
    BPL $F6              ; 10 F6 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    JMP $FF6BFF          ; 5C FF 6B FF | Jump to address long
    STA                  ; 9F FD F6 FF | Update graphics data
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_047
; Address: $E692A2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_047:
    CMP $E7BF            ; CD BF E7 | Compare accumulator (absolute)
    SBC $06EF,X          ; FD EF 06 | Subtract with carry (absolute,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LDA                  ; BF 00 F5 00 | Read graphics status
    JMP $026B00          ; 5C 00 6B 02 | Jump to address long
    STA                  ; 9F 00 F6 00 | Update graphics data
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_048
; Address: $E692E2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_048:
    RTI                  ; 40 | Return from interrupt
    CMP $E703            ; CD 03 E7 | Compare accumulator (absolute)
    BPL $FD              ; 10 FD | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_049
; Address: $E692EB
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_049:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ROL $3F              ; 26 3F | Rotate left (zero page)
    BMI $3F              ; 30 3F | Branch if negative
    ADC $383D,Y          ; 79 3D 38 | Add with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $3F              ; 80 3F | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $EF              ; 30 EF | Branch if negative
    LDY $98C3,X          ; BC C3 98 | Load from absolute,X into Y register
    LDY $07BF,X          ; BC BF 07 | Load from absolute,X into Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF F8 07 86 | Read graphics status
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    CPY $00              ; C4 00 | Compare Y register (zero page)
    STA ($11),Y          ; 91 11 | Update graphics data
    LDX $23              ; A6 23 | Load from zero page into X register
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BIT #$0C             ; 89 0C | Test bits in accumulator (immediate)
    LDX $533F,Y          ; BE 3F 53 | Load from absolute,Y into X register
    INC $DC00            ; EE 00 DC | Increment (absolute)
    INC $F300,X          ; FE 00 F3 | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STY $0300            ; 8C 00 03 | Store Y register to absolute address
    ORA $1A19,X          ; 1D 19 1A | Logical OR with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $1D57            ; 0E 57 1D | Arithmetic shift left (absolute)
    CPY $FD79            ; CC 79 FD | Compare Y register (absolute)
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    BIT $3830            ; 2C 30 38 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_04A
; Address: $E69377
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_04A:
    JSR $0031            ; 20 31 00 | Jump to subroutine
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    INC $8003            ; EE 03 80 | Increment (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    BRA $60              ; 80 60 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_04C
; Address: $E69396
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_04C:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    LDY #$E0             ; A0 E0 | Game work RAM access
    BVC $70              ; 50 70 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    BMI $18              ; 30 18 | Branch if negative
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA ($FF,X)          ; 81 FF | Update graphics data
    LDA $E5C7,Y          ; B9 C7 E5 | Read graphics status
    STA ($FF,X)          ; 81 FF | Update graphics data
    LDA $85C7,Y          ; B9 C7 85 | Read graphics status
    STA $FF00,Y          ; 99 00 FF | Update graphics data
    LDA $ADC7,Y          ; B9 C7 AD | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Update graphics data
    STA ($FF,X)          ; 81 FF | Update graphics data
    LDA ($CF),Y          ; B1 CF | Read graphics status
    PHB                  ; 8B | Push data bank register to stack
    LDA $D5AFD5          ; AF D5 AF D5 | Read graphics status
    LDA #$D3             ; A9 D3 | Read graphics status
    CMP $DBEF,Y          ; D9 EF DB | Compare accumulator (absolute,Y)
    LDA                  ; BF E1 9F E5 | Read graphics status
    LDA $FFC3,Y          ; B9 C3 FF | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_04D
; Address: $E69460
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_04D:
    JSR $A080            ; 20 80 A0 | Jump to subroutine
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BCC $C0              ; 90 C0 | Branch if carry clear
    CPY #$60             ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_04F
; Address: $E6946D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_04F:
    BRA $50              ; 80 50 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_051
; Address: $E69478
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_051:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_052
; Address: $E6947E
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_052:
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    SEP #$08             ; E2 08 | Set processor status bits
    STA $0057,X          ; 9D 57 00 | Update graphics data
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $097E,X          ; 7E 7E 09 | Rotate right (absolute,X)
    ORA #$3E             ; 09 3E | Logical OR with accumulator (immediate)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    STA ($FF,X)          ; 81 FF | Update graphics data
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    STZ $3F9C            ; 9C 9C 3F | Store zero to absolute
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    ASL $F1FF,X          ; 1E FF F1 | Arithmetic shift left (absolute,X)
    BMI $39              ; 30 39 | Branch if negative
    BMI $BD              ; 30 BD | Branch if negative
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $844604          ; 5C 04 46 84 | Jump to address long
    LSR $04              ; 46 04 | Logical shift right (zero page)
    INC $44              ; E6 44 | Increment (zero page)
    INC $92              ; E6 92 | Increment (zero page)
    STY $42              ; 84 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    LDY #$81             ; A0 81 | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    STA ($B8,X)          ; 81 B8 | Update graphics data
    ORA ($D8,X)          ; 01 D8 | Logical OR with accumulator ((zero page,X))
    ORA ($D8,X)          ; 01 D8 | Logical OR with accumulator ((zero page,X))
    BRA $CC              ; 80 CC | Branch always
    EOR ($21,X)          ; 41 21 | PPU graphics register access
    EOR $25              ; 45 25 | Exclusive OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    EOR ($89,X)          ; 41 89 | Exclusive OR with accumulator ((zero page,X))
    AND ($C9,X)          ; 21 C9 | Logical AND with accumulator ((zero page,X))
    STY $0C              ; 84 0C | Store Y register to zero page
    ASL $C006            ; 0E 06 C0 | Arithmetic shift left (absolute)
    DEC $DAC0,X          ; DE C0 DA | Decrement (absolute,X)
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    BEQ $F4              ; F0 F4 | Branch if equal
    BVS $F6              ; 70 F6 | Branch if overflow set
    BMI $F6              ; 30 F6 | Branch if negative
    BEQ $F3              ; F0 F3 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC $0818,Y          ; F9 18 08 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_053
; Address: $E69523
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_053:
    PHP                  ; 08 | Push processor status to stack
    LDA $AD              ; A5 AD | Read graphics status
    DEX                  ; CA | Decrement X register
    LSR $12              ; 46 12 | Logical shift right (zero page)
    LSR $A0              ; 46 A0 | Logical shift right (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA ($D8),Y          ; 91 D8 | Update graphics data
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $F7              ; F0 F7 | Branch if equal
    BVC $52              ; 50 52 | Branch if overflow clear
    CLV                  ; B8 | Clear overflow flag
    LDA $F9B8,Y          ; B9 B8 F9 | Read graphics status
    SBC $EEEE,X          ; FD EE EE | Subtract with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    INC $3FC0            ; EE C0 3F | Increment (absolute)
    SBC #$40             ; E9 40 | Subtract with carry (immediate)
    BVS $8F              ; 70 8F | Branch if overflow set
    SBC $FF54,X          ; FD 54 FF | Subtract with carry (absolute,X)
    LDA $FFFF,X          ; BD FF FF | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    STA                  ; 9F F6 09 38 | Update graphics data
    ORA $2BFF,X          ; 1D FF 2B | Logical OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_055
; Address: $E69589
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_055:
    JSL $526141          ; 22 41 61 52 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    ADC ($72),Y          ; 71 72 | Add with carry ((zero page),Y)
    BVS $76              ; 70 76 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $77              ; 90 77 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    STA $49              ; 85 49 | Update graphics data
    BCC $5A              ; 90 5A | Branch if carry clear
    LDA $61              ; A5 61 | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    LDA $00              ; A5 00 | Read graphics status
    STZ $0000,X          ; 9E 00 00 | Store zero to absolute,X
    ADC $11F6,Y          ; 79 F6 11 | Add with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC $A126            ; 6D 26 A1 | Add with carry (absolute)
    EOR $86              ; 45 86 | Exclusive OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $4900,Y          ; D9 00 49 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_056
; Address: $E695DE
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_056:
    ADC $8000,Y          ; 79 00 80 | Add with carry (absolute,Y)
    BRA $69              ; 80 69 | Branch always
    SBC $3F4D,X          ; FD 4D 3F | Subtract with carry (absolute,X)
    BPL $20              ; 10 20 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    WDM #$00             ; 42 00 | Reserved instruction
    BMI $00              ; 30 00 | Branch if negative
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    EOR #$6E             ; 49 6E | Exclusive OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND $5CAE            ; 2D AE 5C | Logical AND with accumulator (absolute)
    LDY $1CFF,X          ; BC FF 1C | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00),Y          ; 91 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDA $0200,X          ; BD 00 02 | Read graphics status
    BIT $313C            ; 2C 3C 31 | Test bits in accumulator (absolute)
    SBC $F929,Y          ; F9 29 F9 | Subtract with carry (absolute,Y)
    LDA #$F9             ; A9 F9 | Read graphics status
    XBA                  ; EB | Exchange accumulator bytes
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    BPL $10              ; 10 10 | Branch if positive
    DEC $E7              ; C6 E7 | Decrement (zero page)
    STA ($81,X)          ; 81 81 | Update graphics data
    CMP #$99             ; C9 99 | Compare accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    STA $9948,Y          ; 99 48 99 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    STA $FFE4,Y          ; 99 E4 FF | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ROR $B5FF,X          ; 7E FF B5 | Rotate right (absolute,X)
    ADC $F4              ; 65 F4 | Add with carry (zero page)
    BIT $E6              ; 24 E6 | Test bits in accumulator (zero page)
    ROL $65              ; 26 65 | Rotate left (zero page)
    LDA $E535            ; AD 35 E5 | Read graphics status
    INC $2E              ; E6 2E | Increment (zero page)
    LDY $6C              ; A4 6C | Load from zero page into Y register
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    REP #$82             ; C2 82 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_057
; Address: $E69682
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_057:
    REP #$92             ; C2 92 | Reset processor status bits
    REP #$82             ; C2 82 | Reset processor status bits
    REP #$82             ; C2 82 | Reset processor status bits
    REP #$8A             ; C2 8A | Reset processor status bits
    REP #$8A             ; C2 8A | Reset processor status bits
    REP #$A2             ; C2 A2 | Reset processor status bits
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX $EA35            ; EC 35 EA | Compare X register (absolute)
    INX                  ; E8 | Increment X register
    INC $6F64            ; EE 64 6F | Increment (absolute)
    CMP ($EE),Y          ; D1 EE | Compare accumulator ((zero page),Y)
    STA $7C6BE8          ; 8F E8 6B 7C | Update graphics data
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $18              ; 80 18 | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $18              ; 80 18 | Branch always
    JMP $0CF3            ; 4C F3 0C | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    STX $EF90            ; 8E 90 EF | Store X register to absolute address
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1800            ; 0D 00 18 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_058
; Address: $E696E5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_058:
    PHP                  ; 08 | Push processor status to stack
    CMP $2AD5            ; CD D5 2A | Compare accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_059
; Address: $E696F9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_059:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive
    JMP $DF9F5E          ; 5C 5E 9F DF | Jump to address long
    CMP $81FB,Y          ; D9 FB 81 | Compare accumulator (absolute,Y)
    STA ($EF,X)          ; 81 EF | Update graphics data
    LDA ($99,X)          ; A1 99 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_05A
; Address: $E69714
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_05A:
    JSR $0899            ; 20 99 08 | Jump to subroutine
    STA $990A,Y          ; 99 0A 99 | Update graphics data
    ROR $10FF,X          ; 7E FF 10 | Rotate right (absolute,X)
    BPL $5E              ; 10 5E | Branch if positive
    ASL $F7B7,X          ; 1E B7 F7 | Arithmetic shift left (absolute,X)
    SBC ($F5),Y          ; F1 F5 | Subtract with carry ((zero page),Y)
    CMP $81FB,Y          ; D9 FB 81 | Compare accumulator (absolute,Y)
    STA ($EF,X)          ; 81 EF | Update graphics data
    LDA ($99,X)          ; A1 99 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    STA $990A,Y          ; 99 0A 99 | Update graphics data
    BIT $0499            ; 2C 99 04 | Test bits in accumulator (absolute)
    ROR $66FF,X          ; 7E FF 66 | Rotate right (absolute,X)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    REP #$00             ; C2 00 | Reset processor status bits
    REP #$86             ; C2 86 | Reset processor status bits
    REP #$96             ; C2 96 | Reset processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    REP #$9A             ; C2 9A | Reset processor status bits
    TAX                  ; AA | Transfer accumulator to X register
    STZ $BA82,X          ; 9E 82 BA | Store zero to absolute,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_05B
; Address: $E69782
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_05B:
    STX $6F9B            ; 8E 9B 6F | Store X register to absolute address
    INX                  ; E8 | Increment X register
    STA $7C6BF8          ; 8F F8 6B 7C | Update graphics data
    ADC #$7E             ; 69 7E | Add with carry (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    STA                  ; 9F 8D 9E 80 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_05D
; Address: $E69795
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_05D:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $18              ; 80 18 | Branch always
    BRA $18              ; 80 18 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_05F
; Address: $E6979F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_05F:
    CLC                  ; 18 | Clear carry flag
    ASL $EB              ; 06 EB | Arithmetic shift left (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    ADC #$E7             ; 69 E7 | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    ROR $EE97            ; 6E 97 EE | Rotate right (absolute)
    INC $1800            ; EE 00 18 | Increment (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_060
; Address: $E697C4
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_060:
    JSL $08F7CD          ; 22 CD F7 08 | Jump to subroutine long
    INC $6A              ; E6 6A | Increment (zero page)
    CMP $E9              ; C5 E9 | Compare accumulator (zero page)
    ROL $EB              ; 26 EB | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LDA $6D              ; A5 6D | Read graphics status
    ADC $FD              ; 65 FD | Add with carry (zero page)
    STZ $FC              ; 64 FC | Store zero to zero page
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    SBC $FBEB,X          ; FD EB FB | Subtract with carry (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $18              ; 80 18 | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_061
; Address: $E69821
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_061:
    TAX                  ; AA | Transfer accumulator to X register
    STZ $BA82,X          ; 9E 82 BA | Store zero to absolute,X
    INC $BA82,X          ; FE 82 BA | Increment (absolute,X)
    LDX $FE82,Y          ; BE 82 FE | Load from absolute,Y into X register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    TXA                  ; 8A | Transfer X register to accumulator
    EOR $CA5F            ; 4D 5F CA | Exclusive OR with accumulator (absolute)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LDY #$18             ; A0 18 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_062
; Address: $E69856
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_062:
    JSR $0018            ; 20 18 00 | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    INC $F7FF            ; EE FF F7 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    LDA $CF              ; A5 CF | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_063
; Address: $E69866
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_063:
    JSL $FFEFCF          ; 22 CF EF FF | Jump to subroutine long
    ROR $FF6E,X          ; 7E 6E FF | Rotate right (absolute,X)
    STA ($91),Y          ; 91 91 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STA ($18,X)          ; 81 18 | Update graphics data
    ROR $E6FF            ; 6E FF E6 | Rotate right (absolute)
    ORA #$65             ; 09 65 | Logical OR with accumulator (immediate)
    LDX $BF62,Y          ; BE 62 BF | Load from absolute,Y into X register
    BIT $CF              ; 24 CF | Test bits in accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDA $F767,X          ; BD 67 F7 | Read graphics status
    STA ($91),Y          ; 91 91 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ROR $C1FF            ; 6E FF C1 | Rotate right (absolute)
    SBC $8281,X          ; FD 81 82 | Subtract with carry (absolute,X)
    SBC $FD83,X          ; FD 83 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_064
; Address: $E698A8
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_064:
    LDA $FFC1D1          ; AF D1 C1 FF | Read graphics status
    REP #$BD             ; C2 BD | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    LDX $E2FE,Y          ; BE FE E2 | Load from absolute,Y into X register
    BRA $80              ; 80 80 | Branch always
    INC $FE82,X          ; FE 82 FE | Increment (absolute,X)
    INC $BCFE,X          ; FE FE BC | Increment (absolute,X)
    INC $88C0,X          ; FE C0 88 | Increment (absolute,X)
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $BF              ; 24 BF | Test bits in accumulator (zero page)
    BIT $BF              ; 24 BF | Test bits in accumulator (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STA ($FF,X)          ; 81 FF | Update graphics data
    STA ($BD,X)          ; 81 BD | Update graphics data
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    STA $00FF,X          ; 9D FF 00 | Update graphics data
    BIT $303C            ; 2C 3C 30 | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    SBC $A9F9,Y          ; F9 F9 A9 | Subtract with carry (absolute,Y)
    SBC $FBEB,Y          ; F9 EB FB | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SBC $3939,Y          ; F9 39 39 | Subtract with carry (absolute,Y)
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    ASL $3C              ; 06 3C | Arithmetic shift left (zero page)
    DEC $3C              ; C6 3C | Decrement (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    INC $3E02,X          ; FE 02 3E | Increment (absolute,X)
    ROR $3D7E,X          ; 7E 7E 3D | Rotate right (absolute,X)
    LDA $BD3D,X          ; BD 3D BD | Read graphics status
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDY $01BC,X          ; BC BC 01 | Load from absolute,X into Y register
    STA ($FF,X)          ; 81 FF | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Update graphics data
    WDM #$FF             ; 42 FF | Reserved instruction
    WDM #$FF             ; 42 FF | Reserved instruction

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_065
; Address: $E69960
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_065:
    BPL $10              ; 10 10 | Branch if positive
    STA ($81,X)          ; 81 81 | Update graphics data
    CMP #$99             ; C9 99 | Compare accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    STA $9948,Y          ; 99 48 99 | Update graphics data
    PLA                  ; 68 | Pull accumulator from stack
    STA $FFE4,Y          ; 99 E4 FF | Update graphics data
    JMP $997E99          ; 5C 99 7E 99 | Jump to address long
    BPL $10              ; 10 10 | Branch if positive
    JMP $DF9F5E          ; 5C 5E 9F DF | Jump to address long
    LDA ($A1,X)          ; A1 A1 | Read graphics status
    LDA ($99,X)          ; A1 99 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_066
; Address: $E69994
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_066:
    JSR $0899            ; 20 99 08 | Jump to subroutine
    STA $990A,Y          ; 99 0A 99 | Update graphics data
    STA $995E,Y          ; 99 5E 99 | Update graphics data
    BPL $10              ; 10 10 | Branch if positive
    LSR $B71E,X          ; 5E 1E B7 | Logical shift right (absolute,X)
    SBC ($F5),Y          ; F1 F5 | Subtract with carry ((zero page),Y)
    SBC $A1FB,Y          ; F9 FB A1 | Subtract with carry (absolute,Y)
    LDA ($EF,X)          ; A1 EF | Read graphics status
    LDA ($99,X)          ; A1 99 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    STA $990A,Y          ; 99 0A 99 | Update graphics data
    BIT $0499            ; 2C 99 04 | Test bits in accumulator (absolute)
    STA $995E,Y          ; 99 5E 99 | Update graphics data
    BPL $FF              ; 10 FF | Branch if positive
    BPL $A4              ; 10 A4 | Branch if positive
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    CPY $FFFF            ; CC FF FF | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    CPY $BAFF            ; CC FF BA | Compare Y register (absolute)
    BIT #$3F             ; 89 3F | Test bits in accumulator (immediate)
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    LDA $FDFF,X          ; BD FF FD | Read graphics status
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BNE $3F              ; D0 3F | Branch if not equal
    ASL $60E1,X          ; 1E E1 60 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_067
; Address: $E69A20
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_067:
    JSL $FFDBC7          ; 22 C7 DB FF | Jump to subroutine long
    PHY                  ; 5A | Push Y register to stack
    STZ $ED              ; 64 ED | Store zero to zero page
    BIT $C3BD            ; 2C BD C3 | Test bits in accumulator (absolute)
    INC $42              ; E6 42 | Hardware register operation
    LDY $FC              ; A4 FC | Load from zero page into Y register
    WDM #$BD             ; 42 BD | Reserved instruction
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BPL $A5              ; 10 A5 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_068
; Address: $E69A5D
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_068:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLY                  ; 7A | Pull Y register from stack
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    ADC $0400,X          ; 7D 00 04 | Add with carry (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $1F00,X          ; 1D 00 1F | Logical OR with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    ADC $53F9,Y          ; 79 F9 53 | Add with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BIT $FFFF            ; 2C FF FF | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    INC $80FE,X          ; FE FE 80 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $5D              ; 80 5D | Branch always
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_069
; Address: $E69AC0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_069:
    JSL $FB5B22          ; 22 22 5B FB | Jump to subroutine long
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    CMP $04FF,X          ; DD FF 04 | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_06A
; Address: $E69AE0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_06A:
    JSL $1B1B22          ; 22 22 1B 1B | Jump to subroutine long
    ORA $000F            ; 0D 0F 00 | Logical OR with accumulator (absolute)
    CMP $E4FF,X          ; DD FF E4 | Compare accumulator (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    LSR                  ; 4A | Logical shift right (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_06B
; Address: $E69B10
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_06B:
    STX $FE              ; 86 FE | Store X register to zero page
    STX $87FE            ; 8E FE 87 | Store X register to absolute address
    STY $FE              ; 84 FE | Store Y register to zero page
    STA $FF              ; 85 FF | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    STZ $FE82,X          ; 9E 82 FE | Store zero to absolute,X
    INC $82C6,X          ; FE C6 82 | Increment (absolute,X)
    INC $9840,X          ; FE 40 98 | Increment (absolute,X)
    INC $01FE,X          ; FE FE 01 | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $D9DF,X          ; 9D DF D9 | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    LDA ($FF,X)          ; A1 FF | Read graphics status
    STA $C3DF,X          ; 9D DF C3 | Update graphics data
    STA ($95,X)          ; 81 95 | Update graphics data
    CMP ($9F),Y          ; D1 9F | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_06C
; Address: $E69B50
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_06C:
    JSR $2081            ; 20 81 20 | Jump to subroutine
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($20,X)          ; 81 20 | Update graphics data
    STA ($3C,X)          ; 81 3C | Update graphics data
    STA ($20,X)          ; 81 20 | Update graphics data
    STA ($20,X)          ; 81 20 | Update graphics data
    STA ($23,X)          ; 81 23 | Update graphics data
    TYA                  ; 98 | Transfer Y register to accumulator
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_06E
; Address: $E69B74
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_06E:
    BEQ $00              ; F0 00 | Branch if equal
    CPX $D800            ; EC 00 D8 | Compare X register (absolute)
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_06F
; Address: $E69B84
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_06F:
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    SBC $63FB,Y          ; F9 FB 63 | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    LDA ($A1,X)          ; A1 A1 | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    LDX $FB98,Y          ; BE 98 FB | Load from absolute,Y into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR $0098,X          ; 5E 98 00 | Logical shift right (absolute,X)
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    SEP #$FB             ; E2 FB | Set processor status bits

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_070
; Address: $E69BAC
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_070:
    SBC $A1FB,Y          ; F9 FB A1 | Subtract with carry (absolute,Y)
    LDA ($FF,X)          ; A1 FF | Read graphics status
    ORA $19FF,Y          ; 19 FF 19 | Logical OR with accumulator (absolute,Y)
    ORA $1924,Y          ; 19 24 19 | Logical OR with accumulator (absolute,Y)
    ORA $195E,Y          ; 19 5E 19 | Logical OR with accumulator (absolute,Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($14,X)          ; 01 14 | Logical OR with accumulator ((zero page,X))
    ORA $352E,Y          ; 19 2E 35 | Logical OR with accumulator (absolute,Y)
    ASL $5E13,X          ; 1E 13 5E | Arithmetic shift left (absolute,X)
    ROL $0001,X          ; 3E 01 00 | Rotate left (absolute,X)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA $2F              ; 05 2F | Logical OR with accumulator (zero page)
    ASL $5F              ; 06 5F | Arithmetic shift left (zero page)
    ASL $BA25            ; 0E 25 BA | Arithmetic shift left (absolute)
    ROL $2DB1            ; 2E B1 2D | Rotate left (absolute)
    ROL $22B3            ; 2E B3 22 | Rotate left (absolute)
    AND #$B7             ; 29 B7 | Logical AND with accumulator (immediate)
    AND $BA              ; 25 BA | Logical AND with accumulator (zero page)
    AND $5F32            ; 2D 32 5F | Logical AND with accumulator (absolute)
    ORA ($51,X)          ; 01 51 | Logical OR with accumulator ((zero page,X))
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    ORA $0E5F            ; 0D 5F 0E | Logical OR with accumulator (absolute)
    LSR $2F00,X          ; 5E 00 2F | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    LDY $BF20,X          ; BC 20 BF | Load from absolute,X into Y register
    LDY #$2B             ; A0 2B | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($3B),Y          ; 11 3B | Logical OR with accumulator ((zero page),Y)
    JMP $0C5E08          ; 5C 08 5E 0C | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($BF),Y          ; 11 BF | Logical OR with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $9F              ; F0 9F | Branch if equal
    EOR $9EB2            ; 4D B2 9E | Exclusive OR with accumulator (absolute)
    SBC ($CD,X)          ; E1 CD | Subtract with carry ((zero page,X))
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDA $4647,Y          ; B9 47 46 | Read graphics status
    DEY                  ; 88 | Decrement Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA $BEC3,X          ; BD C3 BE | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_072
; Address: $E69C68
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_072:
    LDA ($7F,X)          ; A1 7F | Read graphics status
    ADC $BE83,X          ; 7D 83 BE | Add with carry (absolute,X)
    EOR ($B8,X)          ; 41 B8 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    JMP $8D30            ; 4C 30 8D | Jump to address
    STA ($4A),Y          ; 91 4A | Update graphics data
    BPL $EF              ; 10 EF | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    STA $DB00,Y          ; 99 00 DB | Update graphics data
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    INC $BCB8,X          ; FE B8 BC | Increment (absolute,X)
    CPY #$87             ; C0 87 | Compare Y register (immediate)
    STZ $87C3            ; 9C C3 87 | Store zero to absolute
    LDA #$C7             ; A9 C7 | Read graphics status
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $EF              ; 10 EF | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_073
; Address: $E69D06
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_073:
    BNE $0F              ; D0 0F | Branch if not equal
    SBC $DEB5,X          ; FD B5 DE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA ($00,X)          ; 81 00 | Update graphics data
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_074
; Address: $E69D2D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_074:
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    ROR $7E              ; 66 7E | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    LDA $99              ; A5 99 | Read graphics status
    ROL $FF              ; 26 FF | Rotate left (zero page)
    ROL $DF1E,X          ; 3E 1E DF | Rotate left (absolute,X)
    LDA $FF00,X          ; BD 00 FF | Read graphics status
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_075
; Address: $E69D5E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_075:
    JSR $69DF            ; 20 DF 69 | Jump to subroutine
    ADC $7C46            ; 6D 46 7C | Add with carry (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_076
; Address: $E69D6C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_076:
    JMP $383864          ; 5C 64 38 38 | Jump to address long
    SEC                  ; 38 | Set carry flag
    EOR $E9FF,X          ; 5D FF E9 | Exclusive OR with accumulator (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHY                  ; 5A | Push Y register to stack
    BRA $63              ; 80 63 | Branch always
    BCC $B9              ; 90 B9 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_077
; Address: $E69DA5
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_077:
    JSL $33804E          ; 22 4E 80 33 | Jump to subroutine long
    CPY $04DB            ; CC DB 04 | Compare Y register (absolute)
    JMP $36B3            ; 4C B3 36 | Jump to address
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    ORA ($C6,X)          ; 01 C6 | Logical OR with accumulator ((zero page,X))
    ORA #$94             ; 09 94 | Logical OR with accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    INY                  ; C8 | Increment Y register
    BMI $50              ; 30 50 | Branch if negative
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1C0B            ; 0E 0B 1C | Arithmetic shift left (absolute)
    ROL $3E35,X          ; 3E 35 3E | Rotate left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDY $B4FC,X          ; BC FC B4 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_078
; Address: $E69E24
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_078:
    LDY $ACFC,X          ; BC FC AC | Load from absolute,X into Y register
    TAX                  ; AA | Transfer accumulator to X register
    STZ $BA82,X          ; 9E 82 BA | Store zero to absolute,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_07A
; Address: $E69E44
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_07A:
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    BVS $F8              ; 70 F8 | Branch if overflow set
    BCC $68              ; 90 68 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $9CFC            ; 9C FC 9C | Store zero to absolute
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    STA ($64,X)          ; 81 64 | Update graphics data
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    BCC $20              ; 90 20 | Branch if carry clear
    BNE $40              ; D0 40 | Branch if not equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    INC $DC00,X          ; FE 00 DC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    AND $D8FF,X          ; 3D FF D8 | Logical AND with accumulator (absolute,X)
    INY                  ; C8 | Increment Y register
    LDA $D0E1,Y          ; B9 E1 D0 | Read graphics status
    BCS $8A              ; B0 8A | Branch if carry set
    STX $0B24            ; 8E 24 0B | Store X register to absolute address
    BIT $1F              ; 24 1F | Test bits in accumulator (zero page)
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_07B
; Address: $E69E98
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_07B:
    JSR $06FF            ; 20 FF 06 | Jump to subroutine
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    ROL $5E21,X          ; 3E 21 5E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_07D
; Address: $E69EA7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_07D:
    JSR $211A            ; 20 1A 21 | PPU graphics register access
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $1E01,X          ; 3E 01 1E | Rotate left (absolute,X)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_07E
; Address: $E69EC0
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_07E:
    ORA #$34             ; 09 34 | Logical OR with accumulator (immediate)
    ORA $1964,Y          ; 19 64 19 | Logical OR with accumulator (absolute,Y)
    STZ $19              ; 64 19 | Store zero to zero page
    STZ $19              ; 64 19 | Store zero to zero page
    STZ $19              ; 64 19 | Store zero to zero page
    STZ $11              ; 64 11 | Store zero to zero page
    STZ $19              ; 64 19 | Store zero to zero page
    JMP ($00FD)          ; 6C FD 00 | Jump to address (absolute indirect)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    STY $8C42            ; 8C 42 8C | Store Y register to absolute address
    WDM #$8C             ; 42 8C | Reserved instruction
    WDM #$8C             ; 42 8C | Reserved instruction
    LSR $88              ; 46 88 | Logical shift right (zero page)
    DEC $08              ; C6 08 | Decrement (zero page)
    DEC $08              ; C6 08 | Decrement (zero page)
    DEC $08              ; C6 08 | Decrement (zero page)
    DEC $CE              ; C6 CE | Decrement (zero page)
    DEC $CE00            ; CE 00 CE | Decrement (absolute)
    DEX                  ; CA | Decrement X register
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    STX $4D8B            ; 8E 8B 4D | Store X register to absolute address
    DEX                  ; CA | Decrement X register
    SEI                  ; 78 | Set interrupt disable flag
    ORA $83              ; 05 83 | Logical OR with accumulator (zero page)
    ROR $2FEB            ; 6E EB 2F | Rotate right (absolute)
    PLB                  ; AB | Pull data bank register from stack
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BPL $00              ; 10 00 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    LDA $5EB316          ; AF 16 B3 5E | Read graphics status
    ORA $243D,X          ; 1D 3D 24 | Logical OR with accumulator (absolute,X)
    BIT $E0              ; 24 E0 | Game work RAM access
    CPX $4D4D            ; EC 4D 4D | Compare X register (absolute)
    BVC $00              ; 50 00 | Branch if overflow clear
    WDM #$48             ; 42 48 | Reserved instruction
    REP #$00             ; C2 00 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    CMP $3C              ; C5 3C | Compare accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    STY $7E              ; 84 7E | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_07F
; Address: $E69F4A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_07F:
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    STA $BFFF,X          ; 9D FF BF | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    INC $FD98,X          ; FE 98 FD | Increment (absolute,X)
    SBC $D2BA,Y          ; F9 BA D2 | Subtract with carry (absolute,Y)
    PEA #$E8A4           ; F4 A4 E8 | Push effective address to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    BPL $11              ; 10 11 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_080
; Address: $E69F84
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_080:
    JSR $4031            ; 20 31 40 | Jump to subroutine
    ADC ($4E,X)          ; 61 4E | Add with carry ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ROL $0A3F            ; 2E 3F 0A | Rotate left (absolute)
    ADC ($1E),Y          ; 71 1E | Add with carry ((zero page),Y)
    ADC ($3A),Y          ; 71 3A | Add with carry ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR #$F7             ; 49 F7 | Exclusive OR with accumulator (immediate)
    STY $1173            ; 8C 73 11 | Store Y register to absolute address
    INC $7FB0,X          ; FE B0 7F | Increment (absolute,X)
    ORA $196C,Y          ; 19 6C 19 | Logical OR with accumulator (absolute,Y)
    JMP ($6411)          ; 6C 11 64 | Jump to address (absolute indirect)
    ORA $116C,Y          ; 19 6C 11 | Logical OR with accumulator (absolute,Y)
    STZ $11              ; 64 11 | Store zero to zero page
    STZ $6D              ; 64 6D | Store zero to zero page
    ORA $0072            ; 0D 72 00 | Logical OR with accumulator (absolute)
    SBC $F500,X          ; FD 00 F5 | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    DEC $8C              ; C6 8C | Decrement (zero page)
    DEC $08              ; C6 08 | Decrement (zero page)
    DEC $8C              ; C6 8C | Decrement (zero page)
    DEC $0C              ; C6 0C | Decrement (zero page)
    LSR $08              ; 46 08 | Logical shift right (zero page)
    WDM #$9C             ; 42 9C | Reserved instruction
    AND ($01),Y          ; 31 01 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    DEX                  ; CA | Decrement X register
    DEC $2000            ; CE 00 20 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_081
; Address: $E69FFE
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_081:
    INC $A800,X          ; FE 00 A8 | Increment (absolute,X)
    LDY $8080            ; AC 80 80 | Load from absolute address into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BIT $25              ; 24 25 | Test bits in accumulator (zero page)
    AND $24              ; 25 24 | Logical AND with accumulator (zero page)
    BIT $2CCD            ; 2C CD 2C | Test bits in accumulator (absolute)
    CMP $CD2C            ; CD 2C CD | Compare accumulator (absolute)
    ORA ($DA,X)          ; 01 DA | Logical OR with accumulator ((zero page,X))
    BRA $DA              ; 80 DA | Branch always
    BRA $16              ; 80 16 | Branch always
    JMP $004C            ; 4C 4C 00 | Jump to address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STY $44CD            ; 8C CD 44 | Store Y register to absolute address
    EOR #$44             ; 49 44 | Exclusive OR with accumulator (immediate)
    EOR #$44             ; 49 44 | Exclusive OR with accumulator (immediate)
    EOR #$B3             ; 49 B3 | Exclusive OR with accumulator (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $F2              ; 80 F2 | Branch always
    BRA $F2              ; 80 F2 | Branch always
    BRA $9F              ; 80 9F | Branch always
    LDA                  ; BF F6 7D EC | Read graphics status
    INC $FC9D,X          ; FE 9D FC | Increment (absolute,X)
    CPX $F0E5            ; EC E5 F0 | Compare X register (absolute)
    INY                  ; C8 | Increment Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    CMP ($31),Y          ; D1 31 | Compare accumulator ((zero page),Y)
    ROL $7C3E,X          ; 3E 3E 7C | Rotate left (absolute,X)
    ROL $DF              ; 26 DF | Rotate left (zero page)
    LDA                  ; BF 0C FF 18 | Read graphics status
    INC $FC31,X          ; FE 31 FC | Increment (absolute,X)
    SBC $E2C4,Y          ; F9 C4 E2 | Subtract with carry (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    CPX $2D              ; E4 2D | Compare X register (zero page)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BNE $5B              ; D0 5B | Branch if not equal
    NOP                  ; EA | No operation
    ORA $2E60,Y          ; 19 60 2E | Logical OR with accumulator (absolute,Y)
    BVS $24              ; 70 24 | Branch if overflow set
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    ADC ($8E,X)          ; 61 8E | Add with carry ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROR $07              ; 66 07 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_082
; Address: $E6A0A4
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_082:
    AND $4E39,Y          ; 39 39 4E | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    AND $4FC6,Y          ; 39 C6 4F | Logical AND with accumulator (absolute,Y)
    BCS $03              ; B0 03 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($66),Y          ; 11 66 | Logical OR with accumulator ((zero page),Y)
    ORA #$6C             ; 09 6C | Logical OR with accumulator (immediate)
    ADC $05              ; 65 05 | Add with carry (zero page)
    ORA $1166,Y          ; 19 66 11 | Logical OR with accumulator (absolute,Y)
    STZ $11              ; 64 11 | Store zero to zero page
    STZ $11              ; 64 11 | Store zero to zero page
    STZ $11              ; 64 11 | Store zero to zero page
    STZ $FF              ; 64 FF | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    STY $8873            ; 8C 73 88 | Store Y register to absolute address
    REP #$CE             ; C2 CE | Reset processor status bits
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    DEC $8C              ; C6 8C | Decrement (zero page)
    DEC $0C              ; C6 0C | Decrement (zero page)
    LSR $8C              ; 46 8C | Logical shift right (zero page)
    DEC $FF              ; C6 FF | Decrement (zero page)
    LSR $3000            ; 4E 00 30 | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    DEX                  ; CA | Decrement X register
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR $4EAB            ; 6E AB 4E | Rotate right (absolute)
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    ROL $F680,X          ; 3E 80 F6 | Rotate left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    AND ($AC,X)          ; 21 AC | Logical AND with accumulator ((zero page,X))
    ASL $4B              ; 06 4B | Arithmetic shift left (zero page)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    LDA #$0C             ; A9 0C | Read graphics status
    RTI                  ; 40 | Return from interrupt
    BCS $80              ; B0 80 | Branch if carry set
    ROL $1600,X          ; 3E 00 16 | Rotate left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    LDA                  ; BF BB 3F DD | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_083
; Address: $E6A146
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_083:
    STZ $DDFB,X          ; 9E FB DD | Store zero to absolute,X
    LDY $B8EA,X          ; BC EA B8 | Load from absolute,X into Y register
    CPY $F8              ; C4 F8 | Compare Y register (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    SBC $F906,X          ; FD 06 F9 | Subtract with carry (absolute,X)
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    BNE $20              ; D0 20 | Branch if not equal
    AND ($81,X)          ; 21 81 | Logical AND with accumulator ((zero page,X))
    STX $06              ; 86 06 | Store X register to zero page
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LSR $BF              ; 46 BF | Logical shift right (zero page)
    STY $197E            ; 8C 7E 19 | Store Y register to absolute address
    SBC $F831,X          ; FD 31 F8 | Subtract with carry (absolute,X)
    ROR $F4              ; 66 F4 | Rotate right (zero page)
    CPY $88E8            ; CC E8 88 | Compare Y register (absolute)
    CPY $F8              ; C4 F8 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $88              ; 10 88 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_084
; Address: $E6A192
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_084:
    JSR $4010            ; 20 10 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BCC $E7              ; 90 E7 | Branch if carry clear
    TXS                  ; 9A | Transfer X register to stack pointer
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    SBC ($C4),Y          ; F1 C4 | Subtract with carry ((zero page),Y)
    BCS $37              ; B0 37 | Branch if carry set
    CPY #$19             ; C0 19 | Compare Y register (immediate)
    CPY #$4F             ; C0 4F | Compare Y register (immediate)
    LDX #$B3             ; A2 B3 | Load immediate value into X register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    INC $07              ; E6 07 | Increment (zero page)
    EOR #$31             ; 49 31 | Exclusive OR with accumulator (immediate)
    BEQ $2E              ; F0 2E | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    BNE $03              ; D0 03 | Branch if not equal
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_085
; Address: $E6A1DF
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_085:
    SEI                  ; 78 | Set interrupt disable flag
    ORA $9964,Y          ; 19 64 99 | Logical OR with accumulator (absolute,Y)
    STZ $A4              ; 64 A4 | Store zero to zero page
    ORA $9064,Y          ; 19 64 90 | Logical OR with accumulator (absolute,Y)
    STZ $99              ; 64 99 | Store zero to zero page
    STZ $99              ; 64 99 | Store zero to zero page
    STZ $98              ; 64 98 | Store zero to zero page
    ADC $FD              ; 65 FD | Add with carry (zero page)
    SBC $FB00,X          ; FD 00 FB | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $0800,X          ; FD 00 08 | Subtract with carry (absolute,X)
    WDM #$08             ; 42 08 | Reserved instruction
    WDM #$D7             ; 42 D7 | Reserved instruction
    STY $8842            ; 8C 42 88 | Store Y register to absolute address
    WDM #$08             ; 42 08 | Reserved instruction
    WDM #$8C             ; 42 8C | Reserved instruction
    WDM #$84             ; 42 84 | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC $CE00            ; CE 00 CE | Decrement (absolute)
    PLP                  ; 28 | Pull processor status from stack
    DEC $CE00            ; CE 00 CE | Decrement (absolute)
    DEC $CE00            ; CE 00 CE | Decrement (absolute)
    DEC $8F00            ; CE 00 8F | Decrement (absolute)
    STA $191B,X          ; 9D 1B 19 | Update graphics data
    LDY $A7              ; A4 A7 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_086
; Address: $E6A228
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_086:
    JSL $8B0321          ; 22 21 03 8B | Jump to subroutine long
    STA $86              ; 85 86 | Update graphics data
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    ADC $F99A,X          ; 7D 9A F9 | Add with carry (absolute,X)
    LDA $EAD8,X          ; BD D8 EA | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $0590            ; 2D 90 05 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_087
; Address: $E6A283
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_087:
    CLV                  ; B8 | Clear overflow flag
    CMP $EA45,Y          ; D9 45 EA | Compare accumulator (absolute,Y)
    BIT $A0              ; 24 A0 | Test bits in accumulator (zero page)
    ORA $9A46,Y          ; 19 46 9A | Logical OR with accumulator (absolute,Y)
    JMP ($0083)          ; 6C 83 00 | Jump to address (absolute indirect)
    BNE $10              ; D0 10 | Branch if not equal
    SBC $6B00,Y          ; F9 00 6B | Subtract with carry (absolute,Y)
    BRA $EC              ; 80 EC | Branch always
    INY                  ; C8 | Increment Y register
    ASL $14E1            ; 0E E1 14 | Arithmetic shift left (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_088
; Address: $E6A2AE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_088:
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    STA                  ; 9F FF 7B BF | Update graphics data
    STA $AAFF,X          ; 9D FF AA | Update graphics data
    SBC $CFFB,X          ; FD FB CF | Subtract with carry (absolute,X)
    STA                  ; 9F FF 7B BF | Update graphics data
    CMP $ABFF,X          ; DD FF AB | Compare accumulator (absolute,X)
    EOR $CD76,X          ; 5D 76 CD | Exclusive OR with accumulator (absolute,X)
    CMP $F744,X          ; DD 44 F7 | Compare accumulator (absolute,X)
    INC $F74D            ; EE 4D F7 | Increment (absolute)
    ORA ($3C),Y          ; 11 3C | Logical OR with accumulator ((zero page),Y)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    PLP                  ; 28 | Pull processor status from stack
    STY $FF              ; 84 FF | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_089
; Address: $E6A322
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_089:
    SBC ($57),Y          ; F1 57 | Subtract with carry ((zero page),Y)
    DEC $9745,X          ; DE 45 97 | Decrement (absolute,X)
    DEC $FFA5            ; CE A5 FF | Decrement (absolute)
    ORA $B3F6,X          ; 1D F6 B3 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_08B
; Address: $E6A336
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_08B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    STA $9B8B,X          ; 9D 8B 9B | Update graphics data
    EOR ($4C),Y          ; 51 4C | Exclusive OR with accumulator ((zero page),Y)
    STX $038D            ; 8E 8D 03 | Store X register to absolute address
    INC                  ; 1A | Increment accumulator
    EOR $FD76,Y          ; 59 76 FD | Exclusive OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_08C
; Address: $E6A352
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_08C:
    STZ $00              ; 64 00 | Store zero to zero page
    LDY $3000            ; AC 00 30 | Load from absolute address into Y register
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    LDY $00              ; A4 00 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_08D
; Address: $E6A35F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_08D:
    JSR $11B7            ; 20 B7 11 | Jump to subroutine
    ROR $B432            ; 6E 32 B4 | Rotate right (absolute)
    PLX                  ; FA | Pull X register from stack
    CMP ($92),Y          ; D1 92 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_08E
; Address: $E6A36A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_08E:
    TAX                  ; AA | Transfer accumulator to X register
    CLV                  ; B8 | Clear overflow flag
    BNE $88              ; D0 88 | Branch if not equal
    BCC $48              ; 90 48 | Branch if carry clear
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_08F
; Address: $E6A374
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_08F:
    JSR $41DF            ; 20 DF 41 | Jump to subroutine
    LDX $FF00,Y          ; BE 00 FF | Load from absolute,Y into X register
    CLC                  ; 18 | Clear carry flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BVC $80              ; 50 80 | Branch if overflow clear
    LDA ($41,X)          ; A1 41 | Read graphics status
    STX $06              ; 86 06 | Store X register to zero page
    ORA $1A1A            ; 0D 1A 1A | Logical OR with accumulator (absolute)
    JMP ($236C)          ; 6C 6C 23 | Jump to address (absolute indirect)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC $FD19,X          ; FE 19 FD | Increment (absolute,X)
    AND ($FA),Y          ; 31 FA | Logical AND with accumulator ((zero page),Y)
    ROR $F4              ; 66 F4 | Rotate right (zero page)
    CPY $98E8            ; CC E8 98 | Compare Y register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA #$70             ; 09 70 | Logical OR with accumulator (immediate)
    ORA $39              ; 05 39 | Logical OR with accumulator (zero page)
    ORA $0403,Y          ; 19 03 04 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BMI $21              ; 30 21 | PPU graphics register access
    PLA                  ; 68 | Pull accumulator from stack
    BCS $5C              ; B0 5C | Branch if carry set
    BMI $01              ; 30 01 | Branch if negative
    ASL $FF00            ; 0E 00 FF | Arithmetic shift left (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    STA $B3FF,X          ; 9D FF B3 | Update graphics data
    PLB                  ; AB | Pull data bank register from stack
    STA $FAFF,Y          ; 99 FF FA | Update graphics data
    LDA                  ; BF DD FF B9 | Read graphics status
    SBC $7F80,X          ; FD 80 7F | Subtract with carry (absolute,X)
    STA $BFFF,X          ; 9D FF BF | Update graphics data
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_090
; Address: $E6A448
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_090:
    STA $FAFF,Y          ; 99 FF FA | Update graphics data
    LDA                  ; BF DD FF B9 | Read graphics status
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    STA $6DBD,Y          ; 99 BD 6D | Update graphics data
    DEC $45C4,X          ; DE C4 45 | Decrement (absolute,X)
    INC $57AA            ; EE AA 57 | Increment (absolute)
    STZ $31              ; 64 31 | Store zero to zero page
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    STA ($7F,X)          ; 81 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_091
; Address: $E6A47A
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_091:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 58 FF 97 | Read graphics status
    EOR $A4              ; 45 A4 | Exclusive OR with accumulator (zero page)
    ROR $3F55            ; 6E 55 3F | Rotate right (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($F9),Y          ; 11 F9 | Logical OR with accumulator ((zero page),Y)
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    BPL $FF              ; 10 FF | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    CMP #$93             ; C9 93 | Compare accumulator (immediate)
    EOR ($1D),Y          ; 51 1D | Exclusive OR with accumulator ((zero page),Y)
    BCC $0A              ; 90 0A | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$A8             ; C0 A8 | Compare Y register (immediate)
    BRA $04              ; 80 04 | Branch always
    SBC $FB14,X          ; FD 14 FB | Subtract with carry (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    EOR ($EF),Y          ; 51 EF | Exclusive OR with accumulator ((zero page),Y)
    BVC $C0              ; 50 C0 | Branch if overflow clear
    LDA ($81,X)          ; A1 81 | Read graphics status
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA $1A1E            ; 0D 1E 1A | Logical OR with accumulator (absolute)
    JMP ($636C)          ; 6C 6C 63 | Jump to address (absolute indirect)
    STA                  ; 9F C6 3F 8C | Update graphics data
    ROR $FD18,X          ; 7E 18 FD | Rotate right (absolute,X)
    AND ($FA),Y          ; 31 FA | Logical AND with accumulator ((zero page),Y)
    PEA #$E8C4           ; F4 C4 E8 | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ADC $F99B,X          ; 7D 9B F9 | Add with carry (absolute,X)
    LDA $EED9,X          ; BD D9 EE | Read graphics status
    CMP $BBFE            ; CD FE BB | Compare accumulator (absolute)
    CMP $FF04,X          ; DD 04 FF | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_092
; Address: $E6A526
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_092:
    CLV                  ; B8 | Clear overflow flag
    SBC $ABBB,X          ; FD BB AB | Subtract with carry (absolute,X)
    LDA                  ; BF DD FF B9 | Read graphics status
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_095
; Address: $E6A543
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_095:
    ADC ($A9),Y          ; 71 A9 | Add with carry ((zero page),Y)
    CMP $BFDB,Y          ; D9 DB BF | Compare accumulator (absolute,Y)
    BEQ $73              ; F0 73 | Branch if equal
    SBC ($D6),Y          ; F1 D6 | Subtract with carry ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ORA #$10             ; 09 10 | Logical OR with accumulator (immediate)
    ASL $0674            ; 0E 74 06 | Arithmetic shift left (absolute)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$F009           ; F4 09 F0 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    STZ $7DFC            ; 9C FC 7D | Store zero to absolute
    LDA                  ; BF FA 7E E5 | Read graphics status
    PEA #$F9D9           ; F4 D9 F9 | Push effective address to stack
    LDY $FCFC            ; AC FC FC | Load from absolute address into Y register
    SBC $FFED,X          ; FD ED FF | Subtract with carry (absolute,X)
    SBC $FC00,X          ; FD 00 FC | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    PHB                  ; 8B | Push data bank register to stack
    STY $0304            ; 8C 04 03 | Store Y register to absolute address
    JMP $4AD9C4          ; 5C C4 D9 4A | Jump to address long
    JMP $99D4            ; 4C D4 99 | Jump to address
    TSX                  ; BA | Transfer stack pointer to X register
    AND $6E              ; 25 6E | Logical AND with accumulator (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    LDY #$01             ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_096
; Address: $E6A596
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_096:
    JSR $A002            ; 20 02 A0 | Jump to subroutine
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    BVC $40              ; 50 40 | Branch if overflow clear
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA $5656            ; 0D 56 56 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_098
; Address: $E6A5B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_098:
    LSR $3F              ; 46 3F | Logical shift right (zero page)
    STY $987E            ; 8C 7E 98 | Store Y register to absolute address
    ADC $7AB3,X          ; 7D B3 7A | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_09A
; Address: $E6A5BD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_09A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BNE $D0              ; D0 D0 | Branch if not equal
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $A0              ; 10 A0 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_09B
; Address: $E6A5D2
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_09B:
    JSR $4040            ; 20 40 40 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $3B13,X          ; 1D 13 3B | Logical OR with accumulator (absolute,X)
    STA $BD9FAF          ; 8F AF 9F BD | Update graphics data
    TAX                  ; AA | Transfer accumulator to X register
    ADC $CFFB,X          ; 7D FB CF | Add with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    SBC $FDDF,X          ; FD DF FD | Subtract with carry (absolute,X)
    INC $DCBB            ; EE BB DC | Increment (absolute)
    PLB                  ; AB | Pull data bank register from stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_09C
; Address: $E6A636
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_09C:
    JSR $44DF            ; 20 DF 44 | Jump to subroutine
    SBC $BF77,X          ; FD 77 BF | Subtract with carry (absolute,X)
    CMP $9B77,X          ; DD 77 9B | Compare accumulator (absolute,X)
    LDA                  ; BF EE BB CC | Read graphics status
    CMP $FB04,X          ; DD 04 FB | Compare accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    STZ $B4F8,X          ; 9E F8 B4 | Store zero to absolute,X
    ADC ($51),Y          ; 71 51 | Add with carry ((zero page),Y)
    PLB                  ; AB | Pull data bank register from stack
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PEA #$F00C           ; F4 0C F0 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $09              ; F0 09 | Branch if equal
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    REP #$CB             ; C2 CB | Reset processor status bits
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_09D
; Address: $E6A683
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_09D:
    TXS                  ; 9A | Transfer X register to stack pointer
    BPL $67              ; 10 67 | Branch if positive
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F 01 1B 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $BF9FAB          ; 8F AB 9F BF | Update graphics data
    LDX $4C7B            ; AE 7B 4C | Load from absolute address into X register
    CMP $1F00,X          ; DD 00 1F | Compare accumulator (absolute,X)
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    CMP #$93             ; C9 93 | Compare accumulator (immediate)
    ROR $9559            ; 6E 59 95 | Rotate right (absolute)
    STA $AB8B,Y          ; 99 8B AB | Update graphics data
    DEC $9DAE            ; CE AE 9D | Decrement (absolute)
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_09E
; Address: $E6A6DC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_09E:
    JSL $FB44FD          ; 22 FD 44 FB | Jump to subroutine long
    INC $CCB3,X          ; FE B3 CC | Increment (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    STA                  ; 9F DF 9D AE | Update graphics data
    ORA $CF              ; 05 CF | Logical OR with accumulator (zero page)
    PLB                  ; AB | Pull data bank register from stack
    STA $BF40,Y          ; 99 40 BF | Update graphics data
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_09F
; Address: $E6A6F4
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_09F:
    JSR $02FF            ; 20 FF 02 | Jump to subroutine
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STA $99AB            ; 8D AB 99 | Update graphics data
    LDA $AE79,X          ; BD 79 AE | Read graphics status
    EOR $BBFE            ; 4D FE BB | Exclusive OR with accumulator (absolute)
    CMP $1F00,X          ; DD 00 1F | Compare accumulator (absolute,X)
    EOR ($5B),Y          ; 51 5B | Exclusive OR with accumulator ((zero page),Y)
    STZ $77              ; 64 77 | Store zero to zero page
    PHX                  ; DA | Push X register to stack
    STA $9DB7,X          ; 9D B7 9D | Update graphics data
    PHX                  ; DA | Push X register to stack
    DEC $4B7E            ; CE 7E 4B | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A1
; Address: $E6A754
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A1:
    JSR $105F            ; 20 5F 10 | Jump to subroutine
    BPL $EF              ; 10 EF | Branch if positive
    ADC $11B7,X          ; 7D B7 11 | Add with carry (absolute,X)
    CPY $99D5            ; CC D5 99 | Compare Y register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    TXS                  ; 9A | Transfer X register to stack pointer
    PHA                  ; 48 | Push accumulator to stack
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A2
; Address: $E6A774
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A2:
    JSR $40DF            ; 20 DF 40 | Jump to subroutine
    LDA                  ; BF 00 FF 00 | Read graphics status
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A3
; Address: $E6A788
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A3:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F02            ; 0E 02 0F | Arithmetic shift left (absolute)
    BPL $1B              ; 10 1B | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    STX $95              ; 86 95 | Store X register to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    CPX $7400            ; EC 00 74 | Compare X register (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    EOR $88              ; 45 88 | Exclusive OR with accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    ADC #$42             ; 69 42 | Hardware register operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A4
; Address: $E6A7CB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A4:
    WDM #$64             ; 42 64 | Reserved instruction
    EOR $005A            ; 4D 5A 00 | Exclusive OR with accumulator (absolute)
    BCC $48              ; 90 48 | Branch if carry clear
    BIT $DC              ; 24 DC | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $30              ; 90 30 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A6
; Address: $E6A7EE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A6:
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $50              ; F0 50 | Branch if equal
    BEQ $C4              ; F0 C4 | Branch if equal
    BNE $F4              ; D0 F4 | Branch if not equal
    BEQ $72              ; F0 72 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BVS $B0              ; 70 B0 | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    ORA $0BF6            ; 0D F6 0B | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A7
; Address: $E6A826
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A7:
    ROR $4B11            ; 6E 11 4B | Rotate right (absolute)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    EOR ($0F),Y          ; 51 0F | Exclusive OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR $1B82,Y          ; 59 82 1B | Exclusive OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ADC ($31),Y          ; 71 31 | Add with carry ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A8
; Address: $E6A84C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A8:
    JSR $E720            ; 20 20 E7 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0A9
; Address: $E6A85C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0A9:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    LDX #$20             ; A2 20 | Load immediate value into X register
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDY $6B40,X          ; BC 40 6B | Load from absolute,X into Y register
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0AC
; Address: $E6A87C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0AC:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    ADC ($4D,X)          ; 61 4D | Add with carry ((zero page,X))
    EOR ($5F,X)          ; 41 5F | Exclusive OR with accumulator ((zero page,X))
    ROR $56              ; 66 56 | Rotate right (zero page)
    JMP ($785C)          ; 6C 5C 78 | Jump to address (absolute indirect)
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $30              ; 30 30 | Branch if negative
    ROR $7C00,X          ; 7E 00 7C | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $80              ; 30 80 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PEA #$D0F0           ; F4 F0 D0 | Push effective address to stack
    BEQ $50              ; F0 50 | Branch if equal
    BNE $F2              ; D0 F2 | Branch if not equal
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $50              ; F0 50 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $F4              ; F0 F4 | Branch if equal
    BCS $0B              ; B0 0B | Branch if carry set
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0AD
; Address: $E6A8FA
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0AD:
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    STY $EC10            ; 8C 10 EC | Store Y register to absolute address
    BPL $3F              ; 10 3F | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    STX $00              ; 86 00 | Store X register to zero page
    STX $00              ; 86 00 | Store X register to zero page
    LDA $1E06,Y          ; B9 06 1E | Read graphics status
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0705            ; 0E 05 07 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    BPL $0E              ; 10 0E | Branch if positive
    ASL $770E            ; 0E 0E 77 | Arithmetic shift left (absolute)
    BVS $A0              ; 70 A0 | Branch if overflow set
    STA                  ; 9F 9F 60 F0 | Update graphics data
    STY $03              ; 84 03 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0AE
; Address: $E6A96E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0AE:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    ASL $70E1            ; 0E E1 70 | Arithmetic shift left (absolute)
    BRA $7F              ; 80 7F | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    STA $FB3F00          ; 8F 00 3F FB | Update graphics data
    PEA #$A730           ; F4 30 A7 | Push effective address to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0AF
; Address: $E6A986
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0AF:
    CPY $FEFE            ; CC FE FE | Compare Y register (absolute)
    AND $CB4B,X          ; 3D 4B CB | Logical AND with accumulator (absolute,X)
    LDA ($21,X)          ; A1 21 | PPU graphics register access
    JMP ($BC60)          ; 6C 60 BC | Jump to address (absolute indirect)
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $9F00,X          ; DE 00 9F | Decrement (absolute,X)
    ASL $1D33,X          ; 1E 33 1D | Arithmetic shift left (absolute,X)
    ORA $0404,X          ; 1D 04 04 | Logical OR with accumulator (absolute,X)
    ORA $000D            ; 0D 0D 00 | Logical OR with accumulator (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    REP #$48             ; C2 48 | Reset processor status bits
    BNE $41              ; D0 41 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    ORA $B9              ; 05 B9 | Logical OR with accumulator (zero page)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    INC $09              ; E6 09 | Increment (zero page)
    EOR ($A2),Y          ; 51 A2 | Exclusive OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B0
; Address: $E6A9D4
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B0:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $7B00,Y          ; F9 00 7B | Subtract with carry (absolute,Y)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    ASL $9DF1            ; 0E F1 9D | Arithmetic shift left (absolute)
    STY $E916            ; 8C 16 E9 | Store Y register to absolute address
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    PEA #$FF00           ; F4 00 FF | Push effective address to stack
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BNE $62              ; D0 62 | Branch if not equal
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    BEQ $12              ; F0 12 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    BVS $F2              ; 70 F2 | Branch if overflow set
    BCS $0B              ; B0 0B | Branch if carry set
    ORA $2BF6,Y          ; 19 F6 2B | Logical OR with accumulator (absolute,Y)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B1
; Address: $E6AA28
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B1:
    ORA $7499,Y          ; 19 99 74 | Logical OR with accumulator (absolute,Y)
    BCC $4B              ; 90 4B | Branch if carry clear
    STA $9555,Y          ; 99 55 95 | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B2
; Address: $E6AA35
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B2:
    JSR $740B            ; 20 0B 74 | Jump to subroutine
    ORA $10E6,Y          ; 19 E6 10 | Logical OR with accumulator (absolute,Y)
    ORA $15E6,Y          ; 19 E6 15 | Logical OR with accumulator (absolute,Y)
    NOP                  ; EA | No operation
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    AND ($E5,X)          ; 21 E5 | Logical AND with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    AND ($7F,X)          ; 21 7F | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B3
; Address: $E6AA61
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B3:
    JSR $2039            ; 20 39 20 | Jump to subroutine
    EOR ($25,X)          ; 41 25 | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B4
; Address: $E6AA6A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B4:
    DEX                  ; CA | Decrement X register
    STY $54              ; 84 54 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B5
; Address: $E6AA70
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B5:
    JSR $201C            ; 20 1C 20 | Jump to subroutine
    ORA $3340,Y          ; 19 40 33 | Logical OR with accumulator (absolute,Y)
    BRA $4F              ; 80 4F | Branch always
    DEC $DF00,X          ; DE 00 DF | Decrement (absolute,X)
    STA $C13970          ; 8F 70 39 C1 | Update graphics data
    SBC $07              ; E5 07 | Subtract with carry (zero page)
    AND $103B,Y          ; 39 3B 10 | Logical AND with accumulator (absolute,Y)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    LDA $0040            ; AD 40 00 | Read graphics status
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B6
; Address: $E6AA96
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B6:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    LDA                  ; BF 00 7F 00 | Read graphics status
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $0D1E            ; 0E 1E 0D | Arithmetic shift left (absolute)
    ROL $1E60            ; 2E 60 1E | Rotate left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $0311            ; 0E 11 03 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B7
; Address: $E6AADC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B7:
    JSR $185F            ; 20 5F 18 | Jump to subroutine
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    JMP $6F47            ; 4C 47 6F | Jump to address
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    PEA #$9B1B           ; F4 1B 9B | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B8
; Address: $E6AAF6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B8:
    JSR $C0DF            ; 20 DF C0 | Jump to subroutine
    ROL $0B40,X          ; 3E 40 0B | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA $0605,Y          ; 19 05 06 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $E86880          ; 8F 80 68 E8 | Update graphics data
    JMP ($6C93)          ; 6C 93 6C | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    BRA $7F              ; 80 7F | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    BNE $F0              ; D0 F0 | Branch if not equal
    BNE $F0              ; D0 F0 | Branch if not equal
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $50              ; F0 50 | Branch if equal
    BEQ $12              ; F0 12 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $B0              ; F0 B0 | Branch if equal

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0B9
; Address: $E6AB56
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0B9:
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA $4C95,X          ; 9D 95 4C | Update graphics data
    CMP $BD              ; C5 BD | Compare accumulator (zero page)
    AND $D8              ; 25 D8 | Logical AND with accumulator (zero page)
    LDA ($19,X)          ; A1 19 | Read graphics status
    PHB                  ; 8B | Push data bank register to stack
    INC $BEC5            ; EE C5 BE | Increment (absolute)
    AND $DE              ; 25 DE | Logical AND with accumulator (zero page)
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    CMP $D1E5,X          ; DD E5 D1 | Compare accumulator (absolute,X)
    SBC ($52,X)          ; E1 52 | Subtract with carry ((zero page,X))
    LSR $63              ; 46 63 | Logical shift right (zero page)
    WDM #$5C             ; 42 5C | Reserved instruction
    ORA $23A2,X          ; 1D A2 23 | Logical OR with accumulator (absolute,X)
    REP #$C5             ; C2 C5 | Reset processor status bits
    DEC                  ; 3A | Decrement accumulator
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    WDM #$BD             ; 42 BD | Reserved instruction
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    WDM #$BD             ; 42 BD | Reserved instruction

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0BA
; Address: $E6ABBC
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0BA:
    JSL $3DC2DD          ; 22 DD C2 3D | Jump to subroutine long
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    LSR $67DB,X          ; 5E DB 67 | Logical shift right (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ADC $4582,X          ; 7D 82 45 | Add with carry (absolute,X)
    BIT $E6              ; 24 E6 | Test bits in accumulator (zero page)
    STA                  ; 9F 04 FB 58 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $E01F            ; CD 1F E0 | Game work RAM access
    LDY $E3              ; A4 E3 | Load from zero page into Y register
    LDA ($10),Y          ; B1 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0BC
; Address: $E6AC0E
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0BC:
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SBC $EF10,X          ; FD 10 EF | Subtract with carry (absolute,X)
    SBC $D52A,X          ; FD 2A D5 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ROR                  ; 6A | Rotate right (accumulator)
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $48              ; D0 48 | Branch if not equal
    BCC $C0              ; 90 C0 | Branch if carry clear
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $18              ; F0 18 | Branch if equal
    BCS $21              ; B0 21 | PPU graphics register access
    DEC $EE11,X          ; DE 11 EE | Decrement (absolute,X)
    INC $F62B,X          ; FE 2B F6 | Increment (absolute,X)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    INC $F609,X          ; FE 09 F6 | Increment (absolute,X)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $1C0A,Y          ; 19 0A 1C | Logical OR with accumulator (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $6B              ; 26 6B | Rotate left (zero page)
    EOR $0F04,X          ; 5D 04 0F | Exclusive OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($6F),Y          ; 11 6F | Logical OR with accumulator ((zero page),Y)
    AND $D9              ; 25 D9 | Logical AND with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ORA $B5              ; 05 B5 | Logical OR with accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    BCC $05              ; 90 05 | Branch if carry clear
    PLX                  ; FA | Pull X register from stack
    BVS $0B              ; 70 0B | Branch if overflow set
    BCS $AC              ; B0 AC | Branch if carry set
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    LDA $B946,Y          ; B9 46 B9 | Read graphics status
    PEA #$FA09           ; F4 09 FA | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    SBC #$BC             ; E9 BC | Subtract with carry (immediate)
    LDA $C936,Y          ; B9 36 C9 | Read graphics status
    STX $8457            ; 8E 57 84 | Store X register to absolute address
    BIT #$34             ; 89 34 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0BD
; Address: $E6ACA7
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0BD:
    DEX                  ; CA | Decrement X register
    DEC $A212            ; CE 12 A2 | Decrement (absolute)
    LDX #$7A             ; A2 7A | Load immediate value into X register
    LDA ($0E),Y          ; B1 0E | Read graphics status
    SBC ($04),Y          ; F1 04 | Subtract with carry ((zero page),Y)
    BRA $FC              ; 80 FC | Branch always
    CMP $1FCE            ; CD CE 1F | Compare accumulator (absolute)
    ROR $1D02,X          ; 7E 02 1D | Rotate right (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    BVS $8F              ; 70 8F | Branch if overflow set
    DEC $7E31            ; CE 31 7E | Decrement (absolute)
    STA ($1C,X)          ; 81 1C | Update graphics data
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BCC $50              ; 90 50 | Branch if carry clear
    BVC $40              ; 50 40 | Branch if overflow clear
    LDY #$60             ; A0 60 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0BE
; Address: $E6ACEA
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0BE:
    JSR $B018            ; 20 18 B0 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BEQ $B0              ; F0 B0 | Branch if equal
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    STA ($FE,X)          ; 81 FE | Update graphics data
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ORA $8A              ; 05 8A | Logical OR with accumulator (zero page)
    EOR $CB              ; 45 CB | Exclusive OR with accumulator (zero page)
    ADC $EB              ; 65 EB | Add with carry (zero page)
    ADC $479B            ; 6D 9B 47 | Add with carry (absolute)
    LDA $E23B,X          ; BD 3B E2 | Read graphics status
    LDA $4EB1,X          ; BD B1 4E | Read graphics status
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9F 08 | Read graphics status
    SBC $CE31,X          ; FD 31 CE | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    BCC $8F              ; 90 8F | Branch if carry clear
    LDA $EFBFDF          ; AF DF BF EF | Read graphics status
    STZ $DA4F            ; 9C 4F DA | Store zero to absolute
    STA $FFC0            ; 8D C0 FF | Update graphics data
    EOR $00FF,Y          ; 59 FF 00 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0BF
; Address: $E6AD3A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0BF:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BRA $7F              ; 80 7F | Branch always
    LDA #$BA             ; A9 BA | Read graphics status
    ORA ($42,X)          ; 01 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C0
; Address: $E6AD45
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C0:
    EOR ($35,X)          ; 41 35 | Exclusive OR with accumulator ((zero page,X))
    ROL $19              ; 26 19 | Rotate left (zero page)
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 3C C3 24 | Read graphics status
    LDA $B057,Y          ; B9 57 B0 | Read graphics status
    DEX                  ; CA | Decrement X register
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP ($36,X)          ; C1 36 | Compare accumulator ((zero page,X))
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA $6F61,X          ; 9D 61 6F | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C1
; Address: $E6AD84
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C1:
    INC $C7              ; E6 C7 | Increment (zero page)
    ASL $50EF            ; 0E EF 50 | Arithmetic shift left (absolute)
    LDA $16              ; A5 16 | Read graphics status
    LDA $16              ; A5 16 | Read graphics status
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C2
; Address: $E6AD93
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C2:
    STA                  ; 9F 07 F8 1C | Update graphics data
    INC                  ; 1A | Increment accumulator
    ORA $23AD,X          ; 1D AD 23 | Logical OR with accumulator (absolute,X)
    CPX $CDDF            ; EC DF CD | Compare X register (absolute)
    LDA $48FF7A          ; AF 7A FF 48 | Read graphics status
    AND $F200,X          ; 3D 00 F2 | Logical AND with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C4
; Address: $E6ADC5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C4:
    JSR $0E3F            ; 20 3F 0E | Jump to subroutine
    STA ($70),Y          ; 91 70 | Update graphics data
    SBC #$C9             ; E9 C9 | Subtract with carry (immediate)
    ROL $7A              ; 26 7A | Rotate left (zero page)
    ADC ($E2),Y          ; 71 E2 | Add with carry ((zero page),Y)
    AND $DE00,Y          ; 39 00 DE | Logical AND with accumulator (absolute,Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CMP $8F00,Y          ; D9 00 8F | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C5
; Address: $E6ADE0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C5:
    JSL $40D920          ; 22 20 D9 40 | Jump to subroutine long
    REP #$40             ; C2 40 | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($61),Y          ; F1 61 | Subtract with carry ((zero page),Y)
    NOP                  ; EA | No operation
    PEA #$DF9F           ; F4 9F DF | Push effective address to stack
    LDA                  ; BF 00 BF 00 | Read graphics status
    BEQ $00              ; F0 00 | Branch if equal
    ROR $3F00,X          ; 7E 00 3F | Rotate right (absolute,X)
    STA                  ; 9F 00 6D 49 | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C6
; Address: $E6AE04
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C6:
    LDY $678B,X          ; BC 8B 67 | Load from absolute,X into Y register
    EOR $DD05,X          ; 5D 05 DD | Exclusive OR with accumulator (absolute,X)
    ORA $D2              ; 05 D2 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C7
; Address: $E6AE0F
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C7:
    JSR $00B6            ; 20 B6 00 | Jump to subroutine
    LDY $7400            ; AC 00 74 | Load from absolute address into Y register
    SBC $FA00,X          ; FD 00 FA | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    DEC $CD02            ; CE 02 CD | Decrement (absolute)
    PHA                  ; 48 | Push accumulator to stack
    TSX                  ; BA | Transfer stack pointer to X register
    DEY                  ; 88 | Decrement Y register
    ADC $01              ; 65 01 | Add with carry (zero page)
    JMP $05DC04          ; 5C 04 DC 05 | Jump to address long
    CLD                  ; D8 | Clear decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    SBC $B700,X          ; FD 00 B7 | Subtract with carry (absolute,X)
    INC $FB00,X          ; FE 00 FB | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $AD00            ; ED 00 AD | Subtract with carry (absolute)
    LDY $9C6E,X          ; BC 6E 9C | Load from absolute,X into Y register
    BRA $0D              ; 80 0D | Branch always
    STA                  ; 9F 1F 9F 18 | Update graphics data
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 3D 80 1C | Update graphics data
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    INC $BBFF,X          ; FE FF BB | Increment (absolute,X)
    INC $FFFD,X          ; FE FD FF | Increment (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C8
; Address: $E6AE7E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C8:
    JSR $FFDF            ; 20 DF FF | Jump to subroutine
    LDA $FF77FF          ; AF FF 77 FF | Read graphics status
    SBC $ABFF,X          ; FD FF AB | Subtract with carry (absolute,X)
    STA                  ; 9F FF FF FF | Update graphics data
    ROR                  ; 6A | Rotate right (accumulator)
    INC $9AFF            ; EE FF 9A | Increment (absolute)
    STA $BFAF,Y          ; 99 AF BF | Update graphics data
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    LDA                  ; BF 80 7F 00 | Read graphics status
    SBC $BFFF,X          ; FD FF BF | Subtract with carry (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0C9
; Address: $E6AEC8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0C9:
    STA $FAFF,Y          ; 99 FF FA | Update graphics data
    LDA                  ; BF DD FF B9 | Read graphics status
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    LDA $FF              ; A5 FF | Read graphics status
    SBC $BEF9,X          ; FD F9 BE | Subtract with carry (absolute,X)
    STA $FBFE,X          ; 9D FE FB | Update graphics data
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0CA
; Address: $E6AEF4
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0CA:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $EF              ; 10 EF | Branch if positive
    XBA                  ; EB | Exchange accumulator bytes
    SBC $FDDF,X          ; FD DF FD | Subtract with carry (absolute,X)
    INC $DCBB            ; EE BB DC | Increment (absolute)
    PLB                  ; AB | Pull data bank register from stack
    PHP                  ; 08 | Push processor status to stack
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    SBC $0F0F,X          ; FD 0F 0F | Subtract with carry (absolute,X)
    ADC $A042,X          ; 7D 42 A0 | Add with carry (absolute,X)
    BCS $F0              ; B0 F0 | Branch if carry set
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    LSR $F06F            ; 4E 6F F0 | Logical shift right (absolute)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    INC                  ; 1A | Increment accumulator
    BCC $9F              ; 90 9F | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    DEC $FE18,X          ; DE 18 FE | Decrement (absolute,X)
    ASL $B2              ; 06 B2 | Arithmetic shift left (zero page)
    LSR $07FE            ; 4E FE 07 | Logical shift right (absolute)
    SBC $F907,Y          ; F9 07 F9 | Subtract with carry (absolute,Y)
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    SBC $49F9,Y          ; F9 F9 49 | Subtract with carry (absolute,Y)
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator
    STA                  ; 9F CA 2F 1D | Update graphics data
    LDX $2CE8,Y          ; BE E8 2C | Load from absolute,Y into X register
    INC                  ; 1A | Increment accumulator
    LDA $168505          ; AF 05 85 16 | Read graphics status
    ADC #$60             ; 69 60 | Add with carry (immediate)
    BNE $0C              ; D0 0C | Branch if not equal
    EOR ($0C,X)          ; 41 0C | Exclusive OR with accumulator ((zero page,X))
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BNE $1F              ; D0 1F | Branch if not equal
    PLX                  ; FA | Pull X register from stack
    BRA $FF              ; 80 FF | Branch always
    JMP $3AFC            ; 4C FC 3A | Jump to address
    PLY                  ; 7A | Pull Y register from stack
    JMP $B8A8BC          ; 5C BC A8 B8 | Jump to address long
    CPY $78FC            ; CC FC 78 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0CB
; Address: $E6AF8D
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0CB:
    BCS $B2              ; B0 B2 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    SBC $1985,Y          ; F9 85 19 | Subtract with carry (absolute,Y)
    ORA $7947,Y          ; 19 47 79 | Logical OR with accumulator (absolute,Y)
    SBC $F907,Y          ; F9 07 F9 | Subtract with carry (absolute,Y)
    SBC $F907,Y          ; F9 07 F9 | Subtract with carry (absolute,Y)
    STZ $E4              ; 64 E4 | Store zero to zero page
    BRA $40              ; 80 40 | Branch always
    AND $4D3F            ; 2D 3F 4D | Logical AND with accumulator (absolute)
    SBC $FF80            ; ED 80 FF | Subtract with carry (absolute)
    BRA $ED              ; 80 ED | Branch always
    BRA $7F              ; 80 7F | Branch always
    LDA                  ; BF C0 D2 ED | Read graphics status
    INC $E1E0,X          ; FE E0 E1 | Increment (absolute,X)
    STX $C9C8            ; 8E C8 C9 | Store X register to absolute address
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    BRA $CD              ; 80 CD | Branch always
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    LDY #$71             ; A0 71 | Load immediate value into Y register
    CPX #$37             ; E0 37 | Compare X register (immediate)
    CPX #$FB             ; E0 FB | Compare X register (immediate)
    BEQ $F3              ; F0 F3 | Branch if equal
    BRA $7F              ; 80 7F | Branch always
    LDY #$6D             ; A0 6D | Load immediate value into Y register
    CPY #$9D             ; C0 9D | Compare Y register (immediate)
    STA $0EDC,X          ; 9D DC 0E | Update graphics data
    AND ($23,X)          ; 21 23 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BCS $2E              ; B0 2E | Branch if carry set
    STA                  ; 9F 08 E8 60 | Update graphics data
    ORA $0DDE            ; 0D DE 0D | Logical OR with accumulator (absolute)
    ORA $01DF            ; 0D DF 01 | Logical OR with accumulator (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    STA                  ; 9F 68 AA B3 | Update graphics data
    STX $CD              ; 86 CD | Store X register to zero page
    ROL $69              ; 26 69 | Rotate left (zero page)
    ASL $41              ; 06 41 | Arithmetic shift left (zero page)
    ASL $59              ; 06 59 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC $0104,Y          ; F9 04 01 | Subtract with carry (absolute,Y)
    ASL $59              ; 06 59 | Arithmetic shift left (zero page)
    EOR $73C0            ; 4D C0 73 | Exclusive OR with accumulator (absolute)
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    BCS $FF              ; B0 FF | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    LDY #$07             ; A0 07 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDY #$99             ; A0 99 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0CC
; Address: $E6B024
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0CC:
    BEQ $9F              ; F0 9F | Branch if equal
    EOR $9EB2            ; 4D B2 9E | Exclusive OR with accumulator (absolute)
    SBC ($CD,X)          ; E1 CD | Subtract with carry ((zero page,X))
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDA $6647,Y          ; B9 47 66 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    LDA $BEC3,X          ; BD C3 BE | Read graphics status
    CMP ($94,X)          ; C1 94 | Compare accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0CD
; Address: $E6B048
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0CD:
    LDA ($7F,X)          ; A1 7F | Read graphics status
    ADC $BE83,X          ; 7D 83 BE | Add with carry (absolute,X)
    EOR ($18,X)          ; 41 18 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    LDX $AECB            ; AE CB AE | Load from absolute address into X register
    AND ($E0,X)          ; 21 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0CE
; Address: $E6B066
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0CE:
    JSR $80E1            ; 20 E1 80 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    ASL $1200,X          ; 1E 00 12 | Arithmetic shift left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $D4              ; D0 D4 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CMP $25              ; C5 25 | Compare accumulator (zero page)
    LDY $AC              ; A4 AC | Load from zero page into Y register
    AND $6DCC            ; 2D CC 6D | Logical AND with accumulator (absolute)
    CPY $2BED            ; CC ED 2B | Compare Y register (absolute)
    LDA                  ; BF 00 3F 01 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    PHY                  ; 5A | Push Y register to stack
    STZ $7DFC            ; 9C FC 7D | Store zero to absolute
    LDA                  ; BF FA 7E ED | Read graphics status
    CMP $AEF9,Y          ; D9 F9 AE | Compare accumulator (absolute,Y)
    INC $FDFC,X          ; FE FC FD | Increment (absolute,X)
    SBC $03FF            ; ED FF 03 | Subtract with carry (absolute)
    SBC $FC00,X          ; FD 00 FC | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $F806,Y          ; F9 06 F8 | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STZ $B8FA            ; 9C FA B8 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0CF
; Address: $E6B0C3
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0CF:
    ADC $F959,X          ; 7D 59 F9 | Add with carry (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    INC $BFFA,X          ; FE FA BF | Increment (absolute,X)
    CMP $B9FF,X          ; DD FF B9 | Compare accumulator (absolute,X)
    SBC $F801,X          ; FD 01 F8 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ASL $FA              ; 06 FA | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $B59CAB          ; 8F AB 9C B5 | Update graphics data
    ADC $7BAA,Y          ; 79 AA 7B | Add with carry (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    BPL $EF              ; 10 EF | Branch if positive
    LDY $C1CC            ; AC CC C1 | Load from absolute address into Y register
    LDX $9FE0,Y          ; BE E0 9F | Load from absolute,Y into X register
    LDA ($C0,X)          ; A1 C0 | Read graphics status
    STY $82EC            ; 8C EC 82 | Store Y register to absolute address
    SBC $AEC9            ; ED C9 AE | Subtract with carry (absolute)
    JMP $0CA0            ; 4C A0 0C | Jump to address
    LDA $5F              ; A5 5F | Read graphics status
    ORA $85              ; 05 85 | Logical OR with accumulator (zero page)
    STA ($67),Y          ; 91 67 | Update graphics data
    LDA $3047,X          ; BD 47 30 | Read graphics status
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D0
; Address: $E6B162
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D0:
    JSL $946BDD          ; 22 DD 6B 94 | Jump to subroutine long
    CMP $5500,X          ; DD 00 55 | Compare accumulator (absolute,X)
    BVC $00              ; 50 00 | Branch if overflow clear
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    AND $C286,Y          ; 39 86 C2 | Logical AND with accumulator (absolute,Y)
    BRA $A8              ; 80 A8 | Branch always
    INY                  ; C8 | Increment Y register
    BNE $EF              ; D0 EF | Branch if not equal
    SBC ($EE),Y          ; F1 EE | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    LSR $FD              ; 46 FD | Logical shift right (zero page)
    CMP $3303            ; CD 03 33 | Compare accumulator (absolute)
    BMI $CF              ; 30 CF | Branch if negative
    BMI $7C              ; 30 7C | Branch if negative
    INC $FF38,X          ; FE 38 FF | Increment (absolute,X)
    REP #$FF             ; C2 FF | Reset processor status bits
    BPL $FF              ; 10 FF | Branch if positive
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ROL $FF2A,X          ; 3E 2A FF | Rotate left (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D1
; Address: $E6B1EE
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D1:
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    BVS $FF              ; 70 FF | Branch if overflow set
    INC $7000,X          ; FE 00 70 | Increment (absolute,X)
    INC $7000,X          ; FE 00 70 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    STA ($FF,X)          ; 81 FF | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    LDX $4F00,Y          ; BE 00 4F | Load from absolute,Y into X register
    BRA $0E              ; 80 0E | Branch always
    ROR $3F33            ; 6E 33 3F | Rotate right (absolute)
    ORA $16C0,X          ; 1D C0 16 | Logical OR with accumulator (absolute,X)
    INX                  ; E8 | Increment X register
    ROR $3F91            ; 6E 91 3F | Rotate right (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    EOR $1F0D            ; 4D 0D 1F | Exclusive OR with accumulator (absolute)
    CPX #$98             ; E0 98 | Compare X register (immediate)
    LSR $BC              ; 46 BC | Logical shift right (zero page)
    AND $FE              ; 25 FE | Logical AND with accumulator (zero page)
    INC $FF              ; E6 FF | Increment (zero page)
    ORA $1FF2            ; 0D F2 1F | Logical OR with accumulator (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR $3EEB,X          ; 5D EB 3E | Exclusive OR with accumulator (absolute,X)
    SBC $FF3F,Y          ; F9 3F FF | Subtract with carry (absolute,Y)
    STA ($FF,X)          ; 81 FF | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $20              ; 84 20 | Store Y register to zero page
    LDA                  ; BF 40 5F 50 | Read graphics status
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    AND $3DD7,Y          ; 39 D7 3D | Logical AND with accumulator (absolute,Y)
    AND $FF00,X          ; 3D 00 FF | Logical AND with accumulator (absolute,X)
    BVC $AF              ; 50 AF | Branch if overflow clear
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D2
; Address: $E6B2C6
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D2:
    ASL $037E            ; 0E 7E 03 | Arithmetic shift left (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    BIT #$DA             ; 89 DA | Test bits in accumulator (immediate)
    ORA $005A            ; 0D 5A 00 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0FF1            ; 0E F1 0F | Arithmetic shift left (absolute)
    BEQ $08              ; F0 08 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    ADC #$8F             ; 69 8F | Add with carry (immediate)
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    EOR $429C,X          ; 5D 9C 42 | Hardware register operation
    SEP #$21             ; E2 21 | PPU graphics register access
    DEC $D02F,X          ; DE 2F D0 | Decrement (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ADC $7F00            ; 6D 00 7F | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    SBC $5906,X          ; FD 06 59 | Subtract with carry (absolute,X)
    SBC ($FA),Y          ; F1 FA | Subtract with carry ((zero page),Y)
    BRA $FA              ; 80 FA | Branch always
    DEY                  ; 88 | Decrement Y register
    TXA                  ; 8A | Transfer X register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    TSX                  ; BA | Transfer stack pointer to X register
    AND $4742,Y          ; 39 42 47 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $88              ; 06 88 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 38 FF 01 | Read graphics status
    STA ($FE,X)          ; 81 FE | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    SBC $FB1E,X          ; FD 1E FB | Subtract with carry (absolute,X)
    ORA $E7FE,X          ; 1D FE E7 | Logical OR with accumulator (absolute,X)
    LDY $00FF,X          ; BC FF 00 | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $C324,Y          ; 39 24 C3 | Logical AND with accumulator (absolute,Y)
    EOR $24              ; 45 24 | Exclusive OR with accumulator (zero page)
    AND ($9A,X)          ; 21 9A | Logical AND with accumulator ((zero page,X))
    STA $C936,Y          ; 99 36 C9 | Update graphics data
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D3
; Address: $E6B356
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D3:
    JSR $98DF            ; 20 DF 98 | Jump to subroutine
    ORA ($EC),Y          ; 11 EC | Logical OR with accumulator ((zero page),Y)
    DEX                  ; CA | Decrement X register
    ORA ($34,X)          ; 01 34 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D4
; Address: $E6B366
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D4:
    JSL $DF24DF          ; 22 DF 24 DF | Jump to subroutine long
    STZ $5C7F            ; 9C 7F 5C | Store zero to absolute
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $CF              ; 30 CF | Branch if negative
    BIT $37              ; 24 37 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL $29A6,X          ; 1E A6 29 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    LSR                  ; 4A | Logical shift right (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $2E              ; 30 2E | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 06 F9 00 | Read graphics status
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCS $7F              ; B0 7F | Branch if carry set
    LDA $D03463          ; AF 63 34 D0 | Read graphics status
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    LDY $00              ; A4 00 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D5
; Address: $E6B3D6
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D5:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 20 DF 01 | Read graphics status
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA ($56),Y          ; 11 56 | Logical OR with accumulator ((zero page),Y)
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $2F              ; 10 2F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D6
; Address: $E6B42C
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D6:
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BVC $90              ; 50 90 | Branch if overflow clear
    ROR                  ; 6A | Rotate right (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    PLB                  ; AB | Pull data bank register from stack
    DEY                  ; 88 | Decrement Y register
    STX $6B              ; 86 6B | Store X register to zero page
    STA $4F              ; 85 4F | Update graphics data
    LDA $5E              ; A5 5E | Read graphics status
    LDA ($10,X)          ; A1 10 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $07FF            ; 0E FF 07 | Arithmetic shift left (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0D              ; 10 0D | Branch if positive
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    BMI $CF              ; 30 CF | Branch if negative
    BPL $6F              ; 10 6F | Branch if positive
    TAX                  ; AA | Transfer accumulator to X register
    INY                  ; C8 | Increment Y register
    BMI $F0              ; 30 F0 | Branch if negative
    LDY $A847            ; AC 47 A8 | Load from absolute address into Y register
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 30 CF 12 | Read graphics status
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D7
; Address: $E6B4C5
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D7:
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    CPX $0F37            ; EC 37 0F | Compare X register (absolute)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BCS $08              ; B0 08 | Branch if carry set
    BNE $6E              ; D0 6E | Branch if not equal
    BMI $FF              ; 30 FF | Branch if negative
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    LDA ($00,X)          ; A1 00 | Read graphics status
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($37),Y          ; 11 37 | Logical OR with accumulator ((zero page),Y)
    CPX $F3F0            ; EC F0 F3 | Compare X register (absolute)
    SBC #$F4             ; E9 F4 | Subtract with carry (immediate)
    STA ($BC,X)          ; 81 BC | Update graphics data
    ROR $EA27,X          ; 7E 27 EA | Rotate right (absolute,X)
    CPX $00FF            ; EC FF 00 | Compare X register (absolute)
    BRA $03              ; 80 03 | Branch always
    STA $1900            ; 8D 00 19 | Update graphics data
    AND ($09,X)          ; 21 09 | Logical AND with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    ADC ($33,X)          ; 61 33 | Add with carry ((zero page,X))
    BNE $F5              ; D0 F5 | Branch if not equal
    SBC $BA              ; E5 BA | Subtract with carry (zero page)
    LDA $083E01          ; AF 01 3E 08 | Read graphics status
    ORA $7A              ; 05 7A | Logical OR with accumulator (zero page)
    AND ($5E,X)          ; 21 5E | Logical AND with accumulator ((zero page,X))
    BVC $EF              ; 50 EF | Branch if overflow clear
    AND $FA              ; 25 FA | Logical AND with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    LDA $EA95            ; AD 95 EA | Read graphics status
    STA ($6E),Y          ; 91 6E | Update graphics data
    SEC                  ; 38 | Set carry flag
    LDA $C08F9A          ; AF 9A 8F C0 | Read graphics status
    RTI                  ; 40 | Return from interrupt
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    ORA #$13             ; 09 13 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0D9
; Address: $E6B566
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0D9:
    JSL $122212          ; 22 12 22 12 | Jump to subroutine long
    ROL $261A            ; 2E 1A 26 | Rotate left (absolute)
    LSR $0922            ; 4E 22 09 | Logical shift right (absolute)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0DA
; Address: $E6B57E
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0DA:
    JSL $864A7F          ; 22 7F 4A 86 | Jump to subroutine long
    DEC $B7FE            ; CE FE B7 | Decrement (absolute)
    DEC $B7FE            ; CE FE B7 | Decrement (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BIT #$7F             ; 89 7F | Test bits in accumulator (immediate)
    LDA #$5E             ; A9 5E | Read graphics status
    LDY $F84B,X          ; BC 4B F8 | Load from absolute,X into Y register
    LSR $4DB0            ; 4E B0 4D | Logical shift right (absolute)
    LDA ($4F),Y          ; B1 4F | Read graphics status
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    BCC $01              ; 90 01 | Branch if carry clear
    BRA $05              ; 80 05 | Branch always
    BRA $04              ; 80 04 | Branch always
    BRA $03              ; 80 03 | Branch always
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($CF,X)          ; 01 CF | Logical OR with accumulator ((zero page,X))
    REP #$AF             ; C2 AF | Reset processor status bits
    STA $3972,X          ; 9D 72 39 | Update graphics data
    CMP $FA              ; C5 FA | Compare accumulator (zero page)
    STA $2D72,X          ; 9D 72 2D | Update graphics data
    CMP $31F2            ; CD F2 31 | Compare accumulator (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA $A0              ; 05 A0 | Logical OR with accumulator (zero page)
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    EOR ($80,X)          ; 41 80 | Exclusive OR with accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    LSR $562A            ; 4E 2A 56 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0DB
; Address: $E6B5E5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0DB:
    JSL $AE224F          ; 22 4F 22 AE | Jump to subroutine long
    STZ $9E              ; 64 9E | Store zero to zero page
    LDA $64BE44          ; AF 44 BE 64 | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0DC
; Address: $E6B5F4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0DC:
    JSL $7F227F          ; 22 7F 22 7F | Jump to subroutine long
    STZ $DF              ; 64 DF | Store zero to zero page
    STZ $DF              ; 64 DF | Store zero to zero page
    CLV                  ; B8 | Clear overflow flag
    LDX $BF41,Y          ; BE 41 BF | Load from absolute,Y into X register
    EOR ($F3,X)          ; 41 F3 | Exclusive OR with accumulator ((zero page,X))
    JMP $4CF3            ; 4C F3 4C | Jump to address
    CPX #$7F             ; E0 7F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0DD
; Address: $E6B60C
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0DD:
    BCC $7F              ; 90 7F | Branch if carry clear
    BRA $02              ; 80 02 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STY $8C00            ; 8C 00 8C | Store Y register to absolute address
    CMP $CD32,X          ; DD 32 CD | Compare accumulator (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEC $4001            ; CE 01 40 | Decrement (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STZ $2E54            ; 9C 54 2E | Store zero to absolute
    STY $5D              ; 84 5D | Store Y register to zero page
    CMP $2C              ; C5 2C | Compare accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC $7B08,X          ; DE 08 7B | Decrement (absolute,X)
    LDY $5118            ; AC 18 51 | Load from absolute address into Y register
    DEY                  ; 88 | Decrement Y register
    STY $FF              ; 84 FF | Store Y register to zero page
    CMP $BE              ; C5 BE | Compare accumulator (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $2708,Y          ; 19 08 27 | Logical OR with accumulator (absolute,Y)
    BVC $0D              ; 50 0D | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0DE
; Address: $E6B68E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0DE:
    JSL $000077          ; 22 77 00 00 | Jump to subroutine long
    ASL $3700            ; 0E 00 37 | Arithmetic shift left (absolute)
    EOR $8300,X          ; 5D 00 83 | Exclusive OR with accumulator (absolute,X)
    BCC $45              ; 90 45 | Branch if carry clear
    EOR ($29),Y          ; 51 29 | Exclusive OR with accumulator ((zero page),Y)
    EOR $A2              ; 45 A2 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0DF
; Address: $E6B6AC
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0DF:
    LDX $AA51            ; AE 51 AA | Load from absolute address into X register
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDX $D967,Y          ; BE 67 D9 | Load from absolute,Y into X register
    BPL $28              ; 10 28 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    INC $3DC3,X          ; FE C3 3D | Increment (absolute,X)
    CPX $FF92            ; EC 92 FF | Compare X register (absolute)
    CPX $E5E9            ; EC E9 E5 | Compare X register (absolute)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SBC $790C,Y          ; F9 0C 79 | Subtract with carry (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    CLC                  ; 18 | Clear carry flag
    SBC $F8              ; E5 F8 | Subtract with carry (zero page)
    ORA $6F              ; 05 6F | Logical OR with accumulator (zero page)
    INX                  ; E8 | Increment X register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $C0BE,X          ; FD BE C0 | Subtract with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    PEA #$F8E7           ; F4 E7 F8 | Push effective address to stack
    SBC $FEDD,Y          ; F9 DD FE | Subtract with carry (absolute,Y)
    ROR $C9FF,X          ; 7E FF C9 | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $E86880          ; 8F 80 68 E8 | Update graphics data
    JMP ($6C93)          ; 6C 93 6C | Jump to address (absolute indirect)
    CLV                  ; B8 | Clear overflow flag
    BRA $7F              ; 80 7F | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$E3             ; A0 E3 | Load immediate value into Y register
    STA ($F2),Y          ; 91 F2 | Update graphics data
    CMP $F2B2            ; CD B2 F2 | Compare accumulator (absolute)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    REP #$BD             ; C2 BD | Reset processor status bits
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    SBC $E13F,Y          ; F9 3F E1 | Subtract with carry (absolute,Y)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    EOR $B4              ; 45 B4 | Exclusive OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0E3
; Address: $E6B7A1
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0E3:
    CPY #$89             ; C0 89 | Compare Y register (immediate)
    BEQ $05              ; F0 05 | Branch if equal
    SBC $B9D6,Y          ; F9 D6 B9 | Subtract with carry (absolute,Y)
    CPY $18              ; C4 18 | Compare Y register (zero page)
    CMP ($4F,X)          ; C1 4F | Compare accumulator ((zero page,X))
    LDX #$B3             ; A2 B3 | Load immediate value into X register
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BMI $21              ; 30 21 | PPU graphics register access
    PLA                  ; 68 | Pull accumulator from stack
    BCS $5C              ; B0 5C | Branch if carry set
    BMI $A1              ; 30 A1 | Branch if negative
    STX $FF00            ; 8E 00 FF | Store X register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    BRA $E4              ; 80 E4 | Branch always
    BRA $B4              ; 80 B4 | Branch always
    BNE $CF              ; D0 CF | Branch if not equal
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    BCS $D3              ; B0 D3 | Branch if carry set
    BCS $C3              ; B0 C3 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ORA $C3C4            ; 0D C4 C3 | Logical OR with accumulator (absolute)
    CPY $C7              ; C4 C7 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0E4
; Address: $E6B810
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0E4:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    PLY                  ; 7A | Pull Y register from stack
    ROL $3C7C,X          ; 3E 7C 3C | Rotate left (absolute,X)
    ROR $FF80,X          ; 7E 80 FF | Rotate right (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    STA $78843C          ; 8F 3C 84 78 | Update graphics data
    STX $7C              ; 86 7C | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    BRA $40              ; 80 40 | Branch always
    BRA $7A              ; 80 7A | Branch always
    TSX                  ; BA | Transfer stack pointer to X register
    PLY                  ; 7A | Pull Y register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0E5
; Address: $E6B84B
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0E5:
    BRA $44              ; 80 44 | Branch always
    STA ($37,X)          ; 81 37 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    LDA                  ; BF 3F F2 72 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    AND $007A,X          ; 3D 7A 00 | Logical AND with accumulator (absolute,X)
    CPY #$72             ; C0 72 | Compare Y register (immediate)
    STA $807F            ; 8D 7F 80 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    JMP $62FC9A          ; 5C 9A FC 62 | Jump to address long
    STZ $BD41            ; 9C 41 BD | Store zero to absolute
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $E9              ; 65 E9 | Add with carry (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $5C              ; 06 5C | Arithmetic shift left (zero page)
    LDX #$FC             ; A2 FC | Load immediate value into X register
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC $7C03,X          ; 7D 03 7C | Add with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    ADC $75B0,X          ; 7D B0 75 | Add with carry (absolute,X)
    EOR $0C              ; 45 0C | Exclusive OR with accumulator (zero page)
    EOR #$0C             ; 49 0C | Exclusive OR with accumulator (immediate)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $8F              ; 70 8F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 48 B7 48 | Read graphics status
    REP #$FD             ; C2 FD | Reset processor status bits
    SEP #$00             ; E2 00 | Set processor status bits
    DEY                  ; 88 | Decrement Y register
    STY $A280            ; 8C 80 A2 | Store Y register to absolute address
    BRA $49              ; 80 49 | Branch always
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    DEC $C4              ; C6 C4 | Decrement (zero page)
    RTI                  ; 40 | Return from interrupt
    SBC $3DFE,Y          ; F9 FE 3D | Subtract with carry (absolute,Y)
    DEC $FB              ; C6 FB | Decrement (zero page)
    NOP                  ; EA | No operation
    CPY $3A              ; C4 3A | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0E6
; Address: $E6B900
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0E6:
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    STY $CCC8            ; 8C C8 CC | Store Y register to absolute address
    JMP ($DCEA)          ; 6C EA DC | Jump to address (absolute indirect)
    CMP $C98E,Y          ; D9 8E C9 | Compare accumulator (absolute,Y)
    STY $FCC9            ; 8C C9 FC | Store Y register to absolute address
    SBC $F800,Y          ; F9 00 F8 | Subtract with carry (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    STA $FF7A8F          ; 8F 8F 7A FF | Update graphics data
    LDA                  ; BF 78 73 7C | Read graphics status
    AND $007E,Y          ; 39 7E 00 | Logical AND with accumulator (absolute,Y)
    STA $00FF70          ; 8F 70 FF 00 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BPL $00              ; 10 00 | Branch if positive
    SBC $E4F6            ; ED F6 E4 | Subtract with carry (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    BVS $8F              ; 70 8F | Branch if overflow set
    SBC $E412            ; ED 12 E4 | Subtract with carry (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY #$72             ; A0 72 | Load immediate value into Y register
    AND ($6E,X)          ; 21 6E | Logical AND with accumulator ((zero page,X))
    AND ($50,X)          ; 21 50 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    EOR ($1E),Y          ; 51 1E | Exclusive OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    ROL $2051            ; 2E 51 20 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0E7
; Address: $E6B972
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0E7:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC ($F4),Y          ; F1 F4 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $08F2,Y          ; F9 F2 08 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0E8
; Address: $E6B99A
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0E8:
    SED                  ; F8 | Set decimal mode flag
    BPL $C0              ; 10 C0 | Branch if positive
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    BRA $D3              ; 80 D3 | Branch always
    LDY $A1DE            ; AC DE A1 | Load from absolute address into Y register
    SBC ($AF),Y          ; F1 AF | Subtract with carry ((zero page),Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    ORA $00F2            ; 0D F2 00 | Logical OR with accumulator (absolute)
    ROL $C8C1,X          ; 3E C1 C8 | Rotate left (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    SBC $DF21            ; ED 21 DF | Subtract with carry (absolute)
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    STA $8507,Y          ; 99 07 85 | Update graphics data
    STA ($67),Y          ; 91 67 | Update graphics data
    LDA $9A47,X          ; BD 47 9A | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    ADC #$00             ; 69 00 | Add with carry (immediate)
    INC                  ; 1A | Increment accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    SBC $ED              ; E5 ED | Subtract with carry (zero page)
    JMP $DFF7FF          ; 5C FF F7 DF | Jump to address long
    TXS                  ; 9A | Transfer X register to stack pointer
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    BRA $7F              ; 80 7F | Branch always
    AND $5A              ; 25 5A | Logical AND with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0E9
; Address: $E6BA3F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0E9:
    BRA $FF              ; 80 FF | Branch always
    DEC $8200            ; CE 00 82 | Decrement (absolute)
    ASL $FE80,X          ; 1E 80 FE | Arithmetic shift left (absolute,X)
    ORA $8B4B,X          ; 1D 4B 8B | Logical OR with accumulator (absolute,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0EB
; Address: $E6BA54
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0EB:
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    PEA #$DE00           ; F4 00 DE | Push effective address to stack
    STA                  ; 9F 00 F2 0C | Update graphics data
    STA                  ; 9F 80 29 19 | Update graphics data
    BNE $30              ; D0 30 | Branch if not equal
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ROL $06              ; 26 06 | Rotate left (zero page)
    BVC $50              ; 50 50 | Branch if overflow clear
    SBC $AF00,Y          ; F9 00 AF | Subtract with carry (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0EC
; Address: $E6BA83
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0EC:
    PLP                  ; 28 | Pull processor status from stack
    STA                  ; 9F 7F 9A 65 | Update graphics data
    SED                  ; F8 | Set decimal mode flag
    BIT $38              ; 24 38 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    JMP $C03F            ; 4C 3F C0 | Jump to address
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0ED
; Address: $E6BA9E
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0ED:
    JSR $3ADF            ; 20 DF 3A | Jump to subroutine
    EOR $60              ; 45 60 | Exclusive OR with accumulator (zero page)
    STZ $EB00,X          ; 9E 00 EB | Store zero to absolute,X
    SBC $A5FC,X          ; FD FC A5 | Subtract with carry (absolute,X)
    SBC $0303,Y          ; F9 03 03 | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 00 | Read graphics status
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    ASL $FCE2,X          ; 1E E2 FC | Arithmetic shift left (absolute,X)
    LDA $8280            ; AD 80 82 | Read graphics status
    SBC $02E1            ; ED E1 02 | Subtract with carry (absolute)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    PHY                  ; 5A | Push Y register to stack
    LDA $B6D6,Y          ; B9 D6 B6 | Read graphics status
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA $7DED            ; 8D ED 7D | Update graphics data
    SBC $2F00            ; ED 00 2F | Subtract with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    SBC $DD9B,X          ; FD 9B DD | Subtract with carry (absolute,X)
    CPY $CCBB            ; CC BB CC | Compare Y register (absolute)
    SBC $DD9B,X          ; FD 9B DD | Subtract with carry (absolute,X)
    CMP $00BB,X          ; DD BB 00 | Compare accumulator (absolute,X)
    CMP $EFBB,X          ; DD BB EF | Compare accumulator (absolute,X)
    INC $ECB9            ; EE B9 EC | Increment (absolute)
    CMP $EFBB            ; CD BB EF | Compare accumulator (absolute)
    INC $0099            ; EE 99 00 | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    INC $FD2A,X          ; FE 2A FD | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDA $BC79,X          ; BD 79 BC | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    ROL $5E81,X          ; 3E 81 5E | Rotate left (absolute,X)
    LDA $10EF,X          ; BD EF 10 | Read graphics status
    INC $2811            ; EE 11 28 | Increment (absolute)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0EE
; Address: $E6BB58
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0EE:
    SEC                  ; 38 | Set carry flag
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BEQ $1D              ; F0 1D | Branch if equal
    SBC $E0D0            ; ED D0 E0 | Game work RAM access
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP $C032            ; CD 32 C0 | Compare accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    CPX $98              ; E4 98 | Compare X register (zero page)
    LDA                  ; BF 24 FF E7 | Read graphics status
    ROL $437F,X          ; 3E 7F 43 | Rotate left (absolute,X)
    EOR $7EE7,Y          ; 59 E7 7E | Exclusive OR with accumulator (absolute,Y)
    STA ($00,X)          ; 81 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $DC62,X          ; BC 62 DC | Load from absolute,X into Y register
    ROL $6480,X          ; 3E 80 64 | Rotate left (absolute,X)
    CPY #$42             ; C0 42 | Hardware register operation
    CPY #$F9             ; C0 F9 | Compare Y register (immediate)
    STY $94              ; 84 94 | Store Y register to zero page
    CPX $C36C            ; EC 6C C3 | Compare X register (absolute)
    JMP $FF00A3          ; 5C A3 00 FF | Jump to address long
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 00 | Read graphics status
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    ADC $19              ; 65 19 | Add with carry (zero page)
    ADC #$11             ; 69 11 | Add with carry (immediate)
    LSR $192F            ; 4E 2F 19 | Logical shift right (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC $19              ; 65 19 | Add with carry (zero page)
    EOR $5733,X          ; 5D 33 57 | Exclusive OR with accumulator (absolute,X)
    ASL $067F            ; 0E 7F 06 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $B66F,X          ; 1E 6F B6 | Arithmetic shift left (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $3F56,Y          ; 19 56 3F | Logical OR with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    AND $3F56,Y          ; 39 56 3F | Logical AND with accumulator (absolute,Y)
    ASL $962F,X          ; 1E 2F 96 | Arithmetic shift left (absolute,X)
    BRA $60              ; 80 60 | Branch always
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0EF
; Address: $E6BC4A
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0EF:
    TAX                  ; AA | Transfer accumulator to X register
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $3A              ; 80 3A | Branch always
    INC                  ; 1A | Increment accumulator
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    LDX #$57             ; A2 57 | Load immediate value into X register
    LDA ($56),Y          ; B1 56 | Read graphics status
    INC                  ; 1A | Increment accumulator
    BRA $70              ; 80 70 | Branch always
    BCC $7F              ; 90 7F | Branch if carry clear
    BCC $7F              ; 90 7F | Branch if carry clear
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BRA $40              ; 80 40 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$6A             ; C0 6A | Compare Y register (immediate)
    STX $D2              ; 86 D2 | Store X register to zero page
    BRA $ED              ; 80 ED | Branch always
    STA ($C4,X)          ; 81 C4 | Update graphics data
    BIT $64C3            ; 2C C3 64 | Test bits in accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY $314C            ; AC 4C 31 | Load from absolute address into Y register
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    REP #$82             ; C2 82 | Reset processor status bits
    CPX $1F              ; E4 1F | Compare X register (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$82             ; E0 82 | Compare X register (immediate)
    ADC $FD02,X          ; 7D 02 FD | Add with carry (absolute,X)
    EOR ($AE,X)          ; 41 AE | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    WDM #$DC             ; 42 DC | Reserved instruction
    LDY $5702            ; AC 02 57 | Load from absolute address into Y register
    ASL $3327            ; 0E 27 33 | Arithmetic shift left (absolute)
    EOR $3413            ; 4D 13 34 | Exclusive OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 20 DF 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F0
; Address: $E6BD20
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F0:
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    INC $4720,X          ; FE 20 47 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    STA $2706,Y          ; 99 06 27 | Update graphics data
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SEP #$D9             ; E2 D9 | Set processor status bits
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F1
; Address: $E6BD32
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F1:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    LDY $A38F            ; AC 8F A3 | Load from absolute address into Y register
    BRA $80              ; 80 80 | Branch always
    STZ $07              ; 64 07 | Store zero to zero page
    BPL $8F              ; 10 8F | Branch if positive
    BVS $A3              ; 70 A3 | Branch if overflow set
    JMP $027F80          ; 5C 80 7F 02 | Jump to address long
    SBC $F807,X          ; FD 07 F8 | Subtract with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    XBA                  ; EB | Exchange accumulator bytes
    BPL $EF              ; 10 EF | Branch if positive
    ASL $1E17,X          ; 1E 17 1E | Arithmetic shift left (absolute,X)
    ASL $1E13,X          ; 1E 13 1E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA $0014,Y          ; 19 14 00 | Logical OR with accumulator (absolute,Y)
    EOR ($BC,X)          ; 41 BC | Exclusive OR with accumulator ((zero page,X))
    LDY $EF              ; A4 EF | Load from zero page into Y register
    EOR $B7              ; 45 B7 | Exclusive OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BCC $EC              ; 90 EC | Branch if carry clear
    ORA $DBE6,X          ; 1D E6 DB | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F2
; Address: $E6BD92
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F2:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    ADC ($A1,X)          ; 61 A1 | Add with carry ((zero page,X))
    ORA $CBD3,X          ; 1D D3 CB | Logical OR with accumulator (absolute,X)
    ROR $3023            ; 6E 23 30 | Rotate right (absolute)
    SBC ($5C),Y          ; F1 5C | Subtract with carry ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 09 10 0B | Read graphics status
    BPL $05              ; 10 05 | Branch if positive
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $1E05,X          ; 1D 05 1E | Logical OR with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL $1211,X          ; 1E 11 12 | Arithmetic shift left (absolute,X)
    ORA $1F00,X          ; 1D 00 1F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F3
; Address: $E6BE01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F3:
    ORA $009F            ; 0D 9F 00 | Logical OR with accumulator (absolute)
    INC $9C0C            ; EE 0C 9C | Increment (absolute)
    STZ $9A              ; 64 9A | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F4
; Address: $E6BE0A
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F4:
    PLA                  ; 68 | Pull accumulator from stack
    BRA $7E              ; 80 7E | Branch always
    ASL $CD              ; 06 CD | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    AND $2BCA            ; 2D CA 2B | Logical AND with accumulator (absolute)
    ROR $18              ; 66 18 | Rotate right (zero page)
    SBC ($05,X)          ; E1 05 | Subtract with carry ((zero page,X))
    BIT $122D            ; 2C 2D 12 | Test bits in accumulator (absolute)
    CPX $83              ; E4 83 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $35              ; 05 35 | Logical OR with accumulator (zero page)
    ORA $27D3,X          ; 1D D3 27 | Logical OR with accumulator (absolute,X)
    PEA #$3823           ; F4 23 38 | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    ORA $0722,X          ; 1D 22 07 | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY $3B              ; C4 3B | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F5
; Address: $E6BE7E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F5:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    STY $D0              ; 84 D0 | Store Y register to zero page
    CPX $CFB7            ; EC B7 CF | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $5B              ; 84 5B | Store Y register to zero page
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    EOR #$06             ; 49 06 | Exclusive OR with accumulator (immediate)
    LDA ($22,X)          ; A1 22 | Read graphics status
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    AND $7F00,X          ; 3D 00 7F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F7
; Address: $E6BEC3
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F7:
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    ROL $12DD,X          ; 3E DD 12 | Rotate left (absolute,X)
    SBC $FF7C,X          ; FD 7C FF | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Read graphics status
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    WDM #$FF             ; 42 FF | Reserved instruction
    ORA $71FF,Y          ; 19 FF 71 | Logical OR with accumulator (absolute,Y)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    CPY $BDF7            ; CC F7 BD | Compare Y register (absolute)
    ROR $5FA9,X          ; 7E A9 5F | Rotate right (absolute,X)
    INC $FF              ; E6 FF | Increment (zero page)
    STX $B9EF            ; 8E EF B9 | Store X register to absolute address
    LSR $4FCB            ; 4E CB 4F | Logical shift right (absolute)
    STA $B9E6C7          ; 8F C7 E6 B9 | Update graphics data
    LDX $B3B0,Y          ; BE B0 B3 | Load from absolute,Y into X register
    STA                  ; 9F 48 B7 48 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    CMP $E01F            ; CD 1F E0 | Game work RAM access
    AND $04C6,Y          ; 39 C6 04 | Logical AND with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX #$65             ; E0 65 | Compare X register (immediate)
    STA ($8A,X)          ; 81 8A | Update graphics data
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDX $BF40,Y          ; BE 40 BF | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    AND $F202,X          ; 3D 02 F2 | Logical AND with accumulator (absolute,X)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    LDA $70              ; A5 70 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    DEC $93              ; C6 93 | Decrement (zero page)
    INC $92              ; E6 92 | Increment (zero page)
    INC $F2              ; E6 F2 | Increment (zero page)
    STX $1F              ; 86 1F | Store X register to zero page
    CPX #$04             ; E0 04 | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F8
; Address: $E6BFC0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F8:
    JSR $065F            ; 20 5F 06 | Jump to subroutine
    CPX #$6C             ; E0 6C | Compare X register (immediate)
    BEQ $9B              ; F0 9B | Branch if equal

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0F9
; Address: $E6BFC7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0F9:
    STZ $CD48            ; 9C 48 CD | Store zero to absolute
    LDA                  ; BF FF A8 3E | Read graphics status
    LDA $04              ; A5 04 | Read graphics status
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0FA
; Address: $E6BFD5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0FA:
    STA                  ; 9F 98 67 CC | Update graphics data
    ROL $04C1,X          ; 3E C1 04 | Rotate left (absolute,X)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    SBC ($C0,X)          ; E1 C0 | Subtract with carry ((zero page,X))
    BIT $D30C            ; 2C 0C D3 | Test bits in accumulator (absolute)
    BIT $502F            ; 2C 2F 50 | Test bits in accumulator (absolute)
    STY $977C            ; 8C 7C 97 | Store Y register to absolute address
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    ROR $2100,X          ; 7E 00 21 | PPU graphics register access
    EOR ($5A,X)          ; 41 5A | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0FB
; Address: $E6C005
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0FB:
    JSR $2E9E            ; 20 9E 2E | Jump to subroutine
    CMP $4FE9,Y          ; D9 E9 4F | Compare accumulator (absolute,Y)
    LDA $5FAF49          ; AF 49 AF 5F | Read graphics status
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $C9F1            ; 0E F1 C9 | Arithmetic shift left (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    BCC $DB              ; 90 DB | Branch if carry clear
    ASL $6A              ; 06 6A | Arithmetic shift left (zero page)
    LDA ($BF,X)          ; A1 BF | Read graphics status
    ADC $78              ; 65 78 | Add with carry (zero page)
    STA ($CC),Y          ; 91 CC | Update graphics data
    SBC ($0C,X)          ; E1 0C | Subtract with carry ((zero page,X))
    BCC $6F              ; 90 6F | Branch if carry clear
    SBC $9D62,X          ; FD 62 9D | Subtract with carry (absolute,X)
    JMP $C09F60          ; 5C 60 9F C0 | Jump to address long
    LDX $0B40,Y          ; BE 40 0B | Load from absolute,Y into X register
    SEC                  ; 38 | Set carry flag
    ORA $CE35,Y          ; 19 35 CE | Logical OR with accumulator (absolute,Y)
    INC $01              ; E6 01 | Increment (zero page)
    LDA $A202,X          ; BD 02 A2 | Read graphics status
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    STA $E86880          ; 8F 80 68 E8 | Update graphics data
    JMP ($6C93)          ; 6C 93 6C | Jump to address (absolute indirect)
    CLV                  ; B8 | Clear overflow flag
    BRA $7F              ; 80 7F | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    ADC $F017,Y          ; 79 17 F0 | Add with carry (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    STZ $CD48            ; 9C 48 CD | Store zero to absolute
    LDA                  ; BF FF A8 3E | Read graphics status
    LDA $04              ; A5 04 | Read graphics status
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0FC
; Address: $E6C095
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0FC:
    STA $6798,X          ; 9D 98 67 | Update graphics data
    CPY $FF33            ; CC 33 FF | Compare Y register (absolute)
    ROL $04C1,X          ; 3E C1 04 | Rotate left (absolute,X)
    STA $6F61,X          ; 9D 61 6F | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0FD
; Address: $E6C0A4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0FD:
    INC $C7              ; E6 C7 | Increment (zero page)
    ROL $12EF            ; 2E EF 12 | Rotate left (absolute)
    STY $977C            ; 8C 7C 97 | Store Y register to absolute address
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0FE
; Address: $E6C0B3
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0FE:
    STA                  ; 9F 07 F8 1C | Update graphics data
    INX                  ; E8 | Increment X register
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ORA $050B            ; 0D 0B 05 | Logical OR with accumulator (absolute)
    ORA $0200            ; 0D 00 02 | Logical OR with accumulator (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BPL $0C              ; 10 0C | Branch if positive
    AND $678C,X          ; 3D 8C 67 | Logical AND with accumulator (absolute,X)
    STA $F88FE0          ; 8F E0 8F F8 | Update graphics data
    BMI $0F              ; 30 0F | Branch if negative
    BMI $0F              ; 30 0F | Branch if negative
    BVS $0C              ; 70 0C | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    CPY $CE08            ; CC 08 CE | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    ASL $0E0A            ; 0E 0A 0E | Arithmetic shift left (absolute)
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $0F              ; F0 0F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ADC ($AE,X)          ; 61 AE | Add with carry ((zero page,X))
    LSR $3D91            ; 4E 91 3D | Logical shift right (absolute)
    STA ($3E,X)          ; 81 3E | Update graphics data
    STA ($E6,X)          ; 81 E6 | Update graphics data
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_0FF
; Address: $E6C130
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_0FF:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 03 FF 03 | Update graphics data
    ADC $9F83,Y          ; 79 83 9F | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_100
; Address: $E6C145
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_100:
    EOR ($AD,X)          ; 41 AD | Exclusive OR with accumulator ((zero page,X))
    EOR ($C7,X)          ; 41 C7 | Exclusive OR with accumulator ((zero page,X))
    ADC $85F6,Y          ; 79 F6 85 | Add with carry (absolute,Y)
    REP #$7D             ; C2 7D | Reset processor status bits
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BPL $1C              ; 10 1C | Branch if positive
    EOR $476C,X          ; 5D 6C 47 | Exclusive OR with accumulator (absolute,X)
    BRA $EF              ; 80 EF | Branch always
    CLV                  ; B8 | Clear overflow flag
    BMI $0F              ; 30 0F | Branch if negative
    BMI $0F              ; 30 0F | Branch if negative
    BVS $0C              ; 70 0C | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_102
; Address: $E6C185
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_102:
    JSR $0C93            ; 20 93 0C | Jump to subroutine
    LDA $D604,Y          ; B9 04 D6 | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC $8A52            ; CE 52 8A | Decrement (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    WDM #$BD             ; 42 BD | Reserved instruction
    WDM #$BD             ; 42 BD | Reserved instruction
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDA $6E46,Y          ; B9 46 6E | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC ($58,X)          ; 61 58 | Add with carry ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    WDM #$BD             ; 42 BD | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 10 1C | Read graphics status
    STA                  ; 9F 2F FC 8F | Update graphics data
    SBC $476C,X          ; FD 6C 47 | Subtract with carry (absolute,X)
    LDA $F8EF40          ; AF 40 EF F8 | Read graphics status
    BMI $8F              ; 30 8F | Branch if negative
    BCS $EF              ; B0 EF | Branch if carry set
    BEQ $EC              ; F0 EC | Branch if equal
    BEQ $8F              ; F0 8F | Branch if equal

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_103
; Address: $E6C1DD
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_103:
    BEQ $90              ; F0 90 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CMP #$CC             ; C9 CC | Compare accumulator (immediate)
    CMP #$EB             ; C9 EB | Compare accumulator (immediate)
    ASL $0D0A            ; 0E 0A 0D | Arithmetic shift left (absolute)
    ROL $FC00            ; 2E 00 FC | Rotate left (absolute)
    SED                  ; F8 | Set decimal mode flag
    CMP #$35             ; C9 35 | Compare accumulator (immediate)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    SBC ($2E,X)          ; E1 2E | Subtract with carry ((zero page,X))
    BCC $3F              ; 90 3F | Branch if carry clear
    BRA $7D              ; 80 7D | Branch always
    BRA $3F              ; 80 3F | Branch always
    BRA $E5              ; 80 E5 | Branch always
    ADC $01              ; 65 01 | Add with carry (zero page)
    INC $FB04,X          ; FE 04 FB | Increment (absolute,X)
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    ADC $9A              ; 65 9A | Add with carry (zero page)
    SBC $1F03,Y          ; F9 03 1F | Subtract with carry (absolute,Y)
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    ORA ($77,X)          ; 01 77 | Logical OR with accumulator ((zero page,X))
    BIT #$F6             ; 89 F6 | Test bits in accumulator (immediate)
    REP #$3D             ; C2 3D | Reset processor status bits
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PEA #$000B           ; F4 0B 00 | Push effective address to stack
    CMP ($95),Y          ; D1 95 | Compare accumulator ((zero page),Y)
    CPX $A4              ; E4 A4 | Compare X register (zero page)
    CPX #$A4             ; E0 A4 | Compare X register (immediate)
    SEP #$26             ; E2 26 | Set processor status bits
    CPY $24              ; C4 24 | Compare Y register (zero page)
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CPX #$24             ; E0 24 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROR                  ; 6A | Rotate right (accumulator)
    LDY $5B              ; A4 5B | Load from zero page into Y register
    LDY $5B              ; A4 5B | Load from zero page into Y register
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    AND ($9B,X)          ; 21 9B | Logical AND with accumulator ((zero page,X))
    LDA ($7B,X)          ; A1 7B | Read graphics status
    ADC ($B8,X)          ; 61 B8 | Add with carry ((zero page,X))
    LDX #$88             ; A2 88 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_104
; Address: $E6C270
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_104:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    LDA ($5E,X)          ; A1 5E | Read graphics status
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_107
; Address: $E6C287
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_107:
    JSR $3F40            ; 20 40 3F | Jump to subroutine
    ADC ($2E),Y          ; 71 2E | Add with carry ((zero page),Y)
    STA $401F50          ; 8F 50 1F 40 | Update graphics data
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_109
; Address: $E6C296
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_109:
    JSR $3FDF            ; 20 DF 3F | Jump to subroutine
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    CPY $37              ; C4 37 | Compare Y register (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    LDA ($FF),Y          ; B1 FF | Read graphics status
    AND $E703,Y          ; 39 03 E7 | Logical AND with accumulator (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA $181D,Y          ; 19 1D 18 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    ASL $1718,X          ; 1E 18 17 | Arithmetic shift left (absolute,X)
    JMP ($CC80)          ; 6C 80 CC | Jump to address (absolute indirect)
    INC $07              ; E6 07 | Increment (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT #$75             ; 89 75 | Test bits in accumulator (immediate)
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEC $87              ; C6 87 | Decrement (zero page)
    LDA                  ; BF 0C 1F C7 | Read graphics status
    AND $6E39,Y          ; 39 39 6E | Logical AND with accumulator (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF 40 1F E0 | Read graphics status
    SEC                  ; 38 | Set carry flag
    AND $0FC6,Y          ; 39 C6 0F | Logical AND with accumulator (absolute,Y)
    BEQ $03              ; F0 03 | Branch if equal
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $020F            ; 0E 0F 02 | Arithmetic shift left (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_10A
; Address: $E6C33E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_10A:
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDA ($00),Y          ; B1 00 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $40              ; 80 40 | Branch always
    LDA                  ; BF 00 FF 00 | Read graphics status
    INC $FEB0,X          ; FE B0 FE | Increment (absolute,X)
    ORA ($94,X)          ; 01 94 | Logical OR with accumulator ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1C13,Y          ; 19 13 1C | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    BPL $19              ; 10 19 | Branch if positive
    ADC ($80),Y          ; 71 80 | Add with carry ((zero page),Y)
    ORA ($60),Y          ; 11 60 | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    EOR ($12),Y          ; 51 12 | Exclusive OR with accumulator ((zero page),Y)
    STX $060E            ; 8E 0E 06 | Store X register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_10B
; Address: $E6C3B4
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_10B:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    LDY $18              ; A4 18 | Load from zero page into Y register
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    CMP $F00C            ; CD 0C F0 | Compare accumulator (absolute)
    BEQ $37              ; F0 37 | Branch if equal
    CPY $F8CF            ; CC CF F8 | Compare Y register (absolute)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BMI $01              ; 30 01 | Branch if negative
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_10C
; Address: $E6C408
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_10C:
    ROR $7F01,X          ; 7E 01 7F | Rotate right (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    INC $04              ; E6 04 | Increment (zero page)
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    BEQ $FE              ; F0 FE | Branch if equal
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    TAX                  ; AA | Transfer accumulator to X register
    CMP $CFE8,X          ; DD E8 CF | Compare accumulator (absolute,X)
    INC $D2C4,X          ; FE C4 D2 | Increment (absolute,X)
    INC $9640            ; EE 40 96 | Increment (absolute)
    BPL $B3              ; 10 B3 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_10D
; Address: $E6C467
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_10D:
    JSR $308D            ; 20 8D 30 | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 10 EF 03 | Read graphics status
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    STZ $E31C            ; 9C 1C E3 | Store zero to absolute
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    BEQ $03              ; F0 03 | Branch if equal
    CPY $1C              ; C4 1C | Compare Y register (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC ($59),Y          ; F1 59 | Subtract with carry ((zero page),Y)
    BVS $55              ; 70 55 | Branch if overflow set
    ADC $3C06,Y          ; 79 06 3C | Add with carry (absolute,Y)
    ROL $1F05,X          ; 3E 05 1F | Rotate left (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    LDA ($92),Y          ; B1 92 | Read graphics status
    CMP $E116            ; CD 16 E1 | Compare accumulator (absolute)
    ORA $8370            ; 0D 70 83 | Logical OR with accumulator (absolute)
    LDY $27A8,X          ; BC A8 27 | Load from absolute,X into Y register
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_10E
; Address: $E6C4DA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_10E:
    JSR $08DF            ; 20 DF 08 | Jump to subroutine
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    DEC $3421,X          ; DE 21 34 | Decrement (absolute,X)
    BVS $80              ; 70 80 | Branch if overflow set
    BPL $0F              ; 10 0F | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    ORA $783A            ; 0D 3A 78 | Logical OR with accumulator (absolute)
    LSR $5836,X          ; 5E 36 58 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_10F
; Address: $E6C508
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_10F:
    TAX                  ; AA | Transfer accumulator to X register
    CLV                  ; B8 | Clear overflow flag
    STA $3BA4,Y          ; 99 A4 3B | Update graphics data
    LDY $4A              ; A4 4A | Load from zero page into Y register
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    INC $B973            ; EE 73 B9 | Increment (absolute)
    DEC $F3EF,X          ; DE EF F3 | Decrement (absolute,X)
    AND $067E,X          ; 3D 7E 06 | Logical AND with accumulator (absolute,X)
    BMI $30              ; 30 30 | Branch if negative
    STX $07              ; 86 07 | Store X register to zero page
    CLC                  ; 18 | Clear carry flag
    CPX #$63             ; E0 63 | Compare X register (immediate)
    STZ $609E            ; 9C 9E 60 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_110
; Address: $E6C56A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_110:
    JSR $D3DF            ; 20 DF D3 | Jump to subroutine
    CPX $3F0E            ; EC 0E 3F | Compare X register (absolute)
    BMI $CF              ; 30 CF | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    DEC $DF7E,X          ; DE 7E DF | Decrement (absolute,X)
    ROR $1F2F,X          ; 7E 2F 1F | Rotate right (absolute,X)
    STA                  ; 9F 3F 1E 3E | Update graphics data
    ROR $BF40,X          ; 7E 40 BF | Rotate right (absolute,X)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 01 FE 01 | Read graphics status
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF BD 01 D2 | Read graphics status
    BPL $BE              ; 10 BE | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    LDY $FF3C,X          ; BC 3C FF | Load from absolute,X into Y register
    ADC $7EFE,X          ; 7D FE 7E | Add with carry (absolute,X)
    LDX $FF3E,Y          ; BE 3E FF | Load from absolute,Y into X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_111
; Address: $E6C5B4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_111:
    JSL $FF00DD          ; 22 DD 00 FF | Jump to subroutine long
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 41 | Read graphics status
    LDX $3FA7,Y          ; BE A7 3F | Load from absolute,Y into X register
    LDA $E303            ; AD 03 E3 | Read graphics status
    AND ($09,X)          ; 21 09 | Logical AND with accumulator ((zero page,X))
    ORA $061B,Y          ; 19 1B 06 | Logical OR with accumulator (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_112
; Address: $E6C5D6
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_112:
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    ORA $0606,Y          ; 19 06 06 | Logical OR with accumulator (absolute,Y)
    ORA $0700,Y          ; 19 00 07 | Logical OR with accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    BIT $10F3            ; 2C F3 10 | Test bits in accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA ($3D,X)          ; 81 3D | Update graphics data
    LDA $6500,Y          ; B9 00 65 | Read graphics status
    INC $4200,X          ; FE 00 42 | Hardware register operation
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP ($FD,X)          ; C1 FD | Compare accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    ASL $2EFF            ; 0E FF 2E | Arithmetic shift left (absolute)
    SBC ($2D),Y          ; F1 2D | Subtract with carry ((zero page),Y)
    LDA $3FA0,X          ; BD A0 3F | Read graphics status
    TXS                  ; 9A | Transfer X register to stack pointer
    STA $0029C6          ; 8F C6 29 00 | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    DEC $2200            ; CE 00 22 | Decrement (absolute)
    ROR $7A00            ; 6E 00 7A | Rotate right (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    PEA #$F51F           ; F4 1F F5 | Push effective address to stack
    SEP #$6F             ; E2 6F | Set processor status bits
    SBC #$BF             ; E9 BF | Subtract with carry (immediate)
    SBC ($1B),Y          ; F1 1B | Subtract with carry ((zero page),Y)
    STX $0C00            ; 8E 00 0C | Store X register to absolute address
    ORA $1A00            ; 0D 00 1A | Logical OR with accumulator (absolute)
    ORA $7200,Y          ; 19 00 72 | Logical OR with accumulator (absolute,Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $28              ; 10 28 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    STY $24              ; 84 24 | Store Y register to zero page
    STY $8E              ; 84 8E | Store Y register to zero page
    ORA $0AD5,Y          ; 19 D5 0A | Logical OR with accumulator (absolute,Y)
    BIT #$06             ; 89 06 | Test bits in accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP $2548            ; 4C 48 25 | Jump to address
    ASL $25              ; 06 25 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_113
; Address: $E6C689
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_113:
    PHA                  ; 48 | Push accumulator to stack
    JMP $104371          ; 5C 71 43 10 | Jump to address long
    INC                  ; 1A | Increment accumulator
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    SBC $DB24            ; ED 24 DB | Subtract with carry (absolute)
    SBC $AD52,X          ; FD 52 AD | Subtract with carry (absolute,X)
    BIT $00D3            ; 2C D3 00 | Test bits in accumulator (absolute)
    BIT #$48             ; 89 48 | Test bits in accumulator (immediate)
    CPY #$51             ; C0 51 | Compare Y register (immediate)
    PLY                  ; 7A | Pull Y register from stack
    ROL                  ; 2A | Rotate left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    LSR $21              ; 46 21 | PPU graphics register access
    SEC                  ; 38 | Set carry flag
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC #$08             ; 69 08 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_114
; Address: $E6C6BF
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_114:
    STA                  ; 9F 2F 0F 05 | Update graphics data
    ASL $0F0F            ; 0E 0F 0F | Arithmetic shift left (absolute)
    AND $0F              ; 25 0F | Logical AND with accumulator (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    ORA $0C26            ; 0D 26 0C | Logical OR with accumulator (absolute)
    ASL $0F0B            ; 0E 0B 0F | Arithmetic shift left (absolute)
    ORA $1B0D            ; 0D 0D 1B | Logical OR with accumulator (absolute)
    BCS $6F              ; B0 6F | Branch if carry set
    TSX                  ; BA | Transfer stack pointer to X register
    STA ($6F),Y          ; 91 6F | Update graphics data
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BCC $6F              ; 90 6F | Branch if carry clear
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    BCC $6F              ; 90 6F | Branch if carry clear
    ORA $4F              ; 05 4F | Logical OR with accumulator (zero page)
    STZ $2792,X          ; 9E 92 27 | Store zero to absolute,X
    ROL $9F              ; 26 9F | Rotate left (zero page)
    STA                  ; 9F 00 FF 8C | Update graphics data
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BCS $FF              ; B0 FF | Branch if carry set

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_115
; Address: $E6C71A
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_115:
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_116
; Address: $E6C728
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_116:
    STY $00              ; 84 00 | Store Y register to zero page
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    LDX $FFFF            ; AE FF FF | Load from absolute address into X register
    SBC $CC9B,X          ; FD 9B CC | Subtract with carry (absolute,X)
    INC $DDB9            ; EE B9 DD | Increment (absolute)
    INC $DDBB            ; EE BB DD | Increment (absolute)
    CMP $FCBB,X          ; DD BB FC | Compare accumulator (absolute,X)
    CMP $CEBB,X          ; DD BB CE | Compare accumulator (absolute,X)
    LDA $BBDC,Y          ; B9 DC BB | Read graphics status
    CMP $DCBB            ; CD BB DC | Compare accumulator (absolute)
    CMP $CFBB,X          ; DD BB CF | Compare accumulator (absolute,X)
    CPY $00BB            ; CC BB 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_119
; Address: $E6C790
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_119:
    JSR $1126            ; 20 26 11 | Jump to subroutine
    LSR $D728            ; 4E 28 D7 | Logical shift right (absolute)
    ADC ($42,X)          ; 61 42 | Hardware register operation
    AND $0F10,X          ; 3D 10 0F | Logical AND with accumulator (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    JMP ($A4EC)          ; 6C EC A4 | Jump to address (absolute indirect)
    JMP ($AC64)          ; 6C 64 AC | Jump to address (absolute indirect)
    AND $ED              ; 25 ED | Logical AND with accumulator (zero page)
    ADC $ED              ; 65 ED | Add with carry (zero page)
    ROL $FE              ; 26 FE | Rotate left (zero page)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    CPY $88DF            ; CC DF 88 | Compare Y register (absolute)
    AND ($EE),Y          ; 31 EE | Logical AND with accumulator ((zero page),Y)
    STZ $C15C            ; 9C 5C C1 | Store zero to absolute
    INC $4032            ; EE 32 40 | Increment (absolute)
    LDX $00              ; A6 00 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_11B
; Address: $E6C7F6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_11B:
    JSR $23FF            ; 20 FF 23 | Jump to subroutine
    STY $00FF            ; 8C FF 00 | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_11C
; Address: $E6C818
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_11C:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    LDY $BF20,X          ; BC 20 BF | Load from absolute,X into Y register
    LDY #$2B             ; A0 2B | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $3A              ; 10 3A | Branch if positive
    JMP $0C5E08          ; 5C 08 5E 0C | Jump to address long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA ($7C,X)          ; 81 7C | Update graphics data
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CMP ($0C),Y          ; D1 0C | Compare accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CPY $11              ; C4 11 | Compare Y register (zero page)
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)
    AND ($CC),Y          ; 31 CC | Logical AND with accumulator ((zero page),Y)
    EOR ($8C),Y          ; 51 8C | Exclusive OR with accumulator ((zero page),Y)
    BPL $C7              ; 10 C7 | Branch if positive
    CPY #$15             ; C0 15 | Compare Y register (immediate)
    CPY #$44             ; C0 44 | Compare Y register (immediate)
    STY $7B              ; 84 7B | Store Y register to zero page
    AND ($CC),Y          ; 31 CC | Logical AND with accumulator ((zero page),Y)
    EOR ($8C),Y          ; 51 8C | Exclusive OR with accumulator ((zero page),Y)
    CPY $C817            ; CC 17 C8 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    CPY $31              ; C4 31 | Compare Y register (zero page)
    CPY $CC01            ; CC 01 CC | Compare Y register (absolute)
    STA ($4C),Y          ; 91 4C | Update graphics data
    PLY                  ; 7A | Pull Y register from stack
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC $0400,X          ; 7D 00 04 | Add with carry (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CMP $7FF2,X          ; DD F2 7F | Compare accumulator (absolute,X)
    STA                  ; 9F 9A E5 3D | Update graphics data
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    LDY $F9C3,X          ; BC C3 F9 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_11D
; Address: $E6C8D0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_11D:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    INC $82              ; E6 82 | Increment (zero page)
    ADC $CC00            ; 6D 00 CC | Add with carry (absolute)
    DEC $DD00            ; CE 00 DD | Decrement (absolute)
    PLB                  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_11E
; Address: $E6C8E2
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_11E:
    INC $59F9,X          ; FE F9 59 | Increment (absolute,X)
    STZ $1CE3            ; 9C E3 1C | Store zero to absolute
    STY $04F3            ; 8C F3 04 | Store Y register to absolute address
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    ORA ($72,X)          ; 01 72 | Logical OR with accumulator ((zero page,X))
    ORA ($BA,X)          ; 01 BA | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC ($8F),Y          ; F1 8F | Subtract with carry ((zero page),Y)
    LDA ($CF),Y          ; B1 CF | Read graphics status
    LDA $DF              ; A5 DF | Read graphics status
    STA $D9E7,X          ; 9D E7 D9 | Update graphics data
    LDA                  ; BF 60 FF 01 | Read graphics status
    CLD                  ; D8 | Clear decimal mode flag
    CMP $D900,Y          ; D9 00 D9 | Compare accumulator (absolute,Y)
    CMP $CE00,X          ; DD 00 CE | Compare accumulator (absolute,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    STA                  ; 9F 60 AC F3 | Update graphics data
    LDY $1CF3            ; AC F3 1C | Load from absolute address into Y register
    BIT $FB              ; 24 FB | Test bits in accumulator (zero page)
    JMP $B8F3            ; 4C F3 B8 | Jump to address
    SBC $FF06,X          ; FD 06 FF | Subtract with carry (absolute,X)
    ORA ($BA,X)          ; 01 BA | Logical OR with accumulator ((zero page,X))
    EOR ($BA,X)          ; 41 BA | Exclusive OR with accumulator ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    STA ($3A,X)          ; 81 3A | Update graphics data
    AND ($52,X)          ; 21 52 | Logical AND with accumulator ((zero page,X))
    EOR ($A6,X)          ; 41 A6 | Exclusive OR with accumulator ((zero page,X))
    SBC $0306,Y          ; F9 06 03 | Subtract with carry (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_11F
; Address: $E6C953
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_11F:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA $0F0D8F          ; 8F 8F 0D 0F | Update graphics data
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    LSR $0F0F            ; 4E 0F 0F | Logical shift right (absolute)
    AND $0F              ; 25 0F | Logical AND with accumulator (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BVS $EF              ; 70 EF | Branch if overflow set
    BEQ $6F              ; F0 6F | Branch if equal
    BEQ $6F              ; F0 6F | Branch if equal
    BCS $6F              ; B0 6F | Branch if carry set
    BEQ $6F              ; F0 6F | Branch if equal
    BNE $6F              ; D0 6F | Branch if not equal
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_121
; Address: $E6C983
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_121:
    JSL $A08048          ; 22 48 80 A0 | Jump to subroutine long
    BRA $80              ; 80 80 | Branch always
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_122
; Address: $E6C996
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_122:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0003            ; 0D 03 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $250F            ; 0D 0F 25 | Logical OR with accumulator (absolute)
    ASL $4B0F            ; 0E 0F 4B | Arithmetic shift left (absolute)
    ORA $0B05            ; 0D 05 0B | Logical OR with accumulator (absolute)
    BCS $6F              ; B0 6F | Branch if carry set
    BEQ $6F              ; F0 6F | Branch if equal
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BCS $6F              ; B0 6F | Branch if carry set
    BMI $39              ; 30 39 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    AND $1237,X          ; 3D 37 12 | Logical AND with accumulator (absolute,X)
    ORA $0200            ; 0D 00 02 | Logical OR with accumulator (absolute)
    ORA $1A              ; 05 1A | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ORA ($20),Y          ; 11 20 | Logical OR with accumulator ((zero page),Y)
    AND ($74),Y          ; 31 74 | Logical AND with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    ASL $0A20            ; 0E 20 0A | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    PHX                  ; DA | Push X register to stack
    CLV                  ; B8 | Clear overflow flag
    STA $3339,X          ; 9D 39 33 | Update graphics data
    LDX #$9A             ; A2 9A | Load immediate value into X register
    ROR $4E              ; 66 4E | Rotate right (zero page)
    BCS $E8              ; B0 E8 | Branch if carry set
    BVC $C8              ; 50 C8 | Branch if overflow clear
    BCS $A8              ; B0 A8 | Branch if carry set
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_123
; Address: $E6CA34
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_123:
    CPY $00              ; C4 00 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    BCC $08              ; 90 08 | Branch if carry clear
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_124
; Address: $E6CA3C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_124:
    JSR $4058            ; 20 58 40 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    BVS $68              ; 70 68 | Branch if overflow set
    LDY #$A0             ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_126
; Address: $E6CA47
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_126:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $18              ; 80 18 | Branch always
    LDA $FABE,Y          ; B9 BE FA | Read graphics status
    LDA ($F9),Y          ; B1 F9 | Read graphics status
    DEC $E9EE            ; CE EE E9 | Decrement (absolute)
    SBC #$A1             ; E9 A1 | Subtract with carry (immediate)
    LDA ($80,X)          ; A1 80 | Read graphics status
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    STA ($01,X)          ; 81 01 | Update graphics data
    ASL $80              ; 06 80 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $10              ; 80 10 | Branch always
    BRA $16              ; 80 16 | Branch always
    LDY #$5E             ; A0 5E | Load immediate value into Y register
    STA ($00,X)          ; 81 00 | Update graphics data
    BRA $0F              ; 80 0F | Branch always
    ORA $0D06,X          ; 1D 06 0D | Logical OR with accumulator (absolute,X)
    AND $0704            ; 2D 04 07 | Logical AND with accumulator (absolute)
    ASL $172D,X          ; 1E 2D 17 | Arithmetic shift left (absolute,X)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    BCS $6F              ; B0 6F | Branch if carry set
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CLV                  ; B8 | Clear overflow flag
    BCC $6F              ; 90 6F | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    STA $5C79,X          ; 9D 79 5C | Update graphics data
    LDY $55B8            ; AC B8 55 | Load from absolute address into Y register
    EOR #$36             ; 49 36 | Exclusive OR with accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA ($09),Y          ; 11 09 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_128
; Address: $E6CAD5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_128:
    JSR $1022            ; 20 22 10 | Jump to subroutine
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA $0D09,Y          ; 19 09 0D | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_129
; Address: $E6CAE2
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_129:
    AND $0E1C            ; 2D 1C 0E | Logical AND with accumulator (absolute)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($81),Y          ; 11 81 | Logical OR with accumulator ((zero page),Y)
    STA ($EB,X)          ; 81 EB | Update graphics data
    XBA                  ; EB | Exchange accumulator bytes
    TXS                  ; 9A | Transfer X register to stack pointer
    DEY                  ; 88 | Decrement Y register
    STA ($7F,X)          ; 81 7F | Update graphics data
    BCC $6F              ; 90 6F | Branch if carry clear
    BRA $7F              ; 80 7F | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    BVS $8F              ; 70 8F | Branch if overflow set
    STY $7BFF            ; 8C FF 7B | Store Y register to absolute address
    STY $54              ; 84 54 | Store Y register to zero page
    CMP $ACAA,X          ; DD AA AC | Compare accumulator (absolute,X)
    LDY $B55B            ; AC 5B B5 | Load from absolute address into Y register
    STA ($97),Y          ; 91 97 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $9F              ; F0 9F | Branch if equal
    EOR $9EB2            ; 4D B2 9E | Exclusive OR with accumulator (absolute)
    SBC ($CD,X)          ; E1 CD | Subtract with carry ((zero page,X))
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDA $6E47,Y          ; B9 47 6E | Read graphics status
    DEY                  ; 88 | Decrement Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    ROL $3E              ; 26 3E | Rotate left (zero page)
    LDA $BEC3,X          ; BD C3 BE | Read graphics status
    CMP ($94,X)          ; C1 94 | Compare accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_12A
; Address: $E6CB48
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_12A:
    LDA ($7F,X)          ; A1 7F | Read graphics status
    ADC $BE83,X          ; 7D 83 BE | Add with carry (absolute,X)
    EOR ($D9,X)          ; 41 D9 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    LDY #$E0             ; A0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    ORA $20E6,Y          ; 19 E6 20 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_12B
; Address: $E6CB92
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_12B:
    RTI                  ; 40 | Return from interrupt
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    LDA                  ; BF 00 3F C0 | Read graphics status
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BCS $20              ; B0 20 | Branch if carry set
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $40              ; 10 40 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    BCS $00              ; B0 00 | Branch if carry set
    ROL $2E0F            ; 2E 0F 2E | Rotate left (absolute)
    ADC $760D            ; 6D 0D 76 | Add with carry (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    ADC $6000,Y          ; 79 00 60 | Add with carry (absolute,Y)
    STA                  ; 9F 97 F0 90 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    BMI $0F              ; 30 0F | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    LSR $C7F1,X          ; 5E F1 C7 | Logical shift right (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    ASL $F90A            ; 0E 0A F9 | Arithmetic shift left (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BRA $A0              ; 80 A0 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_12C
; Address: $E6CC46
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_12C:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    LDY $7E00,X          ; BC 00 7E | Load from absolute,X into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_12D
; Address: $E6CC52
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_12D:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $5600,X          ; FE 00 56 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_12E
; Address: $E6CC61
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_12E:
    ASL $1B              ; 06 1B | Arithmetic shift left (zero page)
    ROL $3B40            ; 2E 40 3B | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    ROL $5F60,X          ; 3E 60 5F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_131
; Address: $E6CC7D
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_131:
    JSR $283F            ; 20 3F 28 | Jump to subroutine
    CPX #$E0             ; E0 E0 | Game work RAM access
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA $F200,X          ; 9D 00 F2 | Update graphics data
    BRA $FE              ; 80 FE | Branch always
    BRA $80              ; 80 80 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    BRA $FD              ; 80 FD | Branch always
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    LDA $4F00,Y          ; B9 00 4F | Read graphics status
    LDA                  ; BF 00 FF 00 | Read graphics status
    DEC $3C00,X          ; DE 00 3C | Decrement (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    BEQ $1C              ; F0 1C | Branch if equal
    BNE $38              ; D0 38 | Branch if not equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE08,X          ; FE 08 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $FC1A,X          ; FE 1A FC | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $1512,X          ; 1D 12 15 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPX #$AA             ; E0 AA | Compare X register (immediate)
    ADC $37D3,X          ; 7D D3 37 | Add with carry (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_132
; Address: $E6CD0A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_132:
    EOR ($63,X)          ; 41 63 | Exclusive OR with accumulator ((zero page,X))
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    STA                  ; 9F FF 94 F7 | Update graphics data
    SBC $E7              ; E5 E7 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_133
; Address: $E6CD20
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_133:
    SBC $F603,X          ; FD 03 F6 | Subtract with carry (absolute,X)
    ORA $B9C6            ; 0D C6 B9 | Logical OR with accumulator (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $18              ; 10 18 | Branch if positive
    STA $FD9FFF          ; 8F FF 9F FD | Update graphics data
    LDA $BD              ; A5 BD | Read graphics status
    STZ $649C            ; 9C 9C 64 | Store zero to absolute
    PEA #$E0A0           ; F4 A0 E0 | Game work RAM access
    BCS $30              ; B0 30 | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    PLX                  ; FA | Pull X register from stack
    ROR $FEDE            ; 6E DE FE | Rotate right (absolute)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FC83,X          ; FD 83 FC | Subtract with carry (absolute,X)
    ADC $BBEF,X          ; 7D EF BB | Add with carry (absolute,X)
    LDA $EF5C,X          ; BD 5C EF | Read graphics status
    ROL $7F49,X          ; 3E 49 7F | Rotate left (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $7F              ; 30 7F | Branch if negative
    BPL $7F              ; 10 7F | Branch if positive
    DEC $7FEA,X          ; DE EA 7F | Decrement (absolute,X)
    INC $7E09,X          ; FE 09 7E | Increment (absolute,X)
    REP #$9C             ; C2 9C | Reset processor status bits
    ROR $FCB0,X          ; 7E B0 FC | Rotate right (absolute,X)
    ROR $FFD6,X          ; 7E D6 FF | Rotate right (absolute,X)
    STA $14FE,Y          ; 99 FE 14 | Update graphics data
    ROL                  ; 2A | Rotate left (accumulator)
    INC $FE2C,X          ; FE 2C FE | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $3CC7,X          ; FE C7 3C | Increment (absolute,X)
    INC $7ECA,X          ; FE CA 7E | Increment (absolute,X)
    LDX $FFEA,Y          ; BE EA FF | Load from absolute,Y into X register
    STA $7E              ; 85 7E | Update graphics data
    STZ $E4FE            ; 9C FE E4 | Store zero to absolute
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FF14,X          ; FE 14 FF | Increment (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_134
; Address: $E6CDC1
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_134:
    SEC                  ; 38 | Set carry flag
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    ROR $98C6,X          ; 7E C6 98 | Rotate right (absolute,X)
    BCS $FC              ; B0 FC | Branch if carry set
    ROR $FFD6,X          ; 7E D6 FF | Rotate right (absolute,X)
    STA $0038,Y          ; 99 38 00 | Update graphics data
    SEC                  ; 38 | Set carry flag
    INC $FED8,X          ; FE D8 FE | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ROR $3967,X          ; 7E 67 39 | Rotate right (absolute,X)
    ADC $7C17,Y          ; 79 17 7C | Add with carry (absolute,Y)
    BPL $3C              ; 10 3C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CPY $02FF            ; CC FF 02 | Compare Y register (absolute)
    BEQ $1C              ; F0 1C | Branch if equal
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPY $D0F3            ; CC F3 D0 | Compare Y register (absolute)
    ASL $63E1,X          ; 1E E1 63 | Arithmetic shift left (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_135
; Address: $E6CE43
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_135:
    RTI                  ; 40 | Return from interrupt
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_136
; Address: $E6CE4B
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_136:
    JSR $9090            ; 20 90 90 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    XBA                  ; EB | Exchange accumulator bytes
    PLB                  ; AB | Pull data bank register from stack
    STX $FCFC            ; 8E FC FC | Store X register to absolute address
    BEQ $F0              ; F0 F0 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    DEX                  ; CA | Decrement X register
    TAX                  ; AA | Transfer accumulator to X register
    ORA $7F7F,X          ; 1D 7F 7F | Logical OR with accumulator (absolute,X)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BVC $10              ; 50 10 | Branch if overflow clear
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCS $50              ; B0 50 | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX $00FC            ; EC FC 00 | Compare X register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_137
; Address: $E6CEC0
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_137:
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    JMP $5873            ; 4C 73 58 | Jump to address
    BMI $5F              ; 30 5F | Branch if negative
    ADC $7926,X          ; 7D 26 79 | Add with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FE              ; 80 FE | Branch always
    BRA $FE              ; 80 FE | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    ROL $143F            ; 2E 3F 14 | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $191E,Y          ; 19 1E 19 | Logical OR with accumulator (absolute,Y)
    ASL $FF80,X          ; 1E 80 FF | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    ROR $7E50,X          ; 7E 50 7E | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_139
; Address: $E6CEFC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_139:
    JSR $203F            ; 20 3F 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ASL $181E,X          ; 1E 1E 18 | Arithmetic shift left (absolute,X)
    ASL $1D1A,X          ; 1E 1A 1D | Arithmetic shift left (absolute,X)
    ORA ($12),Y          ; 11 12 | Logical OR with accumulator ((zero page),Y)
    ORA $1C1E,X          ; 1D 1E 1C | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_13A
; Address: $E6CF10
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_13A:
    JSR $213E            ; 20 3E 21 | PPU graphics register access
    AND $38              ; 25 38 | Logical AND with accumulator (zero page)
    ROL $38              ; 26 38 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_13B
; Address: $E6CF1C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_13B:
    JSR $203F            ; 20 3F 20 | Jump to subroutine
    ROL $1E1D,X          ; 3E 1D 1E | Rotate left (absolute,X)
    ORA $1D1E            ; 0D 1E 1D | Logical OR with accumulator (absolute)
    ASL $1F0D,X          ; 1E 0D 1F | Arithmetic shift left (absolute,X)
    ASL $105F            ; 0E 5F 10 | Arithmetic shift left (absolute)
    SBC $E063,Y          ; F9 63 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_13E
; Address: $E6CF3A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_13E:
    INX                  ; E8 | Increment X register
    STY $3F              ; 84 3F | Store Y register to zero page
    STZ $213F            ; 9C 3F 21 | PPU graphics register access
    LDA ($52,X)          ; A1 52 | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $496A            ; 0D 6A 49 | Logical OR with accumulator (absolute)
    ROL $4D              ; 26 4D | Rotate left (zero page)
    LSR $2E0D,X          ; 5E 0D 2E | Logical shift right (absolute,X)
    DEC $EC3F,X          ; DE 3F EC | Decrement (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_13F
; Address: $E6CF56
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_13F:
    ROR                  ; 6A | Rotate right (accumulator)
    ADC ($B4),Y          ; 71 B4 | Add with carry ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    BCS $EF              ; B0 EF | Branch if carry set
    BVS $5F              ; 70 5F | Branch if overflow set
    ORA $56              ; 05 56 | Logical OR with accumulator (zero page)
    LSR $35              ; 46 35 | Logical shift right (zero page)
    STX $65              ; 86 65 | Store X register to zero page
    STA $96              ; 85 96 | Update graphics data
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ASL $1023            ; 0E 23 10 | Arithmetic shift left (absolute)
    AND #$05             ; 29 05 | Logical AND with accumulator (immediate)
    ORA $0602            ; 0D 02 06 | Logical OR with accumulator (absolute)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ROL $1C01,X          ; 3E 01 1C | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $0F08            ; 0E 08 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    LDA $F3FF            ; AD FF F3 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_141
; Address: $E6CFD3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_141:
    JSR $80FF            ; 20 FF 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BPL $DF              ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_142
; Address: $E6CFDD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_142:
    JSR $807F            ; 20 7F 80 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    LDX $7FFF,Y          ; BE FF 7F | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_143
; Address: $E6CFE8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_143:
    ROR $B78C,X          ; 7E 8C B7 | Rotate right (absolute,X)
    STA $FF800F          ; 8F 0F 80 FF | Update graphics data
    BMI $BF              ; 30 BF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    INC $B721,X          ; FE 21 B7 | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_144
; Address: $E6CFFD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_144:
    JSR $708F            ; 20 8F 70 | Jump to subroutine
    STY $CCFF            ; 8C FF CC | Store Y register to absolute address
    DEC $FF              ; C6 FF | Decrement (zero page)
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_145
; Address: $E6D01B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_145:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    LSR $4EFF            ; 4E FF 4E | Logical shift right (absolute)
    STZ $FF              ; 64 FF | Store zero to zero page
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    BVC $FF              ; 50 FF | Branch if overflow clear
    ADC $00FF            ; 6D FF 00 | Add with carry (absolute)
    INC $B701,X          ; FE 01 B7 | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_146
; Address: $E6D03B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_146:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BRA $FF              ; 80 FF | Branch always
    BMI $FF              ; 30 FF | Branch if negative
    WDM #$FF             ; 42 FF | Reserved instruction
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 40 BF 40 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_147
; Address: $E6D079
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_147:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    LDA                  ; BF 40 FF 00 | Read graphics status
    CPX $FF              ; E4 FF | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    PLA                  ; 68 | Pull accumulator from stack
    LDA $73FF            ; AD FF 73 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_149
; Address: $E6D093
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_149:
    JSR $80FF            ; 20 FF 80 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BPL $DF              ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_14A
; Address: $E6D09D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_14A:
    JSR $807F            ; 20 7F 80 | Jump to subroutine
    STA ($FF,X)          ; 81 FF | Update graphics data
    STA ($BF,X)          ; 81 BF | Update graphics data
    LDA ($7F),Y          ; B1 7F | Read graphics status
    ROR $B78C,X          ; 7E 8C B7 | Rotate right (absolute,X)
    STA $FF800F          ; 8F 0F 80 FF | Update graphics data
    BMI $FF              ; 30 FF | Branch if negative
    BMI $BF              ; 30 BF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_14D
; Address: $E6D0CC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_14D:
    JSR $C114            ; 20 14 C1 | Jump to subroutine
    ADC $00              ; 65 00 | Add with carry (zero page)
    CLC                  ; 18 | Clear carry flag
    ADC $9A              ; 65 9A | Add with carry (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BNE $C8              ; D0 C8 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    STY $C9C4            ; 8C C4 C9 | Store Y register to absolute address
    BEQ $C0              ; F0 C0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BRA $7E              ; 80 7E | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEC $FFFF            ; CE FF FF | Decrement (absolute)
    SBC $FE1D,X          ; FD 1D FE | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_14E
; Address: $E6D107
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_14E:
    JSL $FBCDFF          ; 22 FF CD FB | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    SBC $FE22,X          ; FD 22 FE | Subtract with carry (absolute,X)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    BMI $FB              ; 30 FB | Branch if negative
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    AND $FFFF            ; 2D FF FF | Logical AND with accumulator (absolute)
    LDA                  ; BF A9 BF A0 | Read graphics status
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA                  ; BF 90 FF B3 | Read graphics status
    LDA                  ; BF 40 BF 49 | Read graphics status
    STA                  ; 9F 68 FF 00 | Update graphics data
    LDA                  ; BF 4E FF 04 | Read graphics status
    BPL $0C              ; 10 0C | Branch if positive
    ROL $1C              ; 26 1C | Rotate left (zero page)
    ASL $1E20,X          ; 1E 20 1E | Arithmetic shift left (absolute,X)
    ROL $1C              ; 26 1C | Rotate left (zero page)
    ASL $0E10,X          ; 1E 10 0E | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $2A00,X          ; 1E 00 2A | Arithmetic shift left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    LDX $C831            ; AE 31 C8 | Load from absolute address into X register
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    ASL $3C00,X          ; 1E 00 3C | Arithmetic shift left (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    LDA                  ; BF 00 4E 00 | Read graphics status
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_14F
; Address: $E6D183
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_14F:
    LDA                  ; BF 40 FF 52 | Read graphics status
    WDM #$FF             ; 42 FF | Reserved instruction
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    INC $F701,X          ; FE 01 F7 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    LDX $FF51            ; AE 51 FF | Load from absolute address into X register
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    LDA $7FAE,Y          ; B9 AE 7F | Read graphics status
    ORA $7A92,X          ; 1D 92 7A | Logical OR with accumulator (absolute,X)
    DEC $A85F            ; CE 5F A8 | Decrement (absolute)
    ASL $B2CD,X          ; 1E CD B2 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_150
; Address: $E6D1B0
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_150:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    SBC $9F60,Y          ; F9 60 9F | Subtract with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 80 | Read graphics status
    LSR $E3              ; 46 E3 | Logical shift right (zero page)
    LDY #$67             ; A0 67 | Load immediate value into Y register
    STX $C7              ; 86 C7 | Store X register to zero page
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY $E7              ; A4 E7 | Load from zero page into Y register
    DEC $E7              ; C6 E7 | Decrement (zero page)
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    LDA $5F              ; A5 5F | Read graphics status
    ORA $87              ; 05 87 | Logical OR with accumulator (zero page)
    STA ($67),Y          ; 91 67 | Update graphics data
    LDA $3047,X          ; BD 47 30 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    LDA ($F7),Y          ; B1 F7 | Read graphics status
    LDA                  ; BF 07 20 00 | Read graphics status
    PLA                  ; 68 | Pull accumulator from stack
    STA $369F,X          ; 9D 9F 36 | Update graphics data
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_152
; Address: $E6D228
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_152:
    JSR $DAFF            ; 20 FF DA | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    PHB                  ; 8B | Push data bank register to stack
    STZ $00              ; 64 00 | Store zero to zero page
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_154
; Address: $E6D24B
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_154:
    JSR $2060            ; 20 60 20 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    STA $66FF,X          ; 9D FF 66 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    BRA $E4              ; 80 E4 | Branch always
    BRA $34              ; 80 34 | Branch always
    BNE $4F              ; D0 4F | Branch if not equal
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BCS $53              ; B0 53 | Branch if carry set
    BCS $43              ; B0 43 | Branch if carry set
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    AND $F30F,Y          ; 39 0F F3 | Logical AND with accumulator (absolute,Y)
    ORA $C3C5            ; 0D C5 C3 | Logical OR with accumulator (absolute)
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_155
; Address: $E6D290
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_155:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    LDA ($F7),Y          ; B1 F7 | Read graphics status
    LDA                  ; BF 07 20 00 | Read graphics status
    BRA $7F              ; 80 7F | Branch always
    DEX                  ; CA | Decrement X register
    NOP                  ; EA | No operation
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    ADC $9B00,X          ; 7D 00 9B | Add with carry (absolute,X)
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    INC $D8D1,X          ; FE D1 D8 | Increment (absolute,X)
    LDX $3588            ; AE 88 35 | Load from absolute address into X register
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $1000,X          ; FE 00 10 | Increment (absolute,X)
    BEQ $77              ; F0 77 | Branch if equal
    XBA                  ; EB | Exchange accumulator bytes
    CPX $DC04            ; EC 04 DC | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_156
; Address: $E6D2E8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_156:
    BNE $F1              ; D0 F1 | Branch if not equal
    PLP                  ; 28 | Pull processor status from stack
    TAX                  ; AA | Transfer accumulator to X register
    ASL $CA48,X          ; 1E 48 CA | Arithmetic shift left (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $FF              ; 10 FF | Branch if positive
    ASL $55FF            ; 0E FF 55 | Arithmetic shift left (absolute)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    LDY $74              ; A4 74 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_157
; Address: $E6D308
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_157:
    JSR $6821            ; 20 21 68 | Jump to subroutine
    ROR                  ; 6A | Rotate right (accumulator)
    PHB                  ; 8B | Push data bank register to stack
    NOP                  ; EA | No operation
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    DEC $95FF,X          ; DE FF 95 | Decrement (absolute,X)
    STA $92FF,X          ; 9D FF 92 | Update graphics data
    TXS                  ; 9A | Transfer X register to stack pointer
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA #$39             ; 09 39 | Logical OR with accumulator (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ADC $FF              ; 65 FF | Add with carry (zero page)
    PHY                  ; 5A | Push Y register to stack
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_158
; Address: $E6D335
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_158:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SBC $FFA0,Y          ; F9 A0 FF | Subtract with carry (absolute,Y)
    REP #$B2             ; C2 B2 | Reset processor status bits
    BRA $F0              ; 80 F0 | Branch always
    BNE $A0              ; D0 A0 | Branch if not equal
    BVS $70              ; 70 70 | Branch if overflow set
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_159
; Address: $E6D34C
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_159:
    PHB                  ; 8B | Push data bank register to stack
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_15A
; Address: $E6D350
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_15A:
    ORA $0AFF            ; 0D FF 0A | Logical OR with accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_15B
; Address: $E6D356
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_15B:
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SBC $FF94,Y          ; F9 94 FF | Subtract with carry (absolute,Y)
    STA                  ; 9F FF 20 20 | Update graphics data
    ADC $387D,X          ; 7D 7D 38 | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    BMI $08              ; 30 08 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $3882,X          ; 7D 82 38 | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STX $FF              ; 86 FF | Store X register to zero page
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    INC $C4EE            ; EE EE C4 | Increment (absolute)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    SBC $62A4,X          ; FD A4 62 | Subtract with carry (absolute,X)
    WDM #$FD             ; 42 FD | Reserved instruction
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $EE              ; 45 EE | Exclusive OR with accumulator (zero page)
    ORA ($C4),Y          ; 11 C4 | Logical OR with accumulator ((zero page),Y)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $CF              ; 30 CF | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_15C
; Address: $E6D3B8
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_15C:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BRA $80              ; 80 80 | Branch always
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    BRA $7F              ; 80 7F | Branch always
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    STY $20              ; 84 20 | Store Y register to zero page
    BPL $F1              ; 10 F1 | Branch if positive
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    AND $3DD7,Y          ; 39 D7 3D | Logical AND with accumulator (absolute,Y)
    AND $FF00,X          ; 3D 00 FF | Logical AND with accumulator (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_15E
; Address: $E6D422
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_15E:
    JSR $F6FF            ; 20 FF F6 | Jump to subroutine
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $06              ; C5 06 | Compare accumulator (zero page)
    SBC ($6C),Y          ; F1 6C | Subtract with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ASL $1719            ; 0E 19 17 | Arithmetic shift left (absolute)
    EOR ($93,X)          ; 41 93 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_15F
; Address: $E6D44E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_15F:
    JSL $1FE065          ; 22 65 E0 1F | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $1F77            ; 0E 77 1F | Arithmetic shift left (absolute)
    ORA $D31F,Y          ; 19 1F D3 | Logical OR with accumulator (absolute,Y)
    ROR $67              ; 66 67 | Rotate right (zero page)
    DEC $13C3            ; CE C3 13 | Decrement (absolute)
    ORA $962B,X          ; 1D 2B 96 | Logical OR with accumulator (absolute,X)
    AND $0958,X          ; 3D 58 09 | Logical AND with accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    EOR $7EEF,Y          ; 59 EF 7E | Exclusive OR with accumulator (absolute,Y)
    PEA #$F708           ; F4 08 F7 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_160
; Address: $E6D476
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_160:
    BCS $4F              ; B0 4F | Branch if carry set
    BMI $CD              ; 30 CD | Branch if negative
    SBC $B940,Y          ; F9 40 B9 | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_161
; Address: $E6D47F
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_161:
    STA                  ; 9F 38 38 38 | Update graphics data
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_162
; Address: $E6D4C8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_162:
    TSX                  ; BA | Transfer stack pointer to X register
    LDA #$99             ; A9 99 | Read graphics status
    CMP $6666            ; CD 66 66 | Compare accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_163
; Address: $E6D4DC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_163:
    JSL $FF99FF          ; 22 FF 99 FF | Jump to subroutine long
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    SEP #$E2             ; E2 E2 | Set processor status bits
    PLA                  ; 68 | Pull accumulator from stack
    LDA $300555          ; AF 55 05 30 | Read graphics status
    BMI $E4              ; 30 E4 | Branch if negative
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_164
; Address: $E6D4F9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_164:
    STA                  ; 9F 00 FF AA | Update graphics data
    SEC                  ; 38 | Set carry flag
    LSR $83FD            ; 4E FD 83 | Logical shift right (absolute)
    SBC $BB6F,X          ; FD 6F BB | Subtract with carry (absolute,X)
    LDA $EF5C,X          ; BD 5C EF | Read graphics status
    ROL $7EC9,X          ; 3E C9 7E | Rotate left (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    BMI $FF              ; 30 FF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_165
; Address: $E6D521
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_165:
    JSR $42BE            ; 20 BE 42 | Hardware register operation
    ROR $7E81,X          ; 7E 81 7E | Rotate right (absolute,X)
    STZ $B07E            ; 9C 7E B0 | Store zero to absolute
    INC $D77C,X          ; FE 7C D7 | Increment (absolute,X)
    INC $3C99,X          ; FE 99 3C | Increment (absolute,X)
    INC $FF28,X          ; FE 28 FF | Increment (absolute,X)
    BIT $00FE            ; 2C FE 00 | Test bits in accumulator (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDX $D9E7,Y          ; BE E7 D9 | Load from absolute,Y into X register
    LDA $28906F          ; AF 6F 90 28 | Read graphics status
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 3F F2 72 | Read graphics status
    CLV                  ; B8 | Clear overflow flag
    AND ($7E),Y          ; 31 7E | Logical AND with accumulator ((zero page),Y)
    CPY #$72             ; C0 72 | Compare Y register (immediate)
    STA $807F            ; 8D 7F 80 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_166
; Address: $E6D57E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_166:
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    PLA                  ; 68 | Pull accumulator from stack
    CPY $7065            ; CC 65 70 | Compare Y register (absolute)
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)
    AND $79D5,Y          ; 39 D5 79 | Logical AND with accumulator (absolute,Y)
    STA ($39),Y          ; 91 39 | Update graphics data
    ORA $FF00,Y          ; 19 00 FF | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 40 | Read graphics status
    LDA                  ; BF 00 FF 00 | Read graphics status
    CMP ($3D,X)          ; C1 3D | Compare accumulator ((zero page,X))
    JMP ($5F81)          ; 6C 81 5F | Jump to address (absolute indirect)
    STX $8E54            ; 8E 54 8E | Store X register to absolute address
    TXS                  ; 9A | Transfer X register to stack pointer
    RTI                  ; 40 | Return from interrupt
    STX $0750            ; 8E 50 07 | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag
    DEX                  ; CA | Decrement X register
    STZ $9B              ; 64 9B | Store zero to zero page
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 3E | Read graphics status
    ORA $8C              ; 05 8C | Logical OR with accumulator (zero page)
    STA $E9EA            ; 8D EA E9 | Update graphics data
    SBC $0114,Y          ; F9 14 01 | Subtract with carry (absolute,Y)
    CPX $E1              ; E4 E1 | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC $FD02,Y          ; F9 02 FD | Subtract with carry (absolute,Y)
    STY $E873            ; 8C 73 E8 | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CMP $E669            ; CD 69 E6 | Compare accumulator (absolute)
    AND ($F0),Y          ; 31 F0 | Logical AND with accumulator ((zero page),Y)
    JMP $BF2BFC          ; 5C FC 2B BF | Jump to address long
    ROR $02AC            ; 6E AC 02 | Rotate right (absolute)
    BRA $4C              ; 80 4C | Branch always
    CPY $BF40            ; CC 40 BF | Compare Y register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_167
; Address: $E6D5F3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_167:
    STA                  ; 9F 70 8F 7C | Update graphics data
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    JMP $00B3            ; 4C B3 00 | Jump to address
    BIT $8A38            ; 2C 38 8A | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    TAX                  ; AA | Transfer accumulator to X register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_168
; Address: $E6D61C
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_168:
    SEC                  ; 38 | Set carry flag
    DEC $38              ; C6 38 | Decrement (zero page)
    DEC $DF              ; C6 DF | Decrement (zero page)
    ADC ($F5,X)          ; 61 F5 | Add with carry ((zero page,X))
    EOR ($E1,X)          ; 41 E1 | Exclusive OR with accumulator ((zero page,X))
    EOR ($F1,X)          ; 41 F1 | Exclusive OR with accumulator ((zero page,X))
    EOR ($C1,X)          ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
    EOR ($A1,X)          ; 41 A1 | Exclusive OR with accumulator ((zero page,X))
    ORA ($ED,X)          ; 01 ED | Logical OR with accumulator ((zero page,X))
    EOR ($A1,X)          ; 41 A1 | Exclusive OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 00 FF 40 | Read graphics status
    LDA                  ; BF 00 FF BB | Read graphics status
    SEC                  ; 38 | Set carry flag
    SBC ($8E,X)          ; E1 8E | Subtract with carry ((zero page,X))
    STY $C041            ; 8C 41 C0 | Store Y register to absolute address
    AND $FE              ; 25 FE | Logical AND with accumulator (zero page)
    SBC $D180            ; ED 80 D1 | Subtract with carry (absolute)
    BRA $38              ; 80 38 | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    INC $8001,X          ; FE 01 80 | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    STA ($21,X)          ; 81 21 | PPU graphics register access
    ORA $4083,X          ; 1D 83 40 | Logical OR with accumulator (absolute,X)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    REP #$43             ; C2 43 | Reset processor status bits
    STZ $CC21,X          ; 9E 21 CC | Store zero to absolute,X
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 7E 81 42 | Read graphics status
    LDA $FF00,X          ; BD 00 FF | Read graphics status
    BIT $6F10            ; 2C 10 6F | Test bits in accumulator (absolute)
    BMI $6C              ; 30 6C | Branch if negative
    AND $2067,Y          ; 39 67 20 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_169
; Address: $E6D692
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_169:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    STA ($0E),Y          ; 91 0E | Update graphics data
    BRA $80              ; 80 80 | Branch always
    BVC $D0              ; 50 D0 | Branch if overflow clear
    WDM #$C2             ; 42 C2 | Reserved instruction
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_16B
; Address: $E6D6AA
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_16B:
    JSR $C030            ; 20 30 C0 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BIT $3C03            ; 2C 03 3C | Test bits in accumulator (absolute)
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    AND $4DA2            ; 2D A2 4D | Logical AND with accumulator (absolute)
    WDM #$8D             ; 42 8D | Reserved instruction
    ORA $8D72            ; 0D 72 8D | Logical OR with accumulator (absolute)
    ROR $629F,X          ; 7E 9F 62 | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $CBF0,X          ; 1E F0 CB | Arithmetic shift left (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $3C              ; 80 3C | Branch always
    ROR $99              ; 66 99 | Rotate right (zero page)
    STA $D728,X          ; 9D 28 D7 | Update graphics data
    SBC $3BC0            ; ED C0 3B | Subtract with carry (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $31              ; 80 31 | Branch always
    EOR $77              ; 45 77 | Exclusive OR with accumulator (zero page)
    SBC #$26             ; E9 26 | Subtract with carry (immediate)
    EOR $F944,X          ; 5D 44 F9 | Exclusive OR with accumulator (absolute,X)
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    XBA                  ; EB | Exchange accumulator bytes
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 04 4B 01 | Read graphics status
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($E9,X)          ; 01 E9 | Logical OR with accumulator ((zero page,X))
    BRA $21              ; 80 21 | PPU graphics register access
    INC $3DA3,X          ; FE A3 3D | Increment (absolute,X)
    LDA $FD7D,X          ; BD 7D FD | Read graphics status
    EOR ($AD,X)          ; 41 AD | Exclusive OR with accumulator ((zero page,X))
    ORA ($8D),Y          ; 11 8D | Logical OR with accumulator ((zero page),Y)
    AND ($9D),Y          ; 31 9D | Logical AND with accumulator ((zero page),Y)
    AND ($80,X)          ; 21 80 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Read graphics status
    SBC ($4F),Y          ; F1 4F | Subtract with carry ((zero page),Y)
    SBC $FF67,Y          ; F9 67 FF | Subtract with carry (absolute,Y)
    INC $FE21,X          ; FE 21 FE | Increment (absolute,X)
    BVC $FF              ; 50 FF | Branch if overflow clear
    ADC $00FF            ; 6D FF 00 | Add with carry (absolute)
    INC $B701,X          ; FE 01 B7 | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_16F
; Address: $E6D748
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_16F:
    BPL $1F              ; 10 1F | Branch if positive
    ADC $3B54,X          ; 7D 54 3B | Add with carry (absolute,X)
    AND $009F,X          ; 3D 9F 00 | Logical AND with accumulator (absolute,X)
    STA $9E00,X          ; 9D 00 9E | Update graphics data
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_170
; Address: $E6D759
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_170:
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $E0FE,X          ; FE FE E0 | Game work RAM access
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BNE $A4              ; D0 A4 | Branch if not equal
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA $0D52            ; 0D 52 0D | Logical OR with accumulator (absolute)
    ORA $0D22            ; 0D 22 0D | Logical OR with accumulator (absolute)
    ROR $66              ; 66 66 | Rotate right (zero page)
    ROR $666E            ; 6E 6E 66 | Rotate right (absolute)
    ROR $66              ; 66 66 | Rotate right (zero page)
    ROR $26              ; 66 26 | Rotate right (zero page)
    ROL $56              ; 26 56 | Rotate left (zero page)
    STA $88F7,Y          ; 99 F7 88 | Update graphics data
    BCC $6E              ; 90 6E | Branch if carry clear
    STA ($66),Y          ; 91 66 | Update graphics data
    STA $9966,Y          ; 99 66 99 | Update graphics data
    ROL $D9              ; 26 D9 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_171
; Address: $E6D7A0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_171:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BMI $70              ; 30 70 | Branch if negative
    BVS $38              ; 70 38 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BMI $30              ; 30 30 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    BVS $50              ; 70 50 | Branch if overflow set
    BEQ $CC              ; F0 CC | Branch if equal
    BVS $8F              ; 70 8F | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    CMP $CE31            ; CD 31 CE | Compare accumulator (absolute)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    AND $3877,X          ; 3D 77 38 | Logical AND with accumulator (absolute,X)
    ADC $3C53,Y          ; 79 53 3C | Add with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BEQ $BF              ; F0 BF | Branch if equal
    LDA                  ; BF 37 77 80 | Read graphics status
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_172
; Address: $E6D7D4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_172:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_173
; Address: $E6D7E3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_173:
    CPX #$52             ; E0 52 | Compare X register (immediate)
    BNE $D0              ; D0 D0 | Branch if not equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_174
; Address: $E6D7EA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_174:
    JSR $F2E0            ; 20 E0 F2 | Jump to subroutine
    DEC $32CE            ; CE CE 32 | Decrement (absolute)
    ORA $0D12            ; 0D 12 0D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_175
; Address: $E6D7F4
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_175:
    JSR $220D            ; 20 0D 22 | Jump to subroutine
    ORA $0D32            ; 0D 32 0D | Logical OR with accumulator (absolute)
    ORA $010C            ; 0D 0C 01 | Logical OR with accumulator (absolute)
    BMI $01              ; 30 01 | Branch if negative
    BVS $77              ; 70 77 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    SBC $E4F6            ; ED F6 E4 | Subtract with carry (absolute)
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    BVS $8F              ; 70 8F | Branch if overflow set
    SBC $E412            ; ED 12 E4 | Subtract with carry (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    LDA ($F1),Y          ; B1 F1 | Read graphics status
    BMI $F0              ; 30 F0 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STA ($81,X)          ; 81 81 | Update graphics data
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    STA ($7E,X)          ; 81 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_176
; Address: $E6D858
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_176:
    DEY                  ; 88 | Decrement Y register
    REP #$3F             ; C2 3F | Reset processor status bits
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    BPL $7F              ; 10 7F | Branch if positive
    PLY                  ; 7A | Pull Y register from stack
    SEI                  ; 78 | Set interrupt disable flag
    SBC $78B7,Y          ; F9 B7 78 | Subtract with carry (absolute,Y)
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$B0             ; E0 B0 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$32             ; E0 32 | Compare X register (immediate)
    ORA $0758            ; 0D 58 07 | Logical OR with accumulator (absolute)
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STA $00008F          ; 8F 8F 00 00 | Update graphics data
    BVS $00              ; 70 00 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    JMP $5C7C            ; 4C 7C 5C | Jump to address
    JMP ($7E46)          ; 6C 46 7E | Jump to address (absolute indirect)
    LSR $1B07            ; 4E 07 1B | Logical shift right (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ADC $7D22,X          ; 7D 22 7D | Add with carry (absolute,X)
    EOR ($5E,X)          ; 41 5E | Exclusive OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $306E            ; 6E 6E 30 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_177
; Address: $E6D905
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_177:
    BMI $18              ; 30 18 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    ROR $3091            ; 6E 91 30 | Rotate right (absolute)
    CLC                  ; 18 | Clear carry flag
    BEQ $03              ; F0 03 | Branch if equal
    BCC $7F              ; 90 7F | Branch if carry clear
    BIT $6F10            ; 2C 10 6F | Test bits in accumulator (absolute)
    BMI $6C              ; 30 6C | Branch if negative
    AND $2067,Y          ; 39 67 20 | Logical AND with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_178
; Address: $E6D930
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_178:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    STA ($0E),Y          ; 91 0E | Update graphics data
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    BVC $D0              ; 50 D0 | Branch if overflow clear
    WDM #$C2             ; 42 C2 | Reserved instruction
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_179
; Address: $E6D94A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_179:
    JSR $C030            ; 20 30 C0 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    WDM #$05             ; 42 05 | Reserved instruction
    BIT $3C03            ; 2C 03 3C | Test bits in accumulator (absolute)
    ORA ($52,X)          ; 01 52 | Logical OR with accumulator ((zero page,X))
    AND $4DA2            ; 2D A2 4D | Logical AND with accumulator (absolute)
    WDM #$8D             ; 42 8D | Reserved instruction
    ORA $8D72            ; 0D 72 8D | Logical OR with accumulator (absolute)
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    CPX $1B              ; E4 1B | Compare X register (zero page)
    BIT $64              ; 24 64 | Test bits in accumulator (zero page)
    ASL $3B0E            ; 0E 0E 3B | Arithmetic shift left (absolute)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    INC $9B              ; E6 9B | Increment (zero page)
    BVC $AF              ; 50 AF | Branch if overflow clear
    DEY                  ; 88 | Decrement Y register
    LDA $00FF,Y          ; B9 FF 00 | Read graphics status
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_17A
; Address: $E6D9C0
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_17A:
    LDA $31              ; A5 31 | Read graphics status
    WDM #$73             ; 42 73 | Reserved instruction
    SBC ($74),Y          ; F1 74 | Subtract with carry ((zero page),Y)
    JMP $FDA87F          ; 5C 7F A8 FD | Jump to address long
    EOR ($D6),Y          ; 51 D6 | Exclusive OR with accumulator ((zero page),Y)
    STX $DE8F            ; 8E 8F DE | Store X register to absolute address
    LDY $0E00            ; AC 00 0E | Load from absolute address into Y register
    STA ($00,X)          ; 81 00 | Update graphics data
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BNE $D4              ; D0 D4 | Branch if not equal
    BVC $56              ; 50 56 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    EOR $82              ; 45 82 | Exclusive OR with accumulator (zero page)
    EOR $40              ; 45 40 | Exclusive OR with accumulator (zero page)
    EOR $08              ; 45 08 | Exclusive OR with accumulator (zero page)
    EOR $F800            ; 4D 00 F8 | Exclusive OR with accumulator (absolute)
    BNE $2C              ; D0 2C | Branch if not equal
    BVC $AE              ; 50 AE | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 40 | Read graphics status
    LDA                  ; BF 48 B7 00 | Read graphics status
    PLP                  ; 28 | Pull processor status from stack
    INC $FC57,X          ; FE 57 FC | Increment (absolute,X)
    INC $F77F,X          ; FE 7F F7 | Increment (absolute,X)
    LDA                  ; BF 40 BF 40 | Read graphics status

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_17B
; Address: $E6DA19
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_17B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    LDA                  ; BF 40 FF 00 | Read graphics status
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    JMP ($DBBC)          ; 6C BC DB | Jump to address (absolute indirect)
    LDA $1D7B26          ; AF 26 7B 1D | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $0702,X          ; 1E 02 07 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 37 CF 0D | Read graphics status
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_17D
; Address: $E6DA60
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_17D:
    JSR $2160            ; 20 60 21 | PPU graphics register access
    ADC ($A4,X)          ; 61 A4 | Add with carry ((zero page,X))
    CPX $E0              ; E4 E0 | Game work RAM access
    STA                  ; 9F 40 40 41 | Update graphics data
    EOR ($49,X)          ; 41 49 | Exclusive OR with accumulator ((zero page,X))
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 00 BE 00 | Read graphics status
    ADC $2006,Y          ; 79 06 20 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_17E
; Address: $E6DA81
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_17E:
    JSR $6262            ; 20 62 62 | Jump to subroutine
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    ORA $0994            ; 0D 94 09 | Logical OR with accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    ASL $0F0F,X          ; 1E 0F 0F | Arithmetic shift left (absolute,X)
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    INC $89FF,X          ; FE FF 89 | Increment (absolute,X)
    LDA $A5              ; A5 A5 | Read graphics status
    BPL $E0              ; 10 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    PHY                  ; 5A | Push Y register to stack
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    BVC $50              ; 50 50 | Branch if overflow clear
    STA                  ; 9F FF E4 9B | Update graphics data
    AND $426D            ; 2D 6D 42 | Hardware register operation
    WDM #$00             ; 42 00 | Reserved instruction
    LDA ($0E,X)          ; A1 0E | Read graphics status
    LDA $4600,X          ; BD 00 46 | Read graphics status
    LDA $8748,Y          ; B9 48 87 | Read graphics status
    BRA $40              ; 80 40 | Branch always
    BRA $7A              ; 80 7A | Branch always
    TSX                  ; BA | Transfer stack pointer to X register
    PLY                  ; 7A | Pull Y register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    WDM #$80             ; 42 80 | Reserved instruction
    STA ($37,X)          ; 81 37 | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_17F
; Address: $E6DAF1
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_17F:
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDA ($27,X)          ; A1 27 | Read graphics status
    BPL $D3              ; 10 D3 | Branch if positive
    CPY $17              ; C4 17 | Compare Y register (zero page)
    SBC ($CD,X)          ; E1 CD | Subtract with carry ((zero page,X))
    ROL $472C,X          ; 3E 2C 47 | Rotate left (absolute,X)
    EOR $D8              ; 45 D8 | Exclusive OR with accumulator (zero page)
    AND $E800            ; 2D 00 E8 | Logical AND with accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    BPL $0D              ; 10 0D | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_180
; Address: $E6DB42
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_180:
    JSR $281B            ; 20 1B 28 | Jump to subroutine
    ORA $7FAA,X          ; 1D AA 7F | Logical OR with accumulator (absolute,X)
    BEQ $78              ; F0 78 | Branch if equal
    ASL $308C,X          ; 1E 8C 30 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_182
; Address: $E6DB55
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_182:
    JSL $78906F          ; 22 6F 90 78 | Jump to subroutine long
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_183
; Address: $E6DB63
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_183:
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCC $E0              ; 90 E0 | Game work RAM access
    BMI $E0              ; 30 E0 | Game work RAM access
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    CPY $DE5C            ; CC 5C DE | Compare Y register (absolute)
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_184
; Address: $E6DB73
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_184:
    JSR $A040            ; 20 40 A0 | Jump to subroutine
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_185
; Address: $E6DB7F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_185:
    JSL $010003          ; 22 03 00 01 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3B3A            ; 0E 3A 3B | Arithmetic shift left (absolute)
    LDA $6C2D,X          ; BD 2D 6C | Read graphics status
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_186
; Address: $E6DBB0
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_186:
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    ROR $1F00,X          ; 7E 00 1F | Rotate right (absolute,X)
    AND ($0A),Y          ; 31 0A | Logical AND with accumulator ((zero page),Y)
    STZ $69              ; 64 69 | Store zero to zero page
    STA ($2D),Y          ; 91 2D | Update graphics data
    STA $8730,X          ; 9D 30 87 | Update graphics data
    DEC                  ; 3A | Decrement accumulator
    BRA $7F              ; 80 7F | Branch always
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    LDY $BC              ; A4 BC | Load from zero page into Y register
    DEX                  ; CA | Decrement X register
    CLV                  ; B8 | Clear overflow flag
    INC $F40B            ; EE 0B F4 | Increment (absolute)
    INC                  ; 1A | Increment accumulator
    STA $0160            ; 8D 60 01 | Update graphics data
    SBC $FEF0,X          ; FD F0 FE | Subtract with carry (absolute,X)
    LDY $B842,X          ; BC 42 B8 | Load from absolute,X into Y register
    LSR $08              ; 46 08 | Logical shift right (zero page)
    BVS $8F              ; 70 8F | Branch if overflow set
    INC $CC2C,X          ; FE 2C CC | Increment (absolute,X)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    LDA ($C0,X)          ; A1 C0 | Read graphics status
    STY $82EC            ; 8C EC 82 | Store Y register to absolute address
    SBC $AEC9            ; ED C9 AE | Subtract with carry (absolute)
    JMP $0CA0            ; 4C A0 0C | Jump to address
    ORA $1526,Y          ; 19 26 15 | Logical OR with accumulator (absolute,Y)
    ADC #$09             ; 69 09 | Add with carry (immediate)
    ADC ($83),Y          ; 71 83 | Add with carry ((zero page),Y)
    ASL $19EF            ; 0E EF 19 | Arithmetic shift left (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    BCS $6F              ; B0 6F | Branch if carry set
    ROL                  ; 2A | Rotate left (accumulator)
    BRA $00              ; 80 00 | Branch always
    STA                  ; 9F FF 90 13 | Update graphics data
    BIT $5847            ; 2C 47 58 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_188
; Address: $E6DC7C
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_188:
    JSR $40DF            ; 20 DF 40 | Jump to subroutine
    LDA                  ; BF A8 5F F1 | Read graphics status
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    BNE $10              ; D0 10 | Branch if not equal
    INC $16              ; E6 16 | Increment (zero page)
    SBC $0001,X          ; FD 01 00 | Subtract with carry (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    BPL $EF              ; 10 EF | Branch if positive
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    BRA $BA              ; 80 BA | Branch always
    BRA $D2              ; 80 D2 | Branch always
    LDA ($A5),Y          ; B1 A5 | Read graphics status
    LDA $FF00FF          ; AF FF 00 FF | Read graphics status
    ADC $BB00            ; 6D 00 BB | Add with carry (absolute)
    PHY                  ; 5A | Push Y register to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    ADC $E148,X          ; 7D 48 E1 | Add with carry (absolute,X)
    CPY $5895            ; CC 95 58 | Compare Y register (absolute)
    PLY                  ; 7A | Pull Y register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    LDA $AD00            ; AD 00 AD | Read graphics status
    WDM #$42             ; 42 42 | Hardware register operation
    ORA $7119,Y          ; 19 19 71 | Logical OR with accumulator (absolute,Y)
    ADC ($46),Y          ; 71 46 | Add with carry ((zero page),Y)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    CPY $BD00            ; CC 00 BD | Compare Y register (absolute)
    LDA #$00             ; A9 00 | Read graphics status
    INC $00              ; E6 00 | Increment (zero page)
    STX $B900            ; 8E 00 B9 | Store X register to absolute address
    JMP $B57F            ; 4C 7F B5 | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    ROR $5F5B,X          ; 7E 5B 5F | Rotate right (absolute,X)
    ROR $7F              ; 66 7F | Rotate right (zero page)
    STX $A9FF            ; 8E FF A9 | Store X register to absolute address
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    STA ($00,X)          ; 81 00 | Update graphics data
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BRA $3F              ; 80 3F | Branch always
    STA                  ; 9F 30 90 0F | Update graphics data
    LDA $BFD846          ; AF 46 D8 BF | Read graphics status
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_189
; Address: $E6DD34
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_189:
    BRA $7F              ; 80 7F | Branch always
    STA                  ; 9F 60 90 6F | Update graphics data
    STA $3FC070          ; 8F 70 C0 3F | Update graphics data
    LDY #$F4             ; A0 F4 | Load immediate value into Y register
    ORA $0B              ; 05 0B | Logical OR with accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    NOP                  ; EA | No operation
    ORA $E8              ; 05 E8 | Logical OR with accumulator (zero page)
    SBC $5FA0            ; ED A0 5F | Subtract with carry (absolute)
    SBC $1DE2,X          ; FD E2 1D | Subtract with carry (absolute,X)
    SBC $1DE2            ; ED E2 1D | Subtract with carry (absolute)
    CPX $4613            ; EC 13 46 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_18A
; Address: $E6DD64
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_18A:
    JSR $8120            ; 20 20 81 | Jump to subroutine
    BRA $B5              ; 80 B5 | Branch always
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    CMP $7FB2            ; CD B2 7F | Compare accumulator (absolute)
    BRA $B4              ; 80 B4 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_18B
; Address: $E6DD74
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_18B:
    JSR $80DF            ; 20 DF 80 | Jump to subroutine
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    SBC $A1B6,Y          ; F9 B6 A1 | Subtract with carry (absolute,Y)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    STY $30              ; 84 30 | Store Y register to zero page
    STY $8730            ; 8C 30 87 | Store Y register to absolute address
    CLV                  ; B8 | Clear overflow flag
    BVC $C4              ; 50 C4 | Branch if overflow clear
    CMP ($45,X)          ; C1 45 | Compare accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear
    BRA $7F              ; 80 7F | Branch always
    SEC                  ; 38 | Set carry flag
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 7B 08 7D | Read graphics status
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY $81D8            ; CC D8 81 | Compare Y register (absolute)
    STA $CAD2,Y          ; 99 D2 CA | Update graphics data
    BNE $C9              ; D0 C9 | Branch if not equal
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STA ($7E,X)          ; 81 7E | Update graphics data
    REP #$3D             ; C2 3D | Reset processor status bits
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    STA                  ; 9F AA EA D7 | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_18C
; Address: $E6DDE8
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_18C:
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC #$BC             ; E9 BC | Subtract with carry (immediate)
    LDA                  ; BF 44 44 FF | Read graphics status
    STX $FF              ; 86 FF | Store X register to zero page
    LDA                  ; BF FF D6 FF | Read graphics status
    STA                  ; 9F FF B2 FF | Update graphics data
    WDM #$FD             ; 42 FD | Reserved instruction
    AND $313B,Y          ; 39 3B 31 | Logical AND with accumulator (absolute,Y)
    SBC #$EB             ; E9 EB | Subtract with carry (immediate)
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    INC $7CFF,X          ; FE FF 7C | Increment (absolute,X)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    BVC $14              ; 50 14 | Branch if overflow clear
    JMP ($6824)          ; 6C 24 68 | Jump to address (absolute indirect)
    BIT $62              ; 24 62 | Test bits in accumulator (zero page)
    ROL $44              ; 26 44 | Rotate left (zero page)
    BIT $C8              ; 24 C8 | Test bits in accumulator (zero page)
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_18D
; Address: $E6DE34
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_18D:
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    ROL $59              ; 26 59 | Rotate left (zero page)
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CPX $2032            ; EC 32 20 | Compare X register (absolute)
    LDY $66              ; A4 66 | Load from zero page into Y register
    STZ $34              ; 64 34 | Store zero to zero page
    ROL $94              ; 26 94 | Rotate left (zero page)
    LDX $85              ; A6 85 | Load from zero page into X register
    LDX $35              ; A6 35 | Load from zero page into X register
    ROL $E0              ; 26 E0 | Game work RAM access
    ASL $DE20,X          ; 1E 20 DE | Arithmetic shift left (absolute,X)
    LDY $5A              ; A4 5A | Load from zero page into Y register
    STZ $9A              ; 64 9A | Store zero to zero page
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    LDY $5A              ; A4 5A | Load from zero page into Y register
    LDY $5B              ; A4 5B | Load from zero page into Y register
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BMI $20              ; 30 20 | Branch if negative
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_18E
; Address: $E6DE83
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_18E:
    ROL $4E              ; 26 4E | Rotate left (zero page)
    EOR #$07             ; 49 07 | Exclusive OR with accumulator (immediate)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    INC $0000            ; EE 00 00 | Increment (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BIT $3734            ; 2C 34 37 | Test bits in accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $4A4F,Y          ; 19 4F 4A | Logical OR with accumulator (absolute,Y)
    INC $EDBB,X          ; FE BB ED | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_18F
; Address: $E6DED6
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_18F:
    JSL $001500          ; 22 00 15 00 | Jump to subroutine long
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    ADC ($9A,X)          ; 61 9A | Add with carry ((zero page,X))
    ADC ($9F),Y          ; 71 9F | Add with carry ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    CMP $5BF8            ; CD F8 5B | Compare accumulator (absolute)
    LDY $FE              ; A4 FE | Load from zero page into Y register
    WDM #$05             ; 42 05 | Reserved instruction
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SBC #$DF             ; E9 DF | Subtract with carry (immediate)
    INX                  ; E8 | Increment X register
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA #$6E             ; 09 6E | Logical OR with accumulator (immediate)
    STZ $97              ; 64 97 | Store zero to zero page
    BNE $00              ; D0 00 | Branch if not equal
    BPL $00              ; 10 00 | Branch if positive
    STA ($00,X)          ; 81 00 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_190
; Address: $E6DF1A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_190:
    BCC $00              ; 90 00 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_191
; Address: $E6DF2B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_191:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $48              ; 80 48 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_192
; Address: $E6DF38
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_192:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ADC ($38,X)          ; 61 38 | Add with carry ((zero page,X))
    ORA $0425,Y          ; 19 25 04 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA #$C5             ; 09 C5 | Logical OR with accumulator (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    BCC $00              ; 90 00 | Branch if carry clear
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $6000            ; 0D 00 60 | Logical OR with accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $1D00            ; 4C 00 1D | Jump to address
    LDA ($DA,X)          ; A1 DA | Read graphics status
    LDX $9F              ; A6 9F | Load from zero page into X register
    ROL $C9              ; 26 C9 | Rotate left (zero page)
    ASL $2F21            ; 0E 21 2F | Arithmetic shift left (absolute)
    CMP $E13E,Y          ; D9 3E E1 | Compare accumulator (absolute,Y)
    WDM #$00             ; 42 00 | Reserved instruction

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_193
; Address: $E6DF72
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_193:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $00              ; 30 00 | Branch if negative
    BNE $00              ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_194
; Address: $E6DF7C
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_194:
    JSL $000400          ; 22 00 04 00 | Jump to subroutine long
    INY                  ; C8 | Increment Y register
    LDX #$7E             ; A2 7E | Load immediate value into X register
    PLP                  ; 28 | Pull processor status from stack
    CLV                  ; B8 | Clear overflow flag
    BVS $70              ; 70 70 | Branch if overflow set
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    BCS $B0              ; B0 B0 | Branch if carry set
    LSR $28F9,X          ; 5E F9 28 | Logical shift right (absolute,X)
    STA ($00,X)          ; 81 00 | Update graphics data
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    CPX $9C              ; E4 9C | Compare X register (zero page)
    JMP $A2C2BC          ; 5C BC C2 A2 | Jump to address long
    ORA ($71),Y          ; 11 71 | Logical OR with accumulator ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    LDY $DC58,X          ; BC 58 DC | Load from absolute,X into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $8A00,X          ; 1D 00 8A | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_196
; Address: $E6DFBE
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_196:
    JSL $F29B00          ; 22 00 9B F2 | Jump to subroutine long
    ADC ($90,X)          ; 61 90 | Add with carry ((zero page,X))
    INC $4F02,X          ; FE 02 4F | Increment (absolute,X)
    ROL $0C0C,X          ; 3E 0C 0C | Rotate left (absolute,X)
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    BCS $00              ; B0 00 | Branch if carry set
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    BEQ $BF              ; F0 BF | Branch if equal
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    EOR ($FD,X)          ; 41 FD | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    ASL $1C00            ; 0E 00 1C | Arithmetic shift left (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR $FFEE,Y          ; 59 EE FF | Exclusive OR with accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    LDA ($66),Y          ; B1 66 | Read graphics status
    STA ($D3),Y          ; 91 D3 | Update graphics data
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BIT $E000            ; 2C 00 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    STY $78              ; 84 78 | Store Y register to zero page
    STY $3C              ; 84 3C | Store Y register to zero page
    CPY $30              ; C4 30 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    STY $FC              ; 84 FC | Store Y register to zero page
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $A05F            ; 9C 5F A0 | Store zero to absolute
    CPX #$12             ; E0 12 | Compare X register (immediate)
    INC $7168,X          ; FE 68 71 | Increment (absolute,X)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_198
; Address: $E6E076
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_198:
    ORA $0100            ; 0D 00 01 | Logical OR with accumulator (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    LSR $3800            ; 4E 00 38 | Logical shift right (absolute)
    CLV                  ; B8 | Clear overflow flag
    BVC $70              ; 50 70 | Branch if overflow clear
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVC $F0              ; 50 F0 | Branch if overflow clear
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    JMP ($7E9C)          ; 6C 9C 7E | Jump to address (absolute indirect)
    WDM #$38             ; 42 38 | Reserved instruction
    STZ $C0              ; 64 C0 | Store zero to zero page
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BMI $60              ; 30 60 | Branch if negative
    BNE $00              ; D0 00 | Branch if not equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_199
; Address: $E6E0AF
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_199:
    JSR $0022            ; 20 22 00 | Jump to subroutine
    STA ($00,X)          ; 81 00 | Update graphics data
    TXA                  ; 8A | Transfer X register to accumulator
    JMP $008C00          ; 5C 00 8C 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ADC $7346,Y          ; 79 46 73 | Add with carry (absolute,Y)
    JMP $251E            ; 4C 1E 25 | Jump to address
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    STZ $EE62,X          ; 9E 62 EE | Store zero to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    STY $C8              ; 84 C8 | Store Y register to zero page
    BPL $00              ; 10 00 | Branch if positive
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $8C              ; 80 8C | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_19A
; Address: $E6E0FA
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_19A:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA ($1C),Y          ; 11 1C | Logical OR with accumulator ((zero page),Y)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ASL $CE              ; 06 CE | Arithmetic shift left (zero page)
    STY $468B            ; 8C 8B 46 | Store Y register to absolute address
    EOR #$A6             ; 49 A6 | Exclusive OR with accumulator (immediate)
    LDX $7F              ; A6 7F | Load from zero page into X register
    AND $21FE,Y          ; 39 FE 21 | PPU graphics register access
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BCS $00              ; B0 00 | Branch if carry set
    EOR $0000,Y          ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
    STX $00              ; 86 00 | Store X register to zero page
    PHP                  ; 08 | Push processor status to stack
    STX $044E            ; 8E 4E 04 | Store X register to absolute address
    STY $02              ; 84 02 | Store Y register to zero page
    STA $85              ; 85 85 | Update graphics data
    DEC $EBFF,X          ; DE FF EB | Decrement (absolute,X)
    STZ $847F            ; 9C 7F 84 | Store zero to absolute
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ADC $7A00,X          ; 7D 00 7A | Add with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BVC $10              ; 50 10 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_19B
; Address: $E6E166
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_19B:
    JSR $A030            ; 20 30 A0 | Jump to subroutine
    BCS $F8              ; B0 F8 | Branch if carry set
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    BCC $90              ; 90 90 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_19C
; Address: $E6E188
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_19C:
    BEQ $F1              ; F0 F1 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    JMP ($6000)          ; 6C 00 60 | Jump to address (absolute indirect)
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    CPY $6634            ; CC 34 66 | Compare Y register (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    BCS $CC              ; B0 CC | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_19D
; Address: $E6E1B4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_19D:
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_19E
; Address: $E6E1BA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_19E:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    STY $00              ; 84 00 | Store Y register to zero page
    STA $39067A          ; 8F 7A 06 39 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STA ($00),Y          ; 91 00 | Update graphics data
    BCC $00              ; 90 00 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_19F
; Address: $E6E1DA
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_19F:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    STX $4547            ; 8E 47 45 | Store X register to absolute address
    STA ($01,X)          ; 81 01 | Update graphics data
    STA $47              ; 85 47 | Update graphics data
    STX $C24E            ; 8E 4E C2 | Store X register to absolute address
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    WDM #$00             ; 42 00 | Reserved instruction
    LDY $00              ; A4 00 | Load from zero page into Y register
    PLP                  ; 28 | Pull processor status from stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BCC $D0              ; 90 D0 | Branch if carry clear
    BVS $B0              ; 70 B0 | Branch if overflow set
    CPX #$50             ; E0 50 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A0
; Address: $E6E22A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A0:
    BRA $C0              ; 80 C0 | Branch always
    BRA $70              ; 80 70 | Branch always
    BVS $E6              ; 70 E6 | Branch if overflow set
    BIT $0800            ; 2C 00 08 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A1
; Address: $E6E23A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A1:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BEQ $81              ; F0 81 | Branch if equal
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BPL $1C              ; 10 1C | Branch if positive
    ROL $8800            ; 2E 00 88 | Rotate left (absolute)
    BRA $00              ; 80 00 | Branch always
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A2
; Address: $E6E25A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A2:
    JSL $002200          ; 22 00 22 00 | Jump to subroutine long
    JMP $D3BC            ; 4C BC D3 | Jump to address
    ASL $E59D            ; 0E 9D E5 | Arithmetic shift left (absolute)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A3
; Address: $E6E272
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A3:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A4
; Address: $E6E281
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A4:
    STA                  ; 9F 20 9F 20 | Update graphics data
    STA                  ; 9F 20 9F 20 | Update graphics data
    STA                  ; 9F 20 9F 20 | Update graphics data
    STA                  ; 9F 71 CE 00 | Update graphics data
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 00 01 | Read graphics status
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA $1D02,X          ; 1D 02 1D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A5
; Address: $E6E2CF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A5:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A6
; Address: $E6E2DC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A6:
    JSR $4200            ; 20 00 42 | Hardware register operation
    CPY #$A8             ; C0 A8 | Compare Y register (immediate)
    CPY $AC              ; C4 AC | Compare Y register (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($3F),Y          ; 11 3F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A8
; Address: $E6E2EF
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A8:
    ROL $7F80,X          ; 3E 80 7F | Rotate left (absolute,X)
    STY $7B              ; 84 7B | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 3F | Read graphics status
    CPY #$22             ; C0 22 | Compare Y register (immediate)
    CMP $ED12,X          ; DD 12 ED | Compare accumulator (absolute,X)
    CMP $1503            ; CD 03 15 | Compare accumulator (absolute)
    ORA ($F6,X)          ; 01 F6 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $3D0E,X          ; FD 0E 3D | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    ORA $3E              ; 05 3E | Logical OR with accumulator (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ROL $39              ; 26 39 | Rotate left (zero page)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1A9
; Address: $E6E334
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1A9:
    JSR $1900            ; 20 00 19 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BNE $9C              ; D0 9C | Branch if not equal
    STZ $40DC            ; 9C DC 40 | Store zero to absolute
    LDA                  ; BF 52 92 68 | Read graphics status
    DEC                  ; 3A | Decrement accumulator
    BCC $6F              ; 90 6F | Branch if carry clear
    STZ $4063            ; 9C 63 40 | Store zero to absolute
    LDA                  ; BF 40 BF 56 | Read graphics status
    LDA #$3F             ; A9 3F | Read graphics status
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    SBC $C53A            ; ED 3A C5 | Subtract with carry (absolute)
    ORA #$3B             ; 09 3B | Logical OR with accumulator (immediate)
    AND $033B,Y          ; 39 3B 03 | Logical AND with accumulator (absolute,Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1AA
; Address: $E6E36A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1AA:
    JSL $3A38FD          ; 22 FD 38 3A | Jump to subroutine long
    ROL $F609,X          ; 3E 09 F6 | Rotate left (absolute,X)
    AND $02C6,Y          ; 39 C6 02 | Logical AND with accumulator (absolute,Y)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    WDM #$BD             ; 42 BD | Reserved instruction
    SEC                  ; 38 | Set carry flag
    ROL $3C26            ; 2E 26 3C | Rotate left (absolute)
    JMP $3C58            ; 4C 58 3C | Jump to address
    SEI                  ; 78 | Set interrupt disable flag
    ADC $4D70,Y          ; 79 70 4D | Add with carry (absolute,Y)
    BMI $10              ; 30 10 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1AC
; Address: $E6E3A1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1AC:
    JSL $2CB3F3          ; 22 F3 B3 2C | Jump to subroutine long
    ADC $3070,X          ; 7D 70 30 | Add with carry (absolute,X)
    AND $007F,X          ; 3D 7F 00 | Logical AND with accumulator (absolute,X)
    CPX #$22             ; E0 22 | Compare X register (immediate)
    CMP $4CB3,X          ; DD B3 4C | Compare accumulator (absolute,X)
    AND $30C2,X          ; 3D C2 30 | Logical AND with accumulator (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1AD
; Address: $E6E3BE
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1AD:
    JSR $11DF            ; 20 DF 11 | Jump to subroutine
    ASL $CD              ; 06 CD | Arithmetic shift left (zero page)
    DEC $BC37            ; CE 37 BC | Decrement (absolute)
    ORA $BD0E            ; 0D 0E BD | Logical OR with accumulator (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC #$0E             ; E9 0E | Subtract with carry (immediate)
    CPY $BC33            ; CC 33 BC | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $3811            ; 0E 11 38 | Arithmetic shift left (absolute)
    ORA $0027,Y          ; 19 27 00 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    AND ($F1),Y          ; 31 F1 | Logical AND with accumulator ((zero page),Y)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    DEC $00CA            ; CE CA 00 | Decrement (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1AF
; Address: $E6E41C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1AF:
    JSR $2400            ; 20 00 24 | Jump to subroutine
    ASL $0D3D            ; 0E 3D 0D | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    ORA ($11,X)          ; 01 11 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $2E              ; 05 2E | Logical OR with accumulator (zero page)
    LSR $20              ; 46 20 | Logical shift right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B0
; Address: $E6E434
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B0:
    JSL $001500          ; 22 00 15 00 | Jump to subroutine long
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ROL $2818,X          ; 3E 18 28 | Rotate left (absolute,X)
    BIT $38              ; 24 38 | Test bits in accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    BCS $20              ; B0 20 | Branch if carry set
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B1
; Address: $E6E461
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B1:
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $3F20            ; 2C 20 3F | Test bits in accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B2
; Address: $E6E487
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B2:
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    BCS $FC              ; B0 FC | Branch if carry set
    CPX $D0              ; E4 D0 | Compare X register (zero page)
    CPX #$74             ; E0 74 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    CPX $2008            ; EC 08 20 | Compare X register (absolute)
    BNE $D8              ; D0 D8 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B3
; Address: $E6E4A5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B3:
    JSR $28B0            ; 20 B0 28 | Jump to subroutine
    BRA $A1              ; 80 A1 | Branch always
    RTI                  ; 40 | Return from interrupt
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    STX $5400            ; 8E 00 54 | Store X register to absolute address
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B4
; Address: $E6E4BA
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B4:
    JSL $004200          ; 22 00 42 00 | Jump to subroutine long
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    ASL $1C12            ; 0E 12 1C | Arithmetic shift left (absolute)
    ASL $3711            ; 0E 11 37 | Arithmetic shift left (absolute)
    ROL $A819            ; 2E 19 A8 | Rotate left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    LDY $00              ; A4 00 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $70              ; 10 70 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    BVS $88              ; 70 88 | Branch if overflow set
    CPX $9874            ; EC 74 98 | Compare X register (absolute)
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Update graphics data
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0514            ; 0D 14 05 | Logical OR with accumulator (absolute)
    STA ($00,X)          ; 81 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B5
; Address: $E6E50E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B5:
    CMP ($40,X)          ; C1 40 | Compare accumulator ((zero page,X))
    LDY $2100            ; AC 00 21 | PPU graphics register access
    PLP                  ; 28 | Pull processor status from stack
    INC                  ; 1A | Increment accumulator
    STA ($82,X)          ; 81 82 | Update graphics data
    BRA $38              ; 80 38 | Branch always
    SBC $8F77,Y          ; F9 77 8F | Subtract with carry (absolute,Y)
    LDA                  ; BF 42 3D C2 | Read graphics status
    LDX $EE41,Y          ; BE 41 EE | Load from absolute,Y into X register
    ORA ($45),Y          ; 11 45 | Logical OR with accumulator ((zero page),Y)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    ORA $1C00,X          ; 1D 00 1C | Logical OR with accumulator (absolute,X)
    CMP ($20),Y          ; D1 20 | Compare accumulator ((zero page),Y)
    LDA $3E41,X          ; BD 41 3E | Read graphics status
    SEP #$1C             ; E2 1C | Set processor status bits

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B6
; Address: $E6E547
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B6:
    JSL $B3A41A          ; 22 1A A4 B3 | Jump to subroutine long
    ADC #$AC             ; 69 AC | Add with carry (immediate)
    EOR $07FB,X          ; 5D FB 07 | Exclusive OR with accumulator (absolute,X)
    LSR $8E00            ; 4E 00 8E | Logical shift right (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    PHB                  ; 8B | Push data bank register to stack
    LDA $7C82,X          ; BD 82 7C | Read graphics status
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    AND $CD              ; 25 CD | Logical AND with accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    CPX #$72             ; E0 72 | Compare X register (immediate)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B7
; Address: $E6E57A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B7:
    JSR $4100            ; 20 00 41 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $41              ; 80 41 | Branch always
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    STA                  ; 9F EE F1 FD | Update graphics data
    WDM #$BC             ; 42 BC | Reserved instruction
    ADC $7682,X          ; 7D 82 76 | Add with carry (absolute,X)
    BIT #$A2             ; 89 A2 | Test bits in accumulator (immediate)
    LDX #$00             ; A2 00 | Load immediate value into X register
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    ADC $3E3C,X          ; 7D 3C 3E | Add with carry (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B8
; Address: $E6E5AE
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B8:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($1C,X)          ; A1 1C | Read graphics status
    STX $DD71            ; 8E 71 DD | Store X register to absolute address
    ASL $EFAF,X          ; 1E AF EF | Arithmetic shift left (absolute,X)
    LDA                  ; BF 3C 00 38 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    CMP $CD              ; C5 CD | Compare accumulator (zero page)
    INC $F5D8,X          ; FE D8 F5 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $BE              ; 50 BE | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1B9
; Address: $E6E616
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1B9:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CMP #$B9             ; C9 B9 | Compare accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    ADC #$3F             ; 69 3F | Add with carry (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA $1EDF78          ; 8F 78 DF 1E | Update graphics data
    DEC                  ; 3A | Decrement accumulator
    BVS $8F              ; 70 8F | Branch if overflow set
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1BB
; Address: $E6E666
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1BB:
    CLI                  ; 58 | Clear interrupt disable flag
    CPX $F0              ; E4 F0 | Compare X register (zero page)
    STA $437F0F          ; 8F 0F 7F 43 | Update graphics data
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1BD
; Address: $E6E67C
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1BD:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BNE $FE              ; D0 FE | Branch if not equal
    PHX                  ; DA | Push X register to stack
    STA $C64D63          ; 8F 63 4D C6 | Update graphics data
    INC $EF              ; E6 EF | Increment (zero page)
    NOP                  ; EA | No operation
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    LDY $EC5B            ; AC 5B EC | Load from absolute address into Y register
    SBC ($C6),Y          ; F1 C6 | Subtract with carry ((zero page),Y)
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    AND $3C00            ; 2D 00 3C | Logical AND with accumulator (absolute)
    CPY $06FA            ; CC FA 06 | Compare Y register (absolute)
    ORA ($1A),Y          ; 11 1A | Logical OR with accumulator ((zero page),Y)
    SBC $D8              ; E5 D8 | Subtract with carry (zero page)
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    INC $FEC2,X          ; FE C2 FE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    ORA $302F,Y          ; 19 2F 30 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C0
; Address: $E6E70F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C0:
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt
    AND $773A,Y          ; 39 3A 77 | Logical AND with accumulator (absolute,Y)
    AND ($17),Y          ; 31 17 | Logical AND with accumulator ((zero page),Y)
    ORA $0F08,Y          ; 19 08 0F | Logical OR with accumulator (absolute,Y)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C1
; Address: $E6E73A
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C1:
    BPL $00              ; 10 00 | Branch if positive
    INC                  ; 1A | Increment accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF BB 44 FD | Read graphics status
    INC $FD01,X          ; FE 01 FD | Increment (absolute,X)
    DEC $CA79,X          ; DE 79 CA | Decrement (absolute,X)
    ADC $0000,X          ; 7D 00 00 | Add with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    JMP $8700            ; 4C 00 87 | Jump to address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    ROR $1C42,X          ; 7E 42 1C | Rotate right (absolute,X)
    ROL $0B              ; 26 0B | Rotate left (zero page)
    ORA $1C0A            ; 0D 0A 1C | Logical OR with accumulator (absolute)
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    STY $00C5            ; 8C C5 00 | Store Y register to absolute address
    STA ($00,X)          ; 81 00 | Update graphics data
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C2
; Address: $E6E77E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C2:
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    AND $18EC            ; 2D EC 18 | Logical AND with accumulator (absolute)
    INC $9796,X          ; FE 96 97 | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    ADC $677D,Y          ; 79 7D 67 | Add with carry (absolute,Y)
    PEA #$1200           ; F4 00 12 | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    BCC $D0              ; 90 D0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C3
; Address: $E6E7A4
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C3:
    CLC                  ; 18 | Clear carry flag
    ADC #$E9             ; 69 E9 | Add with carry (immediate)
    INC $7E3E,X          ; FE 3E 7E | Increment (absolute,X)
    DEC $2FDE            ; CE DE 2F | Decrement (absolute)
    PHA                  ; 48 | Push accumulator to stack
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Update graphics data
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    JMP ($7E9C)          ; 6C 9C 7E | Jump to address (absolute indirect)
    WDM #$38             ; 42 38 | Reserved instruction
    STZ $C0              ; 64 C0 | Store zero to zero page
    LDY #$58             ; A0 58 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C4
; Address: $E6E7CB
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C4:
    BNE $86              ; D0 86 | Branch if not equal
    SEI                  ; 78 | Set interrupt disable flag
    LSR $2331            ; 4E 31 23 | Logical shift right (absolute)
    STA ($00,X)          ; 81 00 | Update graphics data
    TXA                  ; 8A | Transfer X register to accumulator
    JMP $008400          ; 5C 00 84 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BMI $16              ; 30 16 | Branch if negative
    ORA $1718,Y          ; 19 18 17 | Logical OR with accumulator (absolute,Y)
    BPL $05              ; 10 05 | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $08              ; F0 08 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C5
; Address: $E6E803
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C5:
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    LDY #$60             ; A0 60 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C7
; Address: $E6E81A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C7:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C8
; Address: $E6E832
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C8:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STZ $FEF7            ; 9C F7 FE | Store zero to absolute
    ORA $2E              ; 05 2E | Logical OR with accumulator (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    WDM #$00             ; 42 00 | Reserved instruction
    BCC $00              ; 90 00 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    SBC $0CF9,Y          ; F9 F9 0C | Subtract with carry (absolute,Y)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    WDM #$FE             ; 42 FE | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    BVS $7F              ; 70 7F | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    JMP $484F            ; 4C 4F 48 | Jump to address
    SEI                  ; 78 | Set interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1C9
; Address: $E6E8DA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1C9:
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    ORA $904C            ; 0D 4C 90 | Logical OR with accumulator (absolute)
    ADC ($17),Y          ; 71 17 | Add with carry ((zero page),Y)
    LDA #$89             ; A9 89 | Read graphics status
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1CA
; Address: $E6E8EB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1CA:
    JSR $0104            ; 20 04 01 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    STY $1827            ; 8C 27 18 | Store Y register to absolute address
    BMI $0F              ; 30 0F | Branch if negative
    BVS $4F              ; 70 4F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1CC
; Address: $E6E916
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1CC:
    JSR $C040            ; 20 40 C0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    ORA $08ED,X          ; 1D ED 08 | Logical OR with accumulator (absolute,X)
    PEA #$FAB6           ; F4 B6 FA | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    PEA #$AE5E           ; F4 5E AE | Push effective address to stack
    ROR $1209            ; 6E 09 12 | Rotate right (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($01,X)          ; 81 01 | Update graphics data
    LDA                  ; BF 00 BE 00 | Read graphics status
    LDY $B900,X          ; BC 00 B9 | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    INC $CB00,X          ; FE 00 CB | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    LDA                  ; BF 00 14 14 | Read graphics status
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1CD
; Address: $E6E964
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1CD:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    REP #$C2             ; C2 C2 | Reset processor status bits
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1CE
; Address: $E6E97B
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1CE:
    BIT $2914            ; 2C 14 29 | Test bits in accumulator (absolute)
    BPL $2B              ; 10 2B | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    BNE $00              ; D0 00 | Branch if not equal
    CPX $2600            ; EC 00 26 | Compare X register (absolute)
    BNE $16              ; D0 16 | Branch if not equal
    INX                  ; E8 | Increment X register
    INC                  ; 1A | Increment accumulator
    CPX $43              ; E4 43 | Compare X register (zero page)
    AND ($94,X)          ; 21 94 | Logical AND with accumulator ((zero page,X))
    ORA ($D4,X)          ; 01 D4 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    AND ($49),Y          ; 31 49 | Logical AND with accumulator ((zero page),Y)
    BIT $58              ; 24 58 | Test bits in accumulator (zero page)
    LDX #$44             ; A2 44 | Load immediate value into X register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1CF
; Address: $E6E9D2
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1CF:
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA $E900            ; 0D 00 E9 | Logical OR with accumulator (absolute)
    SBC $F3C3,Y          ; F9 C3 F3 | Subtract with carry (absolute,Y)
    INC $E0              ; E6 E0 | Game work RAM access
    STX $66              ; 86 66 | Store X register to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $8000,Y          ; F9 00 80 | Subtract with carry (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $E17F,X          ; 1E 7F E1 | Arithmetic shift left (absolute,X)
    ADC ($83,X)          ; 61 83 | Add with carry ((zero page,X))
    CPY $8C              ; C4 8C | Compare Y register (zero page)
    BRA $D8              ; 80 D8 | Branch always
    CPY #$91             ; C0 91 | Compare Y register (immediate)
    LDA ($7C,X)          ; A1 7C | Read graphics status
    BRA $00              ; 80 00 | Branch always
    STZ $7F00,X          ; 9E 00 7F | Store zero to absolute,X
    ROR $1B00,X          ; 7E 00 1B | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D0
; Address: $E6EA25
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D0:
    CPX #$D6             ; E0 D6 | Compare X register (immediate)
    DEC $1F2F            ; CE 2F 1F | Decrement (absolute)
    STA                  ; 9F 09 4F 27 | Update graphics data
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $FF              ; 80 FF | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D1
; Address: $E6EA63
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D1:
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    LDX #$04             ; A2 04 | Load immediate value into X register
    EOR $0638            ; 4D 38 06 | Exclusive OR with accumulator (absolute)
    STZ $40              ; 64 40 | Store zero to zero page
    ADC $4961,X          ; 7D 61 49 | Add with carry (absolute,X)
    LDA                  ; BF 00 9E 00 | Read graphics status
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ORA $1316,Y          ; 19 16 13 | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    LDA                  ; BF 27 6D 0D | Read graphics status
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    SBC $D800            ; ED 00 D8 | Subtract with carry (absolute)
    BMI $77              ; 30 77 | Branch if negative
    LDY $16FC,X          ; BC FC 16 | Load from absolute,X into Y register
    ROR $7EF0,X          ; 7E F0 7E | Rotate right (absolute,X)
    STZ $451E,X          ; 9E 1E 45 | Store zero to absolute,X
    STA $30              ; 85 30 | Update graphics data
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    ASL $3E              ; 06 3E | Arithmetic shift left (zero page)
    ROR $7C0C,X          ; 7E 0C 7C | Rotate right (absolute,X)
    ORA $28FA,Y          ; 19 FA 28 | Logical OR with accumulator (absolute,Y)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    STA $C1EF09          ; 8F 09 EF C1 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    BIT $26              ; 24 26 | Test bits in accumulator (zero page)
    ROR $5A52,X          ; 7E 52 5A | Rotate right (absolute,X)
    JMP $804C            ; 4C 4C 80 | Jump to address
    BRA $FF              ; 80 FF | Branch always
    STA ($FF,X)          ; 81 FF | Update graphics data
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Update graphics data
    LDA $FF              ; A5 FF | Read graphics status
    ASL $340E            ; 0E 0E 34 | Arithmetic shift left (absolute)
    STA ($80,X)          ; 81 80 | Update graphics data
    LDA $0081,Y          ; B9 81 00 | Read graphics status
    STA ($00),Y          ; 91 00 | Update graphics data
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D2
; Address: $E6EB2A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D2:
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ROL $00D1,X          ; 3E D1 00 | Rotate left (absolute,X)
    DEC $FA00            ; CE 00 FA | Decrement (absolute)
    BRA $00              ; 80 00 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BMI $E7              ; 30 E7 | Branch if negative

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D3
; Address: $E6EB63
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D3:
    JSR $00CF            ; 20 CF 00 | Jump to subroutine
    ASL $9E90            ; 0E 90 9E | Arithmetic shift left (absolute)
    EOR $C5              ; 45 C5 | Exclusive OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    PHP                  ; 08 | Push processor status to stack
    ASL $5F56            ; 0E 56 5F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    CPY $68              ; C4 68 | Compare Y register (zero page)
    LDA                  ; BF D2 A0 D9 | Read graphics status
    STZ $AF              ; 64 AF | Store zero to zero page
    STA ($EF,X)          ; 81 EF | Update graphics data
    PHX                  ; DA | Push X register to stack
    LDA $FFFFFF          ; AF FF FF FF | Read graphics status
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    LSR $04F1            ; 4E F1 04 | Logical shift right (absolute)
    STA ($8F),Y          ; 91 8F | Update graphics data
    DEC $FF              ; C6 FF | Decrement (zero page)
    ROR $FDFF,X          ; 7E FF FD | Rotate right (absolute,X)
    LDA $333D,X          ; BD 3D 33 | Read graphics status
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    REP #$00             ; C2 00 | Reset processor status bits
    ROR $1900            ; 6E 00 19 | Rotate right (absolute)
    BPL $00              ; 10 00 | Branch if positive
    WDM #$80             ; 42 80 | Reserved instruction
    JMP $1922            ; 4C 22 19 | Jump to address
    BPL $00              ; 10 00 | Branch if positive
    ORA $1000,Y          ; 19 00 10 | Logical OR with accumulator (absolute,Y)
    INC $CDB7            ; EE B7 CD | Increment (absolute)
    AND $D9EF,X          ; 3D EF D9 | Logical AND with accumulator (absolute,X)
    INC $FF86,X          ; FE 86 FF | Increment (absolute,X)
    LDA $C1EDA8          ; AF A8 ED C1 | Read graphics status
    LDY $AC52            ; AC 52 AC | Load from absolute address into Y register
    BIT #$E6             ; 89 E6 | Test bits in accumulator (immediate)
    CMP #$A7             ; C9 A7 | Compare accumulator (immediate)
    REP #$AF             ; C2 AF | Reset processor status bits
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D4
; Address: $E6EC7C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D4:
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BIT $19              ; 24 19 | Test bits in accumulator (zero page)
    LDA #$AD             ; A9 AD | Read graphics status
    PHY                  ; 5A | Push Y register to stack
    ORA $F4F8,Y          ; 19 F8 F4 | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D6
; Address: $E6ECAC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D6:
    JSR $3820            ; 20 20 38 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D7
; Address: $E6ECBC
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D7:
    JSR $38DF            ; 20 DF 38 | Jump to subroutine
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    REP #$C2             ; C2 C2 | Reset processor status bits
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    ADC $3DC2,X          ; 7D C2 3D | Add with carry (absolute,X)
    ROL $26              ; 26 26 | Rotate left (zero page)
    ROR $666E            ; 6E 6E 66 | Rotate right (absolute)
    ROR $66              ; 66 66 | Rotate right (zero page)
    ROR $26              ; 66 26 | Rotate right (zero page)
    ROL $56              ; 26 56 | Rotate left (zero page)
    LDA $88F7D9          ; AF D9 F7 88 | Read graphics status
    BCC $6E              ; 90 6E | Branch if carry clear
    STA ($66),Y          ; 91 66 | Update graphics data
    STA $9966,Y          ; 99 66 99 | Update graphics data
    ROL $D9              ; 26 D9 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D8
; Address: $E6ED00
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D8:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BMI $74              ; 30 74 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BMI $30              ; 30 30 | Branch if negative
    BPL $10              ; 10 10 | Branch if positive
    BVS $50              ; 70 50 | Branch if overflow set
    BEQ $CE              ; F0 CE | Branch if equal
    PHB                  ; 8B | Push data bank register to stack
    BMI $CF              ; 30 CF | Branch if negative
    CMP $CE31            ; CD 31 CE | Compare accumulator (absolute)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1D9
; Address: $E6ED1E
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1D9:
    BPL $EF              ; 10 EF | Branch if positive
    ROL $26              ; 26 26 | Rotate left (zero page)
    STA ($41),Y          ; 91 41 | Update graphics data
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    CMP $9000,Y          ; D9 00 90 | Compare accumulator (absolute,Y)
    JMP $6E00            ; 4C 00 6E | Jump to address
    BCC $00              ; 90 00 | Branch if carry clear
    STA ($00,X)          ; 81 00 | Update graphics data
    CMP $9000,Y          ; D9 00 90 | Compare accumulator (absolute,Y)
    JMP $6A00            ; 4C 00 6A | Jump to address
    RTI                  ; 40 | Return from interrupt
    BCC $00              ; 90 00 | Branch if carry clear
    STA ($FF,X)          ; 81 FF | Update graphics data
    STA ($00),Y          ; 91 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    AND ($F1),Y          ; 31 F1 | Logical AND with accumulator ((zero page),Y)
    BMI $F0              ; 30 F0 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1DA
; Address: $E6EDA8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1DA:
    BPL $08              ; 10 08 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1DB
; Address: $E6EDB8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1DB:
    JSR $203F            ; 20 3F 20 | Jump to subroutine
    BMI $2F              ; 30 2F | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $F8              ; 70 F8 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1DE
; Address: $E6EDD0
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1DE:
    PLY                  ; 7A | Pull Y register from stack
    STX $7C              ; 86 7C | Store X register to zero page
    STY $74              ; 84 74 | Store Y register to zero page
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    STZ $9C              ; 64 9C | Store zero to zero page
    BIT $2EB5            ; 2C B5 2E | Test bits in accumulator (absolute)
    ROL $AE35            ; 2E 35 AE | Rotate left (absolute)
    ROL $3BA8            ; 2E A8 3B | Rotate left (absolute)
    ORA $40BF            ; 0D BF 40 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY $E5              ; C4 E5 | Compare Y register (zero page)
    ADC $45              ; 65 45 | Add with carry (zero page)
    STZ $44              ; 64 44 | Store zero to zero page
    ADC $45              ; 65 45 | Add with carry (zero page)
    STZ $54              ; 64 54 | Store zero to zero page
    CPY $E5              ; C4 E5 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1DF
; Address: $E6EE0F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1DF:
    ADC ($1A,X)          ; 61 1A | Add with carry ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $8A              ; 10 8A | Branch if positive
    BPL $8A              ; 10 8A | Branch if positive
    BPL $8A              ; 10 8A | Branch if positive
    INC                  ; 1A | Increment accumulator
    STX $1810            ; 8E 10 18 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E0
; Address: $E6EE21
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E0:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDX #$00             ; A2 00 | Load immediate value into X register
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ORA $00B7            ; 0D B7 00 | Logical OR with accumulator (absolute)
    BCS $0F              ; B0 0F | Branch if carry set
    BEQ $A5              ; F0 A5 | Branch if equal
    PHY                  ; 5A | Push Y register to stack
    LDX #$5D             ; A2 5D | Load immediate value into X register
    CMP $FF26,Y          ; D9 26 FF | Compare accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E1
; Address: $E6EE85
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E1:
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    PHX                  ; DA | Push X register to stack
    JMP ($386C)          ; 6C 6C 38 | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    AND $38C7,Y          ; 39 C7 38 | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC $E4CE            ; CE CE E4 | Decrement (absolute)
    LDA                  ; BF A5 E5 00 | Read graphics status
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    JMP ($DBBC)          ; 6C BC DB | Jump to address (absolute indirect)
    LDA $1D7B26          ; AF 26 7B 1D | Read graphics status
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $0702,X          ; 1E 02 07 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 37 CF 0C | Read graphics status
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E2
; Address: $E6EEDA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E2:
    JSR $407F            ; 20 7F 40 | Jump to subroutine
    BPL $17              ; 10 17 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E3
; Address: $E6EEF6
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E3:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    STY $8C74            ; 8C 74 8C | Store Y register to absolute address
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $8C              ; 70 8C | Branch if overflow set
    EOR ($E6),Y          ; 51 E6 | Exclusive OR with accumulator ((zero page),Y)
    BCS $CD              ; B0 CD | Branch if carry set
    PLA                  ; 68 | Pull accumulator from stack
    AND $5926,X          ; 3D 26 59 | Logical AND with accumulator (absolute,X)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    ORA $87A6,Y          ; 19 A6 87 | Logical OR with accumulator (absolute,Y)
    LDA                  ; BF FF 7F FF | Read graphics status
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA $5600,Y          ; 19 00 56 | Logical OR with accumulator (absolute,Y)
    ADC $1800            ; 6D 00 18 | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $1A19,Y          ; 19 19 1A | Logical OR with accumulator (absolute,Y)
    ORA $262D,Y          ; 19 2D 26 | Logical OR with accumulator (absolute,Y)
    ROL $18              ; 26 18 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $703F,Y          ; 19 3F 70 | Logical OR with accumulator (absolute,Y)
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $F4              ; 70 F4 | Branch if overflow set
    PEA #$FC70           ; F4 70 FC | Push effective address to stack
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $0858            ; 2C 58 08 | Test bits in accumulator (absolute)
    BMI $30              ; 30 30 | Branch if negative
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $8C              ; 70 8C | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E4
; Address: $E6EF94
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E4:
    PEA #$708C           ; F4 8C 70 | Push effective address to stack
    STY $8C70            ; 8C 70 8C | Store Y register to absolute address
    BRA $FC              ; 80 FC | Branch always
    LDY $FC              ; A4 FC | Load from zero page into Y register
    CPY $00FC            ; CC FC 00 | Compare Y register (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E5
; Address: $E6EFA8
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E5:
    JSL $005200          ; 22 00 52 00 | Jump to subroutine long
    LDA #$21             ; A9 21 | PPU graphics register access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $BC00,X          ; DE 00 BC | Decrement (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BCS $90              ; B0 90 | Branch if carry set
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LSR $E800,X          ; 5E 00 E8 | Logical shift right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    SBC $8000,X          ; FD 00 80 | Subtract with carry (absolute,X)
    STY $00              ; 84 00 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    STY $DC00            ; 8C 00 DC | Store Y register to absolute address
    DEC $FE00,X          ; DE 00 FE | Decrement (absolute,X)
    STZ $5FE1,X          ; 9E E1 5F | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E6
; Address: $E6F023
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E6:
    JSR $A0DF            ; 20 DF A0 | Jump to subroutine
    LDA $7EC6,Y          ; B9 C6 7E | Read graphics status
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E7
; Address: $E6F02C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E7:
    LDA                  ; BF E0 3F C0 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ADC ($8F),Y          ; 71 8F | Add with carry ((zero page),Y)
    NOP                  ; EA | No operation
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E8
; Address: $E6F04E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E8:
    SBC $0007,X          ; FD 07 00 | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $5FE1,X          ; 1E E1 5F | Arithmetic shift left (absolute,X)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    ORA $C03F            ; 0D 3F C0 | Logical OR with accumulator (absolute)
    LDY #$F9             ; A0 F9 | Load immediate value into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROR $FD87,X          ; 7E 87 FD | Rotate right (absolute,X)
    ASL $9F              ; 06 9F | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1E9
; Address: $E6F086
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1E9:
    STZ $7F61,X          ; 9E 61 7F | Store zero to absolute,X
    BRA $65              ; 80 65 | Branch always
    TXS                  ; 9A | Transfer X register to stack pointer
    CMP $0026,Y          ; D9 26 00 | Compare accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    EOR $5FBD,X          ; 5D BD 5F | Exclusive OR with accumulator (absolute,X)
    CPX $34              ; E4 34 | Compare X register (zero page)
    ORA $1E01            ; 0D 01 1E | Logical OR with accumulator (absolute)
    BMI $3F              ; 30 3F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ORA $0FE2,X          ; 1D E2 0F | Logical OR with accumulator (absolute,X)
    BEQ $04              ; F0 04 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF 7A FF EF | Read graphics status
    STA $00FFEF          ; 8F EF FF 00 | Update graphics data
    LDA                  ; BF 40 FF 00 | Read graphics status
    BPL $81              ; 10 81 | Branch if positive
    EOR $FD              ; 45 FD | Exclusive OR with accumulator (zero page)
    ASL $BF              ; 06 BF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC $BF02,X          ; FD 02 BF | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CPX $E3              ; E4 E3 | Compare X register (zero page)
    CPY $E3              ; C4 E3 | Compare Y register (zero page)
    CPY $E3              ; C4 E3 | Compare Y register (zero page)
    STY $E3              ; 84 E3 | Store Y register to zero page
    BIT $63              ; 24 63 | Test bits in accumulator (zero page)
    LDY $A3              ; A4 A3 | Load from zero page into Y register
    CPY $E3              ; C4 E3 | Compare Y register (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1EB
; Address: $E6F139
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1EB:
    STA                  ; 9F A0 5F E0 | Update graphics data
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY $0C73            ; CC 73 0C | Compare Y register (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF C0 99 E6 | Read graphics status
    LDY #$13             ; A0 13 | Load immediate value into Y register
    JMP ($5629)          ; 6C 29 56 | Jump to address (absolute indirect)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY #$5E             ; A0 5E | Load immediate value into Y register
    INC $1A              ; E6 1A | Increment (zero page)
    DEC $D932            ; CE 32 D9 | Decrement (absolute)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    LSR $76              ; 46 76 | Logical shift right (zero page)
    STX $4FB7            ; 8E B7 4F | Store X register to absolute address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    BRA $A9              ; 80 A9 | Branch always
    LDY #$F3             ; A0 F3 | Load immediate value into Y register
    AND $00D2            ; 2D D2 00 | Logical AND with accumulator (absolute)
    SBC $9F06,Y          ; F9 06 9F | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1EC
; Address: $E6F1A4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1EC:
    STA $06F970          ; 8F 70 F9 06 | Update graphics data
    NOP                  ; EA | No operation
    ASL $27E1,X          ; 1E E1 27 | Arithmetic shift left (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)
    BMI $A8              ; 30 A8 | Branch if negative
    ORA $660C,X          ; 1D 0C 66 | Logical OR with accumulator (absolute,X)
    AND ($76),Y          ; 31 76 | Logical AND with accumulator ((zero page),Y)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1ED
; Address: $E6F1D8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1ED:
    JSR $0CDF            ; 20 DF 0C | Jump to subroutine
    ASL $C376            ; 0E 76 C3 | Arithmetic shift left (absolute)
    PLY                  ; 7A | Pull Y register from stack
    LSR $9A              ; 46 9A | Logical shift right (zero page)
    ASL $F5              ; 06 F5 | Arithmetic shift left (zero page)
    CPX $AD              ; E4 AD | Compare X register (zero page)
    CPX $C86B            ; EC 6B C8 | Compare X register (absolute)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    WDM #$BD             ; 42 BD | Reserved instruction

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1EE
; Address: $E6F1F7
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1EE:
    ADC $F906,X          ; 7D 06 F9 | Add with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $31FD,X          ; FD FD 31 | Subtract with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($89,X)          ; 01 89 | Logical OR with accumulator ((zero page,X))
    BIT #$23             ; 89 23 | Test bits in accumulator (immediate)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP $7776,X          ; DD 76 77 | Compare accumulator (absolute,X)
    REP #$FF             ; C2 FF | Reset processor status bits
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $88              ; 80 88 | Branch always
    DEY                  ; 88 | Decrement Y register
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CMP $F777,X          ; DD 77 F7 | Compare accumulator (absolute,X)
    EOR $A384,X          ; 5D 84 A3 | Exclusive OR with accumulator (absolute,X)
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    BIT $23              ; 24 23 | Test bits in accumulator (zero page)
    PEA #$8813           ; F4 13 88 | Push effective address to stack
    PHB                  ; 8B | Push data bank register to stack
    PLP                  ; 28 | Pull processor status from stack
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1EF
; Address: $E6F254
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1EF:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SBC $31FD,X          ; FD FD 31 | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F0
; Address: $E6F26E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F0:
    JSL $02FD22          ; 22 22 FD 02 | Jump to subroutine long
    CMP $7777,X          ; DD 77 77 | Compare accumulator (absolute,X)
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    ADC $B4A8,Y          ; 79 A8 B4 | Add with carry (absolute,Y)
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    LDA                  ; BF 0F F6 34 | Read graphics status
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F1
; Address: $E6F2A2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F1:
    PLP                  ; 28 | Pull processor status from stack
    STA ($99),Y          ; 91 99 | Update graphics data
    DEC $15BF            ; CE BF 15 | Decrement (absolute)
    INC $33CC            ; EE CC 33 | Increment (absolute)
    ROR $00              ; 66 00 | Rotate right (zero page)
    REP #$FF             ; C2 FF | Reset processor status bits
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F2
; Address: $E6F2CE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F2:
    JSL $1CE322          ; 22 22 E3 1C | Jump to subroutine long
    CMP $7777,X          ; DD 77 77 | Compare accumulator (absolute,X)
    CMP $A126,X          ; DD 26 A1 | Compare accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STZ $207F,X          ; 9E 7F 20 | Store zero to absolute,X
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F3
; Address: $E6F2F0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F3:
    JSR $40DF            ; 20 DF 40 | Jump to subroutine
    LDA                  ; BF 00 FF 00 | Read graphics status
    CLI                  ; 58 | Clear interrupt disable flag
    CMP $699D,Y          ; D9 9D 69 | Compare accumulator (absolute,Y)
    SEP #$31             ; E2 31 | Set processor status bits
    CLC                  ; 18 | Clear carry flag
    INC $18EF,X          ; FE EF 18 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F4
; Address: $E6F320
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F4:
    JSR $2DDF            ; 20 DF 2D | Jump to subroutine
    INC $BC44,X          ; FE 44 BC | Increment (absolute,X)
    ASL $E1              ; 06 E1 | Arithmetic shift left (zero page)
    BRA $66              ; 80 66 | Branch always
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($3F,X)          ; 81 3F | Update graphics data
    CMP $DB              ; C5 DB | Compare accumulator (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    EOR ($F3,X)          ; 41 F3 | Exclusive OR with accumulator ((zero page,X))
    AND ($07),Y          ; 31 07 | Logical AND with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $FD              ; 80 FD | Branch always
    STA ($F5),Y          ; 91 F5 | Update graphics data
    STA ($CF,X)          ; 81 CF | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F5
; Address: $E6F366
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F5:
    DEY                  ; 88 | Decrement Y register
    STX $D3              ; 86 D3 | Store X register to zero page
    BRA $D9              ; 80 D9 | Branch always
    STY $FB              ; 84 FB | Store Y register to zero page
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    STA ($6E),Y          ; 91 6E | Update graphics data
    STA ($7E,X)          ; 81 7E | Update graphics data
    DEY                  ; 88 | Decrement Y register
    ADC $7F80,X          ; 7D 80 7F | Add with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BIT $BB              ; 24 BB | Test bits in accumulator (zero page)
    LDA $DF00            ; AD 00 DF | Read graphics status
    AND ($C6,X)          ; 21 C6 | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    STA $00FF00          ; 8F 00 FF 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F7
; Address: $E6F396
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F7:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BMI $78              ; 30 78 | Branch if negative
    BMI $78              ; 30 78 | Branch if negative
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    CPX $B4EC            ; EC EC B4 | Compare X register (absolute)
    LDY $0186,X          ; BC 86 01 | Load from absolute,X into Y register
    STX $01              ; 86 01 | Store X register to zero page
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    ORA ($12,X)          ; 01 12 | Logical OR with accumulator ((zero page,X))
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $3428,Y          ; 79 28 34 | Add with carry (absolute,Y)
    ORA ($19),Y          ; 11 19 | Logical OR with accumulator ((zero page),Y)
    INC $24F7,X          ; FE F7 24 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1F8
; Address: $E6F3DA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1F8:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $3F              ; 80 3F | Branch always
    CMP $DA              ; C5 DA | Compare accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    EOR ($F3,X)          ; 41 F3 | Exclusive OR with accumulator ((zero page,X))
    BMI $07              ; 30 07 | Branch if negative
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    STY $7B              ; 84 7B | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 02 FF 80 | Read graphics status
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1FA
; Address: $E6F42E
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1FA:
    AND $00FF            ; 2D FF 00 | Logical AND with accumulator (absolute)
    SBC $F591,X          ; FD 91 F5 | Subtract with carry (absolute,X)
    ORA ($4F,X)          ; 01 4F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $D3              ; 06 D3 | Arithmetic shift left (zero page)
    CMP $7B04,Y          ; D9 04 7B | Compare accumulator (absolute,Y)
    STA ($6E),Y          ; 91 6E | Update graphics data
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $A0              ; 80 A0 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVC $B0              ; 50 B0 | Branch if overflow clear
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCS $80              ; B0 80 | Branch if carry set
    BVS $23              ; 70 23 | Branch if overflow set
    AND ($D1,X)          ; 21 D1 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1FC
; Address: $E6F488
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1FC:
    JSL $D323D2          ; 22 D2 23 D3 | Jump to subroutine long
    AND ($D1,X)          ; 21 D1 | Logical AND with accumulator ((zero page,X))
    AND ($D1,X)          ; 21 D1 | Logical AND with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BIT $D4              ; 24 D4 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1FE
; Address: $E6F4AA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1FE:
    JSR $00D7            ; 20 D7 00 | Jump to subroutine
    CPX #$12             ; E0 12 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    SBC $0100            ; ED 00 01 | Subtract with carry (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $1F1B            ; 0E 1B 1F | Arithmetic shift left (absolute)
    AND $3926,X          ; 3D 26 39 | Logical AND with accumulator (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_1FF
; Address: $E6F4E6
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_1FF:
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    BIT $00EC            ; 2C EC 00 | Test bits in accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    LDA $9D9C,X          ; BD 9C 9D | Read graphics status
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    SBC $8212            ; ED 12 82 | Subtract with carry (absolute)
    ADC $FE01,X          ; 7D 01 FE | Add with carry (absolute,X)
    SEP #$FF             ; E2 FF | Set processor status bits
    SEC                  ; 38 | Set carry flag
    STY $088F            ; 8C 8F 08 | Store Y register to absolute address
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $60              ; 10 60 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_200
; Address: $E6F542
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_200:
    DEX                  ; CA | Decrement X register
    CPY $F8CF            ; CC CF F8 | Compare Y register (absolute)
    SEP #$E3             ; E2 E3 | Set processor status bits
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    AND $023D,X          ; 3D 3D 02 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_201
; Address: $E6F563
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_201:
    JSL $19FD3D          ; 22 3D FD 19 | Jump to subroutine long
    ORA $0E1F,X          ; 1D 1F 0E | Logical OR with accumulator (absolute,X)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    SBC $C200,X          ; FD 00 C2 | Subtract with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $A0              ; F0 A0 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$62             ; C0 62 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SEP #$F2             ; E2 F2 | Set processor status bits

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_202
; Address: $E6F59E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_202:
    ORA $9CE0            ; 0D E0 9C | Logical OR with accumulator (absolute)
    ORA $68FF            ; 0D FF 68 | Logical OR with accumulator (absolute)
    STX $FE              ; 86 FE | Store X register to zero page
    BMI $B7              ; 30 B7 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_203
; Address: $E6F5B7
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_203:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    STA ($00,X)          ; 81 00 | Update graphics data
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROR $B03C,X          ; 7E 3C B0 | Rotate right (absolute,X)
    STA ($52),Y          ; 91 52 | Update graphics data
    ADC $73AB,Y          ; 79 AB 73 | Add with carry (absolute,Y)
    LSR $10E6,X          ; 5E E6 10 | Logical shift right (absolute,X)
    CPX #$BE             ; E0 BE | Compare X register (immediate)
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BPL $E8              ; 10 E8 | Branch if positive
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPY #$42             ; C0 42 | Hardware register operation
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CPY $40              ; C4 40 | Compare Y register (zero page)
    LDX $FE00,Y          ; BE 00 FE | Load from absolute,Y into X register
    ROR $4E71            ; 6E 71 4E | Rotate right (absolute)
    ADC ($37),Y          ; 71 37 | Add with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    ORA $1010,Y          ; 19 10 10 | Logical OR with accumulator (absolute,Y)
    WDM #$4A             ; 42 4A | Reserved instruction
    STX $D7C6            ; 8E C6 D7 | Store X register to absolute address
    STA $0000,X          ; 9D 00 00 | Update graphics data
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_206
; Address: $E6F63E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_206:
    JSR $3400            ; 20 00 34 | Jump to subroutine
    PEA #$7494           ; F4 94 74 | Push effective address to stack
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_207
; Address: $E6F646
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_207:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $0A              ; 80 0A | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0C              ; 10 0C | Branch if positive
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $800F            ; 0D 0F 80 | Logical OR with accumulator (absolute)
    STA ($01,X)          ; 81 01 | Update graphics data
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STX $7883            ; 8E 83 78 | Store X register to absolute address
    BEQ $00              ; F0 00 | Branch if equal
    ROL $D8              ; 26 D8 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_208
; Address: $E6F678
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_208:
    JSR $ECDE            ; 20 DE EC | Jump to subroutine
    BPL $03              ; 10 03 | Branch if positive
    STX $9D71            ; 8E 71 9D | Store X register to absolute address
    STA $0808,X          ; 9D 08 08 | Update graphics data
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    INC $1000,X          ; FE 00 10 | Increment (absolute,X)
    BPL $30              ; 10 30 | Branch if positive
    BIT $133D            ; 2C 3D 13 | Test bits in accumulator (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    BMI $BB              ; 30 BB | Branch if negative
    BEQ $F2              ; F0 F2 | Branch if equal

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_20A
; Address: $E6F6CB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_20A:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    BNE $FC              ; D0 FC | Branch if not equal

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_20B
; Address: $E6F6F3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_20B:
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_20C
; Address: $E6F70C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_20C:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA $8F70            ; 8D 70 8F | Update graphics data
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    LDX $2BFF,Y          ; BE FF 2B | Load from absolute,Y into X register
    DEC $00CE            ; CE CE 00 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_20D
; Address: $E6F731
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_20D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $1ED4,X          ; 1E D4 1E | Arithmetic shift left (absolute,X)
    ASL $0031,X          ; 1E 31 00 | Arithmetic shift left (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $8A              ; 65 8A | Add with carry (zero page)
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($00,X)          ; 81 00 | Update graphics data
    STA ($6A,X)          ; 81 6A | Update graphics data
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)
    ROR $7E              ; 66 7E | Rotate right (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    SBC #$5B             ; E9 5B | Subtract with carry (immediate)
    JMP ($92E2)          ; 6C E2 92 | Jump to address (absolute indirect)
    DEC $54AD            ; CE AD 54 | Decrement (absolute)
    STA ($FE,X)          ; 81 FE | Update graphics data
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_20E
; Address: $E6F774
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_20E:
    JSR $02DF            ; 20 DF 02 | Jump to subroutine
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    SBC #$DB             ; E9 DB | Subtract with carry (immediate)
    ADC $07              ; 65 07 | Add with carry (zero page)
    LDA                  ; BF 7E DC FD | Read graphics status
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $FF5E,X          ; FD 5E FF | Subtract with carry (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    REP #$3D             ; C2 3D | Reset processor status bits
    LDA $1361            ; AD 61 13 | Read graphics status
    JMP ($5C73)          ; 6C 73 5C | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_20F
; Address: $E6F7AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_20F:
    ORA $420D            ; 0D 0D 42 | Hardware register operation
    WDM #$10             ; 42 10 | Reserved instruction
    STY $8000            ; 8C 00 80 | Store Y register to absolute address
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_210
; Address: $E6F7B8
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_210:
    JSR $4980            ; 20 80 49 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    STY $14              ; 84 14 | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LSR $80              ; 46 80 | Logical shift right (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP ($5A11)          ; 6C 11 5A | Jump to address (absolute indirect)
    AND ($E2,X)          ; 21 E2 | Logical AND with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    LDX $7800,Y          ; BE 00 78 | Load from absolute,Y into X register
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SBC $FF31,X          ; FD 31 FF | Subtract with carry (absolute,X)
    CPX #$88             ; E0 88 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_211
; Address: $E6F7EE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_211:
    JSL $02FD22          ; 22 22 FD 02 | Jump to subroutine long
    CMP $7777,X          ; DD 77 77 | Compare accumulator (absolute,X)
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    BEQ $0F              ; F0 0F | Branch if equal
    ORA $04F0            ; 0D F0 04 | Logical OR with accumulator (absolute)
    SBC $2012            ; ED 12 20 | Subtract with carry (absolute)
    PHY                  ; 5A | Push Y register to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_212
; Address: $E6F82C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_212:
    AND $0339,Y          ; 39 39 03 | Logical AND with accumulator (absolute,Y)
    STY $00              ; 84 00 | Store Y register to zero page
    ORA $4DE6,Y          ; 19 E6 4D | Logical OR with accumulator (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $00              ; C6 00 | Decrement (zero page)
    JMP $FFF3            ; 4C F3 FF | Jump to address
    CMP $F226,Y          ; D9 26 F2 | Compare accumulator (absolute,Y)
    ORA $08F7            ; 0D F7 08 | Logical OR with accumulator (absolute)
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA $5319,Y          ; 19 19 53 | Logical OR with accumulator (absolute,Y)
    CPX $00FF            ; EC FF 00 | Compare X register (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    BRA $E3              ; 80 E3 | Branch always
    BMI $FC              ; 30 FC | Branch if negative
    INC $00              ; E6 00 | Increment (zero page)
    ASL $B16E            ; 0E 6E B1 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_213
; Address: $E6F883
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_213:
    LDA                  ; BF 40 FF 26 | Read graphics status
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_214
; Address: $E6F88E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_214:
    JSR $F1FF            ; 20 FF F1 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_215
; Address: $E6F8A6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_215:
    ORA $BE66,Y          ; 19 66 BE | Logical OR with accumulator (absolute,Y)
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_216
; Address: $E6F8B2
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_216:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    CPY $3C              ; C4 3C | Compare Y register (zero page)
    ROL $7ED2            ; 2E D2 7E | Rotate left (absolute)
    CMP $FE23,X          ; DD 23 FE | Compare accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $50              ; 50 50 | Branch if overflow clear
    WDM #$56             ; 42 56 | Reserved instruction
    INC                  ; 1A | Increment accumulator
    LSR $7612,X          ; 5E 12 76 | Logical shift right (absolute,X)
    JMP $607C            ; 4C 7C 60 | Jump to address
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    DEX                  ; CA | Decrement X register
    AND ($A9,X)          ; 21 A9 | Logical AND with accumulator ((zero page,X))
    LDA ($00,X)          ; A1 00 | Read graphics status
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    STY $94              ; 84 94 | Store Y register to zero page
    STZ $F808            ; 9C 08 F8 | Store zero to absolute
    SEI                  ; 78 | Set interrupt disable flag
    STX $2C              ; 86 2C | Store X register to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    ORA ($6C),Y          ; 11 6C | Logical OR with accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    ROL                  ; 2A | Rotate left (accumulator)
    EOR ($62),Y          ; 51 62 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_217
; Address: $E6F922
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_217:
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    STX $04              ; 86 04 | Store X register to zero page
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    LDX $CF40,Y          ; BE 40 CF | Load from absolute,Y into X register
    BMI $B9              ; 30 B9 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX $CE00            ; EC 00 CE | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    ORA $4D              ; 05 4D | Logical OR with accumulator (zero page)
    ADC $FCFF,X          ; 7D FF FC | Add with carry (absolute,X)
    JMP $94FF            ; 4C FF 94 | Jump to address
    LDA                  ; BF 40 75 8A | Read graphics status
    DEC $F831            ; CE 31 F8 | Decrement (absolute)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    INC $93FF            ; EE FF 93 | Increment (absolute)
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    ORA $B6FF            ; 0D FF B6 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF C0 32 4D | Read graphics status
    AND #$56             ; 29 56 | Logical AND with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    ROL $007F            ; 2E 7F 00 | Rotate left (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDA $4643,X          ; BD 43 46 | Read graphics status
    TSX                  ; BA | Transfer stack pointer to X register
    INC $FCB8,X          ; FE B8 FC | Increment (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    INC $FEB2,X          ; FE B2 FE | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $5C              ; 70 5C | Branch if overflow set
    STZ $7D              ; 64 7D | Store zero to zero page

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_218
; Address: $E6F9EE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_218:
    BPL $10              ; 10 10 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $30              ; 80 30 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $38              ; 30 38 | Branch if negative
    ROL $A001            ; 2E 01 A0 | Rotate left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_219
; Address: $E6FA02
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_219:
    STX $86              ; 86 86 | Store X register to zero page
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_21A
; Address: $E6FA07
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_21A:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $7801,X          ; 1E 01 78 | Arithmetic shift left (absolute,X)
    ORA ($3A,X)          ; 01 3A | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    ASL $E0              ; 06 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPY $BC2C            ; CC 2C BC | Compare Y register (absolute)
    BMI $3C              ; 30 3C | Branch if negative
    STZ $8200            ; 9C 00 82 | Store zero to absolute
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    REP #$00             ; C2 00 | Reset processor status bits
    SEP #$00             ; E2 00 | Set processor status bits
    INC $2B00,X          ; FE 00 2B | Increment (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    EOR $E3B9,Y          ; 59 B9 E3 | Exclusive OR with accumulator (absolute,Y)
    STY $00              ; 84 00 | Store Y register to zero page
    WDM #$BD             ; 42 BD | Reserved instruction
    ORA $4DE6,Y          ; 19 E6 4D | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    ADC $7F20            ; 6D 20 7F | Add with carry (absolute)
    LDX $01FF,Y          ; BE FF 01 | Load from absolute,Y into X register
    STZ $639C            ; 9C 9C 63 | Store zero to absolute
    ADC $C080            ; 6D 80 C0 | Add with carry (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVC $71              ; 50 71 | Branch if overflow clear
    INC $00              ; E6 00 | Increment (zero page)
    BRA $14              ; 80 14 | Branch always
    DEX                  ; CA | Decrement X register
    INC $E0E0,X          ; FE E0 E0 | Game work RAM access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $FF              ; 84 FF | Store Y register to zero page
    INC $19              ; E6 19 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_21B
; Address: $E6FA97
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_21B:
    EOR $00EB            ; 4D EB 00 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $E306,Y          ; 19 06 E3 | Logical OR with accumulator (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$02             ; E0 02 | Compare X register (immediate)
    CMP $FB              ; C5 FB | Compare accumulator (zero page)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    BRA $F0              ; 80 F0 | Branch always
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    LDA $E040,X          ; BD 40 E0 | Game work RAM access
    CPX $2B10            ; EC 10 2B | Compare X register (absolute)
    ORA $0319,Y          ; 19 19 03 | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    ORA $2D26,Y          ; 19 26 2D | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_21D
; Address: $E6FADF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_21D:
    JSR $F4A8            ; 20 A8 F4 | Jump to subroutine
    BPL $14              ; 10 14 | Branch if positive
    BPL $30              ; 10 30 | Branch if positive
    BPL $68              ; 10 68 | Branch if positive

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_21E
; Address: $E6FAEC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_21E:
    JSR $B878            ; 20 78 B8 | Jump to subroutine
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    LDY $6C40,X          ; BC 40 6C | Load from absolute,X into Y register
    BRA $C8              ; 80 C8 | Branch always
    BRA $04              ; 80 04 | Branch always
    BRA $04              ; 80 04 | Branch always
    BPL $18              ; 10 18 | Branch if positive
    ASL $3C33,X          ; 1E 33 3C | Arithmetic shift left (absolute,X)
    ORA $1C13,Y          ; 19 13 1C | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_220
; Address: $E6FB1A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_220:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    BRA $80              ; 80 80 | Branch always
    BVC $D0              ; 50 D0 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_221
; Address: $E6FB28
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_221:
    JSR $30E0            ; 20 E0 30 | Jump to subroutine
    BEQ $A0              ; F0 A0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_222
; Address: $E6FB2E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_222:
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_223
; Address: $E6FB3E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_223:
    BPL $04              ; 10 04 | Branch if positive
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND $F706,X          ; 3D 06 F7 | Logical AND with accumulator (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $C200,X          ; FE 00 C2 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA $C1C18F          ; 8F 8F C1 C1 | Update graphics data
    CPY #$36             ; C0 36 | Compare Y register (immediate)
    BVS $7F              ; 70 7F | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BVS $00              ; 70 00 | Branch if overflow set
    ROL $CE00,X          ; 3E 00 CE | Rotate left (absolute,X)
    AND ($C9),Y          ; 31 C9 | Logical AND with accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STY $9700            ; 8C 00 97 | Store Y register to absolute address
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    BRA $CA              ; 80 CA | Branch always
    DEX                  ; CA | Decrement X register
    PLA                  ; 68 | Pull accumulator from stack
    EOR #$F7             ; 49 F7 | Exclusive OR with accumulator (immediate)
    CPY $8EFC            ; CC FC 8E | Compare Y register (absolute)
    BRA $9F              ; 80 9F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_224
; Address: $E6FB98
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_224:
    BRA $00              ; 80 00 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    STA $3EC170          ; 8F 70 C1 3E | Update graphics data
    BNE $2F              ; D0 2F | Branch if not equal
    SBC #$73             ; E9 73 | Subtract with carry (immediate)
    BRA $61              ; 80 61 | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $0F              ; 80 0F | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BNE $06              ; D0 06 | Branch if not equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $70              ; 80 70 | Branch always
    DEC $DF30            ; CE 30 DF | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_225
; Address: $E6FBD5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_225:
    JSR $E019            ; 20 19 E0 | Game work RAM access
    BVS $80              ; 70 80 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_226
; Address: $E6FBDB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_226:
    BRA $70              ; 80 70 | Branch always
    BRA $70              ; 80 70 | Branch always
    BRA $0F              ; 80 0F | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_227
; Address: $E6FBE5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_227:
    BPL $16              ; 10 16 | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BPL $20              ; 10 20 | Branch if positive
    ASL $1730            ; 0E 30 17 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_22A
; Address: $E6FBFF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_22A:
    JSR $7470            ; 20 70 74 | Jump to subroutine
    BVS $74              ; 70 74 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_22B
; Address: $E6FC09
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_22B:
    SEI                  ; 78 | Set interrupt disable flag
    BMI $F8              ; 30 F8 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    STY $8C00            ; 8C 00 8C | Store Y register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$38             ; A0 38 | Load immediate value into Y register
    BRA $04              ; 80 04 | Branch always
    ASL $141B,X          ; 1E 1B 14 | Arithmetic shift left (absolute,X)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ORA #$1E             ; 09 1E | Logical OR with accumulator (immediate)
    ORA $141E,Y          ; 19 1E 14 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_22F
; Address: $E6FC3C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_22F:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    BCS $70              ; B0 70 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_230
; Address: $E6FC43
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_230:
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BEQ $40              ; F0 40 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$08             ; E0 08 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    AND $3D22,X          ; 3D 22 3D | Logical AND with accumulator (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LDA $7C0CEF          ; AF EF 0C 7C | Read graphics status
    SBC ($CE),Y          ; F1 CE | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_232
; Address: $E6FC70
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_232:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ADC $F2F9,Y          ; 79 F9 F2 | Add with carry (absolute,Y)
    AND $193F,X          ; 3D 3F 19 | Logical AND with accumulator (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $4F              ; 30 4F | Branch if negative
    BCC $F2              ; 90 F2 | Branch if carry clear
    STA                  ; 9F 39 3F 30 | Update graphics data
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_233
; Address: $E6FCAE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_233:
    PLA                  ; 68 | Pull accumulator from stack
    BRA $00              ; 80 00 | Branch always
    ORA $1000            ; 0D 00 10 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_234
; Address: $E6FCB5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_234:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    INC $4B              ; E6 4B | Increment (zero page)
    EOR $8B88            ; 4D 88 8B | Exclusive OR with accumulator (absolute)
    CPY $FD              ; C4 FD | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_235
; Address: $E6FCCA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_235:
    JSL $F60ADE          ; 22 DE 0A F6 | Jump to subroutine long
    STX $7A              ; 86 7A | Store X register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCS $00              ; B0 00 | Branch if carry set
    BVS $04              ; 70 04 | Branch if overflow set
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $7E              ; 10 7E | Branch if positive
    STA ($DD,X)          ; 81 DD | Update graphics data

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_236
; Address: $E6FCE5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_236:
    JSL $F443BC          ; 22 BC 43 F4 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $0023,X          ; DD 23 00 | Compare accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_237
; Address: $E6FD06
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_237:
    INC $AFFE,X          ; FE FE AF | Increment (absolute,X)
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ROR $3D90            ; 6E 90 3D | Rotate right (absolute)
    AND $8202,X          ; 3D 02 82 | Logical AND with accumulator (absolute,X)
    ORA $85              ; 05 85 | Logical OR with accumulator (zero page)
    AND $6C3F,Y          ; 39 3F 6C | Logical AND with accumulator (absolute,Y)
    LDA                  ; BF 08 08 00 | Read graphics status
    REP #$00             ; C2 00 | Reset processor status bits
    STA $BA60,X          ; 9D 60 BA | Update graphics data
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    BVC $50              ; 50 50 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STZ $C639            ; 9C 39 C6 | Store zero to absolute
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $80              ; 65 80 | Add with carry (zero page)
    INC $AF01,X          ; FE 01 AF | Increment (absolute,X)
    CPX #$83             ; E0 83 | Compare X register (immediate)
    STA $0962,X          ; 9D 62 09 | Update graphics data
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $5F0E            ; 0E 0E 5F | Arithmetic shift left (absolute)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_238
; Address: $E6FD74
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_238:
    STA $00F170          ; 8F 70 F1 00 | Update graphics data
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $E0              ; 10 E0 | Game work RAM access
    STY $9E70            ; 8C 70 9E | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_239
; Address: $E6FD80
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_239:
    ORA $0039,Y          ; 19 39 00 | Logical OR with accumulator (absolute,Y)
    BVS $00              ; 70 00 | Branch if overflow set
    ROL $1F3E,X          ; 3E 3E 1F | Rotate left (absolute,X)
    STA ($99,X)          ; 81 99 | Update graphics data
    ROL $00              ; 26 00 | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $4161,X          ; 1E 61 41 | Arithmetic shift left (absolute,X)
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $7C              ; 80 7C | Branch always
    PHY                  ; 5A | Push Y register to stack
    BIT $F0              ; 24 F0 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_23A
; Address: $E6FDA1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_23A:
    PEA #$2400           ; F4 00 24 | Push effective address to stack
    STX $3E0C            ; 8E 0C 3E | Store X register to absolute address
    BCS $FC              ; B0 FC | Branch if carry set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PEA #$AE08           ; F4 08 AE | Push effective address to stack
    BVC $C2              ; 50 C2 | Branch if overflow clear
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    SBC $1906,Y          ; F9 06 19 | Subtract with carry (absolute,Y)
    ASL $1E1D,X          ; 1E 1D 1E | Arithmetic shift left (absolute,X)
    ASL $0E0F            ; 0E 0F 0E | Arithmetic shift left (absolute)
    LSR $206F            ; 4E 6F 20 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_23B
; Address: $E6FDD2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_23B:
    JSR $2800            ; 20 00 28 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BMI $40              ; 30 40 | Branch if negative
    BVS $80              ; 70 80 | Branch if overflow set
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $B0              ; 90 B0 | Branch if carry clear
    BVS $F0              ; 70 F0 | Branch if overflow set
    BNE $D0              ; D0 D0 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_23C
; Address: $E6FDE9
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_23C:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $A0              ; 80 A0 | Branch always
    LDY #$62             ; A0 62 | Load immediate value into Y register
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    ASL $7A              ; 06 7A | Arithmetic shift left (zero page)
    ORA $5A              ; 05 5A | Logical OR with accumulator (zero page)
    ORA $94              ; 05 94 | Logical OR with accumulator (zero page)
    ORA #$60             ; 09 60 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    AND $3F40,X          ; 3D 40 3F | Logical AND with accumulator (absolute,X)
    BPL $6F              ; 10 6F | Branch if positive
    STZ $7F              ; 64 7F | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    INC $BE42,X          ; FE 42 BE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BIT $FA              ; 24 FA | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_23D
; Address: $E6FE29
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_23D:
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_23E
; Address: $E6FE2E
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_23E:
    JSR $00FC            ; 20 FC 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($BE,X)          ; 01 BE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $7B01,X          ; FE 01 7B | Increment (absolute,X)
    STY $FF              ; 84 FF | Store Y register to zero page
    BPL $7F              ; 10 7F | Branch if positive
    BRA $F7              ; 80 F7 | Branch always
    PHP                  ; 08 | Push processor status to stack
    EOR $01A2,X          ; 5D A2 01 | Exclusive OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    WDM #$42             ; 42 42 | Hardware register operation
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    STA $000070          ; 8F 70 00 00 | Update graphics data
    LDA $4600,X          ; BD 00 46 | Read graphics status
    AND $710E,Y          ; 39 0E 71 | Logical AND with accumulator (absolute,Y)
    JMP ($0300)          ; 6C 00 03 | Jump to address (absolute indirect)
    STA ($F9,X)          ; 81 F9 | Update graphics data
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STY $D000            ; 8C 00 D0 | Store Y register to absolute address
    LDY $08              ; A4 08 | Load from zero page into Y register
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $7300,Y          ; F9 00 73 | Subtract with carry (absolute,Y)
    BRA $D3              ; 80 D3 | Branch always

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_23F
; Address: $E6FE9D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_23F:
    JSR $2AD5            ; 20 D5 2A | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    WDM #$BD             ; 42 BD | Reserved instruction
    STA ($7E,X)          ; 81 7E | Update graphics data
    BRA $7F              ; 80 7F | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $38              ; 30 38 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCS $F0              ; B0 F0 | Branch if carry set
    CPY #$4D             ; C0 4D | Compare Y register (immediate)
    BCS $8F              ; B0 8F | Branch if carry set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $4F              ; 70 4F | Branch if overflow set
    BCS $06              ; B0 06 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_240
; Address: $E6FEE4
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_240:
    BVS $FF              ; 70 FF | Branch if overflow set
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF 00 FF C0 | Read graphics status
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $40              ; 10 40 | Branch if positive
    SBC $BF00,X          ; FD 00 BF | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    ORA ($A5,X)          ; 01 A5 | Logical OR with accumulator ((zero page,X))
    BNE $F1              ; D0 F1 | Branch if not equal
    STA $FE              ; 85 FE | Update graphics data
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    SBC $F300,Y          ; F9 00 F3 | Subtract with carry (absolute,Y)
    BRA $22              ; 80 22 | Branch always
    CMP $6B4A,X          ; DD 4A 6B | Compare accumulator (absolute,X)
    AND ($39,X)          ; 21 39 | Logical AND with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    AND $3F3F,X          ; 3D 3F 3F | Logical AND with accumulator (absolute,X)
    LSR $80              ; 46 80 | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_241
; Address: $E6FF5B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_241:
    JSR $0403            ; 20 03 04 | Jump to subroutine
    STY $84              ; 84 84 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($E6),Y          ; 31 E6 | Logical AND with accumulator ((zero page),Y)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $E0              ; 06 E0 | Game work RAM access
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    ROL $7F              ; 26 7F | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_243
; Address: $E6FF86
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_243:
    AND ($7F),Y          ; 31 7F | Logical AND with accumulator ((zero page),Y)
    ROR $EF6D,X          ; 7E 6D EF | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4C_GraphicsFunction_244
; Address: $E6FF91
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank4C_GraphicsFunction_244:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $01              ; 80 01 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $0C              ; 90 0C | Branch if carry clear
    BRA $20              ; 80 20 | Branch always
    BRA $07              ; 80 07 | Branch always
    SBC $F9B0,X          ; FD B0 F9 | Subtract with carry (absolute,X)
    SBC $FEE2,X          ; FD E2 FE | Subtract with carry (absolute,X)
    LDY $5CBD            ; AC BD 5C | Load from absolute address into Y register
    ADC $FD1C,X          ; 7D 1C FD | Add with carry (absolute,X)
    DEC $FE              ; C6 FE | Decrement (zero page)
    BMI $07              ; 30 07 | Branch if negative
    BMI $03              ; 30 03 | Branch if negative
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    STA ($3D,X)          ; 81 3D | Update graphics data
    ADC $7A62,X          ; 7D 62 7A | Add with carry (absolute,X)
    BIT $A4              ; 24 A4 | Test bits in accumulator (zero page)
    STZ $64              ; 64 64 | Store zero to zero page
    ORA $439F            ; 0D 9F 43 | Logical OR with accumulator (absolute)
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    ORA $87              ; 05 87 | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA ($E0),Y          ; 91 E0 | Game work RAM access
    STY $8930            ; 8C 30 89 | Store Y register to absolute address
    BVS $0C              ; 70 0C | Branch if overflow set
    EOR $60              ; 45 60 | Exclusive OR with accumulator (zero page)
    SBC $38              ; E5 38 | Subtract with carry (zero page)
    AND $8382,X          ; 3D 82 83 | Logical AND with accumulator (absolute,X)
    BRA $81              ; 80 81 | Branch always
    ORA ($91,X)          ; 01 91 | Logical OR with accumulator ((zero page,X))
    BRA $BB              ; 80 BB | Branch always
    BRA $1B              ; 80 1B | Branch always
    REP #$01             ; C2 01 | Reset processor status bits
    BRA $7D              ; 80 7D | Branch always
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
