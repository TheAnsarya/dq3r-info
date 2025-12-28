;==============================================================================
; Dragon Quest III - Bank $52
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $E90000-$E97FFF
; Instructions: 9347
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_52"

;------------------------------------------------------------------------------
; Bank52_DmaFunction_000
; Address: $E98003
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_000:
    SBC #$21             ; E9 21 | PPU graphics register access
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $D8              ; 80 D8 | Branch always
    ORA ($CE),Y          ; 11 CE | Logical OR with accumulator ((zero page),Y)
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BPL $F7              ; 10 F7 | Branch if positive
    TAY                  ; A8 | Transfer accumulator to Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA #$18             ; 09 18 | Logical OR with accumulator (immediate)
    ASL $7F27,X          ; 1E 27 7F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_001
; Address: $E98035
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_001:
    JSR $0FF0            ; 20 F0 0F | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_003
; Address: $E9804A
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_003:
    PHB                  ; 8B | Push data bank register to stack
    AND $FB              ; 25 FB | Logical AND with accumulator (zero page)
    ORA $3F              ; 05 3F | Logical OR with accumulator (zero page)
    LDA                  ; BF 03 3F 03 | Load from absolute long,X into accumulator
    ORA $F901,Y          ; 19 01 F9 | Logical OR with accumulator (absolute,Y)
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    CMP $C877,X          ; DD 77 C8 | Compare accumulator (absolute,X)
    ASL $8DB1            ; 0E B1 8D | Arithmetic shift left (absolute)
    LDA                  ; BF 49 7E 31 | Load from absolute long,X into accumulator
    ROL $C003,X          ; 3E 03 C0 | Rotate left (absolute,X)
    AND $3901,Y          ; 39 01 39 | Logical AND with accumulator (absolute,Y)
    ORA $4F00            ; 0D 00 4F | Logical OR with accumulator (absolute)
    ORA $4881            ; 0D 81 48 | Logical OR with accumulator (absolute)
    CMP ($F0,X)          ; C1 F0 | Compare accumulator ((zero page,X))
    SBC $F83C,X          ; FD 3C F8 | Subtract with carry (absolute,X)
    CPX $E1              ; E4 E1 | Compare X register (zero page)
    ADC $1F76,Y          ; 79 76 1F | Add with carry (absolute,Y)
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $1F              ; F0 1F | Branch if equal
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    CMP $EEB3            ; CD B3 EE | Compare accumulator (absolute)
    LSR $E7              ; 46 E7 | Logical shift right (zero page)
    BNE $F1              ; D0 F1 | Branch if not equal
    ORA ($21,X)          ; 01 21 | PPU graphics register access
    ORA $0F80,Y          ; 19 80 0F | Logical OR with accumulator (absolute,Y)
    SBC ($61,X)          ; E1 61 | Subtract with carry ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$74             ; E0 74 | Compare X register (immediate)
    STY $8779            ; 8C 79 87 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank52_DmaFunction_004
; Address: $E980D7
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_004:
    CMP ($DF,X)          ; C1 DF | Compare accumulator ((zero page,X))
    CMP $F70F,Y          ; D9 0F F7 | Compare accumulator (absolute,Y)
    ORA $1010,Y          ; 19 10 10 | Logical OR with accumulator (absolute,Y)
    CPX $D0FC            ; EC FC D0 | Compare X register (absolute)
    BIT $ECD3            ; 2C D3 EC | Test bits in accumulator (absolute)
    CPX #$E3             ; E0 E3 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $C081,X          ; FE 81 C0 | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $B800,X          ; 7E 00 B8 | Rotate right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    INC $3801,X          ; FE 01 38 | Increment (absolute,X)
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SEC                  ; 38 | Set carry flag
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    ASL $00EF            ; 0E EF 00 | Arithmetic shift left (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_005
; Address: $E98158
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_005:
    JSR $10C0            ; 20 C0 10 | Jump to subroutine
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    CPX $FF10            ; EC 10 FF | Compare X register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_006
; Address: $E98168
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_006:
    ORA ($10),Y          ; 11 10 | Logical OR with accumulator ((zero page),Y)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($9F,X)          ; 01 9F | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_007
; Address: $E9817A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_007:
    BPL $00              ; 10 00 | Branch if positive
    ASL $00E0            ; 0E E0 00 | Arithmetic shift left (absolute)
    BVS $87              ; 70 87 | Branch if overflow set
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    CLD                  ; D8 | Clear decimal mode flag
    BVS $70              ; 70 70 | Branch if overflow set
    STZ $BEE1,X          ; 9E E1 BE | Store zero to absolute,X
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    REP #$D4             ; C2 D4 | Reset processor status bits
    CPX $F700            ; EC 00 F7 | Compare X register (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    ROR $007E,X          ; 7E 7E 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_008
; Address: $E981CF
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_008:
    ROR $8100,X          ; 7E 00 81 | Rotate right (absolute,X)
    LDA $BD00,X          ; BD 00 BD | Load from absolute,X into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STX $C2              ; 86 C2 | Store X register to zero page
    SBC #$D7             ; E9 D7 | Subtract with carry (immediate)
    STA $DBC3,Y          ; 99 C3 DB | Store accumulator to absolute,Y
    STA ($83,X)          ; 81 83 | Store accumulator to (zero page,X)
    CPX $E700            ; EC 00 E7 | Compare X register (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register
    LDX #$EE             ; A2 EE | Load immediate value into X register
    DEC $D4              ; C6 D4 | Decrement (zero page)
    INC $A2A8            ; EE A8 A2 | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    LDX #$EC             ; A2 EC | Load immediate value into X register
    DEC $DC              ; C6 DC | Decrement (zero page)
    INC $B6              ; E6 B6 | Increment (zero page)
    LDX $FF45            ; AE 45 FF | Load from absolute address into X register
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($EF,X)          ; 01 EF | Logical OR with accumulator ((zero page,X))
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    CPX #$DF             ; E0 DF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_009
; Address: $E98223
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_009:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    BVS $8F              ; 70 8F | Branch if overflow set
    ROR $7D83,X          ; 7E 83 7D | Rotate right (absolute,X)
    STA ($FC,X)          ; 81 FC | Store accumulator to (zero page,X)
    WDM #$BF             ; 42 BF | Reserved instruction
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    PHB                  ; 8B | Push data bank register to stack
    STA                  ; 9F 00 83 00 | Store accumulator to absolute long,X
    BEQ $7F              ; F0 7F | Branch if equal
    STA $70CF70          ; 8F 70 CF 70 | Store accumulator to absolute long address
    ROR $BEC1,X          ; 7E C1 BE | Rotate right (absolute,X)
    EOR ($3F,X)          ; 41 3F | Exclusive OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ADC $D700,X          ; 7D 00 D7 | Add with carry (absolute,X)
    CMP $C500,X          ; DD 00 C5 | Compare accumulator (absolute,X)
    LDA $FF3C,X          ; BD 3C FF | Load from absolute,X into accumulator
    ROR $7E7E,X          ; 7E 7E 7E | Rotate right (absolute,X)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    WDM #$FF             ; 42 FF | Reserved instruction
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_00A
; Address: $E98283
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_00A:
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $0902            ; 0D 02 09 | Logical OR with accumulator (absolute)
    ASL $7B              ; 06 7B | Arithmetic shift left (zero page)
    NOP                  ; EA | No operation
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BPL $1F              ; 10 1F | Branch if positive
    BPL $17              ; 10 17 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_00B
; Address: $E9829B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_00B:
    ORA $5FA0,X          ; 1D A0 5F | Logical OR with accumulator (absolute,X)
    BNE $2D              ; D0 2D | Branch if not equal
    ADC $FA79            ; 6D 79 FA | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    INC $BC00,X          ; FE 00 BC | Increment (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($98,X)          ; 01 98 | Logical OR with accumulator ((zero page,X))
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    SBC $E25D,X          ; FD 5D E2 | Subtract with carry (absolute,X)
    JMP ($8080)          ; 6C 80 80 | Jump to address (absolute indirect)
    BCS $00              ; B0 00 | Branch if carry set
    STA ($6F),Y          ; 91 6F | Store accumulator to (zero page),Y
    BCC $6F              ; 90 6F | Branch if carry clear
    EOR $7F82,X          ; 5D 82 7F | Exclusive OR with accumulator (absolute,X)
    AND $7FFF,X          ; 3D FF 7F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_00C
; Address: $E982DC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_00C:
    JSR $FFFF            ; 20 FF FF | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    ORA $71CE,X          ; 1D CE 71 | Logical OR with accumulator (absolute,X)
    CMP $1D57,Y          ; D9 57 1D | Compare accumulator (absolute,Y)
    ADC $3B76,Y          ; 79 76 3B | Add with carry (absolute,Y)
    TSX                  ; BA | Transfer stack pointer to X register
    INY                  ; C8 | Increment Y register
    CPY #$3D             ; C0 3D | Compare Y register (immediate)
    BEQ $2F              ; F0 2F | Branch if equal
    BNE $EF              ; D0 EF | Branch if not equal
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    LDY #$DD             ; A0 DD | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_00D
; Address: $E982FC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_00D:
    JSR $F0DF            ; 20 DF F0 | Jump to subroutine
    ADC $1F18            ; 6D 18 1F | Add with carry (absolute)
    ROL $38              ; 26 38 | Rotate left (zero page)
    SBC $27B7            ; ED B7 27 | Subtract with carry (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_00E
; Address: $E98324
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_00E:
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $E8              ; E6 E8 | Increment (zero page)
    SBC $CFC2,X          ; FD C2 CF | Subtract with carry (absolute,X)
    BIT $3A              ; 24 3A | Test bits in accumulator (zero page)
    PHY                  ; 5A | Push Y register to stack
    ROR $00F8,X          ; 7E F8 00 | Rotate right (absolute,X)
    ASL $0700,X          ; 1E 00 07 | Arithmetic shift left (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    ASL $2F06            ; 0E 06 2F | Arithmetic shift left (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $2E01            ; 0E 01 2E | Arithmetic shift left (absolute)
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_00F
; Address: $E98368
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_00F:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BPL $80              ; 10 80 | Branch if positive
    BCC $20              ; 90 20 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_010
; Address: $E9837E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_010:
    BCS $40              ; B0 40 | Branch if carry set
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    AND $6F00,X          ; 3D 00 6F | Logical AND with accumulator (absolute,X)
    STA $001000          ; 8F 00 10 00 | Store accumulator to absolute long address
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BCS $00              ; B0 00 | Branch if carry set
    STY $80              ; 84 80 | Store Y register to zero page
    STA ($58,X)          ; 81 58 | Store accumulator to (zero page,X)
    ORA ($10,X)          ; 01 10 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    ADC $F900,X          ; 7D 00 F9 | Add with carry (absolute,X)
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_011
; Address: $E983C3
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_011:
    ROR $6C34,X          ; 7E 34 6C | Rotate right (absolute,X)
    LDA ($59,X)          ; A1 59 | Load from (zero page,X) into accumulator
    STZ $57DF,X          ; 9E DF 57 | Store zero to absolute,X
    SEC                  ; 38 | Set carry flag
    STA $008100          ; 8F 00 81 00 | Store accumulator to absolute long address
    STX $00              ; 86 00 | Store X register to zero page
    INY                  ; C8 | Increment Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $4E4C,X          ; 1E 4C 4E | Arithmetic shift left (absolute,X)
    LDA $E5EC            ; AD EC E5 | Load from absolute address into accumulator
    SBC $FB9D            ; ED 9D FB | Subtract with carry (absolute)
    SBC $7E              ; E5 7E | Subtract with carry (zero page)
    ASL $00E1            ; 0E E1 00 | Arithmetic shift left (absolute)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    INC $0B00,X          ; FE 00 0B | Increment (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_012
; Address: $E98404
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_012:
    AND $8807,Y          ; 39 07 88 | Logical AND with accumulator (absolute,Y)
    BEQ $0E              ; F0 0E | Branch if equal
    BPL $01              ; 10 01 | Branch if positive
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $007F            ; 0E 7F 00 | Arithmetic shift left (absolute)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    BRA $60              ; 80 60 | Branch always
    INX                  ; E8 | Increment X register
    LDY $8E00            ; AC 00 8E | Load from absolute address into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_013
; Address: $E9842B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_013:
    BVS $80              ; 70 80 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $8000            ; EC 00 80 | Compare X register (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    BCC $00              ; 90 00 | Branch if carry clear
    ORA $9A00,X          ; 1D 00 9A | Logical OR with accumulator (absolute,X)
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_015
; Address: $E98464
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_015:
    CLD                  ; D8 | Clear decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_016
; Address: $E98480
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_016:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    BVS $40              ; 70 40 | Branch if overflow set
    BIT $CC0C            ; 2C 0C CC | Test bits in accumulator (absolute)
    CPY $EE64            ; CC 64 EE | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_017
; Address: $E9848C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_017:
    BMI $7E              ; 30 7E | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    BNE $2F              ; D0 2F | Branch if not equal
    DEC $5F31            ; CE 31 5F | Decrement (absolute)
    LDY #$9F             ; A0 9F | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_018
; Address: $E984AC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_018:
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$E6             ; C0 E6 | Compare Y register (immediate)
    EOR $A758,Y          ; 59 58 A7 | Exclusive OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_019
; Address: $E984CD
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_019:
    STY $C837            ; 8C 37 C8 | Store Y register to absolute address
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PEA #$C3FB           ; F4 FB C3 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    REP #$95             ; C2 95 | Reset processor status bits
    CPX #$2B             ; E0 2B | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $00FF,X          ; 9D FF 00 | Store accumulator to absolute,X
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    INC $BC00,X          ; FE 00 BC | Increment (absolute,X)
    ORA $B2FE,Y          ; 19 FE B2 | Logical OR with accumulator (absolute,Y)
    ORA $B946,X          ; 1D 46 B9 | Logical OR with accumulator (absolute,X)
    STZ $685B            ; 9C 5B 68 | Store zero to absolute
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    LSR $19A1,X          ; 5E A1 19 | Logical shift right (absolute,X)
    INC $83              ; E6 83 | Increment (zero page)
    SEC                  ; 38 | Set carry flag
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    LDY $BE43,X          ; BC 43 BE | Load from absolute,X into Y register
    EOR ($7D,X)          ; 41 7D | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    BVS $BB              ; 70 BB | Branch if overflow set
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_01A
; Address: $E9854A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_01A:
    SEI                  ; 78 | Set interrupt disable flag
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_01C
; Address: $E98565
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_01C:
    CPY $5E75            ; CC 75 5E | Compare Y register (absolute)
    DEX                  ; CA | Decrement X register
    LSR $0CEB,X          ; 5E EB 0C | Logical shift right (absolute,X)
    ORA $00C0,Y          ; 19 C0 00 | Logical OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_01D
; Address: $E98574
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_01D:
    BMI $00              ; 30 00 | Branch if negative
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDY $DA              ; A4 DA | Load from zero page into Y register
    PLB                  ; AB | Pull data bank register from stack
    JMP ($7D6D)          ; 6C 6D 7D | Jump to address (absolute indirect)
    CPX $F5              ; E4 F5 | Compare X register (zero page)
    PHX                  ; DA | Push X register to stack
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $7E              ; 80 7E | Branch always
    BRA $5C              ; 80 5C | Branch always
    LDY #$FA             ; A0 FA | Load immediate value into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BMI $2B              ; 30 2B | Branch if negative
    CMP $9AA4            ; CD A4 9A | Compare accumulator (absolute)
    JMP $B410            ; 4C 10 B4 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_01E
; Address: $E985AD
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_01E:
    SEI                  ; 78 | Set interrupt disable flag
    LDX $E0              ; A6 E0 | Game work RAM access
    JMP ($DB03)          ; 6C 03 DB | Jump to address (absolute indirect)
    ROR $FC01,X          ; 7E 01 FC | Rotate right (absolute,X)
    LDY $56B3            ; AC B3 56 | Load from absolute address into Y register
    CMP $CC0B,Y          ; D9 0B CC | Compare accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    LDA $08D710          ; AF 10 D7 08 | Load from absolute long address into accumulator
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_01F
; Address: $E985D2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_01F:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_020
; Address: $E985E6
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_020:
    TSX                  ; BA | Transfer stack pointer to X register
    PHX                  ; DA | Push X register to stack
    CMP ($E4,X)          ; C1 E4 | Compare accumulator ((zero page,X))
    INC $7679,X          ; FE 79 76 | Increment (absolute,X)
    DEC $F0              ; C6 F0 | Decrement (zero page)
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    ORA $050E            ; 0D 0E 05 | Logical OR with accumulator (absolute)
    ASL $2A              ; 06 2A | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    BNE $E7              ; D0 E7 | Branch if not equal
    STA $F00F,Y          ; 99 0F F0 | Store accumulator to absolute,Y
    SED                  ; F8 | Set decimal mode flag
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STY $88FF            ; 8C FF 88 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STY $8800            ; 8C 00 88 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STZ $FF              ; 64 FF | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STZ $00              ; 64 00 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    BRA $5D              ; 80 5D | Branch always
    ORA ($68,X)          ; 01 68 | Logical OR with accumulator ((zero page,X))
    ORA ($EA,X)          ; 01 EA | Logical OR with accumulator ((zero page,X))
    BCC $6A              ; 90 6A | Branch if carry clear
    INC $9C6B            ; EE 6B 9C | Increment (absolute)
    BPL $FE              ; 10 FE | Branch if positive
    INC $F400,X          ; FE 00 F4 | Increment (absolute,X)
    DEC $B9              ; C6 B9 | Decrement (zero page)
    STA ($7D,X)          ; 81 7D | Store accumulator to (zero page,X)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    SBC $32CD,X          ; FD CD 32 | Subtract with carry (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND $7E00,Y          ; 39 00 7E | Logical AND with accumulator (absolute,Y)
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_022
; Address: $E986A0
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_022:
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LSR $0A              ; 46 0A | Logical shift right (zero page)
    AND ($08),Y          ; 31 08 | Logical AND with accumulator ((zero page),Y)
    BCS $76              ; B0 76 | Branch if carry set
    LSR $0030            ; 4E 30 00 | Logical shift right (absolute)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    JMP $FE30            ; 4C 30 FE | Jump to address
    SEC                  ; 38 | Set carry flag
    BMI $00              ; 30 00 | Branch if negative
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    BRA $CE              ; 80 CE | Branch always
    STA ($19),Y          ; 91 19 | Store accumulator to (zero page),Y
    ROR                  ; 6A | Rotate right (accumulator)
    CLC                  ; 18 | Clear carry flag
    DEX                  ; CA | Decrement X register
    LSR $0CEB,X          ; 5E EB 0C | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INC $00              ; E6 00 | Increment (zero page)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    JMP $5193EC          ; 5C EC 93 51 | Jump to address long
    ADC $685A,X          ; 7D 5A 68 | Add with carry (absolute,X)
    STA $87              ; 85 87 | Store accumulator to zero page
    PHB                  ; 8B | Push data bank register to stack
    STA $80000E          ; 8F 0E 00 80 | Store accumulator to absolute long address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_023
; Address: $E98734
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_023:
    BRA $10              ; 80 10 | Branch always
    BRA $25              ; 80 25 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_024
; Address: $E9873A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_024:
    SEI                  ; 78 | Set interrupt disable flag
    BVS $81              ; 70 81 | Branch if overflow set
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$A6             ; C0 A6 | Compare Y register (immediate)
    STA $C7F8,Y          ; 99 F8 C7 | Store accumulator to absolute,Y
    CLD                  ; D8 | Clear decimal mode flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_026
; Address: $E98755
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_026:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STX $E5              ; 86 E5 | Store X register to zero page
    STA $8B8D,Y          ; 99 8D 8B | Store accumulator to absolute,Y
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $B800,X          ; FD 00 B8 | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_027
; Address: $E98776
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_027:
    JSR $60C0            ; 20 C0 60 | Jump to subroutine
    BVS $00              ; 70 00 | Branch if overflow set
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    DEC $1D89            ; CE 89 1D | Decrement (absolute)
    STA $0B6A,X          ; 9D 6A 0B | Store accumulator to absolute,X
    CPX $56D3            ; EC D3 56 | Compare X register (absolute)
    LDA #$FC             ; A9 FC | Load immediate value into accumulator
    BVS $04              ; 70 04 | Branch if overflow set
    CPX #$09             ; E0 09 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_029
; Address: $E9879D
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_029:
    JSR $1600            ; 20 00 16 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    STY $CCFF            ; 8C FF CC | Store Y register to absolute address
    BCC $FF              ; 90 FF | Branch if carry clear
    BPL $FF              ; 10 FF | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    STY $CC00            ; 8C 00 CC | Store Y register to absolute address
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    WDM #$FF             ; 42 FF | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY $6600,X          ; BC 00 66 | Load from absolute,X into Y register
    WDM #$00             ; 42 00 | Reserved instruction
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_02A
; Address: $E987DD
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_02A:
    CLC                  ; 18 | Clear carry flag
    CPX $A3              ; E4 A3 | Compare X register (zero page)
    BVC $7F              ; 50 7F | Branch if overflow clear
    ORA $5A56,Y          ; 19 56 5A | Logical OR with accumulator (absolute,Y)
    XBA                  ; EB | Exchange accumulator bytes
    LDX $3151            ; AE 51 31 | Load from absolute address into X register
    DEC $4418            ; CE 18 44 | Decrement (absolute)
    BRA $00              ; 80 00 | Branch always
    CPX #$06             ; E0 06 | Compare X register (immediate)
    LDA ($04,X)          ; A1 04 | Load from (zero page,X) into accumulator
    WDM #$80             ; 42 80 | Reserved instruction
    BRA $00              ; 80 00 | Branch always
    ORA ($8F,X)          ; 01 8F | Logical OR with accumulator ((zero page,X))
    BVS $3B              ; 70 3B | Branch if overflow set
    CPY $9C              ; C4 9C | Compare Y register (zero page)
    STA ($EE),Y          ; 91 EE | Store accumulator to (zero page),Y
    SEI                  ; 78 | Set interrupt disable flag
    ADC $0082,X          ; 7D 82 00 | Add with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    STZ $4800            ; 9C 00 48 | Store zero to absolute
    STA ($71),Y          ; 91 71 | Store accumulator to (zero page),Y
    INC $11EE            ; EE EE 11 | Increment (absolute)
    CMP $D9A2,X          ; DD A2 D9 | Compare accumulator (absolute,X)
    INC $BC              ; E6 BC | Increment (zero page)
    LDX $7D41,Y          ; BE 41 7D | Load from absolute,Y into X register
    BPL $00              ; 10 00 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_02B
; Address: $E98837
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_02B:
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    ORA ($DF,X)          ; 01 DF | Logical OR with accumulator ((zero page,X))
    BIT $53B2            ; 2C B2 53 | Test bits in accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    AND $62DA,X          ; 3D DA 62 | Logical AND with accumulator (absolute,X)
    STA $8779,X          ; 9D 79 87 | Store accumulator to absolute,X
    PLX                  ; FA | Pull X register from stack
    ORA $7D              ; 05 7D | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_02D
; Address: $E98861
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_02D:
    JSR $C4FF            ; 20 FF C4 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ROL $41FF            ; 2E FF 41 | Rotate left (absolute)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_02E
; Address: $E98871
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_02E:
    JSR $C400            ; 20 00 C4 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    ROL $4100            ; 2E 00 41 | Rotate left (absolute)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_02F
; Address: $E98889
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_02F:
    JSL $FFE1FF          ; 22 FF E1 FF | Jump to subroutine long
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_030
; Address: $E98899
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_030:
    JSL $00E100          ; 22 00 E1 00 | Jump to subroutine long
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PLY                  ; 7A | Pull Y register from stack
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY $6358            ; AC 58 63 | Load from absolute address into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    LDY $4A63            ; AC 63 4A | Load from absolute address into Y register
    PLY                  ; 7A | Pull Y register from stack
    LDA $AD52            ; AD 52 AD | Load from absolute address into accumulator
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    LDA $AD52            ; AD 52 AD | Load from absolute address into accumulator
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_031
; Address: $E988E6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_031:
    JSR $4098            ; 20 98 40 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$60             ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_032
; Address: $E988EE
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_032:
    JSR $BF98            ; 20 98 BF | Jump to subroutine
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 F8 00 | Load from absolute long,X into accumulator
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    PHY                  ; 5A | Push Y register to stack
    CLC                  ; 18 | Clear carry flag
    BIT $5A              ; 24 5A | Test bits in accumulator (zero page)
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    WDM #$66             ; 42 66 | Reserved instruction
    WDM #$7E             ; 42 7E | Reserved instruction
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    ROR $99DB,X          ; 7E DB 99 | Rotate right (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_033
; Address: $E98933
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_033:
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SBC ($7C,X)          ; E1 7C | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BRA $74              ; 80 74 | Branch always
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    PEA #$000B           ; F4 0B 00 | Push effective address to stack
    SEP #$10             ; E2 10 | Set processor status bits
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_034
; Address: $E98964
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_034:
    JSR $E0DF            ; 20 DF E0 | Game work RAM access
    ASL $2C              ; 06 2C | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$5F             ; C0 5F | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    CPY #$60             ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_035
; Address: $E9898E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_035:
    JSR $0098            ; 20 98 00 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 F8 00 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ASL $000F,X          ; 1E 0F 00 | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    LDY $DF20,X          ; BC 20 DF | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_036
; Address: $E989C8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_036:
    JSR $47DF            ; 20 DF 47 | Jump to subroutine
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_037
; Address: $E989CD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_037:
    STA                  ; 9F 60 98 FF | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $08              ; 10 08 | Branch if positive
    PLY                  ; 7A | Pull Y register from stack
    LSR $3408,X          ; 5E 08 34 | Logical shift right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $423C            ; 2C 3C 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank52_DmaFunction_038
; Address: $E989F3
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_038:
    ROR $3C24,X          ; 7E 24 3C | Rotate right (absolute,X)
    ROR $6E42,X          ; 7E 42 6E | Rotate right (absolute,X)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BIT $243C            ; 2C 3C 24 | Test bits in accumulator (absolute)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BRA $98              ; 80 98 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BIT $BC              ; 24 BC | Test bits in accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    INC $6642,X          ; FE 42 66 | Increment (absolute,X)
    WDM #$7E             ; 42 7E | Reserved instruction
    BRA $00              ; 80 00 | Branch always
    ASL $46              ; 06 46 | Arithmetic shift left (zero page)
    WDM #$5E             ; 42 5E | Reserved instruction
    EOR ($51,X)          ; 41 51 | Exclusive OR with accumulator ((zero page,X))
    ROR $74              ; 66 74 | Rotate right (zero page)
    ADC ($09),Y          ; 71 09 | Add with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    LDA $A100,Y          ; B9 00 A1 | Load from absolute,Y into accumulator
    LDX $8B00            ; AE 00 8B | Load from absolute address into X register
    STX $B400            ; 8E 00 B4 | Store X register to absolute address
    BRA $E3              ; 80 E3 | Branch always
    SBC $BD40,Y          ; F9 40 BD | Subtract with carry (absolute,Y)
    LDX $9910,Y          ; BE 10 99 | Load from absolute,Y into X register
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    WDM #$FF             ; 42 FF | Reserved instruction
    STZ $BF00            ; 9C 00 BF | Store zero to absolute
    LDX $BD00,Y          ; BE 00 BD | Load from absolute,Y into X register
    SEC                  ; 38 | Set carry flag
    EOR $30              ; 45 30 | Exclusive OR with accumulator (zero page)
    EOR $55E7            ; 4D E7 55 | Exclusive OR with accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    BPL $4B              ; 10 4B | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_039
; Address: $E98A6D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_039:
    JSR $091D            ; 20 1D 09 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    EOR $B200            ; 4D 00 B2 | Exclusive OR with accumulator (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    JMP ($1600)          ; 6C 00 16 | Jump to address (absolute indirect)
    BVS $30              ; 70 30 | Branch if overflow set
    SBC ($81,X)          ; E1 81 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_03A
; Address: $E98A86
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_03A:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $4F              ; 10 4F | Branch if positive
    LDY $1E00            ; AC 00 1E | Load from absolute address into Y register
    STA $008C00          ; 8F 00 8C 00 | Store accumulator to absolute long address
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_03B
; Address: $E98AA1
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_03B:
    STA                  ; 9F 4F B0 60 | Store accumulator to absolute long,X
    STA                  ; 9F 20 98 60 | Store accumulator to absolute long,X
    STA                  ; 9F 3E 80 20 | Store accumulator to absolute long,X
    STA                  ; 9F 20 98 FF | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    WDM #$7E             ; 42 7E | Reserved instruction
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    WDM #$7E             ; 42 7E | Reserved instruction
    WDM #$66             ; 42 66 | Reserved instruction
    WDM #$7E             ; 42 7E | Reserved instruction
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_03C
; Address: $E98B01
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_03C:
    STA                  ; 9F 4F B0 60 | Store accumulator to absolute long,X
    STA                  ; 9F 00 BF 60 | Store accumulator to absolute long,X
    STA                  ; 9F 3F 80 60 | Store accumulator to absolute long,X
    STA                  ; 9F 60 9F FF | Store accumulator to absolute long,X
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    BIT $0D              ; 24 0D | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_03D
; Address: $E98B25
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_03D:
    JSL $001300          ; 22 00 13 00 | Jump to subroutine long
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BIT $3F00            ; 2C 00 3F | Test bits in accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    DEC $3183            ; CE 83 31 | Decrement (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_03E
; Address: $E98B46
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_03E:
    PLB                  ; AB | Pull data bank register from stack
    AND $8D6A,Y          ; 39 6A 8D | Logical AND with accumulator (absolute,Y)
    ASL $A7E1,X          ; 1E E1 A7 | Arithmetic shift left (absolute,X)
    EOR $429C,Y          ; 59 9C 42 | Hardware register operation
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    STX $C600            ; 8E 00 C6 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank52_DmaFunction_03F
; Address: $E98B5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_03F:
    DEC $EF00,X          ; DE 00 EF | Decrement (absolute,X)
    INX                  ; E8 | Increment X register
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_040
; Address: $E98B82
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_040:
    RTI                  ; 40 | Return from interrupt
    BNE $20              ; D0 20 | Branch if not equal
    BEQ $20              ; F0 20 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    BNE $40              ; D0 40 | Branch if not equal
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_041
; Address: $E98B92
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_041:
    BCS $00              ; B0 00 | Branch if carry set
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BCS $00              ; B0 00 | Branch if carry set
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 3C 24 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    WDM #$7E             ; 42 7E | Reserved instruction
    PHY                  ; 5A | Push Y register to stack
    ROR $00              ; 66 00 | Rotate right (zero page)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    ROR $0E00,X          ; 7E 00 0E | Rotate right (absolute,X)
    ROL $B041            ; 2E 41 B0 | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($F2,X)          ; 41 F2 | Exclusive OR with accumulator ((zero page,X))
    JMP ($3004)          ; 6C 04 30 | Jump to address (absolute indirect)
    ROL $2DBE,X          ; 3E BE 2D | Rotate left (absolute,X)
    JMP $000E            ; 4C 0E 00 | Jump to address
    DEC $7F00            ; CE 00 7F | Decrement (absolute)
    STA                  ; 9F 00 3F 00 | Store accumulator to absolute long,X
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP $22              ; C5 22 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_042
; Address: $E98C02
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_042:
    SBC $FE03,Y          ; F9 03 FE | Subtract with carry (absolute,Y)
    PHY                  ; 5A | Push Y register to stack
    RTI                  ; 40 | Return from interrupt
    AND ($B0),Y          ; 31 B0 | Logical AND with accumulator ((zero page),Y)
    EOR $341D,X          ; 5D 1D 34 | Exclusive OR with accumulator (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $6700,X          ; FE 00 67 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    STZ $CBD6            ; 9C D6 CB | Store zero to absolute
    CMP $8B5A,Y          ; D9 5A 8B | Compare accumulator (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator
    STX $0A23            ; 8E 23 0A | Store X register to absolute address
    AND #$00             ; 29 00 | Logical AND with accumulator (immediate)
    LDA $A500            ; AD 00 A5 | Load from absolute address into accumulator
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    PLA                  ; 68 | Pull accumulator from stack
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    JMP ($0B56)          ; 6C 56 0B | Jump to address (absolute indirect)
    PHB                  ; 8B | Push data bank register to stack
    AND $88AB,Y          ; 39 AB 88 | Logical AND with accumulator (absolute,Y)
    LDX $BE              ; A6 BE | Load from zero page into X register
    LDX $889A            ; AE 9A 88 | Load from absolute address into X register
    WDM #$63             ; 42 63 | Reserved instruction
    ADC ($A9),Y          ; 71 A9 | Add with carry ((zero page),Y)
    EOR $5100,Y          ; 59 00 51 | Exclusive OR with accumulator (absolute,Y)
    STZ $8E00            ; 9C 00 8E | Store zero to absolute
    ASL $40              ; 06 40 | Arithmetic shift left (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    DEX                  ; CA | Decrement X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_043
; Address: $E98C6C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_043:
    BRA $45              ; 80 45 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    DEC $F700            ; CE 00 F7 | Decrement (absolute)
    SBC $E700,X          ; FD 00 E7 | Subtract with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_044
; Address: $E98C87
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_044:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $4C              ; 80 4C | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_045
; Address: $E98C9A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_045:
    BRA $00              ; 80 00 | Branch always
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    DEY                  ; 88 | Decrement Y register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_048
; Address: $E98CB4
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_048:
    STX $2300            ; 8E 00 23 | Store X register to absolute address
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    LDY $0A              ; A4 0A | Load from zero page into Y register
    BMI $A1              ; 30 A1 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    DEC $00              ; C6 00 | Decrement (zero page)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    LDA $EEEE00          ; AF 00 EE EE | Load from absolute long address into accumulator
    WDM #$CA             ; 42 CA | Reserved instruction
    EOR $7D10,Y          ; 59 10 7D | Exclusive OR with accumulator (absolute,Y)
    ORA $9A6B,Y          ; 19 6B 9A | Logical OR with accumulator (absolute,Y)
    LDX #$11             ; A2 11 | Load immediate value into X register
    TXA                  ; 8A | Transfer X register to accumulator
    BIT $AA00            ; 2C 00 AA | Test bits in accumulator (absolute)
    EOR $0300,X          ; 5D 00 03 | Exclusive OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    PLB                  ; AB | Pull data bank register from stack
    STX $D552            ; 8E 52 D5 | Store X register to absolute address
    PHB                  ; 8B | Push data bank register to stack
    CMP $1F5A,Y          ; D9 5A 1F | Compare accumulator (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    ADC $00              ; 65 00 | Add with carry (zero page)
    SEC                  ; 38 | Set carry flag
    BVC $0E              ; 50 0E | Branch if overflow clear
    AND $F040,X          ; 3D 40 F0 | Logical AND with accumulator (absolute,X)
    INC $61              ; E6 61 | Increment (zero page)
    PLP                  ; 28 | Pull processor status from stack
    LSR $1C9E,X          ; 5E 9E 1C | Logical shift right (absolute,X)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    ROR $7D00,X          ; 7E 00 7D | Rotate right (absolute,X)
    STA $009F00          ; 8F 00 9F 00 | Store accumulator to absolute long address
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_049
; Address: $E98D42
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_049:
    JSR $FA64            ; 20 64 FA | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_04A
; Address: $E98D52
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_04A:
    JMP $000600          ; 5C 00 06 00 | Jump to address long
    INX                  ; E8 | Increment X register
    INC $E000,X          ; FE 00 E0 | Game work RAM access
    AND $0000,X          ; 3D 00 00 | Logical AND with accumulator (absolute,X)
    EOR #$00             ; 49 00 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_04D
; Address: $E98D78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_04D:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    ASL $4CC2            ; 0E C2 4C | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register
    PHB                  ; 8B | Push data bank register to stack
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_04E
; Address: $E98D8A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_04E:
    STA $5154            ; 8D 54 51 | Store accumulator to absolute address
    SBC ($26,X)          ; E1 26 | Subtract with carry ((zero page,X))
    SBC $B700,X          ; FD 00 B7 | Subtract with carry (absolute,X)
    BIT $CC              ; 24 CC | Test bits in accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_04F
; Address: $E98DA6
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_04F:
    CPY $8D              ; C4 8D | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    TXA                  ; 8A | Transfer X register to accumulator
    WDM #$05             ; 42 05 | Reserved instruction
    PLA                  ; 68 | Pull accumulator from stack
    LDA                  ; BF 00 FC 00 | Load from absolute long,X into accumulator
    STZ $CBD6,X          ; 9E D6 CB | Store zero to absolute,X
    PHY                  ; 5A | Push Y register to stack
    CLI                  ; 58 | Clear interrupt disable flag
    REP #$C4             ; C2 C4 | Reset processor status bits
    EOR $D194            ; 4D 94 D1 | Exclusive OR with accumulator (absolute)
    ROL $29              ; 26 29 | Rotate left (zero page)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    AND $6B00,X          ; 3D 00 6B | Logical AND with accumulator (absolute,X)
    CMP $6C00,X          ; DD 00 6C | Compare accumulator (absolute,X)
    AND ($0B),Y          ; 31 0B | Logical AND with accumulator ((zero page),Y)
    CPY $FA86            ; CC 86 FA | Compare Y register (absolute)
    TXA                  ; 8A | Transfer X register to accumulator
    WDM #$06             ; 42 06 | Reserved instruction
    ADC #$13             ; 69 13 | Add with carry (immediate)
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ADC $7500,Y          ; 79 00 75 | Add with carry (absolute,Y)
    INC $8E00,X          ; FE 00 8E | Increment (absolute,X)
    REP #$CC             ; C2 CC | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHB                  ; 8B | Push data bank register to stack
    CLC                  ; 18 | Clear carry flag
    CPX #$6C             ; E0 6C | Compare X register (immediate)
    EOR $9194            ; 4D 94 91 | Exclusive OR with accumulator (absolute)
    ADC ($26,X)          ; 61 26 | Add with carry ((zero page,X))
    AND $B700,X          ; 3D 00 B7 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_050
; Address: $E98E21
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_050:
    BIT $CA              ; 24 CA | Test bits in accumulator (zero page)
    AND $C40F,Y          ; 39 0F C4 | Logical AND with accumulator (absolute,Y)
    STX $8AF8            ; 8E F8 8A | Store X register to absolute address
    RTI                  ; 40 | Return from interrupt
    ADC $FF11            ; 6D 11 FF | Add with carry (absolute)
    LDA $F400,X          ; BD 00 F4 | Load from absolute,X into accumulator
    ADC $7700,Y          ; 79 00 77 | Add with carry (absolute,Y)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STZ $4ED2,X          ; 9E D2 4E | Store zero to absolute,X
    PHX                  ; DA | Push X register to stack
    PHB                  ; 8B | Push data bank register to stack
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_051
; Address: $E98E4A
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_051:
    STA $5154            ; 8D 54 51 | Store accumulator to absolute address
    SBC ($26,X)          ; E1 26 | Subtract with carry ((zero page,X))
    AND $A500            ; 2D 00 A5 | Logical AND with accumulator (absolute)
    ASL $CC              ; 06 CC | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    AND ($0B),Y          ; 31 0B | Logical AND with accumulator ((zero page),Y)
    CPY $8D              ; C4 8D | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    TXA                  ; 8A | Transfer X register to accumulator
    WDM #$05             ; 42 05 | Reserved instruction
    PLA                  ; 68 | Pull accumulator from stack
    SBC $B700,Y          ; F9 00 B7 | Subtract with carry (absolute,Y)
    CMP ($48),Y          ; D1 48 | Compare accumulator ((zero page),Y)
    BIT #$B8             ; 89 B8 | Test bits in accumulator (immediate)
    AND $3550,X          ; 3D 50 35 | Logical AND with accumulator (absolute,X)
    BVC $2A              ; 50 2A | Branch if overflow clear
    ORA ($4E),Y          ; 11 4E | Logical OR with accumulator ((zero page),Y)
    LDA                  ; BF 00 7E 00 | Load from absolute long,X into accumulator
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    CMP $7D              ; C5 7D | Compare accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ROL $53A8,X          ; 3E A8 53 | Rotate left (absolute,X)
    BPL $33              ; 10 33 | Branch if positive
    EOR $0AA7,Y          ; 59 A7 0A | Exclusive OR with accumulator (absolute,Y)
    STA $28              ; 85 28 | Store accumulator to zero page
    INC $FD00            ; EE 00 FD | Increment (absolute)
    CMP $13C8,Y          ; D9 C8 13 | Compare accumulator (absolute,Y)
    BIT #$78             ; 89 78 | Test bits in accumulator (immediate)
    ADC $1150,X          ; 7D 50 11 | Add with carry (absolute,X)
    BVS $9A              ; 70 9A | Branch if overflow set
    CMP ($44),Y          ; D1 44 | Compare accumulator ((zero page),Y)
    LDX #$37             ; A2 37 | Load immediate value into X register
    ROR $EF00,X          ; 7E 00 EF | Rotate right (absolute,X)
    LDA $008F00          ; AF 00 8F 00 | Load from absolute long address into accumulator
    ROL $AB00            ; 2E 00 AB | Rotate left (absolute)
    EOR $0200,X          ; 5D 00 02 | Exclusive OR with accumulator (absolute,X)
    AND $C4              ; 25 C4 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_052
; Address: $E98EE4
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_052:
    ADC $3F58,X          ; 7D 58 3F | Add with carry (absolute,X)
    LDA $1353            ; AD 53 13 | Load from absolute address into accumulator
    AND $9F5A,Y          ; 39 5A 9F | Logical AND with accumulator (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA $FB00,X          ; BD 00 FB | Load from absolute,X into accumulator
    CPX $E500            ; EC 00 E5 | Compare X register (absolute)
    SBC #$00             ; E9 00 | Subtract with carry (immediate)
    ADC $00              ; 65 00 | Add with carry (zero page)
    CMP ($C8),Y          ; D1 C8 | Compare accumulator ((zero page),Y)
    CMP #$18             ; C9 18 | Compare accumulator (immediate)
    AND $3570,X          ; 3D 70 35 | Logical AND with accumulator (absolute,X)
    BVC $BA              ; 50 BA | Branch if overflow clear
    CMP ($4E),Y          ; D1 4E | Compare accumulator ((zero page),Y)
    STZ $B4              ; 64 B4 | Store zero to zero page
    ROL $EF00,X          ; 3E 00 EF | Rotate left (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    CMP #$23             ; C9 23 | Compare accumulator (immediate)
    DEC $7F              ; C6 7F | Decrement (zero page)
    PHA                  ; 48 | Push accumulator to stack
    LDA #$53             ; A9 53 | Load immediate value into accumulator
    ORA ($31),Y          ; 11 31 | Logical OR with accumulator ((zero page),Y)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $28              ; 84 28 | Store Y register to zero page
    SBC $B700,Y          ; F9 00 B7 | Subtract with carry (absolute,Y)
    INC $ED00            ; EE 00 ED | Increment (absolute)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    CMP ($48),Y          ; D1 48 | Compare accumulator ((zero page),Y)
    BIT #$B8             ; 89 B8 | Test bits in accumulator (immediate)
    AND $3550,X          ; 3D 50 35 | Logical AND with accumulator (absolute,X)
    BVC $2A              ; 50 2A | Branch if overflow clear
    ORA ($4E),Y          ; 11 4E | Logical OR with accumulator ((zero page),Y)
    LDA                  ; BF 00 7E 00 | Load from absolute long,X into accumulator
    PLB                  ; AB | Pull data bank register from stack
    ADC $0200,X          ; 7D 00 02 | Add with carry (absolute,X)
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    CMP $7D              ; C5 7D | Compare accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ROL $53A8,X          ; 3E A8 53 | Rotate left (absolute,X)
    BPL $11              ; 10 11 | Branch if positive
    ASL $94              ; 06 94 | Arithmetic shift left (zero page)
    CLV                  ; B8 | Clear overflow flag
    CPX $F900            ; EC 00 F9 | Compare X register (absolute)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ASL $1C0F            ; 0E 0F 1C | Arithmetic shift left (absolute)
    BPL $1F              ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_053
; Address: $E98FBC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_053:
    JSR $603F            ; 20 3F 60 | Jump to subroutine
    ORA ($1E),Y          ; 11 1E | Logical OR with accumulator ((zero page),Y)
    EOR #$01             ; 49 01 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_054
; Address: $E98FE2
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_054:
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SBC $FE01            ; ED 01 FE | Subtract with carry (absolute)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $7F              ; 80 7F | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BCS $30              ; B0 30 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX $FEFF            ; EC FF FE | Compare X register (absolute)
    EOR #$7E             ; 49 7E | Exclusive OR with accumulator (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SBC $FEFE            ; ED FE FE | Subtract with carry (absolute)
    STY $3D              ; 84 3D | Store Y register to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_055
; Address: $E99046
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_055:
    PLB                  ; AB | Pull data bank register from stack
    AND $8D62,Y          ; 39 62 8D | Logical AND with accumulator (absolute,Y)
    ASL $A7E1,X          ; 1E E1 A7 | Arithmetic shift left (absolute,X)
    EOR $429C,Y          ; 59 9C 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    BRA $0E              ; 80 0E | Branch always
    DEC $00              ; C6 00 | Decrement (zero page)
    BCC $00              ; 90 00 | Branch if carry clear
    DEC $EF00,X          ; DE 00 EF | Decrement (absolute,X)
    STZ $CB1C            ; 9C 1C CB | Store zero to absolute
    STA $AB6233          ; 8F 33 62 AB | Store accumulator to absolute long address
    AND $8D62,Y          ; 39 62 8D | Logical AND with accumulator (absolute,Y)
    ASL $A7E1,X          ; 1E E1 A7 | Arithmetic shift left (absolute,X)
    EOR $429C,Y          ; 59 9C 42 | Hardware register operation
    BMI $1F              ; 30 1F | Branch if negative
    STY $C60E            ; 8C 0E C6 | Store Y register to absolute address
    BCC $00              ; 90 00 | Branch if carry clear
    DEC $EF00,X          ; DE 00 EF | Decrement (absolute,X)
    AND $AB6E,X          ; 3D 6E AB | Logical AND with accumulator (absolute,X)
    AND $8D62,Y          ; 39 62 8D | Logical AND with accumulator (absolute,Y)
    ASL $A7E1,X          ; 1E E1 A7 | Arithmetic shift left (absolute,X)
    EOR $429C,Y          ; 59 9C 42 | Hardware register operation
    STX $C60E            ; 8E 0E C6 | Store X register to absolute address
    BCC $00              ; 90 00 | Branch if carry clear
    DEC $EF00,X          ; DE 00 EF | Decrement (absolute,X)
    LDA                  ; BF BF 40 40 | Load from absolute long,X into accumulator
    LDA                  ; BF BF 40 40 | Load from absolute long,X into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to absolute,Y
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_056
; Address: $E990BA
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_056:
    ASL $B9              ; 06 B9 | Arithmetic shift left (zero page)
    STA $0062,X          ; 9D 62 00 | Store accumulator to absolute,X
    BPL $10              ; 10 10 | Branch if positive
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    EOR ($AE),Y          ; 51 AE | Exclusive OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    ORA $00E2,X          ; 1D E2 00 | Logical OR with accumulator (absolute,X)
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $03              ; 10 03 | Branch if positive
    BVS $0F              ; 70 0F | Branch if overflow set
    STY $3333            ; 8C 33 33 | Store Y register to absolute address
    CPY $E01F            ; CC 1F E0 | Game work RAM access
    BEQ $1F              ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank52_DmaFunction_057
; Address: $E990FF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_057:
    JSR $D8D8            ; 20 D8 D8 | Jump to subroutine
    ASL $070E            ; 0E 0E 07 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_058
; Address: $E99111
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_058:
    JSR $F00E            ; 20 0E F0 | Jump to subroutine
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    ORA #$FC             ; 09 FC | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    BCC $6F              ; 90 6F | Branch if carry clear
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BPL $03              ; 10 03 | Branch if positive
    BVS $0F              ; 70 0F | Branch if overflow set
    STY $3333            ; 8C 33 33 | Store Y register to absolute address
    CPY $E01F            ; CC 1F E0 | Game work RAM access
    BRA $0F              ; 80 0F | Branch always
    BEQ $1F              ; F0 1F | Branch if equal
    LDY #$D8             ; A0 D8 | Load immediate value into Y register
    CLD                  ; D8 | Clear decimal mode flag
    ASL $070E            ; 0E 0E 07 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_059
; Address: $E9916C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_059:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_05A
; Address: $E99171
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_05A:
    JSR $F00E            ; 20 0E F0 | Jump to subroutine
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA #$FC             ; 09 FC | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    BCC $90              ; 90 90 | Branch if carry clear
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    CMP #$DB             ; C9 DB | Compare accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 40 3E DF | Load from absolute long,X into accumulator
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    BIT $F7              ; 24 F7 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF DF 20 13 | Load from absolute long,X into accumulator
    CPX #$12             ; E0 12 | Compare X register (immediate)
    BPL $11              ; 10 11 | Branch if positive
    BPL $6E              ; 10 6E | Branch if positive
    LDA                  ; BF 40 3F DF | Load from absolute long,X into accumulator
    CPX #$11             ; E0 11 | Compare X register (immediate)
    SBC $E21C            ; ED 1C E2 | Subtract with carry (absolute)
    BPL $12              ; 10 12 | Branch if positive
    BPL $40              ; 10 40 | Branch if positive
    LDA                  ; BF DF 20 0E | Load from absolute long,X into accumulator
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    STA                  ; 9F 0F FF 90 | Store accumulator to absolute long,X
    STA $896630          ; 8F 30 66 89 | Store accumulator to absolute long address
    BRA $6B              ; 80 6B | Branch always
    BNE $20              ; D0 20 | Branch if not equal
    BPL $2F              ; 10 2F | Branch if positive
    BNE $E0              ; D0 E0 | Game work RAM access
    ASL $6E69            ; 0E 69 6E | Arithmetic shift left (absolute)
    PEA #$E6D3           ; F4 D3 E6 | Push effective address to stack
    SBC #$F6             ; E9 F6 | Subtract with carry (immediate)
    CLC                  ; 18 | Clear carry flag
    CMP ($3C,X)          ; C1 3C | Compare accumulator ((zero page,X))
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    LSR $B1              ; 46 B1 | Logical shift right (zero page)
    ASL $91              ; 06 91 | Arithmetic shift left (zero page)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_05B
; Address: $E99202
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_05B:
    BVS $70              ; 70 70 | Branch if overflow set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $03              ; 10 03 | Branch if positive
    BVS $0F              ; 70 0F | Branch if overflow set
    STY $3333            ; 8C 33 33 | Store Y register to absolute address
    CPY $E01F            ; CC 1F E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank52_DmaFunction_05C
; Address: $E9921B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_05C:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    STY $D8D8            ; 8C D8 D8 | Store Y register to absolute address
    ASL $070E            ; 0E 0E 07 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_05D
; Address: $E99231
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_05D:
    JSR $F00E            ; 20 0E F0 | Jump to subroutine
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_05E
; Address: $E9923D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_05E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BEQ $70              ; F0 70 | Branch if equal
    STA                  ; 9F 0F 7F 10 | Store accumulator to absolute long,X
    BCS $66              ; B0 66 | Branch if carry set
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_05F
; Address: $E99258
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_05F:
    BNE $20              ; D0 20 | Branch if not equal
    BPL $2F              ; 10 2F | Branch if positive
    BNE $60              ; D0 60 | Branch if not equal
    ASL $6E69            ; 0E 69 6E | Arithmetic shift left (absolute)
    PEA #$E6D3           ; F4 D3 E6 | Push effective address to stack
    SBC #$F6             ; E9 F6 | Subtract with carry (immediate)
    INC $C118            ; EE 18 C1 | Increment (absolute)
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    LSR $B1              ; 46 B1 | Logical shift right (zero page)
    ASL $91              ; 06 91 | Arithmetic shift left (zero page)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register
    SBC $FBDF,Y          ; F9 DF FB | Subtract with carry (absolute,Y)
    STA $FD              ; 85 FD | Store accumulator to zero page
    SBC $5757,Y          ; F9 57 57 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_060
; Address: $E99295
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_060:
    JSR $7A85            ; 20 85 7A | Jump to subroutine
    TAY                  ; A8 | Transfer accumulator to Y register
    SBC $F904,Y          ; F9 04 F9 | Subtract with carry (absolute,Y)
    BRA $7F              ; 80 7F | Branch always
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF B7 5C 5C | Load from absolute long,X into accumulator
    JMP $00FF5C          ; 5C 5C FF 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    ORA $8DA2            ; 0D A2 8D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_061
; Address: $E992BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_061:
    JSL $00F80F          ; 22 0F F8 00 | Jump to subroutine long
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    CPX $431B            ; EC 1B 43 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_062
; Address: $E992CB
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_062:
    ASL $0141            ; 0E 41 01 | Arithmetic shift left (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX $E713            ; EC 13 E7 | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    JMP ($608D)          ; 6C 8D 60 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    PLX                  ; FA | Pull X register from stack
    SBC $EF32            ; ED 32 EF | Subtract with carry (absolute)
    PEA #$7CD7           ; F4 D7 7C | Push effective address to stack
    STA ($82,X)          ; 81 82 | Store accumulator to (zero page,X)
    SBC $07FA,Y          ; F9 FA 07 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    STA $01FE70          ; 8F 70 FE 01 | Store accumulator to absolute long address
    DEC                  ; 3A | Decrement accumulator
    CMP $F6              ; C5 F6 | Compare accumulator (zero page)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    SBC ($4A),Y          ; F1 4A | Subtract with carry ((zero page),Y)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_063
; Address: $E99303
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_063:
    JSR $3F0F            ; 20 0F 3F | Jump to subroutine
    JMP ($431B)          ; 6C 1B 43 | Jump to address (absolute indirect)
    ASL $0141            ; 0E 41 01 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_064
; Address: $E99310
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_064:
    JSR $331F            ; 20 1F 33 | Jump to subroutine
    JMP ($6713)          ; 6C 13 67 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_065
; Address: $E9931A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_065:
    JSR $125F            ; 20 5F 12 | Jump to subroutine
    JMP ($600D)          ; 6C 0D 60 | Jump to address (absolute indirect)
    PEA #$0418           ; F4 18 04 | Push effective address to stack
    PEA #$ECF8           ; F4 F8 EC | Push effective address to stack
    INC $D6F4            ; EE F4 D6 | Increment (absolute)
    BRA $82              ; 80 82 | Branch always
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    STY $FC70            ; 8C 70 FC | Store Y register to absolute address
    DEC                  ; 3A | Decrement accumulator
    CPY $F6              ; C4 F6 | Compare Y register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL $4AF0            ; 0E F0 4A | Arithmetic shift left (absolute)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ASL $CBFF            ; 0E FF CB | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_066
; Address: $E99349
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_066:
    ADC ($10,X)          ; 61 10 | Add with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$A7             ; A0 A7 | Load immediate value into Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $CBF0            ; 0D F0 CB | Logical OR with accumulator (absolute)
    STY $40A8            ; 8C A8 40 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank52_DmaFunction_067
; Address: $E9935D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_067:
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $09              ; 10 09 | Branch if positive
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)
    AND $4808            ; 2D 08 48 | Logical AND with accumulator (absolute)
    LDA #$C9             ; A9 C9 | Load immediate value into accumulator
    BVS $10              ; 70 10 | Branch if overflow set
    STZ $A4              ; 64 A4 | Store zero to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_068
; Address: $E9936D
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_068:
    PLB                  ; AB | Pull data bank register from stack
    ORA $4DF2            ; 0D F2 4D | Logical OR with accumulator (absolute)
    LDA $26D910          ; AF 10 D9 26 | Load from absolute long address into accumulator
    SBC $403F            ; ED 3F 40 | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    SBC $2302,X          ; FD 02 23 | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $1411            ; 0D 11 14 | Logical OR with accumulator (absolute)
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $D3              ; 65 D3 | Add with carry (zero page)
    BIT $F40B            ; 2C 0B F4 | Test bits in accumulator (absolute)
    BCC $BA              ; 90 BA | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    CLI                  ; 58 | Clear interrupt disable flag
    STA $314FB0          ; 8F B0 4F 31 | Store accumulator to absolute long address
    LDA $F3AFD3          ; AF D3 AF F3 | Load from absolute long address into accumulator
    ASL $FEA1,X          ; 1E A1 FE | Arithmetic shift left (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    BIT $FB              ; 24 FB | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    ORA $1411            ; 0D 11 14 | Logical OR with accumulator (absolute)
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    CLC                  ; 18 | Clear carry flag
    AND $13              ; 25 13 | Logical AND with accumulator (zero page)
    BPL $1A              ; 10 1A | Branch if positive
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY $58              ; C4 58 | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    BCS $48              ; B0 48 | Branch if carry set
    BMI $48              ; 30 48 | Branch if negative
    BCS $48              ; B0 48 | Branch if carry set
    BCS $48              ; B0 48 | Branch if carry set
    BCS $A8              ; B0 A8 | Branch if carry set
    BNE $A8              ; D0 A8 | Branch if not equal
    BEQ $1C              ; F0 1C | Branch if equal
    LDY #$F8             ; A0 F8 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_069
; Address: $E993F8
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_069:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_06B
; Address: $E99400
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_06B:
    JSR $F71A            ; 20 1A F7 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    INC $F9              ; E6 F9 | Increment (zero page)
    PEA #$6608           ; F4 08 66 | Push effective address to stack
    ROR $C5              ; 66 C5 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_06C
; Address: $E99411
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_06C:
    JSR $7788            ; 20 88 77 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_06D
; Address: $E9941E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_06D:
    JSR $2099            ; 20 99 20 | Jump to subroutine
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $8127,X          ; FD 27 81 | Subtract with carry (absolute,X)
    STX $11              ; 86 11 | Store X register to zero page
    ORA ($5F),Y          ; 11 5F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_06E
; Address: $E99431
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_06E:
    JSR $1CE3            ; 20 E3 1C | Jump to subroutine
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LSR $2501,X          ; 5E 01 25 | Logical shift right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    STZ $8861,X          ; 9E 61 88 | Store zero to absolute,X
    ROR $52              ; 66 52 | Rotate right (zero page)
    WDM #$F3             ; 42 F3 | Reserved instruction
    INC                  ; 1A | Increment accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    PHX                  ; DA | Push X register to stack
    NOP                  ; EA | No operation
    TSX                  ; BA | Transfer stack pointer to X register
    NOP                  ; EA | No operation
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    NOP                  ; EA | No operation
    INC                  ; 1A | Increment accumulator
    PLX                  ; FA | Pull X register from stack
    INC $15EA            ; EE EA 15 | Increment (absolute)
    STX $2A70            ; 8E 70 2A | Store X register to absolute address
    TAX                  ; AA | Transfer accumulator to X register
    INC $1E11            ; EE 11 1E | Increment (absolute)
    SBC ($AA,X)          ; E1 AA | Subtract with carry ((zero page,X))
    ORA ($BF),Y          ; 11 BF | Logical OR with accumulator ((zero page),Y)
    LDA #$D6             ; A9 D6 | Load immediate value into accumulator
    LDA $F4AFF7          ; AF F7 AF F4 | Load from absolute long address into accumulator
    LDA $E5BFF1          ; AF F1 BF E5 | Load from absolute long address into accumulator
    LDA $D6A9F0          ; AF F0 A9 D6 | Load from absolute long address into accumulator
    BPL $DE              ; 10 DE | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_06F
; Address: $E99473
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_06F:
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    SBC $ED06,Y          ; F9 06 ED | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    DEC $1A21,X          ; DE 21 1A | Decrement (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1916,X          ; 1E 16 19 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA $171C,Y          ; 19 1C 17 | Logical OR with accumulator (absolute,Y)
    ASL $E8              ; 06 E8 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $08              ; E6 08 | Increment (zero page)
    NOP                  ; EA | No operation
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ADC #$F9             ; 69 F9 | Add with carry (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    DEC $28              ; C6 28 | Decrement (zero page)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL $150A            ; 0E 0A 15 | Arithmetic shift left (absolute)
    ASL $0A10            ; 0E 10 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1E11            ; 0E 11 1E | Arithmetic shift left (absolute)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($B8),Y          ; 11 B8 | Logical OR with accumulator ((zero page),Y)
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BNE $A8              ; D0 A8 | Branch if not equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $B8              ; F0 B8 | Branch if equal
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BEQ $A8              ; F0 A8 | Branch if equal
    BNE $E8              ; D0 E8 | Branch if not equal
    BPL $D8              ; 10 D8 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_070
; Address: $E994D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_070:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BPL $F8              ; 10 F8 | Branch if positive
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_072
; Address: $E994E4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_072:
    BPL $3B              ; 10 3B | Branch if positive
    ADC $F758,Y          ; 79 58 F7 | Add with carry (absolute,Y)
    AND ($3D),Y          ; 31 3D | Logical AND with accumulator ((zero page),Y)
    BMI $C8              ; 30 C8 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    PEA #$00F5           ; F4 F5 00 | Push effective address to stack
    BPL $A7              ; 10 A7 | Branch if positive
    INC $F301,X          ; FE 01 F3 | Increment (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    INY                  ; C8 | Increment Y register
    ADC $74FF,X          ; 7D FF 74 | Add with carry (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_073
; Address: $E9950D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_073:
    JSR $3BC4            ; 20 C4 3B | Jump to subroutine
    ADC $7482,X          ; 7D 82 74 | Add with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_075
; Address: $E9951C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_075:
    JSR $3BDF            ; 20 DF 3B | Jump to subroutine
    CPY $FA              ; C4 FA | Compare Y register (zero page)
    INX                  ; E8 | Increment X register
    DEC $0324            ; CE 24 03 | Decrement (absolute)
    AND #$DF             ; 29 DF | Logical AND with accumulator (immediate)
    SEP #$DC             ; E2 DC | Set processor status bits
    ADC ($5F,X)          ; 61 5F | Add with carry ((zero page,X))
    SEP #$7F             ; E2 7F | Set processor status bits
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BIT #$ED             ; 89 ED | Test bits in accumulator (immediate)
    DEX                  ; CA | Decrement X register
    SEP #$1D             ; E2 1D | Set processor status bits
    STZ $1DE2            ; 9C E2 1D | Store zero to absolute
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    LDY $FED3            ; AC D3 FE | Load from absolute address into Y register
    LDA $78C7,Y          ; B9 C7 78 | Load from absolute,Y into accumulator
    AND $9A              ; 25 9A | Logical AND with accumulator (zero page)
    EOR $05FA            ; 4D FA 05 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_076
; Address: $E99551
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_076:
    JSR $28D7            ; 20 D7 28 | Jump to subroutine
    LDA                  ; BF 40 7F 80 | Load from absolute long,X into accumulator
    ADC $3D82,X          ; 7D 82 3D | Add with carry (absolute,X)
    REP #$B3             ; C2 B3 | Reset processor status bits
    JMP $081A            ; 4C 1A 08 | Jump to address
    LSR $8324            ; 4E 24 83 | Logical shift right (absolute)
    AND #$DF             ; 29 DF | Logical AND with accumulator (immediate)
    ADC ($5F,X)          ; 61 5F | Add with carry ((zero page,X))
    SEP #$7F             ; E2 7F | Set processor status bits
    CPX #$0F             ; E0 0F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_077
; Address: $E9956F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_077:
    BIT #$0D             ; 89 0D | Test bits in accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    STA $9C62,X          ; 9D 62 9C | Store accumulator to absolute,X
    SEP #$1D             ; E2 1D | Set processor status bits
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    BNE $AE              ; D0 AE | Branch if not equal
    BNE $FF              ; D0 FF | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    CMP $7A              ; C5 7A | Compare accumulator (zero page)
    AND $9A              ; 25 9A | Logical AND with accumulator (zero page)
    EOR $05FA            ; 4D FA 05 | Exclusive OR with accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_078
; Address: $E99591
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_078:
    JSR $28D6            ; 20 D6 28 | Jump to subroutine
    LDA $7F42,X          ; BD 42 7F | Load from absolute,X into accumulator
    BRA $7F              ; 80 7F | Branch always
    ADC $3D82,X          ; 7D 82 3D | Add with carry (absolute,X)
    REP #$B3             ; C2 B3 | Reset processor status bits
    JMP $7377            ; 4C 77 73 | Jump to address
    BRA $E2              ; 80 E2 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $20272F          ; AF 2F 27 20 | Load from absolute long address into accumulator
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 40 27 18 | Load from absolute long,X into accumulator
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)
    BPL $C9              ; 10 C9 | Branch if positive
    CMP $1F22,X          ; DD 22 1F | Compare accumulator (absolute,X)
    PEA #$C4F2           ; F4 F2 C4 | Push effective address to stack
    BRA $F8              ; 80 F8 | Branch always
    CPX #$BE             ; E0 BE | Compare X register (immediate)
    EOR ($2E,X)          ; 41 2E | Exclusive OR with accumulator ((zero page,X))
    CMP ($8B),Y          ; D1 8B | Compare accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    CPY $6832            ; CC 32 68 | Compare Y register (absolute)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    BPL $D0              ; 10 D0 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_079
; Address: $E995E3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_079:
    JSR $40A0            ; 20 A0 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_07A
; Address: $E995F9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_07A:
    BRA $00              ; 80 00 | Branch always
    SBC $FB5F,Y          ; F9 5F FB | Subtract with carry (absolute,Y)
    ORA $1D              ; 05 1D | Logical OR with accumulator (zero page)
    SBC #$77             ; E9 77 | Subtract with carry (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_07B
; Address: $E9960D
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_07B:
    SEP #$E0             ; E2 E0 | Game work RAM access
    LDY #$05             ; A0 05 | Load immediate value into Y register
    PLX                  ; FA | Pull X register from stack
    XBA                  ; EB | Exchange accumulator bytes
    CPX $08              ; E4 08 | Compare X register (zero page)
    CPX $19              ; E4 19 | Compare X register (zero page)
    STZ $99              ; 64 99 | Store zero to zero page
    CPX #$40             ; E0 40 | Compare X register (immediate)
    PEA #$F425           ; F4 25 F4 | Push effective address to stack
    XBA                  ; EB | Exchange accumulator bytes
    SED                  ; F8 | Set decimal mode flag
    ORA $27EC,Y          ; 19 EC 27 | Logical OR with accumulator (absolute,Y)
    BIT $DB7E            ; 2C 7E DB | Test bits in accumulator (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    ADC $EB80,X          ; 7D 80 EB | Add with carry (absolute,X)
    ASL $34E0,X          ; 1E E0 34 | Arithmetic shift left (absolute,X)
    INY                  ; C8 | Increment Y register
    BNE $DA              ; D0 DA | Branch if not equal
    BIT $1D              ; 24 1D | Test bits in accumulator (zero page)
    ASL $E0E1,X          ; 1E E1 E0 | Game work RAM access
    STA                  ; 9F E7 9F E6 | Store accumulator to absolute long,X
    ROL                  ; 2A | Rotate left (accumulator)
    BIT $0F2A            ; 2C 2A 0F | Test bits in accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    SBC $FAE5,Y          ; F9 E5 FA | Subtract with carry (absolute,Y)
    LDA $B5D3            ; AD D3 B5 | Load from absolute address into accumulator
    PEA #$785C           ; F4 5C 78 | Push effective address to stack
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BCS $7F              ; B0 7F | Branch if carry set
    BIT $CD73            ; 2C 73 CD | Test bits in accumulator (absolute)
    BVS $9F              ; 70 9F | Branch if overflow set
    SBC $A3DD,X          ; FD DD A3 | Subtract with carry (absolute,X)
    JMP $3F00FF          ; 5C FF 00 3F | Jump to address long
    BRA $2C              ; 80 2C | Branch always
    CMP $9E32            ; CD 32 9E | Compare accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_07D
; Address: $E996A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_07D:
    JSR $87D3            ; 20 D3 87 | Jump to subroutine
    STX $FD              ; 86 FD | Store X register to zero page
    ORA ($E6),Y          ; 11 E6 | Logical OR with accumulator ((zero page),Y)
    SBC #$69             ; E9 69 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_07E
; Address: $E996B1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_07E:
    JSR $1CE3            ; 20 E3 1C | Jump to subroutine
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    BVC $8E              ; 50 8E | Branch if overflow clear
    ADC ($05),Y          ; 71 05 | Add with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    INC $6811            ; EE 11 68 | Increment (absolute)
    ROL $351C,X          ; 3E 1C 35 | Rotate left (absolute,X)
    AND $DE3A,Y          ; 39 3A DE | Logical AND with accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    ASL $DD2A            ; 0E 2A DD | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_07F
; Address: $E996D1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_07F:
    JSR $608D            ; 20 8D 60 | Jump to subroutine
    AND $AEC0            ; 2D C0 AE | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    JMP ($CC80)          ; 6C 80 CC | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_080
; Address: $E996DB
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_080:
    JSR $11EE            ; 20 EE 11 | Jump to subroutine
    SBC $7D02            ; ED 02 7D | Subtract with carry (absolute)
    AND $AB2F,Y          ; 39 2F AB | Logical AND with accumulator (absolute,Y)
    ORA ($7D),Y          ; 11 7D | Logical OR with accumulator ((zero page),Y)
    ORA $1434,X          ; 1D 34 14 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ADC $B359,X          ; 7D 59 B3 | Add with carry (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    AND ($06),Y          ; 31 06 | Logical AND with accumulator ((zero page),Y)
    STY $B7              ; 84 B7 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    SEC                  ; 38 | Set carry flag
    PEA #$6DDC           ; F4 DC 6D | Push effective address to stack
    DEC $7E63,X          ; DE 63 7E | Decrement (absolute,X)
    BIT #$FF             ; 89 FF | Test bits in accumulator (immediate)
    LSR $00FF            ; 4E FF 00 | Logical shift right (absolute)
    SEC                  ; 38 | Set carry flag
    PEA #$6F0B           ; F4 0B 6F | Push effective address to stack
    BCC $63              ; 90 63 | Branch if carry clear
    STZ $7689            ; 9C 89 76 | Store zero to absolute
    ADC $748F,X          ; 7D 8F 74 | Add with carry (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $EF09,X          ; FD 09 EF | Subtract with carry (absolute,X)
    ADC $7482,X          ; 7D 82 74 | Add with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    LDY $0A              ; A4 0A | Load from zero page into Y register
    PEA #$AA55           ; F4 55 AA | Push effective address to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_081
; Address: $E99740
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_081:
    LSR $CC3C,X          ; 5E 3C CC | Logical shift right (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    BIT $9C28            ; 2C 28 9C | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    CPY $EFE8            ; CC E8 EF | Compare Y register (absolute)
    INY                  ; C8 | Increment Y register
    CPY $432B            ; CC 2B 43 | Compare Y register (absolute)
    ROR $40AE            ; 6E AE 40 | Rotate right (absolute)
    LDY $6C50            ; AC 50 6C | Load from absolute address into Y register
    BCC $AC              ; 90 AC | Branch if carry clear
    CPX $CF10            ; EC 10 CF | Compare X register (absolute)
    BMI $2F              ; 30 2F | Branch if negative
    BNE $6E              ; D0 6E | Branch if not equal
    STA ($70),Y          ; 91 70 | Store accumulator to (zero page),Y
    AND ($17),Y          ; 31 17 | Logical AND with accumulator ((zero page),Y)
    AND ($14),Y          ; 31 14 | Logical AND with accumulator ((zero page),Y)
    AND ($D6),Y          ; 31 D6 | Logical AND with accumulator ((zero page),Y)
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA #$C4             ; 09 C4 | Logical OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $0618,X          ; 1D 18 06 | Logical OR with accumulator (absolute,X)
    ORA $1B14,X          ; 1D 14 1B | Logical OR with accumulator (absolute,X)
    SBC $3DC0,X          ; FD C0 3D | Subtract with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    SEP #$05             ; E2 05 | Set processor status bits
    PHB                  ; 8B | Push data bank register to stack
    SBC $0B02,X          ; FD 02 0B | Subtract with carry (absolute,X)
    CPX $C2              ; E4 C2 | Compare X register (zero page)
    BIT $F0C9            ; 2C C9 F0 | Test bits in accumulator (absolute)
    CMP ($21),Y          ; D1 21 | PPU graphics register access
    BPL $3B              ; 10 3B | Branch if positive
    ADC $F758,Y          ; 79 58 F7 | Add with carry (absolute,Y)
    AND ($3D),Y          ; 31 3D | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF F6 | Load from absolute long,X into accumulator
    ORA #$2F             ; 09 2F | Logical OR with accumulator (immediate)
    BNE $F5              ; D0 F5 | Branch if not equal
    BPL $A7              ; 10 A7 | Branch if positive
    INC $F301,X          ; FE 01 F3 | Increment (absolute,X)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_082
; Address: $E997C3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_082:
    JSL $841828          ; 22 28 18 84 | Jump to subroutine long
    STY $FF              ; 84 FF | Store Y register to zero page
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_083
; Address: $E997CB
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_083:
    SEC                  ; 38 | Set carry flag
    STY $7B              ; 84 7B | Store Y register to zero page
    PLP                  ; 28 | Pull processor status from stack
    PLX                  ; FA | Pull X register from stack
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    STY $FB              ; 84 FB | Store Y register to zero page
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    INC                  ; 1A | Increment accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    DEX                  ; CA | Decrement X register
    PLX                  ; FA | Pull X register from stack
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL $150A            ; 0E 0A 15 | Arithmetic shift left (absolute)
    ASL $0A10            ; 0E 10 0A | Arithmetic shift left (absolute)
    PEA #$F50A           ; F4 0A F5 | Push effective address to stack
    ASL $1E31            ; 0E 31 1E | Arithmetic shift left (absolute)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    ORA ($B8),Y          ; 11 B8 | Logical OR with accumulator ((zero page),Y)
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BNE $AF              ; D0 AF | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    PEA #$FFA3           ; F4 A3 FF | Push effective address to stack
    LDY $A8EC,X          ; BC EC A8 | Load from absolute,X into Y register
    BEQ $A8              ; F0 A8 | Branch if equal
    BNE $E8              ; D0 E8 | Branch if not equal
    BPL $D8              ; 10 D8 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_084
; Address: $E99813
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_084:
    JSR $07F8            ; 20 F8 07 | Jump to subroutine
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_085
; Address: $E9981F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_085:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    SBC $F0D6,Y          ; F9 D6 F0 | Subtract with carry (absolute,Y)
    BRA $C0              ; 80 C0 | Branch always
    BRA $18              ; 80 18 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_086
; Address: $E9982F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_086:
    BRA $FF              ; 80 FF | Branch always
    AND #$88             ; 29 88 | Logical AND with accumulator (immediate)
    LDA $C03850          ; AF 50 38 C0 | Load from absolute long address into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $7F              ; 80 7F | Branch always
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_087
; Address: $E99847
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_087:
    PHP                  ; 08 | Push processor status to stack
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    SED                  ; F8 | Set decimal mode flag
    SBC $1E02,X          ; FD 02 1E | Subtract with carry (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BMI $6F              ; 30 6F | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_088
; Address: $E998A5
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_088:
    JSR $227D            ; 20 7D 22 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    AND $58              ; 25 58 | Logical AND with accumulator (zero page)
    BIT $0B              ; 24 0B | Test bits in accumulator (zero page)
    BIT $07              ; 24 07 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    CPY $1618            ; CC 18 16 | Compare Y register (absolute)
    REP #$04             ; C2 04 | Reset processor status bits
    ROR $84              ; 66 84 | Rotate right (zero page)
    LDX $7A44            ; AE 44 7A | Load from absolute address into X register
    DEY                  ; 88 | Decrement Y register
    BIT $D0              ; 24 D0 | Test bits in accumulator (zero page)
    JMP ($E4E0)          ; 6C E0 E4 | Jump to address (absolute indirect)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    CPX $1C00            ; EC 00 1C | Compare X register (absolute)
    BCC $90              ; 90 90 | Branch if carry clear
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $3800,X          ; FE 00 38 | Increment (absolute,X)
    ORA ($36,X)          ; 01 36 | Logical OR with accumulator ((zero page,X))
    ORA ($76,X)          ; 01 76 | Logical OR with accumulator ((zero page,X))
    EOR ($F6,X)          ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
    CMP ($76,X)          ; C1 76 | Compare accumulator ((zero page,X))
    EOR ($F6,X)          ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
    CMP ($56,X)          ; C1 56 | Compare accumulator ((zero page,X))
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    CMP #$FF             ; C9 FF | Compare accumulator (immediate)
    LDA                  ; BF 00 3F 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 3F 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 37 00 | Load from absolute long,X into accumulator
    ORA $5F1F,Y          ; 19 1F 5F | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_089
; Address: $E99925
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_089:
    RTI                  ; 40 | Return from interrupt
    CPY #$79             ; C0 79 | Compare Y register (immediate)
    EOR ($F6,X)          ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
    CPY #$57             ; C0 57 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF C8 FF 00 | Load from absolute long,X into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA                  ; BF 00 3F 00 | Load from absolute long,X into accumulator
    LDX $3F00,Y          ; BE 00 3F | Load from absolute,Y into X register
    LDA                  ; BF 00 37 00 | Load from absolute long,X into accumulator
    BCS $FF              ; B0 FF | Branch if carry set
    PHY                  ; 5A | Push Y register to stack
    SBC $5E82,Y          ; F9 82 5E | Subtract with carry (absolute,Y)
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_08A
; Address: $E99958
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_08A:
    JSR $7D00            ; 20 00 7D | Jump to subroutine
    CMP $F700            ; CD 00 F7 | Compare accumulator (absolute)
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))
    BIT #$AE             ; 89 AE | Test bits in accumulator (immediate)
    ORA #$CE             ; 09 CE | Logical OR with accumulator (immediate)
    ORA $F112,Y          ; 19 12 F1 | Logical OR with accumulator (absolute,Y)
    BIT $B501            ; 2C 01 B5 | Test bits in accumulator (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    STA                  ; 9F 00 FA 05 | Store accumulator to absolute long,X
    CPX $D060            ; EC 60 D0 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    PLP                  ; 28 | Pull processor status from stack
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    BMI $0C              ; 30 0C | Branch if negative
    CPY $F602            ; CC 02 F6 | Compare Y register (absolute)
    STA ($B6,X)          ; 81 B6 | Store accumulator to (zero page,X)
    CMP ($76,X)          ; C1 76 | Compare accumulator ((zero page,X))
    EOR ($F6,X)          ; 41 F6 | Exclusive OR with accumulator ((zero page,X))
    CMP ($56,X)          ; C1 56 | Compare accumulator ((zero page,X))
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    CMP #$FC             ; C9 FC | Compare accumulator (immediate)
    INC $7F01,X          ; FE 01 7F | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_08B
; Address: $E999D8
; Size: 127 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_08B:
    LDA                  ; BF 00 3F 00 | Load from absolute long,X into accumulator
    LDA                  ; BF 00 37 00 | Load from absolute long,X into accumulator
    ADC $7289,Y          ; 79 89 72 | Add with carry (absolute,Y)
    SBC $9DF0            ; ED F0 9D | Subtract with carry (absolute)
    SEP #$70             ; E2 70 | Set processor status bits
    BRA $73              ; 80 73 | Branch always
    BEQ $D4              ; F0 D4 | Branch if equal
    XBA                  ; EB | Exchange accumulator bytes
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    SBC $FF00            ; ED 00 FF | Subtract with carry (absolute)
    CPX $FF00            ; EC 00 FF | Compare X register (absolute)
    STX $318E            ; 8E 8E 31 | Store X register to absolute address
    BMI $FE              ; 30 FE | Branch if negative
    ORA ($E9,X)          ; 01 E9 | Logical OR with accumulator ((zero page,X))
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    DEC $7101,X          ; DE 01 71 | Decrement (absolute,X)
    STA $30718E          ; 8F 8E 71 30 | Store accumulator to absolute long address
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF B2 4D 00 | Load from absolute long,X into accumulator
    ROR $7EE7,X          ; 7E E7 7E | Rotate right (absolute,X)
    SBC $BDCD,X          ; FD CD BD | Subtract with carry (absolute,X)
    LDA ($08,X)          ; A1 08 | Load from (zero page,X) into accumulator
    STA ($52,X)          ; 81 52 | Store accumulator to (zero page,X)
    PLY                  ; 7A | Pull Y register from stack
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDA $DF00,X          ; BD 00 DF | Load from absolute,X into accumulator
    ROR $FF00,X          ; 7E 00 FF | Rotate right (absolute,X)
    ROL $FD44            ; 2E 44 FD | Rotate left (absolute)
    DEC                  ; 3A | Decrement accumulator
    SBC $9DFD,X          ; FD FD 9D | Subtract with carry (absolute,X)
    STA $DB5A,X          ; 9D 5A DB | Store accumulator to absolute,X
    ORA $00DA,Y          ; 19 DA 00 | Logical OR with accumulator (absolute,Y)
    SBC $BB00,X          ; FD 00 BB | Subtract with carry (absolute,X)
    LDA $BD00,X          ; BD 00 BD | Load from absolute,X into accumulator
    LDA #$6A             ; A9 6A | Load immediate value into accumulator
    STA $BD5A,Y          ; 99 5A BD | Store accumulator to absolute,Y
    LDA $C3              ; A5 C3 | Load from zero page into accumulator
    INC $657F,X          ; FE 7F 65 | Increment (absolute,X)
    ROR $C33C,X          ; 7E 3C C3 | Rotate right (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    STA ($E7,X)          ; 81 E7 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    LDA $0100,X          ; BD 00 01 | Load from absolute,X into accumulator
    BRA $BF              ; 80 BF | Branch always
    RTI                  ; 40 | Return from interrupt
    LDA $7E42,X          ; BD 42 7E | Load from absolute,X into accumulator
    JMP $BD42FF          ; 5C FF 42 BD | Jump to address long
    LDA $FFFF,X          ; BD FF FF | Load from absolute,X into accumulator
    LDA $8181,X          ; BD 81 81 | Load from absolute,X into accumulator
    STA $85              ; 85 85 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank52_DmaFunction_08C
; Address: $E99A92
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_08C:
    JMP $BD42A3          ; 5C A3 42 BD | Jump to address long
    LDA $8100,X          ; BD 00 81 | Load from absolute,X into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $37              ; 30 37 | Branch if negative
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    ORA $17              ; 05 17 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ROL $09              ; 26 09 | Rotate left (zero page)
    EOR $5D12            ; 4D 12 5D | Exclusive OR with accumulator (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    LDY #$6E             ; A0 6E | Load immediate value into Y register
    CMP ($5F),Y          ; D1 5F | Compare accumulator ((zero page),Y)
    CPX #$5E             ; E0 5E | Compare X register (immediate)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA                  ; BF 40 A0 5F | Load from absolute long,X into accumulator
    INC $EF11            ; EE 11 EF | Increment (absolute)
    BPL $7F              ; 10 7F | Branch if positive
    DEX                  ; CA | Decrement X register
    EOR $ADF8            ; 4D F8 AD | Exclusive OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    INC $0A51            ; EE 51 0A | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    DEC $9F61,X          ; DE 61 9F | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_08D
; Address: $E99AED
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_08D:
    JSR $B11E            ; 20 1E B1 | Jump to subroutine
    STA                  ; 9F 20 BF 00 | Store accumulator to absolute long,X
    CPY #$35             ; C0 35 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    LDA                  ; BF 40 2F 90 | Load from absolute long,X into accumulator
    ROL $BFD1            ; 2E D1 BF | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_08F
; Address: $E99B03
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_08F:
    JSL $000202          ; 22 02 02 00 | Jump to subroutine long
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    SBC $FDE3,X          ; FD E3 FD | Subtract with carry (absolute,X)
    ASL $DF1C,X          ; 1E 1C DF | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_090
; Address: $E99B11
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_090:
    JSR $DD22            ; 20 22 DD | Jump to subroutine
    SBC $00FF,X          ; FD FF 00 | Subtract with carry (absolute,X)
    ASL $E3E1,X          ; 1E E1 E3 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $85              ; 85 85 | Store accumulator to zero page
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    DEC $FFD1,X          ; DE D1 FF | Decrement (absolute,X)
    PEA #$1F1F           ; F4 1F 1F | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_091
; Address: $E99B35
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_091:
    PLY                  ; 7A | Pull Y register from stack
    ASL $F1F1            ; 0E F1 F1 | Arithmetic shift left (absolute)
    ASL $0BF4            ; 0E F4 0B | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_093
; Address: $E99B4F
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_093:
    JSL $CF8F70          ; 22 70 8F CF | Jump to subroutine long
    BMI $00              ; 30 00 | Branch if negative
    AND $00FF,Y          ; 39 FF 00 | Logical AND with accumulator (absolute,Y)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    BPL $20              ; 10 20 | Branch if positive
    CMP $00FF,X          ; DD FF 00 | Compare accumulator (absolute,X)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ASL $1A63,X          ; 1E 63 1A | Arithmetic shift left (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    ADC $0078,Y          ; 79 78 00 | Add with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $9E61,X          ; 9E 61 9E | Store zero to absolute,X
    ADC ($BE,X)          ; 61 BE | Add with carry ((zero page,X))
    EOR ($7E,X)          ; 41 7E | Exclusive OR with accumulator ((zero page,X))
    STA ($FC,X)          ; 81 FC | Store accumulator to (zero page,X)
    CPX #$64             ; E0 64 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_094
; Address: $E99B88
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_094:
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    STZ $04F8            ; 9C F8 04 | Store zero to absolute
    SEC                  ; 38 | Set carry flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ADC $5E              ; 65 5E | Add with carry (zero page)
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    PHB                  ; 8B | Push data bank register to stack
    LDA ($9F),Y          ; B1 9F | Load from (zero page),Y into accumulator
    BMI $1F              ; 30 1F | Branch if negative
    LDY #$10             ; A0 10 | Load immediate value into Y register
    LDA                  ; BF 6F 90 EF | Load from absolute long,X into accumulator
    BPL $EE              ; 10 EE | Branch if positive
    ORA ($76),Y          ; 11 76 | Logical OR with accumulator ((zero page),Y)
    BIT #$FB             ; 89 FB | Test bits in accumulator (immediate)
    ROR $EE81,X          ; 7E 81 EE | Rotate right (absolute,X)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ADC $1E              ; 65 1E | Add with carry (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    LDA ($9F),Y          ; B1 9F | Load from (zero page),Y into accumulator
    BMI $1F              ; 30 1F | Branch if negative
    LDY #$10             ; A0 10 | Load immediate value into Y register
    LDA                  ; BF 2F 90 AF | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_095
; Address: $E99BD3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_095:
    BVC $AE              ; 50 AE | Branch if overflow clear
    EOR ($36),Y          ; 51 36 | Exclusive OR with accumulator ((zero page),Y)
    BIT #$BB             ; 89 BB | Test bits in accumulator (immediate)
    ROL $EEC1,X          ; 3E C1 EE | Rotate left (absolute,X)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    BRA $FC              ; 80 FC | Branch always
    CPX $E917            ; EC 17 E9 | Compare X register (absolute)
    BIT $5F              ; 24 5F | Test bits in accumulator (zero page)
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    ORA $17              ; 05 17 | Logical OR with accumulator (zero page)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    SBC $A702,X          ; FD 02 A7 | Subtract with carry (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    STA $1C1E,X          ; 9D 1E 1C | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank52_DmaFunction_096
; Address: $E99C02
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_096:
    JSL $021E22          ; 22 22 1E 02 | Jump to subroutine long
    STA $338E            ; 8D 8E 33 | Store accumulator to absolute address
    JMP $449BA3          ; 5C A3 9B 44 | Jump to address long
    EOR $A05F            ; 4D 5F A0 | Exclusive OR with accumulator (absolute)
    INC $0701,X          ; FE 01 07 | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    PLX                  ; FA | Pull X register from stack
    ORA $54              ; 05 54 | Logical OR with accumulator (zero page)
    REP #$C2             ; C2 C2 | Reset processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $9EF5,X          ; FD F5 9E | Subtract with carry (absolute,X)
    PEA #$EFF4           ; F4 F4 EF | Push effective address to stack
    BPL $CF              ; 10 CF | Branch if positive
    BMI $E8              ; 30 E8 | Branch if negative
    INC $F611            ; EE 11 F6 | Increment (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BCS $B0              ; B0 B0 | Branch if carry set
    BMI $30              ; 30 30 | Branch if negative
    INC $20EE            ; EE EE 20 | Increment (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_097
; Address: $E99C47
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_097:
    JSR $C4C7            ; 20 C7 C4 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_099
; Address: $E99C4E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_099:
    BRA $80              ; 80 80 | Branch always
    BEQ $01              ; F0 01 | Branch if equal
    BPL $3C              ; 10 3C | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_09A
; Address: $E99C5E
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_09A:
    BRA $00              ; 80 00 | Branch always
    ASL $E0E1            ; 0E E1 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $8062,X          ; 7E 62 80 | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BEQ $01              ; F0 01 | Branch if equal
    INC $E201,X          ; FE 01 E2 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ROL $A5BF,X          ; 3E BF A5 | Rotate left (absolute,X)
    LDA $00              ; A5 00 | Load from zero page into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $F8              ; 50 F8 | Branch if overflow clear
    SBC $E0              ; E5 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    BRA $7F              ; 80 7F | Branch always
    BRA $67              ; 80 67 | Branch always
    TYA                  ; 98 | Transfer Y register to accumulator
    PLA                  ; 68 | Pull accumulator from stack
    BCC $F0              ; 90 F0 | Branch if carry clear
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $7F              ; 80 7F | Branch always
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ASL $CBFF            ; 0E FF CB | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_09B
; Address: $E99CC9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_09B:
    ADC ($10,X)          ; 61 10 | Add with carry ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY $A7              ; A4 A7 | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    ORA $CBF0            ; 0D F0 CB | Logical OR with accumulator (absolute)
    STY $40A8            ; 8C A8 40 | Store Y register to absolute address
    BPL $EC              ; 10 EC | Branch if positive
    BPL $39              ; 10 39 | Branch if positive
    AND $EDCD,Y          ; 39 CD ED | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA #$C9             ; A9 C9 | Load immediate value into accumulator
    BVS $10              ; 70 10 | Branch if overflow set
    STZ $A4              ; 64 A4 | Store zero to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_09C
; Address: $E99CED
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_09C:
    PLB                  ; AB | Pull data bank register from stack
    SBC $CD02,X          ; FD 02 CD | Subtract with carry (absolute,X)
    LDA $26D910          ; AF 10 D9 26 | Load from absolute long address into accumulator
    SBC $403F            ; ED 3F 40 | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    SBC $BF02,X          ; FD 02 BF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_09D
; Address: $E99D01
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_09D:
    TSX                  ; BA | Transfer stack pointer to X register
    SBC $CBF3,X          ; FD F3 CB | Subtract with carry (absolute,X)
    SBC $EF              ; E5 EF | Subtract with carry (zero page)
    PLX                  ; FA | Pull X register from stack
    ORA $FB              ; 05 FB | Logical OR with accumulator (zero page)
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_09E
; Address: $E99D19
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_09E:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY $F3              ; A4 F3 | Load from zero page into Y register
    CPY $32FF            ; CC FF 32 | Compare Y register (absolute)
    INC $DF              ; E6 DF | Increment (zero page)
    LDA                  ; BF DB BF D4 | Load from absolute long,X into accumulator
    SBC $CC8A,X          ; FD 8A CC | Subtract with carry (absolute,X)
    CMP $09F6            ; CD F6 09 | Compare accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    BIT $D4              ; 24 D4 | Test bits in accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    ROR $CE90,X          ; 7E 90 CE | Rotate right (absolute,X)
    BIT #$81             ; 89 81 | Test bits in accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    BVS $FC              ; 70 FC | Branch if overflow set
    PLX                  ; FA | Pull X register from stack
    PLY                  ; 7A | Pull Y register from stack
    ROL $FACE,X          ; 3E CE FA | Rotate left (absolute,X)
    ORA $91              ; 05 91 | Logical OR with accumulator (zero page)
    ROR $C33C            ; 6E 3C C3 | Rotate right (absolute)
    BEQ $0E              ; F0 0E | Branch if equal
    BIT #$17             ; 89 17 | Test bits in accumulator (immediate)
    INX                  ; E8 | Increment X register
    ROR $CF81,X          ; 7E 81 CF | Rotate right (absolute,X)
    BMI $29              ; 30 29 | Branch if negative
    AND #$12             ; 29 12 | Logical AND with accumulator (immediate)
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $37              ; 84 37 | Store Y register to zero page
    CPY #$AE             ; C0 AE | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    JMP ($D890)          ; 6C 90 D8 | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PHA                  ; 48 | Push accumulator to stack
    LDY $58              ; A4 58 | Load from zero page into Y register
    CPY #$DF             ; C0 DF | Compare Y register (immediate)
    BPL $3B              ; 10 3B | Branch if positive
    ADC $F758,Y          ; 79 58 F7 | Add with carry (absolute,Y)
    AND ($3D),Y          ; 31 3D | Logical AND with accumulator ((zero page),Y)
    BMI $C8              ; 30 C8 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_09F
; Address: $E99D90
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_09F:
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    STZ $00F5            ; 9C F5 00 | Store zero to absolute
    BPL $A7              ; 10 A7 | Branch if positive
    INC $F301,X          ; FE 01 F3 | Increment (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    INY                  ; C8 | Increment Y register
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0A2
; Address: $E99DBC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0A2:
    JSR $3BDF            ; 20 DF 3B | Jump to subroutine
    CPY $20              ; C4 20 | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    DEY                  ; 88 | Decrement Y register
    PHA                  ; 48 | Push accumulator to stack
    PLX                  ; FA | Pull X register from stack
    INC $F9              ; E6 F9 | Increment (zero page)
    PEA #$6008           ; F4 08 60 | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0A3
; Address: $E99DD0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0A3:
    CMP $20              ; C5 20 | Compare accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0A4
; Address: $E99DDE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0A4:
    JSR $A09F            ; 20 9F A0 | Jump to subroutine
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    SBC $A127,X          ; FD 27 A1 | Subtract with carry (absolute,X)
    LDX $31              ; A6 31 | Load from zero page into X register
    AND ($DF),Y          ; 31 DF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0A5
; Address: $E99DF1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0A5:
    JSR $1CE3            ; 20 E3 1C | Jump to subroutine
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    LSR $2501,X          ; 5E 01 25 | Logical shift right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LDX $A841,Y          ; BE 41 A8 | Load from absolute,Y into X register
    LSR $DF              ; 46 DF | Logical shift right (zero page)
    DEY                  ; 88 | Decrement Y register
    CLV                  ; B8 | Clear overflow flag
    BIT $F3              ; 24 F3 | Test bits in accumulator (zero page)
    EOR $1FF0            ; 4D F0 1F | Exclusive OR with accumulator (absolute)
    ROR $46              ; 66 46 | Rotate right (zero page)
    BRA $BF              ; 80 BF | Branch always
    BIT $4DD3            ; 2C D3 4D | Test bits in accumulator (absolute)
    ASL $FFE0,X          ; 1E E0 FF | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0A7
; Address: $E99E27
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0A7:
    CPX $E9FE            ; EC FE E9 | Compare X register (absolute)
    ROL $DB              ; 26 DB | Rotate left (zero page)
    LDX $BD19,Y          ; BE 19 BD | Load from absolute,Y into X register
    STA $807F,X          ; 9D 7F 80 | Store accumulator to absolute,X
    INX                  ; E8 | Increment X register
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    BIT $5F              ; 24 5F | Test bits in accumulator (zero page)
    LDY #$DF             ; A0 DF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0A8
; Address: $E99E3F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0A8:
    JSR $C53D            ; 20 3D C5 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    LSR $7BF7,X          ; 5E F7 7B | Logical shift right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    BRA $7B              ; 80 7B | Branch always
    STY $FF              ; 84 FF | Store Y register to zero page
    AND $FF              ; 25 FF | Logical AND with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    STY $8C98            ; 8C 98 8C | Store Y register to absolute address
    BCC $84              ; 90 84 | Branch if carry clear
    BRA $04              ; 80 04 | Branch always
    LDY $F4A4,X          ; BC A4 F4 | Load from absolute,X into Y register
    BEQ $F4              ; F0 F4 | Branch if equal
    BEQ $AC              ; F0 AC | Branch if equal
    BVC $AC              ; 50 AC | Branch if overflow clear
    BVC $EC              ; 50 EC | Branch if overflow clear
    BPL $E8              ; 10 E8 | Branch if positive
    PEA #$0408           ; F4 08 04 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STY $84              ; 84 84 | Store Y register to zero page
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $80              ; 80 80 | Branch always
    SBC $03EE            ; ED EE 03 | Subtract with carry (absolute)
    SBC $7B6B,Y          ; F9 6B 7B | Subtract with carry (absolute,Y)
    BPL $BF              ; 10 BF | Branch if positive
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0A9
; Address: $E99E93
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0A9:
    JSR $40BF            ; 20 BF 40 | Jump to subroutine
    INC $6901,X          ; FE 01 69 | Increment (absolute,X)
    SBC $EF02,X          ; FD 02 EF | Subtract with carry (absolute,X)
    STA ($90,X)          ; 81 90 | Store accumulator to (zero page,X)
    STA $818D            ; 8D 8D 81 | Store accumulator to absolute address
    SBC $E5              ; E5 E5 | Subtract with carry (zero page)
    ROL $2F2E            ; 2E 2E 2F | Rotate left (absolute)
    SBC $45              ; E5 45 | Subtract with carry (zero page)
    LDY $4B              ; A4 4B | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0AB
; Address: $E99EB7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0AB:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $10              ; 10 10 | Branch if positive
    TSX                  ; BA | Transfer stack pointer to X register
    TSX                  ; BA | Transfer stack pointer to X register
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    BPL $1C              ; 10 1C | Branch if positive
    JMP $F9F6A3          ; 5C A3 F6 F9 | Jump to address long
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0AC
; Address: $E99EF7
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0AC:
    BPL $AF              ; 10 AF | Branch if positive
    BVC $F9              ; 50 F9 | Branch if overflow clear
    ASL $F7              ; 06 F7 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    SBC $7802,X          ; FD 02 78 | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    STA $00FF,Y          ; 99 FF 00 | Store accumulator to absolute,Y
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $FF              ; 10 FF | Branch if positive
    STA $85              ; 85 85 | Store accumulator to zero page
    CPY $C5              ; C4 C5 | Compare Y register (zero page)
    CPX $CFEE            ; EC EE CF | Compare X register (absolute)
    BMI $11              ; 30 11 | Branch if negative
    CPX $EEEF            ; EC EF EE | Compare X register (absolute)
    CPX $EF              ; E4 EF | Compare X register (zero page)
    PHA                  ; 48 | Push accumulator to stack
    PLP                  ; 28 | Pull processor status from stack
    SBC $3B10            ; ED 10 3B | Subtract with carry (absolute)
    CPY $DA              ; C4 DA | Compare Y register (zero page)
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY $00              ; A4 00 | Load from zero page into Y register
    INC $B34E,X          ; FE 4E B3 | Increment (absolute,X)
    BVS $70              ; 70 70 | Branch if overflow set
    BMI $30              ; 30 30 | Branch if negative
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    BCS $C0              ; B0 C0 | Branch if carry set
    ROL $B681,X          ; 3E 81 B6 | Rotate left (absolute,X)
    EOR #$F6             ; 49 F6 | Exclusive OR with accumulator (immediate)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$40             ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0AD
; Address: $E99F65
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0AD:
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CPY $67              ; C4 67 | Compare Y register (zero page)
    STZ $1F              ; 64 1F | Store zero to zero page
    LDY $AB              ; A4 AB | Load from zero page into Y register
    JMP $20DF            ; 4C DF 20 | Jump to address
    BEQ $C7              ; F0 C7 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BRA $AF              ; 80 AF | Branch always
    RTI                  ; 40 | Return from interrupt
    XBA                  ; EB | Exchange accumulator bytes
    LDA #$49             ; A9 49 | Load immediate value into accumulator
    SBC $E80D            ; ED 0D E8 | Subtract with carry (absolute)
    PHP                  ; 08 | Push processor status to stack
    SBC ($11),Y          ; F1 11 | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX $F30C            ; EC 0C F3 | Compare X register (absolute)
    CMP $CD              ; C5 CD | Compare accumulator (zero page)
    CMP $DF32            ; CD 32 DF | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0AE
; Address: $E99FB5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0AE:
    JSR $2EC1            ; 20 C1 2E | Jump to subroutine
    PHX                  ; DA | Push X register to stack
    AND $DF              ; 25 DF | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0AF
; Address: $E99FBB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0AF:
    JSR $20DF            ; 20 DF 20 | Jump to subroutine
    CMP $8022,X          ; DD 22 80 | Compare accumulator (absolute,X)
    BRA $3E              ; 80 3E | Branch always
    ROL $BFFF,X          ; 3E FF BF | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    LDA                  ; BF 80 BF 80 | Load from absolute long,X into accumulator
    ADC $807F,X          ; 7D 7F 80 | Add with carry (absolute,X)
    LDA                  ; BF 40 47 B8 | Load from absolute long,X into accumulator
    CPX $2F              ; E4 2F | Compare X register (zero page)
    BNE $DF              ; D0 DF | Branch if not equal

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B0
; Address: $E99FDD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B0:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    ASL $F4              ; 06 F4 | Arithmetic shift left (zero page)
    CPX #$04             ; E0 04 | Compare X register (immediate)
    CPX #$18             ; E0 18 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B1
; Address: $E99FEC
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B1:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    JMP ($00FF)          ; 6C FF 00 | Jump to address (absolute indirect)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    BEQ $0C              ; F0 0C | Branch if equal
    CLC                  ; 18 | Clear carry flag
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B3
; Address: $E9A020
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B3:
    JSR $FB17            ; 20 17 FB | Jump to subroutine
    STA $08              ; 85 08 | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF FF EF F7 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B4
; Address: $E9A031
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B4:
    JSR $7A85            ; 20 85 7A | Jump to subroutine
    PHB                  ; 8B | Push data bank register to stack
    BNE $08              ; D0 08 | Branch if not equal
    LDA                  ; BF 00 E7 08 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B5
; Address: $E9A03E
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B5:
    JSR $F89F            ; 20 9F F8 | Jump to subroutine
    BVC $1F              ; 50 1F | Branch if overflow clear
    INC $FBF5,X          ; FE F5 FB | Increment (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA $79              ; 85 79 | Store accumulator to zero page
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $03E2,Y          ; 19 E2 03 | Logical OR with accumulator (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    INC $F901,X          ; FE 01 F9 | Increment (absolute,X)
    INC $7801,X          ; FE 01 78 | Increment (absolute,X)
    STX $05              ; 86 05 | Store X register to zero page
    INC                  ; 1A | Increment accumulator
    ASL $0A14            ; 0E 14 0A | Arithmetic shift left (absolute)
    BPL $0A              ; 10 0A | Branch if positive
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ORA $14              ; 05 14 | Logical OR with accumulator (zero page)
    BPL $0F              ; 10 0F | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0A11            ; 0E 11 0A | Arithmetic shift left (absolute)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B6
; Address: $E9A086
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B6:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    BPL $21              ; 10 21 | PPU graphics register access
    INC $F309,X          ; FE 09 F3 | Increment (absolute,X)
    DEC $CF30            ; CE 30 CF | Decrement (absolute)
    CPY $C03F            ; CC 3F C0 | Compare Y register (absolute)
    CLV                  ; B8 | Clear overflow flag
    SBC $10              ; E5 10 | Subtract with carry (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    REP #$31             ; C2 31 | Reset processor status bits
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B7
; Address: $E9A0CC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B7:
    JSR $39DF            ; 20 DF 39 | Jump to subroutine
    DEC $FA              ; C6 FA | Decrement (zero page)
    ORA $CB              ; 05 CB | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    SEI                  ; 78 | Set interrupt disable flag
    BRA $D8              ; 80 D8 | Branch always
    LDY #$88             ; A0 88 | Load immediate value into Y register
    BEQ $E8              ; F0 E8 | Branch if equal
    BCS $B8              ; B0 B8 | Branch if carry set
    CPY #$A8             ; C0 A8 | Compare Y register (immediate)
    BNE $A8              ; D0 A8 | Branch if not equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    BMI $D8              ; 30 D8 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0B9
; Address: $E9A110
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0B9:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0A10            ; 0E 10 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0A10            ; 0E 10 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SED                  ; F8 | Set decimal mode flag
    LDY #$E8             ; A0 E8 | Load immediate value into Y register
    BCS $F8              ; B0 F8 | Branch if carry set
    LDY #$B8             ; A0 B8 | Load immediate value into Y register
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    CPX #$B8             ; E0 B8 | Compare X register (immediate)
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BCS $B8              ; B0 B8 | Branch if carry set
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BVC $B8              ; 50 B8 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $E8              ; 50 E8 | Branch if overflow clear
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $B8              ; 10 B8 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    BPL $F8              ; 10 F8 | Branch if positive
    CPX $1A              ; E4 1A | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    SEP #$12             ; E2 12 | Set processor status bits
    SEP #$FA             ; E2 FA | Set processor status bits
    NOP                  ; EA | No operation
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    PLX                  ; FA | Pull X register from stack
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    ORA $04FB            ; 0D FB 04 | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    SBC $EE              ; E5 EE | Subtract with carry (zero page)
    ORA ($EA),Y          ; 11 EA | Logical OR with accumulator ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    BRA $DF              ; 80 DF | Branch always
    LDY #$88             ; A0 88 | Load immediate value into Y register
    INX                  ; E8 | Increment X register
    LDA                  ; BF C0 AF D7 | Load from absolute long,X into accumulator
    LDA $F7AFF7          ; AF F7 AF F7 | Load from absolute long address into accumulator
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0BA
; Address: $E9A17B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0BA:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    EOR $FB              ; 45 FB | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0BB
; Address: $E9A185
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0BB:
    ASL $CB34            ; 0E 34 CB | Arithmetic shift left (absolute)
    BIT $10FF            ; 2C FF 10 | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    ASL $FFF1            ; 0E F1 FF | Arithmetic shift left (absolute)
    BIT $10D3            ; 2C D3 10 | Test bits in accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY $3233            ; CC 33 32 | Compare Y register (absolute)
    CMP $19F6            ; CD F6 19 | Compare accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BIT $D4              ; 24 D4 | Test bits in accumulator (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CPY #$CD             ; C0 CD | Compare Y register (immediate)
    ORA $EBE6,Y          ; 19 E6 EB | Logical OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    STZ $9B              ; 64 9B | Store zero to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0BC
; Address: $E9A1BF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0BC:
    DEY                  ; 88 | Decrement Y register
    BRA $FF              ; 80 FF | Branch always
    BIT $4DD3            ; 2C D3 4D | Test bits in accumulator (absolute)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDA $DF20,Y          ; B9 20 DF | Load from absolute,Y into accumulator
    BEQ $DF              ; F0 DF | Branch if equal

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0BD
; Address: $E9A1D7
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0BD:
    JSR $41BE            ; 20 BE 41 | Jump to subroutine
    INC $FC11            ; EE 11 FC | Increment (absolute)
    LDA $A846,Y          ; B9 46 A8 | Load from absolute,Y into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    BIT $7F              ; 24 7F | Test bits in accumulator (zero page)
    BRA $CD              ; 80 CD | Branch always
    STA $00              ; 85 00 | Store accumulator to zero page
    BRA $00              ; 80 00 | Branch always
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    ORA $728D            ; 0D 8D 72 | Logical OR with accumulator (absolute)
    ORA $DAF2            ; 0D F2 DA | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $2F0D,X          ; 1D 0D 2F | Logical OR with accumulator (absolute,X)
    BNE $0F              ; D0 0F | Branch if not equal
    BEQ $FE              ; F0 FE | Branch if equal
    BPL $A3              ; 10 A3 | Branch if positive
    ASL $6680,X          ; 1E 80 66 | Arithmetic shift left (absolute,X)
    STA $CB              ; 85 CB | Store accumulator to zero page
    LDA ($21,X)          ; A1 21 | PPU graphics register access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0BF
; Address: $E9A23A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0BF:
    PEA #$DE00           ; F4 00 DE | Push effective address to stack
    STA                  ; 9F 00 80 80 | Store accumulator to absolute long,X
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LSR $47              ; 46 47 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0C0
; Address: $E9A248
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0C0:
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    ROL $193E            ; 2E 3E 19 | Rotate left (absolute)
    INC $77              ; E6 77 | Increment (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $10              ; 80 10 | Branch always
    INX                  ; E8 | Increment X register
    STZ $90              ; 64 90 | Store zero to zero page
    DEC                  ; 3A | Decrement accumulator
    CMP ($41,X)          ; C1 41 | Compare accumulator ((zero page,X))
    BRA $47              ; 80 47 | Branch always
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0C2
; Address: $E9A266
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0C2:
    LDY $80EC            ; AC EC 80 | Load from absolute address into Y register
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$4C             ; E0 4C | Compare X register (immediate)
    JMP $4949            ; 4C 49 49 | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $19              ; E6 19 | Increment (zero page)
    STZ $1321,X          ; 9E 21 13 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0C3
; Address: $E9A277
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0C3:
    JSR $2D12            ; 20 12 2D | Jump to subroutine
    BMI $12              ; 30 12 | Branch if negative
    LDA ($92,X)          ; A1 92 | Load from (zero page,X) into accumulator
    AND $D6              ; 25 D6 | Logical AND with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    EOR ($A9,X)          ; 41 A9 | Exclusive OR with accumulator ((zero page,X))
    AND #$CE             ; 29 CE | Logical AND with accumulator (immediate)
    ASL $8041            ; 0E 41 80 | Arithmetic shift left (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    RTI                  ; 40 | Return from interrupt
    STA $00E933          ; 8F 33 E9 00 | Store accumulator to absolute long address
    LDA                  ; BF 00 BE 00 | Load from absolute long,X into accumulator
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA $4060,X          ; 9D 60 40 | Store accumulator to absolute,X
    BRA $3C              ; 80 3C | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    STY $A4              ; 84 A4 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    STZ $88              ; 64 88 | Store zero to zero page
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    JMP $444C            ; 4C 4C 44 | Jump to address
    CPX #$E0             ; E0 E0 | Game work RAM access
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0C5
; Address: $E9A2D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0C5:
    JSR $2192            ; 20 92 21 | PPU graphics register access
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1331            ; 0E 31 13 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0C6
; Address: $E9A2DD
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0C6:
    JSR $2912            ; 20 12 29 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    LDX $B9              ; A6 B9 | Load from zero page into X register
    INC $DFF1            ; EE F1 DF | Increment (absolute)
    CPX #$D9             ; E0 D9 | Compare X register (immediate)
    INC $94              ; E6 94 | Increment (zero page)
    LDY $A8DF            ; AC DF A8 | Load from absolute address into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    JMP ($367F)          ; 6C 7F 36 | Jump to address (absolute indirect)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    BRA $3E              ; 80 3E | Branch always
    CPY #$1B             ; C0 1B | Compare Y register (immediate)
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $83FE,X          ; FE FE 83 | Increment (absolute,X)
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    STZ $FFFF,X          ; 9E FF FF | Store zero to absolute,X
    ASL $EC21,X          ; 1E 21 EC | Arithmetic shift left (absolute,X)
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    EOR $FB04            ; 4D 04 FB | Exclusive OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    ADC ($6F,X)          ; 61 6F | Add with carry ((zero page,X))
    BVS $7F              ; 70 7F | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    BCC $00              ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0C7
; Address: $E9A374
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0C7:
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    BIT $7CFC            ; 2C FC 7C | Test bits in accumulator (absolute)
    ROL $1EFE,X          ; 3E FE 1E | Rotate left (absolute,X)
    INC $0304,X          ; FE 04 03 | Increment (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ADC $9A              ; 65 9A | Add with carry (zero page)
    LDY $6300,X          ; BC 00 63 | Load from absolute,X into Y register
    STZ $8877            ; 9C 77 88 | Store zero to absolute
    BRA $D3              ; 80 D3 | Branch always
    BIT $FE01            ; 2C 01 FE | Test bits in accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $3C              ; 30 3C | Branch if negative
    BEQ $0E              ; F0 0E | Branch if equal
    PLY                  ; 7A | Pull Y register from stack
    STY $B4              ; 84 B4 | Store Y register to zero page
    LSR                  ; 4A | Logical shift right (accumulator)
    SEI                  ; 78 | Set interrupt disable flag
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    SBC $05              ; E5 05 | Subtract with carry (zero page)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROL $073E,X          ; 3E 3E 07 | Rotate left (absolute,X)
    STZ $4000,X          ; 9E 00 40 | Store zero to absolute,X
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BPL $00              ; 10 00 | Branch if positive
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0C9
; Address: $E9A407
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0C9:
    JSL $6C3333          ; 22 33 33 6C | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0CA
; Address: $E9A42C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0CA:
    JSL $230323          ; 22 23 03 23 | Jump to subroutine long
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    BRA $C0              ; 80 C0 | Branch always
    WDM #$42             ; 42 42 | Hardware register operation
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BIT $D3              ; 24 D3 | Test bits in accumulator (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0CB
; Address: $E9A475
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0CB:
    STA                  ; 9F 20 DF 0C | Store accumulator to absolute long,X
    INC                  ; 1A | Increment accumulator
    SBC $C2              ; E5 C2 | Subtract with carry (zero page)
    AND $9F60,X          ; 3D 60 9F | Logical AND with accumulator (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ROL $D9              ; 26 D9 | Rotate left (zero page)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BPL $10              ; 10 10 | Branch if positive
    PHY                  ; 5A | Push Y register to stack
    PHY                  ; 5A | Push Y register to stack
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $ECBD,X          ; BD BD EC | Load from absolute,X into accumulator
    CPX $C8C8            ; EC C8 C8 | Compare X register (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BIT $0800            ; 2C 00 08 | Test bits in accumulator (absolute)
    WDM #$00             ; 42 00 | Reserved instruction
    ORA ($76),Y          ; 11 76 | Logical OR with accumulator ((zero page),Y)
    BCC $FF              ; 90 FF | Branch if carry clear
    STA $C837F8          ; 8F F8 37 C8 | Store accumulator to absolute long address
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    DEX                  ; CA | Decrement X register
    BRA $00              ; 80 00 | Branch always
    BCS $CF              ; B0 CF | Branch if carry set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0CC
; Address: $E9A524
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0CC:
    EOR #$B9             ; 49 B9 | Exclusive OR with accumulator (immediate)
    SBC #$06             ; E9 06 | Subtract with carry (immediate)
    STA $E466,Y          ; 99 66 E4 | Store accumulator to absolute,Y
    CPX $64              ; E4 64 | Compare X register (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $EF              ; 10 EF | Branch if positive
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    DEC $ED31            ; CE 31 ED | Decrement (absolute)
    ORA $7EE6,Y          ; 19 E6 7E | Logical OR with accumulator (absolute,Y)
    ROR $4C4C,X          ; 7E 4C 4C | Rotate right (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0CD
; Address: $E9A561
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0CD:
    JSR $807F            ; 20 7F 80 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BPL $09              ; 10 09 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CMP $B8DD,X          ; DD DD B8 | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STA $F766,Y          ; 99 66 F7 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0CE
; Address: $E9A594
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0CE:
    JSR $0686            ; 20 86 06 | Jump to subroutine
    STA $B00E,Y          ; 99 0E B0 | Store accumulator to absolute,Y
    ASL $89              ; 06 89 | Arithmetic shift left (zero page)
    BCS $1E              ; B0 1E | Branch if carry set
    LDA ($44,X)          ; A1 44 | Load from (zero page,X) into accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0CF
; Address: $E9A5A5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0CF:
    ADC ($AC,X)          ; 61 AC | Add with carry ((zero page,X))
    SBC $C181            ; ED 81 C1 | Subtract with carry (absolute)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    EOR $494D            ; 4D 4D 49 | Exclusive OR with accumulator (absolute)
    EOR #$99             ; 49 99 | Exclusive OR with accumulator (immediate)
    ROR $E7              ; 66 E7 | Rotate right (zero page)
    CLC                  ; 18 | Clear carry flag
    STZ $1220,X          ; 9E 20 12 | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D0
; Address: $E9A5B7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D0:
    JSR $2C12            ; 20 12 2C | Jump to subroutine
    ASL $1230            ; 0E 30 12 | Arithmetic shift left (absolute)
    LDY #$92             ; A0 92 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D1
; Address: $E9A5BF
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D1:
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC $C7              ; C6 C7 | Decrement (zero page)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    STY $84              ; 84 84 | Store Y register to zero page
    INC $99FE            ; EE FE 99 | Increment (absolute)
    ROR $F7              ; 66 F7 | Rotate right (zero page)
    BPL $68              ; 10 68 | Branch if positive
    STZ $90              ; 64 90 | Store zero to zero page
    BRA $7A              ; 80 7A | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $100E            ; 0E 0E 10 | Arithmetic shift left (absolute)
    BPL $61              ; 10 61 | Branch if positive
    ADC ($E2,X)          ; 61 E2 | Add with carry ((zero page,X))
    SEP #$E7             ; E2 E7 | Set processor status bits
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    STA ($6E),Y          ; 91 6E | Store accumulator to (zero page),Y
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    STX $1830            ; 8E 30 18 | Store X register to absolute address
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    BPL $18              ; 10 18 | Branch if positive
    PLY                  ; 7A | Pull Y register from stack
    STY $98              ; 84 98 | Store Y register to zero page
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D2
; Address: $E9A604
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D2:
    JSR $B3FF            ; 20 FF B3 | Jump to subroutine
    CPY $F887            ; CC 87 F8 | Compare Y register (absolute)
    CLV                  ; B8 | Clear overflow flag
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    PLA                  ; 68 | Pull accumulator from stack
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    ASL $0EC9            ; 0E C9 0E | Arithmetic shift left (absolute)
    CMP #$CA             ; C9 CA | Compare accumulator (immediate)
    CMP $CFCB            ; CD CB CF | Compare accumulator (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BPL $20              ; 10 20 | Branch if positive
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    ADC ($61,X)          ; 61 61 | Add with carry ((zero page,X))
    STZ $64              ; 64 64 | Store zero to zero page
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    CPX $E4              ; E4 E4 | Compare X register (zero page)
    STZ $64              ; 64 64 | Store zero to zero page
    LDX $48              ; A6 48 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D3
; Address: $E9A652
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D3:
    LDX $48              ; A6 48 | Load from zero page into X register
    LSR $88              ; 46 88 | Logical shift right (zero page)
    ASL $0B90            ; 0E 90 0B | Arithmetic shift left (absolute)
    BCC $0B              ; 90 0B | Branch if carry clear
    BCC $09              ; 90 09 | Branch if carry clear
    ORA #$92             ; 09 92 | Logical OR with accumulator (immediate)
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    EOR $454D            ; 4D 4D 45 | Exclusive OR with accumulator (absolute)
    EOR $E1              ; 45 E1 | Exclusive OR with accumulator (zero page)
    SBC ($C1,X)          ; E1 C1 | Subtract with carry ((zero page,X))
    CMP ($CD,X)          ; C1 CD | Compare accumulator ((zero page,X))
    CMP $C5C5            ; CD C5 C5 | Compare accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D4
; Address: $E9A673
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D4:
    JSR $2092            ; 20 92 20 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1230            ; 0E 30 12 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D5
; Address: $E9A67D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D5:
    JSR $2812            ; 20 12 28 | Jump to subroutine
    STA $0060,X          ; 9D 60 00 | Store accumulator to absolute,X
    LDY $0040,X          ; BC 40 00 | Load from absolute,X into Y register
    CLD                  ; D8 | Clear decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    STY $24              ; 84 24 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    STZ $88              ; 64 88 | Store zero to zero page
    ORA $45              ; 05 45 | Logical OR with accumulator (zero page)
    EOR $C5              ; 45 C5 | Exclusive OR with accumulator (zero page)
    CMP $45              ; C5 45 | Compare accumulator (zero page)
    CMP $D7              ; C5 D7 | Compare accumulator (zero page)
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D8
; Address: $E9A6BA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D8:
    JSR $2048            ; 20 48 20 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    BIT $48              ; 24 48 | Test bits in accumulator (zero page)
    BCS $FF              ; B0 FF | Branch if carry set
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    BIT #$1D             ; 89 1D | Test bits in accumulator (immediate)
    CPY #$94             ; C0 94 | Compare Y register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    LDA                  ; BF BF 00 00 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0D9
; Address: $E9A700
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0D9:
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    JMP $F3FF            ; 4C FF F3 | Jump to address
    STA $85              ; 85 85 | Store accumulator to zero page
    STA $7B048F          ; 8F 8F 04 7B | Store accumulator to absolute long address
    DEC $C6              ; C6 C6 | Decrement (zero page)
    ORA $E3A2,Y          ; 19 A2 E3 | Logical OR with accumulator (absolute,Y)
    DEC                  ; 3A | Decrement accumulator
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    INC $80FF,X          ; FE FF 80 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    STZ $FEFE,X          ; 9E FE FE | Store zero to absolute,X
    ASL $EC20,X          ; 1E 20 EC | Arithmetic shift left (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    JMP $FB04            ; 4C 04 FB | Jump to address
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    JMP ($B6FF)          ; 6C FF B6 | Jump to address (absolute indirect)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    INC $1B00,X          ; FE 00 1B | Increment (absolute,X)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ROL $50FF            ; 2E FF 50 | Rotate left (absolute)
    BNE $00              ; D0 00 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0DB
; Address: $E9A76D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0DB:
    STA                  ; 9F F0 F0 64 | Store accumulator to absolute long,X
    DEY                  ; 88 | Decrement Y register
    CMP $0000            ; CD 00 00 | Compare accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    BPL $23              ; 10 23 | Branch if positive
    STX $6600            ; 8E 00 66 | Store X register to absolute address
    ORA $4B              ; 05 4B | Logical OR with accumulator (zero page)
    LDA ($21,X)          ; A1 21 | PPU graphics register access
    BMI $30              ; 30 30 | Branch if negative
    PEA #$DE00           ; F4 00 DE | Push effective address to stack
    STA $FF              ; 85 FF | Store accumulator to zero page
    ORA $6FFB,X          ; 1D FB 6F | Logical OR with accumulator (absolute,X)
    CMP $007B            ; CD 7B 00 | Compare accumulator (absolute)
    ADC $FD02,X          ; 7D 02 FD | Add with carry (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    AND $30FF,Y          ; 39 FF 30 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0DD
; Address: $E9A7DE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0DD:
    JSR $5400            ; 20 00 54 | Jump to subroutine
    JMP ($3936)          ; 6C 36 39 | Jump to address (absolute indirect)
    ROL $1F3F,X          ; 3E 3F 1F | Rotate left (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    BRA $20              ; 80 20 | Branch always
    BRA $10              ; 80 10 | Branch always
    LDY #$10             ; A0 10 | Load immediate value into Y register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0E3
; Address: $E9A81C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0E3:
    JSR $A008            ; 20 08 A0 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDY #$A1             ; A0 A1 | Load immediate value into Y register
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0E4
; Address: $E9A83A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0E4:
    BPL $E0              ; 10 E0 | Game work RAM access
    BCS $21              ; B0 21 | PPU graphics register access
    BVC $0B              ; 50 0B | Branch if overflow clear
    SEI                  ; 78 | Set interrupt disable flag
    STA                  ; 9F 8E FE F6 | Store accumulator to absolute long,X
    CMP #$BA             ; C9 BA | Compare accumulator (immediate)
    LDA                  ; BF 61 9F 00 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BCS $48              ; B0 48 | Branch if carry set
    STX $7E              ; 86 7E | Store X register to zero page
    SBC ($EF,X)          ; E1 EF | Subtract with carry ((zero page,X))
    EOR $D917,X          ; 5D 17 D9 | Exclusive OR with accumulator (absolute,X)
    CMP $09FF            ; CD FF 09 | Compare accumulator (absolute)
    BPL $00              ; 10 00 | Branch if positive
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0E8
; Address: $E9A886
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0E8:
    JSR $375F            ; 20 5F 37 | Jump to subroutine
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    BCS $CF              ; B0 CF | Branch if carry set
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($C8),Y          ; 31 C8 | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PEA #$C03C           ; F4 3C C0 | Push effective address to stack
    ROL $D8              ; 26 D8 | Rotate left (zero page)
    CPX $5DA2            ; EC A2 5D | Compare X register (absolute)
    LDA                  ; BF BF F3 F3 | Load from absolute long,X into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BIT $03              ; 24 03 | Test bits in accumulator (zero page)
    BCS $0F              ; B0 0F | Branch if carry set
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0EE
; Address: $E9A8FC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0EE:
    JSR $2008            ; 20 08 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ADC $9FEE            ; 6D EE 9F | Add with carry (absolute)
    DEC $65DA,X          ; DE DA 65 | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0A),Y          ; 11 0A | Logical OR with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    STX $8611            ; 8E 11 86 | Store X register to absolute address
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0EF
; Address: $E9A91E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0EF:
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    ASL $07F9            ; 0E F9 07 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    STA $DE73DF          ; 8F DF 73 DE | Store accumulator to absolute long address
    LDA $004FF4          ; AF F4 4F 00 | Load from absolute long address into accumulator
    SED                  ; F8 | Set decimal mode flag
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHB                  ; 8B | Push data bank register to stack
    LDY $718E            ; AC 8E 71 | Load from absolute address into Y register
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BPL $F0              ; 10 F0 | Branch if positive
    BVC $A0              ; 50 A0 | Branch if overflow clear
    BCS $60              ; B0 60 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0F0
; Address: $E9A95A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0F0:
    BPL $E0              ; 10 E0 | Game work RAM access
    BCS $20              ; B0 20 | Branch if carry set
    BVC $BE              ; 50 BE | Branch if overflow clear
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    ASL $0C0C            ; 0E 0C 0C | Arithmetic shift left (absolute)
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $061E            ; 0E 1E 06 | Arithmetic shift left (absolute)
    BMI $3D              ; 30 3D | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0F1
; Address: $E9A973
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0F1:
    ORA ($32,X)          ; 01 32 | Logical OR with accumulator ((zero page,X))
    EOR ($6A,X)          ; 41 6A | Exclusive OR with accumulator ((zero page,X))
    ORA $64              ; 05 64 | Logical OR with accumulator (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0F2
; Address: $E9A97E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0F2:
    WDM #$00             ; 42 00 | Reserved instruction
    ROR $1C82,X          ; 7E 82 1C | Rotate right (absolute,X)
    CPX $70              ; E4 70 | Compare X register (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    BEQ $D8              ; F0 D8 | Branch if equal

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0F3
; Address: $E9A99D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0F3:
    JSR $0078            ; 20 78 00 | Jump to subroutine
    JMP $E34C            ; 4C 4C E3 | Jump to address
    STA ($63,X)          ; 81 63 | Store accumulator to (zero page,X)
    ASL $9402,X          ; 1E 02 94 | Arithmetic shift left (absolute,X)
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0F5
; Address: $E9A9AD
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0F5:
    JSR $4043            ; 20 43 40 | Jump to subroutine
    ROR $FC00,X          ; 7E 00 FC | Rotate right (absolute,X)
    SBC $7700,X          ; FD 00 77 | Subtract with carry (absolute,X)
    ADC $DF00,Y          ; 79 00 DF | Add with carry (absolute,Y)
    LDA                  ; BF 00 08 08 | Load from absolute long,X into accumulator
    ADC ($41,X)          ; 61 41 | Add with carry ((zero page,X))
    ASL $1C02,X          ; 1E 02 1C | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    WDM #$F7             ; 42 F7 | Reserved instruction
    STA $BE00,X          ; 9D 00 BE | Store accumulator to absolute,X
    SBC $F700,X          ; FD 00 F7 | Subtract with carry (absolute,X)
    STZ $BD00            ; 9C 00 BD | Store zero to absolute
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    EOR #$49             ; 49 49 | Exclusive OR with accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag
    LDA $00B9,Y          ; B9 B9 00 | Load from absolute,Y into accumulator
    BIT #$C0             ; 89 C0 | Test bits in accumulator (immediate)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    CLV                  ; B8 | Clear overflow flag
    LDA $0046,Y          ; B9 46 00 | Load from absolute,Y into accumulator
    ADC $1818,X          ; 7D 18 18 | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $BF              ; 80 BF | Branch always
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    TXA                  ; 8A | Transfer X register to accumulator
    BRA $D3              ; 80 D3 | Branch always
    BIT $FE01            ; 2C 01 FE | Test bits in accumulator (absolute)
    ORA $41F2            ; 0D F2 41 | Logical OR with accumulator (absolute)
    AND $1E3F            ; 2D 3F 1E | Logical AND with accumulator (absolute)
    ASL $1E1F,X          ; 1E 1F 1E | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0F6
; Address: $E9AA37
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0F6:
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    CPX #$38             ; E0 38 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0F9
; Address: $E9AA47
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0F9:
    JSR $3128            ; 20 28 31 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0FC
; Address: $E9AA5C
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0FC:
    JSL $0B2019          ; 22 19 20 0B | Jump to subroutine long
    AND $2112,X          ; 3D 12 21 | PPU graphics register access
    CMP ($3F),Y          ; D1 3F | Compare accumulator ((zero page),Y)
    CMP $A132            ; CD 32 A1 | Compare accumulator (absolute)
    SBC $5023,X          ; FD 23 50 | Subtract with carry (absolute,X)
    BPL $23              ; 10 23 | Branch if positive
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    LDA ($11,X)          ; A1 11 | Load from (zero page,X) into accumulator
    ROL $3300            ; 2E 00 33 | Rotate left (absolute)
    AND ($5E,X)          ; 21 5E | Logical AND with accumulator ((zero page,X))
    AND $7BC2,X          ; 3D C2 7B | Logical AND with accumulator (absolute,X)
    DEC $FCFF,X          ; DE FF FC | Decrement (absolute,X)
    CPX $FFA3            ; EC A3 FF | Compare X register (absolute)
    STZ $BC              ; 64 BC | Store zero to zero page
    LDA $A45AD3          ; AF D3 5A A4 | Load from absolute long address into accumulator
    BVS $8F              ; 70 8F | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    STZ $98              ; 64 98 | Store zero to zero page
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    CLV                  ; B8 | Clear overflow flag
    PEA #$7CCC           ; F4 CC 7C | Push effective address to stack
    CPY $5A              ; C4 5A | Compare Y register (zero page)
    INC $5E              ; E6 5E | Increment (zero page)
    INC $F6              ; E6 F6 | Increment (zero page)
    ROL $2040            ; 2E 40 20 | Rotate left (absolute)
    BRA $70              ; 80 70 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BNE $C4              ; D0 C4 | Branch if not equal
    PHP                  ; 08 | Push processor status to stack
    BRA $42              ; 80 42 | Hardware register operation
    LDY $46              ; A4 46 | Load from zero page into Y register
    LDY #$26             ; A0 26 | Load immediate value into Y register
    INY                  ; C8 | Increment Y register
    AND $733D            ; 2D 3D 73 | Logical AND with accumulator (absolute)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    ORA $271E,X          ; 1D 1E 27 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0FD
; Address: $E9AACA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0FD:
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $1C              ; 10 1C | Branch if positive
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0FE
; Address: $E9AAD4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0FE:
    JSR $5860            ; 20 60 58 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    ROL $01              ; 26 01 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_0FF
; Address: $E9AADE
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_0FF:
    JSR $8600            ; 20 00 86 | Jump to subroutine
    STX $06              ; 86 06 | Store X register to zero page
    ASL $C4              ; 06 C4 | Arithmetic shift left (zero page)
    CPY $58              ; C4 58 | Compare Y register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $80              ; 80 80 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    ROL $3A04,X          ; 3E 04 3A | Rotate left (absolute,X)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    BEQ $FC              ; F0 FC | Branch if equal
    BCC $60              ; 90 60 | Branch if carry clear
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDA ($FF),Y          ; B1 FF | Load from (zero page),Y into accumulator
    INC $FF7D,X          ; FE 7D FF | Increment (absolute,X)
    ORA #$FF             ; 09 FF | Logical OR with accumulator (immediate)
    CPY $E0FF            ; CC FF E0 | Game work RAM access
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    BVS $70              ; 70 70 | Branch if overflow set
    LDA                  ; BF FF 0C FF | Load from absolute long,X into accumulator
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    STY $BF              ; 84 BF | Store Y register to zero page
    LDX $1FFF            ; AE FF 1F | Load from absolute address into X register
    BVS $8F              ; 70 8F | Branch if overflow set
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    AND #$26             ; 29 26 | Logical AND with accumulator (immediate)
    CPX #$64             ; E0 64 | Compare X register (immediate)
    CPX $E3              ; E4 E3 | Compare X register (zero page)
    CPX $E3              ; E4 E3 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_100
; Address: $E9AB6A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_100:
    CPX $E3              ; E4 E3 | Compare X register (zero page)
    CPX $E3              ; E4 E3 | Compare X register (zero page)
    CPX $E3              ; E4 E3 | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_101
; Address: $E9AB70
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_101:
    JSR $E0DF            ; 20 DF E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_102
; Address: $E9AB80
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_102:
    JSR $3EDF            ; 20 DF 3E | Jump to subroutine
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_103
; Address: $E9AB9E
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_103:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    INX                  ; E8 | Increment X register
    BPL $E7              ; 10 E7 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    BPL $E8              ; 10 E8 | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA #$F4             ; 09 F4 | Logical OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    LDA ($18,X)          ; A1 18 | Load from (zero page,X) into accumulator
    PHP                  ; 08 | Push processor status to stack
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CPX #$41             ; E0 41 | Compare X register (immediate)
    LDY $B649,X          ; BC 49 B6 | Load from absolute,X into Y register
    LDA $0046,Y          ; B9 46 00 | Load from absolute,Y into accumulator
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    AND ($3B),Y          ; 31 3B | Logical AND with accumulator ((zero page),Y)
    AND ($7E),Y          ; 31 7E | Logical AND with accumulator ((zero page),Y)
    ASL $0C69,X          ; 1E 69 0C | Arithmetic shift left (absolute,X)
    LSR $3838,X          ; 5E 38 38 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_104
; Address: $E9AC50
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_104:
    JSR $311B            ; 20 1B 31 | Jump to subroutine
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $0801            ; 4E 01 08 | Logical shift right (absolute)
    ADC ($08,X)          ; 61 08 | Add with carry ((zero page,X))
    BMI $18              ; 30 18 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_105
; Address: $E9AC61
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_105:
    CPX #$78             ; E0 78 | Compare X register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    CPY #$4F             ; C0 4F | Compare Y register (immediate)
    CMP ($4F,X)          ; C1 4F | Compare accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_106
; Address: $E9AC71
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_106:
    STA                  ; 9F 68 97 48 | Store accumulator to absolute long,X
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 41 BE 02 | Load from absolute long,X into accumulator
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDY #$F1             ; A0 F1 | Load immediate value into Y register
    INC $40CE,X          ; FE CE 40 | Increment (absolute,X)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)
    DEC $3301,X          ; DE 01 33 | Decrement (absolute,X)
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SBC $BF40,X          ; FD 40 BF | Subtract with carry (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC ($23,X)          ; E1 23 | Subtract with carry ((zero page,X))
    CPY $3CEC            ; CC EC 3C | Compare Y register (absolute)
    CPX $3C              ; E4 3C | Compare X register (zero page)
    STY $FC              ; 84 FC | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    BPL $2C              ; 10 2C | Branch if positive
    BNE $24              ; D0 24 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    CLV                  ; B8 | Clear overflow flag
    STY $78              ; 84 78 | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    PEA #$B840           ; F4 40 B8 | Push effective address to stack
    BPL $E8              ; 10 E8 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA $17              ; 05 17 | Logical OR with accumulator (zero page)
    ORA $1D              ; 05 1D | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_107
; Address: $E9ACD0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_107:
    JSR $3400            ; 20 00 34 | Jump to subroutine
    BPL $35              ; 10 35 | Branch if positive
    ORA $29              ; 05 29 | Logical OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_108
; Address: $E9ACE1
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_108:
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BNE $F0              ; D0 F0 | Branch if not equal
    PEA #$ECEC           ; F4 EC EC | Push effective address to stack
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    JMP ($AC08)          ; 6C 08 AC | Jump to address (absolute indirect)
    TAY                  ; A8 | Transfer accumulator to Y register
    LDY $ACA8            ; AC A8 AC | Load from absolute address into Y register
    LDY #$A8             ; A0 A8 | Load immediate value into Y register
    LDY #$90             ; A0 90 | Load immediate value into Y register
    BRA $64              ; 80 64 | Branch always
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)
    ROL $C7              ; 26 C7 | Rotate left (zero page)
    ROL $C6              ; 26 C6 | Rotate left (zero page)
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)
    AND ($C7,X)          ; 21 C7 | Logical AND with accumulator ((zero page,X))
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_109
; Address: $E9AD0C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_109:
    JSL $C722C7          ; 22 C7 22 C7 | Jump to subroutine long
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BRA $3E              ; 80 3E | Branch always
    CMP ($3C,X)          ; C1 3C | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LSR $2073            ; 4E 73 20 | Logical shift right (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    DEC $CEE1,X          ; DE E1 CE | Decrement (absolute,X)
    SBC ($CF),Y          ; F1 CF | Subtract with carry ((zero page),Y)
    BEQ $80              ; F0 80 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $47              ; 70 47 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_10A
; Address: $E9AD69
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_10A:
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    CPX #$77             ; E0 77 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    LDY $1CE3,X          ; BC E3 1C | Load from absolute,X into Y register
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    AND $2931,Y          ; 39 31 29 | Logical AND with accumulator (absolute,Y)
    AND ($38),Y          ; 31 38 | Logical AND with accumulator ((zero page),Y)
    AND ($28),Y          ; 31 28 | Logical AND with accumulator ((zero page),Y)
    BMI $28              ; 30 28 | Branch if negative
    BMI $39              ; 30 39 | Branch if negative
    BMI $28              ; 30 28 | Branch if negative
    BPL $28              ; 10 28 | Branch if positive
    BPL $31              ; 10 31 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND ($18,X)          ; 21 18 | Logical AND with accumulator ((zero page,X))
    BMI $09              ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_10B
; Address: $E9ADB6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_10B:
    JSR $2019            ; 20 19 20 | Jump to subroutine
    ORA $0930,Y          ; 19 30 09 | Logical OR with accumulator (absolute,Y)
    AND $3F00,Y          ; 39 00 3F | Logical AND with accumulator (absolute,Y)
    INY                  ; C8 | Increment Y register
    CPY #$77             ; C0 77 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    ORA $1FD4,X          ; 1D D4 1F | Logical OR with accumulator (absolute,X)
    CMP $D59F,X          ; DD 9F D5 | Compare accumulator (absolute,X)
    STA                  ; 9F 9D 9F C0 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_10C
; Address: $E9ADD5
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_10C:
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $ED              ; 10 ED | Branch if positive
    XBA                  ; EB | Exchange accumulator bytes
    STA $9562,X          ; 9D 62 95 | Store accumulator to absolute,X
    ROR                  ; 6A | Rotate right (accumulator)
    STA $5E62,X          ; 9D 62 5E | Store accumulator to absolute,X
    LDX $1AE6,Y          ; BE E6 1A | Load from absolute,Y into X register
    ASL $02A1,X          ; 1E A1 02 | Arithmetic shift left (absolute,X)
    ORA $E403,Y          ; 19 03 E4 | Logical OR with accumulator (absolute,Y)
    BIT $83              ; 24 83 | Test bits in accumulator (zero page)
    CPX $AA55            ; EC 55 AA | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BPL $F8              ; 10 F8 | Branch if positive
    BMI $E0              ; 30 E0 | Game work RAM access
    BVS $10              ; 70 10 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    BMI $10              ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_10D
; Address: $E9AE0C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_10D:
    BMI $10              ; 30 10 | Branch if negative
    BMI $10              ; 30 10 | Branch if negative
    BPL $E8              ; 10 E8 | Branch if positive
    BMI $C8              ; 30 C8 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_10E
; Address: $E9AE15
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_10E:
    TYA                  ; 98 | Transfer Y register to accumulator
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $EE              ; 10 EE | Branch if positive
    ORA $1F1A,X          ; 1D 1A 1F | Logical OR with accumulator (absolute,X)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $2B3C,X          ; 1D 3C 2B | Logical OR with accumulator (absolute,X)
    AND $3F12,X          ; 3D 12 3F | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_110
; Address: $E9AE34
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_110:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    BRA $E8              ; 80 E8 | Branch always
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BCS $F0              ; B0 F0 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    ASL $1600            ; 0E 00 16 | Arithmetic shift left (absolute)
    PHA                  ; 48 | Push accumulator to stack
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $C7              ; 24 C7 | Test bits in accumulator (zero page)
    BIT $C4              ; 24 C4 | Test bits in accumulator (zero page)
    BIT $C4              ; 24 C4 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    BPL $D0              ; 10 D0 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $FC83            ; ED 83 FC | Subtract with carry (absolute)
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CMP ($DC,X)          ; C1 DC | Compare accumulator ((zero page,X))
    SBC $C602,X          ; FD 02 C6 | Subtract with carry (absolute,X)
    AND $30CF,Y          ; 39 CF 30 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_111
; Address: $E9AE8F
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_111:
    BMI $00              ; 30 00 | Branch if negative
    BMI $CF              ; 30 CF | Branch if negative
    CPY $7B              ; C4 7B | Compare Y register (zero page)
    STY $BB              ; 84 BB | Store Y register to zero page
    STX $7F              ; 86 7F | Store X register to zero page
    CPX $FF1F            ; EC 1F FF | Compare X register (absolute)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    BPL $00              ; 10 00 | Branch if positive
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    BMI $7F              ; 30 7F | Branch if negative
    BRA $7F              ; 80 7F | Branch always
    BRA $6D              ; 80 6D | Branch always
    BIT $1700            ; 2C 00 17 | Test bits in accumulator (absolute)
    CMP $8F8F,X          ; DD 8F 8F | Compare accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $F21F,Y          ; 79 1F F2 | Add with carry (absolute,Y)
    SBC $0FFD            ; ED FD 0F | Subtract with carry (absolute)
    ASL $17              ; 06 17 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    STA $0A72            ; 8D 72 0A | Store accumulator to absolute address
    SBC $E619,X          ; FD 19 E6 | Subtract with carry (absolute,X)
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    ORA $06F2            ; 0D F2 06 | Logical OR with accumulator (absolute)
    ORA #$5D             ; 09 5D | Logical OR with accumulator (immediate)
    LDX $9CBE,Y          ; BE BE 9C | Load from absolute,Y into X register
    LDX $8F30,Y          ; BE 30 8F | Load from absolute,Y into X register
    LDY $18BE,X          ; BC BE 18 | Load from absolute,X into Y register
    EOR $B6A2,X          ; 5D A2 B6 | Exclusive OR with accumulator (absolute,X)
    EOR #$9C             ; 49 9C | Exclusive OR with accumulator (immediate)
    BMI $CF              ; 30 CF | Branch if negative
    LDY $1853            ; AC 53 18 | Load from absolute address into Y register
    LDX $14              ; A6 14 | Load from zero page into X register
    SED                  ; F8 | Set decimal mode flag
    INC $EA14,X          ; FE 14 EA | Increment (absolute,X)
    INC $FA04,X          ; FE 04 FA | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    CLI                  ; 58 | Clear interrupt disable flag
    ADC $3D3A            ; 6D 3A 3D | Add with carry (absolute)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_113
; Address: $E9AFA0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_113:
    SEP #$E2             ; E2 E2 | Set processor status bits
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    INY                  ; C8 | Increment Y register
    CPY $3020            ; CC 20 30 | Compare Y register (absolute)
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $5D00,X          ; 1D 00 5D | Logical OR with accumulator (absolute,X)
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))
    BMI $0C              ; 30 0C | Branch if negative
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    SBC $E09F,Y          ; F9 9F E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    BRA $F8              ; 80 F8 | Branch always
    SBC $7F86,Y          ; F9 86 7F | Subtract with carry (absolute,Y)
    BRA $7D              ; 80 7D | Branch always
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BRA $7F              ; 80 7F | Branch always
    BRA $FF              ; 80 FF | Branch always
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    SBC $00FE,Y          ; F9 FE 00 | Subtract with carry (absolute,Y)
    BVS $EF              ; 70 EF | Branch if overflow set
    BVS $B0              ; 70 B0 | Branch if overflow set
    INC $DF01,X          ; FE 01 DF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_114
; Address: $E9B009
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_114:
    JSR $34CB            ; 20 CB 34 | Jump to subroutine
    INC $0E01,X          ; FE 01 0E | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    STY $FF8C            ; 8C 8C FF | Store Y register to absolute address
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $E0              ; 05 E0 | Game work RAM access
    ASL $E1              ; 06 E1 | Arithmetic shift left (zero page)
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    CPY $20              ; C4 20 | Compare Y register (zero page)
    CPY #$24             ; C0 24 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_115
; Address: $E9B05B
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_115:
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$8A             ; C0 8A | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF BF 1F 1F | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    STZ $11              ; 64 11 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    TXA                  ; 8A | Transfer X register to accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    TAY                  ; A8 | Transfer accumulator to Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    BRA $80              ; 80 80 | Branch always
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ADC $10              ; 65 10 | Add with carry (zero page)
    EOR ($62,X)          ; 41 62 | Exclusive OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    LDA #$AB             ; A9 AB | Load immediate value into accumulator
    BCC $90              ; 90 90 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    INC $63FE,X          ; FE FE 63 | Increment (absolute,X)
    ORA ($44),Y          ; 11 44 | Logical OR with accumulator ((zero page),Y)
    ROR $11              ; 66 11 | Rotate right (zero page)
    ADC $9702            ; 6D 02 97 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_116
; Address: $E9B0BD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_116:
    JSR $0001            ; 20 01 00 | Jump to subroutine
    ADC $7879,Y          ; 79 79 78 | Add with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    ADC $407D,X          ; 7D 7D 40 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_117
; Address: $E9B0C9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_117:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    REP #$87             ; C2 87 | Reset processor status bits
    RTI                  ; 40 | Return from interrupt
    STA $40              ; 85 40 | Store accumulator to zero page
    RTI                  ; 40 | Return from interrupt
    LDA $9F52            ; AD 52 9F | Load from absolute address into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_118
; Address: $E9B0DF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_118:
    BRA $72              ; 80 72 | Branch always
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    STA $3E00            ; 8D 00 3E | Store accumulator to absolute address
    PLP                  ; 28 | Pull processor status from stack
    JMP $5B01            ; 4C 01 5B | Jump to address
    LDY $7D              ; A4 7D | Load from zero page into Y register
    STZ $B29E,X          ; 9E 9E B2 | Store zero to absolute,X
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    ROL $26              ; 26 26 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_119
; Address: $E9B10A
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_119:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    AND ($40,X)          ; 21 40 | Logical AND with accumulator ((zero page,X))
    JMP $5D01            ; 4C 01 5D | Jump to address
    CMP $A900,Y          ; D9 00 A9 | Compare accumulator (absolute,Y)
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    JMP ($006C)          ; 6C 6C 00 | Jump to address (absolute indirect)
    EOR $8504,Y          ; 59 04 85 | Exclusive OR with accumulator (absolute,Y)
    BRA $CB              ; 80 CB | Branch always
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $90              ; 90 90 | Branch if carry clear
    LDX #$A2             ; A2 A2 | Load immediate value into X register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    LDA                  ; BF BF 58 87 | Load from absolute long,X into accumulator
    ROR $5181            ; 6E 81 51 | Rotate right (absolute)
    STY $8C73            ; 8C 73 8C | Store Y register to absolute address
    BIT #$70             ; 89 70 | Test bits in accumulator (immediate)
    STA $40807F          ; 8F 7F 80 40 | Store accumulator to absolute long address
    BRA $07              ; 80 07 | Branch always
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PLA                  ; 68 | Pull accumulator from stack
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_11A
; Address: $E9B17E
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_11A:
    PHP                  ; 08 | Push processor status to stack
    ROL $062E            ; 2E 2E 06 | Rotate left (absolute)
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ROL $3610,X          ; 3E 10 36 | Rotate left (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    BPL $36              ; 10 36 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ROL $2A0C,X          ; 3E 0C 2A | Rotate left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BCS $7C              ; B0 7C | Branch if carry set
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    JMP ($5F93)          ; 6C 93 5F | Jump to address (absolute indirect)
    LDY #$56             ; A0 56 | Load immediate value into Y register
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    CPX $8813            ; EC 13 88 | Compare X register (absolute)
    STZ $1863            ; 9C 63 18 | Store zero to absolute
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $36              ; 10 36 | Branch if positive
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_11B
; Address: $E9B1F4
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_11B:
    BPL $36              ; 10 36 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ROL $2E08,X          ; 3E 08 2E | Rotate left (absolute,X)
    BPL $26              ; 10 26 | Branch if positive
    BPL $26              ; 10 26 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ROL $00              ; 26 00 | Rotate left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    STX $8F09            ; 8E 09 8F | Store X register to absolute address
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    STA $189F08          ; 8F 08 9F 18 | Store accumulator to absolute long address
    BPL $B7              ; 10 B7 | Branch if positive
    TAX                  ; AA | Transfer accumulator to X register
    PHP                  ; 08 | Push processor status to stack
    STY $9F0C            ; 8C 0C 9F | Store Y register to absolute address
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ADC $40E8            ; 6D E8 40 | Add with carry (absolute)
    CPY #$5A             ; C0 5A | Compare Y register (immediate)
    PHX                  ; DA | Push X register to stack
    ROR $0607,X          ; 7E 07 06 | Rotate right (absolute,X)
    LDA                  ; BF 00 A5 00 | Load from absolute long,X into accumulator
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SBC $CD00,Y          ; F9 00 CD | Subtract with carry (absolute,Y)
    SBC $4000,X          ; FD 00 40 | Subtract with carry (absolute,X)
    ROR $3E2C,X          ; 7E 2C 3E | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    BRA $01              ; 80 01 | Branch always
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY $03              ; C4 03 | Compare Y register (zero page)
    STA ($A3,X)          ; 81 A3 | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    ADC ($35,X)          ; 61 35 | Add with carry ((zero page,X))
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    CPX #$DF             ; E0 DF | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    AND ($8F),Y          ; 31 8F | Logical AND with accumulator ((zero page),Y)
    ROL $718F,X          ; 3E 8F 71 | Rotate left (absolute,X)
    STX $9E20            ; 8E 20 9E | Store X register to absolute address
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_11C
; Address: $E9B2C2
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_11C:
    TYA                  ; 98 | Transfer Y register to accumulator
    LSR $3A80            ; 4E 80 3A | Logical shift right (absolute)
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $30              ; 10 30 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BMI $08              ; 30 08 | Branch if negative
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    SBC ($41,X)          ; E1 41 | Subtract with carry ((zero page,X))
    LDY $B748,X          ; BC 48 B7 | Load from absolute,X into Y register
    LDA $0046,Y          ; B9 46 00 | Load from absolute,Y into accumulator
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $FE01,X          ; FD 01 FE | Subtract with carry (absolute,X)
    BMI $87              ; 30 87 | Branch if negative
    BRA $37              ; 80 37 | Branch always
    BRA $37              ; 80 37 | Branch always
    STA ($17,X)          ; 81 17 | Store accumulator to (zero page,X)
    BRA $19              ; 80 19 | Branch always
    BRA $3D              ; 80 3D | Branch always
    BRA $FF              ; 80 FF | Branch always
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CPX $FD40            ; EC 40 FD | Compare X register (absolute)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    CMP ($27,X)          ; C1 27 | Compare accumulator ((zero page,X))
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    CMP ($F6,X)          ; C1 F6 | Compare accumulator ((zero page,X))
    CPY #$76             ; C0 76 | Compare Y register (immediate)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    BRA $BC              ; 80 BC | Branch always
    LDY $3F02,X          ; BC 02 3F | Load from absolute,X into Y register
    ROL $3E00,X          ; 3E 00 3E | Rotate left (absolute,X)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BIT $4C              ; 24 4C | Test bits in accumulator (zero page)
    INC                  ; 1A | Increment accumulator
    LSR $3C1C,X          ; 5E 1C 3C | Logical shift right (absolute,X)
    SEC                  ; 38 | Set carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ROL $1800,X          ; 3E 00 18 | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_11E
; Address: $E9B3A4
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_11E:
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    STZ $8000            ; 9C 00 80 | Store zero to absolute
    AND $698F            ; 2D 8F 69 | Logical AND with accumulator (absolute)
    STA $719F78          ; 8F 78 9F 71 | Store accumulator to absolute long address
    STA                  ; 9F 70 9F 77 | Store accumulator to absolute long,X
    STA                  ; 9F 73 9F F8 | Store accumulator to absolute long,X
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CMP $D880,Y          ; D9 80 D8 | Compare accumulator (absolute,Y)
    BRA $EA              ; 80 EA | Branch always
    BRA $DE              ; 80 DE | Branch always
    BRA $BF              ; 80 BF | Branch always
    STX $FF              ; 86 FF | Store X register to zero page
    STY $DF              ; 84 DF | Store Y register to zero page
    STY $7F              ; 84 7F | Store Y register to zero page
    BRA $FF              ; 80 FF | Branch always
    BRA $C8              ; 80 C8 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    LSR $6931            ; 4E 31 69 | Logical shift right (absolute)
    LSR $0031            ; 4E 31 00 | Logical shift right (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP $FFFF,X          ; DD FF FF | Compare accumulator (absolute,X)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    AND $28D7            ; 2D D7 28 | Logical AND with accumulator (absolute)
    SBC $A758            ; ED 58 A7 | Subtract with carry (absolute)
    SBC $25DA            ; ED DA 25 | Subtract with carry (absolute)
    INY                  ; C8 | Increment Y register
    TXA                  ; 8A | Transfer X register to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $FFFF,X          ; 7D FF FF | Add with carry (absolute,X)
    EOR $BA              ; 45 BA | Exclusive OR with accumulator (zero page)
    INC $8A11            ; EE 11 8A | Increment (absolute)
    EOR $0000            ; 4D 00 00 | Exclusive OR with accumulator (absolute)
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    DEX                  ; CA | Decrement X register
    STZ $6B              ; 64 6B | Store zero to zero page
    EOR $C9A6,Y          ; 59 A6 C9 | Exclusive OR with accumulator (absolute,Y)
    INC $5501,X          ; FE 01 55 | Increment (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_11F
; Address: $E9B4A8
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_11F:
    BIT $E2D3            ; 2C D3 E2 | Test bits in accumulator (absolute)
    ORA $F708,X          ; 1D 08 F7 | Logical OR with accumulator (absolute,X)
    LDY $00              ; A4 00 | Load from zero page into Y register
    STA                  ; 9F 7F 9F 5F | Store accumulator to absolute long,X
    LDY #$46             ; A0 46 | Load immediate value into Y register
    BCS $63              ; B0 63 | Branch if carry set
    BCC $43              ; 90 43 | Branch if carry clear
    LDY $8049,X          ; BC 49 80 | Load from absolute,X into Y register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $F78C,X          ; FE 8C F7 | Increment (absolute,X)
    STY $4CB3            ; 8C B3 4C | Store Y register to absolute address
    LDY $7B40,X          ; BC 40 7B | Load from absolute,X into Y register
    BMI $CF              ; 30 CF | Branch if negative
    ORA ($9C,X)          ; 01 9C | Logical OR with accumulator ((zero page,X))
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$4A             ; C0 4A | Compare Y register (immediate)
    ADC $92FF,X          ; 7D FF 92 | Add with carry (absolute,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    LDA $5FFF,X          ; BD FF 5F | Load from absolute,X into accumulator
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    LDA $FF52            ; AD 52 FF | Load from absolute address into accumulator
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    STY $00FF            ; 8C FF 00 | Store Y register to absolute address
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CMP #$39             ; C9 39 | Compare accumulator (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    JMP ($FF93)          ; 6C 93 FF | Jump to address (absolute indirect)
    BEQ $CB              ; F0 CB | Branch if equal
    CPY $443F            ; CC 3F 44 | Compare Y register (absolute)
    LSR $BFCD,X          ; 5E CD BF | Logical shift right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    BCC $91              ; 90 91 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_120
; Address: $E9B5CB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_120:
    INY                  ; C8 | Increment Y register
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA ($91),Y          ; 91 91 | Store accumulator to (zero page),Y
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_121
; Address: $E9B5D8
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_121:
    JSR $2317            ; 20 17 23 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BIT $1242            ; 2C 42 12 | Test bits in accumulator (absolute)
    BRA $C0              ; 80 C0 | Branch always
    BEQ $F0              ; F0 F0 | Branch if equal
    LDY $BDBC,X          ; BC BC BD | Load from absolute,X into Y register
    LDA $A6A6,X          ; BD A6 A6 | Load from absolute,X into accumulator
    CMP #$24             ; C9 24 | Compare accumulator (immediate)
    AND $0DC4,Y          ; 39 C4 0D | Logical AND with accumulator (absolute,Y)
    EOR ($40,X)          ; 41 40 | Exclusive OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    BEQ $0B              ; F0 0B | Branch if equal
    BEQ $49              ; F0 49 | Branch if equal
    BCS $4A              ; B0 4A | Branch if carry set
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $01FE,X          ; FE FE 01 | Increment (absolute,X)
    CPY $073C            ; CC 3C 07 | Compare Y register (absolute)
    BPL $1F              ; 10 1F | Branch if positive
    ORA $C013            ; 0D 13 C0 | Logical OR with accumulator (absolute)
    CPY #$B3             ; C0 B3 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    LDA                  ; BF 80 AC A0 | Load from absolute long,X into accumulator
    BMI $4E              ; 30 4E | Branch if negative
    DEC $F1C9            ; CE C9 F1 | Decrement (absolute)
    BEQ $3C              ; F0 3C | Branch if equal
    AND $FCE0,X          ; 3D E0 FC | Logical AND with accumulator (absolute,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BMI $00              ; 30 00 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    REP #$00             ; C2 00 | Reset processor status bits
    PHP                  ; 08 | Push processor status to stack
    ROR $0361,X          ; 7E 61 03 | Rotate right (absolute,X)
    LSR $C9              ; 46 C9 | Logical shift right (zero page)
    LDA $A6              ; A5 A6 | Load from zero page into accumulator
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_122
; Address: $E9B66A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_122:
    LDY $64              ; A4 64 | Load from zero page into Y register
    INC                  ; 1A | Increment accumulator
    ASL $7848,X          ; 1E 48 78 | Arithmetic shift left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    CLI                  ; 58 | Clear interrupt disable flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_123
; Address: $E9B681
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_123:
    CPX #$86             ; E0 86 | Compare X register (immediate)
    INC $F818,X          ; FE 18 F8 | Increment (absolute,X)
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    CPY $CC              ; C4 CC | Compare Y register (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ASL $0001,X          ; 1E 01 00 | Arithmetic shift left (absolute,X)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA ($C5,X)          ; 01 C5 | Logical OR with accumulator ((zero page,X))
    ORA ($33,X)          ; 01 33 | Logical OR with accumulator ((zero page,X))
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    ADC $8F9C,X          ; 7D 9C 8F | Add with carry (absolute,X)
    NOP                  ; EA | No operation
    LSR $B2              ; 46 B2 | Logical shift right (zero page)
    STA ($E3,X)          ; 81 E3 | Store accumulator to (zero page,X)
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    SBC $E1E1            ; ED E1 E1 | Subtract with carry (absolute)
    BRA $70              ; 80 70 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_124
; Address: $E9B6B4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_124:
    BIT #$80             ; 89 80 | Test bits in accumulator (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    STZ $8A              ; 64 8A | Store zero to zero page
    STY $78              ; 84 78 | Store Y register to zero page
    STA ($1E,X)          ; 81 1E | Store accumulator to (zero page,X)
    SBC ($90,X)          ; E1 90 | Subtract with carry ((zero page,X))
    BCC $B1              ; 90 B1 | Branch if carry clear
    LDA ($E1),Y          ; B1 E1 | Load from (zero page),Y into accumulator
    SBC ($C4,X)          ; E1 C4 | Subtract with carry ((zero page,X))
    CPY $CC              ; C4 CC | Compare Y register (zero page)
    CPY $FFFF            ; CC FF FF | Compare Y register (absolute)
    BRA $FF              ; 80 FF | Branch always
    ADC $4E02            ; 6D 02 4E | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_125
; Address: $E9B6D7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_125:
    JSR $0033            ; 20 33 00 | Jump to subroutine
    ROL $A92E            ; 2E 2E A9 | Rotate left (absolute)
    LDA #$BA             ; A9 BA | Load immediate value into accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    LDY $A0AC            ; AC AC A0 | Load from absolute address into Y register
    LDY #$FF             ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_126
; Address: $E9B6F0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_126:
    STA ($50,X)          ; 81 50 | Store accumulator to (zero page,X)
    BPL $46              ; 10 46 | Branch if positive
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    BVC $0C              ; 50 0C | Branch if overflow clear
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    STA $E0E0F0          ; 8F F0 E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank52_DmaFunction_128
; Address: $E9B70D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_128:
    JSR $2727            ; 20 27 27 | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $12              ; 80 12 | Branch always
    SBC $E01F            ; ED 1F E0 | Game work RAM access
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPX #$F4             ; E0 F4 | Compare X register (immediate)
    PEA #$0000           ; F4 00 00 | Push effective address to stack
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_129
; Address: $E9B72D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_129:
    ROR $E8              ; 66 E8 | Rotate right (zero page)
    INC $A0AB            ; EE AB A0 | Increment (absolute)
    BRA $7F              ; 80 7F | Branch always
    INC $EE11            ; EE 11 EE | Increment (absolute)
    ROR $77              ; 66 77 | Rotate right (zero page)
    DEC $00CE            ; CE CE 00 | Decrement (absolute)
    STY $FF              ; 84 FF | Store Y register to zero page
    TAX                  ; AA | Transfer accumulator to X register
    ASL $66              ; 06 66 | Arithmetic shift left (zero page)
    STX $31EE            ; 8E EE 31 | Store X register to absolute address
    PHP                  ; 08 | Push processor status to stack
    BRA $7F              ; 80 7F | Branch always
    INC $6677            ; EE 77 66 | Increment (absolute)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_12C
; Address: $E9B770
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_12C:
    DEC $F700            ; CE 00 F7 | Decrement (absolute)
    PHP                  ; 08 | Push processor status to stack
    XBA                  ; EB | Exchange accumulator bytes
    WDM #$46             ; 42 46 | Reserved instruction
    STA $F7FF,Y          ; 99 FF F7 | Store accumulator to absolute,Y
    BIT $B82C            ; 2C 2C B8 | Test bits in accumulator (absolute)
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ADC $4D8E,X          ; 7D 8E 4D | Add with carry (absolute,X)
    STZ $0A0A,X          ; 9E 0A 0A | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_12D
; Address: $E9B7A3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_12D:
    PHP                  ; 08 | Push processor status to stack
    BMI $F3              ; 30 F3 | Branch if negative
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    BMI $34              ; 30 34 | Branch if negative
    BCS $B4              ; B0 B4 | Branch if carry set
    EOR $A2              ; 45 A2 | Exclusive OR with accumulator (zero page)
    ROR $C040,X          ; 7E 40 C0 | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank52_DmaFunction_12E
; Address: $E9B7C5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_12E:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_12F
; Address: $E9B7CC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_12F:
    JSR $60E0            ; 20 E0 60 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_130
; Address: $E9B80C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_130:
    JSR $60E0            ; 20 E0 60 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    SBC $FF49,Y          ; F9 49 FF | Subtract with carry (absolute,Y)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BCS $03              ; B0 03 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    LDA                  ; BF 00 FF 00 | Load from absolute long,X into accumulator
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    BRA $20              ; 80 20 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $F6C3            ; CC C3 F6 | Compare Y register (absolute)
    SBC ($FD),Y          ; F1 FD | Subtract with carry ((zero page),Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_131
; Address: $E9B8A2
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_131:
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ORA $D8              ; 05 D8 | Logical OR with accumulator (zero page)
    EOR $18              ; 45 18 | Exclusive OR with accumulator (zero page)
    CMP $D8              ; C5 D8 | Compare accumulator (zero page)
    ORA $18              ; 05 18 | Logical OR with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $30              ; D0 30 | Branch if not equal
    BVS $B0              ; 70 B0 | Branch if overflow set
    BEQ $30              ; F0 30 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BVS $80              ; 70 80 | Branch if overflow set
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BCC $90              ; 90 90 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BRA $60              ; 80 60 | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    AND $443D,X          ; 3D 3D 44 | Logical AND with accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $7E              ; 80 7E | Branch always
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_132
; Address: $E9B92B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_132:
    STA                  ; 9F 09 36 42 | Store accumulator to absolute long,X
    BRA $FF              ; 80 FF | Branch always
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    SBC $A459,X          ; FD 59 A4 | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    STZ $00              ; 64 00 | Store zero to zero page
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    INC $01F8,X          ; FE F8 01 | Increment (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_133
; Address: $E9B970
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_133:
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    SBC $FF00,Y          ; F9 00 FF | Subtract with carry (absolute,Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    BPL $D0              ; 10 D0 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    SEC                  ; 38 | Set carry flag
    CPX #$38             ; E0 38 | Compare X register (immediate)
    BEQ $38              ; F0 38 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    PLP                  ; 28 | Pull processor status from stack
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_134
; Address: $E9B994
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_134:
    JSR $0400            ; 20 00 04 | Jump to subroutine
    ASL $0403            ; 0E 03 04 | Arithmetic shift left (absolute)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_135
; Address: $E9B9BC
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_135:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BIT $82              ; 24 82 | Test bits in accumulator (zero page)
    STY $9926            ; 8C 26 99 | Store Y register to absolute address
    EOR #$80             ; 49 80 | Exclusive OR with accumulator (immediate)
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    BMI $C9              ; 30 C9 | Branch if negative
    LDA ($56,X)          ; A1 56 | Load from (zero page,X) into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $7A8D,X          ; BD 8D 7A | Load from absolute,X into accumulator
    BCC $F9              ; 90 F9 | Branch if carry clear
    CMP $0622,X          ; DD 22 06 | Compare accumulator (absolute,X)
    DEC $0421,X          ; DE 21 04 | Decrement (absolute,X)
    ORA ($F4,X)          ; 01 F4 | Logical OR with accumulator ((zero page,X))
    ORA $6F              ; 05 6F | Logical OR with accumulator (zero page)
    BPL $26              ; 10 26 | Branch if positive
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    EOR #$A6             ; 49 A6 | Exclusive OR with accumulator (immediate)
    STZ $7B73            ; 9C 73 7B | Store zero to absolute
    ASL $8702            ; 0E 02 87 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_136
; Address: $E9BA0D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_136:
    STY $20              ; 84 20 | Store Y register to zero page
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    PLA                  ; 68 | Pull accumulator from stack
    SBC $7C02,X          ; FD 02 7C | Subtract with carry (absolute,X)
    BRA $BF              ; 80 BF | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_138
; Address: $E9BA20
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_138:
    PLA                  ; 68 | Pull accumulator from stack
    TAX                  ; AA | Transfer accumulator to X register
    STA $6766,X          ; 9D 66 67 | Store accumulator to absolute,X
    INC $926D,X          ; FE 6D 92 | Increment (absolute,X)
    ORA ($6C,X)          ; 01 6C | Logical OR with accumulator ((zero page,X))
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STA $9340,Y          ; 99 40 93 | Store accumulator to absolute,Y
    CMP $E09F            ; CD 9F E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    INC $F887,X          ; FE 87 F8 | Increment (absolute,X)
    STA $7D8EF1          ; 8F F1 8E 7D | Store accumulator to absolute long address
    ADC $0082,X          ; 7D 82 00 | Add with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    EOR $83              ; 45 83 | Exclusive OR with accumulator (zero page)
    CMP $9857,Y          ; D9 57 98 | Compare accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STA ($C6,X)          ; 81 C6 | Store accumulator to (zero page,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_13B
; Address: $E9BA7C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_13B:
    JSR $3800            ; 20 00 38 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($41,X)          ; 81 41 | Store accumulator to (zero page,X)
    CMP ($DE,X)          ; C1 DE | Compare accumulator ((zero page,X))
    ADC ($CB,X)          ; 61 CB | Add with carry ((zero page,X))
    LDX $4E41,Y          ; BE 41 4E | Load from absolute,Y into X register
    SBC ($82),Y          ; F1 82 | Subtract with carry ((zero page),Y)
    WDM #$00             ; 42 00 | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    LDY $8C33,X          ; BC 33 8C | Load from absolute,X into Y register
    BIT $B0BF            ; 2C BF B0 | Test bits in accumulator (absolute)
    LDA                  ; BF 07 07 18 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_13C
; Address: $E9BAC6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_13C:
    JSL $375B1F          ; 22 1F 5B 37 | Jump to subroutine long
    EOR #$07             ; 49 07 | Exclusive OR with accumulator (immediate)
    EOR $5837,Y          ; 59 37 58 | Exclusive OR with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    AND ($52,X)          ; 21 52 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_13D
; Address: $E9BADC
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_13D:
    ORA ($64),Y          ; 11 64 | Logical OR with accumulator ((zero page),Y)
    BMI $40              ; 30 40 | Branch if negative
    NOP                  ; EA | No operation
    BRA $9F              ; 80 9F | Branch always
    BNE $CF              ; D0 CF | Branch if not equal
    CPX #$15             ; E0 15 | Compare X register (immediate)
    BRA $7F              ; 80 7F | Branch always
    CPY #$2F             ; C0 2F | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    ADC $5012,X          ; 7D 12 50 | Add with carry (absolute,X)
    ROR $721F,X          ; 7E 1F 72 | Rotate right (absolute,X)
    ORA $0A55            ; 0D 55 0A | Logical OR with accumulator (absolute)
    BPL $66              ; 10 66 | Branch if positive
    BPL $64              ; 10 64 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BPL $42              ; 10 42 | Hardware register operation
    BMI $48              ; 30 48 | Branch if negative
    ASL $0040,X          ; 1E 40 00 | Arithmetic shift left (absolute,X)
    EOR $403F            ; 4D 3F 40 | Exclusive OR with accumulator (absolute)
    DEX                  ; CA | Decrement X register
    BRA $9F              ; 80 9F | Branch always
    PHX                  ; DA | Push X register to stack
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    SBC $20FF            ; ED FF 20 | Subtract with carry (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    CPY #$2A             ; C0 2A | Compare Y register (immediate)
    BRA $60              ; 80 60 | Branch always
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    SBC $0000            ; ED 00 00 | Subtract with carry (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_13E
; Address: $E9BB41
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_13E:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $10              ; 05 10 | Logical OR with accumulator (zero page)
    ORA $061F            ; 0D 1F 06 | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BPL $07              ; 10 07 | Branch if positive
    BPL $07              ; 10 07 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($AA,X)          ; 01 AA | Logical OR with accumulator ((zero page,X))
    INC $10              ; E6 10 | Increment (zero page)
    PEA #$4B9C           ; F4 9C 4B | Push effective address to stack
    BVC $F2              ; 50 F2 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF F8 FF 00 | Load from absolute long,X into accumulator
    BPL $EF              ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_13F
; Address: $E9BB7B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_13F:
    BCS $47              ; B0 47 | Branch if carry set
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $1443,X          ; BC 43 14 | Load from absolute,X into Y register
    ORA $1102,X          ; 1D 02 11 | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $0C              ; 05 0C | Logical OR with accumulator (zero page)
    ORA ($18,X)          ; 01 18 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $90F4FB          ; 8F FB F4 90 | Store accumulator to absolute long address
    STA $609F00          ; 8F 00 9F 60 | Store accumulator to absolute long address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_140
; Address: $E9BBC2
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_140:
    BIT #$F9             ; 89 F9 | Test bits in accumulator (immediate)
    ORA $A87E,Y          ; 19 7E A8 | Logical OR with accumulator (absolute,Y)
    BVC $2D              ; 50 2D | Branch if overflow clear
    BRA $B9              ; 80 B9 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    RTI                  ; 40 | Return from interrupt
    BPL $7C              ; 10 7C | Branch if positive
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    SBC $7900,X          ; FD 00 79 | Subtract with carry (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    BNE $00              ; D0 00 | Branch if not equal
    SEC                  ; 38 | Set carry flag
    INC $17              ; E6 17 | Increment (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BIT $FF00            ; 2C 00 FF | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set
    TYA                  ; 98 | Transfer Y register to accumulator
    BEQ $70              ; F0 70 | Branch if equal
    JMP ($6FE0)          ; 6C E0 6F | Jump to address (absolute indirect)
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    STA $609F00          ; 8F 00 9F 60 | Store accumulator to absolute long address
    STA                  ; 9F 40 9F 00 | Store accumulator to absolute long,X
    STA                  ; 9F 40 01 00 | Store accumulator to absolute long,X
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($53,X)          ; 01 53 | Logical OR with accumulator ((zero page,X))
    LDA #$A3             ; A9 A3 | Load immediate value into accumulator
    EOR $F903,Y          ; 59 03 F9 | Exclusive OR with accumulator (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    CPY #$18             ; C0 18 | Compare Y register (immediate)
    SBC $FEF8,Y          ; F9 F8 FE | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_141
; Address: $E9BC67
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_141:
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    BRA $01              ; 80 01 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $7A              ; 80 7A | Branch always
    CMP ($3A,X)          ; C1 3A | Compare accumulator ((zero page,X))
    LDA ($9A,X)          ; A1 9A | Load from (zero page,X) into accumulator
    SBC #$E2             ; E9 E2 | Subtract with carry (immediate)
    SBC $01FA,Y          ; F9 FA 01 | Subtract with carry (absolute,Y)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BRA $07              ; 80 07 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    INX                  ; E8 | Increment X register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_142
; Address: $E9BCBC
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_142:
    JSR $1800            ; 20 00 18 | Jump to subroutine
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ORA ($0A,X)          ; 01 0A | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    ORA $1800            ; 0D 00 18 | Logical OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    CPX #$6F             ; E0 6F | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    AND $443D,X          ; 3D 3D 44 | Logical AND with accumulator (absolute,X)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    BRA $6A              ; 80 6A | Branch always
    SED                  ; F8 | Set decimal mode flag
    PEA #$FBF4           ; F4 F4 FB | Push effective address to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_143
; Address: $E9BD0B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_143:
    STA                  ; 9F 09 36 42 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    SBC $A459,X          ; FD 59 A4 | Subtract with carry (absolute,X)
    TXA                  ; 8A | Transfer X register to accumulator
    STZ $00              ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank52_DmaFunction_144
; Address: $E9BD31
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_144:
    TXA                  ; 8A | Transfer X register to accumulator
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    LDY $5B              ; A4 5B | Load from zero page into Y register
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    INY                  ; C8 | Increment Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC $FFFE,X          ; FD FE FF | Subtract with carry (absolute,X)
    LDA ($B1),Y          ; B1 B1 | Load from (zero page),Y into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LSR $FF00            ; 4E 00 FF | Logical shift right (absolute)
    ROR $55              ; 66 55 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_145
; Address: $E9BD88
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_145:
    JSL $9988EE          ; 22 EE 88 99 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $526C            ; 0D 6C 52 | Logical OR with accumulator (absolute)
    BIT $EC              ; 24 EC | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    STZ $0F05            ; 9C 05 0F | Store zero to absolute
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    SBC ($87),Y          ; F1 87 | Subtract with carry ((zero page),Y)
    SBC $FE12,Y          ; F9 12 FE | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    SBC ($74),Y          ; F1 74 | Subtract with carry ((zero page),Y)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    BCS $36              ; B0 36 | Branch if carry set
    ROL $3918            ; 2E 18 39 | Rotate left (absolute)
    BRA $D0              ; 80 D0 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $57              ; 80 57 | Branch always
    INX                  ; E8 | Increment X register
    STA                  ; 9F 41 7F E6 | Store accumulator to absolute long,X
    STA $009737          ; 8F 37 97 00 | Store accumulator to absolute long address
    LDA                  ; BF BF 40 40 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_148
; Address: $E9BE06
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_148:
    BPL $10              ; 10 10 | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_149
; Address: $E9BE1D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_149:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $40              ; 80 40 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_14A
; Address: $E9BE4D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_14A:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_14B
; Address: $E9BE5A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_14B:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $3FF1            ; 0E F1 3F | Arithmetic shift left (absolute)
    CPY #$0F             ; C0 0F | Compare Y register (immediate)
    BCS $19              ; B0 19 | Branch if carry set
    LDX $1F              ; A6 1F | Load from zero page into X register
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCS $9F              ; B0 9F | Branch if carry set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_14C
; Address: $E9BE7F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_14C:
    JSR $0001            ; 20 01 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SBC $7C04,Y          ; F9 04 7C | Subtract with carry (absolute,Y)
    CMP $0000            ; CD 00 00 | Compare accumulator (absolute)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_14D
; Address: $E9BEC9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_14D:
    ORA $160B,X          ; 1D 0B 16 | Logical OR with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $1601,X          ; 1D 01 16 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    BRA $E0              ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank52_DmaFunction_14E
; Address: $E9BEE2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_14E:
    JSR $2030            ; 20 30 20 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    BRA $A8              ; 80 A8 | Branch always
    BMI $E8              ; 30 E8 | Branch if negative
    LDY #$90             ; A0 90 | Load immediate value into Y register
    BRA $E0              ; 80 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_14F
; Address: $E9BEF2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_14F:
    BNE $00              ; D0 00 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    CPY #$58             ; C0 58 | Compare Y register (immediate)
    BRA $70              ; 80 70 | Branch always
    BRA $60              ; 80 60 | Branch always
    BRA $18              ; 80 18 | Branch always
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ORA $1F18,Y          ; 19 18 1F | Logical OR with accumulator (absolute,Y)
    ORA $171C,Y          ; 19 1C 17 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CPX $F4              ; E4 F4 | Compare X register (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $08              ; E6 08 | Increment (zero page)
    NOP                  ; EA | No operation
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ADC #$F9             ; 69 F9 | Add with carry (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    DEC $28              ; C6 28 | Decrement (zero page)
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ASL $0707            ; 0E 07 07 | Arithmetic shift left (absolute)
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    INC $11              ; E6 11 | Increment (zero page)
    CLC                  ; 18 | Clear carry flag
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BPL $82              ; 10 82 | Branch if positive
    ADC $00FF,X          ; 7D FF 00 | Add with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA #$01             ; 09 01 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_150
; Address: $E9BF46
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_150:
    ORA $1F18,Y          ; 19 18 1F | Logical OR with accumulator (absolute,Y)
    ORA $171C,Y          ; 19 1C 17 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    NOP                  ; EA | No operation
    ORA $86              ; 05 86 | Logical OR with accumulator (zero page)
    ADC #$F9             ; 69 F9 | Add with carry (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    PLP                  ; 28 | Pull processor status from stack
    RTI                  ; 40 | Return from interrupt
    STA $000850          ; 8F 50 08 00 | Store accumulator to absolute long address
    XBA                  ; EB | Exchange accumulator bytes
    BPL $AB              ; 10 AB | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    BVC $AF              ; 50 AF | Branch if overflow clear
    BPL $EF              ; 10 EF | Branch if positive
    STA $000900          ; 8F 00 09 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank52_DmaFunction_151
; Address: $E9BF85
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_151:
    JSR $8500            ; 20 00 85 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    STA $F60970          ; 8F 70 09 F6 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank52_DmaFunction_152
; Address: $E9BF94
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_152:
    JSR $85DF            ; 20 DF 85 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $1A0C            ; 0D 0C 1A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0517            ; 0D 17 05 | Logical OR with accumulator (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA ($0C,X)          ; 01 0C | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    BCS $30              ; B0 30 | Branch if carry set
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $38              ; 10 38 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    BCC $C8              ; 90 C8 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_153
; Address: $E9BFCF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_153:
    BNE $40              ; D0 40 | Branch if not equal
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $50              ; 80 50 | Branch always
    BRA $E8              ; 80 E8 | Branch always
    BRA $68              ; 80 68 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_154
; Address: $E9BFD9
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_154:
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    CPY #$78             ; C0 78 | Compare Y register (immediate)
    BRA $30              ; 80 30 | Branch always
    BRA $00              ; 80 00 | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    STA $0000,X          ; 9D 00 00 | Store accumulator to absolute,X
    EOR ($AE),Y          ; 51 AE | Exclusive OR with accumulator ((zero page),Y)
    ORA $1DA6,Y          ; 19 A6 1D | Logical OR with accumulator (absolute,Y)
    SEP #$00             ; E2 00 | Set processor status bits
    ROR $55              ; 66 55 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_155
; Address: $E9C00A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_155:
    JSL $9989EE          ; 22 EE 89 99 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ROR $55              ; 66 55 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_156
; Address: $E9C02C
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_156:
    JSL $9989EE          ; 22 EE 89 99 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    ORA ($FF),Y          ; 11 FF | Logical OR with accumulator ((zero page),Y)
    ROR $FF              ; 66 FF | Rotate right (zero page)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ORA $1B0D            ; 0D 0D 1B | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($16,X)          ; 01 16 | Logical OR with accumulator ((zero page,X))
    ORA ($15,X)          ; 01 15 | Logical OR with accumulator ((zero page,X))
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ASL $0500            ; 0E 00 05 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    BCS $B0              ; B0 B0 | Branch if carry set
    CLD                  ; D8 | Clear decimal mode flag
    BPL $38              ; 10 38 | Branch if positive
    BMI $58              ; 30 58 | Branch if negative
    BVC $C8              ; 50 C8 | Branch if overflow clear
    LDY #$90             ; A0 90 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $50              ; 80 50 | Branch always
    BRA $68              ; 80 68 | Branch always
    BRA $A8              ; 80 A8 | Branch always
    BRA $68              ; 80 68 | Branch always
    CLV                  ; B8 | Clear overflow flag
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_157
; Address: $E9C082
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_157:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INC $CFF6,X          ; FE F6 CF | Increment (absolute,X)
    ORA #$7B             ; 09 7B | Logical OR with accumulator (immediate)
    AND $3BC8,Y          ; 39 C8 3B | Logical AND with accumulator (absolute,Y)
    SBC ($0C),Y          ; F1 0C | Subtract with carry ((zero page),Y)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$4E             ; 09 4E | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_158
; Address: $E9C097
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_158:
    JSR $00F6            ; 20 F6 00 | Jump to subroutine
    CPY $33              ; C4 33 | Compare Y register (zero page)
    BEQ $0E              ; F0 0E | Branch if equal
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    XBA                  ; EB | Exchange accumulator bytes
    BCC $FE              ; 90 FE | Branch if carry clear
    STX $9F21            ; 8E 21 9F | Store X register to absolute address
    PLP                  ; 28 | Pull processor status from stack
    EOR $1400,Y          ; 59 00 14 | Exclusive OR with accumulator (absolute,Y)
    XBA                  ; EB | Exchange accumulator bytes
    BCC $62              ; 90 62 | Branch if carry clear
    ORA #$D6             ; 09 D6 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_159
; Address: $E9C0BD
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_159:
    JSR $00FE            ; 20 FE 00 | Jump to subroutine
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    BEQ $C3              ; F0 C3 | Branch if equal
    SBC $BCC0,X          ; FD C0 BC | Subtract with carry (absolute,X)
    LDX $BF3E,Y          ; BE 3E BF | Load from absolute,Y into X register
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FB              ; F0 FB | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $4C              ; F0 4C | Branch if equal
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    ORA $1EE3,X          ; 1D E3 1E | Logical OR with accumulator (absolute,X)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    STA                  ; 9F E7 9F E4 | Store accumulator to absolute long,X
    AND #$2D             ; 29 2D | Logical AND with accumulator (immediate)
    AND #$0D             ; 29 0D | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    AND $1DC0,X          ; 3D C0 1D | Logical AND with accumulator (absolute,X)
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    SBC ($A8,X)          ; E1 A8 | Subtract with carry ((zero page,X))
    INX                  ; E8 | Increment X register
    SBC $FAE5,Y          ; F9 E5 FA | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_15A
; Address: $E9C169
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_15A:
    SBC $B593            ; ED 93 B5 | Subtract with carry (absolute)
    SEC                  ; 38 | Set carry flag
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    LDA $BF02,X          ; BD 02 BF | Load from absolute,X into accumulator
    STY $00              ; 84 00 | Store Y register to zero page
    ADC ($73),Y          ; 71 73 | Add with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    AND $8C70            ; 2D 70 8C | Logical AND with accumulator (absolute)
    LDX $9F3E,Y          ; BE 3E 9F | Load from absolute,Y into X register
    STY $8C00            ; 8C 00 8C | Store Y register to absolute address
    STY $8F00            ; 8C 00 8F | Store Y register to absolute address
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FBF0,Y          ; F9 F0 FB | Subtract with carry (absolute,Y)
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    EOR $7E40            ; 4D 40 7E | Exclusive OR with accumulator (absolute)
    INC $FE2C,X          ; FE 2C FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 01 00 | Load from absolute long,X into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $34              ; 84 34 | Store Y register to zero page
    BMI $43              ; 30 43 | Branch if negative
    STY $3F              ; 84 3F | Store Y register to zero page
    CPY #$41             ; C0 41 | Compare Y register (immediate)
    BRA $41              ; 80 41 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $B3              ; 10 B3 | Branch if positive
    STY $808C            ; 8C 8C 80 | Store Y register to absolute address
    BRA $D0              ; 80 D0 | Branch always
    BNE $F7              ; D0 F7 | Branch if not equal
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    BCC $FF              ; 90 FF | Branch if carry clear
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    BRA $00              ; 80 00 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $A1FF,X          ; 9D FF A1 | Store accumulator to absolute,X
    BRA $FF              ; 80 FF | Branch always
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_15B
; Address: $E9C22F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_15B:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $3019,Y          ; 39 19 30 | Logical AND with accumulator (absolute,Y)
    AND $D93D,Y          ; 39 3D D9 | Logical AND with accumulator (absolute,Y)
    LDA $7C78,X          ; BD 78 7C | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    ORA #$29             ; 09 29 | Logical OR with accumulator (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    ROL $8F              ; 26 8F | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_15C
; Address: $E9C254
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_15C:
    AND $ADC0            ; 2D C0 AD | Logical AND with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    JMP ($CC81)          ; 6C 81 CC | Jump to address (absolute indirect)
    AND ($E8,X)          ; 21 E8 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $0F99,X          ; 9D 99 0F | Store accumulator to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    LDA ($9D),Y          ; B1 9D | Load from (zero page),Y into accumulator
    LDA $3414,X          ; BD 14 34 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    ORA $1319,X          ; 1D 19 13 | Logical OR with accumulator (absolute,X)
    STZ $F3              ; 64 F3 | Store zero to zero page
    LDA ($0E),Y          ; B1 0E | Load from (zero page),Y into accumulator
    PHB                  ; 8B | Push data bank register to stack
    AND ($86),Y          ; 31 86 | Logical AND with accumulator ((zero page),Y)
    CPX $E7              ; E4 E7 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ROL $003C,X          ; 3E 3C 00 | Rotate left (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)
    ORA $0F00            ; 0D 00 0F | Logical OR with accumulator (absolute)
    LDA                  ; BF 00 84 84 | Load from absolute long,X into accumulator
    BNE $D0              ; D0 D0 | Branch if not equal
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $1D06            ; 0E 06 1D | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ASL $0308            ; 0E 08 03 | Arithmetic shift left (absolute)
    ASL $E8              ; 06 E8 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    INC $18              ; E6 18 | Increment (zero page)
    SEP #$05             ; E2 05 | Set processor status bits
    BRA $76              ; 80 76 | Branch always
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    BCC $6D              ; 90 6D | Branch if carry clear
    BEQ $0D              ; F0 0D | Branch if equal
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_15D
; Address: $E9C2E4
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_15D:
    BPL $FF              ; 10 FF | Branch if positive
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    STY $78FF            ; 8C FF 78 | Store Y register to absolute address
    PHP                  ; 08 | Push processor status to stack
    BCC $FF              ; 90 FF | Branch if carry clear
    BCS $FF              ; B0 FF | Branch if carry set
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    INC $FF19,X          ; FE 19 FF | Increment (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    PEA #$6DDC           ; F4 DC 6D | Push effective address to stack
    DEC $FF63,X          ; DE 63 FF | Decrement (absolute,X)
    INC $FE01            ; EE 01 FE | Increment (absolute)
    SEC                  ; 38 | Set carry flag
    PEA #$6F0B           ; F4 0B 6F | Push effective address to stack
    BCC $63              ; 90 63 | Branch if carry clear
    STZ $FF00            ; 9C 00 FF | Store zero to absolute
    INC $FE11            ; EE 11 FE | Increment (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ADC $748F,X          ; 7D 8F 74 | Add with carry (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $D509,X          ; FD 09 D5 | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    AND #$D6             ; 29 D6 | Logical AND with accumulator (immediate)
    ADC $7482,X          ; 7D 82 74 | Add with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    LDY $0A              ; A4 0A | Load from zero page into Y register
    PEA #$D42B           ; F4 2B D4 | Push effective address to stack
    XBA                  ; EB | Exchange accumulator bytes
    AND #$FF             ; 29 FF | Logical AND with accumulator (immediate)
    EOR $C93D,Y          ; 59 3D C9 | Exclusive OR with accumulator (absolute,Y)
    LDA $2D29            ; AD 29 2D | Load from absolute address into accumulator
    STA $CDF5,Y          ; 99 F5 CD | Store accumulator to absolute,Y
    XBA                  ; EB | Exchange accumulator bytes
    CMP #$CD             ; C9 CD | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $40AD            ; 6E AD 40 | Rotate right (absolute)
    LDA $6D50            ; AD 50 6D | Load from absolute address into accumulator
    BCC $A5              ; 90 A5 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BPL $CF              ; 10 CF | Branch if positive
    BMI $2E              ; 30 2E | Branch if negative
    CMP ($6E),Y          ; D1 6E | Compare accumulator ((zero page),Y)
    STA ($90),Y          ; 91 90 | Store accumulator to (zero page),Y
    STA ($A7),Y          ; 91 A7 | Store accumulator to (zero page),Y
    STA ($F4),Y          ; 91 F4 | Store accumulator to (zero page),Y
    CMP ($36),Y          ; D1 36 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_15E
; Address: $E9C38E
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_15E:
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA $18              ; A5 18 | Load from zero page into accumulator
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CMP #$C4             ; C9 C4 | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    STA ($FF),Y          ; 91 FF | Store accumulator to (zero page),Y
    BCC $FF              ; 90 FF | Branch if carry clear
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ORA ($FD),Y          ; 11 FD | Logical OR with accumulator ((zero page),Y)
    ORA $00FF            ; 0D FF 00 | Logical OR with accumulator (absolute)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    STA $A1FF,X          ; 9D FF A1 | Store accumulator to absolute,X
    BRA $FF              ; 80 FF | Branch always
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    STA $BE41            ; 8D 41 BE | Store accumulator to absolute address
    BVC $AF              ; 50 AF | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    LDY $DC23,X          ; BC 23 DC | Load from absolute,X into Y register
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($0E,X)          ; 81 0E | Store accumulator to (zero page,X)
    BCS $1B              ; B0 1B | Branch if carry set
    LDY $7A              ; A4 7A | Load from zero page into Y register
    STA ($62,X)          ; 81 62 | Store accumulator to (zero page,X)
    BRA $90              ; 80 90 | Branch always
    JMP $FFFF            ; 4C FF FF | Jump to address
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    ROR                  ; 6A | Rotate right (accumulator)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    NOP                  ; EA | No operation
    INC                  ; 1A | Increment accumulator
    TSX                  ; BA | Transfer stack pointer to X register
    STX $150A            ; 8E 0A 15 | Store X register to absolute address
    ASL $0A10            ; 0E 10 0A | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    ROL $1EC1,X          ; 3E C1 1E | Rotate left (absolute,X)
    SBC ($CA,X)          ; E1 CA | Subtract with carry ((zero page,X))
    AND ($B8),Y          ; 31 B8 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_15F
; Address: $E9C441
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_15F:
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BNE $A8              ; D0 A8 | Branch if not equal
    BEQ $AB              ; F0 AB | Branch if equal
    PLB                  ; AB | Pull data bank register from stack
    PEA #$EEB6           ; F4 B6 EE | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    LDA #$D6             ; A9 D6 | Load immediate value into accumulator
    INX                  ; E8 | Increment X register
    BPL $D8              ; 10 D8 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_160
; Address: $E9C453
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_160:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    SBC $FC02,X          ; FD 02 FC | Subtract with carry (absolute,X)
    BPL $F8              ; 10 F8 | Branch if positive
    DEC $0021,X          ; DE 21 00 | Decrement (absolute,X)
    ORA $959A            ; 0D 9A 95 | Logical OR with accumulator (absolute)
    LDY $8D03,X          ; BC 03 8D | Load from absolute,X into Y register
    STY $8081            ; 8C 81 80 | Store Y register to absolute address
    CMP ($D0),Y          ; D1 D0 | Compare accumulator ((zero page),Y)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $1EE3,X          ; 1D E3 1E | Logical OR with accumulator (absolute,X)
    SBC ($F0,X)          ; E1 F0 | Subtract with carry ((zero page,X))
    STA $57EAF3          ; 8F F3 EA 57 | Store accumulator to absolute long address
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_161
; Address: $E9C495
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_161:
    JSR $609F            ; 20 9F 60 | Jump to subroutine
    LDY #$0E             ; A0 0E | Load immediate value into Y register
    SBC ($07),Y          ; F1 07 | Subtract with carry ((zero page),Y)
    BEQ $A8              ; F0 A8 | Branch if equal
    INX                  ; E8 | Increment X register
    PEA #$5BC7           ; F4 C7 5B | Push effective address to stack
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $FF              ; 30 FF | Branch if negative
    ADC $E582,X          ; 7D 82 E5 | Add with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1EE3,X          ; 1D E3 1E | Logical OR with accumulator (absolute,X)
    SBC ($F0,X)          ; E1 F0 | Subtract with carry ((zero page,X))
    NOP                  ; EA | No operation
    STX $F7              ; 86 F7 | Store X register to zero page
    STZ $FF              ; 64 FF | Store zero to zero page
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_162
; Address: $E9C4DB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_162:
    JSR $718E            ; 20 8E 71 | Jump to subroutine
    BCC $90              ; 90 90 | Branch if carry clear
    LDX $91              ; A6 91 | Load from zero page into X register
    STA $68EE,Y          ; 99 EE 68 | Store accumulator to absolute,Y
    STZ $08B7            ; 9C B7 08 | Store zero to absolute
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    LDX $19              ; A6 19 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_163
; Address: $E9C4FA
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_163:
    SBC $18              ; E5 18 | Subtract with carry (zero page)
    INC $9C11            ; EE 11 9C | Increment (absolute)
    ORA $1EE3,X          ; 1D E3 1E | Logical OR with accumulator (absolute,X)
    SBC ($F0,X)          ; E1 F0 | Subtract with carry ((zero page,X))
    CPX $75              ; E4 75 | Compare X register (zero page)
    CMP ($65),Y          ; D1 65 | Compare accumulator ((zero page),Y)
    STA ($EC,X)          ; 81 EC | Store accumulator to (zero page,X)
    PLA                  ; 68 | Pull accumulator from stack
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CMP $8D20,X          ; DD 20 8D | Compare accumulator (absolute,X)
    BVS $6C              ; 70 6C | Branch if overflow set
    STA ($D3),Y          ; 91 D3 | Store accumulator to (zero page),Y
    EOR $84FF,Y          ; 59 FF 84 | Exclusive OR with accumulator (absolute,Y)
    WDM #$FF             ; 42 FF | Reserved instruction
    RTI                  ; 40 | Return from interrupt
    BVS $A0              ; 70 A0 | Branch if overflow set
    BEQ $78              ; F0 78 | Branch if equal
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BVC $90              ; 50 90 | Branch if overflow clear
    BVC $B0              ; 50 B0 | Branch if overflow clear
    LDY #$E0             ; A0 E0 | Game work RAM access
    BRA $10              ; 80 10 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_164
; Address: $E9C552
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_164:
    JSR $2010            ; 20 10 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BRA $78              ; 80 78 | Branch always
    BRA $78              ; 80 78 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_165
; Address: $E9C560
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_165:
    STZ $1991,X          ; 9E 91 19 | Store zero to absolute,X
    BPL $39              ; 10 39 | Branch if positive
    BMI $D6              ; 30 D6 | Branch if negative
    ORA ($7A,X)          ; 01 7A | Logical OR with accumulator ((zero page,X))
    STA $81              ; 85 81 | Store accumulator to zero page
    BRA $01              ; 80 01 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($6F,X)          ; 01 6F | Logical OR with accumulator ((zero page,X))
    ASL $DCEF,X          ; 1E EF DC | Arithmetic shift left (absolute,X)
    LDA $50A7BC          ; AF BC A7 50 | Load from absolute long address into accumulator
    BMI $16              ; 30 16 | Branch if negative
    SBC ($D7,X)          ; E1 D7 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_166
; Address: $E9C597
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_166:
    JSR $8037            ; 20 37 80 | Jump to subroutine
    BVC $F6              ; 50 F6 | Branch if overflow clear
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    SBC $FD31,Y          ; F9 31 FD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_167
; Address: $E9C5A6
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_167:
    SBC $E839,Y          ; F9 39 E8 | Subtract with carry (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $FB              ; 30 FB | Branch if negative
    AND $0AE5            ; 2D E5 0A | Logical AND with accumulator (absolute)
    SBC $0A              ; E5 0A | Subtract with carry (zero page)
    STZ $06E9            ; 9C E9 06 | Store zero to absolute
    NOP                  ; EA | No operation
    DEY                  ; 88 | Decrement Y register
    SBC $F712            ; ED 12 F7 | Subtract with carry (absolute)
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    ROL $FC0F            ; 2E 0F FC | Rotate left (absolute)
    CPX $13              ; E4 13 | Compare X register (zero page)
    BCS $2F              ; B0 2F | Branch if carry set
    BNE $2E              ; D0 2E | Branch if not equal
    CMP ($FF),Y          ; D1 FF | Compare accumulator ((zero page),Y)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $1B              ; F0 1B | Branch if equal
    CPX $DF              ; E4 DF | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_168
; Address: $E9C5DF
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_168:
    JSR $F50F            ; 20 0F F5 | Jump to subroutine
    LDA #$84             ; A9 84 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHB                  ; 8B | Push data bank register to stack
    LDA $56A9            ; AD A9 56 | Load from absolute address into accumulator
    STY $FB              ; 84 FB | Store Y register to zero page
    SBC $E44D            ; ED 4D E4 | Subtract with carry (absolute)
    SBC $1D39,X          ; FD 39 1D | Subtract with carry (absolute,X)
    SBC $18FC,Y          ; F9 FC 18 | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    SBC $740D            ; ED 0D 74 | Subtract with carry (absolute)
    JMP $2FB2            ; 4C B2 2F | Jump to address
    BNE $3D              ; D0 3D | Branch if not equal
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    SEP #$DF             ; E2 DF | Set processor status bits

;------------------------------------------------------------------------------
; Bank52_DmaFunction_169
; Address: $E9C61F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_169:
    JSR $1C2F            ; 20 2F 1C | Jump to subroutine
    PEA #$E4F7           ; F4 F7 E4 | Push effective address to stack
    INC $15              ; E6 15 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_16A
; Address: $E9C631
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_16A:
    JSR $6897            ; 20 97 68 | Jump to subroutine
    BIT #$D7             ; 89 D7 | Test bits in accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    TXA                  ; 8A | Transfer X register to accumulator
    CPX #$28             ; E0 28 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    PLA                  ; 68 | Pull accumulator from stack
    ROL                  ; 2A | Rotate left (accumulator)
    SBC $2F              ; E5 2F | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_16B
; Address: $E9C64C
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_16B:
    ADC ($AE,X)          ; 61 AE | Add with carry ((zero page,X))
    SBC ($49,X)          ; E1 49 | Subtract with carry ((zero page,X))
    BPL $EB              ; 10 EB | Branch if positive
    ADC #$96             ; 69 96 | Add with carry (immediate)
    XBA                  ; EB | Exchange accumulator bytes
    BPL $EE              ; 10 EE | Branch if positive
    ORA ($ED),Y          ; 11 ED | Logical OR with accumulator ((zero page),Y)
    BPL $EE              ; 10 EE | Branch if positive
    ORA ($48),Y          ; 11 48 | Logical OR with accumulator ((zero page),Y)
    BCS $07              ; B0 07 | Branch if carry set
    BEQ $F4              ; F0 F4 | Branch if equal
    BMI $67              ; 30 67 | Branch if negative
    BNE $7F              ; D0 7F | Branch if not equal
    DEY                  ; 88 | Decrement Y register
    ASL $EBF9            ; 0E F9 EB | Arithmetic shift left (absolute)
    CPY $DB              ; C4 DB | Compare Y register (zero page)
    BIT $8B              ; 24 8B | Test bits in accumulator (zero page)
    CPX #$28             ; E0 28 | Compare X register (immediate)
    PLA                  ; 68 | Pull accumulator from stack
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $0F              ; E5 0F | Subtract with carry (zero page)
    ADC ($9E),Y          ; 71 9E | Add with carry ((zero page),Y)
    EOR ($B9),Y          ; 51 B9 | Exclusive OR with accumulator ((zero page),Y)
    BPL $EB              ; 10 EB | Branch if positive
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    BMI $CE              ; 30 CE | Branch if negative
    AND ($CD),Y          ; 31 CD | Logical AND with accumulator ((zero page),Y)
    BMI $DE              ; 30 DE | Branch if negative
    AND ($B8,X)          ; 21 B8 | Logical AND with accumulator ((zero page,X))
    LSR $4D              ; 46 4D | Logical shift right (zero page)
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    SBC $29CD,Y          ; F9 CD 29 | Subtract with carry (absolute,Y)
    CMP $5D31,X          ; DD 31 5D | Compare accumulator (absolute,X)
    SBC ($5D),Y          ; F1 5D | Subtract with carry ((zero page),Y)
    ASL $DBF1,X          ; 1E F1 DB | Arithmetic shift left (absolute,X)
    PEA #$40BD           ; F4 BD 40 | Push effective address to stack
    SBC $3D00,X          ; FD 00 3D | Subtract with carry (absolute,X)
    CPY #$35             ; C0 35 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$EF0B           ; F4 0B EF | Push effective address to stack
    BPL $3B              ; 10 3B | Branch if positive
    ADC $F758,Y          ; 79 58 F7 | Add with carry (absolute,Y)
    AND ($3D),Y          ; 31 3D | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 FF F7 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_16C
; Address: $E9C6D3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_16C:
    CPX #$F5             ; E0 F5 | Compare X register (immediate)
    BPL $A7              ; 10 A7 | Branch if positive
    INC $F301,X          ; FE 01 F3 | Increment (absolute,X)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    ADC $74FF            ; 6D FF 74 | Add with carry (absolute)
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    STY $7B              ; 84 7B | Store Y register to zero page
    ADC $7492            ; 6D 92 74 | Add with carry (absolute)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_16D
; Address: $E9C6F5
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_16D:
    JSR $D328            ; 20 28 D3 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    STY $FB              ; 84 FB | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    DEC $DF61,X          ; DE 61 DF | Decrement (absolute,X)
    ROR $927F,X          ; 7E 7F 92 | Rotate right (absolute,X)
    ORA $BF40            ; 0D 40 BF | Logical OR with accumulator (absolute)
    INY                  ; C8 | Increment Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    ROR $9281,X          ; 7E 81 92 | Rotate right (absolute,X)
    ADC $F20D            ; 6D 0D F2 | Add with carry (absolute)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    SBC $74FF            ; ED FF 74 | Subtract with carry (absolute)
    LDA #$84             ; A9 84 | Load immediate value into accumulator
    SBC $7412            ; ED 12 74 | Subtract with carry (absolute)
    PHB                  ; 8B | Push data bank register to stack
    LDA $56A9            ; AD A9 56 | Load from absolute address into accumulator
    STY $FB              ; 84 FB | Store Y register to zero page
    CLD                  ; D8 | Clear decimal mode flag
    DEC $DF61,X          ; DE 61 DF | Decrement (absolute,X)
    ROR $927F,X          ; 7E 7F 92 | Rotate right (absolute,X)
    ORA $BF40            ; 0D 40 BF | Logical OR with accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC ($9E,X)          ; 61 9E | Add with carry ((zero page,X))
    ROR $9281,X          ; 7E 81 92 | Rotate right (absolute,X)
    ADC $F20D            ; 6D 0D F2 | Add with carry (absolute)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    STA $01              ; 85 01 | Store accumulator to zero page
    ORA $CBCB            ; 0D CB CB | Logical OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $01              ; 80 01 | Branch always
    STY $88              ; 84 88 | Store Y register to zero page
    INC $FA00,X          ; FE 00 FA | Increment (absolute,X)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_16E
; Address: $E9C788
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_16E:
    LDY #$80             ; A0 80 | Load immediate value into Y register
    BCS $D7              ; B0 D7 | Branch if carry set
    BRA $20              ; 80 20 | Branch always
    BPL $4C              ; 10 4C | Branch if positive
    ADC $5F02,X          ; 7D 02 5F | Add with carry (absolute,X)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ORA #$11             ; 09 11 | Logical OR with accumulator (immediate)
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_16F
; Address: $E9C7A7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_16F:
    JSR $2029            ; 20 29 20 | Jump to subroutine
    ROL $19              ; 26 19 | Rotate left (zero page)
    AND #$1F             ; 29 1F | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_170
; Address: $E9C7AF
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_170:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $363F,Y          ; 19 3F 36 | Logical OR with accumulator (absolute,Y)
    LSR $8646            ; 4E 46 86 | Logical shift right (absolute)
    TSX                  ; BA | Transfer stack pointer to X register
    BRA $BA              ; 80 BA | Branch always
    DEC $FD04            ; CE 04 FD | Decrement (absolute)
    SBC $9EFC,X          ; FD FC 9E | Subtract with carry (absolute,X)
    CMP $CF82            ; CD 82 CF | Compare accumulator (absolute)
    SEC                  ; 38 | Set carry flag
    ROR $FE7C,X          ; 7E 7C FE | Rotate right (absolute,X)
    ROR $FAFE,X          ; 7E FE FA | Rotate right (absolute,X)
    INC $FF02,X          ; FE 02 FF | Increment (absolute,X)
    WDM #$00             ; 42 00 | Reserved instruction
    AND $2100,Y          ; 39 00 21 | PPU graphics register access
    BIT $0C04            ; 2C 04 0C | Test bits in accumulator (absolute)
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_174
; Address: $E9C814
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_174:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    CMP $F900,X          ; DD 00 F9 | Compare accumulator (absolute,X)
    PHX                  ; DA | Push X register to stack
    ORA $2902,X          ; 1D 02 29 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_175
; Address: $E9C844
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_175:
    JSR $4107            ; 20 07 41 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $3C00            ; 0E 00 3C | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    STZ $64              ; 64 64 | Store zero to zero page
    BVC $50              ; 50 50 | Branch if overflow clear
    EOR $45              ; 45 45 | Exclusive OR with accumulator (zero page)
    BIT $412C            ; 2C 2C 41 | Test bits in accumulator (absolute)
    EOR ($4B,X)          ; 41 4B | Exclusive OR with accumulator ((zero page,X))
    STY $00              ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank52_DmaFunction_176
; Address: $E9C876
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_176:
    LDA $00BA00          ; AF 00 BA 00 | Load from absolute long address into accumulator
    LDX $B400,Y          ; BE 00 B4 | Load from absolute,Y into X register
    AND #$06             ; 29 06 | Logical AND with accumulator (immediate)
    AND $4F78            ; 2D 78 4F | Logical AND with accumulator (absolute)
    STZ $BF9F            ; 9C 9F BF | Store zero to absolute
    STA ($F3),Y          ; 91 F3 | Store accumulator to (zero page),Y
    BCC $CF              ; 90 CF | Branch if carry clear
    SEI                  ; 78 | Set interrupt disable flag
    ROR $6FFF            ; 6E FF 6F | Rotate right (absolute)
    PLY                  ; 7A | Pull Y register from stack
    CMP $30              ; C5 30 | Compare accumulator (zero page)
    INC $FC40,X          ; FE 40 FC | Increment (absolute,X)
    BVS $F8              ; 70 F8 | Branch if overflow set
    BEQ $38              ; F0 38 | Branch if equal
    LDY #$30             ; A0 30 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_177
; Address: $E9C8AD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_177:
    BMI $E0              ; 30 E0 | Game work RAM access
    BEQ $BF              ; F0 BF | Branch if equal
    DEC $BCFE            ; CE FE BC | Decrement (absolute)
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BNE $F0              ; D0 F0 | Branch if not equal
    BNE $F0              ; D0 F0 | Branch if not equal
    BPL $F0              ; 10 F0 | Branch if positive
    ASL $4604            ; 0E 04 46 | Arithmetic shift left (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$00             ; 42 00 | Reserved instruction
    BMI $20              ; 30 20 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_178
; Address: $E9C8E3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_178:
    JSR $2070            ; 20 70 20 | Jump to subroutine
    BVS $20              ; 70 20 | Branch if overflow set
    BVC $00              ; 50 00 | Branch if overflow clear
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_179
; Address: $E9C8EC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_179:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_17A
; Address: $E9C8FC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_17A:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ROL $3A3E            ; 2E 3E 3A | Rotate left (absolute)
    DEC                  ; 3A | Decrement accumulator
    ROR $8A3E            ; 6E 3E 8A | Rotate right (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_17B
; Address: $E9C90A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_17B:
    STA $977F,X          ; 9D 7F 97 | Store accumulator to absolute,X
    ORA ($38,X)          ; 01 38 | Logical OR with accumulator ((zero page,X))
    ORA $38              ; 05 38 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVS $01              ; 70 01 | Branch if overflow set
    BVS $14              ; 70 14 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_17C
; Address: $E9C919
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_17C:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$28             ; C0 28 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STY $FF              ; 84 FF | Store Y register to zero page
    LDA $BBFD            ; AD FD BB | Load from absolute address into accumulator
    ROR $EDAD,X          ; 7E AD ED | Rotate right (absolute,X)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CPY $80              ; C4 80 | Compare Y register (zero page)
    ROR $1B40,X          ; 7E 40 1B | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_17D
; Address: $E9C948
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_17D:
    JSL $232623          ; 22 23 26 23 | Jump to subroutine long
    ORA $7F23,X          ; 1D 23 7F | Logical OR with accumulator (absolute,X)
    STZ $7F              ; 64 7F | Store zero to zero page
    ORA $1D3F,X          ; 1D 3F 1D | Logical OR with accumulator (absolute,X)
    AND $3E3F,X          ; 3D 3F 3E | Logical AND with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_17E
; Address: $E9C961
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_17E:
    BEQ $B0              ; F0 B0 | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    LDY $9CF0,X          ; BC F0 9C | Load from absolute,X into Y register
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal
    BCC $F0              ; 90 F0 | Branch if carry clear
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    STZ $FC              ; 64 FC | Store zero to zero page
    CPX $FC              ; E4 FC | Compare X register (zero page)
    JMP ($E8FC)          ; 6C FC E8 | Jump to address (absolute indirect)
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    BNE $00              ; D0 00 | Branch if not equal
    JMP $3604            ; 4C 04 36 | Jump to address
    EOR $001C,X          ; 5D 1C 00 | Exclusive OR with accumulator (absolute,X)
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_180
; Address: $E9C9B0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_180:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    INC $EEB6            ; EE B6 EE | Increment (absolute)
    CPX $CDBE            ; EC BE CD | Compare X register (absolute)
    LDY $DCA7,X          ; BC A7 DC | Load from absolute,X into Y register
    XBA                  ; EB | Exchange accumulator bytes
    AND $59FF            ; 2D FF 59 | Logical AND with accumulator (absolute)
    EOR $53FF,Y          ; 59 FF 53 | Exclusive OR with accumulator (absolute,Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_181
; Address: $E9C9E1
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_181:
    ROL $3E70,X          ; 3E 70 3E | Rotate left (absolute,X)
    ROL $3E44,X          ; 3E 44 3E | Rotate left (absolute,X)
    CPY $D83A            ; CC 3A D8 | Compare Y register (absolute)
    SEP #$1E             ; E2 1E | Set processor status bits
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    DEC $CEFE,X          ; DE FE CE | Decrement (absolute,X)
    INC $FEEA,X          ; FE EA FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $FEF6,X          ; FE F6 FE | Increment (absolute,X)
    ROL $E0FE,X          ; 3E FE E0 | Game work RAM access
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA                  ; BF BF 7A 7A | Load from absolute long,X into accumulator
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    SBC $80              ; E5 80 | Subtract with carry (zero page)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page
    CMP $AEC5            ; CD C5 AE | Compare accumulator (absolute)
    LDX $0A              ; A6 0A | Load from zero page into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR $00              ; 45 00 | Exclusive OR with accumulator (zero page)
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    BVC $00              ; 50 00 | Branch if overflow clear
    PEA #$AF00           ; F4 00 AF | Push effective address to stack
    STA                  ; 9F 9F BE BE | Store accumulator to absolute long,X
    SBC $FBFD,X          ; FD FD FB | Subtract with carry (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_182
; Address: $E9CA4A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_182:
    INC $3F1E,X          ; FE 1E 3F | Increment (absolute,X)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_183
; Address: $E9CA54
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_183:
    SBC ($A0,X)          ; E1 A0 | Subtract with carry ((zero page,X))
    DEX                  ; CA | Decrement X register
    INY                  ; C8 | Increment Y register
    JMP ($1968)          ; 6C 68 19 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    ASL $0D0E            ; 0E 0E 0D | Arithmetic shift left (absolute)
    ORA $0102            ; 0D 02 01 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $26              ; 06 26 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_186
; Address: $E9CA86
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_186:
    ASL $7538            ; 0E 38 75 | Arithmetic shift left (absolute)
    PLX                  ; FA | Pull X register from stack
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_187
; Address: $E9CA93
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_187:
    JSR $9860            ; 20 60 98 | Jump to subroutine
    SEC                  ; 38 | Set carry flag
    DEC $0C              ; C6 0C | Decrement (zero page)
    AND #$43             ; 29 43 | Logical AND with accumulator (immediate)
    LDY $CF30,X          ; BC 30 CF | Load from absolute,X into Y register
    ROL $C900,X          ; 3E 00 C9 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPX $A4C4            ; EC C4 A4 | Compare X register (absolute)
    CPY #$16             ; C0 16 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_188
; Address: $E9CAAF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_188:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ROL $F708,X          ; 3E 08 F7 | Rotate left (absolute,X)
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_189
; Address: $E9CABE
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_189:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPX #$40             ; E0 40 | Compare X register (immediate)
    BCS $20              ; B0 20 | Branch if carry set
    BRA $00              ; 80 00 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    BNE $E3              ; D0 E3 | Branch if not equal
    LDX $FEEF,Y          ; BE EF FE | Load from absolute,Y into X register
    BMI $CF              ; 30 CF | Branch if negative
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BEQ $0C              ; F0 0C | Branch if equal
    ASL $38E6,X          ; 1E E6 38 | Arithmetic shift left (absolute,X)
    CPX $0C              ; E4 0C | Compare X register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_18A
; Address: $E9CB0F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_18A:
    LDA                  ; BF FC 50 FE | Load from absolute long,X into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    SBC $9FFD,X          ; FD FD 9F | Subtract with carry (absolute,X)
    STZ $E5EE,X          ; 9E EE E5 | Store zero to absolute,X
    SBC $FFB2,X          ; FD B2 FF | Subtract with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_18B
; Address: $E9CB2A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_18B:
    SBC $4F02,X          ; FD 02 4F | Subtract with carry (absolute,X)
    BCS $B4              ; B0 B4 | Branch if carry set
    STA ($6E,X)          ; 81 6E | Store accumulator to (zero page,X)
    ASL $6474            ; 0E 74 64 | Arithmetic shift left (absolute)
    BCS $B0              ; B0 B0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_18E
; Address: $E9CB40
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_18E:
    EOR $C83D,Y          ; 59 3D C8 | Exclusive OR with accumulator (absolute,Y)
    LDY $2E28            ; AC 28 2E | Load from absolute address into Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CMP $EFEB            ; CD EB EF | Compare accumulator (absolute)
    CMP #$CD             ; C9 CD | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $40AD            ; 6E AD 40 | Rotate right (absolute)
    LDY $6E51            ; AC 51 6E | Load from absolute address into Y register
    STA ($A6),Y          ; 91 A6 | Store accumulator to (zero page),Y
    ORA #$EF             ; 09 EF | Logical OR with accumulator (immediate)
    BPL $CF              ; 10 CF | Branch if positive
    BMI $2E              ; 30 2E | Branch if negative
    CMP ($6E),Y          ; D1 6E | Compare accumulator ((zero page),Y)
    STA ($90),Y          ; 91 90 | Store accumulator to (zero page),Y
    PEA #$E791           ; F4 91 E7 | Push effective address to stack
    STA ($F4),Y          ; 91 F4 | Store accumulator to (zero page),Y
    CMP ($36),Y          ; D1 36 | Compare accumulator ((zero page),Y)
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $18              ; E5 18 | Subtract with carry (zero page)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CMP #$C4             ; C9 C4 | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    EOR $28              ; 45 28 | Exclusive OR with accumulator (zero page)
    LDA $48              ; A5 48 | Load from zero page into accumulator
    JMP ($7CCB)          ; 6C CB 7C | Jump to address (absolute indirect)
    BVC $30              ; 50 30 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_18F
; Address: $E9CB94
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_18F:
    JSR $404F            ; 20 4F 40 | Jump to subroutine
    LDA $789F60          ; AF 60 9F 78 | Load from absolute long address into accumulator
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    SBC #$10             ; E9 10 | Subtract with carry (immediate)
    BRA $04              ; 80 04 | Branch always
    SED                  ; F8 | Set decimal mode flag
    STZ $E760,X          ; 9E 60 E7 | Store zero to absolute,X
    DEX                  ; CA | Decrement X register
    ROL $9898,X          ; 3E 98 98 | Rotate left (absolute,X)
    PEA #$00F0           ; F4 F0 00 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ASL $98F1            ; 0E F1 98 | Arithmetic shift left (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    DEC                  ; 3A | Decrement accumulator
    CPY $33              ; C4 33 | Compare Y register (zero page)
    BMI $FA              ; 30 FA | Branch if negative
    INC $3B3B,X          ; FE 3B 3B | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_190
; Address: $E9CBC8
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_190:
    INC $4FFE,X          ; FE FE 4F | Increment (absolute,X)
    BMI $CF              ; 30 CF | Branch if negative
    INC $3B01,X          ; FE 01 3B | Increment (absolute,X)
    CPY $FE              ; C4 FE | Compare Y register (zero page)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BRA $03              ; 80 03 | Branch always
    SED                  ; F8 | Set decimal mode flag
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    BRA $04              ; 80 04 | Branch always
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BIT $9C9A            ; 2C 9A 9C | Test bits in accumulator (absolute)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $7C              ; 80 7C | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_191
; Address: $E9CBFA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_191:
    JSR $98DC            ; 20 DC 98 | Jump to subroutine
    ROR $C4              ; 66 C4 | Rotate right (zero page)
    BVS $7F              ; 70 7F | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 66 FF 0F | Store accumulator to absolute long,X
    PLX                  ; FA | Pull X register from stack
    STZ $003F,X          ; 9E 3F 00 | Store zero to absolute,X
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_192
; Address: $E9CC17
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_192:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    INC $08              ; E6 08 | Increment (zero page)
    BPL $EC              ; 10 EC | Branch if positive
    ASL $CCF2            ; 0E F2 CC | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    ROL $28FF,X          ; 3E FF 28 | Rotate left (absolute,X)
    BPL $FE              ; 10 FE | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    CPY $44              ; C4 44 | Compare Y register (zero page)
    CMP $584D            ; CD 4D 58 | Compare accumulator (absolute)
    STA                  ; 9F 58 B8 A6 | Store accumulator to absolute long,X
    ROR $708F,X          ; 7E 8F 70 | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_193
; Address: $E9CC5E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_193:
    STA                  ; 9F 00 2C 10 | Store accumulator to absolute long,X
    CPX $F3              ; E4 F3 | Compare X register (zero page)
    SEP #$75             ; E2 75 | Set processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_194
; Address: $E9CC69
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_194:
    SBC $CE              ; E5 CE | Subtract with carry (zero page)
    ORA $3E33            ; 0D 33 3E | Logical OR with accumulator (absolute)
    ASL $02FE            ; 0E FE 02 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $9F00,X          ; 1D 00 9F | Logical OR with accumulator (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC $5E00,Y          ; F9 00 5E | Subtract with carry (absolute,Y)
    CPY $2FA8            ; CC A8 2F | Compare Y register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    STA                  ; 9F F8 CE E9 | Store accumulator to absolute long,X
    CPX $CFCB            ; EC CB CF | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    ROR $40AE            ; 6E AE 40 | Rotate right (absolute)
    LDY $6C50            ; AC 50 6C | Load from absolute address into Y register
    LDA $10EF00          ; AF 00 EF 10 | Load from absolute long address into accumulator
    BMI $2C              ; 30 2C | Branch if negative
    ROR $7091            ; 6E 91 70 | Rotate right (absolute)
    PEA #$3114           ; F4 14 31 | Push effective address to stack
    AND ($D4),Y          ; 31 D4 | Logical AND with accumulator ((zero page),Y)
    SBC ($16),Y          ; F1 16 | Subtract with carry ((zero page),Y)
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register
    PHP                  ; 08 | Push processor status to stack
    ORA #$37             ; 09 37 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    CMP #$C4             ; C9 C4 | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_195
; Address: $E9CCD5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_195:
    BMI $07              ; 30 07 | Branch if negative
    SEC                  ; 38 | Set carry flag
    STZ $1B              ; 64 1B | Store zero to zero page
    CPY $FFFC            ; CC FC FF | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $2D              ; 80 2D | Branch always
    CMP ($31),Y          ; D1 31 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_196
; Address: $E9CD06
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_196:
    BRA $60              ; 80 60 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPX #$F7             ; E0 F7 | Compare X register (immediate)
    SBC $C3F3,Y          ; F9 F3 C3 | Subtract with carry (absolute,Y)
    BEQ $13              ; F0 13 | Branch if equal
    CPX $EE11            ; EC 11 EE | Compare X register (absolute)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    REP #$6B             ; C2 6B | Reset processor status bits
    WDM #$F1             ; 42 F1 | Reserved instruction
    CPX $C3              ; E4 C3 | Compare X register (zero page)
    SEC                  ; 38 | Set carry flag
    BCC $FF              ; 90 FF | Branch if carry clear
    BVC $CE              ; 50 CE | Branch if overflow clear
    LDY #$9E             ; A0 9E | Load immediate value into Y register
    REP #$3D             ; C2 3D | Reset processor status bits
    SEP #$1D             ; E2 1D | Set processor status bits
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    BRA $7E              ; 80 7E | Branch always
    CLC                  ; 18 | Clear carry flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    SEP #$DC             ; E2 DC | Set processor status bits
    INY                  ; C8 | Increment Y register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    STZ $9F6F,X          ; 9E 6F 9F | Store zero to absolute,X
    SBC ($63),Y          ; F1 63 | Subtract with carry ((zero page),Y)
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    ASL $FF00            ; 0E 00 FF | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA $1EE3,X          ; 1D E3 1E | Logical OR with accumulator (absolute,X)
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    STA                  ; 9F E7 9F E7 | Store accumulator to absolute long,X
    AND #$2F             ; 29 2F | Logical AND with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND $FF1C,X          ; 3D 1C FF | Logical AND with accumulator (absolute,X)
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    SBC $FAE5,Y          ; F9 E5 FA | Subtract with carry (absolute,Y)
    AND $95F3            ; 2D F3 95 | Logical AND with accumulator (absolute)
    PEA #$BC54           ; F4 54 BC | Push effective address to stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_197
; Address: $E9CDB4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_197:
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    AND ($05,X)          ; 21 05 | Logical AND with accumulator ((zero page,X))
    ADC $1B              ; 65 1B | Add with carry (zero page)
    ORA $67              ; 05 67 | Logical OR with accumulator (zero page)
    ORA $0075,X          ; 1D 75 00 | Logical OR with accumulator (absolute,X)
    ROL $7A01,X          ; 3E 01 7A | Rotate left (absolute,X)
    ORA $0F70            ; 0D 70 0F | Logical OR with accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    ROR                  ; 6A | Rotate right (accumulator)
    EOR $5606,Y          ; 59 06 56 | Exclusive OR with accumulator (absolute,Y)
    ORA ($57,X)          ; 01 57 | Logical OR with accumulator ((zero page,X))
    JMP ($6F2C)          ; 6C 2C 6F | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_198
; Address: $E9CDEB
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_198:
    JSR $3474            ; 20 74 34 | Jump to subroutine
    BIT $2053            ; 2C 53 20 | Test bits in accumulator (absolute)
    AND $67C1,Y          ; 39 C1 67 | Logical AND with accumulator (absolute,Y)
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ASL $FA1E,X          ; 1E 1E FA | Arithmetic shift left (absolute,X)
    SBC $F2E5,X          ; FD E5 F2 | Subtract with carry (absolute,X)
    LDA #$E6             ; A9 E6 | Load immediate value into accumulator
    BEQ $00              ; F0 00 | Branch if equal
    ASL $FCE1,X          ; 1E E1 FC | Arithmetic shift left (absolute,X)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    LDY $5A              ; A4 5A | Load from zero page into Y register
    CPY $0A              ; C4 0A | Compare Y register (zero page)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INY                  ; C8 | Increment Y register
    INC                  ; 1A | Increment accumulator
    CPX #$06             ; E0 06 | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BPL $EE              ; 10 EE | Branch if positive
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FA04,X          ; FE 04 FA | Increment (absolute,X)
    INC $FF80,X          ; FE 80 FF | Increment (absolute,X)
    BVS $BF              ; 70 BF | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BEQ $1F              ; F0 1F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_199
; Address: $E9CE80
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_199:
    ROL $7CD7,X          ; 3E D7 7C | Rotate left (absolute,X)
    ASL $00ED,X          ; 1E ED 00 | Arithmetic shift left (absolute,X)
    INC $28FF,X          ; FE FF 28 | Increment (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    INC $3E00,X          ; FE 00 3E | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_19A
; Address: $E9CEA1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_19A:
    CLC                  ; 18 | Clear carry flag
    ORA ($39),Y          ; 11 39 | Logical OR with accumulator ((zero page),Y)
    DEC                  ; 3A | Decrement accumulator
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SBC $20CF,X          ; FD CF 20 | Subtract with carry (absolute,X)
    STA $C02D60          ; 8F 60 2D C0 | Store accumulator to absolute long address
    LDA $806F40          ; AF 40 6F 80 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_19B
; Address: $E9CEBB
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_19B:
    JSR $10EF            ; 20 EF 10 | Jump to subroutine
    SBC $7D02            ; ED 02 7D | Subtract with carry (absolute)
    ORA $8B6F,Y          ; 19 6F 8B | Logical OR with accumulator (absolute,Y)
    ORA ($FD),Y          ; 11 FD | Logical OR with accumulator ((zero page),Y)
    ORA $14F4,X          ; 1D F4 14 | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SBC $D319,X          ; FD 19 D3 | Subtract with carry (absolute,X)
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    PEA #$F10B           ; F4 0B F1 | Push effective address to stack
    ASL $F3              ; 06 F3 | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($21,X)          ; 21 21 | PPU graphics register access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR $0B0D            ; 4E 0D 0B | Logical shift right (absolute)
    STA $5693,X          ; 9D 93 56 | Store accumulator to absolute,X
    CMP $DD5A,Y          ; D9 5A DD | Compare accumulator (absolute,Y)
    SBC $0404,X          ; FD 04 04 | Subtract with carry (absolute,X)
    LSR $0F4E            ; 4E 4E 0F | Logical shift right (absolute)
    STA                  ; 9F 9F DF DF | Store accumulator to absolute long,X
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_19D
; Address: $E9CF28
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_19D:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STY $148C            ; 8C 8C 14 | Store Y register to absolute address
    STZ $BFB3            ; 9C B3 BF | Store zero to absolute
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_19F
; Address: $E9CF38
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_19F:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    STY $9C8C            ; 8C 8C 9C | Store Y register to absolute address
    STZ $BFBF            ; 9C BF BF | Store zero to absolute
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A0
; Address: $E9CF6C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A0:
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $58              ; 80 58 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    CMP $0000,Y          ; D9 00 00 | Compare accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A1
; Address: $E9CF8F
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A1:
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY $282F            ; AC 2F 28 | Load from absolute address into Y register
    STA                  ; 9F F8 CF E8 | Store accumulator to absolute long,X
    INY                  ; C8 | Increment Y register
    CPY $432B            ; CC 2B 43 | Compare Y register (absolute)
    ROR $42AD            ; 6E AD 42 | Hardware register operation
    LDA $906F50          ; AF 50 6F 90 | Load from absolute long address into accumulator
    LDA $10EF00          ; AF 00 EF 10 | Load from absolute long address into accumulator
    BMI $2F              ; 30 2F | Branch if negative
    BNE $6E              ; D0 6E | Branch if not equal
    STA ($F0),Y          ; 91 F0 | Store accumulator to (zero page),Y
    PEA #$F114           ; F4 14 F1 | Push effective address to stack
    SBC ($14),Y          ; F1 14 | Subtract with carry ((zero page),Y)
    AND ($D6),Y          ; 31 D6 | Logical AND with accumulator ((zero page),Y)
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    PLA                  ; 68 | Pull accumulator from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA #$C4             ; 09 C4 | Logical OR with accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    LDY $F90F            ; AC 0F F9 | Load from absolute address into Y register
    ROR $7F1C            ; 6E 1C 7F | Rotate right (absolute)
    AND $1F              ; 25 1F | Logical AND with accumulator (zero page)
    STA                  ; 9F 6F 8F F7 | Store accumulator to absolute long,X
    LDA $798679          ; AF 79 86 79 | Load from absolute long address into accumulator
    SEC                  ; 38 | Set carry flag
    BMI $6F              ; 30 6F | Branch if negative
    BCC $3F              ; 90 3F | Branch if carry clear
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BRA $3F              ; 80 3F | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STX $CAB3            ; 8E B3 CA | Store X register to absolute address
    INC                  ; 1A | Increment accumulator
    SBC $36              ; E5 36 | Subtract with carry (zero page)
    CMP #$BF             ; C9 BF | Compare accumulator (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF BF FF FF | Load from absolute long,X into accumulator
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCC $B0              ; 90 B0 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A2
; Address: $E9D044
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A2:
    BNE $F0              ; D0 F0 | Branch if not equal
    BCC $FF              ; 90 FF | Branch if carry clear
    LDA $9FD0,X          ; BD D0 9F | Load from absolute,X into accumulator
    ROR $7EBA,X          ; 7E BA 7E | Rotate right (absolute,X)
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BCS $B0              ; B0 B0 | Branch if carry set
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $F9              ; F0 F9 | Branch if equal
    SBC $F3F7,Y          ; F9 F7 F3 | Subtract with carry (absolute,Y)
    INC $5074            ; EE 74 50 | Increment (absolute)
    BCS $80              ; B0 80 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    STX $55              ; 86 55 | Store X register to zero page
    PHB                  ; 8B | Push data bank register to stack
    LDA $7C01            ; AD 01 7C | Load from absolute address into accumulator
    PEA #$DB00           ; F4 00 DB | Push effective address to stack
    STY $0700            ; 8C 00 07 | Store Y register to absolute address
    BVS $A0              ; 70 A0 | Branch if overflow set
    BPL $70              ; 10 70 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    ROL $4AB6            ; 2E B6 4A | Rotate left (absolute)
    LDA $4383            ; AD 83 43 | Load from absolute address into accumulator
    BRA $00              ; 80 00 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    BRA $F0              ; 80 F0 | Branch always
    BRA $F8              ; 80 F8 | Branch always
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    BVS $1F              ; 70 1F | Branch if overflow set
    CPY $830F            ; CC 0F 83 | Compare Y register (absolute)
    ADC ($E1,X)          ; 61 E1 | Add with carry ((zero page,X))
    BCS $23              ; B0 23 | Branch if carry set
    CPY #$37             ; C0 37 | Compare Y register (immediate)
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CPY #$3D             ; C0 3D | Compare Y register (immediate)
    REP #$34             ; C2 34 | Reset processor status bits
    BPL $EF              ; 10 EF | Branch if positive
    LDY #$A1             ; A0 A1 | Load immediate value into Y register
    CPX $C5              ; E4 C5 | Compare X register (zero page)
    LSR $020D            ; 4E 0D 02 | Logical shift right (absolute)
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A3
; Address: $E9D0CB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A3:
    JSL $8820C4          ; 22 C4 20 88 | Jump to subroutine long
    STZ $FF              ; 64 FF | Store zero to zero page
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    STY $C4F7            ; 8C F7 C4 | Store Y register to absolute address
    DEC $F9              ; C6 F9 | Decrement (zero page)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A4
; Address: $E9D102
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A4:
    ASL $1E02,X          ; 1E 02 1E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPX $F60D            ; EC 0D F6 | Compare X register (absolute)
    ASL $7F00,X          ; 1E 00 7F | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $EF              ; 10 EF | Branch if positive
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    BRA $FF              ; 80 FF | Branch always
    CMP ($D1),Y          ; D1 D1 | Compare accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    STZ $18              ; 64 18 | Store zero to zero page
    CPX #$10             ; E0 10 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    BPL $88              ; 10 88 | Branch if positive
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $90              ; 90 90 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STY $59              ; 84 59 | Store Y register to zero page
    ORA $39C2,Y          ; 19 C2 39 | Logical OR with accumulator (absolute,Y)
    DEC $09              ; C6 09 | Decrement (zero page)
    SBC $6ACC,X          ; FD CC 6A | Subtract with carry (absolute,X)
    EOR #$84             ; 49 84 | Exclusive OR with accumulator (immediate)
    CPY $03              ; C4 03 | Compare Y register (zero page)
    CPX $A803            ; EC 03 A8 | Compare X register (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    BCC $6F              ; 90 6F | Branch if carry clear
    ASL $070B            ; 0E 0B 07 | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    ORA $1F00,X          ; 1D 00 1F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A5
; Address: $E9D1C0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A5:
    JSR $1F1A            ; 20 1A 1F | Jump to subroutine
    CPX #$08             ; E0 08 | Compare X register (immediate)
    NOP                  ; EA | No operation
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A7
; Address: $E9D1D1
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A7:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    BRA $DC              ; 80 DC | Branch always
    LDY $EC03,X          ; BC 03 EC | Load from absolute,X into Y register
    BEQ $20              ; F0 20 | Branch if equal
    STA $E000,Y          ; 99 00 E0 | Game work RAM access
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDX $8D              ; A6 8D | Load from zero page into X register
    ADC $5D86,Y          ; 79 86 5D | Add with carry (absolute,Y)
    STA $7F              ; 85 7F | Store accumulator to zero page
    SBC $0B06,Y          ; F9 06 0B | Subtract with carry (absolute,Y)
    BEQ $0E              ; F0 0E | Branch if equal
    EOR ($7D),Y          ; 51 7D | Exclusive OR with accumulator ((zero page),Y)
    BRA $8E              ; 80 8E | Branch always
    ADC ($80),Y          ; 71 80 | Add with carry ((zero page),Y)
    PLY                  ; 7A | Pull Y register from stack
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    LDA $FFAD            ; AD AD FF | Load from absolute address into accumulator
    BIT $4A              ; 24 4A | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $5200            ; ED 00 52 | Subtract with carry (absolute)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    ORA $FDF2            ; 0D F2 FD | Logical OR with accumulator (absolute)
    SBC $956A,X          ; FD 6A 95 | Subtract with carry (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    STA $7A              ; 85 7A | Store accumulator to zero page
    LDA                  ; BF C0 C0 BF | Load from absolute long,X into accumulator
    NOP                  ; EA | No operation
    PLB                  ; AB | Pull data bank register from stack
    BRA $FF              ; 80 FF | Branch always
    LDA                  ; BF 40 95 6A | Load from absolute long,X into accumulator
    BRA $E2              ; 80 E2 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $A0272F          ; AF 2F 27 A0 | Load from absolute long address into accumulator
    STA ($5F,X)          ; 81 5F | Store accumulator to (zero page,X)
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 40 E7 D8 | Load from absolute long,X into accumulator
    LSR $F8              ; 46 F8 | Logical shift right (zero page)
    LDA $B6C9F0          ; AF F0 C9 B6 | Load from absolute long address into accumulator
    CMP $1F22,X          ; DD 22 1F | Compare accumulator (absolute,X)
    PEA #$C4F2           ; F4 F2 C4 | Push effective address to stack
    BRA $FA              ; 80 FA | Branch always
    SEP #$BE             ; E2 BE | Set processor status bits
    EOR ($2E,X)          ; 41 2E | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A8
; Address: $E9D273
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A8:
    CMP ($8B),Y          ; D1 8B | Compare accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    CMP $6B33            ; CD 33 6B | Compare accumulator (absolute)
    SBC $1F              ; E5 1F | Subtract with carry (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $FF              ; 24 FF | Test bits in accumulator (zero page)
    SBC $5212            ; ED 12 52 | Subtract with carry (absolute)
    LDA $FF00            ; AD 00 FF | Load from absolute address into accumulator
    BIT $B5              ; 24 B5 | Test bits in accumulator (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC $FFE6,X          ; DE E6 FF | Decrement (absolute,X)
    ASL $3B10            ; 0E 10 3B | Arithmetic shift left (absolute)
    ADC $B748,Y          ; 79 48 B7 | Add with carry (absolute,Y)
    DEC $30              ; C6 30 | Decrement (zero page)
    EOR $718E            ; 4D 8E 71 | Exclusive OR with accumulator (absolute)
    STA $E666,Y          ; 99 66 E6 | Store accumulator to absolute,Y
    ORA $F10E,Y          ; 19 0E F1 | Logical OR with accumulator (absolute,Y)
    DEC $C331            ; CE 31 C3 | Decrement (absolute)
    BMI $71              ; 30 71 | Branch if negative
    STX $9867            ; 8E 67 98 | Store X register to absolute address
    AND $FB              ; 25 FB | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1A9
; Address: $E9D2C3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1A9:
    JSR $30C8            ; 20 C8 30 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1AA
; Address: $E9D2CB
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1AA:
    JSR $28D7            ; 20 D7 28 | Jump to subroutine
    STY $7B              ; 84 7B | Store Y register to zero page
    LDA ($5A,X)          ; A1 5A | Load from (zero page,X) into accumulator
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    JMP $47B8            ; 4C B8 47 | Jump to address
    SEI                  ; 78 | Set interrupt disable flag
    JMP $57A8            ; 4C A8 57 | Jump to address
    LDA $DF42,X          ; BD 42 DF | Load from absolute,X into accumulator
    ROR                  ; 6A | Rotate right (accumulator)
    LDA #$5D             ; A9 5D | Load immediate value into accumulator
    LDX #$FF             ; A2 FF | Load immediate value into X register
    ADC $23FE            ; 6D FE 23 | Add with carry (absolute)
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    ADC $2392            ; 6D 92 23 | Add with carry (absolute)
    EOR $DFB2            ; 4D B2 DF | Exclusive OR with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1AB
; Address: $E9D306
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1AB:
    INC $5529,X          ; FE 29 55 | Increment (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $DCF2            ; 0E F2 DC | Arithmetic shift left (absolute)
    LDY $00FF            ; AC FF 00 | Load from absolute address into Y register
    INC $FF01,X          ; FE 01 FF | Increment (absolute,X)
    LDA $00FF50          ; AF 50 FF 00 | Load from absolute long address into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1AC
; Address: $E9D323
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1AC:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    LDA #$56             ; A9 56 | Load immediate value into accumulator
    ADC $2392            ; 6D 92 23 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1AD
; Address: $E9D332
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1AD:
    JSR $FFDF            ; 20 DF FF | Jump to subroutine
    LDA #$FF             ; A9 FF | Load immediate value into accumulator
    CMP $7722,X          ; DD 22 77 | Compare accumulator (absolute,X)
    BRA $E2              ; 80 E2 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $8E2E27          ; AF 27 2E 8E | Load from absolute long address into accumulator
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1AE
; Address: $E9D359
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1AE:
    JSR $D827            ; 20 27 D8 | Jump to subroutine
    BRA $71              ; 80 71 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CMP #$B6             ; C9 B6 | Compare accumulator (immediate)
    CMP $1F22,X          ; DD 22 1F | Compare accumulator (absolute,X)
    PEA #$C6F3           ; F4 F3 C6 | Push effective address to stack
    LDA $A0              ; A5 A0 | Load from zero page into accumulator
    LDX $2E41,Y          ; BE 41 2E | Load from absolute,Y into X register
    CMP ($8B),Y          ; D1 8B | Compare accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $0B              ; 30 0B | Branch if negative
    ROL $9BC1,X          ; 3E C1 9B | Rotate left (absolute,X)
    LDY $84BB,X          ; BC BB 84 | Load from absolute,X into Y register
    LDA $00              ; A5 00 | Load from zero page into accumulator
    SBC $4400,X          ; FD 00 44 | Subtract with carry (absolute,X)
    BEQ $FC              ; F0 FC | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    LDA                  ; BF FF 7F FE | Load from absolute long,X into accumulator
    INC $8080,X          ; FE 80 80 | Increment (absolute,X)
    INC $0F00,X          ; FE 00 0F | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $7D12            ; ED 12 7D | Subtract with carry (absolute)
    STA $15EA,X          ; 9D EA 15 | Store accumulator to absolute,X
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1AF
; Address: $E9D3CE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1AF:
    AND $DA              ; 25 DA | Logical AND with accumulator (zero page)
    STA                  ; 9F 60 FF 00 | Store accumulator to absolute long,X
    SEC                  ; 38 | Set carry flag
    PHX                  ; DA | Push X register to stack
    AND $83              ; 25 83 | Logical AND with accumulator (zero page)
    ROR $F461            ; 6E 61 F4 | Rotate right (absolute)
    BCS $4F              ; B0 4F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1B2
; Address: $E9D3F4
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1B2:
    STA ($91),Y          ; 91 91 | Store accumulator to (zero page),Y
    BCS $B0              ; B0 B0 | Branch if carry set
    BIT #$08             ; 89 08 | Test bits in accumulator (immediate)
    LDA $B41C            ; AD 1C B4 | Load from absolute address into accumulator
    LDX $EE32            ; AE 32 EE | Load from absolute address into X register
    DEC                  ; 3A | Decrement accumulator
    BIT $20              ; 24 20 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    LSR $AFB1            ; 4E B1 AF | Logical shift right (absolute)
    BVC $EF              ; 50 EF | Branch if overflow clear
    BPL $BF              ; 10 BF | Branch if positive
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CMP $91DC,X          ; DD DC 91 | Compare accumulator (absolute,X)
    BPL $B5              ; 10 B5 | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    LDA $B28DB4          ; AF B4 8D B2 | Load from absolute long address into accumulator
    CMP $ABB2            ; CD B2 AB | Compare accumulator (absolute)
    SEP #$15             ; E2 15 | Set processor status bits
    CPY #$23             ; C0 23 | Compare Y register (immediate)
    CPX #$9B             ; E0 9B | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $8877            ; 4C 77 88 | Jump to address
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E7              ; F0 E7 | Branch if equal
    AND ($20,X)          ; 21 20 | Logical AND with accumulator ((zero page,X))
    ADC $4CFE,X          ; 7D FE 4C | Add with carry (absolute,X)
    INC $FE34,X          ; FE 34 FE | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BEQ $C4              ; F0 C4 | Branch if equal
    BEQ $28              ; F0 28 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1B3
; Address: $E9D46E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1B3:
    JSL $00FF22          ; 22 22 FF 00 | Jump to subroutine long
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CMP $0E00,X          ; DD 00 0E | Compare accumulator (absolute,X)
    ASL $4DE2,X          ; 1E E2 4D | Arithmetic shift left (absolute,X)
    CPX #$02             ; E0 02 | Compare X register (immediate)
    INC $FB07,X          ; FE 07 FB | Increment (absolute,X)
    SBC $F609,Y          ; F9 09 F6 | Subtract with carry (absolute,Y)
    ROL $83              ; 26 83 | Rotate left (zero page)
    STY $80              ; 84 80 | Store Y register to zero page
    LDX #$33             ; A2 33 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1B4
; Address: $E9D49C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1B4:
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    BCC $90              ; 90 90 | Branch if carry clear
    AND $3B03,X          ; 3D 03 3B | Logical AND with accumulator (absolute,X)
    ORA $33              ; 05 33 | Logical OR with accumulator (zero page)
    ORA $3C43            ; 0D 43 3C | Logical OR with accumulator (absolute)
    EOR $6E36,Y          ; 59 36 6E | Exclusive OR with accumulator (absolute,Y)
    ORA #$30             ; 09 30 | Logical OR with accumulator (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1B5
; Address: $E9D4AE
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1B5:
    ASL $34              ; 06 34 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    ROR $7601,X          ; 7E 01 76 | Rotate right (absolute,X)
    ORA #$1B             ; 09 1B | Logical OR with accumulator (immediate)
    STZ $6B              ; 64 6B | Store zero to zero page
    LDX $CC50            ; AE 50 CC | Load from absolute address into X register
    BMI $5C              ; 30 5C | Branch if negative
    LDY #$7A             ; A0 7A | Load immediate value into Y register
    STY $56              ; 84 56 | Store Y register to zero page
    TAY                  ; A8 | Transfer accumulator to Y register
    SEI                  ; 78 | Set interrupt disable flag
    LDX $B8              ; A6 B8 | Load from zero page into X register
    CPX $7650            ; EC 50 76 | Compare X register (absolute)
    DEY                  ; 88 | Decrement Y register
    BRA $FC              ; 80 FC | Branch always
    INC $FA00,X          ; FE 00 FA | Increment (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    INC $5C00,X          ; FE 00 5C | Increment (absolute,X)
    LDY #$9B             ; A0 9B | Load immediate value into Y register
    LDY $84BB,X          ; BC BB 84 | Load from absolute,X into Y register
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ADC $C400,X          ; 7D 00 C4 | Add with carry (absolute,X)
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    LDA                  ; BF FF 7F FE | Load from absolute long,X into accumulator
    INC $8081,X          ; FE 81 80 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $3F              ; 30 3F | Branch if negative
    CLC                  ; 18 | Clear carry flag
    LDA $ECEBA0          ; AF A0 EB EC | Load from absolute long address into accumulator
    JMP $00FF            ; 4C FF 00 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    CPY $9B              ; C4 9B | Compare Y register (zero page)
    STZ $E3              ; 64 E3 | Store zero to zero page
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1B6
; Address: $E9D54D
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1B6:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SEP #$F2             ; E2 F2 | Set processor status bits
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0400            ; 0D 00 04 | Logical OR with accumulator (absolute)
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $04              ; 10 04 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1B7
; Address: $E9D5E0
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1B7:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    BPL $E4              ; 10 E4 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    CPY $D8              ; C4 D8 | Compare Y register (zero page)
    CPY $30              ; C4 30 | Compare Y register (zero page)
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    DEY                  ; 88 | Decrement Y register
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    INX                  ; E8 | Increment X register
    BCS $00              ; B0 00 | Branch if carry set
    RTI                  ; 40 | Return from interrupt
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    AND $1719,X          ; 3D 19 17 | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $1712            ; 0D 12 17 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1B9
; Address: $E9D639
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1B9:
    JSL $0F100E          ; 22 0E 10 0F | Jump to subroutine long
    BPL $0F              ; 10 0F | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BNE $B8              ; D0 B8 | Branch if not equal
    RTI                  ; 40 | Return from interrupt
    LDY $DCC0            ; AC C0 DC | Load from absolute address into Y register
    CLV                  ; B8 | Clear overflow flag
    CPX $A890            ; EC 90 A8 | Compare X register (absolute)
    BNE $28              ; D0 28 | Branch if not equal
    BNE $E8              ; D0 E8 | Branch if not equal
    BVS $D8              ; 70 D8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1BA
; Address: $E9D651
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1BA:
    JSR $B048            ; 20 48 B0 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    LDY $BC40,X          ; BC 40 BC | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1BB
; Address: $E9D65B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1BB:
    JSR $20D8            ; 20 D8 20 | Jump to subroutine
    SEI                  ; 78 | Set interrupt disable flag
    BRA $30              ; 80 30 | Branch always
    BMI $07              ; 30 07 | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR $4C3E,X          ; 5D 3E 4C | Exclusive OR with accumulator (absolute,X)
    ROL $3E54,X          ; 3E 54 3E | Rotate left (absolute,X)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    BEQ $C6              ; F0 C6 | Branch if equal
    BEQ $2A              ; F0 2A | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    ASL $7E0E            ; 0E 0E 7E | Arithmetic shift left (absolute)
    ROR $2222,X          ; 7E 22 22 | Rotate right (absolute,X)
    ASL $0E00            ; 0E 00 0E | Arithmetic shift left (absolute)
    INC $F000,X          ; FE 00 F0 | Increment (absolute,X)
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1BE
; Address: $E9D6B6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1BE:
    JSR $40DF            ; 20 DF 40 | Jump to subroutine
    LDA                  ; BF 18 E7 FF | Load from absolute long,X into accumulator
    STA                  ; 9F 60 00 00 | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1BF
; Address: $E9D6C9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1BF:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $3800,X          ; 9E 00 38 | Store zero to absolute,X
    BVS $00              ; 70 00 | Branch if overflow set
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C0
; Address: $E9D70E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C0:
    JSR $FF00            ; 20 00 FF | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA $1500,X          ; 1D 00 15 | Logical OR with accumulator (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CMP $CD24            ; CD 24 CD | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C1
; Address: $E9D743
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C1:
    JSR $37DF            ; 20 DF 37 | Jump to subroutine
    CMP ($20,X)          ; C1 20 | Compare accumulator ((zero page,X))
    PHX                  ; DA | Push X register to stack
    DEC                  ; 3A | Decrement accumulator
    BIT $3ADD            ; 2C DD 3A | Test bits in accumulator (absolute)
    ORA #$F2             ; 09 F2 | Logical OR with accumulator (immediate)
    ORA $08F7            ; 0D F7 08 | Logical OR with accumulator (absolute)
    INC $FF11            ; EE 11 FF | Increment (absolute)
    CPX $FA13            ; EC 13 FA | Compare X register (absolute)
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C3
; Address: $E9D7A9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C3:
    JSR $2F01            ; 20 01 2F | Jump to subroutine
    AND $210E,Y          ; 39 0E 21 | PPU graphics register access
    AND $3C0E,Y          ; 39 0E 3C | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C4
; Address: $E9D7B4
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C4:
    JSR $201F            ; 20 1F 20 | Jump to subroutine
    ROL $2F01,X          ; 3E 01 2F | Rotate left (absolute,X)
    SBC ($FE),Y          ; F1 FE | Subtract with carry ((zero page),Y)
    ASL $031F,X          ; 1E 1F 03 | Arithmetic shift left (absolute,X)
    BNE $F1              ; D0 F1 | Branch if not equal
    CPY $2A4D            ; CC 4D 2A | Compare Y register (absolute)
    SEC                  ; 38 | Set carry flag
    SBC ($DE),Y          ; F1 DE | Subtract with carry ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    CPX $FE0D            ; EC 0D FE | Compare X register (absolute)
    INC $FDC7,X          ; FE C7 FD | Increment (absolute,X)
    JMP $FBB3            ; 4C B3 FB | Jump to address
    LDX $3F41,Y          ; BE 41 3F | Load from absolute,Y into X register
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    CPY #$B7             ; C0 B7 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    JMP $2BAE29          ; 5C 29 AE 2B | Jump to address long
    PLB                  ; AB | Pull data bank register from stack
    LDY $84BB,X          ; BC BB 84 | Load from absolute,X into Y register
    LDA $00              ; A5 00 | Load from zero page into accumulator
    SBC $0400,X          ; FD 00 04 | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    LDA                  ; BF FF 7F FE | Load from absolute long,X into accumulator
    INC $8080,X          ; FE 80 80 | Increment (absolute,X)
    INC $0800,X          ; FE 00 08 | Increment (absolute,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $19FCE3          ; AF E3 FC 19 | Load from absolute long address into accumulator
    ORA ($07),Y          ; 11 07 | Logical OR with accumulator ((zero page),Y)
    INC $FB01,X          ; FE 01 FB | Increment (absolute,X)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    STY $AF              ; 84 AF | Store Y register to zero page
    BVC $FC              ; 50 FC | Branch if overflow clear
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ASL $FFF1            ; 0E F1 FF | Arithmetic shift left (absolute)
    INC $1D01,X          ; FE 01 1D | Increment (absolute,X)
    ASL $E0E1,X          ; 1E E1 E0 | Game work RAM access
    STA                  ; 9F E7 9F E4 | Store accumulator to absolute long,X
    AND #$2F             ; 29 2F | Logical AND with accumulator (immediate)
    AND #$0F             ; 29 0F | Logical AND with accumulator (immediate)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C5
; Address: $E9D86F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C5:
    ASL $00FF,X          ; 1E FF 00 | Arithmetic shift left (absolute,X)
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    SBC ($A8,X)          ; E1 A8 | Subtract with carry ((zero page,X))
    INX                  ; E8 | Increment X register
    SBC $FAE5,Y          ; F9 E5 FA | Subtract with carry (absolute,Y)
    SBC $F593            ; ED 93 F5 | Subtract with carry (absolute)
    PEA #$781C           ; F4 1C 78 | Push effective address to stack
    SBC $FE02,X          ; FD 02 FE | Subtract with carry (absolute,X)
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    STY $1F              ; 84 1F | Store Y register to zero page
    ORA $1826,Y          ; 19 26 18 | Logical OR with accumulator (absolute,Y)
    ROL $08              ; 26 08 | Rotate left (zero page)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C6
; Address: $E9D8B0
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C6:
    JSL $003F01          ; 22 01 3F 00 | Jump to subroutine long
    PLP                  ; 28 | Pull processor status from stack
    SBC ($80),Y          ; F1 80 | Subtract with carry ((zero page),Y)
    ROR $6789,X          ; 7E 89 67 | Rotate right (absolute,X)
    STZ $13              ; 64 13 | Store zero to zero page
    CMP $FF00            ; CD 00 FF | Compare accumulator (absolute)
    BVS $8F              ; 70 8F | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 1E E3 FF | Load from absolute long,X into accumulator
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BMI $4B              ; 30 4B | Branch if negative
    BRA $FF              ; 80 FF | Branch always
    PHA                  ; 48 | Push accumulator to stack
    STY $09              ; 84 09 | Store Y register to zero page
    CPX $BF              ; E4 BF | Compare X register (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    INY                  ; C8 | Increment Y register
    LDY #$F7             ; A0 F7 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $5F              ; 10 5F | Branch if positive
    BCS $47              ; B0 47 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLI                  ; 58 | Clear interrupt disable flag
    BEQ $17              ; F0 17 | Branch if equal
    INX                  ; E8 | Increment X register
    PHA                  ; 48 | Push accumulator to stack
    AND $3019,Y          ; 39 19 30 | Logical AND with accumulator (absolute,Y)
    AND $D93F,Y          ; 39 3F D9 | Logical AND with accumulator (absolute,Y)
    LDA                  ; BF 78 7E 38 | Load from absolute long,X into accumulator
    ASL $2909,X          ; 1E 09 29 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C7
; Address: $E9D92E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C7:
    CLD                  ; D8 | Clear decimal mode flag
    INY                  ; C8 | Increment Y register
    ROL $8F              ; 26 8F | Rotate left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1C8
; Address: $E9D935
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1C8:
    CPY #$AF             ; C0 AF | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ROR $CE81            ; 6E 81 CE | Rotate right (absolute)
    AND ($E8,X)          ; 21 E8 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    STA $0F99,X          ; 9D 99 0F | Store accumulator to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    SBC ($9D),Y          ; F1 9D | Subtract with carry ((zero page),Y)
    SBC $7414,X          ; FD 14 74 | Subtract with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    ORA $1319,X          ; 1D 19 13 | Logical OR with accumulator (absolute,X)
    STZ $F3              ; 64 F3 | Store zero to zero page
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    PHB                  ; 8B | Push data bank register to stack
    ADC ($86),Y          ; 71 86 | Add with carry ((zero page),Y)
    CPX $E7              ; E4 E7 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    BVS $30              ; 70 30 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    BVS $30              ; 70 30 | Branch if overflow set
    EOR ($01,X)          ; 41 01 | Exclusive OR with accumulator ((zero page,X))
    BMI $4F              ; 30 4F | Branch if negative
    BPL $67              ; 10 67 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1CA
; Address: $E9D97B
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1CA:
    EOR #$13             ; 49 13 | Exclusive OR with accumulator (immediate)
    JMP ($600D)          ; 6C 0D 60 | Jump to address (absolute indirect)
    ASL $1A0C            ; 0E 0C 1A | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    NOP                  ; EA | No operation
    INX                  ; E8 | Increment X register
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    JMP $8280            ; 4C 80 82 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    INC $F8              ; E6 F8 | Increment (zero page)
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    JMP ($CA92)          ; 6C 92 CA | Jump to address (absolute indirect)
    BVC $AF              ; 50 AF | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1CB
; Address: $E9D9A3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1CB:
    LDA                  ; BF 18 A7 11 | Load from absolute long,X into accumulator
    STX $53D1            ; 8E D1 53 | Store X register to absolute address
    ROL $4080,X          ; 3E 80 40 | Rotate left (absolute,X)
    LDX $0201,Y          ; BE 01 02 | Load from absolute,Y into X register
    LDX $FF00            ; AE 00 FF | Load from absolute address into X register
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    ADC $9A              ; 65 9A | Add with carry (zero page)
    REP #$3D             ; C2 3D | Reset processor status bits
    PHB                  ; 8B | Push data bank register to stack
    PLB                  ; AB | Pull data bank register from stack
    BMI $CF              ; 30 CF | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1CC
; Address: $E9D9CD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1CC:
    JSR $25CA            ; 20 CA 25 | Jump to subroutine
    INC $7C01,X          ; FE 01 7C | Increment (absolute,X)
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1CD
; Address: $E9D9E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1CD:
    JSR $40D8            ; 20 D8 40 | Jump to subroutine
    LDA                  ; BF 18 E7 F7 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDY $D827,X          ; BC 27 D8 | Load from absolute,X into Y register
    PHB                  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1CE
; Address: $E9D9F7
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1CE:
    JSR $40BF            ; 20 BF 40 | Jump to subroutine
    BPL $FF              ; 10 FF | Branch if positive
    LDA                  ; BF 40 5B 3D | Load from absolute long,X into accumulator
    LDA $2D2B            ; AD 2B 2D | Load from absolute address into accumulator
    STA $CDF7,Y          ; 99 F7 CD | Store accumulator to absolute,Y
    XBA                  ; EB | Exchange accumulator bytes
    CMP #$CD             ; C9 CD | Compare accumulator (immediate)
    ROL                  ; 2A | Rotate left (accumulator)
    ROR $40AF            ; 6E AF 40 | Rotate right (absolute)
    LDA $906F50          ; AF 50 6F 90 | Load from absolute long address into accumulator
    PHP                  ; 08 | Push processor status to stack
    BPL $CF              ; 10 CF | Branch if positive
    BMI $2E              ; 30 2E | Branch if negative
    CMP ($6E),Y          ; D1 6E | Compare accumulator ((zero page),Y)
    STA ($D0),Y          ; 91 D0 | Store accumulator to (zero page),Y
    STA ($E7),Y          ; 91 E7 | Store accumulator to (zero page),Y
    STA ($F4),Y          ; 91 F4 | Store accumulator to (zero page),Y
    CMP ($36),Y          ; D1 36 | Compare accumulator ((zero page),Y)
    SBC ($C5),Y          ; F1 C5 | Subtract with carry ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    SBC $18              ; E5 18 | Subtract with carry (zero page)
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    CMP #$C4             ; C9 C4 | Compare accumulator (immediate)
    DEC                  ; 3A | Decrement accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1CF
; Address: $E9DA46
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1CF:
    BPL $10              ; 10 10 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$E00B           ; F4 0B E0 | Game work RAM access
    ORA $FA03,X          ; 1D 03 FA | Logical OR with accumulator (absolute,X)
    ORA $F4F1            ; 0D F1 F4 | Logical OR with accumulator (absolute)
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    ORA $F3              ; 05 F3 | Logical OR with accumulator (zero page)
    PEA #$34CB           ; F4 CB 34 | Push effective address to stack
    BCC $BA              ; 90 BA | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    PLX                  ; FA | Pull X register from stack
    NOP                  ; EA | No operation
    CLI                  ; 58 | Clear interrupt disable flag
    STA $3748B0          ; 8F B0 48 37 | Store accumulator to absolute long address
    LDA $F3AFD3          ; AF D3 AF F3 | Load from absolute long address into accumulator
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    BIT $FB              ; 24 FB | Test bits in accumulator (zero page)
    BRA $BB              ; 80 BB | Branch always
    LSR $5F14            ; 4E 14 5F | Logical shift right (absolute)
    ROL $3FBF,X          ; 3E BF 3F | Rotate left (absolute,X)
    CPY $9C00            ; CC 00 9C | Compare Y register (absolute)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $30E6            ; 0E E6 30 | Arithmetic shift left (absolute)
    BEQ $60              ; F0 60 | Branch if equal
    CPX #$D6             ; E0 D6 | Compare X register (immediate)
    STA                  ; 9F B9 9F 4F | Store accumulator to absolute long,X
    ORA $0F00,Y          ; 19 00 0F | Logical OR with accumulator (absolute,Y)
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D1
; Address: $E9DADE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D1:
    BEQ $00              ; F0 00 | Branch if equal
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    JMP $08060F          ; 5C 0F 06 08 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BPL $1C              ; 10 1C | Branch if positive
    JMP $C936A3          ; 5C A3 36 C9 | Jump to address long
    BIT #$36             ; 89 36 | Test bits in accumulator (immediate)
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    SBC $78EF,X          ; FD EF 78 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D2
; Address: $E9DB09
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D2:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $00              ; F0 00 | Branch if equal
    BCC $10              ; 90 10 | Branch if carry clear
    SBC #$68             ; E9 68 | Subtract with carry (immediate)
    SBC $7802,X          ; FD 02 78 | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    BPL $10              ; 10 10 | Branch if positive
    INC $192E,X          ; FE 2E 19 | Increment (absolute,X)
    ORA $81E7,Y          ; 19 E7 81 | Logical OR with accumulator (absolute,Y)
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    TXS                  ; 9A | Transfer X register to stack pointer
    BNE $DB              ; D0 DB | Branch if not equal
    BIT $81              ; 24 81 | Test bits in accumulator (zero page)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    AND $522D            ; 2D 2D 52 | Logical AND with accumulator (absolute)
    PHB                  ; 8B | Push data bank register to stack
    PHB                  ; 8B | Push data bank register to stack
    STA                  ; 9F 83 BE 00 | Store accumulator to absolute long,X
    ASL $3100            ; 0E 00 31 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    AND $20DC            ; 2D DC 20 | Logical AND with accumulator (absolute)
    INX                  ; E8 | Increment X register
    TAX                  ; AA | Transfer accumulator to X register
    EOR $715D,X          ; 5D 5D 71 | Exclusive OR with accumulator (absolute,X)
    EOR ($EE),Y          ; 51 EE | Exclusive OR with accumulator ((zero page),Y)
    LDY $0000            ; AC 00 00 | Load from absolute address into Y register
    STX $D100            ; 8E 00 D1 | Store X register to absolute address
    CMP ($2E),Y          ; D1 2E | Compare accumulator ((zero page),Y)
    LDA $5842,X          ; BD 42 58 | Load from absolute,X into accumulator
    ROR $7C4D,X          ; 7E 4D 7C | Rotate right (absolute,X)
    ORA ($86,X)          ; 01 86 | Logical OR with accumulator ((zero page,X))
    ROL $40              ; 26 40 | Rotate left (zero page)
    BIT #$40             ; 89 40 | Test bits in accumulator (immediate)
    REP #$1D             ; C2 1D | Reset processor status bits
    SBC $E30C,Y          ; F9 0C E3 | Subtract with carry (absolute,Y)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    LDY #$28             ; A0 28 | Load immediate value into Y register
    BMI $34              ; 30 34 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    ADC ($72,X)          ; 61 72 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D3
; Address: $E9DBA8
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D3:
    PLA                  ; 68 | Pull accumulator from stack
    INC $2F              ; E6 2F | Increment (zero page)
    STA $DFCF08          ; 8F 08 CF DF | Store accumulator to absolute long address
    STA $9000            ; 8D 00 90 | Store accumulator to absolute address
    BNE $00              ; D0 00 | Branch if not equal
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    STA ($0E),Y          ; 91 0E | Store accumulator to (zero page),Y
    STA                  ; 9F 00 04 00 | Store accumulator to absolute long,X
    BRA $00              ; 80 00 | Branch always
    STA                  ; 9F 60 9F 60 | Store accumulator to absolute long,X
    CLC                  ; 18 | Clear carry flag
    BRA $7C              ; 80 7C | Branch always
    BIT #$01             ; 89 01 | Test bits in accumulator (immediate)
    LDY $0100,X          ; BC 00 01 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D4
; Address: $E9DBE5
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D4:
    JSR $E001            ; 20 01 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA $0142,X          ; BD 42 01 | Load from absolute,X into accumulator
    INC $DE20,X          ; FE 20 DE | Increment (absolute,X)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    INC                  ; 1A | Increment accumulator
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BPL $10              ; 10 10 | Branch if positive
    BVS $30              ; 70 30 | Branch if overflow set
    CMP ($81,X)          ; C1 81 | Compare accumulator ((zero page,X))
    STA                  ; 9F F0 0F D0 | Store accumulator to absolute long,X
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CMP #$93             ; C9 93 | Compare accumulator (immediate)
    JMP ($608D)          ; 6C 8D 60 | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    INC $07FE,X          ; FE FE 07 | Increment (absolute,X)
    JMP $8281            ; 4C 81 82 | Jump to address
    SBC $0FFA,Y          ; F9 FA 0F | Subtract with carry (absolute,Y)
    BEQ $0B              ; F0 0B | Branch if equal
    PEA #$07F8           ; F4 F8 07 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP ($CA93)          ; 6C 93 CA | Jump to address (absolute indirect)
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    PHA                  ; 48 | Push accumulator to stack
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D5
; Address: $E9DC47
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D5:
    CPY #$9E             ; C0 9E | Compare Y register (immediate)
    BPL $F9              ; 10 F9 | Branch if positive
    BPL $2F              ; 10 2F | Branch if positive
    PHA                  ; 48 | Push accumulator to stack
    CLC                  ; 18 | Clear carry flag
    BVC $AF              ; 50 AF | Branch if overflow clear
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    INC $EE01,X          ; FE 01 EE | Increment (absolute,X)
    ORA ($70),Y          ; 11 70 | Logical OR with accumulator ((zero page),Y)
    STA $7B6996          ; 8F 96 69 7B | Store accumulator to absolute long address
    REP #$00             ; C2 00 | Reset processor status bits
    BPL $FF              ; 10 FF | Branch if positive
    EOR $F744            ; 4D 44 F7 | Exclusive OR with accumulator (absolute)
    BRA $FF              ; 80 FF | Branch always
    BPL $7F              ; 10 7F | Branch if positive
    LDY #$D8             ; A0 D8 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D6
; Address: $E9DC6F
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D6:
    JSR $9B64            ; 20 64 9B | Jump to subroutine
    PHX                  ; DA | Push X register to stack
    AND $7C              ; 25 7C | Logical AND with accumulator (zero page)
    LDA #$CD             ; A9 CD | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $08              ; F0 08 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    LDA                  ; BF 58 18 40 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    CMP ($DB),Y          ; D1 DB | Compare accumulator ((zero page),Y)
    REP #$81             ; C2 81 | Reset processor status bits
    ROR $58              ; 66 58 | Rotate right (zero page)
    LDA                  ; BF 40 BF 40 | Load from absolute long,X into accumulator
    PHX                  ; DA | Push X register to stack
    AND $EF              ; 25 EF | Logical AND with accumulator (zero page)
    BPL $D1              ; 10 D1 | Branch if positive
    ROL $19E6            ; 2E E6 19 | Rotate left (absolute)
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($0B,X)          ; 01 0B | Logical OR with accumulator ((zero page,X))
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    JMP ($A0BF)          ; 6C BF A0 | Jump to address (absolute indirect)
    BRA $FF              ; 80 FF | Branch always
    ORA $4F              ; 05 4F | Logical OR with accumulator (zero page)
    BCC $2F              ; 90 2F | Branch if carry clear
    BVC $BE              ; 50 BE | Branch if overflow clear
    EOR ($FD,X)          ; 41 FD | Exclusive OR with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D7
; Address: $E9DCE3
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D7:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $0E              ; 10 0E | Branch if positive
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    BPL $0A              ; 10 0A | Branch if positive
    ASL $0B11            ; 0E 11 0B | Arithmetic shift left (absolute)
    BPL $A8              ; 10 A8 | Branch if positive
    BNE $A8              ; D0 A8 | Branch if not equal
    BNE $A8              ; D0 A8 | Branch if not equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BNE $A8              ; D0 A8 | Branch if not equal
    BNE $A8              ; D0 A8 | Branch if not equal
    BNE $A8              ; D0 A8 | Branch if not equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BNE $D8              ; D0 D8 | Branch if not equal

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1D8
; Address: $E9DD11
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1D8:
    JSR $20D8            ; 20 D8 20 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1DB
; Address: $E9DD1F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1DB:
    JSR $BFFF            ; 20 FF BF | Jump to subroutine
    STA                  ; 9F 50 50 FF | Store accumulator to absolute long,X
    ADC $BF7D,X          ; 7D 7D BF | Add with carry (absolute,X)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    BPL $00              ; 10 00 | Branch if positive
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPX $F3              ; E4 F3 | Compare X register (zero page)
    INC $DB25            ; EE 25 DB | Increment (absolute)
    LDA                  ; BF 18 BD 9D | Load from absolute long,X into accumulator
    LDY #$E3             ; A0 E3 | Load immediate value into Y register
    SBC ($1A,X)          ; E1 1A | Subtract with carry ((zero page,X))
    XBA                  ; EB | Exchange accumulator bytes
    BPL $EE              ; 10 EE | Branch if positive
    ORA ($D9),Y          ; 11 D9 | Logical OR with accumulator ((zero page),Y)
    BIT $5E              ; 24 5E | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1DD
; Address: $E9DD5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1DD:
    JSR $081F            ; 20 1F 08 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    ROR $3F              ; 66 3F | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1DE
; Address: $E9DD6B
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1DE:
    BMI $0A              ; 30 0A | Branch if negative
    EOR ($EA),Y          ; 51 EA | Exclusive OR with accumulator ((zero page),Y)
    AND $1007,Y          ; 39 07 10 | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    AND $1A02            ; 2D 02 1A | Logical AND with accumulator (absolute)
    ADC $1F              ; 65 1F | Add with carry (zero page)
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    CPY #$8F             ; C0 8F | Compare Y register (immediate)
    CPX $D9              ; E4 D9 | Compare X register (zero page)
    STZ $BD              ; 64 BD | Store zero to zero page
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    AND $FFC2,X          ; 3D C2 FF | Logical AND with accumulator (absolute,X)
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    BRA $C1              ; 80 C1 | Branch always
    CMP ($FC,X)          ; C1 FC | Compare accumulator ((zero page,X))
    STZ $0DFF            ; 9C FF 0D | Store zero to absolute
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1DF
; Address: $E9DDA9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1DF:
    JSR $0CF7            ; 20 F7 0C | Jump to subroutine
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    ASL $9E              ; 06 9E | Arithmetic shift left (zero page)
    ADC ($0D,X)          ; 61 0D | Add with carry ((zero page,X))
    INC                  ; 1A | Increment accumulator
    SBC $E0              ; E5 E0 | Game work RAM access
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    ASL $F0E1,X          ; 1E E1 F0 | Arithmetic shift left (absolute,X)
    CPX $75              ; E4 75 | Compare X register (zero page)
    ADC $83              ; 65 83 | Add with carry (zero page)
    CPX $FF6A            ; EC 6A FF | Compare X register (absolute)
    LDY #$1F             ; A0 1F | Load immediate value into Y register
    CPX #$FF             ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E0
; Address: $E9DDDB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E0:
    JSR $708F            ; 20 8F 70 | Jump to subroutine
    ROR $AB91            ; 6E 91 AB | Rotate right (absolute)
    BVS $CB              ; 70 CB | Branch if overflow set
    BPL $6B              ; 10 6B | Branch if positive
    CLV                  ; B8 | Clear overflow flag
    PHB                  ; 8B | Push data bank register to stack
    BVC $0F              ; 50 0F | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E2
; Address: $E9DDED
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E2:
    BPL $0F              ; 10 0F | Branch if positive
    BIT #$16             ; 89 16 | Test bits in accumulator (immediate)
    SBC #$9E             ; E9 9E | Subtract with carry (immediate)
    EOR ($56,X)          ; 41 56 | Exclusive OR with accumulator ((zero page,X))
    LDA #$D6             ; A9 D6 | Load immediate value into accumulator
    AND #$9E             ; 29 9E | Logical AND with accumulator (immediate)
    EOR ($96,X)          ; 41 96 | Exclusive OR with accumulator ((zero page,X))
    ADC #$DE             ; 69 DE | Add with carry (immediate)
    AND ($FE,X)          ; 21 FE | Logical AND with accumulator ((zero page,X))
    CMP ($BE,X)          ; C1 BE | Compare accumulator ((zero page,X))
    LDA $FF43,X          ; BD 43 FF | Load from absolute,X into accumulator
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    BRA $C1              ; 80 C1 | Branch always
    ROL $C3BD,X          ; 3E BD C3 | Rotate left (absolute,X)
    STA ($7F,X)          ; 81 7F | Store accumulator to (zero page,X)
    BRA $FE              ; 80 FE | Branch always
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    LDY $00FF,X          ; BC FF 00 | Load from absolute,X into Y register
    ROR $C381,X          ; 7E 81 C3 | Rotate right (absolute,X)
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    STA $914E10          ; 8F 10 4E 91 | Store accumulator to absolute long address
    STX $8F51            ; 8E 51 8F | Store X register to absolute address
    BVC $0A              ; 50 0A | Branch if overflow clear
    ASL $0BD1            ; 0E D1 0B | Arithmetic shift left (absolute)
    BVC $F9              ; 50 F9 | Branch if overflow clear
    LDY #$EB             ; A0 EB | Load immediate value into Y register
    BCS $FA              ; B0 FA | Branch if carry set
    LDY #$BA             ; A0 BA | Load immediate value into Y register
    CPX #$BA             ; E0 BA | Compare X register (immediate)
    CPX #$BA             ; E0 BA | Compare X register (immediate)
    CPX #$EB             ; E0 EB | Compare X register (immediate)
    LDA ($BB),Y          ; B1 BB | Load from (zero page),Y into accumulator
    SBC ($A9,X)          ; E1 A9 | Subtract with carry ((zero page,X))
    BVC $BA              ; 50 BA | Branch if overflow clear
    EOR ($A9,X)          ; 41 A9 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E3
; Address: $E9DE56
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E3:
    SBC #$12             ; E9 12 | Subtract with carry (immediate)
    INX                  ; E8 | Increment X register
    INX                  ; E8 | Increment X register
    CLV                  ; B8 | Clear overflow flag
    WDM #$E8             ; 42 E8 | Reserved instruction
    SBC $E44D            ; ED 4D E4 | Subtract with carry (absolute)
    SBC $1D3B,X          ; FD 3B 1D | Subtract with carry (absolute,X)
    INC                  ; 1A | Increment accumulator
    INC                  ; 1A | Increment accumulator
    SBC $740D            ; ED 0D 74 | Subtract with carry (absolute)
    JMP $2FB2            ; 4C B2 2F | Jump to address
    BNE $3F              ; D0 3F | Branch if not equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ASL $1EE1,X          ; 1E E1 1E | Arithmetic shift left (absolute,X)
    SBC ($1C,X)          ; E1 1C | Subtract with carry ((zero page,X))
    SEP #$DF             ; E2 DF | Set processor status bits

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E5
; Address: $E9DE82
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E5:
    JSR $449D            ; 20 9D 44 | Jump to subroutine
    LDX #$9D             ; A2 9D | Load immediate value into X register
    WDM #$94             ; 42 94 | Reserved instruction
    AND $01C6,Y          ; 39 C6 01 | Logical AND with accumulator (absolute,Y)
    LDX $4896,Y          ; BE 96 48 | Load from absolute,Y into X register
    BPL $0E              ; 10 0E | Branch if positive
    LDX $7B              ; A6 7B | Load from zero page into X register
    BNE $10              ; D0 10 | Branch if not equal
    BRA $7F              ; 80 7F | Branch always
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    JMP $28D7            ; 4C D7 28 | Jump to address
    LDY $FA43,X          ; BC 43 FA | Load from absolute,X into Y register
    BEQ $0F              ; F0 0F | Branch if equal
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $D0              ; 05 D0 | Logical OR with accumulator (zero page)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    ORA $8000            ; 0D 00 80 | Logical OR with accumulator (absolute)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    BNE $00              ; D0 00 | Branch if not equal
    ORA $15F2            ; 0D F2 15 | Logical OR with accumulator (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHY                  ; 5A | Push Y register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E6
; Address: $E9DEEC
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E6:
    PHX                  ; DA | Push X register to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BVC $0E              ; 50 0E | Branch if overflow clear
    EOR ($0E),Y          ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
    CMP ($0F),Y          ; D1 0F | Compare accumulator ((zero page),Y)
    BNE $8A              ; D0 8A | Branch if not equal
    STX $4B51            ; 8E 51 4B | Store X register to absolute address
    STA $E1BB10          ; 8F 10 BB E1 | Store accumulator to absolute long address
    PLB                  ; AB | Pull data bank register from stack
    SBC ($AA),Y          ; F1 AA | Subtract with carry ((zero page),Y)
    BEQ $AA              ; F0 AA | Branch if equal
    BEQ $BA              ; F0 BA | Branch if equal
    CPX #$AA             ; E0 AA | Compare X register (immediate)
    BNE $AB              ; D0 AB | Branch if not equal
    BEQ $A9              ; F0 A9 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC #$12             ; E9 12 | Subtract with carry (immediate)
    CMP $FA22,Y          ; D9 22 FA | Compare accumulator (absolute,Y)
    ORA ($F9,X)          ; 01 F9 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0A10            ; 0E 10 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLV                  ; B8 | Clear overflow flag
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $B8              ; F0 B8 | Branch if equal
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BNE $A8              ; D0 A8 | Branch if not equal
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $E8              ; F0 E8 | Branch if equal
    BPL $F8              ; 10 F8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BPL $D8              ; 10 D8 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E7
; Address: $E9DF5B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E7:
    JSR $00F8            ; 20 F8 00 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    EOR ($BF,X)          ; 41 BF | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E8
; Address: $E9DF65
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E8:
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    CPX $2F              ; E4 2F | Compare X register (zero page)
    BEQ $DF              ; F0 DF | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1E9
; Address: $E9DF6F
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1E9:
    RTI                  ; 40 | Return from interrupt
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF B8 47 E7 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    BRA $7F              ; 80 7F | Branch always
    BRA $4F              ; 80 4F | Branch always
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    SBC $29CF,Y          ; F9 CF 29 | Subtract with carry (absolute,Y)
    AND ($5D),Y          ; 31 5D | Logical AND with accumulator ((zero page),Y)
    EOR $1EB3,X          ; 5D B3 1E | Exclusive OR with accumulator (absolute,X)
    SBC ($DB),Y          ; F1 DB | Subtract with carry ((zero page),Y)
    PEA #$40BF           ; F4 BF 40 | Push effective address to stack
    CPY #$37             ; C0 37 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$840B           ; F4 0B 84 | Push effective address to stack
    STY $00              ; 84 00 | Store Y register to zero page
    ADC $FF00,X          ; 7D 00 FF | Add with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    DEC $C6              ; C6 C6 | Decrement (zero page)
    DEC                  ; 3A | Decrement accumulator
    AND $FF00,Y          ; 39 00 FF | Logical AND with accumulator (absolute,Y)
    BPL $D7              ; 10 D7 | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    CLC                  ; 18 | Clear carry flag
    SBC $EF10,X          ; FD 10 EF | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    BRA $60              ; 80 60 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $B7              ; 10 B7 | Branch if positive
    BVC $73              ; 50 73 | Branch if overflow clear
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    STA                  ; 9F 00 EF 00 | Store accumulator to absolute long,X
    LDA $000000          ; AF 00 00 00 | Load from absolute long address into accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    ORA ($BD,X)          ; 01 BD | Logical OR with accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ORA ($7E,X)          ; 01 7E | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1EA
; Address: $E9E01C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1EA:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BRA $BD              ; 80 BD | Branch always
    BPL $37              ; 10 37 | Branch if positive
    INX                  ; E8 | Increment X register
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    EOR ($82),Y          ; 51 82 | Exclusive OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1EB
; Address: $E9E04B
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1EB:
    CMP ($0C,X)          ; C1 0C | Compare accumulator ((zero page,X))
    BVC $51              ; 50 51 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    INC $FFFD,X          ; FE FD FF | Increment (absolute,X)
    LDA $FB02FF          ; AF FF 02 FB | Load from absolute long address into accumulator
    ORA $8686,Y          ; 19 86 86 | Logical OR with accumulator (absolute,Y)
    INC $7CEE            ; EE EE 7C | Increment (absolute)
    ROR $4242,X          ; 7E 42 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    WDM #$0A             ; 42 0A | Reserved instruction
    STA $00FD00          ; 8F 00 FD 00 | Store accumulator to absolute long address
    ADC $1100,Y          ; 79 00 11 | Add with carry (absolute,Y)
    ADC $7F82,X          ; 7D 82 7F | Add with carry (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    PLX                  ; FA | Pull X register from stack
    STA $80              ; 85 80 | Store accumulator to zero page
    LDA                  ; BF 80 9B 80 | Load from absolute long,X into accumulator
    LDA ($D7),Y          ; B1 D7 | Load from (zero page),Y into accumulator
    ADC $8CFD,Y          ; 79 FD 8C | Add with carry (absolute,Y)
    STY $D111            ; 8C 11 D1 | Store Y register to absolute address
    DEX                  ; CA | Decrement X register
    XBA                  ; EB | Exchange accumulator bytes
    PLP                  ; 28 | Pull processor status from stack
    STY $FF              ; 84 FF | Store Y register to zero page
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    AND $2700            ; 2D 00 27 | Logical AND with accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1EC
; Address: $E9E0A8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1EC:
    JSR $0860            ; 20 60 08 | Jump to subroutine
    ASL $682E            ; 0E 2E 68 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    BCC $6B              ; 90 6B | Branch if carry clear
    BCC $67              ; 90 67 | Branch if carry clear
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $47              ; B0 47 | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    BCC $67              ; 90 67 | Branch if carry clear
    BCC $61              ; 90 61 | Branch if carry clear
    BEQ $07              ; F0 07 | Branch if equal
    ASL $12              ; 06 12 | Arithmetic shift left (zero page)
    DEC $02              ; C6 02 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1ED
; Address: $E9E0C9
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1ED:
    REP #$12             ; C2 12 | Reset processor status bits
    ORA $0FF2            ; 0D F2 0F | Logical OR with accumulator (absolute)
    CPX #$0D             ; E0 0D | Compare X register (immediate)
    ORA $0FF2            ; 0D F2 0F | Logical OR with accumulator (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$0D             ; E0 0D | Compare X register (immediate)
    ORA $40F2            ; 0D F2 40 | Logical OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1EF
; Address: $E9E0E4
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1EF:
    JSR $4861            ; 20 61 48 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $2F              ; D0 2F | Branch if not equal
    BCS $47              ; B0 47 | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    BEQ $07              ; F0 07 | Branch if equal
    BEQ $07              ; F0 07 | Branch if equal
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDY $FC              ; A4 FC | Load from zero page into Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ROL $D3C1,X          ; 3E C1 D3 | Rotate left (absolute,X)
    ASL $DB01,X          ; 1E 01 DB | Arithmetic shift left (absolute,X)
    ROR $E3C1,X          ; 7E C1 E3 | Rotate right (absolute,X)
    STZ $3EC1            ; 9C C1 3E | Store zero to absolute
    BIT $00D3            ; 2C D3 00 | Test bits in accumulator (absolute)
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    ORA $0585            ; 0D 85 05 | Logical OR with accumulator (absolute)
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    INC $FF61,X          ; FE 61 FF | Increment (absolute,X)
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    SBC $FFEA,X          ; FD EA FF | Subtract with carry (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    LDA                  ; BF 74 BF 74 | Load from absolute long,X into accumulator
    LDA                  ; BF 28 2A 31 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F0
; Address: $E9E143
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F0:
    JSR $0011            ; 20 11 00 | Jump to subroutine
    EOR ($45,X)          ; 41 45 | Exclusive OR with accumulator ((zero page,X))
    BRA $29              ; 80 29 | Branch always
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    ASL $EF              ; 06 EF | Arithmetic shift left (zero page)
    ORA $17FF,Y          ; 19 FF 17 | Logical OR with accumulator (absolute,Y)
    INC $7F17,X          ; FE 17 7F | Increment (absolute,X)
    LDX $AE7D            ; AE 7D AE | Load from absolute address into X register
    INC $00FD            ; EE FD 00 | Increment (absolute)
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F1
; Address: $E9E162
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F1:
    JSR $301B            ; 20 1B 30 | Jump to subroutine
    ADC #$20             ; 69 20 | Add with carry (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $004E            ; 0E 4E 00 | Arithmetic shift left (absolute)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $77              ; F0 77 | Branch if equal
    BEQ $E7              ; F0 E7 | Branch if equal
    BEQ $E1              ; F0 E1 | Branch if equal
    BNE $EF              ; D0 EF | Branch if not equal
    BMI $32              ; 30 32 | Branch if negative
    CLV                  ; B8 | Clear overflow flag
    INX                  ; E8 | Increment X register
    BPL $14              ; 10 14 | Branch if positive
    BNE $70              ; D0 70 | Branch if not equal
    BVC $0F              ; 50 0F | Branch if overflow clear
    INC $FE1F            ; EE 1F FE | Increment (absolute)
    INC $EE0F,X          ; FE 0F EE | Increment (absolute,X)
    CMP $30              ; C5 30 | Compare accumulator (zero page)
    SBC $2518            ; ED 18 25 | Subtract with carry (absolute)
    BVC $40              ; 50 40 | Branch if overflow clear
    LDY $94              ; A4 94 | Load from zero page into Y register
    BVC $E8              ; 50 E8 | Branch if overflow clear
    LDY #$9A             ; A0 9A | Load immediate value into Y register
    BMI $5A              ; 30 5A | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    CMP $1A              ; C5 1A | Compare accumulator (zero page)
    SBC $D2              ; E5 D2 | Subtract with carry (zero page)
    SBC $6AB5            ; ED B5 6A | Subtract with carry (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ADC $BA              ; 65 BA | Add with carry (zero page)
    DEC                  ; 3A | Decrement accumulator
    CMP $2B7A            ; CD 7A 2B | Compare accumulator (absolute)
    SEP #$B6             ; E2 B6 | Set processor status bits
    PEA #$6FAB           ; F4 AB 6F | Push effective address to stack
    TXA                  ; 8A | Transfer X register to accumulator
    SBC ($1D,X)          ; E1 1D | Subtract with carry ((zero page,X))
    SBC #$28             ; E9 28 | Subtract with carry (immediate)
    SBC #$28             ; E9 28 | Subtract with carry (immediate)
    ADC $7FFF,X          ; 7D FF 7F | Add with carry (absolute,X)
    BCC $7F              ; 90 7F | Branch if carry clear
    ADC $1E8B,X          ; 7D 8B 1E | Add with carry (absolute,X)
    ADC $2F              ; 65 2F | Add with carry (zero page)
    EOR ($6E),Y          ; 51 6E | Exclusive OR with accumulator ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    INC $FFBE,X          ; FE BE FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F2
; Address: $E9E1F4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F2:
    INC $09FF,X          ; FE FF 09 | Increment (absolute,X)
    INC $D1BE,X          ; FE BE D1 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    CPX $ECFB            ; EC FB EC | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F3
; Address: $E9E200
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F3:
    JSL $B61422          ; 22 22 14 B6 | Jump to subroutine long
    SEP #$00             ; E2 00 | Set processor status bits
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BPL $0E              ; 10 0E | Branch if positive
    DEC $6060            ; CE 60 60 | Decrement (absolute)
    BNE $0D              ; D0 0D | Branch if not equal
    SEP #$0F             ; E2 0F | Set processor status bits
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    BPL $28              ; 10 28 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BRA $82              ; 80 82 | Branch always
    BCS $B2              ; B0 B2 | Branch if carry set
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F4
; Address: $E9E265
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F4:
    JSL $B04232          ; 22 32 42 B0 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    SBC $FD0A,X          ; FD 0A FD | Subtract with carry (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLY                  ; 7A | Pull Y register from stack
    BVS $C5              ; 70 C5 | Branch if overflow set
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F5
; Address: $E9E27B
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F5:
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $F3              ; 70 F3 | Branch if overflow set
    AND #$FD             ; 29 FD | Logical AND with accumulator (immediate)
    CMP #$1D             ; C9 1D | Compare accumulator (immediate)
    ASL $0DC4            ; 0E C4 0D | Arithmetic shift left (absolute)
    INY                  ; C8 | Increment Y register
    CMP $CD05            ; CD 05 CD | Compare accumulator (absolute)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    AND $DF              ; 25 DF | Logical AND with accumulator (zero page)
    CMP $35              ; C5 35 | Compare accumulator (zero page)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    TAY                  ; A8 | Transfer accumulator to Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CMP $E700            ; CD 00 E7 | Compare accumulator (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    ROL $206E            ; 2E 6E 20 | Rotate left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    BEQ $07              ; F0 07 | Branch if equal
    BNE $27              ; D0 27 | Branch if not equal
    BCS $41              ; B0 41 | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    CPX #$0D             ; E0 0D | Compare X register (immediate)
    SEP #$0F             ; E2 0F | Set processor status bits
    CPX #$0F             ; E0 0F | Compare X register (immediate)
    BRA $0F              ; 80 0F | Branch always
    BEQ $28              ; F0 28 | Branch if equal
    BPL $38              ; 10 38 | Branch if positive
    BPL $44              ; 10 44 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F6
; Address: $E9E305
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F6:
    BPL $54              ; 10 54 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    LSR $10              ; 46 10 | Logical shift right (zero page)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    JMP ($6C00)          ; 6C 00 6C | Jump to address (absolute indirect)
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    BPL $54              ; 10 54 | Branch if positive
    BPL $38              ; 10 38 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    LSR $10              ; 46 10 | Logical shift right (zero page)
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    JMP ($6C00)          ; 6C 00 6C | Jump to address (absolute indirect)
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    SBC ($C3),Y          ; F1 C3 | Subtract with carry ((zero page),Y)
    BEQ $C3              ; F0 C3 | Branch if equal
    SBC $BCC0,X          ; FD C0 BC | Subtract with carry (absolute,X)
    LDX $BF3E,Y          ; BE 3E BF | Load from absolute,Y into X register
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $FB              ; F0 FB | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $4C              ; F0 4C | Branch if equal
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F7
; Address: $E9E388
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F7:
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($946E)          ; 6C 6E 94 | Jump to address (absolute indirect)
    BCS $34              ; B0 34 | Branch if carry set
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)
    STA $30CF70          ; 8F 70 CF 30 | Store accumulator to absolute long address
    SBC #$16             ; E9 16 | Subtract with carry (immediate)
    SBC $0D12            ; ED 12 0D | Subtract with carry (absolute)
    SEP #$79             ; E2 79 | Set processor status bits
    STX $3A              ; 86 3A | Store X register to zero page
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F8
; Address: $E9E3A9
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F8:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEC                  ; 3A | Decrement accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLV                  ; B8 | Clear overflow flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $CF              ; 70 CF | Branch if overflow set
    BVS $4D              ; 70 4D | Branch if overflow set
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    CMP $CC05            ; CD 05 CC | Compare accumulator (absolute)
    ASL $CD              ; 06 CD | Arithmetic shift left (zero page)
    ORA $C8              ; 05 C8 | Logical OR with accumulator (zero page)
    DEC $CA06            ; CE 06 CA | Decrement (absolute)
    PLX                  ; FA | Pull X register from stack
    INC $3407,X          ; FE 07 34 | Increment (absolute,X)
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    SBC $F906,Y          ; F9 06 F9 | Subtract with carry (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 60 D8 27 | Store accumulator to absolute long,X
    BCC $90              ; 90 90 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive
    BEQ $00              ; F0 00 | Branch if equal
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1F9
; Address: $E9E41E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1F9:
    ASL $3AE0            ; 0E E0 3A | Arithmetic shift left (absolute)
    EOR ($21,X)          ; 41 21 | PPU graphics register access
    REP #$C8             ; C2 C8 | Reset processor status bits
    BIT $95              ; 24 95 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1FA
; Address: $E9E428
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1FA:
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    BIT $84              ; 24 84 | Test bits in accumulator (zero page)
    JMP $FF0082          ; 5C 82 00 FF | Jump to address long
    CPX $76              ; E4 76 | Compare X register (zero page)
    CPY $666E            ; CC 6E 66 | Compare Y register (absolute)
    BIT $36              ; 24 36 | Test bits in accumulator (zero page)
    LDX $36              ; A6 36 | Load from zero page into X register
    SEP #$62             ; E2 62 | Set processor status bits
    INX                  ; E8 | Increment X register
    ROR                  ; 6A | Rotate right (accumulator)
    DEY                  ; 88 | Decrement Y register
    ROR                  ; 6A | Rotate right (accumulator)
    ADC $9A              ; 65 9A | Add with carry (zero page)
    EOR $B2              ; 45 B2 | Exclusive OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    SBC $1A              ; E5 1A | Subtract with carry (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC $92              ; 65 92 | Add with carry (zero page)
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BIT $D72C            ; 2C 2C D7 | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    CPY $C4              ; C4 C4 | Compare Y register (zero page)
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    CMP $00              ; C5 00 | Compare accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    BIT $FFD3            ; 2C D3 FF | Test bits in accumulator (absolute)
    PLP                  ; 28 | Pull processor status from stack
    CPY $3B              ; C4 3B | Compare Y register (zero page)
    DEC                  ; 3A | Decrement accumulator
    CMP $0B              ; C5 0B | Compare accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    DEX                  ; CA | Decrement X register
    PHX                  ; DA | Push X register to stack
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $EE81,Y          ; D9 81 EE | Compare accumulator (absolute,Y)
    CPX $85              ; E4 85 | Compare X register (zero page)
    AND ($B1,X)          ; 21 B1 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $39F6,Y          ; 19 F6 39 | Logical OR with accumulator (absolute,Y)
    ADC $7FFE,X          ; 7D FE 7F | Add with carry (absolute,X)
    DEC $AF7F,X          ; DE 7F AF | Decrement (absolute,X)
    BCC $E7              ; 90 E7 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    WDM #$57             ; 42 57 | Reserved instruction
    BCC $55              ; 90 55 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1FB
; Address: $E9E4AB
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1FB:
    LDA $3B29,X          ; BD 29 3B | Load from absolute,X into accumulator
    LDX #$E7             ; A2 E7 | Load immediate value into X register
    BNE $2F              ; D0 2F | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    LDY $BD5B            ; AC 5B BD | Load from absolute address into Y register
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    EOR $84BA,X          ; 5D BA 84 | Exclusive OR with accumulator (absolute,X)
    CPX $9D62            ; EC 62 9D | Compare X register (absolute)
    LSR $B9              ; 46 B9 | Logical shift right (zero page)
    INY                  ; C8 | Increment Y register
    SEC                  ; 38 | Set carry flag
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    BMI $08              ; 30 08 | Branch if negative
    ROL                  ; 2A | Rotate left (accumulator)
    INC $89              ; E6 89 | Increment (zero page)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1FC
; Address: $E9E4F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1FC:
    JSR $00DE            ; 20 DE 00 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    STA ($01,X)          ; 81 01 | Store accumulator to (zero page,X)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1FD
; Address: $E9E50A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1FD:
    PHA                  ; 48 | Push accumulator to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($F8),Y          ; 71 F8 | Add with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_1FE
; Address: $E9E51B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_1FE:
    SED                  ; F8 | Set decimal mode flag
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    AND $2700            ; 2D 00 27 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_200
; Address: $E9E52A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_200:
    PHP                  ; 08 | Push processor status to stack
    ASL $202E            ; 0E 2E 20 | Arithmetic shift left (absolute)
    ROR                  ; 6A | Rotate right (accumulator)
    BCC $6B              ; 90 6B | Branch if carry clear
    BCC $67              ; 90 67 | Branch if carry clear
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $4F              ; B0 4F | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    BCC $67              ; 90 67 | Branch if carry clear
    BCC $61              ; 90 61 | Branch if carry clear
    BCS $4F              ; B0 4F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_201
; Address: $E9E541
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_201:
    SBC $322D,X          ; FD 2D 32 | Subtract with carry (absolute,X)
    BIT $002C            ; 2C 2C 00 | Test bits in accumulator (absolute)
    STA                  ; 9F 7F 1F 3F | Store accumulator to absolute long,X
    BPL $3F              ; 10 3F | Branch if positive
    AND $F2C6,Y          ; 39 C6 F2 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_202
; Address: $E9E565
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_202:
    PEA #$888C           ; F4 8C 88 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    INC $0CF9,X          ; FE F9 0C | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    BVS $FC              ; 70 FC | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_205
; Address: $E9E588
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_205:
    JSR $2863            ; 20 63 28 | Jump to subroutine
    PLA                  ; 68 | Pull accumulator from stack
    ASL $002E            ; 0E 2E 00 | Arithmetic shift left (absolute)
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $47              ; B0 47 | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    BCC $6F              ; 90 6F | Branch if carry clear
    BCS $4F              ; B0 4F | Branch if carry set
    BCS $47              ; B0 47 | Branch if carry set
    BCC $61              ; 90 61 | Branch if carry clear
    BCC $6F              ; 90 6F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_206
; Address: $E9E5A0
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_206:
    JSL $B61422          ; 22 22 14 B6 | Jump to subroutine long
    SEP #$02             ; E2 02 | Set processor status bits
    SEP #$02             ; E2 02 | Set processor status bits
    WDM #$0F             ; 42 0F | Reserved instruction
    BNE $0D              ; D0 0D | Branch if not equal
    SEP #$0D             ; E2 0D | Set processor status bits
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0D              ; F0 0D | Branch if equal
    SEP #$0F             ; E2 0F | Set processor status bits
    BRA $0F              ; 80 0F | Branch always
    BEQ $22              ; F0 22 | Branch if equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_207
; Address: $E9E5C2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_207:
    JSR $2629            ; 20 29 26 | Jump to subroutine
    ROL $2E              ; 26 2E | Rotate left (zero page)
    ROL $2E2C            ; 2E 2C 2E | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_208
; Address: $E9E5CA
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_208:
    JSL $020022          ; 22 22 00 02 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $B04DB0          ; 8F B0 4D B0 | Store accumulator to absolute long address
    BCS $49              ; B0 49 | Branch if carry set
    BCS $41              ; B0 41 | Branch if carry set
    LDA $BF42,X          ; BD 42 BF | Load from absolute,X into accumulator
    RTI                  ; 40 | Return from interrupt
    BRA $7F              ; 80 7F | Branch always
    PLX                  ; FA | Pull X register from stack
    STA $82              ; 85 82 | Store accumulator to zero page
    STY $86              ; 84 86 | Store Y register to zero page
    BPL $D0              ; 10 D0 | Branch if positive
    DEX                  ; CA | Decrement X register
    XBA                  ; EB | Exchange accumulator bytes
    BVS $0F              ; 70 0F | Branch if overflow set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_20A
; Address: $E9E5F7
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_20A:
    JSL $FD807F          ; 22 7F 80 FD | Jump to subroutine long
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    AND $EFDC,X          ; 3D DC EF | Logical AND with accumulator (absolute,X)
    ROL $FFC9,X          ; 3E C9 FF | Rotate left (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDY $FF              ; A4 FF | Load from zero page into Y register
    STA $B37F,X          ; 9D 7F B3 | Store accumulator to absolute,X
    ADC $FED7,X          ; 7D D7 FE | Add with carry (absolute,X)
    STA $00FF,Y          ; 99 FF 00 | Store accumulator to absolute,Y
    BIT $00FF            ; 2C FF 00 | Test bits in accumulator (absolute)
    SBC $A200,Y          ; F9 00 A2 | Subtract with carry (absolute,Y)
    LDA ($00),Y          ; B1 00 | Load from (zero page),Y into accumulator
    INY                  ; C8 | Increment Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    SEP #$B6             ; E2 B6 | Set processor status bits
    PEA #$6FAB           ; F4 AB 6F | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    ADC $7FFF,X          ; 7D FF 7F | Add with carry (absolute,X)
    BCC $7F              ; 90 7F | Branch if carry clear
    ADC $1E0B,X          ; 7D 0B 1E | Add with carry (absolute,X)
    ADC $2F              ; 65 2F | Add with carry (zero page)
    BVC $6E              ; 50 6E | Branch if overflow clear
    BRA $B8              ; 80 B8 | Branch always
    BCC $14              ; 90 14 | Branch if carry clear
    BCC $14              ; 90 14 | Branch if carry clear
    INC $FFBE,X          ; FE BE FF | Increment (absolute,X)
    INC $09FF,X          ; FE FF 09 | Increment (absolute,X)
    INC $D0BE,X          ; FE BE D0 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $FFF8            ; EC F8 FF | Compare X register (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    AND #$1D             ; 29 1D | Logical AND with accumulator (immediate)
    ORA #$1D             ; 09 1D | Logical OR with accumulator (immediate)
    ASL $0D04            ; 0E 04 0D | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_20B
; Address: $E9E6CC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_20B:
    ORA $0D05            ; 0D 05 0D | Logical OR with accumulator (absolute)
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA $1F              ; 05 1F | Logical OR with accumulator (zero page)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY $B894            ; CC 94 B8 | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BCC $B8              ; 90 B8 | Branch if carry clear
    BNE $78              ; D0 78 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_20C
; Address: $E9E6E9
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_20C:
    BCS $E0              ; B0 E0 | Game work RAM access
    BCC $E0              ; 90 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    BCC $78              ; 90 78 | Branch if carry clear
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BEQ $A8              ; F0 A8 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_20D
; Address: $E9E700
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_20D:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    STA $C0              ; 85 C0 | Store accumulator to zero page
    LDA                  ; BF C0 A0 CC | Load from absolute long,X into accumulator
    LDA $C7EF8B          ; AF 8B EF C7 | Load from absolute long address into accumulator
    LDY $EC87            ; AC 87 EC | Load from absolute address into Y register
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    SBC ($0E),Y          ; F1 0E | Subtract with carry ((zero page),Y)
    CPY $99CF            ; CC CF 99 | Compare Y register (absolute)
    ADC $E363,Y          ; 79 63 E3 | Add with carry (absolute,Y)
    BMI $FF              ; 30 FF | Branch if negative
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ORA $0C05            ; 0D 05 0C | Logical OR with accumulator (absolute)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ORA $08              ; 05 08 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_20E
; Address: $E9E768
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_20E:
    ASL $0A06            ; 0E 06 0A | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0407            ; 0E 07 04 | Arithmetic shift left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_20F
; Address: $E9E780
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_20F:
    JSR $A090            ; 20 90 A0 | Jump to subroutine
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $A0              ; 90 A0 | Branch if carry clear
    BCC $A0              ; 90 A0 | Branch if carry clear
    BCC $E0              ; 90 E0 | Game work RAM access
    BCC $E0              ; 90 E0 | Game work RAM access
    BCC $A0              ; 90 A0 | Branch if carry clear
    BCC $50              ; 90 50 | Branch if carry clear
    LDY #$D0             ; A0 D0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_210
; Address: $E9E793
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_210:
    JSR $E010            ; 20 10 E0 | Game work RAM access
    BNE $20              ; D0 20 | Branch if not equal
    BNE $20              ; D0 20 | Branch if not equal
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear
    BNE $20              ; D0 20 | Branch if not equal
    AND $EE2D            ; 2D 2D EE | Logical AND with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_213
; Address: $E9E7A9
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_213:
    BVS $64              ; 70 64 | Branch if overflow set
    BVS $0B              ; 70 0B | Branch if overflow set
    INC $E011            ; EE 11 E0 | Game work RAM access
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    BVS $F7              ; 70 F7 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    CPY $CAAB            ; CC AB CA | Compare Y register (absolute)
    LDA $C5A7C2          ; AF C2 A7 C5 | Load from absolute long address into accumulator
    LDA $8D              ; A5 8D | Load from zero page into accumulator
    SBC $A9C9            ; ED C9 A9 | Subtract with carry (absolute)
    REP #$AB             ; C2 AB | Reset processor status bits
    DEC $AF              ; C6 AF | Decrement (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    CLC                  ; 18 | Clear carry flag
    INC                  ; 1A | Increment accumulator
    BPL $FF              ; 10 FF | Branch if positive
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F DE A6 57 | Store accumulator to absolute long,X
    BIT $F89B            ; 2C 9B F8 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_214
; Address: $E9E7EC
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_214:
    LDY $AC73,X          ; BC 73 AC | Load from absolute,X into Y register
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_215
; Address: $E9E7F4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_215:
    RTI                  ; 40 | Return from interrupt
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    BPL $FF              ; 10 FF | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_216
; Address: $E9E801
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_216:
    JSR $8043            ; 20 43 80 | Jump to subroutine
    BRA $9C              ; 80 9C | Branch always
    LDY $8704,X          ; BC 04 87 | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 78 87 86 | Load from absolute long,X into accumulator
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLP                  ; 28 | Pull processor status from stack
    BVC $7F              ; 50 7F | Branch if overflow clear
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$08             ; E0 08 | Compare X register (immediate)
    BEQ $04              ; F0 04 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPX #$50             ; E0 50 | Compare X register (immediate)
    BEQ $28              ; F0 28 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $030B,X          ; FE 0B 03 | Increment (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $EE81,Y          ; D9 81 EE | Compare accumulator (absolute,Y)
    CPX $85              ; E4 85 | Compare X register (zero page)
    AND ($B1,X)          ; 21 B1 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA $3936,Y          ; 19 36 39 | Logical OR with accumulator (absolute,Y)
    ADC $7FFE,X          ; 7D FE 7F | Add with carry (absolute,X)
    DEC $A07F,X          ; DE 7F A0 | Decrement (absolute,X)
    BCC $E8              ; 90 E8 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $55              ; 90 55 | Branch if carry clear
    LDA $3B29,X          ; BD 29 3B | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_217
; Address: $E9E88E
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_217:
    LDX #$E7             ; A2 E7 | Load immediate value into X register
    BNE $20              ; D0 20 | Branch if not equal
    BCC $68              ; 90 68 | Branch if carry clear
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $EF7BBC          ; 5C BC 7B EF | Jump to address long
    PLX                  ; FA | Pull X register from stack
    EOR $B6BA,X          ; 5D BA B6 | Exclusive OR with accumulator (absolute,X)
    ROR $34B0            ; 6E B0 34 | Rotate right (absolute)
    CPY $66              ; C4 66 | Compare Y register (zero page)
    LSR $76              ; 46 76 | Logical shift right (zero page)
    DEC $76              ; C6 76 | Decrement (zero page)
    DEY                  ; 88 | Decrement Y register
    ROL                  ; 2A | Rotate left (accumulator)
    BRA $8F              ; 80 8F | Branch always
    BVS $8D              ; 70 8D | Branch if overflow set
    ADC $4586,Y          ; 79 86 45 | Add with carry (absolute,Y)
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    ORA $F2              ; 05 F2 | Logical OR with accumulator (zero page)
    ORA $0C05,Y          ; 19 05 0C | Logical OR with accumulator (absolute,Y)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVC $7F              ; 50 7F | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    INC                  ; 1A | Increment accumulator
    ORA $060F            ; 0D 0F 06 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    INC $08              ; E6 08 | Increment (zero page)
    CPY $9810            ; CC 10 98 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_219
; Address: $E9E8EB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_219:
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC $FE16,X          ; FE 16 FE | Increment (absolute,X)
    BIT $58FC            ; 2C FC 58 | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    BCS $F0              ; B0 F0 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_21A
; Address: $E9E8FB
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_21A:
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $3E              ; 80 3E | Branch always
    ROR $BE8C,X          ; 7E 8C BE | Rotate right (absolute,X)
    ORA ($9B,X)          ; 01 9B | Logical OR with accumulator ((zero page,X))
    CPX $E6              ; E4 E6 | Compare X register (zero page)
    ROL $417E,X          ; 3E 7E 41 | Rotate left (absolute,X)
    EOR ($E2,X)          ; 41 E2 | Exclusive OR with accumulator ((zero page,X))
    BPL $10              ; 10 10 | Branch if positive
    LDA                  ; BF 40 8D 72 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_21B
; Address: $E9E914
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_21B:
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    STA ($1A,X)          ; 81 1A | Store accumulator to (zero page,X)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    SEP #$1D             ; E2 1D | Set processor status bits
    CPY $DE              ; C4 DE | Compare Y register (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($11),Y          ; 11 11 | Logical OR with accumulator ((zero page),Y)
    LDA                  ; BF BF 51 D1 | Load from absolute long,X into accumulator
    PHA                  ; 48 | Push accumulator to stack
    EOR $0303,X          ; 5D 03 03 | Exclusive OR with accumulator (absolute,X)
    CPX $1B              ; E4 1B | Compare X register (zero page)
    INC $0EE1,X          ; FE E1 0E | Increment (absolute,X)
    LDY #$48             ; A0 48 | Load immediate value into Y register
    STA $42BD            ; 8D BD 42 | Hardware register operation
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    BMI $42              ; 30 42 | Hardware register operation
    LDA $00FF,X          ; BD FF 00 | Load from absolute,X into accumulator
    SBC $FF40            ; ED 40 FF | Subtract with carry (absolute)
    BEQ $57              ; F0 57 | Branch if equal
    LDA $5BEF58          ; AF 58 EF 5B | Load from absolute long address into accumulator
    SBC $FF5B            ; ED 5B FF | Subtract with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    BCC $FC              ; 90 FC | Branch if carry clear
    ROL $FBF9,X          ; 3E F9 FB | Rotate left (absolute,X)
    ORA $FEEB,X          ; 1D EB FE | Logical OR with accumulator (absolute,X)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    LDA $ED5B            ; AD 5B ED | Load from absolute address into accumulator
    SBC $BF5E            ; ED 5E BF | Subtract with carry (absolute)
    JMP $A957EB          ; 5C EB 57 A9 | Jump to address long
    INC $42FF            ; EE FF 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SBC $CFBE,X          ; FD BE CF | Subtract with carry (absolute,X)
    CMP ($7F),Y          ; D1 7F | Compare accumulator ((zero page),Y)
    INC $EEF5            ; EE F5 EE | Increment (absolute)
    LDA $F3F6            ; AD F6 F3 | Load from absolute address into accumulator
    LDA $00FF,X          ; BD FF 00 | Load from absolute,X into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    LDX $D967,Y          ; BE 67 D9 | Load from absolute,Y into X register
    LDA $2858EF          ; AF EF 58 28 | Load from absolute long address into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    INC $3DCB,X          ; FE CB 3D | Increment (absolute,X)
    CPX $FF92            ; EC 92 FF | Compare X register (absolute)
    JMP ($FFFF)          ; 6C FF FF | Jump to address (absolute indirect)
    LDA $FFFF,Y          ; B9 FF FF | Load from absolute,Y into accumulator
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_21C
; Address: $E9EA48
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_21C:
    STA $F9FF,Y          ; 99 FF F9 | Store accumulator to absolute,Y
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    PHA                  ; 48 | Push accumulator to stack
    DEY                  ; 88 | Decrement Y register
    LDY $0F77            ; AC 77 0F | Load from absolute address into Y register
    RTI                  ; 40 | Return from interrupt
    ROR $20C1,X          ; 7E C1 20 | Rotate right (absolute,X)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$37             ; E0 37 | Compare X register (immediate)
    LDA                  ; BF 30 CF A3 | Load from absolute long,X into accumulator
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($35),Y          ; 11 35 | Logical OR with accumulator ((zero page),Y)
    INC $FFF0            ; EE F0 FF | Increment (absolute)
    INC $7C02,X          ; FE 02 7C | Increment (absolute,X)
    STA ($04,X)          ; 81 04 | Store accumulator to (zero page,X)
    CPX $00FF            ; EC FF 00 | Compare X register (absolute)
    SBC $F30C,X          ; FD 0C F3 | Subtract with carry (absolute,X)
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    BRA $A4              ; 80 A4 | Branch always
    LDY $5F              ; A4 5F | Load from zero page into Y register
    STA $30E1            ; 8D E1 30 | Store accumulator to absolute address
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    LDY $F30D,X          ; BC 0D F3 | Load from absolute,X into Y register
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    LDA $1FFF,Y          ; B9 FF 1F | Load from absolute,Y into accumulator
    LDA                  ; BF FF FF FF | Load from absolute long,X into accumulator
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    STA                  ; 9F FF 9D FF | Store accumulator to absolute long,X
    CPY #$6F             ; C0 6F | Compare Y register (immediate)
    BNE $2B              ; D0 2B | Branch if not equal
    AND $3FC2,X          ; 3D C2 3F | Logical AND with accumulator (absolute,X)
    CPY #$76             ; C0 76 | Compare Y register (immediate)
    CMP #$FC             ; C9 FC | Compare accumulator (immediate)
    TSX                  ; BA | Transfer stack pointer to X register
    BCS $05              ; B0 05 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    STY $8213            ; 8C 13 82 | Store Y register to absolute address
    LDY #$0C             ; A0 0C | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SBC $CD12            ; ED 12 CD | Subtract with carry (absolute)
    REP #$3F             ; C2 3F | Reset processor status bits
    LDX #$07             ; A2 07 | Load immediate value into X register
    LDY #$05             ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_21D
; Address: $E9EB33
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_21D:
    PLP                  ; 28 | Pull processor status from stack
    ORA $E8              ; 05 E8 | Logical OR with accumulator (zero page)
    INY                  ; C8 | Increment Y register
    ORA #$30             ; 09 30 | Logical OR with accumulator (immediate)
    EOR #$30             ; 49 30 | Exclusive OR with accumulator (immediate)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BCS $42              ; B0 42 | Hardware register operation
    LDY #$54             ; A0 54 | Load immediate value into Y register
    BCC $78              ; 90 78 | Branch if carry clear
    LDY #$70             ; A0 70 | Load immediate value into Y register
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    STX $8C00            ; 8E 00 8C | Store X register to absolute address
    DEY                  ; 88 | Decrement Y register
    BCC $00              ; 90 00 | Branch if carry clear
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA $093A,X          ; 1D 3A 09 | Logical OR with accumulator (absolute,X)
    ASL $0E05,X          ; 1E 05 0E | Arithmetic shift left (absolute,X)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $FF00,X          ; BD 00 FF | Load from absolute,X into accumulator
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    SEP #$5F             ; E2 5F | Set processor status bits
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    WDM #$FF             ; 42 FF | Reserved instruction
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    ADC $7C83,X          ; 7D 83 7C | Add with carry (absolute,X)
    SBC $BBEF,X          ; FD EF BB | Subtract with carry (absolute,X)
    LDA $EF5C,X          ; BD 5C EF | Load from absolute,X into accumulator
    ROL $FFC9,X          ; 3E C9 FF | Rotate left (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative
    BMI $FF              ; 30 FF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    XBA                  ; EB | Exchange accumulator bytes
    ROR $FED5,X          ; 7E D5 FE | Rotate right (absolute,X)
    ORA #$7E             ; 09 7E | Logical OR with accumulator (immediate)
    STZ $B27F            ; 9C 7F B2 | Store zero to absolute
    INC $FF99,X          ; FE 99 FF | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_21E
; Address: $E9EBD7
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_21E:
    BIT $00FF            ; 2C FF 00 | Test bits in accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $0F              ; 80 0F | Branch always
    BCC $15              ; 90 15 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    STY $11              ; 84 11 | Store Y register to zero page
    INC                  ; 1A | Increment accumulator
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    ORA #$AD             ; 09 AD | Logical OR with accumulator (immediate)
    BPL $13              ; 10 13 | Branch if positive
    BIT $84              ; 24 84 | Test bits in accumulator (zero page)
    JMP $00FF82          ; 5C 82 FF 00 | Jump to address long
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    XBA                  ; EB | Exchange accumulator bytes
    DEY                  ; 88 | Decrement Y register
    LSR                  ; 4A | Logical shift right (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    AND ($DE,X)          ; 21 DE | Logical AND with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    TXA                  ; 8A | Transfer X register to accumulator
    ROL $59E7,X          ; 3E E7 59 | Rotate left (absolute,X)
    LDA                  ; BF F8 D7 FB | Load from absolute long,X into accumulator
    STA $FB77            ; 8D 77 FB | Store accumulator to absolute address
    CLC                  ; 18 | Clear carry flag
    INC $3CC7,X          ; FE C7 3C | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    LDY $FEEB,X          ; BC EB FE | Load from absolute,X into Y register
    STA $7E              ; 85 7E | Store accumulator to zero page
    STZ $E4FF            ; 9C FF E4 | Store zero to absolute
    PHY                  ; 5A | Push Y register to stack
    BRA $80              ; 80 80 | Branch always
    STY $0CBC            ; 8C BC 0C | Store Y register to absolute address
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    INC $8200,X          ; FE 00 82 | Increment (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    BVS $03              ; 70 03 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $0200,X          ; FE 00 02 | Increment (absolute,X)
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $03              ; F0 03 | Branch if equal
    BEQ $40              ; F0 40 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_223
; Address: $E9ED0C
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_223:
    JSL $070062          ; 22 62 00 07 | Jump to subroutine long
    BNE $2F              ; D0 2F | Branch if not equal
    BCS $47              ; B0 47 | Branch if carry set
    BCS $4F              ; B0 4F | Branch if carry set
    BNE $27              ; D0 27 | Branch if not equal
    BNE $27              ; D0 27 | Branch if not equal
    BCS $47              ; B0 47 | Branch if carry set
    BCS $4D              ; B0 4D | Branch if carry set
    BEQ $0F              ; F0 0F | Branch if equal
    INC                  ; 1A | Increment accumulator
    STA ($11,X)          ; 81 11 | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    STY $15              ; 84 15 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    ORA #$90             ; 09 90 | Logical OR with accumulator (immediate)
    STY $14              ; 84 14 | Store Y register to zero page
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    ADC ($70),Y          ; 71 70 | Add with carry ((zero page),Y)
    LDA #$A9             ; A9 A9 | Load immediate value into accumulator
    PHX                  ; DA | Push X register to stack
    BCS $EF              ; B0 EF | Branch if carry set
    LDY #$BD             ; A0 BD | Load immediate value into Y register
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    INC                  ; 1A | Increment accumulator
    AND $13              ; 25 13 | Logical AND with accumulator (zero page)
    BIT $6F10            ; 2C 10 6F | Test bits in accumulator (absolute)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    PHX                  ; DA | Push X register to stack
    PHX                  ; DA | Push X register to stack
    PLP                  ; 28 | Pull processor status from stack
    BPL $01              ; 10 01 | Branch if positive
    ROR $0002            ; 6E 02 00 | Rotate right (absolute)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHX                  ; DA | Push X register to stack
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    BPL $EF              ; 10 EF | Branch if positive
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_224
; Address: $E9ED82
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_224:
    BIT $0C2C            ; 2C 2C 0C | Test bits in accumulator (absolute)
    ROR $06              ; 66 06 | Rotate right (zero page)
    ORA $A70F            ; 0D 0F A7 | Logical OR with accumulator (absolute)
    EOR $47              ; 45 47 | Exclusive OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$FE00           ; F4 00 FE | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 80 80 81 | Load from absolute long,X into accumulator
    STA ($A2,X)          ; 81 A2 | Store accumulator to (zero page,X)
    STA $BD              ; 85 BD | Store accumulator to zero page
    LDA $0000,X          ; BD 00 00 | Load from absolute,X into accumulator
    LDA                  ; BF 80 98 E6 | Load from absolute long,X into accumulator
    INC $41              ; E6 41 | Increment (zero page)
    ORA ($43,X)          ; 01 43 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $0101,Y          ; 19 01 01 | Logical OR with accumulator (absolute,Y)
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    EOR $A1              ; 45 A1 | Exclusive OR with accumulator (zero page)
    ADC $087D            ; 6D 7D 08 | Add with carry (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $EC              ; 10 EC | Branch if positive
    BRA $C2              ; 80 C2 | Branch always
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    CPX $9200            ; EC 00 92 | Compare X register (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_225
; Address: $E9EDE4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_225:
    JSL $BDBD05          ; 22 05 BD BD | Jump to subroutine long
    LDA                  ; BF 80 98 E6 | Load from absolute long,X into accumulator
    INC $01              ; E6 01 | Increment (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    WDM #$00             ; 42 00 | Reserved instruction
    ORA $0000,Y          ; 19 00 00 | Logical OR with accumulator (absolute,Y)
    BRA $80              ; 80 80 | Branch always
    LDY #$6D             ; A0 6D | Load immediate value into Y register
    ADC $1808            ; 6D 08 18 | Add with carry (absolute)
    BPL $EC              ; 10 EC | Branch if positive
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX $8210            ; EC 10 82 | Compare X register (absolute)
    SEP #$E3             ; E2 E3 | Set processor status bits
    BRA $9B              ; 80 9B | Branch always
    STA ($BF,X)          ; 81 BF | Store accumulator to (zero page,X)
    STA $BF              ; 85 BF | Store accumulator to zero page
    CMP ($DF,X)          ; C1 DF | Compare accumulator ((zero page,X))
    CPY #$C7             ; C0 C7 | Compare Y register (immediate)
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    BRA $1D              ; 80 1D | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_226
; Address: $E9EE34
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_226:
    BRA $7F              ; 80 7F | Branch always
    STA ($7E,X)          ; 81 7E | Store accumulator to (zero page,X)
    STA $7A              ; 85 7A | Store accumulator to zero page
    STA ($3E,X)          ; 81 3E | Store accumulator to (zero page,X)
    BRA $3F              ; 80 3F | Branch always
    BRA $01              ; 80 01 | Branch always
    XBA                  ; EB | Exchange accumulator bytes
    NOP                  ; EA | No operation
    ORA ($78,X)          ; 01 78 | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($FC,X)          ; 01 FC | Logical OR with accumulator ((zero page,X))
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    AND ($34,X)          ; 21 34 | Logical AND with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    EOR $60              ; 45 60 | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($0E),Y          ; 11 0E | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_227
; Address: $E9EE7A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_227:
    JSL $1B251D          ; 22 1D 25 1B | Jump to subroutine long
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $68              ; 06 68 | Arithmetic shift left (zero page)
    PHB                  ; 8B | Push data bank register to stack
    ROR $A50C,X          ; 7E 0C A5 | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_228
; Address: $E9EE91
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_228:
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 6F 7D BE | Store accumulator to absolute long,X
    BCS $F0              ; B0 F0 | Branch if carry set
    BCS $E4              ; B0 E4 | Branch if carry set
    LDY $B4              ; A4 B4 | Load from zero page into Y register
    BEQ $86              ; F0 86 | Branch if equal
    CPX $92              ; E4 92 | Compare X register (zero page)
    BEQ $B6              ; F0 B6 | Branch if equal
    PEA #$FABA           ; F4 BA FA | Push effective address to stack
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    XBA                  ; EB | Exchange accumulator bytes
    INC                  ; 1A | Increment accumulator
    SBC $D8              ; E5 D8 | Subtract with carry (zero page)
    BPL $DA              ; 10 DA | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ORA $6301            ; 0D 01 63 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_22A
; Address: $E9EED4
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_22A:
    BPL $EF              ; 10 EF | Branch if positive
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 01 FE 60 | Load from absolute long,X into accumulator
    STA                  ; 9F 00 FF CB | Store accumulator to absolute long,X
    SBC $170F,X          ; FD 0F 17 | Subtract with carry (absolute,X)
    EOR $085F,X          ; 5D 5F 08 | Exclusive OR with accumulator (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    CLI                  ; 58 | Clear interrupt disable flag
    ADC $427F,X          ; 7D 7F 42 | Hardware register operation
    WDM #$00             ; 42 00 | Reserved instruction
    STA $05              ; 85 05 | Store accumulator to zero page
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    SBC $FF02,X          ; FD 02 FF | Subtract with carry (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    SBC $7FEA,X          ; FD EA 7F | Subtract with carry (absolute,X)
    INX                  ; E8 | Increment X register
    SEI                  ; 78 | Set interrupt disable flag
    STY $108C            ; 8C 8C 10 | Store Y register to absolute address
    BPL $31              ; 10 31 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_22B
; Address: $E9EF27
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_22B:
    JSR $0011            ; 20 11 00 | Jump to subroutine
    EOR ($45,X)          ; 41 45 | Exclusive OR with accumulator ((zero page,X))
    ORA ($2A),Y          ; 11 2A | Logical OR with accumulator ((zero page),Y)
    STY $FF              ; 84 FF | Store Y register to zero page
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ORA $17FF,Y          ; 19 FF 17 | Logical OR with accumulator (absolute,Y)
    INC $EE17,X          ; FE 17 EE | Increment (absolute,X)
    SBC $110A,X          ; FD 0A 11 | Subtract with carry (absolute,X)
    CMP ($C7,X)          ; C1 C7 | Compare accumulator ((zero page,X))
    REP #$90             ; C2 90 | Reset processor status bits
    LDY $848C            ; AC 8C 84 | Load from absolute address into Y register
    BRA $88              ; 80 88 | Branch always
    DEY                  ; 88 | Decrement Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $80              ; 90 80 | Branch if carry clear
    DEC $8D27,X          ; DE 27 8D | Decrement (absolute,X)
    ROR $7C8F,X          ; 7E 8F 7C | Rotate right (absolute,X)
    JMP $58BF            ; 4C BF 58 | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag
    LDX $2551,Y          ; BE 51 25 | Load from absolute,Y into X register
    STA $E80CA6          ; 8F A6 0C E8 | Store accumulator to absolute long address
    ROR $70              ; 66 70 | Rotate right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))
    INC                  ; 1A | Increment accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_22C
; Address: $E9EF71
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_22C:
    LDA                  ; BF FF BF BF | Load from absolute long,X into accumulator
    LDA                  ; BF 3F DF 87 | Load from absolute long,X into accumulator
    PLX                  ; FA | Pull X register from stack
    TSX                  ; BA | Transfer stack pointer to X register
    BRA $BF              ; 80 BF | Branch always
    INY                  ; C8 | Increment Y register
    INC $7FFF,X          ; FE FF 7F | Increment (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    ASL $FB              ; 06 FB | Arithmetic shift left (zero page)
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    LDA $C1FF,X          ; BD FF C1 | Load from absolute,X into accumulator
    ORA ($FD),Y          ; 11 FD | Logical OR with accumulator ((zero page),Y)
    INC $00FE,X          ; FE FE 00 | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $80FE,X          ; FE FE 80 | Increment (absolute,X)
    LDA                  ; BF 81 91 8C | Load from absolute long,X into accumulator
    LDY $CDCC,X          ; BC CC CD | Load from absolute,X into Y register
    ADC $8CFD,Y          ; 79 FD 8C | Add with carry (absolute,Y)
    STY $D111            ; 8C 11 D1 | Store Y register to absolute address
    DEX                  ; CA | Decrement X register
    XBA                  ; EB | Exchange accumulator bytes
    ROR $7003,X          ; 7E 03 70 | Rotate right (absolute,X)
    AND ($7B),Y          ; 31 7B | Logical AND with accumulator ((zero page),Y)
    STY $FF              ; 84 FF | Store Y register to zero page
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $9CE8,X          ; FD E8 9C | Subtract with carry (absolute,X)
    EOR ($82),Y          ; 51 82 | Exclusive OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_22D
; Address: $E9F00B
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_22D:
    CMP ($0C,X)          ; C1 0C | Compare accumulator ((zero page,X))
    BVC $51              ; 50 51 | Branch if overflow clear
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    PEA #$FCFF           ; F4 FF FC | Push effective address to stack
    LDA $7B02FF          ; AF FF 02 7B | Load from absolute long address into accumulator
    CPY #$D9             ; C0 D9 | Compare Y register (immediate)
    LDX $7CBE,Y          ; BE BE 7C | Load from absolute,Y into X register
    ROR $4242,X          ; 7E 42 42 | Hardware register operation
    RTI                  ; 40 | Return from interrupt
    WDM #$0A             ; 42 0A | Reserved instruction
    STA $00FD00          ; 8F 00 FD 00 | Store accumulator to absolute long address
    CPY #$09             ; C0 09 | Compare Y register (immediate)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    ADC $7F82,X          ; 7D 82 7F | Add with carry (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    PLX                  ; FA | Pull X register from stack
    STA $2B              ; 85 2B | Store accumulator to zero page
    SEP #$B6             ; E2 B6 | Set processor status bits
    PEA #$68AB           ; F4 AB 68 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_22E
; Address: $E9F047
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_22E:
    SED                  ; F8 | Set decimal mode flag
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SBC $CE0A            ; ED 0A CE | Subtract with carry (absolute)
    ADC $7FFF,X          ; 7D FF 7F | Add with carry (absolute,X)
    SBC $F700,Y          ; F9 00 F7 | Subtract with carry (absolute,Y)
    ADC $2F              ; 65 2F | Add with carry (zero page)
    BRA $60              ; 80 60 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $B7              ; 10 B7 | Branch if positive
    BVC $73              ; 50 73 | Branch if overflow clear
    INC $FFBE,X          ; FE BE FF | Increment (absolute,X)
    INC $E9FF,X          ; FE FF E9 | Increment (absolute,X)
    INC $E0FF,X          ; FE FF E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank52_DmaFunction_22F
; Address: $E9F07A
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_22F:
    JSR $009F            ; 20 9F 00 | Jump to subroutine
    LDA $80C090          ; AF 90 C0 80 | Load from absolute long address into accumulator
    CMP ($80),Y          ; D1 80 | Compare accumulator ((zero page),Y)
    BRA $81              ; 80 81 | Branch always
    STA ($C3,X)          ; 81 C3 | Store accumulator to (zero page,X)
    BRA $91              ; 80 91 | Branch always
    BRA $93              ; 80 93 | Branch always
    BCC $C2              ; 90 C2 | Branch if carry clear
    LDX $BC51,Y          ; BE 51 BC | Load from absolute,Y into X register
    LDY $BC53,X          ; BC 53 BC | Load from absolute,X into Y register
    LDA $BC52,X          ; BD 52 BC | Load from absolute,X into accumulator
    LDY $BC53,X          ; BC 53 BC | Load from absolute,X into Y register
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    JMP ($4F81)          ; 6C 81 4F | Jump to address (absolute indirect)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $12              ; 80 12 | Branch always
    AND ($DF,X)          ; 21 DF | Logical AND with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 12 ED B0 | Load from absolute long,X into accumulator
    EOR $DD20            ; 4D 20 DD | Exclusive OR with accumulator (absolute)
    BIT $6DD3            ; 2C D3 6D | Test bits in accumulator (absolute)
    BRA $7D              ; 80 7D | Branch always
    EOR $C820            ; 4D 20 C8 | Exclusive OR with accumulator (absolute)
    INY                  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_230
; Address: $E9F0C5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_230:
    JSR $0990            ; 20 90 09 | Jump to subroutine
    LDY #$19             ; A0 19 | Load immediate value into Y register
    BPL $29              ; 10 29 | Branch if positive
    DEY                  ; 88 | Decrement Y register
    EOR ($51,X)          ; 41 51 | Exclusive OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    PHB                  ; 8B | Push data bank register to stack
    PLB                  ; AB | Pull data bank register from stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_231
; Address: $E9F0F8
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_231:
    AND $0B00,X          ; 3D 00 0B | Logical AND with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHA                  ; 48 | Push accumulator to stack
    ROR $98              ; 66 98 | Rotate right (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    STA ($83,X)          ; 81 83 | Store accumulator to (zero page,X)
    STA ($D3,X)          ; 81 D3 | Store accumulator to (zero page,X)
    LDX $BE51,Y          ; BE 51 BE | Load from absolute,Y into X register
    EOR ($BD),Y          ; 51 BD | Exclusive OR with accumulator ((zero page),Y)
    LDA $BE52,X          ; BD 52 BE | Load from absolute,X into accumulator
    EOR ($BE),Y          ; 51 BE | Exclusive OR with accumulator ((zero page),Y)
    EOR ($BF),Y          ; 51 BF | Exclusive OR with accumulator ((zero page),Y)
    BVC $BF              ; 50 BF | Branch if overflow clear
    BVC $90              ; 50 90 | Branch if overflow clear
    CMP $8010            ; CD 10 80 | Compare accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    ADC #$DF             ; 69 DF | Add with carry (immediate)
    CMP $8010            ; CD 10 80 | Compare accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    ADC $827D            ; 6D 7D 82 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_232
; Address: $E9F152
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_232:
    JSR $6DDF            ; 20 DF 6D | Jump to subroutine
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    CMP $DF20            ; CD 20 DF | Compare accumulator (absolute)
    ADC $C092            ; 6D 92 C0 | Add with carry (absolute)
    PLX                  ; FA | Pull X register from stack
    SBC $7C07,X          ; FD 07 7C | Subtract with carry (absolute,X)
    STX $1C              ; 86 1C | Store X register to zero page
    DEC $88              ; C6 88 | Decrement (zero page)
    SEP #$70             ; E2 70 | Set processor status bits
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    STZ $00F4            ; 9C F4 00 | Store zero to absolute
    PLX                  ; FA | Pull X register from stack
    STA $007F00          ; 8F 00 7F 00 | Store accumulator to absolute long address
    STA                  ; 9F F0 BF E0 | Store accumulator to absolute long,X
    ROL $B871            ; 2E 71 B8 | Rotate left (absolute)
    ORA ($87),Y          ; 11 87 | Logical OR with accumulator ((zero page),Y)
    ASL $808E            ; 0E 8E 80 | Arithmetic shift left (absolute)
    CPY #$33             ; C0 33 | Compare Y register (immediate)
    INC $F100,X          ; FE 00 F1 | Increment (absolute,X)
    PEA #$FA0A           ; F4 0A FA | Push effective address to stack
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $DA              ; 05 DA | Logical OR with accumulator (zero page)
    AND $6A              ; 25 6A | Logical AND with accumulator (zero page)
    BRA $9F              ; 80 9F | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_234
; Address: $E9F1C1
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_234:
    BCC $5F              ; 90 5F | Branch if carry clear
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY #$1B             ; A0 1B | Load immediate value into Y register
    CPX $96              ; E4 96 | Compare X register (zero page)
    ADC #$80             ; 69 80 | Add with carry (immediate)
    BRA $7F              ; 80 7F | Branch always
    STZ $46              ; 64 46 | Store zero to zero page
    INC $4CB0,X          ; FE B0 4C | Increment (absolute,X)
    LDY $9B59,X          ; BC 59 9B | Load from absolute,X into Y register
    AND $2B85,X          ; 3D 85 2B | Logical AND with accumulator (absolute,X)
    EOR $E2              ; 45 E2 | Exclusive OR with accumulator (zero page)
    CMP $FF56            ; CD 56 FF | Compare accumulator (absolute)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDA                  ; BF 00 A7 00 | Load from absolute long,X into accumulator
    INC $00              ; E6 00 | Increment (zero page)
    LDA $B900,X          ; BD 00 B9 | Load from absolute,X into accumulator
    DEY                  ; 88 | Decrement Y register
    DEX                  ; CA | Decrement X register
    DEX                  ; CA | Decrement X register
    SBC $E103,X          ; FD 03 E1 | Subtract with carry (absolute,X)
    PHB                  ; 8B | Push data bank register to stack
    ORA ($FE),Y          ; 11 FE | Logical OR with accumulator ((zero page),Y)
    STY $F36C            ; 8C 6C F3 | Store Y register to absolute address
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $4E9A            ; 0E 9A 4E | Arithmetic shift left (absolute)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    BRA $7B              ; 80 7B | Branch always
    BRA $3F              ; 80 3F | Branch always
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    STY $00              ; 84 00 | Store Y register to zero page
    REP #$00             ; C2 00 | Reset processor status bits
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $2F              ; 80 2F | Branch always
    CPY #$2D             ; C0 2D | Compare Y register (immediate)
    CPY $21              ; C4 21 | PPU graphics register access
    REP #$0F             ; C2 0F | Reset processor status bits
    BMI $01              ; 30 01 | Branch if negative
    LSR $DC03            ; 4E 03 DC | Logical shift right (absolute)
    BRA $C3              ; 80 C3 | Branch always
    BRA $C3              ; 80 C3 | Branch always
    STA ($93,X)          ; 81 93 | Store accumulator to (zero page,X)
    BRA $93              ; 80 93 | Branch always
    BRA $D3              ; 80 D3 | Branch always
    LDY $BC53,X          ; BC 53 BC | Load from absolute,X into Y register
    LDA $BC52,X          ; BD 52 BC | Load from absolute,X into accumulator
    LDA                  ; BF 50 BF 50 | Load from absolute long,X into accumulator
    LDY $BE53,X          ; BC 53 BE | Load from absolute,X into Y register
    EOR ($CF),Y          ; 51 CF | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_235
; Address: $E9F282
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_235:
    CMP $8012            ; CD 12 80 | Compare accumulator (absolute)
    BRA $3D              ; 80 3D | Branch always
    CMP $8012            ; CD 12 80 | Compare accumulator (absolute)
    BRA $3D              ; 80 3D | Branch always
    CMP $DF20            ; CD 20 DF | Compare accumulator (absolute)
    ADC $4092            ; 6D 92 40 | Add with carry (absolute)
    LDA                  ; BF 32 CD 20 | Load from absolute long,X into accumulator
    ADC $4092            ; 6D 92 40 | Add with carry (absolute)
    LDA                  ; BF 43 4C 81 | Load from absolute long,X into accumulator
    BVS $F3              ; 70 F3 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    LDA $7C47,X          ; BD 47 7C | Load from absolute,X into accumulator
    STX $ED              ; 86 ED | Store X register to zero page
    LDA                  ; BF 00 7F 00 | Load from absolute long,X into accumulator
    STA $007F00          ; 8F 00 7F 00 | Store accumulator to absolute long address
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PEA #$C000           ; F4 00 C0 | Push effective address to stack
    SEC                  ; 38 | Set carry flag
    AND $CE0F,Y          ; 39 0F CE | Logical AND with accumulator (absolute,Y)
    CMP ($3F,X)          ; C1 3F | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_236
; Address: $E9F2CA
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_236:
    LDA $2CE2,X          ; BD E2 2C | Load from absolute,X into accumulator
    ADC $00FF,Y          ; 79 FF 00 | Add with carry (absolute,Y)
    INC $F100,X          ; FE 00 F1 | Increment (absolute,X)
    INC $DF00,X          ; FE 00 DF | Increment (absolute,X)
    LDA $F00F00          ; AF 00 0F F0 | Load from absolute long address into accumulator
    ADC $8382,X          ; 7D 82 83 | Add with carry (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    STA $FA              ; 85 FA | Store accumulator to zero page
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    ORA $F4              ; 05 F4 | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    LDX $C141,Y          ; BE 41 C1 | Load from absolute,Y into X register
    ROL $21DE,X          ; 3E DE 21 | PPU graphics register access
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDY #$2F             ; A0 2F | Load immediate value into Y register
    BNE $FF              ; D0 FF | Branch if not equal
    CMP $A656            ; CD 56 A6 | Compare accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_237
; Address: $E9F324
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_237:
    ROL                  ; 2A | Rotate left (accumulator)
    LSR $EA              ; 46 EA | Logical shift right (zero page)
    AND $4B              ; 25 4B | Logical AND with accumulator (zero page)
    ROL $D2              ; 26 D2 | Rotate left (zero page)
    CPY $5F              ; C4 5F | Compare Y register (zero page)
    STZ $B91D,X          ; 9E 1D B9 | Store zero to absolute,X
    STA $9D00,X          ; 9D 00 9D | Store accumulator to absolute,X
    LDA $BC00,X          ; BD 00 BC | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_238
; Address: $E9F33A
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_238:
    LDA $B900,X          ; BD 00 B9 | Load from absolute,X into accumulator
    BEQ $8F              ; F0 8F | Branch if equal
    STA ($C3),Y          ; 91 C3 | Store accumulator to (zero page),Y
    LDA $DF1C,X          ; BD 1C DF | Load from absolute,X into accumulator
    BPL $DA              ; 10 DA | Branch if positive
    STA $F4F9,Y          ; 99 F9 F4 | Store accumulator to absolute,Y
    STA $7F3F21          ; 8F 21 3F 7F | Store accumulator to absolute long address
    ROR $7600,X          ; 7E 00 76 | Rotate right (absolute,X)
    ROR $00              ; 66 00 | Rotate right (zero page)
    DEX                  ; CA | Decrement X register
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BRA $3D              ; 80 3D | Branch always
    STY $7B              ; 84 7B | Store Y register to zero page
    ADC $FBFF,Y          ; 79 FF FB | Add with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    ASL $0FF1            ; 0E F1 0F | Arithmetic shift left (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    REP #$00             ; C2 00 | Reset processor status bits
    STY $00              ; 84 00 | Store Y register to zero page
    PEA #$F500           ; F4 00 F5 | Push effective address to stack
    PEA #$F400           ; F4 00 F4 | Push effective address to stack
    ORA ($CE,X)          ; 01 CE | Logical OR with accumulator ((zero page,X))
    EOR ($34,X)          ; 41 34 | Exclusive OR with accumulator ((zero page,X))
    AND ($5E,X)          ; 21 5E | Logical AND with accumulator ((zero page,X))
    BRA $2F              ; 80 2F | Branch always
    BNE $2F              ; D0 2F | Branch if not equal
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $83              ; 80 83 | Branch always
    CPY #$C3             ; C0 C3 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_239
; Address: $E9F3A5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_239:
    JSR $0042            ; 20 42 00 | Jump to subroutine
    LSR $CF0C            ; 4E 0C CF | Logical shift right (absolute)
    BPL $30              ; 10 30 | Branch if positive

;------------------------------------------------------------------------------
; Bank52_DmaFunction_23A
; Address: $E9F3AD
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_23A:
    JSR $E7E7            ; 20 E7 E7 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    CPX $13              ; E4 13 | Compare X register (zero page)
    BEQ $F7              ; F0 F7 | Branch if equal
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    DEY                  ; 88 | Decrement Y register
    CPX $FFEC            ; EC EC FF | Compare X register (absolute)
    BMI $FF              ; 30 FF | Branch if negative
    ADC $FFFF,X          ; 7D FF FF | Add with carry (absolute,X)
    AND $FF3A,Y          ; 39 3A FF | Logical AND with accumulator (absolute,Y)
    ADC $FF82,X          ; 7D 82 FF | Add with carry (absolute,X)
    JMP $FF00            ; 4C 00 FF | Jump to address
    DEC                  ; 3A | Decrement accumulator
    CMP $10              ; C5 10 | Compare accumulator (zero page)
    SBC $EFC7,X          ; FD C7 EF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_23B
; Address: $E9F40C
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_23B:
    BPL $97              ; 10 97 | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    JMP ($28D7)          ; 6C D7 28 | Jump to address (absolute indirect)
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BPL $EF              ; 10 EF | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    ADC $C437,Y          ; 79 37 C4 | Add with carry (absolute,Y)
    CMP $584D            ; CD 4D 58 | Compare accumulator (absolute)
    STA                  ; 9F 58 B8 A6 | Store accumulator to absolute long,X
    ROR $708F,X          ; 7E 8F 70 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA                  ; 9F 00 30 12 | Store accumulator to absolute long,X
    CPX $F3              ; E4 F3 | Compare X register (zero page)
    SEP #$75             ; E2 75 | Set processor status bits
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_23C
; Address: $E9F449
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_23C:
    SBC $CE              ; E5 CE | Subtract with carry (zero page)
    ORA $3E33            ; 0D 33 3E | Logical OR with accumulator (absolute)
    ASL $18EE            ; 0E EE 18 | Arithmetic shift left (absolute)
    INC                  ; 1A | Increment accumulator
    ORA $9F00,X          ; 1D 00 9F | Logical OR with accumulator (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    SBC $CC00,Y          ; F9 00 CC | Subtract with carry (absolute,Y)
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    AND $C5FF,Y          ; 39 FF C5 | Logical AND with accumulator (absolute,Y)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    AND $FFC6,Y          ; 39 C6 FF | Logical AND with accumulator (absolute,Y)
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    BPL $FF              ; 10 FF | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    BPL $07              ; 10 07 | Branch if positive
    SBC ($2F),Y          ; F1 2F | Subtract with carry ((zero page),Y)
    PEA #$E67B           ; F4 7B E6 | Push effective address to stack
    CPY #$E1             ; C0 E1 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_23D
; Address: $E9F4B5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_23D:
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    INC $FF00,X          ; FE 00 FF | Increment (absolute,X)
    SBC $FE86,X          ; FD 86 FE | Subtract with carry (absolute,X)
    STA $FF0FFF          ; 8F FF 0F FF | Store accumulator to absolute long address
    INC $7D1F,X          ; FE 1F 7D | Increment (absolute,X)
    DEC $EE39,X          ; DE 39 EE | Decrement (absolute,X)
    ASL $00F1            ; 0E F1 00 | Arithmetic shift left (absolute)
    STA $000F00          ; 8F 00 0F 00 | Store accumulator to absolute long address
    ROL $064B,X          ; 3E 4B 06 | Rotate left (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_23E
; Address: $E9F4E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_23E:
    STA ($60),Y          ; 91 60 | Store accumulator to (zero page),Y
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    STA ($0F,X)          ; 81 0F | Store accumulator to (zero page,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_23F
; Address: $E9F4F7
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_23F:
    STA                  ; 9F 00 FF 00 | Store accumulator to absolute long,X
    STA $E61F73          ; 8F 73 1F E6 | Store accumulator to absolute long address
    INY                  ; C8 | Increment Y register
    BCC $8F              ; 90 8F | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    INC $00              ; E6 00 | Increment (zero page)
    INX                  ; E8 | Increment X register
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $0000,Y          ; F9 00 00 | Subtract with carry (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $55              ; 80 55 | Branch always
    WDM #$6B             ; 42 6B | Reserved instruction
    STZ $ED9F            ; 9C 9F ED | Store zero to absolute
    ADC ($61),Y          ; 71 61 | Add with carry ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    LDY $FC43,X          ; BC 43 FC | Load from absolute,X into Y register
    RTI                  ; 40 | Return from interrupt
    LDA $7801,X          ; BD 01 78 | Load from absolute,X into accumulator
    STZ $FD63            ; 9C 63 FD | Store zero to absolute
    BPL $C7              ; 10 C7 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ORA $001F            ; 0D 1F 00 | Logical OR with accumulator (absolute)
    LDA ($16,X)          ; A1 16 | Load from (zero page,X) into accumulator
    STZ $E1DE            ; 9C DE E1 | Store zero to absolute
    CPY #$F1             ; C0 F1 | Compare Y register (immediate)
    SBC $0012            ; ED 12 00 | Subtract with carry (absolute)
    SBC #$2F             ; E9 2F | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_240
; Address: $E9F579
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_240:
    BNE $BD              ; D0 BD | Branch if not equal
    WDM #$DE             ; 42 DE | Reserved instruction
    AND ($0E,X)          ; 21 0E | Logical AND with accumulator ((zero page,X))
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BRA $C1              ; 80 C1 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    AND $1C00,X          ; 3D 00 1C | Logical AND with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    EOR $6606            ; 4D 06 66 | Exclusive OR with accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_241
; Address: $E9F59F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_241:
    STA                  ; 9F 4A F1 70 | Store accumulator to absolute long,X
    BMI $F3              ; 30 F3 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    LDY $7C4B,X          ; BC 4B 7C | Load from absolute,X into Y register
    INC $00F7,X          ; FE F7 00 | Increment (absolute,X)
    CPX #$07             ; E0 07 | Compare X register (immediate)
    SBC $FB0F,Y          ; F9 0F FB | Subtract with carry (absolute,Y)
    STA $C7              ; 85 C7 | Store accumulator to zero page
    STA $02              ; 85 02 | Store accumulator to zero page
    INC $FD00,X          ; FE 00 FD | Increment (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    INC $F9FF,X          ; FE FF F9 | Increment (absolute,X)
    LDA                  ; BF DB 3F D3 | Load from absolute long,X into accumulator
    LDA $6FE77B          ; AF 7B E7 6F | Load from absolute long address into accumulator
    CMP $C243            ; CD 43 C2 | Compare accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    ASL $82              ; 06 82 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_242
; Address: $E9F626
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_242:
    JSL $A40149          ; 22 49 01 A4 | Jump to subroutine long
    CLC                  ; 18 | Clear carry flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $FD92,X          ; FD 92 FD | Subtract with carry (absolute,X)
    XBA                  ; EB | Exchange accumulator bytes
    INC $FC6F,X          ; FE 6F FC | Increment (absolute,X)
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    STA ($25,X)          ; 81 25 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_243
; Address: $E9F64A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_243:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    STA $F90670          ; 8F 70 06 F9 | Store accumulator to absolute long address
    ORA $97FF,Y          ; 19 FF 97 | Logical OR with accumulator (absolute,Y)
    ROR $3FF7,X          ; 7E F7 3F | Rotate right (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BCS $2F              ; B0 2F | Branch if carry set
    EOR ($8F),Y          ; 51 8F | Exclusive OR with accumulator ((zero page),Y)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    AND ($CE),Y          ; 31 CE | Logical AND with accumulator ((zero page),Y)
    DEC $53              ; C6 53 | Decrement (zero page)
    CPX $ED73            ; EC 73 ED | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_244
; Address: $E9F670
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_244:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    LDA                  ; BF FF BF FF | Load from absolute long,X into accumulator
    SBC $FBCE,Y          ; F9 CE FB | Subtract with carry (absolute,Y)
    LDA                  ; BF 00 BF 00 | Load from absolute long,X into accumulator
    SBC $FB00,Y          ; F9 00 FB | Subtract with carry (absolute,Y)
    STA $B302,X          ; 9D 02 B3 | Store accumulator to absolute,X
    BVS $0F              ; 70 0F | Branch if overflow set
    BNE $6F              ; D0 6F | Branch if not equal
    NOP                  ; EA | No operation
    PLY                  ; 7A | Pull Y register from stack
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LDA $C3              ; A5 C3 | Load from zero page into accumulator
    PHB                  ; 8B | Push data bank register to stack
    STA $F20F70          ; 8F 70 0F F2 | Store accumulator to absolute long address
    AND $5FB3,X          ; 3D B3 5F | Logical AND with accumulator (absolute,X)
    INC $7800,X          ; FE 00 78 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    LDA $DF00,X          ; BD 00 DF | Load from absolute,X into accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $18              ; 80 18 | Branch always
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA ($92,X)          ; 01 92 | Logical OR with accumulator ((zero page,X))
    EOR ($2C,X)          ; 41 2C | Exclusive OR with accumulator ((zero page,X))
    CPY $44              ; C4 44 | Compare Y register (zero page)
    BPL $04              ; 10 04 | Branch if positive
    BVC $E7              ; 50 E7 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank52_DmaFunction_245
; Address: $E9F711
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_245:
    CLC                  ; 18 | Clear carry flag
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    SBC $FF32,X          ; FD 32 FF | Subtract with carry (absolute,X)
    INC $FCEF,X          ; FE EF FC | Increment (absolute,X)
    PEA #$0070           ; F4 70 00 | Push effective address to stack
    ASL $10              ; 06 10 | Arithmetic shift left (zero page)
    BRA $49              ; 80 49 | Branch always
    CPY $23              ; C4 23 | Compare Y register (zero page)
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_246
; Address: $E9F72E
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_246:
    JSR $8F0A            ; 20 0A 8F | Jump to subroutine
    BVS $06              ; 70 06 | Branch if overflow set
    SBC $1CEF,Y          ; F9 EF 1C | Subtract with carry (absolute,Y)
    CMP #$7F             ; C9 7F | Compare accumulator (immediate)
    AND $2FFE            ; 2D FE 2F | Logical AND with accumulator (absolute)
    BMI $FF              ; 30 FF | Branch if negative
    AND $2BFE,Y          ; 39 FE 2B | Logical AND with accumulator (absolute,Y)
    SBC $7FBD,X          ; FD BD 7F | Subtract with carry (absolute,X)
    LDA                  ; BF 71 BE 63 | Load from absolute long,X into accumulator
    INC $0003,X          ; FE 03 00 | Increment (absolute,X)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    DEC $9F3F            ; CE 3F 9F | Decrement (absolute)
    AND $3CCF,X          ; 3D CF 3C | Logical AND with accumulator (absolute,X)
    ROR $0F9F            ; 6E 9F 0F | Rotate right (absolute)
    STA                  ; 9F 3F 8C 97 | Store accumulator to absolute long,X
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    LDA                  ; BF 4F BE 47 | Load from absolute long,X into accumulator
    SBC $7F82,X          ; FD 82 7F | Subtract with carry (absolute,X)
    REP #$7F             ; C2 7F | Reset processor status bits
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDA ($77),Y          ; B1 77 | Load from (zero page),Y into accumulator
    BIT #$7A             ; 89 7A | Test bits in accumulator (immediate)
    STA $00              ; 85 00 | Store accumulator to zero page
    REP #$00             ; C2 00 | Reset processor status bits
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC $FD00,Y          ; F9 00 FD | Subtract with carry (absolute,Y)
    SEP #$B6             ; E2 B6 | Set processor status bits
    PEA #$6FAB           ; F4 AB 6F | Push effective address to stack
    TXA                  ; 8A | Transfer X register to accumulator
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    SBC #$E8             ; E9 E8 | Subtract with carry (immediate)
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator
    ADC $7FFF,X          ; 7D FF 7F | Add with carry (absolute,X)
    BCC $7F              ; 90 7F | Branch if carry clear
    SBC $FE0B,X          ; FD 0B FE | Subtract with carry (absolute,X)
    ADC $2F              ; 65 2F | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_247
; Address: $E9F7E7
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_247:
    INC $6C53,X          ; FE 53 6C | Increment (absolute,X)
    LDY $1493,X          ; BC 93 14 | Load from absolute,X into Y register
    INC $FFBE,X          ; FE BE FF | Increment (absolute,X)
    INC $08FF,X          ; FE FF 08 | Increment (absolute,X)
    LDY $7CD3,X          ; BC D3 7C | Load from absolute,X into Y register
    CPX $EDFB            ; EC FB ED | Compare X register (absolute)
    PLX                  ; FA | Pull X register from stack
    DEC $4E27,X          ; DE 27 4E | Decrement (absolute,X)
    ASL $EE7F            ; 0E 7F EE | Arithmetic shift left (absolute)
    SBC $EC57,Y          ; F9 57 EC | Subtract with carry (absolute,Y)
    DEC $8679            ; CE 79 86 | Decrement (absolute)
    SBC $FC00,Y          ; F9 00 FC | Subtract with carry (absolute,Y)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SBC ($F9),Y          ; F1 F9 | Subtract with carry ((zero page),Y)
    LDA                  ; BF 7E FF 7C | Load from absolute long,X into accumulator
    ADC $2180,Y          ; 79 80 21 | PPU graphics register access
    CLD                  ; D8 | Clear decimal mode flag
    PLP                  ; 28 | Pull processor status from stack
    DEC $BE49,X          ; DE 49 BE | Decrement (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDA $FF67,Y          ; B9 67 FF | Load from absolute,Y into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    LDX $CB05,Y          ; BE 05 CB | Load from absolute,Y into X register
    ASL $9F              ; 06 9F | Arithmetic shift left (zero page)
    ORA ($99),Y          ; 11 99 | Logical OR with accumulator ((zero page),Y)
    ROR $0FFC            ; 6E FC 0F | Rotate right (absolute)
    ADC $008F,X          ; 7D 8F 00 | Add with carry (absolute,X)
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    SBC $FE00,X          ; FD 00 FE | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_248
; Address: $E9F8A1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_248:
    ORA $1D1F,Y          ; 19 1F 1D | Logical OR with accumulator (absolute,Y)
    ADC $6D73            ; 6D 73 6D | Add with carry (absolute)
    AND $0002,X          ; 3D 02 00 | Logical AND with accumulator (absolute,X)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    INC $E23F,X          ; FE 3F E2 | Increment (absolute,X)
    REP #$98             ; C2 98 | Reset processor status bits
    CLV                  ; B8 | Clear overflow flag
    DEC $BCB6            ; CE B6 BC | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_249
; Address: $E9F8CA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_249:
    JSR $B6C4            ; 20 C4 B6 | Jump to subroutine
    STY $0CED            ; 8C ED 0C | Store Y register to absolute address
    ADC $44FE,X          ; 7D FE 44 | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_24A
; Address: $E9F8D4
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_24A:
    SBC $FCFE            ; ED FE FC | Subtract with carry (absolute)
    INC $FCC0,X          ; FE C0 FC | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    SEP #$B6             ; E2 B6 | Set processor status bits
    PEA #$6FAB           ; F4 AB 6F | Push effective address to stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($1D,X)          ; 01 1D | Logical OR with accumulator ((zero page,X))
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    AND #$28             ; 29 28 | Logical AND with accumulator (immediate)
    ADC $7FFF,X          ; 7D FF 7F | Add with carry (absolute,X)
    BPL $7F              ; 10 7F | Branch if positive
    AND $1E0B,X          ; 3D 0B 1E | Logical AND with accumulator (absolute,X)
    ADC $2F              ; 65 2F | Add with carry (zero page)
    INC $6C50,X          ; FE 50 6C | Increment (absolute,X)
    BRA $B8              ; 80 B8 | Branch always
    BCC $14              ; 90 14 | Branch if carry clear
    BCC $14              ; 90 14 | Branch if carry clear
    INC $FFBE,X          ; FE BE FF | Increment (absolute,X)
    INC $08FF,X          ; FE FF 08 | Increment (absolute,X)
    INC $D0BC,X          ; FE BC D0 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $EC              ; F0 EC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $81F8            ; EC F8 81 | Compare X register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    JMP $1CBF            ; 4C BF 1C | Jump to address
    DEC $FEFF,X          ; DE FF FE | Decrement (absolute,X)
    INC $FCFC,X          ; FE FC FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SBC $F970,X          ; FD 70 F9 | Subtract with carry (absolute,X)
    BEQ $FB              ; F0 FB | Branch if equal
    CPX #$F6             ; E0 F6 | Compare X register (immediate)
    CMP ($F6,X)          ; C1 F6 | Compare accumulator ((zero page,X))
    CMP ($77,X)          ; C1 77 | Compare accumulator ((zero page,X))
    CPY #$D5             ; C0 D5 | Compare Y register (immediate)
    STA $0062,X          ; 9D 62 00 | Store accumulator to absolute,X
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BVS $30              ; 70 30 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    BRA $C0              ; 80 C0 | Branch always
    ROR $C6B7            ; 6E B7 C6 | Rotate right (absolute)
    SEP #$1F             ; E2 1F | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    SBC $7FEA,X          ; FD EA 7F | Subtract with carry (absolute,X)
    SEP #$7F             ; E2 7F | Set processor status bits
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank52_DmaFunction_24B
; Address: $E9F9BB
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_24B:
    NOP                  ; EA | No operation
    SEP #$00             ; E2 00 | Set processor status bits
    BEQ $6D              ; F0 6D | Branch if equal
    STZ $BA4F,X          ; 9E 4F BA | Store zero to absolute,X
    CLV                  ; B8 | Clear overflow flag
    BEQ $DF              ; F0 DF | Branch if equal
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    SBC ($FF,X)          ; E1 FF | Subtract with carry ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    INC $FA00,X          ; FE 00 FA | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    ADC ($E0,X)          ; 61 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank52_DmaFunction_24C
; Address: $E9F9E1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_24C:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_24D
; Address: $E9F9F1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_24D:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    LDY #$14             ; A0 14 | Load immediate value into Y register
    AND $0C              ; 25 0C | Logical AND with accumulator (zero page)
    AND ($47),Y          ; 31 47 | Logical AND with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_24E
; Address: $E9FA08
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_24E:
    ADC $727D,Y          ; 79 7D 72 | Add with carry (absolute,Y)
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    PLY                  ; 7A | Pull Y register from stack
    SBC $FE7F,Y          ; F9 7F FE | Subtract with carry (absolute,Y)
    SBC $F006,Y          ; F9 06 F0 | Subtract with carry (absolute,Y)
    ORA $0DF0            ; 0D F0 0D | Logical OR with accumulator (absolute)
    CPX #$1D             ; E0 1D | Compare X register (immediate)
    ADC ($E8,X)          ; 61 E8 | Add with carry ((zero page,X))
    BIT $901D            ; 2C 1D 90 | Test bits in accumulator (absolute)
    STA $4580            ; 8D 80 45 | Store accumulator to absolute address
    CPY #$25             ; C0 25 | Compare Y register (immediate)
    CPX #$35             ; E0 35 | Compare X register (immediate)
    BEQ $DE              ; F0 DE | Branch if equal
    LDA                  ; BF FC 7F F0 | Load from absolute long,X into accumulator
    SEP #$FD             ; E2 FD | Set processor status bits
    ORA $857A            ; 0D 7A 85 | Logical OR with accumulator (absolute)
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank52_DmaFunction_24F
; Address: $E9FA3D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_24F:
    CMP $3A              ; C5 3A | Compare accumulator (zero page)
    CMP $03              ; C5 03 | Compare accumulator (zero page)
    ORA $1D1F,Y          ; 19 1F 1D | Logical OR with accumulator (absolute,Y)
    ADC $6D73            ; 6D 73 6D | Add with carry (absolute)
    AND $0002,X          ; 3D 02 00 | Logical AND with accumulator (absolute,X)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    ROR $623F,X          ; 7E 3F 62 | Rotate right (absolute,X)
    REP #$98             ; C2 98 | Reset processor status bits
    PLX                  ; FA | Pull X register from stack
    CLV                  ; B8 | Clear overflow flag
    DEC $BCB6            ; CE B6 BC | Decrement (absolute)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank52_DmaFunction_250
; Address: $E9FA6A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_250:
    JSR $B6C4            ; 20 C4 B6 | Jump to subroutine
    STY $0CED            ; 8C ED 0C | Store Y register to absolute address
    INC $FE44,X          ; FE 44 FE | Increment (absolute,X)
    CPX $FCFE            ; EC FE FC | Compare X register (absolute)
    INC $FCC0,X          ; FE C0 FC | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    SBC #$F0             ; E9 F0 | Subtract with carry (immediate)
    CPX #$A8             ; E0 A8 | Compare X register (immediate)
    BNE $50              ; D0 50 | Branch if not equal
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPY #$45             ; C0 45 | Compare Y register (immediate)
    BRA $45              ; 80 45 | Branch always
    BRA $7B              ; 80 7B | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    STA $A673            ; 8D 73 A6 | Store accumulator to absolute address
    EOR ($C3),Y          ; 51 C3 | Exclusive OR with accumulator ((zero page),Y)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_251
; Address: $E9FAC0
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_251:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BIT $3E13            ; 2C 13 3E | Test bits in accumulator (absolute)
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    BMI $44              ; 30 44 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ROL $3E04,X          ; 3E 04 3E | Rotate left (absolute,X)
    SEC                  ; 38 | Set carry flag
    BPL $7D              ; 10 7D | Branch if positive
    BRA $70              ; 80 70 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$06             ; C0 06 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_252
; Address: $E9FAFD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_252:
    INC $EE00            ; EE 00 EE | Increment (absolute)
    CLV                  ; B8 | Clear overflow flag
    ORA $E9BE,Y          ; 19 BE E9 | Logical OR with accumulator (absolute,Y)
    LDX $5EE1,Y          ; BE E1 5E | Load from absolute,Y into X register
    EOR $6CB2,X          ; 5D B2 6C | Exclusive OR with accumulator (absolute,X)
    EOR $00BF,Y          ; 59 BF 00 | Exclusive OR with accumulator (absolute,Y)
    CLV                  ; B8 | Clear overflow flag
    ORA $E900,Y          ; 19 00 E9 | Logical OR with accumulator (absolute,Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_253
; Address: $E9FB23
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_253:
    JSL $FF26FF          ; 22 FF 26 FF | Jump to subroutine long
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LSR $7F              ; 46 7F | Logical shift right (zero page)
    DEC $7F              ; C6 7F | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_254
; Address: $E9FB33
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_254:
    JSL $002600          ; 22 00 26 00 | Jump to subroutine long
    STX $00              ; 86 00 | Store X register to zero page
    DEC $00              ; C6 00 | Decrement (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BVC $70              ; 50 70 | Branch if overflow clear
    DEC                  ; 3A | Decrement accumulator
    DEC                  ; 3A | Decrement accumulator
    PLY                  ; 7A | Pull Y register from stack
    ROR $6920,X          ; 7E 20 69 | Rotate right (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    ADC $7858,X          ; 7D 58 78 | Add with carry (absolute,X)
    ROR                  ; 6A | Rotate right (accumulator)
    BNE $2F              ; D0 2F | Branch if not equal
    BEQ $0D              ; F0 0D | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA $F8              ; 05 F8 | Logical OR with accumulator (zero page)
    ORA $A0              ; 05 A0 | Logical OR with accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    INX                  ; E8 | Increment X register
    CPX #$35             ; E0 35 | Compare X register (immediate)
    BEQ $6D              ; F0 6D | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank52_DmaFunction_255
; Address: $E9FB86
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_255:
    ADC $2BE0            ; 6D E0 2B | Add with carry (absolute)
    CPX #$7B             ; E0 7B | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $75              ; F0 75 | Branch if equal
    BEQ $38              ; F0 38 | Branch if equal

;------------------------------------------------------------------------------
; Bank52_DmaFunction_256
; Address: $E9FB92
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_256:
    DEC                  ; 3A | Decrement accumulator
    CMP $72              ; C5 72 | Compare accumulator (zero page)
    STA $8D72            ; 8D 72 8D | Store accumulator to absolute address
    INC                  ; 1A | Increment accumulator
    SBC $7A              ; E5 7A | Subtract with carry (zero page)
    STA $B3              ; 85 B3 | Store accumulator to zero page
    BRA $5F              ; 80 5F | Branch always
    CPX #$2D             ; E0 2D | Compare X register (immediate)
    AND #$F6             ; 29 F6 | Logical AND with accumulator (immediate)
    TXS                  ; 9A | Transfer X register to stack pointer
    SBC $FB84,X          ; FD 84 FB | Subtract with carry (absolute,X)
    DEX                  ; CA | Decrement X register
    AND ($95),Y          ; 31 95 | Logical AND with accumulator ((zero page),Y)
    LDX $7F5F,Y          ; BE 5F 7F | Load from absolute,Y into X register
    DEC $C67D            ; CE 7D C6 | Decrement (absolute)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ROL $1401,X          ; 3E 01 14 | Rotate left (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BMI $00              ; 30 00 | Branch if negative
    SBC $FD1A,X          ; FD 1A FD | Subtract with carry (absolute,X)
    ROL $66FD,X          ; 3E FD 66 | Rotate left (absolute,X)
    PLX                  ; FA | Pull X register from stack
    CPY $FA              ; C4 FA | Compare Y register (zero page)
    STY $B4              ; 84 B4 | Store Y register to zero page
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $00              ; E6 00 | Increment (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BPL $00              ; 10 00 | Branch if positive
    DEC $D33F            ; CE 3F D3 | Decrement (absolute)
    STX $F9              ; 86 F9 | Store X register to zero page
    ASL $0CEB            ; 0E EB 0C | Arithmetic shift left (absolute)
    STY $845B            ; 8C 5B 84 | Store Y register to absolute address
    INC $F300            ; EE 00 F3 | Increment (absolute)
    STZ $8CF7,X          ; 9E F7 8C | Store zero to absolute,X
    INY                  ; C8 | Increment Y register
    STA                  ; 9F 60 DF 31 | Store accumulator to absolute long,X
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    AND ($CF),Y          ; 31 CF | Logical AND with accumulator ((zero page),Y)
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank52_DmaFunction_257
; Address: $E9FC64
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_257:
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    WDM #$7E             ; 42 7E | Reserved instruction
    WDM #$7E             ; 42 7E | Reserved instruction
    WDM #$7E             ; 42 7E | Reserved instruction
    PHY                  ; 5A | Push Y register to stack
    ROR $3C24,X          ; 7E 24 3C | Rotate right (absolute,X)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    INC $BCBD,X          ; FE BD BC | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    STA $1400,X          ; 9D 00 14 | Store accumulator to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PLX                  ; FA | Pull X register from stack
    WDM #$B8             ; 42 B8 | Reserved instruction
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_259
; Address: $E9FCBA
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_259:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    INC                  ; 1A | Increment accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDX $142C            ; AE 2C 14 | Load from absolute address into X register
    BIT $1A              ; 24 1A | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_25A
; Address: $E9FD01
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_25A:
    ORA $1D1F,Y          ; 19 1F 1D | Logical OR with accumulator (absolute,Y)
    SBC $ED73            ; ED 73 ED | Subtract with carry (absolute)
    AND $00C2,X          ; 3D C2 00 | Logical AND with accumulator (absolute,X)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    INC $E23F,X          ; FE 3F E2 | Increment (absolute,X)
    LDA                  ; BF 7F C3 3F | Load from absolute long,X into accumulator
    REP #$98             ; C2 98 | Reset processor status bits
    CLV                  ; B8 | Clear overflow flag
    DEC $BCB7            ; CE B7 BC | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_25B
; Address: $E9FD2A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_25B:
    JSR $B6C4            ; 20 C4 B6 | Jump to subroutine
    STY $0CED            ; 8C ED 0C | Store Y register to absolute address
    ADC $44FE,X          ; 7D FE 44 | Add with carry (absolute,X)
    SBC $FDFE            ; ED FE FD | Subtract with carry (absolute)
    INC $FCC3,X          ; FE C3 FC | Increment (absolute,X)
    INX                  ; E8 | Increment X register
    CMP #$F6             ; C9 F6 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_25F
; Address: $E9FD4C
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_25F:
    JSR $0038            ; 20 38 00 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0F05            ; 0E 05 0F | Arithmetic shift left (absolute)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $040F            ; 0D 0F 04 | Logical OR with accumulator (absolute)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $08              ; 06 08 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0802            ; 0D 02 08 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    LDX $A7              ; A6 A7 | Load from zero page into X register
    INX                  ; E8 | Increment X register
    STA $EC              ; 85 EC | Store accumulator to zero page
    EOR $F3              ; 45 F3 | Exclusive OR with accumulator (zero page)
    BIT #$E9             ; 89 E9 | Test bits in accumulator (immediate)
    INC $283A,X          ; FE 3A 28 | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_261
; Address: $E9FDD6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_261:
    PHY                  ; 5A | Push Y register to stack
    TXS                  ; 9A | Transfer X register to stack pointer
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    INC                  ; 1A | Increment accumulator
    ORA $3A              ; 05 3A | Logical OR with accumulator (zero page)
    LDA                  ; BF 00 AD D7 | Load from absolute long,X into accumulator
    LDA                  ; BF A2 E8 4F | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    SBC $879A,X          ; FD 9A 87 | Subtract with carry (absolute,X)
    ADC ($40),Y          ; 71 40 | Add with carry ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BCS $00              ; B0 00 | Branch if carry set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_262
; Address: $E9FDFC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_262:
    JSR $0892            ; 20 92 08 | Jump to subroutine
    ADC ($56),Y          ; 71 56 | Add with carry ((zero page),Y)
    PLB                  ; AB | Pull data bank register from stack
    LDA $F6              ; A5 F6 | Load from zero page into accumulator
    STZ $5BF9,X          ; 9E F9 5B | Store zero to absolute,X
    XBA                  ; EB | Exchange accumulator bytes
    STX $0ED3            ; 8E D3 0E | Store X register to absolute address
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank52_DmaFunction_264
; Address: $E9FE13
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_264:
    JSR $205A            ; 20 5A 20 | Jump to subroutine
    EOR ($0A,X)          ; 41 0A | Exclusive OR with accumulator ((zero page,X))
    LDY $4B              ; A4 4B | Load from zero page into Y register
    BMI $8F              ; 30 8F | Branch if negative
    BVS $0F              ; 70 0F | Branch if overflow set
    BPL $0F              ; 10 0F | Branch if positive
    LDA                  ; BF 54 3D 67 | Load from absolute long,X into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank52_DmaFunction_265
; Address: $E9FE27
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_265:
    ROL                  ; 2A | Rotate left (accumulator)
    LDY $6087            ; AC 87 60 | Load from absolute address into Y register
    ASL $DE32,X          ; 1E 32 DE | Arithmetic shift left (absolute,X)
    NOP                  ; EA | No operation
    RTI                  ; 40 | Return from interrupt
    REP #$00             ; C2 00 | Reset processor status bits
    WDM #$95             ; 42 95 | Reserved instruction
    WDM #$11             ; 42 11 | Reserved instruction
    DEC $19              ; C6 19 | Decrement (zero page)
    DEC $4D              ; C6 4D | Decrement (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    BEQ $7F              ; F0 7F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CMP $ED1F,Y          ; D9 1F ED | Compare accumulator (absolute,Y)
    ORA $8DED            ; 0D ED 8D | Logical OR with accumulator (absolute)
    BEQ $C4              ; F0 C4 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    DEX                  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_267
; Address: $E9FE54
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_267:
    JSR $121F            ; 20 1F 12 | Jump to subroutine
    ORA $8412            ; 0D 12 84 | Logical OR with accumulator (absolute)
    CPY $05              ; C4 05 | Compare Y register (zero page)
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    BRA $12              ; 80 12 | Branch always
    ORA $001F            ; 0D 1F 00 | Logical OR with accumulator (absolute)
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator
    LDY #$34             ; A0 34 | Load immediate value into Y register
    STA $E4DF,Y          ; 99 DF E4 | Store accumulator to absolute,Y
    CPY $F0              ; C4 F0 | Compare Y register (zero page)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    SBC $0012            ; ED 12 00 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank52_DmaFunction_268
; Address: $E9FE78
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_268:
    JSR $B9CB            ; 20 CB B9 | Jump to subroutine
    LSR $D8              ; 46 D8 | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $040F            ; 0D 0F 04 | Logical OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0802            ; 0D 02 08 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ROL $F6A3,X          ; 3E A3 F6 | Rotate left (absolute,X)
    LDA #$A7             ; A9 A7 | Load immediate value into accumulator
    PLB                  ; AB | Pull data bank register from stack
    ASL $9A03            ; 0E 03 9A | Arithmetic shift left (absolute)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA $00BF00          ; AF 00 BF 00 | Load from absolute long address into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHB                  ; 8B | Push data bank register to stack
    ASL $DCC6            ; 0E C6 DC | Arithmetic shift left (absolute)
    ROL $3CCC            ; 2E CC 3C | Rotate left (absolute)
    CPX $C8FC            ; EC FC C8 | Compare X register (absolute)
    CPX $C840            ; EC 40 C8 | Compare X register (absolute)
    RTI                  ; 40 | Return from interrupt
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPX $C800            ; EC 00 C8 | Compare X register (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    CMP $F759,X          ; DD 59 F7 | Compare accumulator (absolute,X)
    CMP $9D3E,X          ; DD 3E 9D | Compare accumulator (absolute,X)
    AND $00              ; 25 00 | Logical AND with accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    AND $10              ; 25 10 | Logical AND with accumulator (zero page)
    LDX $11              ; A6 11 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank52_DmaFunction_26A
; Address: $E9FEF8
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_26A:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $FD              ; 80 FD | Branch always
    LDA $7F              ; A5 7F | Load from zero page into accumulator
    INC $3674            ; EE 74 36 | Increment (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    PLP                  ; 28 | Pull processor status from stack
    CLV                  ; B8 | Clear overflow flag
    PLA                  ; 68 | Pull accumulator from stack
    BNE $79              ; D0 79 | Branch if not equal
    BEQ $02              ; F0 02 | Branch if equal
    STA $00              ; 85 00 | Store accumulator to zero page
    DEC $D600            ; CE 00 D6 | Decrement (absolute)
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive
    SBC $F000,Y          ; F9 00 F0 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    CLD                  ; D8 | Clear decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $22              ; 90 22 | Branch if carry clear
    BPL $08              ; 10 08 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ADC ($03),Y          ; 71 03 | Add with carry ((zero page),Y)
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    BPL $03              ; 10 03 | Branch if positive
    STY $24              ; 84 24 | Store Y register to zero page
    CMP $040F            ; CD 0F 04 | Compare accumulator (absolute)
    CPX #$E1             ; E0 E1 | Compare X register (immediate)
    BIT #$76             ; 89 76 | Test bits in accumulator (immediate)
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    AND $F8C2,X          ; 3D C2 F8 | Logical AND with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ORA ($73,X)          ; 01 73 | Logical OR with accumulator ((zero page,X))
    ADC ($F3),Y          ; 71 F3 | Add with carry ((zero page),Y)
    BEQ $F3              ; F0 F3 | Branch if equal
    PEA #$74F5           ; F4 F5 74 | Push effective address to stack
    PEA #$FFBD           ; F4 BD FF | Push effective address to stack
    BMI $F1              ; 30 F1 | Branch if negative

;------------------------------------------------------------------------------
; Bank52_DmaFunction_26B
; Address: $E9FF70
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_26B:
    ORA #$F6             ; 09 F6 | Logical OR with accumulator (immediate)
    ADC $F886,Y          ; 79 86 F8 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    LDA $0842,X          ; BD 42 08 | Load from absolute,X into accumulator
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    LSR $BE6F            ; 4E 6F BE | Logical shift right (absolute)
    NOP                  ; EA | No operation
    SEI                  ; 78 | Set interrupt disable flag
    INY                  ; C8 | Increment Y register
    STA $00              ; 85 00 | Store accumulator to zero page
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    ORA ($C2),Y          ; 11 C2 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    AND ($96,X)          ; 21 96 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank52_DmaFunction_26C
; Address: $E9FF9C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_26C:
    JSR $005C            ; 20 5C 00 | Jump to subroutine
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank52_DmaFunction_26D
; Address: $E9FFA2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_26D:
    JSR $B5B0            ; 20 B0 B5 | Jump to subroutine
    STA $8AFD,X          ; 9D FD 8A | Store accumulator to absolute,X
    STA $9E              ; 85 9E | Store accumulator to zero page
    AND $0DBD,Y          ; 39 BD 0D | Logical AND with accumulator (absolute,Y)
    AND $0005,X          ; 3D 05 00 | Logical AND with accumulator (absolute,X)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $02              ; 65 02 | Add with carry (zero page)
    ADC $8512            ; 6D 12 85 | Add with carry (absolute)
    WDM #$BD             ; 42 BD | Reserved instruction
    WDM #$3D             ; 42 3D | Reserved instruction
    SBC $F69E,X          ; FD 9E F6 | Subtract with carry (absolute,X)
    STA                  ; 9F DC 2F E4 | Store accumulator to absolute long,X
    ROR $74E0,X          ; 7E E0 74 | Rotate right (absolute,X)
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_26E
; Address: $E9FFCF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_26E:
    JSR $9F00            ; 20 00 9F | Jump to subroutine
    STA                  ; 9F 00 3F 00 | Store accumulator to absolute long,X
    ROR $7400,X          ; 7E 00 74 | Rotate right (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank52_DmaFunction_26F
; Address: $E9FFDF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank52_DmaFunction_26F:
    JSR $FFFE            ; 20 FE FF | Jump to subroutine
    ROR $1CFE,X          ; 7E FE 1C | Rotate right (absolute,X)
    JMP $000C08          ; 5C 08 0C 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
    INC $7C00,X          ; FE 00 7C | Increment (absolute,X)
    JMP $000C00          ; 5C 00 0C 00 | Jump to address long
    PHP                  ; 08 | Push processor status to stack
