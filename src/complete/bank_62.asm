;==============================================================================
; Dragon Quest III - Bank $62
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F10000-$F17FFF
; Instructions: 8246
; Bytes: 32769
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_62"

;------------------------------------------------------------------------------
; Bank62_DmaFunction_000
; Address: $F18000
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_000:
    LDA ($7E),Y          ; B1 7E | Load from (zero page),Y into accumulator
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF DC DE E0 | Load from absolute long,X into accumulator
    SBC $5AFD,X          ; FD FD 5A | Subtract with carry (absolute,X)
    REP #$7C             ; C2 7C | Reset processor status bits
    CPY #$67             ; C0 67 | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    AND $3F00,X          ; 3D 00 3F | Logical AND with accumulator (absolute,X)
    CPY #$3A             ; C0 3A | Compare Y register (immediate)
    SBC $FB78,Y          ; F9 78 FB | Subtract with carry (absolute,Y)
    BEQ $03              ; F0 03 | Branch if equal
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ADC $89F7,Y          ; 79 F7 89 | Add with carry (absolute,Y)
    LDA                  ; BF 81 4D C1 | Load from absolute long,X into accumulator
    EOR $2DBE            ; 4D BE 2D | Exclusive OR with accumulator (absolute)
    DEC $84FB,X          ; DE FB 84 | Decrement (absolute,X)
    INC $7E00,X          ; FE 00 7E | Increment (absolute,X)
    ROR $3E00,X          ; 7E 00 3E | Rotate right (absolute,X)
    STY $C100            ; 8C 00 C1 | Store Y register to absolute address
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    SBC #$E8             ; E9 E8 | Subtract with carry (immediate)
    SED                  ; F8 | Set decimal mode flag
    BEQ $F6              ; F0 F6 | Branch if equal
    SBC ($74),Y          ; F1 74 | Subtract with carry ((zero page),Y)
    SEI                  ; 78 | Set interrupt disable flag
    ADC $62E6            ; 6D E6 62 | Add with carry (absolute)
    INC $17              ; E6 17 | Increment (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$24             ; E0 24 | Compare X register (immediate)
    BRA $68              ; 80 68 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $6F              ; F0 6F | Branch if equal
    LDA $8140C0          ; AF C0 40 81 | Load from absolute long address into accumulator
    STA ($BB,X)          ; 81 BB | Store accumulator to (zero page,X)
    BEQ $00              ; F0 00 | Branch if equal
    INC $3900,X          ; FE 00 39 | Increment (absolute,X)
    SEP #$E2             ; E2 E2 | Set processor status bits
    BRA $99              ; 80 99 | Branch always
    PEA #$C8C7           ; F4 C7 C8 | Push effective address to stack
    BIT $ECEF            ; 2C EF EC | Test bits in accumulator (absolute)
    ASL $7DF9,X          ; 1E F9 7D | Arithmetic shift left (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    ORA $0DFE            ; 0D FE 0D | Logical OR with accumulator (absolute)
    INC $EF1C,X          ; FE 1C EF | Increment (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_002
; Address: $F180E7
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_002:
    CPY #$9C             ; C0 9C | Compare Y register (immediate)
    STA ($85,X)          ; 81 85 | Store accumulator to (zero page,X)
    ASL $4A              ; 06 4A | Arithmetic shift left (zero page)
    STY $CD35            ; 8C 35 CD | Store Y register to absolute address
    SBC $FFFE,X          ; FD FE FF | Subtract with carry (absolute,X)
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    BRA $7E              ; 80 7E | Branch always
    ADC $3300,Y          ; 79 00 33 | Add with carry (absolute,Y)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $0F              ; F0 0F | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    STA $FFFBFF          ; 8F FF FB FF | Store accumulator to absolute long address
    BPL $2F              ; 10 2F | Branch if positive
    BNE $DF              ; D0 DF | Branch if not equal
    BEQ $F0              ; F0 F0 | Branch if equal
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    BRA $3C              ; 80 3C | Branch always
    CPY #$32             ; C0 32 | Compare Y register (immediate)
    BRA $FF              ; 80 FF | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    LDA                  ; BF 40 FF 00 | Load from absolute long,X into accumulator
    INC $DBFF,X          ; FE FF DB | Increment (absolute,X)
    CMP ($FF,X)          ; C1 FF | Compare accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    SBC $FF03,X          ; FD 03 FF | Subtract with carry (absolute,X)
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    CPY $FCFC            ; CC FC FC | Compare Y register (absolute)
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    ROR $01FE,X          ; 7E FE 01 | Rotate right (absolute,X)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    ADC $3F79,Y          ; 79 79 3F | Add with carry (absolute,Y)
    STA                  ; 9F 9F 43 DF | Store accumulator to absolute long,X
    SBC $7FFF,Y          ; F9 FF 7F | Subtract with carry (absolute,Y)
    SBC ($37,X)          ; E1 37 | Subtract with carry ((zero page,X))
    SBC $F80F,X          ; FD 0F F8 | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_003
; Address: $F181EA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_003:
    BMI $3F              ; 30 3F | Branch if negative
    STA $3E993F          ; 8F 3F 99 3E | Store accumulator to absolute long address
    LDA                  ; BF 1F FF 0F | Load from absolute long,X into accumulator
    BPL $F6              ; 10 F6 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_004
; Address: $F18204
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_004:
    ASL $00FF            ; 0E FF 00 | Arithmetic shift left (absolute)
    SBC $FF04,Y          ; F9 04 FF | Subtract with carry (absolute,Y)
    BVS $7F              ; 70 7F | Branch if overflow set
    BRA $BF              ; 80 BF | Branch always
    BVC $CF              ; 50 CF | Branch if overflow clear
    ROL $2CEF            ; 2E EF 2C | Rotate left (absolute)
    ASL $13EE            ; 0E EE 13 | Arithmetic shift left (absolute)
    LDA                  ; BF 80 40 C0 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_005
; Address: $F18234
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_005:
    JSR $10E0            ; 20 E0 10 | Jump to subroutine
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $11              ; F0 11 | Branch if equal
    BEQ $0C              ; F0 0C | Branch if equal
    BEQ $04              ; F0 04 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_006
; Address: $F18240
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_006:
    JSR $1C20            ; 20 20 1C | Jump to subroutine
    LDA $4681,Y          ; B9 81 46 | Load from absolute,Y into accumulator
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CPX $1D              ; E4 1D | Compare X register (zero page)
    BPL $FF              ; 10 FF | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROR $3FC7,X          ; 7E C7 3F | Rotate right (absolute,X)
    SBC ($1B,X)          ; E1 1B | Subtract with carry ((zero page,X))
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BMI $C0              ; 30 C0 | Branch if negative
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDA                  ; BF C0 3F F0 | Load from absolute long,X into accumulator
    INC $3FF8,X          ; FE F8 3F | Increment (absolute,X)
    INC $DB00,X          ; FE 00 DB | Increment (absolute,X)
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    CPY #$F9             ; C0 F9 | Compare Y register (immediate)
    LDA ($40,X)          ; A1 40 | Load from (zero page,X) into accumulator
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $FF              ; 30 FF | Branch if negative
    LDA                  ; BF 00 AF 10 | Load from absolute long,X into accumulator
    BCC $C7              ; 90 C7 | Branch if carry clear
    BNE $FF              ; D0 FF | Branch if not equal
    SEC                  ; 38 | Set carry flag
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 40 BF 48 | Load from absolute long,X into accumulator
    LDA                  ; BF 62 9F D3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_007
; Address: $F182CA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_007:
    PLX                  ; FA | Pull X register from stack
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    BRA $FF              ; 80 FF | Branch always
    PHP                  ; 08 | Push processor status to stack
    ASL $1E00            ; 0E 00 1E | Arithmetic shift left (absolute)
    ASL $0001            ; 0E 01 00 | Arithmetic shift left (absolute)
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    SBC $F906,X          ; FD 06 F9 | Subtract with carry (absolute,X)
    CMP $7F1D,X          ; DD 1D 7F | Compare accumulator (absolute,X)
    BRA $FF              ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_008
; Address: $F182FA
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_008:
    JSR $A03E            ; 20 3E A0 | Jump to subroutine
    SEP #$3C             ; E2 3C | Set processor status bits
    JMP ($D807)          ; 6C 07 D8 | Jump to address (absolute indirect)
    TYA                  ; 98 | Transfer Y register to accumulator
    SBC $CC06            ; ED 06 CC | Subtract with carry (absolute)
    CMP $190F            ; CD 0F 19 | Compare accumulator (absolute)
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$E7             ; C0 E7 | Compare Y register (immediate)
    BRA $F7              ; 80 F7 | Branch always
    CPY #$67             ; C0 67 | Compare Y register (immediate)
    CPY #$CD             ; C0 CD | Compare Y register (immediate)
    BRA $DD              ; 80 DD | Branch always
    BRA $DF              ; 80 DF | Branch always
    BRA $CF              ; 80 CF | Branch always
    ORA $2636,Y          ; 19 36 26 | Logical OR with accumulator (absolute,Y)
    ORA ($E1,X)          ; 01 E1 | Logical OR with accumulator ((zero page,X))
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    BRA $80              ; 80 80 | Branch always
    INC $3D              ; E6 3D | Increment (zero page)
    CMP $FEEF,Y          ; D9 EF FE | Compare accumulator (absolute,Y)
    ROR $7F01,X          ; 7E 01 7F | Rotate right (absolute,X)
    DEY                  ; 88 | Decrement Y register
    STZ $64              ; 64 64 | Store zero to zero page
    ROL                  ; 2A | Rotate left (accumulator)
    DEY                  ; 88 | Decrement Y register
    BRA $88              ; 80 88 | Branch always
    AND ($BF,X)          ; 21 BF | Logical AND with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_009
; Address: $F1836E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_009:
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LDY $FF9B,X          ; BC 9B FF | Load from absolute,X into Y register
    STA                  ; 9F F0 3F C0 | Store accumulator to absolute long,X
    BRA $FF              ; 80 FF | Branch always
    AND $B391,X          ; 3D 91 B3 | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_00A
; Address: $F18386
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_00A:
    WDM #$0C             ; 42 0C | Reserved instruction
    LDA $A5              ; A5 A5 | Load from zero page into accumulator
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    SBC $FCF8,Y          ; F9 F8 FC | Subtract with carry (absolute,Y)
    ROR $F3C0,X          ; 7E C0 F3 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_00B
; Address: $F18395
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_00B:
    JSR $B0F3            ; 20 F3 B0 | Jump to subroutine
    BEQ $5A              ; F0 5A | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ASL $07FC            ; 0E FC 07 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    BPL $1F              ; 10 1F | Branch if positive
    CPY #$CF             ; C0 CF | Compare Y register (immediate)
    BCC $90              ; 90 90 | Branch if carry clear
    INC $E6              ; E6 E6 | Increment (zero page)
    BMI $FF              ; 30 FF | Branch if negative
    STY $E0FF            ; 8C FF E0 | Game work RAM access
    BEQ $6F              ; F0 6F | Branch if equal
    ORA $0AFF,Y          ; 19 FF 0A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_00D
; Address: $F183C9
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_00D:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    SBC $F5FF,X          ; FD FF F5 | Subtract with carry (absolute,X)
    ADC $FFFF            ; 6D FF FF | Add with carry (absolute)
    EOR $005D,X          ; 5D 5D 00 | Exclusive OR with accumulator (absolute,X)
    BMI $08              ; 30 08 | Branch if negative
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $7F              ; 80 7F | Branch always
    LDX #$FF             ; A2 FF | Load immediate value into X register
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    AND ($BF),Y          ; 31 BF | Logical AND with accumulator ((zero page),Y)
    LDA                  ; BF 7E 7E 61 | Load from absolute long,X into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_00E
; Address: $F1840B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_00E:
    JSR $8080            ; 20 80 80 | Jump to subroutine
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    STA ($FF,X)          ; 81 FF | Store accumulator to (zero page,X)
    STA                  ; 9F FE DF 70 | Store accumulator to absolute long,X
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    BPL $AD              ; 10 AD | Branch if positive
    LDA $087000          ; AF 00 70 08 | Load from absolute long address into accumulator
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    BRA $80              ; 80 80 | Branch always
    BVC $FF              ; 50 FF | Branch if overflow clear
    STA $FF80FF          ; 8F FF 80 FF | Store accumulator to absolute long address
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_00F
; Address: $F18441
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_00F:
    RTI                  ; 40 | Return from interrupt
    DEC $DFEF,X          ; DE EF DF | Decrement (absolute,X)
    INX                  ; E8 | Increment X register
    CMP $211D,Y          ; D9 1D 21 | PPU graphics register access
    ROL $A000            ; 2E 00 A0 | Rotate left (absolute)
    BRA $00              ; 80 00 | Branch always
    LDA                  ; BF FF 21 FE | Load from absolute long,X into accumulator
    ORA ($FA,X)          ; 01 FA | Logical OR with accumulator ((zero page,X))
    INC $FF03,X          ; FE 03 FF | Increment (absolute,X)
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    BVC $FF              ; 50 FF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_010
; Address: $F1845F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_010:
    JSR $CFCC            ; 20 CC CF | Jump to subroutine
    STA $909F,Y          ; 99 9F 90 | Store accumulator to absolute,Y
    STA                  ; 9F 08 0F 04 | Store accumulator to absolute long,X
    STY $47              ; 84 47 | Store Y register to zero page
    BMI $FF              ; 30 FF | Branch if negative
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_012
; Address: $F18478
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_012:
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    STA $F82F68          ; 8F 68 2F F8 | Store accumulator to absolute long address
    BPL $10              ; 10 10 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    DEC $C7              ; C6 C7 | Decrement (zero page)
    CPX #$13             ; E0 13 | Compare X register (immediate)
    BEQ $1D              ; F0 1D | Branch if equal
    SBC $FD0C,X          ; FD 0C FD | Subtract with carry (absolute,X)
    LDA                  ; BF E0 3F F8 | Load from absolute long,X into accumulator
    BEQ $0F              ; F0 0F | Branch if equal
    INC $0707,X          ; FE 07 07 | Increment (absolute,X)
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_013
; Address: $F184C2
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_013:
    JSR $E6D8            ; 20 D8 E6 | Jump to subroutine
    TAX                  ; AA | Transfer accumulator to X register
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $2A2C,X          ; 1E 2C 2A | Arithmetic shift left (absolute,X)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    LDA                  ; BF BC FF FF | Load from absolute long,X into accumulator
    ORA #$F7             ; 09 F7 | Logical OR with accumulator (immediate)
    EOR $0DF3            ; 4D F3 0D | Exclusive OR with accumulator (absolute)
    ORA $7F              ; 05 7F | Logical OR with accumulator (zero page)
    CMP $40FF            ; CD FF 40 | Compare accumulator (absolute)
    SBC ($F1),Y          ; F1 F1 | Subtract with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_015
; Address: $F184E8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_015:
    BVS $72              ; 70 72 | Branch if overflow set
    JMP $7F447C          ; 5C 7C 44 7F | Jump to address long
    ASL $DFFF            ; 0E FF DF | Arithmetic shift left (absolute)
    SBC ($DF,X)          ; E1 DF | Subtract with carry ((zero page,X))
    CPX #$9F             ; E0 9F | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    STA $FF83FD          ; 8F FD 83 FF | Store accumulator to absolute long address
    BRA $FF              ; 80 FF | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BRA $92              ; 80 92 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_017
; Address: $F18509
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_017:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    SBC $C8FF            ; ED FF C8 | Subtract with carry (absolute)
    BRA $FF              ; 80 FF | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SBC $F200,Y          ; F9 00 F2 | Subtract with carry (absolute,Y)
    ASL $D4              ; 06 D4 | Arithmetic shift left (zero page)
    CPY $FF              ; C4 FF | Compare Y register (zero page)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $F9FF,X          ; FD FF F9 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_018
; Address: $F18540
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_018:
    JSR $F8F9            ; 20 F9 F8 | Jump to subroutine
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY #$3C             ; C0 3C | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    BCC $6F              ; 90 6F | Branch if carry clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($4F,X)          ; 41 4F | Exclusive OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_01A
; Address: $F1856E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_01A:
    CPY #$CE             ; C0 CE | Compare Y register (immediate)
    ADC ($BE,X)          ; 61 BE | Add with carry ((zero page,X))
    SBC ($9F),Y          ; F1 9F | Subtract with carry ((zero page),Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC ($28),Y          ; F1 28 | Subtract with carry ((zero page),Y)
    XBA                  ; EB | Exchange accumulator bytes
    PHP                  ; 08 | Push processor status to stack
    AND ($30),Y          ; 31 30 | Logical AND with accumulator ((zero page),Y)
    BPL $D7              ; 10 D7 | Branch if positive
    DEC $5C00            ; CE 00 5C | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_01B
; Address: $F1858C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_01B:
    ORA ($99,X)          ; 01 99 | Logical OR with accumulator ((zero page,X))
    ROR $38EF,X          ; 7E EF 38 | Rotate right (absolute,X)
    AND ($FF),Y          ; 31 FF | Logical AND with accumulator ((zero page),Y)
    INC $FC67,X          ; FE 67 FC | Increment (absolute,X)
    BRA $7F              ; 80 7F | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    BEQ $F3              ; F0 F3 | Branch if equal
    BCS $F3              ; B0 F3 | Branch if carry set
    BMI $F7              ; 30 F7 | Branch if negative
    BEQ $FF              ; F0 FF | Branch if equal
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_01C
; Address: $F185C0
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_01C:
    JSR $FBFF            ; 20 FF FB | Jump to subroutine
    SBC $FB02,X          ; FD 02 FB | Subtract with carry (absolute,X)
    LDA                  ; BF 00 1F FF | Load from absolute long,X into accumulator
    SBC $FF06,X          ; FD 06 FF | Subtract with carry (absolute,X)
    STZ $381F            ; 9C 1F 38 | Store zero to absolute
    ROL                  ; 2A | Rotate left (accumulator)
    ROL $323F,X          ; 3E 3F 32 | Rotate left (absolute,X)
    ROL $A7              ; 26 A7 | Rotate left (zero page)
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY $D8FF            ; CC FF D8 | Compare Y register (absolute)
    INX                  ; E8 | Increment X register
    DEC $0CFF            ; CE FF 0C | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BVS $F0              ; 70 F0 | Branch if overflow set
    BVC $F0              ; 50 F0 | Branch if overflow clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BRA $1F              ; 80 1F | Branch always
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    AND ($33),Y          ; 31 33 | Logical AND with accumulator ((zero page),Y)
    ADC $D87B,Y          ; 79 7B D8 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    BCC $F0              ; 90 F0 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_01E
; Address: $F18637
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_01E:
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F 5B 40 1B | Store accumulator to absolute long,X
    JMP $EF6CDF          ; 5C DF 6C EF | Jump to address long
    STY $84              ; 84 84 | Store Y register to zero page
    BVS $70              ; 70 70 | Branch if overflow set
    INC $FFFE            ; EE FE FF | Increment (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_020
; Address: $F18657
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_020:
    JSR $30DF            ; 20 DF 30 | Jump to subroutine
    STA $FF01FF          ; 8F FF 01 FF | Store accumulator to absolute long address
    LDA                  ; BF 3F 4F 0F | Load from absolute long,X into accumulator
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    STA $85CF            ; 8D CF 85 | Store accumulator to absolute address
    ORA $601F,X          ; 1D 1F 60 | Logical OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_021
; Address: $F18670
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_021:
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $3F              ; F0 3F | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    AND $B100,Y          ; 39 00 B1 | Logical AND with accumulator (absolute,Y)
    BRA $B4              ; 80 B4 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    SBC $70FF,Y          ; F9 FF 70 | Subtract with carry (absolute,Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    REP #$7F             ; C2 7F | Reset processor status bits
    DEC $CF7B            ; CE 7B CF | Decrement (absolute)
    SBC $28FF,Y          ; F9 FF 28 | Subtract with carry (absolute,Y)
    ASL $BE00            ; 0E 00 BE | Arithmetic shift left (absolute)
    BPL $FC              ; 10 FC | Branch if positive
    BCC $FD              ; 90 FD | Branch if carry clear
    CLD                  ; D8 | Clear decimal mode flag
    SBC $7FD8,X          ; FD D8 7F | Subtract with carry (absolute,X)
    BEQ $FD              ; F0 FD | Branch if equal
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    EOR ($FF,X)          ; 41 FF | Exclusive OR with accumulator ((zero page,X))
    LDA $BB1F,Y          ; B9 1F BB | Load from absolute,Y into accumulator
    STZ $0C37,X          ; 9E 37 0C | Store zero to absolute,X
    DEY                  ; 88 | Decrement Y register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    REP #$E0             ; C2 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$F7             ; C0 F7 | Compare Y register (immediate)
    BCC $FF              ; 90 FF | Branch if carry clear
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_022
; Address: $F186F2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_022:
    PHP                  ; 08 | Push processor status to stack
    CPX $FC0F            ; EC 0F FC | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BCS $FF              ; B0 FF | Branch if carry set
    BPL $FF              ; 10 FF | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $79              ; F0 79 | Branch if equal
    BEQ $F1              ; F0 F1 | Branch if equal
    CPY #$E3             ; C0 E3 | Compare Y register (immediate)
    CMP ($73,X)          ; C1 73 | Compare accumulator ((zero page,X))
    SBC ($1E,X)          ; E1 1E | Subtract with carry ((zero page,X))
    ASL $7CF3,X          ; 1E F3 7C | Arithmetic shift left (absolute,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $1CFF            ; 0E FF 1C | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_023
; Address: $F18741
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_023:
    RTI                  ; 40 | Return from interrupt
    SBC ($50),Y          ; F1 50 | Subtract with carry ((zero page),Y)
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    ROL $1CF7,X          ; 3E F7 1C | Rotate left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    STA                  ; 9F FF 0E FF | Store accumulator to absolute long,X
    AND ($21),Y          ; 31 21 | PPU graphics register access
    EOR ($CF,X)          ; 41 CF | Exclusive OR with accumulator ((zero page,X))
    CMP ($EF,X)          ; C1 EF | Compare accumulator ((zero page,X))
    CMP $F7              ; C5 F7 | Compare accumulator (zero page)
    AND ($FF,X)          ; 21 FF | Logical AND with accumulator ((zero page,X))
    DEC $3CFF            ; CE FF 3C | Decrement (absolute)
    BMI $FF              ; 30 FF | Branch if negative
    BPL $FF              ; 10 FF | Branch if positive
    BMI $E0              ; 30 E0 | Game work RAM access
    CPX #$B7             ; E0 B7 | Compare X register (immediate)
    CPX $9F              ; E4 9F | Compare X register (zero page)
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BEQ $0F              ; F0 0F | Branch if equal
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    SBC $F3CF,Y          ; F9 CF F3 | Subtract with carry (absolute,Y)
    DEC $FEF3,X          ; DE F3 FE | Decrement (absolute,X)
    LDA $0DFF            ; AD FF 0D | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_024
; Address: $F187BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_024:
    JSR $F8FF            ; 20 FF F8 | Jump to subroutine
    CPX #$F9             ; E0 F9 | Compare X register (immediate)
    BRA $FB              ; 80 FB | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    BCS $FF              ; B0 FF | Branch if carry set
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_026
; Address: $F187E2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_026:
    SEP #$3F             ; E2 3F | Set processor status bits
    ROR $7CF7,X          ; 7E F7 7C | Rotate right (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SEI                  ; 78 | Set interrupt disable flag
    BRA $FF              ; 80 FF | Branch always
    CMP $CF7F            ; CD 7F CF | Compare accumulator (absolute)
    ROR $3EEF,X          ; 7E EF 3E | Rotate right (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_027
; Address: $F1882E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_027:
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF E3 7F E3 | Load from absolute long,X into accumulator
    ADC $38DF,X          ; 7D DF 38 | Add with carry (absolute,X)
    BPL $FF              ; 10 FF | Branch if positive
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $FF              ; 10 FF | Branch if positive
    STX $00FF            ; 8E FF 00 | Store X register to absolute address
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    SBC $BBFF,Y          ; F9 FF BB | Subtract with carry (absolute,Y)
    LDA                  ; BF FF 1F FF | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_028
; Address: $F188AC
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_028:
    BRA $FF              ; 80 FF | Branch always
    BMI $FF              ; 30 FF | Branch if negative
    SBC $DCF0,Y          ; F9 F0 DC | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SBC $F31E,Y          ; F9 1E F3 | Subtract with carry (absolute,Y)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    LDY #$FF             ; A0 FF | Load immediate value into Y register
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_029
; Address: $F188E8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_029:
    BEQ $BF              ; F0 BF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BMI $FF              ; 30 FF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BRA $FF              ; 80 FF | Branch always
    BEQ $7A              ; F0 7A | Branch if equal
    CPX #$68             ; E0 68 | Compare X register (immediate)
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_02A
; Address: $F18929
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_02A:
    AND $7F42,Y          ; 39 42 7F | Logical AND with accumulator (absolute,Y)
    BRA $FF              ; 80 FF | Branch always
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    BCC $FF              ; 90 FF | Branch if carry clear
    BRA $FF              ; 80 FF | Branch always
    BRA $FF              ; 80 FF | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA $FE              ; 05 FE | Logical OR with accumulator (zero page)
    SBC $F90F,X          ; FD 0F F9 | Subtract with carry (absolute,X)
    LSR $FF              ; 46 FF | Logical shift right (zero page)
    ASL $9FF3,X          ; 1E F3 9F | Arithmetic shift left (absolute,X)
    SBC ($BF),Y          ; F1 BF | Subtract with carry ((zero page),Y)
    SBC ($FB),Y          ; F1 FB | Subtract with carry ((zero page),Y)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    BRA $E7              ; 80 E7 | Branch always
    BRA $C3              ; 80 C3 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SBC $F0E0,X          ; FD E0 F0 | Subtract with carry (absolute,X)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BRA $F8              ; 80 F8 | Branch always
    BRA $FE              ; 80 FE | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    LDA ($7F),Y          ; B1 7F | Load from (zero page),Y into accumulator
    LDA                  ; BF DF DF 7C | Load from absolute long,X into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    STA $F6C0,X          ; 9D C0 F6 | Store accumulator to absolute,X
    CPY #$E9             ; C0 E9 | Compare Y register (immediate)
    BRA $93              ; 80 93 | Branch always
    STA                  ; 9F 00 7E 00 | Store accumulator to absolute long,X
    AND $3700,Y          ; 39 00 37 | Logical AND with accumulator (absolute,Y)
    BVC $78              ; 50 78 | Branch if overflow clear
    BRA $7F              ; 80 7F | Branch always
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    STA $007F00          ; 8F 00 7F 00 | Store accumulator to absolute long address
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $7F              ; F0 7F | Branch if equal
    BEQ $77              ; F0 77 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $7F              ; 80 7F | Branch always
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_02B
; Address: $F189F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_02B:
    PHP                  ; 08 | Push processor status to stack
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    AND ($21,X)          ; 21 21 | PPU graphics register access
    INC $EADF            ; EE DF EA | Increment (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank62_DmaFunction_02C
; Address: $F18A09
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_02C:
    JSR $002F            ; 20 2F 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    DEC $FFFF,X          ; DE FF FF | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_02D
; Address: $F18A13
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_02D:
    JSR $00FF            ; 20 FF 00 | Jump to subroutine
    EOR $FF              ; 45 FF | Exclusive OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF EA FF 00 | Load from absolute long,X into accumulator
    BRA $A5              ; 80 A5 | Branch always
    LDY #$EE             ; A0 EE | Load immediate value into Y register
    STA ($DD,X)          ; 81 DD | Store accumulator to (zero page,X)
    ASL $9CBF            ; 0E BF 9C | Arithmetic shift left (absolute)
    INC $7C1C,X          ; FE 1C 7C | Increment (absolute,X)
    AND $5E7C,Y          ; 39 7C 5E | Logical AND with accumulator (absolute,Y)
    ORA $3300,Y          ; 19 00 33 | Logical OR with accumulator (absolute,Y)
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    ASL $1C5F            ; 0E 5F 1C | Arithmetic shift left (absolute)
    LDA                  ; BF 38 3E 3F | Load from absolute long,X into accumulator
    BVS $78              ; 70 78 | Branch if overflow set
    ORA ($91),Y          ; 11 91 | Logical OR with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_02F
; Address: $F18A4A
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_02F:
    CPX $E0              ; E4 E0 | Game work RAM access
    DEY                  ; 88 | Decrement Y register
    ROL $70FF,X          ; 3E FF 70 | Rotate left (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    CPY #$EE             ; C0 EE | Compare Y register (immediate)
    STA                  ; 9F 00 1F 00 | Store accumulator to absolute long,X
    SEI                  ; 78 | Set interrupt disable flag
    ADC ($F8),Y          ; 71 F8 | Add with carry ((zero page),Y)
    BEQ $7E              ; F0 7E | Branch if equal
    BEQ $74              ; F0 74 | Branch if equal
    BEQ $72              ; F0 72 | Branch if equal
    BEQ $73              ; F0 73 | Branch if equal
    BEQ $BF              ; F0 BF | Branch if equal
    SEC                  ; 38 | Set carry flag
    BMI $7F              ; 30 7F | Branch if negative
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $F8              ; 70 F8 | Branch if overflow set
    SBC $0D01,Y          ; F9 01 0D | Subtract with carry (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_030
; Address: $F18A92
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_030:
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    CPY $8000            ; CC 00 80 | Compare Y register (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $74              ; F0 74 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    LDA #$F9             ; A9 F9 | Load immediate value into accumulator
    LDA #$F9             ; A9 F9 | Load immediate value into accumulator
    LDA #$FD             ; A9 FD | Load immediate value into accumulator
    LDY $FC              ; A4 FC | Load from zero page into Y register
    DEC $FE              ; C6 FE | Decrement (zero page)
    BVS $7F              ; 70 7F | Branch if overflow set
    BVS $3E              ; 70 3E | Branch if overflow set
    PLP                  ; 28 | Pull processor status from stack
    ROL $3E28,X          ; 3E 28 3E | Rotate left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BIT $1E1F            ; 2C 1F 1E | Test bits in accumulator (absolute)
    STA $FE              ; 85 FE | Store accumulator to zero page
    BCC $EF              ; 90 EF | Branch if carry clear
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $4C              ; F0 4C | Branch if equal
    BRA $03              ; 80 03 | Branch always
    SBC ($1F,X)          ; E1 1F | Subtract with carry ((zero page,X))
    BEQ $FF              ; F0 FF | Branch if equal
    CPY #$EF             ; C0 EF | Compare Y register (immediate)
    BIT $E7              ; 24 E7 | Test bits in accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    CLC                  ; 18 | Clear carry flag
    ORA $1C01,Y          ; 19 01 1C | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CPX $FB              ; E4 FB | Compare X register (zero page)
    BEQ $80              ; F0 80 | Branch if equal
    BRA $83              ; 80 83 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC $FC43,X          ; FD 43 FC | Subtract with carry (absolute,X)
    BRA $FF              ; 80 FF | Branch always
    SBC $0E3E,X          ; FD 3E 0E | Subtract with carry (absolute,X)
    LDY $E9EF            ; AC EF E9 | Load from absolute address into Y register
    INC $3CF3,X          ; FE F3 3C | Increment (absolute,X)
    STA $C08877          ; 8F 77 88 C0 | Store accumulator to absolute long address
    BMI $CF              ; 30 CF | Branch if negative
    BMI $10              ; 30 10 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FF00,X          ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_031
; Address: $F18B64
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_031:
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    AND $3EC2,X          ; 3D C2 3E | Logical AND with accumulator (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FD0A,X          ; FE 0A FD | Increment (absolute,X)
    ORA $FF              ; 05 FF | Logical OR with accumulator (zero page)
    INC $3306,X          ; FE 06 33 | Increment (absolute,X)
    CPY $0FF0            ; CC F0 0F | Compare Y register (absolute)
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $CF              ; F0 CF | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_032
; Address: $F18B8C
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_032:
    DEC $D839,X          ; DE 39 D8 | Decrement (absolute,X)
    SBC $FFF9,Y          ; F9 F9 FF | Subtract with carry (absolute,Y)
    LDA                  ; BF BF E7 E7 | Load from absolute long,X into accumulator
    ROR $FF80,X          ; 7E 80 FF | Rotate right (absolute,X)
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 03 BD 01 | Load from absolute long,X into accumulator
    LDA                  ; BF 03 3F 03 | Load from absolute long,X into accumulator
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLV                  ; B8 | Clear overflow flag
    BMI $CF              ; 30 CF | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    STA $F713,Y          ; 99 13 F7 | Store accumulator to absolute,Y
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_033
; Address: $F18C04
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_033:
    JSR $38DF            ; 20 DF 38 | Jump to subroutine
    CMP $0983,X          ; DD 83 09 | Compare accumulator (absolute,X)
    CMP $DD03            ; CD 03 DD | Compare accumulator (absolute)
    CMP $5013,X          ; DD 13 50 | Compare accumulator (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LDY #$F7             ; A0 F7 | Load immediate value into Y register
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    DEC $8200            ; CE 00 82 | Decrement (absolute)
    CPY $4901            ; CC 01 49 | Compare Y register (absolute)
    STA $00              ; 85 00 | Store accumulator to zero page
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_034
; Address: $F18C6B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_034:
    JSL $842490          ; 22 90 24 84 | Jump to subroutine long
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    BEQ $1B              ; F0 1B | Branch if equal
    LDA                  ; BF 35 AF 6F | Load from absolute long,X into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    INC $00              ; E6 00 | Increment (zero page)
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_035
; Address: $F18C94
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_035:
    LDA $BA00,Y          ; B9 00 BA | Load from absolute,Y into accumulator
    INC $DF00            ; EE 00 DF | Increment (absolute)
    LDA $7B9300          ; AF 00 93 7B | Load from absolute long address into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LSR $8F              ; 46 8F | Logical shift right (zero page)
    STA $5F145F          ; 8F 5F 14 5F | Store accumulator to absolute long address
    CPX $DC00            ; EC 00 DC | Compare X register (absolute)
    CLV                  ; B8 | Clear overflow flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    TAX                  ; AA | Transfer accumulator to X register
    ADC $AA92            ; 6D 92 AA | Add with carry (absolute)
    NOP                  ; EA | No operation
    ROL $FF              ; 26 FF | Rotate left (zero page)
    STA $A2FD,Y          ; 99 FD A2 | Store accumulator to absolute,Y
    EOR $55FF,X          ; 5D FF 55 | Exclusive OR with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank62_DmaFunction_037
; Address: $F18CE0
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_037:
    JSL $08E208          ; 22 08 E2 08 | Jump to subroutine long
    ORA $D3              ; 05 D3 | Logical OR with accumulator (zero page)
    AND $2D8B            ; 2D 8B 2D | Logical AND with accumulator (absolute)
    LSR $1F4F,X          ; 5E 4F 1F | Logical shift right (absolute,X)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    CPY #$7E             ; C0 7E | Compare Y register (immediate)
    BRA $7E              ; 80 7E | Branch always
    BRA $FC              ; 80 FC | Branch always
    SBC ($00),Y          ; F1 00 | Subtract with carry ((zero page),Y)
    ADC ($EC,X)          ; 61 EC | Add with carry ((zero page,X))
    ADC ($E3,X)          ; 61 E3 | Add with carry ((zero page,X))
    ROR                  ; 6A | Rotate right (accumulator)
    XBA                  ; EB | Exchange accumulator bytes
    PLX                  ; FA | Pull X register from stack
    SBC $FAF8,Y          ; F9 F8 FA | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    CPX $E8              ; E4 E8 | Compare X register (zero page)
    STY $BFE8            ; 8C E8 BF | Store Y register to absolute address
    LDA                  ; BF 00 DF 00 | Load from absolute long,X into accumulator
    STA                  ; 9F 00 2F 00 | Store accumulator to absolute long,X
    LDA $BF3F,X          ; BD 3F BF | Load from absolute,X into accumulator
    DEC $FBFF            ; CE FF FB | Decrement (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_038
; Address: $F18D34
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_038:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    TSX                  ; BA | Transfer stack pointer to X register
    ADC $D7EE,Y          ; 79 EE D7 | Add with carry (absolute,Y)
    ADC $4E77,X          ; 7D 77 4E | Add with carry (absolute,X)
    AND #$2B             ; 29 2B | Logical AND with accumulator (immediate)
    CMP $9E00            ; CD 00 9E | Compare accumulator (absolute)
    ROL $BB00,X          ; 3E 00 BB | Rotate left (absolute,X)
    LDA $DC00,Y          ; B9 00 DC | Load from absolute,Y into accumulator
    LDA $FFFF,Y          ; B9 FF FF | Load from absolute,Y into accumulator
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    STA                  ; 9F FF FF FF | Store accumulator to absolute long,X
    CPX $FFFF            ; EC FF FF | Compare X register (absolute)
    ROL $E7FF,X          ; 3E FF E7 | Rotate left (absolute,X)
    INC $91FF,X          ; FE FF 91 | Increment (absolute,X)
    ROL                  ; 2A | Rotate left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $EAD2            ; AD D2 EA | Load from absolute address into accumulator
    NOP                  ; EA | No operation
    ROL                  ; 2A | Rotate left (accumulator)
    STA ($10,X)          ; 81 10 | Store accumulator to (zero page,X)
    LDA                  ; BF 00 A0 69 | Load from absolute long,X into accumulator
    CLC                  ; 18 | Clear carry flag
    DEC $9D30            ; CE 30 9D | Decrement (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_039
; Address: $F18DC8
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_039:
    SEC                  ; 38 | Set carry flag
    REP #$70             ; C2 70 | Reset processor status bits
    STX $E0              ; 86 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    STZ $9C63            ; 9C 63 9C | Store zero to absolute
    CPY $0C33            ; CC 33 0C | Compare Y register (absolute)
    ORA $31E6,Y          ; 19 E6 31 | Logical OR with accumulator (absolute,Y)
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $3F              ; C4 3F | Compare Y register (zero page)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $0022,X          ; DD 22 00 | Compare accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    CPY $8800            ; CC 00 88 | Compare Y register (absolute)
    DEY                  ; 88 | Decrement Y register
    EOR $0000,Y          ; 59 00 00 | Exclusive OR with accumulator (absolute,Y)
    TXA                  ; 8A | Transfer X register to accumulator
    CMP $0000,X          ; DD 00 00 | Compare accumulator (absolute,X)
    CMP $77BB,X          ; DD BB 77 | Compare accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    CLI                  ; 58 | Clear interrupt disable flag
    BMI $30              ; 30 30 | Branch if negative
    DEY                  ; 88 | Decrement Y register
    ROR $00              ; 66 00 | Rotate right (zero page)
    CPY $B799            ; CC 99 B7 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_03A
; Address: $F18E0F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_03A:
    PHA                  ; 48 | Push accumulator to stack
    BMI $CF              ; 30 CF | Branch if negative
    TAX                  ; AA | Transfer accumulator to X register
    CMP $66AA,X          ; DD AA 66 | Compare accumulator (absolute,X)
    STA $FF00,Y          ; 99 00 FF | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank62_DmaFunction_03B
; Address: $F18E21
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_03B:
    JSR $680F            ; 20 0F 68 | Jump to subroutine
    ASL $3C80            ; 0E 80 3C | Arithmetic shift left (absolute)
    LDY #$3C             ; A0 3C | Load immediate value into Y register
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    STA ($E3,X)          ; 81 E3 | Store accumulator to (zero page,X)
    SED                  ; F8 | Set decimal mode flag
    STA $136A,X          ; 9D 6A 13 | Store accumulator to absolute,X
    LDA #$44             ; A9 44 | Load immediate value into accumulator
    CPY $18B3            ; CC B3 18 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_03C
; Address: $F18E3C
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_03C:
    JSR $70DF            ; 20 DF 70 | Jump to subroutine
    STA $060000          ; 8F 00 00 06 | Store accumulator to absolute long address
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BNE $11              ; D0 11 | Branch if not equal
    AND ($D2),Y          ; 31 D2 | Logical AND with accumulator ((zero page),Y)
    STZ $00              ; 64 00 | Store zero to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CMP ($11),Y          ; D1 11 | Compare accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    BRA $9C              ; 80 9C | Branch always
    ROR $FE81,X          ; 7E 81 FE | Rotate right (absolute,X)
    INC $000B,X          ; FE 0B 00 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    STZ $7E9C            ; 9C 9C 7E | Store zero to absolute
    ROR $FFFF,X          ; 7E FF FF | Rotate right (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BNE $10              ; D0 10 | Branch if not equal
    BMI $90              ; 30 90 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_03D
; Address: $F18E92
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_03D:
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BNE $10              ; D0 10 | Branch if not equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_03E
; Address: $F18E9E
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_03E:
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BMI $90              ; 30 90 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BNE $10              ; D0 10 | Branch if not equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    INX                  ; E8 | Increment X register
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BMI $00              ; 30 00 | Branch if negative
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BEQ $D0              ; F0 D0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $A2              ; F0 A2 | Branch if equal
    AND $6CD3            ; 2D D3 6C | Logical AND with accumulator (absolute)
    DEC $F9              ; C6 F9 | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_03F
; Address: $F18FCE
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_03F:
    EOR $FCFB,X          ; 5D FB FC | Exclusive OR with accumulator (absolute,X)
    STY $1C07            ; 8C 07 1C | Store Y register to absolute address
    INC $CFC5,X          ; FE C5 CF | Increment (absolute,X)
    REP #$07             ; C2 07 | Reset processor status bits
    DEC $1C              ; C6 1C | Decrement (zero page)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$0E             ; E0 0E | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $A0              ; F0 A0 | Branch if equal
    BNE $20              ; D0 20 | Branch if not equal
    BNE $60              ; D0 60 | Branch if not equal
    PEA #$F8C0           ; F4 C0 F8 | Push effective address to stack
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    JMP $00F8F8          ; 5C F8 F8 00 | Jump to address long
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    BVC $08              ; 50 08 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BNE $20              ; D0 20 | Branch if not equal
    BNE $60              ; D0 60 | Branch if not equal
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $FC              ; F0 FC | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPY #$F8             ; C0 F8 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_040
; Address: $F19036
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_040:
    DEY                  ; 88 | Decrement Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$CC             ; C0 CC | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    BEQ $00              ; F0 00 | Branch if equal
    BNE $A4              ; D0 A4 | Branch if not equal
    BNE $20              ; D0 20 | Branch if not equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_041
; Address: $F1904D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_041:
    CPY #$FC             ; C0 FC | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BNE $F8              ; D0 F8 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_042
; Address: $F19055
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_042:
    JSR $40DC            ; 20 DC 40 | Jump to subroutine
    STY $1C00            ; 8C 00 1C | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    CPY #$C4             ; C0 C4 | Compare Y register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    BMI $1C              ; 30 1C | Branch if negative
    BEQ $14              ; F0 14 | Branch if equal
    CPX #$04             ; E0 04 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_044
; Address: $F1906D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_044:
    JSR $64DC            ; 20 DC 64 | Jump to subroutine
    BEQ $C0              ; F0 C0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BPL $FC              ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_045
; Address: $F19079
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_045:
    JSR $40DC            ; 20 DC 40 | Jump to subroutine
    STY $1800            ; 8C 00 18 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    ORA $0C29,Y          ; 19 29 0C | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    INX                  ; E8 | Increment X register
    BEQ $10              ; F0 10 | Branch if equal
    BNE $04              ; D0 04 | Branch if not equal
    BPL $BC              ; 10 BC | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BIT $E9              ; 24 E9 | Test bits in accumulator (zero page)
    CMP #$F8             ; C9 F8 | Compare accumulator (immediate)
    INY                  ; C8 | Increment Y register
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    BPL $FC              ; 10 FC | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_046
; Address: $F1909B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_046:
    JSR $00DC            ; 20 DC 00 | Jump to subroutine
    DEY                  ; 88 | Decrement Y register
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ORA $0C79            ; 0D 79 0C | Logical OR with accumulator (absolute)
    INX                  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_047
; Address: $F190C9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_047:
    BEQ $14              ; F0 14 | Branch if equal
    BRA $04              ; 80 04 | Branch always
    BMI $E7              ; 30 E7 | Branch if negative
    SBC $FC89,Y          ; F9 89 FC | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $FC              ; 10 FC | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_048
; Address: $F19101
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_048:
    JSR $2004            ; 20 04 20 | Jump to subroutine
    ORA $1CE9            ; 0D E9 1C | Logical OR with accumulator (absolute)
    BNE $1C              ; D0 1C | Branch if not equal
    BPL $1C              ; 10 1C | Branch if positive
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    STA $FC09FD          ; 8F FD 09 FC | Store accumulator to absolute long address
    BPL $FC              ; 10 FC | Branch if positive
    BPL $FC              ; 10 FC | Branch if positive
    SBC $AFFF,X          ; FD FF AF | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    PLX                  ; FA | Pull X register from stack
    LDA ($0A,X)          ; A1 0A | Load from (zero page,X) into accumulator
    ORA $3433            ; 0D 33 34 | Logical OR with accumulator (absolute)
    CMP ($C2,X)          ; C1 C2 | Compare accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $30              ; F0 30 | Branch if equal
    BMI $D0              ; 30 D0 | Branch if negative
    BMI $D0              ; 30 D0 | Branch if negative
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BCS $B0              ; B0 B0 | Branch if carry set
    BPL $10              ; 10 10 | Branch if positive
    BMI $C8              ; 30 C8 | Branch if negative
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E8              ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_049
; Address: $F19156
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_049:
    JSR $B0D0            ; 20 D0 B0 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    BPL $A8              ; 10 A8 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    LDY $78FC            ; AC FC 78 | Load from absolute address into Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    LDY $08              ; A4 08 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_04A
; Address: $F19175
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_04A:
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    JMP $FCFCFC          ; 5C FC FC FC | Jump to address long
    LDY $78FC            ; AC FC 78 | Load from absolute address into Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    PEA #$A404           ; F4 04 A4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PEA #$A45C           ; F4 5C A4 | Push effective address to stack
    CPX $BC5C            ; EC 5C BC | Compare X register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY $08              ; A4 08 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    JMP $FCECFC          ; 5C FC EC FC | Jump to address long
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    LDY $E4              ; A4 E4 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    DEY                  ; 88 | Decrement Y register
    BPL $10              ; 10 10 | Branch if positive
    CPX #$E0             ; E0 E0 | Game work RAM access
    DEC $FE6E,X          ; DE 6E FE | Decrement (absolute,X)
    DEC $FCFC,X          ; DE FC FC | Decrement (absolute,X)
    JMP $F8F8FC          ; 5C FC F8 F8 | Jump to address long
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BPL $40              ; 10 40 | Branch if positive
    CPX $C4              ; E4 C4 | Compare X register (zero page)
    INY                  ; C8 | Increment Y register
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_04B
; Address: $F191FC
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_04B:
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY $DE40,X          ; BC 40 DE | Load from absolute,X into Y register
    ROL $DE              ; 26 DE | Rotate left (zero page)
    ROR $DCFC            ; 6E FC DC | Rotate right (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    DEY                  ; 88 | Decrement Y register
    BPL $40              ; 10 40 | Branch if positive
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    BCS $B0              ; B0 B0 | Branch if carry set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    JMP $8600            ; 4C 00 86 | Jump to address
    BMI $AE              ; 30 AE | Branch if negative
    RTI                  ; 40 | Return from interrupt
    DEC $DC20,X          ; DE 20 DC | Decrement (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_04C
; Address: $F1922A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_04C:
    SED                  ; F8 | Set decimal mode flag
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $DE00,X          ; FE 00 DE | Increment (absolute,X)
    STY $1800            ; 8C 00 18 | Store Y register to absolute address
    RTI                  ; 40 | Return from interrupt
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BNE $10              ; D0 10 | Branch if not equal
    BMI $50              ; 30 50 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    BPL $A0              ; 10 A0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    BPL $10              ; 10 10 | Branch if positive
    BNE $90              ; D0 90 | Branch if not equal
    BEQ $60              ; F0 60 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    AND ($51),Y          ; 31 51 | Logical AND with accumulator ((zero page),Y)
    BNE $28              ; D0 28 | Branch if not equal
    BNE $60              ; D0 60 | Branch if not equal
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_04D
; Address: $F19276
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_04D:
    CMP ($91),Y          ; D1 91 | Compare accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPY #$D8             ; C0 D8 | Compare Y register (immediate)
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    ASL $EF              ; 06 EF | Arithmetic shift left (zero page)
    XBA                  ; EB | Exchange accumulator bytes
    ADC ($F1),Y          ; 71 F1 | Add with carry ((zero page),Y)
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    EOR #$41             ; 49 41 | Exclusive OR with accumulator (immediate)
    CPY $C0              ; C4 C0 | Compare Y register (zero page)
    PEA #$F0F0           ; F4 F0 F0 | Push effective address to stack
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $20              ; D0 20 | Branch if not equal
    BNE $60              ; D0 60 | Branch if not equal
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    BEQ $E4              ; F0 E4 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $58              ; F0 58 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    CLC                  ; 18 | Clear carry flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    CPY #$DC             ; C0 DC | Compare Y register (immediate)
    CPY #$0C             ; C0 0C | Compare Y register (immediate)
    BVC $F8              ; 50 F8 | Branch if overflow clear
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$F858           ; F4 58 F8 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_04E
; Address: $F192F0
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_04E:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDY $78FC            ; AC FC 78 | Load from absolute address into Y register
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$A404           ; F4 04 A4 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX $BCFC            ; EC FC BC | Compare X register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    PEA #$E424           ; F4 24 E4 | Push effective address to stack
    LDY $A4              ; A4 A4 | Load from zero page into Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX $BCFC            ; EC FC BC | Compare X register (absolute)
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    BCC $F0              ; 90 F0 | Branch if carry clear
    PEA #$E464           ; F4 64 E4 | Push effective address to stack
    LDY $A4              ; A4 A4 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_04F
; Address: $F1935A
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_04F:
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ROR $FE81,X          ; 7E 81 FE | Rotate right (absolute,X)
    INC $000B,X          ; FE 0B 00 | Increment (absolute,X)
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_051
; Address: $F193CB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_051:
    BCC $F0              ; 90 F0 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BEQ $28              ; F0 28 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_053
; Address: $F193DA
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_053:
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $0007            ; 0E 07 00 | Arithmetic shift left (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_055
; Address: $F19447
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_055:
    BCC $F0              ; 90 F0 | Branch if carry clear
    INX                  ; E8 | Increment X register
    BEQ $B8              ; F0 B8 | Branch if equal
    BVS $D8              ; 70 D8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_059
; Address: $F19456
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_059:
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $D0              ; F0 D0 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $000F            ; 0D 0F 00 | Logical OR with accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_05A
; Address: $F1948A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_05A:
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_05B
; Address: $F19499
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_05B:
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$07             ; C0 07 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ASL $0E0D            ; 0E 0D 0E | Arithmetic shift left (absolute)
    ORA $0C0F            ; 0D 0F 0C | Logical OR with accumulator (absolute)
    ASL $0F07            ; 0E 07 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0F01            ; 0E 01 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ASL $0F09            ; 0E 09 0F | Arithmetic shift left (absolute)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL $0C0F            ; 0E 0F 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_05C
; Address: $F194E1
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_05C:
    CLI                  ; 58 | Clear interrupt disable flag
    CPX #$30             ; E0 30 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_05D
; Address: $F194E5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_05D:
    BRA $C0              ; 80 C0 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $78              ; 80 78 | Branch always
    TAY                  ; A8 | Transfer accumulator to Y register
    BMI $D0              ; 30 D0 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_05E
; Address: $F194F4
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_05E:
    JSR $00F0            ; 20 F0 00 | Jump to subroutine
    CPX #$40             ; E0 40 | Compare X register (immediate)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $0F0A            ; 0D 0A 0F | Logical OR with accumulator (absolute)
    ORA $0E06            ; 0D 06 0E | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0E0C            ; 0E 0C 0E | Arithmetic shift left (absolute)
    ORA $0D              ; 05 0D | Logical OR with accumulator (zero page)
    ASL $0F08            ; 0E 08 0F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $0E02            ; 0D 02 0E | Logical OR with accumulator (absolute)
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $0400            ; 0E 00 04 | Arithmetic shift left (absolute)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_05F
; Address: $F19560
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_05F:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_060
; Address: $F1956C
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_060:
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BEQ $60              ; F0 60 | Branch if equal
    BNE $40              ; D0 40 | Branch if not equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $08              ; 80 08 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA $0600            ; 0D 00 06 | Logical OR with accumulator (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0080            ; 0E 80 00 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $0D              ; 06 0D | Arithmetic shift left (zero page)
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_061
; Address: $F19634
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_061:
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA $0CEB            ; 0D EB 0C | Logical OR with accumulator (absolute)
    ORA $0032,X          ; 1D 32 00 | Logical OR with accumulator (absolute,X)
    CPY $F00F            ; CC 0F F0 | Compare Y register (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_062
; Address: $F19745
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_062:
    JSR $A0C0            ; 20 C0 A0 | Jump to subroutine
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_063
; Address: $F19752
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_063:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_064
; Address: $F19763
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_064:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    BMI $48              ; 30 48 | Branch if negative
    BMI $48              ; 30 48 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BIT $58              ; 24 58 | Test bits in accumulator (zero page)
    STZ $DC              ; 64 DC | Store zero to zero page
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_065
; Address: $F19772
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_065:
    JSR $7020            ; 20 20 70 | Jump to subroutine
    BVS $78              ; 70 78 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$60             ; A0 60 | Load immediate value into Y register
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $70              ; 90 70 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag
    STZ $40              ; 64 40 | Store zero to zero page
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    JMP ($5CE4)          ; 6C E4 5C | Jump to address (absolute indirect)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ROL $2E3F            ; 2E 3F 2E | Rotate left (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BVC $C0              ; 50 C0 | Branch if overflow clear
    BMI $F0              ; 30 F0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_066
; Address: $F197CA
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_066:
    BEQ $08              ; F0 08 | Branch if equal
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $08              ; 64 08 | Store zero to zero page
    PEA #$4040           ; F4 40 40 | Push effective address to stack
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA $0C19            ; 0D 19 0C | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $1816,Y          ; 19 16 18 | Logical OR with accumulator (absolute,Y)
    SBC $FF03,X          ; FD 03 FF | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SBC $FEFF,X          ; FD FF FE | Subtract with carry (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    BEQ $7F              ; F0 7F | Branch if equal
    CPX #$BF             ; E0 BF | Compare X register (immediate)
    CPX #$5F             ; E0 5F | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_067
; Address: $F19828
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_067:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BVS $88              ; 70 88 | Branch if overflow set
    BMI $C8              ; 30 C8 | Branch if negative
    SEC                  ; 38 | Set carry flag
    CPY $0000            ; CC 00 00 | Compare Y register (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PEA #$0603           ; F4 03 06 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_068
; Address: $F19860
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_068:
    RTI                  ; 40 | Return from interrupt
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BVS $A0              ; 70 A0 | Branch if overflow set
    BVS $E0              ; 70 E0 | Game work RAM access
    BMI $E0              ; 30 E0 | Game work RAM access
    BMI $E0              ; 30 E0 | Game work RAM access
    BPL $F0              ; 10 F0 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $D0              ; F0 D0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    ORA $0532,X          ; 1D 32 05 | Logical OR with accumulator (absolute,X)
    ORA $D2              ; 05 D2 | Logical OR with accumulator (zero page)
    AND ($D5,X)          ; 21 D5 | Logical AND with accumulator ((zero page,X))
    INC $FDC3,X          ; FE C3 FD | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STA $1F02            ; 8D 02 1F | Store accumulator to absolute address
    WDM #$FF             ; 42 FF | Reserved instruction
    CMP ($C7,X)          ; C1 C7 | Compare accumulator ((zero page,X))
    REP #$C0             ; C2 C0 | Reset processor status bits
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_069
; Address: $F198B1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_069:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $6C              ; 80 6C | Branch always
    BMI $2C              ; 30 2C | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    BIT $2E32            ; 2C 32 2E | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    ASL $16CC            ; 0E CC 16 | Arithmetic shift left (absolute)
    STX $00              ; 86 00 | Store X register to zero page
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BMI $F8              ; 30 F8 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_06A
; Address: $F198D1
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_06A:
    LDX $B7F8,Y          ; BE F8 B7 | Load from absolute,Y into X register
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF F8 17 EC | Load from absolute long,X into accumulator
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    ASL $F4              ; 06 F4 | Arithmetic shift left (zero page)
    DEX                  ; CA | Decrement X register
    NOP                  ; EA | No operation
    INY                  ; C8 | Increment Y register
    JMP $341C20          ; 5C 20 1C 34 | Jump to address long
    BIT $701C            ; 2C 1C 70 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    JMP ($E208)          ; 6C 08 E2 | Jump to address (absolute indirect)
    ROR $5EE2,X          ; 7E E2 5E | Rotate right (absolute,X)
    CPX #$7E             ; E0 7E | Compare X register (immediate)
    CPX #$3E             ; E0 3E | Compare X register (immediate)
    PEA #$FC2A           ; F4 2A FC | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    BIT $33              ; 24 33 | Test bits in accumulator (zero page)
    ROR                  ; 6A | Rotate right (accumulator)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_06B
; Address: $F19909
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_06B:
    ADC ($3D),Y          ; 71 3D | Add with carry ((zero page),Y)
    ADC $3905,Y          ; 79 05 39 | Add with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ROL $3B26,X          ; 3E 26 3B | Rotate left (absolute,X)
    EOR $5F62,X          ; 5D 62 5F | Exclusive OR with accumulator (absolute,X)
    EOR $4E71,X          ; 5D 71 4E | Exclusive OR with accumulator (absolute,X)
    ADC $3946,Y          ; 79 46 39 | Add with carry (absolute,Y)
    ROL $273E,X          ; 3E 3E 27 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PEA #$F20C           ; F4 0C F2 | Push effective address to stack
    STZ $FC66            ; 9C 66 FC | Store zero to absolute
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    ASL $BEFC            ; 0E FC BE | Arithmetic shift left (absolute)
    CPX #$FC             ; E0 FC | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    CPX $FC04            ; EC 04 FC | Compare X register (absolute)
    ASL $FE              ; 06 FE | Arithmetic shift left (zero page)
    ASL $FA              ; 06 FA | Arithmetic shift left (zero page)
    ASL $9EFA            ; 0E FA 9E | Arithmetic shift left (absolute)
    INC $FC42,X          ; FE 42 FC | Increment (absolute,X)
    CPX $1EF4            ; EC F4 1E | Compare X register (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $1F1F,X          ; 1E 1F 1F | Arithmetic shift left (absolute,X)
    ASL $0C0F,X          ; 1E 0F 0C | Arithmetic shift left (absolute,X)
    ASL $38              ; 06 38 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_06C
; Address: $F19955
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_06C:
    JSR $1E1F            ; 20 1F 1E | Jump to subroutine
    AND ($1E,X)          ; 21 1E | Logical AND with accumulator ((zero page,X))
    AND ($0C,X)          ; 21 0C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_06D
; Address: $F1995E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_06D:
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    BVS $7F              ; 70 7F | Branch if overflow set
    LDX $119F,Y          ; BE 9F 11 | Load from absolute,Y into X register
    DEC $935C            ; CE 5C 93 | Decrement (absolute)
    CLC                  ; 18 | Clear carry flag
    LDA $6042            ; AD 42 60 | Load from absolute address into accumulator
    LDA                  ; BF 78 8F 3F | Load from absolute long,X into accumulator
    CPY #$9F             ; C0 9F | Compare Y register (immediate)
    ADC ($CE,X)          ; 61 CE | Add with carry ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    STY $3CF8            ; 8C F8 3C | Store Y register to absolute address
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $70              ; F0 70 | Branch if equal
    CPX #$60             ; E0 60 | Compare X register (immediate)
    PEA #$C43C           ; F4 3C C4 | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    STY $70              ; 84 70 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_06E
; Address: $F1999F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_06E:
    BCC $0F              ; 90 0F | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BIT $13              ; 24 13 | Test bits in accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_072
; Address: $F199BA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_072:
    JSL $3D333F          ; 22 3F 33 3D | Jump to subroutine long
    AND ($2E),Y          ; 31 2E | Logical AND with accumulator ((zero page),Y)
    BCC $68              ; 90 68 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    PEA #$7488           ; F4 88 74 | Push effective address to stack
    TYA                  ; 98 | Transfer Y register to accumulator
    STZ $F8              ; 64 F8 | Store zero to zero page
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_073
; Address: $F199D2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_073:
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    STZ $FEF4            ; 9C F4 FE | Store zero to absolute
    SBC $FA5D,X          ; FD 5D FA | Subtract with carry (absolute,X)
    SBC $BB7A            ; ED 7A BB | Subtract with carry (absolute)
    SED                  ; F8 | Set decimal mode flag
    SBC $F3F3,Y          ; F9 F3 F3 | Subtract with carry (absolute,Y)
    CMP ($C1,X)          ; C1 C1 | Compare accumulator ((zero page,X))
    ORA #$0B             ; 09 0B | Logical OR with accumulator (immediate)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_074
; Address: $F199F4
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_074:
    JSR $0067            ; 20 67 00 | Jump to subroutine
    ORA #$0E             ; 09 0E | Logical OR with accumulator (immediate)
    CMP ($C2,X)          ; C1 C2 | Compare accumulator ((zero page,X))
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    WDM #$D6             ; 42 D6 | Reserved instruction
    BIT $D6              ; 24 D6 | Test bits in accumulator (zero page)
    STZ $F6              ; 64 F6 | Store zero to zero page
    CPX $ECEC            ; EC EC EC | Compare X register (absolute)
    CPX $E8E8            ; EC E8 E8 | Compare X register (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    STY $0B              ; 84 0B | Store Y register to zero page
    INC $C9              ; E6 C9 | Increment (zero page)
    CPY $6CD2            ; CC D2 6C | Compare Y register (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$C8             ; C0 C8 | Compare Y register (immediate)
    CPY $8800            ; CC 00 88 | Compare Y register (absolute)
    BIT $98              ; 24 98 | Test bits in accumulator (zero page)
    BVC $D8              ; 50 D8 | Branch if overflow clear
    BPL $D8              ; 10 D8 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $B0              ; B0 B0 | Branch if carry set
    BCS $B0              ; B0 B0 | Branch if carry set
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    CPX #$1E             ; E0 1E | Compare X register (immediate)
    BNE $2C              ; D0 2C | Branch if not equal
    BCC $2C              ; 90 2C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_075
; Address: $F19A58
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_075:
    CLC                  ; 18 | Clear carry flag
    STZ $B0              ; 64 B0 | Store zero to zero page
    INY                  ; C8 | Increment Y register
    BCS $C8              ; B0 C8 | Branch if carry set
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    ORA $1D18,X          ; 1D 18 1D | Logical OR with accumulator (absolute,X)
    BPL $19              ; 10 19 | Branch if positive
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    ASL $0608            ; 0E 08 06 | Arithmetic shift left (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($2F),Y          ; 11 2F | Logical OR with accumulator ((zero page),Y)
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $50              ; B0 50 | Branch if carry set
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag
    CPY $18              ; C4 18 | Compare Y register (zero page)
    CPX $18              ; E4 18 | Compare X register (zero page)
    CPX $10              ; E4 10 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BRA $60              ; 80 60 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $80              ; 80 80 | Branch always
    BRA $60              ; 80 60 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $0539,X          ; 1D 39 05 | Logical OR with accumulator (absolute,X)
    ORA $3E18,Y          ; 19 18 3E | Logical OR with accumulator (absolute,Y)
    ORA $1D18,X          ; 1D 18 1D | Logical OR with accumulator (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ORA $1910,X          ; 1D 10 19 | Logical OR with accumulator (absolute,X)
    ORA #$05             ; 09 05 | Logical OR with accumulator (immediate)
    AND $1926,Y          ; 39 26 19 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_076
; Address: $F19B13
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_076:
    ASL $273E,X          ; 1E 3E 27 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($2F),Y          ; 11 2F | Logical OR with accumulator ((zero page),Y)
    ORA ($2E),Y          ; 11 2E | Logical OR with accumulator ((zero page),Y)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    LDY $F8E0,X          ; BC E0 F8 | Load from absolute,X into Y register
    CLC                  ; 18 | Clear carry flag
    CPX $78F8            ; EC F8 78 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $50              ; B0 50 | Branch if carry set
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CPX $F8F4            ; EC F4 F8 | Compare X register (absolute)
    STY $B8              ; 84 B8 | Store Y register to zero page
    CPY $18              ; C4 18 | Compare Y register (zero page)
    CPX $18              ; E4 18 | Compare X register (zero page)
    CPX $10              ; E4 10 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    JMP ($1000)          ; 6C 00 10 | Jump to address (absolute indirect)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BVS $D0              ; 70 D0 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    DEC $39              ; C6 39 | Decrement (zero page)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_077
; Address: $F19BB1
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_077:
    RTI                  ; 40 | Return from interrupt
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    BEQ $D0              ; F0 D0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INX                  ; E8 | Increment X register
    PEA #$FCFC           ; F4 FC FC | Push effective address to stack
    STX $FE              ; 86 FE | Store X register to zero page
    ASL $0608            ; 0E 08 06 | Arithmetic shift left (absolute)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BPL $E8              ; 10 E8 | Branch if positive
    LDY #$50             ; A0 50 | Load immediate value into Y register
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BRA $70              ; 80 70 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    INC $3800,X          ; FE 00 38 | Increment (absolute,X)
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    DEC $00              ; C6 00 | Decrement (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $2F              ; 10 2F | Branch if positive
    ROR                  ; 6A | Rotate right (accumulator)
    ROR                  ; 6A | Rotate right (accumulator)
    REP #$7B             ; C2 7B | Reset processor status bits
    SBC $7C0D,Y          ; F9 0D 7C | Subtract with carry (absolute,Y)
    BVS $7E              ; 70 7E | Branch if overflow set
    ROR $6E55            ; 6E 55 6E | Rotate right (absolute)
    PLY                  ; 7A | Pull Y register from stack
    LDA $BCC3,X          ; BD C3 BC | Load from absolute,X into accumulator
    SBC $7C86,Y          ; F9 86 7C | Subtract with carry (absolute,Y)
    ROR $828F,X          ; 7E 8F 82 | Rotate right (absolute,X)
    ADC $7D82,X          ; 7D 82 7D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_078
; Address: $F19C45
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_078:
    ADC $39C7,X          ; 7D C7 39 | Add with carry (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $7E              ; 80 7E | Branch always
    BVS $7A              ; 70 7A | Branch if overflow set
    STZ $38              ; 64 38 | Store zero to zero page
    ROL $1D              ; 26 1D | Rotate left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BVS $8F              ; 70 8F | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_079
; Address: $F19C93
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_079:
    STA                  ; 9F 20 5F 10 | Store accumulator to absolute long,X
    STX $5C72            ; 8E 72 5C | Store X register to absolute address
    BIT $F8              ; 24 F8 | Test bits in accumulator (zero page)
    DEY                  ; 88 | Decrement Y register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SBC $FA04,X          ; FD 04 FA | Subtract with carry (absolute,X)
    DEY                  ; 88 | Decrement Y register
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    AND $603F,Y          ; 39 3F 60 | Logical AND with accumulator (absolute,Y)
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    LDY #$7F             ; A0 7F | Load immediate value into Y register
    BVC $BF              ; 50 BF | Branch if overflow clear
    CLC                  ; 18 | Clear carry flag
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    LDA                  ; BF FE DF 7C | Load from absolute long,X into accumulator
    LDA $00E71E          ; AF 1E E7 00 | Load from absolute long address into accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_07D
; Address: $F19D49
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_07D:
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_07E
; Address: $F19D5D
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_07E:
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    BCC $0F              ; 90 0F | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    BPL $0F              ; 10 0F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $07              ; 10 07 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    SBC $0BC1,X          ; FD C1 0B | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SBC $FD02,X          ; FD 02 FD | Subtract with carry (absolute,X)
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    PEA #$0F00           ; F4 00 0F | Push effective address to stack
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    STA $0EFE73          ; 8F 73 FE 0E | Store accumulator to absolute long address
    CPX #$E0             ; E0 E0 | Game work RAM access
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $E0F1            ; 0E F1 E0 | Game work RAM access
    ASL $E000,X          ; 1E 00 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_07F
; Address: $F19DC4
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_07F:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BNE $10              ; D0 10 | Branch if not equal
    BMI $D1              ; 30 D1 | Branch if negative
    ORA $0062,Y          ; 19 62 00 | Logical OR with accumulator (absolute,Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_080
; Address: $F19DF9
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_080:
    PHP                  ; 08 | Push processor status to stack
    BNE $10              ; D0 10 | Branch if not equal
    SBC ($11),Y          ; F1 11 | Subtract with carry ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROR $FE81,X          ; 7E 81 FE | Rotate right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    PLB                  ; AB | Pull data bank register from stack
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $10              ; 70 10 | Branch if overflow set
    BPL $70              ; 10 70 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    CMP ($41),Y          ; D1 41 | Compare accumulator ((zero page),Y)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROR $0081,X          ; 7E 81 00 | Rotate right (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROR $FF7E,X          ; 7E 7E FF | Rotate right (absolute,X)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BVS $10              ; 70 10 | Branch if overflow set
    BPL $60              ; 10 60 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $06              ; 10 06 | Branch if positive
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_081
; Address: $F19E84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_081:
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    ROR $007E,X          ; 7E 7E 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_083
; Address: $F19EB4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_083:
    JSL $775522          ; 22 22 55 77 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_084
; Address: $F19EBE
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_084:
    JSL $00003F          ; 22 3F 00 00 | Jump to subroutine long
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_086
; Address: $F19EF4
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_086:
    JSL $775522          ; 22 22 55 77 | Jump to subroutine long
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    EOR #$7F             ; 49 7F | Exclusive OR with accumulator (immediate)
    PLB                  ; AB | Pull data bank register from stack
    BIT $D2              ; 24 D2 | Test bits in accumulator (zero page)
    ADC $CDF2            ; 6D F2 CD | Add with carry (absolute)
    CPX $F9              ; E4 F9 | Compare X register (zero page)
    EOR $FCFB,Y          ; 59 FB FC | Exclusive OR with accumulator (absolute,Y)
    DEC $8C47,X          ; DE 47 8C | Decrement (absolute,X)
    ASL $4703            ; 0E 03 47 | Arithmetic shift left (absolute)
    WDM #$F7             ; 42 F7 | Reserved instruction
    INC $3C0B,X          ; FE 0B 3C | Increment (absolute,X)
    DEC $1C              ; C6 1C | Decrement (zero page)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $0CFA            ; 0E FA 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    BEQ $08              ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_087
; Address: $F19F40
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_087:
    EOR $D322,Y          ; 59 22 D3 | Exclusive OR with accumulator (absolute,Y)
    STZ $E3              ; 64 E3 | Store zero to zero page
    CPY $EDE2            ; CC E2 ED | Compare Y register (absolute)
    EOR $F9FE,Y          ; 59 FE F9 | Exclusive OR with accumulator (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    SBC $8BFF,X          ; FD FF 8B | Subtract with carry (absolute,X)
    STZ $FC47,X          ; 9E 47 FC | Store zero to absolute,X
    STZ $0C87            ; 9C 87 0C | Store zero to absolute
    LSR $43              ; 46 43 | Logical shift right (zero page)
    INC $FE55,X          ; FE 55 FE | Increment (absolute,X)
    DEC $1C              ; C6 1C | Decrement (zero page)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PLB                  ; AB | Pull data bank register from stack
    ASL $0CFA            ; 0E FA 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PEA #$F408           ; F4 08 F4 | Push effective address to stack
    CLC                  ; 18 | Clear carry flag
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    BVC $25              ; 50 25 | Branch if overflow clear
    CMP ($6F),Y          ; D1 6F | Compare accumulator ((zero page),Y)
    DEC $ECE3            ; CE E3 EC | Decrement (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $F9FE,Y          ; F9 FE F9 | Subtract with carry (absolute,Y)
    STA $9F05            ; 8D 05 9F | Store accumulator to absolute address
    LSR $FE              ; 46 FE | Logical shift right (zero page)
    CMP $9C              ; C5 9C | Compare accumulator (zero page)
    LSR $43              ; 46 43 | Logical shift right (zero page)
    INC $E3              ; E6 E3 | Increment (zero page)
    ROR $FE81,X          ; 7E 81 FE | Rotate right (absolute,X)
    INC $3C0B,X          ; FE 0B 3C | Increment (absolute,X)
    DEC $1C              ; C6 1C | Decrement (zero page)
    INX                  ; E8 | Increment X register
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    PLB                  ; AB | Pull data bank register from stack
    ASL $0CFA            ; 0E FA 0C | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PEA #$F408           ; F4 08 F4 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_088
; Address: $F19FBE
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_088:
    CLC                  ; 18 | Clear carry flag
    CPX $1F              ; E4 1F | Compare X register (zero page)
    ORA $0F0F            ; 0D 0F 0F | Logical OR with accumulator (absolute)
    BPL $1B              ; 10 1B | Branch if positive
    BPL $1B              ; 10 1B | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $0F08            ; 0D 08 0F | Logical OR with accumulator (absolute)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ROL $1C3E,X          ; 3E 3E 1C | Rotate left (absolute,X)
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    EOR ($6F,X)          ; 41 6F | Exclusive OR with accumulator ((zero page,X))
    EOR ($77,X)          ; 41 77 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_089
; Address: $F1A01A
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_089:
    JSL $1C1C3E          ; 22 3E 1C 1C | Jump to subroutine long
    SBC $FFFF,X          ; FD FF FF | Subtract with carry (absolute,X)
    INC $FEEF,X          ; FE EF FE | Increment (absolute,X)
    ADC $F0F9,Y          ; 79 F9 F0 | Add with carry (absolute,Y)
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $F9FA,X          ; FE FA F9 | Increment (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    SBC #$13             ; E9 13 | Subtract with carry (immediate)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    BMI $31              ; 30 31 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    INC $FEEF,X          ; FE EF FE | Increment (absolute,X)
    LDA $78FD,X          ; BD FD 78 | Load from absolute,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    PLX                  ; FA | Pull X register from stack
    INC $F9FA,X          ; FE FA F9 | Increment (absolute,X)
    NOP                  ; EA | No operation
    SBC #$B7             ; E9 B7 | Subtract with carry (immediate)
    PEA #$A605           ; F4 05 A6 | Push effective address to stack
    PHP                  ; 08 | Push processor status to stack
    ORA #$30             ; 09 30 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_08A
; Address: $F1A05F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_08A:
    BMI $00              ; 30 00 | Branch if negative
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    BNE $30              ; D0 30 | Branch if not equal
    BNE $E0              ; D0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_08B
; Address: $F1A069
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_08B:
    JSR $B0B0            ; 20 B0 B0 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $C8              ; 30 C8 | Branch if negative
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E8              ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_08C
; Address: $F1A078
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_08C:
    JSR $B0D0            ; 20 D0 B0 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    BPL $A8              ; 10 A8 | Branch if positive
    BPL $FC              ; 10 FC | Branch if positive
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    INC $FEEF,X          ; FE EF FE | Increment (absolute,X)
    SBC $FCFD,X          ; FD FD FC | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    INC $F9FA,X          ; FE FA F9 | Increment (absolute,X)
    NOP                  ; EA | No operation
    SBC #$97             ; E9 97 | Subtract with carry (immediate)
    PEA #$F695           ; F4 95 F6 | Push effective address to stack
    BIT $E5              ; 24 E5 | Test bits in accumulator (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    BNE $30              ; D0 30 | Branch if not equal
    BNE $E0              ; D0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_08D
; Address: $F1A0AB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_08D:
    JSR $B0B0            ; 20 B0 B0 | Jump to subroutine
    BPL $10              ; 10 10 | Branch if positive
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $C8              ; 30 C8 | Branch if negative
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E8              ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_08E
; Address: $F1A0BA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_08E:
    JSR $B0D0            ; 20 D0 B0 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    BPL $A8              ; 10 A8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    BNE $30              ; D0 30 | Branch if not equal
    BNE $E0              ; D0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_08F
; Address: $F1A0CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_08F:
    JSR $B0B0            ; 20 B0 B0 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    BEQ $08              ; F0 08 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_090
; Address: $F1A0D6
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_090:
    BMI $C8              ; 30 C8 | Branch if negative
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E8              ; 10 E8 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_091
; Address: $F1A0DC
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_091:
    JSR $B0D0            ; 20 D0 B0 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    SBC $FDFE,X          ; FD FE FD | Subtract with carry (absolute,X)
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    SBC $FDFF,X          ; FD FF FD | Subtract with carry (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SBC $FCFD,X          ; FD FD FC | Subtract with carry (absolute,X)
    SBC $00FD,X          ; FD FD 00 | Subtract with carry (absolute,X)
    JMP $227F            ; 4C 7F 22 | Jump to address
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ORA $3F1D,X          ; 1D 1D 3F | Logical OR with accumulator (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $231D,X          ; 1D 1D 23 | Logical OR with accumulator (absolute,X)
    BPL $1F              ; 10 1F | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_092
; Address: $F1A177
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_092:
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BEQ $48              ; F0 48 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BIT $FC              ; 24 FC | Test bits in accumulator (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_093
; Address: $F1A1A4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_093:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    BMI $F0              ; 30 F0 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_094
; Address: $F1A1B4
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_094:
    JSR $C0E0            ; 20 E0 C0 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    BPL $A8              ; 10 A8 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    INC $DEFE,X          ; FE FE DE | Increment (absolute,X)
    INC $FC7C,X          ; FE 7C FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    BVS $F0              ; 70 F0 | Branch if overflow set
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCC $F0              ; 90 F0 | Branch if carry clear
    BCC $F0              ; 90 F0 | Branch if carry clear
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $70              ; 10 70 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_095
; Address: $F1A258
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_095:
    JSR $C0E0            ; 20 E0 C0 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $DEFE,X          ; FE FE DE | Increment (absolute,X)
    INC $7E6E,X          ; FE 6E 7E | Increment (absolute,X)
    ROR $3C7E,X          ; 7E 7E 3C | Rotate right (absolute,X)
    INC $DE82,X          ; FE 82 DE | Increment (absolute,X)
    WDM #$6E             ; 42 6E | Reserved instruction
    WDM #$7E             ; 42 7E | Reserved instruction
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $000F            ; 0E 0F 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_096
; Address: $F1A2AC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_096:
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    LDY $DCFC,X          ; BC FC DC | Load from absolute,X into Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_097
; Address: $F1A2F1
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_097:
    CPX #$90             ; E0 90 | Compare X register (immediate)
    BEQ $48              ; F0 48 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BIT $BC              ; 24 BC | Test bits in accumulator (zero page)
    STY $DC              ; 84 DC | Store Y register to zero page
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BMI $3F              ; 30 3F | Branch if negative
    INC $FE              ; E6 FE | Increment (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    INC $C1              ; E6 C1 | Increment (zero page)
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    STY $DC              ; 84 DC | Store Y register to zero page
    INC $FC3C,X          ; FE 3C FC | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $00FE            ; EE FE 00 | Increment (absolute)
    CPX #$E0             ; E0 E0 | Game work RAM access
    INC $3F3F            ; EE 3F 3F | Increment (absolute)
    ROR $387E,X          ; 7E 7E 38 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND ($3F),Y          ; 31 3F | Logical AND with accumulator ((zero page),Y)
    LSR $7E              ; 46 7E | Logical shift right (zero page)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_098
; Address: $F1A3D5
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_098:
    SEC                  ; 38 | Set carry flag
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    SBC ($FF),Y          ; F1 FF | Subtract with carry ((zero page),Y)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $10              ; 70 10 | Branch if overflow set
    BPL $60              ; 10 60 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $00              ; 30 00 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BMI $30              ; 30 30 | Branch if negative
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BVS $10              ; 70 10 | Branch if overflow set
    BPL $60              ; 10 60 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $10              ; F0 10 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_09A
; Address: $F1A462
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_09A:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $60              ; 80 60 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_09B
; Address: $F1A472
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_09B:
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BPL $10              ; 10 10 | Branch if positive
    BVS $10              ; 70 10 | Branch if overflow set
    BPL $61              ; 10 61 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_09C
; Address: $F1A48E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_09C:
    AND #$13             ; 29 13 | Logical AND with accumulator (immediate)
    BPL $10              ; 10 10 | Branch if positive
    BEQ $10              ; F0 10 | Branch if equal
    SBC ($81),Y          ; F1 81 | Subtract with carry ((zero page),Y)
    WDM #$00             ; 42 00 | Reserved instruction
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_09E
; Address: $F1A4AD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_09E:
    BCC $F0              ; 90 F0 | Branch if carry clear
    INX                  ; E8 | Increment X register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A0
; Address: $F1A4BC
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A0:
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $262E            ; 2E 2E 26 | Rotate left (absolute)
    ROL $70              ; 26 70 | Rotate left (zero page)
    BPL $10              ; 10 10 | Branch if positive
    ADC ($29,X)          ; 61 29 | Add with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $262E            ; 2E 2E 26 | Rotate left (absolute)
    ROL $F0              ; 26 F0 | Rotate left (zero page)
    BPL $F1              ; 10 F1 | Branch if positive
    STA ($DB,X)          ; 81 DB | Store accumulator to (zero page,X)
    WDM #$00             ; 42 00 | Reserved instruction
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BMI $30              ; 30 30 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    CLI                  ; 58 | Clear interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BMI $30              ; 30 30 | Branch if negative
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A1
; Address: $F1A538
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A1:
    DEY                  ; 88 | Decrement Y register
    SED                  ; F8 | Set decimal mode flag
    BPL $F0              ; 10 F0 | Branch if positive
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A2
; Address: $F1A53E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A2:
    JSR $50E0            ; 20 E0 50 | Jump to subroutine
    AND $D1              ; 25 D1 | Logical AND with accumulator (zero page)
    DEC $ECE3            ; CE E3 EC | Decrement (absolute)
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SBC $8DFE,Y          ; F9 FE 8D | Subtract with carry (absolute,Y)
    ORA $9F              ; 05 9F | Logical OR with accumulator (zero page)
    LSR $FE              ; 46 FE | Logical shift right (zero page)
    CMP $9C              ; C5 9C | Compare accumulator (zero page)
    LSR $43              ; 46 43 | Logical shift right (zero page)
    INC $E3              ; E6 E3 | Increment (zero page)
    BMI $C8              ; 30 C8 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BIT $9870            ; 2C 70 98 | Test bits in accumulator (absolute)
    BMI $C0              ; 30 C0 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A4
; Address: $F1A56F
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A4:
    JSR $F8F8            ; 20 F8 F8 | Jump to subroutine
    JMP ($D43C)          ; 6C 3C D4 | Jump to address (absolute indirect)
    CLC                  ; 18 | Clear carry flag
    INX                  ; E8 | Increment X register
    BPL $F8              ; 10 F8 | Branch if positive
    BEQ $20              ; F0 20 | Branch if equal
    BNE $50              ; D0 50 | Branch if not equal
    AND $D1              ; 25 D1 | Logical AND with accumulator (zero page)
    ROR $CEE3            ; 6E E3 CE | Rotate right (absolute)
    CPX $F5F3            ; EC F3 F5 | Compare X register (absolute)
    EOR $F9FE,Y          ; 59 FE F9 | Exclusive OR with accumulator (absolute,Y)
    INC $FFF9,X          ; FE F9 FF | Increment (absolute,X)
    STA $9F05            ; 8D 05 9F | Store accumulator to absolute address
    CMP $9D              ; C5 9D | Compare accumulator (zero page)
    ORA $4602            ; 0D 02 46 | Logical OR with accumulator (absolute)
    INC $E3              ; E6 E3 | Increment (zero page)
    BRA $40              ; 80 40 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$60             ; E0 60 | Compare X register (immediate)
    CPX #$A0             ; E0 A0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A5
; Address: $F1A5BA
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A5:
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $53              ; 80 53 | Branch always
    BIT $D2              ; 24 D2 | Test bits in accumulator (zero page)
    ADC $CFE0            ; 6D E0 CF | Add with carry (absolute)
    CPX #$EF             ; E0 EF | Compare X register (immediate)
    BEQ $F7              ; F0 F7 | Branch if equal
    CLI                  ; 58 | Clear interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    STY $9D07            ; 8C 07 9D | Store Y register to absolute address
    INC $9EC7,X          ; FE C7 9E | Increment (absolute,X)
    ASL $4603            ; 0E 03 46 | Arithmetic shift left (absolute)
    INC $E3              ; E6 E3 | Increment (zero page)
    BEQ $B8              ; F0 B8 | Branch if equal
    BVS $D8              ; 70 D8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A6
; Address: $F1A5E4
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A6:
    JSR $20F0            ; 20 F0 20 | Jump to subroutine
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    CLD                  ; D8 | Clear decimal mode flag
    TAY                  ; A8 | Transfer accumulator to Y register
    BEQ $D0              ; F0 D0 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BEQ $60              ; F0 60 | Branch if equal
    BNE $40              ; D0 40 | Branch if not equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    LDY #$51             ; A0 51 | Load immediate value into Y register
    ROL $D3              ; 26 D3 | Rotate left (zero page)
    ROR $CCE3            ; 6E E3 CC | Rotate right (absolute)
    SEP #$ED             ; E2 ED | Set processor status bits
    PEA #$FE58           ; F4 58 FE | Push effective address to stack
    SED                  ; F8 | Set decimal mode flag
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    STX $9E07            ; 8E 07 9E | Store X register to absolute address
    EOR $FC              ; 45 FC | Exclusive OR with accumulator (zero page)
    STA $0C87,X          ; 9D 87 0C | Store accumulator to absolute,X
    LSR $43              ; 46 43 | Logical shift right (zero page)
    INC $E3              ; E6 E3 | Increment (zero page)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A7
; Address: $F1A631
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A7:
    LDY #$20             ; A0 20 | Load immediate value into Y register
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $3F              ; 80 3F | Branch always
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)
    BMI $3F              ; 30 3F | Branch if negative
    EOR ($7F,X)          ; 41 7F | Exclusive OR with accumulator ((zero page,X))
    ROL $003E,X          ; 3E 3E 00 | Rotate left (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$40             ; E0 40 | Compare X register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A8
; Address: $F1A69F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A8:
    JSR $FEFC            ; 20 FC FE | Jump to subroutine
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SBC $FDFC,X          ; FD FC FD | Subtract with carry (absolute,X)
    SBC $00FC,X          ; FD FC 00 | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $FD              ; 80 FD | Branch always
    INC $FEFD,X          ; FE FD FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0A9
; Address: $F1A6E5
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0A9:
    INC $FFFC,X          ; FE FC FF | Increment (absolute,X)
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $F2FE,X          ; FE FE F2 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SBC $FDFD,X          ; FD FD FD | Subtract with carry (absolute,X)
    SBC $0080,X          ; FD 80 00 | Subtract with carry (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$FD             ; C0 FD | Compare Y register (immediate)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    INC $F3F2,X          ; FE F2 F3 | Increment (absolute,X)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SBC $FDFC,X          ; FD FC FD | Subtract with carry (absolute,X)
    SBC $FEF6,X          ; FD F6 FE | Subtract with carry (absolute,X)
    INC $DEFE,X          ; FE FE DE | Increment (absolute,X)
    INC $FC7C,X          ; FE 7C FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PEA #$FAF5           ; F4 F5 FA | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INC $FEFE,X          ; FE FE FE | Increment (absolute,X)
    DEC $7CFE,X          ; DE FE 7C | Decrement (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0AA
; Address: $F1A76C
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0AA:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PEA #$FAF4           ; F4 F4 FA | Push effective address to stack
    PLX                  ; FA | Pull X register from stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    INC $FEDF,X          ; FE DF FE | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    EOR $08              ; 45 08 | Exclusive OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    JMP $F000            ; 4C 00 F0 | Jump to address
    STX $8072            ; 8E 72 80 | Store X register to absolute address
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FC7C,X          ; FE 7C FC | Increment (absolute,X)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BMI $D0              ; 30 D0 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    INX                  ; E8 | Increment X register
    SEC                  ; 38 | Set carry flag
    BMI $81              ; 30 81 | Branch if negative
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    ORA $3D9F,Y          ; 19 9F 3D | Logical OR with accumulator (absolute,Y)
    LDX $709D,Y          ; BE 9D 70 | Load from absolute,Y into X register
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0AB
; Address: $F1A850
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0AB:
    LDA ($48),Y          ; B1 48 | Load from (zero page),Y into accumulator
    LSR $38              ; 46 38 | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0AC
; Address: $F1A857
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0AC:
    JSR $007D            ; 20 7D 00 | Jump to subroutine
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BMI $D3              ; 30 D3 | Branch if negative
    BMI $CB              ; 30 CB | Branch if negative
    BEQ $19              ; F0 19 | Branch if equal
    BEQ $3D              ; F0 3D | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $00              ; B0 00 | Branch if carry set
    CPX $F400            ; EC 00 F4 | Compare X register (absolute)
    INC $00              ; E6 00 | Increment (zero page)
    REP #$00             ; C2 00 | Reset processor status bits
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    TYA                  ; 98 | Transfer Y register to accumulator
    BPL $48              ; 10 48 | Branch if positive
    BEQ $84              ; F0 84 | Branch if equal
    DEY                  ; 88 | Decrement Y register
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CLD                  ; D8 | Clear decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    BVS $F0              ; 70 F0 | Branch if overflow set
    INC $FCF7,X          ; FE F7 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    JMP $A0A0E0          ; 5C E0 A0 A0 | Jump to address long
    SBC $A7E3,Y          ; F9 E3 A7 | Subtract with carry (absolute,Y)
    STA $85FB,X          ; 9D FB 85 | Store accumulator to absolute,X
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CPX #$46             ; E0 46 | Compare X register (immediate)
    CPX #$58             ; E0 58 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0AD
; Address: $F1A8DB
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0AD:
    CPX #$60             ; E0 60 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BMI $38              ; 30 38 | Branch if negative
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    ROL $9E06,X          ; 3E 06 9E | Rotate left (absolute,X)
    REP #$EE             ; C2 EE | Reset processor status bits
    SEP #$EF             ; E2 EF | Set processor status bits
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    BEQ $98              ; F0 98 | Branch if equal
    BMI $13              ; 30 13 | Branch if negative
    DEC                  ; 3A | Decrement accumulator
    SED                  ; F8 | Set decimal mode flag
    STZ $00              ; 64 00 | Store zero to zero page
    LDY $EF1F            ; AC 1F EF | Load from absolute address into Y register
    EOR $001F            ; 4D 1F 00 | Exclusive OR with accumulator (absolute)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BMI $D0              ; 30 D0 | Branch if negative
    BPL $E0              ; 10 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    NOP                  ; EA | No operation
    ADC $FCE8,Y          ; 79 E8 FC | Add with carry (absolute,Y)
    STZ $7E7F            ; 9C 7F 7E | Store zero to absolute
    LDA                  ; BF B0 00 E8 | Load from absolute long,X into accumulator
    SED                  ; F8 | Set decimal mode flag
    LDY $20              ; A4 20 | Load from zero page into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0AE
; Address: $F1A95C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0AE:
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $B4              ; 26 B4 | Rotate left (zero page)
    STZ $01              ; 64 01 | Store zero to zero page
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)
    BIT $01              ; 24 01 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0AF
; Address: $F1A97C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0AF:
    JMP $4B00            ; 4C 00 4B | Jump to address
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B0
; Address: $F1A98A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B0:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BMI $F0              ; 30 F0 | Branch if negative
    BVS $F0              ; 70 F0 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B1
; Address: $F1A995
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B1:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BPL $E0              ; 10 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    NOP                  ; EA | No operation
    SEI                  ; 78 | Set interrupt disable flag
    INX                  ; E8 | Increment X register
    STZ $7E7F            ; 9C 7F 7E | Store zero to absolute
    STA                  ; 9F FF 3F FE | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY $20              ; A4 20 | Load from zero page into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B2
; Address: $F1A9B8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B2:
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $10              ; 80 10 | Branch always
    BCS $30              ; B0 30 | Branch if carry set
    CLV                  ; B8 | Clear overflow flag
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    PHA                  ; 48 | Push accumulator to stack
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    LDY #$30             ; A0 30 | Load immediate value into Y register
    BCS $00              ; B0 00 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B3
; Address: $F1A9FA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B3:
    JSR $5000            ; 20 00 50 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    LDY #$FD             ; A0 FD | Load immediate value into Y register
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $7EF4,X          ; 7E F4 7E | Rotate right (absolute,X)
    CPX $F8FD            ; EC FD F8 | Compare X register (absolute)
    SBC $7BE0,X          ; FD E0 7B | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B5
; Address: $F1AA16
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B5:
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    STY $00              ; 84 00 | Store Y register to zero page
    ROR $F4              ; 66 F4 | Rotate right (zero page)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($E4,X)          ; 01 E4 | Logical OR with accumulator ((zero page,X))
    ORA ($6C,X)          ; 01 6C | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    BRA $C0              ; 80 C0 | Branch always
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B6
; Address: $F1AA46
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B6:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B7
; Address: $F1AA51
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B7:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA $61              ; 05 61 | Logical OR with accumulator (zero page)
    STA ($06),Y          ; 91 06 | Store accumulator to (zero page),Y
    CMP ($06,X)          ; C1 06 | Compare accumulator ((zero page,X))
    CMP ($12,X)          ; C1 12 | Compare accumulator ((zero page,X))
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    BRA $61              ; 80 61 | Branch always
    CPX #$43             ; E0 43 | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    JMP ($3860)          ; 6C 60 38 | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    STA $1C70            ; 8D 70 1C | Store accumulator to absolute address
    CPX #$4C             ; E0 4C | Compare X register (immediate)
    BMI $A0              ; 30 A0 | Branch if negative
    BCC $FB              ; 90 FB | Branch if carry clear
    BRA $F3              ; 80 F3 | Branch always
    BRA $C7              ; 80 C7 | Branch always
    STA ($FE,X)          ; 81 FE | Store accumulator to (zero page,X)
    ADC $26FE,Y          ; 79 FE 26 | Add with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    SBC $0406,Y          ; F9 06 04 | Subtract with carry (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B8
; Address: $F1AAA0
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B8:
    AND ($3A),Y          ; 31 3A | Logical AND with accumulator ((zero page),Y)
    ADC $6E45            ; 6D 45 6E | Add with carry (absolute)
    DEC $DE89,X          ; DE 89 DE | Decrement (absolute,X)
    BIT #$BE             ; 89 BE | Test bits in accumulator (immediate)
    ORA $05BE,X          ; 1D BE 05 | Logical OR with accumulator (absolute,X)
    ROR $1FCF,X          ; 7E CF 1F | Rotate right (absolute,X)
    ASL $20              ; 06 20 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0B9
; Address: $F1AAB8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0B9:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    LDY #$E0             ; A0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0BA
; Address: $F1AAC3
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0BA:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$40             ; E0 40 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0BB
; Address: $F1AAD7
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0BB:
    RTI                  ; 40 | Return from interrupt
    INC $FE7F,X          ; FE 7F FE | Increment (absolute,X)
    ROR $1CF8            ; 6E F8 1C | Rotate right (absolute)
    CPX #$79             ; E0 79 | Compare X register (immediate)
    BRA $E7              ; 80 E7 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STX $00              ; 86 00 | Store X register to zero page
    CLC                  ; 18 | Clear carry flag
    INC $EE4F            ; EE 4F EE | Increment (absolute)
    PHB                  ; 8B | Push data bank register to stack
    LDA                  ; BF 06 FF CA | Load from absolute long,X into accumulator
    TXA                  ; 8A | Transfer X register to accumulator
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0BC
; Address: $F1AB1A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0BC:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0BD
; Address: $F1AB26
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0BD:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0BE
; Address: $F1AB36
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0BE:
    RTI                  ; 40 | Return from interrupt
    INC $FCF7,X          ; FE F7 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    JMP $A0A0E0          ; 5C E0 A0 A0 | Jump to address long
    SBC $A7E3,Y          ; F9 E3 A7 | Subtract with carry (absolute,Y)
    STA $85FB,X          ; 9D FB 85 | Store accumulator to absolute,X
    SBC $0008,Y          ; F9 08 00 | Subtract with carry (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    CPX #$46             ; E0 46 | Compare X register (immediate)
    CPX #$58             ; E0 58 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    PLY                  ; 7A | Pull Y register from stack
    SED                  ; F8 | Set decimal mode flag
    BMI $38              ; 30 38 | Branch if negative
    BIT $7C              ; 24 7C | Test bits in accumulator (zero page)
    ROL $9E06,X          ; 3E 06 9E | Rotate left (absolute,X)
    REP #$EE             ; C2 EE | Reset processor status bits
    SEP #$F7             ; E2 F7 | Set processor status bits
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0BF
; Address: $F1AB80
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0BF:
    JSR $0038            ; 20 38 00 | Jump to subroutine
    LDX #$7E             ; A2 7E | Load immediate value into X register
    SEP #$DE             ; E2 DE | Set processor status bits
    STA $15C155          ; 8F 55 C1 15 | Store accumulator to absolute long address
    LDA $FD18,X          ; BD 18 FD | Load from absolute,X into accumulator
    CLC                  ; 18 | Clear carry flag
    LDX $DD3C,Y          ; BE 3C DD | Load from absolute,Y into X register
    INC $FE3D,X          ; FE 3D FE | Increment (absolute,X)
    ROR $5C3E,X          ; 7E 3E 5C | Rotate right (absolute,X)
    WDM #$14             ; 42 14 | Reserved instruction
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($90,X)          ; 01 90 | Logical OR with accumulator ((zero page,X))
    BCC $88              ; 90 88 | Branch if carry clear
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C1
; Address: $F1ABEA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C1:
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    RTI                  ; 40 | Return from interrupt
    BNE $F0              ; D0 F0 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BMI $F0              ; 30 F0 | Branch if negative
    BVS $F0              ; 70 F0 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C2
; Address: $F1ABFF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C2:
    CPX #$27             ; E0 27 | Compare X register (immediate)
    LDX $6E27            ; AE 27 6E | Load from absolute address into X register
    ROR $DF4B            ; 6E 4B DF | Rotate right (absolute)
    LDA                  ; BF 06 7E 0D | Load from absolute long,X into accumulator
    INC $0051,X          ; FE 51 00 | Increment (absolute,X)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C3
; Address: $F1AC16
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C3:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    STY $7EFF            ; 8C FF 7E | Store Y register to absolute address
    TYA                  ; 98 | Transfer Y register to accumulator
    ADC ($1E,X)          ; 61 1E | Add with carry ((zero page,X))
    LSR $02A0,X          ; 5E A0 02 | Logical shift right (absolute,X)
    LDY $3C22,X          ; BC 22 3C | Load from absolute,X into Y register
    AND ($5E),Y          ; 31 5E | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    BEQ $05              ; F0 05 | Branch if equal
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C4
; Address: $F1AC8B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C4:
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    BVS $67              ; 70 67 | Branch if overflow set
    DEC                  ; 3A | Decrement accumulator
    ORA $3800            ; 0D 00 38 | Logical OR with accumulator (absolute)
    STA $E01E70          ; 8F 70 1E E0 | Game work RAM access
    JMP $E030            ; 4C 30 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    STX $7DFF            ; 8E FF 7D | Store X register to absolute address
    INC $3886,X          ; FE 86 38 | Increment (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    BCS $02              ; B0 02 | Branch if carry set
    LDY $3C22,X          ; BC 22 3C | Load from absolute,X into Y register
    AND ($5E),Y          ; 31 5E | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    ADC ($02,X)          ; 61 02 | Add with carry ((zero page,X))
    BCC $01              ; 90 01 | Branch if carry clear
    CPY #$04             ; C0 04 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C5
; Address: $F1ACCE
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C5:
    CPX #$43             ; E0 43 | Compare X register (immediate)
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    ADC $3C60            ; 6D 60 3C | Add with carry (absolute)
    AND $E302,Y          ; 39 02 E3 | Logical AND with accumulator (absolute,Y)
    STX $1C70            ; 8E 70 1C | Store X register to absolute address
    CPX #$4C             ; E0 4C | Compare X register (immediate)
    BMI $90              ; 30 90 | Branch if negative
    BRA $FB              ; 80 FB | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$73             ; C0 73 | Compare Y register (immediate)
    LDA ($7E,X)          ; A1 7E | Load from (zero page,X) into accumulator
    ADC $42BE,Y          ; 79 BE 42 | Hardware register operation
    AND $0442,X          ; 3D 42 04 | Logical AND with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    SBC $FD08,X          ; FD 08 FD | Subtract with carry (absolute,X)
    JMP $ACFF            ; 4C FF AC | Jump to address

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C6
; Address: $F1AD28
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C6:
    JMP $9E0CBF          ; 5C BF 0C 9E | Jump to address long
    AND ($2C,X)          ; 21 2C | Logical AND with accumulator ((zero page,X))
    AND ($52),Y          ; 31 52 | Logical AND with accumulator ((zero page),Y)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    LDY $0000            ; AC 00 00 | Load from absolute address into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ROR $F4              ; 66 F4 | Rotate right (zero page)
    ORA ($24,X)          ; 01 24 | Logical OR with accumulator ((zero page,X))
    ORA ($EC,X)          ; 01 EC | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C7
; Address: $F1AD7A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C7:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C8
; Address: $F1AD84
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C8:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $68F8,X          ; 1E F8 68 | Arithmetic shift left (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    PHA                  ; 48 | Push accumulator to stack
    BCS $02              ; B0 02 | Branch if carry set
    LDY $3C22,X          ; BC 22 3C | Load from absolute,X into Y register
    AND ($5E),Y          ; 31 5E | Logical AND with accumulator ((zero page),Y)
    BCS $00              ; B0 00 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA ($83),Y          ; 11 83 | Logical OR with accumulator ((zero page),Y)
    ORA ($83,X)          ; 01 83 | Logical OR with accumulator ((zero page,X))
    CPY $DCDD            ; CC DD DC | Compare Y register (absolute)
    INC $1010,X          ; FE 10 10 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0C9
; Address: $F1ADD0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0C9:
    SED                  ; F8 | Set decimal mode flag
    SBC ($08),Y          ; F1 08 | Subtract with carry ((zero page),Y)
    STZ $18              ; 64 18 | Store zero to zero page
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0CA
; Address: $F1ADD9
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0CA:
    BPL $3E              ; 10 3E | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ADC $E33E,Y          ; 79 3E E3 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F F1 F0 37 | Store accumulator to absolute long,X
    LDA ($9E,X)          ; A1 9E | Load from (zero page,X) into accumulator
    CPY #$1F             ; C0 1F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $C800            ; 0E 00 C8 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    PLA                  ; 68 | Pull accumulator from stack
    SEI                  ; 78 | Set interrupt disable flag
    ROR $B331,X          ; 7E 31 B3 | Rotate right (absolute,X)
    ORA ($83),Y          ; 11 83 | Logical OR with accumulator ((zero page),Y)
    CPY $DCDD            ; CC DD DC | Compare Y register (absolute)
    INC $1010,X          ; FE 10 10 | Increment (absolute,X)
    INY                  ; C8 | Increment Y register
    BMI $F9              ; 30 F9 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0CB
; Address: $F1AE39
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0CB:
    BPL $3E              ; 10 3E | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    CPX #$72             ; E0 72 | Compare X register (immediate)
    BRA $F6              ; 80 F6 | Branch always
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    BRA $FE              ; 80 FE | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $8D00            ; EC 00 8D | Compare X register (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0CC
; Address: $F1AE67
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0CC:
    CPX #$0C             ; E0 0C | Compare X register (immediate)
    INC                  ; 1A | Increment accumulator
    ASL $1EF2,X          ; 1E F2 1E | Arithmetic shift left (absolute,X)
    SEC                  ; 38 | Set carry flag
    STZ $00              ; 64 00 | Store zero to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    ASL $0200,X          ; 1E 00 02 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    CPX #$72             ; E0 72 | Compare X register (immediate)
    BRA $E6              ; 80 E6 | Branch always
    BEQ $FE              ; F0 FE | Branch if equal
    BRA $FE              ; 80 FE | Branch always
    DEC $000A            ; CE 0A 00 | Decrement (absolute)
    CPX $8D00            ; EC 00 8D | Compare X register (absolute)
    ORA $0100,Y          ; 19 00 01 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    BCS $00              ; B0 00 | Branch if carry set
    DEY                  ; 88 | Decrement Y register
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0CD
; Address: $F1AEA7
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0CD:
    JSR $FC00            ; 20 00 FC | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHA                  ; 48 | Push accumulator to stack
    JMP $48F3            ; 4C F3 48 | Jump to address
    CPY $00              ; C4 00 | Compare Y register (zero page)
    DEC $0200,X          ; DE 00 02 | Decrement (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    JMP $F000            ; 4C 00 F0 | Jump to address
    STX $8072            ; 8E 72 80 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0CE
; Address: $F1AF0D
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0CE:
    BEQ $C0              ; F0 C0 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    PHA                  ; 48 | Push accumulator to stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    INC $FC7C,X          ; FE 7C FC | Increment (absolute,X)
    BMI $F0              ; 30 F0 | Branch if negative
    STA ($F8,X)          ; 81 F8 | Store accumulator to (zero page,X)
    CPY #$12             ; C0 12 | Compare Y register (immediate)
    ORA ($C2,X)          ; 01 C2 | Logical OR with accumulator ((zero page,X))
    STA ($62,X)          ; 81 62 | Store accumulator to (zero page,X)
    ORA ($E6,X)          ; 01 E6 | Logical OR with accumulator ((zero page,X))
    EOR ($73,X)          ; 41 73 | Exclusive OR with accumulator ((zero page,X))
    STZ $70              ; 64 70 | Store zero to zero page
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    STY $78              ; 84 78 | Store Y register to zero page
    CPX #$48             ; E0 48 | Compare X register (immediate)
    BMI $E0              ; 30 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    ASL $3EF2,X          ; 1E F2 3E | Arithmetic shift left (absolute,X)
    ROL $5EF4            ; 2E F4 5E | Rotate left (absolute)
    CPX $D6              ; E4 D6 | Compare X register (zero page)
    INX                  ; E8 | Increment X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BEQ $71              ; F0 71 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STY $0000            ; 8C 00 00 | Store Y register to absolute address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STY $ECB2            ; 8C B2 EC | Store Y register to absolute address
    TSX                  ; BA | Transfer stack pointer to X register
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVC $F0              ; 50 F0 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0CF
; Address: $F1AF7F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0CF:
    SED                  ; F8 | Set decimal mode flag
    BPL $E8              ; 10 E8 | Branch if positive
    BMI $F8              ; 30 F8 | Branch if negative
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    STZ $7F7F            ; 9C 7F 7F | Store zero to absolute
    LDA                  ; BF FE 7F FC | Load from absolute long,X into accumulator
    ROR $00F4,X          ; 7E F4 00 | Rotate right (absolute,X)
    CPY $00              ; C4 00 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0D2
; Address: $F1AF98
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0D2:
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0D3
; Address: $F1AFAD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0D3:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0D4
; Address: $F1AFBC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0D4:
    BNE $00              ; D0 00 | Branch if not equal
    CLC                  ; 18 | Clear carry flag
    BEQ $02              ; F0 02 | Branch if equal
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0D5
; Address: $F1AFCA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0D5:
    CPX #$41             ; E0 41 | Compare X register (immediate)
    BVS $63              ; 70 63 | Branch if overflow set
    BVS $67              ; 70 67 | Branch if overflow set
    ASL $3C00            ; 0E 00 3C | Arithmetic shift left (absolute)
    INX                  ; E8 | Increment X register
    ASL $87              ; 06 87 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$4E             ; E0 4E | Compare X register (immediate)
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BIT $26F3            ; 2C F3 26 | Test bits in accumulator (absolute)
    ADC $39DE,Y          ; 79 DE 39 | Add with carry (absolute,Y)
    LSR $9F              ; 46 9F | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0D6
; Address: $F1AFEC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0D6:
    JSR $3130            ; 20 30 31 | Jump to subroutine
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0D7
; Address: $F1AFF8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0D7:
    JSR $5800            ; 20 00 58 | Jump to subroutine
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$30             ; E0 30 | Compare X register (immediate)
    BMI $D9              ; 30 D9 | Branch if negative
    SEC                  ; 38 | Set carry flag
    DEX                  ; CA | Decrement X register
    SED                  ; F8 | Set decimal mode flag
    AND $FDFC,Y          ; 39 FC FD | Logical AND with accumulator (absolute,Y)
    LDY $C07C            ; AC 7C C0 | Load from absolute address into Y register
    BCS $00              ; B0 00 | Branch if carry set
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    INC $00              ; E6 00 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0D9
; Address: $F1B01F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0D9:
    JSR $0C0A            ; 20 0A 0C | Jump to subroutine
    LDA $0017,X          ; BD 17 00 | Load from absolute,X into accumulator
    STZ $01              ; 64 01 | Store zero to zero page
    STY $01              ; 84 01 | Store Y register to zero page
    ORA ($AC,X)          ; 01 AC | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    WDM #$00             ; 42 00 | Reserved instruction
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0DA
; Address: $F1B048
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0DA:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BVS $F0              ; 70 F0 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0DB
; Address: $F1B053
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0DB:
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    ADC #$F0             ; 69 F0 | Add with carry (immediate)
    CPX #$72             ; E0 72 | Compare X register (immediate)
    BRA $F6              ; 80 F6 | Branch always
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    BRA $FE              ; 80 FE | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPX $8D00            ; EC 00 8D | Compare X register (absolute)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    CPX #$10             ; E0 10 | Compare X register (immediate)
    SEC                  ; 38 | Set carry flag
    AND $38F3,X          ; 3D F3 38 | Logical AND with accumulator (absolute,X)
    STZ $00              ; 64 00 | Store zero to zero page
    STY $00              ; 84 00 | Store Y register to zero page
    ASL $0200,X          ; 1E 00 02 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FE7F,X          ; FE 7F FE | Increment (absolute,X)
    ROR $1CF8            ; 6E F8 1C | Rotate right (absolute)
    CPX #$79             ; E0 79 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0DC
; Address: $F1B0AA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0DC:
    BRA $E7              ; 80 E7 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $FE              ; 80 FE | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STX $00              ; 86 00 | Store X register to zero page
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $CE07            ; 6E 07 CE | Rotate right (absolute)
    STY $DF              ; 84 DF | Store Y register to zero page
    STA                  ; 9F 00 9F 00 | Store accumulator to absolute long,X
    PHB                  ; 8B | Push data bank register to stack
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0DE
; Address: $F1B0DC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0DE:
    BCC $00              ; 90 00 | Branch if carry clear
    PHP                  ; 08 | Push processor status to stack
    JMP $A84CC8          ; 5C C8 4C A8 | Jump to address long
    CPY $A8              ; C4 A8 | Compare Y register (zero page)
    DEY                  ; 88 | Decrement Y register
    BPL $C8              ; 10 C8 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BCS $F8              ; B0 F8 | Branch if carry set
    BEQ $F8              ; F0 F8 | Branch if equal
    BVS $F0              ; 70 F0 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E0
; Address: $F1B100
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E0:
    SED                  ; F8 | Set decimal mode flag
    SBC $5BF0            ; ED F0 5B | Subtract with carry (absolute)
    BEQ $33              ; F0 33 | Branch if equal
    CPX #$76             ; E0 76 | Compare X register (immediate)
    BRA $EE              ; 80 EE | Branch always
    BEQ $FE              ; F0 FE | Branch if equal
    BRA $FE              ; 80 FE | Branch always
    INC $0012            ; EE 12 00 | Increment (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    CPY $8900            ; CC 00 89 | Compare Y register (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    CLV                  ; B8 | Clear overflow flag
    STY $3E00            ; 8C 00 3E | Store Y register to absolute address
    INC $FE01,X          ; FE 01 FE | Increment (absolute,X)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E1
; Address: $F1B14A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E1:
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BVS $84              ; 70 84 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    STY $6A00            ; 8C 00 6A | Store Y register to absolute address
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E2
; Address: $F1B180
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E2:
    JSR $6620            ; 20 20 66 | Jump to subroutine
    LSR $7B              ; 46 7B | Logical shift right (zero page)
    EOR $7A56,X          ; 5D 56 7A | Exclusive OR with accumulator (absolute,X)
    ADC ($0E),Y          ; 71 0E | Add with carry ((zero page),Y)
    AND $3001,Y          ; 39 01 30 | Logical AND with accumulator (absolute,Y)
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E3
; Address: $F1B191
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E3:
    JSR $6620            ; 20 20 66 | Jump to subroutine
    ROL $7F              ; 26 7F | Rotate left (zero page)
    BIT $F87E            ; 2C 7E F8 | Test bits in accumulator (absolute)
    ROR $087F,X          ; 7E 7F 08 | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    JMP ($98FE)          ; 6C FE 98 | Jump to address (absolute indirect)
    INC $FCFE,X          ; FE FE FC | Increment (absolute,X)
    INC $9DF8            ; EE F8 9D | Increment (absolute)
    CPX #$79             ; E0 79 | Compare X register (immediate)
    BRA $E6              ; 80 E6 | Branch always
    ADC ($60,X)          ; 61 60 | Add with carry ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    STX $00              ; 86 00 | Store X register to zero page
    ORA $2700,Y          ; 19 00 27 | Logical OR with accumulator (absolute,Y)
    LDX $6E07            ; AE 07 6E | Load from absolute address into X register
    LSR $DF0B,X          ; 5E 0B DF | Logical shift right (absolute,X)
    LDA                  ; BF 13 BF 06 | Load from absolute long,X into accumulator
    ASL $51FF            ; 0E FF 51 | Arithmetic shift left (absolute)
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    LDA ($00,X)          ; A1 00 | Load from (zero page,X) into accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E4
; Address: $F1B1D6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E4:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E5
; Address: $F1B1E4
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E5:
    JSR $4080            ; 20 80 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    STA ($F8,X)          ; 81 F8 | Store accumulator to (zero page,X)
    CPY #$11             ; C0 11 | Compare Y register (immediate)
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    CPX #$41             ; E0 41 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E6
; Address: $F1B20C
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E6:
    BVS $63              ; 70 63 | Branch if overflow set
    BVS $67              ; 70 67 | Branch if overflow set
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INX                  ; E8 | Increment X register
    ASL $86              ; 06 86 | Arithmetic shift left (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ASL $4EE0,X          ; 1E E0 4E | Arithmetic shift left (absolute,X)
    BMI $E4              ; 30 E4 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CPX #$18             ; E0 18 | Compare X register (immediate)
    SBC ($17),Y          ; F1 17 | Subtract with carry ((zero page),Y)
    SBC $F91F,Y          ; F9 1F F9 | Subtract with carry (absolute,Y)
    ADC $7B9C,Y          ; 79 9C 7B | Add with carry (absolute,Y)
    STZ $C93A,X          ; 9E 3A C9 | Store zero to absolute,X
    ROL $0071,X          ; 3E 71 00 | Rotate left (absolute,X)
    BRA $00              ; 80 00 | Branch always
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    STX $0000            ; 8E 00 00 | Store X register to absolute address
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    BEQ $04              ; F0 04 | Branch if equal
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E7
; Address: $F1B26B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E7:
    ORA ($E0,X)          ; 01 E0 | Game work RAM access
    BVS $67              ; 70 67 | Branch if overflow set
    DEC                  ; 3A | Decrement accumulator
    AND $E302,Y          ; 39 02 E3 | Logical AND with accumulator (absolute,Y)
    STA $E01E70          ; 8F 70 1E E0 | Game work RAM access
    JMP $E030            ; 4C 30 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    ADC ($8E),Y          ; 71 8E | Add with carry ((zero page),Y)
    STX $E000            ; 8E 00 E0 | Game work RAM access
    JMP $902200          ; 5C 00 22 90 | Jump to address long

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0E8
; Address: $F1B28A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0E8:
    JSL $9E01DC          ; 22 DC 01 9E | Jump to subroutine long
    AND ($9E),Y          ; 31 9E | Logical AND with accumulator ((zero page),Y)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    JMP $0000            ; 4C 00 00 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0EA
; Address: $F1B2A0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0EA:
    ORA ($63,X)          ; 01 63 | Logical OR with accumulator ((zero page,X))
    ADC $38C7,X          ; 7D C7 38 | Add with carry (absolute,X)
    CLI                  ; 58 | Clear interrupt disable flag
    BCS $02              ; B0 02 | Branch if carry set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0EB
; Address: $F1B2AB
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0EB:
    LDY $3C22,X          ; BC 22 3C | Load from absolute,X into Y register
    AND ($5E),Y          ; 31 5E | Logical AND with accumulator ((zero page),Y)
    STZ $8200            ; 9C 00 82 | Store zero to absolute
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    SEI                  ; 78 | Set interrupt disable flag
    STY $FCF0            ; 8C F0 FC | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR $36FE,X          ; 5D FE 36 | Exclusive OR with accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    PHA                  ; 48 | Push accumulator to stack
    BCS $02              ; B0 02 | Branch if carry set
    LDY $3C22,X          ; BC 22 3C | Load from absolute,X into Y register
    AND ($5E),Y          ; 31 5E | Logical AND with accumulator ((zero page),Y)
    BCS $00              ; B0 00 | Branch if carry set
    PHP                  ; 08 | Push processor status to stack
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$00             ; A0 00 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    LDY $3FA3,X          ; BC A3 3F | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0EC
; Address: $F1B30E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0EC:
    JSR $073F            ; 20 3F 07 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0ED
; Address: $F1B31D
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0ED:
    JSR $20E0            ; 20 E0 20 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    CPX #$68             ; E0 68 | Compare X register (immediate)
    BVS $BE              ; 70 BE | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    ORA ($2F,X)          ; 01 2F | Logical OR with accumulator ((zero page,X))
    LDY #$00             ; A0 00 | Load immediate value into Y register
    STZ $8E0C            ; 9C 0C 8E | Store zero to absolute
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0EF
; Address: $F1B361
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0EF:
    INC $FEEC,X          ; FE EC FE | Increment (absolute,X)
    SBC $ECB8,X          ; FD B8 EC | Subtract with carry (absolute,X)
    BMI $DA              ; 30 DA | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F0
; Address: $F1B36B
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F0:
    PEA #$C888           ; F4 88 C8 | Push effective address to stack
    BPL $30              ; 10 30 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $80              ; F0 80 | Branch if equal
    PEA #$F6C0           ; F4 C0 F6 | Push effective address to stack
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$7C             ; E0 7C | Compare X register (immediate)
    BEQ $3F              ; F0 3F | Branch if equal
    BEQ $7D              ; F0 7D | Branch if equal
    BEQ $4F              ; F0 4F | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F1
; Address: $F1B3CD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F1:
    BNE $70              ; D0 70 | Branch if not equal
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $00              ; F0 00 | Branch if equal
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F2
; Address: $F1B3F8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ROR $FFFE,X          ; 7E FE FF | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F3
; Address: $F1B438
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F3:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    AND $16              ; 25 16 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F4
; Address: $F1B448
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F4:
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ASL $1C08,X          ; 1E 08 1C | Arithmetic shift left (absolute,X)
    ORA $004A,X          ; 1D 4A 00 | Logical OR with accumulator (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F6
; Address: $F1B466
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F6:
    PHP                  ; 08 | Push processor status to stack
    STZ $FE0D,X          ; 9E 0D FE | Store zero to absolute,X
    STY $00              ; 84 00 | Store Y register to zero page
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    ORA $000C            ; 0D 0C 00 | Logical OR with accumulator (absolute)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$70             ; E0 70 | Compare X register (immediate)
    BMI $D0              ; 30 D0 | Branch if negative
    BPL $E8              ; 10 E8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    NOP                  ; EA | No operation
    ADC $7CE8,Y          ; 79 E8 7C | Add with carry (absolute,Y)
    CMP $10FF,X          ; DD FF 10 | Compare accumulator (absolute,X)
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    PEA #$C300           ; F4 00 C3 | Push effective address to stack
    STY $00              ; 84 00 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $C0              ; 80 C0 | Branch always
    CPX #$18             ; E0 18 | Compare X register (immediate)
    STZ $0000            ; 9C 00 00 | Store zero to absolute
    BVS $00              ; 70 00 | Branch if overflow set
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 3F 7F 0E | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BNE $00              ; D0 00 | Branch if not equal
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    BMI $FF              ; 30 FF | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F8
; Address: $F1B521
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F8:
    BEQ $E0              ; F0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0F9
; Address: $F1B52A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0F9:
    JSR $00E0            ; 20 E0 00 | Jump to subroutine
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$08             ; C0 08 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0FA
; Address: $F1B53E
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0FA:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    SBC $7E7F,X          ; FD 7F 7E | Subtract with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    STZ $E701,X          ; 9E 01 E7 | Store zero to absolute,X
    BRA $7F              ; 80 7F | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    BCC $00              ; 90 00 | Branch if carry clear
    BIT #$00             ; 89 00 | Test bits in accumulator (immediate)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ROL $FCFF,X          ; 3E FF FC | Rotate left (absolute,X)
    ROR $F6FC,X          ; 7E FC F6 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    ADC $19F0            ; 6D F0 19 | Add with carry (absolute)
    CPX #$7B             ; E0 7B | Compare X register (immediate)
    BRA $E7              ; 80 E7 | Branch always
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    INC $00              ; E6 00 | Increment (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    CLC                  ; 18 | Clear carry flag
    ADC $F761,X          ; 7D 61 F7 | Add with carry (absolute,X)
    CMP ($EF,X)          ; C1 EF | Compare accumulator ((zero page,X))
    STY $81D0            ; 8C D0 81 | Store Y register to absolute address
    STZ $DE07,X          ; 9E 07 DE | Store zero to absolute,X
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL $210F            ; 2E 0F 21 | PPU graphics register access
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0FB
; Address: $F1B5BE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0FB:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0FC
; Address: $F1B5CA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0FC:
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $60              ; 90 60 | Branch if carry clear
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ROL $ABBD,X          ; 3E BD AB | Rotate left (absolute,X)
    EOR $0007,X          ; 5D 07 00 | Exclusive OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0FD
; Address: $F1B5FB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0FD:
    JSR $2060            ; 20 60 20 | Jump to subroutine
    LDX $04              ; A6 04 | Load from zero page into X register
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BVS $B0              ; 70 B0 | Branch if overflow set
    BMI $D0              ; 30 D0 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    INC $FEF8,X          ; FE F8 FE | Increment (absolute,X)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0FE
; Address: $F1B612
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0FE:
    JSR $9000            ; 20 00 90 | Jump to subroutine
    INY                  ; C8 | Increment Y register
    INX                  ; E8 | Increment X register
    STY $00              ; 84 00 | Store Y register to zero page
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $091C            ; 0D 1C 09 | Logical OR with accumulator (absolute)
    ORA $5ECC,Y          ; 19 CC 5E | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ROR $00              ; 66 00 | Rotate right (zero page)
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BRA $0B              ; 80 0B | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_0FF
; Address: $F1B644
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_0FF:
    JSR $1002            ; 20 02 10 | Jump to subroutine
    ROL $632C            ; 2E 2C 63 | Rotate left (absolute)
    INC $77              ; E6 77 | Increment (zero page)
    INC $E0              ; E6 E0 | Game work RAM access
    STA $C740,X          ; 9D 40 C7 | Store accumulator to absolute,X
    PLP                  ; 28 | Pull processor status from stack
    SBC $EB10            ; ED 10 EB | Subtract with carry (absolute)
    ROR $6E11            ; 6E 11 6E | Rotate right (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_100
; Address: $F1B66D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_100:
    ASL $1D80            ; 0E 80 1D | Arithmetic shift left (absolute)
    SBC $F100,X          ; FD 00 F1 | Subtract with carry (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    CPX #$F1             ; E0 F1 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_101
; Address: $F1B686
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_101:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_103
; Address: $F1B690
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_103:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $1D3C,X          ; 1D 3C 1D | Logical OR with accumulator (absolute,X)
    AND $3A1C,Y          ; 39 1C 3A | Logical AND with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    CMP $00              ; C5 00 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_104
; Address: $F1B6C0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_104:
    JSR $800D            ; 20 0D 80 | Jump to subroutine
    ASL $0320,X          ; 1E 20 03 | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $230C            ; 0E 0C 23 | Arithmetic shift left (absolute)
    SEP #$F3             ; E2 F3 | Set processor status bits
    BRA $21              ; 80 21 | PPU graphics register access
    RTI                  ; 40 | Return from interrupt
    STZ $DF40            ; 9C 40 DF | Store zero to absolute

;------------------------------------------------------------------------------
; Bank62_DmaFunction_105
; Address: $F1B6D7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_105:
    JSR $10ED            ; 20 ED 10 | Jump to subroutine
    BPL $6E              ; 10 6E | Branch if positive
    ORA ($EF),Y          ; 11 EF | Logical OR with accumulator ((zero page),Y)
    BPL $00              ; 10 00 | Branch if positive
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)
    ORA $80              ; 05 80 | Logical OR with accumulator (zero page)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $0F              ; 80 0F | Branch always
    ASL $FD00            ; 0E 00 FD | Arithmetic shift left (absolute)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_106
; Address: $F1B6F6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_106:
    XBA                  ; EB | Exchange accumulator bytes
    SEC                  ; 38 | Set carry flag
    ASL $7CE0,X          ; 1E E0 7C | Arithmetic shift left (absolute,X)
    BRA $70              ; 80 70 | Branch always
    BRA $86              ; 80 86 | Branch always
    ROR $9F              ; 66 9F | Rotate right (zero page)
    BMI $4F              ; 30 4F | Branch if negative
    BVS $31              ; 70 31 | Branch if overflow set
    LSR $0000,X          ; 5E 00 00 | Logical shift right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    LDY #$00             ; A0 00 | Load immediate value into Y register
    BCC $60              ; 90 60 | Branch if carry clear
    BCC $60              ; 90 60 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_107
; Address: $F1B724
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_107:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    ASL $77              ; 06 77 | Arithmetic shift left (zero page)
    ORA ($7B,X)          ; 01 7B | Logical OR with accumulator ((zero page,X))
    LDA                  ; BF 3F 78 0F | Load from absolute long,X into accumulator
    ROL $068E            ; 2E 8E 06 | Rotate left (absolute)
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    PLX                  ; FA | Pull X register from stack
    INC $7EFC,X          ; FE FC 7E | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX $DAF0            ; EC F0 DA | Compare X register (absolute)
    CPX #$24             ; E0 24 | Compare X register (immediate)
    INY                  ; C8 | Increment Y register
    CLD                  ; D8 | Clear decimal mode flag
    BPL $30              ; 10 30 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_108
; Address: $F1B77C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_108:
    JSR $C000            ; 20 00 C0 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $6F              ; 10 6F | Branch if positive
    ROR $C799            ; 6E 99 C7 | Rotate right (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_10B
; Address: $F1B7B6
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_10B:
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    STX $41              ; 86 41 | Store X register to zero page
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    BEQ $C2              ; F0 C2 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $C971            ; 0E 71 C9 | Arithmetic shift left (absolute)
    STZ $3701,X          ; 9E 01 37 | Store zero to absolute,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $7D              ; 80 7D | Branch always
    BRA $FB              ; 80 FB | Branch always
    ORA ($F7,X)          ; 01 F7 | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    INC $E0FF,X          ; FE FF E0 | Game work RAM access
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    BRA $84              ; 80 84 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BRA $81              ; 80 81 | Branch always
    DEC $0000,X          ; DE 00 00 | Decrement (absolute,X)
    SBC ($FE,X)          ; E1 FE | Subtract with carry ((zero page,X))
    SBC #$F0             ; E9 F0 | Subtract with carry (immediate)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $01              ; 80 01 | Branch always
    CPX $30FF            ; EC FF 30 | Compare X register (absolute)
    LSR $C7B9            ; 4E B9 C7 | Logical shift right (absolute)
    SEC                  ; 38 | Set carry flag
    ORA ($F0,X)          ; 01 F0 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    ASL $F0              ; 06 F0 | Arithmetic shift left (zero page)
    ORA ($F8,X)          ; 01 F8 | Logical OR with accumulator ((zero page,X))
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $F0              ; 70 F0 | Branch if overflow set
    BCS $70              ; B0 70 | Branch if carry set
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BVS $8D              ; 70 8D | Branch if overflow set
    LDY $3D03,X          ; BC 03 3D | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_10C
; Address: $F1B8A0
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_10C:
    BRA $7E              ; 80 7E | Branch always
    BRA $FD              ; 80 FD | Branch always
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    ORA ($7F,X)          ; 01 7F | Logical OR with accumulator ((zero page,X))
    STA                  ; 9F DF C0 FF | Store accumulator to absolute long,X
    ORA ($80,X)          ; 01 80 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $A0              ; 80 A0 | Branch always
    RTI                  ; 40 | Return from interrupt
    ADC $63BE,Y          ; 79 BE 63 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F F1 F0 F7 | Store accumulator to absolute long,X
    CMP ($1E,X)          ; C1 1E | Compare accumulator ((zero page,X))
    ORA ($40,X)          ; 01 40 | Logical OR with accumulator ((zero page,X))
    ASL $0800            ; 0E 00 08 | Arithmetic shift left (absolute)
    CPX #$1F             ; E0 1F | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $02              ; 80 02 | Branch always
    ORA $171D            ; 0D 1D 17 | Logical OR with accumulator (absolute)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    BRA $80              ; 80 80 | Branch always
    LDA                  ; BF 23 BF 21 | Load from absolute long,X into accumulator
    LDA $000F3C          ; AF 3C 0F 00 | Load from absolute long address into accumulator
    BRA $DC              ; 80 DC | Branch always
    BRA $DE              ; 80 DE | Branch always
    BRA $D0              ; 80 D0 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_10D
; Address: $F1B94C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_10D:
    JSR $10F0            ; 20 F0 10 | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_10E
; Address: $F1B962
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_10E:
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $7F              ; 70 7F | Branch if overflow set
    ROL $1E3F,X          ; 3E 3F 1E | Rotate left (absolute,X)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_10F
; Address: $F1B972
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_10F:
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_110
; Address: $F1B97C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_110:
    JSR $1C00            ; 20 00 1C | Jump to subroutine
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ROR $5F7F            ; 6E 7F 5F | Rotate right (absolute)
    EOR $1E7F,Y          ; 59 7F 1E | Exclusive OR with accumulator (absolute,Y)
    ROR                  ; 6A | Rotate right (accumulator)
    BMI $18              ; 30 18 | Branch if negative
    BVS $18              ; 70 18 | Branch if overflow set
    JMP $7E9C3E          ; 5C 3E 9C 7E | Jump to address long
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_111
; Address: $F1B9C9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_111:
    BRA $10              ; 80 10 | Branch always
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    BRA $C4              ; 80 C4 | Branch always
    INY                  ; C8 | Increment Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_112
; Address: $F1B9DA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_112:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    BMI $00              ; 30 00 | Branch if negative
    STA $E759            ; 8D 59 E7 | Store accumulator to absolute address
    LDX $1B23,Y          ; BE 23 1B | Load from absolute,Y into X register
    ORA $1533,X          ; 1D 33 15 | Logical OR with accumulator (absolute,X)
    ORA $0D1B            ; 0D 1B 0D | Logical OR with accumulator (absolute)
    ROR $3EFF,X          ; 7E FF 3E | Rotate right (absolute,X)
    JMP $1E443E          ; 5C 3E 44 1E | Jump to address long
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_113
; Address: $F1B9FA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_113:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    CLC                  ; 18 | Clear carry flag
    INY                  ; C8 | Increment Y register
    STZ $E0              ; 64 E0 | Game work RAM access
    PLA                  ; 68 | Pull accumulator from stack
    BEQ $88              ; F0 88 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_114
; Address: $F1BA07
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_114:
    BEQ $88              ; F0 88 | Branch if equal
    BEQ $90              ; F0 90 | Branch if equal
    CPX #$A0             ; E0 A0 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $30              ; 80 30 | Branch always
    CLC                  ; 18 | Clear carry flag
    ORA $021E,Y          ; 19 1E 02 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_115
; Address: $F1BA30
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_115:
    JSR $1C00            ; 20 00 1C | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $3B              ; 10 3B | Branch if positive
    AND $25              ; 25 25 | Logical AND with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA #$03             ; 09 03 | Logical OR with accumulator (immediate)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    PHX                  ; DA | Push X register to stack
    WDM #$F6             ; 42 F6 | Reserved instruction
    TAY                  ; A8 | Transfer accumulator to Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BEQ $92              ; F0 92 | Branch if equal
    STZ $785C            ; 9C 5C 78 | Store zero to absolute
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_116
; Address: $F1BA9E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_116:
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $01              ; 10 01 | Branch if positive
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_117
; Address: $F1BAAF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_117:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1F00,X          ; 1E 00 1F | Arithmetic shift left (absolute,X)
    BVS $20              ; 70 20 | Branch if overflow set
    LDX $3312,Y          ; BE 12 33 | Load from absolute,Y into X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank62_DmaFunction_118
; Address: $F1BACC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_118:
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    CPY $9000            ; CC 00 90 | Compare Y register (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    PLA                  ; 68 | Pull accumulator from stack
    PEA #$0000           ; F4 00 00 | Push effective address to stack
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_119
; Address: $F1BAE8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_119:
    JSR $D0C0            ; 20 C0 D0 | Jump to subroutine
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_11A
; Address: $F1BAEF
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_11A:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $11              ; 06 11 | Arithmetic shift left (zero page)
    ORA ($20,X)          ; 01 20 | Logical OR with accumulator ((zero page,X))
    ASL $1F0C            ; 0E 0C 1F | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BIT $0B              ; 24 0B | Test bits in accumulator (zero page)
    BCC $9F              ; 90 9F | Branch if carry clear
    CLC                  ; 18 | Clear carry flag
    BPL $70              ; 10 70 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_11B
; Address: $F1BB60
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_11B:
    STZ $18              ; 64 18 | Store zero to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_11C
; Address: $F1BB64
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_11C:
    ROL $C1C0,X          ; 3E C0 C1 | Rotate left (absolute,X)
    LDX $605E,Y          ; BE 5E 60 | Load from absolute,Y into X register
    STZ $D8              ; 64 D8 | Store zero to zero page
    PLY                  ; 7A | Pull Y register from stack
    STY $84              ; 84 84 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    BRA $BE              ; 80 BE | Branch always
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_11D
; Address: $F1BB87
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_11D:
    JSR $6020            ; 20 20 60 | Jump to subroutine
    CLI                  ; 58 | Clear interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_11E
; Address: $F1BB8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_11E:
    JSR $4E60            ; 20 60 4E | Jump to subroutine
    DEC $0000            ; CE 00 00 | Decrement (absolute)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_11F
; Address: $F1BBA2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_11F:
    JSR $0C3C            ; 20 3C 0C | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    CPX $F800            ; EC 00 F8 | Compare X register (absolute)
    SED                  ; F8 | Set decimal mode flag
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $A0              ; 80 A0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_120
; Address: $F1BBE3
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_120:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    WDM #$3E             ; 42 3E | Reserved instruction
    JMP $9E49            ; 4C 49 9E | Jump to address
    STX $0031            ; 8E 31 00 | Store X register to absolute address
    SEC                  ; 38 | Set carry flag
    BPL $01              ; 10 01 | Branch if positive
    BVS $00              ; 70 00 | Branch if overflow set
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $01              ; 10 01 | Branch if positive
    CMP $7F4D,Y          ; D9 4D 7F | Compare accumulator (absolute,Y)
    ADC $5E5D            ; 6D 5D 5E | Add with carry (absolute)
    EOR $07AB,X          ; 5D AB 07 | Exclusive OR with accumulator (absolute,X)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    LDA $2902,X          ; BD 02 29 | Load from absolute,X into accumulator
    ORA #$09             ; 09 09 | Logical OR with accumulator (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_122
; Address: $F1BC2B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_122:
    REP #$C2             ; C2 C2 | Reset processor status bits
    DEC $7A              ; C6 7A | Decrement (zero page)
    SBC $FBD0,X          ; FD D0 FB | Subtract with carry (absolute,X)
    LDY #$F6             ; A0 F6 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BCC $FD              ; 90 FD | Branch if carry clear
    BMI $B9              ; 30 B9 | Branch if negative
    CMP ($00,X)          ; C1 00 | Compare accumulator ((zero page,X))
    STA ($DE),Y          ; 91 DE | Store accumulator to (zero page),Y
    LDX $20BF,Y          ; BE BF 20 | Load from absolute,Y into X register
    BVC $58              ; 50 58 | Branch if overflow clear
    BIT $0B              ; 24 0B | Test bits in accumulator (zero page)
    BCC $9F              ; 90 9F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_123
; Address: $F1BC50
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_123:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    CPY $D80C            ; CC 0C D8 | Compare Y register (absolute)
    BPL $F0              ; 10 F0 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_124
; Address: $F1BC60
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_124:
    STZ $18              ; 64 18 | Store zero to zero page
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_125
; Address: $F1BC64
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_125:
    ROL $C1C0,X          ; 3E C0 C1 | Rotate left (absolute,X)
    LDX $605E,Y          ; BE 5E 60 | Load from absolute,Y into X register
    STZ $D8              ; 64 D8 | Store zero to zero page
    PLY                  ; 7A | Pull Y register from stack
    STY $E4              ; 84 E4 | Store Y register to zero page
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_126
; Address: $F1BC73
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_126:
    SEI                  ; 78 | Set interrupt disable flag
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    BRA $BE              ; 80 BE | Branch always
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    ASL $3F5E,X          ; 1E 5E 3F | Arithmetic shift left (absolute,X)
    BRA $7E              ; 80 7E | Branch always
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $81              ; 80 81 | Branch always
    STA ($40,X)          ; 81 40 | Store accumulator to (zero page,X)
    RTI                  ; 40 | Return from interrupt
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $7F00,Y          ; F9 00 7F | Subtract with carry (absolute,Y)
    ROR $BF00,X          ; 7E 00 BF | Rotate right (absolute,X)
    INC $1800,X          ; FE 00 18 | Increment (absolute,X)
    BPL $D0              ; 10 D0 | Branch if positive
    CPX #$18             ; E0 18 | Compare X register (immediate)
    BPL $6C              ; 10 6C | Branch if positive
    PLA                  ; 68 | Pull accumulator from stack
    DEX                  ; CA | Decrement X register
    SEC                  ; 38 | Set carry flag
    CMP $E0FE            ; CD FE E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND ($11),Y          ; 31 11 | Logical AND with accumulator ((zero page),Y)
    BPL $0F              ; 10 0F | Branch if positive
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    BIT $1B              ; 24 1B | Test bits in accumulator (zero page)
    STA $7666,Y          ; 99 66 76 | Store accumulator to absolute,Y
    ORA #$0D             ; 09 0D | Logical OR with accumulator (immediate)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ROL $FF00,X          ; 3E 00 FF | Rotate left (absolute,X)
    BRA $80              ; 80 80 | Branch always
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_127
; Address: $F1BD04
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_127:
    JSR $70C0            ; 20 C0 70 | Jump to subroutine
    BRA $C0              ; 80 C0 | Branch always
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    ADC $837C,X          ; 7D 7C 83 | Add with carry (absolute,X)
    ROR $3C00,X          ; 7E 00 3C | Rotate right (absolute,X)
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_129
; Address: $F1BD65
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_129:
    JSR $DF5F            ; 20 5F DF | Jump to subroutine
    CLD                  ; D8 | Clear decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    JMP $D73C            ; 4C 3C D7 | Jump to address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_12B
; Address: $F1BD7E
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_12B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PLY                  ; 7A | Pull Y register from stack
    STZ $3EFF            ; 9C FF 3E | Store zero to absolute
    JMP $12FF            ; 4C FF 12 | Jump to address
    BPL $20              ; 10 20 | Branch if positive
    INY                  ; C8 | Increment Y register
    BEQ $78              ; F0 78 | Branch if equal
    BVS $14              ; 70 14 | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    JMP ($1E68)          ; 6C 68 1E | Jump to address (absolute indirect)
    TAX                  ; AA | Transfer accumulator to X register
    LDY $5A5B            ; AC 5B 5A | Load from absolute address into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $00              ; 50 00 | Branch if overflow clear
    LDY $00              ; A4 00 | Load from zero page into Y register
    AND ($40),Y          ; 31 40 | Logical AND with accumulator ((zero page),Y)
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    JMP ($44AA)          ; 6C AA 44 | Jump to address (absolute indirect)
    TAX                  ; AA | Transfer accumulator to X register
    EOR #$06             ; 49 06 | Exclusive OR with accumulator (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    INC $EEFE,X          ; FE FE EE | Increment (absolute,X)
    INC $EEEE            ; EE EE EE | Increment (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_12C
; Address: $F1BDE0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_12C:
    JSL $C605E3          ; 22 E3 05 C6 | Jump to subroutine long
    JMP $49CE            ; 4C CE 49 | Jump to address
    PEA #$FC7B           ; F4 7B FC | Push effective address to stack
    PLA                  ; 68 | Pull accumulator from stack
    SEC                  ; 38 | Set carry flag
    DEC $CC30            ; CE 30 CC | Decrement (absolute)
    BMI $F8              ; 30 F8 | Branch if negative
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_12E
; Address: $F1BDFF
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_12E:
    JSR $0CF0            ; 20 F0 0C | Jump to subroutine
    CPY $3C              ; C4 3C | Compare Y register (zero page)
    PLY                  ; 7A | Pull Y register from stack
    BEQ $28              ; F0 28 | Branch if equal
    INX                  ; E8 | Increment X register
    JMP ($55EC)          ; 6C EC 55 | Jump to address (absolute indirect)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ROL                  ; 2A | Rotate left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    ADC ($FE,X)          ; 61 FE | Add with carry ((zero page,X))
    ADC $037D,X          ; 7D 7D 03 | Add with carry (absolute,X)
    JMP $785C            ; 4C 5C 78 | Jump to address
    SEI                  ; 78 | Set interrupt disable flag
    LDY $00FC,X          ; BC FC 00 | Load from absolute,X into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($87,X)          ; 01 87 | Logical OR with accumulator ((zero page,X))
    BCC $E0              ; 90 E0 | Game work RAM access
    CLI                  ; 58 | Clear interrupt disable flag
    BNE $B0              ; D0 B0 | Branch if not equal
    CPY #$68             ; C0 68 | Compare Y register (immediate)
    BEQ $B0              ; F0 B0 | Branch if equal
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    BMI $34              ; 30 34 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    PLA                  ; 68 | Pull accumulator from stack
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_12F
; Address: $F1BE52
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_12F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    STA $7D              ; 85 7D | Store accumulator to zero page
    STA $AA7D            ; 8D 7D AA | Store accumulator to absolute address
    PLY                  ; 7A | Pull Y register from stack
    STY $557E            ; 8C 7E 55 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank62_DmaFunction_130
; Address: $F1BE6A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_130:
    JSL $07181F          ; 22 1F 18 07 | Jump to subroutine long
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BIT #$89             ; 89 89 | Test bits in accumulator (immediate)
    LDA $F7AD            ; AD AD F7 | Load from absolute address into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $D42B,X          ; FD 2B D4 | Subtract with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    LDA $66BE,Y          ; B9 BE 66 | Load from absolute,Y into accumulator
    SBC $FE99,Y          ; F9 99 FE | Subtract with carry (absolute,Y)
    DEC $B9              ; C6 B9 | Decrement (zero page)
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_131
; Address: $F1BEAC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_131:
    TAY                  ; A8 | Transfer accumulator to Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_132
; Address: $F1BF0C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_132:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    LSR $BD3E            ; 4E 3E BD | Logical shift right (absolute)
    ADC $1F6E,X          ; 7D 6E 1F | Add with carry (absolute,X)
    EOR $233F,Y          ; 59 3F 23 | Exclusive OR with accumulator (absolute,Y)
    ORA $051A,X          ; 1D 1A 05 | Logical OR with accumulator (absolute,X)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($41,X)          ; 41 41 | Exclusive OR with accumulator ((zero page,X))
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    LDA $F7AD            ; AD AD F7 | Load from absolute address into accumulator
    CLI                  ; 58 | Clear interrupt disable flag
    SBC $D42B,X          ; FD 2B D4 | Subtract with carry (absolute,X)
    LDX $7700,Y          ; BE 00 77 | Load from absolute,Y into X register
    CMP $76DE,X          ; DD DE 76 | Compare accumulator (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $B8              ; C4 B8 | Compare Y register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_133
; Address: $F1BF72
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_133:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TSX                  ; BA | Transfer stack pointer to X register
    EOR $8665            ; 4D 65 86 | Exclusive OR with accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    DEC $31CE,X          ; DE CE 31 | Decrement (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPX #$E0             ; E0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_134
; Address: $F1BFB2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_134:
    CLD                  ; D8 | Clear decimal mode flag
    CPY #$88             ; C0 88 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    INC $DC00,X          ; FE 00 DC | Increment (absolute,X)
    TAX                  ; AA | Transfer accumulator to X register
    CMP ($3E,X)          ; C1 3E | Compare accumulator ((zero page,X))
    BRA $90              ; 80 90 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_136
; Address: $F1BFCB
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_136:
    BRA $80              ; 80 80 | Branch always
    SBC $A35C            ; ED 5C A3 | Subtract with carry (absolute)
    SBC #$07             ; E9 07 | Subtract with carry (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $24              ; 80 24 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    STA $6E66,Y          ; 99 66 6E | Store accumulator to absolute,Y
    BCC $B0              ; 90 B0 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVC $80              ; 50 80 | Branch if overflow clear
    PLA                  ; 68 | Pull accumulator from stack
    BCC $50              ; 90 50 | Branch if carry clear
    LDY #$A8             ; A0 A8 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    BCC $00              ; 90 00 | Branch if carry clear
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_137
; Address: $F1C05B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_137:
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    ORA $030C            ; 0D 0C 03 | Logical OR with accumulator (absolute)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$C0             ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_138
; Address: $F1C082
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_138:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $24              ; 80 24 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    STA $6E66,Y          ; 99 66 6E | Store accumulator to absolute,Y
    BCC $B0              ; 90 B0 | Branch if carry clear
    PHA                  ; 48 | Push accumulator to stack
    INC $F800,X          ; FE 00 F8 | Increment (absolute,X)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BVS $30              ; 70 30 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    CLI                  ; 58 | Clear interrupt disable flag
    DEC $EE2E,X          ; DE 2E EE | Decrement (absolute,X)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_139
; Address: $F1C15C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_139:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    BIT $08              ; 24 08 | Test bits in accumulator (zero page)
    EOR ($5E),Y          ; 51 5E | Exclusive OR with accumulator ((zero page),Y)
    ADC ($7E,X)          ; 61 7E | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_13A
; Address: $F1C16E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_13A:
    JSL $02037C          ; 22 7C 03 02 | Jump to subroutine long
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_13C
; Address: $F1C17A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_13C:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BNE $A0              ; D0 A0 | Branch if not equal
    BVC $60              ; 50 60 | Branch if overflow clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_13D
; Address: $F1C185
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_13D:
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_13E
; Address: $F1C195
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_13E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ROL $0130            ; 2E 30 01 | Rotate left (absolute)
    BRA $80              ; 80 80 | Branch always
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    ROR $7F1C,X          ; 7E 1C 7F | Rotate right (absolute,X)
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$0A             ; 09 0A | Logical OR with accumulator (immediate)
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$04             ; E0 04 | Compare X register (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    INC                  ; 1A | Increment accumulator
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    ASL $1F00            ; 0E 00 1F | Arithmetic shift left (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BNE $E0              ; D0 E0 | Game work RAM access
    BNE $E0              ; D0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_13F
; Address: $F1C244
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_13F:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_141
; Address: $F1C26B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_141:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $1F              ; 06 1F | Arithmetic shift left (zero page)
    ASL $193F            ; 0E 3F 19 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    SBC $5A08            ; ED 08 5A | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_142
; Address: $F1C286
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_142:
    JSL $0C0C26          ; 22 26 0C 0C | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BPL $10              ; 10 10 | Branch if positive
    BIT $24              ; 24 24 | Test bits in accumulator (zero page)
    LDY $80              ; A4 80 | Load from zero page into Y register
    PLA                  ; 68 | Pull accumulator from stack
    PHP                  ; 08 | Push processor status to stack
    CLD                  ; D8 | Clear decimal mode flag
    BVC $F2              ; 50 F2 | Branch if overflow clear
    LDY #$F4             ; A0 F4 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPX $D880            ; EC 80 D8 | Compare X register (absolute)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    AND $1706,Y          ; 39 06 17 | Logical AND with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY $30CC            ; CC CC 30 | Compare Y register (absolute)
    BVS $80              ; 70 80 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $31              ; 80 31 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    RTI                  ; 40 | Return from interrupt
    ASL $80FE,X          ; 1E FE 80 | Arithmetic shift left (absolute,X)
    ROR $3E40,X          ; 7E 40 3E | Rotate right (absolute,X)
    SEC                  ; 38 | Set carry flag
    WDM #$3C             ; 42 3C | Reserved instruction
    WDM #$00             ; 42 00 | Reserved instruction
    ROL $1C00,X          ; 3E 00 1C | Rotate left (absolute,X)
    ROL $107F,X          ; 3E 7F 10 | Rotate left (absolute,X)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_143
; Address: $F1C365
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_143:
    BRA $E0              ; 80 E0 | Game work RAM access
    CPY #$24             ; C0 24 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    CMP $2626,Y          ; D9 26 26 | Compare accumulator (absolute,Y)
    CLD                  ; D8 | Clear decimal mode flag
    PHX                  ; DA | Push X register to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_144
; Address: $F1C3B1
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_144:
    JSR $0080            ; 20 80 00 | Jump to subroutine
    ORA ($19,X)          ; 01 19 | Logical OR with accumulator ((zero page,X))
    AND $2D1F            ; 2D 1F 2D | Logical AND with accumulator (absolute)
    ORA $375E,X          ; 1D 5E 37 | Logical OR with accumulator (absolute,X)
    EOR $A22B,X          ; 5D 2B A2 | Exclusive OR with accumulator (absolute,X)
    STA $46              ; 85 46 | Store accumulator to zero page
    JMP $040E            ; 4C 0E 04 | Jump to address
    AND $6902,X          ; 3D 02 69 | Logical AND with accumulator (absolute,X)
    SEC                  ; 38 | Set carry flag
    DEC $C030            ; CE 30 C0 | Decrement (absolute)
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_145
; Address: $F1C3E5
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_145:
    REP #$C2             ; C2 C2 | Reset processor status bits
    DEC $78              ; C6 78 | Decrement (zero page)
    BEQ $0C              ; F0 0C | Branch if equal
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    BRA $78              ; 80 78 | Branch always
    ROL $5E00,X          ; 3E 00 5E | Rotate left (absolute,X)
    BCC $FC              ; 90 FC | Branch if carry clear
    BMI $B8              ; 30 B8 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BVS $08              ; 70 08 | Branch if overflow set
    BRA $7E              ; 80 7E | Branch always
    ROL $4000,X          ; 3E 00 40 | Rotate left (absolute,X)
    BIT $5213            ; 2C 13 52 | Test bits in accumulator (absolute)
    ROL $7E00,X          ; 3E 00 7E | Rotate left (absolute,X)
    ORA ($3C,X)          ; 01 3C | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_146
; Address: $F1C43F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_146:
    ROL $0000            ; 2E 00 00 | Rotate left (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SBC ($11),Y          ; F1 11 | Subtract with carry ((zero page),Y)
    STA                  ; 9F 8F 7F 00 | Store accumulator to absolute long,X
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_148
; Address: $F1C468
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_148:
    JSR $0038            ; 20 38 00 | Jump to subroutine
    STA ($81,X)          ; 81 81 | Store accumulator to (zero page,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_14A
; Address: $F1C47A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_14A:
    SEI                  ; 78 | Set interrupt disable flag
    ROR $1F18,X          ; 7E 18 1F | Rotate right (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEC $F449            ; CE 49 F4 | Decrement (absolute)
    ADC $50F8,Y          ; 79 F8 50 | Add with carry (absolute,Y)
    BCS $60              ; B0 60 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_14B
; Address: $F1C4AA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_14B:
    LDY #$40             ; A0 40 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY $FC30            ; CC 30 FC | Compare Y register (absolute)
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_14C
; Address: $F1C4B9
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_14C:
    JSR $E0E0            ; 20 E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    STA $0D7277          ; 8F 77 72 0D | Store accumulator to absolute long address
    JMP $3B33            ; 4C 33 3B | Jump to address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ROR $7F00,X          ; 7E 00 7F | Rotate right (absolute,X)
    BRA $FE              ; 80 FE | Branch always
    EOR ($7E,X)          ; 41 7E | Exclusive OR with accumulator ((zero page,X))
    EOR ($7E,X)          ; 41 7E | Exclusive OR with accumulator ((zero page,X))
    CPY $F00C            ; CC 0C F0 | Compare Y register (absolute)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    ASL $0001,X          ; 1E 01 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_14D
; Address: $F1C560
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_14D:
    BMI $70              ; 30 70 | Branch if negative
    ORA $0203,X          ; 1D 03 02 | Logical OR with accumulator (absolute,X)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_14E
; Address: $F1C583
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_14E:
    RTI                  ; 40 | Return from interrupt
    BCC $E0              ; 90 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    CPY $FB              ; C4 FB | Compare Y register (zero page)
    ORA $E6E6,Y          ; 19 E6 E6 | Logical OR with accumulator (absolute,Y)
    ORA $0619,Y          ; 19 19 06 | Logical OR with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ROL $7A22            ; 2E 22 7A | Rotate left (absolute)
    PLY                  ; 7A | Pull Y register from stack
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    NOP                  ; EA | No operation
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    INC                  ; 1A | Increment accumulator
    BPL $10              ; 10 10 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_14F
; Address: $F1C618
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_14F:
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA $0F              ; 05 0F | Logical OR with accumulator (zero page)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    RTI                  ; 40 | Return from interrupt
    TAY                  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_150
; Address: $F1C626
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_150:
    JSR $2434            ; 20 34 24 | Jump to subroutine
    ROL $4C              ; 26 4C | Rotate left (zero page)
    EOR $4A48            ; 4D 48 4A | Exclusive OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INY                  ; C8 | Increment Y register
    BRA $D8              ; 80 D8 | Branch always
    BRA $B2              ; 80 B2 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_152
; Address: $F1C63D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_152:
    JSR $40EC            ; 20 EC 40 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_154
; Address: $F1C665
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_154:
    JSR $20D0            ; 20 D0 20 | Jump to subroutine
    BCS $40              ; B0 40 | Branch if carry set
    TAY                  ; A8 | Transfer accumulator to Y register
    BVC $A8              ; 50 A8 | Branch if overflow clear
    BVC $50              ; 50 50 | Branch if overflow clear
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_155
; Address: $F1C673
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_155:
    JSR $F000            ; 20 00 F0 | Jump to subroutine
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    ORA $6303,X          ; 1D 03 63 | Logical OR with accumulator (absolute,X)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    BPL $28              ; 10 28 | Branch if positive
    BPL $48              ; 10 48 | Branch if positive
    BMI $50              ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_156
; Address: $F1C6C7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_156:
    JSR $6090            ; 20 90 60 | Jump to subroutine
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    LDY #$40             ; A0 40 | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_157
; Address: $F1C6E3
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_157:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    INX                  ; E8 | Increment X register
    STZ $E4              ; 64 E4 | Store zero to zero page
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA ($3F,X)          ; 01 3F | Logical OR with accumulator ((zero page,X))
    ORA ($BF,X)          ; 01 BF | Logical OR with accumulator ((zero page,X))
    ORA #$5F             ; 09 5F | Logical OR with accumulator (immediate)
    ORA #$7F             ; 09 7F | Logical OR with accumulator (immediate)
    ORA $BF              ; 05 BF | Logical OR with accumulator (zero page)
    AND $1512            ; 2D 12 15 | Logical AND with accumulator (absolute)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    ASL $0E0E            ; 0E 0E 0E | Arithmetic shift left (absolute)
    ASL $0F0F            ; 0E 0F 0F | Arithmetic shift left (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ASL $1C0E            ; 0E 0E 1C | Arithmetic shift left (absolute)
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$20             ; A0 20 | Load immediate value into Y register
    LDY #$71             ; A0 71 | Load immediate value into Y register
    SBC ($6E),Y          ; F1 6E | Subtract with carry ((zero page),Y)
    INC $F171            ; EE 71 F1 | Increment (absolute)
    ROL                  ; 2A | Rotate left (accumulator)
    ADC ($5F),Y          ; 71 5F | Add with carry ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $065F            ; 0E 5F 06 | Arithmetic shift left (absolute)
    ROL $2006            ; 2E 06 20 | Rotate left (absolute)
    ORA ($31),Y          ; 11 31 | Logical OR with accumulator ((zero page),Y)
    ASL $1B24            ; 0E 24 1B | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    REP #$C2             ; C2 C2 | Reset processor status bits
    SEP #$E0             ; E2 E0 | Game work RAM access
    CPX #$84             ; E0 84 | Compare X register (immediate)
    CPY $48              ; C4 48 | Compare Y register (zero page)
    CPY $F820            ; CC 20 F8 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_158
; Address: $F1C790
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_158:
    INX                  ; E8 | Increment X register
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    BRA $3C              ; 80 3C | Branch always
    SED                  ; F8 | Set decimal mode flag
    BCS $00              ; B0 00 | Branch if carry set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    BNE $A0              ; D0 A0 | Branch if not equal
    BPL $60              ; 10 60 | Branch if positive
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $40              ; 80 40 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVS $80              ; 70 80 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_159
; Address: $F1C7D5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_159:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ASL $77              ; 06 77 | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ADC #$01             ; 69 01 | Add with carry (immediate)
    STA ($67,X)          ; 81 67 | Store accumulator to (zero page,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA $3B02            ; 0D 02 3B | Logical OR with accumulator (absolute)
    ROR $9830,X          ; 7E 30 98 | Rotate right (absolute,X)
    BRA $CC              ; 80 CC | Branch always
    ORA $E29E,Y          ; 19 9E E2 | Logical OR with accumulator (absolute,Y)
    CPX $F8              ; E4 F8 | Compare X register (zero page)
    CPY $F8              ; C4 F8 | Compare Y register (zero page)
    INY                  ; C8 | Increment Y register
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$CF             ; E0 CF | Compare X register (immediate)
    BMI $9F              ; 30 9F | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_15A
; Address: $F1C814
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_15A:
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_15B
; Address: $F1C840
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_15B:
    BCC $60              ; 90 60 | Branch if carry clear
    BVC $20              ; 50 20 | Branch if overflow clear
    BVC $20              ; 50 20 | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    BMI $28              ; 30 28 | Branch if negative
    BPL $24              ; 10 24 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BEQ $F0              ; F0 F0 | Branch if equal
    BVS $70              ; 70 70 | Branch if overflow set
    BVS $70              ; 70 70 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    ASL $03              ; 06 03 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    CLD                  ; D8 | Clear decimal mode flag
    ADC #$F9             ; 69 F9 | Add with carry (immediate)
    STA $D7D9,Y          ; 99 D9 D7 | Store accumulator to absolute,Y
    STA                  ; 9F 66 AF FF | Store accumulator to absolute long,X
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    AND #$06             ; 29 06 | Logical AND with accumulator (immediate)
    ORA $0006,Y          ; 19 06 00 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $1511            ; 0D 11 15 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ROL                  ; 2A | Rotate left (accumulator)
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BPL $74              ; 10 74 | Branch if positive
    JMP $0C6E            ; 4C 6E 0C | Jump to address
    ROL $2B29            ; 2E 29 2B | Rotate left (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    BCC $80              ; 90 80 | Branch if carry clear
    BNE $80              ; D0 80 | Branch if not equal
    CPY #$F5             ; C0 F5 | Compare Y register (immediate)
    CPY #$63             ; C0 63 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_15C
; Address: $F1C8E2
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_15C:
    WDM #$23             ; 42 23 | Reserved instruction
    AND $3A1E,X          ; 3D 1E 3A | Logical AND with accumulator (absolute,X)
    INC                  ; 1A | Increment accumulator
    ORA $020C            ; 0D 0C 02 | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ROL $1E00,X          ; 3E 00 1E | Rotate left (absolute,X)
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    BCC $70              ; 90 70 | Branch if carry clear
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $1F              ; 10 1F | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    DEC $FFDF,X          ; DE DF FF | Decrement (absolute,X)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BPL $E0              ; 10 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    BRA $F0              ; 80 F0 | Branch always
    BPL $F0              ; 10 F0 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_15E
; Address: $F1C994
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_15E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    PLP                  ; 28 | Pull processor status from stack
    BPL $28              ; 10 28 | Branch if positive
    BPL $10              ; 10 10 | Branch if positive
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BPL $10              ; 10 10 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_15F
; Address: $F1C9E1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_15F:
    STX $0EFE            ; 8E FE 0E | Store X register to absolute address
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_160
; Address: $F1C9F0
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_160:
    ASL $0601,X          ; 1E 01 06 | Arithmetic shift left (absolute,X)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    JMP $5B5B5C          ; 5C 5C 5B 5B | Jump to address long
    JMP $0A6E27          ; 5C 27 6E 0A | Jump to address long
    BIT $367F            ; 2C 7F 36 | Test bits in accumulator (absolute)
    AND ($28,X)          ; 21 28 | Logical AND with accumulator ((zero page,X))
    BIT $1903            ; 2C 03 19 | Test bits in accumulator (absolute)
    ASL $1E              ; 06 1E | Arithmetic shift left (zero page)
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $15              ; 05 15 | Logical OR with accumulator (zero page)
    BPL $11              ; 10 11 | Branch if positive
    DEC                  ; 3A | Decrement accumulator
    PHX                  ; DA | Push X register to stack
    SEC                  ; 38 | Set carry flag
    DEC                  ; 3A | Decrement accumulator
    CPX #$72             ; E0 72 | Compare X register (immediate)
    BVC $34              ; 50 34 | Branch if overflow clear
    PLX                  ; FA | Pull X register from stack
    CPY #$EA             ; C0 EA | Compare Y register (immediate)
    CPY #$EE             ; C0 EE | Compare Y register (immediate)
    BRA $D4              ; 80 D4 | Branch always
    BRA $14              ; 80 14 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_161
; Address: $F1CA39
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_161:
    JSR $C034            ; 20 34 C0 | Jump to subroutine
    STZ $7860            ; 9C 60 78 | Store zero to absolute
    BRA $03              ; 80 03 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0A06            ; 0E 06 0A | Arithmetic shift left (absolute)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $0E01            ; 0E 01 0E | Arithmetic shift left (absolute)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PLP                  ; 28 | Pull processor status from stack
    BMI $70              ; 30 70 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_164
; Address: $F1CA8A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_164:
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    CPY #$70             ; C0 70 | Compare Y register (immediate)
    BRA $70              ; 80 70 | Branch always
    BRA $60              ; 80 60 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BVS $01              ; 70 01 | Branch if overflow set
    STA ($18,X)          ; 81 18 | Store accumulator to (zero page,X)
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_165
; Address: $F1CAAB
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_165:
    CPX #$8C             ; E0 8C | Compare X register (immediate)
    STY $7F7F            ; 8C 7F 7F | Store Y register to absolute address
    ASL $7F              ; 06 7F | Arithmetic shift left (zero page)
    SEC                  ; 38 | Set carry flag
    BMI $80              ; 30 80 | Branch if negative
    CPY #$3E             ; C0 3E | Compare Y register (immediate)
    DEC                  ; 3A | Decrement accumulator
    CPX $FC              ; E4 FC | Compare X register (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $2700,X          ; FE 00 27 | Increment (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LDA                  ; BF 00 3F 00 | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BCC $80              ; 90 80 | Branch if carry clear
    INX                  ; E8 | Increment X register
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $60              ; 90 60 | Branch if carry clear
    INX                  ; E8 | Increment X register
    BPL $FC              ; 10 FC | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_166
; Address: $F1CB24
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_166:
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    BNE $E0              ; D0 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_167
; Address: $F1CB2A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_167:
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_168
; Address: $F1CB34
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_168:
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$20             ; E0 20 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $7F              ; 80 7F | Branch always
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_169
; Address: $F1CB78
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_169:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPX $18              ; E4 18 | Compare X register (zero page)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $1E0F,X          ; 1E 0F 1E | Arithmetic shift left (absolute,X)
    ASL $27              ; 06 27 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ORA $3D10,X          ; 1D 10 3D | Logical OR with accumulator (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    LDY #$C0             ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_16A
; Address: $F1CBC2
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_16A:
    JSR $20C0            ; 20 C0 20 | Jump to subroutine
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ROL $2F2F            ; 2E 2F 2F | Rotate left (absolute)
    ORA $07              ; 05 07 | Logical OR with accumulator (zero page)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    EOR ($40),Y          ; 51 40 | Exclusive OR with accumulator ((zero page),Y)
    BVC $00              ; 50 00 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_16B
; Address: $F1CC01
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_16B:
    BEQ $08              ; F0 08 | Branch if equal
    BEQ $80              ; F0 80 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BNE $F8              ; D0 F8 | Branch if not equal
    CPX #$FC             ; E0 FC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_16C
; Address: $F1CC0A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_16C:
    JSR $04FC            ; 20 FC 04 | Jump to subroutine
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_16E
; Address: $F1CC26
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_16E:
    BCC $40              ; 90 40 | Branch if carry clear
    DEY                  ; 88 | Decrement Y register
    BMI $C8              ; 30 C8 | Branch if negative
    BVS $C8              ; 70 C8 | Branch if overflow set
    BVS $E4              ; 70 E4 | Branch if overflow set
    SEI                  ; 78 | Set interrupt disable flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_16F
; Address: $F1CC36
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_16F:
    BNE $20              ; D0 20 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CMP $585E,Y          ; D9 5E 58 | Compare accumulator (absolute,Y)
    JMP $3F7C1F          ; 5C 1F 7C 3F | Jump to address long
    JMP $0E0F            ; 4C 0F 0E | Jump to address
    LDX $BE40,Y          ; BE 40 BE | Load from absolute,Y into X register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_172
; Address: $F1CC5F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_172:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$10             ; C0 10 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ASL $0C4F            ; 0E 4F 0C | Arithmetic shift left (absolute)
    ROL $0F2F            ; 2E 2F 0F | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_173
; Address: $F1CC91
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_173:
    JSR $0033            ; 20 33 00 | Jump to subroutine
    PLP                  ; 28 | Pull processor status from stack
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_174
; Address: $F1CCA0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_174:
    BPL $E0              ; 10 E0 | Game work RAM access
    PHP                  ; 08 | Push processor status to stack
    BEQ $88              ; F0 88 | Branch if equal
    INY                  ; C8 | Increment Y register
    BVS $FC              ; 70 FC | Branch if overflow set
    BRA $FC              ; 80 FC | Branch always
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BVS $00              ; 70 00 | Branch if overflow set
    BMI $00              ; 30 00 | Branch if negative
    ASL $130B            ; 0E 0B 13 | Arithmetic shift left (absolute)
    ORA $17              ; 05 17 | Logical OR with accumulator (zero page)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_175
; Address: $F1CCCE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_175:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    ORA $0900            ; 0D 00 09 | Logical OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_178
; Address: $F1CCFC
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_178:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $3C34            ; 2C 34 3C | Test bits in accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA $09              ; 05 09 | Logical OR with accumulator (zero page)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    STA $86              ; 85 86 | Store accumulator to zero page
    BPL $1F              ; 10 1F | Branch if positive
    STY $00              ; 84 00 | Store Y register to zero page
    BPL $00              ; 10 00 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BPL $30              ; 10 30 | Branch if positive
    SEI                  ; 78 | Set interrupt disable flag
    CLD                  ; D8 | Clear decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_179
; Address: $F1CD7E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_179:
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    CMP $46              ; C5 46 | Compare accumulator (zero page)
    LDY $0000            ; AC 00 00 | Load from absolute address into Y register
    STA                  ; 9F 00 00 00 | Store accumulator to absolute long,X
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_17A
; Address: $F1CDCE
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_17A:
    BRA $10              ; 80 10 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CMP ($66,X)          ; C1 66 | Compare accumulator ((zero page,X))
    PLB                  ; AB | Pull data bank register from stack
    JMP $000000          ; 5C 00 00 00 | Jump to address long
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVC $50              ; 50 50 | Branch if overflow clear
    AND ($01,X)          ; 21 01 | Logical AND with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $701F,X          ; 1E 1F 70 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_17B
; Address: $F1CE60
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_17B:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STA ($8A,X)          ; 81 8A | Store accumulator to (zero page,X)
    ORA $19              ; 05 19 | Logical OR with accumulator (zero page)
    TYA                  ; 98 | Transfer Y register to accumulator
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_17C
; Address: $F1CE76
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_17C:
    ASL $1800            ; 0E 00 18 | Arithmetic shift left (absolute)
    LDY $00              ; A4 00 | Load from zero page into Y register
    CLC                  ; 18 | Clear carry flag
    BPL $40              ; 10 40 | Branch if positive
    CPY #$50             ; C0 50 | Compare Y register (immediate)
    BVS $68              ; 70 68 | Branch if overflow set
    CLD                  ; D8 | Clear decimal mode flag
    BPL $CC              ; 10 CC | Branch if positive
    ORA #$E7             ; 09 E7 | Logical OR with accumulator (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    SEI                  ; 78 | Set interrupt disable flag
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_17D
; Address: $F1CE92
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_17D:
    RTI                  ; 40 | Return from interrupt
    BCC $00              ; 90 00 | Branch if carry clear
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    STA $4700,X          ; 9D 00 47 | Store accumulator to absolute,X
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVC $70              ; 50 70 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $10              ; 10 10 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    PLP                  ; 28 | Pull processor status from stack
    ORA ($01),Y          ; 11 01 | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    BIT $B894            ; 2C 94 B8 | Test bits in accumulator (absolute)
    CPX $B04F            ; EC 4F B0 | Compare X register (absolute)
    BIT $BB              ; 24 BB | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    BCC $6F              ; 90 6F | Branch if carry clear
    STA                  ; 9F 00 FC 00 | Store accumulator to absolute long,X
    BVS $00              ; 70 00 | Branch if overflow set
    LDY $00              ; A4 00 | Load from zero page into Y register
    BRA $00              ; 80 00 | Branch always
    INX                  ; E8 | Increment X register
    SEI                  ; 78 | Set interrupt disable flag
    BVC $78              ; 50 78 | Branch if overflow clear
    CMP ($CD),Y          ; D1 CD | Compare accumulator ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    CPX $08              ; E4 08 | Compare X register (zero page)
    INC $97              ; E6 97 | Increment (zero page)
    ADC ($09),Y          ; 71 09 | Add with carry ((zero page),Y)
    EOR ($BE,X)          ; 41 BE | Exclusive OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    BCC $00              ; 90 00 | Branch if carry clear
    AND $1800,Y          ; 39 00 18 | Logical AND with accumulator (absolute,Y)
    STZ $4F00            ; 9C 00 4F | Store zero to absolute

;------------------------------------------------------------------------------
; Bank62_DmaFunction_17E
; Address: $F1CF1C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_17E:
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $80              ; 80 80 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_17F
; Address: $F1CF3E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_17F:
    JSR $0800            ; 20 00 08 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND #$51             ; 29 51 | Logical AND with accumulator (immediate)
    STA $CFA0AF          ; 8F AF A0 CF | Store accumulator to absolute long address
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    BVC $6F              ; 50 6F | Branch if overflow clear
    BCS $3E              ; B0 3E | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    BNE $00              ; D0 00 | Branch if not equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank62_DmaFunction_180
; Address: $F1CF7A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_180:
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_181
; Address: $F1CF81
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_181:
    TAY                  ; A8 | Transfer accumulator to Y register
    EOR ($69,X)          ; 41 69 | Exclusive OR with accumulator ((zero page,X))
    INC $E729            ; EE 29 E7 | Increment (absolute)
    STY $62              ; 84 62 | Store Y register to zero page
    LDA $798B,Y          ; B9 8B 79 | Load from absolute,Y into accumulator
    BNE $00              ; D0 00 | Branch if not equal
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    STA $5C00,X          ; 9D 00 5C | Store accumulator to absolute,X
    STA $0700            ; 8D 00 07 | Store accumulator to absolute address
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_182
; Address: $F1CFCE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_182:
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BNE $F7              ; D0 F7 | Branch if not equal
    TAY                  ; A8 | Transfer accumulator to Y register
    STA $509BD4          ; 8F D4 9B 50 | Store accumulator to absolute long address
    BCS $2F              ; B0 2F | Branch if carry set
    BVS $60              ; 70 60 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag
    PEA #$6B00           ; F4 00 6B | Push effective address to stack
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_183
; Address: $F1D001
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_183:
    TAY                  ; A8 | Transfer accumulator to Y register
    BCS $2E              ; B0 2E | Branch if carry set
    AND #$E5             ; 29 E5 | Logical AND with accumulator (immediate)
    TAX                  ; AA | Transfer accumulator to X register
    ROR $04              ; 66 04 | Rotate right (zero page)
    SEP #$57             ; E2 57 | Set processor status bits
    ADC ($17),Y          ; 71 17 | Add with carry ((zero page),Y)
    BNE $00              ; D0 00 | Branch if not equal
    CLD                  ; D8 | Clear decimal mode flag
    PHY                  ; 5A | Push Y register to stack
    STZ $0D00            ; 9C 00 0D | Store zero to absolute
    ASL $0A00            ; 0E 00 0A | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    AND $3E              ; 25 3E | Logical AND with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($00,X)          ; 21 00 | Logical AND with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BPL $6F              ; 10 6F | Branch if positive
    BEQ $24              ; F0 24 | Branch if equal
    JMP $DFDF            ; 4C DF DF | Jump to address
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_184
; Address: $F1D076
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_184:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    LSR $A6BC            ; 4E BC A6 | Logical shift right (absolute)
    INC $F07E,X          ; FE 7E F0 | Increment (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_185
; Address: $F1D0A0
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_185:
    PLA                  ; 68 | Pull accumulator from stack
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    BEQ $70              ; F0 70 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    ASL $0B0F,X          ; 1E 0F 0B | Arithmetic shift left (absolute,X)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BVS $20              ; 70 20 | Branch if overflow set
    STZ $0C              ; 64 0C | Store zero to zero page
    CMP $00D9,Y          ; D9 D9 00 | Compare accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    ROL $00              ; 26 00 | Rotate left (zero page)
    STY $7C              ; 84 7C | Store Y register to zero page
    PHP                  ; 08 | Push processor status to stack
    INC $F03C,X          ; FE 3C F0 | Increment (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BVS $F0              ; 70 F0 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_186
; Address: $F1D122
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_186:
    JSR $C0E0            ; 20 E0 C0 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_187
; Address: $F1D132
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_187:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $9F              ; 10 9F | Branch if positive
    CPY $E828            ; CC 28 E8 | Compare Y register (absolute)
    BRA $FF              ; 80 FF | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_188
; Address: $F1D172
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_188:
    BMI $00              ; 30 00 | Branch if negative
    BRA $00              ; 80 00 | Branch always
    CPY $19CF            ; CC CF 19 | Compare Y register (absolute)
    DEC $FC              ; C6 FC | Decrement (zero page)
    SED                  ; F8 | Set decimal mode flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    BMI $00              ; 30 00 | Branch if negative
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_189
; Address: $F1D19A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_189:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $9F              ; 90 9F | Branch if carry clear
    PLA                  ; 68 | Pull accumulator from stack
    ADC ($E4),Y          ; 71 E4 | Add with carry ((zero page),Y)
    PLP                  ; 28 | Pull processor status from stack
    INX                  ; E8 | Increment X register
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_18A
; Address: $F1D1F2
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_18A:
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND $CFED            ; 2D ED CF | Logical AND with accumulator (absolute)
    ORA $C61F,Y          ; 19 1F C6 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($EE,X)          ; 01 EE | Logical OR with accumulator ((zero page,X))
    ROR $B4              ; 66 B4 | Rotate right (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BCS $90              ; B0 90 | Branch if carry set
    PLA                  ; 68 | Pull accumulator from stack
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    ORA $1E              ; 05 1E | Logical OR with accumulator (zero page)
    BVS $28              ; 70 28 | Branch if overflow set
    BNE $00              ; D0 00 | Branch if not equal
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BPL $10              ; 10 10 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_18B
; Address: $F1D2E9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_18B:
    CLC                  ; 18 | Clear carry flag
    ORA #$26             ; 09 26 | Logical OR with accumulator (immediate)
    ROL $2050            ; 2E 50 20 | Rotate left (absolute)
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_18C
; Address: $F1D30A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_18C:
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BVC $28              ; 50 28 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLC                  ; 18 | Clear carry flag
    ORA #$26             ; 09 26 | Logical OR with accumulator (immediate)
    ROL $2050            ; 2E 50 20 | Rotate left (absolute)
    STY $20              ; 84 20 | Store Y register to zero page
    STA $009F2B          ; 8F 2B 9F 00 | Store accumulator to absolute long address
    STZ $00              ; 64 00 | Store zero to zero page
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_18D
; Address: $F1D346
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_18D:
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BVC $28              ; 50 28 | Branch if overflow clear
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CPY $0C              ; C4 0C | Compare Y register (zero page)
    DEC $00              ; C6 00 | Decrement (zero page)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $04              ; 05 04 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $58              ; 64 58 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank62_DmaFunction_18E
; Address: $F1D384
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_18E:
    JSR $F08F            ; 20 8F F0 | Jump to subroutine
    STA                  ; 9F 5F 1F A0 | Store accumulator to absolute long,X
    CPX #$3F             ; E0 3F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    LDA                  ; BF 00 7C 00 | Load from absolute long,X into accumulator
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CLV                  ; B8 | Clear overflow flag
    BVC $CC              ; 50 CC | Branch if overflow clear
    BIT $6CE6            ; 2C E6 6C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_18F
; Address: $F1D3A7
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_18F:
    SEP #$B6             ; E2 B6 | Set processor status bits
    SBC ($13),Y          ; F1 13 | Subtract with carry ((zero page),Y)
    SBC ($0F),Y          ; F1 0F | Subtract with carry ((zero page),Y)
    SBC $00F8,X          ; FD F8 00 | Subtract with carry (absolute,X)
    CLV                  ; B8 | Clear overflow flag
    CLI                  ; 58 | Clear interrupt disable flag
    STY $0E00            ; 8C 00 0E | Store Y register to absolute address
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $AF              ; 80 AF | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $1F              ; 90 1F | Branch if carry clear
    BCS $3F              ; B0 3F | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_190
; Address: $F1D3F4
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_190:
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHA                  ; 48 | Push accumulator to stack
    DEC $E228            ; CE 28 E2 | Decrement (absolute)
    ROR $24E3            ; 6E E3 24 | Rotate right (absolute)
    SBC ($25,X)          ; E1 25 | Subtract with carry ((zero page,X))
    SBC ($33,X)          ; E1 33 | Subtract with carry ((zero page,X))
    SBC ($1F),Y          ; F1 1F | Subtract with carry ((zero page),Y)
    SBC $00B8,X          ; FD B8 00 | Subtract with carry (absolute,X)
    SEI                  ; 78 | Set interrupt disable flag
    STZ $1C00            ; 9C 00 1C | Store zero to absolute
    ASL $1E00,X          ; 1E 00 1E | Arithmetic shift left (absolute,X)
    ASL $0200            ; 0E 00 02 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_191
; Address: $F1D460
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_191:
    CPX #$8F             ; E0 8F | Compare X register (immediate)
    BVC $1F              ; 50 1F | Branch if overflow clear
    BCS $3F              ; B0 3F | Branch if carry set
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_192
; Address: $F1D472
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_192:
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    CPY $2C              ; C4 2C | Compare Y register (zero page)
    INC $60              ; E6 60 | Increment (zero page)
    SEP #$F6             ; E2 F6 | Set processor status bits
    SBC ($39),Y          ; F1 39 | Subtract with carry ((zero page),Y)
    SBC $F919,Y          ; F9 19 F9 | Subtract with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $0600            ; 0E 00 06 | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $9F              ; F0 9F | Branch if equal
    CLV                  ; B8 | Clear overflow flag
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    BRA $3F              ; 80 3F | Branch always
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_194
; Address: $F1D4D2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_194:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PLA                  ; 68 | Pull accumulator from stack
    SEP #$F0             ; E2 F0 | Set processor status bits
    SBC $F938,Y          ; F9 38 F9 | Subtract with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    SBC $F908,Y          ; F9 08 F9 | Subtract with carry (absolute,Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_195
; Address: $F1D4F6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_195:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $9F              ; 90 9F | Branch if carry clear
    ADC $9577,X          ; 7D 77 95 | Add with carry (absolute,X)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_198
; Address: $F1D540
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_198:
    LDY $A5              ; A4 A5 | Load from zero page into Y register
    STA $C61F,Y          ; 99 1F C6 | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHY                  ; 5A | Push Y register to stack
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    STA                  ; 9F 33 33 85 | Store accumulator to absolute long,X
    BRA $38              ; 80 38 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_19A
; Address: $F1D582
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_19A:
    LDA $1F19AF          ; AF AF 19 1F | Load from absolute long address into accumulator
    DEC $FC              ; C6 FC | Decrement (zero page)
    CLC                  ; 18 | Clear carry flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    TXA                  ; 8A | Transfer X register to accumulator
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCS $BF              ; B0 BF | Branch if carry set
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_19C
; Address: $F1D5C4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_19C:
    ORA $C61F,Y          ; 19 1F C6 | Logical OR with accumulator (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SBC ($00,X)          ; E1 00 | Subtract with carry ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDY #$BF             ; A0 BF | Load immediate value into Y register
    CPY #$98             ; C0 98 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_19D
; Address: $F1D610
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_19D:
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_19E
; Address: $F1D622
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_19E:
    ADC $1AEF            ; 6D EF 1A | Add with carry (absolute)
    ASL $FCC4,X          ; 1E C4 FC | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    SEP #$00             ; E2 00 | Set processor status bits
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    ORA #$26             ; 09 26 | Logical OR with accumulator (immediate)
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_19F
; Address: $F1D66E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_19F:
    LDY #$50             ; A0 50 | Load immediate value into Y register
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    BCC $00              ; 90 00 | Branch if carry clear
    DEC                  ; 3A | Decrement accumulator
    ADC $4D67,X          ; 7D 67 4D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A0
; Address: $F1D6EA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A0:
    JSL $1C1C3A          ; 22 3A 1C 1C | Jump to subroutine long
    ASL $5900,X          ; 1E 00 59 | Arithmetic shift left (absolute,X)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    ROL $00              ; 26 00 | Rotate left (zero page)
    BPL $18              ; 10 18 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack
    BPL $10              ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A1
; Address: $F1D718
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A1:
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    RTI                  ; 40 | Return from interrupt
    BMI $30              ; 30 30 | Branch if negative
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    BCC $90              ; 90 90 | Branch if carry clear
    JMP ($0220)          ; 6C 20 02 | Jump to address (absolute indirect)
    CPX $E0FC            ; EC FC E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1A              ; 06 1A | Arithmetic shift left (zero page)
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $2E00,Y          ; 19 00 2E | Logical OR with accumulator (absolute,Y)
    BVC $E4              ; 50 E4 | Branch if overflow clear
    STY $4B              ; 84 4B | Store Y register to zero page
    LDY #$3F             ; A0 3F | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    STY $FC              ; 84 FC | Store Y register to zero page
    CPX $00              ; E4 00 | Compare X register (zero page)
    CPY $00              ; C4 00 | Compare Y register (zero page)
    BRA $03              ; 80 03 | Branch always
    BVC $28              ; 50 28 | Branch if overflow clear
    STY $2E94            ; 8C 94 2E | Store Y register to absolute address
    INC $A2              ; E6 A2 | Increment (zero page)
    SEP #$37             ; E2 37 | Set processor status bits
    ORA $05F9,Y          ; 19 F9 05 | Logical OR with accumulator (absolute,Y)
    SBC $FB8B,X          ; FD 8B FB | Subtract with carry (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    TXS                  ; 9A | Transfer X register to stack pointer
    DEC $8D00,X          ; DE 00 8D | Decrement (absolute,X)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A2
; Address: $F1D7E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A2:
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($0D,X)          ; 01 0D | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A3
; Address: $F1D7F4
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A3:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA $3800,Y          ; 19 00 38 | Logical OR with accumulator (absolute,Y)
    PLA                  ; 68 | Pull accumulator from stack
    LDX #$D0             ; A2 D0 | Load immediate value into X register
    JMP ($5A0C)          ; 6C 0C 5A | Jump to address (absolute indirect)
    BIT $3F              ; 24 3F | Test bits in accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LDY $0007,X          ; BC 07 00 | Load from absolute,X into Y register
    CPX $00              ; E4 00 | Compare X register (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    CPY #$03             ; C0 03 | Compare Y register (immediate)
    JMP ($7260)          ; 6C 60 72 | Jump to address (absolute indirect)
    CPX $38E3            ; EC E3 38 | Compare X register (absolute)
    SBC $EFAD,Y          ; F9 AD EF | Subtract with carry (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BRA $00              ; 80 00 | Branch always
    STY $1E00            ; 8C 00 1E | Store Y register to absolute address
    STX $00              ; 86 00 | Store X register to zero page
    CMP ($00),Y          ; D1 00 | Compare accumulator ((zero page),Y)
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A4
; Address: $F1D84D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A4:
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A5
; Address: $F1D85E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A5:
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BPL $17              ; 10 17 | Branch if positive
    ORA #$14             ; 09 14 | Logical OR with accumulator (immediate)
    ROR $0000,X          ; 7E 00 00 | Rotate right (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ASL $1900            ; 0E 00 19 | Arithmetic shift left (absolute)
    ADC ($00),Y          ; 71 00 | Add with carry ((zero page),Y)
    CPY $40              ; C4 40 | Compare Y register (zero page)
    BIT $45              ; 24 45 | Test bits in accumulator (zero page)
    STA $DF5F,X          ; 9D 5F DF | Store accumulator to absolute,X
    LDA                  ; BF 83 00 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A6
; Address: $F1D896
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A6:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    LDA $000400          ; AF 00 04 00 | Load from absolute long address into accumulator
    BPL $AB              ; 10 AB | Branch if positive
    LDA ($CC,X)          ; A1 CC | Load from (zero page,X) into accumulator
    PLX                  ; FA | Pull X register from stack
    CLD                  ; D8 | Clear decimal mode flag
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A7
; Address: $F1D8A8
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A7:
    AND $80EF            ; 2D EF 80 | Logical AND with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    STA ($00),Y          ; 91 00 | Store accumulator to (zero page),Y
    INY                  ; C8 | Increment Y register
    TAY                  ; A8 | Transfer accumulator to Y register
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    BVS $F0              ; 70 F0 | Branch if overflow set
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVS $00              ; 70 00 | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $182C            ; 2C 2C 18 | Test bits in accumulator (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLY                  ; 7A | Pull Y register from stack
    ADC #$D3             ; 69 D3 | Add with carry (immediate)
    STA $42DF,X          ; 9D DF 42 | Hardware register operation
    PLY                  ; 7A | Pull Y register from stack
    ROL $3D00,X          ; 3E 00 3D | Rotate left (absolute,X)
    LDA $A100,Y          ; B9 00 A1 | Load from absolute,Y into accumulator
    LSR $00              ; 46 00 | Logical shift right (zero page)
    ASL $0B              ; 06 0B | Arithmetic shift left (zero page)
    ORA $E0A7,X          ; 1D A7 E0 | Game work RAM access
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STA                  ; 9F 00 48 00 | Store accumulator to absolute long,X
    BRA $50              ; 80 50 | Branch always
    BVS $C0              ; 70 C0 | Branch if overflow set
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    ORA $060F,Y          ; 19 0F 06 | Logical OR with accumulator (absolute,Y)
    ORA #$0F             ; 09 0F | Logical OR with accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    REP #$C0             ; C2 C0 | Reset processor status bits
    CLV                  ; B8 | Clear overflow flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A8
; Address: $F1D988
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A8:
    CPY #$7F             ; C0 7F | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BIT #$F9             ; 89 F9 | Test bits in accumulator (immediate)
    ROR $03FF,X          ; 7E FF 03 | Rotate right (absolute,X)
    SBC $1EFF,Y          ; F9 FF 1E | Subtract with carry (absolute,Y)
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    BNE $F0              ; D0 F0 | Branch if not equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    LDY #$E0             ; A0 E0 | Game work RAM access
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1A9
; Address: $F1D9D4
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1A9:
    JSR $8000            ; 20 00 80 | Jump to subroutine
    EOR $3679,Y          ; 59 79 36 | Exclusive OR with accumulator (absolute,Y)
    ROL $0B0E,X          ; 3E 0E 0B | Rotate left (absolute,X)
    ASL $090F,X          ; 1E 0F 09 | Arithmetic shift left (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $00              ; 46 00 | Logical shift right (zero page)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    CPY $1C              ; C4 1C | Compare Y register (zero page)
    REP #$C0             ; C2 C0 | Reset processor status bits
    BMI $30              ; 30 30 | Branch if negative
    CMP ($7F,X)          ; C1 7F | Compare accumulator ((zero page,X))
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    CPX $03              ; E4 03 | Compare X register (zero page)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    EOR ($00,X)          ; 41 00 | Exclusive OR with accumulator ((zero page,X))
    CMP $86              ; C5 86 | Compare accumulator (zero page)
    ROR $C77F,X          ; 7E 7F C7 | Rotate right (absolute,X)
    SED                  ; F8 | Set decimal mode flag
    DEY                  ; 88 | Decrement Y register
    TSX                  ; BA | Transfer stack pointer to X register
    SEC                  ; 38 | Set carry flag
    BRA $00              ; 80 00 | Branch always
    DEY                  ; 88 | Decrement Y register
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1AA
; Address: $F1DA42
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1AA:
    JSR $D0E0            ; 20 E0 D0 | Jump to subroutine
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1AC
; Address: $F1DA56
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1AC:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    LDA #$E1             ; A9 E1 | Load immediate value into accumulator
    ORA $301F,Y          ; 19 1F 30 | Logical OR with accumulator (absolute,Y)
    BMI $1D              ; 30 1D | Branch if negative
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STZ $7300,X          ; 9E 00 73 | Store zero to absolute,X
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    BIT $3C              ; 24 3C | Test bits in accumulator (zero page)
    STZ $3030            ; 9C 30 30 | Store zero to absolute
    STZ $7FFF            ; 9C FF 7F | Store zero to absolute
    CPX #$03             ; E0 03 | Compare X register (immediate)
    CPY $03              ; C4 03 | Compare Y register (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1AD
; Address: $F1DA9A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1AD:
    BRA $00              ; 80 00 | Branch always
    ORA $81ED,X          ; 1D ED 81 | Logical OR with accumulator (absolute,X)
    CMP ($80,X)          ; C1 80 | Compare accumulator ((zero page,X))
    CPY #$47             ; C0 47 | Compare Y register (immediate)
    INC $C8F8,X          ; FE F8 C8 | Increment (absolute,X)
    LDX $3F00,Y          ; BE 00 3F | Load from absolute,Y into X register
    CLV                  ; B8 | Clear overflow flag
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    INY                  ; C8 | Increment Y register
    PEA #$B0FC           ; F4 FC B0 | Push effective address to stack
    BEQ $28              ; F0 28 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BVS $F0              ; 70 F0 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    INY                  ; C8 | Increment Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    DEC $78              ; C6 78 | Decrement (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    BPL $00              ; 10 00 | Branch if positive
    TSX                  ; BA | Transfer stack pointer to X register
    SEI                  ; 78 | Set interrupt disable flag
    PLA                  ; 68 | Pull accumulator from stack
    JMP ($0000)          ; 6C 00 00 | Jump to address (absolute indirect)
    BVC $00              ; 50 00 | Branch if overflow clear
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    STY $00              ; 84 00 | Store Y register to zero page
    DEY                  ; 88 | Decrement Y register
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1AE
; Address: $F1DB8D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1AE:
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B0
; Address: $F1DC1C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B0:
    JSR $6000            ; 20 00 60 | Jump to subroutine
    ASL $130B            ; 0E 0B 13 | Arithmetic shift left (absolute)
    ORA $17              ; 05 17 | Logical OR with accumulator (zero page)
    ASL $000E            ; 0E 0E 00 | Arithmetic shift left (absolute)
    ORA $0900            ; 0D 00 09 | Logical OR with accumulator (absolute)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B2
; Address: $F1DC5E
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BRA $80              ; 80 80 | Branch always
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    BIT $0000            ; 2C 00 00 | Test bits in accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    PHP                  ; 08 | Push processor status to stack
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    AND $2C10,Y          ; 39 10 2C | Logical AND with accumulator (absolute,Y)
    BPL $16              ; 10 16 | Branch if positive
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    ASL $7340            ; 0E 40 73 | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA ($C5,X)          ; 01 C5 | Logical OR with accumulator ((zero page,X))
    BRA $25              ; 80 25 | Branch always
    WDM #$17             ; 42 17 | Reserved instruction
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $6904,X          ; 1D 04 69 | Logical OR with accumulator (absolute,X)
    REP #$00             ; C2 00 | Reset processor status bits
    CPX #$00             ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B4
; Address: $F1DCBC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B4:
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    STZ $00              ; 64 00 | Store zero to zero page
    BPL $A5              ; 10 A5 | Branch if positive
    ORA ($2A,X)          ; 01 2A | Logical OR with accumulator ((zero page,X))
    LDY #$D1             ; A0 D1 | Load immediate value into Y register
    STA ($A2,X)          ; 81 A2 | Store accumulator to (zero page,X)
    SBC $0018,X          ; FD 18 00 | Subtract with carry (absolute,X)
    ORA ($00),Y          ; 11 00 | Logical OR with accumulator ((zero page),Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B5
; Address: $F1DCDA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B5:
    JSR $4100            ; 20 00 41 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B6
; Address: $F1DCE9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B6:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    LDY #$A4             ; A0 A4 | Load immediate value into Y register
    LDY $00C0,X          ; BC C0 00 | Load from absolute,X into Y register
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B7
; Address: $F1DCFA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B7:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    ORA ($23,X)          ; 01 23 | Logical OR with accumulator ((zero page,X))
    ADC ($20),Y          ; 71 20 | Add with carry ((zero page),Y)
    PHA                  ; 48 | Push accumulator to stack
    BMI $00              ; 30 00 | Branch if negative
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ADC $0000,Y          ; 79 00 00 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B8
; Address: $F1DD12
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B8:
    JSR $3000            ; 20 00 30 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $80              ; 10 80 | Branch if positive
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    PLP                  ; 28 | Pull processor status from stack
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt
    ROL $0008            ; 2E 08 00 | Rotate left (absolute)
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    BPL $10              ; 10 10 | Branch if positive
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1B9
; Address: $F1DD6A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1B9:
    JSR $0050            ; 20 50 00 | Jump to subroutine
    CPY #$A4             ; C0 A4 | Compare Y register (immediate)
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1BC
; Address: $F1DD80
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1BC:
    JSR $5020            ; 20 20 50 | Jump to subroutine
    BVC $21              ; 50 21 | PPU graphics register access
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $6C1F,X          ; 1D 1F 6C | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1BD
; Address: $F1DD90
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1BD:
    JSR $7000            ; 20 00 70 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1BF
; Address: $F1DDA2
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1BF:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    STA ($9E,X)          ; 81 9E | Store accumulator to (zero page,X)
    ORA $2E71            ; 0D 71 2E | Logical OR with accumulator (absolute)
    BVC $1F              ; 50 1F | Branch if overflow clear
    CPX $FB              ; E4 FB | Compare X register (zero page)
    BVS $00              ; 70 00 | Branch if overflow set
    ASL $7000,X          ; 1E 00 70 | Arithmetic shift left (absolute,X)
    CPX $00              ; E4 00 | Compare X register (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLC                  ; 18 | Clear carry flag
    BPL $40              ; 10 40 | Branch if positive
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BMI $BC              ; 30 BC | Branch if negative
    STY $E367            ; 8C 67 E3 | Store Y register to absolute address
    CLC                  ; 18 | Clear carry flag
    SED                  ; F8 | Set decimal mode flag
    LDA                  ; BF 24 00 10 | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    CPX #$60             ; E0 60 | Compare X register (immediate)
    RTI                  ; 40 | Return from interrupt
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    INX                  ; E8 | Increment X register
    SEP #$6C             ; E2 6C | Set processor status bits
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    BVS $70              ; 70 70 | Branch if overflow set
    STA $6300,X          ; 9D 00 63 | Store accumulator to absolute,X
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    CPX $4F              ; E4 4F | Compare X register (zero page)
    JMP $904F            ; 4C 4F 90 | Jump to address
    STA                  ; 9F 30 37 C3 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C0
; Address: $F1DE2C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C0:
    BEQ $B0              ; F0 B0 | Branch if equal
    BCS $00              ; B0 00 | Branch if carry set
    BCS $00              ; B0 00 | Branch if carry set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C1
; Address: $F1DE36
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C1:
    INY                  ; C8 | Increment Y register
    BCS $00              ; B0 00 | Branch if carry set
    SBC $49              ; E5 49 | Subtract with carry (zero page)
    CMP $2C              ; C5 2C | Compare accumulator (zero page)
    CPX #$42             ; E0 42 | Hardware register operation
    STZ $60FC            ; 9C FC 60 | Store zero to absolute
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C2
; Address: $F1DE50
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C2:
    INC                  ; 1A | Increment accumulator
    ROL $1F00,X          ; 3E 00 1F | Rotate left (absolute,X)
    LDY $C300,X          ; BC 00 C3 | Load from absolute,X into Y register
    STZ $6000            ; 9C 00 60 | Store zero to absolute
    PLY                  ; 7A | Pull Y register from stack
    ROR $F0B0,X          ; 7E B0 F0 | Rotate right (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    BVS $F0              ; 70 F0 | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BMI $00              ; 30 00 | Branch if negative
    INY                  ; C8 | Increment Y register
    BVS $00              ; 70 00 | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    INY                  ; C8 | Increment Y register
    CPY $68              ; C4 68 | Compare Y register (zero page)
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($1F),Y          ; 11 1F | Logical OR with accumulator ((zero page),Y)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLV                  ; B8 | Clear overflow flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C3
; Address: $F1DE94
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C3:
    BPL $00              ; 10 00 | Branch if positive
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND $0F04,Y          ; 39 04 0F | Logical AND with accumulator (absolute,Y)
    AND ($30,X)          ; 21 30 | Logical AND with accumulator ((zero page,X))
    ADC ($CC),Y          ; 71 CC | Add with carry ((zero page),Y)
    CPY $F838            ; CC 38 F8 | Compare Y register (absolute)
    BEQ $F0              ; F0 F0 | Branch if equal
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    BEQ $00              ; F0 00 | Branch if equal
    LDY #$F0             ; A0 F0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C4
; Address: $F1DEC4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C4:
    JSR $40EC            ; 20 EC 40 | Jump to subroutine
    BMI $38              ; 30 38 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C7
; Address: $F1DED6
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C7:
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C8
; Address: $F1DEE2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C8:
    INY                  ; C8 | Increment Y register
    SED                  ; F8 | Set decimal mode flag
    CPY $0C              ; C4 0C | Compare Y register (zero page)
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    PHP                  ; 08 | Push processor status to stack
    PEA #$3800           ; F4 00 38 | Push effective address to stack
    BRA $00              ; 80 00 | Branch always
    TAX                  ; AA | Transfer accumulator to X register
    CPX $5B6A            ; EC 6A 5B | Compare X register (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1C9
; Address: $F1DF16
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1C9:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $DF              ; 70 DF | Branch if overflow set
    LDA                  ; BF A0 4C 9C | Load from absolute long,X into accumulator
    LDA                  ; BF BF 00 FF | Load from absolute long,X into accumulator
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ASL $E3EC,X          ; 1E EC E3 | Arithmetic shift left (absolute,X)
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CLC                  ; 18 | Clear carry flag
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    DEC                  ; 3A | Decrement accumulator
    CPY $F8              ; C4 F8 | Compare Y register (zero page)
    CLC                  ; 18 | Clear carry flag
    BEQ $E0              ; F0 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BPL $00              ; 10 00 | Branch if positive
    BRA $00              ; 80 00 | Branch always
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA $12              ; 05 12 | Logical OR with accumulator (zero page)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BMI $D0              ; 30 D0 | Branch if negative
    PLP                  ; 28 | Pull processor status from stack
    CPX #$18             ; E0 18 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1CA
; Address: $F1E003
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1CA:
    JSL $052700          ; 22 00 27 05 | Jump to subroutine long
    SEC                  ; 38 | Set carry flag
    ORA $1A00,X          ; 1D 00 1A | Logical OR with accumulator (absolute,X)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    JMP $E408            ; 4C 08 E4 | Jump to address
    LDY $C4E0            ; AC E0 C4 | Load from absolute address into Y register
    SEP #$34             ; E2 34 | Set processor status bits
    SED                  ; F8 | Set decimal mode flag
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag
    JMP $001C00          ; 5C 00 1C 00 | Jump to address long
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    ASL $0810            ; 0E 10 08 | Arithmetic shift left (absolute)
    PHP                  ; 08 | Push processor status to stack
    ORA $0F17            ; 0D 17 0F | Logical OR with accumulator (absolute)
    ORA $0A00            ; 0D 00 0A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    CPY #$20             ; C0 20 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1CC
; Address: $F1E068
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1CC:
    JSR $60D0            ; 20 D0 60 | Jump to subroutine
    BNE $90              ; D0 90 | Branch if not equal
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $C8              ; 90 C8 | Branch if carry clear
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1CE
; Address: $F1E07E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1CE:
    BMI $00              ; 30 00 | Branch if negative
    JMP ($28CF)          ; 6C CF 28 | Jump to address (absolute indirect)
    STA $308F28          ; 8F 28 8F 30 | Store accumulator to absolute long address
    STA                  ; 9F 10 9F 10 | Store accumulator to absolute long,X
    STA                  ; 9F 20 AF 48 | Store accumulator to absolute long,X
    BMI $00              ; 30 00 | Branch if negative
    BVS $00              ; 70 00 | Branch if overflow set
    BVS $00              ; 70 00 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1D1
; Address: $F1E09C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1D1:
    BVC $00              ; 50 00 | Branch if overflow clear
    BMI $00              ; 30 00 | Branch if negative
    SBC $FD1C,X          ; FD 1C FD | Subtract with carry (absolute,X)
    SBC $FD04,X          ; FD 04 FD | Subtract with carry (absolute,X)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BIT $086F            ; 2C 6F 08 | Test bits in accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    BVC $C8              ; 50 C8 | Branch if overflow clear
    CPX #$E8             ; E0 E8 | Compare X register (immediate)
    BEQ $E8              ; F0 E8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $E470            ; EC 70 E4 | Compare X register (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1D2
; Address: $F1E0EB
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1D2:
    CPX $20              ; E4 20 | Compare X register (zero page)
    CPX $20              ; E4 20 | Compare X register (zero page)
    CPX $30              ; E4 30 | Compare X register (zero page)
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $4C              ; F0 4C | Branch if equal
    BMI $3F              ; 30 3F | Branch if negative
    DEY                  ; 88 | Decrement Y register
    STA $004300          ; 8F 00 43 00 | Store accumulator to absolute long address
    BMI $00              ; 30 00 | Branch if negative
    CMP $C7              ; C5 C7 | Compare accumulator (zero page)
    STA $620F            ; 8D 0F 62 | Store accumulator to absolute address
    ROR $FC0C,X          ; 7E 0C FC | Rotate right (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    AND $F100,Y          ; 39 00 F1 | Logical AND with accumulator (absolute,Y)
    BEQ $00              ; F0 00 | Branch if equal
    BPL $5F              ; 10 5F | Branch if positive
    BPL $5F              ; 10 5F | Branch if positive
    BPL $5F              ; 10 5F | Branch if positive
    BVC $5F              ; 50 5F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1D3
; Address: $F1E148
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1D3:
    BVC $5F              ; 50 5F | Branch if overflow clear
    PHA                  ; 48 | Push accumulator to stack
    PLA                  ; 68 | Pull accumulator from stack
    ROR $67              ; 66 67 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1D6
; Address: $F1E15A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1D6:
    BVS $00              ; 70 00 | Branch if overflow set
    BVC $00              ; 50 00 | Branch if overflow clear
    CLI                  ; 58 | Clear interrupt disable flag
    CPX $08              ; E4 08 | Compare X register (zero page)
    CPX $EC08            ; EC 08 EC | Compare X register (absolute)
    CLC                  ; 18 | Clear carry flag
    BPL $FC              ; 10 FC | Branch if positive
    BMI $FC              ; 30 FC | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    BIT $00              ; 24 00 | Test bits in accumulator (zero page)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1D7
; Address: $F1E182
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1D7:
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    PHA                  ; 48 | Push accumulator to stack
    SEI                  ; 78 | Set interrupt disable flag
    BMI $F0              ; 30 F0 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    INY                  ; C8 | Increment Y register
    DEY                  ; 88 | Decrement Y register
    BMI $00              ; 30 00 | Branch if negative
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    INX                  ; E8 | Increment X register
    INY                  ; C8 | Increment Y register
    TYA                  ; 98 | Transfer Y register to accumulator
    INC $FF92,X          ; FE 92 FF | Increment (absolute,X)
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1D8
; Address: $F1E1F5
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1D8:
    TAY                  ; A8 | Transfer accumulator to Y register
    DEY                  ; 88 | Decrement Y register
    BCC $6E              ; 90 6E | Branch if carry clear
    SBC $DD22            ; ED 22 DD | Subtract with carry (absolute)
    BIT $DB              ; 24 DB | Test bits in accumulator (zero page)
    ASL $7F1E,X          ; 1E 1E 7F | Arithmetic shift left (absolute,X)
    ASL $7F00,X          ; 1E 00 7F | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    ASL $0F07            ; 0E 07 0F | Arithmetic shift left (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $00              ; 30 00 | Branch if negative
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $90              ; F0 90 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BIT $4CF8            ; 2C F8 4C | Test bits in accumulator (absolute)
    SED                  ; F8 | Set decimal mode flag
    STY $CCF8            ; 8C F8 CC | Store Y register to absolute address
    SEC                  ; 38 | Set carry flag
    ASL $0E              ; 06 0E | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PLP                  ; 28 | Pull processor status from stack
    STZ $3F              ; 64 3F | Store zero to zero page
    SEI                  ; 78 | Set interrupt disable flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    BMI $F2              ; 30 F2 | Branch if negative
    STY $F8              ; 84 F8 | Store Y register to zero page
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $30              ; F0 30 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    BPL $04              ; 10 04 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $21              ; 05 21 | PPU graphics register access
    ASL $34              ; 06 34 | Arithmetic shift left (zero page)
    INC $FE64,X          ; FE 64 FE | Increment (absolute,X)
    JMP ($6CFE)          ; 6C FE 6C | Jump to address (absolute indirect)
    INC $FCE8,X          ; FE E8 FC | Increment (absolute,X)
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1D9
; Address: $F1E2EC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1D9:
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BIT $DA              ; 24 DA | Test bits in accumulator (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    PHP                  ; 08 | Push processor status to stack
    PEA #$FC00           ; F4 00 FC | Push effective address to stack
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    JMP ($1E3F)          ; 6C 3F 1E | Jump to address (absolute indirect)
    AND $7D3F,X          ; 3D 3F 7D | Logical AND with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BMI $37              ; 30 37 | Branch if negative
    ADC ($7E),Y          ; 71 7E | Add with carry ((zero page),Y)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1DA
; Address: $F1E31C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1DA:
    ASL $3E              ; 06 3E | Arithmetic shift left (zero page)
    ASL $7C7E            ; 0E 7E 7C | Arithmetic shift left (absolute)
    INC $FCF8,X          ; FE F8 FC | Increment (absolute,X)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    INC $E418,X          ; FE 18 E4 | Increment (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1DB
; Address: $F1E335
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1DB:
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $60              ; 80 60 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    DEC                  ; 3A | Decrement accumulator
    ORA $0A06            ; 0D 06 0A | Logical OR with accumulator (absolute)
    PHP                  ; 08 | Push processor status to stack
    ASL $0A              ; 06 0A | Arithmetic shift left (zero page)
    ASL $93              ; 06 93 | Arithmetic shift left (zero page)
    STA $00DFF9          ; 8F F9 DF 00 | Store accumulator to absolute long address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FE7D,X          ; FE 7D FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    INC $00FF,X          ; FE FF 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1DE
; Address: $F1E3A7
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1DE:
    CPY #$A0             ; C0 A0 | Compare Y register (immediate)
    CPY #$90             ; C0 90 | Compare Y register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$7F             ; E0 7F | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PHP                  ; 08 | Push processor status to stack
    SEC                  ; 38 | Set carry flag
    PHP                  ; 08 | Push processor status to stack
    BMI $00              ; 30 00 | Branch if negative
    BPL $0A              ; 10 0A | Branch if positive
    ASL $0B07            ; 0E 07 0B | Arithmetic shift left (absolute)
    ORA #$07             ; 09 07 | Logical OR with accumulator (immediate)
    CMP ($C4,X)          ; C1 C4 | Compare accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($FF,X)          ; 01 FF | Logical OR with accumulator ((zero page,X))
    JMP ($82EF)          ; 6C EF 82 | Jump to address (absolute indirect)
    DEC $C7              ; C6 C7 | Decrement (zero page)
    BPL $00              ; 10 00 | Branch if positive
    SEC                  ; 38 | Set carry flag
    ORA ($A3),Y          ; 11 A3 | Logical OR with accumulator ((zero page),Y)
    CPX #$C1             ; E0 C1 | Compare X register (immediate)
    LDY #$C0             ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1DF
; Address: $F1E426
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1DF:
    JSR $40C0            ; 20 C0 40 | Jump to subroutine
    BRA $40              ; 80 40 | Branch always
    BRA $80              ; 80 80 | Branch always
    LSR $8E              ; 46 8E | Logical shift right (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $F8              ; F0 F8 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E0
; Address: $F1E443
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E0:
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $60              ; F0 60 | Branch if equal
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCS $40              ; B0 40 | Branch if carry set
    BCS $40              ; B0 40 | Branch if carry set
    BCS $40              ; B0 40 | Branch if carry set
    BCS $40              ; B0 40 | Branch if carry set
    BCS $40              ; B0 40 | Branch if carry set
    BMI $40              ; 30 40 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    ORA ($27,X)          ; 01 27 | Logical OR with accumulator ((zero page,X))
    ASL $3E1C,X          ; 1E 1C 3E | Arithmetic shift left (absolute,X)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    ASL $07              ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E1
; Address: $F1E478
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E1:
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA $3A04,X          ; 1D 04 3A | Logical OR with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    SBC ($C1,X)          ; E1 C1 | Subtract with carry ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    BIT $40DC            ; 2C DC 40 | Test bits in accumulator (absolute)
    LDY #$40             ; A0 40 | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BPL $30              ; 10 30 | Branch if positive
    ORA $000D            ; 0D 0D 00 | Logical OR with accumulator (absolute)
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    BCS $CF              ; B0 CF | Branch if carry set
    STA $02              ; 85 02 | Store accumulator to zero page
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    ADC ($FF,X)          ; 61 FF | Add with carry ((zero page,X))
    LDY $FEE1,X          ; BC E1 FE | Load from absolute,X into Y register
    WDM #$FC             ; 42 FC | Reserved instruction
    STY $7070            ; 8C 70 70 | Store Y register to absolute address
    ROR $747E,X          ; 7E 7E 74 | Rotate right (absolute,X)
    ASL $16              ; 06 16 | Arithmetic shift left (zero page)
    ORA #$00             ; 09 00 | Logical OR with accumulator (immediate)
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    ASL $0F07            ; 0E 07 0F | Arithmetic shift left (absolute)
    CPY #$81             ; C0 81 | Compare Y register (immediate)
    LDY #$E1             ; A0 E1 | Load immediate value into Y register
    BVS $40              ; 70 40 | Branch if overflow set
    BPL $60              ; 10 60 | Branch if positive
    BMI $60              ; 30 60 | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E2
; Address: $F1E59A
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BIT $F3              ; 24 F3 | Test bits in accumulator (zero page)
    AND $4DFA            ; 2D FA 4D | Logical AND with accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    STA $CFFA            ; 8D FA CF | Store accumulator to absolute address
    BMI $3B              ; 30 3B | Branch if negative
    EOR $003E,X          ; 5D 3E 00 | Exclusive OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BPL $FF              ; 10 FF | Branch if positive
    AND $7CEF,Y          ; 39 EF 7C | Logical AND with accumulator (absolute,Y)
    DEC $FF              ; C6 FF | Decrement (zero page)
    JMP ($C639)          ; 6C 39 C6 | Jump to address (absolute indirect)
    SEC                  ; 38 | Set carry flag
    DEC $00              ; C6 00 | Decrement (zero page)
    PHA                  ; 48 | Push accumulator to stack
    STA                  ; 9F 53 BF 68 | Store accumulator to absolute long,X
    LDA                  ; BF 64 BF 62 | Load from absolute long,X into accumulator
    LDA                  ; BF E7 19 99 | Load from absolute long,X into accumulator
    ADC $00EB            ; 6D EB 00 | Add with carry (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E3
; Address: $F1E602
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E3:
    CPY $F8              ; C4 F8 | Compare Y register (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    BEQ $D0              ; F0 D0 | Branch if equal
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $4C              ; 80 4C | Branch always
    BMI $80              ; 30 80 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E4
; Address: $F1E614
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E4:
    BRA $60              ; 80 60 | Branch always
    BRA $60              ; 80 60 | Branch always
    BRA $60              ; 80 60 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CLC                  ; 18 | Clear carry flag
    AND ($7B),Y          ; 31 7B | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $6B              ; 10 6B | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E5
; Address: $F1E640
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E5:
    ASL $FEFF            ; 0E FF FE | Arithmetic shift left (absolute)
    INC $3EFF,X          ; FE FF 3E | Increment (absolute,X)
    ROR $EEFF,X          ; 7E FF EE | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E6
; Address: $F1E64C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E6:
    DEC $0CFF            ; CE FF 0C | Decrement (absolute)
    DEC $F50A,X          ; DE 0A F5 | Decrement (absolute,X)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    REP #$3D             ; C2 3D | Reset processor status bits

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E7
; Address: $F1E656
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E7:
    JSR $00DF            ; 20 DF 00 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    DEC $0100,X          ; DE 00 01 | Decrement (absolute,X)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E8
; Address: $F1E6A2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E8:
    CPY #$60             ; C0 60 | Compare Y register (immediate)
    CPY #$61             ; C0 61 | Compare Y register (immediate)
    ADC ($3F,X)          ; 61 3F | Add with carry ((zero page,X))
    ASL $001E,X          ; 1E 1E 00 | Arithmetic shift left (absolute,X)
    PLP                  ; 28 | Pull processor status from stack
    BPL $50              ; 10 50 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1E9
; Address: $F1E6C3
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1E9:
    JSR $C020            ; 20 20 C0 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $80              ; 80 80 | Branch always
    ADC ($30,X)          ; 61 30 | Add with carry ((zero page,X))
    ORA $1B37,Y          ; 19 37 1B | Logical OR with accumulator (absolute,Y)
    ROL $1B              ; 26 1B | Rotate left (zero page)
    ORA $060D            ; 0D 0D 06 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    DEX                  ; CA | Decrement X register
    EOR ($8F),Y          ; 51 8F | Exclusive OR with accumulator ((zero page),Y)
    DEY                  ; 88 | Decrement Y register
    STA $C10000          ; 8F 00 00 C1 | Store accumulator to absolute long address
    CPY #$E1             ; C0 E1 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1EA
; Address: $F1E721
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1EA:
    ORA ($92,X)          ; 01 92 | Logical OR with accumulator ((zero page,X))
    ORA ($82,X)          ; 01 82 | Logical OR with accumulator ((zero page,X))
    ORA ($46,X)          ; 01 46 | Logical OR with accumulator ((zero page,X))
    STA ($BC,X)          ; 81 BC | Store accumulator to (zero page,X)
    CLC                  ; 18 | Clear carry flag
    ADC $7C00,X          ; 7D 00 7C | Add with carry (absolute,X)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    SEC                  ; 38 | Set carry flag
    AND #$DF             ; 29 DF | Logical AND with accumulator (immediate)
    CMP $E19E,X          ; DD 9E E1 | Compare accumulator (absolute,X)
    STA ($E3),Y          ; 91 E3 | Store accumulator to (zero page),Y
    ORA ($E3),Y          ; 11 E3 | Logical OR with accumulator ((zero page),Y)
    AND ($C3,X)          ; 21 C3 | Logical AND with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA $E0              ; 05 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$06             ; C0 06 | Compare Y register (immediate)
    ASL $1C00,X          ; 1E 00 1C | Arithmetic shift left (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SBC $120C            ; ED 0C 12 | Subtract with carry (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BMI $78              ; 30 78 | Branch if negative
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1EB
; Address: $F1E7A5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1EB:
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1EC
; Address: $F1E7B4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1EC:
    JSR $40D0            ; 20 D0 40 | Jump to subroutine
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1ED
; Address: $F1E7C4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1ED:
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $E0              ; 80 E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$1C             ; C0 1C | Compare Y register (immediate)
    SBC #$1E             ; E9 1E | Subtract with carry (immediate)
    BIT $731F            ; 2C 1F 73 | Test bits in accumulator (absolute)
    ROR $307E,X          ; 7E 7E 30 | Rotate right (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    INC $0101,X          ; FE 01 01 | Increment (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1EE
; Address: $F1E846
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1EE:
    STA $797B,X          ; 9D 7B 79 | Store accumulator to absolute,X
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $FA              ; 05 FA | Logical OR with accumulator (zero page)
    SBC $FEF9,X          ; FD F9 FE | Subtract with carry (absolute,X)
    SBC $18FE,X          ; FD FE 18 | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1EF
; Address: $F1E879
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1EF:
    JSR $E000            ; 20 00 E0 | Game work RAM access
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC                  ; 3A | Decrement accumulator
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    STX $03              ; 86 03 | Store X register to zero page
    SED                  ; F8 | Set decimal mode flag
    STX $FD              ; 86 FD | Store X register to zero page
    ADC $FF              ; 65 FF | Add with carry (zero page)
    ADC ($DF,X)          ; 61 DF | Add with carry ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    SBC ($E0,X)          ; E1 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FE7D,X          ; FE 7D FE | Increment (absolute,X)
    INC $FFFF,X          ; FE FF FF | Increment (absolute,X)
    SBC $00FF,X          ; FD FF 00 | Subtract with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    TYA                  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F1
; Address: $F1E922
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F1:
    LSR $C0              ; 46 C0 | Logical shift right (zero page)
    STA $EE19C6          ; 8F C6 19 EE | Store accumulator to absolute long address
    ADC $79EE,Y          ; 79 EE 79 | Add with carry (absolute,Y)
    INC $FCFA,X          ; FE FA FC | Increment (absolute,X)
    TSX                  ; BA | Transfer stack pointer to X register
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ROL $3E3E,X          ; 3E 3E 3E | Rotate left (absolute,X)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    ASL $2100,X          ; 1E 00 21 | PPU graphics register access
    ASL $0400,X          ; 1E 00 04 | Arithmetic shift left (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ROL $2060,X          ; 3E 60 20 | Rotate left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F2
; Address: $F1E97A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F2:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    CPY #$E0             ; C0 E0 | Game work RAM access
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F3
; Address: $F1E983
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F3:
    BEQ $20              ; F0 20 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BCC $F8              ; 90 F8 | Branch if carry clear
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $3830            ; CC 30 38 | Compare Y register (absolute)
    ASL $3F5C            ; 0E 5C 3F | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F4
; Address: $F1E9A8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F4:
    JSL $FF617F          ; 22 7F 61 FF | Jump to subroutine long
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    EOR $00FF            ; 4D FF 00 | Exclusive OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $A0              ; 80 A0 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F5
; Address: $F1E9C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F5:
    BEQ $00              ; F0 00 | Branch if equal
    BNE $00              ; D0 00 | Branch if not equal
    INX                  ; E8 | Increment X register
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F6
; Address: $F1E9DA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F6:
    JSR $1000            ; 20 00 10 | Jump to subroutine
    SBC $AD52            ; ED 52 AD | Subtract with carry (absolute)
    LDA $0F07            ; AD 07 0F | Load from absolute address into accumulator
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always
    BRA $C0              ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F7
; Address: $F1EA2C
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F7:
    BRA $C0              ; 80 C0 | Branch always
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$01             ; E0 01 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    DEC $01              ; C6 01 | Decrement (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BRA $80              ; 80 80 | Branch always
    CLC                  ; 18 | Clear carry flag
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    DEC                  ; 3A | Decrement accumulator
    CPY $00CC            ; CC CC 00 | Compare Y register (absolute)
    ASL $0C1E,X          ; 1E 1E 0C | Arithmetic shift left (absolute,X)
    ORA $0E              ; 05 0E | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    BRA $20              ; 80 20 | Branch always
    BRA $20              ; 80 20 | Branch always
    CPX #$40             ; E0 40 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    SED                  ; F8 | Set decimal mode flag
    ROR $7E9A,X          ; 7E 9A 7E | Rotate right (absolute,X)
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)
    PHP                  ; 08 | Push processor status to stack
    BMI $30              ; 30 30 | Branch if negative
    SBC $F9F8,Y          ; F9 F8 F9 | Subtract with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F8
; Address: $F1EB17
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F8:
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SEI                  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1F9
; Address: $F1EB1A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1F9:
    JSR $0020            ; 20 20 00 | Jump to subroutine
    INC $FEFF,X          ; FE FF FE | Increment (absolute,X)
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)
    ADC $0000,X          ; 7D 00 00 | Add with carry (absolute,X)
    LDA                  ; BF E4 20 C0 | Load from absolute long,X into accumulator
    BCS $C0              ; B0 C0 | Branch if carry set
    BCC $E0              ; 90 E0 | Game work RAM access
    BCC $E0              ; 90 E0 | Game work RAM access
    BPL $E0              ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1FA
; Address: $F1EB4C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1FA:
    JSR $50C0            ; 20 C0 50 | Jump to subroutine
    CPX #$00             ; E0 00 | Compare X register (immediate)
    EOR #$FF             ; 49 FF | Exclusive OR with accumulator (immediate)
    ADC #$FF             ; 69 FF | Add with carry (immediate)
    ADC $64FF            ; 6D FF 64 | Add with carry (absolute)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    EOR #$B6             ; 49 B6 | Exclusive OR with accumulator (immediate)
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)
    BIT $5B              ; 24 5B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1FB
; Address: $F1EB9C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1FB:
    JSR $105F            ; 20 5F 10 | Jump to subroutine
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $00              ; F0 00 | Branch if equal
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $60              ; 80 60 | Branch always
    BRA $60              ; 80 60 | Branch always
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $07              ; F0 07 | Branch if equal
    ORA $193F,X          ; 1D 3F 19 | Logical OR with accumulator (absolute,X)
    ORA $073F,Y          ; 19 3F 07 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    BPL $08              ; 10 08 | Branch if positive
    ASL $39              ; 06 39 | Arithmetic shift left (zero page)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1FC
; Address: $F1EBEC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1FC:
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    BPL $E8              ; 10 E8 | Branch if positive
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1FD
; Address: $F1EBF9
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1FD:
    STZ $DC20            ; 9C 20 DC | Store zero to absolute
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ASL $0C              ; 06 0C | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    AND ($C0,X)          ; 21 C0 | Logical AND with accumulator ((zero page,X))
    STA                  ; 9F 61 67 1F | Store accumulator to absolute long,X
    LDA #$DE             ; A9 DE | Load immediate value into accumulator
    CPX $731F            ; EC 1F 73 | Compare X register (absolute)
    ROR $307E,X          ; 7E 7E 30 | Rotate right (absolute,X)
    BMI $00              ; 30 00 | Branch if negative
    BVS $E0              ; 70 E0 | Game work RAM access
    PLP                  ; 28 | Pull processor status from stack
    BEQ $68              ; F0 68 | Branch if equal
    BEQ $9C              ; F0 9C | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BPL $2F              ; 10 2F | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BVS $F8              ; 70 F8 | Branch if overflow set
    BMI $78              ; 30 78 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$80             ; E0 80 | Compare X register (immediate)
    BVS $40              ; 70 40 | Branch if overflow set
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1FE
; Address: $F1ECDA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1FE:
    JSR $1058            ; 20 58 10 | Jump to subroutine
    BIT $2C10            ; 2C 10 2C | Test bits in accumulator (absolute)
    ORA $193F,Y          ; 19 3F 19 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_1FF
; Address: $F1ECE4
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_1FF:
    ORA $193F,Y          ; 19 3F 19 | Logical OR with accumulator (absolute,Y)
    ORA $193F,Y          ; 19 3F 19 | Logical OR with accumulator (absolute,Y)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA #$1F             ; 09 1F | Logical OR with accumulator (immediate)
    ORA #$16             ; 09 16 | Logical OR with accumulator (immediate)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BCC $F8              ; 90 F8 | Branch if carry clear
    BCC $F8              ; 90 F8 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    BCC $68              ; 90 68 | Branch if carry clear
    ASL $3110,X          ; 1E 10 31 | Arithmetic shift left (absolute,X)
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $0100            ; 0E 00 01 | Arithmetic shift left (absolute)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    BEQ $7F              ; F0 7F | Branch if equal
    ASL $0C1C            ; 0E 1C 0C | Arithmetic shift left (absolute)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_200
; Address: $F1ED86
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_200:
    RTI                  ; 40 | Return from interrupt
    BNE $30              ; D0 30 | Branch if not equal
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_202
; Address: $F1ED96
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_202:
    JSR $4000            ; 20 00 40 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    ADC $7D24,X          ; 7D 24 7D | Add with carry (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_203
; Address: $F1EDAF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_203:
    SBC $0000,X          ; FD 00 00 | Subtract with carry (absolute,X)
    ASL $1E0C,X          ; 1E 0C 1E | Arithmetic shift left (absolute,X)
    ASL $061F            ; 0E 1F 06 | Arithmetic shift left (absolute)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_204
; Address: $F1EDD4
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_204:
    PHP                  ; 08 | Push processor status to stack
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    CLC                  ; 18 | Clear carry flag
    ROL $1F0E,X          ; 3E 0E 1F | Rotate left (absolute,X)
    AND ($7F),Y          ; 31 7F | Logical AND with accumulator ((zero page),Y)
    SEC                  ; 38 | Set carry flag
    BPL $2E              ; 10 2E | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    AND ($5E,X)          ; 21 5E | Logical AND with accumulator ((zero page,X))
    BPL $2F              ; 10 2F | Branch if positive
    WDM #$AD             ; 42 AD | Reserved instruction
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $70              ; F0 70 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SEI                  ; 78 | Set interrupt disable flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    ORA ($08,X)          ; 01 08 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA $7B              ; 05 7B | Logical OR with accumulator (zero page)
    ASL $F98D            ; 0E 8D F9 | Arithmetic shift left (absolute)
    DEC $C5              ; C6 C5 | Decrement (zero page)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BVS $00              ; 70 00 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ASL $92              ; 06 92 | Arithmetic shift left (zero page)
    ASL $0F13            ; 0E 13 0F | Arithmetic shift left (absolute)
    CMP $8007,Y          ; D9 07 80 | Compare accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $F8FF,X          ; FE FF F8 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_205
; Address: $F1EEC0
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_205:
    LSR                  ; 4A | Logical shift right (accumulator)
    LDX $22E2,Y          ; BE E2 22 | Load from absolute,Y into X register
    CPY #$B3             ; C0 B3 | Compare Y register (immediate)
    CMP ($91,X)          ; C1 91 | Compare accumulator ((zero page,X))
    CPX #$91             ; E0 91 | Compare X register (immediate)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    ORA $03              ; 05 03 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$D0             ; E0 D0 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_206
; Address: $F1EF27
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_206:
    BCS $F0              ; B0 F0 | Branch if carry set
    SEI                  ; 78 | Set interrupt disable flag
    BVS $F8              ; 70 F8 | Branch if overflow set
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    CLV                  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_207
; Address: $F1EF3C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_207:
    JSR $205C            ; 20 5C 20 | Jump to subroutine
    JMP $38FB60          ; 5C 60 FB 38 | Jump to address long
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank62_DmaFunction_208
; Address: $F1EF52
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_208:
    JSR $185F            ; 20 5F 18 | Jump to subroutine
    ASL $19              ; 06 19 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    INC $FFF0,X          ; FE F0 FF | Increment (absolute,X)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA $30E3,X          ; 1D E3 30 | Logical OR with accumulator (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_20A
; Address: $F1EF7B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_20A:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BVS $88              ; 70 88 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_20B
; Address: $F1EF90
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_20B:
    BVS $F8              ; 70 F8 | Branch if overflow set
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    BVC $F0              ; 50 F0 | Branch if overflow clear
    STA                  ; 9F 60 60 00 | Store accumulator to absolute long,X
    ASL $FFFD,X          ; 1E FD FF | Arithmetic shift left (absolute,X)
    CMP $9BFF,Y          ; D9 FF 9B | Compare accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ASL $3EFF,X          ; 1E FF 3E | Arithmetic shift left (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BMI $CF              ; 30 CF | Branch if negative
    ASL $0031            ; 0E 31 00 | Arithmetic shift left (absolute)
    BRA $80              ; 80 80 | Branch always
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$0B             ; C0 0B | Compare Y register (immediate)
    PHB                  ; 8B | Push data bank register to stack
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $0404            ; 0E 04 04 | Arithmetic shift left (absolute)
    LSR $713F,X          ; 5E 3F 71 | Logical shift right (absolute,X)
    ROL $003C,X          ; 3E 3C 00 | Rotate left (absolute,X)
    ASL $7E1E,X          ; 1E 1E 7E | Arithmetic shift left (absolute,X)
    ROR $3030,X          ; 7E 30 30 | Rotate right (absolute,X)
    ADC $00FF,X          ; 7D FF 00 | Add with carry (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BEQ $E0              ; F0 E0 | Game work RAM access
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $F8              ; F0 F8 | Branch if equal
    BEQ $9C              ; F0 9C | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    BVS $70              ; 70 70 | Branch if overflow set
    BEQ $F0              ; F0 F0 | Branch if equal
    ROR $3F1E,X          ; 7E 1E 3F | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_20D
; Address: $F1F0B0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_20D:
    JSR $105E            ; 20 5E 10 | Jump to subroutine
    PHP                  ; 08 | Push processor status to stack
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    CPY #$40             ; C0 40 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BNE $A0              ; D0 A0 | Branch if not equal
    BVS $80              ; 70 80 | Branch if overflow set
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank62_DmaFunction_20E
; Address: $F1F0FA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_20E:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    BPL $00              ; 10 00 | Branch if positive
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    CLI                  ; 58 | Clear interrupt disable flag
    BIT $B8              ; 24 B8 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_211
; Address: $F1F13E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_211:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $01              ; 05 01 | Logical OR with accumulator (zero page)
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_213
; Address: $F1F1BC
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_213:
    JSR $20D0            ; 20 D0 20 | Jump to subroutine
    BNE $19              ; D0 19 | Branch if not equal
    ORA $1904,Y          ; 19 04 19 | Logical OR with accumulator (absolute,Y)
    ORA $1900,Y          ; 19 00 19 | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    BRA $68              ; 80 68 | Branch always
    BNE $74              ; D0 74 | Branch if not equal
    CPY #$74             ; C0 74 | Compare Y register (immediate)
    BRA $74              ; 80 74 | Branch always
    INY                  ; C8 | Increment Y register
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    BPL $00              ; 10 00 | Branch if positive
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCS $58              ; B0 58 | Branch if carry set
    BVS $18              ; 70 18 | Branch if overflow set
    BVS $18              ; 70 18 | Branch if overflow set
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_214
; Address: $F1F248
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_214:
    LDY #$C0             ; A0 C0 | Load immediate value into Y register
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVS $38              ; 70 38 | Branch if overflow set
    CLI                  ; 58 | Clear interrupt disable flag
    PHA                  ; 48 | Push accumulator to stack
    BIT $1C              ; 24 1C | Test bits in accumulator (zero page)
    ASL $1F23            ; 0E 23 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_215
; Address: $F1F26E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_215:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1E0D            ; 0E 0D 1E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_216
; Address: $F1F284
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_216:
    ORA #$FE             ; 09 FE | Logical OR with accumulator (immediate)
    SEC                  ; 38 | Set carry flag
    SEP #$FC             ; E2 FC | Set processor status bits
    BRA $00              ; 80 00 | Branch always
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    JMP $333E7A          ; 5C 7A 3E 33 | Jump to address long
    AND ($0F),Y          ; 31 0F | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_217
; Address: $F1F2AE
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_217:
    JSR $001F            ; 20 1F 00 | Jump to subroutine
    RTI                  ; 40 | Return from interrupt
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SBC ($60,X)          ; E1 60 | Subtract with carry ((zero page,X))
    ROR $1D15,X          ; 7E 15 1D | Rotate right (absolute,X)
    ROL $7C66,X          ; 3E 66 7C | Rotate left (absolute,X)
    DEC $F8              ; C6 F8 | Decrement (zero page)
    STA ($00,X)          ; 81 00 | Store accumulator to (zero page,X)
    SEP #$00             ; E2 00 | Set processor status bits
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $1D0F            ; 0D 0F 1D | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BEQ $E8              ; F0 E8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    CPX $AEFC            ; EC FC AE | Compare X register (absolute)
    DEC $EEFF            ; CE FF EE | Decrement (absolute)
    INC $CF              ; E6 CF | Increment (zero page)
    BEQ $E0              ; F0 E0 | Game work RAM access
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $70              ; F0 70 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_218
; Address: $F1F361
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_218:
    PHP                  ; 08 | Push processor status to stack
    INC                  ; 1A | Increment accumulator
    ASL $CD71            ; 0E 71 CD | Arithmetic shift left (absolute)
    ADC $DD              ; 65 DD | Add with carry (zero page)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    REP #$C0             ; C2 C0 | Reset processor status bits
    SEP #$E0             ; E2 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($FD,X)          ; 01 FD | Logical OR with accumulator ((zero page,X))
    SBC $F8FF,X          ; FD FF F8 | Subtract with carry (absolute,X)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    CLI                  ; 58 | Clear interrupt disable flag
    BRA $B4              ; 80 B4 | Branch always
    CLD                  ; D8 | Clear decimal mode flag
    EOR ($FE),Y          ; 51 FE | Exclusive OR with accumulator ((zero page),Y)
    ADC ($FE),Y          ; 71 FE | Add with carry ((zero page),Y)
    AND #$FE             ; 29 FE | Logical AND with accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ASL $3F1E,X          ; 1E 1E 3F | Arithmetic shift left (absolute,X)
    ROL $19              ; 26 19 | Rotate left (zero page)
    AND $1E06,Y          ; 39 06 1E | Logical AND with accumulator (absolute,Y)
    ORA ($0E,X)          ; 01 0E | Logical OR with accumulator ((zero page,X))
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA $0402            ; 0D 02 04 | Logical OR with accumulator (absolute)
    CPY $E47A            ; CC 7A E4 | Compare Y register (absolute)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    STZ $CE              ; 64 CE | Store zero to zero page
    BMI $3C              ; 30 3C | Branch if negative
    CPY #$B8             ; C0 B8 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    CLV                  ; B8 | Clear overflow flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank62_DmaFunction_219
; Address: $F1F3FB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_219:
    JSR $E010            ; 20 10 E0 | Game work RAM access
    CPX #$20             ; E0 20 | Compare X register (immediate)
    ROL $19              ; 26 19 | Rotate left (zero page)
    ASL $0601            ; 0E 01 06 | Arithmetic shift left (absolute)
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    ASL $0F00            ; 0E 00 0F | Arithmetic shift left (absolute)
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_21A
; Address: $F1F423
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_21A:
    CPY $B47A            ; CC 7A B4 | Compare Y register (absolute)
    PLX                  ; FA | Pull X register from stack
    STZ $EC              ; 64 EC | Store zero to zero page
    BPL $38              ; 10 38 | Branch if positive
    CPY #$B0             ; C0 B0 | Compare Y register (immediate)
    BCC $00              ; 90 00 | Branch if carry clear
    BMI $00              ; 30 00 | Branch if negative
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BNE $20              ; D0 20 | Branch if not equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BEQ $0F              ; F0 0F | Branch if equal
    ORA $1F0E,X          ; 1D 0E 1F | Logical OR with accumulator (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    CPY #$A6             ; C0 A6 | Compare Y register (immediate)
    CPY #$E0             ; C0 E0 | Game work RAM access
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    BEQ $F8              ; F0 F8 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    INC $E0C0,X          ; FE C0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    BMI $F0              ; 30 F0 | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    SED                  ; F8 | Set decimal mode flag
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    BMI $CE              ; 30 CE | Branch if negative
    PHP                  ; 08 | Push processor status to stack
    ORA $1828            ; 0D 28 18 | Logical OR with accumulator (absolute)
    BMI $18              ; 30 18 | Branch if negative
    BVC $10              ; 50 10 | Branch if overflow clear
    RTI                  ; 40 | Return from interrupt
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_21B
; Address: $F1F49C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_21B:
    JSR $2000            ; 20 00 20 | Jump to subroutine
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    STA $02              ; 85 02 | Store accumulator to zero page
    CMP $82              ; C5 82 | Compare accumulator (zero page)
    SBC $C2              ; E5 C2 | Subtract with carry (zero page)
    SBC $C2              ; E5 C2 | Subtract with carry (zero page)
    SBC $42              ; E5 42 | Hardware register operation
    ADC $02              ; 65 02 | Add with carry (zero page)
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    LDY #$DF             ; A0 DF | Load immediate value into Y register
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    BMI $FF              ; 30 FF | Branch if negative
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank62_DmaFunction_21C
; Address: $F1F520
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_21C:
    STX $7C              ; 86 7C | Store X register to zero page
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BCC $00              ; 90 00 | Branch if carry clear
    BCC $00              ; 90 00 | Branch if carry clear
    BPL $00              ; 10 00 | Branch if positive
    BMI $00              ; 30 00 | Branch if negative
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    BEQ $00              ; F0 00 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    ORA $1D08,X          ; 1D 08 1D | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA $0C00,X          ; 1D 00 0C | Logical OR with accumulator (absolute,X)
    ORA $1D00,X          ; 1D 00 1D | Logical OR with accumulator (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    CPY $CCFE            ; CC FE CC | Compare Y register (absolute)
    INC $FECC,X          ; FE CC FE | Increment (absolute,X)
    CPY $C4FE            ; CC FE C4 | Compare Y register (absolute)
    INC $EEC4            ; EE C4 EE | Increment (absolute)
    CPY $EE              ; C4 EE | Compare Y register (zero page)
    CPY $FE00            ; CC 00 FE | Compare Y register (absolute)
    INC $FE00,X          ; FE 00 FE | Increment (absolute,X)
    INC $EE00,X          ; FE 00 EE | Increment (absolute,X)
    INC $2AC4            ; EE C4 2A | Increment (absolute)
    CPY $6030            ; CC 30 60 | Compare Y register (absolute)
    BMI $60              ; 30 60 | Branch if negative
    BMI $60              ; 30 60 | Branch if negative
    BMI $60              ; 30 60 | Branch if negative
    CLC                  ; 18 | Clear carry flag
    BVS $3F              ; 70 3F | Branch if overflow set
    CLC                  ; 18 | Clear carry flag
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    PHP                  ; 08 | Push processor status to stack
    BIT $18              ; 24 18 | Test bits in accumulator (zero page)
    INY                  ; C8 | Increment Y register
    BMI $90              ; 30 90 | Branch if negative
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    BMI $7F              ; 30 7F | Branch if negative
    ASL $09              ; 06 09 | Arithmetic shift left (zero page)
    ORA ($1E,X)          ; 01 1E | Logical OR with accumulator ((zero page,X))
    BPL $2F              ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank62_DmaFunction_21D
; Address: $F1F61C
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_21D:
    JSR $185F            ; 20 5F 18 | Jump to subroutine
    BEQ $F0              ; F0 F0 | Branch if equal
    BEQ $C0              ; F0 C0 | Branch if equal
    SEC                  ; 38 | Set carry flag
    BRA $7F              ; 80 7F | Branch always
    BVS $8F              ; 70 8F | Branch if overflow set
    BRA $80              ; 80 80 | Branch always
    BRA $FF              ; 80 FF | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $7F              ; 80 7F | Branch always
    BRA $83              ; 80 83 | Branch always
    SED                  ; F8 | Set decimal mode flag
    BRA $03              ; 80 03 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$BF             ; C0 BF | Compare Y register (immediate)
    LDA                  ; BF 00 00 00 | Load from absolute long,X into accumulator
    BRA $80              ; 80 80 | Branch always
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    CPY #$FF             ; C0 FF | Compare Y register (immediate)
    INC $FEFC,X          ; FE FC FE | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    CLC                  ; 18 | Clear carry flag
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    INC $0001,X          ; FE 01 00 | Increment (absolute,X)
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ADC $070E,X          ; 7D 0E 07 | Add with carry (absolute,X)
    LDA                  ; BF C1 3F C0 | Load from absolute long,X into accumulator
    STA ($80,X)          ; 81 80 | Store accumulator to (zero page,X)
    DEC $C1E1,X          ; DE E1 C1 | Decrement (absolute,X)
    INC $C1C0,X          ; FE C0 C1 | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    SED                  ; F8 | Set decimal mode flag
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BMI $CC              ; 30 CC | Branch if negative
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($09,X)          ; 01 09 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR ($30,X)          ; 41 30 | Exclusive OR with accumulator ((zero page,X))
    BRA $08              ; 80 08 | Branch always
    BVS $24              ; 70 24 | Branch if overflow set
    ASL $00              ; 06 00 | Arithmetic shift left (zero page)
    BVS $00              ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_21E
; Address: $F1F79E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_21E:
    PHP                  ; 08 | Push processor status to stack
    CPX #$F8             ; E0 F8 | Compare X register (immediate)
    CLC                  ; 18 | Clear carry flag
    INC $FF32,X          ; FE 32 FF | Increment (absolute,X)
    CMP $FF              ; C5 FF | Compare accumulator (zero page)
    SBC #$1F             ; E9 1F | Subtract with carry (immediate)
    AND ($1F),Y          ; 31 1F | Logical AND with accumulator ((zero page),Y)
    AND $0006,Y          ; 39 06 00 | Logical AND with accumulator (absolute,Y)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    PLP                  ; 28 | Pull processor status from stack
    PHP                  ; 08 | Push processor status to stack
    ASL $081C            ; 0E 1C 08 | Arithmetic shift left (absolute)
    AND $3918            ; 2D 18 39 | Logical AND with accumulator (absolute)
    BPL $48              ; 10 48 | Branch if positive
    BMI $50              ; 30 50 | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_21F
; Address: $F1F7CF
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_21F:
    JSR $0004            ; 20 04 00 | Jump to subroutine
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($17,X)          ; 01 17 | Logical OR with accumulator ((zero page,X))
    LSR $EC3F,X          ; 5E 3F EC | Logical shift right (absolute,X)
    SEP #$FD             ; E2 FD | Set processor status bits
    XBA                  ; EB | Exchange accumulator bytes
    STZ $03              ; 64 03 | Store zero to zero page
    BEQ $F0              ; F0 F0 | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPX #$E0             ; E0 E0 | Game work RAM access
    BRA $FF              ; 80 FF | Branch always
    RTI                  ; 40 | Return from interrupt
    BVC $DF              ; 50 DF | Branch if overflow clear
    BVC $DF              ; 50 DF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_221
; Address: $F1F820
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_221:
    JSR $10C0            ; 20 C0 10 | Jump to subroutine
    CPX #$90             ; E0 90 | Compare X register (immediate)
    CPX #$C8             ; E0 C8 | Compare X register (immediate)
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $C8              ; F0 C8 | Branch if equal
    BEQ $88              ; F0 88 | Branch if equal
    BEQ $10              ; F0 10 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    ASL $0F              ; 06 0F | Arithmetic shift left (zero page)
    ASL $0C1F            ; 0E 1F 0C | Arithmetic shift left (absolute)
    AND $007E,Y          ; 39 7E 00 | Logical AND with accumulator (absolute,Y)
    BRA $00              ; 80 00 | Branch always
    BRA $80              ; 80 80 | Branch always
    BRA $00              ; 80 00 | Branch always
    BRA $00              ; 80 00 | Branch always
    BVC $20              ; 50 20 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank62_DmaFunction_223
; Address: $F1F885
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_223:
    JSR $112E            ; 20 2E 11 | Jump to subroutine
    ORA ($0F),Y          ; 11 0F | Logical OR with accumulator ((zero page),Y)
    ORA ($0F,X)          ; 01 0F | Logical OR with accumulator ((zero page,X))
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ADC $FB74,X          ; 7D 74 FB | Add with carry (absolute,X)
    CMP ($C2,X)          ; C1 C2 | Compare accumulator ((zero page,X))
    ORA ($07,X)          ; 01 07 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    BCC $EF              ; 90 EF | Branch if carry clear
    STA                  ; 9F E0 90 E0 | Store accumulator to absolute long,X
    BCC $E0              ; 90 E0 | Game work RAM access
    BCS $E0              ; B0 E0 | Game work RAM access
    CPX #$C0             ; E0 C0 | Compare X register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BEQ $F0              ; F0 F0 | Branch if equal
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    SEC                  ; 38 | Set carry flag
    BEQ $18              ; F0 18 | Branch if equal
    BEQ $9C              ; F0 9C | Branch if equal
    SEI                  ; 78 | Set interrupt disable flag
    STZ $4E78            ; 9C 78 4E | Store zero to absolute
    ROL $003F,X          ; 3E 3F 00 | Rotate left (absolute,X)
    ROR $3E7E,X          ; 7E 7E 3E | Rotate right (absolute,X)
    ROL $0000,X          ; 3E 00 00 | Rotate left (absolute,X)
    ADC $73FE,Y          ; 79 FE 73 | Add with carry (absolute,Y)
    SED                  ; F8 | Set decimal mode flag
    DEC $F8              ; C6 F8 | Decrement (zero page)
    STY $F870            ; 8C 70 F8 | Store Y register to absolute address
    BVS $00              ; 70 00 | Branch if overflow set
    BPL $10              ; 10 10 | Branch if positive
    BPL $00              ; 10 00 | Branch if positive
    STA $85              ; 85 85 | Store accumulator to zero page
    STA                  ; 9F 60 05 80 | Store accumulator to absolute long,X
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$3F             ; C0 3F | Compare Y register (immediate)
    BEQ $08              ; F0 08 | Branch if equal
    INC $3F01,X          ; FE 01 3F | Increment (absolute,X)
    BRA $80              ; 80 80 | Branch always
    CPX #$E0             ; E0 E0 | Game work RAM access
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BRA $00              ; 80 00 | Branch always
    BRA $60              ; 80 60 | Branch always
    LDY #$58             ; A0 58 | Load immediate value into Y register
    SBC $C0FD,X          ; FD FD C0 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_224
; Address: $F1F9A3
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_224:
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CMP $0030            ; CD 30 00 | Compare accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PHP                  ; 08 | Push processor status to stack
    PHP                  ; 08 | Push processor status to stack
    BPL $10              ; 10 10 | Branch if positive
    BMI $30              ; 30 30 | Branch if negative
    BMI $30              ; 30 30 | Branch if negative
    ADC ($71),Y          ; 71 71 | Add with carry ((zero page),Y)
    ADC $7879,Y          ; 79 79 78 | Add with carry (absolute,Y)
    SEI                  ; 78 | Set interrupt disable flag
    PHP                  ; 08 | Push processor status to stack
    BPL $00              ; 10 00 | Branch if positive
    BMI $20              ; 30 20 | Branch if negative
    BPL $60              ; 10 60 | Branch if positive
    ORA ($60),Y          ; 11 60 | Logical OR with accumulator ((zero page),Y)
    ORA $0870,Y          ; 19 70 08 | Logical OR with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    BRA $80              ; 80 80 | Branch always
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_227
; Address: $F1FA20
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_227:
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    JMP $7F0338          ; 5C 38 03 7F | Jump to address long
    ADC $18FC,Y          ; 79 FC 18 | Add with carry (absolute,Y)
    CLC                  ; 18 | Clear carry flag
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    SEC                  ; 38 | Set carry flag
    SEC                  ; 38 | Set carry flag
    SBC $FCFC,X          ; FD FC FC | Subtract with carry (absolute,X)
    CLC                  ; 18 | Clear carry flag
    CLC                  ; 18 | Clear carry flag
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CPX #$E0             ; E0 E0 | Game work RAM access
    CPX #$18             ; E0 18 | Compare X register (immediate)
    STZ $01              ; 64 01 | Store zero to zero page
    ROL $04DB,X          ; 3E DB 04 | Rotate left (absolute,X)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC $FEDE,X          ; DE DE FE | Decrement (absolute,X)
    INC $0000,X          ; FE 00 00 | Increment (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    REP #$1C             ; C2 1C | Reset processor status bits
    ASL $00F0            ; 0E F0 00 | Arithmetic shift left (absolute)
    BMI $00              ; 30 00 | Branch if negative
    BMI $3E              ; 30 3E | Branch if negative

;------------------------------------------------------------------------------
; Bank62_DmaFunction_228
; Address: $F1FAC1
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_228:
    ROL $1F1F,X          ; 3E 1F 1F | Rotate left (absolute,X)
    ASL $831E,X          ; 1E 1E 83 | Arithmetic shift left (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $7FFE,X          ; FE FE 7F | Increment (absolute,X)
    ASL $8300,X          ; 1E 00 83 | Arithmetic shift left (absolute,X)
    CPX #$10             ; E0 10 | Compare X register (immediate)
    INC $7F00,X          ; FE 00 7F | Increment (absolute,X)
    CPX #$E0             ; E0 E0 | Game work RAM access
    ORA $0A              ; 05 0A | Logical OR with accumulator (zero page)
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $FF              ; 70 FF | Branch if overflow set
    PHP                  ; 08 | Push processor status to stack
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $0F              ; F0 0F | Branch if equal
    CPX #$FF             ; E0 FF | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPX #$78             ; E0 78 | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ROL $787F,X          ; 3E 7F 78 | Rotate left (absolute,X)
    ADC ($FF),Y          ; 71 FF | Add with carry ((zero page),Y)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    ASL $79              ; 06 79 | Arithmetic shift left (zero page)
    PHP                  ; 08 | Push processor status to stack
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    BMI $F8              ; 30 F8 | Branch if negative
    BEQ $F8              ; F0 F8 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BRA $F0              ; 80 F0 | Branch always
    BMI $F8              ; 30 F8 | Branch if negative
    BVS $F8              ; 70 F8 | Branch if overflow set
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BPL $E8              ; 10 E8 | Branch if positive
    BPL $E8              ; 10 E8 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_229
; Address: $F1FBF5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_229:
    BCC $80              ; 90 80 | Branch if carry clear
    BVS $10              ; 70 10 | Branch if overflow set
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_22C
; Address: $F1FC1A
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_22C:
    PHP                  ; 08 | Push processor status to stack
    ROR $0F03,X          ; 7E 03 0F | Rotate right (absolute,X)
    BEQ $F8              ; F0 F8 | Branch if equal
    CPY #$F0             ; C0 F0 | Compare Y register (immediate)
    CPY #$02             ; C0 02 | Compare Y register (immediate)
    ORA $1D02            ; 0D 02 1D | Logical OR with accumulator (absolute)
    BMI $C8              ; 30 C8 | Branch if negative
    CPY #$30             ; C0 30 | Compare Y register (immediate)
    CPY #$FE             ; C0 FE | Compare Y register (immediate)
    INC $FFF0,X          ; FE F0 FF | Increment (absolute,X)
    ROR $38FF,X          ; 7E FF 38 | Rotate right (absolute,X)
    ROR $3800,X          ; 7E 00 38 | Rotate right (absolute,X)
    SBC $F20C,X          ; FD 0C F2 | Subtract with carry (absolute,X)
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    ORA ($EE),Y          ; 11 EE | Logical OR with accumulator ((zero page),Y)
    ASL $F9              ; 06 F9 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ROR $00              ; 66 00 | Rotate right (zero page)
    SEC                  ; 38 | Set carry flag
    BCC $10              ; 90 10 | Branch if carry clear
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    CPX #$F0             ; E0 F0 | Compare X register (immediate)
    BRA $E0              ; 80 E0 | Game work RAM access
    BRA $00              ; 80 00 | Branch always
    BCC $10              ; 90 10 | Branch if carry clear
    INX                  ; E8 | Increment X register
    BPL $E8              ; 10 E8 | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_22F
; Address: $F1FC8A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_22F:
    BMI $7C              ; 30 7C | Branch if negative
    BMI $00              ; 30 00 | Branch if negative
    SEI                  ; 78 | Set interrupt disable flag
    BEQ $FF              ; F0 FF | Branch if equal
    SED                  ; F8 | Set decimal mode flag
    BMI $00              ; 30 00 | Branch if negative
    ROR $F4FF            ; 6E FF F4 | Rotate right (absolute)
    CMP $07F2            ; CD F2 07 | Compare accumulator (absolute)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    ASL $2FFF,X          ; 1E FF 2F | Arithmetic shift left (absolute,X)
    ASL $C6              ; 06 C6 | Arithmetic shift left (zero page)
    CPX #$E0             ; E0 E0 | Game work RAM access
    BVS $F0              ; 70 F0 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    BVS $F8              ; 70 F8 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank62_DmaFunction_230
; Address: $F1FCC8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_230:
    CPX #$10             ; E0 10 | Compare X register (immediate)
    BRA $80              ; 80 80 | Branch always
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    DEC $007F,X          ; DE 7F 00 | Decrement (absolute,X)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    ASL $7E71            ; 0E 71 7E | Arithmetic shift left (absolute)
    INC $F9              ; E6 F9 | Increment (zero page)
    ADC $7FFF,Y          ; 79 FF 7F | Add with carry (absolute,Y)
    ORA ($3E,X)          ; 01 3E | Logical OR with accumulator ((zero page,X))
    BPL $EF              ; 10 EF | Branch if positive
    BPL $EF              ; 10 EF | Branch if positive
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_232
; Address: $F1FD23
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_232:
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    CPX #$60             ; E0 60 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_233
; Address: $F1FD32
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_233:
    JSR $20D0            ; 20 D0 20 | Jump to subroutine
    BNE $40              ; D0 40 | Branch if not equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $20              ; D0 20 | Branch if not equal
    BNE $C0              ; D0 C0 | Branch if not equal

;------------------------------------------------------------------------------
; Bank62_DmaFunction_234
; Address: $F1FD3F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_234:
    JSR $0300            ; 20 00 03 | Jump to subroutine
    BEQ $7C              ; F0 7C | Branch if equal
    RTI                  ; 40 | Return from interrupt
    BMI $00              ; 30 00 | Branch if negative
    BEQ $FF              ; F0 FF | Branch if equal
    BEQ $FF              ; F0 FF | Branch if equal
    PEA #$E0FB           ; F4 FB E0 | Game work RAM access
    RTI                  ; 40 | Return from interrupt
    BVS $00              ; 70 00 | Branch if overflow set
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_236
; Address: $F1FD67
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_236:
    BRA $00              ; 80 00 | Branch always
    CPX #$FE             ; E0 FE | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F0              ; F0 F0 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_237
; Address: $F1FD77
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_237:
    CPX #$00             ; E0 00 | Compare X register (immediate)
    SED                  ; F8 | Set decimal mode flag
    ROL $C0DF            ; 2E DF C0 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_238
; Address: $F1FD8D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_238:
    ASL $0000            ; 0E 00 00 | Arithmetic shift left (absolute)
    DEY                  ; 88 | Decrement Y register
    DEY                  ; 88 | Decrement Y register
    BRA $7F              ; 80 7F | Branch always
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ORA $0E00,X          ; 1D 00 0E | Logical OR with accumulator (absolute,X)
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $E0              ; F0 E0 | Game work RAM access
    BEQ $80              ; F0 80 | Branch if equal
    CPX #$00             ; E0 00 | Compare X register (immediate)
    BRA $00              ; 80 00 | Branch always
    CPX #$20             ; E0 20 | Compare X register (immediate)
    BNE $20              ; D0 20 | Branch if not equal
    BNE $60              ; D0 60 | Branch if not equal
    BCC $80              ; 90 80 | Branch if carry clear
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_239
; Address: $F1FDBB
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_239:
    BRA $00              ; 80 00 | Branch always
    ASL $3801            ; 0E 01 38 | Arithmetic shift left (absolute)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    CPY #$38             ; C0 38 | Compare Y register (immediate)
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    PLX                  ; FA | Pull X register from stack
    PLX                  ; FA | Pull X register from stack
    BRA $80              ; 80 80 | Branch always
    CPY #$3A             ; C0 3A | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))
    ROR $00FE,X          ; 7E FE 00 | Rotate right (absolute,X)
    CLC                  ; 18 | Clear carry flag
    ASL $F8              ; 06 F8 | Arithmetic shift left (zero page)
    BEQ $F0              ; F0 F0 | Branch if equal
    INC $FFFE,X          ; FE FE FF | Increment (absolute,X)
    BEQ $F0              ; F0 F0 | Branch if equal
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BVS $80              ; 70 80 | Branch if overflow set
    ASL $FFE0,X          ; 1E E0 FF | Arithmetic shift left (absolute,X)
    BEQ $00              ; F0 00 | Branch if equal
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    CPY #$C0             ; C0 C0 | Compare Y register (immediate)
    BEQ $F0              ; F0 F0 | Branch if equal
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BEQ $00              ; F0 00 | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ASL $1E0E            ; 0E 0E 1E | Arithmetic shift left (absolute)
    ASL $1E1E,X          ; 1E 1E 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_23A
; Address: $F1FE92
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_23A:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $01              ; 06 01 | Arithmetic shift left (zero page)
    CLC                  ; 18 | Clear carry flag
    ASL $18              ; 06 18 | Arithmetic shift left (zero page)
    ASL $FC              ; 06 FC | Arithmetic shift left (zero page)
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BNE $D0              ; D0 D0 | Branch if not equal
    LDY #$A0             ; A0 A0 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    CPX #$1C             ; E0 1C | Compare X register (immediate)
    BRA $78              ; 80 78 | Branch always
    BNE $00              ; D0 00 | Branch if not equal
    LDY #$00             ; A0 00 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_23B
; Address: $F1FECC
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_23B:
    RTI                  ; 40 | Return from interrupt
    RTI                  ; 40 | Return from interrupt
    ORA $000D            ; 0D 0D 00 | Logical OR with accumulator (absolute)
    RTI                  ; 40 | Return from interrupt
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator (absolute)
    ORA ($01,X)          ; 01 01 | Logical OR with accumulator ((zero page,X))
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    ASL $1E1F            ; 0E 1F 1E | Arithmetic shift left (absolute)
    ORA $7B3E,X          ; 1D 3E 7B | Logical OR with accumulator (absolute,X)
    ROR $FEF7,X          ; 7E F7 FE | Rotate right (absolute,X)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ASL $1F0F            ; 0E 0F 1F | Arithmetic shift left (absolute)
    ORA $3B              ; 05 3B | Logical OR with accumulator (zero page)
    SED                  ; F8 | Set decimal mode flag
    INC $F8E0,X          ; FE E0 F8 | Increment (absolute,X)
    CPY #$E0             ; C0 E0 | Game work RAM access
    BRA $C0              ; 80 C0 | Branch always
    BRA $00              ; 80 00 | Branch always
    CLC                  ; 18 | Clear carry flag
    INC $20              ; E6 20 | Increment (zero page)
    CLD                  ; D8 | Clear decimal mode flag
    RTI                  ; 40 | Return from interrupt
    LDY #$00             ; A0 00 | Load immediate value into Y register
    CPY #$00             ; C0 00 | Compare Y register (immediate)
    BRA $00              ; 80 00 | Branch always
    ASL $0F1E,X          ; 1E 1E 0F | Arithmetic shift left (absolute,X)
    ASL $0F01            ; 0E 01 0F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_23C
; Address: $F1FF40
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_23C:
    AND ($31),Y          ; 31 31 | Logical AND with accumulator ((zero page),Y)
    SBC ($E1,X)          ; E1 E1 | Subtract with carry ((zero page,X))
    ORA ($30,X)          ; 01 30 | Logical OR with accumulator ((zero page,X))
    CPY #$21             ; C0 21 | PPU graphics register access
    SED                  ; F8 | Set decimal mode flag
    BRA $80              ; 80 80 | Branch always
    STA $FFFF8F          ; 8F 8F FF FF | Store accumulator to absolute long address
    LDA                  ; BF BF F8 FE | Load from absolute long,X into accumulator
    BRA $00              ; 80 00 | Branch always
    BVS $0F              ; 70 0F | Branch if overflow set
    BRA $00              ; 80 00 | Branch always
    SEC                  ; 38 | Set carry flag
    SED                  ; F8 | Set decimal mode flag
    ASL $FF              ; 06 FF | Arithmetic shift left (zero page)
    AND $E37F,Y          ; 39 7F E3 | Logical AND with accumulator (absolute,Y)
    ORA ($FE,X)          ; 01 FE | Logical OR with accumulator ((zero page,X))
    ADC ($9A,X)          ; 61 9A | Add with carry ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    SED                  ; F8 | Set decimal mode flag
    BEQ $F8              ; F0 F8 | Branch if equal
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank62_DmaFunction_23D
; Address: $F1FFA9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_23D:
    BEQ $C0              ; F0 C0 | Branch if equal
    CPX #$80             ; E0 80 | Compare X register (immediate)
    CPY #$80             ; C0 80 | Compare Y register (immediate)
    BRA $06              ; 80 06 | Branch always
    INC $FC00,X          ; FE 00 FC | Increment (absolute,X)
    CPY #$38             ; C0 38 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank62_DmaFunction_23E
; Address: $F1FFB8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_23E:
    JSR $40D0            ; 20 D0 40 | Jump to subroutine
    LDY #$80             ; A0 80 | Load immediate value into Y register
    RTI                  ; 40 | Return from interrupt
    BRA $00              ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank62_DmaFunction_23F
; Address: $F1FFCE
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank62_DmaFunction_23F:
    JSR $0000            ; 20 00 00 | Jump to subroutine
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    BEQ $FF              ; F0 FF | Branch if equal
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    PHA                  ; 48 | Push accumulator to stack
    CLV                  ; B8 | Clear overflow flag
    BEQ $01              ; F0 01 | Branch if equal
    SBC ($06,X)          ; E1 06 | Subtract with carry ((zero page,X))
    SBC $0C              ; E5 0C | Subtract with carry (zero page)
    INY                  ; C8 | Increment Y register
    CLC                  ; 18 | Clear carry flag
    BCC $00              ; 90 00 | Branch if carry clear
