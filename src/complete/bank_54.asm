;==============================================================================
; Dragon Quest III - Bank $54
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $EA0000-$EA7FFF
; Instructions: 8300
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_54"

;------------------------------------------------------------------------------
; Bank54_DmaFunction_000
; Address: $EA8003
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_000:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $0607            ; 0E 07 06 | Arithmetic shift left (absolute)
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    BMI $0F              ; 30 0F | Branch if negative
    CMP ($C3,X)          ; C1 C3 | Compare accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $340F            ; 0D 0F 34 | Logical OR with accumulator (absolute)
    PEA #$C1C0           ; F4 C0 C1 | Push effective address to stack
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $3802,X          ; FD 02 38 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BPL $C8              ; 10 C8 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank54_DmaFunction_001
; Address: $EA8045
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_001:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_002
; Address: $EA8055
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_002:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    EOR $3F15,X          ; 5D 15 3F | Exclusive OR with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    BIT $0A30            ; 2C 30 0A | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_003
; Address: $EA806B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_003:
    JSR $0200            ; 20 00 02 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    EOR $3F00,X          ; 5D 00 3F | Exclusive OR with accumulator (absolute,X)
    ROR $3E00,X          ; 7E 00 3E | Rotate right (absolute,X)
    ROL $2E00,X          ; 3E 00 2E | Rotate left (absolute,X)
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ROL $1C91            ; 2E 91 1C | Rotate left (absolute)
    BMI $0F              ; 30 0F | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_004
