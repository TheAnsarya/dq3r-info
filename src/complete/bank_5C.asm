;==============================================================================
; Dragon Quest III - Bank $5C
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $EE0000-$EE7FFF
; Instructions: 8084
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_5C"

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_000
; Address: $EE8003
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_000:
    AND ($FB),Y          ; 31 FB | Logical AND with accumulator ((zero page),Y)
    SBC $BABA,Y          ; F9 BA BA | Subtract with carry (absolute,Y)
    BIT $95              ; 24 95 | Test bits in accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    INC $DF01,X          ; FE 01 DF | Increment (absolute,X)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    SBC $BACF,Y          ; F9 CF BA | Subtract with carry (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_001
; Address: $EE8020
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_001:
    LDA $B5FF,Y          ; B9 FF B5 | Load from absolute,Y into accumulator
    PHX                  ; DA | Push X register to stack
    LDA $00FF74          ; AF 74 FF 00 | Load from absolute long address into accumulator
    BPL $BF              ; 10 BF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    LDY $FF              ; A4 FF | Load from zero page into Y register
    SBC $F7DF,X          ; FD DF F7 | Subtract with carry (absolute,X)
    SBC $FF46,Y          ; F9 46 FF | Subtract with carry (absolute,Y)
    SBC $F70B,X          ; FD 0B F7 | Subtract with carry (absolute,X)
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag
    DEC                  ; 3A | Decrement accumulator
    STA                  ; 9F 00 53 0B | Store accumulator to absolute long,X
    STA $FCB5            ; 8D B5 FC | Store accumulator to absolute address
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    PEA #$720B           ; F4 0B 72 | Push effective address to stack
    STA $FC33            ; 8D 33 FC | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_002
; Address: $EE807E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_002:
    INX                  ; E8 | Increment X register
    ROR $E2C1,X          ; 7E C1 E2 | Rotate right (absolute,X)
    ADC $7E6B,Y          ; 79 6B 7E | Add with carry (absolute,Y)
    INC $3C3C,X          ; FE 3C 3C | Increment (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_003
; Address: $EE8096
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_003:
    INX                  ; E8 | Increment X register
    STZ $3FFF            ; 9C FF 3F | Store zero to absolute
    INC $3CFF,X          ; FE FF 3C | Increment (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $BF              ; F0 BF | Branch if equal
    AND $A739,Y          ; 39 39 A7 | Logical AND with accumulator (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    BEQ $0D              ; F0 0D | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC $FF              ; C6 FF | Decrement (zero page)
    ROR $98D0,X          ; 7E D0 98 | Rotate right (absolute,X)
    INC $FCF7,X          ; FE F7 FC | Increment (absolute,X)
    NOP                  ; EA | No operation
    SBC $FFF9,X          ; FD F9 FF | Subtract with carry (absolute,X)
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_004
; Address: $EE80D2
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_004:
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    LDA                  ; BF BF 7F F7 | Load from absolute long,X into accumulator
    REP #$02             ; C2 02 | Reset processor status bits
    INC $3F00,X          ; FE 00 3F | Increment (absolute,X)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    NOP                  ; EA | No operation
    SEC                  ; 38 | Set carry flag
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    LDA                  ; BF 03 FF 0F | Load from absolute long,X into accumulator
    INC $805F,X          ; FE 5F 80 | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    BIT $2ED3            ; 2C D3 2E | Test bits in accumulator (absolute)
    ROL $8EF2            ; 2E F2 8E | Rotate left (absolute)
    PLX                  ; FA | Pull X register from stack
    ASL $BA              ; 06 BA | Arithmetic shift left (zero page)
    LSR $BA              ; 46 BA | Logical shift right (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    AND $3D03,X          ; 3D 03 3D | Logical AND with accumulator (absolute,X)
    ADC $6D13,X          ; 7D 13 6D | Add with carry (absolute,X)
    ADC $F7FF            ; 6D FF F7 | Add with carry (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $9C9C            ; 9C 9C 9C | Store zero to absolute
    STZ $F000            ; 9C 00 F0 | Store zero to absolute
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 98 FF 00 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $FCFF,X          ; FD FF FC | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_005
; Address: $EE826B
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_005:
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_006
; Address: $EE8281
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_006:
    CMP $EDB3,X          ; DD B3 ED | Compare accumulator (absolute,X)
    SBC $EDB3            ; ED B3 ED | Subtract with carry (absolute)
    CMP $CDB3            ; CD B3 CD | Compare accumulator (absolute)
    CMP $5DA6            ; CD A6 5D | Compare accumulator (absolute)
    BPL $6F              ; 10 6F | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_008
; Address: $EE8296
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_008:
    JSR $005F            ; 20 5F 00 | Jump to subroutine
    XBA                  ; EB | Exchange accumulator bytes
    INX                  ; E8 | Increment X register
    XBA                  ; EB | Exchange accumulator bytes
    INX                  ; E8 | Increment X register
    XBA                  ; EB | Exchange accumulator bytes
    INX                  ; E8 | Increment X register
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SEP #$F0             ; E2 F0 | Set processor status bits
    SEP #$F4             ; E2 F4 | Set processor status bits
    PEA #$F41C           ; F4 1C F4 | Push effective address to stack
    SBC $ED1F            ; ED 1F ED | Subtract with carry (absolute)
    SBC $FF1F,X          ; FD 1F FF | Subtract with carry (absolute,X)
    ORA $3DFF,X          ; 1D FF 3D | Logical OR with accumulator (absolute,X)
    CMP $CD1F,X          ; DD 1F CD | Compare accumulator (absolute,X)
    CMP $99CB            ; CD CB 99 | Compare accumulator (absolute)
    STA                  ; 9F 91 97 00 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_009
; Address: $EE82D6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_009:
    JSR $303F            ; 20 3F 30 | Jump to subroutine
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_00A
; Address: $EE82DE
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_00A:
    PLA                  ; 68 | Pull accumulator from stack
    SBC $31C7,Y          ; F9 C7 31 | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    INC $FE21,X          ; FE 21 FE | Increment (absolute,X)
    ORA ($BE,X)          ; 01 BE | Logical OR with accumulator ((zero page,X))
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    CMP ($60,X)          ; C1 60 | Compare accumulator ((zero page,X))
    CMP ($38,X)          ; C1 38 | Compare accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_00B
; Address: $EE833B
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_00B:
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($A6,X)          ; 01 A6 | Logical OR with accumulator ((zero page,X))
    EOR $59A6,Y          ; 59 A6 59 | Exclusive OR with accumulator (absolute,Y)
    LDY $CCDB            ; AC DB CC | Load from absolute address into Y register
    ADC $7D72,X          ; 7D 72 7D | Add with carry (absolute,X)
    AND $B522,X          ; 3D 22 B5 | Logical AND with accumulator (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    BEQ $E2              ; F0 E2 | Branch if equal
    LDY #$F3             ; A0 F3 | Load immediate value into Y register
    LDA ($F2,X)          ; A1 F2 | Load from (zero page,X) into accumulator
    PHB                  ; 8B | Push data bank register to stack
    SBC $AD1F            ; ED 1F AD | Subtract with carry (absolute)
    LDY $AE5F            ; AC 5F AE | Load from absolute address into Y register
    EOR $7C8F,X          ; 5D 8F 7C | Exclusive OR with accumulator (absolute,X)
    STA $7C8F7C          ; 8F 7C 8F 7C | Store accumulator to absolute long address
    STA ($97),Y          ; 91 97 | Store accumulator to (zero page),Y
    STA ($87,X)          ; 81 87 | Store accumulator to (zero page,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STY $D4              ; 84 D4 | Store Y register to zero page
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SBC $B9FF,Y          ; F9 FF B9 | Subtract with carry (absolute,Y)
    LDA $ABFF,Y          ; B9 FF AB | Load from absolute,Y into accumulator
    BEQ $11              ; F0 11 | Branch if equal
    BEQ $70              ; F0 70 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    DEC $0F83            ; CE 83 0F | Decrement (absolute)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    INC $FE0F,X          ; FE 0F FE | Increment (absolute,X)
    ORA $71F8            ; 0D F8 71 | Logical OR with accumulator (absolute)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    STA ($C0,X)          ; 81 C0 | Store accumulator to (zero page,X)
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_00C
; Address: $EE83EE
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_00C:
    SBC $0002,X          ; FD 02 00 | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    BIT #$2F             ; 89 2F | Test bits in accumulator (immediate)
    CMP ($6B),Y          ; D1 6B | Compare accumulator ((zero page),Y)
    STA $37CB,X          ; 9D CB 37 | Store accumulator to absolute,X
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    CPX $EC13            ; EC 13 EC | Compare X register (absolute)
    BEQ $F3              ; F0 F3 | Branch if equal
    PHB                  ; 8B | Push data bank register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    XBA                  ; EB | Exchange accumulator bytes
    INC                  ; 1A | Increment accumulator
    XBA                  ; EB | Exchange accumulator bytes
    BPL $9F              ; 10 9F | Branch if positive
    STZ $9F              ; 64 9F | Store zero to zero page
    STZ $9F              ; 64 9F | Store zero to zero page
    STZ $73              ; 64 73 | Store zero to zero page
    STY $7C87            ; 8C 87 7C | Store Y register to absolute address
    STX $7D              ; 86 7D | Store X register to zero page
    ASL $04F5            ; 0E F5 04 | Arithmetic shift left (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    PHX                  ; DA | Push X register to stack
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    SBC $FCE9,X          ; FD E9 FC | Subtract with carry (absolute,X)
    SBC ($FC,X)          ; E1 FC | Subtract with carry ((zero page,X))
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    LDX $2543,Y          ; BE 43 25 | Load from absolute,Y into X register
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    LDA $AA67,Y          ; B9 67 AA | Load from absolute,Y into accumulator
    LDX #$5F             ; A2 5F | Load immediate value into X register
    LDX #$5F             ; A2 5F | Load immediate value into X register
    ASL $1CF8            ; 0E F8 1C | Arithmetic shift left (absolute)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$73             ; C0 73 | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_00D
; Address: $EE8490
; Size: 123 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_00D:
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $FD8E,X          ; FD 8E FD | Subtract with carry (absolute,X)
    INC $C2F1,X          ; FE F1 C2 | Increment (absolute,X)
    SBC ($82),Y          ; F1 82 | Subtract with carry ((zero page),Y)
    SBC $BDC2,X          ; FD C2 BD | Subtract with carry (absolute,X)
    WDM #$BD             ; 42 BD | Reserved instruction
    ROR $7DD6,X          ; 7E D6 7D | Rotate right (absolute,X)
    BRA $03              ; 80 03 | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 1F EF 1F | Load from absolute long,X into accumulator
    INC $CEBF            ; EE BF CE | Increment (absolute)
    CMP $DDFF,X          ; DD FF DD | Compare accumulator (absolute,X)
    STA $B37F,X          ; 9D 7F B3 | Store accumulator to absolute,X
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0E              ; F0 0E | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($1D),Y          ; F1 1D | Subtract with carry ((zero page),Y)
    SEP #$1D             ; E2 1D | Set processor status bits
    SEP #$1D             ; E2 1D | Set processor status bits
    SEP #$33             ; E2 33 | Set processor status bits
    CPY $6CFB            ; CC FB 6C | Compare Y register (absolute)
    JMP $D8EF            ; 4C EF D8 | Jump to address
    CMP $99F6,Y          ; D9 F6 99 | Compare accumulator (absolute,Y)
    STA $10FF,Y          ; 99 FF 10 | Store accumulator to absolute,Y
    STA $9F6074          ; 8F 74 60 9F | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C0 3F C0 | Load from absolute long,X into accumulator
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ADC $79A6,Y          ; 79 A6 79 | Add with carry (absolute,Y)
    ADC $FBB6,X          ; 7D B6 FB | Add with carry (absolute,X)
    ORA $EB              ; 05 EB | Logical OR with accumulator (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    SEP #$5D             ; E2 5D | Set processor status bits
    CMP $DF20,X          ; DD 20 DF | Compare accumulator (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 03 | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    LDY #$FF             ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_00E
; Address: $EE8548
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_00E:
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BVS $FF              ; 70 FF | Branch if overflow set
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    DEC $8383            ; CE 83 83 | Decrement (absolute)
    BMI $00              ; 30 00 | Branch if negative
    ADC $BD66,X          ; 7D 66 BD | Add with carry (absolute,X)
    LDA $B84F,X          ; BD 4F B8 | Load from absolute,X into accumulator
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $9FF3            ; 0D F3 9F | Logical OR with accumulator (absolute)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    STA $FF5EEF          ; 8F EF 5E FF | Store accumulator to absolute long address
    DEC $FEB1,X          ; DE B1 FE | Decrement (absolute,X)
    ORA ($23),Y          ; 11 23 | Logical OR with accumulator ((zero page),Y)
    BEQ $4E              ; F0 4E | Branch if equal
    LDA ($0C),Y          ; B1 0C | Load from (zero page),Y into accumulator
    BCC $63              ; 90 63 | Branch if carry clear
    BPL $EF              ; 10 EF | Branch if positive
    STA                  ; 9F 64 9F 64 | Store accumulator to absolute long,X
    STA                  ; 9F 6B 7F 93 | Store accumulator to absolute long,X
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLB                  ; AB | Pull data bank register from stack
    BCS $53              ; B0 53 | Branch if carry set
    LDA $66              ; A5 66 | Load from zero page into accumulator
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    BIT $DF              ; 24 DF | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    SBC $ED5B            ; ED 5B ED | Subtract with carry (absolute)
    SBC $00DF            ; ED DF 00 | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C0 3F C0 | Load from absolute long,X into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $00F0,X          ; 1E F0 00 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FE02,X          ; FE 02 FE | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BEQ $80              ; F0 80 | Branch if equal
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_00F
; Address: $EE864F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_00F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $20              ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_010
; Address: $EE8660
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_010:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    LDA                  ; BF 00 FF 1F | Load from absolute long,X into accumulator
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    STZ $5B              ; 64 5B | Store zero to zero page
    STZ $CE              ; 64 CE | Store zero to zero page
    ADC ($B6),Y          ; 71 B6 | Add with carry ((zero page),Y)
    EOR #$B7             ; 49 B7 | Exclusive OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    EOR $3BB2            ; 4D B2 3B | Exclusive OR with accumulator (absolute)
    PEA #$7F00           ; F4 00 7F | Push effective address to stack
    BRA $7F              ; 80 7F | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_012
; Address: $EE86A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_012:
    LDY #$73             ; A0 73 | Load immediate value into Y register
    CPX $52EC            ; EC EC 52 | Compare X register (absolute)
    CPX $CD52            ; EC 52 CD | Compare X register (absolute)
    ADC $DD20            ; 6D 20 DD | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_013
; Address: $EE86B2
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_013:
    JSR $22DD            ; 20 DD 22 | Jump to subroutine
    CMP ($60),Y          ; D1 60 | Compare accumulator ((zero page),Y)
    STZ $BF40            ; 9C 40 BF | Store zero to absolute
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA #$EE             ; A9 EE | Load immediate value into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    BCC $7F              ; 90 7F | Branch if carry clear
    BCC $7F              ; 90 7F | Branch if carry clear
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    SBC $951F,X          ; FD 1F 95 | Subtract with carry (absolute,X)
    ROL $E6              ; 26 E6 | Rotate left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $F21E,X          ; 1E 1E F2 | Arithmetic shift left (absolute,X)
    INC $DCA0,X          ; FE A0 DC | Increment (absolute,X)
    LDY $FF00,X          ; BC 00 FF | Load from absolute,X into Y register
    PHP                  ; 08 | Push processor status to stack
    ORA $F9FF,Y          ; 19 FF F9 | Logical OR with accumulator (absolute,Y)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $FD              ; F0 FD | Branch if equal
    SEP #$FC             ; E2 FC | Set processor status bits

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_014
; Address: $EE8708
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_014:
    SEP #$3F             ; E2 3F | Set processor status bits
    LDX $CF              ; A6 CF | Load from zero page into X register
    ROL $00DF            ; 2E DF 00 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_015
; Address: $EE8718
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_015:
    JSR $2013            ; 20 13 20 | Jump to subroutine
    BPL $3F              ; 10 3F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 41 AF 53 | Load from absolute long,X into accumulator
    DEC $C0FF            ; CE FF C0 | Decrement (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_016
; Address: $EE8733
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_016:
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    BCS $40              ; B0 40 | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    LDA                  ; BF 8F 7F FE | Load from absolute long,X into accumulator
    LDA                  ; BF FE 7F F9 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    STZ $FEFE,X          ; 9E FE FE | Store zero to absolute,X
    ASL $04FE            ; 0E FE 04 | Arithmetic shift left (absolute)
    INC $FF15,X          ; FE 15 FF | Increment (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ADC $FFF7,Y          ; 79 F7 FF | Add with carry (absolute,Y)
    CMP $9DE5            ; CD E5 9D | Compare accumulator (absolute)
    CMP #$B9             ; C9 B9 | Compare accumulator (immediate)
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SBC $EDD2            ; ED D2 ED | Subtract with carry (absolute)
    LDX $A0D1            ; AE D1 A0 | Load from absolute address into X register
    LDA $B9C7,X          ; BD C7 B9 | Load from absolute,X into accumulator
    INC $FC24,X          ; FE 24 FC | Increment (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STY $788F            ; 8C 8F 78 | Store Y register to absolute address
    SBC ($7E,X)          ; E1 7E | Subtract with carry ((zero page,X))
    ADC $FA96,X          ; 7D 96 FA | Add with carry (absolute,X)
    LDY #$FC             ; A0 FC | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BVS $FF              ; 70 FF | Branch if overflow set
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_017
; Address: $EE87BA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_017:
    BRA $7F              ; 80 7F | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STZ $BC              ; 64 BC | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_019
; Address: $EE87CA
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_019:
    JSR $5B23            ; 20 23 5B | Jump to subroutine
    ORA $3EFF            ; 0D FF 3E | Logical OR with accumulator (absolute)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    NOP                  ; EA | No operation
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    INC $0F              ; E6 0F | Increment (zero page)
    STA $370C74          ; 8F 74 0C 37 | Store accumulator to absolute long address
    CPX $05F7            ; EC F7 05 | Compare X register (absolute)
    ASL $1E05,X          ; 1E 05 1E | Arithmetic shift left (absolute,X)
    SEP #$FD             ; E2 FD | Set processor status bits
    INC $F9              ; E6 F9 | Increment (zero page)
    CPY $DB              ; C4 DB | Compare Y register (zero page)
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    JMP ($2FF0)          ; 6C F0 2F | Jump to address (absolute indirect)
    BCS $6F              ; B0 6F | Branch if carry set
    STA                  ; 9F 6F 2F DF | Store accumulator to absolute long,X
    STA $7F877F          ; 8F 7F 87 7F | Store accumulator to absolute long address
    LDA                  ; BF 07 FF 00 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    SBC $F91F,X          ; FD 1F F9 | Subtract with carry (absolute,X)
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    PLA                  ; 68 | Pull accumulator from stack
    BIT #$FE             ; 89 FE | Test bits in accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF DA 3D BE | Load from absolute long,X into accumulator
    ADC $FFE0,Y          ; 79 E0 FF | Add with carry (absolute,Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ORA $2BFF,Y          ; 19 FF 2B | Logical OR with accumulator (absolute,Y)
    STA $ABEF,X          ; 9D EF AB | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    CMP $D1EF,X          ; DD EF D1 | Compare accumulator (absolute,X)
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    LDA $BFD0,X          ; BD D0 BF | Load from absolute,X into accumulator
    CPY $7F80            ; CC 80 7F | Compare Y register (absolute)
    BRA $7F              ; 80 7F | Branch always
    CPY $F529            ; CC 29 F5 | Compare Y register (absolute)
    SBC $9FEE            ; ED EE 9F | Subtract with carry (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP ($02EC)          ; 6C EC 02 | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_01A
; Address: $EE889A
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_01A:
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F FF 1F FF | Store accumulator to absolute long,X
    AND $FDF6,X          ; 3D F6 FD | Logical AND with accumulator (absolute,X)
    SBC $FBF6,Y          ; F9 F6 FB | Subtract with carry (absolute,Y)
    PEA #$FCF3           ; F4 F3 FC | Push effective address to stack
    SBC $F97F,X          ; FD 7F F9 | Subtract with carry (absolute,X)
    LDY $BB              ; A4 BB | Load from zero page into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    BVS $7F              ; 70 7F | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BVS $7F              ; 70 7F | Branch if overflow set
    LDA                  ; BF 77 BF 2F | Load from absolute long,X into accumulator
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $E32D69          ; AF 69 2D E3 | Load from absolute long address into accumulator
    ADC #$E7             ; 69 E7 | Add with carry (immediate)
    INC $FE32,X          ; FE 32 FE | Increment (absolute,X)
    ROL $5EB6,X          ; 3E B6 5E | Rotate left (absolute,X)
    LDA ($78),Y          ; B1 78 | Load from (zero page),Y into accumulator
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA #$DD             ; A9 DD | Load immediate value into accumulator
    AND ($CD),Y          ; 31 CD | Logical AND with accumulator ((zero page),Y)
    TSX                  ; BA | Transfer stack pointer to X register
    PLA                  ; 68 | Pull accumulator from stack
    LDY $DE2F,X          ; BC 2F DE | Load from absolute,X into Y register
    STZ $4FF7,X          ; 9E F7 4F | Store zero to absolute,X
    CPY $FF02            ; CC 02 FF | Compare Y register (absolute)
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_01B
; Address: $EE8936
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_01B:
    JSL $FE01DF          ; 22 DF 01 FE | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C1 3E EF | Load from absolute long,X into accumulator
    DEC $CEEF            ; CE EF CE | Decrement (absolute)
    ROR $7C0F,X          ; 7E 0F 7C | Rotate right (absolute,X)
    LDA $B33B,Y          ; B9 3B B3 | Load from absolute,Y into accumulator
    AND ($EB),Y          ; 31 EB | Logical AND with accumulator ((zero page),Y)
    AND $8E              ; 25 8E | Logical AND with accumulator (zero page)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_01C
; Address: $EE8954
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_01C:
    BMI $8F              ; 30 8F | Branch if negative
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C0 7F C0 | Load from absolute long,X into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    ADC $8909,X          ; 7D 09 89 | Add with carry (absolute,X)
    ORA #$89             ; 09 89 | Logical OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    BRA $A3              ; 80 A3 | Branch always
    LDY $5CFB            ; AC FB 5C | Load from absolute address into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 9F 9F 9F | Store accumulator to absolute long,X
    LDA                  ; BF 27 BF 1F | Load from absolute long,X into accumulator
    STA                  ; 9F 4D CD 3F | Store accumulator to absolute long,X
    STA $96FF,Y          ; 99 FF 96 | Store accumulator to absolute,Y
    CMP $D5FF,Y          ; D9 FF D5 | Compare accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    SBC $CFF2,X          ; FD F2 CF | Subtract with carry (absolute,X)
    BNE $DF              ; D0 DF | Branch if not equal
    BCS $BF              ; B0 BF | Branch if carry set
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    STY $FB              ; 84 FB | Store Y register to zero page
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    STA $9B7C,X          ; 9D 7C 9B | Store accumulator to absolute,X
    LSR $24A7,X          ; 5E A7 24 | Logical shift right (absolute,X)
    REP #$21             ; C2 21 | PPU graphics register access
    ADC $FF9B,X          ; 7D 9B FF | Add with carry (absolute,X)
    LDA                  ; BF E0 E7 DE | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_01D
; Address: $EE89D2
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_01D:
    JSR $18FF            ; 20 FF 18 | Jump to subroutine
    INC $CF29,X          ; FE 29 CF | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    SBC $0008,Y          ; F9 08 00 | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    EOR $B8              ; 45 B8 | Exclusive OR with accumulator (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $0CF4            ; 0E F4 0C | Arithmetic shift left (absolute)
    CPX $051C            ; EC 1C 05 | Compare X register (absolute)
    SBC ($6B),Y          ; F1 6B | Subtract with carry ((zero page),Y)
    SBC ($7D,X)          ; E1 7D | Subtract with carry ((zero page,X))
    CPY $DD              ; C4 DD | Compare Y register (zero page)
    EOR $D700            ; 4D 00 D7 | Exclusive OR with accumulator (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL $39F5,X          ; 1E F5 39 | Arithmetic shift left (absolute,X)
    DEC $59              ; C6 59 | Decrement (zero page)
    ROL $C4              ; 26 C4 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_01E
; Address: $EE8A1F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_01E:
    PLP                  ; 28 | Pull processor status from stack
    DEY                  ; 88 | Decrement Y register
    TXS                  ; 9A | Transfer X register to stack pointer
    CMP ($5E),Y          ; D1 5E | Compare accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    BVS $BF              ; 70 BF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_01F
; Address: $EE8A36
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_01F:
    JSL $7CA3FD          ; 22 FD A3 7C | Jump to subroutine long
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BVS $0F              ; 70 0F | Branch if overflow set
    SBC $E6              ; E5 E6 | Subtract with carry (zero page)
    CPX $E7              ; E4 E7 | Compare X register (zero page)
    STA $831387          ; 8F 87 13 83 | Store accumulator to absolute long address
    BNE $40              ; D0 40 | Branch if not equal
    BCC $40              ; 90 40 | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    CPX $18              ; E4 18 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    STA $45              ; 85 45 | Store accumulator to zero page
    LDA $65              ; A5 65 | Load from zero page into accumulator
    SBC $FD7E,X          ; FD 7E FD | Subtract with carry (absolute,X)
    ROR $1B1B,X          ; 7E 1B 1B | Rotate right (absolute,X)
    ORA $00FF            ; 0D FF 00 | Logical OR with accumulator (absolute)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPX $FF              ; E4 FF | Compare X register (zero page)
    ASL $6CBF,X          ; 1E BF 6C | Arithmetic shift left (absolute,X)
    CMP $674B            ; CD 4B 67 | Compare accumulator (absolute)
    STZ $40BF            ; 9C BF 40 | Store zero to absolute
    LDA                  ; BF 40 5B A4 | Load from absolute long,X into accumulator
    SBC $8112            ; ED 12 81 | Subtract with carry (absolute)
    ROR $6F90,X          ; 7E 90 6F | Rotate right (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    STA $4240,Y          ; 99 40 42 | Hardware register operation
    LDA $00              ; A5 00 | Load from zero page into accumulator
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    ADC $E401,Y          ; 79 01 E4 | Add with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_020
; Address: $EE8AB3
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_020:
    JSR $E018            ; 20 18 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    STX $A4              ; 86 A4 | Store X register to zero page
    CLC                  ; 18 | Clear carry flag
    BMI $FF              ; 30 FF | Branch if negative
    INC $FF08            ; EE 08 FF | Increment (absolute)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($08),Y          ; 11 08 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_022
; Address: $EE8ADF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_022:
    JSR $80BF            ; 20 BF 80 | Jump to subroutine
    LDA                  ; BF 80 3E 0C | Load from absolute long,X into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_023
; Address: $EE8AEB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_023:
    JSR $00FD            ; 20 FD 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $C1              ; 30 C1 | Branch if negative
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_025
; Address: $EE8B07
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_025:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    CMP $F33A,X          ; DD 3A F3 | Compare accumulator (absolute,X)
    LSR $CCB1            ; 4E B1 CC | Logical shift right (absolute)
    STY $130F            ; 8C 0F 13 | Store Y register to absolute address
    BRA $03              ; 80 03 | Branch always
    JMP $5800            ; 4C 00 58 | Jump to address
    ROL $40              ; 26 40 | Rotate left (zero page)
    ASL $F1              ; 06 F1 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    BRA $0C              ; 80 0C | Branch always
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    BIT $80              ; 24 80 | Test bits in accumulator (zero page)
    LDA $3D              ; A5 3D | Load from zero page into accumulator
    LDA $3D              ; A5 3D | Load from zero page into accumulator
    DEC $FF5F,X          ; DE 5F FF | Decrement (absolute,X)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    BRA $FF              ; 80 FF | Branch always
    REP #$7F             ; C2 7F | Reset processor status bits
    REP #$7F             ; C2 7F | Reset processor status bits
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    BRA $02              ; 80 02 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $FB12            ; ED 12 FB | Subtract with carry (absolute)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_026
; Address: $EE8B69
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_026:
    JSR $00EB            ; 20 EB 00 | Jump to subroutine
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $7F31            ; CE 31 7F | Decrement (absolute)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_027
; Address: $EE8B8E
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_027:
    PLP                  ; 28 | Pull processor status from stack
    CMP $A000,Y          ; D9 00 A0 | Compare accumulator (absolute,Y)
    INX                  ; E8 | Increment X register
    SBC $7F00,X          ; FD 00 7F | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROL $2800            ; 2E 00 28 | Rotate left (absolute)
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $FC00            ; 6E 00 FC | Rotate right (absolute)
    INY                  ; C8 | Increment Y register
    BPL $FA              ; 10 FA | Branch if positive
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    PLY                  ; 7A | Pull Y register from stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $DD00,Y          ; 19 00 DD | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_028
; Address: $EE8BF4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_028:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $01              ; 30 01 | Branch if negative
    STY $1C              ; 84 1C | Store Y register to zero page
    LDX $DF40,Y          ; BE 40 DF | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    ORA $5700            ; 0D 00 57 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_029
; Address: $EE8C1B
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_029:
    JSR $000C            ; 20 0C 00 | Jump to subroutine
    CPY $EA30            ; CC 30 EA | Compare Y register (absolute)
    INC $8601,X          ; FE 01 86 | Increment (absolute,X)
    STZ $00              ; 64 00 | Store zero to zero page
    ROR                  ; 6A | Rotate right (accumulator)
    PLB                  ; AB | Pull data bank register from stack
    LDA $00B700          ; AF 00 B7 00 | Load from absolute long address into accumulator
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEC $B0C0            ; CE C0 B0 | Decrement (absolute)
    LDA                  ; BF 43 7F 3C | Load from absolute long,X into accumulator
    BRA $03              ; 80 03 | Branch always
    INC $FFC7,X          ; FE C7 FF | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $1F              ; 90 1F | Branch if carry clear
    BEQ $FF              ; F0 FF | Branch if equal
    WDM #$F0             ; 42 F0 | Reserved instruction
    BMI $FF              ; 30 FF | Branch if negative
    LDA $00E0AF          ; AF AF E0 00 | Load from absolute long address into accumulator
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_02A
; Address: $EE8C7E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_02A:
    BVC $00              ; 50 00 | Branch if overflow clear
    BEQ $14              ; F0 14 | Branch if equal
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BPL $10              ; 10 10 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    STA ($8F,X)          ; 81 8F | Store accumulator to (zero page,X)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_02B
; Address: $EE8CCC
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_02B:
    JSR $06E0            ; 20 E0 06 | Jump to subroutine
    BEQ $70              ; F0 70 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BNE $00              ; D0 00 | Branch if not equal
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    CPY $F000            ; CC 00 F0 | Compare Y register (absolute)
    ROL $83FF,X          ; 3E FF 83 | Rotate left (absolute,X)
    LDA                  ; BF 0C 3C 50 | Load from absolute long,X into accumulator
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_02C
; Address: $EE8D14
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_02C:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $C3              ; F0 C3 | Branch if equal
    CPY $FFC0            ; CC C0 FF | Compare Y register (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$3D             ; E0 3D | Compare X register (immediate)
    DEC $B07F,X          ; DE 7F B0 | Decrement (absolute,X)
    ADC $C508,X          ; 7D 08 C5 | Add with carry (absolute,X)
    SBC $CE              ; E5 CE | Subtract with carry (zero page)
    JMP $001F07          ; 5C 07 1F 00 | Jump to address long
    BMI $30              ; 30 30 | Branch if negative
    ADC $3A7D,X          ; 7D 7D 3A | Add with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CPX $04              ; E4 04 | Compare X register (zero page)
    ASL $E604            ; 0E 04 E6 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PEA #$FE0A           ; F4 0A FE | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    CMP $FE              ; C5 FE | Compare accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_02D
; Address: $EE8D72
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_02D:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_02F
; Address: $EE8D86
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_02F:
    BMI $00              ; 30 00 | Branch if negative
    LDY $E01E            ; AC 1E E0 | Game work RAM access
    CPY #$17             ; C0 17 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_030
; Address: $EE8D90
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_030:
    CLD                  ; D8 | Clear decimal mode flag
    INC $9F00,X          ; FE 00 9F | Increment (absolute,X)
    STA                  ; 9F 00 E7 E3 | Store accumulator to absolute long,X
    LDA                  ; BF 03 7B 03 | Load from absolute long,X into accumulator
    STA                  ; 9F 63 01 80 | Store accumulator to absolute long,X
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    LDX $0303,Y          ; BE 03 03 | Load from absolute,Y into X register
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    ROL $FF3E,X          ; 3E 3E FF | Rotate left (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BEQ $C8              ; F0 C8 | Branch if equal
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$63             ; C0 63 | Compare Y register (immediate)
    STA $800E            ; 8D 0E 80 | Store accumulator to absolute address
    BRA $30              ; 80 30 | Branch always
    BRA $32              ; 80 32 | Branch always
    EOR $7DFE            ; 4D FE 7D | Exclusive OR with accumulator (absolute)
    BEQ $CF              ; F0 CF | Branch if equal
    BRA $00              ; 80 00 | Branch always
    ADC $F0F0,X          ; 7D F0 F0 | Add with carry (absolute,X)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $03              ; 30 03 | Branch if negative
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BCS $1C              ; B0 1C | Branch if carry set
    BEQ $FF              ; F0 FF | Branch if equal
    CPX $04              ; E4 04 | Compare X register (zero page)
    CPX $04              ; E4 04 | Compare X register (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $0E82            ; 0E 82 0E | Arithmetic shift left (absolute)
    ASL $0A83            ; 0E 83 0A | Arithmetic shift left (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    STA $EDC906          ; 8F 06 C9 ED | Store accumulator to absolute long address
    WDM #$73             ; 42 73 | Reserved instruction
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_032
; Address: $EE8E80
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_032:
    JSR $3F5F            ; 20 5F 3F | Jump to subroutine
    LDX $7EFF,Y          ; BE FF 7E | Load from absolute,Y into X register
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $00              ; 80 00 | Branch always
    STA $1F1F0F          ; 8F 0F 1F 1F | Store accumulator to absolute long address
    ROL $7E3E,X          ; 3E 3E 7E | Rotate left (absolute,X)
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $962F,X          ; FE 2F 96 | Increment (absolute,X)
    INC $0049,X          ; FE 49 00 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    DEC $00C1,X          ; DE C1 00 | Decrement (absolute,X)
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BNE $7E              ; D0 7E | Branch if not equal
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ROR $FE00,X          ; 7E 00 FE | Rotate right (absolute,X)
    BIT $F000            ; 2C 00 F0 | Test bits in accumulator (absolute)
    INY                  ; C8 | Increment Y register
    BEQ $C8              ; F0 C8 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $81              ; F0 81 | Branch if equal
    LDA                  ; BF 1C DC C7 | Load from absolute long,X into accumulator
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    BNE $F0              ; D0 F0 | Branch if not equal
    BEQ $7F              ; F0 7F | Branch if equal
    STA $4000,X          ; 9D 00 40 | Store accumulator to absolute,X
    LDA $D3              ; A5 D3 | Load from zero page into accumulator
    LDA $9DE3            ; AD E3 9D | Load from absolute address into accumulator
    SBC ($F2,X)          ; E1 F2 | Subtract with carry ((zero page,X))
    INC $9BE1,X          ; FE E1 9B | Increment (absolute,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($85,X)          ; 81 85 | Store accumulator to (zero page,X)
    STA ($85,X)          ; 81 85 | Store accumulator to (zero page,X)
    CPX $E0E0            ; EC E0 E0 | Game work RAM access
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BVS $40              ; 70 40 | Branch if overflow set
    LDA                  ; BF 20 DE 03 | Load from absolute long,X into accumulator
    SBC $F109            ; ED 09 F1 | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_033
; Address: $EE8F3A
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_033:
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR $0031            ; 4E 31 00 | Logical shift right (absolute)
    PHA                  ; 48 | Push accumulator to stack
    BRA $04              ; 80 04 | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STX $27              ; 86 27 | Store X register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA                  ; 9F 00 1F E0 | Store accumulator to absolute long,X
    SEP #$3F             ; E2 3F | Set processor status bits
    PLY                  ; 7A | Pull Y register from stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    WDM #$42             ; 42 42 | Hardware register operation
    CPY $23              ; C4 23 | Compare Y register (zero page)
    CPY $22              ; C4 22 | Compare Y register (zero page)
    CMP $22              ; C5 22 | Compare accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $1800,Y          ; 19 00 18 | Logical OR with accumulator (absolute,Y)
    ORA $6301,Y          ; 19 01 63 | Logical OR with accumulator (absolute,Y)
    STA $800E            ; 8D 0E 80 | Store accumulator to absolute address
    BRA $30              ; 80 30 | Branch always
    BRA $33              ; 80 33 | Branch always
    JMP $7CFF            ; 4C FF 7C | Jump to address
    BEQ $FE              ; F0 FE | Branch if equal
    CMP ($72,X)          ; C1 72 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $03              ; 30 03 | Branch if negative
    CPX $00              ; E4 00 | Compare X register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F FA 64 E2 | Store accumulator to absolute long,X
    PEA #$F4E0           ; F4 E0 F4 | Push effective address to stack
    INX                  ; E8 | Increment X register
    PEA #$7C61           ; F4 61 7C | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_034
; Address: $EE8FF4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_034:
    XBA                  ; EB | Exchange accumulator bytes
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_036
; Address: $EE9001
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_036:
    SED                  ; F8 | Set decimal mode flag
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    ORA ($D1,X)          ; 01 D1 | Logical OR with accumulator ((zero page,X))
    CMP ($FC),Y          ; D1 FC | Compare accumulator ((zero page),Y)
    CPX $53              ; E4 53 | Compare X register (zero page)
    LDY $FC03            ; AC 03 FC | Load from absolute address into Y register
    BNE $03              ; D0 03 | Branch if not equal
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    EOR ($1C,X)          ; 41 1C | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_037
; Address: $EE9038
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_037:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    BEQ $EE              ; F0 EE | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $EF              ; F0 EF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY $37              ; C4 37 | Compare Y register (zero page)
    LDY #$A1             ; A0 A1 | Load immediate value into Y register
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    CPX $F010            ; EC 10 F0 | Compare X register (absolute)
    ORA ($D5,X)          ; 01 D5 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_038
; Address: $EE906A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_038:
    JSL $8C08F2          ; 22 F2 08 8C | Jump to subroutine long
    BCS $00              ; B0 00 | Branch if carry set
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ROL $FF              ; 26 FF | Rotate left (zero page)
    ROL $00FF            ; 2E FF 00 | Rotate left (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    STA ($F0,X)          ; 81 F0 | Store accumulator to (zero page,X)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_039
; Address: $EE908A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_039:
    JSR $801E            ; 20 1E 80 | Jump to subroutine
    STA                  ; 9F 0F 00 3C | Store accumulator to absolute long,X
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_03A
; Address: $EE9095
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_03A:
    PEA #$F00F           ; F4 0F F0 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    EOR $4222,X          ; 5D 22 42 | Hardware register operation
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    EOR ($82,X)          ; 41 82 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    SBC ($F2,X)          ; E1 F2 | Subtract with carry ((zero page,X))
    BEQ $9B              ; F0 9B | Branch if equal
    CPX $E0E0            ; EC E0 E0 | Game work RAM access
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BVS $77              ; 70 77 | Branch if overflow set
    STA $8F1F,X          ; 9D 1F 8F | Store accumulator to absolute,X
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $08              ; F0 08 | Branch if equal
    BNE $7C              ; D0 7C | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    STA ($A0,X)          ; 81 A0 | Store accumulator to (zero page,X)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    INY                  ; C8 | Increment Y register
    STA                  ; 9F 00 E0 00 | Store accumulator to absolute long,X
    BMI $00              ; 30 00 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    ASL $27              ; 06 27 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA                  ; 9F 00 1F A0 | Store accumulator to absolute long,X
    LDX #$3F             ; A2 3F | Load immediate value into X register
    PLX                  ; FA | Pull X register from stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    WDM #$02             ; 42 02 | Reserved instruction
    WDM #$02             ; 42 02 | Reserved instruction
    INC $0101,X          ; FE 01 01 | Increment (absolute,X)
    STA                  ; 9F 7F BF FE | Store accumulator to absolute long,X
    INC $01FF,X          ; FE FF 01 | Increment (absolute,X)
    INC $7F02,X          ; FE 02 7F | Increment (absolute,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    LDX $FFFF,Y          ; BE FF FF | Load from absolute,Y into X register
    LDX $BE80,Y          ; BE 80 BE | Load from absolute,Y into X register
    STZ $83FD            ; 9C FD 83 | Store zero to absolute
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    LDX $FFBE,Y          ; BE BE FF | Load from absolute,Y into X register
    BRA $84              ; 80 84 | Branch always
    BRA $82              ; 80 82 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_03B
; Address: $EE917D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_03B:
    BRA $9C              ; 80 9C | Branch always
    BRA $13              ; 80 13 | Branch always
    CPX $E01F            ; EC 1F E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    CPY #$BB             ; C0 BB | Compare Y register (immediate)
    CPY #$B7             ; C0 B7 | Compare Y register (immediate)
    BPL $0F              ; 10 0F | Branch if positive
    BRA $AF              ; 80 AF | Branch always
    STY $8B              ; 84 8B | Store Y register to zero page
    BRA $9B              ; 80 9B | Branch always
    STZ $EA              ; 64 EA | Store zero to zero page
    TAY                  ; A8 | Transfer accumulator to Y register
    LDX $2A              ; A6 2A | Load from zero page into X register
    LDA $26              ; A5 26 | Load from zero page into accumulator
    AND #$67             ; 29 67 | Logical AND with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_03C
; Address: $EE91B0
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_03C:
    ROL $1FFF            ; 2E FF 1F | Rotate left (absolute)
    EOR ($4F,X)          ; 41 4F | Exclusive OR with accumulator ((zero page,X))
    STA ($BF,X)          ; 81 BF | Store accumulator to (zero page,X)
    LDY $EEE0,X          ; BC E0 EE | Load from absolute,X into Y register
    CPX #$BD             ; E0 BD | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    BCC $83              ; 90 83 | Branch if carry clear
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC $F7D6            ; ED D6 F7 | Subtract with carry (absolute)
    CPX $F4FF            ; EC FF F4 | Compare X register (absolute)
    CPY $C6              ; C4 C6 | Compare Y register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    PEA #$0CF4           ; F4 F4 0C | Push effective address to stack
    BCS $FF              ; B0 FF | Branch if carry set
    INC $FFFF            ; EE FF FF | Increment (absolute)
    BEQ $EF              ; F0 EF | Branch if equal
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    INC $FFEE            ; EE EE FF | Increment (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BNE $C0              ; D0 C0 | Branch if not equal
    LDX $7F80,Y          ; BE 80 7F | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    BNE $01              ; D0 01 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    ORA $01F0,Y          ; 19 F0 01 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_03D
; Address: $EE9227
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_03D:
    BEQ $8F              ; F0 8F | Branch if equal
    BVS $9F              ; 70 9F | Branch if overflow set
    CPX #$01             ; E0 01 | Compare X register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    LDA $C0F800          ; AF 00 F8 C0 | Load from absolute long address into accumulator
    INX                  ; E8 | Increment X register
    BPL $C3              ; 10 C3 | Branch if positive
    BMI $FC              ; 30 FC | Branch if negative
    INC $F700,X          ; FE 00 F7 | Increment (absolute,X)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_03E
; Address: $EE926F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_03E:
    JSR $0242            ; 20 42 02 | Jump to subroutine
    REP #$00             ; C2 00 | Reset processor status bits
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX #$83             ; E0 83 | Compare X register (immediate)
    CPX #$83             ; E0 83 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_040
; Address: $EE92AD
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_040:
    JSR $C0C7            ; 20 C7 C0 | Jump to subroutine
    STZ $9C80            ; 9C 80 9C | Store zero to absolute
    BRA $1C              ; 80 1C | Branch always
    CLC                  ; 18 | Clear carry flag
    STY $00              ; 84 00 | Store Y register to zero page
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    BCS $FF              ; B0 FF | Branch if carry set
    ADC $7D80,X          ; 7D 80 7D | Add with carry (absolute,X)
    LDX #$E4             ; A2 E4 | Load immediate value into X register
    JMP $1E37            ; 4C 37 1E | Jump to address
    EOR ($1E,X)          ; 41 1E | Exclusive OR with accumulator ((zero page,X))
    BMI $30              ; 30 30 | Branch if negative
    ADC $827D,X          ; 7D 7D 82 | Add with carry (absolute,X)
    ADC $3348,Y          ; 79 48 33 | Add with carry (absolute,Y)
    CPX $C4              ; E4 C4 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    STZ $6A              ; 64 6A | Store zero to zero page
    ORA ($91),Y          ; 11 91 | Logical OR with accumulator ((zero page),Y)
    CPX #$04             ; E0 04 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_041
; Address: $EE92ED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_041:
    ORA $05E5,X          ; 1D E5 05 | Logical OR with accumulator (absolute,X)
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    STA                  ; 9F 02 1F 22 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_043
; Address: $EE9307
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_043:
    JMP ($EF00)          ; 6C 00 EF | Jump to address (absolute indirect)
    STX $6C90            ; 8E 90 6C | Store X register to absolute address
    BCC $27              ; 90 27 | Branch if carry clear
    BPL $C4              ; 10 C4 | Branch if positive
    BEQ $07              ; F0 07 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$D6             ; 09 D6 | Logical OR with accumulator (immediate)
    LDA                  ; BF 03 03 E3 | Load from absolute long,X into accumulator
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BVC $E8              ; 50 E8 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BCS $C1              ; B0 C1 | Branch if carry set
    BCS $44              ; B0 44 | Branch if carry set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_044
; Address: $EE9352
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_044:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PLB                  ; AB | Pull data bank register from stack
    BRA $8F              ; 80 8F | Branch always
    BRA $8F              ; 80 8F | Branch always
    BRA $FD              ; 80 FD | Branch always
    SBC $01CF,X          ; FD CF 01 | Subtract with carry (absolute,X)
    ORA $0F13            ; 0D 13 0F | Logical OR with accumulator (absolute)
    ROR $4E15            ; 6E 15 4E | Rotate right (absolute)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $04              ; E5 04 | Subtract with carry (zero page)
    CPX $04              ; E4 04 | Compare X register (zero page)
    CPX $04              ; E4 04 | Compare X register (zero page)
    STA $6F9F7F          ; 8F 7F 9F 6F | Store accumulator to absolute long address
    LDA                  ; BF 5C C0 1F | Load from absolute long,X into accumulator
    BEQ $F7              ; F0 F7 | Branch if equal
    AND ($07,X)          ; 21 07 | Logical AND with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    DEC $EF00,X          ; DE 00 EF | Decrement (absolute,X)
    CPX $F4FF            ; EC FF F4 | Compare X register (absolute)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    PEA #$0CF4           ; F4 F4 0C | Push effective address to stack
    PHB                  ; 8B | Push data bank register to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_045
; Address: $EE93C0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_045:
    SEI                  ; 78 | Set interrupt disable flag
    STY $7C              ; 84 7C | Store Y register to zero page
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    STA $689F70          ; 8F 70 9F 68 | Store accumulator to absolute long address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_046
; Address: $EE93DE
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_046:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $03              ; 80 03 | Branch always
    BPL $01              ; 10 01 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $FC00            ; EC 00 FC | Compare X register (absolute)
    SBC $FD06,X          ; FD 06 FD | Subtract with carry (absolute,X)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    CPY $700F            ; CC 0F 70 | Compare Y register (absolute)
    BEQ $04              ; F0 04 | Branch if equal
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    SEC                  ; 38 | Set carry flag
    BRA $70              ; 80 70 | Branch always
    LDA $9045,X          ; BD 45 90 | Load from absolute,X into accumulator
    ADC $6298            ; 6D 98 62 | Add with carry (absolute)
    STA $8D65,X          ; 9D 65 8D | Store accumulator to absolute,X
    ASL $F1              ; 06 F1 | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $42              ; 05 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_047
; Address: $EE9438
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_047:
    JSR $1542            ; 20 42 15 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVS $82              ; 70 82 | Branch if overflow set
    ADC $6FF0,X          ; 7D F0 6F | Add with carry (absolute,X)
    INC $7EFF            ; EE FF 7E | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_048
; Address: $EE944D
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_048:
    LDA                  ; BF B0 0F E0 | Load from absolute long,X into accumulator
    ROR $6F6F            ; 6E 6F 6F | Rotate right (absolute)
    INC $7EEE            ; EE EE 7E | Increment (absolute)
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $C33F,X          ; FE 3F C3 | Increment (absolute,X)
    INC $922F,X          ; FE 2F 92 | Increment (absolute,X)
    INC $0C41,X          ; FE 41 0C | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    AND $7FFF,X          ; 3D FF 7F | Logical AND with accumulator (absolute,X)
    CMP $32              ; C5 32 | Compare accumulator (zero page)
    JMP ($14CE)          ; 6C CE 14 | Jump to address (absolute indirect)
    LDY $0000,X          ; BC 00 00 | Load from absolute,X into Y register
    AND $7F3D,X          ; 3D 3D 7F | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $04              ; E5 04 | Subtract with carry (zero page)
    JMP $FF0E1C          ; 5C 1C 0E FF | Jump to address long
    INC $FEE7,X          ; FE E7 FE | Increment (absolute,X)
    INC $FBFF,X          ; FE FF FB | Increment (absolute,X)
    ASL $32C7,X          ; 1E C7 32 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_049
; Address: $EE94AE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_049:
    ROR $0E4F            ; 6E 4F 0E | Rotate right (absolute)
    ASL $E6E6            ; 0E E6 E6 | Arithmetic shift left (absolute)
    PEA #$FEF4           ; F4 F4 FE | Push effective address to stack
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    LDX $3F0E,Y          ; BE 0E 3F | Load from absolute,Y into X register
    CLD                  ; D8 | Clear decimal mode flag
    INC $0D60            ; EE 60 0D | Increment (absolute)
    LDY $E040            ; AC 40 E0 | Game work RAM access
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_04A
; Address: $EE94CF
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_04A:
    DEY                  ; 88 | Decrement Y register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    ASL $1C00,X          ; 1E 00 1C | Arithmetic shift left (absolute,X)
    LDA                  ; BF 3F FF 9F | Load from absolute long,X into accumulator
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    STA                  ; 9F 9F 01 01 | Store accumulator to absolute long,X
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $F7              ; F0 F7 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP $166E            ; CD 6E 16 | Compare accumulator (absolute)
    ASL $BF2F,X          ; 1E 2F BF | Arithmetic shift left (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    ASL $CE              ; 06 CE | Arithmetic shift left (zero page)
    ASL $1F1F            ; 0E 1F 1F | Arithmetic shift left (absolute)
    ASL $FEFF            ; 0E FF FE | Arithmetic shift left (absolute)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    STZ $0E0E,X          ; 9E 0E 0E | Store zero to absolute,X
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    ROR $FF0E            ; 6E 0E FF | Rotate right (absolute)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_04B
; Address: $EE95BF
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_04B:
    SED                  ; F8 | Set decimal mode flag
    CPX $0CFF            ; EC FF 0C | Compare X register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    STX $8E7F            ; 8E 7F 8E | Store X register to absolute address
    STA $7A8F7E          ; 8F 7E 8F 7A | Store accumulator to absolute long address
    STA $338F7A          ; 8F 7A 8F 33 | Store accumulator to absolute long address
    LSR $0E1C            ; 4E 1C 0E | Logical shift right (absolute)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $0A0E            ; 0E 0E 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SBC $7F0C            ; ED 0C 7F | Subtract with carry (absolute)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    LDA                  ; BF FF 3F FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_04C
; Address: $EE9610
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_04C:
    JSR $3F20            ; 20 20 3F | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $B6FE,X          ; FE FE B6 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_04D
; Address: $EE962F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_04D:
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    INC $202F,X          ; FE 2F 20 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_04E
; Address: $EE9647
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_04E:
    SBC ($81,X)          ; E1 81 | Subtract with carry ((zero page,X))
    LDA                  ; BF 01 07 09 | Load from absolute long,X into accumulator
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    SBC $FD01,Y          ; F9 01 FD | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $FE              ; 80 FE | Branch always
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    STA ($80,X)          ; 81 80 | Store accumulator to (zero page,X)
    STX $8EFF            ; 8E FF 8E | Store X register to absolute address
    STA $FF8FFF          ; 8F FF 8F FF | Store accumulator to absolute long address
    STA $FFCFBF          ; 8F BF CF FF | Store accumulator to absolute long address
    ASL $8EAF,X          ; 1E AF 8E | Arithmetic shift left (absolute,X)
    STX $8E8E            ; 8E 8E 8E | Store X register to absolute address
    STA $8F8F8F          ; 8F 8F 8F 8F | Store accumulator to absolute long address
    STA $8F8F8F          ; 8F 8F 8F 8F | Store accumulator to absolute long address
    LSR $FF0E            ; 4E 0E FF | Logical shift right (absolute)
    LDA                  ; BF C1 07 F9 | Load from absolute long,X into accumulator
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_04F
; Address: $EE96E1
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_04F:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $8081,X          ; FE 81 80 | Increment (absolute,X)
    ORA $80C0,X          ; 1D C0 80 | Logical OR with accumulator (absolute,X)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    LDA                  ; BF 80 DC C0 | Load from absolute long,X into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY $E7              ; C4 E7 | Compare Y register (zero page)
    INC $DD              ; E6 DD | Increment (zero page)
    CMP $DFE7,X          ; DD E7 DF | Compare accumulator (absolute,X)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPY $C5              ; C4 C5 | Compare Y register (zero page)
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    STA $8010            ; 8D 10 80 | Store accumulator to absolute address
    ADC ($80),Y          ; 71 80 | Add with carry ((zero page),Y)
    BRA $4F              ; 80 4F | Branch always
    INC $0063,X          ; FE 63 00 | Increment (absolute,X)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    INC $F8FE,X          ; FE FE F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY $1B00            ; CC 00 1B | Compare Y register (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    CPX $00              ; E4 00 | Compare X register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ADC ($FC,X)          ; 61 FC | Add with carry ((zero page,X))
    SBC $E9F4,Y          ; F9 F4 E9 | Subtract with carry (absolute,Y)
    PEA #$FCEB           ; F4 EB FC | Push effective address to stack
    XBA                  ; EB | Exchange accumulator bytes
    SEP #$FF             ; E2 FF | Set processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_050
; Address: $EE9772
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_050:
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    SEP #$E0             ; E2 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    LDA                  ; BF 13 FF 03 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_051
; Address: $EE97AF
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_051:
    LDA                  ; BF 00 00 1B | Load from absolute long,X into accumulator
    INC $FF              ; E6 FF | Increment (zero page)
    INC $E6              ; E6 E6 | Increment (zero page)
    STZ $F1EE            ; 9C EE F1 | Store zero to absolute
    STX $80FF            ; 8E FF 80 | Store X register to absolute address
    BCS $FF              ; B0 FF | Branch if carry set
    STA $808C            ; 8D 8C 80 | Store accumulator to absolute address
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPX $FF              ; E4 FF | Compare X register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC $FDFC,X          ; FD FC FD | Subtract with carry (absolute,X)
    INC $F6FD,X          ; FE FD F6 | Increment (absolute,X)
    PEA #$FCFF           ; F4 FF FC | Push effective address to stack
    INC $FF7D,X          ; FE 7D FF | Increment (absolute,X)
    PEA #$F4F4           ; F4 F4 F4 | Push effective address to stack
    PEA #$FCFC           ; F4 FC FC | Push effective address to stack
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    SBC $EFFF            ; ED FF EF | Subtract with carry (absolute)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $8F42,X          ; 9D 42 8F | Store accumulator to absolute,X
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_052
; Address: $EE98AA
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_052:
    BEQ $07              ; F0 07 | Branch if equal
    BEQ $07              ; F0 07 | Branch if equal
    BNE $27              ; D0 27 | Branch if not equal
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    LDY #$5E             ; A0 5E | Load immediate value into Y register
    CPX #$80             ; E0 80 | Compare X register (immediate)
    INC $30CF            ; EE CF 30 | Increment (absolute)
    BMI $FF              ; 30 FF | Branch if negative
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register
    XBA                  ; EB | Exchange accumulator bytes
    LDA                  ; BF 5F BF 5F | Load from absolute long,X into accumulator
    LDA                  ; BF 7F FF FF | Load from absolute long,X into accumulator
    STA                  ; 9F 1F 1F 1F | Store accumulator to absolute long,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $C1              ; 80 C1 | Branch always
    BRA $FD              ; 80 FD | Branch always
    STA                  ; 9F 7F 7F FF | Store accumulator to absolute long,X
    LDX $BE80,Y          ; BE 80 BE | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_053
; Address: $EE993B
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_053:
    BRA $9C              ; 80 9C | Branch always
    BRA $83              ; 80 83 | Branch always
    LDA $A1C307          ; AF 07 C3 A1 | Load from absolute long address into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    BCC $F3              ; 90 F3 | Branch if carry clear
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    STA $8F81,X          ; 9D 81 8F | Store accumulator to absolute,X
    BRA $EF              ; 80 EF | Branch always
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BNE $FF              ; D0 FF | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    ROR $8021,X          ; 7E 21 80 | Rotate right (absolute,X)
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA                  ; BF 47 EF 17 | Load from absolute long,X into accumulator
    STA                  ; 9F FF BF FF | Store accumulator to absolute long,X
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    LDA                  ; BF BF BF BF | Load from absolute long,X into accumulator
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    CMP ($C5,X)          ; C1 C5 | Compare accumulator ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CMP ($FD,X)          ; C1 FD | Compare accumulator ((zero page,X))
    SBC ($E3,X)          ; E1 E3 | Subtract with carry ((zero page,X))
    BEQ $EF              ; F0 EF | Branch if equal
    BEQ $C1              ; F0 C1 | Branch if equal
    INC $8F80,X          ; FE 80 8F | Increment (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BNE $27              ; D0 27 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ASL $80F0            ; 0E F0 80 | Arithmetic shift left (absolute)
    STA                  ; 9F FF FF FF | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_054
; Address: $EE9A34
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_054:
    ORA $0100,Y          ; 19 00 01 | Logical OR with accumulator (absolute,Y)
    STA $9F9F80          ; 8F 80 9F 9F | Store accumulator to absolute long address
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    JMP $F05000          ; 5C 00 50 F0 | Jump to address long
    BEQ $E7              ; F0 E7 | Branch if equal
    BEQ $CC              ; F0 CC | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDA $F0F800          ; AF 00 F8 F0 | Load from absolute long address into accumulator
    INX                  ; E8 | Increment X register
    CPX #$C3             ; E0 C3 | Compare X register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    LDA                  ; BF 7F 3F FF | Load from absolute long,X into accumulator
    LDA                  ; BF 3F BF 3D | Load from absolute long,X into accumulator
    LDX $BF3E,Y          ; BE 3E BF | Load from absolute,Y into X register
    ROR $DF3E,X          ; 7E 3E DF | Rotate right (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F E3 9F E7 | Store accumulator to absolute long,X
    STA ($23,X)          ; 81 23 | Store accumulator to (zero page,X)
    STX $82              ; 86 82 | Store X register to zero page
    ORA $8301            ; 0D 01 83 | Logical OR with accumulator (absolute)
    CMP ($8F,X)          ; C1 8F | Compare accumulator ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    INC $E6F9,X          ; FE F9 E6 | Increment (absolute,X)
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    BNE $D0              ; D0 D0 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    JMP $AF50A3          ; 5C A3 50 AF | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_055
; Address: $EE9B26
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_055:
    LDA                  ; BF 7F BF 7F | Load from absolute long,X into accumulator
    LDA                  ; BF 7D BF 7E | Load from absolute long,X into accumulator
    LDA                  ; BF BF BF BF | Load from absolute long,X into accumulator
    AND $3E3D,X          ; 3D 3D 3E | Logical AND with accumulator (absolute,X)
    ROL $3F3F,X          ; 3E 3F 3F | Rotate left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $F5              ; F0 F5 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    PLX                  ; FA | Pull X register from stack
    BEQ $07              ; F0 07 | Branch if equal
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $D0              ; 10 D0 | Branch if positive
    BEQ $C7              ; F0 C7 | Branch if equal
    BEQ $CE              ; F0 CE | Branch if equal
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $E8              ; 80 E8 | Branch always
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    ORA ($37,X)          ; 01 37 | Logical OR with accumulator ((zero page,X))
    CPX $EE1E            ; EC 1E EE | Compare X register (absolute)
    STX $AE1F            ; 8E 1F AE | Store X register to absolute address
    SBC $FB01,X          ; FD 01 FB | Subtract with carry (absolute,X)
    ORA $0F0C            ; 0D 0C 0F | Logical OR with accumulator (absolute)
    ASL $0E6E            ; 0E 6E 0E | Arithmetic shift left (absolute)
    LSR $FF0E            ; 4E 0E FF | Logical shift right (absolute)
    STA $FF9FFF          ; 8F FF 9F FF | Store accumulator to absolute long address
    LDA                  ; BF 1F 20 FB | Load from absolute long,X into accumulator
    CPY #$21             ; C0 21 | PPU graphics register access
    BRA $CF              ; 80 CF | Branch always
    STA $9F9F8F          ; 8F 8F 9F 9F | Store accumulator to absolute long address
    LDA                  ; BF BF C0 00 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_056
; Address: $EE9C02
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_056:
    INC $FE7D,X          ; FE 7D FE | Increment (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    STA $789FFF          ; 8F FF 9F 78 | Store accumulator to absolute long address
    SEI                  ; 78 | Set interrupt disable flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    STA $9F9F8F          ; 8F 8F 9F 9F | Store accumulator to absolute long address
    SBC $8F03,X          ; FD 03 8F | Subtract with carry (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $C4              ; 80 C4 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $EF              ; F0 EF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $BBF1,X          ; FE F1 BB | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_057
; Address: $EE9C51
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_057:
    BRA $DF              ; 80 DF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BNE $D4              ; D0 D4 | Branch if not equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $FE1E,X          ; FE 1E FE | Increment (absolute,X)
    STA                  ; 9F 7F BF 5F | Store accumulator to absolute long,X
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BRA $5E              ; 80 5E | Branch always
    SED                  ; F8 | Set decimal mode flag
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $CFCF,X          ; FE CF CF | Increment (absolute,X)
    STA $FFFF73          ; 8F 73 FF FF | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_058
; Address: $EE9D0A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_058:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SEP #$E2             ; E2 E2 | Set processor status bits
    ORA $FF00,X          ; 1D 00 FF | Logical OR with accumulator (absolute,X)
    BCS $FF              ; B0 FF | Branch if carry set
    ASL $00FE            ; 0E FE 00 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $F900,X          ; FE 00 F9 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_059
; Address: $EE9D78
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_059:
    JSR $0300            ; 20 00 03 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    STZ $1FFF            ; 9C FF 1F | Store zero to absolute
    STY $009F            ; 8C 9F 00 | Store Y register to absolute address
    BVS $FE              ; 70 FE | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_05B
; Address: $EE9D98
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_05B:
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    BRA $F7              ; 80 F7 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_05C
; Address: $EE9DA8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_05C:
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    LDA $0000BF          ; AF BF 00 00 | Load from absolute long address into accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_05E
; Address: $EE9DD6
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_05E:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    STX $7CFE            ; 8E FE 7C | Store X register to absolute address
    SBC $8282,X          ; FD 82 82 | Subtract with carry (absolute,X)
    ASL $1FE0            ; 0E E0 1F | Arithmetic shift left (absolute)
    ASL $006E            ; 0E 6E 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $F100,X          ; 7D 00 F1 | Add with carry (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CMP ($CF,X)          ; C1 CF | Compare accumulator ((zero page,X))
    BIT #$BF             ; 89 BF | Test bits in accumulator (immediate)
    ASL $46              ; 06 46 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    SBC $7F38,Y          ; F9 38 7F | Subtract with carry (absolute,Y)
    BVS $7F              ; 70 7F | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    LDA $0600,Y          ; B9 00 06 | Load from absolute,Y into accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_05F
; Address: $EE9E24
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_05F:
    JSR $E0FF            ; 20 FF E0 | Game work RAM access
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY $C0              ; C4 C0 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_060
; Address: $EE9E30
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_060:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    ORA #$E1             ; 09 E1 | Logical OR with accumulator (immediate)
    BIT $7E8E            ; 2C 8E 7E | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    ADC ($7F,X)          ; 61 7F | Add with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ASL $7100,X          ; 1E 00 71 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_061
; Address: $EE9E54
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_061:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    LDA                  ; BF 00 04 00 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    CPX #$C4             ; E0 C4 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STZ $6D9D            ; 9C 9D 6D | Store zero to absolute
    STX $009F            ; 8E 9F 00 | Store X register to absolute address
    BVS $FE              ; 70 FE | Branch if overflow set
    STY $F0              ; 84 F0 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_062
; Address: $EE9EB8
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_062:
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $F8C0,X          ; FE C0 F8 | Increment (absolute,X)
    BRA $F1              ; 80 F1 | Branch always
    ROL $0080,X          ; 3E 80 00 | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3800            ; 0E 00 38 | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    STA                  ; 9F 7E 7F 67 | Store accumulator to absolute long,X
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_064
; Address: $EE9F22
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_064:
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    STZ $409E,X          ; 9E 9E 40 | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    AND $8020            ; 2D 20 80 | Logical AND with accumulator (absolute)
    INC $FFC7,X          ; FE C7 FF | Increment (absolute,X)
    CMP $3F              ; C5 3F | Compare accumulator (zero page)
    INX                  ; E8 | Increment X register
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $02              ; 10 02 | Branch if positive
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    BPL $FB              ; 10 FB | Branch if positive
    WDM #$F0             ; 42 F0 | Reserved instruction
    BMI $FF              ; 30 FF | Branch if negative
    LDA $FDE2AF          ; AF AF E2 FD | Load from absolute long address into accumulator
    SED                  ; F8 | Set decimal mode flag
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    SBC $7606,Y          ; F9 06 76 | Subtract with carry (absolute,Y)
    BEQ $34              ; F0 34 | Branch if equal
    CPY $3FFF            ; CC FF 3F | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BMI $03              ; 30 03 | Branch if negative
    ROL $FC7E,X          ; 3E 7E FC | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_065
; Address: $EE9FC0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_065:
    JSR $6CD8            ; 20 D8 6C | Jump to subroutine
    STZ $341C            ; 9C 1C 34 | Store zero to absolute
    BRA $03              ; 80 03 | Branch always
    INC $FFC7,X          ; FE C7 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_066
; Address: $EE9FE8
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_066:
    WDM #$F0             ; 42 F0 | Reserved instruction
    BMI $FF              ; 30 FF | Branch if negative
    LDA $F807AF          ; AF AF 07 F8 | Load from absolute long address into accumulator
    BVC $00              ; 50 00 | Branch if overflow clear
    LDA #$3F             ; A9 3F | Load immediate value into accumulator
    CLC                  ; 18 | Clear carry flag
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_067
; Address: $EEA007
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_067:
    BEQ $DC              ; F0 DC | Branch if equal
    CPX #$BA             ; E0 BA | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $B1              ; 80 B1 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STY $A3DE            ; 8C DE A3 | Store Y register to absolute address
    LDY $7847,X          ; BC 47 78 | Load from absolute,X into Y register
    CPY $F0              ; C4 F0 | Compare Y register (zero page)
    SBC ($1B,X)          ; E1 1B | Subtract with carry ((zero page,X))
    STX $0F              ; 86 0F | Store X register to zero page
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $3C00,X          ; 1E 00 3C | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    LSR $A31E,X          ; 5E 1E A3 | Logical shift right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CPY $F0              ; C4 F0 | Compare Y register (zero page)
    SBC ($1B,X)          ; E1 1B | Subtract with carry ((zero page,X))
    BCS $80              ; B0 80 | Branch if carry set
    STX $0F              ; 86 0F | Store X register to zero page
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ASL $3C00,X          ; 1E 00 3C | Arithmetic shift left (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    ORA ($C1),Y          ; 11 C1 | Logical OR with accumulator ((zero page),Y)
    BCS $00              ; B0 00 | Branch if carry set
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    STA $E00000          ; 8F 00 00 E0 | Game work RAM access
    AND $7FDE,X          ; 3D DE 7F | Logical AND with accumulator (absolute,X)
    BCS $FF              ; B0 FF | Branch if carry set
    ADC $C508,X          ; 7D 08 C5 | Add with carry (absolute,X)
    SBC $CE              ; E5 CE | Subtract with carry (zero page)
    JMP $001F07          ; 5C 07 1F 00 | Jump to address long
    BMI $30              ; 30 30 | Branch if negative
    ADC $3A7D,X          ; 7D 7D 3A | Add with carry (absolute,X)
    ADC $3500,Y          ; 79 00 35 | Add with carry (absolute,Y)
    CPX $04              ; E4 04 | Compare X register (zero page)
    ASL $E624            ; 0E 24 E6 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    PEA #$FE0A           ; F4 0A FE | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    WDM #$A5             ; 42 A5 | Reserved instruction

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_068
; Address: $EEA0AC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_068:
    DEC $DAF1            ; CE F1 DA | Decrement (absolute)
    STZ $F5              ; 64 F5 | Store zero to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STZ $9F              ; 64 9F | Store zero to zero page

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_069
; Address: $EEA0C4
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_069:
    JSR $A4DF            ; 20 DF A4 | Jump to subroutine
    ORA $0DBF            ; 0D BF 0D | Logical OR with accumulator (absolute)
    ORA $12D7,Y          ; 19 D7 12 | Logical OR with accumulator (absolute,Y)
    ADC $C4              ; 65 C4 | Add with carry (zero page)
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    ASL $2E00,X          ; 1E 00 2E | Arithmetic shift left (absolute,X)
    STA                  ; 9F 00 C7 E3 | Store accumulator to absolute long,X
    LDA                  ; BF 03 BF 03 | Load from absolute long,X into accumulator
    LDA                  ; BF 03 7B 03 | Load from absolute long,X into accumulator
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BEQ $C8              ; F0 C8 | Branch if equal
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    REP #$C0             ; C2 C0 | Reset processor status bits
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    LDX #$2E             ; A2 2E | Load immediate value into X register
    ASL $0A83            ; 0E 83 0A | Arithmetic shift left (absolute)
    STA $0A              ; 85 0A | Store accumulator to zero page
    STA $EDC906          ; 8F 06 C9 ED | Store accumulator to absolute long address
    WDM #$73             ; 42 73 | Reserved instruction
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_06A
; Address: $EEA140
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_06A:
    JSR $3F5F            ; 20 5F 3F | Jump to subroutine
    LDX $7EFF,Y          ; BE FF 7E | Load from absolute,Y into X register
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $00              ; 80 00 | Branch always
    STA $1B1F0F          ; 8F 0F 1F 1B | Store accumulator to absolute long address
    ROL $7E3E,X          ; 3E 3E 7E | Rotate left (absolute,X)
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    DEC $00C1,X          ; DE C1 00 | Decrement (absolute,X)
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    CMP $FF28,X          ; DD 28 FF | Compare accumulator (absolute,X)
    BEQ $7E              ; F0 7E | Branch if equal
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_06B
; Address: $EEA174
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_06B:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ROR $FE00,X          ; 7E 00 FE | Rotate right (absolute,X)
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $81              ; F0 81 | Branch if equal
    WDM #$7F             ; 42 7F | Reserved instruction
    EOR $BF              ; 45 BF | Exclusive OR with accumulator (zero page)
    LDX $C0C7,Y          ; BE C7 C0 | Load from absolute,Y into X register
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    BNE $F0              ; D0 F0 | Branch if not equal
    BEQ $7F              ; F0 7F | Branch if equal
    LDA $FA00,X          ; BD 00 FA | Load from absolute,X into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_06C
; Address: $EEA1A8
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_06C:
    CPY $33              ; C4 33 | Compare Y register (zero page)
    CPY $32              ; C4 32 | Compare Y register (zero page)
    CMP $22              ; C5 22 | Compare accumulator (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA $1800,Y          ; 19 00 18 | Logical OR with accumulator (absolute,Y)
    ORA $6301,Y          ; 19 01 63 | Logical OR with accumulator (absolute,Y)
    STA $840A            ; 8D 0A 84 | Store accumulator to absolute address
    BRA $30              ; 80 30 | Branch always
    BRA $33              ; 80 33 | Branch always
    JMP $7CFF            ; 4C FF 7C | Jump to address
    BEQ $FE              ; F0 FE | Branch if equal
    CMP ($72,X)          ; C1 72 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    LDY #$47             ; A0 47 | Load immediate value into Y register
    BVS $03              ; 70 03 | Branch if overflow set
    CPX $00              ; E4 00 | Compare X register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_06D
; Address: $EEA203
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_06D:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    ORA ($D1,X)          ; 01 D1 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_06E
; Address: $EEA21D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_06E:
    CMP ($FC),Y          ; D1 FC | Compare accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    CPY #$53             ; C0 53 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    BNE $03              ; D0 03 | Branch if not equal
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    EOR ($7C,X)          ; 41 7C | Exclusive OR with accumulator ((zero page,X))
    BIT $6400            ; 2C 00 64 | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_06F
; Address: $EEA238
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_06F:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    SBC ($F2,X)          ; E1 F2 | Subtract with carry ((zero page,X))
    BEQ $9B              ; F0 9B | Branch if equal
    CPX $E0E0            ; EC E0 E0 | Game work RAM access
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BMI $77              ; 30 77 | Branch if negative
    CMP $8F1F,X          ; DD 1F 8F | Compare accumulator (absolute,X)
    ASL $0AEF            ; 0E EF 0A | Arithmetic shift left (absolute)
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    SBC ($09),Y          ; F1 09 | Subtract with carry ((zero page),Y)
    BNE $7C              ; D0 7C | Branch if not equal
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    STA ($F4,X)          ; 81 F4 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    STA $D300,X          ; 9D 00 D3 | Store accumulator to absolute,X
    INY                  ; C8 | Increment Y register
    CLV                  ; B8 | Clear overflow flag
    DEC $27              ; C6 27 | Decrement (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA                  ; 9F 00 1F A0 | Store accumulator to absolute long,X
    LDX #$3F             ; A2 3F | Load immediate value into X register
    PLX                  ; FA | Pull X register from stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    WDM #$02             ; 42 02 | Reserved instruction
    WDM #$02             ; 42 02 | Reserved instruction
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    ORA $7702,X          ; 1D 02 77 | Logical OR with accumulator (absolute,X)
    BEQ $34              ; F0 34 | Branch if equal
    CPY $C7FF            ; CC FF C7 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_070
; Address: $EEA2E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_070:
    JSR $0E06            ; 20 06 0E | Jump to subroutine
    INX                  ; E8 | Increment X register
    ROL $FC3E,X          ; 3E 3E FC | Rotate left (absolute,X)
    DEC $F9              ; C6 F9 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_071
; Address: $EEA2F3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_071:
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BPL $20              ; 10 20 | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_072
; Address: $EEA302
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_072:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $FFC7,X          ; FE C7 FF | Increment (absolute,X)
    STA                  ; 9F FF E0 7F | Store accumulator to absolute long,X
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    WDM #$F0             ; 42 F0 | Reserved instruction
    BMI $FF              ; 30 FF | Branch if negative
    LDA $F6F9AF          ; AF AF F9 F6 | Load from absolute long address into accumulator
    SED                  ; F8 | Set decimal mode flag
    BVC $00              ; 50 00 | Branch if overflow clear
    BCC $68              ; 90 68 | Branch if carry clear
    STZ $03              ; 64 03 | Store zero to zero page
    BMI $76              ; 30 76 | Branch if negative
    BEQ $34              ; F0 34 | Branch if equal
    CPY $F8FF            ; CC FF F8 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BNE $01              ; D0 01 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    ORA $01F0,Y          ; 19 F0 01 | Logical OR with accumulator (absolute,Y)
    BEQ $8D              ; F0 8D | Branch if equal
    BVS $9F              ; 70 9F | Branch if overflow set
    CPX #$01             ; E0 01 | Compare X register (immediate)
    CPY #$0A             ; C0 0A | Compare Y register (immediate)
    LDA ($02,X)          ; A1 02 | Load from (zero page,X) into accumulator
    LDA $C0F800          ; AF 00 F8 C0 | Load from absolute long address into accumulator
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BMI $FC              ; 30 FC | Branch if negative
    INC $F700,X          ; FE 00 F7 | Increment (absolute,X)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    SBC $F31F,X          ; FD 1F F3 | Subtract with carry (absolute,X)
    AND $FD83,X          ; 3D 83 FD | Logical AND with accumulator (absolute,X)
    ADC ($0D,X)          ; 61 0D | Add with carry ((zero page,X))
    ROR $4E15            ; 6E 15 4E | Rotate right (absolute)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    ADC ($01),Y          ; 71 01 | Add with carry ((zero page),Y)
    LDA ($01),Y          ; B1 01 | Load from (zero page),Y into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $04              ; E5 04 | Subtract with carry (zero page)
    CPX $04              ; E4 04 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_073
; Address: $EEA3DE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_073:
    CPX $04              ; E4 04 | Compare X register (zero page)
    STA $6F9F7F          ; 8F 7F 9F 6F | Store accumulator to absolute long address
    LDA                  ; BF 58 C0 1F | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    AND ($07),Y          ; 31 07 | Logical AND with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    DEC $EF00,X          ; DE 00 EF | Decrement (absolute,X)
    CPX $F4FF            ; EC FF F4 | Compare X register (absolute)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    PEA #$0CF4           ; F4 F4 0C | Push effective address to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_074
; Address: $EEA424
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_074:
    ASL $031F,X          ; 1E 1F 03 | Arithmetic shift left (absolute,X)
    BEQ $30              ; F0 30 | Branch if equal
    LDA $00FFAF          ; AF AF FF 00 | Load from absolute long address into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX $F38C            ; EC 8C F3 | Compare X register (absolute)
    CPY $07              ; C4 07 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    JMP $817C            ; 4C 7C 81 | Jump to address
    ORA ($64,X)          ; 01 64 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_075
; Address: $EEA46E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_075:
    SBC ($FC,X)          ; E1 FC | Subtract with carry ((zero page,X))
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $9F00,X          ; FE 00 9F | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    PLA                  ; 68 | Pull accumulator from stack
    BRA $9F              ; 80 9F | Branch always
    BRA $03              ; 80 03 | Branch always
    INC $FFC7,X          ; FE C7 FF | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_076
; Address: $EEA4A8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_076:
    WDM #$F0             ; 42 F0 | Reserved instruction
    BMI $FF              ; 30 FF | Branch if negative
    LDA $00FFAF          ; AF AF FF 00 | Load from absolute long address into accumulator
    BVC $00              ; 50 00 | Branch if overflow clear
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_077
; Address: $EEA4C2
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_077:
    ROR $01              ; 66 01 | Rotate right (zero page)
    BMI $76              ; 30 76 | Branch if negative
    BEQ $34              ; F0 34 | Branch if equal
    CPY $FFFF            ; CC FF FF | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BCC $10              ; 90 10 | Branch if carry clear
    ROL $FC7E,X          ; 3E 7E FC | Rotate left (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BEQ $03              ; F0 03 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $F907,Y          ; F9 07 F9 | Subtract with carry (absolute,Y)
    BVS $0F              ; 70 0F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_078
; Address: $EEA524
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_078:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP $D232            ; CD 32 D2 | Compare accumulator (absolute)
    AND $27D8            ; 2D D8 27 | Logical AND with accumulator (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    LDA                  ; BF 42 3F C0 | Load from absolute long,X into accumulator
    STY $FF              ; 84 FF | Store Y register to zero page
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    WDM #$FE             ; 42 FE | Reserved instruction
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    STY $FC              ; 84 FC | Store Y register to zero page
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    LDA $69FF,Y          ; B9 FF 69 | Load from absolute,Y into accumulator
    JMP $47FE            ; 4C FE 47 | Jump to address
    INC $9D              ; E6 9D | Increment (zero page)
    CMP $B1BF            ; CD BF B1 | Compare accumulator (absolute)
    LDA ($B9),Y          ; B1 B9 | Load from (zero page),Y into accumulator
    LDA $6969,Y          ; B9 69 69 | Load from absolute,Y into accumulator
    JMP $46674C          ; 5C 4C 67 46 | Jump to address long
    REP #$DD             ; C2 DD | Reset processor status bits
    BRA $BF              ; 80 BF | Branch always
    BRA $DF              ; 80 DF | Branch always
    LDA                  ; BF 7F 7F FF | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_079
; Address: $EEA5A5
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_079:
    STA                  ; 9F 46 BF 0E | Store accumulator to absolute long,X
    STA $FF9EFF          ; 8F FF 9E FF | Store accumulator to absolute long address
    CLV                  ; B8 | Clear overflow flag
    STA $CF1FE3          ; 8F E3 1F CF | Store accumulator to absolute long address
    LDA                  ; BF C0 BF C0 | Load from absolute long,X into accumulator
    LDA                  ; BF C0 3F C0 | Load from absolute long,X into accumulator
    ORA $06E2,X          ; 1D E2 06 | Logical OR with accumulator (absolute,X)
    SBC $F10E,Y          ; F9 0E F1 | Subtract with carry (absolute,Y)
    ROL $E0D1            ; 2E D1 E0 | Game work RAM access
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_07B
; Address: $EEA60E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_07B:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROR $7EFF,X          ; 7E FF 7E | Rotate right (absolute,X)
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    AND $FECD,X          ; 3D CD FE | Logical AND with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    AND $2DDC,X          ; 3D DC 2D | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_07C
; Address: $EEA654
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_07C:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $00              ; 64 00 | Store zero to zero page
    CMP $8C23,X          ; DD 23 8C | Compare accumulator (absolute,X)
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    ORA $67F3            ; 0D F3 67 | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    STY $00              ; 84 00 | Store Y register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ROL $F8F7,X          ; 3E F7 F8 | Rotate left (absolute,X)
    SBC $C1F6,Y          ; F9 F6 C1 | Subtract with carry (absolute,Y)
    INC $FEC1,X          ; FE C1 FE | Increment (absolute,X)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    SBC $FFC2,X          ; FD C2 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_07D
; Address: $EEA68F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_07D:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    AND $3900,X          ; 3D 00 39 | Logical AND with accumulator (absolute,X)
    BCC $1F              ; 90 1F | Branch if carry clear
    STY $1C              ; 84 1C | Store Y register to zero page
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    STA $088F08          ; 8F 08 8F 08 | Store accumulator to absolute long address
    STA $318E00          ; 8F 00 8E 31 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_07E
; Address: $EEA6B3
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_07E:
    BVS $63              ; 70 63 | Branch if overflow set
    ROR $7877,X          ; 7E 77 78 | Rotate right (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BVS $C7              ; 70 C7 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    ADC #$99             ; 69 99 | Add with carry (immediate)
    ADC ($98,X)          ; 61 98 | Add with carry ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    STA                  ; 9F 00 08 00 | Store accumulator to absolute long,X
    INC $00              ; E6 00 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    INY                  ; C8 | Increment Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_07F
; Address: $EEA6E7
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_07F:
    LDA $EF97AB          ; AF AB 97 EF | Load from absolute long address into accumulator
    CLV                  ; B8 | Clear overflow flag
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    BEQ $07              ; F0 07 | Branch if equal
    BEQ $06              ; F0 06 | Branch if equal
    BEQ $06              ; F0 06 | Branch if equal
    BEQ $06              ; F0 06 | Branch if equal
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    INC $1F              ; E6 1F | Increment (zero page)
    CLC                  ; 18 | Clear carry flag
    LSR $CF31            ; 4E 31 CF | Logical shift right (absolute)
    BMI $BF              ; 30 BF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BCS $77              ; B0 77 | Branch if carry set
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_080
; Address: $EEA72F
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_080:
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF F1 7F F0 | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    BCS $FF              ; B0 FF | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ORA $39FF,X          ; 1D FF 39 | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ORA $39FF,X          ; 1D FF 39 | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    INC $F434,X          ; FE 34 F4 | Increment (absolute,X)
    CMP $DD3F,X          ; DD 3F DD | Compare accumulator (absolute,X)
    DEC $DE3F,X          ; DE 3F DE | Decrement (absolute,X)
    STZ $1E7F,X          ; 9E 7F 1E | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF FF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF C6 73 8C | Load from absolute long,X into accumulator
    SBC $7E00,X          ; FD 00 7E | Subtract with carry (absolute,X)
    STA                  ; 9F 3E FF 3E | Store accumulator to absolute long,X
    ROL $3EFF,X          ; 3E FF 3E | Rotate left (absolute,X)
    ROL $7EFF,X          ; 3E FF 7E | Rotate left (absolute,X)
    ROL $FFFF,X          ; 3E FF FF | Rotate left (absolute,X)
    ROL $38C1,X          ; 3E C1 38 | Rotate left (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    STA $008F00          ; 8F 00 8F 00 | Store accumulator to absolute long address
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    INC $3100,X          ; FE 00 31 | Increment (absolute,X)
    DEC $CC33            ; CE 33 CC | Decrement (absolute)
    CPY $CC37            ; CC 37 CC | Compare Y register (absolute)
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $FD82,X          ; FD 82 FD | Subtract with carry (absolute,X)
    DEX                  ; CA | Decrement X register
    SBC $FDCA,X          ; FD CA FD | Subtract with carry (absolute,X)
    BNE $FF              ; D0 FF | Branch if not equal
    SBC $F702,X          ; FD 02 F7 | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_081
; Address: $EEA839
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_081:
    SEC                  ; 38 | Set carry flag
    CMP #$3C             ; C9 3C | Compare accumulator (immediate)
    CMP #$3C             ; C9 3C | Compare accumulator (immediate)
    CMP $F33E,Y          ; D9 3E F3 | Compare accumulator (absolute,Y)
    ROR $4E81,X          ; 7E 81 4E | Rotate right (absolute,X)
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    LDA ($0C),Y          ; B1 0C | Load from (zero page),Y into accumulator
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    BRA $31              ; 80 31 | Branch always
    AND ($8C),Y          ; 31 8C | Logical AND with accumulator ((zero page),Y)
    AND ($80),Y          ; 31 80 | Logical AND with accumulator ((zero page),Y)
    AND ($80),Y          ; 31 80 | Logical AND with accumulator ((zero page),Y)
    AND ($C0),Y          ; 31 C0 | Logical AND with accumulator ((zero page),Y)
    AND ($C8),Y          ; 31 C8 | Logical AND with accumulator ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $FC07            ; EC 07 FC | Compare X register (absolute)
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    STA ($03,X)          ; 81 03 | Store accumulator to (zero page,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $03              ; 80 03 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $FF              ; 80 FF | Branch always
    INC $FC77,X          ; FE 77 FC | Increment (absolute,X)
    LDA                  ; BF C0 3F C0 | Load from absolute long,X into accumulator
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    DEC $9C21,X          ; DE 21 9C | Decrement (absolute,X)
    STZ $9CE3            ; 9C E3 9C | Store zero to absolute
    CPX $EC03            ; EC 03 EC | Compare X register (absolute)
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    BPL $13              ; 10 13 | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    STY $7B              ; 84 7B | Store Y register to zero page
    STY $3B              ; 84 3B | Store Y register to zero page
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY $1A              ; C4 1A | Compare Y register (zero page)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    ASL $FAE7,X          ; 1E E7 FA | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_082
; Address: $EEA8D8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_082:
    INX                  ; E8 | Increment X register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BEQ $06              ; F0 06 | Branch if equal
    BNE $6F              ; D0 6F | Branch if not equal
    STA $7A              ; 85 7A | Store accumulator to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_083
; Address: $EEA8EB
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_083:
    XBA                  ; EB | Exchange accumulator bytes
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_084
; Address: $EEA8F0
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_084:
    JSR $2040            ; 20 40 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BEQ $07              ; F0 07 | Branch if equal
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    BNE $03              ; D0 03 | Branch if not equal
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    LDY #$8F             ; A0 8F | Load immediate value into Y register
    PLX                  ; FA | Pull X register from stack
    SBC $FFC0,Y          ; F9 C0 FF | Subtract with carry (absolute,Y)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    SBC $FFFF,Y          ; F9 FF FF | Subtract with carry (absolute,Y)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_085
; Address: $EEA949
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_085:
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($34,X)          ; 81 34 | Store accumulator to (zero page,X)
    PEA #$F030           ; F4 30 F0 | Push effective address to stack
    BMI $F0              ; 30 F0 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_086
; Address: $EEA957
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_086:
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    CPX #$81             ; E0 81 | Compare X register (immediate)
    BRA $81              ; 80 81 | Branch always
    BRA $81              ; 80 81 | Branch always
    BRA $01              ; 80 01 | Branch always
    CPX $CD3E            ; EC 3E CD | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_087
; Address: $EEA968
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_087:
    SBC $FD1F,X          ; FD 1F FD | Subtract with carry (absolute,X)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LSR $78FF            ; 4E FF 78 | Logical shift right (absolute)
    WDM #$FD             ; 42 FD | Reserved instruction
    BCC $3F              ; 90 3F | Branch if carry clear
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $E7              ; F0 E7 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STX $3E00            ; 8E 00 3E | Store X register to absolute address
    ASL $FF00,X          ; 1E 00 FF | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    LSR $4EF1            ; 4E F1 4E | Logical shift right (absolute)
    BEQ $4A              ; F0 4A | Branch if equal
    PEA #$F24D           ; F4 4D F2 | Push effective address to stack
    STA $9470            ; 8D 70 94 | Store accumulator to absolute address
    AND #$F9             ; 29 F9 | Logical AND with accumulator (immediate)
    ORA ($D9,X)          ; 01 D9 | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    WDM #$7C             ; 42 7C | Reserved instruction
    LDA                  ; BF 5C BF 5C | Load from absolute long,X into accumulator
    LDA                  ; BF C8 3F C8 | Load from absolute long,X into accumulator
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    INC $3C00,X          ; FE 00 3C | Increment (absolute,X)
    ASL $4800,X          ; 1E 00 48 | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    AND #$F6             ; 29 F6 | Logical AND with accumulator (immediate)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $F000,Y          ; F9 00 F0 | Subtract with carry (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    ORA $F6              ; 05 F6 | Logical OR with accumulator (zero page)
    ORA $0DF6            ; 0D F6 0D | Logical OR with accumulator (absolute)
    CMP $DC36            ; CD 36 DC | Compare accumulator (absolute)
    PHX                  ; DA | Push X register to stack
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    ORA ($66,X)          ; 01 66 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_088
; Address: $EEAA13
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_088:
    ORA #$44             ; 09 44 | Logical OR with accumulator (immediate)
    CPY $13              ; C4 13 | Compare Y register (zero page)
    STA $02              ; 85 02 | Store accumulator to zero page
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    BIT $28FF            ; 2C FF 28 | Test bits in accumulator (absolute)
    ROL $7F92,X          ; 3E 92 7F | Rotate left (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    LDX $BE7F,Y          ; BE 7F BE | Load from absolute,Y into X register
    STA                  ; 9F 7F 06 F9 | Store accumulator to absolute long,X
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $3EF1            ; 0E F1 3E | Arithmetic shift left (absolute)
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    CMP ($5C,X)          ; C1 5C | Compare accumulator ((zero page,X))
    JMP $65F7            ; 4C F7 65 | Jump to address
    BMI $CB              ; 30 CB | Branch if negative
    BVS $8F              ; 70 8F | Branch if overflow set
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    EOR $FE              ; 45 FE | Exclusive OR with accumulator (zero page)
    EOR $FE              ; 45 FE | Exclusive OR with accumulator (zero page)
    ADC ($F6,X)          ; 61 F6 | Add with carry ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    STA                  ; 9F 7F FB 0C | Store accumulator to absolute long,X
    BRA $3F              ; 80 3F | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $B3              ; 80 B3 | Branch always
    CPY $0080            ; CC 80 00 | Compare Y register (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA                  ; 9F 60 80 70 | Store accumulator to absolute long,X
    LDA                  ; BF C0 CF 30 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_089
; Address: $EEAA85
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_089:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BCC $63              ; 90 63 | Branch if carry clear
    CPX $FC43            ; EC 43 FC | Compare X register (absolute)
    BEQ $0C              ; F0 0C | Branch if equal
    BRA $0C              ; 80 0C | Branch always
    BCC $6F              ; 90 6F | Branch if carry clear
    STA                  ; 9F 50 9B 40 | Store accumulator to absolute long,X
    STA $E71E00          ; 8F 00 1E E7 | Store accumulator to absolute long address
    ASL $1DE7,X          ; 1E E7 1D | Arithmetic shift left (absolute,X)
    CPX #$DE             ; E0 DE | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_08A
; Address: $EEAACC
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_08A:
    CPX #$DE             ; E0 DE | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $06              ; F0 06 | Branch if equal
    BEQ $06              ; F0 06 | Branch if equal
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    JMP $84F3            ; 4C F3 84 | Jump to address
    STY $FB              ; 84 FB | Store Y register to zero page
    LDY $BCB3,X          ; BC B3 BC | Load from absolute,X into Y register
    JMP $303F            ; 4C 3F 30 | Jump to address
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY $BCC0,X          ; BC C0 BC | Load from absolute,X into Y register
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BRA $03              ; 80 03 | Branch always
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    STA ($0E,X)          ; 81 0E | Store accumulator to (zero page,X)
    STA ($2C,X)          ; 81 2C | Store accumulator to (zero page,X)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    STA $FF8F7F          ; 8F 7F 8F FF | Store accumulator to absolute long address
    STA $956B            ; 8D 6B 95 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_08B
; Address: $EEAB2C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_08B:
    CLI                  ; 58 | Clear interrupt disable flag
    AND $DBC6,Y          ; 39 C6 DB | Logical AND with accumulator (absolute,Y)
    STA $9DFF            ; 8D FF 9D | Store accumulator to absolute address
    STA $BCFF,X          ; 9D FF BC | Store accumulator to absolute,X
    LDA                  ; BF FF FE FF | Load from absolute long,X into accumulator
    INC $FEC1,X          ; FE C1 FE | Increment (absolute,X)
    CMP #$FE             ; C9 FE | Compare accumulator (immediate)
    SBC $F1FE,Y          ; F9 FE F1 | Subtract with carry (absolute,Y)
    INC $FEE1,X          ; FE E1 FE | Increment (absolute,X)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    ADC ($C1,X)          ; 61 C1 | Add with carry ((zero page,X))
    CPY #$C9             ; C0 C9 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $E3              ; F0 E3 | Branch if equal
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPX #$63             ; E0 63 | Compare X register (immediate)
    CPX #$63             ; E0 63 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_08C
; Address: $EEAB5F
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_08C:
    CPX #$B1             ; E0 B1 | Compare X register (immediate)
    ROR $7E81,X          ; 7E 81 7E | Rotate right (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA ($7E,X)          ; A1 7E | Load from (zero page,X) into accumulator
    INC $FE63,X          ; FE 63 FE | Increment (absolute,X)
    INC $FEE7,X          ; FE E7 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPX $CC08            ; EC 08 CC | Compare X register (absolute)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    CMP $04              ; C5 04 | Compare accumulator (zero page)
    CMP $F418,Y          ; D9 18 F4 | Compare accumulator (absolute,Y)
    ORA $19F4,Y          ; 19 F4 19 | Logical OR with accumulator (absolute,Y)
    CMP ($39),Y          ; D1 39 | Compare accumulator ((zero page),Y)
    CMP ($3B),Y          ; D1 3B | Compare accumulator ((zero page),Y)
    LDA #$73             ; A9 73 | Load immediate value into accumulator
    PLB                  ; AB | Pull data bank register from stack
    PLB                  ; AB | Pull data bank register from stack
    BIT $87              ; 24 87 | Test bits in accumulator (zero page)
    BIT $87              ; 24 87 | Test bits in accumulator (zero page)
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    CPX #$43             ; E0 43 | Compare X register (immediate)
    LDY $8C73,X          ; BC 73 8C | Load from absolute,X into Y register
    STY $20D3            ; 8C D3 20 | Store Y register to absolute address
    BMI $87              ; 30 87 | Branch if negative
    BVS $82              ; 70 82 | Branch if overflow set
    ADC $000F,X          ; 7D 0F 00 | Add with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    INC $FE0C,X          ; FE 0C FE | Increment (absolute,X)
    INC $FF08,X          ; FE 08 FF | Increment (absolute,X)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    BIT #$77             ; 89 77 | Test bits in accumulator (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    STY $7F              ; 84 7F | Store Y register to zero page
    SBC ($7E,X)          ; E1 7E | Subtract with carry ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SBC $AE07,Y          ; F9 07 AE | Subtract with carry (absolute,Y)
    EOR ($3E),Y          ; 51 3E | Exclusive OR with accumulator ((zero page),Y)
    CMP ($78,X)          ; C1 78 | Compare accumulator ((zero page,X))
    ORA $1BEC            ; 0D EC 1B | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_08D
; Address: $EEAC0E
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_08D:
    SEC                  ; 38 | Set carry flag
    BMI $0C              ; 30 0C | Branch if negative
    STA ($18),Y          ; 91 18 | Store accumulator to (zero page),Y
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    CPX #$0D             ; E0 0D | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $3D02,X          ; 1D 02 3D | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $FDD2,X          ; FD D2 FD | Subtract with carry (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    INC $CFB1            ; EE B1 CF | Increment (absolute)
    BCS $3E              ; B0 3E | Branch if carry set
    CMP ($5C,X)          ; C1 5C | Compare accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    SBC $F9A7,Y          ; F9 A7 F9 | Subtract with carry (absolute,Y)
    LDA $39D7,Y          ; B9 D7 39 | Load from absolute,Y into accumulator
    LDA $BB65,X          ; BD 65 BB | Load from absolute,X into accumulator
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    CMP ($FC),Y          ; D1 FC | Compare accumulator ((zero page),Y)
    SBC ($FC,X)          ; E1 FC | Subtract with carry ((zero page,X))
    SBC ($FC),Y          ; F1 FC | Subtract with carry ((zero page),Y)
    SBC ($FC),Y          ; F1 FC | Subtract with carry ((zero page),Y)
    SBC ($F8),Y          ; F1 F8 | Subtract with carry ((zero page),Y)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    CPX $E39C            ; EC 9C E3 | Compare X register (absolute)
    STZ $9CE3            ; 9C E3 9C | Store zero to absolute
    STA                  ; 9F E0 94 EB | Store accumulator to absolute long,X
    XBA                  ; EB | Exchange accumulator bytes
    STA $FA              ; 85 FA | Store accumulator to zero page
    BRA $70              ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_08F
; Address: $EEAC77
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_08F:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $6F              ; 90 6F | Branch if carry clear
    CPX $EC1F            ; EC 1F EC | Compare X register (absolute)
    STA $101F00          ; 8F 00 1F 10 | Store accumulator to absolute long address
    BPL $1F              ; 10 1F | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    BNE $F8              ; D0 F8 | Branch if not equal
    DEC $F8              ; C6 F8 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_090
; Address: $EEACC4
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_090:
    DEC $F8              ; C6 F8 | Decrement (zero page)
    DEC $F8              ; C6 F8 | Decrement (zero page)
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BNE $F8              ; D0 F8 | Branch if not equal
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    INC $0E              ; E6 0E | Increment (zero page)
    INC $0E              ; E6 0E | Increment (zero page)
    JMP $3F3F            ; 4C 3F 3F | Jump to address
    BMI $3F              ; 30 3F | Branch if negative
    BMI $3F              ; 30 3F | Branch if negative
    LDA                  ; BF 80 FF C0 | Load from absolute long,X into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    STA $01DE21          ; 8F 21 DE 01 | Store accumulator to absolute long address
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    REP #$3D             ; C2 3D | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    EOR $09FF            ; 4D FF 09 | Exclusive OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROR $7DFF,X          ; 7E FF 7D | Rotate right (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    EOR $09CD            ; 4D CD 09 | Exclusive OR with accumulator (absolute)
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    DEY                  ; 88 | Decrement Y register
    INC $FE61,X          ; FE 61 FE | Increment (absolute,X)
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    CMP ($FC,X)          ; C1 FC | Compare accumulator ((zero page,X))
    CPX #$63             ; E0 63 | Compare X register (immediate)
    CPX #$C3             ; E0 C3 | Compare X register (immediate)
    CPY #$83             ; C0 83 | Compare Y register (immediate)
    BRA $87              ; 80 87 | Branch always
    BRA $87              ; 80 87 | Branch always
    BRA $47              ; 80 47 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_092
; Address: $EEAD63
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_092:
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FF7E,X          ; FE 7E FF | Increment (absolute,X)
    ROR $7CFF,X          ; 7E FF 7C | Rotate right (absolute,X)
    ADC $00FF,Y          ; 79 FF 00 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_093
; Address: $EEAD88
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_093:
    JSL $1D221D          ; 22 1D 22 1D | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $2779,X          ; 1D 79 27 | Logical OR with accumulator (absolute,X)
    LDA ($28,X)          ; A1 28 | Load from (zero page,X) into accumulator
    LDA ($28,X)          ; A1 28 | Load from (zero page,X) into accumulator
    LDA ($20,X)          ; A1 20 | Load from (zero page,X) into accumulator
    LDA ($20,X)          ; A1 20 | Load from (zero page,X) into accumulator
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    LDY #$9B             ; A0 9B | Load immediate value into Y register
    STA                  ; 9F E7 B5 CF | Store accumulator to absolute long,X
    BCS $CF              ; B0 CF | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $6FDF            ; AC DF 6F | Load from absolute address into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)
    STZ $9863            ; 9C 63 98 | Store zero to absolute
    LDY $53              ; A4 53 | Load from zero page into Y register
    JMP ($ECDF)          ; 6C DF EC | Jump to address (absolute indirect)
    STY $FFFF            ; 8C FF FF | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FF              ; E6 FF | Increment (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BPL $DF              ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_095
; Address: $EEAE02
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_095:
    JSR $C6DF            ; 20 DF C6 | Jump to subroutine
    AND $38C7,Y          ; 39 C7 38 | Logical AND with accumulator (absolute,Y)
    DEC $DF21,X          ; DE 21 DF | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_097
; Address: $EEAE13
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_097:
    JSR $01DC            ; 20 DC 01 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    JMP $6EF3            ; 4C F3 6E | Jump to address
    SBC ($AF),Y          ; F1 AF | Subtract with carry ((zero page),Y)
    BEQ $17              ; F0 17 | Branch if equal
    SBC $FDDA,Y          ; F9 DA FD | Subtract with carry (absolute,Y)
    SBC #$F6             ; E9 F6 | Subtract with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BNE $FF              ; D0 FF | Branch if not equal
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_098
; Address: $EEAE3C
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_098:
    INC $F01E            ; EE 1E F0 | Increment (absolute)
    ORA #$AF             ; 09 AF | Logical OR with accumulator (immediate)
    LDA                  ; BF BF 81 E3 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $8F              ; F0 8F | Branch if equal
    CPX #$2F             ; E0 2F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $FF              ; 80 FF | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    INX                  ; E8 | Increment X register
    STA                  ; 9F E8 8F F8 | Store accumulator to absolute long,X
    STA $F8BFF8          ; 8F F8 BF F8 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SBC $F801,Y          ; F9 01 F8 | Subtract with carry (absolute,Y)
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    ORA #$F8             ; 09 F8 | Logical OR with accumulator (immediate)
    ORA $F4              ; 05 F4 | Logical OR with accumulator (zero page)
    ASL $76              ; 06 76 | Arithmetic shift left (zero page)
    ASL $3A              ; 06 3A | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $8C1F            ; 8C 1F 8C | Store Y register to absolute address
    BVC $73              ; 50 73 | Branch if overflow clear
    BVC $73              ; 50 73 | Branch if overflow clear
    BVS $F3              ; 70 F3 | Branch if overflow set
    BVS $F3              ; 70 F3 | Branch if overflow set
    BVC $F3              ; 50 F3 | Branch if overflow clear
    BCC $F3              ; 90 F3 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_09A
; Address: $EEAEB5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_09A:
    CPY $CC93            ; CC 93 CC | Compare Y register (absolute)
    JMP ($6C13)          ; 6C 13 6C | Jump to address (absolute indirect)
    JMP $8C13            ; 4C 13 8C | Jump to address
    ORA $11FF,X          ; 1D FF 11 | Logical OR with accumulator (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    ROL $3EEF,X          ; 3E EF 3E | Rotate left (absolute,X)
    ROL $DFFF,X          ; 3E FF DF | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_09B
; Address: $EEAECF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_09B:
    JSR $11E0            ; 20 E0 11 | Jump to subroutine
    CPX #$11             ; E0 11 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_09E
; Address: $EEAEE2
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_09E:
    BCS $FF              ; B0 FF | Branch if carry set
    LDY $BC7F,X          ; BC 7F BC | Load from absolute,X into Y register
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    BCC $6F              ; 90 6F | Branch if carry clear
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0FF7            ; 0E F7 0F | Arithmetic shift left (absolute)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0FFF            ; 0E FF 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    SBC ($7E),Y          ; F1 7E | Subtract with carry ((zero page),Y)
    SBC ($7E),Y          ; F1 7E | Subtract with carry ((zero page),Y)
    SBC ($7E),Y          ; F1 7E | Subtract with carry ((zero page),Y)
    SBC ($7E),Y          ; F1 7E | Subtract with carry ((zero page),Y)
    ADC ($FE),Y          ; 71 FE | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    LDX $FF7F,Y          ; BE 7F FF | Load from absolute,Y into X register
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    STA                  ; 9F C0 FF C0 | Store accumulator to absolute long,X
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    LDA                  ; BF BF 5F 1F | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STA $FE0FFE          ; 8F FE 0F FE | Store accumulator to absolute long address
    INC $7F9E,X          ; FE 9E 7F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_09F
; Address: $EEAFC8
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_09F:
    STZ $9E7F,X          ; 9E 7F 9E | Store zero to absolute,X
    ADC $FEFE,X          ; 7D FE FE | Add with carry (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    STA                  ; 9F 60 DF 20 | Store accumulator to absolute long,X
    ADC $7F82,X          ; 7D 82 7F | Add with carry (absolute,X)
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $BF8FBE          ; 8F BE 8F BF | Store accumulator to absolute long address
    BIT #$BF             ; 89 BF | Test bits in accumulator (immediate)
    STA                  ; 9F BF C9 FF | Store accumulator to absolute long,X
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    CPY #$BB             ; C0 BB | Compare Y register (immediate)
    WDM #$B9             ; 42 B9 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    LDA $B646,Y          ; B9 46 B6 | Load from absolute,Y into accumulator
    LSR $F9              ; 46 F9 | Logical shift right (zero page)
    SBC $CE00,Y          ; F9 00 CE | Subtract with carry (absolute,Y)
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    CMP ($1D,X)          ; C1 1D | Compare accumulator ((zero page,X))
    ADC $FF8F,X          ; 7D 8F FF | Add with carry (absolute,X)
    STA $FD3F,X          ; 9D 3F FD | Store accumulator to absolute,X
    ROR $0FFC,X          ; 7E FC 0F | Rotate right (absolute,X)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    SBC $C700,Y          ; F9 00 C7 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A0
; Address: $EEB057
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A0:
    JSR $00CF            ; 20 CF 00 | Jump to subroutine
    INC $7F01,X          ; FE 01 7F | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $FCE3            ; EC E3 FC | Compare X register (absolute)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    CPX $FC10            ; EC 10 FC | Compare X register (absolute)
    BCC $09              ; 90 09 | Branch if carry clear
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    CPX #$28             ; E0 28 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A1
; Address: $EEB08E
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A1:
    LDA                  ; BF 7B 66 66 | Load from absolute long,X into accumulator
    ORA #$80             ; 09 80 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $D3              ; 30 D3 | Branch if negative
    CPX $EC03            ; EC 03 EC | Compare X register (absolute)
    CPX $EC03            ; EC 03 EC | Compare X register (absolute)
    INX                  ; E8 | Increment X register
    CPX #$87             ; E0 87 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    BPL $6F              ; 10 6F | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EE              ; 10 EE | Branch if positive
    BPL $EC              ; 10 EC | Branch if positive
    BPL $EC              ; 10 EC | Branch if positive
    BPL $8F              ; 10 8F | Branch if positive
    BVS $BF              ; 70 BF | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A2
; Address: $EEB0C3
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A2:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    INC $791F,X          ; FE 1F 79 | Increment (absolute,X)
    INC $FEF9,X          ; FE F9 FE | Increment (absolute,X)
    SBC $7FFE,Y          ; F9 FE 7F | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    LDY $BC3F,X          ; BC 3F BC | Load from absolute,X into Y register
    LDA                  ; BF BF BC BF | Load from absolute long,X into accumulator
    LDY $8C8F,X          ; BC 8F 8C | Load from absolute,X into Y register
    STA $808F88          ; 8F 88 8F 80 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BC 40 | Load from absolute long,X into accumulator
    LDY $8F40,X          ; BC 40 8F | Load from absolute,X into Y register
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $FF              ; 70 FF | Branch if overflow set
    ASL $1EFF            ; 0E FF 1E | Arithmetic shift left (absolute)
    ORA $3BFF,X          ; 1D FF 3B | Logical OR with accumulator (absolute,X)
    LDA                  ; BF 07 FF 1F | Load from absolute long,X into accumulator
    ASL $1EFE            ; 0E FE 1E | Arithmetic shift left (absolute)
    INC $FD1D,X          ; FE 1D FD | Increment (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    PLX                  ; FA | Pull X register from stack
    LDA $FFFD,X          ; BD FD FF | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $FF              ; 30 FF | Branch if negative
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    INC $1885,X          ; FE 85 18 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A3
; Address: $EEB135
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A3:
    BMI $33              ; 30 33 | Branch if negative
    AND ($21),Y          ; 31 21 | PPU graphics register access
    AND ($47,X)          ; 21 47 | Logical AND with accumulator ((zero page,X))
    LDY $FB84,X          ; BC 84 FB | Load from absolute,X into Y register
    PEA #$E40B           ; F4 0B E4 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BCC $4F              ; 90 4F | Branch if carry clear
    LDA ($67),Y          ; B1 67 | Load from (zero page),Y into accumulator
    LDA $001F,Y          ; B9 1F 00 | Load from absolute,Y into accumulator
    LDA                  ; BF 00 BF 80 | Load from absolute long,X into accumulator
    LDX $3980,Y          ; BE 80 39 | Load from absolute,Y into X register
    AND $39FF,Y          ; 39 FF 39 | Logical AND with accumulator (absolute,Y)
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    LDA ($7F),Y          ; B1 7F | Load from (zero page),Y into accumulator
    SBC ($7F),Y          ; F1 7F | Subtract with carry ((zero page),Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    INC $FFE1,X          ; FE E1 FF | Increment (absolute,X)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    SBC $FCFF,X          ; FD FF FC | Subtract with carry (absolute,X)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX $B7              ; E4 B7 | Compare X register (zero page)
    CPX $B7              ; E4 B7 | Compare X register (zero page)
    BIT $ECFF            ; 2C FF EC | Test bits in accumulator (absolute)
    INY                  ; C8 | Increment Y register
    INC $3759,X          ; FE 59 37 | Increment (absolute,X)
    BNE $F7              ; D0 F7 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    ADC $FFFE,X          ; 7D FE FF | Add with carry (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $BF              ; F0 BF | Branch if equal
    BEQ $3D              ; F0 3D | Branch if equal
    AND $62F6,Y          ; 39 F6 62 | Logical AND with accumulator (absolute,Y)
    SBC $00FC,X          ; FD FC 00 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    INC $C300,X          ; FE 00 C3 | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A4
; Address: $EEB1ED
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A4:
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    EOR $5DA2            ; 4D A2 5D | Exclusive OR with accumulator (absolute)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    CMP ($FE),Y          ; D1 FE | Compare accumulator ((zero page),Y)
    ADC $7F45,X          ; 7D 45 7F | Add with carry (absolute,X)
    CMP $CDFF            ; CD FF CD | Compare accumulator (absolute)
    CMP ($E6,X)          ; C1 E6 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A5
; Address: $EEB235
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A5:
    BRA $71              ; 80 71 | Branch always
    BRA $77              ; 80 77 | Branch always
    BRA $FF              ; 80 FF | Branch always
    BVS $FF              ; 70 FF | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    SBC $F902,X          ; FD 02 F9 | Subtract with carry (absolute,X)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    INC $F217,X          ; FE 17 F2 | Increment (absolute,X)
    PEA #$F407           ; F4 07 F4 | Push effective address to stack
    BEQ $13              ; F0 13 | Branch if equal
    BVS $93              ; 70 93 | Branch if overflow set
    BVS $93              ; 70 93 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ROR $7EBF            ; 6E BF 7E | Rotate right (absolute)
    LDA                  ; BF 6E 9F CF | Load from absolute long,X into accumulator
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A6
; Address: $EEB2B1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A6:
    ORA #$E0             ; 09 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A7
; Address: $EEB2B9
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A7:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    BCS $FE              ; B0 FE | Branch if carry set
    BCS $FE              ; B0 FE | Branch if carry set
    LDY $B87D,X          ; BC 7D B8 | Load from absolute,X into Y register
    ADC $FF7C,Y          ; 79 7C FF | Add with carry (absolute,Y)
    ROR $7E81,X          ; 7E 81 7E | Rotate right (absolute,X)
    STA ($7D,X)          ; 81 7D | Store accumulator to (zero page,X)
    ADC $FF06,Y          ; 79 06 FF | Add with carry (absolute,Y)
    BVS $8F              ; 70 8F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A8
; Address: $EEB2E2
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A8:
    JSR $43DF            ; 20 DF 43 | Jump to subroutine
    LDY $807F,X          ; BC 7F 80 | Load from absolute,X into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEC $00              ; C6 00 | Decrement (zero page)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $FEE9,X          ; FE E9 FE | Increment (absolute,X)
    BIT #$FE             ; 89 FE | Test bits in accumulator (immediate)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    SBC $FDF8,Y          ; F9 F8 FD | Subtract with carry (absolute,Y)
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    INX                  ; E8 | Increment X register
    PHB                  ; 8B | Push data bank register to stack
    DEY                  ; 88 | Decrement Y register
    BRA $06              ; 80 06 | Branch always
    STY $FF              ; 84 FF | Store Y register to zero page
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    SBC #$1E             ; E9 1E | Subtract with carry (immediate)
    SBC $E91E,Y          ; F9 1E E9 | Subtract with carry (absolute,Y)
    ASL $CDF9            ; 0E F9 CD | Arithmetic shift left (absolute)
    STY $7C              ; 84 7C | Store Y register to zero page
    BIT $F9              ; 24 F9 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    SBC $E7FF,X          ; FD FF E7 | Subtract with carry (absolute,X)
    CPX #$D7             ; E0 D7 | Compare X register (immediate)
    CPY #$D7             ; C0 D7 | Compare Y register (immediate)
    CPY #$D7             ; C0 D7 | Compare Y register (immediate)
    CPY #$DD             ; C0 DD | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0A9
; Address: $EEB36D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0A9:
    CLD                  ; D8 | Clear decimal mode flag
    STZ $EF9F,X          ; 9E 9F EF | Store zero to absolute,X
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0AB
; Address: $EEB37D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0AB:
    JSR $609F            ; 20 9F 60 | Jump to subroutine
    STY $9D7F            ; 8C 7F 9D | Store Y register to absolute address
    ROR $FE9C,X          ; 7E 9C FE | Rotate right (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    SED                  ; F8 | Set decimal mode flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STX $25              ; 86 25 | Store X register to zero page
    AND $44              ; 25 44 | Logical AND with accumulator (zero page)
    ROL $46              ; 26 46 | Rotate left (zero page)
    ROL $44              ; 26 44 | Rotate left (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0AC
; Address: $EEB3AF
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0AC:
    JSR $08F4            ; 20 F4 08 | Jump to subroutine
    SBC $18              ; E5 18 | Subtract with carry (zero page)
    SBC $58              ; E5 58 | Subtract with carry (zero page)
    SBC $D8              ; E5 D8 | Subtract with carry (zero page)
    LDX $99              ; A6 99 | Load from zero page into X register
    LDX $99              ; A6 99 | Load from zero page into X register
    LDY $9B              ; A4 9B | Load from zero page into Y register
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    BEQ $EF              ; F0 EF | Branch if equal
    BCC $EF              ; 90 EF | Branch if carry clear
    BCC $EF              ; 90 EF | Branch if carry clear
    BNE $EF              ; D0 EF | Branch if not equal
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    STA $06C770          ; 8F 70 C7 06 | Store accumulator to absolute long address
    ROR $5281,X          ; 7E 81 52 | Rotate right (absolute,X)
    LDA ($CF,X)          ; A1 CF | Load from (zero page,X) into accumulator
    BCS $FE              ; B0 FE | Branch if carry set
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    ROL $1EDC,X          ; 3E DC 1E | Rotate left (absolute,X)
    CPY $C00E            ; CC 0E C0 | Compare Y register (absolute)
    CPY $C00C            ; CC 0C C0 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    CPY $47              ; C4 47 | Compare Y register (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    LSR $B8              ; 46 B8 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0AD
; Address: $EEB421
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0AD:
    CMP ($CF,X)          ; C1 CF | Compare accumulator ((zero page,X))
    SBC ($CF),Y          ; F1 CF | Subtract with carry ((zero page),Y)
    SBC ($15),Y          ; F1 15 | Subtract with carry ((zero page),Y)
    AND $FCCF,X          ; 3D CF FC | Logical AND with accumulator (absolute,X)
    ROL $7EFC,X          ; 3E FC 7E | Rotate left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $F900,X          ; FD 00 F9 | Subtract with carry (absolute,X)
    INC $7E01,X          ; FE 01 7E | Increment (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STZ $1B              ; 64 1B | Store zero to zero page
    STZ $67              ; 64 67 | Store zero to zero page
    SEI                  ; 78 | Set interrupt disable flag
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    BRA $7E              ; 80 7E | Branch always
    BRA $7C              ; 80 7C | Branch always
    BRA $F5              ; 80 F5 | Branch always
    SBC #$17             ; E9 17 | Subtract with carry (immediate)
    CPY $3F              ; C4 3F | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC ($CC),Y          ; F1 CC | Subtract with carry ((zero page),Y)
    BIT $30D0            ; 2C D0 30 | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    BIT $3013            ; 2C 13 30 | Test bits in accumulator (absolute)
    BMI $D3              ; 30 D3 | Branch if negative
    EOR ($A6,X)          ; 41 A6 | Exclusive OR with accumulator ((zero page,X))
    STZ $E7              ; 64 E7 | Store zero to zero page
    INX                  ; E8 | Increment X register
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    CPX $8F              ; E4 8F | Compare X register (zero page)
    STA $270C13          ; 8F 13 0C 27 | Store accumulator to absolute long address
    CLC                  ; 18 | Clear carry flag
    ADC $18              ; 65 18 | Add with carry (zero page)
    SBC #$10             ; E9 10 | Subtract with carry (immediate)
    BPL $E4              ; 10 E4 | Branch if positive
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $8F              ; 10 8F | Branch if positive
    BVS $DF              ; 70 DF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0AE
; Address: $EEB4A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0AE:
    JSR $807F            ; 20 7F 80 | Jump to subroutine
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    INC $9E0F,X          ; FE 0F 9E | Increment (absolute,X)
    LDA $F97E,Y          ; B9 7E F9 | Load from absolute,Y into accumulator
    INC $FEF9,X          ; FE F9 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0AF
; Address: $EEB4BA
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0AF:
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $9C00,X          ; FE 00 9C | Increment (absolute,X)
    JMP $BF5CBF          ; 5C BF 5C BF | Jump to address long
    LDY $BC5F,X          ; BC 5F BC | Load from absolute,X into Y register
    CMP $26              ; C5 26 | Compare accumulator (zero page)
    CPY $27              ; C4 27 | Compare Y register (zero page)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    STZ $E300            ; 9C 00 E3 | Store zero to absolute
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SBC $F901,Y          ; F9 01 F9 | Subtract with carry (absolute,Y)
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    ORA ($79,X)          ; 01 79 | Logical OR with accumulator ((zero page,X))
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    BPL $FE              ; 10 FE | Branch if positive
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    BPL $6D              ; 10 6D | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B0
; Address: $EEB514
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B0:
    AND $FF00            ; 2D 00 FF | Logical AND with accumulator (absolute)
    STA $7B              ; 85 7B | Store accumulator to zero page
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    LDA                  ; BF FF FF 00 | Load from absolute long,X into accumulator
    DEC $BEFE,X          ; DE FE BE | Decrement (absolute,X)
    INC $E6E6,X          ; FE E6 E6 | Increment (absolute,X)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    ORA $1BE4,Y          ; 19 E4 1B | Logical OR with accumulator (absolute,Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $07              ; F0 07 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $FA              ; F0 FA | Branch if equal
    CPX #$2C             ; E0 2C | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B1
; Address: $EEB589
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B1:
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    CMP $C0              ; C5 C0 | Compare accumulator (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    INC $FB12,X          ; FE 12 FB | Increment (absolute,X)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    CPY $44              ; C4 44 | Compare Y register (zero page)
    CPY $54              ; C4 54 | Compare Y register (zero page)
    BVS $F0              ; 70 F0 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B2
; Address: $EEB5B6
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B2:
    BMI $4F              ; 30 4F | Branch if negative
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STA $FFE3FF          ; 8F FF E3 FF | Store accumulator to absolute long address
    STA $8B8F93          ; 8F 93 8F 8B | Store accumulator to absolute long address
    STA                  ; 9F 60 9F 60 | Store accumulator to absolute long,X
    STA $788770          ; 8F 70 87 78 | Store accumulator to absolute long address
    DEX                  ; CA | Decrement X register
    INC $EEF1            ; EE F1 EE | Increment (absolute)
    SBC ($AA),Y          ; F1 AA | Subtract with carry ((zero page),Y)
    LDA ($AA),Y          ; B1 AA | Load from (zero page),Y into accumulator
    LDA ($AE),Y          ; B1 AE | Load from (zero page),Y into accumulator
    LDA ($A8),Y          ; B1 A8 | Load from (zero page),Y into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $BF00,Y          ; F9 00 BF | Subtract with carry (absolute,Y)
    LDA                  ; BF 44 BF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    SBC $EF30,X          ; FD 30 EF | Subtract with carry (absolute,X)
    BMI $EF              ; 30 EF | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    INC $CCE7,X          ; FE E7 CC | Increment (absolute,X)
    BMI $E8              ; 30 E8 | Branch if negative
    BPL $F0              ; 10 F0 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $EAFE            ; EC FE EA | Compare X register (absolute)
    INC $F7EB,X          ; FE EB F7 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B3
; Address: $EEB626
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B3:
    CMP $D9E7,Y          ; D9 E7 D9 | Compare accumulator (absolute,Y)
    CMP $33EF,Y          ; D9 EF 33 | Compare accumulator (absolute,Y)
    SBC $FD33,X          ; FD 33 FD | Subtract with carry (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7C              ; 80 7C | Branch always
    BRA $FF              ; 80 FF | Branch always
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    BMI $BF              ; 30 BF | Branch if negative
    RTI                  ; 40 | Return from interrupt
    STA $8F898F          ; 8F 8F 89 8F | Store accumulator to absolute long address
    STA $8F8F8F          ; 8F 8F 8F 8F | Store accumulator to absolute long address
    STA $8F8F8F          ; 8F 8F 8F 8F | Store accumulator to absolute long address
    STY $8C8F            ; 8C 8F 8C | Store Y register to absolute address
    STA $8F708F          ; 8F 8F 70 8F | Store accumulator to absolute long address
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $F9              ; 70 F9 | Branch if overflow set
    INC $FEF1,X          ; FE F1 FE | Increment (absolute,X)
    SBC $E7D8,Y          ; F9 D8 E7 | Subtract with carry (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    DEC $DF3F,X          ; DE 3F DF | Decrement (absolute,X)
    ROL $00FF,X          ; 3E FF 00 | Rotate left (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    AND ($A1,X)          ; 21 A1 | Logical AND with accumulator ((zero page,X))
    ADC ($E1,X)          ; 61 E1 | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDA ($5E,X)          ; A1 5E | Load from (zero page,X) into accumulator
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $81              ; E6 81 | Increment (zero page)
    LDX $FFC1,Y          ; BE C1 FF | Load from absolute,Y into X register
    BRA $97              ; 80 97 | Branch always
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B4
; Address: $EEB6EF
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B4:
    TAY                  ; A8 | Transfer accumulator to Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    LDA $E2FD,X          ; BD FD E2 | Load from absolute,X into accumulator
    SEP #$00             ; E2 00 | Set processor status bits
    ASL $E31E,X          ; 1E 1E E3 | Arithmetic shift left (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC $E202,X          ; FD 02 E2 | Subtract with carry (absolute,X)
    ORA $FF00,X          ; 1D 00 FF | Logical OR with accumulator (absolute,X)
    ASL $FFE1,X          ; 1E E1 FF | Arithmetic shift left (absolute,X)
    STX $808E            ; 8E 8E 80 | Store X register to absolute address
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    STX $8071            ; 8E 71 80 | Store X register to absolute address
    SEC                  ; 38 | Set carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $01              ; 65 01 | Add with carry (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BNE $F0              ; D0 F0 | Branch if not equal
    CMP ($F1),Y          ; D1 F1 | Compare accumulator ((zero page),Y)
    ROL $26              ; 26 26 | Rotate left (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B5
; Address: $EEB78C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B5:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B6
; Address: $EEB79C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B6:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B7
; Address: $EEB7A6
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B7:
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0E0A            ; 0E 0A 0E | Arithmetic shift left (absolute)
    ASL $080E            ; 0E 0E 08 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ASL $0EF1            ; 0E F1 0E | Arithmetic shift left (absolute)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    BMI $3E              ; 30 3E | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    LDA                  ; BF 40 3F C0 | Load from absolute long,X into accumulator
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CMP ($38,X)          ; C1 38 | Compare accumulator ((zero page,X))
    INC $FEE1,X          ; FE E1 FE | Increment (absolute,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    BRA $B7              ; 80 B7 | Branch always
    DEY                  ; 88 | Decrement Y register
    STY $E31C            ; 8C 1C E3 | Store Y register to absolute address
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B8
; Address: $EEB811
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B8:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BCS $40              ; B0 40 | Branch if carry set
    BCS $40              ; B0 40 | Branch if carry set
    LDY #$40             ; A0 40 | Load immediate value into Y register
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC ($F2),Y          ; F1 F2 | Subtract with carry ((zero page),Y)
    DEC $F132            ; CE 32 F1 | Decrement (absolute)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0B9
; Address: $EEB844
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0B9:
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    BVS $03              ; 70 03 | Branch if overflow set
    ADC $5F02,Y          ; 79 02 5F | Add with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0BA
; Address: $EEB858
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0BA:
    LDA                  ; BF 10 1F 8C | Load from absolute long,X into accumulator
    STY $67              ; 84 67 | Store Y register to zero page
    BRA $81              ; 80 81 | Branch always
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    CMP $18A4            ; CD A4 18 | Compare accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    SBC $00FF,Y          ; F9 FF 00 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0BB
; Address: $EEB879
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0BB:
    JSR $43FE            ; 20 FE 43 | Jump to subroutine
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    BRA $8F              ; 80 8F | Branch always
    BRA $8F              ; 80 8F | Branch always
    BRA $8F              ; 80 8F | Branch always
    BRA $8F              ; 80 8F | Branch always
    BRA $8F              ; 80 8F | Branch always
    STZ $900C            ; 9C 0C 90 | Store zero to absolute
    ORA #$90             ; 09 90 | Logical OR with accumulator (immediate)
    STA $708F70          ; 8F 70 8F 70 | Store accumulator to absolute long address
    STA $708F70          ; 8F 70 8F 70 | Store accumulator to absolute long address
    STA $609E70          ; 8F 70 9E 60 | Store accumulator to absolute long address
    ROR $23              ; 66 23 | Rotate right (zero page)
    LDA ($FE,X)          ; A1 FE | Load from (zero page,X) into accumulator
    STA $6970            ; 8D 70 69 | Store accumulator to absolute address
    BCC $DF              ; 90 DF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0BC
; Address: $EEB8AB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0BC:
    JSR $8269            ; 20 69 82 | Jump to subroutine
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    PLX                  ; FA | Pull X register from stack
    DEC $06              ; C6 06 | Decrement (zero page)
    AND $E038,Y          ; 39 38 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0BD
; Address: $EEB8C2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0BD:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BVS $B4              ; 70 B4 | Branch if overflow set
    ADC $F1BD,Y          ; 79 BD F1 | Add with carry (absolute,Y)
    ADC $78E7,X          ; 7D E7 78 | Add with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0BF
; Address: $EEB8D4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0BF:
    BVS $0F              ; 70 0F | Branch if overflow set
    ADC $7D02,X          ; 7D 02 7D | Add with carry (absolute,X)
    STX $F9              ; 86 F9 | Store X register to zero page
    STX $F9              ; 86 F9 | Store X register to zero page
    SBC #$18             ; E9 18 | Subtract with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    INC $E007,X          ; FE 07 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C0
; Address: $EEB8F2
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C0:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    STZ $737C            ; 9C 7C 73 | Store zero to absolute
    STA $F83FCF          ; 8F CF 3F F8 | Store accumulator to absolute long address
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BMI $38              ; 30 38 | Branch if negative
    BMI $38              ; 30 38 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ROR $7A81,X          ; 7E 81 7A | Rotate right (absolute,X)
    SBC $FEE1,X          ; FD E1 FE | Subtract with carry (absolute,X)
    ORA $E31E,X          ; 1D 1E E3 | Logical OR with accumulator (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$CE             ; E0 CE | Compare X register (immediate)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    LDX $BCBC,Y          ; BE BC BC | Load from absolute,Y into X register
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BMI $B0              ; 30 B0 | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDX $BC41,Y          ; BE 41 BC | Load from absolute,Y into X register
    CLV                  ; B8 | Clear overflow flag
    BCS $4F              ; B0 4F | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 3B 3F 5F | Load from absolute long,X into accumulator
    LDA                  ; BF 40 3F C0 | Load from absolute long,X into accumulator
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C1
; Address: $EEB999
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C1:
    BRA $76              ; 80 76 | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $02              ; 80 02 | Branch always
    SBC $F007,Y          ; F9 07 F0 | Subtract with carry (absolute,Y)
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CMP ($FC,X)          ; C1 FC | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $F804,X          ; FD 04 F8 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BRA $0F              ; 80 0F | Branch always
    BCC $07              ; 90 07 | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    STA $41C2            ; 8D C2 41 | Store accumulator to absolute address
    BRA $60              ; 80 60 | Branch always
    BRA $60              ; 80 60 | Branch always
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    BVS $8C              ; 70 8C | Branch if overflow set
    BVS $8E              ; 70 8E | Branch if overflow set
    BIT #$0E             ; 89 0E | Test bits in accumulator (immediate)
    ORA $FF21,X          ; 1D 21 FF | Logical OR with accumulator (absolute,X)
    AND #$F3             ; 29 F3 | Logical AND with accumulator (immediate)
    STY $66              ; 84 66 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    INC $CE88            ; EE 88 CE | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    ADC ($78),Y          ; 71 78 | Add with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C2
; Address: $EEB9F5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C2:
    JSR $240B            ; 20 0B 24 | Jump to subroutine
    ORA $110E,Y          ; 19 0E 11 | Logical OR with accumulator (absolute,Y)
    ROL $FC31            ; 2E 31 FC | Rotate left (absolute)
    BEQ $CF              ; F0 CF | Branch if equal
    BEQ $8F              ; F0 8F | Branch if equal
    STY $8E8F            ; 8C 8F 8E | Store Y register to absolute address
    STY $8E70            ; 8C 70 8E | Store Y register to absolute address
    BVS $03              ; 70 03 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($E3,X)          ; 01 E3 | Logical OR with accumulator ((zero page,X))
    ORA $DFF9,X          ; 1D F9 DF | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C3
; Address: $EEBA2C
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C3:
    SBC $FDDF,Y          ; F9 DF FD | Subtract with carry (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $06              ; F0 06 | Branch if equal
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BIT $0C2C            ; 2C 2C 0C | Test bits in accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC $C7              ; C6 C7 | Decrement (zero page)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    BIT $0CD3            ; 2C D3 0C | Test bits in accumulator (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BRA $0F              ; 80 0F | Branch always
    BEQ $03              ; F0 03 | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    AND $B9FF,Y          ; 39 FF B9 | Logical AND with accumulator (absolute,Y)
    LDY #$E0             ; A0 E0 | Game work RAM access
    STA ($C1,X)          ; 81 C1 | Store accumulator to (zero page,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    LDA $A76F63          ; AF 63 6F A7 | Load from absolute long address into accumulator
    INC $AF              ; E6 AF | Increment (zero page)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BMI $E7              ; 30 E7 | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $4B              ; 10 4B | Branch if positive
    LDY $BC43            ; AC 43 BC | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C4
; Address: $EEBB00
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C4:
    BNE $3C              ; D0 3C | Branch if not equal
    BRA $78              ; 80 78 | Branch always
    ASL $2EFE            ; 0E FE 2E | Arithmetic shift left (absolute)
    INC $F070,X          ; FE 70 F0 | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    JMP ($C27C)          ; 6C 7C C2 | Jump to address (absolute indirect)
    INC $FC03,X          ; FE 03 FC | Increment (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    INC $F901,X          ; FE 01 F9 | Increment (absolute,X)
    STA                  ; 9F 00 1F 60 | Store accumulator to absolute long,X
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    CPX $01              ; E4 01 | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C5
; Address: $EEBB75
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C5:
    STA                  ; 9F E0 1F F0 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    INC $FEE1,X          ; FE E1 FE | Increment (absolute,X)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    STZ $8E00,X          ; 9E 00 8E | Store zero to absolute,X
    BRA $01              ; 80 01 | Branch always
    BRA $00              ; 80 00 | Branch always
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    BRA $7F              ; 80 7F | Branch always
    STA ($7C,X)          ; 81 7C | Store accumulator to (zero page,X)
    BRA $7C              ; 80 7C | Branch always
    BRA $7C              ; 80 7C | Branch always
    BRA $3C              ; 80 3C | Branch always
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BEQ $0E              ; F0 0E | Branch if equal
    BEQ $03              ; F0 03 | Branch if equal
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $0F              ; 80 0F | Branch always
    BRA $0F              ; 80 0F | Branch always
    ROL $FE01,X          ; 3E 01 FE | Rotate left (absolute,X)
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    STA $FF0FFF          ; 8F FF 0F FF | Store accumulator to absolute long address
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C6
; Address: $EEBBEC
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C6:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ROL $F8FF,X          ; 3E FF F8 | Rotate left (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $FF              ; 10 FF | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    CLC                  ; 18 | Clear carry flag
    BPL $FF              ; 10 FF | Branch if positive
    BMI $FF              ; 30 FF | Branch if negative
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP $FBC7            ; CD C7 FB | Compare accumulator (absolute)
    LDA $FDB3F3          ; AF F3 B3 FD | Load from absolute long address into accumulator
    LDA $BDFE,Y          ; B9 FE BD | Load from absolute,Y into accumulator
    ROR $DFCD,X          ; 7E CD DF | Rotate right (absolute,X)
    SBC $FE81,X          ; FD 81 FE | Subtract with carry (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    STA                  ; 9F FF 01 FF | Store accumulator to absolute long,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $C3              ; 30 C3 | Branch if negative
    STA                  ; 9F 9F 01 01 | Store accumulator to absolute long,X
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $30              ; 30 30 | Branch if negative
    LDY $BC7F,X          ; BC 7F BC | Load from absolute,X into Y register
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $B847,X          ; 1E 47 B8 | Arithmetic shift left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    CPX $3EFF            ; EC FF 3E | Compare X register (absolute)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    LDX $FC06,Y          ; BE 06 FC | Load from absolute,Y into X register
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BEQ $F1              ; F0 F1 | Branch if equal
    SBC ($BD),Y          ; F1 BD | Subtract with carry ((zero page),Y)
    SBC $E2E2,X          ; FD E2 E2 | Subtract with carry (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C7
; Address: $EEBCF4
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C7:
    SBC $E202,X          ; FD 02 E2 | Subtract with carry (absolute,X)
    ORA $FF00,X          ; 1D 00 FF | Logical OR with accumulator (absolute,X)
    STA $BFBD8F          ; 8F 8F BD BF | Store accumulator to absolute long address
    BEQ $8F              ; F0 8F | Branch if equal
    BVS $BF              ; 70 BF | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    NOP                  ; EA | No operation
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ASL $D3F9            ; 0E F9 D3 | Arithmetic shift left (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    STA $F0EFFF          ; 8F FF EF F0 | Store accumulator to absolute long address
    BEQ $CF              ; F0 CF | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    BRA $0F              ; 80 0F | Branch always
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C8
; Address: $EEBD62
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C8:
    STA $FFFCFF          ; 8F FF FC FF | Store accumulator to absolute long address
    PLP                  ; 28 | Pull processor status from stack
    BNE $3F              ; D0 3F | Branch if not equal
    CPX $1817            ; EC 17 18 | Compare X register (absolute)
    STA                  ; 9F 60 FF FF | Store accumulator to absolute long,X
    CLC                  ; 18 | Clear carry flag
    INC $9EFF,X          ; FE FF 9E | Increment (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $13FFF7          ; 8F F7 FF 13 | Store accumulator to absolute long address
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $0DD2            ; 0D D2 0D | Logical OR with accumulator (absolute)
    ORA $3FC0            ; 0D C0 3F | Logical OR with accumulator (absolute)
    BRA $7F              ; 80 7F | Branch always
    BRA $7A              ; 80 7A | Branch always
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BPL $90              ; 10 90 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0C9
; Address: $EEBDC7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0C9:
    JSR $6303            ; 20 03 63 | Jump to subroutine
    CMP ($31,X)          ; C1 31 | Compare accumulator ((zero page,X))
    CMP ($21,X)          ; C1 21 | PPU graphics register access
    DEC $EF3E,X          ; DE 3E EF | Decrement (absolute,X)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    CPX #$01             ; E0 01 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0CA
; Address: $EEBDDF
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0CA:
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    ASL $3C3C            ; 0E 3C 3C | Arithmetic shift left (absolute)
    BIT $1918            ; 2C 18 19 | Test bits in accumulator (absolute)
    BPL $13              ; 10 13 | Branch if positive
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA                  ; 9F BF 47 3F | Store accumulator to absolute long,X
    SBC ($DB,X)          ; E1 DB | Subtract with carry ((zero page,X))
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    AND $F8              ; 25 F8 | Logical AND with accumulator (zero page)
    STA                  ; 9F B0 07 30 | Store accumulator to absolute long,X
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $837D            ; 0E 7D 83 | Arithmetic shift left (absolute)
    LDA $DD43,X          ; BD 43 DD | Load from absolute,X into accumulator
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    DEC $F3FF,X          ; DE FF F3 | Decrement (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX $1CFB            ; EC FB 1C | Compare X register (absolute)
    PEA #$F0F0           ; F4 F0 F0 | Push effective address to stack
    BEQ $13              ; F0 13 | Branch if equal
    CPX $E31F            ; EC 1F E3 | Compare X register (absolute)
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    PEA #$FF80           ; F4 80 FF | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SBC $F90A,X          ; FD 0A F9 | Subtract with carry (absolute,X)
    DEC $FD              ; C6 FD | Decrement (zero page)
    REP #$FD             ; C2 FD | Reset processor status bits
    DEX                  ; CA | Decrement X register
    ROL $0EF3            ; 2E F3 0E | Rotate left (absolute)
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    SBC $2700,X          ; FD 00 27 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0CB
; Address: $EEBEC1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0CB:
    JSR $21FF            ; 20 FF 21 | PPU graphics register access
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    ASL $0EFF            ; 0E FF 0E | Arithmetic shift left (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    REP #$F1             ; C2 F1 | Reset processor status bits
    STA $3FC33F          ; 8F 3F C3 3F | Store accumulator to absolute long address
    ROL $DDCE,X          ; 3E CE DD | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0CC
; Address: $EEBEEF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0CC:
    AND $00FF,X          ; 3D FF 00 | Logical AND with accumulator (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    ORA #$F2             ; 09 F2 | Logical OR with accumulator (immediate)
    ORA #$E6             ; 09 E6 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0CD
; Address: $EEBF0A
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0CD:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    STA                  ; 9F 3B 04 08 | Store accumulator to absolute long,X
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EE              ; 10 EE | Branch if positive
    BMI $C8              ; 30 C8 | Branch if negative
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    SBC $FFEE,Y          ; F9 EE FF | Subtract with carry (absolute,Y)
    SBC #$9B             ; E9 9B | Subtract with carry (immediate)
    CPY $F3FF            ; CC FF F3 | Compare Y register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $3FFF,X          ; 1D FF 3F | Logical OR with accumulator (absolute,X)
    STA $FF20FF          ; 8F FF 20 FF | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    ASL $FFFF            ; 0E FF FF | Arithmetic shift left (absolute)
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ROR $7A67,X          ; 7E 67 7A | Rotate right (absolute,X)
    BVS $3F              ; 70 3F | Branch if overflow set
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    ROL $6EF1            ; 2E F1 6E | Rotate left (absolute)
    SBC ($C6),Y          ; F1 C6 | Subtract with carry ((zero page),Y)
    SBC #$C8             ; E9 C8 | Subtract with carry (immediate)
    STY $9FEB            ; 8C EB 9F | Store Y register to absolute address
    CPY $CC5F            ; CC 5F CC | Compare Y register (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0CE
; Address: $EEBFBE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0CE:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BPL $E8              ; 10 E8 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0CF
; Address: $EEBFC6
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0CF:
    CPY #$0E             ; C0 0E | Compare Y register (immediate)
    BRA $6E              ; 80 6E | Branch always
    ROR $F004,X          ; 7E 04 F0 | Rotate right (absolute,X)
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    ADC $F19D            ; 6D 9D F1 | Add with carry (absolute)
    AND ($F1),Y          ; 31 F1 | Logical AND with accumulator ((zero page),Y)
    ORA ($81),Y          ; 11 81 | Logical OR with accumulator ((zero page),Y)
    STA ($04,X)          ; 81 04 | Store accumulator to (zero page,X)
    SBC $031F,X          ; FD 1F 03 | Subtract with carry (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D0
; Address: $EEBFE8
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D0:
    JSR $0003            ; 20 03 00 | Jump to subroutine
    STA ($10,X)          ; 81 10 | Store accumulator to (zero page,X)
    BPL $00              ; 10 00 | Branch if positive
    BEQ $FF              ; F0 FF | Branch if equal
    SBC $FCFE,X          ; FD FE FC | Subtract with carry (absolute,X)
    INC $FF7B,X          ; FE 7B FF | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    STY $FB              ; 84 FB | Store Y register to zero page
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEC $39              ; C6 39 | Decrement (zero page)
    STA $40BF70          ; 8F 70 BF 40 | Store accumulator to absolute long address
    STY $00              ; 84 00 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    INC $EE3E,X          ; FE 3E EE | Increment (absolute,X)
    ROR $EEEE            ; 6E EE EE | Rotate right (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    LDY $F2C3,X          ; BC C3 F2 | Load from absolute,X into Y register
    STA $B9C6            ; 8D C6 B9 | Store accumulator to absolute address
    BNE $FF              ; D0 FF | Branch if not equal
    REP #$00             ; C2 00 | Reset processor status bits
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    STA                  ; 9F 61 3F DF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D1
; Address: $EEC067
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D1:
    LDA                  ; BF FF 7F EF | Load from absolute long,X into accumulator
    SBC #$8F             ; E9 8F | Subtract with carry (immediate)
    BVS $8F              ; 70 8F | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    INC $FF86,X          ; FE 86 FF | Increment (absolute,X)
    SBC $0019,Y          ; F9 19 00 | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FEFD,X          ; FE FD FE | Increment (absolute,X)
    SBC $2EEF,X          ; FD EF 2E | Subtract with carry (absolute,X)
    ROL $2EEF            ; 2E EF 2E | Rotate left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    CPX $EC13            ; EC 13 EC | Compare X register (absolute)
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    BNE $EF              ; D0 EF | Branch if not equal
    BNE $E3              ; D0 E3 | Branch if not equal
    INC $FE11            ; EE 11 FE | Increment (absolute)
    ORA ($6E,X)          ; 01 6E | Logical OR with accumulator ((zero page,X))
    STA ($0E),Y          ; 91 0E | Store accumulator to (zero page),Y
    LSR $1FB3            ; 4E B3 1F | Logical shift right (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D2
; Address: $EEC11E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D2:
    BRA $00              ; 80 00 | Branch always
    ASL $0DE1,X          ; 1E E1 0D | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    STA ($BF,X)          ; 81 BF | Store accumulator to (zero page,X)
    ADC ($1E),Y          ; 71 1E | Add with carry ((zero page),Y)
    ORA $0300            ; 0D 00 03 | Logical OR with accumulator (absolute)
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D3
; Address: $EEC142
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D3:
    BMI $CF              ; 30 CF | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    CMP $30ED,X          ; DD ED 30 | Compare accumulator (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    REP #$00             ; C2 00 | Reset processor status bits
    BEQ $F1              ; F0 F1 | Branch if equal
    BEQ $F1              ; F0 F1 | Branch if equal
    AND $3D1E,X          ; 3D 1E 3D | Logical AND with accumulator (absolute,X)
    ROL $383F,X          ; 3E 3F 38 | Rotate left (absolute,X)
    LDY $EE71            ; AC 71 EE | Load from absolute address into Y register
    CMP $DEC2,X          ; DD C2 DE | Compare accumulator (absolute,X)
    CMP ($C0),Y          ; D1 C0 | Compare accumulator ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D4
; Address: $EEC19C
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D4:
    JSR $2200            ; 20 00 22 | Jump to subroutine
    CPX #$06             ; E0 06 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $9800            ; 0E 00 98 | Arithmetic shift left (absolute)
    ASL $91              ; 06 91 | Arithmetic shift left (zero page)
    ASL $0E37            ; 0E 37 0E | Arithmetic shift left (absolute)
    PHY                  ; 5A | Push Y register to stack
    STA                  ; 9F 7F FE F7 | Store accumulator to absolute long,X
    INC $DEFF            ; EE FF DE | Increment (absolute)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $20              ; 80 20 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BIT $60              ; 24 60 | Test bits in accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $B9              ; 24 B9 | Test bits in accumulator (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ROL $7F8E,X          ; 3E 8E 7F | Rotate left (absolute,X)
    BIT $B7F7            ; 2C F7 B7 | Test bits in accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    PLX                  ; FA | Pull X register from stack
    INX                  ; E8 | Increment X register
    SBC #$FE             ; E9 FE | Subtract with carry (immediate)
    ASL $0EFE            ; 0E FE 0E | Arithmetic shift left (absolute)
    INC $FF1E,X          ; FE 1E FF | Increment (absolute,X)
    INC $FF1E,X          ; FE 1E FF | Increment (absolute,X)
    AND $7DFF,X          ; 3D FF 7D | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D5
; Address: $EEC1F2
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D5:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0F0E            ; 0E 0E 0F | Arithmetic shift left (absolute)
    ORA $787F            ; 0D 7F 78 | Logical OR with accumulator (absolute)
    BEQ $F1              ; F0 F1 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    ROR $F2F3            ; 6E F3 F2 | Rotate right (absolute)
    SBC ($FD,X)          ; E1 FD | Subtract with carry ((zero page,X))
    ASL $80FE            ; 0E FE 80 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    INC $F20F,X          ; FE 0F F2 | Increment (absolute,X)
    STA                  ; 9F 60 DF 28 | Store accumulator to absolute long,X
    SBC $F91A,X          ; FD 1A F9 | Subtract with carry (absolute,X)
    PEA #$F8FE           ; F4 FE F8 | Push effective address to stack
    ASL $001C,X          ; 1E 1C 00 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    DEC $FF62,X          ; DE 62 FF | Decrement (absolute,X)
    ADC ($9F,X)          ; 61 9F | Add with carry ((zero page,X))
    STA $8F8F,X          ; 9D 8F 8F | Store accumulator to absolute,X
    ADC ($07),Y          ; 71 07 | Add with carry ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D6
; Address: $EEC27A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D6:
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($E2,X)          ; 01 E2 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BRA $83              ; 80 83 | Branch always
    CPY #$CD             ; C0 CD | Compare Y register (immediate)
    CMP ($DF,X)          ; C1 DF | Compare accumulator ((zero page,X))
    STZ $019F            ; 9C 9F 01 | Store zero to absolute
    LDA                  ; BF 0F FF 03 | Load from absolute long,X into accumulator
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$EF             ; C0 EF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D7
; Address: $EEC2CB
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D7:
    BNE $E0              ; D0 E0 | Game work RAM access
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    JMP $E0FFE0          ; 5C E0 FF E0 | Game work RAM access
    SBC $FD62,X          ; FD 62 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D8
; Address: $EEC309
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D8:
    JSL $CFB2FD          ; 22 FD B2 CF | Jump to subroutine long
    CPY $8C8F            ; CC 8F 8C | Compare Y register (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    CPY $C733            ; CC 33 C7 | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F 60 DF 20 | Store accumulator to absolute long,X
    LDA                  ; BF 40 F9 27 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    BRA $81              ; 80 81 | Branch always
    ROL $F3FC,X          ; 3E FC F3 | Rotate left (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $1DD2,X          ; 1D D2 1D | Logical OR with accumulator (absolute,X)
    PHX                  ; DA | Push X register to stack
    ORA $FF9A,X          ; 1D 9A FF | Logical OR with accumulator (absolute,X)
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR $CC3E            ; 4D 3E CC | Exclusive OR with accumulator (absolute)
    STZ $DC7F,X          ; 9E 7F DC | Store zero to absolute,X
    LDA                  ; BF 5F 6F 1F | Load from absolute long,X into accumulator
    ADC ($84),Y          ; 71 84 | Add with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($DB,X)          ; 01 DB | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0D9
; Address: $EEC3D0
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0D9:
    SBC ($FB),Y          ; F1 FB | Subtract with carry ((zero page),Y)
    PEA #$DCFE           ; F4 FE DC | Push effective address to stack
    PEA #$F8FC           ; F4 FC F8 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $BCBC,X          ; FD BC BC | Subtract with carry (absolute,X)
    BNE $D0              ; D0 D0 | Branch if not equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEX                  ; CA | Decrement X register
    CPY $DC00            ; CC 00 DC | Compare Y register (absolute)
    ASL $1C9F,X          ; 1E 9F 1C | Arithmetic shift left (absolute,X)
    CMP $FFE0,X          ; DD E0 FF | Compare accumulator (absolute,X)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC ($80,X)          ; E1 80 | Subtract with carry ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $A0              ; 80 A0 | Branch always
    CMP ($D1,X)          ; C1 D1 | Compare accumulator ((zero page,X))
    ADC ($7D,X)          ; 61 7D | Add with carry ((zero page,X))
    AND ($2D,X)          ; 21 2D | Logical AND with accumulator ((zero page,X))
    CMP ($1C),Y          ; D1 1C | Compare accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    ROL $9E00,X          ; 3E 00 9E | Rotate left (absolute,X)
    DEC $0C00,X          ; DE 00 0C | Decrement (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($DE,X)          ; E1 DE | Subtract with carry ((zero page,X))
    LDY $3CC3,X          ; BC C3 3C | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    CMP $3FC0            ; CD C0 3F | Compare accumulator (absolute)
    ADC $F10E,X          ; 7D 0E F1 | Add with carry (absolute,X)
    ASL $F100            ; 0E 00 F1 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    DEC $C431            ; CE 31 C4 | Decrement (absolute)
    CPX $EC13            ; EC 13 EC | Compare X register (absolute)
    CPY $E31F            ; CC 1F E3 | Compare Y register (absolute)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    LSR $CE4F            ; 4E 4F CE | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0DA
; Address: $EEC4C7
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0DA:
    LSR $ECEF            ; 4E EF EC | Logical shift right (absolute)
    SBC $EDEE            ; ED EE ED | Subtract with carry (absolute)
    NOP                  ; EA | No operation
    SBC #$F0             ; E9 F0 | Subtract with carry (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    LDA                  ; BF 00 FF E3 | Load from absolute long,X into accumulator
    INC $19E6,X          ; FE E6 19 | Increment (absolute,X)
    ORA $9999,Y          ; 19 99 99 | Logical OR with accumulator (absolute,Y)
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $00              ; E6 00 | Increment (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROL $0C00            ; 2E 00 0C | Rotate left (absolute)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    DEC $39              ; C6 39 | Decrement (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ROL $FEC1,X          ; 3E C1 FE | Rotate left (absolute,X)
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX $C2              ; E4 C2 | Compare X register (zero page)
    AND $1CE3,X          ; 3D E3 1C | Logical AND with accumulator (absolute,X)
    INC $18              ; E6 18 | Increment (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    SEP #$00             ; E2 00 | Set processor status bits
    BPL $7F              ; 10 7F | Branch if positive
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    BVC $FF              ; 50 FF | Branch if overflow clear
    STZ $BF              ; 64 BF | Store zero to zero page
    LDA                  ; BF FF CF FF | Load from absolute long,X into accumulator
    LDY $C3              ; A4 C3 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0DC
; Address: $EEC57C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0DC:
    JSL $485209          ; 22 09 52 48 | Jump to subroutine long
    STX $50ED            ; 8E ED 50 | Store X register to absolute address
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 34 FD 2C | Load from absolute long,X into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $72              ; E4 72 | Compare X register (zero page)
    CPY $90              ; C4 90 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $40              ; 10 40 | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0DD
; Address: $EEC59E
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0DD:
    JSR $0040            ; 20 40 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ASL $3E02,X          ; 1E 02 3E | Arithmetic shift left (absolute,X)
    ROL $3E              ; 26 3E | Rotate left (zero page)
    ROL $2E3E            ; 2E 3E 2E | Rotate left (absolute)
    PEA #$F008           ; F4 08 F0 | Push effective address to stack
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    CMP ($18,X)          ; C1 18 | Compare accumulator ((zero page,X))
    CMP ($10,X)          ; C1 10 | Compare accumulator ((zero page,X))
    CMP ($10,X)          ; C1 10 | Compare accumulator ((zero page,X))
    BRA $BF              ; 80 BF | Branch always
    CPY #$D0             ; C0 D0 | Compare Y register (immediate)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    LDA                  ; BF FB FB FF | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BEQ $33              ; F0 33 | Branch if equal
    STY $717F            ; 8C 7F 71 | Store Y register to absolute address
    STA $B9E5,X          ; 9D E5 B9 | Store accumulator to absolute,X
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    DEC $CE31            ; CE 31 CE | Decrement (absolute)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    AND ($13),Y          ; 31 13 | Logical AND with accumulator ((zero page),Y)
    CPX $EC13            ; EC 13 EC | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0DE
; Address: $EEC62F
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0DE:
    CPX $00E0            ; EC E0 00 | Compare X register (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEC $CE00            ; CE 00 CE | Decrement (absolute)
    DEC $1000            ; CE 00 10 | Decrement (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BEQ $1E              ; F0 1E | Branch if equal
    SBC ($C5,X)          ; E1 C5 | Subtract with carry ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    SBC ($5E,X)          ; E1 5E | Subtract with carry ((zero page,X))
    JMP $FFC1FF          ; 5C FF C1 FF | Jump to address long
    LDA                  ; BF B3 0F 00 | Load from absolute long,X into accumulator
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $3CC2,X          ; 3E C2 3C | Rotate left (absolute,X)
    CPY $E0E0            ; CC E0 E0 | Game work RAM access
    CPX #$EE             ; E0 EE | Compare X register (immediate)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CMP ($DD,X)          ; C1 DD | Compare accumulator ((zero page,X))
    STA ($9D,X)          ; 81 9D | Store accumulator to (zero page,X)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    INC $EF00,X          ; FE 00 EF | Increment (absolute,X)
    SBC #$FF             ; E9 FF | Subtract with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BPL $C3              ; 10 C3 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    STA ($03,X)          ; 81 03 | Store accumulator to (zero page,X)
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BIT $3CDC            ; 2C DC 3C | Test bits in accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0DF
; Address: $EEC705
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0DF:
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $16              ; F0 16 | Branch if equal
    BEQ $17              ; F0 17 | Branch if equal
    BEQ $76              ; F0 76 | Branch if equal
    CPX #$E4             ; E0 E4 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF EC FF C4 | Load from absolute long,X into accumulator
    INC $FFC4,X          ; FE C4 FF | Increment (absolute,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    DEC $DE              ; C6 DE | Decrement (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E0
; Address: $EEC73E
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E0:
    JSR $F021            ; 20 21 F0 | Jump to subroutine
    BVS $F6              ; 70 F6 | Branch if overflow set
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    BEQ $E7              ; F0 E7 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $0303,X          ; FE 03 03 | Increment (absolute,X)
    BIT #$09             ; 89 09 | Test bits in accumulator (immediate)
    ORA $1809,Y          ; 19 09 18 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INC $3F12            ; EE 12 3F | Increment (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    INC $0711            ; EE 11 07 | Increment (absolute)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ASL $3E00            ; 0E 00 3E | Arithmetic shift left (absolute)
    ROL $3C3C,X          ; 3E 3C 3C | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $BC              ; F0 BC | Branch if equal
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    INC $C1FF,X          ; FE FF C1 | Increment (absolute,X)
    LDA                  ; BF FF 0C 00 | Load from absolute long,X into accumulator
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E1
; Address: $EEC7CC
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E1:
    STA $FFF3FF          ; 8F FF F3 FF | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    BRA $FE              ; 80 FE | Branch always
    BEQ $FF              ; F0 FF | Branch if equal
    INC $1A              ; E6 1A | Increment (zero page)
    STX $2E72            ; 8E 72 2E | Store X register to absolute address
    ROL $3EC2,X          ; 3E C2 3E | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ORA $3F00            ; 0D 00 3F | Logical OR with accumulator (absolute)
    ASL $3E3F,X          ; 1E 3F 3E | Arithmetic shift left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ROL $3C00,X          ; 3E 00 3C | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ROL $3E3E,X          ; 3E 3E 3E | Rotate left (absolute,X)
    ROL $3E3E,X          ; 3E 3E 3E | Rotate left (absolute,X)
    JMP $07C8F8          ; 5C F8 C8 07 | Jump to address long
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX $EEF1            ; EC F1 EE | Compare X register (absolute)
    BEQ $EF              ; F0 EF | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BCC $7F              ; 90 7F | Branch if carry clear
    ADC ($3F,X)          ; 61 3F | Add with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $8667            ; 2E 67 86 | Rotate left (absolute)
    ASL $D3              ; 06 D3 | Arithmetic shift left (zero page)
    CMP ($8D),Y          ; D1 8D | Compare accumulator ((zero page),Y)
    CMP ($89),Y          ; D1 89 | Compare accumulator ((zero page),Y)
    STA ($F1,X)          ; 81 F1 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E2
; Address: $EEC88E
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E2:
    CMP ($F1,X)          ; C1 F1 | Compare accumulator ((zero page,X))
    BPL $08              ; 10 08 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    ASL $0E70            ; 0E 70 0E | Arithmetic shift left (absolute)
    BMI $8F              ; 30 8F | Branch if negative
    BIT #$BF             ; 89 BF | Test bits in accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F1              ; F0 F1 | Branch if equal
    INC $CEF1            ; EE F1 CE | Increment (absolute)
    CPY $E6FE            ; CC FE E6 | Compare Y register (absolute)
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $1F              ; 30 1F | Branch if negative
    ADC $FDFF,X          ; 7D FF FD | Add with carry (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    AND $C325,X          ; 3D 25 C3 | Logical AND with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    ROR $1C00,X          ; 7E 00 1C | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    INC $F011            ; EE 11 F0 | Increment (absolute)
    PEA #$3DEB           ; F4 EB 3D | Push effective address to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E3
; Address: $EEC927
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E3:
    JSL $F007F8          ; 22 F8 07 F0 | Jump to subroutine long
    ORA #$E7             ; 09 E7 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E4
; Address: $EEC943
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E4:
    BCC $1F              ; 90 1F | Branch if carry clear
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    BPL $FE              ; 10 FE | Branch if positive
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    REP #$33             ; C2 33 | Reset processor status bits
    CPY $FB07            ; CC 07 FB | Compare Y register (absolute)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E5
; Address: $EEC954
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E5:
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $31              ; F0 31 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STY $0C8D            ; 8C 8D 0C | Store Y register to absolute address
    ORA $1300            ; 0D 00 13 | Logical OR with accumulator (absolute)
    JMP $08CD0C          ; 5C 0C CD 08 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    DEX                  ; CA | Decrement X register
    DEC $00              ; C6 00 | Decrement (zero page)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    STA ($03,X)          ; 81 03 | Store accumulator to (zero page,X)
    ORA ($81,X)          ; 01 81 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $FF              ; 10 FF | Branch if positive
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    STZ $6C7C            ; 9C 7C 6C | Store zero to absolute
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $1C1F,X          ; 1E 1F 1C | Arithmetic shift left (absolute,X)
    ASL $D2DF,X          ; 1E DF D2 | Arithmetic shift left (absolute,X)
    SBC ($F6),Y          ; F1 F6 | Subtract with carry ((zero page),Y)
    DEX                  ; CA | Decrement X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E6
; Address: $EEC9F8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E6:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($61,X)          ; C1 61 | Compare accumulator ((zero page,X))
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E7
; Address: $EECA11
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E7:
    BMI $3C              ; 30 3C | Branch if negative
    ROL $FE00,X          ; 3E 00 FE | Rotate left (absolute,X)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC #$F0             ; E9 F0 | Subtract with carry (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    BCS $00              ; B0 00 | Branch if carry set
    BMI $00              ; 30 00 | Branch if negative
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $3900,X          ; FE 00 39 | Increment (absolute,X)
    AND #$39             ; 29 39 | Logical AND with accumulator (immediate)
    AND $3131,Y          ; 39 31 31 | Logical AND with accumulator (absolute,Y)
    AND ($21,X)          ; 21 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E8
; Address: $EECA68
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E8:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $DE00            ; CE 00 DE | Decrement (absolute)
    ROL $77F7,X          ; 3E F7 77 | Rotate left (absolute,X)
    CMP ($07,X)          ; C1 07 | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0E9
; Address: $EECA94
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0E9:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    BCC $00              ; 90 00 | Branch if carry clear
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    INC $E0FA,X          ; FE FA E0 | Game work RAM access
    CPX #$C1             ; E0 C1 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    ROL $1E0C,X          ; 3E 0C 1E | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $F502,X          ; FD 02 F5 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0EA
; Address: $EECADC
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0EA:
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)
    SBC $E0E3,X          ; FD E3 E0 | Game work RAM access
    STA ($E1,X)          ; 81 E1 | Store accumulator to (zero page,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    BPL $E1              ; 10 E1 | Branch if positive
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    ADC ($F8,X)          ; 61 F8 | Add with carry ((zero page,X))
    SEC                  ; 38 | Set carry flag
    ASL $0E0E,X          ; 1E 0E 0E | Arithmetic shift left (absolute,X)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0EB
; Address: $EECB4A
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0EB:
    JSR $3023            ; 20 23 30 | Jump to subroutine
    BMI $31              ; 30 31 | Branch if negative
    DEC $CF01,X          ; DE 01 CF | Decrement (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    STX $46              ; 86 46 | Store X register to zero page
    SBC $7D00,X          ; FD 00 7D | Subtract with carry (absolute,X)
    BRA $39              ; 80 39 | Branch always
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    BRA $1F              ; 80 1F | Branch always
    ASL $0F0F            ; 0E 0F 0F | Arithmetic shift left (absolute)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    INC $FEC2,X          ; FE C2 FE | Increment (absolute,X)
    DEC $3E              ; C6 3E | Decrement (zero page)
    DEC $FF36            ; CE 36 FF | Decrement (absolute)
    LDA                  ; BF FF FE FF | Load from absolute long,X into accumulator
    DEC                  ; 3A | Decrement accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0EC
; Address: $EECBB4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0EC:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $0F0F0F          ; 8F 0F 0F 0F | Store accumulator to absolute long address
    STA                  ; 9F 9C DF 5C | Store accumulator to absolute long,X
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0ED
; Address: $EECBDE
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0ED:
    JSR $0E00            ; 20 00 0E | Jump to subroutine
    DEC $C60E            ; CE 0E C6 | Decrement (absolute)
    ASL $04CE            ; 0E CE 04 | Arithmetic shift left (absolute)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    CPY $04              ; C4 04 | Compare Y register (zero page)
    CPY $01              ; C4 01 | Compare Y register (zero page)
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ROR $3E1F,X          ; 7E 1F 3E | Rotate right (absolute,X)
    ROL $D2FE,X          ; 3E FE D2 | Rotate left (absolute,X)
    INC $FCD2,X          ; FE D2 FC | Increment (absolute,X)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $90              ; F0 90 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    BEQ $11              ; F0 11 | Branch if equal
    ORA $0DFC            ; 0D FC 0D | Logical OR with accumulator (absolute)
    ORA $3030            ; 0D 30 30 | Logical OR with accumulator (absolute)
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BNE $40              ; D0 40 | Branch if not equal
    BNE $40              ; D0 40 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    LDY #$04             ; A0 04 | Load immediate value into Y register
    STY $0C              ; 84 0C | Store Y register to zero page
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPY #$DE             ; C0 DE | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ORA ($61,X)          ; 01 61 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0EE
; Address: $EECC8A
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0EE:
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    BMI $00              ; 30 00 | Branch if negative
    BMI $F8              ; 30 F8 | Branch if negative
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    CPY #$EC             ; C0 EC | Compare Y register (immediate)
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    JMP $8E01            ; 4C 01 8E | Jump to address
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF AB FF E1 | Load from absolute long,X into accumulator
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $90              ; 10 90 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    DEC $273F,X          ; DE 3F 27 | Decrement (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F0
; Address: $EECD03
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F0:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    STX $D6              ; 86 D6 | Store X register to zero page
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ADC #$10             ; 69 10 | Add with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    SBC $4785,Y          ; F9 85 47 | Subtract with carry (absolute,Y)
    AND $7E81,Y          ; 39 81 7E | Logical AND with accumulator (absolute,Y)
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F1
; Address: $EECD32
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F1:
    LDA                  ; BF 00 3F 00 | Load from absolute long,X into accumulator
    ROL $00              ; 26 00 | Rotate left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    AND ($21,X)          ; 21 21 | PPU graphics register access
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C2             ; C0 C2 | Compare Y register (immediate)
    CPY #$C6             ; C0 C6 | Compare Y register (immediate)
    STA ($0F,X)          ; 81 0F | Store accumulator to (zero page,X)
    ADC ($8D),Y          ; 71 8D | Add with carry ((zero page),Y)
    DEC $CF00,X          ; DE 00 CF | Decrement (absolute,X)
    ROR $0E00,X          ; 7E 00 0E | Rotate right (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    BCS $3F              ; B0 3F | Branch if carry set
    SEC                  ; 38 | Set carry flag
    ROL $A0E0            ; 2E E0 A0 | Rotate left (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    BMI $DC              ; 30 DC | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F2
; Address: $EECD85
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F2:
    JSR $D938            ; 20 38 D9 | Jump to subroutine
    BMI $D1              ; 30 D1 | Branch if negative
    BMI $D1              ; 30 D1 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    ORA ($C3,X)          ; 01 C3 | Logical OR with accumulator ((zero page,X))
    BMI $31              ; 30 31 | Branch if negative
    BMI $31              ; 30 31 | Branch if negative
    BMI $31              ; 30 31 | Branch if negative
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    ASL $02FC            ; 0E FC 02 | Arithmetic shift left (absolute)
    CPY $CC03            ; CC 03 CC | Compare Y register (absolute)
    CPY $F803            ; CC 03 F8 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    INC $30D2,X          ; FE D2 30 | Increment (absolute,X)
    AND ($30),Y          ; 31 30 | Logical AND with accumulator ((zero page),Y)
    AND ($30),Y          ; 31 30 | Logical AND with accumulator ((zero page),Y)
    AND ($1C),Y          ; 31 1C | Logical AND with accumulator ((zero page),Y)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    BRA $04              ; 80 04 | Branch always
    CMP $0C              ; C5 0C | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F3
; Address: $EECDE7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F3:
    CMP $1D1D            ; CD 1D 1D | Compare accumulator (absolute)
    ORA $1D1D,X          ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
    ORA $3434,X          ; 1D 34 34 | Logical OR with accumulator (absolute,X)
    SEP #$00             ; E2 00 | Set processor status bits
    SEP #$00             ; E2 00 | Set processor status bits
    SEP #$00             ; E2 00 | Set processor status bits
    ORA ($31,X)          ; 01 31 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F4
; Address: $EECE07
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F4:
    JSR $0202            ; 20 02 02 | Jump to subroutine
    CPX $00F3            ; EC F3 00 | Compare X register (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $F10C,Y          ; F9 0C F1 | Subtract with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $00FF            ; ED FF 00 | Subtract with carry (absolute)
    SBC $F802,X          ; FD 02 F8 | Subtract with carry (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    AND ($21,X)          ; 21 21 | PPU graphics register access
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    DEC $C700,X          ; DE 00 C7 | Decrement (absolute,X)
    CMP #$E4             ; C9 E4 | Compare accumulator (immediate)
    AND $3904,Y          ; 39 04 39 | Logical AND with accumulator (absolute,Y)
    AND ($4C),Y          ; 31 4C | Logical AND with accumulator ((zero page),Y)
    AND ($4E),Y          ; 31 4E | Logical AND with accumulator ((zero page),Y)
    ORA ($6E),Y          ; 11 6E | Logical OR with accumulator ((zero page),Y)
    JMP ($7C03)          ; 6C 03 7C | Jump to address (absolute indirect)
    REP #$3C             ; C2 3C | Reset processor status bits
    REP #$3C             ; C2 3C | Reset processor status bits

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F5
; Address: $EECE9C
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F5:
    BRA $7C              ; 80 7C | Branch always
    BRA $78              ; 80 78 | Branch always
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    STY $B04F            ; 8C 4F B0 | Store Y register to absolute address
    PEA #$EC1F           ; F4 1F EC | Push effective address to stack
    INC $DE3F            ; EE 3F DE | Increment (absolute)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    ORA $CEE1,X          ; 1D E1 CE | Logical OR with accumulator (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    ORA $0FFF            ; 0D FF 0F | Logical OR with accumulator (absolute)
    STA $FE8BF7          ; 8F F7 8B FE | Store accumulator to absolute long address
    REP #$02             ; C2 02 | Reset processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $A0              ; 80 A0 | Branch always
    LDY $F800,X          ; BC 00 F8 | Load from absolute,X into Y register
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    BRA $BF              ; 80 BF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F7
; Address: $EECF0C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F7:
    JSR $E023            ; 20 23 E0 | Game work RAM access
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    BPL $13              ; 10 13 | Branch if positive
    BPL $17              ; 10 17 | Branch if positive
    BPL $17              ; 10 17 | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    BMI $10              ; 30 10 | Branch if negative
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0F9
; Address: $EECF81
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0F9:
    CPX $EC02            ; EC 02 EC | Compare X register (absolute)
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    AND ($D6,X)          ; 21 D6 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0FA
; Address: $EECF8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0FA:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    STZ $1863            ; 9C 63 18 | Store zero to absolute
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPX #$13             ; E0 13 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0FB
; Address: $EECFA2
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0FB:
    CPX #$13             ; E0 13 | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $2F              ; F0 2F | Branch if equal
    BNE $3F              ; D0 3F | Branch if not equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    SBC $ED02            ; ED 02 ED | Subtract with carry (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $FD06,Y          ; F9 06 FD | Subtract with carry (absolute,Y)
    SBC $3F02,X          ; FD 02 3F | Subtract with carry (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    STA                  ; 9F 10 90 FF | Store accumulator to absolute long,X
    ORA $6F              ; 05 6F | Logical OR with accumulator (zero page)
    STA                  ; 9F 1F EC 1F | Store accumulator to absolute long,X
    CPX #$FD             ; E0 FD | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0FC
; Address: $EECFF0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0FC:
    JSR $6FC0            ; 20 C0 6F | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0FD
; Address: $EED004
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0FD:
    JSR $8027            ; 20 27 80 | Jump to subroutine
    CPY #$43             ; C0 43 | Compare Y register (immediate)
    CPX #$21             ; E0 21 | PPU graphics register access
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 DF 00 | Load from absolute long,X into accumulator
    BMI $B0              ; 30 B0 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$1200           ; F4 00 12 | Push effective address to stack
    REP #$00             ; C2 00 | Reset processor status bits
    DEC $FF              ; C6 FF | Decrement (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $1BC2            ; 0D C2 1B | Logical OR with accumulator (absolute)
    CPY $13              ; C4 13 | Compare Y register (zero page)
    AND $1A              ; 25 1A | Logical AND with accumulator (zero page)
    ROL $C4              ; 26 C4 | Rotate left (zero page)
    SEC                  ; 38 | Set carry flag
    CPY #$30             ; C0 30 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0FE
; Address: $EED074
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0FE:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STA                  ; 9F 4F B1 4F | Store accumulator to absolute long,X
    BCS $BF              ; B0 BF | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    INC $007D,X          ; FE 7D 00 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $FFD8,X          ; FE D8 FF | Increment (absolute,X)
    ROL $3FFF,X          ; 3E FF 3F | Rotate left (absolute,X)
    LDA                  ; BF 7F BF 47 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    STY $0001            ; 8C 01 00 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    LDY #$2D             ; A0 2D | Load immediate value into Y register
    BEQ $F7              ; F0 F7 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    CPX #$E7             ; E0 E7 | Compare X register (immediate)
    ASL $FE00,X          ; 1E 00 FE | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1C02            ; 0E 02 1C | Arithmetic shift left (absolute)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1D21,X          ; 1E 21 1D | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_0FF
; Address: $EED112
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_0FF:
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    STA $02              ; 85 02 | Store accumulator to zero page
    ORA $8C03            ; 0D 03 8C | Logical OR with accumulator (absolute)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $7C7C,X          ; FE 7C 7C | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND $7978,Y          ; 39 78 79 | Logical AND with accumulator (absolute,Y)
    BEQ $F1              ; F0 F1 | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_100
; Address: $EED13E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_100:
    BVS $70              ; 70 70 | Branch if overflow set
    STA $048B04          ; 8F 04 8B 04 | Store accumulator to absolute long address
    PHB                  ; 8B | Push data bank register to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BMI $8F              ; 30 8F | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BVS $77              ; 70 77 | Branch if overflow set
    BVS $73              ; 70 73 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_102
; Address: $EED15A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_102:
    BRA $04              ; 80 04 | Branch always
    RTI                  ; 40 | Return from interrupt
    STX $40              ; 86 40 | Store X register to zero page
    STX $8000            ; 8E 00 80 | Store X register to absolute address
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $F708,X          ; FE 08 F7 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_103
; Address: $EED16D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_103:
    STA                  ; 9F F8 07 7F | Store accumulator to absolute long,X
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 00 07 00 | Store accumulator to absolute long,X
    AND $1900,Y          ; 39 00 19 | Logical AND with accumulator (absolute,Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    ADC ($40,X)          ; 61 40 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_104
; Address: $EED18D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_104:
    JSR $1020            ; 20 20 10 | Jump to subroutine
    STA                  ; 9F 1F CF 0F | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_106
; Address: $EED1BA
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_106:
    STA                  ; 9F 9F 83 83 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    DEC $FFFF            ; CE FF FF | Decrement (absolute)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ASL $0EE5,X          ; 1E E5 0E | Arithmetic shift left (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPY $01FF            ; CC FF 01 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_107
; Address: $EED227
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_107:
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    STX $FFFF            ; 8E FF FF | Store X register to absolute address
    INC $DEFF,X          ; FE FF DE | Increment (absolute,X)
    STZ $FFFF,X          ; 9E FF FF | Store zero to absolute,X
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ROL $BFE7,X          ; 3E E7 BF | Rotate left (absolute,X)
    STA $FC8FFC          ; 8F FC 8F FC | Store accumulator to absolute long address
    CPY $00FF            ; CC FF 00 | Compare Y register (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $33              ; 64 33 | Store zero to zero page
    JMP $2104            ; 4C 04 21 | PPU graphics register access
    ADC ($13,X)          ; 61 13 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_108
; Address: $EED26D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_108:
    JSR $834C            ; 20 4C 83 | Jump to subroutine
    INC $78FE,X          ; FE FE 78 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STA $8198,Y          ; 99 98 81 | Store accumulator to absolute,Y
    BRA $DB              ; 80 DB | Branch always
    CPY #$9D             ; C0 9D | Compare Y register (immediate)
    CPY $2F              ; C4 2F | Compare Y register (zero page)
    BPL $6F              ; 10 6F | Branch if positive
    BRA $0D              ; 80 0D | Branch always
    BRA $CF              ; 80 CF | Branch always
    BIT #$42             ; 89 42 | Hardware register operation
    LDA $42              ; A5 42 | Hardware register operation
    LDY $40              ; A4 40 | Load from zero page into Y register
    ORA #$E0             ; 09 E0 | Game work RAM access
    BPL $E9              ; 10 E9 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_109
; Address: $EED297
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_109:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    SBC $0706,Y          ; F9 06 07 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $48              ; 85 48 | Store accumulator to zero page
    STA $48              ; 85 48 | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    REP #$38             ; C2 38 | Reset processor status bits
    BCS $0F              ; B0 0F | Branch if carry set
    BCS $63              ; B0 63 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_10B
; Address: $EED2B3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_10B:
    BMI $32              ; 30 32 | Branch if negative
    BMI $87              ; 30 87 | Branch if negative
    CMP ($0E),Y          ; D1 0E | Compare accumulator ((zero page),Y)
    CPY #$1E             ; C0 1E | Compare Y register (immediate)
    SBC ($18,X)          ; E1 18 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_10E
; Address: $EED2D0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_10E:
    JSR $210D            ; 20 0D 21 | PPU graphics register access
    CLC                  ; 18 | Clear carry flag
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    STX $9C21            ; 8E 21 9C | Store X register to absolute address
    CLV                  ; B8 | Clear overflow flag
    LDY #$10             ; A0 10 | Load immediate value into Y register
    BNE $0F              ; D0 0F | Branch if not equal
    BEQ $0F              ; F0 0F | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BMI $FE              ; 30 FE | Branch if negative
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_10F
; Address: $EED2F2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_10F:
    JSR $009F            ; 20 9F 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    ORA $F700,Y          ; 19 00 F7 | Logical OR with accumulator (absolute,Y)
    BPL $E8              ; 10 E8 | Branch if positive
    BMI $C9              ; 30 C9 | Branch if negative
    BMI $C9              ; 30 C9 | Branch if negative
    ORA ($EA),Y          ; 11 EA | Logical OR with accumulator ((zero page),Y)
    BNE $2B              ; D0 2B | Branch if not equal
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $FB04,X          ; FD 04 FB | Subtract with carry (absolute,X)
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    CPX $04              ; E4 04 | Compare X register (zero page)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    SBC $BB00,Y          ; F9 00 BB | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_110
; Address: $EED321
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_110:
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    AND ($06,X)          ; 21 06 | Logical AND with accumulator ((zero page,X))
    BPL $07              ; 10 07 | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    DEC $2B00,X          ; DE 00 2B | Decrement (absolute,X)
    CPY #$39             ; C0 39 | Compare Y register (immediate)
    BRA $61              ; 80 61 | Branch always
    SBC $ED08            ; ED 08 ED | Subtract with carry (absolute)
    DEC $2121            ; CE 21 21 | PPU graphics register access
    SBC $0601,X          ; FD 01 06 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_111
; Address: $EED358
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_111:
    ASL $1200,X          ; 1E 00 12 | Arithmetic shift left (absolute,X)
    INC                  ; 1A | Increment accumulator
    AND $0C00,X          ; 3D 00 0C | Logical AND with accumulator (absolute,X)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ROR $3408,X          ; 7E 08 34 | Rotate right (absolute,X)
    STZ $9C04            ; 9C 04 9C | Store zero to absolute
    ASL $04F7            ; 0E F7 04 | Arithmetic shift left (absolute)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    STY $04FF            ; 8C FF 04 | Store Y register to absolute address
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    LDY #$F3             ; A0 F3 | Load immediate value into Y register
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FE37,X          ; FE 37 FE | Increment (absolute,X)
    INC $FF              ; E6 FF | Increment (zero page)
    INC $DF              ; E6 DF | Increment (zero page)
    CMP #$F7             ; C9 F7 | Compare accumulator (immediate)
    EOR ($CE),Y          ; 51 CE | Exclusive OR with accumulator ((zero page),Y)
    LDX $26FF,Y          ; BE FF 26 | Load from absolute,Y into X register
    ROL $FF              ; 26 FF | Rotate left (zero page)
    AND $3FFF,Y          ; 39 FF 3F | Logical AND with accumulator (absolute,Y)
    LDA                  ; BF FF 23 40 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    BRA $01              ; 80 01 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_112
; Address: $EED3E6
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_112:
    JSL $033441          ; 22 41 34 03 | Jump to subroutine long
    BPL $27              ; 10 27 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $2F              ; 10 2F | Branch if positive
    STY $033C            ; 8C 3C 03 | Store Y register to absolute address
    LDA                  ; BF 80 9F 80 | Load from absolute long,X into accumulator
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    SBC #$02             ; E9 02 | Subtract with carry (immediate)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPY $96              ; C4 96 | Compare Y register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    STX $68              ; 86 68 | Store X register to zero page
    PLP                  ; 28 | Pull processor status from stack
    INC $18              ; E6 18 | Increment (zero page)
    JMP ($FC90)          ; 6C 90 FC | Jump to address (absolute indirect)
    BRA $CF              ; 80 CF | Branch always
    INC $FE01            ; EE 01 FE | Increment (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_113
; Address: $EED437
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_113:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BVS $0F              ; 70 0F | Branch if overflow set
    BVS $0F              ; 70 0F | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$2D             ; C0 2D | Compare Y register (immediate)
    BRA $6F              ; 80 6F | Branch always
    BRA $4F              ; 80 4F | Branch always
    CPX #$07             ; E0 07 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_114
; Address: $EED45C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_114:
    CPX #$17             ; E0 17 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_115
; Address: $EED464
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_115:
    BRA $7F              ; 80 7F | Branch always
    SBC $80              ; E5 80 | Subtract with carry (zero page)
    EOR $7200,Y          ; 59 00 72 | Exclusive OR with accumulator (absolute,Y)
    LDX #$00             ; A2 00 | Load immediate value into X register
    REP #$00             ; C2 00 | Reset processor status bits
    LDX #$00             ; A2 00 | Load immediate value into X register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    JMP $0106            ; 4C 06 01 | Jump to address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $F800,Y          ; F9 00 F8 | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7E00,X          ; 7E 00 7E | Rotate right (absolute,X)
    ROR $0C00,X          ; 7E 00 0C | Rotate right (absolute,X)
    INC $BE08            ; EE 08 BE | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 00 3F 80 | Load from absolute long,X into accumulator
    BRA $2F              ; 80 2F | Branch always
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BRA $4F              ; 80 4F | Branch always
    ORA $4900,X          ; 1D 00 49 | Logical OR with accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_116
; Address: $EED4D8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_116:
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    BVC $08              ; 50 08 | Branch if overflow clear
    INY                  ; C8 | Increment Y register
    BPL $F8              ; 10 F8 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    STX $9C80            ; 8E 80 9C | Store X register to absolute address
    LDA                  ; BF 3F 3F 37 | Load from absolute long,X into accumulator
    ADC $E371,X          ; 7D 71 E3 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_117
; Address: $EED504
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_117:
    JSR $302B            ; 20 2B 30 | Jump to subroutine
    BPL $11              ; 10 11 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA $4B08,Y          ; 19 08 4B | Logical OR with accumulator (absolute,Y)
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    LDA                  ; BF FF DF FF | Load from absolute long,X into accumulator
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    SBC ($38,X)          ; E1 38 | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F FF DF FF | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    STZ $7F              ; 64 7F | Store zero to zero page
    CLV                  ; B8 | Clear overflow flag
    ROR $FFB7,X          ; 7E B7 FF | Rotate right (absolute,X)
    LDA                  ; BF FF 9B FF | Load from absolute long,X into accumulator
    DEC $CFFF            ; CE FF CF | Decrement (absolute)
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_118
; Address: $EED562
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_118:
    JSR $D0CF            ; 20 CF D0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    STA                  ; 9F 20 FF 00 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    INC                  ; 1A | Increment accumulator
    STA ($8E,X)          ; 81 8E | Store accumulator to (zero page,X)
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    STA $FF60,X          ; 9D 60 FF | Store accumulator to absolute,X
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_119
; Address: $EED599
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_119:
    STZ $8F              ; 64 8F | Store zero to zero page
    BVS $8D              ; 70 8D | Branch if overflow set
    SBC $7802,X          ; FD 02 78 | Subtract with carry (absolute,X)
    BRA $78              ; 80 78 | Branch always
    BRA $30              ; 80 30 | Branch always
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    BRA $F3              ; 80 F3 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SBC $F106,Y          ; F9 06 F1 | Subtract with carry (absolute,Y)
    ASL $3EC1            ; 0E C1 3E | Arithmetic shift left (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $0446,Y          ; B9 46 04 | Load from absolute,Y into accumulator
    ASL $1E01            ; 0E 01 1E | Arithmetic shift left (absolute)
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    BCC $69              ; 90 69 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_11B
; Address: $EED5D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_11B:
    JSR $60D8            ; 20 D8 60 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$19             ; E0 19 | Compare X register (immediate)
    CPX #$19             ; E0 19 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_11C
; Address: $EED5E3
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_11C:
    STA                  ; 9F 60 9F C0 | Store accumulator to absolute long,X
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $9D00,X          ; 1D 00 9D | Logical OR with accumulator (absolute,X)
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    ASL $3AE1,X          ; 1E E1 3A | Arithmetic shift left (absolute,X)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    BRA $3F              ; 80 3F | Branch always
    BRA $BF              ; 80 BF | Branch always
    STA $DD0000          ; 8F 00 00 DD | Store accumulator to absolute long address
    CMP $B000,Y          ; D9 00 B0 | Compare accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    ROL $1468,X          ; 3E 68 14 | Rotate left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STY $30              ; 84 30 | Store Y register to zero page
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    DEC $00              ; C6 00 | Decrement (zero page)
    CPY $01              ; C4 01 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_11D
; Address: $EED626
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_11D:
    INY                  ; C8 | Increment Y register
    ORA ($E8,X)          ; 01 E8 | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    AND ($F0,X)          ; 21 F0 | Logical AND with accumulator ((zero page,X))
    ORA ($F0),Y          ; 11 F0 | Logical OR with accumulator ((zero page),Y)
    AND $3A00,Y          ; 39 00 3A | Logical AND with accumulator (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    AND ($C0,X)          ; 21 C0 | Logical AND with accumulator ((zero page,X))
    BCS $00              ; B0 00 | Branch if carry set
    INC                  ; 1A | Increment accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    BRA $98              ; 80 98 | Branch always
    BPL $E9              ; 10 E9 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR $78B8,Y          ; 59 B8 78 | Exclusive OR with accumulator (absolute,Y)
    CMP #$39             ; C9 39 | Compare accumulator (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY $E733            ; CC 33 E7 | Compare Y register (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_11E
; Address: $EED685
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_11E:
    JSR $E880            ; 20 80 E8 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    BVC $08              ; 50 08 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    LDX $FF              ; A6 FF | Load from zero page into X register
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $0FFF            ; 0E FF 0F | Arithmetic shift left (absolute)
    ORA $FBF3            ; 0D F3 FB | Logical OR with accumulator (absolute)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    STX $79              ; 86 79 | Store X register to zero page
    CMP $38              ; C5 38 | Compare accumulator (zero page)
    DEC $38              ; C6 38 | Decrement (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    ASL $1DE1,X          ; 1E E1 1D | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_11F
; Address: $EED6EF
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_11F:
    SEP #$FF             ; E2 FF | Set processor status bits
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND #$D0             ; 29 D0 | Logical AND with accumulator (immediate)
    PLY                  ; 7A | Pull Y register from stack
    BRA $ED              ; 80 ED | Branch always
    SBC $F800            ; ED 00 F8 | Subtract with carry (absolute)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $FC              ; 80 FC | Branch always
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    CPX $EC13            ; EC 13 EC | Compare X register (absolute)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_120
; Address: $EED730
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_120:
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $B862            ; 9C 62 B8 | Store zero to absolute
    AND $7900,Y          ; 39 00 79 | Logical AND with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$19             ; E0 19 | Compare X register (immediate)
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    DEC $31              ; C6 31 | Decrement (zero page)
    STX $79              ; 86 79 | Store X register to zero page
    BCC $4F              ; 90 4F | Branch if carry clear
    AND $41              ; 25 41 | Logical AND with accumulator (zero page)
    ROL $3E81,X          ; 3E 81 3E | Rotate left (absolute,X)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BRA $3E              ; 80 3E | Branch always
    RTI                  ; 40 | Return from interrupt
    LDY $FA00,X          ; BC 00 FA | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_121
; Address: $EED776
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_121:
    JSR $0096            ; 20 96 00 | Jump to subroutine
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    BPL $CF              ; 10 CF | Branch if positive
    BMI $CF              ; 30 CF | Branch if negative
    BMI $EE              ; 30 EE | Branch if negative
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_122
; Address: $EED793
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_122:
    STZ $00              ; 64 00 | Store zero to zero page
    BMI $00              ; 30 00 | Branch if negative
    BCS $00              ; B0 00 | Branch if carry set
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STX $00              ; 86 00 | Store X register to zero page
    INC $BE00,X          ; FE 00 BE | Increment (absolute,X)
    ADC $6300,Y          ; 79 00 63 | Add with carry (absolute,Y)
    BRA $62              ; 80 62 | Branch always
    BEQ $01              ; F0 01 | Branch if equal
    CPX #$07             ; E0 07 | Compare X register (immediate)
    LDA ($0E,X)          ; A1 0E | Load from (zero page,X) into accumulator
    ORA #$46             ; 09 46 | Logical OR with accumulator (immediate)
    ASL $1C05,X          ; 1E 05 1C | Arithmetic shift left (absolute,X)
    STA $0D00,X          ; 9D 00 0D | Store accumulator to absolute,X
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    BVC $00              ; 50 00 | Branch if overflow clear
    BCS $00              ; B0 00 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_123
; Address: $EED7E2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_123:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    STA ($5F),Y          ; 91 5F | Store accumulator to (zero page),Y
    PHB                  ; 8B | Push data bank register to stack
    PLB                  ; AB | Pull data bank register from stack
    ORA ($8B,X)          ; 01 8B | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_125
; Address: $EED7F9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_125:
    JSR $706B            ; 20 6B 70 | Jump to subroutine
    EOR $74              ; 45 74 | Exclusive OR with accumulator (zero page)
    BIT #$66             ; 89 66 | Test bits in accumulator (immediate)
    STA $DD22,Y          ; 99 22 DD | Store accumulator to absolute,Y
    WDM #$BF             ; 42 BF | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 60 9F 00 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $8C              ; 80 8C | Branch always
    BPL $9C              ; 10 9C | Branch if positive
    STZ $FE              ; 64 FE | Store zero to zero page
    BIT $0CFE            ; 2C FE 0C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_126
; Address: $EED82D
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_126:
    INC $FF8C,X          ; FE 8C FF | Increment (absolute,X)
    ADC $01              ; 65 01 | Add with carry (zero page)
    AND $0D01            ; 2D 01 0D | Logical AND with accumulator (absolute)
    ORA ($8C,X)          ; 01 8C | Logical OR with accumulator ((zero page,X))
    ASL $07F3            ; 0E F3 07 | Arithmetic shift left (absolute)
    SBC $F709,X          ; FD 09 F7 | Subtract with carry (absolute,X)
    ORA $1FE7,Y          ; 19 E7 1F | Logical OR with accumulator (absolute,Y)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    ADC #$FD             ; 69 FD | Add with carry (immediate)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    STY $0CC3            ; 8C C3 0C | Store Y register to absolute address
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $EF              ; 10 EF | Branch if positive
    BPL $CF              ; 10 CF | Branch if positive
    BMI $9F              ; 30 9F | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_127
; Address: $EED87D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_127:
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CMP ($FD,X)          ; C1 FD | Compare accumulator ((zero page,X))
    SBC $F700,X          ; FD 00 F7 | Subtract with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    BRA $90              ; 80 90 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_128
; Address: $EED88B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_128:
    CPX #$4E             ; E0 4E | Compare X register (immediate)
    BRA $5E              ; 80 5E | Branch always
    BRA $FF              ; 80 FF | Branch always
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $F6              ; 05 F6 | Logical OR with accumulator (zero page)
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    ASL $1EE1            ; 0E E1 1E | Arithmetic shift left (absolute)
    DEC $F900,X          ; DE 00 F9 | Decrement (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA ($B8,X)          ; 01 B8 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $0C              ; F0 0C | Branch if equal
    BCS $4C              ; B0 4C | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    ASL $E8              ; 06 E8 | Arithmetic shift left (zero page)
    SBC #$90             ; E9 90 | Subtract with carry (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_129
; Address: $EED8CC
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_129:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    ADC $19E6,Y          ; 79 E6 19 | Add with carry (absolute,Y)
    ROR $2E91            ; 6E 91 2E | Rotate right (absolute)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ADC $1900,Y          ; 79 00 19 | Add with carry (absolute,Y)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CMP ($0E),Y          ; D1 0E | Compare accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    BNE $00              ; D0 00 | Branch if not equal
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $0D12            ; 0D 12 0D | Logical OR with accumulator (absolute)
    STA $0E9E04          ; 8F 04 9E 0E | Store accumulator to absolute long address
    DEC $FE1E,X          ; DE 1E FE | Decrement (absolute,X)
    ASL $1FFE,X          ; 1E FE 1F | Arithmetic shift left (absolute,X)
    LDA                  ; BF 60 00 E0 | Load from absolute long,X into accumulator
    ADC $00              ; 65 00 | Add with carry (zero page)
    ADC $01              ; 65 01 | Add with carry (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    ORA ($44),Y          ; 11 44 | Logical OR with accumulator ((zero page),Y)
    ADC ($05),Y          ; 71 05 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_12A
; Address: $EED967
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_12A:
    JSR $4009            ; 20 09 40 | Jump to subroutine
    BPL $81              ; 10 81 | Branch if positive
    BRA $0E              ; 80 0E | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_12B
; Address: $EED96F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_12B:
    JSR $6445            ; 20 45 64 | Jump to subroutine
    CPY $CEEE            ; CC EE CE | Compare Y register (absolute)
    STX $DFDE            ; 8E DE DF | Store X register to absolute address
    TSX                  ; BA | Transfer stack pointer to X register
    LDA                  ; BF 72 7E 67 | Load from absolute long,X into accumulator
    STA $328F73          ; 8F 73 8F 32 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_12C
; Address: $EED98A
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_12C:
    LDA ($4E),Y          ; B1 4E | Load from (zero page),Y into accumulator
    STA $9E66,Y          ; 99 66 9E | Store accumulator to absolute,Y
    ADC ($03,X)          ; 61 03 | Add with carry ((zero page,X))
    LDX $FF              ; A6 FF | Load from zero page into X register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CMP ($8F,X)          ; C1 8F | Compare accumulator ((zero page,X))
    STA ($4F),Y          ; 91 4F | Store accumulator to (zero page),Y
    STA ($07),Y          ; 91 07 | Store accumulator to (zero page),Y
    ORA $8B              ; 05 8B | Logical OR with accumulator (zero page)
    ORA ($8B,X)          ; 01 8B | Logical OR with accumulator ((zero page,X))
    LDX $00              ; A6 00 | Load from zero page into X register
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_12D
; Address: $EED9B4
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_12D:
    JSR $3120            ; 20 20 31 | Jump to subroutine
    BMI $21              ; 30 21 | PPU graphics register access
    BMI $41              ; 30 41 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    EOR ($74,X)          ; 41 74 | Exclusive OR with accumulator ((zero page,X))
    EOR $74              ; 45 74 | Exclusive OR with accumulator (zero page)
    BVS $0F              ; 70 0F | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    CMP $D987,Y          ; D9 87 D9 | Compare accumulator (absolute,Y)
    REP #$CF             ; C2 CF | Reset processor status bits
    DEC $FF              ; C6 FF | Decrement (zero page)
    LDA                  ; BF 3F FF 3F | Load from absolute long,X into accumulator
    JMP $41B021          ; 5C 21 B0 41 | Jump to address long
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $F182,X          ; 7D 82 F1 | Add with carry (absolute,X)
    ASL $0EF1            ; 0E F1 0E | Arithmetic shift left (absolute)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    INC $7986,X          ; FE 86 79 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BRA $FF              ; 80 FF | Branch always
    LDA                  ; BF 00 FB 04 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $C0              ; 30 C0 | Branch if negative
    AND $21C0,Y          ; 39 C0 21 | PPU graphics register access
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    BRA $67              ; 80 67 | Branch always
    BRA $6F              ; 80 6F | Branch always
    STZ $1C00,X          ; 9E 00 1C | Store zero to absolute,X
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    INC $7C01,X          ; FE 01 7C | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_12F
; Address: $EEDA37
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_12F:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    EOR $C900            ; 4D 00 C9 | Exclusive OR with accumulator (absolute)
    BRA $7F              ; 80 7F | Branch always
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SBC $8778,Y          ; F9 78 87 | Subtract with carry (absolute,Y)
    BVS $8F              ; 70 8F | Branch if overflow set
    BMI $CF              ; 30 CF | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$BC00           ; F4 00 BC | Push effective address to stack
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ORA ($CC,X)          ; 01 CC | Logical OR with accumulator ((zero page,X))
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    STA $00B800          ; 8F 00 B8 00 | Store accumulator to absolute long address
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ASL $D8              ; 06 D8 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BCS $00              ; B0 00 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LSR $843F            ; 4E 3F 84 | Logical shift right (absolute)
    ROR $1804,X          ; 7E 04 18 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BMI $EF              ; 30 EF | Branch if negative
    BNE $EC              ; D0 EC | Branch if not equal
    BEQ $CF              ; F0 CF | Branch if equal
    STX $0500            ; 8E 00 05 | Store X register to absolute address
    ORA ($E3,X)          ; 01 E3 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $70              ; 06 70 | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    CLD                  ; D8 | Clear decimal mode flag
    ORA $1890            ; 0D 90 18 | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_130
; Address: $EEDAEE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_130:
    AND ($40),Y          ; 31 40 | Logical AND with accumulator ((zero page),Y)
    SBC $B9FF,X          ; FD FF B9 | Subtract with carry (absolute,X)
    LDA                  ; BF F2 FE DE | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_131
; Address: $EEDB01
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_131:
    AND ($9E,X)          ; 21 9E | Logical AND with accumulator ((zero page,X))
    LDX $7C4D,Y          ; BE 4D 7C | Load from absolute,Y into X register
    ASL $0678            ; 0E 78 06 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ROR $14              ; 66 14 | Rotate right (zero page)
    DEX                  ; CA | Decrement X register
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_132
; Address: $EEDB1E
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_132:
    JSR $0120            ; 20 20 01 | Jump to subroutine
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA $48              ; 05 48 | Logical OR with accumulator (zero page)
    STA $9800,Y          ; 99 00 98 | Store accumulator to absolute,Y
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    EOR $64              ; 45 64 | Exclusive OR with accumulator (zero page)
    CPY $8EEE            ; CC EE 8E | Compare Y register (absolute)
    DEC $DFDE            ; CE DE DF | Decrement (absolute)
    LDX $7EBF,Y          ; BE BF 7E | Load from absolute,Y into X register
    ROR $7F7B,X          ; 7E 7B 7F | Rotate right (absolute,X)
    CPY $CCCF            ; CC CF CC | Compare Y register (absolute)
    CMP $F3CF,Y          ; D9 CF F3 | Compare accumulator (absolute,Y)
    STA                  ; 9F 63 5F B3 | Store accumulator to absolute long,X
    INC $FC3F,X          ; FE 3F FC | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDA                  ; BF 2C 7F 88 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    INC $EA10            ; EE 10 EA | Increment (absolute)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    ROR $7E01,X          ; 7E 01 7E | Rotate right (absolute,X)
    STA ($3E,X)          ; 81 3E | Store accumulator to (zero page,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    INC $9F01,X          ; FE 01 9F | Increment (absolute,X)
    BRA $65              ; 80 65 | Branch always
    CMP $C0              ; C5 C0 | Compare accumulator (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    SEP #$C0             ; E2 C0 | Set processor status bits
    SBC $9E60,Y          ; F9 60 9E | Subtract with carry (absolute,Y)
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_134
; Address: $EEDBA7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_134:
    STA                  ; 9F 60 9F 40 | Store accumulator to absolute long,X
    LDA                  ; BF 40 BF C0 | Load from absolute long,X into accumulator
    ORA $0100,Y          ; 19 00 01 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $F100,Y          ; F9 00 F1 | Subtract with carry (absolute,Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    REP #$00             ; C2 00 | Reset processor status bits
    DEC $1C00,X          ; DE 00 1C | Decrement (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY $9900,X          ; BC 00 99 | Load from absolute,X into Y register
    PHB                  ; 8B | Push data bank register to stack
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    CPY #$ED             ; C0 ED | Compare Y register (immediate)
    ORA ($8E,X)          ; 01 8E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_135
; Address: $EEDC07
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_135:
    JSR $3084            ; 20 84 30 | Jump to subroutine
    STY $70              ; 84 70 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    ADC $000F,X          ; 7D 0F 00 | Add with carry (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    BRA $1F              ; 80 1F | Branch always
    BRA $1F              ; 80 1F | Branch always
    DEY                  ; 88 | Decrement Y register
    ASL $3C89,X          ; 1E 89 3C | Arithmetic shift left (absolute,X)
    LDY $BD7B,X          ; BC 7B BD | Load from absolute,X into Y register
    SBC ($60),Y          ; F1 60 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_136
; Address: $EEDC36
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_136:
    ADC #$00             ; 69 00 | Add with carry (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BCS $C6              ; B0 C6 | Branch if carry set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_137
; Address: $EEDC42
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_137:
    JSR $2004            ; 20 04 20 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BRA $4A              ; 80 4A | Branch always
    BRA $9E              ; 80 9E | Branch always
    BRA $4E              ; 80 4E | Branch always
    RTI                  ; 40 | Return from interrupt
    BIT #$09             ; 89 09 | Test bits in accumulator (immediate)
    AND $3147,Y          ; 39 47 31 | Logical AND with accumulator (absolute,Y)
    DEX                  ; CA | Decrement X register
    CPX $EE10            ; EC 10 EE | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_138
; Address: $EEDC6B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_138:
    SBC $F500,X          ; FD 00 F5 | Subtract with carry (absolute,X)
    SBC ($FC),Y          ; F1 FC | Subtract with carry ((zero page),Y)
    SBC $FDFD,X          ; FD FD FD | Subtract with carry (absolute,X)
    SBC $FDFD,X          ; FD FD FD | Subtract with carry (absolute,X)
    ROR $80              ; 66 80 | Rotate right (zero page)
    STZ $C0              ; 64 C0 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_139
; Address: $EEDC87
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_139:
    JSR $01C0            ; 20 C0 01 | Jump to subroutine
    BRA $01              ; 80 01 | Branch always
    BCC $01              ; 90 01 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    STA $09              ; 85 09 | Store accumulator to zero page
    ORA #$99             ; 09 99 | Logical OR with accumulator (immediate)
    STA $9B9B,Y          ; 99 9B 9B | Store accumulator to absolute,Y
    STA                  ; 9F FF 8F FF | Store accumulator to absolute long,X
    DEC                  ; 3A | Decrement accumulator
    ASL $0F7D            ; 0E 7D 0F | Arithmetic shift left (absolute)
    SBC $FB1F,Y          ; F9 1F FB | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    STA $FFFB,Y          ; 99 FB FF | Store accumulator to absolute,Y
    STA                  ; 9F 3F DF 7F | Store accumulator to absolute long,X
    STA                  ; 9F 7F BF 7F | Store accumulator to absolute long,X
    BRA $BF              ; 80 BF | Branch always
    BRA $BF              ; 80 BF | Branch always
    BRA $BF              ; 80 BF | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $C700            ; 0E 00 C7 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    BRA $01              ; 80 01 | Branch always
    INX                  ; E8 | Increment X register
    INC $0200,X          ; FE 00 02 | Increment (absolute,X)
    CPX $8000            ; EC 00 80 | Compare X register (absolute)
    BRA $7C              ; 80 7C | Branch always
    AND $1FC6,Y          ; 39 C6 1F | Logical AND with accumulator (absolute,Y)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BEQ $FE              ; F0 FE | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    LSR $00              ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_13B
; Address: $EEDD3B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_13B:
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    BRA $0F              ; 80 0F | Branch always
    BVS $06              ; 70 06 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STZ $1000            ; 9C 00 10 | Store zero to absolute
    BVS $00              ; 70 00 | Branch if overflow set
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($C0,X)          ; 01 C0 | Logical OR with accumulator ((zero page,X))
    ASL $8400,X          ; 1E 00 84 | Arithmetic shift left (absolute,X)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    ROL $E100,X          ; 3E 00 E1 | Rotate left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    ASL $1B00            ; 0E 00 1B | Arithmetic shift left (absolute)
    SBC $FC03,X          ; FD 03 FC | Subtract with carry (absolute,X)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$F3             ; E0 F3 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    AND ($67,X)          ; 21 67 | Logical AND with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_13C
; Address: $EEDDAA
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_13C:
    BVS $7F              ; 70 7F | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    INC $3F10,X          ; FE 10 3F | Increment (absolute,X)
    CPX $7800            ; EC 00 78 | Compare X register (absolute)
    LDA $EB00,Y          ; B9 00 EB | Load from absolute,Y into accumulator
    BEQ $00              ; F0 00 | Branch if equal
    ADC $D000,Y          ; 79 00 D0 | Add with carry (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    INY                  ; C8 | Increment Y register
    STY $84              ; 84 84 | Store Y register to zero page
    STY $1D01            ; 8C 01 1D | Store Y register to absolute address
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ASL $98              ; 06 98 | Arithmetic shift left (zero page)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ADC ($40),Y          ; 71 40 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_13D
; Address: $EEDDE5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_13D:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $8C              ; 80 8C | Branch always
    BRA $8E              ; 80 8E | Branch always
    STA                  ; 9F 00 8F FF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_140
; Address: $EEDE04
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_140:
    JSR $00CF            ; 20 CF 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    DEC $ED1E            ; CE 1E ED | Decrement (absolute)
    CPX $C03F            ; EC 3F C0 | Compare X register (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    BRA $23              ; 80 23 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    ADC $00              ; 65 00 | Add with carry (zero page)
    SBC $C800,X          ; FD 00 C8 | Subtract with carry (absolute,X)
    BPL $01              ; 10 01 | Branch if positive
    CPX #$19             ; E0 19 | Compare X register (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    BMI $0C              ; 30 0C | Branch if negative
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    ASL $B0              ; 06 B0 | Arithmetic shift left (zero page)
    JMP ($FF00)          ; 6C 00 FF | Jump to address (absolute indirect)
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_141
; Address: $EEDE96
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_141:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $D000            ; ED 00 D0 | Subtract with carry (absolute)
    CPY $05              ; C4 05 | Compare Y register (zero page)
    STX $203F            ; 8E 3F 20 | Store X register to absolute address
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_142
; Address: $EEDEB4
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_142:
    JSR $241C            ; 20 1C 24 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    STA $40BF10          ; 8F 10 BF 40 | Store accumulator to absolute long address
    LSR $D100            ; 4E 00 D1 | Logical shift right (absolute)
    INX                  ; E8 | Increment X register
    ASL $0EFF            ; 0E FF 0E | Arithmetic shift left (absolute)
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $FD03,X          ; FD 03 FD | Subtract with carry (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BCC $7B              ; 90 7B | Branch if carry clear
    LDA $FC7F,X          ; BD 7F FC | Load from absolute,X into accumulator
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_143
; Address: $EEDF1B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_143:
    RTI                  ; 40 | Return from interrupt
    SBC ($C1,X)          ; E1 C1 | Subtract with carry ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($D7,X)          ; 01 D7 | Logical OR with accumulator ((zero page,X))
    STA ($C3),Y          ; 91 C3 | Store accumulator to (zero page),Y
    DEC $C030            ; CE 30 C0 | Decrement (absolute)
    ASL $FE00,X          ; 1E 00 FE | Arithmetic shift left (absolute,X)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    CPY #$A7             ; C0 A7 | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPX #$45             ; E0 45 | Compare X register (immediate)
    WDM #$A0             ; 42 A0 | Reserved instruction
    LDA ($F0,X)          ; A1 F0 | Load from (zero page,X) into accumulator
    BEQ $18              ; F0 18 | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_144
; Address: $EEDF56
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_144:
    JSL $001750          ; 22 50 17 00 | Jump to subroutine long
    LDA                  ; BF 00 5E 00 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $03              ; F0 03 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BEQ $FF              ; F0 FF | Branch if equal
    CPX $D013            ; EC 13 D0 | Compare X register (absolute)
    SBC #$37             ; E9 37 | Subtract with carry (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $28              ; 10 28 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $F09C            ; 9C 9C F0 | Store zero to absolute
    BEQ $03              ; F0 03 | Branch if equal
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STZ $F063            ; 9C 63 F0 | Store zero to absolute
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_145
; Address: $EEDFBE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_145:
    JSR $25C0            ; 20 C0 25 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    ASL $CE00            ; 0E 00 CE | Arithmetic shift left (absolute)
    BMI $5C              ; 30 5C | Branch if negative
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BCS $FF              ; B0 FF | Branch if carry set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_146
; Address: $EEDFD0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_146:
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 38 C7 02 | Load from absolute long,X into accumulator
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDX #$23             ; A2 23 | Load immediate value into X register
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    SBC $CF02,X          ; FD 02 CF | Subtract with carry (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_148
; Address: $EEDFF6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_148:
    JSR $50DC            ; 20 DC 50 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_149
; Address: $EEDFFE
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_149:
    JSR $7D00            ; 20 00 7D | Jump to subroutine
    SBC $CF0F,X          ; FD 0F CF | Subtract with carry (absolute,X)
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    CPX #$2C             ; E0 2C | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    SBC $027D,X          ; FD 7D 02 | Subtract with carry (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $F8FB,X          ; FD FB F8 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    CPX #$79             ; E0 79 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    STY $3F0C            ; 8C 0C 3F | Store Y register to absolute address
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_14A
; Address: $EEE05C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_14A:
    JSL $8060DC          ; 22 DC 60 80 | Jump to subroutine long
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_14B
; Address: $EEE073
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_14B:
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_14C
; Address: $EEE0A6
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_14C:
    PLX                  ; FA | Pull X register from stack
    ORA $F0              ; 05 F0 | Logical OR with accumulator (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    LDX #$1F             ; A2 1F | Load immediate value into X register
    INC $FF              ; E6 FF | Increment (zero page)
    ASL $1EFF,X          ; 1E FF 1E | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    LDY #$8F             ; A0 8F | Load immediate value into Y register
    BCC $AB              ; 90 AB | Branch if carry clear
    DEC $C6              ; C6 C6 | Decrement (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BPL $20              ; 10 20 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BIT $09              ; 24 09 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    AND $67FC            ; 2D FC 67 | Logical AND with accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    EOR $DD31,X          ; 5D 31 DD | Exclusive OR with accumulator (absolute,X)
    ROR $FEF2,X          ; 7E F2 FE | Rotate right (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $20              ; 10 20 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    BRA $74              ; 80 74 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_14D
; Address: $EEE119
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_14D:
    CPY $02              ; C4 02 | Compare Y register (zero page)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    ASL $3AFE            ; 0E FE 3A | Arithmetic shift left (absolute)
    DEC $FE              ; C6 FE | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND $0101,Y          ; 39 01 01 | Logical AND with accumulator (absolute,Y)
    ORA ($13,X)          ; 01 13 | Logical OR with accumulator ((zero page,X))
    STZ $99DF            ; 9C DF 99 | Store zero to absolute
    SBC $E8ED            ; ED ED E8 | Subtract with carry (absolute)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    SBC $F7F9,Y          ; F9 F9 F7 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_14E
; Address: $EEE152
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_14E:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $F81E,X          ; FE 1E F8 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $FC00,X          ; 7E 00 FC | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    AND $FC39,Y          ; 39 39 FC | Logical AND with accumulator (absolute,Y)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    DEC $FF              ; C6 FF | Decrement (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $FCF9,Y          ; F9 F9 FC | Subtract with carry (absolute,Y)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $DFDF,X          ; FE DF DF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_150
; Address: $EEE1C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_150:
    BIT #$CA             ; 89 CA | Test bits in accumulator (immediate)
    ASL $1D9F,X          ; 1E 9F 1D | Arithmetic shift left (absolute,X)
    STA $FEDE,X          ; 9D DE FE | Store accumulator to absolute,X
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_151
; Address: $EEE1DA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_151:
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CPX $FF13            ; EC 13 FF | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_152
; Address: $EEE1E3
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_152:
    JSR $24FF            ; 20 FF 24 | Jump to subroutine
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    ASL $3CFC,X          ; 1E FC 3C | Arithmetic shift left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ROL $1F00,X          ; 3E 00 1F | Rotate left (absolute,X)
    SBC #$FC             ; E9 FC | Subtract with carry (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    SBC $2AD9,Y          ; F9 D9 2A | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_153
; Address: $EEE22E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_153:
    JSL $0300DE          ; 22 DE 00 03 | Jump to subroutine long
    BRA $0C              ; 80 0C | Branch always
    BPL $06              ; 10 06 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    JMP ($607F)          ; 6C 7F 60 | Jump to address (absolute indirect)
    STA $C7E6,Y          ; 99 E6 C7 | Store accumulator to absolute,Y
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    BRA $8E              ; 80 8E | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_154
; Address: $EEE25C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_154:
    JSR $0300            ; 20 00 03 | Jump to subroutine
    ORA $1BE3            ; 0D E3 1B | Logical OR with accumulator (absolute)
    BNE $FF              ; D0 FF | Branch if not equal
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF BF 3F 3F | Load from absolute long,X into accumulator
    STA $E0E08F          ; 8F 8F E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_155
; Address: $EEE292
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_155:
    JSR $40FF            ; 20 FF 40 | Jump to subroutine
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    BVS $01              ; 70 01 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_156
; Address: $EEE2A0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_156:
    STX $3E8E            ; 8E 8E 3E | Store X register to absolute address
    ROL $7F7F,X          ; 3E 7F 7F | Rotate left (absolute,X)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $07              ; F0 07 | Branch if equal
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    BNE $FF              ; D0 FF | Branch if not equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $CF              ; F0 CF | Branch if equal
    STA $441F07          ; 8F 07 1F 44 | Store accumulator to absolute long address
    LDY $FC              ; A4 FC | Load from zero page into Y register
    SEC                  ; 38 | Set carry flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_157
; Address: $EEE318
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_157:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    STZ $CC33            ; 9C 33 CC | Store zero to absolute
    LDA                  ; BF 43 FF 33 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CMP $1BE7,Y          ; D9 E7 1B | Compare accumulator (absolute,Y)
    BCC $6F              ; 90 6F | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEC $3F              ; C6 3F | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ROL $3C3E,X          ; 3E 3E 3C | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_158
; Address: $EEE3B0
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_158:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY $D4EB            ; CC EB D4 | Compare Y register (absolute)
    AND $1C22,X          ; 3D 22 1C | Logical AND with accumulator (absolute,X)
    BPL $1F              ; 10 1F | Branch if positive
    ASL $0607,X          ; 1E 07 06 | Arithmetic shift left (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $1C94,X          ; 1E 94 1C | Arithmetic shift left (absolute,X)
    ASL $1E96,X          ; 1E 96 1E | Arithmetic shift left (absolute,X)
    ASL $A15C,X          ; 1E 5C A1 | Arithmetic shift left (absolute,X)
    JMP $A35CA3          ; 5C A3 5C A3 | Jump to address long
    JMP $A15CA1          ; 5C A1 5C A1 | Jump to address long
    JMP $A25DA3          ; 5C A3 5D A2 | Jump to address long
    JMP $3C27A1          ; 5C A1 27 3C | Jump to address long
    LDA $BD42,X          ; BD 42 BD | Load from absolute,X into accumulator
    WDM #$BD             ; 42 BD | Reserved instruction
    WDM #$FD             ; 42 FD | Reserved instruction
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    LDA $8244,Y          ; B9 44 82 | Load from absolute,Y into accumulator
    ADC $3ADA,X          ; 7D DA 3A | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    BNE $36              ; D0 36 | Branch if not equal
    CMP ($50,X)          ; C1 50 | Compare accumulator ((zero page,X))
    LDA #$FA             ; A9 FA | Load immediate value into accumulator
    ORA $FC              ; 05 FC | Logical OR with accumulator (zero page)
    DEC $3B              ; C6 3B | Decrement (zero page)
    SBC $3F02,X          ; FD 02 3F | Subtract with carry (absolute,X)
    CMP ($D7,X)          ; C1 D7 | Compare accumulator ((zero page,X))
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    LDA $25DF56          ; AF 56 DF 25 | Load from absolute long address into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $0A              ; 30 0A | Branch if negative
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    DEC $2531            ; CE 31 25 | Decrement (absolute)
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP ($34,X)          ; C1 34 | Compare accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    CPY $CE31            ; CC 31 CE | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_159
; Address: $EEE461
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_159:
    SEC                  ; 38 | Set carry flag
    BMI $10              ; 30 10 | Branch if negative
    STA                  ; 9F A7 98 28 | Store accumulator to absolute long,X
    STZ $9B              ; 64 9B | Store zero to zero page
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F 60 98 63 | Store accumulator to absolute long,X
    CLC                  ; 18 | Clear carry flag
    BCC $B4              ; 90 B4 | Branch if carry clear
    AND ($21,X)          ; 21 21 | PPU graphics register access
    SBC $CAB1,Y          ; F9 B1 CA | Subtract with carry (absolute,Y)
    PHX                  ; DA | Push X register to stack
    ASL $BE76            ; 0E 76 BE | Arithmetic shift left (absolute)
    WDM #$3D             ; 42 3D | Reserved instruction
    ORA $02E1            ; 0D E1 02 | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_15A
; Address: $EEE493
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_15A:
    STZ $4CB2,X          ; 9E B2 4C | Store zero to absolute,X
    LSR $F721            ; 4E 21 F7 | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    LDY $20DF,X          ; BC DF 20 | Load from absolute,X into Y register
    ORA ($E2),Y          ; 11 E2 | Logical OR with accumulator ((zero page),Y)
    BMI $30              ; 30 30 | Branch if negative
    BRA $9F              ; 80 9F | Branch always
    BVS $2E              ; 70 2E | Branch if overflow set
    BPL $8F              ; 10 8F | Branch if positive
    BCS $C1              ; B0 C1 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    STY $BF              ; 84 BF | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    BCS $4F              ; B0 4F | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    DEC $9430            ; CE 30 94 | Decrement (absolute)
    ORA $1D95,X          ; 1D 95 1D | Logical OR with accumulator (absolute,X)
    ORA $A25D,X          ; 1D 5D A2 | Logical OR with accumulator (absolute,X)
    EOR $7DA2,X          ; 5D A2 7D | Exclusive OR with accumulator (absolute,X)
    BRA $5D              ; 80 5D | Branch always
    LDX #$5F             ; A2 5F | Load immediate value into X register
    LDY #$7D             ; A0 7D | Load immediate value into Y register
    LDY #$27             ; A0 27 | Load immediate value into Y register
    LDY $3C27,X          ; BC 27 3C | Load from absolute,X into Y register
    LDY $3C27,X          ; BC 27 3C | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    LDY $BCA7,X          ; BC A7 BC | Load from absolute,X into Y register
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $F902,X          ; FD 02 F9 | Subtract with carry (absolute,X)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SBC $6402,X          ; FD 02 64 | Subtract with carry (absolute,X)
    STA ($8B,X)          ; 81 8B | Store accumulator to (zero page,X)
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_15B
; Address: $EEE508
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_15B:
    CMP $3B              ; C5 3B | Compare accumulator (zero page)
    DEC $38              ; C6 38 | Decrement (zero page)
    LDY $DF              ; A4 DF | Load from zero page into Y register
    ROL $7E9B            ; 2E 9B 7E | Rotate left (absolute)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SBC $A407,Y          ; F9 07 A4 | Subtract with carry (absolute,Y)
    ROL $ECD1            ; 2E D1 EC | Rotate left (absolute)
    BCC $10              ; 90 10 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    BEQ $2F              ; F0 2F | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    NOP                  ; EA | No operation

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_15C
; Address: $EEE54E
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_15C:
    JSR $AFDC            ; 20 DC AF | Jump to subroutine
    BVC $2F              ; 50 2F | Branch if overflow clear
    BNE $E2              ; D0 E2 | Branch if not equal
    DEX                  ; CA | Decrement X register
    NOP                  ; EA | No operation
    DEC $EF21,X          ; DE 21 EF | Decrement (absolute,X)
    BEQ $FE              ; F0 FE | Branch if equal
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    BIT $08F7            ; 2C F7 08 | Test bits in accumulator (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    JMP ($FF93)          ; 6C 93 FF | Jump to address (absolute indirect)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $06              ; 30 06 | Branch if negative
    DEC $39              ; C6 39 | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    CPY #$BD             ; C0 BD | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $00FF,Y          ; F9 FF 00 | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    CLD                  ; D8 | Clear decimal mode flag
    REP #$3F             ; C2 3F | Reset processor status bits
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    INC $FF11            ; EE 11 FF | Increment (absolute)
    JMP $951D95          ; 5C 95 1D 95 | Jump to address long
    ORA $5CD4,X          ; 1D D4 5C | Logical OR with accumulator (absolute,X)
    EOR $1C94,X          ; 5D 94 1C | Exclusive OR with accumulator (absolute,X)
    EOR $5CD4,X          ; 5D D4 5C | Exclusive OR with accumulator (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $7D              ; 80 7D | Branch always
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_15D
; Address: $EEE5D9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_15D:
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $A7              ; 80 A7 | Branch always
    LDY $B8A7,X          ; BC A7 B8 | Load from absolute,X into Y register
    LDY $BCA7,X          ; BC A7 BC | Load from absolute,X into Y register
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    LDY $D8E7,X          ; BC E7 D8 | Load from absolute,X into Y register
    SBC $F902,X          ; FD 02 F9 | Subtract with carry (absolute,X)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SBC $F902,X          ; FD 02 F9 | Subtract with carry (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CMP $F726,Y          ; D9 26 F7 | Compare accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_15E
; Address: $EEE603
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_15E:
    EOR $5ED7,X          ; 5D D7 5E | Exclusive OR with accumulator (absolute,X)
    ADC $6DF5,X          ; 7D F5 6D | Add with carry (absolute,X)
    ROR $6EF7            ; 6E F7 6E | Rotate right (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_15F
; Address: $EEE613
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_15F:
    BRA $7E              ; 80 7E | Branch always
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    BRA $6F              ; 80 6F | Branch always
    BCC $7B              ; 90 7B | Branch if carry clear
    STY $6E              ; 84 6E | Store Y register to zero page
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    STA ($F5),Y          ; 91 F5 | Store accumulator to (zero page),Y
    DEX                  ; CA | Decrement X register
    ROR                  ; 6A | Rotate right (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $5A              ; E5 5A | Subtract with carry (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $5A              ; E5 5A | Subtract with carry (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $7B              ; 24 7B | Test bits in accumulator (zero page)
    STY $59              ; 84 59 | Store Y register to zero page
    LDX $5B              ; A6 5B | Load from zero page into X register
    LDY $3B              ; A4 3B | Load from zero page into Y register
    CPY $5B              ; C4 5B | Compare Y register (zero page)
    LDY $1B              ; A4 1B | Load from zero page into Y register
    CPX $1B              ; E4 1B | Compare X register (zero page)
    CPX $FF              ; E4 FF | Compare X register (zero page)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC $FF01,Y          ; F9 01 FF | Subtract with carry (absolute,Y)
    SBC $FA02,X          ; FD 02 FA | Subtract with carry (absolute,X)
    ORA $F9              ; 05 F9 | Logical OR with accumulator (zero page)
    STA $9F66,Y          ; 99 66 9F | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_160
; Address: $EEE666
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_160:
    BMI $10              ; 30 10 | Branch if negative
    STA                  ; 9F A4 10 20 | Store accumulator to absolute long,X
    CPY $3E3B            ; CC 3B 3E | Compare Y register (absolute)
    ROR $99              ; 66 99 | Rotate right (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_162
; Address: $EEE678
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_162:
    CPX $1B              ; E4 1B | Compare X register (zero page)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CPY $75              ; C4 75 | Compare Y register (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $08F7,Y          ; F9 F7 08 | Subtract with carry (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    SBC $0806,Y          ; F9 06 08 | Subtract with carry (absolute,Y)
    CMP $F726,Y          ; D9 26 F7 | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 80 3F 00 | Load from absolute long,X into accumulator
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    BRA $FF              ; 80 FF | Branch always
    INC $8E85,X          ; FE 85 8E | Increment (absolute,X)
    ADC ($48),Y          ; 71 48 | Add with carry ((zero page),Y)
    ROR $A79C            ; 6E 9C A7 | Rotate right (absolute)
    ASL $85              ; 06 85 | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    EOR #$9D             ; 49 9D | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_163
; Address: $EEE6D9
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_163:
    JSR $03FC            ; 20 FC 03 | Jump to subroutine
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    LDY $3B              ; A4 3B | Load from zero page into Y register
    STZ $9B              ; 64 9B | Store zero to zero page
    CPX $97              ; E4 97 | Compare X register (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    BIT $50AF            ; 2C AF 50 | Test bits in accumulator (absolute)
    BNE $3B              ; D0 3B | Branch if not equal
    CPY $BD              ; C4 BD | Compare Y register (zero page)
    WDM #$FF             ; 42 FF | Reserved instruction
    XBA                  ; EB | Exchange accumulator bytes
    BPL $DF              ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_164
; Address: $EEE6FD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_164:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL $FA              ; 06 FA | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_165
; Address: $EEE710
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_165:
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BNE $5F              ; D0 5F | Branch if not equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_166
; Address: $EEE723
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_166:
    JSR $205F            ; 20 5F 20 | Jump to subroutine
    LDA                  ; BF FF F3 FF | Load from absolute long,X into accumulator
    ROL $E1FF,X          ; 3E FF E1 | Rotate left (absolute,X)
    BCC $EF              ; 90 EF | Branch if carry clear
    DEC $FFFF,X          ; DE FF FF | Decrement (absolute,X)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ROL $FFD1            ; 2E D1 FF | Rotate left (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FE 01 00 | Load from absolute long,X into accumulator
    ROR $4381,X          ; 7E 81 43 | Rotate right (absolute,X)
    LDY $00FF,X          ; BC FF 00 | Load from absolute,X into Y register
    LDA                  ; BF 40 00 FF | Load from absolute long,X into accumulator
    SBC $1616,Y          ; F9 16 16 | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    PEA #$E01F           ; F4 1F E0 | Game work RAM access
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    PEA #$E00B           ; F4 0B E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    BMI $10              ; 30 10 | Branch if negative
    BIT $14              ; 24 14 | Test bits in accumulator (zero page)
    STA $3800B7          ; 8F B7 00 38 | Store accumulator to absolute long address
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F 60 98 63 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $FF06,Y          ; F9 06 FF | Subtract with carry (absolute,Y)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FB01,X          ; FE 01 FB | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $6F              ; 80 6F | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $8F              ; F0 8F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $3F              ; 80 3F | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_167
; Address: $EEE842
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_167:
    BEQ $0F              ; F0 0F | Branch if equal
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $8E85,X          ; FE 85 8E | Increment (absolute,X)
    ADC ($48),Y          ; 71 48 | Add with carry ((zero page),Y)
    ROR $279C            ; 6E 9C 27 | Rotate right (absolute)
    PEA #$3BC3           ; F4 C3 3B | Push effective address to stack
    INC $7A85            ; EE 85 7A | Increment (absolute)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    EOR #$9D             ; 49 9D | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_168
; Address: $EEE879
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_168:
    JSR $03FC            ; 20 FC 03 | Jump to subroutine
    ROL $EEC1,X          ; 3E C1 EE | Rotate left (absolute,X)
    ORA ($19),Y          ; 11 19 | Logical OR with accumulator ((zero page),Y)
    INC $2F              ; E6 2F | Increment (zero page)
    BNE $00              ; D0 00 | Branch if not equal
    BRA $7F              ; 80 7F | Branch always
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    SBC $5B              ; E5 5B | Subtract with carry (zero page)
    CPY #$E6             ; C0 E6 | Compare Y register (immediate)
    ORA $2FD0,Y          ; 19 D0 2F | Logical OR with accumulator (absolute,Y)
    BRA $BE              ; 80 BE | Branch always
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    PHY                  ; 5A | Push Y register to stack
    LDA $C0              ; A5 C0 | Load from zero page into accumulator
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    EOR $FFA6,Y          ; 59 A6 FF | Exclusive OR with accumulator (absolute,Y)
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    JMP $FFDAA7          ; 5C A7 DA FF | Jump to address long
    ASL $FFF1            ; 0E F1 FF | Arithmetic shift left (absolute)
    LDX $59              ; A6 59 | Load from zero page into X register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDY $03              ; A4 03 | Load from zero page into Y register
    DEC                  ; 3A | Decrement accumulator
    LDY $3B              ; A4 3B | Load from zero page into Y register
    STZ $9B              ; 64 9B | Store zero to zero page
    CPX $96              ; E4 96 | Compare X register (zero page)
    ADC #$D8             ; 69 D8 | Add with carry (immediate)
    LDA                  ; BF 40 3F C0 | Load from absolute long,X into accumulator
    CPY $BD              ; C4 BD | Compare Y register (zero page)
    WDM #$FF             ; 42 FF | Reserved instruction
    XBA                  ; EB | Exchange accumulator bytes
    BPL $DF              ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_169
; Address: $EEE8DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_169:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    ASL $FA              ; 06 FA | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    STZ $4CB3            ; 9C B3 4C | Store zero to absolute

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_16A
; Address: $EEE8EF
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_16A:
    JMP ($00FF)          ; 6C FF 00 | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    PLX                  ; FA | Pull X register from stack
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    STA                  ; 9F 60 CC 33 | Store accumulator to absolute long,X
    CPX $FC13            ; EC 13 FC | Compare X register (absolute)
    ASL $1CEB            ; 0E EB 1C | Arithmetic shift left (absolute)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ROR $BF81,X          ; 7E 81 BF | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    BNE $AF              ; D0 AF | Branch if not equal
    BVC $EF              ; 50 EF | Branch if overflow clear
    BPL $7F              ; 10 7F | Branch if positive
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STY $82              ; 84 82 | Store Y register to zero page
    STZ $5282            ; 9C 82 52 | Store zero to absolute
    BVS $2F              ; 70 2F | Branch if overflow set
    BPL $8F              ; 10 8F | Branch if positive
    BCS $C1              ; B0 C1 | Branch if carry set
    STX $49              ; 86 49 | Store X register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $BF              ; 84 BF | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    BCS $4F              ; B0 4F | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    DEC $7B30            ; CE 30 7B | Decrement (absolute)
    STY $0606            ; 8C 06 06 | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $7F              ; 80 7F | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    LDY $BF63,X          ; BC 63 BF | Load from absolute,X into Y register
    ADC ($8C),Y          ; 71 8C | Add with carry ((zero page),Y)
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_16B
; Address: $EEE9BB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_16B:
    JSR $9C63            ; 20 63 9C | Jump to subroutine
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    LDY $7E7E,X          ; BC 7E 7E | Load from absolute,X into Y register
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    ROL $02FF,X          ; 3E FF 02 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_16C
; Address: $EEE9CA
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_16C:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA $F8FF50          ; AF 50 FF F8 | Load from absolute long address into accumulator
    LDA $FF42,X          ; BD 42 FF | Load from absolute,X into accumulator
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    LDY $08F7            ; AC F7 08 | Load from absolute address into Y register
    BIT $60D3            ; 2C D3 60 | Test bits in accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    ADC $00FF,X          ; 7D FF 00 | Add with carry (absolute,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    SBC $F702,Y          ; F9 02 F7 | Subtract with carry (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_16D
; Address: $EEEA03
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_16D:
    LSR $7AF7,X          ; 5E F7 7A | Logical shift right (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_16E
; Address: $EEEA0D
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_16E:
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_16F
; Address: $EEEA12
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_16F:
    ROR $7A81,X          ; 7E 81 7A | Rotate right (absolute,X)
    STA $6A              ; 85 6A | Store accumulator to zero page
    LDY $6B              ; A4 6B | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    DEX                  ; CA | Decrement X register
    NOP                  ; EA | No operation
    SEI                  ; 78 | Set interrupt disable flag
    SBC $5A              ; E5 5A | Subtract with carry (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    ADC ($AE),Y          ; 71 AE | Add with carry ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $FB              ; 24 FB | Test bits in accumulator (zero page)
    ADC $5B86,Y          ; 79 86 5B | Add with carry (absolute,Y)
    LDY $5B              ; A4 5B | Load from zero page into Y register
    LDY $1B              ; A4 1B | Load from zero page into Y register
    CPX $BF              ; E4 BF | Compare X register (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    BRA $3F              ; 80 3F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STA $708F70          ; 8F 70 8F 70 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_170
; Address: $EEEA56
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_170:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_171
; Address: $EEEA5C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_171:
    SBC $F600,X          ; FD 00 F6 | Subtract with carry (absolute,X)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    DEC $807F,X          ; DE 7F 80 | Decrement (absolute,X)
    INC $FF11            ; EE 11 FF | Increment (absolute)
    INC $C301,X          ; FE 01 C3 | Increment (absolute,X)
    DEC $D221,X          ; DE 21 D2 | Decrement (absolute,X)
    LDX $9EDF,Y          ; BE DF 9E | Load from absolute,Y into X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_173
; Address: $EEEAAB
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_173:
    EOR $6969            ; 4D 69 69 | Exclusive OR with accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack
    LDA $60              ; A5 60 | Load from zero page into accumulator
    STA                  ; 9F 3A C5 24 | Store accumulator to absolute long,X
    EOR $FDB2            ; 4D B2 FD | Exclusive OR with accumulator (absolute)
    CPX $0B              ; E4 0B | Compare X register (zero page)
    ROR $EBFD,X          ; 7E FD EB | Rotate right (absolute,X)
    ASL $F6              ; 06 F6 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $7F              ; 80 7F | Branch always
    BRA $25              ; 80 25 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    EOR $42BD            ; 4D BD 42 | Hardware register operation
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BMI $06              ; 30 06 | Branch if negative
    DEC $39              ; C6 39 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPY $27              ; C4 27 | Compare Y register (zero page)
    BPL $ED              ; 10 ED | Branch if positive
    BVC $FE              ; 50 FE | Branch if overflow clear
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $00FF,Y          ; F9 FF 00 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    STA $FBE7D8          ; 8F D8 E7 FB | Store accumulator to absolute long address
    BMI $0C              ; 30 0C | Branch if negative
    BVC $6C              ; 50 6C | Branch if overflow clear
    INC $3E3B,X          ; FE 3B 3E | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_174
; Address: $EEEB13
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_174:
    SED                  ; F8 | Set decimal mode flag
    BMI $2F              ; 30 2F | Branch if negative
    BCC $FE              ; 90 FE | Branch if carry clear
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    SBC $77B8,Y          ; F9 B8 77 | Subtract with carry (absolute,Y)
    STA $4D              ; 85 4D | Store accumulator to zero page
    JMP $2A5AA5          ; 5C A5 5A 2A | Jump to address long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    SBC $7706,Y          ; F9 06 77 | Subtract with carry (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    BRA $5C              ; 80 5C | Branch always
    PHY                  ; 5A | Push Y register to stack
    LDA $71              ; A5 71 | Load from zero page into accumulator
    STX $07F8            ; 8E F8 07 | Store X register to absolute address
    SEI                  ; 78 | Set interrupt disable flag
    ORA $F2FE            ; 0D FE F2 | Logical OR with accumulator (absolute)
    STA ($5B),Y          ; 91 5B | Store accumulator to (zero page),Y
    LDY $FB              ; A4 FB | Load from zero page into Y register
    STA                  ; 9F 60 1F E0 | Store accumulator to absolute long,X
    STA                  ; 9F 60 D3 2C | Store accumulator to absolute long,X
    INC $9F01,X          ; FE 01 9F | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_176
; Address: $EEEB61
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_176:
    JSR $30CF            ; 20 CF 30 | Jump to subroutine
    CPX #$D9             ; E0 D9 | Compare X register (immediate)
    STX $06F9            ; 8E F9 06 | Store X register to absolute address
    ROR $BF81,X          ; 7E 81 BF | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BMI $CF              ; 30 CF | Branch if negative
    INC $3E01,X          ; FE 01 3E | Increment (absolute,X)
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    LDA $10EF50          ; AF 50 EF 10 | Load from absolute long address into accumulator
    CMP $00FF            ; CD FF 00 | Compare accumulator (absolute)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_177
; Address: $EEEB8B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_177:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    STY $83              ; 84 83 | Store Y register to zero page
    ROR $FE00,X          ; 7E 00 FE | Rotate right (absolute,X)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_178
; Address: $EEEBBA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_178:
    SED                  ; F8 | Set decimal mode flag
    CPX $00              ; E4 00 | Compare X register (zero page)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CPY $45              ; C4 45 | Compare Y register (zero page)
    CPY $FF4E            ; CC 4E FF | Compare Y register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_179
; Address: $EEEBC9
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_179:
    ADC ($10,X)          ; 61 10 | Add with carry ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $548679          ; AF 79 86 54 | Load from absolute long address into accumulator
    TAX                  ; AA | Transfer accumulator to X register
    EOR $CBB0            ; 4D B0 CB | Exclusive OR with accumulator (absolute)
    STY $40A8            ; 8C A8 40 | Store Y register to absolute address
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $0B              ; 10 0B | Branch if positive
    BIT $AD8E            ; 2C 8E AD | Test bits in accumulator (absolute)
    ORA #$49             ; 09 49 | Logical OR with accumulator (immediate)
    LDA #$C9             ; A9 C9 | Load immediate value into accumulator
    BVS $10              ; 70 10 | Branch if overflow set
    STZ $A4              ; 64 A4 | Store zero to zero page
    XBA                  ; EB | Exchange accumulator bytes
    PLB                  ; AB | Pull data bank register from stack
    CMP $BF02,X          ; DD 02 BF | Compare accumulator (absolute,X)
    CMP $0226,Y          ; D9 26 02 | Compare accumulator (absolute,Y)
    SBC $403F            ; ED 3F 40 | Subtract with carry (absolute)
    LDA                  ; BF 40 FD 02 | Load from absolute long,X into accumulator
    BCS $46              ; B0 46 | Branch if carry set
    STY $8F77            ; 8C 77 8F | Store Y register to absolute address
    ASL $1C95,X          ; 1E 95 1C | Arithmetic shift left (absolute,X)
    ASL $09F6,X          ; 1E F6 09 | Arithmetic shift left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    STA $8D72            ; 8D 72 8D | Store accumulator to absolute address
    BVS $5C              ; 70 5C | Branch if overflow set
    LDA ($5C,X)          ; A1 5C | Load from (zero page,X) into accumulator
    EOR $5CA2,X          ; 5D A2 5C | Exclusive OR with accumulator (absolute,X)
    LDA ($07,X)          ; A1 07 | Load from (zero page,X) into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    CPX #$19             ; E0 19 | Compare X register (immediate)
    ROR $B9              ; 66 B9 | Rotate right (zero page)
    DEC $B1              ; C6 B1 | Decrement (zero page)
    LSR $1EE1            ; 4E E1 1E | Logical shift right (absolute)
    SBC $3A              ; E5 3A | Subtract with carry (zero page)
    BCC $7F              ; 90 7F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_17A
; Address: $EEEC37
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_17A:
    JSR $A05F            ; 20 5F A0 | Jump to subroutine
    CPX #$3B             ; E0 3B | Compare X register (immediate)
    CPY $FD              ; C4 FD | Compare Y register (zero page)
    PHY                  ; 5A | Push Y register to stack
    LDA $8244,Y          ; B9 44 82 | Load from absolute,Y into accumulator
    ADC $3ADA,X          ; 7D DA 3A | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_17B
; Address: $EEEC4B
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_17B:
    BNE $36              ; D0 36 | Branch if not equal
    CMP ($50,X)          ; C1 50 | Compare accumulator ((zero page,X))
    LDA #$7A             ; A9 7A | Load immediate value into accumulator
    STA $FC              ; 85 FC | Store accumulator to zero page
    DEC $3B              ; C6 3B | Decrement (zero page)
    SBC $3F02,X          ; FD 02 3F | Subtract with carry (absolute,X)
    CMP ($D7,X)          ; C1 D7 | Compare accumulator ((zero page,X))
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    LDA $290956          ; AF 56 09 29 | Load from absolute long address into accumulator
    STA $08AD            ; 8D AD 08 | Store accumulator to absolute address
    PHA                  ; 48 | Push accumulator to stack
    LDA #$C9             ; A9 C9 | Load immediate value into accumulator
    BVS $10              ; 70 10 | Branch if overflow set
    STZ $A4              ; 64 A4 | Store zero to zero page
    XBA                  ; EB | Exchange accumulator bytes
    PLB                  ; AB | Pull data bank register from stack
    ORA $DDD2            ; 0D D2 DD | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 D9 26 | Load from absolute long,X into accumulator
    SBC $403F            ; ED 3F 40 | Subtract with carry (absolute)
    LDA                  ; BF 40 FD 02 | Load from absolute long,X into accumulator
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    ASL $8CE1,X          ; 1E E1 8C | Arithmetic shift left (absolute,X)
    BCS $CF              ; B0 CF | Branch if carry set
    CLC                  ; 18 | Clear carry flag
    INC $0FDF            ; EE DF 0F | Increment (absolute)
    BEQ $E1              ; F0 E1 | Branch if equal
    INC $FCF3,X          ; FE F3 FC | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CMP ($7F),Y          ; D1 7F | Compare accumulator ((zero page),Y)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $96              ; 80 96 | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 47 B0 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 80 FF FF | Load from absolute long,X into accumulator
    ROR $9EFB,X          ; 7E FB 9E | Rotate right (absolute,X)
    EOR ($D8),Y          ; 51 D8 | Exclusive OR with accumulator ((zero page),Y)
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    BRA $9F              ; 80 9F | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_17C
; Address: $EEECE2
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_17C:
    STX $F871            ; 8E 71 F8 | Store X register to absolute address
    SEP #$1F             ; E2 1F | Set processor status bits
    BEQ $0F              ; F0 0F | Branch if equal
    STA $2B7F            ; 8D 7F 2B | Store accumulator to absolute address
    SBC $F707,Y          ; F9 07 F7 | Subtract with carry (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_17D
; Address: $EEED10
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_17D:
    INC                  ; 1A | Increment accumulator
    CMP $3000,X          ; DD 00 30 | Compare accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    LDX $C000,Y          ; BE 00 C0 | Load from absolute,Y into X register
    STY $8000            ; 8C 00 80 | Store Y register to absolute address
    LDX $FF00,Y          ; BE 00 FF | Load from absolute,Y into X register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $2400,X          ; 1E 00 24 | Arithmetic shift left (absolute,X)
    ASL $88F7,X          ; 1E F7 88 | Arithmetic shift left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    INC $F9              ; E6 F9 | Increment (zero page)
    PEA #$6008           ; F4 08 60 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_17E
; Address: $EEED70
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_17E:
    CMP $20              ; C5 20 | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_17F
; Address: $EEED7E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_17F:
    JSL $C7279D          ; 22 9D 27 C7 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    SBC $8127,X          ; FD 27 81 | Subtract with carry (absolute,X)
    STX $10              ; 86 10 | Store X register to zero page
    BPL $5F              ; 10 5F | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_180
; Address: $EEED91
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_180:
    JSR $1CE3            ; 20 E3 1C | Jump to subroutine
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR $2501,X          ; 5E 01 25 | Logical shift right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    STZ $8861,X          ; 9E 61 88 | Store zero to absolute,X
    BRA $7F              ; 80 7F | Branch always
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_181
; Address: $EEEDD0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_181:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    CPY $45              ; C4 45 | Compare Y register (zero page)
    CPY $F84E            ; CC 4E F8 | Compare Y register (absolute)
    INY                  ; C8 | Increment Y register
    WDM #$41             ; 42 41 | Reserved instruction

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_182
; Address: $EEEE0D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_182:
    PHP                  ; 08 | Push processor status to stack
    LDX $7991            ; AE 91 79 | Load from absolute address into X register
    STX $54              ; 86 54 | Store X register to zero page
    TAX                  ; AA | Transfer accumulator to X register
    EOR $CCB0            ; 4D B0 CC | Exclusive OR with accumulator (absolute)
    AND $9792            ; 2D 92 97 | Logical AND with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    LDA $20DF50          ; AF 50 DF 20 | Load from absolute long address into accumulator
    ORA #$29             ; 09 29 | Logical OR with accumulator (immediate)
    STA $08AD            ; 8D AD 08 | Store accumulator to absolute address
    PHA                  ; 48 | Push accumulator to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $D0              ; 80 D0 | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_183
; Address: $EEEE2B
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_183:
    JSR $11E9            ; 20 E9 11 | Jump to subroutine
    AND $0DC5,Y          ; 39 C5 0D | Logical AND with accumulator (absolute,Y)
    CMP $BF02,X          ; DD 02 BF | Compare accumulator (absolute,X)
    ADC $A286,Y          ; 79 86 A2 | Add with carry (absolute,Y)
    EOR $14EB,X          ; 5D EB 14 | Exclusive OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SBC $5902,X          ; FD 02 59 | Subtract with carry (absolute,X)
    INC $FB              ; E6 FB | Increment (zero page)
    STY $30              ; 84 30 | Store Y register to zero page
    LDA                  ; BF 47 9F 6C | Load from absolute long,X into accumulator
    STZ $B771,X          ; 9E 71 B7 | Store zero to absolute,X
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    ROR $BC01,X          ; 7E 01 BC | Rotate right (absolute,X)
    DEY                  ; 88 | Decrement Y register
    JMP ($7793)          ; 6C 93 77 | Jump to address (absolute indirect)
    DEY                  ; 88 | Decrement Y register
    INC $6E01,X          ; FE 01 6E | Increment (absolute,X)
    STA ($D7),Y          ; 91 D7 | Store accumulator to (zero page),Y
    ORA #$97             ; 09 97 | Logical OR with accumulator (immediate)
    EOR #$97             ; 49 97 | Exclusive OR with accumulator (immediate)
    CMP #$97             ; C9 97 | Compare accumulator (immediate)
    EOR #$BF             ; 49 BF | Exclusive OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_184
; Address: $EEEE6B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_184:
    ORA #$97             ; 09 97 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    BEQ $4F              ; F0 4F | Branch if equal
    BCS $CF              ; B0 CF | Branch if carry set
    BMI $6F              ; 30 6F | Branch if negative
    BCC $6E              ; 90 6E | Branch if carry clear
    STA ($09),Y          ; 91 09 | Store accumulator to (zero page),Y
    INC $4E11            ; EE 11 4E | Increment (absolute)
    LDA ($D7),Y          ; B1 D7 | Load from (zero page),Y into accumulator
    ORA #$B7             ; 09 B7 | Logical OR with accumulator (immediate)
    ADC #$96             ; 69 96 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_185
; Address: $EEEE85
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_185:
    INY                  ; C8 | Increment Y register
    EOR #$BF             ; 49 BF | Exclusive OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_186
; Address: $EEEE8B
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_186:
    BIT #$17             ; 89 17 | Test bits in accumulator (immediate)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BNE $6F              ; D0 6F | Branch if not equal
    BCC $EF              ; 90 EF | Branch if carry clear
    BPL $6F              ; 10 6F | Branch if positive
    BCC $6E              ; 90 6E | Branch if carry clear
    STA ($A9),Y          ; 91 A9 | Store accumulator to (zero page),Y
    INC $EE11            ; EE 11 EE | Increment (absolute)
    ORA ($17),Y          ; 11 17 | Logical OR with accumulator ((zero page),Y)
    CMP #$13             ; C9 13 | Compare accumulator (immediate)
    CMP $055F            ; CD 5F 05 | Compare accumulator (absolute)
    EOR $F748,Y          ; 59 48 F7 | Exclusive OR with accumulator (absolute,Y)
    AND ($3D),Y          ; 31 3D | Logical AND with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    BPL $ED              ; 10 ED | Branch if positive
    LDA $5A              ; A5 5A | Load from zero page into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    INC $F301,X          ; FE 01 F3 | Increment (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    BPL $3B              ; 10 3B | Branch if positive
    ADC $F758,Y          ; 79 58 F7 | Add with carry (absolute,Y)
    AND ($3D),Y          ; 31 3D | Logical AND with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$00F5           ; F4 F5 00 | Push effective address to stack
    BPL $A7              ; 10 A7 | Branch if positive
    INC $F301,X          ; FE 01 F3 | Increment (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    ADC $74FF,X          ; 7D FF 74 | Add with carry (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_187
; Address: $EEEEED
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_187:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    ADC $7482,X          ; 7D 82 74 | Add with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_189
; Address: $EEEEFC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_189:
    JSR $FFDF            ; 20 DF FF | Jump to subroutine
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    STY $7B              ; 84 7B | Store Y register to zero page
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    LDY $FEFF,X          ; BC FF FE | Load from absolute,X into Y register
    ADC ($F0,X)          ; 61 F0 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_18A
; Address: $EEEF24
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_18A:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $9F80,X          ; FE 80 9F | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA                  ; 9F 18 FF E0 | Store accumulator to absolute long,X
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_18B
; Address: $EEEF4D
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_18B:
    JSR $E0FF            ; 20 FF E0 | Game work RAM access
    STX $AF6E            ; 8E 6E AF | Store X register to absolute address
    CMP ($5F,X)          ; C1 5F | Compare accumulator ((zero page,X))
    SBC ($7F),Y          ; F1 7F | Subtract with carry ((zero page),Y)
    SBC $F02D            ; ED 2D F0 | Subtract with carry (absolute)
    BMI $F2              ; 30 F2 | Branch if negative
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    DEC $A1F1,X          ; DE F1 A1 | Decrement (absolute,X)
    INC $EE91,X          ; FE 91 EE | Increment (absolute,X)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    SBC $E2FF            ; ED FF E2 | Subtract with carry (absolute)
    INC $FEE2,X          ; FE E2 FE | Increment (absolute,X)
    INC $FE26,X          ; FE 26 FE | Increment (absolute,X)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    LDX $FE              ; A6 FE | Load from zero page into X register
    INC $CEFE            ; EE FE CE | Increment (absolute)
    DEC $DD23,X          ; DE 23 DD | Decrement (absolute,X)
    EOR $9D63,X          ; 5D 63 9D | Exclusive OR with accumulator (absolute,X)
    CMP $F907,Y          ; D9 07 F9 | Compare accumulator (absolute,Y)
    EOR $11EF,Y          ; 59 EF 11 | Exclusive OR with accumulator (absolute,Y)
    AND ($F7),Y          ; 31 F7 | Logical AND with accumulator ((zero page),Y)
    ROR                  ; 6A | Rotate right (accumulator)
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    BMI $CF              ; 30 CF | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    BEQ $03              ; F0 03 | Branch if equal
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    STA $FFFF,X          ; 9D FF FF | Store accumulator to absolute,X
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $FC02,X          ; FE 02 FC | Increment (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    DEC $FE              ; C6 FE | Decrement (zero page)
    STA ($FC,X)          ; 81 FC | Store accumulator to (zero page,X)
    SBC $FBFF,X          ; FD FF FB | Subtract with carry (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $7FFF,Y          ; F9 FF 7F | Subtract with carry (absolute,Y)
    ROL $FC01,X          ; 3E 01 FC | Rotate left (absolute,X)
    PEA #$F4CB           ; F4 CB F4 | Push effective address to stack
    SEP #$1D             ; E2 1D | Set processor status bits
    SEP #$1D             ; E2 1D | Set processor status bits
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_18C
; Address: $EEF000
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_18C:
    DEC                  ; 3A | Decrement accumulator
    PHX                  ; DA | Push X register to stack
    NOP                  ; EA | No operation
    CPX #$E5             ; E0 E5 | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    PEA #$FCFF           ; F4 FF FC | Push effective address to stack
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    LDX $5C60,Y          ; BE 60 5C | Load from absolute,Y into X register
    CPX $DC              ; E4 DC | Compare X register (zero page)
    PEA #$F89C           ; F4 9C F8 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    SBC #$39             ; E9 39 | Subtract with carry (immediate)
    SBC #$39             ; E9 39 | Subtract with carry (immediate)
    ADC #$B9             ; 69 B9 | Add with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    DEC $CEF7            ; CE F7 CE | Decrement (absolute)
    DEC $00F7            ; CE F7 00 | Decrement (absolute)
    ASL $1CF2            ; 0E F2 1C | Arithmetic shift left (absolute)
    CPX $EB1B            ; EC 1B EB | Compare X register (absolute)
    AND $1FCD,X          ; 3D CD 1F | Logical AND with accumulator (absolute,X)
    SBC $F3FF,X          ; FD FF F3 | Subtract with carry (absolute,X)
    PEA #$FCFF           ; F4 FF FC | Push effective address to stack
    BEQ $FF              ; F0 FF | Branch if equal
    CLC                  ; 18 | Clear carry flag
    PEA #$781F           ; F4 1F 78 | Push effective address to stack
    INC                  ; 1A | Increment accumulator
    STA $1FF3FF          ; 8F FF F3 1F | Store accumulator to absolute long address
    CLC                  ; 18 | Clear carry flag
    CPY $FFE7            ; CC E7 FF | Compare Y register (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_18D
; Address: $EEF073
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_18D:
    STA                  ; 9F 97 EF E5 | Store accumulator to absolute long,X
    BVS $FF              ; 70 FF | Branch if overflow set
    JMP ($E79F)          ; 6C 9F E7 | Jump to address (absolute indirect)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    LDY $46F9,X          ; BC F9 46 | Load from absolute,X into Y register
    SBC $FF16,Y          ; F9 16 FF | Subtract with carry (absolute,Y)
    LDA                  ; BF FF EF FF | Load from absolute long,X into accumulator
    ROL $36CD,X          ; 3E CD 36 | Rotate left (absolute,X)
    CMP $75              ; C5 75 | Compare accumulator (zero page)
    SBC ($10),Y          ; F1 10 | Subtract with carry ((zero page),Y)
    SBC $FB19,Y          ; F9 19 FB | Subtract with carry (absolute,Y)
    INC $FF              ; E6 FF | Increment (zero page)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    AND $E7              ; 25 E7 | Logical AND with accumulator (zero page)
    AND $F7              ; 25 F7 | Logical AND with accumulator (zero page)
    BIT $9C              ; 24 9C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_18E
; Address: $EEF0D6
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_18E:
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $E2E6,X          ; 1E E6 E2 | Arithmetic shift left (absolute,X)
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    SBC $A3FF,Y          ; F9 FF A3 | Subtract with carry (absolute,Y)
    CMP $30CF,X          ; DD CF 30 | Compare accumulator (absolute,X)
    JMP $C7F85B          ; 5C 5B F8 C7 | Jump to address long
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    JMP $737353          ; 5C 53 73 73 | Jump to address long
    LDA                  ; BF 8C FF FD | Load from absolute long,X into accumulator
    ORA $12EE            ; 0D EE 12 | Logical OR with accumulator (absolute)
    LDY $BA47,X          ; BC 47 BA | Load from absolute,X into Y register
    BCS $83              ; B0 83 | Branch if carry set
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    LDA $FDB9,Y          ; B9 B9 FD | Load from absolute,Y into accumulator
    ADC $DEFF,X          ; 7D FF DE | Add with carry (absolute,X)
    INC $FE6D,X          ; FE 6D FE | Increment (absolute,X)
    AND #$70             ; 29 70 | Logical AND with accumulator (immediate)
    STA $9CFF20          ; 8F 20 FF 9C | Store accumulator to absolute long address
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    CLV                  ; B8 | Clear overflow flag
    TAY                  ; A8 | Transfer accumulator to Y register
    ADC $7DB2,X          ; 7D B2 7D | Add with carry (absolute,X)
    ADC $D7B2,X          ; 7D B2 D7 | Add with carry (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LSR $7E              ; 46 7E | Logical shift right (zero page)
    DEC $78FF            ; CE FF 78 | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 80 FF 83 | Load from absolute long,X into accumulator
    LDA $C3FF,Y          ; B9 FF C3 | Load from absolute,Y into accumulator
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    SBC $9B9B,Y          ; F9 9B 9B | Subtract with carry (absolute,Y)
    AND ($5F,X)          ; 21 5F | Logical AND with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $8FD9,X          ; DE D9 8F | Decrement (absolute,X)
    DEY                  ; 88 | Decrement Y register
    LDY $B9BB,X          ; BC BB B9 | Load from absolute,X into Y register
    LDX $C6              ; A6 C6 | Load from zero page into X register
    CPX $7F              ; E4 7F | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_18F
; Address: $EEF1B4
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_18F:
    DEC $B7FF,X          ; DE FF B7 | Decrement (absolute,X)
    BVS $6F              ; 70 6F | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROR $CC85,X          ; 7E 85 CC | Rotate right (absolute,X)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    LDA                  ; BF 5F 9F FF | Load from absolute long,X into accumulator
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $F807,X          ; FE 07 F8 | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    ADC $79B6,Y          ; 79 B6 79 | Add with carry (absolute,Y)
    ADC $79B6,Y          ; 79 B6 79 | Add with carry (absolute,Y)
    ADC $7BB6,Y          ; 79 B6 7B | Add with carry (absolute,Y)
    BMI $CF              ; 30 CF | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BVS $8F              ; 70 8F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 02 FD 07 | Load from absolute long,X into accumulator
    LDY $1CE3,X          ; BC E3 1C | Load from absolute,X into Y register
    BEQ $0F              ; F0 0F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_190
; Address: $EEF263
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_190:
    LDA                  ; BF 67 FF D8 | Load from absolute long,X into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF DF 20 C0 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_191
; Address: $EEF26E
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_191:
    JSR $A0DF            ; 20 DF A0 | Jump to subroutine
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF E7 40 FF | Load from absolute long,X into accumulator
    ORA $3FFA,X          ; 1D FA 3F | Logical OR with accumulator (absolute,X)
    DEX                  ; CA | Decrement X register
    ROL                  ; 2A | Rotate left (accumulator)
    INX                  ; E8 | Increment X register
    CPX #$17             ; E0 17 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    EOR $B956,Y          ; 59 56 B9 | Exclusive OR with accumulator (absolute,Y)
    LDX $F9              ; A6 F9 | Load from zero page into X register
    INC $F3              ; E6 F3 | Increment (zero page)
    STY $DC23            ; 8C 23 DC | Store Y register to absolute address
    LDA $FF5FFF          ; AF FF 5F FF | Load from absolute long address into accumulator
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    AND $12DE            ; 2D DE 12 | Logical AND with accumulator (absolute)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_192
; Address: $EEF2C8
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_192:
    INC $26              ; E6 26 | Increment (zero page)
    INC $EC2E            ; EE 2E EC | Increment (absolute)
    BIT $24E4            ; 2C E4 24 | Test bits in accumulator (absolute)
    DEC $EDFF,X          ; DE FF ED | Decrement (absolute,X)
    SBC $F1DF,Y          ; F9 DF F1 | Subtract with carry (absolute,Y)
    BEQ $8F              ; F0 8F | Branch if equal
    BEQ $8F              ; F0 8F | Branch if equal
    BEQ $CF              ; F0 CF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $CF              ; 30 CF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $DFFF            ; EE FF DF | Increment (absolute)
    CPY #$3B             ; C0 3B | Compare Y register (immediate)
    CPY $79              ; C4 79 | Compare Y register (zero page)
    ADC $F9B6,Y          ; 79 B6 F9 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    LSR                  ; 4A | Logical shift right (accumulator)
    PHP                  ; 08 | Push processor status to stack
    STA $FF0FFF          ; 8F FF 0F FF | Store accumulator to absolute long address
    LDA $F7F7,X          ; BD F7 F7 | Load from absolute,X into accumulator
    CPY $CE31            ; CC 31 CE | Compare Y register (absolute)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    CMP $FDB6,Y          ; D9 B6 FD | Compare accumulator (absolute,Y)
    SBC #$69             ; E9 69 | Subtract with carry (immediate)
    SBC #$69             ; E9 69 | Subtract with carry (immediate)
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    SBC ($31),Y          ; F1 31 | Subtract with carry ((zero page),Y)
    STZ $9EF7,X          ; 9E F7 9E | Store zero to absolute,X
    STZ $9EFF,X          ; 9E FF 9E | Store zero to absolute,X
    DEC $ADFF            ; CE FF AD | Decrement (absolute)
    STA $CEFF            ; 8D FF CE | Store accumulator to absolute address
    LDY $FEA3,X          ; BC A3 FE | Load from absolute,X into Y register
    SBC ($7E,X)          ; E1 7E | Subtract with carry ((zero page,X))
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    LDA ($3F,X)          ; A1 3F | Load from (zero page,X) into accumulator
    LDA                  ; BF FF 3F FF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_193
; Address: $EEF3A1
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_193:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BEQ $FF              ; F0 FF | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BMI $DF              ; 30 DF | Branch if negative
    PEA #$D71B           ; F4 1B D7 | Push effective address to stack
    XBA                  ; EB | Exchange accumulator bytes
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    STY $FFFF            ; 8C FF FF | Store Y register to absolute address
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $7EFF,X          ; FE FF 7E | Increment (absolute,X)
    SBC $EB3D,X          ; FD 3D EB | Subtract with carry (absolute,X)
    LDX $F7CC,Y          ; BE CC F7 | Load from absolute,Y into X register
    INY                  ; C8 | Increment Y register
    REP #$FF             ; C2 FF | Reset processor status bits
    CPY $C8FF            ; CC FF C8 | Compare Y register (absolute)
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    INC $FEC1,X          ; FE C1 FE | Increment (absolute,X)
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    CMP ($FE,X)          ; C1 FE | Compare accumulator ((zero page,X))
    STA $FC              ; 85 FC | Store accumulator to zero page
    SED                  ; F8 | Set decimal mode flag
    SBC ($17),Y          ; F1 17 | Subtract with carry ((zero page),Y)
    SBC $F91F,X          ; FD 1F F9 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $EAFF            ; EE FF EA | Increment (absolute)
    SEP #$FF             ; E2 FF | Set processor status bits
    INC $FF              ; E6 FF | Increment (zero page)
    CLV                  ; B8 | Clear overflow flag
    BMI $76              ; 30 76 | Branch if negative
    DEC $527F,X          ; DE 7F 52 | Decrement (absolute,X)
    SBC $CFAA            ; ED AA CF | Subtract with carry (absolute)
    PLB                  ; AB | Pull data bank register from stack
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    LDA $2EFF            ; AD FF 2E | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_194
; Address: $EEF485
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_194:
    SED                  ; F8 | Set decimal mode flag
    PEA #$EC13           ; F4 13 EC | Push effective address to stack
    JMP ($4CB3)          ; 6C B3 4C | Jump to address (absolute indirect)
    JMP $FCFFFE          ; 5C FE FF FC | Jump to address long
    STA                  ; 9F 37 D7 3F | Store accumulator to absolute long,X
    DEC $DE3F,X          ; DE 3F DE | Decrement (absolute,X)
    DEC $DE3F,X          ; DE 3F DE | Decrement (absolute,X)
    DEC $FFE0,X          ; DE E0 FF | Decrement (absolute,X)
    INX                  ; E8 | Increment X register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA $1DEA,X          ; 1D EA 1D | Logical OR with accumulator (absolute,X)
    SEP #$1D             ; E2 1D | Set processor status bits
    NOP                  ; EA | No operation
    ORA $1CE2,X          ; 1D E2 1C | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPX $FEAB            ; EC AB FE | Compare X register (absolute)
    STA $91FE,Y          ; 99 FE 91 | Store accumulator to absolute,Y
    INC $FE05,X          ; FE 05 FE | Increment (absolute,X)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    JMP $A35CA3          ; 5C A3 5C A3 | Jump to address long
    JMP $03FC03          ; 5C 03 FC 03 | Jump to address long
    DEC $CE3F            ; CE 3F CE | Decrement (absolute)
    CPY $CC3F            ; CC 3F CC | Compare Y register (absolute)
    LDA                  ; BF 4C BF 4C | Load from absolute long,X into accumulator
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_195
; Address: $EEF56C
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_195:
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    BMI $CF              ; 30 CF | Branch if negative
    CMP $C936            ; CD 36 C9 | Compare accumulator (absolute)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $1FFF,X          ; FE FF 1F | Increment (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    STX $00FF            ; 8E FF 00 | Store X register to absolute address
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $8F              ; F0 8F | Branch if equal
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    BEQ $8F              ; F0 8F | Branch if equal
    BEQ $CF              ; F0 CF | Branch if equal
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $CF              ; 30 CF | Branch if negative
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    LDA                  ; BF BE F7 F4 | Load from absolute long,X into accumulator
    JMP ($B1FE)          ; 6C FE B1 | Jump to address (absolute indirect)
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_196
; Address: $EEF690
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_196:
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    LDA                  ; BF 8F FF FF | Load from absolute long,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    ASL $3DF1            ; 0E F1 3D | Arithmetic shift left (absolute)
    REP #$FF             ; C2 FF | Reset processor status bits
    STY $FF00            ; 8C 00 FF | Store Y register to absolute address
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    SBC $FFE6,Y          ; F9 E6 FF | Subtract with carry (absolute,Y)
    STA $9CFE            ; 8D FE 9C | Store accumulator to absolute address
    SBC $C7FF,Y          ; F9 FF C7 | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    BNE $AF              ; D0 AF | Branch if not equal
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_197
; Address: $EEF6E8
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_197:
    SEC                  ; 38 | Set carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BNE $2F              ; D0 2F | Branch if not equal
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BEQ $38              ; F0 38 | Branch if equal
    LDA $FCFF2F          ; AF 2F FF FC | Load from absolute long address into accumulator
    SED                  ; F8 | Set decimal mode flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BNE $00              ; D0 00 | Branch if not equal
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    INC $08              ; E6 08 | Increment (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    STA $00708F          ; 8F 8F 70 00 | Store accumulator to absolute long address
    BMI $18              ; 30 18 | Branch if negative
    BVS $FF              ; 70 FF | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    STZ $99E6            ; 9C E6 99 | Store zero to absolute
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    STX $4080            ; 8E 80 40 | Store X register to absolute address
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STA $C03870          ; 8F 70 38 C0 | Store accumulator to absolute long address
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $1F              ; 10 1F | Branch if positive
    LDY $3FBF,X          ; BC BF 3F | Load from absolute,X into Y register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_198
; Address: $EEF793
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_198:
    BRA $FF              ; 80 FF | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BVS $8F              ; 70 8F | Branch if overflow set
    BEQ $0F              ; F0 0F | Branch if equal
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BRA $3F              ; 80 3F | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA $7EE6,Y          ; 19 E6 7E | Logical OR with accumulator (absolute,Y)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA $004F00          ; 8F 00 4F 00 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_199
; Address: $EEF7EF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_199:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    ASL $0F00,X          ; 1E 00 0F | Arithmetic shift left (absolute,X)
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    STA $00FF70          ; 8F 70 FF 00 | Store accumulator to absolute long address
    INC $FA01,X          ; FE 01 FA | Increment (absolute,X)
    ORA $DE              ; 05 DE | Logical OR with accumulator (zero page)
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    AND ($EE,X)          ; 21 EE | Logical AND with accumulator ((zero page,X))
    AND ($E4),Y          ; 31 E4 | Logical AND with accumulator ((zero page),Y)
    INC $7E00,X          ; FE 00 7E | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_19C
; Address: $EEF81F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_19C:
    JSR $0303            ; 20 03 03 | Jump to subroutine
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    STX $06              ; 86 06 | Store X register to zero page
    LDX $8B02,Y          ; BE 02 8B | Load from absolute,Y into X register
    PEA #$1C00           ; F4 00 1C | Push effective address to stack
    CPX #$41             ; E0 41 | Compare X register (immediate)
    LDA $E202,X          ; BD 02 E2 | Load from absolute,X into accumulator
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPX $00              ; E4 00 | Compare X register (zero page)
    PEA #$FC00           ; F4 00 FC | Push effective address to stack
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    BMI $30              ; 30 30 | Branch if negative
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_19D
; Address: $EEF86B
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_19D:
    DEY                  ; 88 | Decrement Y register
    TAX                  ; AA | Transfer accumulator to X register
    BCC $90              ; 90 90 | Branch if carry clear
    STZ $AA9E,X          ; 9E 9E AA | Store zero to absolute,X
    PLB                  ; AB | Pull data bank register from stack
    TAX                  ; AA | Transfer accumulator to X register
    BNE $D0              ; D0 D0 | Branch if not equal
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    BVC $50              ; 50 50 | Branch if overflow clear
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    JMP $3388            ; 4C 88 33 | Jump to address
    STZ $9C43            ; 9C 43 9C | Store zero to absolute
    PEA #$FA06           ; F4 06 FA | Push effective address to stack
    AND $D9              ; 25 D9 | Logical AND with accumulator (zero page)
    LDY $FC00,X          ; BC 00 FC | Load from absolute,X into Y register
    DEC $FE00,X          ; DE 00 FE | Decrement (absolute,X)
    CMP $F6E6,Y          ; D9 E6 F6 | Compare accumulator (absolute,Y)
    ORA #$DD             ; 09 DD | Logical OR with accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    PLB                  ; AB | Pull data bank register from stack
    SBC $D728            ; ED 28 D7 | Subtract with carry (absolute)
    CMP $44C0,Y          ; D9 C0 44 | Compare accumulator (absolute,Y)
    CMP #$C9             ; C9 C9 | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_19E
; Address: $EEF8FA
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_19E:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    STA ($91),Y          ; 91 91 | Store accumulator to (zero page),Y
    LDX $DB41,Y          ; BE 41 DB | Load from absolute,Y into X register
    AND $59BF,X          ; 3D BF 59 | Logical AND with accumulator (absolute,X)
    AND $F609,X          ; 3D 09 F6 | Logical AND with accumulator (absolute,X)
    BCC $00              ; 90 00 | Branch if carry clear
    ORA $1919,Y          ; 19 19 19 | Logical OR with accumulator (absolute,Y)
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC $620E            ; CE 0E 62 | Decrement (absolute)
    BRA $00              ; 80 00 | Branch always
    REP #$02             ; C2 02 | Reset processor status bits
    SEP #$02             ; E2 02 | Set processor status bits
    SEP #$02             ; E2 02 | Set processor status bits
    BRA $00              ; 80 00 | Branch always
    ORA $D5E8,Y          ; 19 E8 D5 | Logical OR with accumulator (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    BRA $7D              ; 80 7D | Branch always
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    ROL $3F              ; 26 3F | Rotate left (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_19F
; Address: $EEF956
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_19F:
    CMP $7E14,X          ; DD 14 7E | Compare accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    AND ($E3,X)          ; 21 E3 | Logical AND with accumulator ((zero page,X))
    INC $E6              ; E6 E6 | Increment (zero page)
    INC $E6              ; E6 E6 | Increment (zero page)
    REP #$C2             ; C2 C2 | Reset processor status bits
    ORA #$2E             ; 09 2E | Logical OR with accumulator (immediate)
    ROL $C2DB            ; 2E DB C2 | Rotate left (absolute)
    LDA                  ; BF A6 C2 FF | Load from absolute long,X into accumulator
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEC $FE81            ; CE 81 FE | Decrement (absolute)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PEA #$3CFF           ; F4 FF 3C | Push effective address to stack
    JMP ($FE6F)          ; 6C 6F FE | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1A2
; Address: $EEF9A1
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1A2:
    JSR $38DF            ; 20 DF 38 | Jump to subroutine
    BNE $3F              ; D0 3F | Branch if not equal
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    INC $CC01,X          ; FE 01 CC | Increment (absolute,X)
    STZ $7861,X          ; 9E 61 78 | Store zero to absolute,X
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $8F              ; 70 8F | Branch if overflow set
    STY $017F            ; 8C 7F 01 | Store Y register to absolute address
    ORA $67E7,Y          ; 19 E7 67 | Logical OR with accumulator (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $00              ; E4 00 | Compare X register (zero page)
    PEA #$FC00           ; F4 00 FC | Push effective address to stack
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDY $BFC3,X          ; BC C3 BF | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1A3
; Address: $EEFA23
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1A3:
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    BRA $FD              ; 80 FD | Branch always
    STA $FDF6            ; 8D F6 FD | Store accumulator to absolute address
    INC $FEBD,X          ; FE BD FE | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    BRA $BF              ; 80 BF | Branch always
    STA ($63,X)          ; 81 63 | Store accumulator to (zero page,X)
    SBC $80              ; E5 80 | Subtract with carry (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $64              ; 65 64 | Add with carry (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BEQ $BF              ; F0 BF | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    INC $FE0F,X          ; FE 0F FE | Increment (absolute,X)
    INC $270F,X          ; FE 0F 27 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1A4
; Address: $EEFA51
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1A4:
    JSR $80B8            ; 20 B8 80 | Jump to subroutine
    INC $0800            ; EE 00 08 | Increment (absolute)
    INC $BE0E            ; EE 0E BE | Increment (absolute)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    BMI $FF              ; 30 FF | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    ASL $0300,X          ; 1E 00 03 | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    AND $01FF,X          ; 3D FF 01 | Logical AND with accumulator (absolute,X)
    STA $7F              ; 85 7F | Store accumulator to zero page
    STZ $1EF2,X          ; 9E F2 1E | Store zero to absolute,X
    LDA ($7F),Y          ; B1 7F | Load from (zero page),Y into accumulator
    SBC $7177,Y          ; F9 77 71 | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    JMP $7388            ; 4C 88 73 | Jump to address
    STZ $9C43            ; 9C 43 9C | Store zero to absolute
    PEA #$FA06           ; F4 06 FA | Push effective address to stack
    AND $D9              ; 25 D9 | Logical AND with accumulator (zero page)
    LDA $98FE,X          ; BD FE 98 | Load from absolute,X into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $83FF,Y          ; F9 FF 83 | Subtract with carry (absolute,Y)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1A6
; Address: $EEFAD6
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1A6:
    JSR $7C20            ; 20 20 7C | Jump to subroutine
    ASL $B0              ; 06 B0 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BCS $40              ; B0 40 | Branch if carry set
    STA                  ; 9F 9F 06 06 | Store accumulator to absolute long,X
    JMP $B04C            ; 4C 4C B0 | Jump to address
    BMI $60              ; 30 60 | Branch if negative
    SBC $2900,Y          ; F9 00 29 | Subtract with carry (absolute,Y)
    DEC $EF08,X          ; DE 08 EF | Decrement (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA $387F78          ; AF 78 7F 38 | Load from absolute long address into accumulator
    ORA $001F,X          ; 1D 1F 00 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    ASL $50              ; 06 50 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FE7E,X          ; FE 7E FE | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1A7
; Address: $EEFB28
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1A7:
    JSR $C4E0            ; 20 E0 C4 | Jump to subroutine
    CPY $4C              ; C4 4C | Compare Y register (zero page)
    JMP $0000            ; 4C 00 00 | Jump to address
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)
    ADC $E36C            ; 6D 6C E3 | Add with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1A8
; Address: $EEFB36
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1A8:
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $3B01,X          ; 1E 01 3B | Arithmetic shift left (absolute,X)
    ORA ($7C,X)          ; 01 7C | Logical OR with accumulator ((zero page,X))
    STZ $B0E1,X          ; 9E E1 B0 | Store zero to absolute,X
    STA $7E3EFF          ; 8F FF 3E 7E | Store accumulator to absolute long address
    ROL $E37E,X          ; 3E 7E E3 | Rotate left (absolute,X)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ORA $000D            ; 0D 0D 00 | Logical OR with accumulator (absolute)
    LDA ($30),Y          ; B1 30 | Load from (zero page),Y into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    PHA                  ; 48 | Push accumulator to stack
    LDX $F210            ; AE 10 F2 | Load from absolute address into X register
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    SBC $FCFB,Y          ; F9 FB FC | Subtract with carry (absolute,Y)
    BVC $6F              ; 50 6F | Branch if overflow clear
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SBC $F7FF,X          ; FD FF F7 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1A9
; Address: $EEFB87
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1A9:
    SED                  ; F8 | Set decimal mode flag
    NOP                  ; EA | No operation
    INC $1010,X          ; FE 10 10 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    AND ($30),Y          ; 31 30 | Logical AND with accumulator ((zero page),Y)
    ORA $8E74            ; 0D 74 8E | Logical OR with accumulator (absolute)
    DEC $3EC6            ; CE C6 3E | Decrement (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1AC
; Address: $EEFBB2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1AC:
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    STA $84              ; 85 84 | Store accumulator to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($27),Y          ; 11 27 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1AD
; Address: $EEFBBD
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1AD:
    JSR $019E            ; 20 9E 01 | Jump to subroutine
    EOR #$4F             ; 49 4F | Exclusive OR with accumulator (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $B1              ; 80 B1 | Branch always
    ORA ($8E,X)          ; 01 8E | Logical OR with accumulator ((zero page,X))
    ASL $8038            ; 0E 38 80 | Arithmetic shift left (absolute)
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    CLV                  ; B8 | Clear overflow flag
    ASL $F971            ; 0E 71 F9 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    LDY $F680,X          ; BC 80 F6 | Load from absolute,X into Y register
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    LDY $FE01,X          ; BC 01 FE | Load from absolute,X into Y register
    INC $0FFE,X          ; FE FE 0F | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROR $007E,X          ; 7E 7E 00 | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    SEP #$1C             ; E2 1C | Set processor status bits
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1AE
; Address: $EEFC20
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1AE:
    BEQ $F0              ; F0 F0 | Branch if equal
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BRA $80              ; 80 80 | Branch always
    ASL $3601            ; 0E 01 36 | Arithmetic shift left (absolute)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BVS $0F              ; 70 0F | Branch if overflow set
    ASL $FFF1            ; 0E F1 FF | Arithmetic shift left (absolute)
    ORA ($44,X)          ; 01 44 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    ADC $FF9C,X          ; 7D 9C FF | Add with carry (absolute,X)
    SBC $54FD,X          ; FD FD 54 | Subtract with carry (absolute,X)
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    PLP                  ; 28 | Pull processor status from stack
    STZ $389C            ; 9C 9C 38 | Store zero to absolute
    SBC ($C1,X)          ; E1 C1 | Subtract with carry ((zero page,X))
    LDA $8C12,Y          ; B9 12 8C | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1AF
; Address: $EEFC5F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1AF:
    JSL $8AFF67          ; 22 67 FF 8A | Jump to subroutine long
    DEC $00DE,X          ; DE DE 00 | Decrement (absolute,X)
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    CMP $5555,X          ; DD 55 55 | Compare accumulator (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CMP ($66,X)          ; C1 66 | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    AND ($C8,X)          ; 21 C8 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B0
; Address: $EEFC7F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B0:
    JSL $4FFFF3          ; 22 F3 FF 4F | Jump to subroutine long
    LDA                  ; BF 9F 9F 00 | Load from absolute long,X into accumulator
    INC $7DFF            ; EE FF 7D | Increment (absolute)
    SBC $DDDD,X          ; FD DD DD | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B1
; Address: $EEFC98
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B1:
    CMP $C5              ; C5 C5 | Compare accumulator (zero page)
    STY $578C            ; 8C 8C 57 | Store Y register to absolute address
    AND ($F3),Y          ; 31 F3 | Logical AND with accumulator ((zero page),Y)
    JMP $BFFF            ; 4C FF BF | Jump to address
    LDA                  ; BF 00 00 7B | Load from absolute long,X into accumulator
    DEC $DCDE,X          ; DE DE DC | Decrement (absolute,X)
    JMP $404C            ; 4C 4C 40 | Jump to address
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    ORA $1C1F,Y          ; 19 1F 1C | Logical OR with accumulator (absolute,Y)
    JMP $71717C          ; 5C 7C 71 71 | Jump to address long
    BRA $00              ; 80 00 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B2
; Address: $EEFCDB
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B2:
    DEY                  ; 88 | Decrement Y register
    BVC $8E              ; 50 8E | Branch if overflow clear
    CMP #$37             ; C9 37 | Compare accumulator (immediate)
    SBC $DCFE,Y          ; F9 FE DC | Subtract with carry (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    JMP $039B5C          ; 5C 5C 9B 03 | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    STY $FB              ; 84 FB | Store Y register to zero page
    INC $7CFE,X          ; FE FE 7C | Increment (absolute,X)
    CMP ($51),Y          ; D1 51 | Compare accumulator ((zero page),Y)
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    ORA $031C,X          ; 1D 1C 03 | Logical OR with accumulator (absolute,X)
    ROL $1900            ; 2E 00 19 | Rotate left (absolute)
    ORA ($50,X)          ; 01 50 | Logical OR with accumulator ((zero page,X))
    BVC $0C              ; 50 0C | Branch if overflow clear
    AND #$37             ; 29 37 | Logical AND with accumulator (immediate)
    ADC $7E9F            ; 6D 9F 7E | Add with carry (absolute)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $DFD9,X          ; FE D9 DF | Increment (absolute,X)
    STZ $9E9E            ; 9C 9E 9E | Store zero to absolute
    STZ $00C0,X          ; 9E C0 00 | Store zero to absolute,X
    ROR $83              ; 66 83 | Rotate right (zero page)
    EOR $44              ; 45 44 | Exclusive OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ADC $04              ; 65 04 | Add with carry (zero page)
    ASL $45              ; 06 45 | Arithmetic shift left (zero page)
    EOR $15              ; 45 15 | Exclusive OR with accumulator (zero page)
    BVC $50              ; 50 50 | Branch if overflow clear
    BPL $10              ; 10 10 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B3
; Address: $EEFD51
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B3:
    JSR $20CA            ; 20 CA 20 | Jump to subroutine
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $AA              ; 45 AA | Exclusive OR with accumulator (zero page)
    TAX                  ; AA | Transfer accumulator to X register
    LDY $BE41            ; AC 41 BE | Load from absolute address into Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA $DC22,X          ; 1D 22 DC | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B4
; Address: $EEFD73
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B4:
    JSL $558A64          ; 22 64 8A 55 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    BPL $10              ; 10 10 | Branch if positive
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B6
; Address: $EEFD95
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B6:
    JSL $55AA45          ; 22 45 AA 55 | Jump to subroutine long
    TAX                  ; AA | Transfer accumulator to X register
    EOR ($AE),Y          ; 51 AE | Exclusive OR with accumulator ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    BCC $90              ; 90 90 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive
    ADC $DD02            ; 6D 02 DD | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B7
; Address: $EEFDB3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B7:
    JSL $650AF5          ; 22 F5 0A 65 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    EOR ($AA),Y          ; 51 AA | Exclusive OR with accumulator ((zero page),Y)
    TAX                  ; AA | Transfer accumulator to X register
    NOP                  ; EA | No operation
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    BRA $3D              ; 80 3D | Branch always
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $04              ; F0 04 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STY $7D70            ; 8C 70 7D | Store Y register to absolute address
    BRA $3E              ; 80 3E | Branch always
    CMP ($C0,X)          ; C1 C0 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B8
; Address: $EEFDF0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B8:
    JSR $F01F            ; 20 1F F0 | Jump to subroutine
    ORA $1C06,Y          ; 19 06 1C | Logical OR with accumulator (absolute,Y)
    INC $3F11            ; EE 11 3F | Increment (absolute)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1B9
; Address: $EEFE1A
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1B9:
    ASL $2401            ; 0E 01 24 | Arithmetic shift left (absolute)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LSR $3B              ; 46 3B | Logical shift right (zero page)
    STA $3D70            ; 8D 70 3D | Store accumulator to absolute address
    CPY #$26             ; C0 26 | Compare Y register (immediate)
    CMP ($76,X)          ; C1 76 | Compare accumulator ((zero page,X))
    STA ($7C,X)          ; 81 7C | Store accumulator to (zero page,X)
    BEQ $0F              ; F0 0F | Branch if equal
    AND $FF2F            ; 2D 2F FF | Logical AND with accumulator (absolute)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BPL $22              ; 10 22 | Branch if positive
    STA $63              ; 85 63 | Store accumulator to zero page
    SEC                  ; 38 | Set carry flag
    ASL $A920,X          ; 1E 20 A9 | Arithmetic shift left (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    EOR ($AE),Y          ; 51 AE | Exclusive OR with accumulator ((zero page),Y)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1BA
; Address: $EEFE6E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1BA:
    JSL $989800          ; 22 00 98 98 | Jump to subroutine long
    DEC $0021,X          ; DE 21 00 | Decrement (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    STA $5423,Y          ; 99 23 54 | Store accumulator to absolute,Y
    TAX                  ; AA | Transfer accumulator to X register
    NOP                  ; EA | No operation
    LDA                  ; BF FF 00 00 | Load from absolute long,X into accumulator
    CMP $9DDD,X          ; DD DD 9D | Compare accumulator (absolute,X)
    STA $D5D5,X          ; 9D D5 D5 | Store accumulator to absolute,X
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    STY $B00C            ; 8C 0C B0 | Store Y register to absolute address
    BCS $9F              ; B0 9F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1BB
; Address: $EEFE98
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1BB:
    DEC                  ; 3A | Decrement accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($A8),Y          ; 11 A8 | Logical OR with accumulator ((zero page),Y)
    CPY $1E22            ; CC 22 1E | Compare Y register (absolute)
    ASL $FFFF,X          ; 1E FF FF | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1BC
; Address: $EEFEAE
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1BC:
    JSL $0CED00          ; 22 00 ED 0C | Jump to subroutine long
    LDA                  ; BF 40 00 FF | Load from absolute long,X into accumulator
    LDY $84              ; A4 84 | Load from zero page into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($DC,X)          ; 21 DC | Logical AND with accumulator ((zero page,X))
    ROR $477F,X          ; 7E 7F 47 | Rotate right (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1BF
; Address: $EEFED0
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1BF:
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    BRA $47              ; 80 47 | Branch always
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    ORA $14E0,Y          ; 19 E0 14 | Logical OR with accumulator (absolute,Y)
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    BMI $30              ; 30 30 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    STZ $77              ; 64 77 | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    CMP $6401,Y          ; D9 01 64 | Compare accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BRA $E6              ; 80 E6 | Branch always
    INC $60              ; E6 60 | Increment (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1C0
; Address: $EEFF0E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1C0:
    BPL $10              ; 10 10 | Branch if positive
    STY $E30C            ; 8C 0C E3 | Store Y register to absolute address
    INC $7C01,X          ; FE 01 7C | Increment (absolute,X)
    EOR ($2E),Y          ; 51 2E | Exclusive OR with accumulator ((zero page),Y)
    EOR ($58,X)          ; 41 58 | Exclusive OR with accumulator ((zero page,X))
    STA                  ; 9F 00 EF 00 | Store accumulator to absolute long,X
    ASL $F6B6,X          ; 1E B6 F6 | Arithmetic shift left (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    AND $C4              ; 25 C4 | Logical AND with accumulator (zero page)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EA,X)          ; 01 EA | Logical OR with accumulator ((zero page,X))
    INC $EF00            ; EE 00 EF | Increment (absolute)
    LDA                  ; BF 00 AF 00 | Load from absolute long,X into accumulator
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1C1
; Address: $EEFF60
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1C1:
    JSL $002200          ; 22 00 22 00 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1C2
; Address: $EEFF70
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1C2:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1C4
; Address: $EEFF84
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1C4:
    JSL $00AA00          ; 22 00 AA 00 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    BPL $8B              ; 10 8B | Branch if positive
    LDA $EA1500          ; AF 00 15 EA | Load from absolute long address into accumulator
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 AF 10 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank5C_DmaFunction_1C5
; Address: $EEFFA2
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank5C_DmaFunction_1C5:
    JSL $000A00          ; 22 00 0A 00 | Jump to subroutine long
    TXA                  ; 8A | Transfer X register to accumulator
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    LDX $9000            ; AE 00 90 | Load from absolute address into X register
    BPL $EF              ; 10 EF | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