; Address: $EA80A0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_004:
    CPX $20              ; E4 20 | Compare X register (zero page)
    BMI $83              ; 30 83 | Branch if negative
    STY $3F              ; 84 3F | Store Y register to zero page
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    BRA $41              ; 80 41 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_005
; Address: $EA80AD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_005:
    BRA $40              ; 80 40 | Branch always
    BRA $DF              ; 80 DF | Branch always
    SBC $65              ; E5 65 | Subtract with carry (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CMP $F739            ; CD 39 F7 | Compare accumulator (absolute)
    BVC $52              ; 50 52 | Branch if overflow clear
    STY $86              ; 84 86 | Store Y register to zero page
    SED                  ; F8 | Set decimal mode flag
    ADC ($9A,X)          ; 61 9A | Add with carry ((zero page,X))
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY $FC              ; C4 FC | Compare Y register (zero page)
    PEA #$D409           ; F4 09 D4 | Push effective address to stack
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    ORA ($C6,X)          ; 01 C6 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF B7 5C 5C | Load from absolute long,X into accumulator
    JMP $23DC5C          ; 5C 5C DC 23 | Jump to address long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_006
; Address: $EA80F2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_006:
    JSR $500B            ; 20 0B 50 | Jump to subroutine
    BMI $09              ; 30 09 | Branch if negative
    ADC $4807            ; 6D 07 48 | Add with carry (absolute)
    ORA $8DA2            ; 0D A2 8D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_007
; Address: $EA80FF
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_007:
    JSL $9C0E9E          ; 22 9E 0E 9C | Jump to subroutine long
    STA $828146          ; 8F 46 81 82 | Store accumulator to absolute long address
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $F101,X          ; FE 01 F1 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    SBC $CD00,X          ; FD 00 CD | Subtract with carry (absolute,X)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    BCC $90              ; 90 90 | Branch if carry clear
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    SBC ($F0),Y          ; F1 F0 | Subtract with carry ((zero page),Y)
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    SEP #$04             ; E2 04 | Set processor status bits
    CMP $0B04,X          ; DD 04 0B | Compare accumulator (absolute,X)
    SEP #$1D             ; E2 1D | Set processor status bits
    CMP $8B22,X          ; DD 22 8B | Compare accumulator (absolute,X)
    SEP #$1C             ; E2 1C | Set processor status bits
    STY $74              ; 84 74 | Store Y register to zero page
    STY $33B3            ; 8C B3 33 | Store Y register to absolute address
    STA                  ; 9F 1F BF 3F | Store accumulator to absolute long,X
    PHB                  ; 8B | Push data bank register to stack
    STA                  ; 9F 1F 3F 00 | Store accumulator to absolute long,X
    LDA                  ; BF 40 7F 80 | Load from absolute long,X into accumulator
    BRA $7F              ; 80 7F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $3F              ; 80 3F | Branch always
    CPY #$E4             ; C0 E4 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    AND ($2E,X)          ; 21 2E | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_008
; Address: $EA8184
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_008:
    BEQ $F1              ; F0 F1 | Branch if equal
    EOR #$48             ; 49 48 | Exclusive OR with accumulator (immediate)
    SBC $F7FC,X          ; FD FC F7 | Subtract with carry (absolute,X)
    STA $F99C,X          ; 9D 9C F9 | Store accumulator to absolute,X
    SED                  ; F8 | Set decimal mode flag
    SBC $FE06,Y          ; F9 06 FE | Subtract with carry (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA $5F42,X          ; BD 42 5F | Load from absolute,X into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    AND #$1D             ; 29 1D | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_009
; Address: $EA81C9
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_009:
    JSL $12001F          ; 22 1F 00 12 | Jump to subroutine long
    ORA $030E            ; 0D 0E 03 | Logical OR with accumulator (absolute)
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    ORA $0312            ; 0D 12 03 | Logical OR with accumulator (absolute)
    ASL $3A0E,X          ; 1E 0E 3A | Arithmetic shift left (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0A10            ; 0E 10 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0E10            ; 0E 10 0E | Arithmetic shift left (absolute)
    BPL $06              ; 10 06 | Branch if positive
    ORA ($02),Y          ; 11 02 | Logical OR with accumulator ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    BCS $F8              ; B0 F8 | Branch if carry set
    LDY #$B8             ; A0 B8 | Load immediate value into Y register
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $B8              ; 50 B8 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $E8              ; 50 E8 | Branch if overflow clear
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $C8              ; 10 C8 | Branch if positive
    BMI $98              ; 30 98 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_00A
; Address: $EA821E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_00A:
    INX                  ; E8 | Increment X register
    BPL $C0              ; 10 C0 | Branch if positive
    LDY $ABFC,X          ; BC FC AB | Load from absolute,X into Y register
    PHX                  ; DA | Push X register to stack
    STA $FFAE,X          ; 9D AE FF | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank54_DmaFunction_00C
; Address: $EA8236
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_00C:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    SBC $D5FF,X          ; FD FF D5 | Subtract with carry (absolute,X)
    LDA $FF75            ; AD 75 FF | Load from absolute address into accumulator
    SBC $F5EB            ; ED EB F5 | Subtract with carry (absolute)
    EOR $00A3,X          ; 5D A3 00 | Exclusive OR with accumulator (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($41,X)          ; 01 41 | Logical OR with accumulator ((zero page,X))
    ORA $2009,Y          ; 19 09 20 | Logical OR with accumulator (absolute,Y)
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    BEQ $5E              ; F0 5E | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ROL $3F              ; 26 3F | Rotate left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $033E,Y          ; 19 3E 03 | Logical OR with accumulator (absolute,Y)
    LSR $0111            ; 4E 11 01 | Logical shift right (absolute)
    BPL $14              ; 10 14 | Branch if positive
    ORA ($54,X)          ; 01 54 | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BRA $92              ; 80 92 | Branch always
    CPY $30              ; C4 30 | Compare Y register (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    SBC $10              ; E5 10 | Subtract with carry (zero page)
    CMP $14              ; C5 14 | Compare accumulator (zero page)
    STX $0161            ; 8E 61 01 | Store X register to absolute address
    ASL $81              ; 06 81 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    BVS $FF              ; 70 FF | Branch if overflow set
    BVS $FF              ; 70 FF | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    AND $9C              ; 25 9C | Logical AND with accumulator (zero page)
    LDY $BD00,X          ; BC 00 BD | Load from absolute,X into Y register
    STA $9B7E            ; 8D 7E 9B | Store accumulator to absolute address
    ROR $3C8B,X          ; 7E 8B 3C | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA $5C00,Y          ; 99 00 5C | Store accumulator to absolute,Y
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))
    ORA ($25,X)          ; 01 25 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 21 07 9D | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank54_DmaFunction_00D
; Address: $EA82EB
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_00D:
    CMP $87              ; C5 87 | Compare accumulator (zero page)
    ADC $11EF,X          ; 7D EF 11 | Add with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    STZ $7C              ; 64 7C | Store zero to zero page
    EOR #$4F             ; 49 4F | Exclusive OR with accumulator (immediate)
    JMP $114C            ; 4C 4C 11 | Jump to address
    EOR ($7F),Y          ; 51 7F | Exclusive OR with accumulator ((zero page),Y)
    BCS $FF              ; B0 FF | Branch if carry set
    LDY $B3FF,X          ; BC FF B3 | Load from absolute,X into Y register
    LDX $80FF            ; AE FF 80 | Load from absolute address into X register
    ORA $E61F,Y          ; 19 1F E6 | Logical OR with accumulator (absolute,Y)
    INC $F2B2,X          ; FE B2 F2 | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    DEX                  ; CA | Decrement X register
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $35FF            ; 0D FF 35 | Logical OR with accumulator (absolute)
    CMP $35FF            ; CD FF 35 | Compare accumulator (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEC $A784,X          ; DE 84 A7 | Decrement (absolute,X)
    AND ($35,X)          ; 21 35 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $1D3D,Y          ; 19 3D 1D | Logical OR with accumulator (absolute,Y)
    EOR $0D09            ; 4D 09 0D | Exclusive OR with accumulator (absolute)
    EOR $0AFE,Y          ; 59 FE 0A | Exclusive OR with accumulator (absolute,Y)
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_00E
; Address: $EA8369
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_00E:
    BRA $60              ; 80 60 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY #$07             ; A0 07 | Load immediate value into Y register
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_00F
; Address: $EA838F
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_00F:
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC $FBFF,Y          ; F9 FF FB | Subtract with carry (absolute,Y)
    INC $78FF,X          ; FE FF 78 | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    ROR $7C9B,X          ; 7E 9B 7C | Rotate right (absolute,X)
    SBC $8146,X          ; FD 46 81 | Subtract with carry (absolute,X)
    WDM #$99             ; 42 99 | Reserved instruction
    BIT $BD              ; 24 BD | Test bits in accumulator (zero page)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDA $30              ; A5 30 | Load from zero page into accumulator
    LSR $421C            ; 4E 1C 42 | Hardware register operation
    ROR $20              ; 66 20 | Rotate right (zero page)
    BMI $6A              ; 30 6A | Branch if negative
    SEC                  ; 38 | Set carry flag
    WDM #$3C             ; 42 3C | Reserved instruction
    LDA $DB00,X          ; BD 00 DB | Load from absolute,X into accumulator
    JMP $015C01          ; 5C 01 5C 01 | Jump to address long
    AND $5F              ; 25 5F | Logical AND with accumulator (zero page)
    ADC ($17,X)          ; 61 17 | Add with carry ((zero page,X))
    AND $1507,X          ; 3D 07 15 | Logical AND with accumulator (absolute,X)
    SBC $916E,X          ; FD 6E 91 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ADC $55AA,X          ; 7D AA 55 | Add with carry (absolute,X)
    LSR $1601,X          ; 5E 01 16 | Logical shift right (absolute,X)
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    STA ($C6),Y          ; 91 C6 | Store accumulator to (zero page),Y
    AND ($67),Y          ; 31 67 | Logical AND with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BRA $7F              ; 80 7F | Branch always
    AND ($DF),Y          ; 31 DF | Logical AND with accumulator ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $D6              ; 10 D6 | Branch if positive
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    INC $11              ; E6 11 | Increment (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1F0A            ; 0E 0A 1F | Arithmetic shift left (absolute)
    ASL $1706,X          ; 1E 06 17 | Arithmetic shift left (absolute,X)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_010
; Address: $EA844C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_010:
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_011
; Address: $EA8452
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_011:
    JSR $203F            ; 20 3F 20 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BIT $203F            ; 2C 3F 20 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_012
; Address: $EA845E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_012:
    JSR $003F            ; 20 3F 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BIT $BF              ; 24 BF | Test bits in accumulator (zero page)
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_013
; Address: $EA848D
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_013:
    JSL $FE8022          ; 22 22 80 FE | Jump to subroutine long
    LDA                  ; BF FF 9D FF | Load from absolute long,X into accumulator
    ORA $00FF,X          ; 1D FF 00 | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    ORA $3A46,X          ; 1D 46 3A | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $3E67            ; 2C 67 3E | Test bits in accumulator (absolute)
    ROR $7D00,X          ; 7E 00 7D | Rotate right (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    ROR $813C,X          ; 7E 3C 81 | Rotate right (absolute,X)
    STA ($42,X)          ; 81 42 | Hardware register operation
    BRA $7F              ; 80 7F | Branch always
    BRA $5F              ; 80 5F | Branch always
    BRA $7F              ; 80 7F | Branch always
    LDA $8100,X          ; BD 00 81 | Load from absolute,X into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA $708F70          ; 8F 70 8F 70 | Store accumulator to absolute long address
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BNE $2F              ; D0 2F | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ROL $06AE            ; 2E AE 06 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_014
; Address: $EA8503
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_014:
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    STA ($D3,X)          ; 81 D3 | Store accumulator to (zero page,X)
    LDA                  ; BF E4 A0 E4 | Load from absolute long,X into accumulator
    LDY #$D6             ; A0 D6 | Load immediate value into Y register
    LDX $E0              ; A6 E0 | Game work RAM access
    LDY $51              ; A4 51 | Load from zero page into Y register
    SBC $00FF,Y          ; F9 FF 00 | Subtract with carry (absolute,Y)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ROR $ECEF            ; 6E EF EC | Rotate right (absolute)
    CPX $01FE            ; EC FE 01 | Compare X register (absolute)
    ROL $FD              ; 26 FD | Rotate left (zero page)
    LSR $4E0D            ; 4E 0D 4E | Logical shift right (absolute)
    ORA $6962            ; 0D 62 69 | Logical OR with accumulator (absolute)
    ASL $104D            ; 0E 4D 10 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_016
; Address: $EA8542
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_016:
    JSL $F50ADD          ; 22 DD 0A F5 | Jump to subroutine long
    LDY $3488,X          ; BC 88 34 | Load from absolute,X into Y register
    LDX $FFFF,Y          ; BE FF FF | Load from absolute,Y into X register
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    NOP                  ; EA | No operation
    BPL $E6              ; 10 E6 | Branch if positive
    ORA ($64),Y          ; 11 64 | Logical OR with accumulator ((zero page),Y)
    ORA ($05),Y          ; 11 05 | Logical OR with accumulator ((zero page),Y)
    BPL $68              ; 10 68 | Branch if positive
    STA $FF1B,Y          ; 99 1B FF | Store accumulator to absolute,Y
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    WDM #$00             ; 42 00 | Reserved instruction
    ROL $11              ; 26 11 | Rotate left (zero page)
    EOR ($10,X)          ; 41 10 | Exclusive OR with accumulator ((zero page,X))
    LSR $1511            ; 4E 11 15 | Logical shift right (absolute)
    CMP ($30,X)          ; C1 30 | Compare accumulator ((zero page,X))
    ORA $11FF,X          ; 1D FF 11 | Logical OR with accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    BMI $50              ; 30 50 | Branch if negative
    BVC $5F              ; 50 5F | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_017
; Address: $EA85AA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_017:
    JSR $205F            ; 20 5F 20 | Jump to subroutine
    ORA $7F37,X          ; 1D 37 7F | Logical OR with accumulator (absolute,X)
    LDA                  ; BF E0 BF E0 | Load from absolute long,X into accumulator
    LDA                  ; BF E0 4F 00 | Load from absolute long,X into accumulator
    BRA $4F              ; 80 4F | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $5F              ; 80 5F | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_018
; Address: $EA85C9
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_018:
    BRA $7F              ; 80 7F | Branch always
    BRA $5F              ; 80 5F | Branch always
    BRA $5F              ; 80 5F | Branch always
    BRA $8F              ; 80 8F | Branch always
    BVS $85              ; 70 85 | Branch if overflow set
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    STA $708F70          ; 8F 70 8F 70 | Store accumulator to absolute long address
    STA $708F70          ; 8F 70 8F 70 | Store accumulator to absolute long address
    STA $01FC70          ; 8F 70 FC 01 | Store accumulator to absolute long address
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $A0              ; E4 A0 | Compare X register (zero page)
    LDY $E0              ; A4 E0 | Game work RAM access
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    LDY #$D4             ; A0 D4 | Load immediate value into Y register
    LDY $E0              ; A4 E0 | Game work RAM access
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA #$42             ; 09 42 | Hardware register operation
    EOR #$0E             ; 49 0E | Exclusive OR with accumulator (immediate)
    EOR $094A            ; 4D 4A 09 | Exclusive OR with accumulator (absolute)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    EOR #$4E             ; 49 4E | Exclusive OR with accumulator (immediate)
    ORA $4942            ; 0D 42 49 | Logical OR with accumulator (absolute)
    BCS $FF              ; B0 FF | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF B4 FB B0 | Load from absolute long,X into accumulator
    BCS $FF              ; B0 FF | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 19 29 09 | Load from absolute long,X into accumulator
    CPX #$C6             ; E0 C6 | Compare X register (immediate)
    LDX #$CA             ; A2 CA | Load immediate value into X register
    LDA ($DC,X)          ; A1 DC | Load from (zero page,X) into accumulator
    LDA ($CC,X)          ; A1 CC | Load from (zero page,X) into accumulator
    LDA ($CC,X)          ; A1 CC | Load from (zero page,X) into accumulator
    LDA ($DE,X)          ; A1 DE | Load from (zero page,X) into accumulator
    LDA ($09,X)          ; A1 09 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_019
; Address: $EA8655
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_019:
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ADC #$69             ; 69 69 | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    ROL $6906            ; 2E 06 69 | Rotate left (absolute)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ASL $21F1,X          ; 1E F1 21 | PPU graphics register access
    BNE $06              ; D0 06 | Branch if not equal
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    BEQ $E2              ; F0 E2 | Branch if equal
    ORA ($86),Y          ; 11 86 | Logical OR with accumulator ((zero page),Y)
    SBC ($C7),Y          ; F1 C7 | Subtract with carry ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    BIT $17              ; 24 17 | Test bits in accumulator (zero page)
    JMP $034828          ; 5C 28 48 03 | Jump to address long
    ORA $3F11            ; 0D 11 3F | Logical OR with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_01A
; Address: $EA86BE
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_01A:
    ASL $E000,X          ; 1E 00 E0 | Game work RAM access
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    LDY #$D0             ; A0 D0 | Load immediate value into Y register
    LDY #$E0             ; A0 E0 | Game work RAM access
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    LDY #$D4             ; A0 D4 | Load immediate value into Y register
    LDY $E0              ; A4 E0 | Game work RAM access
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    ORA #$B0             ; 09 B0 | Logical OR with accumulator (immediate)
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    CPY $CCA1            ; CC A1 CC | Compare Y register (absolute)
    LDA ($D4,X)          ; A1 D4 | Load from (zero page,X) into accumulator
    LDA ($CC,X)          ; A1 CC | Load from (zero page,X) into accumulator
    LDA ($CA,X)          ; A1 CA | Load from (zero page,X) into accumulator
    LDA ($DC,X)          ; A1 DC | Load from (zero page,X) into accumulator
    LDA ($D4,X)          ; A1 D4 | Load from (zero page,X) into accumulator
    LDA ($F0,X)          ; A1 F0 | Load from (zero page,X) into accumulator
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_01B
; Address: $EA8723
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_01B:
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    EOR ($86),Y          ; 51 86 | Exclusive OR with accumulator ((zero page),Y)
    ADC ($C9),Y          ; 71 C9 | Add with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    LDX $A351            ; AE 51 A3 | Load from absolute address into X register
    BVC $E0              ; 50 E0 | Game work RAM access
    ORA ($A5),Y          ; 11 A5 | Logical OR with accumulator ((zero page),Y)
    BEQ $08              ; F0 08 | Branch if equal
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $09              ; 24 09 | Test bits in accumulator (zero page)
    ROL $0C              ; 26 0C | Rotate left (zero page)
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0200            ; 0D 00 02 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BNE $A0              ; D0 A0 | Branch if not equal
    CPX #$A4             ; E0 A4 | Compare X register (immediate)
    CPX $A0              ; E4 A0 | Compare X register (zero page)
    BNE $A0              ; D0 A0 | Branch if not equal
    CPX #$A4             ; E0 A4 | Compare X register (immediate)
    CPX $A0              ; E4 A0 | Compare X register (zero page)
    STA ($80,X)          ; 81 80 | Store accumulator to (zero page,X)
    INC $0081,X          ; FE 81 00 | Increment (absolute,X)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    EOR #$4A             ; 49 4A | Exclusive OR with accumulator (immediate)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    BCS $FF              ; B0 FF | Branch if carry set
    DEC $A5              ; C6 A5 | Decrement (zero page)
    SBC $A0              ; E5 A0 | Subtract with carry (zero page)
    PLX                  ; FA | Pull X register from stack
    BCS $C6              ; B0 C6 | Branch if carry set
    LDX $C0              ; A6 C0 | Load from zero page into X register
    LDA                  ; BF C0 BF 97 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_01C
; Address: $EA87D4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_01C:
    BPL $EF              ; 10 EF | Branch if positive
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    PLB                  ; AB | Pull data bank register from stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROR $A520            ; 6E 20 A5 | Rotate right (absolute)
    LDA $00              ; A5 00 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_01D
; Address: $EA87F4
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_01D:
    JSR $A5DF            ; 20 DF A5 | Jump to subroutine
    PHY                  ; 5A | Push Y register to stack
    INC                  ; 1A | Increment accumulator
    AND #$D0             ; 29 D0 | Logical AND with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    SBC $F11E,X          ; FD 1E F1 | Subtract with carry (absolute,X)
    PEA #$1DE2           ; F4 E2 1D | Push effective address to stack
    SBC $38C7,X          ; FD C7 38 | Subtract with carry (absolute,X)
    LDA $BD5C,X          ; BD 5C BD | Load from absolute,X into accumulator
    JMP $BD58BD          ; 5C BD 58 BD | Jump to address long
    PHY                  ; 5A | Push Y register to stack
    LDA $FD4C,X          ; BD 4C FD | Load from absolute,X into accumulator
    JMP $5CBD            ; 4C BD 5C | Jump to address
    LDA $835A,X          ; BD 5A 83 | Load from absolute,X into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    JMP $015C01          ; 5C 01 5C 01 | Jump to address long
    AND $1F              ; 25 1F | Logical AND with accumulator (zero page)
    STA                  ; 9F 21 03 99 | Store accumulator to absolute long,X
    CMP ($8F,X)          ; C1 8F | Compare accumulator ((zero page,X))
    ADC $11EF,X          ; 7D EF 11 | Add with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $03              ; E4 03 | Compare X register (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $5A9C,X          ; 1D 9C 5A | Logical OR with accumulator (absolute,X)
    STA $B542,Y          ; 99 42 B5 | Store accumulator to absolute,Y
    ROR $1AD9,X          ; 7E D9 1A | Rotate right (absolute,X)
    STA ($66,X)          ; 81 66 | Store accumulator to (zero page,X)
    CMP $24C3,Y          ; D9 C3 24 | Compare accumulator (absolute,Y)
    LDA $DF42,X          ; BD 42 DF | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_01E
; Address: $EA8875
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_01E:
    JSR $6699            ; 20 99 66 | Jump to subroutine
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SBC $C302,X          ; FD 02 C3 | Subtract with carry (absolute,X)
    SBC $02              ; E5 02 | Subtract with carry (zero page)
    CLV                  ; B8 | Clear overflow flag
    TXA                  ; 8A | Transfer X register to accumulator
    CMP ($3C),Y          ; D1 3C | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_01F
; Address: $EA8886
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_01F:
    LDX $B351,Y          ; BE 51 B3 | Load from absolute,Y into X register
    JMP $3515E8          ; 5C E8 15 35 | Jump to address long
    SED                  ; F8 | Set decimal mode flag
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    SEC                  ; 38 | Set carry flag
    ADC $31B7,Y          ; 79 B7 31 | Add with carry (absolute,Y)
    CMP $7A81            ; CD 81 7A | Compare accumulator (absolute)
    WDM #$3C             ; 42 3C | Reserved instruction
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    LDA $BD5C,X          ; BD 5C BD | Load from absolute,X into accumulator
    JMP $BD5AFD          ; 5C FD 5A BD | Jump to address long
    PHY                  ; 5A | Push Y register to stack
    LDA $BD7C,X          ; BD 7C BD | Load from absolute,X into accumulator
    JMP $BD5CBD          ; 5C BD 5C BD | Jump to address long
    CLI                  ; 58 | Clear interrupt disable flag
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    JMP $015C01          ; 5C 01 5C 01 | Jump to address long
    AND $1F              ; 25 1F | Logical AND with accumulator (zero page)
    STA                  ; 9F 21 13 B9 | Store accumulator to absolute long,X
    CMP ($8F),Y          ; D1 8F | Compare accumulator ((zero page),Y)
    ADC $11EE,X          ; 7D EE 11 | Add with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPY $03              ; C4 03 | Compare Y register (zero page)
    CPX $F003            ; EC 03 F0 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    WDM #$FF             ; 42 FF | Reserved instruction
    STA                  ; 9F FB 00 00 | Store accumulator to absolute long,X
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STY $BFFF            ; 8C FF BF | Store Y register to absolute address
    EOR $00FF            ; 4D FF 00 | Exclusive OR with accumulator (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_020
; Address: $EA8948
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_020:
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    EOR ($B7,X)          ; 41 B7 | Exclusive OR with accumulator ((zero page,X))
    ROR $30              ; 66 30 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_021
; Address: $EA895A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_021:
    LDX $FF00,Y          ; BE 00 FF | Load from absolute,Y into X register
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    EOR $7B00,X          ; 5D 00 7B | Exclusive OR with accumulator (absolute,X)
    BRA $04              ; 80 04 | Branch always
    STA $1100            ; 8D 00 11 | Store accumulator to absolute address
    LSR $00A2,X          ; 5E A2 00 | Logical shift right (absolute,X)
    STY $00              ; 84 00 | Store Y register to zero page
    INC $FF00            ; EE 00 FF | Increment (absolute)
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    ADC $FFFF,X          ; 7D FF FF | Add with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_022
; Address: $EA898D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_022:
    JSL $FFFF00          ; 22 00 FF FF | Jump to subroutine long
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    EOR $FFFF,X          ; 5D FF FF | Exclusive OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_023
; Address: $EA89AD
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_023:
    JSL $FFFF00          ; 22 00 FF FF | Jump to subroutine long
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    ORA $1A07            ; 0D 07 1A | Logical OR with accumulator (absolute)
    ASL $1C30            ; 0E 30 1C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_024
; Address: $EA89E9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_024:
    JSR $08F8            ; 20 F8 08 | Jump to subroutine
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $83              ; 06 83 | Arithmetic shift left (zero page)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_027
; Address: $EA8A4B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_027:
    JSR $1F40            ; 20 40 1F | Jump to subroutine
    ADC $0058,X          ; 7D 58 00 | Add with carry (absolute,X)
    JMP ($3F00)          ; 6C 00 3F | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_028
; Address: $EA8A60
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_028:
    ORA #$20             ; 09 20 | Logical OR with accumulator (immediate)
    ASL $BD              ; 06 BD | Arithmetic shift left (zero page)
    ROL $B406,X          ; 3E 06 B4 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    INC $DFE9,X          ; FE E9 DF | Increment (absolute,X)
    REP #$00             ; C2 00 | Reset processor status bits
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_029
; Address: $EA8A82
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_029:
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    AND $217C,X          ; 3D 7C 21 | PPU graphics register access
    ADC $7D2B,X          ; 7D 2B 7D | Add with carry (absolute,X)
    JMP $00803B          ; 5C 3B 80 00 | Jump to address long
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_02A
; Address: $EA8AAB
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_02A:
    JSL $D7EFFF          ; 22 FF EF D7 | Jump to subroutine long
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    JMP ($40FF)          ; 6C FF 40 | Jump to address (absolute indirect)
    ROL $7F              ; 26 7F | Rotate left (zero page)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    BRA $00              ; 80 00 | Branch always
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    LDA                  ; BF 00 00 80 | Load from absolute long,X into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $EF              ; 10 EF | Branch if positive
    EOR ($89,X)          ; 41 89 | Exclusive OR with accumulator ((zero page,X))
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    DEC $E210            ; CE 10 E2 | Decrement (absolute)
    ORA $00FF            ; 0D FF 00 | Logical OR with accumulator (absolute)
    STX $79              ; 86 79 | Store X register to zero page
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    STA $FF66,Y          ; 99 66 FF | Store accumulator to absolute,Y
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA ($42,X)          ; 81 42 | Hardware register operation
    LDA $8100,X          ; BD 00 81 | Load from absolute,X into accumulator
    WDM #$C3             ; 42 C3 | Reserved instruction
    WDM #$FF             ; 42 FF | Reserved instruction
    ROR $0180,X          ; 7E 80 01 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDA $BD00,X          ; BD 00 BD | Load from absolute,X into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDA $1E00,X          ; BD 00 1E | Load from absolute,X into accumulator
    SBC ($21,X)          ; E1 21 | PPU graphics register access
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    EOR ($D9),Y          ; 51 D9 | Exclusive OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_02C
; Address: $EA8B6C
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_02C:
    LDX $C4FF            ; AE FF C4 | Load from absolute address into X register
    INC $007F            ; EE 7F 00 | Increment (absolute)
    SBC $DF00,X          ; FD 00 DF | Subtract with carry (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ROR $8281,X          ; 7E 81 82 | Rotate right (absolute,X)
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    BPL $19              ; 10 19 | Branch if positive
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    INC $CA7F            ; EE 7F CA | Increment (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $00FE            ; EE FE 00 | Increment (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STZ $37              ; 64 37 | Store zero to zero page
    PLP                  ; 28 | Pull processor status from stack
    BPL $1F              ; 10 1F | Branch if positive
    JMP ($173F)          ; 6C 3F 17 | Jump to address (absolute indirect)
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $80              ; F0 80 | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    SBC ($9C),Y          ; F1 9C | Subtract with carry ((zero page),Y)
    BEQ $EA              ; F0 EA | Branch if equal
    BEQ $7C              ; F0 7C | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDA $4200            ; AD 00 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    AND ($F0),Y          ; 31 F0 | Logical AND with accumulator ((zero page),Y)
    LDA $E2FC,X          ; BD FC E2 | Load from absolute,X into accumulator
    SEP #$00             ; E2 00 | Set processor status bits
    AND ($21,X)          ; 21 21 | PPU graphics register access
    BMI $FF              ; 30 FF | Branch if negative
    LDA                  ; BF 00 0F 00 | Load from absolute long,X into accumulator
    ORA $FF00,X          ; 1D 00 FF | Logical OR with accumulator (absolute,X)
    DEC $CF00,X          ; DE 00 CF | Decrement (absolute,X)
    ADC #$0D             ; 69 0D | Add with carry (immediate)
    PLX                  ; FA | Pull X register from stack
    TXA                  ; 8A | Transfer X register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    LSR $4EFC            ; 4E FC 4E | Logical shift right (absolute)
    SEP #$00             ; E2 00 | Set processor status bits
    SBC $F308,X          ; FD 08 F3 | Subtract with carry (absolute,X)
    ASL $0FFB            ; 0E FB 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_02D
; Address: $EA8C18
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_02D:
    ADC $FF07,X          ; 7D 07 FF | Add with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_02E
; Address: $EA8C29
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_02E:
    JSR $340B            ; 20 0B 34 | Jump to subroutine
    BIT $11              ; 24 11 | Test bits in accumulator (zero page)
    BPL $40              ; 10 40 | Branch if positive
    ADC $7F00,Y          ; 79 00 7F | Add with carry (absolute,Y)
    ROL $6F00            ; 2E 00 6F | Rotate left (absolute)
    STZ $1AFF,X          ; 9E FF 1A | Store zero to absolute,X
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $D6DE,Y          ; 19 DE D6 | Logical OR with accumulator (absolute,Y)
    AND $7C96,X          ; 3D 96 7C | Logical AND with accumulator (absolute,X)
    ROR $0000            ; 6E 00 00 | Rotate right (absolute)
    SBC $E700,Y          ; F9 00 E7 | Subtract with carry (absolute,Y)
    REP #$00             ; C2 00 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ORA $1D2A,X          ; 1D 2A 1D | Logical OR with accumulator (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ORA $190A,Y          ; 19 0A 19 | Logical OR with accumulator (absolute,Y)
    ORA $0040            ; 0D 40 00 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_02F
; Address: $EA8C72
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_02F:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    AND $05FF,X          ; 3D FF 05 | Logical AND with accumulator (absolute,X)
    SBC $8000            ; ED 00 80 | Subtract with carry (absolute)
    LDA $BD5A,X          ; BD 5A BD | Load from absolute,X into accumulator
    WDM #$DB             ; 42 DB | Reserved instruction
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ROR $7EBD,X          ; 7E BD 7E | Rotate right (absolute,X)
    ROR $3CAD,X          ; 7E AD 3C | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    INC $EF4A            ; EE 4A EF | Increment (absolute)
    STY $EE              ; 84 EE | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    INC $FE08            ; EE 08 FE | Increment (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_031
; Address: $EA8CCD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_031:
    LDX $EE00            ; AE 00 EE | Load from absolute address into X register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    JMP $2E1F            ; 4C 1F 2E | Jump to address
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_032
; Address: $EA8CF9
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_032:
    JSR $203F            ; 20 3F 20 | Jump to subroutine
    BMI $2F              ; 30 2F | Branch if negative
    AND ($05),Y          ; 31 05 | Logical AND with accumulator ((zero page),Y)
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    ORA $BEDF,Y          ; 19 DF BE | Logical OR with accumulator (absolute,Y)
    STZ $FF12,X          ; 9E 12 FF | Store zero to absolute,X
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STY $73              ; 84 73 | Store Y register to zero page
    STX $E1              ; 86 E1 | Store X register to zero page
    LSR $6DE1,X          ; 5E E1 6D | Logical shift right (absolute,X)
    ROR $7EDF,X          ; 7E DF 7E | Rotate right (absolute,X)
    PLX                  ; FA | Pull X register from stack
    LDA                  ; BF FA FF F4 | Load from absolute long,X into accumulator
    ROR $3E84,X          ; 7E 84 3E | Rotate right (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $FF00FF          ; 5C FF 00 FF | Jump to address long
    ROR $7E80,X          ; 7E 80 7E | Rotate right (absolute,X)
    CPY #$BE             ; C0 BE | Compare Y register (immediate)
    REP #$BE             ; C2 BE | Reset processor status bits
    SEP #$08             ; E2 08 | Set processor status bits
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA $0500            ; 0D 00 05 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $BF              ; 80 BF | Branch always
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    STY $0E              ; 84 0E | Store Y register to zero page
    DEC $2010            ; CE 10 20 | Decrement (absolute)
    BPL $64              ; 10 64 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_034
; Address: $EA8D76
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_034:
    JSR $3100            ; 20 00 31 | Jump to subroutine
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($13),Y          ; 11 13 | Logical OR with accumulator ((zero page),Y)
    BPL $10              ; 10 10 | Branch if positive
    ROL $2E39            ; 2E 39 2E | Rotate left (absolute)
    BIT $2C3F            ; 2C 3F 2C | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_035
; Address: $EA8D9A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_035:
    JSR $2F3F            ; 20 3F 2F | Jump to subroutine
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    LDA                  ; BF 6D F7 2D | Load from absolute long,X into accumulator
    LDA $DEFF            ; AD FF DE | Load from absolute address into accumulator
    DEC $80FF,X          ; DE FF 80 | Decrement (absolute,X)
    AND $92D2            ; 2D D2 92 | Logical AND with accumulator (absolute)
    ADC $7FD2            ; 6D D2 7F | Add with carry (absolute)
    CPX #$D8             ; E0 D8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_036
; Address: $EA8DC2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_036:
    JSR $F420            ; 20 20 F4 | Jump to subroutine
    PEA #$B83C           ; F4 3C B8 | Push effective address to stack
    CPX #$04             ; E0 04 | Compare X register (immediate)
    ASL $DEE6,X          ; 1E E6 DE | Arithmetic shift left (absolute,X)
    INC $FE0A,X          ; FE 0A FE | Increment (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $7EC2,Y          ; BE C2 7E | Load from absolute,Y into X register
    INC $FEFA,X          ; FE FA FE | Increment (absolute,X)
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_037
; Address: $EA8DE4
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_037:
    JSR $6F33            ; 20 33 6F | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ROL $0F              ; 26 0F | Rotate left (zero page)
    BMI $24              ; 30 24 | Branch if negative
    ORA ($2F),Y          ; 11 2F | Logical OR with accumulator ((zero page),Y)
    BPL $3F              ; 10 3F | Branch if positive
    JMP $7F00            ; 4C 00 7F | Jump to address
    ADC $2F00,Y          ; 79 00 2F | Add with carry (absolute,Y)
    ROL $2F00            ; 2E 00 2F | Rotate left (absolute)
    SED                  ; F8 | Set decimal mode flag
    AND $34C6,X          ; 3D C6 34 | Logical AND with accumulator (absolute,X)
    LDY $3CD6,X          ; BC D6 3C | Load from absolute,X into Y register
    ROR $00FD            ; 6E FD 00 | Rotate right (absolute)
    DEX                  ; CA | Decrement X register
    WDM #$00             ; 42 00 | Reserved instruction
    REP #$00             ; C2 00 | Reset processor status bits
    DEX                  ; CA | Decrement X register
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    EOR $2E00,X          ; 5D 00 2E | Exclusive OR with accumulator (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_039
; Address: $EA8E48
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_039:
    BVC $24              ; 50 24 | Branch if overflow clear
    AND ($13,X)          ; 21 13 | Logical AND with accumulator ((zero page,X))
    BIT $19              ; 24 19 | Test bits in accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ROL $3F00,X          ; 3E 00 3F | Rotate left (absolute,X)
    BEQ $03              ; F0 03 | Branch if equal
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CMP $00F5,X          ; DD F5 00 | Compare accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    SEC                  ; 38 | Set carry flag
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    CPY #$22             ; C0 22 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BRA $F0              ; 80 F0 | Branch always
    AND $F802,Y          ; 39 02 F8 | Logical AND with accumulator (absolute,Y)
    SBC ($14,X)          ; E1 14 | Subtract with carry ((zero page,X))
    SBC ($46,X)          ; E1 46 | Subtract with carry ((zero page,X))
    BCS $2A              ; B0 2A | Branch if carry set
    BVC $7F              ; 50 7F | Branch if overflow clear
    SBC ($06),Y          ; F1 06 | Subtract with carry ((zero page),Y)
    BVS $07              ; 70 07 | Branch if overflow set
    EOR $2902,Y          ; 59 02 29 | Exclusive OR with accumulator (absolute,Y)
    BIT $1401            ; 2C 01 14 | Test bits in accumulator (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BPL $0A              ; 10 0A | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    AND $3F00,X          ; 3D 00 3F | Logical AND with accumulator (absolute,X)
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    PHX                  ; DA | Push X register to stack
    PHA                  ; 48 | Push accumulator to stack
    EOR $00A6,Y          ; 59 A6 00 | Exclusive OR with accumulator (absolute,Y)
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BNE $28              ; D0 28 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_03A
; Address: $EA8F04
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_03A:
    PHA                  ; 48 | Push accumulator to stack
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BVC $A0              ; 50 A0 | Branch if overflow clear
    BEQ $20              ; F0 20 | Branch if equal
    BCS $F0              ; B0 F0 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_03B
; Address: $EA8F0E
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_03B:
    BVC $40              ; 50 40 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    BMI $10              ; 30 10 | Branch if negative
    BPL $30              ; 10 30 | Branch if positive
    BVC $70              ; 50 70 | Branch if overflow clear
    BCC $E0              ; 90 E0 | Game work RAM access
    BCS $C0              ; B0 C0 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    BPL $0F              ; 10 0F | Branch if positive
    BMI $04              ; 30 04 | Branch if negative
    BPL $07              ; 10 07 | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BPL $0F              ; 10 0F | Branch if positive
    BMI $04              ; 30 04 | Branch if negative
    BPL $07              ; 10 07 | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    STY $00              ; 84 00 | Store Y register to zero page
    ADC $00              ; 65 00 | Add with carry (zero page)
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    CMP ($FC),Y          ; D1 FC | Compare accumulator ((zero page),Y)
    SBC ($74),Y          ; F1 74 | Subtract with carry ((zero page),Y)
    SBC ($78),Y          ; F1 78 | Subtract with carry ((zero page),Y)
    SBC ($FC),Y          ; F1 FC | Subtract with carry ((zero page),Y)
    SBC ($7C,X)          ; E1 7C | Subtract with carry ((zero page,X))
    CPX #$7B             ; E0 7B | Compare X register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    BMI $FB              ; 30 FB | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BRA $01              ; 80 01 | Branch always
    INC $52AD,X          ; FE AD 52 | Increment (absolute,X)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_03C
; Address: $EA8FCD
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_03C:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $6DE0,X          ; 7D E0 6D | Add with carry (absolute,X)
    INX                  ; E8 | Increment X register
    AND $FA49,Y          ; 39 49 FA | Logical AND with accumulator (absolute,Y)
    CMP ($DA,X)          ; C1 DA | Compare accumulator ((zero page,X))
    CPY #$72             ; C0 72 | Compare Y register (immediate)
    STA ($F6),Y          ; 91 F6 | Store accumulator to (zero page),Y
    EOR $3F02            ; 4D 02 3F | Exclusive OR with accumulator (absolute)
    BRA $1E              ; 80 1E | Branch always
    CPX #$8E             ; E0 8E | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CMP ($E1,X)          ; C1 E1 | Compare accumulator ((zero page,X))
    ADC $FBF1,X          ; 7D F1 FB | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_03D
; Address: $EA900B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_03D:
    JSL $368A3B          ; 22 3B 8A 36 | Jump to subroutine long
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    BNE $0F              ; D0 0F | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_03F
; Address: $EA9021
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_03F:
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    AND ($BC,X)          ; 21 BC | Logical AND with accumulator ((zero page,X))
    ADC $7F78,X          ; 7D 78 7F | Add with carry (absolute,X)
    STZ $1F              ; 64 1F | Store zero to zero page
    CLD                  ; D8 | Clear decimal mode flag
    LDY $1F              ; A4 1F | Load from zero page into Y register
    BNE $8F              ; D0 8F | Branch if not equal
    SBC #$E7             ; E9 E7 | Subtract with carry (immediate)
    BVS $23              ; 70 23 | Branch if overflow set
    CPY #$7B             ; C0 7B | Compare Y register (immediate)
    STY $65              ; 84 65 | Store Y register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $25E6,Y          ; 19 E6 25 | Logical OR with accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_040
; Address: $EA9068
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_040:
    BRA $00              ; 80 00 | Branch always
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BNE $00              ; D0 00 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_041
; Address: $EA907C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_041:
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $D3A9            ; 2E A9 D3 | Rotate left (absolute)
    STA ($BF,X)          ; 81 BF | Store accumulator to (zero page,X)
    BCC $8D              ; 90 8D | Branch if carry clear
    STA $9942,Y          ; 99 42 99 | Store accumulator to absolute,Y
    WDM #$01             ; 42 01 | Reserved instruction
    LSR $28              ; 46 28 | Logical shift right (zero page)
    ROR $6E28,X          ; 7E 28 6E | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    ROR $3C38,X          ; 7E 38 3C | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_042
; Address: $EA90A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_042:
    BRA $C0              ; 80 C0 | Branch always
    BRA $D0              ; 80 D0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $C8              ; D0 C8 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_044
; Address: $EA90B0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_044:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_045
; Address: $EA90B5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_045:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BMI $50              ; 30 50 | Branch if negative
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    INC $241D,X          ; FE 1D 24 | Increment (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $1105            ; 0D 05 11 | Logical OR with accumulator (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BPL $06              ; 10 06 | Branch if positive
    BPL $08              ; 10 08 | Branch if positive
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_046
; Address: $EA9105
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_046:
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    JMP $F17CF1          ; 5C F1 7C F1 | Jump to address long
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BMI $7B              ; 30 7B | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    CLI                  ; 58 | Clear interrupt disable flag
    CPX $7D              ; E4 7D | Compare X register (zero page)
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL $1603            ; 0E 03 16 | Arithmetic shift left (absolute)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $A300,Y          ; 19 00 A3 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_047
; Address: $EA9182
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_047:
    JSL $EF03EE          ; 22 EE 03 EF | Jump to subroutine long
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    EOR ($DB,X)          ; 41 DB | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STY $5C9F            ; 8C 9F 5C | Store Y register to absolute address
    ORA $1C02,X          ; 1D 02 1C | Logical OR with accumulator (absolute,X)
    LDX $BD01,Y          ; BE 01 BD | Load from absolute,Y into X register
    PHP                  ; 08 | Push processor status to stack
    LSR $84              ; 46 84 | Logical shift right (zero page)
    LDY $ECC4,X          ; BC C4 EC | Load from absolute,X into Y register
    DEY                  ; 88 | Decrement Y register
    CPX $E808            ; EC 08 E8 | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    BCC $58              ; 90 58 | Branch if carry clear
    BPL $D0              ; 10 D0 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_048
; Address: $EA91B1
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_048:
    ASL $9C60            ; 0E 60 9C | Arithmetic shift left (absolute)
    CLV                  ; B8 | Clear overflow flag
    BRA $7C              ; 80 7C | Branch always
    BRA $78              ; 80 78 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BVS $80              ; 70 80 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    LDY $1C53            ; AC 53 1C | Load from absolute address into Y register
    STY $23              ; 84 23 | Store Y register to zero page
    STY $53              ; 84 53 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA $E152            ; AD 52 E1 | Load from absolute address into accumulator
    ASL $FE59,X          ; 1E 59 FE | Arithmetic shift left (absolute,X)
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    PLX                  ; FA | Pull X register from stack
    CMP $413A            ; CD 3A 41 | Compare accumulator (absolute)
    LDX $78F3,Y          ; BE F3 78 | Load from absolute,Y into X register
    INX                  ; E8 | Increment X register
    SBC ($78),Y          ; F1 78 | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    LDA                  ; BF 85 E3 00 | Load from absolute long,X into accumulator
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    STA $01F10E          ; 8F 0E F1 01 | Store accumulator to absolute long address
    SEC                  ; 38 | Set carry flag
    BPL $E0              ; 10 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY #$C1             ; C0 C1 | Compare Y register (immediate)
    ORA ($F1,X)          ; 01 F1 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BPL $A0              ; 10 A0 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    NOP                  ; EA | No operation
    LDY #$16             ; A0 16 | Load immediate value into Y register
    LDA $4257,X          ; BD 57 42 | Hardware register operation
    INC $0F08,X          ; FE 08 0F | Increment (absolute,X)
    ORA $8001            ; 0D 01 80 | Logical OR with accumulator (absolute)
    BRA $50              ; 80 50 | Branch always
    PLX                  ; FA | Pull X register from stack
    WDM #$5C             ; 42 5C | Reserved instruction
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_049
; Address: $EA9238
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_049:
    LDX #$5D             ; A2 5D | Load immediate value into X register
    SBC $0B02,X          ; FD 02 0B | Subtract with carry (absolute,X)
    ASL $0007            ; 0E 07 00 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$82EA           ; F4 EA 82 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROR $7C8A,X          ; 7E 8A 7C | Rotate right (absolute,X)
    PEA #$0808           ; F4 08 08 | Push effective address to stack
    BRA $00              ; 80 00 | Branch always
    LDA ($E3),Y          ; B1 E3 | Load from (zero page),Y into accumulator
    LDA $04A9            ; AD A9 04 | Load from absolute address into accumulator
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    LDA #$52             ; A9 52 | Load immediate value into accumulator
    LSR $F280,X          ; 5E 80 F2 | Logical shift right (absolute,X)
    AND ($61,X)          ; 21 61 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_04A
; Address: $EA926F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_04A:
    JSR $381C            ; 20 1C 38 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ROR $5630,X          ; 7E 30 56 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $DA              ; 30 DA | Branch if negative
    BMI $59              ; 30 59 | Branch if negative
    BMI $C8              ; 30 C8 | Branch if negative
    CPX #$D8             ; E0 D8 | Compare X register (immediate)
    BNE $F8              ; D0 F8 | Branch if not equal
    LDY #$70             ; A0 70 | Load immediate value into Y register
    BRA $70              ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_04B
; Address: $EA9289
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_04B:
    JSR $0060            ; 20 60 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    BVC $28              ; 50 28 | Branch if overflow clear
    PLP                  ; 28 | Pull processor status from stack
    BVC $50              ; 50 50 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank54_DmaFunction_04C
; Address: $EA9297
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_04C:
    JSR $40B0            ; 20 B0 40 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    AND $4910,Y          ; 39 10 49 | Logical AND with accumulator (absolute,Y)
    AND $0A4B            ; 2D 4B 0A | Logical AND with accumulator (absolute)
    BVC $9A              ; 50 9A | Branch if overflow clear
    ADC $E134,Y          ; 79 34 E1 | Add with carry (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_04D
; Address: $EA92B4
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_04D:
    ORA #$76             ; 09 76 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $23E6,Y          ; 19 E6 23 | Logical OR with accumulator (absolute,Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $98              ; 05 98 | Logical OR with accumulator (zero page)
    ORA $73F1,Y          ; 19 F1 73 | Logical OR with accumulator (absolute,Y)
    LDX $A6              ; A6 A6 | Load from zero page into X register
    CMP $B35D,X          ; DD 5D B3 | Compare accumulator (absolute,X)
    DEC $C4              ; C6 C4 | Decrement (zero page)
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    LDX $59              ; A6 59 | Load from zero page into X register
    EOR $B3A2,X          ; 5D A2 B3 | Exclusive OR with accumulator (absolute,X)
    JMP $3BC4            ; 4C C4 3B | Jump to address
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ADC $1D78,X          ; 7D 78 1D | Add with carry (absolute,X)
    STA $70E7E9          ; 8F E9 E7 70 | Store accumulator to absolute long address
    SBC $68EB,Y          ; F9 EB 68 | Subtract with carry (absolute,Y)
    CPY $7B              ; C4 7B | Compare Y register (zero page)
    STY $17              ; 84 17 | Store Y register to zero page
    INX                  ; E8 | Increment X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_04E
; Address: $EA931C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_04E:
    JSR $C0C0            ; 20 C0 C0 | Jump to subroutine
    ASL $071C            ; 0E 1C 07 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    BIT $390D            ; 2C 0D 39 | Test bits in accumulator (absolute)
    ORA $0F39,X          ; 1D 39 0F | Logical OR with accumulator (absolute,X)
    BMI $1F              ; 30 1F | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_050
; Address: $EA933C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_050:
    JSR $6400            ; 20 00 64 | Jump to subroutine
    TSX                  ; BA | Transfer stack pointer to X register
    STA                  ; 9F AC 0F A0 | Store accumulator to absolute long,X
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_051
; Address: $EA934E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_051:
    LDA $1A656C          ; AF 6C 65 1A | Load from absolute long address into accumulator
    ORA $017E            ; 0D 7E 01 | Logical OR with accumulator (absolute)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    INC $DF01,X          ; FE 01 DF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_052
; Address: $EA935D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_052:
    JSR $2FD0            ; 20 D0 2F | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    BCS $20              ; B0 20 | Branch if carry set
    BCS $20              ; B0 20 | Branch if carry set
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_054
; Address: $EA936D
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_054:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    STY $53              ; 84 53 | Store Y register to zero page
    STY $23              ; 84 23 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    ADC $01CA,X          ; 7D CA 01 | Add with carry (absolute,X)
    CMP $353A            ; CD 3A 35 | Compare accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    EOR $61FE,Y          ; 59 FE 61 | Exclusive OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    JMP $042838          ; 5C 38 28 04 | Jump to address long
    CLD                  ; D8 | Clear decimal mode flag
    SBC #$07             ; E9 07 | Subtract with carry (immediate)
    ASL $1819,X          ; 1E 19 18 | Arithmetic shift left (absolute,X)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ROR $99              ; 66 99 | Rotate right (zero page)
    SBC $3358,X          ; FD 58 33 | Subtract with carry (absolute,X)
    DEX                  ; CA | Decrement X register
    INC $67              ; E6 67 | Increment (zero page)
    STX $0F              ; 86 0F | Store X register to zero page
    EOR $0DCC            ; 4D CC 0D | Exclusive OR with accumulator (absolute)
    BIT $2C              ; 24 2C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_055
; Address: $EA93D8
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_055:
    ORA $F81F,Y          ; 19 1F F8 | Logical OR with accumulator (absolute,Y)
    SBC $33FF,Y          ; F9 FF 33 | Subtract with carry (absolute,Y)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive
    SEC                  ; 38 | Set carry flag
    BPL $38              ; 10 38 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    BPL $14              ; 10 14 | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STZ $38              ; 64 38 | Store zero to zero page
    JMP ($0038)          ; 6C 38 00 | Jump to address (absolute indirect)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_056
; Address: $EA9458
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_056:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$41             ; E0 41 | Compare X register (immediate)
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    STY $C7              ; 84 C7 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $F3              ; 10 F3 | Branch if positive
    SEP #$74             ; E2 74 | Set processor status bits
    SBC ($26,X)          ; E1 26 | Subtract with carry ((zero page,X))
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    CMP ($4E,X)          ; C1 4E | Compare accumulator ((zero page,X))
    STA ($5E,X)          ; 81 5E | Store accumulator to (zero page,X)
    STZ $BC03            ; 9C 03 BC | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_057
; Address: $EA94A3
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_057:
    EOR ($BE),Y          ; 51 BE | Exclusive OR with accumulator ((zero page),Y)
    CMP ($BD),Y          ; D1 BD | Compare accumulator ((zero page),Y)
    LDA $7306,Y          ; B9 06 73 | Load from absolute,Y into accumulator
    JMP $9CE3            ; 4C E3 9C | Jump to address
    CLV                  ; B8 | Clear overflow flag
    ROR $99              ; 66 99 | Rotate right (zero page)
    LDY $6C93            ; AC 93 6C | Load from absolute address into Y register
    INY                  ; C8 | Increment Y register
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 F3 78 | Load from absolute long,X into accumulator
    CMP ($F8),Y          ; D1 F8 | Compare accumulator ((zero page),Y)
    SBC #$68             ; E9 68 | Subtract with carry (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CMP ($F8),Y          ; D1 F8 | Compare accumulator ((zero page),Y)
    SBC #$68             ; E9 68 | Subtract with carry (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ROL $1E70,X          ; 3E 70 1E | Rotate left (absolute,X)
    LDA ($34,X)          ; A1 34 | Load from (zero page,X) into accumulator
    LDY $55              ; A4 55 | Load from zero page into Y register
    CPY $7D              ; C4 7D | Compare Y register (zero page)
    CPX #$3D             ; E0 3D | Compare X register (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC #$45             ; 69 45 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_058
; Address: $EA9512
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_058:
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    CLV                  ; B8 | Clear overflow flag
    ASL $0AA0,X          ; 1E A0 0A | Arithmetic shift left (absolute,X)
    STZ $C002            ; 9C 02 C0 | Store zero to absolute
    STX $BDF0            ; 8E F0 BD | Store X register to absolute address
    STA ($FD,X)          ; 81 FD | Store accumulator to (zero page,X)
    CMP ($FD,X)          ; C1 FD | Compare accumulator ((zero page,X))
    SBC ($C4),Y          ; F1 C4 | Subtract with carry ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$03             ; E0 03 | Compare X register (immediate)
    BVS $8F              ; 70 8F | Branch if overflow set
    BMI $CF              ; 30 CF | Branch if negative
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $7E              ; E6 7E | Increment (zero page)
    CLC                  ; 18 | Clear carry flag
    STA $FFE7,Y          ; 99 E7 FF | Store accumulator to absolute,Y
    STA ($66,X)          ; 81 66 | Store accumulator to (zero page,X)
    ROR $81              ; 66 81 | Rotate right (zero page)
    STA $FFE7,Y          ; 99 E7 FF | Store accumulator to absolute,Y
    STA $19E6,Y          ; 99 E6 19 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    ROR $99              ; 66 99 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    STA $C166,Y          ; 99 66 C1 | Store accumulator to absolute,Y
    BVC $01              ; 50 01 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    CLD                  ; D8 | Clear decimal mode flag
    LDY #$81             ; A0 81 | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    SEI                  ; 78 | Set interrupt disable flag
    LDA $C0E7E0          ; AF E0 E7 C0 | Load from absolute long address into accumulator
    EOR $82              ; 45 82 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_059
; Address: $EA9596
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_059:
    STA $1B02            ; 8D 02 1B | Store accumulator to absolute address
    BIT $2F              ; 24 2F | Test bits in accumulator (zero page)
    BNE $37              ; D0 37 | Branch if not equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_05A
; Address: $EA95CC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_05A:
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_05B
; Address: $EA95DC
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_05B:
    BCC $60              ; 90 60 | Branch if carry clear
    BNE $20              ; D0 20 | Branch if not equal
    BPL $75              ; 10 75 | Branch if positive
    ORA ($16),Y          ; 11 16 | Logical OR with accumulator ((zero page),Y)
    STA ($D3),Y          ; 91 D3 | Store accumulator to (zero page),Y
    STA ($BF),Y          ; 91 BF | Store accumulator to (zero page),Y
    BCC $8D              ; 90 8D | Branch if carry clear
    STA $9942,Y          ; 99 42 99 | Store accumulator to absolute,Y
    WDM #$6D             ; 42 6D | Reserved instruction
    SEC                  ; 38 | Set carry flag
    INC $6E38            ; EE 38 6E | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    ROR $6E38            ; 6E 38 6E | Rotate right (absolute)
    SEC                  ; 38 | Set carry flag
    ROR $3C38,X          ; 7E 38 3C | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $80              ; 10 80 | Branch if positive
    BVC $80              ; 50 80 | Branch if overflow clear
    BVC $80              ; 50 80 | Branch if overflow clear
    BVC $80              ; 50 80 | Branch if overflow clear
    BPL $80              ; 10 80 | Branch if positive
    BCC $80              ; 90 80 | Branch if carry clear
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDY #$80             ; A0 80 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_05C
; Address: $EA9610
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_05C:
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_05E
; Address: $EA9621
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_05E:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA $119E11          ; 8F 11 9E 11 | Store accumulator to absolute long address
    ASL $1C32,X          ; 1E 32 1C | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_05F
; Address: $EA9647
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_05F:
    JSL $38243C          ; 22 3C 24 38 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    JMP ($3807)          ; 6C 07 38 | Jump to address (absolute indirect)
    JMP $7F00            ; 4C 00 7F | Jump to address
    PHP                  ; 08 | Push processor status to stack
    PEA #$C0C0           ; F4 C0 C0 | Push effective address to stack
    BMI $F0              ; 30 F0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BVS $FF              ; 70 FF | Branch if overflow set
    STA $00FF00          ; 8F 00 FF 00 | Store accumulator to absolute long address
    WDM #$BD             ; 42 BD | Reserved instruction
    LDA $738C,X          ; BD 8C 73 | Load from absolute,X into accumulator
    LDA ($42),Y          ; B1 42 | Hardware register operation
    AND ($42,X)          ; 21 42 | Hardware register operation
    LDA $BD00,X          ; BD 00 BD | Load from absolute,X into accumulator
    LDA $FF00,X          ; BD 00 FF | Load from absolute,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_060
; Address: $EA96C2
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_060:
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    BRA $FA              ; 80 FA | Branch always
    AND $0D02            ; 2D 02 0D | Logical AND with accumulator (absolute)
    JMP $81FF03          ; 5C 03 FF 81 | Jump to address long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    REP #$F6             ; C2 F6 | Reset processor status bits
    PEA #$70C4           ; F4 C4 70 | Push effective address to stack
    STA $801E61          ; 8F 61 1E 80 | Store accumulator to absolute long address
    BEQ $0E              ; F0 0E | Branch if equal
    BEQ $0E              ; F0 0E | Branch if equal
    REP #$3C             ; C2 3C | Reset processor status bits
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    BMI $CC              ; 30 CC | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_061
; Address: $EA9729
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_061:
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_062
; Address: $EA9730
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_062:
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    STA $9967,Y          ; 99 67 99 | Store accumulator to absolute,Y
    STA $6799,Y          ; 99 99 67 | Store accumulator to absolute,Y
    STA ($66,X)          ; 81 66 | Store accumulator to (zero page,X)
    JMP ($A138)          ; 6C 38 A1 | Jump to address (absolute indirect)
    CMP $9867,X          ; DD 67 98 | Compare accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $6766,Y          ; 99 66 67 | Store accumulator to absolute,Y
    TYA                  ; 98 | Transfer Y register to accumulator
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STZ $9B              ; 64 9B | Store zero to zero page

;------------------------------------------------------------------------------
; Bank54_DmaFunction_064
; Address: $EA975F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_064:
    JSL $8FFA83          ; 22 83 FA 8F | Jump to subroutine long
    PEA #$A86F           ; F4 6F A8 | Push effective address to stack
    BMI $3F              ; 30 3F | Branch if negative
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    BVS $7C              ; 70 7C | Branch if overflow set

;------------------------------------------------------------------------------
; Bank54_DmaFunction_065
; Address: $EA976D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_065:
    LDY #$78             ; A0 78 | Load immediate value into Y register
    BRA $06              ; 80 06 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    AND #$56             ; 29 56 | Logical AND with accumulator (immediate)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    STY $D02C            ; 8C 2C D0 | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_066
; Address: $EA97A2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_066:
    BMI $00              ; 30 00 | Branch if negative
    BVS $20              ; 70 20 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $3C              ; 10 3C | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_067
; Address: $EA97B2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_067:
    BMI $00              ; 30 00 | Branch if negative
    BVC $20              ; 50 20 | Branch if overflow clear
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BIT $3C10            ; 2C 10 3C | Test bits in accumulator (absolute)
    LDA ($E3),Y          ; B1 E3 | Load from (zero page),Y into accumulator
    LDA $14A9            ; AD A9 14 | Load from absolute address into accumulator
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    LDA #$52             ; A9 52 | Load immediate value into accumulator
    ROR $8280            ; 6E 80 82 | Rotate right (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ROR $5630            ; 6E 30 56 | Rotate right (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_068
; Address: $EA97E0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_068:
    JSR $2080            ; 20 80 20 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_06A
; Address: $EA97F4
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_06A:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_06B
; Address: $EA97FC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_06B:
    BRA $00              ; 80 00 | Branch always
    ASL $0C00            ; 0E 00 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $1105,X          ; 1D 05 11 | Logical OR with accumulator (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $1B11,Y          ; 19 11 1B | Logical OR with accumulator (absolute,Y)
    ASL $0C01            ; 0E 01 0C | Arithmetic shift left (absolute)
    ORA $1902,X          ; 1D 02 19 | Logical OR with accumulator (absolute,X)
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    AND ($06,X)          ; 21 06 | Logical AND with accumulator ((zero page,X))
    SBC $EA72            ; ED 72 EA | Subtract with carry (absolute)
    PEA #$6661           ; F4 61 66 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_06C
; Address: $EA9826
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_06C:
    JSR $616F            ; 20 6F 61 | Jump to subroutine
    DEC $9CC3            ; CE C3 9C | Decrement (absolute)
    LDY #$1C             ; A0 1C | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BRA $3F              ; 80 3F | Branch always
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_06D
; Address: $EA984D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_06D:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_06E
; Address: $EA986F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_06E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $2300,Y          ; 19 00 23 | Logical OR with accumulator (absolute,Y)
    TAX                  ; AA | Transfer accumulator to X register
    EOR ($EB,X)          ; 41 EB | Exclusive OR with accumulator ((zero page,X))
    SBC #$50             ; E9 50 | Subtract with carry (immediate)
    JMP $5F08            ; 4C 08 5F | Jump to address
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_06F
; Address: $EA98AD
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_06F:
    TYA                  ; 98 | Transfer Y register to accumulator
    LDA $025D9F          ; AF 9F 5D 02 | Load from absolute long address into accumulator
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 B7 08 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $0F              ; 70 0F | Branch if overflow set
    PEA #$EC04           ; F4 04 EC | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    LDY $28C8            ; AC C8 28 | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    BPL $D8              ; 10 D8 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $80              ; 10 80 | Branch if positive
    STY $78              ; 84 78 | Store Y register to zero page
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BIT $0D36            ; 2C 36 0D | Test bits in accumulator (absolute)
    ROL $09              ; 26 09 | Rotate left (zero page)
    ROL $51              ; 26 51 | Rotate left (zero page)
    ASL $51              ; 06 51 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    EOR $5900,Y          ; 59 00 59 | Exclusive OR with accumulator (absolute,Y)
    ADC $6800,Y          ; 79 00 68 | Add with carry (absolute,Y)
    BPL $08              ; 10 08 | Branch if positive
    BPL $F4              ; 10 F4 | Branch if positive
    BMI $E4              ; 30 E4 | Branch if negative
    BVS $64              ; 70 64 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY $8C00            ; CC 00 8C | Compare Y register (absolute)
    STY $9400            ; 8C 00 94 | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_070
; Address: $EA9922
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_070:
    CPX #$80             ; E0 80 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_073
; Address: $EA9934
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_073:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_074
; Address: $EA9946
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_074:
    CLV                  ; B8 | Clear overflow flag
    BMI $F8              ; 30 F8 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BVC $A0              ; 50 A0 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    BCC $38              ; 90 38 | Branch if carry clear
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    BPL $A0              ; 10 A0 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    ASL $1E08,X          ; 1E 08 1E | Arithmetic shift left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL $0C00,X          ; 1E 00 0C | Arithmetic shift left (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_075
; Address: $EA9987
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_075:
    JSR $D000            ; 20 00 D0 | Jump to subroutine
    BNE $40              ; D0 40 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_076
; Address: $EA998F
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_076:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    ROL $4439            ; 2E 39 44 | Rotate left (absolute)
    ADC $F040,Y          ; 79 40 F0 | Add with carry (absolute,Y)
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    EOR ($E0),Y          ; 51 E0 | Game work RAM access
    CPY #$E7             ; C0 E7 | Compare Y register (immediate)
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_077
; Address: $EA99E2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_077:
    STY $0672            ; 8C 72 06 | Store Y register to absolute address
    SBC $BC43,Y          ; F9 43 BC | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_078
; Address: $EA99E9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_078:
    STA                  ; 9F 58 87 0F | Store accumulator to absolute long,X
    CPY #$AF             ; C0 AF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    ROL $1E00,X          ; 3E 00 1E | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_079
; Address: $EA9A05
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_079:
    JSR $9815            ; 20 15 98 | Jump to subroutine
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    STA ($FB,X)          ; 81 FB | Store accumulator to (zero page,X)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SBC $F806,Y          ; F9 06 F8 | Subtract with carry (absolute,Y)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    ASL $0F1C            ; 0E 1C 0F | Arithmetic shift left (absolute)
    AND #$07             ; 29 07 | Logical AND with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack
    ORA $1528            ; 0D 28 15 | Logical OR with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ASL $0019,X          ; 1E 19 00 | Arithmetic shift left (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_07A
; Address: $EA9A5A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_07A:
    JSL $002000          ; 22 00 20 00 | Jump to subroutine long
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    LDY #$07             ; A0 07 | Load immediate value into Y register
    LDY $2702            ; AC 02 27 | Load from absolute address into Y register
    RTI                  ; 40 | Return from interrupt
    BMI $23              ; 30 23 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_07B
; Address: $EA9A6D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_07B:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROR $7201,X          ; 7E 01 72 | Rotate right (absolute,X)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_07C
; Address: $EA9A79
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_07C:
    JSR $23DC            ; 20 DC 23 | Jump to subroutine
    BNE $10              ; D0 10 | Branch if not equal
    BCS $20              ; B0 20 | Branch if carry set
    BCS $20              ; B0 20 | Branch if carry set
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_07E
; Address: $EA9A8D
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_07E:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_07F
; Address: $EA9A91
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_07F:
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$79             ; C0 79 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_080
; Address: $EA9AA1
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_080:
    JSL $693279          ; 22 79 32 69 | Jump to subroutine long
    AND $3165,Y          ; 39 65 31 | Logical AND with accumulator (absolute,Y)
    AND ($2F),Y          ; 31 2F | Logical AND with accumulator ((zero page),Y)
    BMI $27              ; 30 27 | Branch if negative
    BMI $67              ; 30 67 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    JMP $4400            ; 4C 00 44 | Jump to address
    LSR $00              ; 46 00 | Logical shift right (zero page)
    LSR $4A00            ; 4E 00 4A | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    CMP $02              ; C5 02 | Compare accumulator (zero page)
    SBC $EC06            ; ED 06 EC | Subtract with carry (absolute)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    ASL $FD              ; 06 FD | Arithmetic shift left (zero page)
    SBC $6D4C,Y          ; F9 4C 6D | Subtract with carry (absolute,Y)
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ADC $7900,Y          ; 79 00 79 | Add with carry (absolute,Y)
    AND $3100,Y          ; 39 00 31 | Logical AND with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ROR $3C              ; 66 3C | Rotate right (zero page)
    PLY                  ; 7A | Pull Y register from stack
    LSR $3C7E,X          ; 5E 7E 3C | Logical shift right (absolute,X)
    ROR $7E34,X          ; 7E 34 7E | Rotate right (absolute,X)
    BIT #$7E             ; 89 7E | Test bits in accumulator (immediate)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    AND $3F              ; 25 3F | Logical AND with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    REP #$00             ; C2 00 | Reset processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_081
; Address: $EA9B25
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_081:
    BVS $3B              ; 70 3B | Branch if overflow set
    CPY #$58             ; C0 58 | Compare Y register (immediate)
    BRA $6E              ; 80 6E | Branch always
    LDA $C43FEE          ; AF EE 3F C4 | Load from absolute long address into accumulator
    ROL $007F            ; 2E 7F 00 | Rotate left (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $3C33,X          ; 1E 33 3C | Arithmetic shift left (absolute,X)
    LSR $EC78            ; 4E 78 EC | Logical shift right (absolute)
    BEQ $99              ; F0 99 | Branch if equal
    CPX #$73             ; E0 73 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_082
; Address: $EA9B74
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_082:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($CE,X)          ; 81 CE | Store accumulator to (zero page,X)
    STA                  ; 9F 04 3B 04 | Store accumulator to absolute long,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC ($2B),Y          ; 71 2B | Add with carry ((zero page),Y)
    BNE $21              ; D0 21 | PPU graphics register access
    CLD                  ; D8 | Clear decimal mode flag
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    INC $8700,X          ; FE 00 87 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_083
; Address: $EA9BA3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_083:
    BIT $E3              ; 24 E3 | Test bits in accumulator (zero page)
    ADC ($8B),Y          ; 71 8B | Add with carry ((zero page),Y)
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    BVS $FF              ; 70 FF | Branch if overflow set
    PLX                  ; FA | Pull X register from stack
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    LSR $5E88            ; 4E 88 5E | Logical shift right (absolute)
    LDY $BC10,X          ; BC 10 BC | Load from absolute,X into Y register
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_084
; Address: $EA9BCF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_084:
    JSR $38C7            ; 20 C7 38 | Jump to subroutine
    ASL $06F1            ; 0E F1 06 | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    STY $0C72            ; 8C 72 0C | Store Y register to absolute address
    BEQ $38              ; F0 38 | Branch if equal
    CPY $18              ; C4 18 | Compare Y register (zero page)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $0A              ; 50 0A | Branch if overflow clear
    BVC $3E              ; 50 3E | Branch if overflow clear
    STZ $36              ; 64 36 | Store zero to zero page
    LDX #$3E             ; A2 3E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_085
; Address: $EA9BEA
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_085:
    LDA ($14,X)          ; A1 14 | Load from (zero page,X) into accumulator
    LDX #$55             ; A2 55 | Load immediate value into X register
    LDY #$5D             ; A0 5D | Load immediate value into Y register
    ADC $00              ; 65 00 | Add with carry (zero page)
    ADC $00              ; 65 00 | Add with carry (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    LDA                  ; BF 5C 1F 80 | Load from absolute long,X into accumulator
    ASL $0598            ; 0E 98 05 | Arithmetic shift left (absolute)
    DEC $E000            ; CE 00 E0 | Game work RAM access
    LSR $B8              ; 46 B8 | Logical shift right (zero page)
    INC $BD80,X          ; FE 80 BD | Increment (absolute,X)
    STA ($E3,X)          ; 81 E3 | Store accumulator to (zero page,X)
    CPX $0B              ; E4 0B | Compare X register (zero page)
    BEQ $01              ; F0 01 | Branch if equal
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    BVS $8F              ; 70 8F | Branch if overflow set
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    ADC $6D28            ; 6D 28 6D | Add with carry (absolute)
    BIT $2E4D            ; 2C 4D 2E | Test bits in accumulator (absolute)
    EOR $8D06            ; 4D 06 8D | Exclusive OR with accumulator (absolute)
    ASL $5F8D            ; 0E 8D 5F | Arithmetic shift left (absolute)
    PHB                  ; 8B | Push data bank register to stack
    BVC $00              ; 50 00 | Branch if overflow clear
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC #$4C             ; E9 4C | Subtract with carry (immediate)
    SBC ($5C),Y          ; F1 5C | Subtract with carry ((zero page),Y)
    SBC ($5C),Y          ; F1 5C | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_086
; Address: $EA9C66
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_086:
    CMP ($DC),Y          ; D1 DC | Compare accumulator ((zero page),Y)
    CMP ($54),Y          ; D1 54 | Compare accumulator ((zero page),Y)
    CMP ($58),Y          ; D1 58 | Compare accumulator ((zero page),Y)
    CMP ($6C,X)          ; C1 6C | Compare accumulator ((zero page,X))
    SBC ($6C,X)          ; E1 6C | Subtract with carry ((zero page,X))
    REP #$01             ; C2 01 | Reset processor status bits
    BIT $3AD2            ; 2C D2 3A | Test bits in accumulator (absolute)
    CMP ($58,X)          ; C1 58 | Compare accumulator ((zero page,X))
    BRA $6E              ; 80 6E | Branch always
    LDA $C43FEE          ; AF EE 3F C4 | Load from absolute long address into accumulator
    ROL $00FE            ; 2E FE 00 | Rotate left (absolute)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BNE $00              ; D0 00 | Branch if not equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ROR $BD81,X          ; 7E 81 BD | Rotate right (absolute,X)
    ROR $2400,X          ; 7E 00 24 | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    PHY                  ; 5A | Push Y register to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $1D0F            ; 0E 0F 1D | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    DEC $FDF0            ; CE F0 FD | Decrement (absolute)
    CPX #$BB             ; E0 BB | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_087
; Address: $EA9CF4
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_087:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($66,X)          ; C1 66 | Compare accumulator ((zero page,X))
    STA ($CE,X)          ; 81 CE | Store accumulator to (zero page,X)
    STA $3C02,X          ; 9D 02 3C | Store accumulator to absolute,X
    ROR $FB04,X          ; 7E 04 FB | Rotate right (absolute,X)
    STA $001F,X          ; 9D 1F 00 | Store accumulator to absolute,X
    BPL $EC              ; 10 EC | Branch if positive
    INC                  ; 1A | Increment accumulator
    CPX $8C              ; E4 8C | Compare X register (zero page)
    INC $19              ; E6 19 | Increment (zero page)
    ADC $3F06,Y          ; 79 06 3F | Add with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_088
; Address: $EA9D2D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_088:
    JSR $B02F            ; 20 2F B0 | Jump to subroutine
    LDX $DF01,Y          ; BE 01 DF | Load from absolute,Y into X register
    INY                  ; C8 | Increment Y register
    BRA $BE              ; 80 BE | Branch always
    CPY #$66             ; C0 66 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_089
; Address: $EA9D46
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_089:
    ORA $30              ; 05 30 | Logical OR with accumulator (zero page)
    SBC $FB01            ; ED 01 FB | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_08A
; Address: $EA9D52
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_08A:
    JSR $981F            ; 20 1F 98 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $40              ; F0 40 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BVS $88              ; 70 88 | Branch if overflow set
    BMI $C0              ; 30 C0 | Branch if negative
    CPX #$10             ; E0 10 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_08C
; Address: $EA9D79
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_08C:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX $7D              ; E4 7D | Compare X register (zero page)
    RTI                  ; 40 | Return from interrupt
    AND $2940            ; 2D 40 29 | Logical AND with accumulator (absolute)
    AND #$48             ; 29 48 | Logical AND with accumulator (immediate)
    CMP ($FB,X)          ; C1 FB | Compare accumulator ((zero page,X))
    STA ($5B,X)          ; 81 5B | Store accumulator to (zero page,X)
    STA ($F2),Y          ; 91 F2 | Store accumulator to (zero page),Y
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ROL $01              ; 26 01 | Rotate left (zero page)
    LDA $FF01,X          ; BD 01 FF | Load from absolute,X into accumulator
    ADC ($7D),Y          ; 71 7D | Add with carry ((zero page),Y)
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    EOR ($15,X)          ; 41 15 | Exclusive OR with accumulator ((zero page,X))
    AND $8207,Y          ; 39 07 82 | Logical AND with accumulator (absolute,Y)
    SEP #$FB             ; E2 FB | Set processor status bits

;------------------------------------------------------------------------------
; Bank54_DmaFunction_08D
; Address: $EA9DD0
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_08D:
    BEQ $0F              ; F0 0F | Branch if equal
    STY $F073            ; 8C 73 F0 | Store Y register to absolute address
    BCS $0F              ; B0 0F | Branch if carry set
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ASL $E1              ; 06 E1 | Arithmetic shift left (zero page)
    ASL $0080,X          ; 1E 80 00 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ROL $3687,X          ; 3E 87 36 | Rotate left (absolute,X)
    ROL $8B              ; 26 8B | Rotate left (zero page)
    ROL $9B              ; 26 9B | Rotate left (zero page)
    ASL $1E8D,X          ; 1E 8D 1E | Arithmetic shift left (absolute,X)
    ROL $3E8F,X          ; 3E 8F 3E | Rotate left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    BNE $00              ; D0 00 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($6C,X)          ; E1 6C | Subtract with carry ((zero page,X))
    SBC ($6C,X)          ; E1 6C | Subtract with carry ((zero page,X))
    SBC ($6C,X)          ; E1 6C | Subtract with carry ((zero page,X))
    SBC ($6C,X)          ; E1 6C | Subtract with carry ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    SBC ($78,X)          ; E1 78 | Subtract with carry ((zero page,X))
    SBC ($F4),Y          ; F1 F4 | Subtract with carry ((zero page),Y)
    SBC ($F4),Y          ; F1 F4 | Subtract with carry ((zero page),Y)
    INY                  ; C8 | Increment Y register
    ROL $2FCA            ; 2E CA 2F | Rotate left (absolute)
    CPY $2E              ; C4 2E | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    ROL $3EC8            ; 2E C8 3E | Rotate left (absolute)
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    CPY $2E              ; C4 2E | Compare Y register (zero page)
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    BNE $00              ; D0 00 | Branch if not equal
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_08E
; Address: $EA9E5E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_08E:
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $2E              ; 05 2E | Logical OR with accumulator (zero page)
    JMP $3E5817          ; 5C 17 58 3E | Jump to address long
    LDA ($7E),Y          ; B1 7E | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_08F
; Address: $EA9E6E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_08F:
    JSL $000439          ; 22 39 04 00 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_090
; Address: $EA9E76
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_090:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPY #$77             ; C0 77 | Compare Y register (immediate)
    BRA $EF              ; 80 EF | Branch always
    LDA                  ; BF 4A B5 9A | Load from absolute long,X into accumulator
    ADC $05              ; 65 05 | Add with carry (zero page)
    BNE $0F              ; D0 0F | Branch if not equal
    STY $C609            ; 8C 09 C6 | Store Y register to absolute address
    ASL $07E1            ; 0E E1 07 | Arithmetic shift left (absolute)
    CPX #$43             ; E0 43 | Compare X register (immediate)
    CLV                  ; B8 | Clear overflow flag
    AND $12D6            ; 2D D6 12 | Logical AND with accumulator (absolute)
    CPY $FF31            ; CC 31 FF | Compare Y register (absolute)
    SBC $F800,Y          ; F9 00 F8 | Subtract with carry (absolute,Y)
    INC $1700,X          ; FE 00 17 | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    CMP ($2C,X)          ; C1 2C | Compare accumulator ((zero page,X))
    INC $FD00,X          ; FE 00 FD | Increment (absolute,X)
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPX #$07             ; E0 07 | Compare X register (immediate)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STX $79              ; 86 79 | Store X register to zero page
    DEC $BC10,X          ; DE 10 BC | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_091
; Address: $EA9EE3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_091:
    JSR $4078            ; 20 78 40 | Jump to subroutine
    BEQ $80              ; F0 80 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPX $30              ; E4 30 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_093
; Address: $EA9EF9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_093:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    BPL $3F              ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_095
; Address: $EA9F0B
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_095:
    ADC $7B22,Y          ; 79 22 7B | Add with carry (absolute,Y)
    BIT $6E              ; 24 6E | Test bits in accumulator (zero page)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $1D0F,X          ; 1E 0F 1D | Arithmetic shift left (absolute,X)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    LDA $BE              ; A5 BE | Load from zero page into accumulator
    ADC $FE              ; 65 FE | Add with carry (zero page)
    LDY $F7              ; A4 F7 | Load from zero page into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$59             ; E0 59 | Compare X register (immediate)
    BEQ $99              ; F0 99 | Branch if equal
    BEQ $59              ; F0 59 | Branch if equal
    CPX #$02             ; E0 02 | Compare X register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA ($52,X)          ; 81 52 | Store accumulator to (zero page,X)
    BIT #$52             ; 89 52 | Test bits in accumulator (immediate)
    STA $B0              ; 85 B0 | Store accumulator to zero page
    BIT $E1              ; 24 E1 | Test bits in accumulator (zero page)
    LDY $10              ; A4 10 | Load from zero page into Y register
    INC $2F              ; E6 2F | Increment (zero page)
    ORA $0F02            ; 0D 02 0F | Logical OR with accumulator (absolute)
    ASL $5F00,X          ; 1E 00 5F | Arithmetic shift left (absolute,X)
    CPY $F6              ; C4 F6 | Compare Y register (zero page)
    CPX $16              ; E4 16 | Compare X register (zero page)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP $3CC2            ; CD C2 3C | Compare accumulator (absolute)
    REP #$3C             ; C2 3C | Reset processor status bits
    SEP #$1C             ; E2 1C | Set processor status bits
    STA ($FD,X)          ; 81 FD | Store accumulator to (zero page,X)
    PEA #$70E1           ; F4 E1 70 | Push effective address to stack
    SEI                  ; 78 | Set interrupt disable flag
    SBC ($7D),Y          ; F1 7D | Subtract with carry ((zero page),Y)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_096
; Address: $EA9FC0
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_096:
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    SBC ($FC,X)          ; E1 FC | Subtract with carry ((zero page,X))
    SBC ($78),Y          ; F1 78 | Subtract with carry ((zero page),Y)
    BIT $1D              ; 24 1D | Test bits in accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    LDY $60CF,X          ; BC CF 60 | Load from absolute,X into Y register
    BCC $03              ; 90 03 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    CPX $3D              ; E4 3D | Compare X register (zero page)
    REP #$10             ; C2 10 | Reset processor status bits
    STA ($3C),Y          ; 91 3C | Store accumulator to (zero page),Y
    REP #$11             ; C2 11 | Reset processor status bits
    WDM #$91             ; 42 91 | Reserved instruction
    STA ($42,X)          ; 81 42 | Hardware register operation
    WDM #$FF             ; 42 FF | Reserved instruction
    LSR $7FC2,X          ; 5E C2 7F | Logical shift right (absolute,X)
    LDA $BD00,X          ; BD 00 BD | Load from absolute,X into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPY #$2A             ; C0 2A | Compare Y register (immediate)
    CPY #$2C             ; C0 2C | Compare Y register (immediate)
    BNE $0A              ; D0 0A | Branch if not equal
    BNE $0A              ; D0 0A | Branch if not equal
    EOR ($88),Y          ; 51 88 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA $0F1E            ; 0D 1E 0F | Logical OR with accumulator (absolute)
    BIT $0116            ; 2C 16 01 | Test bits in accumulator (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    STZ $BB              ; 64 BB | Store zero to zero page
    BIT #$56             ; 89 56 | Test bits in accumulator (immediate)
    DEX                  ; CA | Decrement X register
    CPX $52              ; E4 52 | Compare X register (zero page)
    CPX $9C02            ; EC 02 9C | Compare X register (absolute)
    CMP $BA              ; C5 BA | Compare accumulator (zero page)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    NOP                  ; EA | No operation
    INY                  ; C8 | Increment Y register
    STZ $DA              ; 64 DA | Store zero to zero page
    JMP $607F            ; 4C 7F 60 | Jump to address
    LDY #$2F             ; A0 2F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_097
; Address: $EAA072
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_097:
    ADC $3C80,X          ; 7D 80 3C | Add with carry (absolute,X)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 9F 60 | Load from absolute long,X into accumulator
    JMP $07B823          ; 5C 23 B8 07 | Jump to address long
    BRA $BE              ; 80 BE | Branch always
    CPY #$5D             ; C0 5D | Compare Y register (immediate)
    ADC ($BB,X)          ; 61 BB | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $1F              ; 80 1F | Branch always
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    JMP $03A838          ; 5C 38 A8 03 | Jump to address long
    SBC $7B              ; E5 7B | Subtract with carry (zero page)
    ADC ($D7,X)          ; 61 D7 | Add with carry ((zero page,X))
    WDM #$FF             ; 42 FF | Reserved instruction
    PHX                  ; DA | Push X register to stack
    STZ $BCFF,X          ; 9E FF BC | Store zero to absolute,X
    LDA $51FF,X          ; BD FF 51 | Load from absolute,X into accumulator
    EOR $2438,Y          ; 59 38 24 | Exclusive OR with accumulator (absolute,Y)
    ORA ($0B),Y          ; 11 0B | Logical OR with accumulator ((zero page),Y)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $074F            ; 0E 4F 07 | Arithmetic shift left (absolute)
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA $090E            ; 0D 0E 09 | Logical OR with accumulator (absolute)
    ASL $0F0B            ; 0E 0B 0F | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $EF88            ; 6D 88 EF | Add with carry (absolute)
    STA ($EE,X)          ; 81 EE | Store accumulator to (zero page,X)
    LDX #$FC             ; A2 FC | Load immediate value into X register
    STY $D8              ; 84 D8 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank54_DmaFunction_098
; Address: $EAA0EA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_098:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $F3              ; F0 F3 | Branch if equal
    CPY #$73             ; C0 73 | Compare Y register (immediate)
    BRA $77              ; 80 77 | Branch always
    CPX #$5E             ; E0 5E | Compare X register (immediate)
    BEQ $7C              ; F0 7C | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_099
; Address: $EAA0FE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_099:
    BVS $A0              ; 70 A0 | Branch if overflow set
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_09A
; Address: $EAA10A
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_09A:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $EF              ; 24 EF | Test bits in accumulator (zero page)
    SBC $E927            ; ED 27 E9 | Subtract with carry (absolute)
    EOR $4DE8            ; 4D E8 4D | Exclusive OR with accumulator (absolute)
    CPY #$15             ; C0 15 | Compare Y register (immediate)
    CPY #$42             ; C0 42 | Hardware register operation
    CMP ($41),Y          ; D1 41 | Compare accumulator ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    AND $7E00,X          ; 3D 00 7E | Logical AND with accumulator (absolute,X)
    STY $EE              ; 84 EE | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    CPX $FC08            ; EC 08 FC | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    CPX $EC08            ; EC 08 EC | Compare X register (absolute)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SEP #$1C             ; E2 1C | Set processor status bits
    STY $7A              ; 84 7A | Store Y register to zero page
    STY $78              ; 84 78 | Store Y register to zero page
    CPY $38              ; C4 38 | Compare Y register (zero page)
    STY $78              ; 84 78 | Store Y register to zero page
    STY $78              ; 84 78 | Store Y register to zero page
    CPX $18              ; E4 18 | Compare X register (zero page)
    STY $78              ; 84 78 | Store Y register to zero page
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FC08,X          ; FE 08 FC | Increment (absolute,X)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CMP #$1B             ; C9 1B | Compare accumulator (immediate)
    CPX $EB              ; E4 EB | Compare X register (zero page)
    ORA $0AF2            ; 0D F2 0A | Logical OR with accumulator (absolute)
    PEA #$30CC           ; F4 CC 30 | Push effective address to stack
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $00              ; 65 00 | Add with carry (zero page)
    JMP $0D653E          ; 5C 3E 65 0D | Jump to address long
    SBC $A3F8,X          ; FD F8 A3 | Subtract with carry (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    BIT $34              ; 24 34 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_09B
; Address: $EAA1BE
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_09B:
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    ROL $3E7C            ; 2E 7C 3E | Rotate left (absolute)
    LDA ($5C),Y          ; B1 5C | Load from (zero page),Y into accumulator
    PLA                  ; 68 | Pull accumulator from stack
    LDA $FBF0,Y          ; B9 F0 FB | Load from absolute,Y into accumulator
    CPY $73              ; C4 73 | Compare Y register (zero page)
    LDY #$E7             ; A0 E7 | Load immediate value into Y register
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ADC $FD12,X          ; 7D 12 FD | Add with carry (absolute,X)
    ADC $5E9E,Y          ; 79 9E 5E | Add with carry (absolute,Y)
    STA $C80F,Y          ; 99 0F C8 | Store accumulator to absolute,Y
    PLA                  ; 68 | Pull accumulator from stack
    LDY $00FF            ; AC FF 00 | Load from absolute address into Y register
    BPL $E7              ; 10 E7 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    ORA $F6              ; 05 F6 | Logical OR with accumulator (zero page)
    ORA ($F2,X)          ; 01 F2 | Logical OR with accumulator ((zero page,X))
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_09C
; Address: $EAA201
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_09C:
    JSR $B857            ; 20 57 B8 | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    JMP $8076            ; 4C 76 80 | Jump to address
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    JMP ($B644)          ; 6C 44 B6 | Jump to address (absolute indirect)
    LDA #$E0             ; A9 E0 | Game work RAM access
    BCS $80              ; B0 80 | Branch if carry set

;------------------------------------------------------------------------------
; Bank54_DmaFunction_09D
; Address: $EAA229
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_09D:
    JSR $4040            ; 20 40 40 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_09E
; Address: $EAA234
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_09E:
    LSR $50FF,X          ; 5E FF 50 | Logical shift right (absolute,X)
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_09F
; Address: $EAA24C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_09F:
    ASL $020B            ; 0E 0B 02 | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A0
; Address: $EAA262
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A0:
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A1
; Address: $EAA26A
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A1:
    JSR $80E0            ; 20 E0 80 | Jump to subroutine
    BNE $40              ; D0 40 | Branch if not equal
    BNE $E0              ; D0 E0 | Game work RAM access
    BRA $60              ; 80 60 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDY #$70             ; A0 70 | Load immediate value into Y register
    BEQ $B0              ; F0 B0 | Branch if equal
    BVS $09              ; 70 09 | Branch if overflow set
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    EOR ($DB,X)          ; 41 DB | Exclusive OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    CMP $D7C8,X          ; DD C8 D7 | Compare accumulator (absolute,X)
    STA $928FD2          ; 8F D2 8F 92 | Store accumulator to absolute long address
    BCS $9B              ; B0 9B | Branch if carry set
    LDY #$3C             ; A0 3C | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    AND $3D02,X          ; 3D 02 3D | Logical AND with accumulator (absolute,X)
    ADC $6E02,X          ; 7D 02 6E | Add with carry (absolute,X)
    ORA ($7E),Y          ; 11 7E | Logical OR with accumulator ((zero page),Y)
    ORA ($5C,X)          ; 01 5C | Logical OR with accumulator ((zero page,X))
    BCC $58              ; 90 58 | Branch if carry clear
    BPL $D8              ; 10 D8 | Branch if positive
    BPL $D8              ; 10 D8 | Branch if positive
    BPL $D8              ; 10 D8 | Branch if positive
    BPL $F8              ; 10 F8 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A3
; Address: $EAA2CF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A3:
    JSR $7408            ; 20 08 74 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BVS $C8              ; 70 C8 | Branch if overflow set
    BMI $08              ; 30 08 | Branch if negative
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    BMI $08              ; 30 08 | Branch if negative
    BEQ $10              ; F0 10 | Branch if equal
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A4
; Address: $EAA2E3
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A4:
    JSL $019999          ; 22 99 99 01 | Jump to subroutine long
    LDA $00              ; A5 00 | Load from zero page into accumulator
    ROR $A1BD,X          ; 7E BD A1 | Rotate right (absolute,X)
    ROR $423C,X          ; 7E 3C 42 | Hardware register operation
    LDA $BD00,X          ; BD 00 BD | Load from absolute,X into accumulator
    STA $0066,Y          ; 99 66 00 | Store accumulator to absolute,Y
    LDA $1CE3,X          ; BD E3 1C | Load from absolute,X into accumulator
    LDA $0042,X          ; BD 42 00 | Load from absolute,X into accumulator
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BNE $00              ; D0 00 | Branch if not equal
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $60              ; F0 60 | Branch if equal
    AND $5A17            ; 2D 17 5A | Logical AND with accumulator (absolute)
    BVS $3E              ; 70 3E | Branch if overflow set
    LDY $50              ; A4 50 | Load from zero page into Y register
    CPX #$79             ; E0 79 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A5
; Address: $EAA336
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A5:
    JSR $4400            ; 20 00 44 | Jump to subroutine
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    BIT #$93             ; 89 93 | Test bits in accumulator (immediate)
    ORA #$B0             ; 09 B0 | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    ADC $FC12,Y          ; 79 12 FC | Add with carry (absolute,Y)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    DEC $79              ; C6 79 | Decrement (zero page)
    ROL $7E01,X          ; 3E 01 7E | Rotate left (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    INC $EF00,X          ; FE 00 EF | Increment (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    LDA                  ; BF 40 2A D3 | Load from absolute long,X into accumulator
    STA $EFE0,X          ; 9D E0 EF | Store accumulator to absolute,X
    BCC $FE              ; 90 FE | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    ORA ($3D,X)          ; 01 3D | Logical OR with accumulator ((zero page,X))
    CMP ($5B,X)          ; C1 5B | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A6
; Address: $EAA372
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A6:
    ROR $7881,X          ; 7E 81 78 | Rotate right (absolute,X)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STA ($1E,X)          ; 81 1E | Store accumulator to (zero page,X)
    INC $BC10,X          ; FE 10 BC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A7
; Address: $EAA383
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A7:
    JSR $40F8            ; 20 F8 40 | Jump to subroutine
    BEQ $80              ; F0 80 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPX $30              ; E4 30 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0A9
; Address: $EAA399
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0A9:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0AA
; Address: $EAA3A5
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0AA:
    JSR $6060            ; 20 60 60 | Jump to subroutine
    BNE $50              ; D0 50 | Branch if not equal
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BEQ $B0              ; F0 B0 | Branch if equal
    BEQ $A0              ; F0 A0 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ASL $0601            ; 0E 01 06 | Arithmetic shift left (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $0D0E            ; 0D 0E 0D | Logical OR with accumulator (absolute)
    ASL $0F0B            ; 0E 0B 0F | Arithmetic shift left (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0AB
; Address: $EAA3E0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0AB:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    BEQ $80              ; F0 80 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0AC
; Address: $EAA3F4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0AC:
    BVS $A0              ; 70 A0 | Branch if overflow set
    BEQ $80              ; F0 80 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0AD
; Address: $EAA3F9
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0AD:
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    LDY #$15             ; A0 15 | Load immediate value into Y register
    AND $2F0F            ; 2D 0F 2F | Logical AND with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    PLB                  ; AB | Pull data bank register from stack
    BRA $6B              ; 80 6B | Branch always
    BRA $87              ; 80 87 | Branch always
    LDY $82              ; A4 82 | Load from zero page into Y register
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($2F),Y          ; 11 2F | Logical OR with accumulator ((zero page),Y)
    LDA                  ; BF 62 7F 00 | Load from absolute long,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    ADC $FE00,X          ; 7D 00 FE | Add with carry (absolute,X)
    ORA ($DD,X)          ; 01 DD | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0AF
; Address: $EAA443
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0AF:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    BEQ $20              ; F0 20 | Branch if equal
    BCS $20              ; B0 20 | Branch if carry set
    BCS $20              ; B0 20 | Branch if carry set
    BCS $20              ; B0 20 | Branch if carry set
    BEQ $20              ; F0 20 | Branch if equal
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E0              ; 10 E0 | Game work RAM access
    BCC $60              ; 90 60 | Branch if carry clear
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    BEQ $8C              ; F0 8C | Branch if equal
    INC $EE44,X          ; FE 44 EE | Increment (absolute,X)
    STY $EE              ; 84 EE | Store Y register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    INC $FE28            ; EE 28 FE | Increment (absolute)
    INC $EA80            ; EE 80 EA | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    INC $0001            ; EE 01 00 | Increment (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0B0
; Address: $EAA47E
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0B0:
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SBC #$20             ; E9 20 | Subtract with carry (immediate)
    BMI $DA              ; 30 DA | Branch if negative
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    BIT $337D            ; 2C 7D 33 | Test bits in accumulator (absolute)
    ORA $071A,Y          ; 19 1A 07 | Logical OR with accumulator (absolute,Y)
    ASL $D902            ; 0E 02 D9 | Arithmetic shift left (absolute)
    BVS $CF              ; 70 CF | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    JMP ($2C52)          ; 6C 52 2C | Jump to address (absolute indirect)
    JMP $2430            ; 4C 30 24 | Jump to address
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    LDA $FBC0            ; AD C0 FB | Load from absolute address into accumulator
    BNE $63              ; D0 63 | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    SBC $8C60            ; ED 60 8C | Subtract with carry (absolute)
    CMP $0013,X          ; DD 13 00 | Compare accumulator (absolute,X)
    ROL $B300,X          ; 3E 00 B3 | Rotate left (absolute,X)
    LDY #$57             ; A0 57 | Load immediate value into Y register
    BCC $09              ; 90 09 | Branch if carry clear
    CPX $B441            ; EC 41 B4 | Compare X register (absolute)
    LDA                  ; BF 40 FE 00 | Load from absolute long,X into accumulator
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    ORA ($DE,X)          ; 01 DE | Logical OR with accumulator ((zero page,X))
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    INC $DC08            ; EE 08 DC | Increment (absolute)
    BPL $B8              ; 10 B8 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0B2
; Address: $EAA4EB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0B2:
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STX $79              ; 86 79 | Store X register to zero page
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$E810           ; F4 10 E8 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0B3
; Address: $EAA4F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0B3:
    JSR $00D0            ; 20 D0 00 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0B4
; Address: $EAA532
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0B4:
    SED                  ; F8 | Set decimal mode flag
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $4E              ; E6 4E | Increment (zero page)
    LSR $3798            ; 4E 98 37 | Logical shift right (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ORA $0C0E            ; 0D 0E 0C | Logical OR with accumulator (absolute)
    EOR #$AF             ; 49 AF | Exclusive OR with accumulator (immediate)
    ROL $20F7            ; 2E F7 20 | Rotate left (absolute)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BNE $40              ; D0 40 | Branch if not equal
    BNE $20              ; D0 20 | Branch if not equal
    BEQ $A2              ; F0 A2 | Branch if equal
    BEQ $87              ; F0 87 | Branch if equal
    TXA                  ; 8A | Transfer X register to accumulator
    STA $C0EC,Y          ; 99 EC C0 | Store accumulator to absolute,Y
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $B0              ; F0 B0 | Branch if equal
    BVS $D0              ; 70 D0 | Branch if overflow set
    BEQ $50              ; F0 50 | Branch if equal
    BCS $74              ; B0 74 | Branch if carry set
    STA $2D072D          ; 8F 2D 07 2D | Store accumulator to absolute long address
    AND $2F17            ; 2D 17 2F | Logical AND with accumulator (absolute)
    AND $2F1F            ; 2D 1F 2F | Logical AND with accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0B9
; Address: $EAA5C3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0B9:
    RTI                  ; 40 | Return from interrupt
    ASL $2747            ; 0E 47 27 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ORA $6E              ; 05 6E | Logical OR with accumulator (zero page)
    DEC $FC21,X          ; DE 21 FC | Decrement (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    PEA #$F003           ; F4 03 F0 | Push effective address to stack
    ORA ($70,X)          ; 01 70 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0BD
; Address: $EAA5E9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0BD:
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C0
; Address: $EAA5F0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C0:
    JSR $20D0            ; 20 D0 20 | Jump to subroutine
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    LDY $2A10            ; AC 10 2A | Load from absolute address into Y register
    BPL $0A              ; 10 0A | Branch if positive
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    ADC ($FB,X)          ; 61 FB | Add with carry ((zero page,X))
    STA                  ; 9F 00 00 00 | Store accumulator to absolute long,X
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    ORA ($A8),Y          ; 11 A8 | Logical OR with accumulator ((zero page),Y)
    ORA ($80),Y          ; 11 80 | Logical OR with accumulator ((zero page),Y)
    ORA ($88),Y          ; 11 88 | Logical OR with accumulator ((zero page),Y)
    BEQ $01              ; F0 01 | Branch if equal
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    ASL $0A38,X          ; 1E 38 0A | Arithmetic shift left (absolute,X)
    BVS $16              ; 70 16 | Branch if overflow set
    LDY $78              ; A4 78 | Load from zero page into Y register
    CPX #$29             ; E0 29 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C1
; Address: $EAA654
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C1:
    JSR $2500            ; 20 00 25 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    BRA $9E              ; 80 9E | Branch always
    AND $640B            ; 2D 0B 64 | Logical AND with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    INC $48              ; E6 48 | Increment (zero page)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    ORA ($BC,X)          ; 01 BC | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    DEC $3D31            ; CE 31 3D | Decrement (absolute)
    CMP ($5B,X)          ; C1 5B | Compare accumulator ((zero page,X))
    CPX $DC08            ; EC 08 DC | Compare X register (absolute)
    BPL $D8              ; 10 D8 | Branch if positive
    BPL $B0              ; 10 B0 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C2
; Address: $EAA68F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C2:
    JSR $3F00            ; 20 00 3F | Jump to subroutine
    STA ($1E,X)          ; 81 1E | Store accumulator to (zero page,X)
    SEP #$1D             ; E2 1D | Set processor status bits
    INC $F804,X          ; FE 04 F8 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PEA #$F800           ; F4 00 F8 | Push effective address to stack
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C3
; Address: $EAA6A3
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C3:
    JMP $003030          ; 5C 30 30 00 | Jump to address long
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    BEQ $34              ; F0 34 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$14             ; C0 14 | Compare Y register (immediate)
    JMP $BB00FF          ; 5C FF 00 BB | Jump to address long
    DEC $3800            ; CE 00 38 | Decrement (absolute)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY $38C6            ; CC C6 38 | Compare Y register (absolute)
    LSR $00A0,X          ; 5E A0 00 | Logical shift right (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA $5F              ; 05 5F | Logical OR with accumulator (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    BEQ $A0              ; F0 A0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $F8              ; 80 F8 | Branch always
    BRA $F4              ; 80 F4 | Branch always
    LDY #$FA             ; A0 FA | Load immediate value into Y register
    LDY #$FB             ; A0 FB | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C5
; Address: $EAA70F
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C5:
    JSR $0007            ; 20 07 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    STZ $1B              ; 64 1B | Store zero to zero page
    STA $B46A            ; 8D 6A B4 | Store accumulator to absolute address
    INC $BD              ; E6 BD | Increment (zero page)
    LDA $ECAB,Y          ; B9 AB EC | Load from absolute,Y into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    INC $5F              ; E6 5F | Increment (zero page)
    ADC $5E              ; 65 5E | Add with carry (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC $79BE            ; 6D BE 79 | Add with carry (absolute)
    STZ $1FFB,X          ; 9E FB 1F | Store zero to absolute,X
    STA ($F6),Y          ; 91 F6 | Store accumulator to (zero page),Y
    AND $1DE7            ; 2D E7 1D | Logical AND with accumulator (absolute)
    SBC $3D              ; E5 3D | Subtract with carry (zero page)
    DEC $FA26,X          ; DE 26 FA | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C6
; Address: $EAA74E
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C6:
    ROL $78              ; 26 78 | Rotate left (zero page)
    JMP ($D99F)          ; 6C 9F D9 | Jump to address (absolute indirect)
    LDX $BEF9,Y          ; BE F9 BE | Load from absolute,Y into X register
    CMP #$FE             ; C9 FE | Compare accumulator (immediate)
    ROR $B6FD            ; 6E FD B6 | Rotate right (absolute)
    ADC $E8DF,X          ; 7D DF E8 | Add with carry (absolute,X)
    CMP $5BEA,X          ; DD EA 5B | Compare accumulator (absolute,X)
    PHY                  ; 5A | Push Y register to stack
    ROL $3E5E            ; 2E 5E 3E | Rotate left (absolute)
    LSR $5F2E,X          ; 5E 2E 5F | Logical shift right (absolute,X)
    ROL $2E5A            ; 2E 5A 2E | Rotate left (absolute)
    LSR $603E,X          ; 5E 3E 60 | Logical shift right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C7
; Address: $EAA774
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C7:
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($74,X)          ; 01 74 | Logical OR with accumulator ((zero page,X))
    LSR $C47F,X          ; 5E 7F C4 | Logical shift right (absolute,X)
    ROR $6EC0,X          ; 7E C0 6E | Rotate right (absolute,X)
    BRA $6E              ; 80 6E | Branch always
    BRA $AE              ; 80 AE | Branch always
    LDX $FA00            ; AE 00 FA | Load from absolute address into X register
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $B8              ; 45 B8 | Exclusive OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C8
; Address: $EAA7A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C8:
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0C9
; Address: $EAA7B0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0C9:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    JMP $133004          ; 5C 04 30 13 | Jump to address long
    BPL $2F              ; 10 2F | Branch if positive
    BMI $0F              ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0CA
; Address: $EAA7DE
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0CA:
    STZ $1F              ; 64 1F | Store zero to zero page
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    STZ $0098            ; 9C 98 00 | Store zero to absolute
    CPY #$E0             ; C0 E0 | Game work RAM access
    ASL $E41A,X          ; 1E 1A E4 | Arithmetic shift left (absolute,X)
    BEQ $6A              ; F0 6A | Branch if equal
    PEA #$0001           ; F4 01 00 | Push effective address to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    SBC $DBC0,Y          ; F9 C0 DB | Subtract with carry (absolute,Y)
    BCC $6B              ; 90 6B | Branch if carry clear
    AND ($F7,X)          ; 21 F7 | Logical AND with accumulator ((zero page,X))
    ORA $6A              ; 05 6A | Logical OR with accumulator (zero page)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    CMP $0007,X          ; DD 07 00 | Compare accumulator (absolute,X)
    EOR $0E02,X          ; 5D 02 0E | Exclusive OR with accumulator (absolute,X)
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    ROL $9F00,X          ; 3E 00 9F | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0CB
; Address: $EAA842
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0CB:
    STA                  ; 9F 20 9E 20 | Store accumulator to absolute long,X
    ADC $2DB1            ; 6D B1 2D | Add with carry (absolute)
    CMP ($FB,X)          ; C1 FB | Compare accumulator ((zero page,X))
    REP #$FB             ; C2 FB | Reset processor status bits
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    BRA $7F              ; 80 7F | Branch always
    BVS $40              ; 70 40 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0CC
; Address: $EAA863
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0CC:
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0CE
; Address: $EAA873
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0CE:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $50              ; E4 50 | Compare X register (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BCS $D8              ; B0 D8 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    LDY #$74             ; A0 74 | Load immediate value into Y register
    JMP $E0A8            ; 4C A8 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    LDY $1CE2            ; AC E2 1C | Load from absolute address into Y register
    ROL                  ; 2A | Rotate left (accumulator)
    PHX                  ; DA | Push X register to stack
    BIT $A2              ; 24 A2 | Test bits in accumulator (zero page)
    JMP $E2B04E          ; 5C 4E B0 E2 | Jump to address long
    PLY                  ; 7A | Pull Y register from stack
    STY $AE              ; 84 AE | Store Y register to zero page
    BVC $40              ; 50 40 | Branch if overflow clear
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SBC $F221,Y          ; F9 21 F2 | Subtract with carry (absolute,Y)
    REP #$64             ; C2 64 | Reset processor status bits
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    BPL $E0              ; 10 E0 | Game work RAM access
    ASL $FC00,X          ; 1E 00 FC | Arithmetic shift left (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BRA $FF              ; 80 FF | Branch always
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    AND $38C7,Y          ; 39 C7 38 | Logical AND with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 40 AC 53 | Load from absolute long,X into accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0CF
; Address: $EAA902
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0CF:
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $F807,X          ; FD 07 F8 | Subtract with carry (absolute,X)
    LDX $BF57,Y          ; BE 57 BF | Load from absolute,Y into X register
    LDA $43BC53          ; AF 53 BC 43 | Load from absolute long address into accumulator
    PHY                  ; 5A | Push Y register to stack
    ORA $04FF            ; 0D FF 04 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D0
; Address: $EAA920
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D0:
    STX $78              ; 86 78 | Store X register to zero page
    ASL $78              ; 06 78 | Arithmetic shift left (zero page)
    STZ $0FE8,X          ; 9E E8 0F | Store zero to absolute,X
    BEQ $1F              ; F0 1F | Branch if equal
    CPX #$2F             ; E0 2F | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $FDA2,X          ; FD A2 FD | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    SBC $F2C2,X          ; FD C2 F2 | Subtract with carry (absolute,X)
    LDA $A7D8            ; AD D8 A7 | Load from absolute address into accumulator
    LDY $FF              ; A4 FF | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D1
; Address: $EAA93F
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D1:
    JSR $2E5E            ; 20 5E 2E | Jump to subroutine
    BIT $3E5E            ; 2C 5E 3E | Test bits in accumulator (absolute)
    LSR $BC3E,X          ; 5E 3E BC | Logical shift right (absolute,X)
    AND $59BC,X          ; 3D BC 59 | Logical AND with accumulator (absolute,X)
    LDY $BC59,X          ; BC 59 BC | Load from absolute,X into Y register
    EOR $0041,X          ; 5D 41 00 | Exclusive OR with accumulator (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA $4E8E,X          ; 1D 8E 4E | Logical OR with accumulator (absolute,X)
    BCC $06              ; 90 06 | Branch if carry clear
    CPY $E002            ; CC 02 E0 | Game work RAM access
    LDY $8977,X          ; BC 77 89 | Load from absolute,X into Y register
    CMP $DD01,X          ; DD 01 DD | Compare accumulator (absolute,X)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    CPX $F003            ; EC 03 F0 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP #$2B             ; C9 2B | Compare accumulator (immediate)
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D2
; Address: $EAA9AB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D2:
    PHP                  ; 08 | Push processor status to stack
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    STA $CE7F,X          ; 9D 7F CE | Store accumulator to absolute,X
    AND $1F              ; 25 1F | Logical AND with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BIT $5F53            ; 2C 53 5F | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D3
; Address: $EAA9BF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D3:
    JSR $8E98            ; 20 98 8E | Jump to subroutine
    ORA $9108,Y          ; 19 08 91 | Logical OR with accumulator (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    BPL $DB              ; 10 DB | Branch if positive
    JMP ($12FD)          ; 6C FD 12 | Jump to address (absolute indirect)
    ROR $9475            ; 6E 75 94 | Rotate right (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    ADC ($FE),Y          ; 71 FE | Add with carry ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    ADC $FBFE,Y          ; 79 FE FB | Add with carry (absolute,Y)
    PEA #$F0AF           ; F4 AF F0 | Push effective address to stack
    CPX $8A75            ; EC 75 8A | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $2905,X          ; 1D 05 29 | Logical OR with accumulator (absolute,X)
    ORA $1F38,X          ; 1D 38 1F | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $0011,X          ; 3E 11 00 | Rotate left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D4
; Address: $EAA9F6
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D4:
    JSL $002000          ; 22 00 20 00 | Jump to subroutine long
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ASL $BF0C,X          ; 1E 0C BF | Arithmetic shift left (absolute,X)
    BIT $E40F            ; 2C 0F E4 | Test bits in accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D5
; Address: $EAAA0C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D5:
    ADC $D8              ; 65 D8 | Add with carry (zero page)
    INX                  ; E8 | Increment X register
    PLY                  ; 7A | Pull Y register from stack
    ORA $7A              ; 05 7A | Logical OR with accumulator (zero page)
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 40 96 69 | Load from absolute long,X into accumulator
    CPY $EC              ; C4 EC | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    CPX $D808            ; EC 08 D8 | Compare X register (absolute)
    BPL $D8              ; 10 D8 | Branch if positive
    BPL $B0              ; 10 B0 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D8
; Address: $EAAA36
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D8:
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $E0              ; 10 E0 | Game work RAM access
    BEQ $20              ; F0 20 | Branch if equal
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    BIT $16              ; 24 16 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BCS $58              ; B0 58 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0D9
; Address: $EAAA65
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0D9:
    LDY $5CB4            ; AC B4 5C | Load from absolute address into Y register
    BIT $74              ; 24 74 | Test bits in accumulator (zero page)
    JMP $E4EC            ; 4C EC E4 | Jump to address
    BMI $E0              ; 30 E0 | Game work RAM access
    PHY                  ; 5A | Push Y register to stack
    LDY $62              ; A4 62 | Load from zero page into Y register
    STZ $50AE            ; 9C AE 50 | Store zero to absolute
    LSR $26A0,X          ; 5E A0 26 | Logical shift right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LSR $E6B0            ; 4E B0 E6 | Logical shift right (absolute)
    CLC                  ; 18 | Clear carry flag
    SEP #$1C             ; E2 1C | Set processor status bits
    LSR $0111            ; 4E 11 01 | Logical shift right (absolute)
    BPL $16              ; 10 16 | Branch if positive
    ORA ($56,X)          ; 01 56 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    AND $CDF7,Y          ; 39 F7 CD | Logical AND with accumulator (absolute,Y)
    SBC $10              ; E5 10 | Subtract with carry (zero page)
    INC $E111            ; EE 11 E1 | Increment (absolute)
    BPL $09              ; 10 09 | Branch if positive
    INX                  ; E8 | Increment X register
    AND $CDF7,Y          ; 39 F7 CD | Logical AND with accumulator (absolute,Y)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    BPL $F5              ; 10 F5 | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    LDX $0000,Y          ; BE 00 00 | Load from absolute,Y into X register
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    LDX $E0BE,Y          ; BE BE E0 | Game work RAM access
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0DA
; Address: $EAAB98
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0DA:
    INC $0100,X          ; FE 00 01 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $C0FF,X          ; FE FF C0 | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0DB
; Address: $EAAC0D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0DB:
    INC $1100,X          ; FE 00 11 | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $0000            ; EE 00 00 | Increment (absolute)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $80FF,X          ; FE FF 80 | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0DC
; Address: $EAAC4B
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0DC:
    JSL $330000          ; 22 00 00 33 | Jump to subroutine long
    CMP $FF00,X          ; DD 00 FF | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPX $0000            ; EC 00 00 | Compare X register (absolute)
    ASL $FF00,X          ; 1E 00 FF | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    ASL $03FE            ; 0E FE 03 | Arithmetic shift left (absolute)
    BRA $4D              ; 80 4D | Branch always
    CPX $9B00            ; EC 00 9B | Compare X register (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $80              ; 80 80 | Branch always
    CPX $DB80            ; EC 80 DB | Compare X register (absolute)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0DD
; Address: $EAACBC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0DD:
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CPX $FFE4            ; EC E4 FF | Compare X register (absolute)
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $64              ; 64 64 | Store zero to zero page
    STZ $FF              ; 64 FF | Store zero to zero page
    LSR $FF              ; 46 FF | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0DE
; Address: $EAACE7
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0DE:
    CPX $DB80            ; EC 80 DB | Compare X register (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA $FFFF,X          ; 1D FF FF | Logical OR with accumulator (absolute,X)
    CPX $DB80            ; EC 80 DB | Compare X register (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    CPX $DB80            ; EC 80 DB | Compare X register (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    INC $FF8A            ; EE 8A FF | Increment (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0DF
; Address: $EAAD45
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0DF:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX $3EFF,Y          ; BE FF 3E | Load from absolute,Y into X register
    ROL $C100,X          ; 3E 00 C1 | Rotate left (absolute,X)
    ROL $00FF,X          ; 3E FF 00 | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    RTI                  ; 40 | Return from interrupt
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ROL $782F,X          ; 3E 2F 78 | Rotate left (absolute,X)
    INC $B04F,X          ; FE 4F B0 | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $FF              ; 80 FF | Branch always
    BPL $FF              ; 10 FF | Branch if positive
    STY $E0              ; 84 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    JMP ($FB80)          ; 6C 80 FB | Jump to address (absolute indirect)
    LDY #$01             ; A0 01 | Load immediate value into Y register
    ASL $FF00,X          ; 1E 00 FF | Arithmetic shift left (absolute,X)
    CPX $DB00            ; EC 00 DB | Compare X register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    CPX $9B00            ; EC 00 9B | Compare X register (absolute)
    STZ $00              ; 64 00 | Store zero to zero page
    CPX $9B00            ; EC 00 9B | Compare X register (absolute)
    STZ $00              ; 64 00 | Store zero to zero page
    STZ $00              ; 64 00 | Store zero to zero page
    ADC $E600,Y          ; 79 00 E6 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E0
; Address: $EAAE98
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E0:
    SBC $F300,X          ; FD 00 F3 | Subtract with carry (absolute,X)
    ASL $F800,X          ; 1E 00 F8 | Arithmetic shift left (absolute,X)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E1
; Address: $EAAEA7
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E1:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $0001            ; 0D 01 00 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    LDY $1F7F,X          ; BC 7F 1F | Load from absolute,X into Y register
    ASL $0100,X          ; 1E 00 01 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    DEX                  ; CA | Decrement X register
    INC $0100,X          ; FE 00 01 | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0E01            ; 0E 01 0E | Arithmetic shift left (absolute)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    EOR $0978            ; 4D 78 09 | Exclusive OR with accumulator (absolute)
    BVS $9B              ; 70 9B | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E2
; Address: $EAB043
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E2:
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    ROL $3C              ; 26 3C | Rotate left (zero page)
    ROL $38              ; 26 38 | Rotate left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA $8B78            ; 0D 78 8B | Logical OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E3
; Address: $EAB054
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E3:
    JSR $0100            ; 20 00 01 | Jump to subroutine
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BVS $B0              ; 70 B0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BIT $2870            ; 2C 70 28 | Test bits in accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $00D3,X          ; FE D3 00 | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ASL $28              ; 06 28 | Arithmetic shift left (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    AND $8C              ; 25 8C | Logical AND with accumulator (zero page)
    JMP ($E84B)          ; 6C 4B E8 | Jump to address (absolute indirect)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative
    BVC $00              ; 50 00 | Branch if overflow clear
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $13              ; F0 13 | Branch if equal
    SEP #$94             ; E2 94 | Set processor status bits
    SBC ($26,X)          ; E1 26 | Subtract with carry ((zero page,X))
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    CMP ($4E,X)          ; C1 4E | Compare accumulator ((zero page,X))
    STA ($5E,X)          ; 81 5E | Store accumulator to (zero page,X)
    STZ $BC03            ; 9C 03 BC | Store zero to absolute
    SBC ($1A),Y          ; F1 1A | Subtract with carry ((zero page),Y)
    SBC ($96),Y          ; F1 96 | Subtract with carry ((zero page),Y)
    SEP #$34             ; E2 34 | Set processor status bits
    SBC ($2E,X)          ; E1 2E | Subtract with carry ((zero page,X))
    CMP ($2E,X)          ; C1 2E | Compare accumulator ((zero page,X))
    JMP $879C83          ; 5C 83 9C 87 | Jump to address long
    CLV                  ; B8 | Clear overflow flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E4
; Address: $EAB184
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E4:
    BIT $3B              ; 24 3B | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $1817,Y          ; 19 17 18 | Logical OR with accumulator (absolute,Y)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    ROL $01              ; 26 01 | Rotate left (zero page)
    ROL $01              ; 26 01 | Rotate left (zero page)
    ORA ($E8,X)          ; 01 E8 | Logical OR with accumulator ((zero page,X))
    ASL $D9D2            ; 0E D2 D9 | Arithmetic shift left (absolute)
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    LDX $3F              ; A6 3F | Load from zero page into X register
    BPL $1B              ; 10 1B | Branch if positive
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    AND $7689,X          ; 3D 89 76 | Logical AND with accumulator (absolute,X)
    ROL $59              ; 26 59 | Rotate left (zero page)
    BNE $2F              ; D0 2F | Branch if not equal
    STA $19E6            ; 8D E6 19 | Store accumulator to absolute address
    BRA $00              ; 80 00 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $34              ; 66 34 | Rotate right (zero page)
    BIT $A1              ; 24 A1 | Test bits in accumulator (zero page)
    LDA #$51             ; A9 51 | Load immediate value into accumulator
    BPL $12              ; 10 12 | Branch if positive
    STA $AD10,Y          ; 99 10 AD | Store accumulator to absolute,Y
    WDM #$BC             ; 42 BC | Reserved instruction

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E5
; Address: $EAB1DF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E5:
    JSR $C40D            ; 20 0D C4 | Jump to subroutine
    BMI $32              ; 30 32 | Branch if negative
    ROR $02              ; 66 02 | Rotate right (zero page)
    REP #$98             ; C2 98 | Reset processor status bits
    LDY #$2C             ; A0 2C | Load immediate value into Y register
    LDY $187F            ; AC 7F 18 | Load from absolute address into Y register
    BMI $CF              ; 30 CF | Branch if negative
    INC                  ; 1A | Increment accumulator
    SBC $E4              ; E5 E4 | Subtract with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E6
; Address: $EAB1F9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E6:
    STA                  ; 9F 93 2C 0C | Store accumulator to absolute long,X
    STZ $38              ; 64 38 | Store zero to zero page
    BCC $FE              ; 90 FE | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    EOR #$CB             ; 49 CB | Exclusive OR with accumulator (immediate)
    PHB                  ; 8B | Push data bank register to stack
    XBA                  ; EB | Exchange accumulator bytes
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    LDA                  ; BF 40 7C 83 | Load from absolute long,X into accumulator
    JMP $C33C            ; 4C 3C C3 | Jump to address
    ORA $16              ; 05 16 | Logical OR with accumulator (zero page)
    AND $5A17            ; 2D 17 5A | Logical AND with accumulator (absolute)
    BVS $3E              ; 70 3E | Branch if overflow set
    LDY $50              ; A4 50 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E7
; Address: $EAB22E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E7:
    CPX #$79             ; E0 79 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E8
; Address: $EAB236
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E8:
    JSR $4400            ; 20 00 44 | Jump to subroutine
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    ASL $21E1,X          ; 1E E1 21 | PPU graphics register access
    CPY #$2E             ; C0 2E | Compare Y register (immediate)
    EOR ($59),Y          ; 51 59 | Exclusive OR with accumulator ((zero page),Y)
    LSR $8E              ; 46 8E | Logical shift right (zero page)
    STX $8654            ; 8E 54 86 | Store X register to absolute address
    STX $7F              ; 86 7F | Store X register to zero page
    SBC $F100,X          ; FD 00 F1 | Subtract with carry (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    STA $12              ; 85 12 | Store accumulator to zero page
    ORA $52              ; 05 52 | Logical OR with accumulator (zero page)
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $03              ; 10 03 | Branch if positive
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA #$C0             ; 09 C0 | Logical OR with accumulator (immediate)
    JMP $0300            ; 4C 00 03 | Jump to address
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    SBC $3602,X          ; FD 02 36 | Subtract with carry (absolute,X)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SBC $8000,Y          ; F9 00 80 | Subtract with carry (absolute,Y)
    ROR $0100,X          ; 7E 00 01 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0E9
; Address: $EAB2EA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0E9:
    JSR $0A01            ; 20 01 0A | Jump to subroutine
    BEQ $01              ; F0 01 | Branch if equal
    INC $40BF,X          ; FE BF 40 | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    LDX $EEA0,Y          ; BE A0 EE | Load from absolute,Y into X register
    STA                  ; 9F 0B 3F 0E | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0EA
; Address: $EAB30B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0EA:
    BRA $01              ; 80 01 | Branch always
    LDY #$03             ; A0 03 | Load immediate value into Y register
    LDY $7253            ; AC 53 72 | Load from absolute address into Y register
    STA $14EB            ; 8D EB 14 | Store accumulator to absolute address
    BPL $F3              ; 10 F3 | Branch if positive
    LDA $9DC8            ; AD C8 9D | Load from absolute address into accumulator
    LDA                  ; BF 86 F7 21 | Load from absolute long,X into accumulator
    ORA $06FF,Y          ; 19 FF 06 | Logical OR with accumulator (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    XBA                  ; EB | Exchange accumulator bytes
    DEC $3D31            ; CE 31 3D | Decrement (absolute)
    REP #$DF             ; C2 DF | Reset processor status bits

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0EB
; Address: $EAB339
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0EB:
    JSR $08F7            ; 20 F7 08 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ASL $0102            ; 0E 02 01 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BPL $82              ; 10 82 | Branch if positive
    BPL $82              ; 10 82 | Branch if positive
    EOR ($80),Y          ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($80),Y          ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($80),Y          ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
    EOR ($80),Y          ; 51 80 | Exclusive OR with accumulator ((zero page),Y)
    EOR $FD80,Y          ; 59 80 FD | Exclusive OR with accumulator (absolute,Y)
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    STY $44FE            ; 8C FE 44 | Store Y register to absolute address
    INC $EE04            ; EE 04 EE | Increment (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $FE28            ; EE 28 FE | Increment (absolute)
    ROR $6A00            ; 6E 00 6A | Rotate right (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROL $0001            ; 2E 01 00 | Rotate left (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    ORA $B2              ; 05 B2 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    ORA $0AF2            ; 0D F2 0A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 00 7F 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0EC
; Address: $EAB3C1
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0EC:
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    BIT $38              ; 24 38 | Test bits in accumulator (zero page)
    JMP $4978            ; 4C 78 49 | Jump to address
    BVS $9B              ; 70 9B | Branch if overflow set
    BPL $00              ; 10 00 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    EOR $5B80,Y          ; 59 80 5B | Exclusive OR with accumulator (absolute,Y)
    BRA $5D              ; 80 5D | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $6F              ; 80 6F | Branch always
    BCC $0E              ; 90 0E | Branch if carry clear
    SBC ($FB),Y          ; F1 FB | Subtract with carry ((zero page),Y)
    STA ($2C,X)          ; 81 2C | Store accumulator to (zero page,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($06),Y          ; 51 06 | Exclusive OR with accumulator ((zero page),Y)
    CMP ($02),Y          ; D1 02 | Compare accumulator ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    PEA #$FF01           ; F4 01 FF | Push effective address to stack
    SBC $00D3,Y          ; F9 D3 00 | Subtract with carry (absolute,Y)
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BPL $22              ; 10 22 | Branch if positive
    BPL $04              ; 10 04 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0ED
; Address: $EAB48D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0ED:
    JSL $0022CC          ; 22 CC 22 00 | Jump to subroutine long
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0EE
; Address: $EAB4AC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0EE:
    JSR $1240            ; 20 40 12 | Jump to subroutine
    LDY $00              ; A4 00 | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INY                  ; C8 | Increment Y register
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $0011,X          ; 1E 11 00 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F0
; Address: $EAB4FE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F0:
    JSR $F100            ; 20 00 F1 | Jump to subroutine
    SEP #$34             ; E2 34 | Set processor status bits
    SBC ($66,X)          ; E1 66 | Subtract with carry ((zero page,X))
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    STA ($5E,X)          ; 81 5E | Store accumulator to (zero page,X)
    LDY $3C00,X          ; BC 00 3C | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    ROL $623C,X          ; 3E 3C 62 | Rotate left (absolute,X)
    LDY $6D              ; A4 6D | Load from zero page into Y register
    LDY #$1D             ; A0 1D | Load immediate value into Y register
    CLC                  ; 18 | Clear carry flag
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    BNE $D8              ; D0 D8 | Branch if not equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F1
; Address: $EAB547
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F1:
    JSR $A0C0            ; 20 C0 A0 | Jump to subroutine
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BCS $40              ; B0 40 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    BCS $00              ; B0 00 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    ORA $0E02,X          ; 1D 02 0E | Logical OR with accumulator (absolute,X)
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    AND $0012,X          ; 3D 12 00 | Logical AND with accumulator (absolute,X)
    SBC $7D42,X          ; FD 42 7D | Subtract with carry (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ROL $DBD9,X          ; 3E D9 DB | Rotate left (absolute,X)
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)
    PLB                  ; AB | Pull data bank register from stack
    STA $F80773          ; 8F 73 07 F8 | Store accumulator to absolute long address
    ORA #$96             ; 09 96 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F2
; Address: $EAB5A1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F2:
    STX $AEDF            ; 8E DF AE | Store X register to absolute address
    DEC $EB31            ; CE 31 EB | Decrement (absolute)
    SBC ($16,X)          ; E1 16 | Subtract with carry ((zero page,X))
    ADC $2AD7,X          ; 7D D7 2A | Add with carry (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F3
; Address: $EAB5C1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F3:
    JSL $78643C          ; 22 3C 64 78 | Jump to subroutine long
    PHA                  ; 48 | Push accumulator to stack
    BEQ $89              ; F0 89 | Branch if equal
    BEQ $93              ; F0 93 | Branch if equal
    CPX #$33             ; E0 33 | Compare X register (immediate)
    CPY #$27             ; C0 27 | Compare Y register (immediate)
    CMP ($46,X)          ; C1 46 | Compare accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F4
; Address: $EAB5E4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F4:
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    LDY $9E01,X          ; BC 01 9E | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA ($0C,X)          ; A1 0C | Load from (zero page,X) into accumulator
    LDY $05              ; A4 05 | Load from zero page into Y register
    LDY #$75             ; A0 75 | Load immediate value into Y register
    LDX $0D              ; A6 0D | Load from zero page into X register
    LDY $4D              ; A4 4D | Load from zero page into Y register
    LDY #$1D             ; A0 1D | Load immediate value into Y register
    LDY $45              ; A4 45 | Load from zero page into Y register
    PHB                  ; 8B | Push data bank register to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F5
; Address: $EAB621
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F5:
    BRA $C8              ; 80 C8 | Branch always
    DEC $ECAC,X          ; DE AC EC | Decrement (absolute,X)
    BPL $70              ; 10 70 | Branch if positive
    LDY #$60             ; A0 60 | Load immediate value into Y register
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $5B84            ; 8D 84 5B | Store accumulator to absolute address
    DEC $CF35            ; CE 35 CF | Decrement (absolute)
    BCS $E0              ; B0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    LDY $70              ; A4 70 | Load from zero page into Y register
    LDA $7248B7          ; AF B7 48 72 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F6
; Address: $EAB672
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F6:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    AND $C6              ; 25 C6 | Logical AND with accumulator (zero page)
    AND $D6EF,Y          ; 39 EF D6 | Logical AND with accumulator (absolute,Y)
    DEY                  ; 88 | Decrement Y register
    LDA $0000            ; AD 00 00 | Load from absolute address into accumulator
    PHA                  ; 48 | Push accumulator to stack
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ADC $A500            ; 6D 00 A5 | Add with carry (absolute)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    JMP $5600            ; 4C 00 56 | Jump to address
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ADC $7B00            ; 6D 00 7B | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F8
; Address: $EAB6CD
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F8:
    JSR $AB00            ; 20 00 AB | Jump to subroutine
    EOR $7700            ; 4D 00 77 | Exclusive OR with accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    LDA $54              ; A5 54 | Load from zero page into accumulator
    LDX #$5D             ; A2 5D | Load immediate value into X register
    LDX #$5D             ; A2 5D | Load immediate value into X register
    LDX $A645,Y          ; BE 45 A6 | Load from absolute,Y into X register
    ORA $6BA0,X          ; 1D A0 6B | Logical OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC ($06,X)          ; E1 06 | Subtract with carry ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SBC #$56             ; E9 56 | Subtract with carry (immediate)
    ADC $3E1A,X          ; 7D 1A 3E | Add with carry (absolute,X)
    ORA #$D8             ; 09 D8 | Logical OR with accumulator (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STY $CE              ; 84 CE | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    ADC $3E1A,X          ; 7D 1A 3E | Add with carry (absolute,X)
    ORA $245B,Y          ; 19 5B 24 | Logical OR with accumulator (absolute,Y)
    PLB                  ; AB | Pull data bank register from stack
    STA $283773          ; 8F 73 37 28 | Store accumulator to absolute long address
    AND $0006,Y          ; 39 06 00 | Logical AND with accumulator (absolute,Y)
    BPL $00              ; 10 00 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    DEC $CCA0,X          ; DE A0 CC | Decrement (absolute,X)
    SEC                  ; 38 | Set carry flag
    NOP                  ; EA | No operation
    BPL $84              ; 10 84 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    ROL $BE              ; 26 BE | Rotate left (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    LDA $65FF,X          ; BD FF 65 | Load from absolute,X into accumulator
    ROL $FF              ; 26 FF | Rotate left (zero page)
    JMP $87FF            ; 4C FF 87 | Jump to address
    STA                  ; 9F 69 40 00 | Store accumulator to absolute long,X
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0F9
; Address: $EAB7C5
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0F9:
    DEC $AAFF            ; CE FF AA | Decrement (absolute)
    XBA                  ; EB | Exchange accumulator bytes
    STY $FF              ; 84 FF | Store Y register to zero page
    CLD                  ; D8 | Clear decimal mode flag
    LDA $008E            ; AD 8E 00 | Load from absolute address into accumulator
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    LDA $4A              ; A5 4A | Load from zero page into accumulator
    INC $FD14            ; EE 14 FD | Increment (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    STA $2A              ; 85 2A | Store accumulator to zero page
    STY $6E              ; 84 6E | Store Y register to zero page
    LDX $EC44            ; AE 44 EC | Load from absolute address into X register
    CPX $7838            ; EC 38 78 | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0FA
; Address: $EAB80D
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0FA:
    JSR $5078            ; 20 78 50 | Jump to subroutine
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    DEC $01              ; C6 01 | Decrement (zero page)
    PHA                  ; 48 | Push accumulator to stack
    STY $70              ; 84 70 | Store Y register to zero page
    LDA $0048B7          ; AF B7 48 00 | Load from absolute long address into accumulator
    DEY                  ; 88 | Decrement Y register
    JMP $D82480          ; 5C 80 24 D8 | Jump to address long
    DEY                  ; 88 | Decrement Y register
    LDA $0000            ; AD 00 00 | Load from absolute address into accumulator
    PHP                  ; 08 | Push processor status to stack
    ASL $7F11            ; 0E 11 7F | Arithmetic shift left (absolute)
    JMP $ACDF            ; 4C DF AC | Jump to address
    INC $3811            ; EE 11 38 | Increment (absolute)
    BIT $74              ; 24 74 | Test bits in accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    INC $D800,X          ; FE 00 D8 | Increment (absolute,X)
    BIT $C6              ; 24 C6 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0FB
; Address: $EAB88D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0FB:
    JSR $40C2            ; 20 C2 40 | Jump to subroutine
    STA $8EFF70          ; 8F 70 FF 8E | Store accumulator to absolute long address
    INC $5BFC            ; EE FC 5B | Increment (absolute)
    BVC $FF              ; 50 FF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0FD
; Address: $EAB8BA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0FD:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    SBC $FFDA,X          ; FD DA FF | Subtract with carry (absolute,X)
    DEC $FF              ; C6 FF | Decrement (zero page)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    AND $77FF            ; 2D FF 77 | Logical AND with accumulator (absolute)
    DEC $00              ; C6 00 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0FE
; Address: $EAB8DE
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0FE:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    BVC $50              ; 50 50 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $A3CD            ; CD CD A3 | Compare accumulator (absolute)
    PEA #$E034           ; F4 34 E0 | Game work RAM access
    SEP #$F9             ; E2 F9 | Set processor status bits
    EOR #$B4             ; 49 B4 | Exclusive OR with accumulator (immediate)
    LDY $3F              ; A4 3F | Load from zero page into Y register
    JMP $FF0BFF          ; 5C FF 0B FF | Jump to address long
    ORA $06FF,X          ; 1D FF 06 | Logical OR with accumulator (absolute,X)
    SBC $C2DD,X          ; FD DD C2 | Subtract with carry (absolute,X)
    WDM #$F8             ; 42 F8 | Reserved instruction
    XBA                  ; EB | Exchange accumulator bytes
    BEQ $A0              ; F0 A0 | Branch if equal
    ADC $F449,Y          ; 79 49 F4 | Add with carry (absolute,Y)
    SBC #$A9             ; E9 A9 | Subtract with carry (immediate)
    AND $04FF,X          ; 3D FF 04 | Logical AND with accumulator (absolute,X)
    ORA $86FF            ; 0D FF 86 | Logical OR with accumulator (absolute)
    EOR ($0F,X)          ; 41 0F | Exclusive OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $A0AF            ; 4D AF A0 | Exclusive OR with accumulator (absolute)
    STA                  ; 9F 98 7F 6F | Store accumulator to absolute long,X
    LDA                  ; BF A5 BC FF | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    BCS $FF              ; B0 FF | Branch if carry set
    BVC $FF              ; 50 FF | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_0FF
; Address: $EAB95A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_0FF:
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    TXS                  ; 9A | Transfer X register to stack pointer
    PEA #$F8F6           ; F4 F6 F8 | Push effective address to stack
    BRA $FC              ; 80 FC | Branch always
    JMP ($93FF)          ; 6C FF 93 | Jump to address (absolute indirect)
    INC $F74E,X          ; FE 4E F7 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_100
; Address: $EAB970
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_100:
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BEQ $40              ; F0 40 | Branch if equal
    ORA $F9              ; 05 F9 | Logical OR with accumulator (zero page)
    ORA $F6F6,Y          ; 19 F6 F6 | Logical OR with accumulator (absolute,Y)
    BEQ $40              ; F0 40 | Branch if equal
    SBC $0DA9,Y          ; F9 A9 0D | Subtract with carry (absolute,Y)
    ORA $0AFF            ; 0D FF 0A | Logical OR with accumulator (absolute)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    ORA $5F              ; 05 5F | Logical OR with accumulator (zero page)
    LDX $3F92,Y          ; BE 92 3F | Load from absolute,Y into X register
    ASL $B5F7            ; 0E F7 B5 | Arithmetic shift left (absolute)
    JMP $B4FF            ; 4C FF B4 | Jump to address

;------------------------------------------------------------------------------
; Bank54_DmaFunction_101
; Address: $EAB9B4
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_101:
    JSR $F0FF            ; 20 FF F0 | Jump to subroutine
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPX $14              ; E4 14 | Compare X register (zero page)
    CMP $D939,Y          ; D9 39 D9 | Compare accumulator (absolute,Y)
    EOR $F961,Y          ; 59 61 F9 | Exclusive OR with accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    ORA #$F9             ; 09 F9 | Logical OR with accumulator (immediate)
    AND ($E2,X)          ; 21 E2 | Logical AND with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    ROL $7F              ; 26 7F | Rotate left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC $0FFF,X          ; FE FF 0F | Increment (absolute,X)
    ADC $AB9F,X          ; 7D 9F AB | Add with carry (absolute,X)
    DEC $D8CF            ; CE CF D8 | Decrement (absolute)
    DEC $B8B0,X          ; DE B0 B8 | Decrement (absolute,X)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDA                  ; BF 10 DF 10 | Load from absolute long,X into accumulator
    BMI $FF              ; 30 FF | Branch if negative
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    LSR $FE              ; 46 FE | Logical shift right (zero page)
    LSR $0EFE,X          ; 5E FE 0E | Logical shift right (absolute,X)
    BIT #$78             ; 89 78 | Test bits in accumulator (immediate)
    SBC $FB              ; E5 FB | Subtract with carry (zero page)
    STA $7CFECC          ; 8F CC FE 7C | Store accumulator to absolute long address
    BVS $FB              ; 70 FB | Branch if overflow set
    BRA $F7              ; 80 F7 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_102
; Address: $EABA17
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_102:
    STA                  ; 9F 10 FF 60 | Store accumulator to absolute long,X
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BMI $B0              ; 30 B0 | Branch if negative
    LDY $38BC,X          ; BC BC 38 | Load from absolute,X into Y register
    BPL $18              ; 10 18 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    CPX #$E0             ; E0 E0 | Game work RAM access
    LSR $42FE            ; 4E FE 42 | Hardware register operation
    INC $FEC2,X          ; FE C2 FE | Increment (absolute,X)
    CPX $FC              ; E4 FC | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    INC $F53E,X          ; FE 3E F5 | Increment (absolute,X)
    STA $7D6E            ; 8D 6E 7D | Store accumulator to absolute address
    SBC #$26             ; E9 26 | Subtract with carry (immediate)
    LDA $B916,Y          ; B9 16 B9 | Load from absolute,Y into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $3F01            ; 2D 01 3F | Logical AND with accumulator (absolute)
    STA $40FD80          ; 8F 80 FD 40 | Store accumulator to absolute long address
    SBC $FF42            ; ED 42 FF | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    BNE $FD              ; D0 FD | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    PEA #$A4A4           ; F4 A4 A4 | Push effective address to stack
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    JMP ($F0EC)          ; 6C EC F0 | Jump to address (absolute indirect)
    BEQ $08              ; F0 08 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    BIT $EC              ; 24 EC | Test bits in accumulator (zero page)
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FE5A,X          ; FE 5A FE | Increment (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    INC $FE12,X          ; FE 12 FE | Increment (absolute,X)
    AND #$2F             ; 29 2F | Logical AND with accumulator (immediate)
    AND $27              ; 25 27 | Logical AND with accumulator (zero page)
    LDA $DB81,Y          ; B9 81 DB | Load from absolute,Y into accumulator
    REP #$DD             ; C2 DD | Reset processor status bits

;------------------------------------------------------------------------------
; Bank54_DmaFunction_103
; Address: $EABA8F
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_103:
    CMP ($D0,X)          ; C1 D0 | Compare accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    CPX $FF              ; E4 FF | Compare X register (zero page)
    STA                  ; 9F 7E C7 3C | Store accumulator to absolute long,X
    ROL $78E3,X          ; 3E E3 78 | Rotate left (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    TSX                  ; BA | Transfer stack pointer to X register
    INX                  ; E8 | Increment X register
    LDA #$A6             ; A9 A6 | Load immediate value into accumulator
    SBC ($A6,X)          ; E1 A6 | Subtract with carry ((zero page,X))
    SBC ($E6,X)          ; E1 E6 | Subtract with carry ((zero page,X))
    SBC ($E2,X)          ; E1 E2 | Subtract with carry ((zero page,X))
    SBC #$E6             ; E9 E6 | Subtract with carry (immediate)
    ORA ($04),Y          ; 11 04 | Logical OR with accumulator ((zero page),Y)
    LDY $BC06,X          ; BC 06 BC | Load from absolute,X into Y register
    LDY $F81F,X          ; BC 1F F8 | Load from absolute,X into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_104
; Address: $EABAE9
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_104:
    STY $1CE3            ; 8C E3 1C | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    STY $B374            ; 8C 74 B3 | Store Y register to absolute address
    ADC $7FB0,X          ; 7D B0 7F | Add with carry (absolute,X)
    BCS $7F              ; B0 7F | Branch if carry set
    BRA $7F              ; 80 7F | Branch always
    BRA $20              ; 80 20 | Branch always
    CPX #$08             ; E0 08 | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_106
; Address: $EABB3D
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_106:
    BEQ $48              ; F0 48 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    DEC                  ; 3A | Decrement accumulator
    SEI                  ; 78 | Set interrupt disable flag
    SBC $F001,X          ; FD 01 F0 | Subtract with carry (absolute,X)
    LDX $FFFE,Y          ; BE FE FF | Load from absolute,Y into X register
    SBC $FCC7,X          ; FD C7 FC | Subtract with carry (absolute,X)
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $61              ; 64 61 | Store zero to zero page
    SBC ($38),Y          ; F1 38 | Subtract with carry ((zero page),Y)
    ROR $038E,X          ; 7E 8E 03 | Rotate right (absolute,X)
    SBC $96FA,X          ; FD FA 96 | Subtract with carry (absolute,X)
    SBC #$08             ; E9 08 | Subtract with carry (immediate)
    JMP $9F31            ; 4C 31 9F | Jump to address
    SED                  ; F8 | Set decimal mode flag
    INC $CF01,X          ; FE 01 CF | Increment (absolute,X)
    SBC $FF21,X          ; FD 21 FF | Subtract with carry (absolute,X)
    ROL $20FD,X          ; 3E FD 20 | Rotate left (absolute,X)
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1F              ; 10 1F | Branch if positive
    BPL $1C              ; 10 1C | Branch if positive
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 60 7F E0 | Load from absolute long,X into accumulator
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    SBC $0503,X          ; FD 03 05 | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    STA ($7D,X)          ; 81 7D | Store accumulator to (zero page,X)
    ROR $5F93,X          ; 7E 93 5F | Rotate right (absolute,X)
    BCS $7F              ; B0 7F | Branch if carry set
    BEQ $3F              ; F0 3F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_107
; Address: $EABBD6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_107:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    LDA                  ; BF 00 DF 00 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    BNE $40              ; D0 40 | Branch if not equal
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_108
; Address: $EABBE9
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_108:
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $20              ; F0 20 | Branch if equal
    BCS $28              ; B0 28 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $1F              ; 10 1F | Branch if positive
    BMI $7D              ; 30 7D | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    EOR $1F01            ; 4D 01 1F | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_10A
; Address: $EABC16
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_10A:
    JSR $007F            ; 20 7F 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY $CF              ; C4 CF | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_10B
; Address: $EABC1E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_10B:
    JSR $F7FD            ; 20 FD F7 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $3FFF,X          ; FE FF 3F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_10C
; Address: $EABC30
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_10C:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BRA $FF              ; 80 FF | Branch always
    INC $F9              ; E6 F9 | Increment (zero page)
    SBC $FEFE,Y          ; F9 FE FE | Subtract with carry (absolute,Y)
    LDA                  ; BF 7F FE FE | Load from absolute long,X into accumulator
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BCC $48              ; 90 48 | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    LDY $D8AC,X          ; BC AC D8 | Load from absolute,X into Y register
    INY                  ; C8 | Increment Y register
    CPX $F6FA            ; EC FA F6 | Compare X register (absolute)
    STX $5C57            ; 8E 57 5C | Store X register to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_10D
; Address: $EABC72
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_10D:
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    LDX $DA02,Y          ; BE 02 DA | Load from absolute,Y into X register
    INC $F600,X          ; FE 00 F6 | Increment (absolute,X)
    ADC ($EF,X)          ; 61 EF | Add with carry ((zero page,X))
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    LDA $77              ; A5 77 | Load from zero page into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    BEQ $70              ; F0 70 | Branch if equal
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BEQ $70              ; F0 70 | Branch if equal
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BPL $70              ; 10 70 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $31              ; 10 31 | Branch if positive
    ROL $243B            ; 2E 3B 24 | Rotate left (absolute)
    LDX $998A            ; AE 8A 99 | Load from absolute address into X register
    EOR ($E0),Y          ; 51 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    ASL $0F02,X          ; 1E 02 0F | Arithmetic shift left (absolute,X)
    ASL $001E            ; 0E 1E 00 | Arithmetic shift left (absolute)
    ROL $7F53            ; 2E 53 7F | Rotate left (absolute)
    EOR ($FF),Y          ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
    ROL $7F              ; 26 7F | Rotate left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BVS $E0              ; 70 E0 | Game work RAM access
    BMI $D8              ; 30 D8 | Branch if negative
    CLD                  ; D8 | Clear decimal mode flag
    CPX $F858            ; EC 58 F8 | Compare X register (absolute)
    STZ $FF07            ; 9C 07 FF | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_10E
; Address: $EABCE0
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_10E:
    SBC $E6              ; E5 E6 | Subtract with carry (zero page)
    ASL $061F            ; 0E 1F 06 | Arithmetic shift left (absolute)
    ASL $0504            ; 0E 04 05 | Arithmetic shift left (absolute)
    ASL $35              ; 06 35 | Arithmetic shift left (zero page)
    BVC $6B              ; 50 6B | Branch if overflow clear
    ROR $1887,X          ; 7E 87 18 | Rotate right (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ASL $3E08            ; 0E 08 3E | Arithmetic shift left (absolute)
    STY $EF              ; 84 EF | Store Y register to zero page
    ORA $034E            ; 0D 4E 03 | Logical OR with accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_10F
; Address: $EABD0B
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_10F:
    JSR $1807            ; 20 07 18 | Jump to subroutine
    ORA $0073            ; 0D 73 00 | Logical OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF FF FF 00 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    BPL $1F              ; 10 1F | Branch if positive
    CPX #$E0             ; E0 E0 | Game work RAM access
    AND $3F06,X          ; 3D 06 3F | Logical AND with accumulator (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    CPX #$15             ; E0 15 | Compare X register (immediate)
    CPX $1F              ; E4 1F | Compare X register (zero page)
    INC $FFFF            ; EE FF FF | Increment (absolute)
    AND $0CFD,X          ; 3D FD 0C | Logical AND with accumulator (absolute,X)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_110
; Address: $EABD92
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_110:
    JSR $00F5            ; 20 F5 00 | Jump to subroutine
    INC $FF00            ; EE 00 FF | Increment (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $BF5B            ; EC 5B BF | Compare X register (absolute)
    BCC $49              ; 90 49 | Branch if carry clear
    LDY $7F6A,X          ; BC 6A 7F | Load from absolute,X into Y register
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    STA ($1E),Y          ; 91 1E | Store accumulator to (zero page),Y
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ROL $6F              ; 26 6F | Rotate left (zero page)
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_111
; Address: $EABDBE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_111:
    JSR $00ED            ; 20 ED 00 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $05              ; 10 05 | Branch if positive
    BVS $34              ; 70 34 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_112
; Address: $EABDED
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_112:
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PLY                  ; 7A | Pull Y register from stack
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR $EFB1,X          ; 5E B1 EF | Logical shift right (absolute,X)
    STA                  ; 9F B7 CF FC | Store accumulator to absolute long,X
    JMP $633DE3          ; 5C E3 3D 63 | Jump to address long
    ROR $007F,X          ; 7E 7F 00 | Rotate right (absolute,X)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    BPL $FF              ; 10 FF | Branch if positive
    STY $C0EF            ; 8C EF C0 | Store Y register to absolute address
    BRA $FF              ; 80 FF | Branch always
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA $1B0A            ; 0D 0A 1B | Logical OR with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $483F,X          ; 3E 3F 48 | Rotate left (absolute,X)
    AND ($4F),Y          ; 31 4F | Logical AND with accumulator ((zero page),Y)
    BMI $60              ; 30 60 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_113
; Address: $EABE87
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_113:
    JSR $3F7F            ; 20 7F 3F | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHB                  ; 8B | Push data bank register to stack
    WDM #$FF             ; 42 FF | Reserved instruction
    BNE $00              ; D0 00 | Branch if not equal
    AND $021E,Y          ; 39 1E 02 | Logical AND with accumulator (absolute,Y)
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    AND ($2B,X)          ; 21 2B | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    AND $CC0C,X          ; 3D 0C CC | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $0F08            ; 0D 08 0F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_114
; Address: $EABF08
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_114:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT $3E              ; 24 3E | Test bits in accumulator (zero page)
    BPL $1D              ; 10 1D | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1911,X          ; 1E 11 19 | Arithmetic shift left (absolute,X)
    LSR $27              ; 46 27 | Logical shift right (zero page)
    CLV                  ; B8 | Clear overflow flag
    CMP #$73             ; C9 73 | Compare accumulator (immediate)
    CMP $EF1D            ; CD 1D EF | Compare accumulator (absolute)
    LDY $003C,X          ; BC 3C 00 | Load from absolute,X into Y register
    ORA $3F68,X          ; 1D 68 3F | Logical OR with accumulator (absolute,X)
    CPY $3E              ; C4 3E | Compare Y register (zero page)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    BRA $5D              ; 80 5D | Branch always
    BRA $6F              ; 80 6F | Branch always
    BRA $7F              ; 80 7F | Branch always
    ADC ($89),Y          ; 71 89 | Add with carry ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $FCEC,X          ; FE EC FC | Increment (absolute,X)
    SBC $E1F9,Y          ; F9 F9 E1 | Subtract with carry (absolute,Y)
    SBC $14              ; E5 14 | Subtract with carry (zero page)
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    LDA $033F07          ; AF 07 3F 03 | Load from absolute long address into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    NOP                  ; EA | No operation
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    ADC $5322            ; 6D 22 53 | Add with carry (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $2D23            ; 6D 23 2D | Add with carry (absolute)
    AND $3F              ; 25 3F | Logical AND with accumulator (zero page)
    SBC $DF20            ; ED 20 DF | Subtract with carry (absolute)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    BIT $00D3            ; 2C D3 00 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    WDM #$3C             ; 42 3C | Reserved instruction
    WDM #$DB             ; 42 DB | Reserved instruction
    LDA $1C08            ; AD 08 1C | Load from absolute address into accumulator
    RTI                  ; 40 | Return from interrupt
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    WDM #$BD             ; 42 BD | Reserved instruction
    BPL $EF              ; 10 EF | Branch if positive
    INY                  ; C8 | Increment Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_115
; Address: $EABFA6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_115:
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    LDA                  ; BF 7F C0 40 | Load from absolute long,X into accumulator
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    CLV                  ; B8 | Clear overflow flag
    LDA                  ; BF 07 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 80 00 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF 00 E3 EB | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    ASL $1C1C,X          ; 1E 1C 1C | Arithmetic shift left (absolute,X)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    SED                  ; F8 | Set decimal mode flag
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    AND $2919            ; 2D 19 29 | Logical AND with accumulator (absolute)
    BIT $3A              ; 24 3A | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_116
; Address: $EABFE8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_116:
    JSL $16043F          ; 22 3F 04 16 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    AND $FF00            ; 2D 00 FF | Logical AND with accumulator (absolute)
    BPL $EF              ; 10 EF | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    ROL $46              ; 26 46 | Rotate left (zero page)
    BVC $04              ; 50 04 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    AND #$67             ; 29 67 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_117
; Address: $EAC00C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_117:
    JSR $4467            ; 20 67 44 | Jump to subroutine
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    BMI $DF              ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_118
; Address: $EAC016
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_118:
    JSR $04FF            ; 20 FF 04 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 3F C0 06 | Load from absolute long,X into accumulator
    ADC #$10             ; 69 10 | Add with carry (immediate)
    BIT $DEBB            ; 2C BB DE | Test bits in accumulator (absolute)
    ADC ($DE),Y          ; 71 DE | Add with carry ((zero page),Y)
    ADC ($BF,X)          ; 61 BF | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_119
; Address: $EAC02D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_119:
    JSR $921F            ; 20 1F 92 | Jump to subroutine
    BVS $0F              ; 70 0F | Branch if overflow set
    STA $009F00          ; 8F 00 9F 00 | Store accumulator to absolute long address
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    STA                  ; 9F 66 99 99 | Store accumulator to absolute long,X
    ROR $24              ; 66 24 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_11A
; Address: $EAC04E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_11A:
    STA $FF66,Y          ; 99 66 FF | Store accumulator to absolute,Y
    STA $9900,Y          ; 99 00 99 | Store accumulator to absolute,Y
    LDY $A930,X          ; BC 30 A9 | Load from absolute,X into Y register
    AND ($FA,X)          ; 21 FA | Logical AND with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    BMI $D8              ; 30 D8 | Branch if negative
    ADC $BB30,X          ; 7D 30 BB | Add with carry (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    DEC $CD00,X          ; DE 00 CD | Decrement (absolute,X)
    DEX                  ; CA | Decrement X register
    DEC $7A              ; C6 7A | Decrement (zero page)
    INC                  ; 1A | Increment accumulator
    ASL $6A              ; 06 6A | Arithmetic shift left (zero page)
    INC $CA              ; E6 CA | Increment (zero page)
    DEC $CA              ; C6 CA | Decrement (zero page)
    DEC $3A              ; C6 3A | Decrement (zero page)
    ASL $BA              ; 06 BA | Arithmetic shift left (zero page)
    STX $39              ; 86 39 | Store X register to zero page
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SBC $1900,Y          ; F9 00 19 | Subtract with carry (absolute,Y)
    AND $3900,Y          ; 39 00 39 | Logical AND with accumulator (absolute,Y)
    SBC $7900,Y          ; F9 00 79 | Subtract with carry (absolute,Y)
    BMI $A5              ; 30 A5 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_11B
; Address: $EAC0A3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_11B:
    JSR $20EA            ; 20 EA 20 | Jump to subroutine
    BMI $B8              ; 30 B8 | Branch if negative
    BMI $B5              ; 30 B5 | Branch if negative
    BMI $AB              ; 30 AB | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_11C
; Address: $EAC0AD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_11C:
    JSR $30F6            ; 20 F6 30 | Jump to subroutine
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $93              ; 80 93 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    JMP ($0400)          ; 6C 00 04 | Jump to address (absolute indirect)
    LDX $BC30,Y          ; BE 30 BC | Load from absolute,Y into X register
    BMI $AD              ; 30 AD | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_11D
; Address: $EAC0E5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_11D:
    JSR $20EF            ; 20 EF 20 | Jump to subroutine
    BMI $BE              ; 30 BE | Branch if negative
    BMI $A5              ; 30 A5 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_11E
; Address: $EAC0ED
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_11E:
    JSR $30FA            ; 20 FA 30 | Jump to subroutine
    DEX                  ; CA | Decrement X register
    DEC $CA              ; C6 CA | Decrement (zero page)
    DEC $BA              ; C6 BA | Decrement (zero page)
    STX $3A              ; 86 3A | Store X register to zero page
    ASL $CA              ; 06 CA | Arithmetic shift left (zero page)
    DEC $3A              ; C6 3A | Decrement (zero page)
    ASL $CA              ; 06 CA | Arithmetic shift left (zero page)
    DEC $DA              ; C6 DA | Decrement (zero page)
    DEC $39              ; C6 39 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_11F
; Address: $EAC112
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_11F:
    AND $7900,Y          ; 39 00 79 | Logical AND with accumulator (absolute,Y)
    SBC $3900,Y          ; F9 00 39 | Subtract with carry (absolute,Y)
    SBC $3900,Y          ; F9 00 39 | Subtract with carry (absolute,Y)
    AND $BC00,Y          ; 39 00 BC | Logical AND with accumulator (absolute,Y)
    BMI $A9              ; 30 A9 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_120
; Address: $EAC123
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_120:
    JSR $20E3            ; 20 E3 20 | Jump to subroutine
    BMI $BE              ; 30 BE | Branch if negative
    ROL $3F8B,X          ; 3E 8B 3F | Rotate left (absolute,X)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $6E00            ; 6E 00 6E | Rotate right (absolute)
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ROL $0000            ; 2E 00 00 | Rotate left (absolute)
    STZ $00              ; 64 00 | Store zero to zero page
    ADC $01              ; 65 01 | Add with carry (zero page)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $6400,X          ; FE 00 64 | Increment (absolute,X)
    CPY $4540            ; CC 40 45 | Compare Y register (absolute)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    STY $8000            ; 8C 00 80 | Store Y register to absolute address
    BRA $00              ; 80 00 | Branch always
    JMP $7F7F5C          ; 5C 5C 7F 7F | Jump to address long
    BRA $00              ; 80 00 | Branch always
    INC $FAFE,X          ; FE FE FA | Increment (absolute,X)
    INC $06FA,X          ; FE FA 06 | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL $CA              ; 06 CA | Arithmetic shift left (zero page)
    DEC $CA              ; C6 CA | Decrement (zero page)
    DEC $FF              ; C6 FF | Decrement (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    SBC $3900,Y          ; F9 00 39 | Subtract with carry (absolute,Y)
    AND $6400,Y          ; 39 00 64 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_121
; Address: $EAC1E2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_121:
    JSR $6400            ; 20 00 64 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    EOR $0D40            ; 4D 40 0D | Exclusive OR with accumulator (absolute)
    SBC $AD40            ; ED 40 AD | Subtract with carry (absolute)
    ADC $65              ; 65 65 | Add with carry (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank54_DmaFunction_122
; Address: $EAC21A
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_122:
    BRA $00              ; 80 00 | Branch always
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    LDX $FD00            ; AE 00 FD | Load from absolute address into X register
    BEQ $FA              ; F0 FA | Branch if equal
    BEQ $35              ; F0 35 | Branch if equal
    BMI $BA              ; 30 BA | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    ASL $3A              ; 06 3A | Arithmetic shift left (zero page)
    ASL $3A              ; 06 3A | Arithmetic shift left (zero page)
    ASL $CA              ; 06 CA | Arithmetic shift left (zero page)
    DEC $CA              ; C6 CA | Decrement (zero page)
    DEC $BA              ; C6 BA | Decrement (zero page)
    STX $BA              ; 86 BA | Store X register to zero page
    STX $CA              ; 86 CA | Store X register to zero page
    DEC $F9              ; C6 F9 | Decrement (zero page)
    SBC $F900,Y          ; F9 00 F9 | Subtract with carry (absolute,Y)
    AND $3900,Y          ; 39 00 39 | Logical AND with accumulator (absolute,Y)
    ADC $7900,Y          ; 79 00 79 | Add with carry (absolute,Y)
    AND $FE00,Y          ; 39 00 FE | Logical AND with accumulator (absolute,Y)
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ADC #$00             ; 69 00 | Add with carry (immediate)
    ORA $FF00,X          ; 1D 00 FF | Logical OR with accumulator (absolute,X)
    LDA                  ; BF 50 20 40 | Load from absolute long,X into accumulator
    ROL $46              ; 26 46 | Rotate left (zero page)
    BVC $2D              ; 50 2D | Branch if overflow clear
    AND $3003            ; 2D 03 30 | Logical AND with accumulator (absolute)
    BPL $2F              ; 10 2F | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    BPL $6F              ; 10 6F | Branch if positive
    ORA $0032            ; 0D 32 00 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $B100,X          ; 7E 00 B1 | Rotate right (absolute,X)
    BMI $B3              ; 30 B3 | Branch if negative
    BMI $B6              ; 30 B6 | Branch if negative
    BMI $AD              ; 30 AD | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_123
; Address: $EAC2CD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_123:
    JSR $30FA            ; 20 FA 30 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $8DED            ; ED ED 8D | Subtract with carry (absolute)
    STA $8092            ; 8D 92 80 | Store accumulator to absolute address
    TXA                  ; 8A | Transfer X register to accumulator
    STX $CA              ; 86 CA | Store X register to zero page
    DEC $FF              ; C6 FF | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    ADC $3900,Y          ; 79 00 39 | Add with carry (absolute,Y)
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    BPL $29              ; 10 29 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_124
; Address: $EAC306
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_124:
    BPL $29              ; 10 29 | Branch if positive
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    AND $2E15,Y          ; 39 15 2E | Logical AND with accumulator (absolute,Y)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_125
; Address: $EAC318
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_125:
    JSR $103F            ; 20 3F 10 | Jump to subroutine
    ASL $063F            ; 0E 3F 06 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA ($2C,X)          ; 01 2C | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_126
; Address: $EAC339
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_126:
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($1C,X)          ; 01 1C | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    JMP $BF00            ; 4C 00 BF | Jump to address
    LDA                  ; BF B3 B3 4C | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    JMP $FF00            ; 4C 00 FF | Jump to address
    DEX                  ; CA | Decrement X register
    DEC $CA              ; C6 CA | Decrement (zero page)
    DEC $CA              ; C6 CA | Decrement (zero page)
    DEC $CA              ; C6 CA | Decrement (zero page)
    DEC $02              ; C6 02 | Decrement (zero page)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    AND $3900,Y          ; 39 00 39 | Logical AND with accumulator (absolute,Y)
    AND $3900,Y          ; 39 00 39 | Logical AND with accumulator (absolute,Y)
    SBC $0100,Y          ; F9 00 01 | Subtract with carry (absolute,Y)
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    AND #$14             ; 29 14 | Logical AND with accumulator (immediate)
    AND #$16             ; 29 16 | Logical AND with accumulator (immediate)
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    ROL $7F20,X          ; 3E 20 7F | Rotate left (absolute,X)
    ADC ($7F,X)          ; 61 7F | Add with carry ((zero page,X))
    LDA $B7CADB          ; AF DB CA B7 | Load from absolute long address into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    LDY $1B              ; A4 1B | Load from zero page into Y register
    SBC $FB              ; E5 FB | Subtract with carry (zero page)
    AND $708F            ; 2D 8F 70 | Logical AND with accumulator (absolute)
    BVS $7F              ; 70 7F | Branch if overflow set
    SBC $A0FF,Y          ; F9 FF A0 | Subtract with carry (absolute,Y)
    LDA                  ; BF 13 FF DC | Load from absolute long,X into accumulator
    INY                  ; C8 | Increment Y register
    ROR                  ; 6A | Rotate right (accumulator)
    RTI                  ; 40 | Return from interrupt
    BVC $08              ; 50 08 | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_127
; Address: $EAC3CA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_127:
    BPL $10              ; 10 10 | Branch if positive
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_128
; Address: $EAC3DA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_128:
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    ADC $4407,X          ; 7D 07 44 | Add with carry (absolute,X)
    LDA ($45),Y          ; B1 45 | Load from (zero page),Y into accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    TAX                  ; AA | Transfer accumulator to X register
    LDA #$FE             ; A9 FE | Load immediate value into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_129
; Address: $EAC408
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_129:
    JSR $4020            ; 20 20 40 | Jump to subroutine
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    ROL $3E3F,X          ; 3E 3F 3E | Rotate left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_12A
; Address: $EAC423
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_12A:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    STX $128E            ; 8E 8E 12 | Store X register to absolute address
    ASL $C000,X          ; 1E 00 C0 | Arithmetic shift left (absolute,X)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $FC              ; 70 FC | Branch if overflow set
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    ROL $7E              ; 26 7E | Rotate left (zero page)
    ROR $9C7E,X          ; 7E 7E 9C | Rotate right (absolute,X)
    LDX $FE68,Y          ; BE 68 FE | Load from absolute,Y into X register
    INC $7F0B,X          ; FE 0B 7F | Increment (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    EOR ($BB,X)          ; 41 BB | Exclusive OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_12B
; Address: $EAC461
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_12B:
    ROL $7E42,X          ; 3E 42 7E | Rotate left (absolute,X)
    INC $FECA,X          ; FE CA FE | Increment (absolute,X)
    ORA $FD              ; 05 FD | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    INC $F4C0            ; EE C0 F4 | Increment (absolute)
    BRA $FC              ; 80 FC | Branch always
    SBC $F000,Y          ; F9 00 F0 | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    LDX #$10             ; A2 10 | Load immediate value into X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    AND $6D              ; 25 6D | Logical AND with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ADC $2D21            ; 6D 21 2D | Add with carry (absolute)
    BPL $53              ; 10 53 | Branch if positive
    AND $3F              ; 25 3F | Logical AND with accumulator (zero page)
    SBC $DF20            ; ED 20 DF | Subtract with carry (absolute)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    BIT $00D3            ; 2C D3 00 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    WDM #$DB             ; 42 DB | Reserved instruction
    LDA $AD              ; A5 AD | Load from zero page into accumulator
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    WDM #$BD             ; 42 BD | Reserved instruction
    BPL $EF              ; 10 EF | Branch if positive
    BRA $5E              ; 80 5E | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    BRA $C2              ; 80 C2 | Branch always
    STA $6DCAA2          ; 8F A2 CA 6D | Store accumulator to absolute long address
    STA $8AC2            ; 8D C2 8A | Store accumulator to absolute address
    BRA $FF              ; 80 FF | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$35             ; C0 35 | Compare Y register (immediate)
    CPY #$32             ; C0 32 | Compare Y register (immediate)
    CPY #$35             ; C0 35 | Compare Y register (immediate)
    CPY #$75             ; C0 75 | Compare Y register (immediate)
    STA $EC62,X          ; 9D 62 EC | Store accumulator to absolute,X
    PHY                  ; 5A | Push Y register to stack
    SBC $21              ; E5 21 | PPU graphics register access
    INC $190E            ; EE 0E 19 | Increment (absolute)
    ORA $FF00,Y          ; 19 00 FF | Logical OR with accumulator (absolute,Y)
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    DEC $1121,X          ; DE 21 11 | Decrement (absolute,X)
    CPX #$E6             ; E0 E6 | Compare X register (immediate)
    AND $2909            ; 2D 09 29 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_12C
; Address: $EAC506
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_12C:
    JSR $223A            ; 20 3A 22 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    AND $FF00            ; 2D 00 FF | Logical AND with accumulator (absolute)
    BPL $EF              ; 10 EF | Branch if positive
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    ASL $46              ; 06 46 | Arithmetic shift left (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    AND ($67,X)          ; 21 67 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_12D
; Address: $EAC52C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_12D:
    JSR $0467            ; 20 67 04 | Jump to subroutine
    EOR ($FE,X)          ; 41 FE | Exclusive OR with accumulator ((zero page,X))
    BMI $DF              ; 30 DF | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_12E
; Address: $EAC536
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_12E:
    JSR $04FF            ; 20 FF 04 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 66 8C 2A | Load from absolute long,X into accumulator
    INY                  ; C8 | Increment Y register
    LDX $C8              ; A6 C8 | Load from zero page into X register
    ADC #$81             ; 69 81 | Add with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    TXA                  ; 8A | Transfer X register to accumulator
    PHB                  ; 8B | Push data bank register to stack
    CPY $B8              ; C4 B8 | Compare Y register (zero page)
    AND ($C2),Y          ; 31 C2 | Logical AND with accumulator ((zero page),Y)
    REP #$31             ; C2 31 | Reset processor status bits
    DEC $36              ; C6 36 | Decrement (zero page)
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CPX #$03             ; E0 03 | Compare X register (immediate)
    PEA #$FFFE           ; F4 FE FF | Push effective address to stack
    LDX $FC              ; A6 FC | Load from zero page into X register
    INC $83FD,X          ; FE FD 83 | Increment (absolute,X)
    LDA                  ; BF A0 FB F4 | Load from absolute long,X into accumulator
    EOR $004A            ; 4D 4A 00 | Exclusive OR with accumulator (absolute)
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BCS $0D              ; B0 0D | Branch if carry set
    SBC $E2              ; E5 E2 | Subtract with carry (zero page)
    STY $E9E6            ; 8C E6 E9 | Store Y register to absolute address
    CPY $FFDC            ; CC DC FF | Compare Y register (absolute)
    STZ $FB9C            ; 9C 9C FB | Store zero to absolute
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_12F
; Address: $EAC591
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_12F:
    ORA $70              ; 05 70 | Logical OR with accumulator (zero page)
    BPL $07              ; 10 07 | Branch if positive
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    AND #$6F             ; 29 6F | Logical AND with accumulator (immediate)
    ORA $DE5F,Y          ; 19 5F DE | Logical OR with accumulator (absolute,Y)
    ORA $0B9F,X          ; 1D 9F 0B | Logical OR with accumulator (absolute,X)
    STA                  ; 9F 99 9F 04 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    BPL $77              ; 10 77 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_130
; Address: $EAC5D6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_130:
    JSR $2066            ; 20 66 20 | Jump to subroutine
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_132
; Address: $EAC5E0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_132:
    ROR $E7              ; 66 E7 | Rotate right (zero page)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    INC                  ; 1A | Increment accumulator
    INC $E3E1,X          ; FE E1 E3 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    SBC $FFEF,Y          ; F9 EF FF | Subtract with carry (absolute,Y)
    LDA                  ; BF FF 3D FF | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    ORA ($E7,X)          ; 01 E7 | Logical OR with accumulator ((zero page,X))
    ASL $C1              ; 06 C1 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BVC $00              ; 50 00 | Branch if overflow clear
    BRA $83              ; 80 83 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_133
; Address: $EAC602
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_133:
    JSR $9964            ; 20 64 99 | Jump to subroutine
    STA $D989,Y          ; 99 89 D9 | Store accumulator to absolute,Y
    SBC $ED              ; E5 ED | Subtract with carry (zero page)
    ROR $E7              ; 66 E7 | Rotate right (zero page)
    ROL $F6              ; 26 F6 | Rotate left (zero page)
    INC $FB00,X          ; FE 00 FB | Increment (absolute,X)
    SBC $FC10,Y          ; F9 10 FC | Subtract with carry (absolute,Y)
    PEA #$3727           ; F4 27 37 | Push effective address to stack
    REP #$D2             ; C2 D2 | Reset processor status bits
    INC $FE              ; E6 FE | Increment (zero page)
    SBC $F7FD,X          ; FD FD F7 | Subtract with carry (absolute,X)
    INY                  ; C8 | Increment Y register
    DEC $FF2D,X          ; DE 2D FF | Decrement (absolute,X)
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ADC $8F8D,Y          ; 79 8D 8F | Add with carry (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDA ($A1,X)          ; A1 A1 | Load from (zero page,X) into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    CMP ($F1),Y          ; D1 F1 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_134
; Address: $EAC64F
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_134:
    LDA                  ; BF 70 FA B8 | Load from absolute long,X into accumulator
    LSR $20FF,X          ; 5E FF 20 | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    ASL $40FF            ; 0E FF 40 | Arithmetic shift left (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    CLD                  ; D8 | Clear decimal mode flag
    DEC $1E12,X          ; DE 12 1E | Decrement (absolute,X)
    DEC $A3DF,X          ; DE DF A3 | Decrement (absolute,X)
    LDA                  ; BF 00 00 21 | Load from absolute long,X into accumulator
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))
    BRA $E7              ; 80 E7 | Branch always
    PHP                  ; 08 | Push processor status to stack
    SBC $EF00,X          ; FD 00 EF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_135
; Address: $EAC67A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_135:
    JSR $4081            ; 20 81 40 | Jump to subroutine
    BIT $322F            ; 2C 2F 32 | Test bits in accumulator (absolute)
    LDX $5EBE            ; AE BE 5E | Load from absolute address into X register
    INC $FF8F,X          ; FE 8F FF | Increment (absolute,X)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    BNE $FF              ; D0 FF | Branch if not equal
    CPY $FD              ; C4 FD | Compare Y register (zero page)
    EOR ($FD,X)          ; 41 FD | Exclusive OR with accumulator ((zero page,X))
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    LDA #$BF             ; A9 BF | Load immediate value into accumulator
    SBC #$FD             ; E9 FD | Subtract with carry (immediate)
    INC $F0FF,X          ; FE FF F0 | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPY $00EE            ; CC EE 00 | Compare Y register (absolute)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CPX #$07             ; E0 07 | Compare X register (immediate)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    DEC $CE              ; C6 CE | Decrement (zero page)
    CPY $78FE            ; CC FE 78 | Compare Y register (absolute)
    ROR $1810,X          ; 7E 10 18 | Rotate right (absolute,X)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_136
; Address: $EAC6CC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_136:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $2100            ; 2C 00 21 | PPU graphics register access
    BPL $00              ; 10 00 | Branch if positive
    ASL $6130            ; 0E 30 61 | Arithmetic shift left (absolute)
    ADC ($E1,X)          ; 61 E1 | Add with carry ((zero page,X))
    LDY #$F3             ; A0 F3 | Load immediate value into Y register
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_137
; Address: $EAC6E8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_137:
    JSR $C4F2            ; 20 F2 C4 | Jump to subroutine
    CPX $32              ; E4 32 | Compare X register (zero page)
    STZ $0C00,X          ; 9E 00 0C | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank54_DmaFunction_138
; Address: $EAC6F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_138:
    ORA $1B00            ; 0D 00 1B | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    REP #$FF             ; C2 FF | Reset processor status bits

;------------------------------------------------------------------------------
; Bank54_DmaFunction_139
; Address: $EAC704
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_139:
    JSR $A0F2            ; 20 F2 A0 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BVC $79              ; 50 79 | Branch if overflow clear
    BRA $F9              ; 80 F9 | Branch always
    BVS $FF              ; 70 FF | Branch if overflow set
    ORA $0700            ; 0D 00 07 | Logical OR with accumulator (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $FD              ; 80 FD | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_13A
; Address: $EAC722
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_13A:
    JSR $12FF            ; 20 FF 12 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    BVS $F9              ; 70 F9 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    STA $00              ; 85 00 | Store accumulator to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_13B
; Address: $EAC740
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_13B:
    JSR $0269            ; 20 69 02 | Jump to subroutine
    STZ $64              ; 64 64 | Store zero to zero page
    PLB                  ; AB | Pull data bank register from stack
    LDA                  ; BF CA DF EA | Load from absolute long,X into accumulator
    STA $7816FF          ; 8F FF 16 78 | Store accumulator to absolute long address
    AND $1B70            ; 2D 70 1B | Logical AND with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_13C
; Address: $EAC757
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_13C:
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_13D
; Address: $EAC75A
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_13D:
    JSR $00D5            ; 20 D5 00 | Jump to subroutine
    PEA #$FE58           ; F4 58 FE | Push effective address to stack
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    SBC $F696,Y          ; F9 96 F6 | Subtract with carry (absolute,Y)
    PHA                  ; 48 | Push accumulator to stack
    BRA $B0              ; 80 B0 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    ORA ($58,X)          ; 01 58 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $F1              ; 06 F1 | Arithmetic shift left (zero page)
    ORA #$E7             ; 09 E7 | Logical OR with accumulator (immediate)
    STZ $304C            ; 9C 4C 30 | Store zero to absolute
    BVC $00              ; 50 00 | Branch if overflow clear
    AND #$3F             ; 29 3F | Logical AND with accumulator (immediate)
    STA $E8288F          ; 8F 8F 28 E8 | Store accumulator to absolute long address
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$C9             ; C0 C9 | Compare Y register (immediate)
    BVS $C0              ; 70 C0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_13E
; Address: $EAC799
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_13E:
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $FFFF,Y          ; 99 FF FF | Store accumulator to absolute,Y
    BCC $94              ; 90 94 | Branch if carry clear
    ROR $017E            ; 6E 7E 01 | Rotate right (absolute)
    STA $F504            ; 8D 04 F5 | Store accumulator to absolute address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    STA ($1B,X)          ; 81 1B | Store accumulator to (zero page,X)
    STA $F10A            ; 8D 0A F1 | Store accumulator to absolute address
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    LDY $58B8,X          ; BC B8 58 | Load from absolute,X into Y register
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    CPX $EC14            ; EC 14 EC | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDY $DC04,X          ; BC 04 DC | Load from absolute,X into Y register
    CPX $7C20            ; EC 20 7C | Compare X register (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    BCC $FF              ; 90 FF | Branch if carry clear
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    NOP                  ; EA | No operation
    XBA                  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank54_DmaFunction_13F
; Address: $EAC822
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_13F:
    JSR $36FF            ; 20 FF 36 | Jump to subroutine
    LDA $FFFFFF          ; AF FF FF FF | Load from absolute long address into accumulator
    ROL $FF              ; 26 FF | Rotate left (zero page)
    LDA $FFFFFF          ; AF FF FF FF | Load from absolute long address into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCC $F8              ; 90 F8 | Branch if carry clear
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_140
; Address: $EAC872
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_140:
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BVS $F0              ; 70 F0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank54_DmaFunction_141
; Address: $EAC876
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_141:
    JSR $40E0            ; 20 E0 40 | Jump to subroutine
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $FF              ; 80 FF | Branch always
    STA ($5A,X)          ; 81 5A | Store accumulator to (zero page,X)
    LDX $A577,Y          ; BE 77 A5 | Load from absolute,Y into X register
    ROL                  ; 2A | Rotate left (accumulator)
    LDX $BD57            ; AE 57 BD | Load from absolute address into X register
    ROR $55AB,X          ; 7E AB 55 | Rotate right (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    INC $F701,X          ; FE 01 F7 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    LDX $FF51            ; AE 51 FF | Load from absolute address into X register
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    BRA $F0              ; 80 F0 | Branch always
    ASL $1C04            ; 0E 04 1C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $1E16,X          ; 1E 16 1E | Arithmetic shift left (absolute,X)
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0800            ; 0E 00 08 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF FF 34 FF | Load from absolute long,X into accumulator
    EOR $087D,Y          ; 59 7D 08 | Exclusive OR with accumulator (absolute,Y)
    BCC $BE              ; 90 BE | Branch if carry clear
    ASL $FFD0,X          ; 1E D0 FF | Arithmetic shift left (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    JMP $08DE            ; 4C DE 08 | Jump to address
    STZ $3C00            ; 9C 00 3C | Store zero to absolute
    CLC                  ; 18 | Clear carry flag
    ROL $FF46,X          ; 3E 46 FF | Rotate left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    INC $33FE,X          ; FE FE 33 | Increment (absolute,X)
    ORA $023F            ; 0D 3F 02 | Logical OR with accumulator (absolute)
    STA                  ; 9F 06 9F 18 | Store accumulator to absolute long,X
    ROL $FE24,X          ; 3E 24 FE | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_142
; Address: $EAC98E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_142:
    SBC $01FD,X          ; FD FD 01 | Subtract with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_144
; Address: $EAC99A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_144:
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    INC $FF7D,X          ; FE 7D FF | Increment (absolute,X)
    LDA                  ; BF A9 BF 90 | Load from absolute long,X into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROR $7F27,X          ; 7E 27 7F | Rotate right (absolute,X)
    STY $768C            ; 8C 8C 76 | Store Y register to absolute address
    ROL $E23E            ; 2E 3E E2 | Rotate left (absolute)
    INC $FC9C,X          ; FE 9C FC | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    STZ $FCC0            ; 9C C0 FC | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_145
; Address: $EAC9E8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_145:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $32              ; 30 32 | Branch if negative
    LSR $494E            ; 4E 4E 49 | Logical shift right (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    AND ($39),Y          ; 31 39 | Logical AND with accumulator ((zero page),Y)
    BPL $3F              ; 10 3F | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    BVS $2F              ; 70 2F | Branch if overflow set
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    INC                  ; 1A | Increment accumulator
    CLC                  ; 18 | Clear carry flag
    ASL $0E01,X          ; 1E 01 0E | Arithmetic shift left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    JMP $033E03          ; 5C 03 3E 03 | Jump to address long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_146
; Address: $EACA19
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_146:
    JSR $3827            ; 20 27 38 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    DEC $3802,X          ; DE 02 38 | Decrement (absolute,X)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BRA $70              ; 80 70 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_147
; Address: $EACA2E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_147:
    JSR $22F8            ; 20 F8 22 | Jump to subroutine
    DEC $3AE0,X          ; DE E0 3A | Decrement (absolute,X)
    CPY #$7C             ; C0 7C | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPX $1C              ; E4 1C | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_148
; Address: $EACA3C
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_148:
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA $13              ; 05 13 | Logical OR with accumulator (zero page)
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BMI $D0              ; 30 D0 | Branch if negative
    BMI $60              ; 30 60 | Branch if negative
    BCS $00              ; B0 00 | Branch if carry set
    INX                  ; E8 | Increment X register
    BCC $C8              ; 90 C8 | Branch if carry clear
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F0B            ; 0E 0B 0F | Arithmetic shift left (absolute)
    ORA $0C00            ; 0D 00 0C | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    BEQ $A0              ; F0 A0 | Branch if equal
    BVC $C0              ; 50 C0 | Branch if overflow clear
    BCC $E0              ; 90 E0 | Game work RAM access
    BCC $C0              ; 90 C0 | Branch if carry clear
    BCC $E0              ; 90 E0 | Game work RAM access
    BCC $60              ; 90 60 | Branch if carry clear
    BPL $60              ; 10 60 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_149
; Address: $EACAC0
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_149:
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    JMP $5780            ; 4C 80 57 | Jump to address
    BCC $2F              ; 90 2F | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    AND $6D30            ; 2D 30 6D | Logical AND with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    BVS $07              ; 70 07 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    ROL $D439            ; 2E 39 D4 | Rotate left (absolute)
    INX                  ; E8 | Increment X register
    INC $E0              ; E6 E0 | Game work RAM access
    CPX $08E0            ; EC E0 08 | Compare X register (absolute)
    BEQ $34              ; F0 34 | Branch if equal
    ASL $38C7,X          ; 1E C7 38 | Arithmetic shift left (absolute,X)
    BEQ $1E              ; F0 1E | Branch if equal
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_14A
; Address: $EACB3A
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_14A:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    WDM #$F6             ; 42 F6 | Reserved instruction
    NOP                  ; EA | No operation
    ROR                  ; 6A | Rotate right (accumulator)
    STA $BD00,X          ; 9D 00 BD | Store accumulator to absolute,X
    STA $9500,X          ; 9D 00 95 | Store accumulator to absolute,X
    STA $FD00,X          ; 9D 00 FD | Store accumulator to absolute,X
    STA $9D00,X          ; 9D 00 9D | Store accumulator to absolute,X
    ADC $A301,X          ; 7D 01 A3 | Add with carry (absolute,X)
    ROR $DC00,X          ; 7E 00 DC | Rotate right (absolute,X)
    LDY $00              ; A4 00 | Load from zero page into Y register
    INC $86FE,X          ; FE FE 86 | Increment (absolute,X)
    STX $DE02            ; 8E 02 DE | Store X register to absolute address
    PLX                  ; FA | Pull X register from stack
    SEP #$6A             ; E2 6A | Set processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $FD00,X          ; FD 00 FD | Subtract with carry (absolute,X)
    SBC $1D00,X          ; FD 00 1D | Subtract with carry (absolute,X)
    STA $9D00,X          ; 9D 00 9D | Store accumulator to absolute,X
    ASL $1F2C            ; 0E 2C 1F | Arithmetic shift left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    STX $E3FE            ; 8E FE E3 | Store X register to absolute address
    SBC ($3F),Y          ; F1 3F | Subtract with carry ((zero page),Y)
    LDA                  ; BF C1 D7 C7 | Load from absolute long,X into accumulator
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    WDM #$D6             ; 42 D6 | Reserved instruction
    WDM #$F6             ; 42 F6 | Reserved instruction
    DEX                  ; CA | Decrement X register
    WDM #$F6             ; 42 F6 | Reserved instruction
    STA $9D00,X          ; 9D 00 9D | Store accumulator to absolute,X
    LDA $BD00,X          ; BD 00 BD | Load from absolute,X into accumulator
    STA $9D00,X          ; 9D 00 9D | Store accumulator to absolute,X
    LDA $9D00,X          ; BD 00 9D | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_14E
; Address: $EACC6F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_14E:
    JSL $DD00DD          ; 22 DD 00 DD | Jump to subroutine long
    CMP $DD00,X          ; DD 00 DD | Compare accumulator (absolute,X)
    CMP $DD00,X          ; DD 00 DD | Compare accumulator (absolute,X)
    SBC $DD00,X          ; FD 00 DD | Subtract with carry (absolute,X)
    SBC $D361,Y          ; F9 61 D3 | Subtract with carry (absolute,Y)
    EOR ($C7,X)          ; 41 C7 | Exclusive OR with accumulator ((zero page,X))
    EOR ($EC,X)          ; 41 EC | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_14F
; Address: $EACC88
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_14F:
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 7F 93 00 | Load from absolute long,X into accumulator
    STZ $BE00,X          ; 9E 00 BE | Store zero to absolute,X
    LDX $9F00,Y          ; BE 00 9F | Load from absolute,Y into X register
    BRA $00              ; 80 00 | Branch always
    SEP #$62             ; E2 62 | Set processor status bits
    INC $62              ; E6 62 | Increment (zero page)
    INC $F662            ; EE 62 F6 | Increment (absolute)
    STZ $FE02,X          ; 9E 02 FE | Store zero to absolute,X
    INC $A6A6,X          ; FE A6 A6 | Increment (absolute,X)
    STA $9D00,X          ; 9D 00 9D | Store accumulator to absolute,X
    STA $9D00,X          ; 9D 00 9D | Store accumulator to absolute,X
    STA $FD00,X          ; 9D 00 FD | Store accumulator to absolute,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $1A00,Y          ; 59 00 1A | Exclusive OR with accumulator (absolute,Y)
    ASL $0E16            ; 0E 16 0E | Arithmetic shift left (absolute)
    ASL $0E05            ; 0E 05 0E | Arithmetic shift left (absolute)
    ORA $0106            ; 0D 06 01 | Logical OR with accumulator (absolute)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    JMP $1F1F23          ; 5C 23 1F 1F | Jump to address long
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_150
; Address: $EACCE4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_150:
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    XBA                  ; EB | Exchange accumulator bytes
    BVS $FD              ; 70 FD | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CMP ($B0,X)          ; C1 B0 | Compare accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    ADC ($80),Y          ; 71 80 | Add with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_151
; Address: $EACD18
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_151:
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    AND #$33             ; 29 33 | Logical AND with accumulator (immediate)
    SBC $FFC2,X          ; FD C2 FF | Subtract with carry (absolute,X)
    LDY $3471            ; AC 71 34 | Load from absolute address into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_152
; Address: $EACD4A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_152:
    AND $C434            ; 2D 34 C4 | Logical AND with accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    INC $FF0F            ; EE 0F FF | Increment (absolute)
    SBC $7D7F,X          ; FD 7F 7D | Subtract with carry (absolute,X)
    STA $1B7F,X          ; 9D 7F 1B | Store accumulator to absolute,X
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    AND $F3              ; 25 F3 | Logical AND with accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    LDA ($E8),Y          ; B1 E8 | Load from (zero page),Y into accumulator
    ORA $8ED1,X          ; 1D D1 8E | Logical OR with accumulator (absolute,X)
    STA $7783            ; 8D 83 77 | Store accumulator to absolute address
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    ADC $44EA            ; 6D EA 44 | Add with carry (absolute)
    LDA                  ; BF FF A9 7B | Load from absolute long,X into accumulator
    ADC $3C8B,X          ; 7D 8B 3C | Add with carry (absolute,X)
    SBC $8F44            ; ED 44 8F | Subtract with carry (absolute)
    CLV                  ; B8 | Clear overflow flag
    BCC $60              ; 90 60 | Branch if carry clear
    DEC $4E              ; C6 4E | Decrement (zero page)
    EOR $949B,Y          ; 59 9B 94 | Exclusive OR with accumulator (absolute,Y)
    ORA $1673,X          ; 1D 73 16 | Logical OR with accumulator (absolute,X)
    SBC ($F7,X)          ; E1 F7 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_153
; Address: $EACDC4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_153:
    JSR $6D00            ; 20 00 6D | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    ORA $FF00            ; 0D 00 FF | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    ADC $65              ; 65 65 | Add with carry (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF 00 9A 00 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    BPL $2F              ; 10 2F | Branch if positive
    STA                  ; 9F 20 4D B8 | Store accumulator to absolute long,X
    DEC $70              ; C6 70 | Decrement (zero page)
    PLA                  ; 68 | Pull accumulator from stack
    BMI $20              ; 30 20 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    SBC $E914,Y          ; F9 14 E9 | Subtract with carry (absolute,Y)
    LDY #$5E             ; A0 5E | Load immediate value into Y register
    LDX #$5E             ; A2 5E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_154
; Address: $EACE29
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_154:
    INC                  ; 1A | Increment accumulator
    LDY #$9C             ; A0 9C | Load immediate value into Y register
    CPY $0C              ; C4 0C | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ORA $3CFF            ; 0D FF 3C | Logical OR with accumulator (absolute)
    INC $FE3C,X          ; FE 3C FE | Increment (absolute,X)
    BRA $7C              ; 80 7C | Branch always
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_155
; Address: $EACE41
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_155:
    JSR $04B9            ; 20 B9 04 | Jump to subroutine
    ORA $2152,Y          ; 19 52 21 | PPU graphics register access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_156
; Address: $EACE4A
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_156:
    BVC $70              ; 50 70 | Branch if overflow clear
    BMI $70              ; 30 70 | Branch if negative
    SBC $F8F9,Y          ; F9 F9 F8 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    STA ($43,X)          ; 81 43 | Store accumulator to (zero page,X)
    SEI                  ; 78 | Set interrupt disable flag
    STA ($58,X)          ; 81 58 | Store accumulator to (zero page,X)
    BCS $50              ; B0 50 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $F8F8,Y          ; F9 F8 F8 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $D334,X          ; FD 34 D3 | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    DEC $69E1            ; CE E1 69 | Decrement (absolute)
    PEA #$A51D           ; F4 1D A5 | Push effective address to stack
    CPY $8F              ; C4 8F | Compare Y register (zero page)
    SBC $3100            ; ED 00 31 | Subtract with carry (absolute)
    SEP #$00             ; E2 00 | Set processor status bits
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    STA $FFFFFF          ; 8F FF FF FF | Store accumulator to absolute long address
    INC $FC01,X          ; FE 01 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BVS $8F              ; 70 8F | Branch if overflow set
    LDA                  ; BF 12 9F 10 | Load from absolute long,X into accumulator
    BVC $DD              ; 50 DD | Branch if overflow clear
    ADC ($E1),Y          ; 71 E1 | Add with carry ((zero page),Y)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LDX $1F              ; A6 1F | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_157
; Address: $EACEF6
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_157:
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    BCS $17              ; B0 17 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    LDY $8E07,X          ; BC 07 8E | Load from absolute,X into Y register
    ORA $90              ; 05 90 | Logical OR with accumulator (zero page)
    EOR #$D8             ; 49 D8 | Exclusive OR with accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    PHB                  ; 8B | Push data bank register to stack
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    LSR $F86F            ; 4E 6F F8 | Logical shift right (absolute)
    SED                  ; F8 | Set decimal mode flag
    ORA $B8              ; 05 B8 | Logical OR with accumulator (zero page)
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA $7DF0            ; 0D F0 7D | Logical OR with accumulator (absolute)
    CPX #$B1             ; E0 B1 | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SBC $9966,Y          ; F9 66 99 | Subtract with carry (absolute,Y)
    STA $FF00,Y          ; 99 00 FF | Store accumulator to absolute,Y
    ROR $24              ; 66 24 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    STA $FF66,Y          ; 99 66 FF | Store accumulator to absolute,Y
    STA $9900,Y          ; 99 00 99 | Store accumulator to absolute,Y
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_158
; Address: $EACF44
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_158:
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    CMP $7A              ; C5 7A | Compare accumulator (zero page)
    STA $7230            ; 8D 30 72 | Store accumulator to absolute address
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    ASL $F6F0            ; 0E F0 F6 | Arithmetic shift left (absolute)
    SBC $F300,Y          ; F9 00 F3 | Subtract with carry (absolute,Y)
    DEC $FC00            ; CE 00 FC | Decrement (absolute)
    BPL $05              ; 10 05 | Branch if positive
    BVS $35              ; 70 35 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    AND ($4F),Y          ; 31 4F | Logical AND with accumulator ((zero page),Y)
    BVS $00              ; 70 00 | Branch if overflow set
    PLY                  ; 7A | Pull Y register from stack
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$1B             ; E0 1B | Compare X register (immediate)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $60              ; 30 60 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_15A
; Address: $EACFA7
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_15A:
    JSR $3F7F            ; 20 7F 3F | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    LDA ($FB),Y          ; B1 FB | Load from (zero page),Y into accumulator
    LDA $3E7E,Y          ; B9 7E 3E | Load from absolute,Y into accumulator
    INC $E6              ; E6 E6 | Increment (zero page)
    INC $E6              ; E6 E6 | Increment (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $ED00            ; ED 00 ED | Subtract with carry (absolute)
    INC $CEEE            ; EE EE CE | Increment (absolute)
    DEC $CDCD            ; CE CD CD | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDA $CD00            ; AD 00 CD | Load from absolute address into accumulator
    RTI                  ; 40 | Return from interrupt
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $3C64,X          ; 1E 64 3C | Arithmetic shift left (absolute,X)
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    ROL $3F4D,X          ; 3E 4D 3F | Rotate left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_15B
; Address: $EAD036
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_15B:
    CMP ($3F),Y          ; D1 3F | Compare accumulator ((zero page),Y)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX $1400            ; EC 00 14 | Compare X register (absolute)
    ROR $18              ; 66 18 | Rotate right (zero page)
    AND $7F93,X          ; 3D 93 7F | Logical AND with accumulator (absolute,X)
    LDA $527E            ; AD 7E 52 | Load from absolute address into accumulator
    SED                  ; F8 | Set decimal mode flag
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    BEQ $FB              ; F0 FB | Branch if equal
    INC $FEF2,X          ; FE F2 FE | Increment (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY $E9FF            ; CC FF E9 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_15C
; Address: $EAD065
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_15C:
    CMP $63CE            ; CD CE 63 | Compare accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    CMP ($99),Y          ; D1 99 | Compare accumulator ((zero page),Y)
    EOR $BB57            ; 4D 57 BB | Exclusive OR with accumulator (absolute)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    TAY                  ; A8 | Transfer accumulator to Y register
    STZ $821B,X          ; 9E 1B 82 | Store zero to absolute,X
    DEC $C7              ; C6 C7 | Decrement (zero page)
    ROR $FEC5,X          ; 7E C5 FE | Rotate right (absolute,X)
    ROR $78              ; 66 78 | Rotate right (zero page)
    BIT $7E28            ; 2C 28 7E | Test bits in accumulator (absolute)
    CMP $C1              ; C5 C1 | Compare accumulator (zero page)
    DEC $B370            ; CE 70 B3 | Decrement (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ROR $3E24,X          ; 7E 24 3E | Rotate right (absolute,X)
    AND $3D              ; 25 3D | Logical AND with accumulator (zero page)
    CPY $E4              ; C4 E4 | Compare Y register (zero page)
    LDX $7FFF,Y          ; BE FF 7F | Load from absolute,Y into X register
    STA $FEC7FE          ; 8F FE C7 FE | Store accumulator to absolute long address
    DEC $FC              ; C6 FC | Decrement (zero page)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPX #$D9             ; E0 D9 | Compare X register (immediate)
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    LDY $F8              ; A4 F8 | Load from zero page into Y register
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    INX                  ; E8 | Increment X register
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC $1C00,X          ; 7D 00 1C | Add with carry (absolute,X)
    CMP #$BF             ; C9 BF | Compare accumulator (immediate)
    ROR $7F5E,X          ; 7E 5E 7F | Rotate right (absolute,X)
    LSR $8EFF,X          ; 5E FF 8E | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_15D
; Address: $EAD12A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_15D:
    LDA                  ; BF A0 FF F8 | Load from absolute long,X into accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_15E
; Address: $EAD148
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_15E:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    ROR $3E7F,X          ; 7E 7F 3E | Rotate right (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_15F
; Address: $EAD163
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_15F:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STX $8C              ; 86 8C | Store X register to zero page
    STX $1E10            ; 8E 10 1E | Store X register to absolute address
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    INC $FE72,X          ; FE 72 FE | Increment (absolute,X)
    SEP #$FE             ; E2 FE | Set processor status bits
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    ROL $7E              ; 26 7E | Rotate left (zero page)
    ROL $D87E,X          ; 3E 7E D8 | Rotate left (absolute,X)
    INC $7E88,X          ; FE 88 7E | Increment (absolute,X)
    LSR $BE              ; 46 BE | Logical shift right (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_160
; Address: $EAD1A0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_160:
    JSR $403E            ; 20 3E 40 | Jump to subroutine
    ROR $FE80,X          ; 7E 80 FE | Rotate right (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    ASL $16FB            ; 0E FB 16 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    DEX                  ; CA | Decrement X register
    INC $FE82,X          ; FE 82 FE | Increment (absolute,X)
    INC $FE4A,X          ; FE 4A FE | Increment (absolute,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_161
; Address: $EAD1BC
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_161:
    EOR $3EFF,X          ; 5D FF 3E | Exclusive OR with accumulator (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA $E0              ; 05 E0 | Game work RAM access
    INC                  ; 1A | Increment accumulator
    PLX                  ; FA | Pull X register from stack
    ORA $E5              ; 05 E5 | Logical OR with accumulator (zero page)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FB01,X          ; FE 01 FB | Increment (absolute,X)
    ORA $E7              ; 05 E7 | Logical OR with accumulator (zero page)
    ORA ($9D),Y          ; 11 9D | Logical OR with accumulator ((zero page),Y)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    INC $F801,X          ; FE 01 F8 | Increment (absolute,X)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BRA $62              ; 80 62 | Branch always
    STA $A542,Y          ; 99 42 A5 | Store accumulator to absolute,Y
    PHY                  ; 5A | Push Y register to stack
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    LDA $7E              ; A5 7E | Load from zero page into accumulator
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    AND $033E,X          ; 3D 3E 03 | Logical AND with accumulator (absolute,X)
    LDY $FFFF,X          ; BC FF FF | Load from absolute,X into Y register
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ROL $1B51            ; 2E 51 1B | Rotate left (absolute)
    STZ $00              ; 64 00 | Store zero to zero page
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_163
; Address: $EAD2A9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_163:
    JSR $2808            ; 20 08 28 | Jump to subroutine
    ORA #$19             ; 09 19 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($37),Y          ; 11 37 | Logical OR with accumulator ((zero page),Y)
    ORA #$29             ; 09 29 | Logical OR with accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_165
; Address: $EAD2C7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_165:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    BPL $14              ; 10 14 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($9890)          ; 6C 90 98 | Jump to address (absolute indirect)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_166
; Address: $EAD2D2
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_166:
    JSR $00A0            ; 20 A0 00 | Jump to subroutine
    BNE $10              ; D0 10 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    CPX $9490            ; EC 90 94 | Compare X register (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    EOR $84FB,Y          ; 59 FB 84 | Exclusive OR with accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    CPY $C383            ; CC 83 C3 | Compare Y register (absolute)
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    ROR $7C01,X          ; 7E 01 7C | Rotate right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    WDM #$7A             ; 42 7A | Reserved instruction
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    BRA $FE              ; 80 FE | Branch always
    STA ($FD,X)          ; 81 FD | Store accumulator to (zero page,X)
    SBC $FD83,X          ; FD 83 FD | Subtract with carry (absolute,X)
    SBC $F487,Y          ; F9 87 F4 | Subtract with carry (absolute,Y)
    STA $4620D6          ; 8F D6 20 46 | Store accumulator to absolute long address
    LDY #$24             ; A0 24 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_167
; Address: $EAD326
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_167:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    EOR $9BBF,Y          ; 59 BF 9B | Exclusive OR with accumulator (absolute,Y)
    STA                  ; 9F FF BF FF | Store accumulator to absolute long,X
    BMI $FF              ; 30 FF | Branch if negative
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_168
; Address: $EAD342
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_168:
    CLC                  ; 18 | Clear carry flag
    BPL $5C              ; 10 5C | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROR $04              ; 66 04 | Rotate right (zero page)
    INC $04              ; E6 04 | Increment (zero page)
    LDX $20              ; A6 20 | Load from zero page into X register
    SBC $FA              ; E5 FA | Subtract with carry (zero page)
    SEP #$FF             ; E2 FF | Set processor status bits
    STA $19FF,Y          ; 99 FF 19 | Store accumulator to absolute,Y
    EOR $BEFF,Y          ; 59 FF BE | Exclusive OR with accumulator (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    INC $7E00,X          ; FE 00 7E | Increment (absolute,X)
    BRA $5A              ; 80 5A | Branch always
    LDY $BE              ; A4 BE | Load from zero page into Y register
    RTI                  ; 40 | Return from interrupt
    DEC $D420,X          ; DE 20 D4 | Decrement (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    PHX                  ; DA | Push X register to stack
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    STA ($3F,X)          ; 81 3F | Store accumulator to (zero page,X)
    CMP ($1F,X)          ; C1 1F | Compare accumulator ((zero page,X))
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SBC ($3E,X)          ; E1 3E | Subtract with carry ((zero page,X))
    EOR ($3E,X)          ; 41 3E | Exclusive OR with accumulator ((zero page,X))
    EOR ($2A,X)          ; 41 2A | Exclusive OR with accumulator ((zero page,X))
    EOR #$3E             ; 49 3E | Exclusive OR with accumulator (immediate)
    EOR ($1E,X)          ; 41 1E | Exclusive OR with accumulator ((zero page,X))
    ADC ($3B,X)          ; 61 3B | Add with carry ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    INC $FE81,X          ; FE 81 FE | Increment (absolute,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $77              ; 80 77 | Branch always
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    ASL $387F            ; 0E 7F 38 | Arithmetic shift left (absolute)
    CPX #$72             ; E0 72 | Compare X register (immediate)
    STY $9240            ; 8C 40 92 | Store Y register to absolute address
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_16A
; Address: $EAD3B9
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_16A:
    STA $013F03          ; 8F 03 3F 01 | Store accumulator to absolute long address
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND ($5C,X)          ; 21 5C | Logical AND with accumulator ((zero page,X))
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    SBC ($FC,X)          ; E1 FC | Subtract with carry ((zero page,X))
    AND $0F7E,Y          ; 39 7E 0F | Logical AND with accumulator (absolute,Y)
    BIT $5473            ; 2C 73 54 | Test bits in accumulator (absolute)
    AND $AF00,X          ; 3D 00 AF | Logical AND with accumulator (absolute,X)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    BRA $F9              ; 80 F9 | Branch always
    STA ($DE,X)          ; 81 DE | Store accumulator to (zero page,X)
    BIT #$AE             ; 89 AE | Test bits in accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    ORA $3F62,X          ; 1D 62 3F | Logical OR with accumulator (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    ADC $D682,X          ; 7D 82 D6 | Add with carry (absolute,X)
    AND #$EF             ; 29 EF | Logical AND with accumulator (immediate)
    BPL $7F              ; 10 7F | Branch if positive
    BRA $F5              ; 80 F5 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_16B
; Address: $EAD40F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_16B:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_16C
; Address: $EAD440
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_16C:
    JSR $0070            ; 20 70 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_16D
; Address: $EAD448
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_16D:
    JSR $0030            ; 20 30 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BVS $20              ; 70 20 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank54_DmaFunction_16E
; Address: $EAD44F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_16E:
    BMI $00              ; 30 00 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BNE $C7              ; D0 C7 | Branch if not equal
    LDA                  ; BF 84 D2 80 | Load from absolute long,X into accumulator
    BRA $D8              ; 80 D8 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX $DA80            ; EC 80 DA | Compare X register (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$57             ; 09 57 | Logical OR with accumulator (immediate)
    LSR $22              ; 46 22 | Logical shift right (zero page)
    PEA #$F48F           ; F4 8F F4 | Push effective address to stack
    STA $F08FF4          ; 8F F4 8F F0 | Store accumulator to absolute long address
    STA $F08FF0          ; 8F F0 8F F0 | Store accumulator to absolute long address
    STA $D99FE8          ; 8F E8 9F D9 | Store accumulator to absolute long address
    LDA                  ; BF 98 8F 90 | Load from absolute long,X into accumulator
    STA                  ; 9F 80 1F A0 | Store accumulator to absolute long,X
    BRA $3F              ; 80 3F | Branch always
    BRA $3F              ; 80 3F | Branch always
    STA ($3E,X)          ; 81 3E | Store accumulator to (zero page,X)
    STA ($3F,X)          ; 81 3F | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_171
; Address: $EAD4B6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_171:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$13             ; E0 13 | Compare X register (immediate)
    CPX #$03             ; E0 03 | Compare X register (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    DEC $DE20,X          ; DE 20 DE | Decrement (absolute,X)
    LDY #$EA             ; A0 EA | Load immediate value into Y register
    CPX $EED2            ; EC D2 EE | Compare X register (absolute)
    BNE $EE              ; D0 EE | Branch if not equal
    BEQ $E2              ; F0 E2 | Branch if equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_172
; Address: $EAD4EE
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_172:
    LDY #$7E             ; A0 7E | Load immediate value into Y register
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    SBC ($0F,X)          ; E1 0F | Subtract with carry ((zero page,X))
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    SBC $6817,Y          ; F9 17 68 | Subtract with carry (absolute,Y)
    AND $3F52            ; 2D 52 3F | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    LSR $5E3F,X          ; 5E 3F 5E | Logical shift right (absolute,X)
    ROR $5233,X          ; 7E 33 52 | Rotate right (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $E1              ; 80 E1 | Branch always
    STZ $92E1,X          ; 9E E1 92 | Store zero to absolute,X
    SBC ($92,X)          ; E1 92 | Subtract with carry ((zero page,X))
    SBC $009E            ; ED 9E 00 | Subtract with carry (absolute)
    STX $86              ; 86 86 | Store X register to zero page
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    TXA                  ; 8A | Transfer X register to accumulator
    ADC $20FF,Y          ; 79 FF 20 | Add with carry (absolute,Y)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    DEC $DEFF,X          ; DE FF DE | Decrement (absolute,X)
    BVS $50              ; 70 50 | Branch if overflow set
    STA $FDDE            ; 8D DE FD | Store accumulator to absolute address
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    AND ($52,X)          ; 21 52 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_173
; Address: $EAD55C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_173:
    JSR $AF51            ; 20 51 AF | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    ROR $CACC,X          ; 7E CC CA | Rotate right (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    ADC $4987,Y          ; 79 87 49 | Add with carry (absolute,Y)
    EOR #$37             ; 49 37 | Exclusive OR with accumulator (immediate)
    SBC $0301,Y          ; F9 01 03 | Subtract with carry (absolute,Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank54_DmaFunction_174
; Address: $EAD5A5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_174:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    JMP $5C22            ; 4C 22 5C | Jump to address
    ROL $5D              ; 26 5D | Rotate left (zero page)
    ROL $79              ; 26 79 | Rotate left (zero page)
    ASL $3F              ; 06 3F | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_175
; Address: $EAD60D
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_175:
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    CMP ($BF),Y          ; D1 BF | Compare accumulator ((zero page),Y)
    CMP ($BF,X)          ; C1 BF | Compare accumulator ((zero page,X))
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    LDA                  ; BF 80 B0 83 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $F9F1,Y          ; 19 F1 F9 | Logical OR with accumulator (absolute,Y)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    SBC $FFF9,Y          ; F9 F9 FF | Subtract with carry (absolute,Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    CLV                  ; B8 | Clear overflow flag
    BRA $7C              ; 80 7C | Branch always
    BRA $60              ; 80 60 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_177
; Address: $EAD66D
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_177:
    JSR $0101            ; 20 01 01 | Jump to subroutine
    SBC $FF01,X          ; FD 01 FF | Subtract with carry (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $3FFF,X          ; FE FF 3F | Increment (absolute,X)
    LSR $5332,X          ; 5E 32 53 | Logical shift right (absolute,X)
    LSR $5E3F,X          ; 5E 3F 5E | Logical shift right (absolute,X)
    ASL $0061,X          ; 1E 61 00 | Arithmetic shift left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    SBC ($92,X)          ; E1 92 | Subtract with carry ((zero page,X))
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    SBC ($92,X)          ; E1 92 | Subtract with carry ((zero page,X))
    SBC ($9E,X)          ; E1 9E | Subtract with carry ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $FF94            ; 9C 94 FF | Store zero to absolute
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    DEC $DEFF,X          ; DE FF DE | Decrement (absolute,X)
    SBC $0002,X          ; FD 02 00 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_178
; Address: $EAD6D0
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_178:
    JSR $2052            ; 20 52 20 | Jump to subroutine
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    AND ($52,X)          ; 21 52 | Logical AND with accumulator ((zero page,X))
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $F88A            ; 8C 8A F8 | Store Y register to absolute address
    ROR $7AFC,X          ; 7E FC 7A | Rotate right (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    SBC $F907,Y          ; F9 07 F9 | Subtract with carry (absolute,Y)
    EOR #$87             ; 49 87 | Exclusive OR with accumulator (immediate)
    ADC $01FF,Y          ; 79 FF 01 | Add with carry (absolute,Y)
    INC $3BFF,X          ; FE FF 3B | Increment (absolute,X)
    ASL $3F61,X          ; 1E 61 3F | Arithmetic shift left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ADC #$00             ; 69 00 | Add with carry (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_179
; Address: $EAD719
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_179:
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    SBC $BF02,X          ; FD 02 BF | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank54_DmaFunction_17B
; Address: $EAD729
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_17B:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    DEC                  ; 3A | Decrement accumulator
    EOR $3E              ; 45 3E | Exclusive OR with accumulator (zero page)
    EOR ($2D,X)          ; 41 2D | Exclusive OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ADC $00              ; 65 00 | Add with carry (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FE              ; 80 FE | Branch always
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FC,X)          ; 81 FC | Store accumulator to (zero page,X)
    INC $FF81,X          ; FE 81 FF | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    SBC $0202,X          ; FD 02 02 | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    AND ($71,X)          ; 21 71 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_17C
; Address: $EAD7CE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_17C:
    JSR $00A9            ; 20 A9 00 | Jump to subroutine
    SBC $0002,X          ; FD 02 00 | Subtract with carry (absolute,X)
    SBC $2500,X          ; FD 00 25 | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDY $F442,X          ; BC 42 F4 | Load from absolute,X into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_17D
; Address: $EAD7EE
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_17D:
    LDY $0052            ; AC 52 00 | Load from absolute address into Y register
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F 9F 91 91 | Store accumulator to absolute long,X
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA ($0E),Y          ; 91 0E | Store accumulator to (zero page),Y
    STA                  ; 9F 06 EF 00 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ROL $3E41,X          ; 3E 41 3E | Rotate left (absolute,X)
    EOR ($2A,X)          ; 41 2A | Exclusive OR with accumulator ((zero page,X))
    EOR #$3E             ; 49 3E | Exclusive OR with accumulator (immediate)
    EOR ($1F,X)          ; 41 1F | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_17E
; Address: $EAD86F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_17E:
    RTI                  ; 40 | Return from interrupt
    INC $FE81,X          ; FE 81 FE | Increment (absolute,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    BRA $73              ; 80 73 | Branch always
    STY $9200            ; 8C 00 92 | Store Y register to absolute address
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    EOR #$12             ; 49 12 | Exclusive OR with accumulator (immediate)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    BVS $D9              ; 70 D9 | Branch if overflow set
    BVC $A9              ; 50 A9 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank54_DmaFunction_17F
; Address: $EAD8A5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_17F:
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    SBC $AC02,X          ; FD 02 AC | Subtract with carry (absolute,X)
    BVC $53              ; 50 53 | Branch if overflow clear
    LDA $F906            ; AD 06 F9 | Load from absolute address into accumulator
    PHX                  ; DA | Push X register to stack
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    AND $01              ; 25 01 | Logical AND with accumulator (zero page)
    INC $DE01,X          ; FE 01 DE | Increment (absolute,X)
    STA $DCAE            ; 8D AE DC | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank54_DmaFunction_180
; Address: $EAD8C1
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_180:
    JSL $7C06F8          ; 22 F8 06 7C | Jump to subroutine long
    ROL                  ; 2A | Rotate left (accumulator)
    CPX $FC12            ; EC 12 FC | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    INC $1C              ; E6 1C | Increment (zero page)
    SEP #$FF             ; E2 FF | Set processor status bits
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    STA $0F0F8F          ; 8F 8F 0F 0F | Store accumulator to absolute long address
    DEC $EF              ; C6 EF | Decrement (zero page)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    STA $008900          ; 8F 00 89 00 | Store accumulator to absolute long address
    ROL $7F3E,X          ; 3E 3E 7F | Rotate left (absolute,X)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_181
; Address: $EAD959
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_181:
    JSL $364100          ; 22 00 41 36 | Jump to subroutine long
    ROL $413E,X          ; 3E 3E 41 | Rotate left (absolute,X)
    EOR ($49,X)          ; 41 49 | Exclusive OR with accumulator ((zero page,X))
    EOR #$33             ; 49 33 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_182
; Address: $EAD979
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_182:
    JSL $367F3E          ; 22 3E 7F 36 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive
    AND $20              ; 25 20 | Logical AND with accumulator (zero page)
    ROL $00              ; 26 00 | Rotate left (zero page)
    ROR $5F00            ; 6E 00 5F | Rotate right (absolute)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BRA $60              ; 80 60 | Branch always
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_183
; Address: $EAD9B3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_183:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BPL $BF              ; 10 BF | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_184
; Address: $EAD9CE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_184:
    STA $FF6987          ; 8F 87 69 FF | Store accumulator to absolute long address
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    STZ $707F            ; 9C 7F 70 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank54_DmaFunction_185
; Address: $EAD9E0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_185:
    JSR $0073            ; 20 73 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $8102,X          ; 7E 02 81 | Rotate right (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ASL $8D              ; 06 8D | Arithmetic shift left (zero page)
    DEC $FEFD,X          ; DE FD FE | Decrement (absolute,X)
    INC $81FF,X          ; FE FF 81 | Increment (absolute,X)
    ROR $01FF,X          ; 7E FF 01 | Rotate right (absolute,X)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_187
; Address: $EADA0B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_187:
    JSL $DCC6F8          ; 22 F8 C6 DC | Jump to subroutine long
    LDX #$FF             ; A2 FF | Load immediate value into X register
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    AND ($2F,X)          ; 21 2F | Logical AND with accumulator ((zero page,X))
    SBC ($DF),Y          ; F1 DF | Subtract with carry ((zero page),Y)
    SBC ($2F,X)          ; E1 2F | Subtract with carry ((zero page,X))
    SBC ($DF),Y          ; F1 DF | Subtract with carry ((zero page),Y)
    SBC ($3F,X)          ; E1 3F | Subtract with carry ((zero page,X))
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ADC ($3F),Y          ; 71 3F | Add with carry ((zero page),Y)
    BEQ $7F              ; F0 7F | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    INX                  ; E8 | Increment X register
    CPX #$F4             ; E0 F4 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    PEA #$E818           ; F4 18 E8 | Push effective address to stack
    BMI $28              ; 30 28 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_188
; Address: $EADA69
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_188:
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    INC $9DFC,X          ; FE FC 9D | Increment (absolute,X)
    STZ $0018            ; 9C 18 00 | Store zero to absolute
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    CPX $00              ; E4 00 | Compare X register (zero page)
    ADC $1D79,Y          ; 79 79 1D | Add with carry (absolute,Y)
    ORA $2626,X          ; 1D 26 26 | Logical OR with accumulator (absolute,X)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    ROL $7F00,X          ; 3E 00 7F | Rotate left (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)
    BPL $59              ; 10 59 | Branch if positive
    ADC $7D00,X          ; 7D 00 7D | Add with carry (absolute,X)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_18B
; Address: $EADAFD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_18B:
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $0C              ; F0 0C | Branch if equal
    EOR ($1E),Y          ; 51 1E | Exclusive OR with accumulator ((zero page),Y)
    JMP $641C            ; 4C 1C 64 | Jump to address
    BRA $80              ; 80 80 | Branch always
    INC $FD81,X          ; FE 81 FD | Increment (absolute,X)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ROL $7F00,X          ; 3E 00 7F | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_18C
; Address: $EADB29
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_18C:
    BRA $00              ; 80 00 | Branch always
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_18D
; Address: $EADB36
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_18D:
    JSR $7FDF            ; 20 DF 7F | Jump to subroutine
    BRA $FF              ; 80 FF | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $080F,X          ; 3E 0F 08 | Rotate left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SBC $0002,X          ; FD 02 00 | Subtract with carry (absolute,X)
    INC $01FF,X          ; FE FF 01 | Increment (absolute,X)
    INC $F8F7,X          ; FE F7 F8 | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_18E
; Address: $EADB81
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_18E:
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $20              ; F0 20 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $01              ; 80 01 | Branch always
    DEC $100F            ; CE 0F 10 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    BMI $FF              ; 30 FF | Branch if negative
    CMP ($5B),Y          ; D1 5B | Compare accumulator ((zero page),Y)
    STA ($11),Y          ; 91 11 | Store accumulator to (zero page),Y
    CMP ($01,X)          ; C1 01 | Compare accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    LDY $00              ; A4 00 | Load from zero page into Y register
    LDY $EE00            ; AC 00 EE | Load from absolute address into Y register
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    STA $8D8C            ; 8D 8C 8D | Store accumulator to absolute address
    STY $8C8D            ; 8C 8D 8C | Store Y register to absolute address
    ASL $FC00            ; 0E 00 FC | Arithmetic shift left (absolute)
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $73              ; F0 73 | Branch if equal
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    PEA #$00F4           ; F4 F4 00 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    ORA $CDFF            ; 0D FF CD | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    INX                  ; E8 | Increment X register
    CPX $E5              ; E4 E5 | Compare X register (zero page)
    EOR #$40             ; 49 40 | Exclusive OR with accumulator (immediate)
    LSR $5740            ; 4E 40 57 | Logical shift right (absolute)
    PHA                  ; 48 | Push accumulator to stack
    ORA $0E11            ; 0D 11 0E | Logical OR with accumulator (absolute)
    ORA #$E8             ; 09 E8 | Logical OR with accumulator (immediate)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_18F
; Address: $EADC60
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_18F:
    PHP                  ; 08 | Push processor status to stack
    ASL $3E0E,X          ; 1E 0E 3E | Arithmetic shift left (absolute,X)
    STZ $16D6,X          ; 9E D6 16 | Store zero to absolute,X
    AND $A4              ; 25 A4 | Logical AND with accumulator (zero page)
    CMP $44              ; C5 44 | Compare accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    SBC $0080,Y          ; F9 80 00 | Subtract with carry (absolute,Y)
    ASL $110E            ; 0E 0E 11 | Arithmetic shift left (absolute)
    ASL $16A1,X          ; 1E A1 16 | Arithmetic shift left (absolute,X)
    SBC #$24             ; E9 24 | Subtract with carry (immediate)
    BRA $7F              ; 80 7F | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_190
; Address: $EADC88
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_190:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    BPL $D0              ; 10 D0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $15              ; 10 15 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STX $5401            ; 8E 01 54 | Store X register to absolute address
    STA $AB              ; 85 AB | Store accumulator to zero page
    INC $4B41,X          ; FE 41 4B | Increment (absolute,X)
    LDA ($08),Y          ; B1 08 | Load from (zero page),Y into accumulator
    ROR $BE00,X          ; 7E 00 BE | Rotate right (absolute,X)
    PEA #$F708           ; F4 08 F7 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    DEY                  ; 88 | Decrement Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_191
; Address: $EADCF8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_191:
    JSR $F000            ; 20 00 F0 | Jump to subroutine
    BVC $00              ; 50 00 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    REP #$24             ; C2 24 | Reset processor status bits
    CLC                  ; 18 | Clear carry flag
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    AND $77              ; 25 77 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_194
; Address: $EADD25
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_194:
    STZ $4100            ; 9C 00 41 | Store zero to absolute
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $30              ; 10 30 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    ROL $047F,X          ; 3E 7F 04 | Rotate left (absolute,X)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    BPL $10              ; 10 10 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $14              ; 10 14 | Branch if positive
    PEA #$04F4           ; F4 F4 04 | Push effective address to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $00FF            ; ED FF 00 | Subtract with carry (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ORA $0162,X          ; 1D 62 01 | Logical OR with accumulator (absolute,X)
    ASL $0302,X          ; 1E 02 03 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $DB3B2F          ; 8F 2F 3B DB | Store accumulator to absolute long address
    BIT #$01             ; 89 01 | Test bits in accumulator (immediate)
    ORA $7901,Y          ; 19 01 79 | Logical OR with accumulator (absolute,Y)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $1B              ; F0 1B | Branch if equal
    CPX $23              ; E4 23 | Compare X register (zero page)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$27             ; C0 27 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    ORA $0522,Y          ; 19 22 05 | Logical OR with accumulator (absolute,Y)
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_195
; Address: $EADE0A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_195:
    ADC $0B              ; 65 0B | Add with carry (zero page)
    ORA $2758            ; 0D 58 27 | Logical OR with accumulator (absolute)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_196
; Address: $EADE12
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_196:
    JSR $10DF            ; 20 DF 10 | Jump to subroutine
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $8E              ; 64 8E | Store zero to zero page
    DEC $3A              ; C6 3A | Decrement (zero page)
    JMP ($309C)          ; 6C 9C 30 | Jump to address (absolute indirect)
    BNE $10              ; D0 10 | Branch if not equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA $0853            ; 0D 53 08 | Logical OR with accumulator (absolute)
    LSR $F520,X          ; 5E 20 F5 | Logical shift right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    WDM #$B4             ; 42 B4 | Reserved instruction
    STA ($62,X)          ; 81 62 | Store accumulator to (zero page,X)
    WDM #$C1             ; 42 C1 | Reserved instruction
    PLX                  ; FA | Pull X register from stack
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVC $88              ; 50 88 | Branch if overflow clear
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BRA $60              ; 80 60 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $20              ; 05 20 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BPL $3F              ; 10 3F | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_197
; Address: $EADED4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_197:
    INC                  ; 1A | Increment accumulator
    BMI $30              ; 30 30 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BEQ $20              ; F0 20 | Branch if equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $01              ; 80 01 | Branch always
    DEC $7725            ; CE 25 77 | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    BMI $FF              ; 30 FF | Branch if negative
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_198
; Address: $EADF4B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_198:
    JSR $100F            ; 20 0F 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    ASL $121E,X          ; 1E 1E 12 | Arithmetic shift left (absolute,X)
    ASL $1E0C,X          ; 1E 0C 1E | Arithmetic shift left (absolute,X)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    SBC $B5FD,X          ; FD FD B5 | Subtract with carry (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    STX $4A              ; 86 4A | Store X register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    STY $DE8C            ; 8C 8C DE | Store Y register to absolute address
    DEC $ADAD,X          ; DE AD AD | Decrement (absolute,X)
    LDA $ADAD            ; AD AD AD | Load from absolute address into accumulator
    LDA $0000            ; AD 00 00 | Load from absolute address into accumulator
    STY $5200            ; 8C 00 52 | Store Y register to absolute address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_19A
; Address: $EADFC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_19A:
    BEQ $F0              ; F0 F0 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_19B
; Address: $EADFD9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_19B:
    BCC $90              ; 90 90 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $F8              ; 90 F8 | Branch if carry clear
    BCC $F8              ; 90 F8 | Branch if carry clear
    ASL $1F0E            ; 0E 0E 1F | Arithmetic shift left (absolute)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_19D
; Address: $EADFFB
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_19D:
    JSR $3F1B            ; 20 1B 3F | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ADC $FF7D,X          ; 7D 7D FF | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    ADC $6DFF            ; 6D FF 6D | Add with carry (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    BCS $F8              ; B0 F8 | Branch if carry set
    BCS $F8              ; B0 F8 | Branch if carry set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_19F
; Address: $EAE063
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_19F:
    STZ $4100            ; 9C 00 41 | Store zero to absolute
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $30              ; 10 30 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    LDX $C4FF,Y          ; BE FF C4 | Load from absolute,Y into X register
    SBC $FF              ; E5 FF | Subtract with carry (zero page)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BNE $FF              ; D0 FF | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1A0
; Address: $EAE0A1
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1A0:
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BPL $0F              ; 10 0F | Branch if positive
    BMI $1F              ; 30 1F | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1A1
; Address: $EAE0AF
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1A1:
    JSR $F0E0            ; 20 E0 F0 | Jump to subroutine
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ASL $003F,X          ; 1E 3F 00 | Arithmetic shift left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    STY $84              ; 84 84 | Store Y register to zero page
    SBC $00              ; E5 00 | Subtract with carry (zero page)
    EOR $9D00            ; 4D 00 9D | Exclusive OR with accumulator (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    AND ($21,X)          ; 21 21 | PPU graphics register access
    DEC $00DE,X          ; DE DE 00 | Decrement (absolute,X)
    LDA $AD00            ; AD 00 AD | Load from absolute address into accumulator
    LDA $FF00            ; AD 00 FF | Load from absolute address into accumulator
    DEC $0000,X          ; DE 00 00 | Decrement (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1A4
; Address: $EAE168
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1A4:
    SBC $B8FD,X          ; FD FD B8 | Subtract with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    ADC $00FF            ; 6D FF 00 | Add with carry (absolute)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BCS $F8              ; B0 F8 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    CMP $E0              ; C5 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1A6
; Address: $EAE205
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1A6:
    JSR $601F            ; 20 1F 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1A7
; Address: $EAE21F
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1A7:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FFFD,X          ; FD FD FF | Subtract with carry (absolute,X)
    STA $BD8D            ; 8D 8D BD | Store accumulator to absolute address
    LDA $9D9D,X          ; BD 9D 9D | Load from absolute,X into accumulator
    SBC $8600,X          ; FD 00 86 | Subtract with carry (absolute,X)
    WDM #$FF             ; 42 FF | Reserved instruction
    AND $7B39,Y          ; 39 39 7B | Logical AND with accumulator (absolute,Y)
    SBC $8DFD,X          ; FD FD 8D | Subtract with carry (absolute,X)
    STA $4D4D            ; 8D 4D 4D | Store accumulator to absolute address
    AND $4A00,Y          ; 39 00 4A | Logical AND with accumulator (absolute,Y)
    STX $FF72            ; 8E 72 FF | Store X register to absolute address
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    ADC $65              ; 65 65 | Add with carry (zero page)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC $BF0A            ; CE 0A BF | Decrement (absolute)
    BVC $7F              ; 50 7F | Branch if overflow clear
    BVC $60              ; 50 60 | Branch if overflow clear
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1A8
; Address: $EAE2A8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1A8:
    JSR $411E            ; 20 1E 41 | Jump to subroutine
    AND $3F41,X          ; 3D 41 3F | Logical AND with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1A9
; Address: $EAE2B2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1A9:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1AA
; Address: $EAE2B8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1AA:
    JSR $4101            ; 20 01 41 | Jump to subroutine
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1AB
; Address: $EAE2C4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1AB:
    JSR $0880            ; 20 80 08 | Jump to subroutine
    CPX #$04             ; E0 04 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    REP #$FC             ; C2 FC | Reset processor status bits
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1AC
; Address: $EAE2D6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1AC:
    CLC                  ; 18 | Clear carry flag
    BRA $C2              ; 80 C2 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC $FC7F,Y          ; 79 7F FC | Add with carry (absolute,Y)
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1AE
; Address: $EAE327
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1AE:
    JSR $E01F            ; 20 1F E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY $FFCC            ; CC CC FF | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1AF
; Address: $EAE351
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1AF:
    STA $00              ; 85 00 | Store accumulator to zero page
    SBC $B700,X          ; FD 00 B7 | Subtract with carry (absolute,X)
    DEC $7B00            ; CE 00 7B | Decrement (absolute)
    JMP $7F4C            ; 4C 4C 7F | Jump to address
    EOR $4D00            ; 4D 00 4D | Exclusive OR with accumulator (absolute)
    ADC $7F00,X          ; 7D 00 7F | Add with carry (absolute,X)
    LSR $7B00            ; 4E 00 7B | Logical shift right (absolute)
    CPY $FFCC            ; CC CC FF | Compare Y register (absolute)
    ADC $F500            ; 6D 00 F5 | Add with carry (absolute)
    DEC $7B00            ; CE 00 7B | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $7F              ; 50 7F | Branch if overflow clear
    ADC $7E51,X          ; 7D 51 7E | Add with carry (absolute,X)
    ADC $7C02,X          ; 7D 02 7C | Add with carry (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $78              ; 50 78 | Branch if overflow clear
    BVC $78              ; 50 78 | Branch if overflow clear
    BVC $78              ; 50 78 | Branch if overflow clear
    BVS $00              ; 70 00 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7E3F            ; 6E 3F 7E | Rotate right (absolute)
    ROR $3A3F,X          ; 7E 3F 3A | Rotate right (absolute,X)
    ASL $0707,X          ; 1E 07 07 | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BVC $00              ; 50 00 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $42              ; F0 42 | Hardware register operation
    INY                  ; C8 | Increment Y register
    CPY #$84             ; C0 84 | Compare Y register (immediate)
    STX $CC88            ; 8E 88 CC | Store X register to absolute address
    BCS $A8              ; B0 A8 | Branch if carry set
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    BRA $0E              ; 80 0E | Branch always
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    CLI                  ; 58 | Clear interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B1
; Address: $EAE432
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B1:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $0C0C            ; 0E 0C 0C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    SBC ($F9,X)          ; E1 F9 | Subtract with carry ((zero page,X))
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    JMP $6828            ; 4C 28 68 | Jump to address
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B2
; Address: $EAE468
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B2:
    JSR $2820            ; 20 20 28 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    ROL $26              ; 26 26 | Rotate left (zero page)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $DF              ; 80 DF | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D9              ; 80 D9 | Branch always
    BRA $DA              ; 80 DA | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    INC $0500,X          ; FE 00 05 | Increment (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF BF 80 80 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 80 BF 80 | Load from absolute long,X into accumulator
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($DB,X)          ; 01 DB | Logical OR with accumulator ((zero page,X))
    ORA ($3B,X)          ; 01 3B | Logical OR with accumulator ((zero page,X))
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $1F0E            ; 0E 0E 1F | Arithmetic shift left (absolute)
    LDA                  ; BF BF A4 A4 | Load from absolute long,X into accumulator
    CPX $E4              ; E4 E4 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B3
; Address: $EAE517
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B3:
    ASL $1100            ; 0E 00 11 | Arithmetic shift left (absolute)
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    LDA                  ; BF 1B FF 5F | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B4
; Address: $EAE524
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B4:
    BVC $7F              ; 50 7F | Branch if overflow clear
    ADC $7E51,X          ; 7D 51 7E | Add with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B5
; Address: $EAE535
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B5:
    ADC $7C02,X          ; 7D 02 7C | Add with carry (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BVC $7F              ; 50 7F | Branch if overflow clear
    ADC $7E51,X          ; 7D 51 7E | Add with carry (absolute,X)
    EOR ($7E),Y          ; 51 7E | Exclusive OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B6
; Address: $EAE551
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B6:
    ADC $7C02,X          ; 7D 02 7C | Add with carry (absolute,X)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B7
; Address: $EAE587
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B7:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    BPL $38              ; 10 38 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    JMP $FFFF            ; 4C FF FF | Jump to address
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B8
; Address: $EAE5A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B8:
    JSL $212222          ; 22 22 22 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1B9
; Address: $EAE5A9
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1B9:
    JSR $2323            ; 20 23 23 | Jump to subroutine
    BMI $30              ; 30 30 | Branch if negative
    CMP $DD81,X          ; DD 81 DD | Compare accumulator (absolute,X)
    STA ($DE,X)          ; 81 DE | Store accumulator to (zero page,X)
    BRA $DE              ; 80 DE | Branch always
    BRA $DF              ; 80 DF | Branch always
    BRA $DC              ; 80 DC | Branch always
    BRA $F3              ; 80 F3 | Branch always
    STA $116968          ; 8F 68 69 11 | Store accumulator to absolute long address
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    STY $9D              ; 84 9D | Store Y register to zero page
    AND ($7B),Y          ; 31 7B | Logical AND with accumulator ((zero page),Y)
    SBC $FDEE            ; ED EE FD | Subtract with carry (absolute)
    INC $FCF9,X          ; FE F9 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1BA
; Address: $EAE5D8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1BA:
    ROR $7A              ; 66 7A | Rotate right (zero page)
    DEC $9FEC,X          ; DE EC 9F | Decrement (absolute,X)
    CPY #$B5             ; C0 B5 | Compare Y register (immediate)
    CPY $2C              ; C4 2C | Compare Y register (zero page)
    BIT $9010            ; 2C 10 90 | Test bits in accumulator (absolute)
    ORA ($91),Y          ; 11 91 | Logical OR with accumulator ((zero page),Y)
    ORA ($C1,X)          ; 01 C1 | Logical OR with accumulator ((zero page,X))
    ADC ($F9,X)          ; 61 F9 | Add with carry ((zero page,X))
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    LDY $C3D3,X          ; BC D3 C3 | Load from absolute,X into Y register
    ROR $3EEE            ; 6E EE 3E | Rotate right (absolute)
    ROR $3C0D,X          ; 7E 0D 3C | Rotate right (absolute,X)
    ROR $0E              ; 66 0E | Rotate right (zero page)
    STY $84              ; 84 84 | Store Y register to zero page
    STY $84              ; 84 84 | Store Y register to zero page
    STY $84              ; 84 84 | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1BC
; Address: $EAE60E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1BC:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    STA ($E7,X)          ; 81 E7 | Store accumulator to (zero page,X)
    SBC ($21,X)          ; E1 21 | PPU graphics register access
    AND ($3F,X)          ; 21 3F | Logical AND with accumulator ((zero page,X))
    ASL $003F,X          ; 1E 3F 00 | Arithmetic shift left (absolute,X)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDA                  ; BF BF 3F 3F | Load from absolute long,X into accumulator
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 00 A0 00 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    BRA $18              ; 80 18 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1BD
; Address: $EAE685
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1BD:
    CLC                  ; 18 | Clear carry flag
    EOR $4A27,Y          ; 59 27 4A | Exclusive OR with accumulator (absolute,Y)
    JMP $703C            ; 4C 3C 70 | Jump to address
    BEQ $00              ; F0 00 | Branch if equal
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1BF
; Address: $EAE6E9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1BF:
    CLC                  ; 18 | Clear carry flag
    SBC ($E3,X)          ; E1 E3 | Subtract with carry ((zero page,X))
    ADC $1FF9,Y          ; 79 F9 1F | Add with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1C0
; Address: $EAE708
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1C0:
    JSR $2120            ; 20 20 21 | PPU graphics register access
    AND ($21,X)          ; 21 21 | PPU graphics register access
    AND ($22,X)          ; 21 22 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1C1
; Address: $EAE70F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1C1:
    JSL $CFBFBF          ; 22 BF BF CF | Jump to subroutine long
    STA $DC83F3          ; 8F F3 83 DC | Store accumulator to absolute long address
    BRA $DF              ; 80 DF | Branch always
    BRA $DE              ; 80 DE | Branch always
    BRA $DE              ; 80 DE | Branch always
    BRA $DD              ; 80 DD | Branch always
    STA ($20,X)          ; 81 20 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1C2
; Address: $EAE722
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1C2:
    JSR $20FB            ; 20 FB 20 | Jump to subroutine
    BPL $7C              ; 10 7C | Branch if positive
    BRA $BF              ; 80 BF | Branch always
    BPL $10              ; 10 10 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)
    STX $8424            ; 8E 24 84 | Store X register to absolute address
    BIT $80              ; 24 80 | Test bits in accumulator (zero page)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    LSR $BE00,X          ; 5E 00 BE | Logical shift right (absolute,X)
    LDX $7D01,Y          ; BE 01 7D | Load from absolute,Y into X register
    PLX                  ; FA | Pull X register from stack
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    LDA ($E3,X)          ; A1 E3 | Load from (zero page,X) into accumulator
    EOR ($43,X)          ; 41 43 | Exclusive OR with accumulator ((zero page,X))
    EOR $03              ; 45 03 | Exclusive OR with accumulator (zero page)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $FEFE,X          ; 1E FE FE | Arithmetic shift left (absolute,X)
    INC $EFEF,X          ; FE EF EF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1C4
; Address: $EAE766
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1C4:
    STY $84              ; 84 84 | Store Y register to zero page
    STY $84              ; 84 84 | Store Y register to zero page
    SBC $E1E7,Y          ; F9 E7 E1 | Subtract with carry (absolute,Y)
    STA                  ; 9F 81 7B 01 | Store accumulator to absolute long,X
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1C5
; Address: $EAE784
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1C5:
    TXA                  ; 8A | Transfer X register to accumulator
    PLY                  ; 7A | Pull Y register from stack
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    STY $E018            ; 8C 18 E0 | Game work RAM access
    DEC $F8              ; C6 F8 | Decrement (zero page)
    LDA ($BE),Y          ; B1 BE | Load from (zero page),Y into accumulator
    JMP $FFDE5F          ; 5C 5F DE FF | Jump to address long
    LDA ($F1),Y          ; B1 F1 | Load from (zero page),Y into accumulator
    CPX #$E0             ; E0 E0 | Game work RAM access
    WDM #$C2             ; 42 C2 | Reserved instruction
    SED                  ; F8 | Set decimal mode flag
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    LDA                  ; BF 0E FF 1F | Load from absolute long,X into accumulator
    AND $FFFF,X          ; 3D FF FF | Logical AND with accumulator (absolute,X)
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1C8
; Address: $EAE7D4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1C8:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    STA                  ; 9F DF 9F DF | Store accumulator to absolute long,X
    STA                  ; 9F DF FF FF | Store accumulator to absolute long,X
    ASL $1F0E            ; 0E 0E 1F | Arithmetic shift left (absolute)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    SBC $00FD,X          ; FD FD 00 | Subtract with carry (absolute,X)
    ASL $1100            ; 0E 00 11 | Arithmetic shift left (absolute)
    LDA                  ; BF 1B BF 02 | Load from absolute long,X into accumulator
    BRA $80              ; 80 80 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    LSR $46              ; 46 46 | Logical shift right (zero page)
    JMP $FF005C          ; 5C 5C 00 FF | Jump to address long
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STA $85              ; 85 85 | Store accumulator to zero page
    LDA $A3B9,Y          ; B9 B9 A3 | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1C9
; Address: $EAE860
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1C9:
    JSL $252522          ; 22 22 25 25 | Jump to subroutine long
    ROL $26              ; 26 26 | Rotate left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1CA
; Address: $EAE868
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1CA:
    JSR $3F20            ; 20 20 3F | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CMP $DA81,X          ; DD 81 DA | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1CB
; Address: $EAE874
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1CB:
    CMP $D780,Y          ; D9 80 D7 | Compare accumulator (absolute,Y)
    BRA $DF              ; 80 DF | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $0501,X          ; FD 01 05 | Subtract with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BIT $232C            ; 2C 2C 23 | Test bits in accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    LDA                  ; BF BF 00 00 | Load from absolute long,X into accumulator
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BRA $BF              ; 80 BF | Branch always
    BRA $7F              ; 80 7F | Branch always
    RTI                  ; 40 | Return from interrupt
    STY $84              ; 84 84 | Store Y register to zero page
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($BB,X)          ; 01 BB | Logical OR with accumulator ((zero page,X))
    STA ($3B,X)          ; 81 3B | Store accumulator to (zero page,X)
    ORA ($DB,X)          ; 01 DB | Logical OR with accumulator ((zero page,X))
    ORA ($FB,X)          ; 01 FB | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FDFF,X          ; FE FF FD | Increment (absolute,X)
    SBC $7F7F,X          ; FD 7F 7F | Subtract with carry (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    STA $7B8F            ; 8D 8F 7B | Store accumulator to absolute address
    SBC $FF7D,X          ; FD 7D FF | Subtract with carry (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    INC $FFA8,X          ; FE A8 FF | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $FB70,X          ; FD 70 FB | Subtract with carry (absolute,X)
    AND $CFBD,X          ; 3D BD CF | Logical AND with accumulator (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    LDX $CFCD,Y          ; BE CD CF | Load from absolute,Y into X register
    LDX $A7              ; A6 A7 | Load from zero page into X register
    LSR $427F            ; 4E 7F 42 | Hardware register operation
    EOR ($FD,X)          ; 41 FD | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1CC
; Address: $EAE917
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1CC:
    BMI $FF              ; 30 FF | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $60              ; B0 60 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1CE
; Address: $EAE92A
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1CE:
    ADC $6C00            ; 6D 00 6C | Add with carry (absolute)
    STA                  ; 9F DF 9F DF | Store accumulator to absolute long,X
    STA                  ; 9F DF 98 D8 | Store accumulator to absolute long,X
    BCC $D0              ; 90 D0 | Branch if carry clear
    BCC $D0              ; 90 D0 | Branch if carry clear
    ADC $F900,Y          ; 79 00 F9 | Add with carry (absolute,Y)
    STX $86              ; 86 86 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    JMP $CC4C            ; 4C 4C CC | Jump to address
    CPY $CDCD            ; CC CD CD | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    LDA $A5              ; A5 A5 | Load from zero page into accumulator
    STA                  ; 9F 9F 0E 0E | Store accumulator to absolute long,X
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    INC $BE00,X          ; FE 00 BE | Increment (absolute,X)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    LDX $A8AE            ; AE AE A8 | Load from absolute address into X register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1D1
; Address: $EAE9AA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1D1:
    JMP ($6C00)          ; 6C 00 6C | Jump to address (absolute indirect)
    JMP ($9F00)          ; 6C 00 9F | Jump to address (absolute indirect)
    STA                  ; 9F DF 9F DF | Store accumulator to absolute long,X
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    BCC $D0              ; 90 D0 | Branch if carry clear
    STA $00DF00          ; 8F 00 DF 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1D2
; Address: $EAE9CA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1D2:
    CMP $D900,Y          ; D9 00 D9 | Compare accumulator (absolute,Y)
    ORA $FF00,Y          ; 19 00 FF | Logical OR with accumulator (absolute,Y)
    BVS $70              ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1D3
; Address: $EAE9D8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1D3:
    JSR $2620            ; 20 20 26 | Jump to subroutine
    ROL $26              ; 26 26 | Rotate left (zero page)
    ROL $E6              ; 26 E6 | Rotate left (zero page)
    INC $00              ; E6 00 | Increment (zero page)
    ASL $8E00            ; 0E 00 8E | Arithmetic shift left (absolute)
    STZ $9E00,X          ; 9E 00 9E | Store zero to absolute,X
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    ADC #$69             ; 69 69 | Add with carry (immediate)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    SBC $F9FB,Y          ; F9 FB F9 | Subtract with carry (absolute,Y)
    SBC $39FB,Y          ; F9 FB 39 | Subtract with carry (absolute,Y)
    AND $393B,Y          ; 39 3B 39 | Logical AND with accumulator (absolute,Y)
    AND $393B,Y          ; 39 3B 39 | Logical AND with accumulator (absolute,Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ADC $6F00            ; 6D 00 6F | Add with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1D6
; Address: $EAEA30
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1D6:
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    STZ $92DE,X          ; 9E DE 92 | Store zero to absolute,X
    BCC $D0              ; 90 D0 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    STA                  ; 9F DF 9F DF | Store accumulator to absolute long,X
    STA                  ; 9F DF B6 00 | Store accumulator to absolute long,X
    LDA                  ; BF 00 BC 00 | Load from absolute long,X into accumulator
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    DEC $DF00,X          ; DE 00 DF | Decrement (absolute,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1D7
; Address: $EAEA78
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1D7:
    JSR $2420            ; 20 20 24 | Jump to subroutine
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1D8
; Address: $EAEA7F
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1D8:
    JSR $0006            ; 20 06 00 | Jump to subroutine
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    SBC $F9FB,Y          ; F9 FB F9 | Subtract with carry (absolute,Y)
    SBC $09FB,Y          ; F9 FB 09 | Subtract with carry (absolute,Y)
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    STA $999B,Y          ; 99 9B 99 | Store accumulator to absolute,Y
    STA $579B,Y          ; 99 9B 57 | Store accumulator to absolute,Y
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $6D00            ; 6D 00 6D | Add with carry (absolute)
    JMP ($6F00)          ; 6C 00 6F | Jump to address (absolute indirect)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1DB
; Address: $EAEAF6
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1DB:
    BCC $D0              ; 90 D0 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    STA                  ; 9F DF 9F DF | Store accumulator to absolute long,X
    STA                  ; 9F DF D9 00 | Store accumulator to absolute long,X
    CMP $D900,Y          ; D9 00 D9 | Compare accumulator (absolute,Y)
    ROL $26              ; 26 26 | Rotate left (zero page)
    ROL $26              ; 26 26 | Rotate left (zero page)
    ROL $26              ; 26 26 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1DC
; Address: $EAEB16
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1DC:
    JSR $3020            ; 20 20 30 | Jump to subroutine
    BMI $FF              ; 30 FF | Branch if negative
    LDX $FE00,Y          ; BE 00 FE | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1DD
; Address: $EAEB26
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1DD:
    INC $00              ; E6 00 | Increment (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $9919,Y          ; 19 19 99 | Logical OR with accumulator (absolute,Y)
    STA $FFFF,Y          ; 99 FF FF | Store accumulator to absolute,Y
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    AND $393B,Y          ; 39 3B 39 | Logical AND with accumulator (absolute,Y)
    AND $093B,Y          ; 39 3B 09 | Logical AND with accumulator (absolute,Y)
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    SBC $F9FB,Y          ; F9 FB F9 | Subtract with carry (absolute,Y)
    SBC $60FB,Y          ; F9 FB 60 | Subtract with carry (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E0
; Address: $EAEB6E
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E0:
    BRA $80              ; 80 80 | Branch always
    STA                  ; 9F DF 9F DF | Store accumulator to absolute long,X
    STA                  ; 9F DF 9F DF | Store accumulator to absolute long,X
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEC $DB00,X          ; DE 00 DB | Decrement (absolute,X)
    AND ($21,X)          ; 21 21 | PPU graphics register access
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA $999B,Y          ; 99 9B 99 | Store accumulator to absolute,Y
    STA $999B,Y          ; 99 9B 99 | Store accumulator to absolute,Y
    STA $F99B,Y          ; 99 9B F9 | Store accumulator to absolute,Y
    SBC $F9FB,Y          ; F9 FB F9 | Subtract with carry (absolute,Y)
    EOR ($51),Y          ; 51 51 | Exclusive OR with accumulator ((zero page),Y)
    JMP $46465C          ; 5C 5C 46 46 | Jump to address long
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E1
; Address: $EAEBEB
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E1:
    PLA                  ; 68 | Pull accumulator from stack
    BRA $80              ; 80 80 | Branch always
    LDX $A3AE            ; AE AE A3 | Load from absolute address into X register
    LDA $85B9,Y          ; B9 B9 85 | Load from absolute,Y into accumulator
    STA $B4              ; 85 B4 | Store accumulator to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $38              ; 24 38 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    ROL $493E,X          ; 3E 3E 49 | Rotate left (absolute,X)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    EOR #$4E             ; 49 4E | Exclusive OR with accumulator (immediate)
    LSR $0000            ; 4E 00 00 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E2
; Address: $EAECD9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E2:
    JSL $367F36          ; 22 36 7F 36 | Jump to subroutine long
    BMI $7E              ; 30 7E | Branch if negative
    ASL $1F0E            ; 0E 0E 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E3
; Address: $EAECEA
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E3:
    JSR $2420            ; 20 20 24 | Jump to subroutine
    BIT $DD              ; 24 DD | Test bits in accumulator (zero page)
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    ASL $1100            ; 0E 00 11 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E4
; Address: $EAED93
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E4:
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ROR $00FF,X          ; 7E FF 00 | Rotate right (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL $1C3E,X          ; 3E 3E 1C | Rotate left (absolute,X)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)
    ADC $7D00,X          ; 7D 00 7D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E5
; Address: $EAEDD9
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E5:
    JSL $001C00          ; 22 00 1C 00 | Jump to subroutine long
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    STZ $00              ; 64 00 | Store zero to zero page
    INC $3E00,X          ; FE 00 3E | Increment (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ADC $387D,X          ; 7D 7D 38 | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    ADC $00FF            ; 6D FF 00 | Add with carry (absolute)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    AND $237F,Y          ; 39 7F 23 | Logical AND with accumulator (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $B4              ; 80 B4 | Branch always
    BRA $85              ; 80 85 | Branch always
    BRA $B9              ; 80 B9 | Branch always
    BRA $A3              ; 80 A3 | Branch always
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E6
; Address: $EAEE8F
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E6:
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    AND $217F,Y          ; 39 7F 21 | PPU graphics register access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $B4              ; 80 B4 | Branch always
    BRA $84              ; 80 84 | Branch always
    STA ($B8,X)          ; 81 B8 | Store accumulator to (zero page,X)
    LDY #$82             ; A0 82 | Load immediate value into Y register
    ADC $86FF,X          ; 7D FF 86 | Add with carry (absolute,X)
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ADC $B400,Y          ; 79 00 B4 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CMP $081C,X          ; DD 1C 08 | Compare accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    INC $FE2C,X          ; FE 2C FE | Increment (absolute,X)
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    STZ $E4FE            ; 9C FE E4 | Store zero to absolute
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    INC $03FF,X          ; FE FF 03 | Increment (absolute,X)
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    AND $A101            ; 2D 01 A1 | Logical AND with accumulator (absolute)
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    ORA ($C5,X)          ; 01 C5 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA ($A1,X)          ; A1 A1 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E7
; Address: $EAEF59
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E7:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ASL $00BF,X          ; 1E BF 00 | Arithmetic shift left (absolute,X)
    LDA                  ; BF BF A7 A7 | Load from absolute long,X into accumulator
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E8
; Address: $EAEF79
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E8:
    JSR $A000            ; 20 00 A0 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 1E FF 00 | Load from absolute long,X into accumulator
    BEQ $FF              ; F0 FF | Branch if equal
    INC $FE3F,X          ; FE 3F FE | Increment (absolute,X)
    INC $FE03,X          ; FE 03 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $7F3F,X          ; 3E 3F 7F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1E9
; Address: $EAEFAB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1E9:
    RTI                  ; 40 | Return from interrupt
    PHY                  ; 5A | Push Y register to stack
    ADC $84              ; 65 84 | Add with carry (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $FE              ; 30 FE | Branch if negative
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    STA $000000          ; 8F 00 00 00 | Store accumulator to absolute long address
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1EA
; Address: $EAEFE0
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1EA:
    ROL $287F            ; 2E 7F 28 | Rotate left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    LDX $A880            ; AE 80 A8 | Load from absolute address into X register
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $7E2A,X          ; 7E 2A 7E | Rotate right (absolute,X)
    AND #$7D             ; 29 7D | Logical AND with accumulator (immediate)
    BIT $2A7E            ; 2C 7E 2A | Test bits in accumulator (absolute)
    BIT $287F            ; 2C 7F 28 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1EB
; Address: $EAF050
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1EB:
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $A8              ; 85 A8 | Store accumulator to zero page
    STA $AA              ; 85 AA | Store accumulator to zero page
    STX $A9              ; 86 A9 | Store X register to zero page
    LDY $85              ; A4 85 | Load from zero page into Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $81              ; 80 81 | Branch always
    STA ($85,X)          ; 81 85 | Store accumulator to (zero page,X)
    STA $5A              ; 85 5A | Store accumulator to zero page
    STX $87              ; 86 87 | Store X register to zero page
    STA $019F,Y          ; 99 9F 01 | Store accumulator to absolute,Y
    ROR $7A00,X          ; 7E 00 7A | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1EC
; Address: $EAF074
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1EC:
    JSR $00A5            ; 20 A5 00 | Jump to subroutine
    ADC $6660,Y          ; 79 60 66 | Add with carry (absolute,Y)
    INC $0100,X          ; FE 00 01 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1ED
; Address: $EAF085
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1ED:
    CPX #$86             ; E0 86 | Compare X register (immediate)
    STX $79              ; 86 79 | Store X register to zero page
    ADC $0706,Y          ; 79 06 07 | Add with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 00 EF 00 | Store accumulator to absolute long,X
    STA                  ; 9F 04 E4 00 | Store accumulator to absolute long,X
    STA                  ; 9F 00 79 00 | Store accumulator to absolute long,X
    STX $00              ; 86 00 | Store X register to zero page
    SBC $6760,Y          ; F9 60 67 | Subtract with carry (absolute,Y)
    DEC $FE34,X          ; DE 34 FE | Decrement (absolute,X)
    INC $FE94,X          ; FE 94 FE | Increment (absolute,X)
    INC $FE14,X          ; FE 14 FE | Increment (absolute,X)
    INC $FE14,X          ; FE 14 FE | Increment (absolute,X)
    AND $21              ; 25 21 | PPU graphics register access
    STA ($15,X)          ; 81 15 | Store accumulator to (zero page,X)
    EOR ($15,X)          ; 41 15 | Exclusive OR with accumulator ((zero page,X))
    EOR ($15,X)          ; 41 15 | Exclusive OR with accumulator ((zero page,X))
    STA ($15,X)          ; 81 15 | Store accumulator to (zero page,X)
    SBC ($05,X)          ; E1 05 | Subtract with carry ((zero page,X))
    SBC ($15),Y          ; F1 15 | Subtract with carry ((zero page),Y)
    SBC ($60,X)          ; E1 60 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1EE
; Address: $EAF0C4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1EE:
    LDA $A5              ; A5 A5 | Load from zero page into accumulator
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    STA                  ; 9F FF 00 7C | Store accumulator to absolute long,X
    LDX $3E00,Y          ; BE 00 3E | Load from absolute,Y into X register
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1EF
; Address: $EAF0E0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1EF:
    JSR $FF20            ; 20 20 FF | Jump to subroutine
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    LDA $A5              ; A5 A5 | Load from zero page into accumulator
    LDA                  ; BF BF 1F 1F | Load from absolute long,X into accumulator
    INC $BE00,X          ; FE 00 BE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F0
; Address: $EAF0F9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F0:
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BEQ $80              ; F0 80 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F1
; Address: $EAF125
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F1:
    BCC $00              ; 90 00 | Branch if carry clear
    BEQ $86              ; F0 86 | Branch if equal
    SBC $FF8B,Y          ; F9 8B FF | Subtract with carry (absolute,Y)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    BMI $4F              ; 30 4F | Branch if negative
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    STX $0E              ; 86 0E | Store X register to zero page
    ORA ($8F),Y          ; 11 8F | Logical OR with accumulator ((zero page),Y)
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BVS $FF              ; 70 FF | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SBC $70FF,Y          ; F9 FF 70 | Subtract with carry (absolute,Y)
    INC $FF60,X          ; FE 60 FF | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $00              ; 80 00 | Branch always
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F2
; Address: $EAF1CB
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F2:
    ORA $39              ; 05 39 | Logical OR with accumulator (zero page)
    AND ($23,X)          ; 21 23 | Logical AND with accumulator ((zero page,X))
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)
    BRA $CB              ; 80 CB | Branch always
    BRA $FA              ; 80 FA | Branch always
    STA ($C4,X)          ; 81 C4 | Store accumulator to (zero page,X)
    ADC $86FF,X          ; 7D FF 86 | Add with carry (absolute,X)
    ADC $B400,Y          ; 79 00 B4 | Add with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    BIT $A02C            ; 2C 2C A0 | Test bits in accumulator (absolute)
    LDY #$9C             ; A0 9C | Load immediate value into Y register
    STZ $E4E4            ; 9C E4 E4 | Store zero to absolute
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($D3,X)          ; 01 D3 | Logical OR with accumulator ((zero page,X))
    ORA ($5F,X)          ; 01 5F | Logical OR with accumulator ((zero page,X))
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    ORA ($1B,X)          ; 01 1B | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $869E,X          ; 9E 9E 86 | Store zero to absolute,X
    STX $00              ; 86 00 | Store X register to zero page
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    ADC $00FF,Y          ; 79 FF 00 | Add with carry (absolute,Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $7F3F,X          ; 3E 3F 7F | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STZ $84              ; 64 84 | Store zero to zero page
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $FE              ; 30 FE | Branch if negative
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    AND $2339,Y          ; 39 39 23 | Logical AND with accumulator (absolute,Y)
    CPY #$E8             ; C0 E8 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F3
; Address: $EAF2F7
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F3:
    BRA $CB              ; 80 CB | Branch always
    BRA $FA              ; 80 FA | Branch always
    BRA $C6              ; 80 C6 | Branch always
    BRA $DC              ; 80 DC | Branch always
    BRA $FF              ; 80 FF | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$2A             ; E0 2A | Compare X register (immediate)
    ROL $2E2A            ; 2E 2A 2E | Rotate left (absolute)
    AND #$2D             ; 29 2D | Logical AND with accumulator (immediate)
    BIT $2A2E            ; 2C 2E 2A | Test bits in accumulator (absolute)
    BIT $282C            ; 2C 2C 28 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BNE $85              ; D0 85 | Branch if not equal
    BNE $85              ; D0 85 | Branch if not equal
    STX $D1              ; 86 D1 | Store X register to zero page
    STA $D3              ; 85 D3 | Store accumulator to zero page
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $81              ; 80 81 | Branch always
    STA ($85,X)          ; 81 85 | Store accumulator to (zero page,X)
    STA $5A              ; 85 5A | Store accumulator to zero page
    STX $87              ; 86 87 | Store X register to zero page
    STA $019F,Y          ; 99 9F 01 | Store accumulator to absolute,Y
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $7A00,X          ; 7E 00 7A | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F4
; Address: $EAF374
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F4:
    JSR $00A5            ; 20 A5 00 | Jump to subroutine
    ADC $6660,Y          ; 79 60 66 | Add with carry (absolute,Y)
    INC $01FE,X          ; FE FE 01 | Increment (absolute,X)
    STA                  ; 9F 1B FB 60 | Store accumulator to absolute long,X
    CPX #$86             ; E0 86 | Compare X register (immediate)
    STX $79              ; 86 79 | Store X register to zero page
    ADC $0706,Y          ; 79 06 07 | Add with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 00 EF 60 | Store accumulator to absolute long,X
    STA                  ; 9F 04 E4 00 | Store accumulator to absolute long,X
    STA                  ; 9F 00 79 00 | Store accumulator to absolute long,X
    STX $00              ; 86 00 | Store X register to zero page
    SBC $6760,Y          ; F9 60 67 | Subtract with carry (absolute,Y)
    PEA #$F404           ; F4 04 F4 | Push effective address to stack
    PEA #$21AB           ; F4 AB 21 | PPU graphics register access
    STA ($2B,X)          ; 81 2B | Store accumulator to (zero page,X)
    EOR ($2B,X)          ; 41 2B | Exclusive OR with accumulator ((zero page,X))
    EOR ($6B,X)          ; 41 6B | Exclusive OR with accumulator ((zero page,X))
    STA ($0B,X)          ; 81 0B | Store accumulator to (zero page,X)
    SBC ($0B,X)          ; E1 0B | Subtract with carry ((zero page,X))
    SBC ($0B),Y          ; F1 0B | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F5
; Address: $EAF3BF
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F5:
    SBC ($82,X)          ; E1 82 | Subtract with carry ((zero page,X))
    ADC $387D,X          ; 7D 7D 38 | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    ADC $00FF,X          ; 7D FF 00 | Add with carry (absolute,X)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    BVS $E0              ; 70 E0 | Game work RAM access
    BCC $60              ; 90 60 | Branch if carry clear
    BRA $10              ; 80 10 | Branch always
    CPX #$88             ; E0 88 | Compare X register (immediate)
    BEQ $88              ; F0 88 | Branch if equal
    BMI $4F              ; 30 4F | Branch if negative
    BRA $FF              ; 80 FF | Branch always
    CMP $0701,X          ; DD 01 07 | Compare accumulator (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $4E              ; 06 4E | Arithmetic shift left (zero page)
    SBC $4FB1,Y          ; F9 B1 4F | Subtract with carry (absolute,Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SBC $F9FF,Y          ; F9 FF F9 | Subtract with carry (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F7
; Address: $EAF4CD
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F7:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ASL $EF              ; 06 EF | Arithmetic shift left (zero page)
    STY $84              ; 84 84 | Store Y register to zero page
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    STY $03              ; 84 03 | Store Y register to zero page
    ROR $7F7E,X          ; 7E 7E 7F | Rotate right (absolute,X)
    ROR $4100,X          ; 7E 00 41 | Rotate right (absolute,X)
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1F9
; Address: $EAF54C
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1F9:
    JSL $222222          ; 22 22 22 22 | Jump to subroutine long
    ASL $1200            ; 0E 00 12 | Arithmetic shift left (absolute)
    ROL $3E1C,X          ; 3E 1C 3E | Rotate left (absolute,X)
    ROL $237F            ; 2E 7F 23 | Rotate left (absolute)
    AND $057F,Y          ; 39 7F 05 | Logical AND with accumulator (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    LDX $A380            ; AE 80 A3 | Load from absolute address into X register
    BRA $B9              ; 80 B9 | Branch always
    BRA $85              ; 80 85 | Branch always
    BRA $B4              ; 80 B4 | Branch always
    BRA $97              ; 80 97 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $97              ; 80 97 | Branch always
    BRA $B4              ; 80 B4 | Branch always
    BRA $85              ; 80 85 | Branch always
    BRA $B9              ; 80 B9 | Branch always
    BRA $A3              ; 80 A3 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1FA
; Address: $EAF641
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1FA:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    AND #$29             ; 29 29 | Logical AND with accumulator (immediate)
    SBC #$E9             ; E9 E9 | Subtract with carry (immediate)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    DEC $EF              ; C6 EF | Decrement (zero page)
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    STY $84              ; 84 84 | Store Y register to zero page
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1FB
; Address: $EAF6B0
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1FB:
    ROL $007F,X          ; 3E 7F 00 | Rotate left (absolute,X)
    ADC $7D00,Y          ; 79 00 7D | Add with carry (absolute,Y)
    ADC $6300,X          ; 7D 00 63 | Add with carry (absolute,X)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ROR $4900,X          ; 7E 00 49 | Rotate right (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    PHX                  ; DA | Push X register to stack
    BRA $AE              ; 80 AE | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $03              ; 80 03 | Branch always
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INC $FCF0,X          ; FE F0 FC | Increment (absolute,X)
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($E0,X)          ; C1 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    INC $3EFE,X          ; FE FE 3E | Increment (absolute,X)
    ROL $FE3F,X          ; 3E 3F FE | Rotate left (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ROR $7E80,X          ; 7E 80 7E | Rotate right (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    BRA $7E              ; 80 7E | Branch always
    BRA $7E              ; 80 7E | Branch always
    BRA $01              ; 80 01 | Branch always
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1FC
; Address: $EAF794
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1FC:
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $7F3F,X          ; 3E 3F 7F | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PHY                  ; 5A | Push Y register to stack
    STZ $84              ; 64 84 | Store zero to zero page
    PLX                  ; FA | Pull X register from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $FE              ; 30 FE | Branch if negative
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    SEP #$E3             ; E2 E3 | Set processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    CPY $C7              ; C4 C7 | Compare Y register (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROL $4CFE            ; 2E FE 4C | Rotate left (absolute)
    JMP $8040            ; 4C 40 80 | Jump to address
    BPL $60              ; 10 60 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BRA $E0              ; 80 E0 | Game work RAM access
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $00C0,X          ; FE C0 00 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1FD
; Address: $EAF829
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1FD:
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    ROR $7F00,X          ; 7E 00 7F | Rotate right (absolute,X)
    BRA $A8              ; 80 A8 | Branch always
    PLB                  ; AB | Pull data bank register from stack
    STA ($A9,X)          ; 81 A9 | Store accumulator to (zero page,X)
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    INC $18              ; E6 18 | Increment (zero page)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    INC $3001,X          ; FE 01 30 | Increment (absolute,X)
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    BMI $1F              ; 30 1F | Branch if negative

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1FE
; Address: $EAF8EB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1FE:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $FCE0,X          ; FE E0 FC | Increment (absolute,X)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_1FF
; Address: $EAF8FA
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_1FF:
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    WDM #$7C             ; 42 7C | Reserved instruction
    SED                  ; F8 | Set decimal mode flag
    STX $68              ; 86 68 | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    BRA $F8              ; 80 F8 | Branch always
    DEY                  ; 88 | Decrement Y register
    CPX $FA              ; E4 FA | Compare X register (zero page)
    BMI $4F              ; 30 4F | Branch if negative
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    ORA ($29),Y          ; 11 29 | Logical OR with accumulator ((zero page),Y)
    ROL $0E00,X          ; 3E 00 0E | Rotate left (absolute,X)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA $2113            ; 0D 13 21 | PPU graphics register access
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    ROL $282E            ; 2E 2E 28 | Rotate left (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank54_DmaFunction_200
; Address: $EAF96D
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_200:
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CMP ($80),Y          ; D1 80 | Compare accumulator ((zero page),Y)
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $D7              ; 80 D7 | Branch always
    BRA $2E              ; 80 2E | Branch always
    ROL $2323            ; 2E 23 23 | Rotate left (absolute)
    AND $0539,Y          ; 39 39 05 | Logical AND with accumulator (absolute,Y)
    ORA $34              ; 05 34 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    CMP ($80),Y          ; D1 80 | Compare accumulator ((zero page),Y)
    BRA $C6              ; 80 C6 | Branch always
    BRA $FA              ; 80 FA | Branch always
    BRA $CB              ; 80 CB | Branch always
    BRA $E8              ; 80 E8 | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_201
; Address: $EAF9E9
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_201:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ROR $7E80,X          ; 7E 80 7E | Rotate right (absolute,X)
    ROL $3E40,X          ; 3E 40 3E | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $3E40,X          ; 3E 40 3E | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($75,X)          ; 01 75 | Logical OR with accumulator ((zero page,X))
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($95,X)          ; 01 95 | Logical OR with accumulator ((zero page,X))
    STA ($95,X)          ; 81 95 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_202
; Address: $EAFA1E
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_202:
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    BRA $80              ; 80 80 | Branch always
    BRA $AE              ; 80 AE | Branch always
    BRA $A3              ; 80 A3 | Branch always
    BRA $B9              ; 80 B9 | Branch always
    BRA $85              ; 80 85 | Branch always
    BRA $B4              ; 80 B4 | Branch always
    BRA $97              ; 80 97 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $7F3F,X          ; 3E 3F 7F | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CLI                  ; 58 | Clear interrupt disable flag
    ROR $84              ; 66 84 | Rotate right (zero page)
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BMI $7E              ; 30 7E | Branch if negative
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $5E              ; 80 5E | Branch always
    ROL $0F13,X          ; 3E 13 0F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_203
; Address: $EAFAD1
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_203:
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    LDY $F0C8,X          ; BC C8 F0 | Load from absolute,X into Y register
    INC $F840,X          ; FE 40 F8 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    INC $FCFF,X          ; FE FF FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    INC $7C70,X          ; FE 70 7C | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_204
; Address: $EAFB1E
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_204:
    JSR $F038            ; 20 38 F0 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    BVS $80              ; 70 80 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    STA $0F8F0F          ; 8F 0F 8F 0F | Store accumulator to absolute long address
    ROL $3E40,X          ; 3E 40 3E | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $3E40,X          ; 3E 40 3E | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $3E40,X          ; 3E 40 3E | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ROL $3E40,X          ; 3E 40 3E | Rotate left (absolute,X)
    RTI                  ; 40 | Return from interrupt
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    STA ($D5,X)          ; 81 D5 | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    ROR $0290            ; 6E 90 02 | Rotate right (absolute)
    BRA $FE              ; 80 FE | Branch always
    INC $F8E6,X          ; FE E6 F8 | Increment (absolute,X)
    AND ($4E),Y          ; 31 4E | Logical AND with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank54_DmaFunction_206
; Address: $EAFB84
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_206:
    JSR $201E            ; 20 1E 20 | Jump to subroutine
    ASL $3D1E,X          ; 1E 1E 3D | Arithmetic shift left (absolute,X)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROL $FEC0,X          ; 3E C0 FE | Rotate left (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($F5,X)          ; 01 F5 | Logical OR with accumulator ((zero page,X))
    ORA ($85,X)          ; 01 85 | Logical OR with accumulator ((zero page,X))
    ORA ($9D,X)          ; 01 9D | Logical OR with accumulator ((zero page,X))
    ORA ($A1,X)          ; 01 A1 | Logical OR with accumulator ((zero page,X))
    ORA ($2D,X)          ; 01 2D | Logical OR with accumulator ((zero page,X))
    ORA ($E9,X)          ; 01 E9 | Logical OR with accumulator ((zero page,X))
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    LDA                  ; BF EF 3F CF | Load from absolute long,X into accumulator
    STA $FF              ; 85 FF | Store accumulator to zero page
    BEQ $8F              ; F0 8F | Branch if equal
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    INC $1F              ; E6 1F | Increment (zero page)
    DEC $3F              ; C6 3F | Decrement (zero page)
    DEC $FF3F            ; CE 3F FF | Decrement (absolute)
    SBC $EDFF            ; ED FF ED | Subtract with carry (absolute)
    SBC $FDFF            ; ED FF FD | Subtract with carry (absolute)
    LDA                  ; BF BD 7E F4 | Load from absolute long,X into accumulator
    PEA #$E47F           ; F4 7F E4 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 49 B6 49 | Load from absolute long,X into accumulator
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    STA                  ; 9F 85 9F 8D | Store accumulator to absolute long,X
    STA                  ; 9F 8D 9F CC | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank54_DmaFunction_207
; Address: $EAFCAA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_207:
    INC $EEFF            ; EE FF EE | Increment (absolute)
    LDA                  ; BF FF 60 FF | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_20A
; Address: $EAFCB8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_20A:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ADC #$E9             ; 69 E9 | Add with carry (immediate)
    ADC #$E9             ; 69 E9 | Add with carry (immediate)
    ADC #$E9             ; 69 E9 | Add with carry (immediate)
    ADC #$E9             ; 69 E9 | Add with carry (immediate)
    ADC #$E9             ; 69 E9 | Add with carry (immediate)
    ADC $6CFB,Y          ; 79 FB 6C | Add with carry (absolute,Y)
    BPL $FF              ; 10 FF | Branch if positive
    SBC ($FB,X)          ; E1 FB | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank54_DmaFunction_20B
; Address: $EAFCE8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_20B:
    ADC #$FB             ; 69 FB | Add with carry (immediate)
    ADC #$FB             ; 69 FB | Add with carry (immediate)
    ROR $76FF,X          ; 7E FF 76 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LSR $4EDF            ; 4E DF 4E | Logical shift right (absolute)
    ASL $3A9F            ; 0E 9F 3A | Arithmetic shift left (absolute)
    LDA                  ; BF 5C DB 1C | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank54_DmaFunction_20E
; Address: $EAFD38
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_20E:
    JSR $62FF            ; 20 FF 62 | Jump to subroutine
    SBC $FD62,X          ; FD 62 FD | Subtract with carry (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    SBC $AF22,X          ; FD 22 AF | Subtract with carry (absolute,X)
    ROL $AF              ; 26 AF | Rotate left (zero page)
    ROL $AF              ; 26 AF | Rotate left (zero page)
    ROL $AF              ; 26 AF | Rotate left (zero page)
    ROL $AF              ; 26 AF | Rotate left (zero page)
    ROR $1BFF,X          ; 7E FF 1B | Rotate right (absolute,X)
    BVC $FF              ; 50 FF | Branch if overflow clear
    BVC $FF              ; 50 FF | Branch if overflow clear
    BVC $FF              ; 50 FF | Branch if overflow clear
    BVC $FF              ; 50 FF | Branch if overflow clear
    BVC $FF              ; 50 FF | Branch if overflow clear
    STZ $9E01            ; 9C 01 9E | Store zero to absolute
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    STA                  ; 9F 00 9F FF | Store accumulator to absolute long,X
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank54_DmaFunction_20F
; Address: $EAFD86
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_20F:
    ADC ($A1,X)          ; 61 A1 | Add with carry ((zero page,X))
    STA ($41,X)          ; 81 41 | Store accumulator to (zero page,X)
    CPX $B0AF            ; EC AF B0 | Compare X register (absolute)
    STA $1F13,Y          ; 99 13 1F | Store accumulator to absolute,Y
    JMP ($B17F)          ; 6C 7F B1 | Jump to address (absolute indirect)
    INC $F8C7,X          ; FE C7 F8 | Increment (absolute,X)
    CPX $B11F            ; EC 1F B1 | Compare X register (absolute)
    ROR $F8C7,X          ; 7E C7 F8 | Rotate right (absolute,X)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ASL $0CF7            ; 0E F7 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    STA $8C00            ; 8D 00 8C | Store accumulator to absolute address
    STY $E000            ; 8C 00 E0 | Game work RAM access
    CMP #$FE             ; C9 FE | Compare accumulator (immediate)
    EOR ($F2,X)          ; 41 F2 | Exclusive OR with accumulator ((zero page,X))
    ORA $5EA5            ; 0D A5 5E | Logical OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    ORA #$FD             ; 09 FD | Logical OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0D              ; F0 0D | Branch if equal
    STA $8E72            ; 8D 72 8E | Store accumulator to absolute address
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    STA $CF8FFF          ; 8F FF 8F CF | Store accumulator to absolute long address
    LDA                  ; BF 4B BF 4B | Load from absolute long,X into accumulator
    LDA                  ; BF 27 DF 46 | Load from absolute long,X into accumulator
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    LDA                  ; BF FF BB FF | Load from absolute long,X into accumulator
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    LDA                  ; BF 40 BF C0 | Load from absolute long,X into accumulator
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    SBC $FD7F            ; ED 7F FD | Subtract with carry (absolute)
    SBC $B77F,X          ; FD 7F B7 | Subtract with carry (absolute,X)
    STX $7F              ; 86 7F | Store X register to zero page
    STX $7F              ; 86 7F | Store X register to zero page
    STX $7F              ; 86 7F | Store X register to zero page
    ADC #$96             ; 69 96 | Add with carry (immediate)
    ADC #$96             ; 69 96 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_210
; Address: $EAFE94
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_210:
    ADC $7986,Y          ; 79 86 79 | Add with carry (absolute,Y)
    STX $79              ; 86 79 | Store X register to zero page
    STX $79              ; 86 79 | Store X register to zero page
    STX $79              ; 86 79 | Store X register to zero page
    STX $79              ; 86 79 | Store X register to zero page
    STX $AF              ; 86 AF | Store X register to zero page
    ORA $9EDF,X          ; 1D DF 9E | Logical OR with accumulator (absolute,X)
    EOR $7CBF,X          ; 5D BF 7C | Exclusive OR with accumulator (absolute,X)
    STA                  ; 9F 5C 8F 4C | Store accumulator to absolute long,X
    LSR $4ECD            ; 4E CD 4E | Logical shift right (absolute)
    CMP $FF00            ; CD 00 FF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_212
; Address: $EAFEB8
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_212:
    JSR $30FF            ; 20 FF 30 | Jump to subroutine
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    AND ($FE),Y          ; 31 FE | Logical AND with accumulator ((zero page),Y)
    CPX $AFEF            ; EC EF AF | Compare X register (absolute)
    LDY $ACAF            ; AC AF AC | Load from absolute address into Y register
    LDA #$23             ; A9 23 | Load immediate value into accumulator
    LDA ($A2,X)          ; A1 A2 | Load from (zero page,X) into accumulator
    AND ($A2,X)          ; 21 A2 | Logical AND with accumulator ((zero page,X))
    AND ($82,X)          ; 21 82 | Logical AND with accumulator ((zero page,X))
    AND ($10,X)          ; 21 10 | Logical AND with accumulator ((zero page,X))
    BVC $FF              ; 50 FF | Branch if overflow clear
    BVC $FF              ; 50 FF | Branch if overflow clear
    INC $FE5D,X          ; FE 5D FE | Increment (absolute,X)
    EOR $5DFE,X          ; 5D FE 5D | Exclusive OR with accumulator (absolute,X)
    INC $FE5D,X          ; FE 5D FE | Increment (absolute,X)
    LDA                  ; BF BB 3F AB | Load from absolute long,X into accumulator
    PLB                  ; AB | Pull data bank register from stack
    LDA $02862B          ; AF 2B 86 02 | Load from absolute long address into accumulator
    INC                  ; 1A | Increment accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVC $FF              ; 50 FF | Branch if overflow clear
    BVC $FF              ; 50 FF | Branch if overflow clear
    BVC $FF              ; 50 FF | Branch if overflow clear
    ADC $69FF,Y          ; 79 FF 69 | Add with carry (absolute,Y)
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    INC $FE7D,X          ; FE 7D FE | Increment (absolute,X)
    AND $39B6,Y          ; 39 B6 39 | Logical AND with accumulator (absolute,Y)
    AND $A9B6,Y          ; 39 B6 A9 | Logical AND with accumulator (absolute,Y)
    LDA #$B6             ; A9 B6 | Load immediate value into accumulator
    STA                  ; 9F A0 08 F7 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_213
; Address: $EAFF22
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_213:
    ORA $159B,X          ; 1D 9B 15 | Logical OR with accumulator (absolute,X)
    ASL $83              ; 06 83 | Arithmetic shift left (zero page)
    STX $6A              ; 86 6A | Store X register to zero page
    SBC $FD62,X          ; FD 62 FD | Subtract with carry (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    SBC $FD6A,X          ; FD 6A FD | Subtract with carry (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    SBC $FD7A,X          ; FD 7A FD | Subtract with carry (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    SBC $FD7A,X          ; FD 7A FD | Subtract with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    SBC #$D9             ; E9 D9 | Subtract with carry (immediate)
    SBC ($D1,X)          ; E1 D1 | Subtract with carry ((zero page,X))
    SBC ($D1,X)          ; E1 D1 | Subtract with carry ((zero page,X))
    SBC #$D1             ; E9 D1 | Subtract with carry (immediate)
    SBC ($C1),Y          ; F1 C1 | Subtract with carry ((zero page),Y)
    SBC ($C1,X)          ; E1 C1 | Subtract with carry ((zero page,X))
    SBC ($14,X)          ; E1 14 | Subtract with carry ((zero page,X))
    ASL $1EEF,X          ; 1E EF 1E | Arithmetic shift left (absolute,X)
    ASL $2AF7            ; 0E F7 2A | Arithmetic shift left (absolute)
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    STA                  ; 9F 00 9F 43 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank54_DmaFunction_214
; Address: $EAFF6A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_214:
    JSR $23BF            ; 20 BF 23 | Jump to subroutine
    LDY $9E01,X          ; BC 01 9E | Load from absolute,X into Y register
    JMP $33BF            ; 4C BF 33 | Jump to address
    BEQ $3F              ; F0 3F | Branch if equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank54_DmaFunction_215
; Address: $EAFF8D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_215:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    CPX #$FD             ; E0 FD | Compare X register (immediate)
    SBC $6500,X          ; FD 00 65 | Subtract with carry (absolute,X)
    BCC $B0              ; 90 B0 | Branch if carry clear
    EOR #$B0             ; 49 B0 | Exclusive OR with accumulator (immediate)
    BCC $62              ; 90 62 | Branch if carry clear
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $EDFF,X          ; FD FF ED | Subtract with carry (absolute,X)
    STZ $DF              ; 64 DF | Store zero to zero page
    BMI $EF              ; 30 EF | Branch if negative
    BCS $EF              ; B0 EF | Branch if carry set
    BCC $FF              ; 90 FF | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    BRA $4F              ; 80 4F | Branch always
    BPL $0F              ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank54_DmaFunction_216
; Address: $EAFFCF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank54_DmaFunction_216:
    JSR $FFFF            ; 20 FF FF | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    ASL $0088,X          ; 1E 88 00 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $FB00,X          ; 1E 00 FB | Arithmetic shift left (absolute,X)
