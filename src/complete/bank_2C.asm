;==============================================================================
; Dragon Quest III - Bank $2C
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $D60000-$D67FFF
; Instructions: 10425
; Bytes: 32771
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_2C"

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_000
; Address: $D68000
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_000:
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0011            ; 4C 11 00 | Jump to address
    CMP ($01),Y          ; D1 01 | Compare accumulator ((zero page),Y)
    JMP $0014            ; 4C 14 00 | Jump to address
    LDX $6B01,Y          ; BE 01 6B | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_00B
; Address: $D68044
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_00B:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    JMP $001E            ; 4C 1E 00 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_00D
; Address: $D68051
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_00D:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0063            ; 4C 63 00 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_00E
; Address: $D6805C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_00E:
    JSL $CDC232          ; 22 32 C2 CD | Jump to subroutine long
    JMP $0075            ; 4C 75 00 | Jump to address
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0071            ; 4C 71 00 | Jump to address
    LDY $2201,X          ; BC 01 22 | Load from absolute,X into Y register
    REP #$CD             ; C2 CD | Reset processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_010
; Address: $D6807D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_010:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0094            ; 4C 94 00 | Jump to address
    INC $4C01            ; EE 01 4C | Increment (absolute)
    DEX                  ; CA | Decrement X register
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_011
; Address: $D6809C
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_011:
    JMP $00A5            ; 4C A5 00 | Jump to address
    DEC $4C01,X          ; DE 01 4C | Decrement (absolute,X)
    DEX                  ; CA | Decrement X register
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $00B6            ; 4C B6 00 | Jump to address
    CMP $4C01,X          ; DD 01 4C | Compare accumulator (absolute,X)
    DEX                  ; CA | Decrement X register
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $00C7            ; 4C C7 00 | Jump to address
    BNE $01              ; D0 01 | Branch if not equal
    JMP $00CA            ; 4C CA 00 | Jump to address
    LDA $6B01,X          ; BD 01 6B | Load from absolute,X into accumulator
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $00DC            ; 4C DC 00 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $00ED            ; 4C ED 00 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    STA $B0CC,Y          ; 99 CC B0 | Store accumulator to absolute,Y
    JMP $0112            ; 4C 12 01 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_012
; Address: $D680F9
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_012:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    CLV                  ; B8 | Clear overflow flag
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $010F            ; 4C 0F 01 | Jump to address
    TSX                  ; BA | Transfer stack pointer to X register
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA $6B01,Y          ; B9 01 6B | Load from absolute,Y into accumulator
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0128            ; 4C 28 01 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA ($AD,X)          ; 01 AD | Logical OR with accumulator ((zero page,X))
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0139            ; 4C 39 01 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_013
; Address: $D68134
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_013:
    DEC $4C01            ; CE 01 4C | Decrement (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $014E            ; 4C 4E 01 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    LDA                  ; BF 01 6B AD | Load from absolute long,X into accumulator
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0163            ; 4C 63 01 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ROR $01              ; 66 01 | Rotate right (zero page)
    CPY #$01             ; C0 01 | Compare Y register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_014
; Address: $D68167
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_014:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0195            ; 4C 95 01 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $018B            ; 4C 8B 01 | Jump to address
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $01B6            ; 4C B6 01 | Jump to address
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_015
; Address: $D681A4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_015:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $01CB            ; 4C CB 01 | Jump to address
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_016
; Address: $D681D3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_016:
    JMP $01EA            ; 4C EA 01 | Jump to address
    CMP $2201            ; CD 01 22 | Compare accumulator (absolute)
    BVS $9E              ; 70 9E | Branch if overflow set
    CPY $04A9            ; CC A9 04 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_017
; Address: $D681E3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_017:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $021B            ; 4C 1B 02 | Jump to address
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $01FF            ; 4C FF 01 | Jump to address
    CPY $2201            ; CC 01 22 | Compare Y register (absolute)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CMP #$01             ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_018
; Address: $D68202
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_018:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    DEX                  ; CA | Decrement X register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    STA                  ; 9F CC 22 06 | Store accumulator to absolute long,X
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $EE22            ; CD 22 EE | Compare accumulator (absolute)
    LDY $00CD            ; AC CD 00 | Load from absolute address into Y register
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $226B            ; CC 6B 22 | Compare Y register (absolute)
    BIT $CDBE            ; 2C BE CD | Test bits in accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_019
; Address: $D68225
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_019:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0236            ; 4C 36 02 | Jump to address
    SEP #$01             ; E2 01 | Set processor status bits
    JMP $024A            ; 4C 4A 02 | Jump to address
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0247            ; 4C 47 02 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LSR                  ; 4A | Logical shift right (accumulator)
    INY                  ; C8 | Increment Y register
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    CMP $01              ; C5 01 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_01A
; Address: $D6824E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_01A:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $025D            ; 4C 5D 02 | Jump to address
    DEC $01              ; C6 01 | Decrement (zero page)
    JMP $0260            ; 4C 60 02 | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_01B
; Address: $D68269
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_01B:
    JMP $0272            ; 4C 72 02 | Jump to address
    SBC ($01,X)          ; E1 01 | Subtract with carry ((zero page,X))
    JMP $0275            ; 4C 75 02 | Jump to address
    CPY $01              ; C4 01 | Compare Y register (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_01C
; Address: $D68278
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_01C:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    REP #$01             ; C2 01 | Reset processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_01F
; Address: $D68287
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_01F:
    INX                  ; E8 | Increment X register
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $029B            ; 4C 9B 02 | Jump to address
    NOP                  ; EA | No operation
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    LDY $02              ; A4 02 | Load from zero page into Y register
    SBC #$01             ; E9 01 | Subtract with carry (immediate)
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_020
; Address: $D682A5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_020:
    LDA $3547            ; AD 47 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $02BE            ; 4C BE 02 | Jump to address
    SBC $2201            ; ED 01 22 | Subtract with carry (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    PLA                  ; 68 | Pull accumulator from stack
    CMP $4CCC,Y          ; D9 CC 4C | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_021
; Address: $D682BE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_021:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    XBA                  ; EB | Exchange accumulator bytes
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    CPX $2201            ; EC 01 22 | Compare X register (absolute)
    LDX #$CC             ; A2 CC | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_025
; Address: $D682DC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_025:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $02F8            ; 4C F8 02 | Jump to address
    LDA #$68             ; A9 68 | Load immediate value into accumulator
    LDX #$37             ; A2 37 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_02A
; Address: $D682FD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_02A:
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $030E            ; 4C 0E 03 | Jump to address
    SBC $01              ; E5 01 | Subtract with carry (zero page)
    JMP $0311            ; 4C 11 03 | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_02C
; Address: $D68319
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_02C:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $0329            ; 4C 29 03 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BIT $0003            ; 2C 03 00 | Test bits in accumulator (absolute)
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    EOR $6B01,X          ; 5D 01 6B | Exclusive OR with accumulator (absolute,X)
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0342            ; 4C 42 03 | Jump to address
    CPX $01              ; E4 01 | Compare X register (zero page)
    JMP $0346            ; 4C 46 03 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_02E
; Address: $D68349
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_02E:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    CLD                  ; D8 | Clear decimal mode flag
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0361            ; 4C 61 03 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_02F
; Address: $D6835A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_02F:
    JSL $CCD0FF          ; 22 FF D0 CC | Jump to subroutine long
    JMP $0377            ; 4C 77 03 | Jump to address
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0373            ; 4C 73 03 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_032
; Address: $D68378
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_032:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0389            ; 4C 89 03 | Jump to address
    CMP $4C01,Y          ; D9 01 4C | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_033
; Address: $D68387
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_033:
    STA $AD03,X          ; 9D 03 AD | Store accumulator to absolute,X
    EOR ($35,X)          ; 41 35 | Exclusive OR with accumulator ((zero page,X))
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $039A            ; 4C 9A 03 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    STA $0003,X          ; 9D 03 00 | Store accumulator to absolute,X
    CMP $6B01,Y          ; D9 01 6B | Compare accumulator (absolute,Y)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $03B0            ; 4C B0 03 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_034
; Address: $D683A9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_034:
    JSL $CCD15C          ; 22 5C D1 CC | Jump to subroutine long
    JMP $03C6            ; 4C C6 03 | Jump to address
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $03C2            ; 4C C2 03 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_037
; Address: $D683C7
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_037:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $03D8            ; 4C D8 03 | Jump to address
    PHX                  ; DA | Push X register to stack
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CPX $AD03            ; EC 03 AD | Compare X register (absolute)
    EOR ($35,X)          ; 41 35 | Exclusive OR with accumulator ((zero page,X))
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $03E9            ; 4C E9 03 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CPX $0003            ; EC 03 00 | Compare X register (absolute)
    PHX                  ; DA | Push X register to stack
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3541            ; AD 41 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $03FE            ; 4C FE 03 | Jump to address
    INC $01              ; E6 01 | Increment (zero page)
    JMP $0401            ; 4C 01 04 | Jump to address
    ROR $6B01            ; 6E 01 6B | Rotate right (absolute)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $041B            ; 4C 1B 04 | Jump to address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    LDX #$1D             ; A2 1D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_03C
; Address: $D68426
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_03C:
    JSL $CC81FC          ; 22 FC 81 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0435            ; 4C 35 04 | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    STA $3604            ; 8D 04 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_03E
; Address: $D68439
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_03E:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA $3604            ; AD 04 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    LDX #$07             ; A2 07 | Load immediate value into X register
    LDA #$A9             ; A9 A9 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_047
; Address: $D68469
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_047:
    JSL $CDAF21          ; 22 21 AF CD | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_04A
; Address: $D6847C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_04A:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0497            ; 4C 97 04 | Jump to address
    SED                  ; F8 | Set decimal mode flag
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR #$35             ; 49 35 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_04B
; Address: $D68490
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_04B:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $04EC            ; 4C EC 04 | Jump to address
    BEQ $01              ; F0 01 | Branch if equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_04C
; Address: $D6849A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_04C:
    JSL $CC81FC          ; 22 FC 81 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $04E5            ; 4C E5 04 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_04D
; Address: $D684A3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_04D:
    JSL $CDAD10          ; 22 10 AD CD | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $04DB            ; 4C DB 04 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_04E
; Address: $D684B5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_04E:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $04D1            ; 4C D1 04 | Jump to address
    PEA #$2201           ; F4 01 22 | Push effective address to stack
    ROR $CCD3,X          ; 7E D3 CC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_050
; Address: $D684CA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_050:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $04D8            ; 4C D8 04 | Jump to address
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    SEP #$04             ; E2 04 | Set processor status bits
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CPX $0004            ; EC 04 00 | Compare X register (absolute)
    SBC ($01),Y          ; F1 01 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_052
; Address: $D684ED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_052:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $050D            ; 4C 0D 05 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_053
; Address: $D684F8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_053:
    JSL $CCD1F4          ; 22 F4 D1 CC | Jump to subroutine long
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    LDX #$3B             ; A2 3B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_057
; Address: $D68512
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_057:
    PHA                  ; 48 | Push accumulator to stack
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0546            ; 4C 46 05 | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    CMP ($A9,X)          ; C1 A9 | Compare accumulator ((zero page,X))
    LDX #$05             ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_058
; Address: $D6852D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_058:
    JSL $C78B3F          ; 22 3F 8B C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $053E            ; 4C 3E 05 | Jump to address
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    ROL $4C34,X          ; 3E 34 4C | Rotate left (absolute,X)
    LSR $05              ; 46 05 | Logical shift right (zero page)
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CLC                  ; 18 | Clear carry flag
    ORA $68              ; 05 68 | Logical OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_05D
; Address: $D68556
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_05D:
    JSL $CB0512          ; 22 12 05 CB | Jump to subroutine long
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ORA $A9              ; 05 A9 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_062
; Address: $D68578
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_062:
    JSL $C74CF7          ; 22 F7 4C C7 | Jump to subroutine long
    JMP $05F8            ; 4C F8 05 | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_067
; Address: $D68595
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_067:
    JSL $C74CF7          ; 22 F7 4C C7 | Jump to subroutine long
    JMP $05F8            ; 4C F8 05 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_06C
; Address: $D685B2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_06C:
    JSL $C74CF7          ; 22 F7 4C C7 | Jump to subroutine long
    JMP $05F8            ; 4C F8 05 | Jump to address
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_071
; Address: $D685CF
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_071:
    JSL $C74CF7          ; 22 F7 4C C7 | Jump to subroutine long
    JMP $05F8            ; 4C F8 05 | Jump to address
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0562            ; 4C 62 05 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $057F            ; 4C 7F 05 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $059C            ; 4C 9C 05 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_075
; Address: $D68600
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_075:
    JSL $CCD767          ; 22 67 D7 CC | Jump to subroutine long
    ORA ($8D,X)          ; 01 8D | Logical OR with accumulator ((zero page,X))
    ROL $2234,X          ; 3E 34 22 | Rotate left (absolute,X)
    LDY $CC7C,X          ; BC 7C CC | Load from absolute,X into Y register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $061B            ; 4C 1B 06 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    JMP $0621            ; 4C 21 06 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    PHA                  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_077
; Address: $D68625
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_077:
    JSL $CCD73B          ; 22 3B D7 CC | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP #$1B             ; C9 1B | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0672            ; 4C 72 06 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0652            ; 4C 52 06 | Jump to address
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$3B             ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_079
; Address: $D6864B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_079:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    JMP $0660            ; 4C 60 06 | Jump to address
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_07E
; Address: $D6866B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_07E:
    JSL $CCD869          ; 22 69 D8 CC | Jump to subroutine long
    JMP $07BB            ; 4C BB 07 | Jump to address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$37             ; C9 37 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0715            ; 4C 15 07 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$36             ; C9 36 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $06A8            ; 4C A8 06 | Jump to address
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_083
; Address: $D686A1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_083:
    JSL $CCD857          ; 22 57 D8 CC | Jump to subroutine long
    JMP $0712            ; 4C 12 07 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $06D3            ; 4C D3 06 | Jump to address
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$3B             ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_088
; Address: $D686CC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_088:
    JSL $CCD857          ; 22 57 D8 CC | Jump to subroutine long
    JMP $0712            ; 4C 12 07 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$39             ; C9 39 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0700            ; 4C 00 07 | Jump to address
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$3B             ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_08D
; Address: $D686F9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_08D:
    JSL $CCD857          ; 22 57 D8 CC | Jump to subroutine long
    JMP $0712            ; 4C 12 07 | Jump to address
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$3B             ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_090
; Address: $D6870E
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_090:
    JSL $CCD857          ; 22 57 D8 CC | Jump to subroutine long
    JMP $07BB            ; 4C BB 07 | Jump to address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP #$1E             ; C9 1E | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $075C            ; 4C 5C 07 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $073C            ; 4C 3C 07 | Jump to address
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_092
; Address: $D68735
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_092:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    JMP $074A            ; 4C 4A 07 | Jump to address
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA #$3B             ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_097
; Address: $D68755
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_097:
    JSL $CCD863          ; 22 63 D8 CC | Jump to subroutine long
    JMP $07BB            ; 4C BB 07 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $077C            ; 4C 7C 07 | Jump to address
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_09A
; Address: $D68775
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_09A:
    JSL $CCD85D          ; 22 5D D8 CC | Jump to subroutine long
    JMP $07BB            ; 4C BB 07 | Jump to address
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$39             ; C9 39 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $07A9            ; 4C A9 07 | Jump to address
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_09F
; Address: $D687A2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_09F:
    JSL $CCD85D          ; 22 5D D8 CC | Jump to subroutine long
    JMP $07BB            ; 4C BB 07 | Jump to address
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0A8
; Address: $D687CF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0A8:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $07DE            ; 4C DE 07 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0A9
; Address: $D687DC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0A9:
    SBC ($07,X)          ; E1 07 | Subtract with carry ((zero page,X))
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    ORA #$AE             ; 09 AE | Logical OR with accumulator (immediate)
    CMP $6B68            ; CD 68 6B | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0AA
; Address: $D687EB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0AA:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $07FA            ; 4C FA 07 | Jump to address
    SBC $4C01,Y          ; F9 01 4C | Subtract with carry (absolute,Y)
    SBC $0007,X          ; FD 07 00 | Subtract with carry (absolute,X)
    PLX                  ; FA | Pull X register from stack
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    SED                  ; F8 | Set decimal mode flag
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    EOR #$35             ; 49 35 | Exclusive OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0AD
; Address: $D68811
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0AD:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0823            ; 4C 23 08 | Jump to address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ROL $08              ; 26 08 | Rotate left (zero page)
    SBC $A901,X          ; FD 01 A9 | Subtract with carry (absolute,X)
    EOR #$35             ; 49 35 | Exclusive OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0B1
; Address: $D6883A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0B1:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$26             ; C9 26 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0862            ; 4C 62 08 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0B2
; Address: $D68849
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0B2:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0858            ; 4C 58 08 | Jump to address
    INC $4C01,X          ; FE 01 4C | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    ROR $08              ; 66 08 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0B7
; Address: $D68870
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0B7:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $087F            ; 4C 7F 08 | Jump to address
    JMP $0882            ; 4C 82 08 | Jump to address
    ORA ($02,X)          ; 01 02 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0BA
; Address: $D6888C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0BA:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $089B            ; 4C 9B 08 | Jump to address
    ORA $02              ; 05 02 | Logical OR with accumulator (zero page)
    JMP $089E            ; 4C 9E 08 | Jump to address
    ASL $02              ; 06 02 | Arithmetic shift left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0C1
; Address: $D688B9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0C1:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $08C8            ; 4C C8 08 | Jump to address
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $08CB            ; 4C CB 08 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0C4
; Address: $D688D7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0C4:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    ORA #$02             ; 09 02 | Logical OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0CB
; Address: $D688F7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0CB:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$48             ; C9 48 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0CD
; Address: $D68906
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0CD:
    JSL $CDC25A          ; 22 5A C2 CD | Jump to subroutine long
    JMP $0914            ; 4C 14 09 | Jump to address
    ORA $2202            ; 0D 02 22 | Logical OR with accumulator (absolute)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    BPL $02              ; 10 02 | Branch if positive
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0D1
; Address: $D68925
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0D1:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0934            ; 4C 34 09 | Jump to address
    JMP $0937            ; 4C 37 09 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0D2
; Address: $D68938
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0D2:
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0D7
; Address: $D6896A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0D7:
    JSL $C74C86          ; 22 86 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0985            ; 4C 85 09 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0D8
; Address: $D68973
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0D8:
    JSL $CCD73B          ; 22 3B D7 CC | Jump to subroutine long
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0985            ; 4C 85 09 | Jump to address
    JMP $09CC            ; 4C CC 09 | Jump to address
    LDA #$22             ; A9 22 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0DA
; Address: $D6898C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0DA:
    JSL $C74C86          ; 22 86 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $09A7            ; 4C A7 09 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0DB
; Address: $D68995
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0DB:
    JSL $CCD73B          ; 22 3B D7 CC | Jump to subroutine long
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0DC
; Address: $D689A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0DC:
    JMP $09A7            ; 4C A7 09 | Jump to address
    JMP $09CC            ; 4C CC 09 | Jump to address
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0DE
; Address: $D689AE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0DE:
    JSL $C74C86          ; 22 86 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $09C9            ; 4C C9 09 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0DF
; Address: $D689B7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0DF:
    JSL $CCD73B          ; 22 3B D7 CC | Jump to subroutine long
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $09C9            ; 4C C9 09 | Jump to address
    JMP $09CC            ; 4C CC 09 | Jump to address
    JMP $09D4            ; 4C D4 09 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0E5
; Address: $D689E0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0E5:
    JSL $C751F0          ; 22 F0 51 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $09ED            ; 4C ED 09 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0EA
; Address: $D68A00
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0EA:
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0A32            ; 4C 32 0A | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0EB
; Address: $D68A0E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0EB:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0A20            ; 4C 20 0A | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    JMP $0A32            ; 4C 32 0A | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0EC
; Address: $D68A23
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0EC:
    JSL $C76374          ; 22 74 63 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0A32            ; 4C 32 0A | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0ED
; Address: $D68A33
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0ED:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0A56            ; 4C 56 0A | Jump to address
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0EE
; Address: $D68A3F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0EE:
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0A56            ; 4C 56 0A | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0A56            ; 4C 56 0A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0F0
; Address: $D68A57
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0F0:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0A67            ; 4C 67 0A | Jump to address
    LDA #$48             ; A9 48 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0F2
; Address: $D68A68
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0F2:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0A77            ; 4C 77 0A | Jump to address
    JMP $0A7A            ; 4C 7A 0A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0F3
; Address: $D68A7B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0F3:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0A8B            ; 4C 8B 0A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0F4
; Address: $D68A84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0F4:
    JSL $CCD7F9          ; 22 F9 D7 CC | Jump to subroutine long
    JMP $0AA0            ; 4C A0 0A | Jump to address
    LDA #$3F             ; A9 3F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0F6
; Address: $D68A92
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0F6:
    JSL $CCDAFE          ; 22 FE DA CC | Jump to subroutine long
    LDA #$26             ; A9 26 | Load immediate value into accumulator
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0F8
; Address: $D68AA1
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0F8:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0AB0            ; 4C B0 0A | Jump to address
    AND ($02,X)          ; 21 02 | Logical AND with accumulator ((zero page,X))
    JMP $0ACA            ; 4C CA 0A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0AC1            ; 4C C1 0A | Jump to address
    BIT $4C02            ; 2C 02 4C | Test bits in accumulator (absolute)
    DEX                  ; CA | Decrement X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0F9
; Address: $D68ACB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0F9:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0ADB            ; 4C DB 0A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0FD
; Address: $D68AE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0FD:
    JSL $CCD7F9          ; 22 F9 D7 CC | Jump to subroutine long
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_0FF
; Address: $D68AF1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_0FF:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0B00            ; 4C 00 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_101
; Address: $D68B04
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_101:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0B14            ; 4C 14 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_105
; Address: $D68B20
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_105:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0B62            ; 4C 62 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_106
; Address: $D68B29
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_106:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    ORA $2202,X          ; 1D 02 22 | Logical OR with accumulator (absolute,X)
    STZ $C74B            ; 9C 4B C7 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_107
; Address: $D68B34
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_107:
    JSL $C751F0          ; 22 F0 51 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0B48            ; 4C 48 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_10C
; Address: $D68B50
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_10C:
    JSL $CCD98F          ; 22 8F D9 CC | Jump to subroutine long
    ASL $2202,X          ; 1E 02 22 | Arithmetic shift left (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $654C            ; CC 4C 65 | Compare Y register (absolute)
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_10D
; Address: $D68B66
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_10D:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0B76            ; 4C 76 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_112
; Address: $D68B82
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_112:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0B91            ; 4C 91 0B | Jump to address
    JMP $0B94            ; 4C 94 0B | Jump to address
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_113
; Address: $D68B95
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_113:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0BA5            ; 4C A5 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_114
; Address: $D68B9E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_114:
    JSL $CCDAFE          ; 22 FE DA CC | Jump to subroutine long
    JMP $0BB0            ; 4C B0 0B | Jump to address
    LDA #$2F             ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_117
; Address: $D68BB1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_117:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0BC0            ; 4C C0 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_118
; Address: $D68BBB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_118:
    JSR $4C02            ; 20 02 4C | Jump to subroutine
    ROL                  ; 2A | Rotate left (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_119
; Address: $D68BC4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_119:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0BD4            ; 4C D4 0B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_11A
; Address: $D68BCD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_11A:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $0BDF            ; 4C DF 0B | Jump to address
    LDA #$48             ; A9 48 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_11D
; Address: $D68BE0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_11D:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0BF6            ; 4C F6 0B | Jump to address
    INC                  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_11E
; Address: $D68BEC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_11E:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    JMP $0BF9            ; 4C F9 0B | Jump to address
    ROL $02              ; 26 02 | Rotate left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_11F
; Address: $D68BFA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_11F:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0C0A            ; 4C 0A 0C | Jump to address
    LDA #$4F             ; A9 4F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_122
; Address: $D68C0F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_122:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$28             ; A9 28 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_129
; Address: $D68C37
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_129:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0C4D            ; 4C 4D 0C | Jump to address
    CLC                  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_12A
; Address: $D68C43
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_12A:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    ORA $4C02,Y          ; 19 02 4C | Logical OR with accumulator (absolute,Y)
    BIT $02              ; 24 02 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_12D
; Address: $D68C5B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_12D:
    JSL $CCD952          ; 22 52 D9 CC | Jump to subroutine long
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA #$23             ; A9 23 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_133
; Address: $D68C7A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_133:
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0C9A            ; 4C 9A 0C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_134
; Address: $D68C85
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_134:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0C94            ; 4C 94 0C | Jump to address
    ORA $4C02,Y          ; 19 02 4C | Logical OR with accumulator (absolute,Y)
    AND $02              ; 25 02 | Logical AND with accumulator (zero page)
    JMP $0CAC            ; 4C AC 0C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_135
; Address: $D68C9A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_135:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0CA9            ; 4C A9 0C | Jump to address
    JMP $0CAC            ; 4C AC 0C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_137
; Address: $D68CB2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_137:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$18             ; A0 18 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_138
; Address: $D68CC5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_138:
    JMP $0CCE            ; 4C CE 0C | Jump to address
    JMP $0CE6            ; 4C E6 0C | Jump to address
    JMP $0CE3            ; 4C E3 0C | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_139
; Address: $D68CD7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_139:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0CE3            ; 4C E3 0C | Jump to address
    JMP $0CE6            ; 4C E6 0C | Jump to address
    JMP $0CB2            ; 4C B2 0C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_13E
; Address: $D68CF6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_13E:
    JSL $CDAF61          ; 22 61 AF CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    EOR #$35             ; 49 35 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_142
; Address: $D68D0D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_142:
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0D1B            ; 4C 1B 0D | Jump to address
    JMP $0D1F            ; 4C 1F 0D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_149
; Address: $D68D38
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_149:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0D4E            ; 4C 4E 0D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_154
; Address: $D68D76
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_154:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0D86            ; 4C 86 0D | Jump to address
    JMP $0D8A            ; 4C 8A 0D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_15A
; Address: $D68D9F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_15A:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0DB5            ; 4C B5 0D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_163
; Address: $D68DD3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_163:
    ROL $6B02            ; 2E 02 6B | Rotate left (absolute)
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0DE4            ; 4C E4 0D | Jump to address
    JMP $0DE8            ; 4C E8 0D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_168
; Address: $D68DF9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_168:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP #$21             ; C9 21 | PPU graphics register access
    BCC $03              ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_169
; Address: $D68E05
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_169:
    JMP $0E15            ; 4C 15 0E | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    ADC #$D8             ; 69 D8 | Add with carry (immediate)
    CPY $194C            ; CC 4C 19 | Compare Y register (absolute)
    ASL $6322            ; 0E 22 63 | Arithmetic shift left (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $C122            ; CC 22 C1 | Compare Y register (absolute)
    CPY $FB22            ; CC 22 FB | Compare Y register (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    AND ($AF),Y          ; 31 AF | Logical AND with accumulator ((zero page),Y)
    CMP $5722            ; CD 22 57 | Compare accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $C622            ; CC 22 C6 | Compare Y register (absolute)
    LDA $6BCD            ; AD CD 6B | Load from absolute address into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_16C
; Address: $D68E3B
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_16C:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$A8             ; A2 A8 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_16D
; Address: $D68E48
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_16D:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0E54            ; 4C 54 0E | Jump to address
    JMP $0E57            ; 4C 57 0E | Jump to address
    JMP $0E3B            ; 4C 3B 0E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_170
; Address: $D68E5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_170:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA #$54             ; A9 54 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_175
; Address: $D68E79
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_175:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    EOR #$35             ; 49 35 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_178
; Address: $D68E8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_178:
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0E9E            ; 4C 9E 0E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_183
; Address: $D68ECA
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_183:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0EED            ; 4C ED 0E | Jump to address
    RTI                  ; 40 | Return from interrupt
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0EE7            ; 4C E7 0E | Jump to address
    WDM #$02             ; 42 02 | Reserved instruction
    JMP $0F04            ; 4C 04 0F | Jump to address
    LSR $02              ; 46 02 | Logical shift right (zero page)
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0F01            ; 4C 01 0F | Jump to address
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_18A
; Address: $D68F20
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_18A:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $0F40            ; 4C 40 0F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_18B
; Address: $D68F2B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_18B:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0F3A            ; 4C 3A 0F | Jump to address
    JMP $0F3D            ; 4C 3D 0F | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    JMP $0F74            ; 4C 74 0F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_18D
; Address: $D68F44
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_18D:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0F60            ; 4C 60 0F | Jump to address
    RTI                  ; 40 | Return from interrupt
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0F5D            ; 4C 5D 0F | Jump to address
    WDM #$02             ; 42 02 | Reserved instruction
    JMP $0F74            ; 4C 74 0F | Jump to address
    LSR $02              ; 46 02 | Logical shift right (zero page)
    EOR ($02,X)          ; 41 02 | Exclusive OR with accumulator ((zero page,X))
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $0F74            ; 4C 74 0F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_18E
; Address: $D68F74
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_18E:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0F83            ; 4C 83 0F | Jump to address
    JMP $0F86            ; 4C 86 0F | Jump to address
    EOR $02              ; 45 02 | Exclusive OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_191
; Address: $D68F90
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_191:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $0F9F            ; 4C 9F 0F | Jump to address
    JMP $0FA2            ; 4C A2 0F | Jump to address
    AND $6B02,X          ; 3D 02 6B | Logical AND with accumulator (absolute,X)
    DEC                  ; 3A | Decrement accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_194
; Address: $D68FB5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_194:
    AND $6B02,Y          ; 39 02 6B | Logical AND with accumulator (absolute,Y)
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_195
; Address: $D68FBC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_195:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $0FD2            ; 4C D2 0F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_19B
; Address: $D68FE7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_19B:
    LSR $6B02            ; 4E 02 6B | Logical shift right (absolute)
    LSR                  ; 4A | Logical shift right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_19D
; Address: $D68FF3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_19D:
    JMP $6B02            ; 4C 02 6B | Jump to address
    EOR $6B02            ; 4D 02 6B | Exclusive OR with accumulator (absolute)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1A5
; Address: $D6901B
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1A5:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $102C            ; 4C 2C 10 | Jump to address
    ADC $4C02,Y          ; 79 02 4C | Add with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BPL $AD              ; 10 AD | Branch if positive
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $103D            ; 4C 3D 10 | Jump to address
    ADC $4C02,Y          ; 79 02 4C | Add with carry (absolute,Y)
    RTI                  ; 40 | Return from interrupt
    BPL $00              ; 10 00 | Branch if positive
    CLI                  ; 58 | Clear interrupt disable flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1A6
; Address: $D69041
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1A6:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1061            ; 4C 61 10 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1A7
; Address: $D6904C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1A7:
    JSL $CC8AB1          ; 22 B1 8A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $105B            ; 4C 5B 10 | Jump to address
    PLY                  ; 7A | Pull Y register from stack
    JMP $105E            ; 4C 5E 10 | Jump to address
    JMP $1064            ; 4C 64 10 | Jump to address
    EOR $6B02,Y          ; 59 02 6B | Exclusive OR with accumulator (absolute,Y)
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1A8
; Address: $D6906D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1A8:
    JMP $1076            ; 4C 76 10 | Jump to address
    SEI                  ; 78 | Set interrupt disable flag
    JMP $1079            ; 4C 79 10 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1AA
; Address: $D6907F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1AA:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $10D3            ; 4C D3 10 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1AB
; Address: $D6908A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1AB:
    JSL $CC8AB1          ; 22 B1 8A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $10CD            ; 4C CD 10 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1AC
; Address: $D69096
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1AC:
    JSL $CC97CE          ; 22 CE 97 CC | Jump to subroutine long
    JMP $10AF            ; 4C AF 10 | Jump to address
    JMP $10CA            ; 4C CA 10 | Jump to address
    JMP $10CA            ; 4C CA 10 | Jump to address
    JMP $10CA            ; 4C CA 10 | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $109D            ; 4C 9D 10 | Jump to address
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $10A3            ; 4C A3 10 | Jump to address
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $10A9            ; 4C A9 10 | Jump to address
    JMP $10D0            ; 4C D0 10 | Jump to address
    JMP $10D6            ; 4C D6 10 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1AD
; Address: $D690D7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1AD:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $10F7            ; 4C F7 10 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1AE
; Address: $D690E2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1AE:
    JSL $CC8AB1          ; 22 B1 8A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $10F1            ; 4C F1 10 | Jump to address
    JMP $10F4            ; 4C F4 10 | Jump to address
    JMP $10FA            ; 4C FA 10 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1AF
; Address: $D690FB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1AF:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$48             ; C9 48 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1111            ; 4C 11 11 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1B0
; Address: $D6910A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1B0:
    JSL $CDC25A          ; 22 5A C2 CD | Jump to subroutine long
    JMP $112D            ; 4C 2D 11 | Jump to address
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1B1
; Address: $D69117
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1B1:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1126            ; 4C 26 11 | Jump to address
    ADC ($02),Y          ; 71 02 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1B6
; Address: $D69137
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1B6:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$F0             ; A2 F0 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$20             ; A0 20 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    ADC $53              ; 65 53 | Add with carry (zero page)
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1153            ; 4C 53 11 | Jump to address
    JMP $119B            ; 4C 9B 11 | Jump to address
    JMP $1198            ; 4C 98 11 | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$18             ; A2 18 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    CLV                  ; B8 | Clear overflow flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1B7
; Address: $D6915C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1B7:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $116B            ; 4C 6B 11 | Jump to address
    JMP $119B            ; 4C 9B 11 | Jump to address
    JMP $1198            ; 4C 98 11 | Jump to address
    LDA #$F0             ; A9 F0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$18             ; A2 18 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1B8
; Address: $D69174
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1B8:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1183            ; 4C 83 11 | Jump to address
    JMP $119B            ; 4C 9B 11 | Jump to address
    JMP $1198            ; 4C 98 11 | Jump to address
    LDA #$A0             ; A9 A0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$10             ; A2 10 | Load immediate value into X register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    SED                  ; F8 | Set decimal mode flag
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1BA
; Address: $D69190
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1BA:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1198            ; 4C 98 11 | Jump to address
    JMP $119B            ; 4C 9B 11 | Jump to address
    JMP $1137            ; 4C 37 11 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1BD
; Address: $D691A3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1BD:
    JSL $CDAF41          ; 22 41 AF CD | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    EOR #$35             ; 49 35 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1C0
; Address: $D691B6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1C0:
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $11C4            ; 4C C4 11 | Jump to address
    JMP $11DC            ; 4C DC 11 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1C2
; Address: $D691C9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1C2:
    JSL $CCD88A          ; 22 8A D8 CC | Jump to subroutine long
    LSR $2202,X          ; 5E 02 22 | Logical shift right (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $0222            ; CC 22 02 | Compare Y register (absolute)
    LDX $6BCD            ; AE CD 6B | Load from absolute address into X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1C3
; Address: $D691E1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1C3:
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $11F7            ; 4C F7 11 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1CA
; Address: $D69208
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1CA:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1217            ; 4C 17 12 | Jump to address
    JMP $121A            ; 4C 1A 12 | Jump to address
    JMP $D22202          ; 5C 02 22 D2 | Jump to address long
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $F422            ; CC 22 F4 | Compare Y register (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    AND ($AF,X)          ; 21 AF | Logical AND with accumulator ((zero page,X))
    CMP $CF22            ; CD 22 CF | Compare accumulator (absolute)
    CPY $2022            ; CC 22 20 | Compare Y register (absolute)
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $123D            ; 4C 3D 12 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1D0
; Address: $D6924D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1D0:
    JSL $CC8220          ; 22 20 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $125C            ; 4C 5C 12 | Jump to address
    ADC $02              ; 65 02 | Add with carry (zero page)
    JMP $125F            ; 4C 5F 12 | Jump to address
    ROR $02              ; 66 02 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1D5
; Address: $D69272
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1D5:
    JSL $C75219          ; 22 19 52 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $127F            ; 4C 7F 12 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1D6
; Address: $D6927B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1D6:
    JSL $CCD881          ; 22 81 D8 CC | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$20             ; A9 20 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1D8
; Address: $D69289
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1D8:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$1B             ; A2 1B | Load immediate value into X register
    LDA #$28             ; A9 28 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1E0
; Address: $D692B5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1E0:
    JSL $C7593B          ; 22 3B 59 C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA $3604            ; AD 04 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1E3
; Address: $D692CE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1E3:
    LDA $3549            ; AD 49 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $12DC            ; 4C DC 12 | Jump to address
    JMP $1344            ; 4C 44 13 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1EB
; Address: $D692FC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1EB:
    JSL $CC73CF          ; 22 CF 73 CC | Jump to subroutine long
    EOR $2202,X          ; 5D 02 22 | Exclusive OR with accumulator (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $FB22            ; CC 22 FB | Compare Y register (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    ORA ($AF),Y          ; 11 AF | Logical OR with accumulator ((zero page),Y)
    CMP $7822            ; CD 22 78 | Compare accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    CPY $14A9            ; CC A9 14 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_1FC
; Address: $D69361
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_1FC:
    LDA $3548            ; AD 48 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1372            ; 4C 72 13 | Jump to address
    JMP $1386            ; 4C 86 13 | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1383            ; 4C 83 13 | Jump to address
    JMP $1386            ; 4C 86 13 | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_201
; Address: $D69393
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_201:
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    BNE $CC              ; D0 CC | Branch if not equal
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_203
; Address: $D693A4
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_203:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    BVS $02              ; 70 02 | Branch if overflow set
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_204
; Address: $D693AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_204:
    ADC $6B02            ; 6D 02 6B | Add with carry (absolute)
    JMP ($6B02)          ; 6C 02 6B | Jump to address (absolute indirect)
    ROR $6B02            ; 6E 02 6B | Rotate right (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_205
; Address: $D693BC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_205:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    EOR $6B01,Y          ; 59 01 6B | Exclusive OR with accumulator (absolute,Y)
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    BRA $02              ; 80 02 | Branch always
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_206
; Address: $D693CA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_206:
    JSL $CC8AB1          ; 22 B1 8A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $13D9            ; 4C D9 13 | Jump to address
    JMP $13DC            ; 4C DC 13 | Jump to address
    ADC $6B02,X          ; 7D 02 6B | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_207
; Address: $D693DD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_207:
    JSL $CC8AB1          ; 22 B1 8A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $13EC            ; 4C EC 13 | Jump to address
    ROR $4C02,X          ; 7E 02 4C | Rotate right (absolute,X)
    STZ $02              ; 64 02 | Store zero to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_20E
; Address: $D6940A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_20E:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA $FD22            ; 0D 22 FD | Logical OR with accumulator (absolute)
    LDY #$CD             ; A0 CD | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_210
; Address: $D69418
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_210:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1440            ; 4C 40 14 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_211
; Address: $D69424
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_211:
    JSL $C74A4A          ; 22 4A 4A C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_214
; Address: $D69439
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_214:
    JSL $CDC6D9          ; 22 D9 C6 CD | Jump to subroutine long
    JMP $1453            ; 4C 53 14 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_21B
; Address: $D6945B
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_21B:
    JSL $C7559A          ; 22 9A 55 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1473            ; 4C 73 14 | Jump to address
    LDA $C12D            ; AD 2D C1 | Load from absolute address into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA $C12F            ; AD 2F C1 | Load from absolute address into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    JMP $147F            ; 4C 7F 14 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    STA $340A            ; 8D 0A 34 | Store accumulator to absolute address
    LDA #$6F             ; A9 6F | Load immediate value into accumulator
    STA $340C            ; 8D 0C 34 | Store accumulator to absolute address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA #$B4             ; A9 B4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_21C
; Address: $D69488
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_21C:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $14A1            ; 4C A1 14 | Jump to address
    JMP $1492            ; 4C 92 14 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_21E
; Address: $D694A8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_21E:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA $D222            ; 0D 22 D2 | Logical OR with accumulator (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register
    BVS $17              ; 70 17 | Branch if overflow set
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$64             ; C9 64 | Compare accumulator (immediate)
    ORA $0390,Y          ; 19 90 03 | Logical OR with accumulator (absolute,Y)
    JMP $14C7            ; 4C C7 14 | Jump to address
    JMP $14B8            ; 4C B8 14 | Jump to address
    LDA #$31             ; A9 31 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_220
; Address: $D694D1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_220:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPY #$D4             ; C0 D4 | Compare Y register (immediate)
    EOR $F6              ; 45 F6 | Exclusive OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $14E9            ; 4C E9 14 | Jump to address
    JMP $14D9            ; 4C D9 14 | Jump to address
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_221
; Address: $D694EC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_221:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $F6              ; 46 F6 | Logical shift right (zero page)
    LDA #$31             ; A9 31 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_222
; Address: $D694F7
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_222:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1504            ; 4C 04 15 | Jump to address
    JMP $14F4            ; 4C F4 14 | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$B0             ; C9 B0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1519            ; 4C 19 15 | Jump to address
    JMP $150A            ; 4C 0A 15 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$B0             ; C9 B0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1534            ; 4C 34 15 | Jump to address
    JMP $1525            ; 4C 25 15 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_223
; Address: $D69534
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_223:
    JSL $C047B2          ; 22 B2 47 C0 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $F6              ; 46 F6 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_224
; Address: $D6953B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_224:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LSR $F6              ; 46 F6 | Logical shift right (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $154B            ; 4C 4B 15 | Jump to address
    JMP $153B            ; 4C 3B 15 | Jump to address
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_225
; Address: $D6954E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_225:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    LSR $F6              ; 46 F6 | Logical shift right (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPY #$13             ; C0 13 | Compare Y register (immediate)
    LSR $F6              ; 46 F6 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_226
; Address: $D6955D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_226:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1566            ; 4C 66 15 | Jump to address
    JMP $1556            ; 4C 56 15 | Jump to address
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $157B            ; 4C 7B 15 | Jump to address
    JMP $156C            ; 4C 6C 15 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_229
; Address: $D69586
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_229:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    SEI                  ; 78 | Set interrupt disable flag
    ORA $11A9            ; 0D A9 11 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_22B
; Address: $D69593
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_22B:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $15B8            ; 4C B8 15 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_22C
; Address: $D6959F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_22C:
    JSL $C74A4A          ; 22 4A 4A C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_232
; Address: $D695C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_232:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $15D3            ; 4C D3 15 | Jump to address
    LDA #$11             ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_233
; Address: $D695CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_233:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    JMP $15DA            ; 4C DA 15 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_235
; Address: $D695DA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_235:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CMP #$20             ; C9 20 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $15FC            ; 4C FC 15 | Jump to address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$52             ; C9 52 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $15FC            ; 4C FC 15 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $AD36,Y          ; 19 36 AD | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_236
; Address: $D695FD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_236:
    ORA $2936,Y          ; 19 36 29 | Logical OR with accumulator (absolute,Y)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $165D            ; 4C 5D 16 | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_238
; Address: $D6960E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_238:
    JSL $CC8BDD          ; 22 DD 8B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $165D            ; 4C 5D 16 | Jump to address
    LDA $3404            ; AD 04 34 | Load from absolute address into accumulator
    CMP #$E7             ; C9 E7 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1645            ; 4C 45 16 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_23A
; Address: $D69628
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_23A:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA #$65             ; A9 65 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_240
; Address: $D69649
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_240:
    JSL $CDD93D          ; 22 3D D9 CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $3422            ; 8D 22 34 | Store accumulator to absolute address
    LDA #$62             ; A9 62 | Load immediate value into accumulator
    STA $3424            ; 8D 24 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_241
; Address: $D69659
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_241:
    JSL $CDD764          ; 22 64 D7 CD | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1672            ; 4C 72 16 | Jump to address
    JMP $1663            ; 4C 63 16 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_242
; Address: $D69684
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_242:
    JSL $CC9E5A          ; 22 5A 9E CC | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_246
; Address: $D6969B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_246:
    PHA                  ; 48 | Push accumulator to stack
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $16AC            ; 4C AC 16 | Jump to address
    JMP $169D            ; 4C 9D 16 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    STA $33D8            ; 8D D8 33 | Store accumulator to absolute address
    LDA $340A            ; AD 0A 34 | Load from absolute address into accumulator
    STA $33DA            ; 8D DA 33 | Store accumulator to absolute address
    LDA $340C            ; AD 0C 34 | Load from absolute address into accumulator
    STA $33DC            ; 8D DC 33 | Store accumulator to absolute address
    LDX #$CC             ; A2 CC | Load immediate value into X register
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    BEQ $22              ; F0 22 | Branch if equal
    CMP $C97C            ; CD 7C C9 | Compare accumulator (absolute)
    LDA #$0B             ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_247
; Address: $D696CB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_247:
    JSL $C79961          ; 22 61 99 C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $6F82            ; 8D 82 6F | Store accumulator to absolute address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $6F84            ; 8D 84 6F | Store accumulator to absolute address
    LDX $6F82            ; AE 82 6F | Load from absolute address into X register
    LDY $6F84            ; AC 84 6F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_248
; Address: $D696E1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_248:
    JSL $C97E8D          ; 22 8D 7E C9 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $6F84            ; 8D 84 6F | Store accumulator to absolute address
    LDA #$5F             ; A9 5F | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_249
; Address: $D696F1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_249:
    JSL $C72FC9          ; 22 C9 2F C7 | Jump to subroutine long
    LDA #$6A             ; A9 6A | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))
    BVC $00              ; 50 00 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_24A
; Address: $D696FB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_24A:
    JSL $C72FC9          ; 22 C9 2F C7 | Jump to subroutine long
    LDA $6F82            ; AD 82 6F | Load from absolute address into accumulator
    CMP #$30             ; C9 30 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $171F            ; 4C 1F 17 | Jump to address
    LDX $6F82            ; AE 82 6F | Load from absolute address into X register
    LDY $6F84            ; AC 84 6F | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_24C
; Address: $D69714
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_24C:
    JSL $C97F63          ; 22 63 7F C9 | Jump to subroutine long
    INC $6F82            ; EE 82 6F | Increment (absolute)
    JMP $16FF            ; 4C FF 16 | Jump to address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1732            ; 4C 32 17 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_24E
; Address: $D6972F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_24E:
    JMP $171F            ; 4C 1F 17 | Jump to address
    LDA #$5F             ; A9 5F | Load immediate value into accumulator
    ORA ($A2,X)          ; 01 A2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_251
; Address: $D69743
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_251:
    JSL $C97F9C          ; 22 9C 7F C9 | Jump to subroutine long
    LDA #$88             ; A9 88 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$70             ; C9 70 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $175C            ; 4C 5C 17 | Jump to address
    JMP $174D            ; 4C 4D 17 | Jump to address
    LDA #$A9             ; A9 A9 | Load immediate value into accumulator
    LDX #$50             ; A2 50 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_252
; Address: $D69762
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_252:
    JSL $C72FC9          ; 22 C9 2F C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $33D8            ; 8D D8 33 | Store accumulator to absolute address
    LDX #$CC             ; A2 CC | Load immediate value into X register
    LDA #$98             ; A9 98 | Load immediate value into accumulator
    BEQ $22              ; F0 22 | Branch if equal
    CMP #$A9             ; C9 A9 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_253
; Address: $D69779
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_253:
    JSL $C79961          ; 22 61 99 C7 | Jump to subroutine long
    LDA #$64             ; A9 64 | Load immediate value into accumulator
    ORA $088D,Y          ; 19 8D 08 | Logical OR with accumulator (absolute,Y)
    LDA $3408            ; AD 08 34 | Load from absolute address into accumulator
    CMP #$58             ; C9 58 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1796            ; 4C 96 17 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_254
; Address: $D6978E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_254:
    JSL $C97F63          ; 22 63 7F C9 | Jump to subroutine long
    JMP $1783            ; 4C 83 17 | Jump to address
    LDA #$0B             ; A9 0B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_256
; Address: $D6979D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_256:
    JSL $C97F9C          ; 22 9C 7F C9 | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    STA $3408            ; 8D 08 34 | Store accumulator to absolute address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_257
; Address: $D697A9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_257:
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $17B8            ; 4C B8 17 | Jump to address
    JMP $17A9            ; 4C A9 17 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_258
; Address: $D697B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_258:
    JSL $C74C1D          ; 22 1D 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $17C1            ; 4C C1 17 | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$64             ; 69 64 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_259
; Address: $D697C8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_259:
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $17DA            ; 4C DA 17 | Jump to address
    JMP $17CB            ; 4C CB 17 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_25A
; Address: $D697DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_25A:
    JSL $C74C1D          ; 22 1D 4C C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $17F6            ; 4C F6 17 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_25B
; Address: $D697E3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_25B:
    JSL $C750CD          ; 22 CD 50 C7 | Jump to subroutine long
    LDA $C135            ; AD 35 C1 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $17F6            ; 4C F6 17 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_25C
; Address: $D697F2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_25C:
    JSL $CC7649          ; 22 49 76 CC | Jump to subroutine long
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$64             ; 69 64 | Add with carry (immediate)
    STA $3402            ; 8D 02 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_25F
; Address: $D69808
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_25F:
    JSL $CCDB07          ; 22 07 DB CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $181B            ; 4C 1B 18 | Jump to address
    JMP $180C            ; 4C 0C 18 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_260
; Address: $D6981C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_260:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $182A            ; 4C 2A 18 | Jump to address
    JMP $1833            ; 4C 33 18 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_263
; Address: $D69834
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_263:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1843            ; 4C 43 18 | Jump to address
    STA $4C02,Y          ; 99 02 4C | Store accumulator to absolute,Y
    CLC                  ; 18 | Clear carry flag
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1854            ; 4C 54 18 | Jump to address
    STY $02              ; 84 02 | Store Y register to zero page
    JMP $1857            ; 4C 57 18 | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_265
; Address: $D6985B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_265:
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $186A            ; 4C 6A 18 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_26A
; Address: $D69878
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_26A:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1899            ; 4C 99 18 | Jump to address
    TXS                  ; 9A | Transfer X register to stack pointer

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_26B
; Address: $D69884
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_26B:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1893            ; 4C 93 18 | Jump to address
    JMP $1896            ; 4C 96 18 | Jump to address
    STZ $4C02            ; 9C 02 4C | Store zero to absolute
    LDA $AD18            ; AD 18 AD | Load from absolute address into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $18AA            ; 4C AA 18 | Jump to address
    STA $02              ; 85 02 | Store accumulator to zero page
    JMP $18AD            ; 4C AD 18 | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $18BC            ; 4C BC 18 | Jump to address
    JMP $18C5            ; 4C C5 18 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_26E
; Address: $D698C6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_26E:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $18D5            ; 4C D5 18 | Jump to address
    STA $4C02,X          ; 9D 02 4C | Store accumulator to absolute,X
    SBC #$18             ; E9 18 | Subtract with carry (immediate)
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $18E6            ; 4C E6 18 | Jump to address
    STX $02              ; 86 02 | Store X register to zero page
    JMP $18E9            ; 4C E9 18 | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_26F
; Address: $D698EA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_26F:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_275
; Address: $D6990A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_275:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $191B            ; 4C 1B 19 | Jump to address
    JMP $191E            ; 4C 1E 19 | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_276
; Address: $D6991F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_276:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1931            ; 4C 31 19 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_27C
; Address: $D69943
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_27C:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1955            ; 4C 55 19 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_27D
; Address: $D6994E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_27D:
    JSL $CDC19A          ; 22 9A C1 CD | Jump to subroutine long
    JMP $195C            ; 4C 5C 19 | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_27F
; Address: $D6995D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_27F:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $196F            ; 4C 6F 19 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_284
; Address: $D6997D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_284:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $198C            ; 4C 8C 19 | Jump to address
    STZ $4C02,X          ; 9E 02 4C | Store zero to absolute,X
    CMP ($19,X)          ; C1 19 | Compare accumulator ((zero page,X))
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_285
; Address: $D6998F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_285:
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19BE            ; 4C BE 19 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_286
; Address: $D69997
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_286:
    JSL $CC7D1C          ; 22 1C 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $19B8            ; 4C B8 19 | Jump to address
    DEY                  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_287
; Address: $D699A3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_287:
    JSL $CDACA0          ; 22 A0 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $19B2            ; 4C B2 19 | Jump to address
    BIT #$02             ; 89 02 | Test bits in accumulator (immediate)
    JMP $19B5            ; 4C B5 19 | Jump to address
    TXA                  ; 8A | Transfer X register to accumulator
    JMP $19BB            ; 4C BB 19 | Jump to address
    PHB                  ; 8B | Push data bank register to stack
    JMP $19C1            ; 4C C1 19 | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_288
; Address: $D699C2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_288:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $19EC            ; 4C EC 19 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_289
; Address: $D699CB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_289:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $19DB            ; 4C DB 19 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_28A
; Address: $D699D4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_28A:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $19E9            ; 4C E9 19 | Jump to address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    LDX #$35             ; A2 35 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_28C
; Address: $D699E5
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_28C:
    JSL $CCD837          ; 22 37 D8 CC | Jump to subroutine long
    JMP $1A0B            ; 4C 0B 1A | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $19FE            ; 4C FE 19 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_291
; Address: $D69A0C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_291:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1A1B            ; 4C 1B 1A | Jump to address
    LDY #$02             ; A0 02 | Load immediate value into Y register
    JMP $1A2F            ; 4C 2F 1A | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1A2C            ; 4C 2C 1A | Jump to address
    STA $4C02            ; 8D 02 4C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_292
; Address: $D69A2B
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_292:
    INC                  ; 1A | Increment accumulator
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_293
; Address: $D69A30
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_293:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1A5A            ; 4C 5A 1A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_294
; Address: $D69A39
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_294:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1A49            ; 4C 49 1A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_295
; Address: $D69A42
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_295:
    JSL $CCD3EB          ; 22 EB D3 CC | Jump to subroutine long
    JMP $1A57            ; 4C 57 1A | Jump to address
    LDA #$0C             ; A9 0C | Load immediate value into accumulator
    LDX #$41             ; A2 41 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_297
; Address: $D69A53
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_297:
    JSL $CCD18D          ; 22 8D D1 CC | Jump to subroutine long
    JMP $1A79            ; 4C 79 1A | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1A6C            ; 4C 6C 1A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_29C
; Address: $D69A7A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_29C:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1A98            ; 4C 98 1A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_29D
; Address: $D69A83
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_29D:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1A92            ; 4C 92 1A | Jump to address
    LDX #$02             ; A2 02 | Load immediate value into X register
    JMP $1A95            ; 4C 95 1A | Jump to address
    ADC ($01,X)          ; 61 01 | Add with carry ((zero page,X))
    JMP $1AAC            ; 4C AC 1A | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1AA9            ; 4C A9 1A | Jump to address
    STX $4C02            ; 8E 02 4C | Store X register to absolute address
    LDY $001A            ; AC 1A 00 | Load from absolute address into Y register
    STA ($02,X)          ; 81 02 | Store accumulator to (zero page,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_29E
; Address: $D69AAD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_29E:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1AC7            ; 4C C7 1A | Jump to address
    LDA #$34             ; A9 34 | Load immediate value into accumulator
    LDX #$60             ; A2 60 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2A0
; Address: $D69AC0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2A0:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $1ADE            ; 4C DE 1A | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1AD5            ; 4C D5 1A | Jump to address
    JMP $1ADE            ; 4C DE 1A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2A3
; Address: $D69ADF
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2A3:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1AF1            ; 4C F1 1A | Jump to address
    BCC $02              ; 90 02 | Branch if carry clear
    JMP $1B08            ; 4C 08 1B | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1B05            ; 4C 05 1B | Jump to address
    STA $900002          ; 8F 02 00 90 | Store accumulator to absolute long address
    JMP $1B08            ; 4C 08 1B | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2A4
; Address: $D69B09
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2A4:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1B4D            ; 4C 4D 1B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2AE
; Address: $D69B43
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2AE:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $1B1B            ; 4C 1B 1B | Jump to address
    JMP $1B70            ; 4C 70 1B | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1B5F            ; 4C 5F 1B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2B4
; Address: $D69B71
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2B4:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1B83            ; 4C 83 1B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2B5
; Address: $D69B7C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2B5:
    JSL $CDC262          ; 22 62 C2 CD | Jump to subroutine long
    JMP $1B8A            ; 4C 8A 1B | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2B7
; Address: $D69B8B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2B7:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1B9D            ; 4C 9D 1B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2BC
; Address: $D69BAB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2BC:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1BBC            ; 4C BC 1B | Jump to address
    STA ($02),Y          ; 91 02 | Store accumulator to (zero page),Y
    JMP $1BBF            ; 4C BF 1B | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2BD
; Address: $D69BC0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2BD:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1BDC            ; 4C DC 1B | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    LDX #$63             ; A2 63 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2C2
; Address: $D69BE4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2C2:
    JSL $C74CB6          ; 22 B6 4C C7 | Jump to subroutine long
    LDA $3406            ; AD 06 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1BF8            ; 4C F8 1B | Jump to address
    JMP $1BE9            ; 4C E9 1B | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1C39            ; 4C 39 1C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2C4
; Address: $D69C06
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2C4:
    JSL $C6249B          ; 22 9B 24 C6 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1C13            ; 4C 13 1C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2C5
; Address: $D69C0F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2C5:
    JSL $CCD066          ; 22 66 D0 CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LDX #$61             ; A2 61 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2C8
; Address: $D69C24
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2C8:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$12             ; A2 12 | Load immediate value into X register
    LDA #$63             ; A9 63 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2CA
; Address: $D69C32
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2CA:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    JMP $1C47            ; 4C 47 1C | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    LDX #$63             ; A2 63 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2CD
; Address: $D69C47
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2CD:
    JSL $CCD397          ; 22 97 D3 CC | Jump to subroutine long
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3406            ; 8D 06 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2D0
; Address: $D69C5A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2D0:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1C6C            ; 4C 6C 1C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2D5
; Address: $D69C7A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2D5:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1C89            ; 4C 89 1C | Jump to address
    STA                  ; 9F 02 4C 9D | Store accumulator to absolute long,X
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1C9A            ; 4C 9A 1C | Jump to address
    STY $4C02            ; 8C 02 4C | Store Y register to absolute address
    STA $001C,X          ; 9D 1C 00 | Store accumulator to absolute,X
    CLI                  ; 58 | Clear interrupt disable flag
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA ($02,X)          ; A1 02 | Load from (zero page,X) into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2D6
; Address: $D69CA2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2D6:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1CB0            ; 4C B0 1C | Jump to address
    JMP $1CB4            ; 4C B4 1C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2D8
; Address: $D69CB5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2D8:
    JSL $CC93F5          ; 22 F5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1CF4            ; 4C F4 1C | Jump to address
    LDY $02              ; A4 02 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2D9
; Address: $D69CC1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2D9:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1CEE            ; 4C EE 1C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2DA
; Address: $D69CCA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2DA:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1CE8            ; 4C E8 1C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2DB
; Address: $D69CD3
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2DB:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1CE2            ; 4C E2 1C | Jump to address
    LDX $02              ; A6 02 | Load from zero page into X register
    JMP $1CE5            ; 4C E5 1C | Jump to address
    JMP $1CEB            ; 4C EB 1C | Jump to address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    JMP $1CF1            ; 4C F1 1C | Jump to address
    LDA $02              ; A5 02 | Load from zero page into accumulator
    JMP $1D08            ; 4C 08 1D | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1D05            ; 4C 05 1D | Jump to address
    JMP $1D08            ; 4C 08 1D | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1D1B            ; 4C 1B 1D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2DE
; Address: $D69D20
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2DE:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1D62            ; 4C 62 1D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2DF
; Address: $D69D2E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2DF:
    JSL $CC7AEA          ; 22 EA 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1D5F            ; 4C 5F 1D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2E2
; Address: $D69D3F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2E2:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1D4A            ; 4C 4A 1D | Jump to address
    JMP $1D4D            ; 4C 4D 1D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2E3
; Address: $D69D4D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2E3:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1D5C            ; 4C 5C 1D | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $1D5F            ; 4C 5F 1D | Jump to address
    JMP $1D65            ; 4C 65 1D | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2E4
; Address: $D69D68
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2E4:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2EA
; Address: $D69D83
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2EA:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$1B             ; A9 1B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2F2
; Address: $D69DA9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2F2:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2F6
; Address: $D69DBF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2F6:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    JMP $1D77            ; 4C 77 1D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2F7
; Address: $D69DCA
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2F7:
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LSR                  ; 4A | Logical shift right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_2FA
; Address: $D69DDC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_2FA:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDX #$16             ; A2 16 | Load immediate value into X register
    LDA #$1D             ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_30E
; Address: $D69E3A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_30E:
    JSL $CCD88A          ; 22 8A D8 CC | Jump to subroutine long
    JMP $1E10            ; 4C 10 1E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_313
; Address: $D69E55
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_313:
    LDA $662202          ; AF 02 22 66 | Load from absolute long address into accumulator
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $1E63            ; 4C 63 1E | Jump to address
    BCS $02              ; B0 02 | Branch if carry set
    LDA ($02),Y          ; B1 02 | Load from (zero page),Y into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_316
; Address: $D69E71
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_316:
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1E82            ; 4C 82 1E | Jump to address
    LDX $4C02            ; AE 02 4C | Load from absolute address into X register
    STX $001E            ; 8E 1E 00 | Store X register to absolute address
    LDA $0002            ; AD 02 00 | Load from absolute address into accumulator
    LDX $A902            ; AE 02 A9 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_317
; Address: $D69E89
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_317:
    RTI                  ; 40 | Return from interrupt
    LSR                  ; 4A | Logical shift right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_321
; Address: $D69EB7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_321:
    JSL $C75219          ; 22 19 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $1EC7            ; 4C C7 1E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_32A
; Address: $D69EE7
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_32A:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1EF8            ; 4C F8 1E | Jump to address
    LDA $4C02,X          ; BD 02 4C | Load from absolute,X into accumulator
    ORA ($1F,X)          ; 01 1F | Logical OR with accumulator ((zero page,X))
    LDY $A902,X          ; BC 02 A9 | Load from absolute,X into Y register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_32D
; Address: $D69F29
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_32D:
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $1F3B            ; 4C 3B 1F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_32E
; Address: $D69F34
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_32E:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    JMP $1F29            ; 4C 29 1F | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $1F49            ; 4C 49 1F | Jump to address
    JMP $1FDF            ; 4C DF 1F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_32F
; Address: $D69F49
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_32F:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    JMP $1F79            ; 4C 79 1F | Jump to address
    JMP $1FA0            ; 4C A0 1F | Jump to address
    JMP $1F9C            ; 4C 9C 1F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_330
; Address: $D69F56
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_330:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    NOP                  ; EA | No operation
    JMP $1F9C            ; 4C 9C 1F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_331
; Address: $D69F5F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_331:
    JSL $CB2298          ; 22 98 22 CB | Jump to subroutine long
    INC $02              ; E6 02 | Increment (zero page)
    INX                  ; E8 | Increment X register
    JMP $1F9C            ; 4C 9C 1F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_332
; Address: $D69F6F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_332:
    JSL $CB2298          ; 22 98 22 CB | Jump to subroutine long
    SBC #$02             ; E9 02 | Subtract with carry (immediate)
    JMP $1F9C            ; 4C 9C 1F | Jump to address
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1F50            ; 4C 50 1F | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1F56            ; 4C 56 1F | Jump to address
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1F5F            ; 4C 5F 1F | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $1F6F            ; 4C 6F 1F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_33E
; Address: $D69FCD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_33E:
    JSL $C7593B          ; 22 3B 59 C7 | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_340
; Address: $D69FDB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_340:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_342
; Address: $D6A001
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_342:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    JMP $2001            ; 4C 01 20 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_345
; Address: $D6A012
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_345:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    ASL $8D00,X          ; 1E 00 8D | Arithmetic shift left (absolute,X)
    ORA ($9C),Y          ; 11 9C | Logical OR with accumulator ((zero page),Y)
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_347
; Address: $D6A03E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_347:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2054            ; 4C 54 20 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_348
; Address: $D6A04D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_348:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    JMP $2042            ; 4C 42 20 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2087            ; 4C 87 20 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_349
; Address: $D6A068
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_349:
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_34A
; Address: $D6A07D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_34A:
    JSL $C736C8          ; 22 C8 36 C7 | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    ROR $CCD3,X          ; 7E D3 CC | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_34C
; Address: $D6A08F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_34C:
    JSL $CDAEF1          ; 22 F1 AE CD | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $20A9            ; 4C A9 20 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_34F
; Address: $D6A0A9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_34F:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_350
; Address: $D6A0B9
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_350:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $20C8            ; 4C C8 20 | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_351
; Address: $D6A0C8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_351:
    JSL $CDAE02          ; 22 02 AE CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$9C             ; C9 9C | Compare accumulator (immediate)
    CLC                  ; 18 | Clear carry flag
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $20DB            ; 4C DB 20 | Jump to address
    JMP $20CC            ; 4C CC 20 | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2136            ; 4C 36 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_353
; Address: $D6A0EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_353:
    JSL $CDD682          ; 22 82 D6 CD | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_355
; Address: $D6A0F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_355:
    JSL $CB2142          ; 22 42 21 CB | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $2136            ; 4C 36 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_357
; Address: $D6A105
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_357:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$84             ; C9 84 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2114            ; 4C 14 21 | PPU graphics register access
    JMP $2105            ; 4C 05 21 | PPU graphics register access
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$3D             ; A9 3D | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$3E             ; A9 3E | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_35A
; Address: $D6A13A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_35A:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    JMP $213A            ; 4C 3A 21 | PPU graphics register access
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_35B
; Address: $D6A142
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_35B:
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $216B            ; 4C 6B 21 | PPU graphics register access
    LDA #$13             ; A9 13 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_35E
; Address: $D6A158
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_35E:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $216B            ; 4C 6B 21 | PPU graphics register access
    SEC                  ; 38 | Set carry flag
    JMP $21BE            ; 4C BE 21 | PPU graphics register access
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2194            ; 4C 94 21 | PPU graphics register access
    LDA #$12             ; A9 12 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_361
; Address: $D6A181
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_361:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2194            ; 4C 94 21 | PPU graphics register access
    SEC                  ; 38 | Set carry flag
    JMP $21BE            ; 4C BE 21 | PPU graphics register access
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_362
; Address: $D6A19A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_362:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $21BD            ; 4C BD 21 | PPU graphics register access
    LDA #$11             ; A9 11 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_365
; Address: $D6A1AA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_365:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA $3424            ; AD 24 34 | Load from absolute address into accumulator
    CMP #$3E             ; C9 3E | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $21BD            ; 4C BD 21 | PPU graphics register access
    SEC                  ; 38 | Set carry flag
    JMP $21BE            ; 4C BE 21 | PPU graphics register access
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_366
; Address: $D6A1BF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_366:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $21D1            ; 4C D1 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_369
; Address: $D6A1D6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_369:
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $21FD            ; 4C FD 21 | PPU graphics register access
    LDA $362D            ; AD 2D 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_36A
; Address: $D6A1E4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_36A:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    LDX #$3E             ; A2 3E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_36C
; Address: $D6A1F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_36C:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    JMP $21FD            ; 4C FD 21 | PPU graphics register access
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_36D
; Address: $D6A1FF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_36D:
    JSL $CDAF11          ; 22 11 AF CD | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2215            ; 4C 15 22 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_36F
; Address: $D6A215
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_36F:
    JSL $CC7D65          ; 22 65 7D CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2227            ; 4C 27 22 | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    STA $362B            ; 8D 2B 36 | Store accumulator to absolute address
    JMP $2251            ; 4C 51 22 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_371
; Address: $D6A22D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_371:
    JMP $2239            ; 4C 39 22 | Jump to address
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $362B            ; 8D 2B 36 | Store accumulator to absolute address
    JMP $2251            ; 4C 51 22 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_372
; Address: $D6A239
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_372:
    JSL $CC7D7A          ; 22 7A 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $224B            ; 4C 4B 22 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $362B            ; 8D 2B 36 | Store accumulator to absolute address
    JMP $2251            ; 4C 51 22 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $362B            ; 8D 2B 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_373
; Address: $D6A251
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_373:
    JSL $CCD4AA          ; 22 AA D4 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $226A            ; 4C 6A 22 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_374
; Address: $D6A260
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_374:
    JSL $C74D4E          ; 22 4E 4D C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $362D            ; 8D 2D 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_376
; Address: $D6A26E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_376:
    JSL $CDAF21          ; 22 21 AF CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2293            ; 4C 93 22 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_377
; Address: $D6A27D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_377:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$3E             ; A9 3E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_37C
; Address: $D6A298
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_37C:
    LDA $360A            ; AD 0A 36 | Load from absolute address into accumulator
    STA $C10D            ; 8D 0D C1 | Store accumulator to absolute address
    LDX #$07             ; A2 07 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_37D
; Address: $D6A2A1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_37D:
    JSL $C788DF          ; 22 DF 88 C7 | Jump to subroutine long
    LDA $C161            ; AD 61 C1 | Load from absolute address into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_380
; Address: $D6A2B3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_380:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ADC $01              ; 65 01 | Add with carry (zero page)
    JMP $22FC            ; 4C FC 22 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_381
; Address: $D6A2BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_381:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    CLD                  ; D8 | Clear decimal mode flag
    JMP $22FC            ; 4C FC 22 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_384
; Address: $D6A2CF
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_384:
    JSL $CB2298          ; 22 98 22 CB | Jump to subroutine long
    JMP $22FC            ; 4C FC 22 | Jump to address
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $22AF            ; 4C AF 22 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $22BC            ; 4C BC 22 | Jump to address
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $22C5            ; 4C C5 22 | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $22CF            ; 4C CF 22 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_385
; Address: $D6A2FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_385:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $230F            ; 4C 0F 23 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_388
; Address: $D6A314
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_388:
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $233B            ; 4C 3B 23 | Jump to address
    LDA $362F            ; AD 2F 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_389
; Address: $D6A322
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_389:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    LDX #$40             ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_38B
; Address: $D6A333
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_38B:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    JMP $233B            ; 4C 3B 23 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_38D
; Address: $D6A341
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_38D:
    JSL $CDAF11          ; 22 11 AF CD | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2353            ; 4C 53 23 | Jump to address
    JMP $236C            ; 4C 6C 23 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_38E
; Address: $D6A353
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_38E:
    JSL $CCD4EA          ; 22 EA D4 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $236C            ; 4C 6C 23 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_38F
; Address: $D6A362
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_38F:
    JSL $C74D4E          ; 22 4E 4D C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $362F            ; 8D 2F 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_391
; Address: $D6A370
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_391:
    JSL $CDAF21          ; 22 21 AF CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2395            ; 4C 95 23 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_392
; Address: $D6A37F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_392:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$40             ; A9 40 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_397
; Address: $D6A39A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_397:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $23AC            ; 4C AC 23 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_39A
; Address: $D6A3B1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_39A:
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $23D8            ; 4C D8 23 | Jump to address
    LDA $3631            ; AD 31 36 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_39B
; Address: $D6A3BF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_39B:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    LDX #$42             ; A2 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_39D
; Address: $D6A3D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_39D:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    JMP $23D8            ; 4C D8 23 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_39F
; Address: $D6A3DE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_39F:
    JSL $CDAF11          ; 22 11 AF CD | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $23F0            ; 4C F0 23 | Jump to address
    JMP $2409            ; 4C 09 24 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3A0
; Address: $D6A3F0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3A0:
    JSL $CCD52A          ; 22 2A D5 CC | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2409            ; 4C 09 24 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3A1
; Address: $D6A3FF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3A1:
    JSL $C74D4E          ; 22 4E 4D C7 | Jump to subroutine long
    LDA $C18D            ; AD 8D C1 | Load from absolute address into accumulator
    STA $3631            ; 8D 31 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3A3
; Address: $D6A40D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3A3:
    JSL $CDAF21          ; 22 21 AF CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2432            ; 4C 32 24 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3A4
; Address: $D6A41C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3A4:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$42             ; A9 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3AA
; Address: $D6A43B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3AA:
    JSL $C72F5E          ; 22 5E 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $244B            ; 4C 4B 24 | Jump to address
    LDA #$17             ; A9 17 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3AB
; Address: $D6A447
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3AB:
    JSL $C72FB2          ; 22 B2 2F C7 | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $245A            ; 4C 5A 24 | Jump to address
    JMP $244B            ; 4C 4B 24 | Jump to address
    JMP $2499            ; 4C 99 24 | Jump to address
    LDX #$FF             ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3AC
; Address: $D6A460
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3AC:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    JMP $24CC            ; 4C CC 24 | Jump to address
    LDX #$E8             ; A2 E8 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3AD
; Address: $D6A46A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3AD:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    JMP $24CC            ; 4C CC 24 | Jump to address
    LDX #$C6             ; A2 C6 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3AE
; Address: $D6A474
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3AE:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    JMP $24CC            ; 4C CC 24 | Jump to address
    LDX #$B4             ; A2 B4 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3AF
; Address: $D6A47E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3AF:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    JMP $24CC            ; 4C CC 24 | Jump to address
    LDX #$A0             ; A2 A0 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3B0
; Address: $D6A488
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3B0:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    JMP $24CC            ; 4C CC 24 | Jump to address
    LDX #$8C             ; A2 8C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3B1
; Address: $D6A492
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3B1:
    JSL $C73033          ; 22 33 30 C7 | Jump to subroutine long
    JMP $24CC            ; 4C CC 24 | Jump to address
    LDA $3402            ; AD 02 34 | Load from absolute address into accumulator
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3B2
; Address: $D6A4A1
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3B2:
    JMP $245D            ; 4C 5D 24 | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2467            ; 4C 67 24 | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2471            ; 4C 71 24 | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $247B            ; 4C 7B 24 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2485            ; 4C 85 24 | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $248F            ; 4C 8F 24 | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    BIT $6B              ; 24 6B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3BB
; Address: $D6A4FF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3BB:
    LDA                  ; BF 02 6B 00 | Load from absolute long,X into accumulator
    CMP ($02,X)          ; C1 02 | Compare accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3C0
; Address: $D6A51A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3C0:
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2529            ; 4C 29 25 | Jump to address
    JMP $251A            ; 4C 1A 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3C2
; Address: $D6A52D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3C2:
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2539            ; 4C 39 25 | Jump to address
    JMP $252A            ; 4C 2A 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3C5
; Address: $D6A546
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3C5:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3C9
; Address: $D6A563
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3C9:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$E8             ; E9 E8 | Subtract with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3CB
; Address: $D6A575
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3CB:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    JMP $253F            ; 4C 3F 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3CF
; Address: $D6A58D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3CF:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3D3
; Address: $D6A5AA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3D3:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$E8             ; E9 E8 | Subtract with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3D5
; Address: $D6A5BC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3D5:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    JMP $2586            ; 4C 86 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3DA
; Address: $D6A5D4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3DA:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$E8             ; 69 E8 | Add with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3DE
; Address: $D6A5F1
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3DE:
    JSL $CCD58C          ; 22 8C D5 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$E8             ; E9 E8 | Subtract with carry (immediate)
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3E0
; Address: $D6A603
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3E0:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    JMP $25CD            ; 4C CD 25 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3E2
; Address: $D6A60F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3E2:
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2620            ; 4C 20 26 | Jump to address
    CPY $4C02            ; CC 02 4C | Compare Y register (absolute)
    EOR $AD26,Y          ; 59 26 AD | Exclusive OR with accumulator (absolute,Y)
    JMP $2935            ; 4C 35 29 | Jump to address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2656            ; 4C 56 26 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3E9
; Address: $D6A648
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3E9:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    CPY $2202            ; CC 02 22 | Compare Y register (absolute)
    CPY $594C            ; CC 4C 59 | Compare Y register (absolute)
    ROL $00              ; 26 00 | Rotate left (zero page)
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3EA
; Address: $D6A65A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3EA:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3EB
; Address: $D6A662
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3EB:
    JMP $266B            ; 4C 6B 26 | Jump to address
    INY                  ; C8 | Increment Y register
    JMP $266E            ; 4C 6E 26 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3F1
; Address: $D6A685
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3F1:
    JSL $C7522F          ; 22 2F 52 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2692            ; 4C 92 26 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3F6
; Address: $D6A6A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3F6:
    JSL $CDADDF          ; 22 DF AD CD | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$3A             ; A9 3A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3FD
; Address: $D6A6C3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3FD:
    JSL $CC7D31          ; 22 31 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $26DC            ; 4C DC 26 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3FE
; Address: $D6A6CF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3FE:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_3FF
; Address: $D6A6DC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_3FF:
    JSL $CC7B5A          ; 22 5A 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2725            ; 4C 25 27 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2715            ; 4C 15 27 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_400
; Address: $D6A6F3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_400:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2712            ; 4C 12 27 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_401
; Address: $D6A6FF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_401:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)
    PHP                  ; 08 | Push processor status to stack
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    JMP $2725            ; 4C 25 27 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_402
; Address: $D6A718
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_402:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_404
; Address: $D6A72C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_404:
    JSL $CCDB33          ; 22 33 DB CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    PEA #$CDAD           ; F4 AD CD | Push effective address to stack
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2757            ; 4C 57 27 | Jump to address
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2754            ; 4C 54 27 | Jump to address
    JMP $2745            ; 4C 45 27 | Jump to address
    JMP $26BF            ; 4C BF 26 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_405
; Address: $D6A757
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_405:
    JSL $CCD952          ; 22 52 D9 CC | Jump to subroutine long
    LDX #$22             ; A2 22 | Load immediate value into X register
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_40C
; Address: $D6A77A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_40C:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $278C            ; 4C 8C 27 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_40F
; Address: $D6A791
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_40F:
    JSL $CC7D1C          ; 22 1C 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $27A1            ; 4C A1 27 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_412
; Address: $D6A7A9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_412:
    JSL $CC7D1C          ; 22 1C 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $27DE            ; 4C DE 27 | Jump to address
    BNE $02              ; D0 02 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_413
; Address: $D6A7B5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_413:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $27D4            ; 4C D4 27 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_417
; Address: $D6A7CD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_417:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $27DB            ; 4C DB 27 | Jump to address
    CMP ($02),Y          ; D1 02 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_41C
; Address: $D6A7EE
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_41C:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    CMP $2202            ; CD 02 22 | Compare accumulator (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    EOR ($BD,X)          ; 41 BD | Exclusive OR with accumulator ((zero page,X))
    CMP $226B            ; CD 6B 22 | Compare accumulator (absolute)
    ADC ($D9,X)          ; 61 D9 | Add with carry ((zero page,X))
    CMP $1CA9            ; CD A9 1C | Compare accumulator (absolute)
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_41E
; Address: $D6A825
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_41E:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $283B            ; 4C 3B 28 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_41F
; Address: $D6A834
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_41F:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    JMP $2829            ; 4C 29 28 | Jump to address
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2863            ; 4C 63 28 | Jump to address
    LDA #$19             ; A9 19 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_42A
; Address: $D6A87A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_42A:
    JSL $C751F0          ; 22 F0 51 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $2898            ; 4C 98 28 | Jump to address
    LDX #$24             ; A2 24 | Load immediate value into X register
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_42E
; Address: $D6A898
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_42E:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $28B6            ; 4C B6 28 | Jump to address
    LDX #$20             ; A2 20 | Load immediate value into X register
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_431
; Address: $D6A8AF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_431:
    JSL $CCD863          ; 22 63 D8 CC | Jump to subroutine long
    JMP $28D3            ; 4C D3 28 | Jump to address
    LDX #$26             ; A2 26 | Load immediate value into X register
    LDA #$1C             ; A9 1C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_43E
; Address: $D6A8EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_43E:
    JSL $CDE093          ; 22 93 E0 CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDX #$1C             ; A2 1C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_444
; Address: $D6A913
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_444:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $291C            ; 4C 1C 29 | Jump to address
    JMP $290C            ; 4C 0C 29 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_447
; Address: $D6A927
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_447:
    JSL $CCD410          ; 22 10 D4 CC | Jump to subroutine long
    CPX #$02             ; E0 02 | Compare X register (immediate)
    SBC ($02,X)          ; E1 02 | Subtract with carry ((zero page,X))
    SEP #$02             ; E2 02 | Set processor status bits
    LDA #$2A             ; A9 2A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_449
; Address: $D6A947
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_449:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2954            ; 4C 54 29 | Jump to address
    JMP $2944            ; 4C 44 29 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_45A
; Address: $D6A997
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_45A:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_45C
; Address: $D6A9BD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_45C:
    JSL $CDDD60          ; 22 60 DD CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_45D
; Address: $D6A9D9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_45D:
    LDA #$22             ; A9 22 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_460
; Address: $D6A9F4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_460:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2A06            ; 4C 06 2A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_461
; Address: $D6A9FF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_461:
    JSL $CB2A07          ; 22 07 2A CB | Jump to subroutine long
    JMP $2A06            ; 4C 06 2A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_463
; Address: $D6AA0C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_463:
    JSL $CDAF11          ; 22 11 AF CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_467
; Address: $D6AA25
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_467:
    JSL $CCD881          ; 22 81 D8 CC | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$1D             ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_46A
; Address: $D6AA37
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_46A:
    JSL $CCD784          ; 22 84 D7 CC | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$1F             ; A2 1F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_46F
; Address: $D6AA56
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_46F:
    DEC $6B02            ; CE 02 6B | Decrement (absolute)
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2A75            ; 4C 75 2A | Jump to address
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_474
; Address: $D6AA7E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_474:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDA #$24             ; A9 24 | Load immediate value into accumulator
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_479
; Address: $D6AA9F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_479:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $2AAB            ; 4C AB 2A | Jump to address
    CMP $0002,X          ; DD 02 00 | Compare accumulator (absolute,X)
    DEC $2202,X          ; DE 02 22 | Decrement (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    AND ($AF),Y          ; 31 AF | Logical AND with accumulator ((zero page),Y)
    CMP $20A2            ; CD A2 20 | Compare accumulator (absolute)
    LDA #$18             ; A9 18 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_47E
; Address: $D6AAD1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_47E:
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2AE6            ; 4C E6 2A | Jump to address
    SBC $02              ; E5 02 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_482
; Address: $D6AAF0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_482:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    SBC $2202            ; ED 02 22 | Subtract with carry (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    INC $AD              ; E6 AD | Increment (zero page)
    CMP $0122            ; CD 22 01 | Compare accumulator (absolute)
    LDA $6422CD          ; AF CD 22 64 | Load from absolute long address into accumulator
    CMP $C622            ; CD 22 C6 | Compare accumulator (absolute)
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    EOR ($AF),Y          ; 51 AF | Exclusive OR with accumulator ((zero page),Y)
    CMP $8322            ; CD 22 83 | Compare accumulator (absolute)
    CPY $02A9            ; CC A9 02 | Compare Y register (absolute)
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_485
; Address: $D6AB28
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_485:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $2B36            ; 4C 36 2B | Jump to address
    LDA #$10             ; A9 10 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_487
; Address: $D6AB3E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_487:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2B4F            ; 4C 4F 2B | Jump to address
    JMP $2B52            ; 4C 52 2B | Jump to address
    PEA #$6B02           ; F4 02 6B | Push effective address to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_488
; Address: $D6AB57
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_488:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2B68            ; 4C 68 2B | Jump to address
    SED                  ; F8 | Set decimal mode flag
    JMP $2B6B            ; 4C 6B 2B | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_48A
; Address: $D6AB72
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_48A:
    SBC $6B02,Y          ; F9 02 6B | Subtract with carry (absolute,Y)
    PLX                  ; FA | Pull X register from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_48B
; Address: $D6AB79
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_48B:
    LDA $3555            ; AD 55 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2B99            ; 4C 99 2B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_48C
; Address: $D6AB84
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_48C:
    JSL $CCDADF          ; 22 DF DA CC | Jump to subroutine long
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    LDX #$58             ; A2 58 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_491
; Address: $D6ABA3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_491:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    INC $2202            ; EE 02 22 | Increment (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    SBC $CDAD            ; ED AD CD | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_49C
; Address: $D6ABDD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_49C:
    JSL $CCD7EF          ; 22 EF D7 CC | Jump to subroutine long
    LDX #$26             ; A2 26 | Load immediate value into X register
    LDA #$57             ; A9 57 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_49F
; Address: $D6ABEF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_49F:
    JSL $CDAE10          ; 22 10 AE CD | Jump to subroutine long
    LDX #$28             ; A2 28 | Load immediate value into X register
    LDA #$4B             ; A9 4B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4A4
; Address: $D6AC0A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4A4:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2C78            ; 4C 78 2C | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2C3B            ; 4C 3B 2C | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2C31            ; 4C 31 2C | Jump to address
    JMP $2C34            ; 4C 34 2C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4A6
; Address: $D6AC3E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4A6:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $2C68            ; 4C 68 2C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4A7
; Address: $D6AC4A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4A7:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA $2203            ; 0D 03 22 | Logical OR with accumulator (absolute)
    INC                  ; 1A | Increment accumulator
    LDY #$CC             ; A0 CC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4A8
; Address: $D6AC54
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4A8:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    BIT $0F00            ; 2C 00 0F | Test bits in accumulator (absolute)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    BIT $42AD            ; 2C AD 42 | Hardware register operation
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2C8D            ; 4C 8D 2C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4A9
; Address: $D6AC84
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4A9:
    ASL $2203            ; 0E 03 22 | Arithmetic shift left (absolute)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    BIT $55AD            ; 2C AD 55 | Test bits in accumulator (absolute)
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2CD4            ; 4C D4 2C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4AB
; Address: $D6ACA2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4AB:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $2CC6            ; 4C C6 2C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4AC
; Address: $D6ACAE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4AC:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA $2203            ; 0D 03 22 | Logical OR with accumulator (absolute)
    ASL $A8              ; 06 A8 | Arithmetic shift left (zero page)
    CMP $0922            ; CD 22 09 | Compare accumulator (absolute)
    LDY #$CC             ; A0 CC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4AD
; Address: $D6ACBC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4AD:
    JSL $CDACEE          ; 22 EE AC CD | Jump to subroutine long
    ASL $4C03            ; 0E 03 4C | Arithmetic shift left (absolute)
    CMP #$2C             ; C9 2C | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4AF
; Address: $D6ACCD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4AF:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $2CD7            ; 4C D7 2C | Jump to address
    CPX $6B02            ; EC 02 6B | Compare X register (absolute)
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2CEA            ; 4C EA 2C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4BC
; Address: $D6AD1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4BC:
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2D30            ; 4C 30 2D | Jump to address
    SBC ($02),Y          ; F1 02 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4C0
; Address: $D6AD35
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4C0:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2D6E            ; 4C 6E 2D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4C2
; Address: $D6AD4A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4C2:
    JSL $CC9395          ; 22 95 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $2D59            ; 4C 59 2D | Jump to address
    INC $4C02,X          ; FE 02 4C | Increment (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4C3
; Address: $D6AD58
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4C3:
    AND $B022            ; 2D 22 B0 | Logical AND with accumulator (absolute)
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $2D68            ; 4C 68 2D | Jump to address
    JMP $2D6B            ; 4C 6B 2D | Jump to address
    SBC $4C02,X          ; FD 02 4C | Subtract with carry (absolute,X)
    ADC ($2D),Y          ; 71 2D | Add with carry ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4C7
; Address: $D6AD7F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4C7:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2D9B            ; 4C 9B 2D | Jump to address
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$27             ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4CB
; Address: $D6ADA0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4CB:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2DB1            ; 4C B1 2D | Jump to address
    JMP $2DB4            ; 4C B4 2D | Jump to address
    BPL $03              ; 10 03 | Branch if positive
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4CC
; Address: $D6ADB5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4CC:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2DD1            ; 4C D1 2D | Jump to address
    LDA #$16             ; A9 16 | Load immediate value into accumulator
    LDX #$25             ; A2 25 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4D0
; Address: $D6ADD6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4D0:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2DE7            ; 4C E7 2D | Jump to address
    JMP $2DEA            ; 4C EA 2D | Jump to address
    ORA ($03),Y          ; 11 03 | Logical OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4D2
; Address: $D6ADF0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4D2:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2E0C            ; 4C 0C 2E | Jump to address
    LDA #$27             ; A9 27 | Load immediate value into accumulator
    LDX #$27             ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4D6
; Address: $D6AE11
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4D6:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2E34            ; 4C 34 2E | Jump to address
    ORA ($03,X)          ; 01 03 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4D7
; Address: $D6AE1F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4D7:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $2E2E            ; 4C 2E 2E | Jump to address
    JMP $2E31            ; 4C 31 2E | Jump to address
    JMP $2E3E            ; 4C 3E 2E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4D9
; Address: $D6AE3F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4D9:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2E51            ; 4C 51 2E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4DA
; Address: $D6AE4A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4DA:
    JSL $CDAD3C          ; 22 3C AD CD | Jump to subroutine long
    JMP $2E54            ; 4C 54 2E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4DB
; Address: $D6AE55
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4DB:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2E67            ; 4C 67 2E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4DC
; Address: $D6AE60
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4DC:
    JSL $CDAD8D          ; 22 8D AD CD | Jump to subroutine long
    JMP $2E6A            ; 4C 6A 2E | Jump to address
    RTI                  ; 40 | Return from interrupt
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4DE
; Address: $D6AE6E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4DE:
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2E7D            ; 4C 7D 2E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4DF
; Address: $D6AE76
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4DF:
    JSL $CDAD72          ; 22 72 AD CD | Jump to subroutine long
    JMP $2E80            ; 4C 80 2E | Jump to address
    EOR ($03,X)          ; 41 03 | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4E0
; Address: $D6AE81
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4E0:
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2E9D            ; 4C 9D 2E | Jump to address
    LDA #$4A             ; A9 4A | Load immediate value into accumulator
    LDX #$53             ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4E4
; Address: $D6AEA2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4E4:
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2EB3            ; 4C B3 2E | Jump to address
    EOR ($03),Y          ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
    JMP $2F32            ; 4C 32 2F | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2F2F            ; 4C 2F 2F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4E7
; Address: $D6AEC9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4E7:
    JSL $C74B9C          ; 22 9C 4B C7 | Jump to subroutine long
    LDA #$48             ; A9 48 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $3426            ; 8D 26 34 | Store accumulator to absolute address
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    STA $3428            ; 8D 28 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4E9
; Address: $D6AEDD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4E9:
    JSL $CC750E          ; 22 0E 75 CC | Jump to subroutine long
    LDA #$4A             ; A9 4A | Load immediate value into accumulator
    LDX #$53             ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4F5
; Address: $D6AF1B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4F5:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    EOR ($03),Y          ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
    LDA #$80             ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4F6
; Address: $D6AF28
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4F6:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $2F32            ; 4C 32 2F | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4F7
; Address: $D6AF33
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4F7:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2F44            ; 4C 44 2F | Jump to address
    JMP $2F47            ; 4C 47 2F | Jump to address
    WDM #$03             ; 42 03 | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4F8
; Address: $D6AF48
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4F8:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2F59            ; 4C 59 2F | Jump to address
    JMP $2F5C            ; 4C 5C 2F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4F9
; Address: $D6AF5D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4F9:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2F6E            ; 4C 6E 2F | Jump to address
    JMP $2F71            ; 4C 71 2F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4FA
; Address: $D6AF72
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4FA:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2F84            ; 4C 84 2F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4FB
; Address: $D6AF7D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4FB:
    JSL $CDAD40          ; 22 40 AD CD | Jump to subroutine long
    JMP $2F87            ; 4C 87 2F | Jump to address
    EOR $03              ; 45 03 | Exclusive OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4FC
; Address: $D6AF88
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4FC:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2F9A            ; 4C 9A 2F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4FD
; Address: $D6AF93
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4FD:
    JSL $CDAD38          ; 22 38 AD CD | Jump to subroutine long
    JMP $2F9D            ; 4C 9D 2F | Jump to address
    LSR $03              ; 46 03 | Logical shift right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_4FF
; Address: $D6AFA4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_4FF:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2FAF            ; 4C AF 2F | Jump to address
    JMP $2FB2            ; 4C B2 2F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_500
; Address: $D6AFB3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_500:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2FC8            ; 4C C8 2F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_503
; Address: $D6AFCD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_503:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2FE1            ; 4C E1 2F | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag
    JMP $2FE7            ; 4C E7 2F | Jump to address
    PHA                  ; 48 | Push accumulator to stack
    EOR #$03             ; 49 03 | Exclusive OR with accumulator (immediate)
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_504
; Address: $D6AFEE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_504:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $2FFF            ; 4C FF 2F | Jump to address
    EOR $4C03,Y          ; 59 03 4C | Exclusive OR with accumulator (absolute,Y)
    BMI $00              ; 30 00 | Branch if negative
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_505
; Address: $D6B003
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_505:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3014            ; 4C 14 30 | Jump to address
    PHY                  ; 5A | Push Y register to stack
    JMP $3017            ; 4C 17 30 | Jump to address
    LSR                  ; 4A | Logical shift right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_506
; Address: $D6B018
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_506:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $303B            ; 4C 3B 30 | Jump to address
    LDA #$43             ; A9 43 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_507
; Address: $D6B026
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_507:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    LDX #$2E             ; A2 2E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_50C
; Address: $D6B040
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_50C:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3052            ; 4C 52 30 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_50D
; Address: $D6B04B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_50D:
    JSL $CDAD3C          ; 22 3C AD CD | Jump to subroutine long
    JMP $3055            ; 4C 55 30 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_50E
; Address: $D6B056
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_50E:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3079            ; 4C 79 30 | Jump to address
    LDA #$39             ; A9 39 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_50F
; Address: $D6B064
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_50F:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    LDX #$2C             ; A2 2C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_513
; Address: $D6B07E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_513:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $308F            ; 4C 8F 30 | Jump to address
    JMP $3092            ; 4C 92 30 | Jump to address
    JMP $6B03            ; 4C 03 6B | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $30B6            ; 4C B6 30 | Jump to address
    LDA #$34             ; A9 34 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_514
; Address: $D6B0A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_514:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    LDX #$1B             ; A2 1B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_516
; Address: $D6B0AF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_516:
    JSL $CCD847          ; 22 47 D8 CC | Jump to subroutine long
    JMP $30C4            ; 4C C4 30 | Jump to address
    LDA #$28             ; A9 28 | Load immediate value into accumulator
    LDX #$2E             ; A2 2E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_519
; Address: $D6B0C5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_519:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $30D6            ; 4C D6 30 | Jump to address
    JMP $D94C03          ; 5C 03 4C D9 | Jump to address long
    BMI $00              ; 30 00 | Branch if negative
    EOR $6B03            ; 4D 03 6B | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_51A
; Address: $D6B0DA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_51A:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $30FA            ; 4C FA 30 | Jump to address
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    LDX #$17             ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_528
; Address: $D6B12A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_528:
    JSL $CCD428          ; 22 28 D4 CC | Jump to subroutine long
    JMP $3108            ; 4C 08 31 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_529
; Address: $D6B132
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_529:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3143            ; 4C 43 31 | Jump to address
    EOR $4C03,X          ; 5D 03 4C | Exclusive OR with accumulator (absolute,X)
    LSR $31              ; 46 31 | Logical shift right (zero page)
    LSR $6B03            ; 4E 03 6B | Logical shift right (absolute)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $316A            ; 4C 6A 31 | Jump to address
    LDA #$41             ; A9 41 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_52A
; Address: $D6B155
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_52A:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$17             ; A2 17 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_52E
; Address: $D6B16F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_52E:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3180            ; 4C 80 31 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_52F
; Address: $D6B17B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_52F:
    LSR $4C03,X          ; 5E 03 4C | Logical shift right (absolute,X)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_530
; Address: $D6B184
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_530:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $319A            ; 4C 9A 31 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_534
; Address: $D6B19F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_534:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $31B4            ; 4C B4 31 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_537
; Address: $D6B1B9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_537:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $31CE            ; 4C CE 31 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_538
; Address: $D6B1C7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_538:
    JSL $CDAD38          ; 22 38 AD CD | Jump to subroutine long
    JMP $31D1            ; 4C D1 31 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_53A
; Address: $D6B1D2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_53A:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $31E4            ; 4C E4 31 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_53B
; Address: $D6B1DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_53B:
    JSL $CDAD3C          ; 22 3C AD CD | Jump to subroutine long
    JMP $31E7            ; 4C E7 31 | Jump to address
    ADC ($03,X)          ; 61 03 | Add with carry ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_53C
; Address: $D6B1E8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_53C:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $31FA            ; 4C FA 31 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_53D
; Address: $D6B1F3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_53D:
    JSL $CDAD44          ; 22 44 AD CD | Jump to subroutine long
    JMP $31FD            ; 4C FD 31 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_53E
; Address: $D6B1FE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_53E:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $320F            ; 4C 0F 32 | Jump to address
    JMP $3212            ; 4C 12 32 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_540
; Address: $D6B216
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_540:
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3224            ; 4C 24 32 | Jump to address
    ADC ($03),Y          ; 71 03 | Add with carry ((zero page),Y)
    JMP $3227            ; 4C 27 32 | Jump to address
    STZ $03              ; 64 03 | Store zero to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_541
; Address: $D6B228
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_541:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $323A            ; 4C 3A 32 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_542
; Address: $D6B233
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_542:
    JSL $CDAD6A          ; 22 6A AD CD | Jump to subroutine long
    JMP $323D            ; 4C 3D 32 | Jump to address
    ADC $03              ; 65 03 | Add with carry (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_543
; Address: $D6B23E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_543:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $324F            ; 4C 4F 32 | Jump to address
    JMP $3252            ; 4C 52 32 | Jump to address
    ROR $03              ; 66 03 | Rotate right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_544
; Address: $D6B253
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_544:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3264            ; 4C 64 32 | Jump to address
    JMP $3267            ; 4C 67 32 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_545
; Address: $D6B268
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_545:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3279            ; 4C 79 32 | Jump to address
    JMP $328B            ; 4C 8B 32 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_546
; Address: $D6B279
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_546:
    JSL $CC897C          ; 22 7C 89 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3288            ; 4C 88 32 | Jump to address
    ADC #$03             ; 69 03 | Add with carry (immediate)
    JMP $328B            ; 4C 8B 32 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_547
; Address: $D6B28C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_547:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $329E            ; 4C 9E 32 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_548
; Address: $D6B297
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_548:
    JSL $CDAD38          ; 22 38 AD CD | Jump to subroutine long
    JMP $32A1            ; 4C A1 32 | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_54B
; Address: $D6B2AD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_54B:
    JSL $CDAD57          ; 22 57 AD CD | Jump to subroutine long
    JMP $32B7            ; 4C B7 32 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_54D
; Address: $D6B2B8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_54D:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $32CE            ; 4C CE 32 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_551
; Address: $D6B2D3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_551:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $32E9            ; 4C E9 32 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_555
; Address: $D6B2EE
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_555:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $32FF            ; 4C FF 32 | Jump to address
    JMP $3302            ; 4C 02 33 | Jump to address
    JMP ($6B03)          ; 6C 03 6B | Jump to address (absolute indirect)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3314            ; 4C 14 33 | Jump to address
    SEI                  ; 78 | Set interrupt disable flag
    JMP $3317            ; 4C 17 33 | Jump to address
    ADC $6B03            ; 6D 03 6B | Add with carry (absolute)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $332A            ; 4C 2A 33 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_556
; Address: $D6B323
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_556:
    JSL $CDAD40          ; 22 40 AD CD | Jump to subroutine long
    JMP $332D            ; 4C 2D 33 | Jump to address
    ROR $6B03            ; 6E 03 6B | Rotate right (absolute)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3344            ; 4C 44 33 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_55B
; Address: $D6B349
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_55B:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $335B            ; 4C 5B 33 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_55C
; Address: $D6B354
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_55C:
    JSL $CDAD3C          ; 22 3C AD CD | Jump to subroutine long
    JMP $335E            ; 4C 5E 33 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_55D
; Address: $D6B35F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_55D:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3371            ; 4C 71 33 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_55E
; Address: $D6B36A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_55E:
    JSL $CDAD85          ; 22 85 AD CD | Jump to subroutine long
    JMP $3374            ; 4C 74 33 | Jump to address
    BVS $03              ; 70 03 | Branch if overflow set
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_55F
; Address: $D6B375
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_55F:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $338B            ; 4C 8B 33 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_563
; Address: $D6B390
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_563:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $33A1            ; 4C A1 33 | Jump to address
    JMP $33A4            ; 4C A4 33 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_564
; Address: $D6B3A5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_564:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $33B6            ; 4C B6 33 | Jump to address
    JMP $33B9            ; 4C B9 33 | Jump to address
    BIT #$03             ; 89 03 | Test bits in accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_565
; Address: $D6B3BA
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_565:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $33DD            ; 4C DD 33 | Jump to address
    STZ $2203            ; 9C 03 22 | Store zero to absolute
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $33D7            ; 4C D7 33 | Jump to address
    STA $4C03,X          ; 9D 03 4C | Store accumulator to absolute,X
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_566
; Address: $D6B3D8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_566:
    STZ $4C03,X          ; 9E 03 4C | Store zero to absolute,X
    CPX #$33             ; E0 33 | Compare X register (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_567
; Address: $D6B3E1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_567:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $33F2            ; 4C F2 33 | Jump to address
    TXS                  ; 9A | Transfer X register to stack pointer
    JMP $33F5            ; 4C F5 33 | Jump to address
    DEY                  ; 88 | Decrement Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_572
; Address: $D6B425
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_572:
    JSL $CCD428          ; 22 28 D4 CC | Jump to subroutine long
    JMP $3403            ; 4C 03 34 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_573
; Address: $D6B42D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_573:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3442            ; 4C 42 34 | Jump to address
    STA $2203,Y          ; 99 03 22 | Store accumulator to absolute,Y
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LSR $34              ; 46 34 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_575
; Address: $D6B447
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_575:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3459            ; 4C 59 34 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_576
; Address: $D6B452
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_576:
    JSL $CDAD3C          ; 22 3C AD CD | Jump to subroutine long
    JMP $345C            ; 4C 5C 34 | Jump to address
    PHB                  ; 8B | Push data bank register to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_577
; Address: $D6B45D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_577:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $346F            ; 4C 6F 34 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_578
; Address: $D6B468
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_578:
    JSL $CDAD38          ; 22 38 AD CD | Jump to subroutine long
    JMP $3472            ; 4C 72 34 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_579
; Address: $D6B473
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_579:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3488            ; 4C 88 34 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_57C
; Address: $D6B48D
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_57C:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $349E            ; 4C 9E 34 | Jump to address
    LDY $03              ; A4 03 | Load from zero page into Y register
    JMP $34A1            ; 4C A1 34 | Jump to address
    STA $AD6B03          ; 8F 03 6B AD | Store accumulator to absolute long address
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $34B3            ; 4C B3 34 | Jump to address
    LDA $03              ; A5 03 | Load from zero page into accumulator
    JMP $34B6            ; 4C B6 34 | Jump to address
    BCC $03              ; 90 03 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_57D
; Address: $D6B4B7
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_57D:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $34C8            ; 4C C8 34 | Jump to address
    STA                  ; 9F 03 4C DC | Store accumulator to absolute long,X
    LDA $354B            ; AD 4B 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $34D9            ; 4C D9 34 | Jump to address
    JMP $34DC            ; 4C DC 34 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_57E
; Address: $D6B4DD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_57E:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $34EE            ; 4C EE 34 | Jump to address
    JMP $34F1            ; 4C F1 34 | Jump to address
    STA ($03),Y          ; 91 03 | Store accumulator to (zero page),Y
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_57F
; Address: $D6B4F2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_57F:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3503            ; 4C 03 35 | Jump to address
    LDA ($03,X)          ; A1 03 | Load from (zero page,X) into accumulator
    JMP $3506            ; 4C 06 35 | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_580
; Address: $D6B50D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_580:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3518            ; 4C 18 35 | Jump to address
    LDY #$03             ; A0 03 | Load immediate value into Y register
    JMP $351B            ; 4C 1B 35 | Jump to address
    STX $6B03            ; 8E 03 6B | Store X register to absolute address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $352D            ; 4C 2D 35 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BMI $35              ; 30 35 | Branch if negative
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $354C            ; 4C 4C 35 | Jump to address
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_581
; Address: $D6B543
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_581:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LDX #$03             ; A2 03 | Load immediate value into X register
    JMP $354F            ; 4C 4F 35 | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3561            ; 4C 61 35 | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    JMP $3564            ; 4C 64 35 | Jump to address
    TXA                  ; 8A | Transfer X register to accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_582
; Address: $D6B565
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_582:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3576            ; 4C 76 35 | Jump to address
    LDX $03              ; A6 03 | Load from zero page into X register
    JMP $3579            ; 4C 79 35 | Jump to address
    STY $6B03            ; 8C 03 6B | Store Y register to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_583
; Address: $D6B57E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_583:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $358F            ; 4C 8F 35 | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $3598            ; 4C 98 35 | Jump to address
    STA $A903            ; 8D 03 A9 | Store accumulator to absolute address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $6B35            ; 4C 35 6B | Jump to address
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_58A
; Address: $D6B5B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_58A:
    ORA $6B03,Y          ; 19 03 6B | Logical OR with accumulator (absolute,Y)
    LSR $6B01,X          ; 5E 01 6B | Logical shift right (absolute,X)
    INC                  ; 1A | Increment accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_58B
; Address: $D6B5C3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_58B:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_58E
; Address: $D6B5D4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_58E:
    JSL $CC93C5          ; 22 C5 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $35E7            ; 4C E7 35 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_590
; Address: $D6B5E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_590:
    JSL $CC93E0          ; 22 E0 93 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $35F7            ; 4C F7 35 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_591
; Address: $D6B5F0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_591:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    ORA $6B03,X          ; 1D 03 6B | Logical OR with accumulator (absolute,X)
    ASL $6B03,X          ; 1E 03 6B | Arithmetic shift left (absolute,X)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_592
; Address: $D6B5FE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_592:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA ($03),Y          ; B1 03 | Load from (zero page),Y into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5A0
; Address: $D6B641
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5A0:
    JSL $CCD88A          ; 22 8A D8 CC | Jump to subroutine long
    JMP $3617            ; 4C 17 36 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5B0
; Address: $D6B695
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5B0:
    LDA $6B03            ; AD 03 6B | Load from absolute address into accumulator
    LDX $6B03            ; AE 03 6B | Load from absolute address into X register
    BCS $03              ; B0 03 | Branch if carry set
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5B2
; Address: $D6B6A7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5B2:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $36B6            ; 4C B6 36 | Jump to address
    JMP $36B9            ; 4C B9 36 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5BD
; Address: $D6B6E8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5BD:
    ORA $6B07,Y          ; 19 07 6B | Logical OR with accumulator (absolute,Y)
    TSX                  ; BA | Transfer stack pointer to X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5C1
; Address: $D6B701
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5C1:
    JSL $CC7D46          ; 22 46 7D CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3710            ; 4C 10 37 | Jump to address
    JMP $3713            ; 4C 13 37 | Jump to address
    LDY $6B03,X          ; BC 03 6B | Load from absolute,X into Y register
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5C3
; Address: $D6B71E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5C3:
    LDX $2203,Y          ; BE 03 22 | Load from absolute,Y into X register
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $372F            ; 4C 2F 37 | Jump to address
    LDA                  ; BF 03 4C 44 | Load from absolute long,X into accumulator
    CPY #$03             ; C0 03 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5C4
; Address: $D6B732
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5C4:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3741            ; 4C 41 37 | Jump to address
    LDA                  ; BF 03 4C 44 | Load from absolute long,X into accumulator
    CMP ($03,X)          ; C1 03 | Compare accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5C8
; Address: $D6B757
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5C8:
    CPY $03              ; C4 03 | Compare Y register (zero page)
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $376B            ; 4C 6B 37 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5C9
; Address: $D6B764
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5C9:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    CMP $03              ; C5 03 | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5CD
; Address: $D6B77A
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5CD:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    SBC #$03             ; E9 03 | Subtract with carry (immediate)
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3791            ; 4C 91 37 | Jump to address
    XBA                  ; EB | Exchange accumulator bytes
    JMP $3794            ; 4C 94 37 | Jump to address
    NOP                  ; EA | No operation
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5CE
; Address: $D6B796
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5CE:
    CPX $6B03            ; EC 03 6B | Compare X register (absolute)
    SBC $6B03            ; ED 03 6B | Subtract with carry (absolute)
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $37C7            ; 4C C7 37 | Jump to address
    INC $2203            ; EE 03 22 | Increment (absolute)
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5CF
; Address: $D6B7B2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5CF:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $37C1            ; 4C C1 37 | Jump to address
    BEQ $03              ; F0 03 | Branch if equal
    JMP $37C4            ; 4C C4 37 | Jump to address
    SBC ($03),Y          ; F1 03 | Subtract with carry ((zero page),Y)
    JMP $37CA            ; 4C CA 37 | Jump to address
    INC $6B03            ; EE 03 6B | Increment (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5D2
; Address: $D6B7DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5D2:
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $37F0            ; 4C F0 37 | Jump to address
    SED                  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5E0
; Address: $D6B828
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5E0:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3845            ; 4C 45 38 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5E4
; Address: $D6B83E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5E4:
    JSL $CCDE0F          ; 22 0F DE CC | Jump to subroutine long
    JMP $3846            ; 4C 46 38 | Jump to address
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3858            ; 4C 58 38 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5E5
; Address: $D6B851
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5E5:
    JSL $CCD298          ; 22 98 D2 CC | Jump to subroutine long
    JMP $38BD            ; 4C BD 38 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3890            ; 4C 90 38 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5EA
; Address: $D6B873
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5EA:
    JSL $CCA02B          ; 22 2B A0 CC | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5EF
; Address: $D6B890
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5EF:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $38A6            ; 4C A6 38 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5F5
; Address: $D6B8B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5F5:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $3894            ; 4C 94 38 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5F8
; Address: $D6B8C9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5F8:
    BCS $03              ; B0 03 | Branch if carry set
    JMP $38D4            ; 4C D4 38 | Jump to address
    JMP $38D7            ; 4C D7 38 | Jump to address
    SBC $6B03,X          ; FD 03 6B | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5F9
; Address: $D6B8D8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5F9:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $38F6            ; 4C F6 38 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5FA
; Address: $D6B8E1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5FA:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $38F0            ; 4C F0 38 | Jump to address
    JMP $38F3            ; 4C F3 38 | Jump to address
    ORA ($04,X)          ; 01 04 | Logical OR with accumulator ((zero page,X))
    JMP $3908            ; 4C 08 39 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5FB
; Address: $D6B8F6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5FB:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3905            ; 4C 05 39 | Jump to address
    INC $4C03,X          ; FE 03 4C | Increment (absolute,X)
    PHP                  ; 08 | Push processor status to stack
    AND $FF00,Y          ; 39 00 FF | Logical AND with accumulator (absolute,Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5FC
; Address: $D6B909
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5FC:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3927            ; 4C 27 39 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5FD
; Address: $D6B912
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5FD:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3921            ; 4C 21 39 | Jump to address
    JMP $3924            ; 4C 24 39 | Jump to address
    JMP $3939            ; 4C 39 39 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_5FE
; Address: $D6B927
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_5FE:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3936            ; 4C 36 39 | Jump to address
    JMP $3939            ; 4C 39 39 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_600
; Address: $D6B93D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_600:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $394D            ; 4C 4D 39 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_601
; Address: $D6B946
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_601:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    ASL $04              ; 06 04 | Arithmetic shift left (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_602
; Address: $D6B94E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_602:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $397E            ; 4C 7E 39 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_603
; Address: $D6B957
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_603:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3978            ; 4C 78 39 | Jump to address
    ORA #$04             ; 09 04 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_604
; Address: $D6B963
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_604:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3972            ; 4C 72 39 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_605
; Address: $D6B96D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_605:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    JMP $3975            ; 4C 75 39 | Jump to address
    JMP $397B            ; 4C 7B 39 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    JMP $3990            ; 4C 90 39 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_606
; Address: $D6B97E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_606:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $398D            ; 4C 8D 39 | Jump to address
    JMP $3990            ; 4C 90 39 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_607
; Address: $D6B991
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_607:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $399F            ; 4C 9F 39 | Jump to address
    JMP $3A6D            ; 4C 6D 3A | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3A0B            ; 4C 0B 3A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_61C
; Address: $D6BA10
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_61C:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$37             ; C9 37 | Compare accumulator (immediate)
    BEQ $02              ; F0 02 | Branch if equal
    BCS $03              ; B0 03 | Branch if carry set

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_61E
; Address: $D6BA21
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_61E:
    JSL $C75219          ; 22 19 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3A31            ; 4C 31 3A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_621
; Address: $D6BA38
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_621:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3A48            ; 4C 48 3A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_624
; Address: $D6BA4C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_624:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3A5B            ; 4C 5B 3A | Jump to address
    ASL $4C04            ; 0E 04 4C | Arithmetic shift left (absolute)
    LSR $003A,X          ; 5E 3A 00 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_627
; Address: $D6BA66
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_627:
    JSL $CDADAB          ; 22 AB AD CD | Jump to subroutine long
    JMP $3A0C            ; 4C 0C 3A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_628
; Address: $D6BA6E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_628:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3AAF            ; 4C AF 3A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_629
; Address: $D6BA79
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_629:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3AA9            ; 4C A9 3A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_62A
; Address: $D6BA82
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_62A:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3AA3            ; 4C A3 3A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_62B
; Address: $D6BA8E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_62B:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3A9D            ; 4C 9D 3A | Jump to address
    JMP $3AA0            ; 4C A0 3A | Jump to address
    JMP $3AA6            ; 4C A6 3A | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $3AAC            ; 4C AC 3A | Jump to address
    JMP $3AC1            ; 4C C1 3A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_62C
; Address: $D6BAAF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_62C:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3ABE            ; 4C BE 3A | Jump to address
    JMP $3AC1            ; 4C C1 3A | Jump to address
    ORA $6B04            ; 0D 04 6B | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_631
; Address: $D6BAD1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_631:
    LDA #$83             ; A9 83 | Load immediate value into accumulator
    LDX #$70             ; A2 70 | Load immediate value into X register
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$A2             ; A0 A2 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    WDM #$3C             ; 42 3C | Reserved instruction
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_632
; Address: $D6BAE6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_632:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3B02            ; 4C 02 3B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_636
; Address: $D6BB03
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_636:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3B15            ; 4C 15 3B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_638
; Address: $D6BB15
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_638:
    JSL $CC79F7          ; 22 F7 79 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3B25            ; 4C 25 3B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_63D
; Address: $D6BB35
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_63D:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3B44            ; 4C 44 3B | Jump to address
    JMP $3B56            ; 4C 56 3B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_63E
; Address: $D6BB44
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_63E:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3B53            ; 4C 53 3B | Jump to address
    JMP $3B56            ; 4C 56 3B | Jump to address
    INC                  ; 1A | Increment accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_641
; Address: $D6BB62
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_641:
    JSL $CCD211          ; 22 11 D2 CC | Jump to subroutine long
    JMP $3C7A            ; 4C 7A 3C | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $3B7C            ; 4C 7C 3B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_642
; Address: $D6BB75
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_642:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    JMP $3B6A            ; 4C 6A 3B | Jump to address
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$2F             ; A9 2F | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$2F             ; A9 2F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_643
; Address: $D6BB9A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_643:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$31             ; A9 31 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_644
; Address: $D6BBBC
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_644:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_64E
; Address: $D6BC02
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_64E:
    JSL $CCD35E          ; 22 5E D3 CC | Jump to subroutine long
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$2F             ; A9 2F | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$2F             ; A9 2F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_64F
; Address: $D6BC24
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_64F:
    JSL $C736C8          ; 22 C8 36 C7 | Jump to subroutine long
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$31             ; A9 31 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_650
; Address: $D6BC46
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_650:
    JSL $C736C8          ; 22 C8 36 C7 | Jump to subroutine long
    LDA #$1D             ; A9 1D | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_651
; Address: $D6BC68
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_651:
    JSL $C736C8          ; 22 C8 36 C7 | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    JMP $2235            ; 4C 35 22 | Jump to address
    CPY $9822            ; CC 22 98 | Compare Y register (absolute)
    CPY $AD6B            ; CC 6B AD | Compare Y register (absolute)
    JMP $2935            ; 4C 35 29 | Jump to address
    BPL $00              ; 10 00 | Branch if positive
    BEQ $03              ; F0 03 | Branch if equal
    JMP $3C9E            ; 4C 9E 3C | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3C9E            ; 4C 9E 3C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_652
; Address: $D6BC91
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_652:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3C9E            ; 4C 9E 3C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_654
; Address: $D6BC9F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_654:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3CBD            ; 4C BD 3C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_655
; Address: $D6BCA8
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_655:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3CB7            ; 4C B7 3C | Jump to address
    ROL                  ; 2A | Rotate left (accumulator)
    JMP $3CBA            ; 4C BA 3C | Jump to address
    JMP $3D46            ; 4C 46 3D | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3CCE            ; 4C CE 3C | Jump to address
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    JMP $3D46            ; 4C 46 3D | Jump to address
    ASL $2204,X          ; 1E 04 22 | Arithmetic shift left (absolute,X)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $3D43            ; 4C 43 3D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_656
; Address: $D6BCDB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_656:
    JSR $2204            ; 20 04 22 | Jump to subroutine
    STZ $7A              ; 64 7A | Store zero to zero page
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $3CEC            ; 4C EC 3C | Jump to address
    AND ($04,X)          ; 21 04 | Logical AND with accumulator ((zero page,X))
    JMP $3CEF            ; 4C EF 3C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_657
; Address: $D6BCED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_657:
    JSL $052204          ; 22 04 22 05 | Jump to subroutine long
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $3D40            ; 4C 40 3D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_659
; Address: $D6BCFC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_659:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3D0B            ; 4C 0B 3D | Jump to address
    JMP $3D0E            ; 4C 0E 3D | Jump to address
    BIT $04              ; 24 04 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_65A
; Address: $D6BD0E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_65A:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3D3D            ; 4C 3D 3D | Jump to address
    ROL $04              ; 26 04 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_65B
; Address: $D6BD1A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_65B:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3D29            ; 4C 29 3D | Jump to address
    JMP $3D2C            ; 4C 2C 3D | Jump to address
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_65D
; Address: $D6BD30
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_65D:
    JSL $CC9AC3          ; 22 C3 9A CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    JMP $4C35            ; 4C 35 4C | Jump to address
    RTI                  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_65E
; Address: $D6BD3C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_65E:
    AND $2500,X          ; 3D 00 25 | Logical AND with accumulator (absolute,X)
    JMP $3D46            ; 4C 46 3D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_65F
; Address: $D6BD47
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_65F:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3D74            ; 4C 74 3D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_660
; Address: $D6BD50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_660:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3D6E            ; 4C 6E 3D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_661
; Address: $D6BD59
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_661:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3D68            ; 4C 68 3D | Jump to address
    JMP $3D6B            ; 4C 6B 3D | Jump to address
    BMI $04              ; 30 04 | Branch if negative
    JMP $3D71            ; 4C 71 3D | Jump to address
    AND ($04),Y          ; 31 04 | Logical AND with accumulator ((zero page),Y)
    JMP $3D88            ; 4C 88 3D | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3D85            ; 4C 85 3D | Jump to address
    ROL $4C04            ; 2E 04 4C | Rotate left (absolute)
    DEY                  ; 88 | Decrement Y register
    AND $2D00,X          ; 3D 00 2D | Logical AND with accumulator (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_662
; Address: $D6BD89
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_662:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3DA7            ; 4C A7 3D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_663
; Address: $D6BD92
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_663:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3DA1            ; 4C A1 3D | Jump to address
    JMP $3DA4            ; 4C A4 3D | Jump to address
    JMP $3DCA            ; 4C CA 3D | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3DB8            ; 4C B8 3D | Jump to address
    JMP $3DCA            ; 4C CA 3D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_664
; Address: $D6BDB8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_664:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3DC7            ; 4C C7 3D | Jump to address
    JMP $3DCA            ; 4C CA 3D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_665
; Address: $D6BDCB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_665:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3DD9            ; 4C D9 3D | Jump to address
    JMP $3E4F            ; 4C 4F 3E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_66D
; Address: $D6BDFA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_66D:
    JSL $CCD35E          ; 22 5E D3 CC | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$2E             ; A9 2E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_671
; Address: $D6BE10
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_671:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    SEC                  ; 38 | Set carry flag
    SBC #$02             ; E9 02 | Subtract with carry (immediate)
    STA $342C            ; 8D 2C 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_677
; Address: $D6BE35
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_677:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3E44            ; 4C 44 3E | Jump to address
    JMP $3E47            ; 4C 47 3E | Jump to address
    AND $2204,X          ; 3D 04 22 | Logical AND with accumulator (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDA $6BCD            ; AD CD 6B | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_678
; Address: $D6BE50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_678:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3E7D            ; 4C 7D 3E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_679
; Address: $D6BE59
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_679:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3E77            ; 4C 77 3E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_67A
; Address: $D6BE62
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_67A:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3E71            ; 4C 71 3E | Jump to address
    ROL $4C04,X          ; 3E 04 4C | Rotate left (absolute,X)
    ROL $3F00,X          ; 3E 00 3F | Rotate left (absolute,X)
    JMP $3E7A            ; 4C 7A 3E | Jump to address
    RTI                  ; 40 | Return from interrupt
    JMP $3EC6            ; 4C C6 3E | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3E9D            ; 4C 9D 3E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_67C
; Address: $D6BE8E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_67C:
    JMP $3E97            ; 4C 97 3E | Jump to address
    JMP $3E9A            ; 4C 9A 3E | Jump to address
    AND $4C04,X          ; 3D 04 4C | Logical AND with accumulator (absolute,X)
    DEC $3E              ; C6 3E | Decrement (zero page)
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3EAE            ; 4C AE 3E | Jump to address
    DEC                  ; 3A | Decrement accumulator
    JMP $3EC6            ; 4C C6 3E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_67D
; Address: $D6BEAE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_67D:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3EC0            ; 4C C0 3E | Jump to address
    AND $4C04,Y          ; 39 04 4C | Logical AND with accumulator (absolute,Y)
    DEC $3E              ; C6 3E | Decrement (zero page)
    SEC                  ; 38 | Set carry flag
    AND $6B04,Y          ; 39 04 6B | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_681
; Address: $D6BED5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_681:
    JSL $CC9046          ; 22 46 90 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3EE4            ; 4C E4 3E | Jump to address
    CLC                  ; 18 | Clear carry flag
    JMP $3EF6            ; 4C F6 3E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_682
; Address: $D6BEE4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_682:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $3EF3            ; 4C F3 3E | Jump to address
    ORA $4C04,Y          ; 19 04 4C | Logical OR with accumulator (absolute,Y)
    ROL $0D00,X          ; 3E 00 0D | Rotate left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_683
; Address: $D6BEF8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_683:
    BIT $6B04            ; 2C 04 6B | Test bits in accumulator (absolute)
    ORA $6B04,X          ; 1D 04 6B | Logical OR with accumulator (absolute,X)
    EOR ($04,X)          ; 41 04 | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_686
; Address: $D6BF0B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_686:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F23            ; 4C 23 3F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_687
; Address: $D6BF19
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_687:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    JMP $3F26            ; 4C 26 3F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_689
; Address: $D6BF2D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_689:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F3C            ; 4C 3C 3F | Jump to address
    LDA #$45             ; A9 45 | Load immediate value into accumulator
    LDX #$57             ; A2 57 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_68C
; Address: $D6BF41
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_68C:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F52            ; 4C 52 3F | Jump to address
    JMP $3F66            ; 4C 66 3F | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F63            ; 4C 63 3F | Jump to address
    ROR $04              ; 66 04 | Rotate right (zero page)
    JMP $3F66            ; 4C 66 3F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_68D
; Address: $D6BF67
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_68D:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F78            ; 4C 78 3F | Jump to address
    STA ($04,X)          ; 81 04 | Store accumulator to (zero page,X)
    JMP $3F8C            ; 4C 8C 3F | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F89            ; 4C 89 3F | Jump to address
    JMP $3F8C            ; 4C 8C 3F | Jump to address
    EOR $04              ; 45 04 | Exclusive OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_68E
; Address: $D6BF8D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_68E:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3F9E            ; 4C 9E 3F | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    JMP $3FA1            ; 4C A1 3F | Jump to address
    LSR $04              ; 46 04 | Logical shift right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_68F
; Address: $D6BFA2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_68F:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FB3            ; 4C B3 3F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_690
; Address: $D6BFB0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_690:
    JMP $3FD8            ; 4C D8 3F | Jump to address
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FC4            ; 4C C4 3F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_691
; Address: $D6BFBF
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_691:
    ROR $4C04,X          ; 7E 04 4C | Rotate right (absolute,X)
    CLD                  ; D8 | Clear decimal mode flag
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FD5            ; 4C D5 3F | Jump to address
    ADC #$04             ; 69 04 | Add with carry (immediate)
    JMP $3FD8            ; 4C D8 3F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_692
; Address: $D6BFD9
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_692:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FEA            ; 4C EA 3F | Jump to address
    JMP $3FFE            ; 4C FE 3F | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $3FFB            ; 4C FB 3F | Jump to address
    JMP ($4C04)          ; 6C 04 4C | Jump to address (absolute indirect)
    INC $003F,X          ; FE 3F 00 | Increment (absolute,X)
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_693
; Address: $D6BFFF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_693:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4010            ; 4C 10 40 | Jump to address
    ADC $4C04            ; 6D 04 4C | Add with carry (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR #$04             ; 49 04 | Exclusive OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_694
; Address: $D6C014
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_694:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4025            ; 4C 25 40 | Jump to address
    JMP $4039            ; 4C 39 40 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4036            ; 4C 36 40 | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)
    JMP $4039            ; 4C 39 40 | Jump to address
    LSR                  ; 4A | Logical shift right (accumulator)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_695
; Address: $D6C03A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_695:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $404B            ; 4C 4B 40 | Jump to address
    ROR $4C04            ; 6E 04 4C | Rotate right (absolute)
    LSR $0040            ; 4E 40 00 | Logical shift right (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_696
; Address: $D6C04F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_696:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4060            ; 4C 60 40 | Jump to address
    ADC $4C04,X          ; 7D 04 4C | Add with carry (absolute,X)
    STY $40              ; 84 40 | Store Y register to zero page
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4081            ; 4C 81 40 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_697
; Address: $D6C06E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_697:
    JSL $CC7B1D          ; 22 1D 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $407E            ; 4C 7E 40 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_698
; Address: $D6C077
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_698:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    BVS $04              ; 70 04 | Branch if overflow set
    JMP $4084            ; 4C 84 40 | Jump to address
    JMP $6B04            ; 4C 04 6B | Jump to address
    EOR $6B04            ; 4D 04 6B | Exclusive OR with accumulator (absolute)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_69A
; Address: $D6C091
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_69A:
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $40AF            ; 4C AF 40 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_69D
; Address: $D6C0A8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_69D:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $410A            ; 4C 0A 41 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4106            ; 4C 06 41 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6A2
; Address: $D6C0CA
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6A2:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    LSR $A900,X          ; 5E 00 A9 | Logical shift right (absolute,X)
    CMP $8D00            ; CD 00 8D | Compare accumulator (absolute)
    ADC $22BE,Y          ; 79 BE 22 | Add with carry (absolute,Y)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    ORA ($A9,X)          ; 01 A9 | Logical OR with accumulator ((zero page,X))
    ASL $8D00,X          ; 1E 00 8D | Arithmetic shift left (absolute,X)
    BIT $AD34            ; 2C 34 AD | Test bits in accumulator (absolute)
    BIT $2234            ; 2C 34 22 | Test bits in accumulator (absolute)
    STA                  ; 9F CF C1 22 | Store accumulator to absolute long,X
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6A4
; Address: $D6C0F2
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6A4:
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    INC $A0              ; E6 A0 | Increment (zero page)
    CPY $C022            ; CC 22 C0 | Compare Y register (absolute)
    CPY $D222            ; CC 22 D2 | Compare Y register (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $0A4C            ; CC 4C 0A | Compare Y register (absolute)
    EOR ($22,X)          ; 41 22 | Exclusive OR with accumulator ((zero page,X))
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $A96B            ; CD 6B A9 | Compare accumulator (absolute)
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6A5
; Address: $D6C10D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6A5:
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$D1             ; A2 D1 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6A7
; Address: $D6C122
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6A7:
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    BRA $96              ; 80 96 | Branch always
    LDA #$C0             ; A9 C0 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    STA $9682            ; 8D 82 96 | Store accumulator to absolute address
    LDX #$A5             ; A2 A5 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6A9
; Address: $D6C139
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6A9:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $414A            ; 4C 4A 41 | Jump to address
    STY $04              ; 84 04 | Store Y register to zero page
    JMP $415E            ; 4C 5E 41 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $415B            ; 4C 5B 41 | Jump to address
    JMP $415E            ; 4C 5E 41 | Jump to address
    LSR $6B04            ; 4E 04 6B | Logical shift right (absolute)
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4174            ; 4C 74 41 | Jump to address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    LDX #$40             ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6AC
; Address: $D6C178
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6AC:
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4186            ; 4C 86 41 | Jump to address
    STA $04              ; 85 04 | Store accumulator to zero page
    JMP $419A            ; 4C 9A 41 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4197            ; 4C 97 41 | Jump to address
    JMP $419A            ; 4C 9A 41 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6AD
; Address: $D6C19B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6AD:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $41AC            ; 4C AC 41 | Jump to address
    JMP $41AF            ; 4C AF 41 | Jump to address
    BVC $04              ; 50 04 | Branch if overflow clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6AE
; Address: $D6C1B0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6AE:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4206            ; 4C 06 42 | Hardware register operation
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$16             ; A2 16 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6B1
; Address: $D6C1C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6B1:
    JSL $CCD34E          ; 22 4E D3 CC | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$15             ; A9 15 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6B5
; Address: $D6C1E3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6B5:
    JSL $CCD8E3          ; 22 E3 D8 CC | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA #$16             ; A9 16 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6B9
; Address: $D6C1FC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6B9:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    JMP $41CE            ; 4C CE 41 | Jump to address
    JMP $420A            ; 4C 0A 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6BB
; Address: $D6C20B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6BB:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $421C            ; 4C 1C 42 | Hardware register operation
    STX $04              ; 86 04 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6BC
; Address: $D6C219
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6BC:
    JMP $4230            ; 4C 30 42 | Hardware register operation
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $422D            ; 4C 2D 42 | Hardware register operation
    JMP $4230            ; 4C 30 42 | Hardware register operation
    EOR ($04),Y          ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6BD
; Address: $D6C231
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6BD:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4251            ; 4C 51 42 | Hardware register operation
    LDA #$2C             ; A9 2C | Load immediate value into accumulator
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6C2
; Address: $D6C256
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6C2:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4267            ; 4C 67 42 | Hardware register operation
    BIT #$04             ; 89 04 | Test bits in accumulator (immediate)
    JMP $427B            ; 4C 7B 42 | Hardware register operation
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4278            ; 4C 78 42 | Hardware register operation
    JMP $427B            ; 4C 7B 42 | Hardware register operation
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6C3
; Address: $D6C27C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6C3:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4295            ; 4C 95 42 | Hardware register operation
    LDA #$2F             ; A9 2F | Load immediate value into accumulator
    LDX #$1F             ; A2 1F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6C6
; Address: $D6C296
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6C6:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42A7            ; 4C A7 42 | Hardware register operation
    JMP $42BB            ; 4C BB 42 | Hardware register operation
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42B8            ; 4C B8 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6C7
; Address: $D6C2B3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6C7:
    ROR                  ; 6A | Rotate right (accumulator)
    JMP $42BB            ; 4C BB 42 | Hardware register operation
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6C8
; Address: $D6C2BC
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6C8:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42DC            ; 4C DC 42 | Hardware register operation
    LDA #$2F             ; A9 2F | Load immediate value into accumulator
    LDX #$1A             ; A2 1A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6CD
; Address: $D6C2E1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6CD:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $42F2            ; 4C F2 42 | Hardware register operation
    TXA                  ; 8A | Transfer X register to accumulator
    JMP $4306            ; 4C 06 43 | Jump to address
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4303            ; 4C 03 43 | Jump to address
    JMP $4306            ; 4C 06 43 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6D4
; Address: $D6C32D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6D4:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6E1
; Address: $D6C36C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6E1:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $A936,Y          ; 19 36 A9 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6E2
; Address: $D6C377
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6E2:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    JMP $2235            ; 4C 35 22 | Jump to address
    CPY $9822            ; CC 22 98 | Compare Y register (absolute)
    CPY $AD6B            ; CC 6B AD | Compare Y register (absolute)
    JMP $2935            ; 4C 35 29 | Jump to address
    BRA $00              ; 80 00 | Branch always
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4397            ; 4C 97 43 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6E3
; Address: $D6C390
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6E3:
    JSL $CDA8EA          ; 22 EA A8 CD | Jump to subroutine long
    JMP $43B0            ; 4C B0 43 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $43AC            ; 4C AC 43 | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6E7
; Address: $D6C3B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6E7:
    JSL $CDAED1          ; 22 D1 AE CD | Jump to subroutine long
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    LDX #$0B             ; A2 0B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6F0
; Address: $D6C3E2
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6F0:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $43F3            ; 4C F3 43 | Jump to address
    PHB                  ; 8B | Push data bank register to stack
    JMP $43F6            ; 4C F6 43 | Jump to address
    EOR $6B04,Y          ; 59 04 6B | Exclusive OR with accumulator (absolute,Y)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6F2
; Address: $D6C3FB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6F2:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $440A            ; 4C 0A 44 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6F4
; Address: $D6C40B
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6F4:
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $441C            ; 4C 1C 44 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BMI $44              ; 30 44 | Branch if negative
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $442D            ; 4C 2D 44 | Jump to address
    JMP $4430            ; 4C 30 44 | Jump to address
    EOR $04              ; 45 04 | Exclusive OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6F6
; Address: $D6C435
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6F6:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4446            ; 4C 46 44 | Jump to address
    ADC $4C04            ; 6D 04 4C | Add with carry (absolute)
    EOR #$44             ; 49 44 | Exclusive OR with accumulator (immediate)
    PHY                  ; 5A | Push Y register to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6F7
; Address: $D6C44A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6F7:
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $445B            ; 4C 5B 44 | Jump to address
    ADC $4C04,Y          ; 79 04 4C | Add with carry (absolute,Y)
    LSR $0044,X          ; 5E 44 00 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6F9
; Address: $D6C465
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6F9:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    EOR $6B04            ; 4D 04 6B | Exclusive OR with accumulator (absolute)
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6FA
; Address: $D6C46F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6FA:
    JSL $CDDC4D          ; 22 4D DC CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    EOR $2235            ; 4D 35 22 | Exclusive OR with accumulator (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $026B            ; CC 6B 02 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_6FB
; Address: $D6C480
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_6FB:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$58             ; C9 58 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_701
; Address: $D6C4A5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_701:
    JSL $C687A0          ; 22 A0 87 C6 | Jump to subroutine long
    LDA $C149            ; AD 49 C1 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $44B8            ; 4C B8 44 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_706
; Address: $D6C4CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_706:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $44D6            ; 4C D6 44 | Jump to address
    JMP $44C6            ; 4C C6 44 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_70B
; Address: $D6C4EE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_70B:
    JSL $C72FEE          ; 22 EE 2F C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $44FB            ; 4C FB 44 | Jump to address
    JMP $44EB            ; 4C EB 44 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_70E
; Address: $D6C508
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_70E:
    JSL $CDC65B          ; 22 5B C6 CD | Jump to subroutine long
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    JMP $A935            ; 4C 35 A9 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_70F
; Address: $D6C513
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_70F:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    JMP $2235            ; 4C 35 22 | Jump to address
    DEX                  ; CA | Decrement X register
    TXS                  ; 9A | Transfer X register to stack pointer
    CPY $7B22            ; CC 22 7B | Compare Y register (absolute)
    CPY $4F22            ; CC 22 4F | Compare Y register (absolute)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register
    ASL $2201            ; 0E 01 22 | Arithmetic shift left (absolute)
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_714
; Address: $D6C539
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_714:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    JMP $A935            ; 4C 35 A9 | Jump to address
    EOR $2235            ; 4D 35 22 | Exclusive OR with accumulator (absolute)
    CPY $AD6B            ; CC 6B AD | Compare Y register (absolute)
    JMP $2935            ; 4C 35 29 | Jump to address
    BRA $00              ; 80 00 | Branch always
    BNE $03              ; D0 03 | Branch if not equal
    JMP $455F            ; 4C 5F 45 | Jump to address
    JMP $4562            ; 4C 62 45 | Jump to address
    LSR $6B04            ; 4E 04 6B | Logical shift right (absolute)
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4574            ; 4C 74 45 | Jump to address
    JMP $4577            ; 4C 77 45 | Jump to address
    JMP $AD6B04          ; 5C 04 6B AD | Jump to address long
    JMP $2935            ; 4C 35 29 | Jump to address
    BRA $00              ; 80 00 | Branch always
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4589            ; 4C 89 45 | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    JMP $458C            ; 4C 8C 45 | Jump to address
    JMP $006B01          ; 5C 01 6B 00 | Jump to address long
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_716
; Address: $D6C59D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_716:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45BC            ; 4C BC 45 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_71C
; Address: $D6C5C1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_71C:
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $45FE            ; 4C FE 45 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_720
; Address: $D6C5D9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_720:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $45F0            ; 4C F0 45 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_724
; Address: $D6C5F7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_724:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $4601            ; 4C 01 46 | Jump to address
    EOR $6B04,X          ; 5D 04 6B | Exclusive OR with accumulator (absolute,X)
    LDA $354C            ; AD 4C 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4610            ; 4C 10 46 | Jump to address
    JMP $4624            ; 4C 24 46 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_726
; Address: $D6C615
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_726:
    JSL $CC73AA          ; 22 AA 73 CC | Jump to subroutine long
    LSR $2204,X          ; 5E 04 22 | Logical shift right (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDA $6BCD            ; AD CD 6B | Load from absolute address into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_72A
; Address: $D6C636
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_72A:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $464C            ; 4C 4C 46 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_73E
; Address: $D6C6A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_73E:
    JSL $CDE093          ; 22 93 E0 CD | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$20             ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_748
; Address: $D6C6DB
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_748:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4749            ; 4C 49 47 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_749
; Address: $D6C6F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_749:
    JSL $C78BB9          ; 22 B9 8B C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4705            ; 4C 05 47 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_74A
; Address: $D6C6F9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_74A:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDA $4C04,Y          ; B9 04 4C | Load from absolute,Y into accumulator
    JMP $4746            ; 4C 46 47 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_74B
; Address: $D6C70E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_74B:
    JSL $C78C0E          ; 22 0E 8C C7 | Jump to subroutine long
    LDA $C161            ; AD 61 C1 | Load from absolute address into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_74D
; Address: $D6C71E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_74D:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4743            ; 4C 43 47 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_74E
; Address: $D6C727
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_74E:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDA $A904,Y          ; B9 04 A9 | Load from absolute,Y into accumulator
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_750
; Address: $D6C73D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_750:
    JMP $47A7            ; 4C A7 47 | Jump to address
    JMP $4746            ; 4C 46 47 | Jump to address
    JMP $474C            ; 4C 4C 47 | Jump to address
    JMP $474C            ; 4C 4C 47 | Jump to address
    JMP $478F            ; 4C 8F 47 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_752
; Address: $D6C752
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_752:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $478C            ; 4C 8C 47 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$2E             ; A9 2E | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_753
; Address: $D6C767
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_753:
    JSL $C78BB9          ; 22 B9 8B C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $4780            ; 4C 80 47 | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $C109            ; 8D 09 C1 | Store accumulator to absolute address
    LDA #$2E             ; A9 2E | Load immediate value into accumulator
    LDX #$01             ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_755
; Address: $D6C780
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_755:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    JMP $47A7            ; 4C A7 47 | Jump to address
    JMP $478F            ; 4C 8F 47 | Jump to address
    JMP $4798            ; 4C 98 47 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_756
; Address: $D6C78F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_756:
    JSL $C1A92E          ; 22 2E A9 C1 | Jump to subroutine long
    LDX $4C04,Y          ; BE 04 4C | Load from absolute,Y into X register
    STZ $2247,X          ; 9E 47 22 | Store zero to absolute,X
    ROL $C1A9            ; 2E A9 C1 | Rotate left (absolute)
    LDY $2204,X          ; BC 04 22 | Load from absolute,X into Y register
    ROL $C1A9            ; 2E A9 C1 | Rotate left (absolute)
    LDA $4C04,X          ; BD 04 4C | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_761
; Address: $D6C7D4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_761:
    JSL $C1A988          ; 22 88 A9 C1 | Jump to subroutine long
    LDA                  ; BF 04 22 5B | Load from absolute long,X into accumulator
    DEC $CD              ; C6 CD | Decrement (zero page)
    LDA #$09             ; A9 09 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_765
; Address: $D6C7EF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_765:
    JSL $CDAFA1          ; 22 A1 AF CD | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$20             ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_772
; Address: $D6C82E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_772:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    EOR $A935            ; 4D 35 A9 | Exclusive OR with accumulator (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    CPY $C122            ; CC 22 C1 | Compare Y register (absolute)
    CPY $424C            ; CC 4C 42 | Hardware register operation
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_773
; Address: $D6C84B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_773:
    STX $6B04            ; 8E 04 6B | Store X register to absolute address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4863            ; 4C 63 48 | Jump to address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator
    LDX #$2D             ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_779
; Address: $D6C876
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_779:
    JSL $C76BE3          ; 22 E3 6B C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4885            ; 4C 85 48 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    JMP $4872            ; 4C 72 48 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_77B
; Address: $D6C88D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_77B:
    BRA $96              ; 80 96 | Branch always
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    LDX #$A3             ; A2 A3 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_77E
; Address: $D6C8A7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_77E:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $48BD            ; 4C BD 48 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_77F
; Address: $D6C8B6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_77F:
    JSL $CDA8DB          ; 22 DB A8 CD | Jump to subroutine long
    JMP $48F3            ; 4C F3 48 | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $48EF            ; 4C EF 48 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_783
; Address: $D6C8D4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_783:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    ASL $CDA8,X          ; 1E A8 CD | Arithmetic shift left (absolute,X)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_788
; Address: $D6C8F8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_788:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4910            ; 4C 10 49 | Jump to address
    STA $BD2204          ; 8F 04 22 BD | Store accumulator to absolute long address
    LDY $00CD            ; AC CD 00 | Load from absolute address into Y register
    LDA ($04,X)          ; A1 04 | Load from (zero page,X) into accumulator
    JMP $4913            ; 4C 13 49 | Jump to address
    STA $026B04          ; 8F 04 6B 02 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_789
; Address: $D6C915
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_789:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$20             ; A2 20 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_791
; Address: $D6C93C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_791:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $494B            ; 4C 4B 49 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_793
; Address: $D6C94D
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_793:
    LDY $2204            ; AC 04 22 | Load from absolute address into Y register
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $49A8            ; 4C A8 49 | Jump to address
    LDA $2204            ; AD 04 22 | Load from absolute address into accumulator
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $49A2            ; 4C A2 49 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_796
; Address: $D6C973
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_796:
    JSL $C74BC2          ; 22 C2 4B C7 | Jump to subroutine long
    LDA $3420            ; AD 20 34 | Load from absolute address into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4989            ; 4C 89 49 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_79B
; Address: $D6C998
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_79B:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $49B8            ; 4C B8 49 | Jump to address
    JMP $49A5            ; 4C A5 49 | Jump to address
    JMP $49AB            ; 4C AB 49 | Jump to address
    JMP $49AB            ; 4C AB 49 | Jump to address
    JMP $49AB            ; 4C AB 49 | Jump to address
    LDX $A904            ; AE 04 A9 | Load from absolute address into X register
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $49DF            ; 4C DF 49 | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $49D5            ; 4C D5 49 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_79D
; Address: $D6C9D8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_79D:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $4A74            ; 4C 74 4A | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4A04            ; 4C 04 4A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_79E
; Address: $D6C9EA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_79E:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $49FD            ; 4C FD 49 | Jump to address
    TAX                  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7A0
; Address: $D6C9FD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7A0:
    JSL $CB494C          ; 22 4C 49 CB | Jump to subroutine long
    JMP $4A74            ; 4C 74 4A | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4A4D            ; 4C 4D 4A | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7A1
; Address: $D6CA12
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7A1:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4A46            ; 4C 46 4A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7A2
; Address: $D6CA1B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7A2:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4A38            ; 4C 38 4A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7A4
; Address: $D6CA2B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7A4:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    LSR                  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7A7
; Address: $D6CA46
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7A7:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $4A74            ; 4C 74 4A | Jump to address
    STZ $2204            ; 9C 04 22 | Store zero to absolute
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $4A71            ; 4C 71 4A | Jump to address
    STA $2204,X          ; 9D 04 22 | Store accumulator to absolute,X
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $4A6B            ; 4C 6B 4A | Jump to address
    STA                  ; 9F 04 4C 6E | Store accumulator to absolute long,X
    LSR                  ; 4A | Logical shift right (accumulator)
    STZ $4C04,X          ; 9E 04 4C | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7A8
; Address: $D6CA70
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7A8:
    LSR                  ; 4A | Logical shift right (accumulator)
    LDY #$04             ; A0 04 | Load immediate value into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7A9
; Address: $D6CA75
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7A9:
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4A83            ; 4C 83 4A | Jump to address
    JMP $4B63            ; 4C 63 4B | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4B63            ; 4C 63 4B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7B3
; Address: $D6CAB5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7B3:
    JSL $CCD35E          ; 22 5E D3 CC | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$31             ; A9 31 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7B7
; Address: $D6CACE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7B7:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4AE8            ; 4C E8 4A | Jump to address
    LDA #$6C             ; A9 6C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7B9
; Address: $D6CAE4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7B9:
    JSL $CCD066          ; 22 66 D0 CC | Jump to subroutine long
    LDX #$20             ; A2 20 | Load immediate value into X register
    LDA #$21             ; A9 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7BE
; Address: $D6CAFE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7BE:
    JSL $CDAF01          ; 22 01 AF CD | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$27             ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7C9
; Address: $D6CB33
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7C9:
    JSL $CDAE2C          ; 22 2C AE CD | Jump to subroutine long
    LDX #$1C             ; A2 1C | Load immediate value into X register
    LDA #$31             ; A9 31 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7CC
; Address: $D6CB45
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7CC:
    JSL $CDAF81          ; 22 81 AF CD | Jump to subroutine long
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    LDX #$27             ; A2 27 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7D3
; Address: $D6CB68
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7D3:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4B79            ; 4C 79 4B | Jump to address
    LDX #$04             ; A2 04 | Load immediate value into X register
    JMP $4B7C            ; 4C 7C 4B | Jump to address
    BCC $04              ; 90 04 | Branch if carry clear
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7D4
; Address: $D6CB7D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7D4:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4B8E            ; 4C 8E 4B | Jump to address
    LDY $04              ; A4 04 | Load from zero page into Y register
    JMP $4B91            ; 4C 91 4B | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7D5
; Address: $D6CB92
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7D5:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4BA3            ; 4C A3 4B | Jump to address
    JMP $4BCD            ; 4C CD 4B | Jump to address
    LDA $3543            ; AD 43 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4BCA            ; 4C CA 4B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7D6
; Address: $D6CBAE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7D6:
    JSL $CC941C          ; 22 1C 94 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4BC4            ; 4C C4 4B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7D8
; Address: $D6CBC1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7D8:
    JMP $4BC7            ; 4C C7 4B | Jump to address
    JMP $4BCD            ; 4C CD 4B | Jump to address
    STA ($04),Y          ; 91 04 | Store accumulator to (zero page),Y
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7DA
; Address: $D6CBD2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7DA:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4BE4            ; 4C E4 4B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7DD
; Address: $D6CBE9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7DD:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4BFA            ; 4C FA 4B | Jump to address
    LDA $04              ; A5 04 | Load from zero page into accumulator
    JMP $4BFD            ; 4C FD 4B | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7DE
; Address: $D6CBFE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7DE:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4C21            ; 4C 21 4C | Jump to address
    LDX $04              ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7DF
; Address: $D6CC0C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7DF:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4C1B            ; 4C 1B 4C | Jump to address
    JMP $4C1E            ; 4C 1E 4C | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    JMP $4C24            ; 4C 24 4C | Jump to address
    STA $6B04,Y          ; 99 04 6B | Store accumulator to absolute,Y
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4C36            ; 4C 36 4C | Jump to address
    JMP $4C39            ; 4C 39 4C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7E0
; Address: $D6CC3A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7E0:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4C4C            ; 4C 4C 4C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7E4
; Address: $D6CC57
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7E4:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4C62            ; 4C 62 4C | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7E5
; Address: $D6CC5E
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7E5:
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ADC $4C              ; 65 4C | Add with carry (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7E7
; Address: $D6CC6D
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7E7:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    INY                  ; C8 | Increment Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7ED
; Address: $D6CC8A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7ED:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    CPY $04              ; C4 04 | Compare Y register (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7F0
; Address: $D6CC98
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7F0:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4CA7            ; 4C A7 4C | Jump to address
    JMP $4CAA            ; 4C AA 4C | Jump to address
    CPY $6B04            ; CC 04 6B | Compare Y register (absolute)
    CMP $6B04            ; CD 04 6B | Compare accumulator (absolute)
    DEC $6B04            ; CE 04 6B | Decrement (absolute)
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7F5
; Address: $D6CCCF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7F5:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4CE9            ; 4C E9 4C | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7F8
; Address: $D6CCEA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7F8:
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D00            ; 4C 00 4D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7FC
; Address: $D6CD07
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7FC:
    JSL $C73C23          ; 22 23 3C C7 | Jump to subroutine long
    LDA $C141            ; AD 41 C1 | Load from absolute address into accumulator
    STA $362A            ; 8D 2A 36 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7FD
; Address: $D6CD11
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7FD:
    JSL $CB4D1C          ; 22 1C 4D CB | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_7FF
; Address: $D6CD22
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_7FF:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$3D             ; A9 3D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_800
; Address: $D6CD32
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_800:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$46             ; A9 46 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_801
; Address: $D6CD42
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_801:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$3F             ; A9 3F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_802
; Address: $D6CD52
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_802:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$41             ; A9 41 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_803
; Address: $D6CD62
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_803:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$42             ; A9 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_804
; Address: $D6CD72
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_804:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_806
; Address: $D6CD82
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_806:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$37             ; A9 37 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_807
; Address: $D6CD92
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_807:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$3B             ; A9 3B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_808
; Address: $D6CDA2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_808:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$49             ; A9 49 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_809
; Address: $D6CDB2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_809:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$2E             ; A9 2E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_80A
; Address: $D6CDC2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_80A:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$2F             ; A9 2F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_80B
; Address: $D6CDD2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_80B:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$52             ; A9 52 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_80C
; Address: $D6CDE2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_80C:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$50             ; A9 50 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_80D
; Address: $D6CDF2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_80D:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$5E             ; A9 5E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_80E
; Address: $D6CE02
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_80E:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA #$5C             ; A9 5C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_80F
; Address: $D6CE12
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_80F:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_811
; Address: $D6CE22
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_811:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    STA $362C            ; 8D 2C 36 | Store accumulator to absolute address
    JMP $4EBA            ; 4C BA 4E | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D1F            ; 4C 1F 4D | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D2F            ; 4C 2F 4D | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D3F            ; 4C 3F 4D | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D4F            ; 4C 4F 4D | Jump to address
    CMP #$04             ; C9 04 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D5F            ; 4C 5F 4D | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D6F            ; 4C 6F 4D | Jump to address
    CMP #$06             ; C9 06 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D7F            ; 4C 7F 4D | Jump to address
    CMP #$07             ; C9 07 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D8F            ; 4C 8F 4D | Jump to address
    CMP #$08             ; C9 08 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4D9F            ; 4C 9F 4D | Jump to address
    CMP #$09             ; C9 09 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4DAF            ; 4C AF 4D | Jump to address
    CMP #$0A             ; C9 0A | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4DBF            ; 4C BF 4D | Jump to address
    CMP #$0B             ; C9 0B | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4DCF            ; 4C CF 4D | Jump to address
    CMP #$0C             ; C9 0C | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4DDF            ; 4C DF 4D | Jump to address
    CMP #$0D             ; C9 0D | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4DEF            ; 4C EF 4D | Jump to address
    CMP #$0E             ; C9 0E | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_812
; Address: $D6CEA7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_812:
    JMP $4DFF            ; 4C FF 4D | Jump to address
    CMP #$0F             ; C9 0F | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4E0F            ; 4C 0F 4E | Jump to address
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4E1F            ; 4C 1F 4E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_813
; Address: $D6CEBB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_813:
    LDA $3542            ; AD 42 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4EDE            ; 4C DE 4E | Jump to address
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $4ED8            ; 4C D8 4E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_814
; Address: $D6CED1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_814:
    JSL $CB4F4C          ; 22 4C 4F CB | Jump to subroutine long
    JMP $4EDB            ; 4C DB 4E | Jump to address
    JMP $4F4B            ; 4C 4B 4F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_815
; Address: $D6CEDE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_815:
    JSL $CC82FE          ; 22 FE 82 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4F36            ; 4C 36 4F | Jump to address
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_816
; Address: $D6CEEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_816:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4F30            ; 4C 30 4F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_819
; Address: $D6CEFB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_819:
    JSL $CC9E7B          ; 22 7B 9E CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LSR $35              ; 46 35 | Logical shift right (zero page)
    LDX #$97             ; A2 97 | Load immediate value into X register
    ORA ($A0,X)          ; 01 A0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_81A
; Address: $D6CF0B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_81A:
    JSL $C77C10          ; 22 10 7C C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    CMP $2204,Y          ; D9 04 22 | Compare accumulator (absolute,Y)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    PHX                  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_81D
; Address: $D6CF29
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_81D:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $4F33            ; 4C 33 4F | Jump to address
    JMP $4F4B            ; 4C 4B 4F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_81E
; Address: $D6CF39
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_81E:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $4F48            ; 4C 48 4F | Jump to address
    JMP $4F4B            ; 4C 4B 4F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_820
; Address: $D6CF50
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_820:
    JMP $4F6B            ; 4C 6B 4F | Jump to address
    DEC $4C04,X          ; DE 04 4C | Decrement (absolute,X)
    STX $004F            ; 8E 4F 00 | Store X register to absolute address
    JMP $4F8E            ; 4C 8E 4F | Jump to address
    CPX #$04             ; E0 04 | Compare X register (immediate)
    JMP $4F8E            ; 4C 8E 4F | Jump to address
    SBC ($04,X)          ; E1 04 | Subtract with carry ((zero page,X))
    JMP $4F8E            ; 4C 8E 4F | Jump to address
    LDA $362C            ; AD 2C 36 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4F53            ; 4C 53 4F | Jump to address
    CMP #$01             ; C9 01 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4F59            ; 4C 59 4F | Jump to address
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4F5F            ; 4C 5F 4F | Jump to address
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4F65            ; 4C 65 4F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_825
; Address: $D6CFA1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_825:
    JSL $CC776D          ; 22 6D 77 CC | Jump to subroutine long
    CMP $2204,X          ; DD 04 22 | Compare accumulator (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    EOR #$77             ; 49 77 | Exclusive OR with accumulator (immediate)
    CPY $1C22            ; CC 22 1C | Compare Y register (absolute)
    EOR $22CB            ; 4D CB 22 | Exclusive OR with accumulator (absolute)
    ADC $CC77            ; 6D 77 CC | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_828
; Address: $D6CFC1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_828:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4FD2            ; 4C D2 4F | Jump to address
    JMP $4FD5            ; 4C D5 4F | Jump to address
    SBC $04              ; E5 04 | Subtract with carry (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_829
; Address: $D6CFD6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_829:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $4FE7            ; 4C E7 4F | Jump to address
    SED                  ; F8 | Set decimal mode flag
    JMP $4FEA            ; 4C EA 4F | Jump to address
    BEQ $04              ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_82B
; Address: $D6CFEB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_82B:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5001            ; 4C 01 50 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_82F
; Address: $D6D006
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_82F:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5018            ; 4C 18 50 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_830
; Address: $D6D011
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_830:
    JSL $CDAD3C          ; 22 3C AD CD | Jump to subroutine long
    JMP $501B            ; 4C 1B 50 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_831
; Address: $D6D01C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_831:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $502E            ; 4C 2E 50 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_832
; Address: $D6D027
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_832:
    JSL $CDAD40          ; 22 40 AD CD | Jump to subroutine long
    JMP $5031            ; 4C 31 50 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_833
; Address: $D6D032
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_833:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5044            ; 4C 44 50 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_834
; Address: $D6D03D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_834:
    JSL $CDAD38          ; 22 38 AD CD | Jump to subroutine long
    JMP $5047            ; 4C 47 50 | Jump to address
    CPX $04              ; E4 04 | Compare X register (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_83F
; Address: $D6D077
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_83F:
    JSL $CCD420          ; 22 20 D4 CC | Jump to subroutine long
    JMP $5051            ; 4C 51 50 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_840
; Address: $D6D07F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_840:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_844
; Address: $D6D099
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_844:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $50BF            ; 4C BF 50 | Jump to address
    SBC ($04),Y          ; F1 04 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_845
; Address: $D6D0A7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_845:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $50B6            ; 4C B6 50 | Jump to address
    JMP $50B9            ; 4C B9 50 | Jump to address
    PEA #$4C04           ; F4 04 4C | Push effective address to stack
    REP #$50             ; C2 50 | Reset processor status bits
    SEP #$04             ; E2 04 | Set processor status bits
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_846
; Address: $D6D0C3
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_846:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $50D4            ; 4C D4 50 | Jump to address
    SBC $4C04,Y          ; F9 04 4C | Subtract with carry (absolute,Y)
    BVC $00              ; 50 00 | Branch if overflow clear
    CPX $6B04            ; EC 04 6B | Compare X register (absolute)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $50F0            ; 4C F0 50 | Jump to address
    PLX                  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_847
; Address: $D6D0E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_847:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    JMP $50F3            ; 4C F3 50 | Jump to address
    SBC #$04             ; E9 04 | Subtract with carry (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_848
; Address: $D6D0F4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_848:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5106            ; 4C 06 51 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_849
; Address: $D6D0FF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_849:
    JSL $CDAD57          ; 22 57 AD CD | Jump to subroutine long
    JMP $5109            ; 4C 09 51 | Jump to address
    XBA                  ; EB | Exchange accumulator bytes
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_84A
; Address: $D6D10A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_84A:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $511B            ; 4C 1B 51 | Jump to address
    JMP $512F            ; 4C 2F 51 | Jump to address
    LDA $3556            ; AD 56 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_84B
; Address: $D6D123
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_84B:
    JMP $512C            ; 4C 2C 51 | Jump to address
    INC $4C04            ; EE 04 4C | Increment (absolute)
    EOR ($00),Y          ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
    SBC $6B04            ; ED 04 6B | Subtract with carry (absolute)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5142            ; 4C 42 51 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_84C
; Address: $D6D13B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_84C:
    JSL $CDAD6E          ; 22 6E AD CD | Jump to subroutine long
    JMP $5145            ; 4C 45 51 | Jump to address
    NOP                  ; EA | No operation
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_84D
; Address: $D6D146
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_84D:
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_84F
; Address: $D6D169
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_84F:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $517A            ; 4C 7A 51 | Jump to address
    JMP $518F            ; 4C 8F 51 | Jump to address
    INC $04              ; E6 04 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_850
; Address: $D6D17D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_850:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $518C            ; 4C 8C 51 | Jump to address
    JMP $518F            ; 4C 8F 51 | Jump to address
    INX                  ; E8 | Increment X register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_851
; Address: $D6D190
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_851:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $51A5            ; 4C A5 51 | Jump to address
    SBC $2204,X          ; FD 04 22 | Subtract with carry (absolute,X)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LDA #$51             ; A9 51 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_854
; Address: $D6D1AF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_854:
    JSL $CCD276          ; 22 76 D2 CC | Jump to subroutine long
    LDA #$90             ; A9 90 | Load immediate value into accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDX #$B8             ; A2 B8 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_855
; Address: $D6D1B8
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_855:
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    LDY #$70             ; A0 70 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_856
; Address: $D6D1BC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_856:
    JSL $C753A2          ; 22 A2 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $51CB            ; 4C CB 51 | Jump to address
    JMP $51E3            ; 4C E3 51 | Jump to address
    JMP $51E0            ; 4C E0 51 | Jump to address
    LDA #$60             ; A9 60 | Load immediate value into accumulator
    PHP                  ; 08 | Push processor status to stack
    LDX #$70             ; A2 70 | Load immediate value into X register
    PHP                  ; 08 | Push processor status to stack
    LDY #$B8             ; A0 B8 | Load immediate value into Y register
    ASL                  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_857
; Address: $D6D1D4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_857:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $51E0            ; 4C E0 51 | Jump to address
    JMP $51E3            ; 4C E3 51 | Jump to address
    JMP $51AF            ; 4C AF 51 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_85B
; Address: $D6D1EF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_85B:
    JSL $C75203          ; 22 03 52 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $51FC            ; 4C FC 51 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_85F
; Address: $D6D204
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_85F:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    LSR $2235            ; 4E 35 22 | Logical shift right (absolute)
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $A96B            ; CC 6B A9 | Compare Y register (absolute)
    AND ($00),Y          ; 31 00 | Logical AND with accumulator ((zero page),Y)
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$41             ; A9 41 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$36             ; A9 36 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$41             ; A9 41 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_861
; Address: $D6D236
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_861:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3436            ; AD 36 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $5250            ; 4C 50 52 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_863
; Address: $D6D249
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_863:
    JSL $CCD6FA          ; 22 FA D6 CC | Jump to subroutine long
    JMP $523A            ; 4C 3A 52 | Jump to address
    ASL $05              ; 06 05 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_864
; Address: $D6D253
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_864:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $526B            ; 4C 6B 52 | Jump to address
    PHP                  ; 08 | Push processor status to stack
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $526B            ; 4C 6B 52 | Jump to address
    JMP $5279            ; 4C 79 52 | Jump to address
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDA ($B0,X)          ; A1 B0 | Load from (zero page,X) into accumulator
    CMP $3A4C            ; CD 4C 3A | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_868
; Address: $D6D288
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_868:
    JSL $CDAE1E          ; 22 1E AE CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $529B            ; 4C 9B 52 | Jump to address
    JMP $528C            ; 4C 8C 52 | Jump to address
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $52B1            ; 4C B1 52 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_86A
; Address: $D6D2AA
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_86A:
    JSL $CDB0A1          ; 22 A1 B0 CD | Jump to subroutine long
    JMP $523A            ; 4C 3A 52 | Jump to address
    LDA #$31             ; A9 31 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$41             ; A9 41 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$36             ; A9 36 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$41             ; A9 41 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_86B
; Address: $D6D2CF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_86B:
    JSL $C736C8          ; 22 C8 36 C7 | Jump to subroutine long
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    EOR $A935            ; 4D 35 A9 | Exclusive OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    EOR $A935            ; 4D 35 A9 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_86F
; Address: $D6D2EF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_86F:
    JSL $CDDDCF          ; 22 CF DD CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $5306            ; 4C 06 53 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_872
; Address: $D6D30A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_872:
    JSL $CDADED          ; 22 ED AD CD | Jump to subroutine long
    LDX #$32             ; A2 32 | Load immediate value into X register
    LDA #$41             ; A9 41 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_877
; Address: $D6D324
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_877:
    JSL $CCD418          ; 22 18 D4 CC | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_878
; Address: $D6D330
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_878:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    EOR $2235            ; 4D 35 22 | Exclusive OR with accumulator (absolute)
    JMP $6BCDD6          ; 5C D6 CD 6B | Jump to address long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_87C
; Address: $D6D349
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_87C:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $535A            ; 4C 5A 53 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDX #$53             ; A2 53 | Load immediate value into X register
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $536B            ; 4C 6B 53 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDX #$53             ; A2 53 | Load immediate value into X register
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $537C            ; 4C 7C 53 | Jump to address
    STA $4C05,Y          ; 99 05 4C | Store accumulator to absolute,Y
    LDX #$53             ; A2 53 | Load immediate value into X register
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_87D
; Address: $D6D384
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_87D:
    JMP $538D            ; 4C 8D 53 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDX #$53             ; A2 53 | Load immediate value into X register
    ASL $2205,X          ; 1E 05 22 | Arithmetic shift left (absolute,X)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $539F            ; 4C 9F 53 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDX #$53             ; A2 53 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_87E
; Address: $D6D3A0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_87E:
    JSR $6B05            ; 20 05 6B | Jump to subroutine
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $53B5            ; 4C B5 53 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_87F
; Address: $D6D3AE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_87F:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $53CB            ; 4C CB 53 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $53C7            ; 4C C7 53 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_88D
; Address: $D6D402
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_88D:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5413            ; 4C 13 54 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5424            ; 4C 24 54 | Jump to address
    DEC $05              ; C6 05 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_88E
; Address: $D6D421
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_88E:
    JMP $5438            ; 4C 38 54 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5435            ; 4C 35 54 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SEC                  ; 38 | Set carry flag
    BPL $05              ; 10 05 | Branch if positive
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_88F
; Address: $D6D439
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_88F:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $544B            ; 4C 4B 54 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_890
; Address: $D6D444
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_890:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $5461            ; 4C 61 54 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $545D            ; 4C 5D 54 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_89A
; Address: $D6D484
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_89A:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$57             ; C9 57 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $549C            ; 4C 9C 54 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_89B
; Address: $D6D493
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_89B:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    STA $9F4C05          ; 8F 05 4C 9F | Store accumulator to absolute long address
    STA $D22205          ; 8F 05 22 D2 | Store accumulator to absolute long address
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    ASL $CDAE,X          ; 1E AE CD | Arithmetic shift left (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_89C
; Address: $D6D4A8
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_89C:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $54B9            ; 4C B9 54 | Jump to address
    DEC $4C05,X          ; DE 05 4C | Decrement (absolute,X)
    DEC $AD54,X          ; DE 54 AD | Decrement (absolute,X)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_89D
; Address: $D6D4BF
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_89D:
    BNE $03              ; D0 03 | Branch if not equal
    JMP $54CA            ; 4C CA 54 | Jump to address
    CPY $4C05            ; CC 05 4C | Compare Y register (absolute)
    DEC $AD54,X          ; DE 54 AD | Decrement (absolute,X)
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $54DB            ; 4C DB 54 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    DEC $0054,X          ; DE 54 00 | Decrement (absolute,X)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_89F
; Address: $D6D4E4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_89F:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $54F5            ; 4C F5 54 | Jump to address
    CPX #$05             ; E0 05 | Compare X register (immediate)
    JMP $5509            ; 4C 09 55 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5506            ; 4C 06 55 | Jump to address
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA #$55             ; 09 55 | Logical OR with accumulator (immediate)
    AND ($05,X)          ; 21 05 | Logical AND with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8A0
; Address: $D6D50A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8A0:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $551C            ; 4C 1C 55 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8A1
; Address: $D6D515
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8A1:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $5532            ; 4C 32 55 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $552E            ; 4C 2E 55 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8A8
; Address: $D6D546
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8A8:
    JSL $CC76C1          ; 22 C1 76 CC | Jump to subroutine long
    STA $2205            ; 8D 05 22 | Store accumulator to absolute address
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8AA
; Address: $D6D556
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8AA:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5579            ; 4C 79 55 | Jump to address
    INY                  ; C8 | Increment Y register
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $5573            ; 4C 73 55 | Jump to address
    CMP #$05             ; C9 05 | Compare accumulator (immediate)
    JMP $5576            ; 4C 76 55 | Jump to address
    DEX                  ; CA | Decrement X register
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $4EAD55          ; AF 55 AD 4E | Load from absolute long address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $558A            ; 4C 8A 55 | Jump to address
    LDY $4C05,X          ; BC 05 4C | Load from absolute,X into Y register
    LDA $45AD55          ; AF 55 AD 45 | Load from absolute long address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $559B            ; 4C 9B 55 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $3EAD55          ; AF 55 AD 3E | Load from absolute long address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $55AC            ; 4C AC 55 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $120055          ; AF 55 00 12 | Load from absolute long address into accumulator
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $55C2            ; 4C C2 55 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8AB
; Address: $D6D5BB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8AB:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $5608            ; 4C 08 56 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $55D4            ; 4C D4 55 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8AC
; Address: $D6D5CD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8AC:
    JSL $CB5609          ; 22 09 56 CB | Jump to subroutine long
    JMP $5608            ; 4C 08 56 | Jump to address
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $55E6            ; 4C E6 55 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8B0
; Address: $D6D5F0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8B0:
    JSL $CCD837          ; 22 37 D8 CC | Jump to subroutine long
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $5604            ; 4C 04 56 | Jump to address
    JMP $55F5            ; 4C F5 55 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8B9
; Address: $D6D62C
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8B9:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $563D            ; 4C 3D 56 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    STA $56              ; 85 56 | Store accumulator to zero page
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $564E            ; 4C 4E 56 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    STA $56              ; 85 56 | Store accumulator to zero page
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5671            ; 4C 71 56 | Jump to address
    LDA $2205,X          ; BD 05 22 | Load from absolute,X into accumulator
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $566B            ; 4C 6B 56 | Jump to address
    LDX $4C05,Y          ; BE 05 4C | Load from absolute,Y into X register
    ROR $0056            ; 6E 56 00 | Rotate right (absolute)
    LDA                  ; BF 05 4C 85 | Load from absolute long,X into accumulator
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5682            ; 4C 82 56 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    STA $56              ; 85 56 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8BB
; Address: $D6D686
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8BB:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5697            ; 4C 97 56 | Jump to address
    CMP $4C05            ; CD 05 4C | Compare accumulator (absolute)
    LDY $AD56,X          ; BC 56 AD | Load from absolute,X into Y register
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $56A8            ; 4C A8 56 | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDY $AD56,X          ; BC 56 AD | Load from absolute,X into Y register
    ROL $2935,X          ; 3E 35 29 | Rotate left (absolute,X)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $56B9            ; 4C B9 56 | Jump to address
    ORA $4C05,X          ; 1D 05 4C | Logical OR with accumulator (absolute,X)
    LDY $0056,X          ; BC 56 00 | Load from absolute,X into Y register
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $56CF            ; 4C CF 56 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8BC
; Address: $D6D6C8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8BC:
    JSL $CCD3D3          ; 22 D3 D3 CC | Jump to subroutine long
    JMP $56E5            ; 4C E5 56 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $56E1            ; 4C E1 56 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8C4
; Address: $D6D6FD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8C4:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$57             ; C9 57 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $5715            ; 4C 15 57 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8C5
; Address: $D6D70C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8C5:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    STX $4C05            ; 8E 05 4C | Store X register to absolute address
    CLC                  ; 18 | Clear carry flag
    STX $2205            ; 8E 05 22 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8C6
; Address: $D6D71A
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8C6:
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    BPL $AE              ; 10 AE | Branch if positive
    CMP $AD6B            ; CD 6B AD | Compare accumulator (absolute)
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5732            ; 4C 32 57 | Jump to address
    CMP $4C05,X          ; DD 05 4C | Compare accumulator (absolute,X)
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5743            ; 4C 43 57 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5754            ; 4C 54 57 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $577A            ; 4C 7A 57 | Jump to address
    CLC                  ; 18 | Clear carry flag
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    STZ $7A              ; 64 7A | Store zero to zero page
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $5771            ; 4C 71 57 | Jump to address
    ORA $4C05,Y          ; 19 05 4C | Logical OR with accumulator (absolute,Y)
    INC                  ; 1A | Increment accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $4C05,Y          ; 19 05 4C | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8C7
; Address: $D6D77A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8C7:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $5789            ; 4C 89 57 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    PLY                  ; 7A | Pull Y register from stack
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $5798            ; 4C 98 57 | Jump to address
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $57AE            ; 4C AE 57 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8CC
; Address: $D6D7BA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8CC:
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $57D4            ; 4C D4 57 | Jump to address
    LDA #$34             ; A9 34 | Load immediate value into accumulator
    LDX #$41             ; A2 41 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8CE
; Address: $D6D7CF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8CE:
    JSL $C7518C          ; 22 8C 51 C7 | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $5811            ; 4C 11 58 | Jump to address
    LDA $342E            ; AD 2E 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $57FD            ; 4C FD 57 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8CF
; Address: $D6D7EA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8CF:
    JSL $C751F0          ; 22 F0 51 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $57FA            ; 4C FA 57 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8D1
; Address: $D6D7FD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8D1:
    JSL $C7522F          ; 22 2F 52 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $580D            ; 4C 0D 58 | Jump to address
    LDA #$03             ; A9 03 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8D5
; Address: $D6D819
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8D5:
    JSL $CCD881          ; 22 81 D8 CC | Jump to subroutine long
    LDX #$33             ; A2 33 | Load immediate value into X register
    LDA #$44             ; A9 44 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8DD
; Address: $D6D842
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8DD:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $589D            ; 4C 9D 58 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8DE
; Address: $D6D851
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8DE:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $586D            ; 4C 6D 58 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8DF
; Address: $D6D860
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8DF:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    CMP $774C            ; CD 4C 77 | Compare accumulator (absolute)
    CLI                  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8E0
; Address: $D6D86D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8E0:
    JSL $C1A944          ; 22 44 A9 C1 | Jump to subroutine long
    ORA $2205            ; 0D 05 22 | Logical OR with accumulator (absolute)
    CLV                  ; B8 | Clear overflow flag
    CMP $6322            ; CD 22 63 | Compare accumulator (absolute)
    CPY $D222            ; CC 22 D2 | Compare Y register (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $4022            ; CC 22 40 | Compare Y register (absolute)
    CMP $A9CC,Y          ; D9 CC A9 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8E6
; Address: $D6D8A1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8E6:
    JSL $CCDB63          ; 22 63 DB CC | Jump to subroutine long
    LDX #$34             ; A2 34 | Load immediate value into X register
    LDA #$43             ; A9 43 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8EB
; Address: $D6D8BE
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8EB:
    JSL $CCD88A          ; 22 8A D8 CC | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $D122            ; CC 22 D1 | Compare Y register (absolute)
    LDA $4CCD            ; AD CD 4C | Load from absolute address into accumulator
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_8F0
; Address: $D6D8E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_8F0:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDX #$1E             ; A2 1E | Load immediate value into X register
    LDA #$57             ; A9 57 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_901
; Address: $D6D93B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_901:
    JSL $CCD8D3          ; 22 D3 D8 CC | Jump to subroutine long
    LDA #$41             ; A9 41 | Load immediate value into accumulator
    STA $342E            ; 8D 2E 34 | Store accumulator to absolute address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_902
; Address: $D6D945
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_902:
    JSL $CDADF4          ; 22 F4 AD CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)
    ORA $05              ; 05 05 | Logical OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_908
; Address: $D6D96C
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_908:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5981            ; 4C 81 59 | Jump to address
    BIT $05              ; 24 05 | Test bits in accumulator (zero page)
    JMP $598A            ; 4C 8A 59 | Jump to address
    ROL $A905            ; 2E 05 A9 | Rotate left (absolute)
    LSR $2235            ; 4E 35 22 | Logical shift right (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $01A9            ; CC A9 01 | Compare Y register (absolute)
    BIT $2236            ; 2C 36 22 | Test bits in accumulator (absolute)
    CPY $2CAD            ; CC AD 2C | Compare Y register (absolute)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $59BB            ; 4C BB 59 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_90A
; Address: $D6D9B1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_90A:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    BIT $2236            ; 2C 36 22 | Test bits in accumulator (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    TYA                  ; 98 | Transfer Y register to accumulator
    CPY $AD6B            ; CC 6B AD | Compare Y register (absolute)
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_90C
; Address: $D6D9CF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_90C:
    JSL $CC91AE          ; 22 AE 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $59DC            ; 4C DC 59 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_90D
; Address: $D6D9D8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_90D:
    JSL $CCD7F9          ; 22 F9 D7 CC | Jump to subroutine long
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    LDX #$1D             ; A2 1D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_911
; Address: $D6D9F1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_911:
    JSL $CC7A53          ; 22 53 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5A05            ; 4C 05 5A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_913
; Address: $D6D9FE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_913:
    JSL $CB5AAA          ; 22 AA 5A CB | Jump to subroutine long
    JMP $5A1B            ; 4C 1B 5A | Jump to address
    LDA $354D            ; AD 4D 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5A17            ; 4C 17 5A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_91B
; Address: $D6DA36
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_91B:
    JSL $CDAEB1          ; 22 B1 AE CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    CMP $A9CC,Y          ; D9 CC A9 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_92E
; Address: $D6DA9E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_92E:
    JSL $CDA724          ; 22 24 A7 CD | Jump to subroutine long
    LDA #$13             ; A9 13 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_92F
; Address: $D6DAAA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_92F:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $5ABE            ; 4C BE 5A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_939
; Address: $D6DAE6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_939:
    JSL $CCD857          ; 22 57 D8 CC | Jump to subroutine long
    JMP $5ABE            ; 4C BE 5A | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_93A
; Address: $D6DAEE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_93A:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5B65            ; 4C 65 5B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_93B
; Address: $D6DAF9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_93B:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5B5B            ; 4C 5B 5B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_93C
; Address: $D6DB02
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_93C:
    JSL $CC91AE          ; 22 AE 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5B30            ; 4C 30 5B | Jump to address
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5B26            ; 4C 26 5B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_93D
; Address: $D6DB17
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_93D:
    NOP                  ; EA | No operation
    ORA $A9              ; 05 A9 | Logical OR with accumulator (zero page)
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    AND $005B            ; 2D 5B 00 | Logical AND with accumulator (absolute)
    INX                  ; E8 | Increment X register
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CLI                  ; 58 | Clear interrupt disable flag
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5B45            ; 4C 45 5B | Jump to address
    SEP #$05             ; E2 05 | Set processor status bits

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_942
; Address: $D6DB54
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_942:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $5B62            ; 4C 62 5B | Jump to address
    SBC $05              ; E5 05 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_943
; Address: $D6DB5E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_943:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $5BB1            ; 4C B1 5B | Jump to address
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5B89            ; 4C 89 5B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_944
; Address: $D6DB70
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_944:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5B7F            ; 4C 7F 5B | Jump to address
    DEC $4C05            ; CE 05 4C | Decrement (absolute)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LDA ($5B),Y          ; B1 5B | Load from (zero page),Y into accumulator
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5BAD            ; 4C AD 5B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_945
; Address: $D6DB94
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_945:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5BA3            ; 4C A3 5B | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDX $5B              ; A6 5B | Load from zero page into X register
    STZ $2205            ; 9C 05 22 | Store zero to absolute
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LDA ($5B),Y          ; B1 5B | Load from (zero page),Y into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_947
; Address: $D6DBB2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_947:
    JSL $CC7AEA          ; 22 EA 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5C7C            ; 4C 7C 5C | Jump to address
    LDA $362C            ; AD 2C 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5BE5            ; 4C E5 5B | Jump to address
    AND $05              ; 25 05 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_948
; Address: $D6DBC9
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_948:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5BD8            ; 4C D8 5B | Jump to address
    ROL $05              ; 26 05 | Rotate left (zero page)
    JMP $5BDB            ; 4C DB 5B | Jump to address
    PLP                  ; 28 | Pull processor status from stack
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    ADC $AD5C,Y          ; 79 5C AD | Add with carry (absolute,Y)
    LSR $2935            ; 4E 35 29 | Logical shift right (absolute)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5C06            ; 4C 06 5C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_949
; Address: $D6DBF1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_949:
    JSL $F02205          ; 22 05 22 F0 | Jump to subroutine long
    CPY $0390            ; CC 90 03 | Compare Y register (absolute)
    JMP $5C03            ; 4C 03 5C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_94A
; Address: $D6DBFC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_94A:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $354DAD          ; 5C AD 4D 35 | Jump to address long
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $5C2C            ; 4C 2C 5C | Jump to address
    ROL                  ; 2A | Rotate left (accumulator)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $5C23            ; 4C 23 5C | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ROL $5C              ; 26 5C | Rotate left (zero page)
    BIT $0005            ; 2C 05 00 | Test bits in accumulator (absolute)
    AND $4C05            ; 2D 05 4C | Logical AND with accumulator (absolute)
    JMP $052F00          ; 5C 00 2F 05 | Jump to address long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_94B
; Address: $D6DC2F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_94B:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5C3E            ; 4C 3E 5C | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $053000          ; 5C 00 30 05 | Jump to address long
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $5C52            ; 4C 52 5C | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_94C
; Address: $D6DC50
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_94C:
    BIT $2236            ; 2C 36 22 | Test bits in accumulator (absolute)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    ORA $A1              ; 05 A1 | Logical OR with accumulator (zero page)
    CMP $E722            ; CD 22 E7 | Compare accumulator (absolute)
    CMP $CD              ; C5 CD | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_951
; Address: $D6DC6E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_951:
    JSL $CDAC54          ; 22 54 AC CD | Jump to subroutine long
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $5C83            ; 4C 83 5C | Jump to address
    AND #$05             ; 29 05 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_954
; Address: $D6DC89
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_954:
    JSL $CC91AE          ; 22 AE 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5C96            ; 4C 96 5C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_957
; Address: $D6DC9B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_957:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5CF9            ; 4C F9 5C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_958
; Address: $D6DCA4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_958:
    JSL $CC91AE          ; 22 AE 91 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5CCE            ; 4C CE 5C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_959
; Address: $D6DCAD
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_959:
    JSL $CCDA0E          ; 22 0E DA CC | Jump to subroutine long
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5CC2            ; 4C C2 5C | Jump to address
    XBA                  ; EB | Exchange accumulator bytes
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $05E900          ; 5C 00 E9 05 | Jump to address long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ORA $4C36,Y          ; 19 36 4C | Logical OR with accumulator (absolute,Y)
    JMP $354EAD          ; 5C AD 4E 35 | Jump to address long
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5CE3            ; 4C E3 5C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_95A
; Address: $D6DCD9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_95A:
    JSL $CCDA0E          ; 22 0E DA CC | Jump to subroutine long
    CPX $05              ; E4 05 | Compare X register (zero page)
    JMP $5CF6            ; 4C F6 5C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_95D
; Address: $D6DCF1
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_95D:
    JSR $0C00            ; 20 00 0C | Jump to subroutine
    LSR $4C35            ; 4E 35 4C | Logical shift right (absolute)
    EOR $E600,X          ; 5D 00 E6 | Exclusive OR with accumulator (absolute,X)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDX #$11             ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_95F
; Address: $D6DD0D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_95F:
    JSL $CDDC44          ; 22 44 DC CD | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$11             ; A9 11 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_970
; Address: $D6DD76
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_970:
    JSL $CCD418          ; 22 18 D4 CC | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    STZ $7A              ; 64 7A | Store zero to zero page
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $5D8C            ; 4C 8C 5D | Jump to address
    ORA ($05,X)          ; 01 05 | Logical OR with accumulator ((zero page,X))
    JMP $5D8F            ; 4C 8F 5D | Jump to address
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CLD                  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_971
; Address: $D6DD95
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_971:
    LDA $22CD            ; AD CD 22 | Load from absolute address into accumulator
    CMP ($AE),Y          ; D1 AE | Compare accumulator ((zero page),Y)
    CMP $AB22            ; CD 22 AB | Compare accumulator (absolute)
    CMP $22CD,X          ; DD CD 22 | Compare accumulator (absolute,X)
    CPY $10A9            ; CC A9 10 | Compare Y register (absolute)
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    BPL $09              ; 10 09 | Branch if positive
    LDY #$C8             ; A0 C8 | Load immediate value into Y register
    PHP                  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_972
; Address: $D6DDAC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_972:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5DB8            ; 4C B8 5D | Jump to address
    JMP $5DBB            ; 4C BB 5D | Jump to address
    JMP $5D9F            ; 4C 9F 5D | Jump to address
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CLC                  ; 18 | Clear carry flag
    CPY $CF22            ; CC 22 CF | Compare Y register (absolute)
    CMP $22CD,X          ; DD CD 22 | Compare accumulator (absolute,X)
    SBC $CDAD            ; ED AD CD | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_973
; Address: $D6DDCE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_973:
    JSL $CCD2E7          ; 22 E7 D2 CC | Jump to subroutine long
    JMP $5DCE            ; 4C CE 5D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_98B
; Address: $D6DE3F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_98B:
    LDA #$14             ; A9 14 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_98C
; Address: $D6DE47
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_98C:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5E68            ; 4C 68 5E | Jump to address
    CPX $2205            ; EC 05 22 | Compare X register (absolute)
    ORA $7B              ; 05 7B | Logical OR with accumulator (zero page)
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $5E65            ; 4C 65 5E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_98D
; Address: $D6DE5E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_98D:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    SBC $4C05            ; ED 05 4C | Subtract with carry (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    LSR $45AD,X          ; 5E AD 45 | Logical shift right (absolute,X)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5E88            ; 4C 88 5E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_98E
; Address: $D6DE73
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_98E:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $5E82            ; 4C 82 5E | Jump to address
    STA $4C05,X          ; 9D 05 4C | Store accumulator to absolute,X
    STA $5E              ; 85 5E | Store accumulator to zero page
    STZ $4C05,X          ; 9E 05 4C | Store zero to absolute,X
    TXS                  ; 9A | Transfer X register to stack pointer
    LSR $0522,X          ; 5E 22 05 | Logical shift right (absolute,X)
    CPY $0390            ; CC 90 03 | Compare Y register (absolute)
    JMP $5E97            ; 4C 97 5E | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    LSR $3300,X          ; 5E 00 33 | Logical shift right (absolute,X)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5EAC            ; 4C AC 5E | Jump to address
    BNE $05              ; D0 05 | Branch if not equal
    JMP $5ED1            ; 4C D1 5E | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5EBD            ; 4C BD 5E | Jump to address
    TYA                  ; 98 | Transfer Y register to accumulator
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    CMP ($5E),Y          ; D1 5E | Compare accumulator ((zero page),Y)
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5ECE            ; 4C CE 5E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_98F
; Address: $D6DECA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_98F:
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    CMP ($5E),Y          ; D1 5E | Compare accumulator ((zero page),Y)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5EE4            ; 4C E4 5E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_990
; Address: $D6DEDD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_990:
    JSL $CCD108          ; 22 08 D1 CC | Jump to subroutine long
    JMP $5EFA            ; 4C FA 5E | Jump to address
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5EF6            ; 4C F6 5E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_993
; Address: $D6DEFB
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_993:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F0C            ; 4C 0C 5F | Jump to address
    INC $4C05            ; EE 05 4C | Increment (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_994
; Address: $D6DF0A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_994:
    JSR $AD5F            ; 20 5F AD | Jump to subroutine
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F1D            ; 4C 1D 5F | Jump to address
    EOR ($01),Y          ; 51 01 | Exclusive OR with accumulator ((zero page),Y)
    JMP $5F20            ; 4C 20 5F | Jump to address
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F33            ; 4C 33 5F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_995
; Address: $D6DF2C
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_995:
    JSL $CDC370          ; 22 70 C3 CD | Jump to subroutine long
    JMP $5F61            ; 4C 61 5F | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F48            ; 4C 48 5F | Jump to address
    STA                  ; 9F 05 22 D2 | Store accumulator to absolute long,X
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    ADC ($5F,X)          ; 61 5F | Add with carry ((zero page,X))
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F5A            ; 4C 5A 5F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_996
; Address: $D6DF53
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_996:
    JSL $CDC370          ; 22 70 C3 CD | Jump to subroutine long
    JMP $5F61            ; 4C 61 5F | Jump to address
    ASL $2205            ; 0E 05 22 | Arithmetic shift left (absolute)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_998
; Address: $D6DF67
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_998:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F78            ; 4C 78 5F | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    LDA $353C            ; AD 3C 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5F9D            ; 4C 9D 5F | Jump to address
    AND $2205,Y          ; 39 05 22 | Logical AND with accumulator (absolute,Y)
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $5F9A            ; 4C 9A 5F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_99A
; Address: $D6DF93
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_99A:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    DEC                  ; 3A | Decrement accumulator
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDY #$5F             ; A0 5F | Load immediate value into Y register
    SEC                  ; 38 | Set carry flag
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5FB3            ; 4C B3 5F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_99B
; Address: $D6DFAC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_99B:
    JSL $CDBF31          ; 22 31 BF CD | Jump to subroutine long
    JMP $5FCC            ; 4C CC 5F | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5FC8            ; 4C C8 5F | Jump to address
    LDY #$05             ; A0 05 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_99E
; Address: $D6DFCD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_99E:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5FDF            ; 4C DF 5F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_99F
; Address: $D6DFD8
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_99F:
    JSL $CDC36B          ; 22 6B C3 CD | Jump to subroutine long
    JMP $5FE6            ; 4C E6 5F | Jump to address
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $5FF8            ; 4C F8 5F | Jump to address
    SBC ($05),Y          ; F1 05 | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9A0
; Address: $D6DFF5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9A0:
    JMP $601D            ; 4C 1D 60 | Jump to address
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6009            ; 4C 09 60 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $AD60,X          ; 1D 60 AD | Logical OR with accumulator (absolute,X)
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $601A            ; 4C 1A 60 | Jump to address
    LDX #$05             ; A2 05 | Load immediate value into X register
    JMP $601D            ; 4C 1D 60 | Jump to address
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9A2
; Address: $D6E024
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9A2:
    PLA                  ; 68 | Pull accumulator from stack
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6038            ; 4C 38 60 | Jump to address
    BEQ $05              ; F0 05 | Branch if equal
    JMP $605D            ; 4C 5D 60 | Jump to address
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6049            ; 4C 49 60 | Jump to address
    CMP ($05),Y          ; D1 05 | Compare accumulator ((zero page),Y)
    JMP $605D            ; 4C 5D 60 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $605A            ; 4C 5A 60 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    EOR $0060,X          ; 5D 60 00 | Exclusive OR with accumulator (absolute,X)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9A5
; Address: $D6E068
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9A5:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6079            ; 4C 79 60 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    STZ $AD60,X          ; 9E 60 AD | Store zero to absolute,X
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $608A            ; 4C 8A 60 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9A6
; Address: $D6E086
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9A6:
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    STZ $AD60,X          ; 9E 60 AD | Store zero to absolute,X
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $609B            ; 4C 9B 60 | Jump to address
    STA $4C05,Y          ; 99 05 4C | Store accumulator to absolute,Y
    STZ $0060,X          ; 9E 60 00 | Store zero to absolute,X
    AND $6B05,X          ; 3D 05 6B | Logical AND with accumulator (absolute,X)
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $60B0            ; 4C B0 60 | Jump to address
    ROL $4C05,X          ; 3E 05 4C | Rotate left (absolute,X)
    CPY $60              ; C4 60 | Compare Y register (zero page)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $60C1            ; 4C C1 60 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    CPY $60              ; C4 60 | Compare Y register (zero page)
    ROL $6B05,X          ; 3E 05 6B | Rotate left (absolute,X)
    ROL $AD05,X          ; 3E 05 AD | Rotate left (absolute,X)
    LSR $2935            ; 4E 35 29 | Logical shift right (absolute)
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    BNE $03              ; D0 03 | Branch if not equal
    JMP $60E3            ; 4C E3 60 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9A7
; Address: $D6E0D3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9A7:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $60E3            ; 4C E3 60 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9A8
; Address: $D6E0DC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9A8:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $60F6            ; 4C F6 60 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9A9
; Address: $D6E0EF
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9A9:
    JSL $CB60C5          ; 22 C5 60 CB | Jump to subroutine long
    JMP $610B            ; 4C 0B 61 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6107            ; 4C 07 61 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ADC ($22,X)          ; 61 22 | Add with carry ((zero page,X))
    CMP $60              ; C5 60 | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9AA
; Address: $D6E10D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9AA:
    SED                  ; F8 | Set decimal mode flag
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    DEX                  ; CA | Decrement X register
    STA ($CC),Y          ; 91 CC | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9AC
; Address: $D6E118
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9AC:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    SBC $6B05,Y          ; F9 05 6B | Subtract with carry (absolute,Y)
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6132            ; 4C 32 61 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9AD
; Address: $D6E12B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9AD:
    JSL $CB610C          ; 22 0C 61 CB | Jump to subroutine long
    JMP $6167            ; 4C 67 61 | Jump to address
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6144            ; 4C 44 61 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9AE
; Address: $D6E13D
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9AE:
    JSL $CB610C          ; 22 0C 61 CB | Jump to subroutine long
    JMP $6167            ; 4C 67 61 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6155            ; 4C 55 61 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ADC ($22,X)          ; 61 22 | Add with carry ((zero page,X))
    ORA $7B              ; 05 7B | Logical OR with accumulator (zero page)
    CPY $0390            ; CC 90 03 | Compare Y register (absolute)
    JMP $6164            ; 4C 64 61 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ADC ($00,X)          ; 61 00 | Add with carry ((zero page,X))
    LSR $05              ; 46 05 | Logical shift right (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9AF
; Address: $D6E168
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9AF:
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6179            ; 4C 79 61 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $4EAD61          ; AF 61 AD 4E | Load from absolute long address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $618A            ; 4C 8A 61 | Jump to address
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    JMP $61AF            ; 4C AF 61 | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $619B            ; 4C 9B 61 | Jump to address
    LDX $05              ; A6 05 | Load from zero page into X register
    JMP $61AF            ; 4C AF 61 | Jump to address
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $61AC            ; 4C AC 61 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9B0
; Address: $D6E1A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9B0:
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $4A0061          ; AF 61 00 4A | Load from absolute long address into accumulator
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9B2
; Address: $D6E1B5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9B2:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $61C6            ; 4C C6 61 | Jump to address
    LDA $05              ; A5 05 | Load from zero page into accumulator
    JMP $61C9            ; 4C C9 61 | Jump to address
    EOR #$05             ; 49 05 | Exclusive OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9B4
; Address: $D6E1D0
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9B4:
    PHA                  ; 48 | Push accumulator to stack
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $61E8            ; 4C E8 61 | Jump to address
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    JMP $620E            ; 4C 0E 62 | Jump to address
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $620B            ; 4C 0B 62 | Jump to address
    CMP ($05,X)          ; C1 05 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9B5
; Address: $D6E1F6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9B5:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6205            ; 4C 05 62 | Jump to address
    REP #$05             ; C2 05 | Reset processor status bits
    JMP $6208            ; 4C 08 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ASL $0062            ; 0E 62 00 | Arithmetic shift left (absolute)
    EOR ($05,X)          ; 41 05 | Exclusive OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9B6
; Address: $D6E20F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9B6:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6220            ; 4C 20 62 | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $AD              ; 05 AD | Logical OR with accumulator (zero page)
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6235            ; 4C 35 62 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9BA
; Address: $D6E23B
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9BA:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $624C            ; 4C 4C 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $625D            ; 4C 5D 62 | Jump to address
    CLD                  ; D8 | Clear decimal mode flag
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $626E            ; 4C 6E 62 | Jump to address
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    JMP $629A            ; 4C 9A 62 | Jump to address
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $627F            ; 4C 7F 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    TXS                  ; 9A | Transfer X register to stack pointer
    EOR ($05),Y          ; 51 05 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9BB
; Address: $D6E282
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9BB:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6297            ; 4C 97 62 | Jump to address
    ORA $A9              ; 05 A9 | Logical OR with accumulator (zero page)
    LSR $4C35            ; 4E 35 4C | Logical shift right (absolute)
    TXS                  ; 9A | Transfer X register to stack pointer
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $62AC            ; 4C AC 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SEP #$62             ; E2 62 | Set processor status bits
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $62BD            ; 4C BD 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SEP #$62             ; E2 62 | Set processor status bits
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9BC
; Address: $D6E2C0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9BC:
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $62CE            ; 4C CE 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SEP #$62             ; E2 62 | Set processor status bits
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $62DF            ; 4C DF 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SEP #$62             ; E2 62 | Set processor status bits
    WDM #$05             ; 42 05 | Reserved instruction
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9BD
; Address: $D6E2E3
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9BD:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $62F4            ; 4C F4 62 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $AD63,Y          ; 19 63 AD | Logical OR with accumulator (absolute,Y)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6305            ; 4C 05 63 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $AD63,Y          ; 19 63 AD | Logical OR with accumulator (absolute,Y)
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6316            ; 4C 16 63 | Jump to address
    LDY $05              ; A4 05 | Load from zero page into Y register
    JMP $6319            ; 4C 19 63 | Jump to address
    EOR $05              ; 45 05 | Exclusive OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9BF
; Address: $D6E31F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9BF:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6342            ; 4C 42 63 | Jump to address
    PEA #$2205           ; F4 05 22 | Push effective address to stack
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $633C            ; 4C 3C 63 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6353            ; 4C 53 63 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9C0
; Address: $D6E356
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9C0:
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6364            ; 4C 64 63 | Jump to address
    LDX #$05             ; A2 05 | Load immediate value into X register
    JMP $6367            ; 4C 67 63 | Jump to address
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9C2
; Address: $D6E36D
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9C2:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $637E            ; 4C 7E 63 | Jump to address
    PLX                  ; FA | Pull X register from stack
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $638F            ; 4C 8F 63 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $63A0            ; 4C A0 63 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $6B05            ; 4C 05 6B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9C4
; Address: $D6E3A9
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9C4:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $63BA            ; 4C BA 63 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    BEQ $63              ; F0 63 | Branch if equal
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $63CB            ; 4C CB 63 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    BEQ $63              ; F0 63 | Branch if equal
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $63DC            ; 4C DC 63 | Jump to address
    LDY $05              ; A4 05 | Load from zero page into Y register
    JMP $63F0            ; 4C F0 63 | Jump to address
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $63ED            ; 4C ED 63 | Jump to address
    LSR $4C05            ; 4E 05 4C | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9C8
; Address: $D6E3FA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9C8:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    LDA $3550            ; AD 50 35 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6428            ; 4C 28 64 | Jump to address
    LDA $2205            ; AD 05 22 | Load from absolute address into accumulator
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    LDX $2205            ; AE 05 22 | Load from absolute address into X register
    BMI $A1              ; 30 A1 | Branch if negative
    CPY $0622            ; CC 22 06 | Compare Y register (absolute)
    TAY                  ; A8 | Transfer accumulator to Y register
    CMP $BD22            ; CD 22 BD | Compare accumulator (absolute)
    LDY $00CD            ; AC CD 00 | Load from absolute address into Y register
    BCS $05              ; B0 05 | Branch if carry set

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9CA
; Address: $D6E428
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9CA:
    JSL $CC8C76          ; 22 76 8C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6437            ; 4C 37 64 | Jump to address
    LDA $3A4C05          ; AF 05 4C 3A | Load from absolute long address into accumulator
    STZ $00              ; 64 00 | Store zero to zero page
    LDY $0005            ; AC 05 00 | Load from absolute address into Y register
    BCS $05              ; B0 05 | Branch if carry set

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9CF
; Address: $D6E44D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9CF:
    JSL $CCD346          ; 22 46 D3 CC | Jump to subroutine long
    LDX #$25             ; A2 25 | Load immediate value into X register
    LDA #$29             ; A9 29 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9D2
; Address: $D6E45F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9D2:
    JSL $C751F0          ; 22 F0 51 C7 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $646C            ; 4C 6C 64 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9D5
; Address: $D6E470
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9D5:
    JSL $CDADE6          ; 22 E6 AD CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$FC             ; C9 FC | Compare accumulator (immediate)
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6483            ; 4C 83 64 | Jump to address
    JMP $6474            ; 4C 74 64 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9DA
; Address: $D6E499
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9DA:
    JSL $CDE0A4          ; 22 A4 E0 CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E4             ; C9 E4 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $64AC            ; 4C AC 64 | Jump to address
    JMP $649D            ; 4C 9D 64 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9E2
; Address: $D6E4D7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9E2:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$AC             ; A9 AC | Load immediate value into accumulator
    ORA $348D            ; 0D 8D 34 | Logical OR with accumulator (absolute)
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$10             ; C9 10 | Compare accumulator (immediate)
    ASL $0390            ; 0E 90 03 | Arithmetic shift left (absolute)
    JMP $64F0            ; 4C F0 64 | Jump to address
    JMP $64E1            ; 4C E1 64 | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9E6
; Address: $D6E502
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9E6:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$BC             ; A9 BC | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    LDA #$02             ; A9 02 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9EC
; Address: $D6E523
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9EC:
    JSL $CCD428          ; 22 28 D4 CC | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9F0
; Address: $D6E53E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9F0:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$58             ; A9 58 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9F3
; Address: $D6E559
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9F3:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9F6
; Address: $D6E574
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9F6:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9F9
; Address: $D6E58F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9F9:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_9FC
; Address: $D6E5AA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_9FC:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$50             ; A9 50 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)
    ROL $34              ; 26 34 | Rotate left (zero page)
    LDA #$A8             ; A9 A8 | Load immediate value into accumulator
    ORA #$8D             ; 09 8D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A03
; Address: $D6E5CE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A03:
    JSL $CDC682          ; 22 82 C6 CD | Jump to subroutine long
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$FE             ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A04
; Address: $D6E5DB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A04:
    JSL $C01FEE          ; 22 EE 1F C0 | Jump to subroutine long
    LDA #$81             ; A9 81 | Load immediate value into accumulator
    LDX #$08             ; A2 08 | Load immediate value into X register
    ORA $FEA0,Y          ; 19 A0 FE | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A0B
; Address: $D6E603
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A0B:
    JSL $CDAFF1          ; 22 F1 AF CD | Jump to subroutine long
    LDA #$84             ; A9 84 | Load immediate value into accumulator
    LSR $348D            ; 4E 8D 34 | Logical shift right (absolute)
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A0C
; Address: $D6E610
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A0C:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    CMP #$3F             ; C9 3F | Compare accumulator (immediate)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPY #$C9             ; C0 C9 | Compare Y register (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6628            ; 4C 28 66 | Jump to address
    JMP $6618            ; 4C 18 66 | Jump to address
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A0D
; Address: $D6E62B
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A0D:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    LSR $0390            ; 4E 90 03 | Logical shift right (absolute)
    JMP $6642            ; 4C 42 66 | Jump to address
    JMP $6633            ; 4C 33 66 | Jump to address
    LDA #$3C             ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A11
; Address: $D6E659
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A11:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A12
; Address: $D6E666
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A12:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A13
; Address: $D6E673
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A13:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A14
; Address: $D6E680
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A14:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A15
; Address: $D6E68D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A15:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A16
; Address: $D6E69A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A16:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A17
; Address: $D6E6A7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A17:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    CLV                  ; B8 | Clear overflow flag
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A18
; Address: $D6E6B4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A18:
    JSL $C1A9D3          ; 22 D3 A9 C1 | Jump to subroutine long
    LDA $2205,Y          ; B9 05 22 | Load from absolute,Y into accumulator
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY #$FC             ; C0 FC | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A19
; Address: $D6E6C5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A19:
    JSL $C04835          ; 22 35 48 C0 | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $66D5            ; 4C D5 66 | Jump to address
    JMP $66C5            ; 4C C5 66 | Jump to address
    LDA #$4C             ; A9 4C | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    LDA $9977            ; AD 77 99 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A1A
; Address: $D6E6DE
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A1A:
    JSL $C04604          ; 22 04 46 C0 | Jump to subroutine long
    ORA $40              ; 05 40 | Logical OR with accumulator (zero page)
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    PHA                  ; 48 | Push accumulator to stack
    CPY #$05             ; C0 05 | Compare Y register (immediate)
    RTI                  ; 40 | Return from interrupt
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $66F6            ; 4C F6 66 | Jump to address
    JMP $66E6            ; 4C E6 66 | Jump to address
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$B0             ; C9 B0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6705            ; 4C 05 67 | Jump to address
    JMP $66F6            ; 4C F6 66 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A23
; Address: $D6E725
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A23:
    JSL $CDB061          ; 22 61 B0 CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    LSR $A935            ; 4E 35 A9 | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    SBC $CC9A            ; ED 9A CC | Subtract with carry (absolute)
    LDA #$56             ; A9 56 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A2D
; Address: $D6E76B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A2D:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6785            ; 4C 85 67 | Jump to address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A36
; Address: $D6E79F
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A36:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $67CB            ; 4C CB 67 | Jump to address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A42
; Address: $D6E7E5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A42:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA $353F            ; AD 3F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6823            ; 4C 23 68 | Jump to address
    LDA #$2B             ; A9 2B | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A4D
; Address: $D6E82D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A4D:
    JSL $CDC8E2          ; 22 E2 C8 CD | Jump to subroutine long
    LDA #$7D             ; A9 7D | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A56
; Address: $D6E85C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A56:
    PHA                  ; 48 | Push accumulator to stack
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$AC             ; C9 AC | Compare accumulator (immediate)
    ORA $0390            ; 0D 90 03 | Logical OR with accumulator (absolute)
    JMP $686D            ; 4C 6D 68 | Jump to address
    JMP $685E            ; 4C 5E 68 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A57
; Address: $D6E86D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A57:
    JSL $CDE073          ; 22 73 E0 CD | Jump to subroutine long
    LDA #$25             ; A9 25 | Load immediate value into accumulator
    LDX #$2E             ; A2 2E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A5B
; Address: $D6E883
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A5B:
    JSL $CDAFC1          ; 22 C1 AF CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $68A9            ; 4C A9 68 | Jump to address
    LDX #$10             ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A5D
; Address: $D6E89D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A5D:
    JSL $CDE149          ; 22 49 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    STY $2268            ; 8C 68 22 | Store Y register to absolute address
    LDX $22CD            ; AE CD 22 | Load from absolute address into X register
    ORA ($B0),Y          ; 11 B0 | Logical OR with accumulator ((zero page),Y)
    CMP $00A9            ; CD A9 00 | Compare accumulator (absolute)
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $68D3            ; 4C D3 68 | Jump to address
    LDX #$12             ; A2 12 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A5F
; Address: $D6E8C7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A5F:
    JSL $CDE149          ; 22 49 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    PLA                  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A60
; Address: $D6E8D3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A60:
    JSL $CDAE79          ; 22 79 AE CD | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A64
; Address: $D6E8E3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A64:
    JSL $CDA886          ; 22 86 A8 CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$38             ; C9 38 | Compare accumulator (immediate)
    LSR                  ; 4A | Logical shift right (accumulator)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $68F9            ; 4C F9 68 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A69
; Address: $D6E905
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A69:
    JSL $CDA886          ; 22 86 A8 CD | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$C0             ; C9 C0 | Compare accumulator (immediate)
    EOR $0390,X          ; 5D 90 03 | Exclusive OR with accumulator (absolute,X)
    JMP $691B            ; 4C 1B 69 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A6B
; Address: $D6E91B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A6B:
    JSL $CDA88E          ; 22 8E A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $693A            ; 4C 3A 69 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A6C
; Address: $D6E92E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A6C:
    JSL $CDE1B1          ; 22 B1 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    BIT $69              ; 24 69 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A6D
; Address: $D6E93A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A6D:
    JSL $CDA896          ; 22 96 A8 CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    PHP                  ; 08 | Push processor status to stack
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6959            ; 4C 59 69 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A6E
; Address: $D6E94D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A6E:
    JSL $CDE1A5          ; 22 A5 E1 CD | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    ADC #$22             ; 69 22 | Add with carry (immediate)
    STZ $CDA8,X          ; 9E A8 CD | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A6F
; Address: $D6E95D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A6F:
    JSL $CDAE87          ; 22 87 AE CD | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A70
; Address: $D6E963
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A70:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6975            ; 4C 75 69 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A71
; Address: $D6E96E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A71:
    JSL $CCD1EF          ; 22 EF D1 CC | Jump to subroutine long
    JMP $6A09            ; 4C 09 6A | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A05            ; 4C 05 6A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A74
; Address: $D6E989
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A74:
    JSL $CCD85D          ; 22 5D D8 CC | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$84             ; C9 84 | Compare accumulator (immediate)
    LSR $0390            ; 4E 90 03 | Logical shift right (absolute)
    JMP $699C            ; 4C 9C 69 | Jump to address
    JMP $698D            ; 4C 8D 69 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A77
; Address: $D6E9AA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A77:
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $69BA            ; 4C BA 69 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A79
; Address: $D6E9BA
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A79:
    JSL $C99FE8          ; 22 E8 9F C9 | Jump to subroutine long
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    LSR $348D            ; 4E 8D 34 | Logical shift right (absolute)
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$4C             ; C9 4C | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $69D3            ; 4C D3 69 | Jump to address
    JMP $69C4            ; 4C C4 69 | Jump to address
    LDA #$80             ; A9 80 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A7B
; Address: $D6E9DA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A7B:
    JSL $C99FC9          ; 22 C9 9F C9 | Jump to subroutine long
    LDA $33C0            ; AD C0 33 | Load from absolute address into accumulator
    CMP #$00             ; C9 00 | Compare accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $69F1            ; 4C F1 69 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A7C
; Address: $D6E9E9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A7C:
    JSL $C99FFC          ; 22 FC 9F C9 | Jump to subroutine long
    JMP $69DE            ; 4C DE 69 | Jump to address
    LDA #$0A             ; A9 0A | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A7E
; Address: $D6E9F8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A7E:
    JSL $C99FE8          ; 22 E8 9F C9 | Jump to subroutine long
    LDA #$B0             ; A9 B0 | Load immediate value into accumulator
    STA $3434            ; 8D 34 34 | Store accumulator to absolute address
    JMP $6A09            ; 4C 09 6A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A80
; Address: $D6EA0A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A80:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A1F            ; 4C 1F 6A | Jump to address
    INC $2205,X          ; FE 05 22 | Increment (absolute,X)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CPX $AD6A            ; EC 6A AD | Compare X register (absolute)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A34            ; 4C 34 6A | Jump to address
    CMP $2205,Y          ; D9 05 22 | Compare accumulator (absolute,Y)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CPX $AD6A            ; EC 6A AD | Compare X register (absolute)
    LSR $2935            ; 4E 35 29 | Logical shift right (absolute)
    BPL $00              ; 10 00 | Branch if positive
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A49            ; 4C 49 6A | Jump to address
    TSX                  ; BA | Transfer stack pointer to X register
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A81
; Address: $D6EA47
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A81:
    CPX $AD6A            ; EC 6A AD | Compare X register (absolute)
    EOR $35              ; 45 35 | Exclusive OR with accumulator (zero page)
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A5B            ; 4C 5B 6A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A82
; Address: $D6EA54
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A82:
    JSL $CDADD8          ; 22 D8 AD CD | Jump to subroutine long
    JMP $6AEC            ; 4C EC 6A | Jump to address
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6A82            ; 4C 82 6A | Jump to address
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $6A78            ; 4C 78 6A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A83
; Address: $D6EA71
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A83:
    JSL $CDBE73          ; 22 73 BE CD | Jump to subroutine long
    JMP $6A7F            ; 4C 7F 6A | Jump to address
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CPX $AD6A            ; EC 6A AD | Compare X register (absolute)
    EOR $2935            ; 4D 35 29 | Exclusive OR with accumulator (absolute)
    BRA $00              ; 80 00 | Branch always
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6AAA            ; 4C AA 6A | Jump to address
    LDA $3554            ; AD 54 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6AA1            ; 4C A1 6A | Jump to address
    EOR $4C05,X          ; 5D 05 4C | Exclusive OR with accumulator (absolute,X)
    REP #$6A             ; C2 6A | Reset processor status bits
    JMP $6AA7            ; 4C A7 6A | Jump to address
    JMP $C54C05          ; 5C 05 4C C5 | Jump to address long
    ROR                  ; 6A | Rotate right (accumulator)
    JMP $6AC2            ; 4C C2 6A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A84
; Address: $D6EAAA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A84:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6AB9            ; 4C B9 6A | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    LDY $006A,X          ; BC 6A 00 | Load from absolute,X into Y register
    ORA $A9              ; 05 A9 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    EOR $0035            ; 4D 35 00 | Exclusive OR with accumulator (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    CLI                  ; 58 | Clear interrupt disable flag
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDX $C737,Y          ; BE 37 C7 | Load from absolute,Y into X register
    EOR $2205,Y          ; 59 05 22 | Exclusive OR with accumulator (absolute,Y)
    BIT $CC9F            ; 2C 9F CC | Test bits in accumulator (absolute)
    PHY                  ; 5A | Push Y register to stack
    ORA $A9              ; 05 A9 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A85
; Address: $D6EAD6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A85:
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    LSR $A935            ; 4E 35 A9 | Logical shift right (absolute)
    BRA $00              ; 80 00 | Branch always
    LDA #$55             ; A9 55 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A88
; Address: $D6EAED
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A88:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6AFF            ; 4C FF 6A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A89
; Address: $D6EAF8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A89:
    JSL $CCD1EF          ; 22 EF D1 CC | Jump to subroutine long
    JMP $6B17            ; 4C 17 6B | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6B17            ; 4C 17 6B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A8D
; Address: $D6EB18
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A8D:
    LDA $354E            ; AD 4E 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6B2A            ; 4C 2A 6B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A8E
; Address: $D6EB23
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A8E:
    JSL $CDBEC6          ; 22 C6 BE CD | Jump to subroutine long
    JMP $6B6F            ; 4C 6F 6B | Jump to address
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6B3F            ; 4C 3F 6B | Jump to address
    PLB                  ; AB | Pull data bank register from stack
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A8F
; Address: $D6EB3F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A8F:
    JSL $CC7B8A          ; 22 8A 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6B4E            ; 4C 4E 6B | Jump to address
    LSR $4C05,X          ; 5E 05 4C | Logical shift right (absolute,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A90
; Address: $D6EB4E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A90:
    JSL $CC7E4D          ; 22 4D 7E CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6B6C            ; 4C 6C 6B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A91
; Address: $D6EB57
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A91:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6B66            ; 4C 66 6B | Jump to address
    ADC ($05,X)          ; 61 05 | Add with carry ((zero page,X))
    JMP $6B69            ; 4C 69 6B | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A95
; Address: $D6EB70
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A95:
    JSL $CCD74C          ; 22 4C D7 CC | Jump to subroutine long
    LDA #$98             ; A9 98 | Load immediate value into accumulator
    LDX $3426            ; AE 26 34 | Load from absolute address into X register
    LDY $3428            ; AC 28 34 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A96
; Address: $D6EB7D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A96:
    JSL $C73C42          ; 22 42 3C C7 | Jump to subroutine long
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A97
; Address: $D6EB84
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A97:
    JSL $CB6B70          ; 22 70 6B CB | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A9C
; Address: $D6EBA2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A9C:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$BC             ; C9 BC | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6BB1            ; 4C B1 6B | Jump to address
    JMP $6BA2            ; 4C A2 6B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A9D
; Address: $D6EBB1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A9D:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A9E
; Address: $D6EBBB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A9E:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6BD1            ; 4C D1 6B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_A9F
; Address: $D6EBCA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_A9F:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    JMP $6BBF            ; 4C BF 6B | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AA0
; Address: $D6EBD2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AA0:
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$BC             ; C9 BC | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6BE1            ; 4C E1 6B | Jump to address
    JMP $6BD2            ; 4C D2 6B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AA1
; Address: $D6EBE1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AA1:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$05             ; A9 05 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AA2
; Address: $D6EBEB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AA2:
    JSL $C73CED          ; 22 ED 3C C7 | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$40             ; C9 40 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6C01            ; 4C 01 6C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AA3
; Address: $D6EBFA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AA3:
    JSL $CC74F6          ; 22 F6 74 CC | Jump to subroutine long
    JMP $6BEF            ; 4C EF 6B | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AA6
; Address: $D6EC0A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AA6:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6C41            ; 4C 41 6C | Jump to address
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AAA
; Address: $D6EC35
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AAA:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    JMP ($0E22)          ; 6C 22 0E | Jump to address (absolute indirect)
    CPY $6B68            ; CC 68 6B | Compare Y register (absolute)
    PHA                  ; 48 | Push accumulator to stack
    LDA #$E1             ; A9 E1 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AAC
; Address: $D6EC4F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AAC:
    JSL $C73E43          ; 22 43 3E C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6C86            ; 4C 86 6C | Jump to address
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AB0
; Address: $D6EC7A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AB0:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    CLI                  ; 58 | Clear interrupt disable flag
    JMP ($0E22)          ; 6C 22 0E | Jump to address (absolute indirect)
    CPY $6B68            ; CC 68 6B | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AB1
; Address: $D6EC8C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AB1:
    JSL $CB6B70          ; 22 70 6B CB | Jump to subroutine long
    LDA #$03             ; A9 03 | Load immediate value into accumulator
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AB7
; Address: $D6ECAA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AB7:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6CEE            ; 4C EE 6C | Jump to address
    LDA #$7C             ; A9 7C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AB8
; Address: $D6ECB8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AB8:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDX #$2D             ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AC3
; Address: $D6ECEF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AC3:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6D00            ; 4C 00 6D | Jump to address
    TAX                  ; AA | Transfer accumulator to X register
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    EOR #$6D             ; 49 6D | Exclusive OR with accumulator (immediate)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    ORA $7B              ; 05 7B | Logical OR with accumulator (zero page)
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $6D49            ; 4C 49 6D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AC4
; Address: $D6ED0C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AC4:
    JSL $CC94B7          ; 22 B7 94 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6D49            ; 4C 49 6D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AC5
; Address: $D6ED15
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AC5:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    JMP $6D2E            ; 4C 2E 6D | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    EOR #$6D             ; 49 6D | Exclusive OR with accumulator (immediate)
    STZ $05              ; 64 05 | Store zero to zero page
    JMP $6D49            ; 4C 49 6D | Jump to address
    ADC $05              ; 65 05 | Add with carry (zero page)
    JMP $6D49            ; 4C 49 6D | Jump to address
    LDA $343E            ; AD 3E 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6D1C            ; 4C 1C 6D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AC6
; Address: $D6ED39
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AC6:
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6D22            ; 4C 22 6D | Jump to address
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6D28            ; 4C 28 6D | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AD8
; Address: $D6ED95
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AD8:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6DD5            ; 4C D5 6D | Jump to address
    LDA #$7C             ; A9 7C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AD9
; Address: $D6EDA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AD9:
    JSL $C74CD0          ; 22 D0 4C C7 | Jump to subroutine long
    LDA #$2A             ; A9 2A | Load immediate value into accumulator
    LDX #$2D             ; A2 2D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AE3
; Address: $D6EDD6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AE3:
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6DE7            ; 4C E7 6D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AE4
; Address: $D6EDE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AE4:
    TAX                  ; AA | Transfer accumulator to X register
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $006E            ; 4C 6E 00 | Jump to address
    ROR $05              ; 66 05 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AE5
; Address: $D6EDEA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AE5:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6E4C            ; 4C 4C 6E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AE6
; Address: $D6EDF3
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AE6:
    JSL $CC95DF          ; 22 DF 95 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $6E4C            ; 4C 4C 6E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AE7
; Address: $D6EDFC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AE7:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    JMP $6E21            ; 4C 21 6E | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $006E            ; 4C 6E 00 | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $006E            ; 4C 6E 00 | Jump to address
    ADC #$05             ; 69 05 | Add with carry (immediate)
    JMP $6E4C            ; 4C 4C 6E | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $006E            ; 4C 6E 00 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AE8
; Address: $D6EE1D
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AE8:
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    JMP $AD6E            ; 4C 6E AD | Jump to address
    ROL $C934,X          ; 3E 34 C9 | Rotate left (absolute,X)
    INX                  ; E8 | Increment X register
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6E03            ; 4C 03 6E | Jump to address
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6E09            ; 4C 09 6E | Jump to address
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6E0F            ; 4C 0F 6E | Jump to address
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6E15            ; 4C 15 6E | Jump to address
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6E1B            ; 4C 1B 6E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AFA
; Address: $D6EE9B
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AFA:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6EAC            ; 4C AC 6E | Jump to address
    SBC $4C05,X          ; FD 05 4C | Subtract with carry (absolute,X)
    PHX                  ; DA | Push X register to stack
    ROR $44AD            ; 6E AD 44 | Rotate right (absolute)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6EBD            ; 4C BD 6E | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    PHX                  ; DA | Push X register to stack
    ROR $19AD            ; 6E AD 19 | Rotate right (absolute)
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6ECE            ; 4C CE 6E | Jump to address
    ADC $4C05            ; 6D 05 4C | Add with carry (absolute)
    PHX                  ; DA | Push X register to stack
    ROR $6C00            ; 6E 00 6C | Rotate right (absolute)
    ORA $00              ; 05 00 | Logical OR with accumulator (zero page)
    ADC $A905            ; 6D 05 A9 | Add with carry (absolute)
    ORA $6B36,Y          ; 19 36 6B | Logical OR with accumulator (absolute,Y)
    LDA $353E            ; AD 3E 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6EEC            ; 4C EC 6E | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ROR $6E00            ; 6E 00 6E | Rotate right (absolute)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_AFB
; Address: $D6EEF0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_AFB:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $6EFF            ; 4C FF 6E | Jump to address
    ADC ($05),Y          ; 71 05 | Add with carry ((zero page),Y)
    JMP $6F02            ; 4C 02 6F | Jump to address
    BVS $05              ; 70 05 | Branch if overflow set
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B05
; Address: $D6EF30
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B05:
    JSL $CCD949          ; 22 49 D9 CC | Jump to subroutine long
    JMP $6F08            ; 4C 08 6F | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B06
; Address: $D6EF3A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B06:
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6F4A            ; 4C 4A 6F | Jump to address
    JMP $6F9E            ; 4C 9E 6F | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$21             ; A9 21 | PPU graphics register access
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B07
; Address: $D6EF68
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B07:
    JSL $C73705          ; 22 05 37 C7 | Jump to subroutine long
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $6F7C            ; 4C 7C 6F | Jump to address
    JMP $6F6D            ; 4C 6D 6F | Jump to address
    LDA #$1E             ; A9 1E | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$21             ; A9 21 | PPU graphics register access
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B0A
; Address: $D6EFA4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B0A:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6FB5            ; 4C B5 6F | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    CMP #$6F             ; C9 6F | Compare accumulator (immediate)
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6FC6            ; 4C C6 6F | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    CMP #$6F             ; C9 6F | Compare accumulator (immediate)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $6FD8            ; 4C D8 6F | Jump to address
    JMP $702C            ; 4C 2C 70 | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B0B
; Address: $D6EFF6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B0B:
    JSL $C73705          ; 22 05 37 C7 | Jump to subroutine long
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $700A            ; 4C 0A 70 | Jump to address
    JMP $6FFB            ; 4C FB 6F | Jump to address
    LDA #$12             ; A9 12 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$1C             ; A9 1C | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$15             ; A9 15 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$1F             ; A9 1F | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B0D
; Address: $D6F02D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B0D:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $703E            ; 4C 3E 70 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B0E
; Address: $D6F039
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B0E:
    ORA ($06,X)          ; 01 06 | Logical OR with accumulator ((zero page,X))
    JMP $709D            ; 4C 9D 70 | Jump to address
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $704F            ; 4C 4F 70 | Jump to address
    ADC $4C05,Y          ; 79 05 4C | Add with carry (absolute,Y)
    STA $AD70,X          ; 9D 70 AD | Store accumulator to absolute,X
    ROL $2935,X          ; 3E 35 29 | Rotate left (absolute,X)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7060            ; 4C 60 70 | Jump to address
    ADC $4C05,Y          ; 79 05 4C | Add with carry (absolute,Y)
    STA $AD70,X          ; 9D 70 AD | Store accumulator to absolute,X
    LSR $2935            ; 4E 35 29 | Logical shift right (absolute)
    RTI                  ; 40 | Return from interrupt
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7078            ; 4C 78 70 | Jump to address
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator
    SEI                  ; 78 | Set interrupt disable flag
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    STA $0070,X          ; 9D 70 00 | Store accumulator to absolute,X
    ORA $AD              ; 05 AD | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7096            ; 4C 96 70 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B0F
; Address: $D6F086
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B0F:
    JSL $CDACBD          ; 22 BD AC CD | Jump to subroutine long
    ORA $A9              ; 05 A9 | Logical OR with accumulator (zero page)
    RTI                  ; 40 | Return from interrupt
    LSR $4C35            ; 4E 35 4C | Logical shift right (absolute)
    STA $2270,X          ; 9D 70 22 | Store accumulator to absolute,X
    LDA $CDAC,X          ; BD AC CD | Load from absolute,X into accumulator
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $70AC            ; 4C AC 70 | Jump to address
    JMP $70BC            ; 4C BC 70 | Jump to address
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $70BC            ; 4C BC 70 | Jump to address
    JMP $70AD            ; 4C AD 70 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B11
; Address: $D6F0C0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B11:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    CMP $05              ; C5 05 | Compare accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B15
; Address: $D6F0D1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B15:
    JSL $CC8C76          ; 22 76 8C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $70E4            ; 4C E4 70 | Jump to address
    STZ $2205            ; 9C 05 22 | Store zero to absolute
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    ADC ($22),Y          ; 71 22 | Add with carry ((zero page),Y)
    NOP                  ; EA | No operation
    PLY                  ; 7A | Pull Y register from stack
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $714E            ; 4C 4E 71 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B16
; Address: $D6F0ED
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B16:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    ROR $2205,X          ; 7E 05 22 | Rotate right (absolute,X)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    CPY $9C22            ; CC 22 9C | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B19
; Address: $D6F108
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B19:
    JSL $CCD418          ; 22 18 D4 CC | Jump to subroutine long
    LDA $3629            ; AD 29 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7126            ; 4C 26 71 | Jump to address
    LDA #$78             ; A9 78 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B20
; Address: $D6F135
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B20:
    JSL $CCD784          ; 22 84 D7 CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    BIT $2236            ; 2C 36 22 | Test bits in accumulator (absolute)
    BMI $59              ; 30 59 | Branch if negative

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B22
; Address: $D6F147
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B22:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    JMP $7155            ; 4C 55 71 | Jump to address
    AND #$05             ; 29 05 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B25
; Address: $D6F15B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B25:
    LDA #$45             ; A9 45 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$70             ; A9 70 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$45             ; A9 45 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B26
; Address: $D6F16A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B26:
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$71             ; A9 71 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B28
; Address: $D6F17F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B28:
    ADC $6B05,X          ; 7D 05 6B | Add with carry (absolute,X)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7194            ; 4C 94 71 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B2B
; Address: $D6F199
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B2B:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $71AA            ; 4C AA 71 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    SBC $71              ; E5 71 | Subtract with carry (zero page)
    LDA $3544            ; AD 44 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $71BB            ; 4C BB 71 | Jump to address
    PHX                  ; DA | Push X register to stack
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SBC $71              ; E5 71 | Subtract with carry (zero page)
    LDA $3545            ; AD 45 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $71CC            ; 4C CC 71 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    SBC $71              ; E5 71 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B2C
; Address: $D6F1CC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B2C:
    JSL $CC7A9A          ; 22 9A 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $71DB            ; 4C DB 71 | Jump to address
    PLY                  ; 7A | Pull Y register from stack
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    DEC $0071,X          ; DE 71 00 | Decrement (absolute,X)
    ORA $22              ; 05 22 | Logical OR with accumulator (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $7C00            ; CD 00 7C | Compare accumulator (absolute)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B31
; Address: $D6F1F5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B31:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7206            ; 4C 06 72 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ORA #$72             ; 09 72 | Logical OR with accumulator (immediate)
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B35
; Address: $D6F21A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B35:
    ORA ($6B,X)          ; 01 6B | Logical OR with accumulator ((zero page,X))
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $722D            ; 4C 2D 72 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    EOR ($72),Y          ; 51 72 | Exclusive OR with accumulator ((zero page),Y)
    BRA $05              ; 80 05 | Branch always

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B36
; Address: $D6F230
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B36:
    JSL $CDAC66          ; 22 66 AC CD | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $724E            ; 4C 4E 72 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B37
; Address: $D6F239
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B37:
    JSL $CC979B          ; 22 9B 97 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7248            ; 4C 48 72 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    EOR ($72),Y          ; 51 72 | Exclusive OR with accumulator ((zero page),Y)
    STA ($05,X)          ; 81 05 | Store accumulator to (zero page,X)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B41
; Address: $D6F27E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B41:
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $728F            ; 4C 8F 72 | Jump to address
    ASL $06              ; 06 06 | Arithmetic shift left (zero page)
    JMP $72B0            ; 4C B0 72 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B42
; Address: $D6F28F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B42:
    JSL $CC8C76          ; 22 76 8C CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $729E            ; 4C 9E 72 | Jump to address
    ORA $4C              ; 05 4C | Logical OR with accumulator (zero page)
    BCS $72              ; B0 72 | Branch if carry set

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B43
; Address: $D6F29E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B43:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $72AD            ; 4C AD 72 | Jump to address
    STA $05              ; 85 05 | Store accumulator to zero page
    JMP $72B0            ; 4C B0 72 | Jump to address
    STX $05              ; 86 05 | Store X register to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B45
; Address: $D6F2B8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B45:
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    LDA $3557            ; AD 57 35 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $72CB            ; 4C CB 72 | Jump to address
    ORA $06              ; 05 06 | Logical OR with accumulator (zero page)
    JMP $72CE            ; 4C CE 72 | Jump to address
    STY $05              ; 84 05 | Store Y register to zero page
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B46
; Address: $D6F2D0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B46:
    DEY                  ; 88 | Decrement Y register
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    BIT #$05             ; 89 05 | Test bits in accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B47
; Address: $D6F2D8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B47:
    TXA                  ; 8A | Transfer X register to accumulator
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    PHB                  ; 8B | Push data bank register to stack
    ORA $6B              ; 05 6B | Logical OR with accumulator (zero page)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B4A
; Address: $D6F2E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B4A:
    JSL $CCD287          ; 22 87 D2 CC | Jump to subroutine long
    JMP $72E9            ; 4C E9 72 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B4B
; Address: $D6F2F1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B4B:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7303            ; 4C 03 73 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B52
; Address: $D6F315
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B52:
    JSL $CB743B          ; 22 3B 74 CB | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7321            ; 4C 21 73 | Jump to address
    JMP $7324            ; 4C 24 73 | Jump to address
    JMP $7311            ; 4C 11 73 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B55
; Address: $D6F32C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B55:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B57
; Address: $D6F33A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B57:
    JSL $CCD287          ; 22 87 D2 CC | Jump to subroutine long
    JMP $733A            ; 4C 3A 73 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B59
; Address: $D6F347
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B59:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7374            ; 4C 74 73 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B5A
; Address: $D6F356
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B5A:
    JSL $CCD287          ; 22 87 D2 CC | Jump to subroutine long
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7371            ; 4C 71 73 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B5B
; Address: $D6F365
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B5B:
    JSL $CB743B          ; 22 3B 74 CB | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7371            ; 4C 71 73 | Jump to address
    JMP $73B3            ; 4C B3 73 | Jump to address
    JMP $734B            ; 4C 4B 73 | Jump to address
    LDA #$D0             ; A9 D0 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$B8             ; C9 B8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7389            ; 4C 89 73 | Jump to address
    JMP $737A            ; 4C 7A 73 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B5C
; Address: $D6F389
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B5C:
    JSL $CCD863          ; 22 63 D8 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$A0             ; C9 A0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $739C            ; 4C 9C 73 | Jump to address
    JMP $738D            ; 4C 8D 73 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B5D
; Address: $D6F39C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B5D:
    JSL $CDDDCF          ; 22 CF DD CD | Jump to subroutine long
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B63
; Address: $D6F3BF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B63:
    JSL $CDADD1          ; 22 D1 AD CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B65
; Address: $D6F3D0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B65:
    JSL $CCD287          ; 22 87 D2 CC | Jump to subroutine long
    JMP $73D0            ; 4C D0 73 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B69
; Address: $D6F3E5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B69:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    STA                  ; 9F 06 00 A0 | Store accumulator to absolute long,X
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register
    BPL $00              ; 10 00 | Branch if positive
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B6A
; Address: $D6F3FF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B6A:
    JSL $CCD287          ; 22 87 D2 CC | Jump to subroutine long
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $741A            ; 4C 1A 74 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B6B
; Address: $D6F40E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B6B:
    JSL $CB743B          ; 22 3B 74 CB | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $741A            ; 4C 1A 74 | Jump to address
    JMP $741D            ; 4C 1D 74 | Jump to address
    JMP $73FF            ; 4C FF 73 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B6E
; Address: $D6F425
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B6E:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B70
; Address: $D6F433
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B70:
    JSL $CCD287          ; 22 87 D2 CC | Jump to subroutine long
    JMP $7433            ; 4C 33 74 | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B71
; Address: $D6F43B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B71:
    LDA #$68             ; A9 68 | Load immediate value into accumulator
    ORA #$A2             ; 09 A2 | Logical OR with accumulator (immediate)
    TAY                  ; A8 | Transfer accumulator to Y register
    ORA #$A0             ; 09 A0 | Logical OR with accumulator (immediate)
    PLP                  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B72
; Address: $D6F444
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B72:
    JSL $C75365          ; 22 65 53 C7 | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7451            ; 4C 51 74 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $747E            ; 4C 7E 74 | Jump to address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    LDX #$58             ; A2 58 | Load immediate value into X register
    LDY #$60             ; A0 60 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7467            ; 4C 67 74 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $747E            ; 4C 7E 74 | Jump to address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    LDX #$58             ; A2 58 | Load immediate value into X register
    LDY #$B0             ; A0 B0 | Load immediate value into Y register
    ORA #$22             ; 09 22 | Logical OR with accumulator (immediate)
    LDX #$53             ; A2 53 | Load immediate value into X register
    BCS $03              ; B0 03 | Branch if carry set
    JMP $747D            ; 4C 7D 74 | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $747E            ; 4C 7E 74 | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B73
; Address: $D6F47F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B73:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $74C9            ; 4C C9 74 | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $74A6            ; 4C A6 74 | Jump to address
    LDA #$30             ; A9 30 | Load immediate value into accumulator
    LDX #$6D             ; A2 6D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B77
; Address: $D6F4AB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B77:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$30             ; A2 30 | Load immediate value into X register
    LDA #$6D             ; A9 6D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B7E
; Address: $D6F4D0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B7E:
    JMP $74D9            ; 4C D9 74 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $74F9            ; 4C F9 74 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B7F
; Address: $D6F4E4
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B7F:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $74F3            ; 4C F3 74 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    LDX $06              ; A6 06 | Load from zero page into X register
    JMP $74FC            ; 4C FC 74 | Jump to address
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7547            ; 4C 47 75 | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7524            ; 4C 24 75 | Jump to address
    LDA #$32             ; A9 32 | Load immediate value into accumulator
    LDX #$6D             ; A2 6D | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B83
; Address: $D6F529
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B83:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$32             ; A2 32 | Load immediate value into X register
    LDA #$6D             ; A9 6D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B89
; Address: $D6F548
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B89:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7557            ; 4C 57 75 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7577            ; 4C 77 75 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B8A
; Address: $D6F562
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B8A:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7571            ; 4C 71 75 | Jump to address
    STZ $06              ; 64 06 | Store zero to zero page
    JMP $7574            ; 4C 74 75 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B8B
; Address: $D6F573
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B8B:
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B8C
; Address: $D6F57B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B8C:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7599            ; 4C 99 75 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B8D
; Address: $D6F584
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B8D:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7593            ; 4C 93 75 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    LDY $AD75,X          ; BC 75 AD | Load from absolute,X into Y register
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $75B9            ; 4C B9 75 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B8E
; Address: $D6F5A4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B8E:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $75B3            ; 4C B3 75 | Jump to address
    EOR $4C06,Y          ; 59 06 4C | Exclusive OR with accumulator (absolute,Y)
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    LDY $0075,X          ; BC 75 00 | Load from absolute,X into Y register
    PHP                  ; 08 | Push processor status to stack
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B8F
; Address: $D6F5BD
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B8F:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $75CC            ; 4C CC 75 | Jump to address
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    JMP $75EF            ; 4C EF 75 | Jump to address
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $75EC            ; 4C EC 75 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B90
; Address: $D6F5D7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B90:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $75E6            ; 4C E6 75 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    SBC #$75             ; E9 75 | Subtract with carry (immediate)
    LDA $06              ; A5 06 | Load from zero page into accumulator
    JMP $75EF            ; 4C EF 75 | Jump to address
    ORA #$06             ; 09 06 | Logical OR with accumulator (immediate)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B91
; Address: $D6F5F0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B91:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $761D            ; 4C 1D 76 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B92
; Address: $D6F5F9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B92:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7617            ; 4C 17 76 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B93
; Address: $D6F602
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B93:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7611            ; 4C 11 76 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B94
; Address: $D6F60C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B94:
    CMP $4C06,Y          ; D9 06 4C | Compare accumulator (absolute,Y)
    PHX                  ; DA | Push X register to stack
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    INC                  ; 1A | Increment accumulator
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $763D            ; 4C 3D 76 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B95
; Address: $D6F628
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B95:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7637            ; 4C 37 76 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    DEC                  ; 3A | Decrement accumulator
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    RTI                  ; 40 | Return from interrupt
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B96
; Address: $D6F641
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B96:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7650            ; 4C 50 76 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    STZ $76              ; 64 76 | Store zero to zero page
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7661            ; 4C 61 76 | Jump to address
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    STZ $76              ; 64 76 | Store zero to zero page
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B97
; Address: $D6F665
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B97:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7674            ; 4C 74 76 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7694            ; 4C 94 76 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B98
; Address: $D6F67F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B98:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $768E            ; 4C 8E 76 | Jump to address
    PHY                  ; 5A | Push Y register to stack
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    STA ($76),Y          ; 91 76 | Store accumulator to (zero page),Y
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B9B
; Address: $D6F6A1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B9B:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $76D1            ; 4C D1 76 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B9C
; Address: $D6F6AA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B9C:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $76B9            ; 4C B9 76 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    LDY $0076,X          ; BC 76 00 | Load from absolute,X into Y register
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $76CB            ; 4C CB 76 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    DEC $0076            ; CE 76 00 | Decrement (absolute)
    CLD                  ; D8 | Clear decimal mode flag
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ORA $4C06            ; 0D 06 4C | Logical OR with accumulator (absolute)
    PLX                  ; FA | Pull X register from stack
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $76F7            ; 4C F7 76 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B9D
; Address: $D6F6E2
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B9D:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $76F1            ; 4C F1 76 | Jump to address
    CLI                  ; 58 | Clear interrupt disable flag
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PEA #$0076           ; F4 76 00 | Push effective address to stack
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PLX                  ; FA | Pull X register from stack
    ORA $6B06            ; 0D 06 6B | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B9E
; Address: $D6F6FB
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B9E:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $770A            ; 4C 0A 77 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    AND $AD77            ; 2D 77 AD | Logical AND with accumulator (absolute)
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $772A            ; 4C 2A 77 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_B9F
; Address: $D6F715
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_B9F:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7724            ; 4C 24 77 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    STA ($06),Y          ; 91 06 | Store accumulator to (zero page),Y
    JMP $772D            ; 4C 2D 77 | Jump to address
    ASL $6B06            ; 0E 06 6B | Arithmetic shift left (absolute)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BA1
; Address: $D6F739
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BA1:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $774C            ; 4C 4C 77 | Jump to address
    ADC ($06,X)          ; 61 06 | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BA2
; Address: $D6F745
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BA2:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $7759            ; 4C 59 77 | Jump to address
    ASL $A9              ; 06 A9 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BA5
; Address: $D6F761
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BA5:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $77A7            ; 4C A7 77 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BA7
; Address: $D6F770
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BA7:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $777F            ; 4C 7F 77 | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    SBC $CC76,X          ; FD 76 CC | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BA8
; Address: $D6F78A
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BA8:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7799            ; 4C 99 77 | Jump to address
    RTS                  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BA9
; Address: $D6F795
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BA9:
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    STZ $0077            ; 9C 77 00 | Store zero to absolute
    LDX #$06             ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BAD
; Address: $D6F7AC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BAD:
    PHA                  ; 48 | Push accumulator to stack
    PHA                  ; 48 | Push accumulator to stack
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7954            ; 4C 54 79 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BAE
; Address: $D6F7B9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BAE:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $77C9            ; 4C C9 77 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BB0
; Address: $D6F7C9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BB0:
    JSL $CCD1EF          ; 22 EF D1 CC | Jump to subroutine long
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BB1
; Address: $D6F7D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BB1:
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $77DD            ; 4C DD 77 | Jump to address
    JMP $77CE            ; 4C CE 77 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BB4
; Address: $D6F7E5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BB4:
    JSL $CCD878          ; 22 78 D8 CC | Jump to subroutine long
    LDX #$42             ; A2 42 | Hardware register operation
    LDA #$52             ; A9 52 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BBB
; Address: $D6F810
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BBB:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDX #$46             ; A2 46 | Load immediate value into X register
    LDA #$4C             ; A9 4C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BBF
; Address: $D6F829
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BBF:
    JSL $CCD59D          ; 22 9D D5 CC | Jump to subroutine long
    LDA #$B8             ; A9 B8 | Load immediate value into accumulator
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDX #$52             ; A2 52 | Load immediate value into X register
    LDA #$61             ; A9 61 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BC4
; Address: $D6F84C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BC4:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    ORA ($A3,X)          ; 01 A3 | Logical OR with accumulator ((zero page,X))
    ORA ($C9,X)          ; 01 C9 | Logical OR with accumulator ((zero page,X))
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $78B8            ; 4C B8 78 | Jump to address
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    CMP #$03             ; C9 03 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7884            ; 4C 84 78 | Jump to address
    LDA #$F4             ; A9 F4 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BC6
; Address: $D6F878
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BC6:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    JMP $7864            ; 4C 64 78 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BC8
; Address: $D6F887
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BC8:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    CMP #$02             ; C9 02 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $78B0            ; 4C B0 78 | Jump to address
    LDA #$FB             ; A9 FB | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BCA
; Address: $D6F8A4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BCA:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    INC                  ; 1A | Increment accumulator
    JMP $7890            ; 4C 90 78 | Jump to address
    ORA ($1A,X)          ; 01 1A | Logical OR with accumulator ((zero page,X))
    ORA ($4C,X)          ; 01 4C | Logical OR with accumulator ((zero page,X))
    SEI                  ; 78 | Set interrupt disable flag
    LDA #$3C             ; A9 3C | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BCD
; Address: $D6F8C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BCD:
    JSL $CCD767          ; 22 67 D7 CC | Jump to subroutine long
    LDX #$46             ; A2 46 | Load immediate value into X register
    LDA #$56             ; A9 56 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BD0
; Address: $D6F8D5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BD0:
    JSL $CDD687          ; 22 87 D6 CD | Jump to subroutine long
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$02             ; 69 02 | Add with carry (immediate)
    STA $342C            ; 8D 2C 34 | Store accumulator to absolute address
    LDA $342C            ; AD 2C 34 | Load from absolute address into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BD4
; Address: $D6F8F5
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BD4:
    JSL $C74B39          ; 22 39 4B C7 | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register
    LDY #$0F             ; A0 0F | Load immediate value into Y register
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    LDA $3400            ; AD 00 34 | Load from absolute address into accumulator
    CMP #$88             ; C9 88 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7915            ; 4C 15 79 | Jump to address
    JMP $7906            ; 4C 06 79 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BD6
; Address: $D6F919
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BD6:
    JSL $CCD949          ; 22 49 D9 CC | Jump to subroutine long
    LDX #$46             ; A2 46 | Load immediate value into X register
    LDA #$61             ; A9 61 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BDC
; Address: $D6F93A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BDC:
    JSL $CDA724          ; 22 24 A7 CD | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    AND #$36             ; 29 36 | Logical AND with accumulator (immediate)
    LDA #$1B             ; A9 1B | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $7958            ; 4C 58 79 | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BDD
; Address: $D6F954
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BDD:
    JSL $CCD1EF          ; 22 EF D1 CC | Jump to subroutine long
    PLA                  ; 68 | Pull accumulator from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BDE
; Address: $D6F95B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BDE:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A0F            ; 4C 0F 7A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BDF
; Address: $D6F966
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BDF:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $798B            ; 4C 8B 79 | Jump to address
    JMP $662206          ; 5C 06 22 66 | Jump to address long
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $7981            ; 4C 81 79 | Jump to address
    EOR $4C06,X          ; 5D 06 4C | Exclusive OR with accumulator (absolute,X)
    STY $79              ; 84 79 | Store Y register to zero page
    LSR $2206,X          ; 5E 06 22 | Logical shift right (absolute,X)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BE0
; Address: $D6F98B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BE0:
    JSL $CB7A14          ; 22 14 7A CB | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $799E            ; 4C 9E 79 | Jump to address
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    PLY                  ; 7A | Pull Y register from stack
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $79B3            ; 4C B3 79 | Jump to address
    LDY #$06             ; A0 06 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BE1
; Address: $D6F9AC
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BE1:
    JSL $CDACD2          ; 22 D2 AC CD | Jump to subroutine long
    JMP $7A0C            ; 4C 0C 7A | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $79C8            ; 4C C8 79 | Jump to address
    STA $2206,X          ; 9D 06 22 | Store accumulator to absolute,X
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BE3
; Address: $D6F9C8
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BE3:
    JSL $CCD37E          ; 22 7E D3 CC | Jump to subroutine long
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $79E2            ; 4C E2 79 | Jump to address
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    TYA                  ; 98 | Transfer Y register to accumulator
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $79F8            ; 4C F8 79 | Jump to address
    STA $2206,Y          ; 99 06 22 | Store accumulator to absolute,Y
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    PHP                  ; 08 | Push processor status to stack
    PLY                  ; 7A | Pull Y register from stack
    TXS                  ; 9A | Transfer X register to stack pointer
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $A9CD            ; AC CD A9 | Load from absolute address into Y register
    INX                  ; E8 | Increment X register
    STA $3400            ; 8D 00 34 | Store accumulator to absolute address
    JMP $7A0C            ; 4C 0C 7A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BE6
; Address: $D6FA14
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BE6:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A2E            ; 4C 2E 7A | Jump to address
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A2E            ; 4C 2E 7A | Jump to address
    SEC                  ; 38 | Set carry flag
    JMP $7A2F            ; 4C 2F 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BE7
; Address: $D6FA30
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BE7:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A4E            ; 4C 4E 7A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BE8
; Address: $D6FA39
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BE8:
    JSL $CC7B05          ; 22 05 7B CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A48            ; 4C 48 7A | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PLY                  ; 7A | Pull Y register from stack
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BE9
; Address: $D6FA4C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BE9:
    CPY #$7A             ; C0 7A | Compare Y register (immediate)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7ABD            ; 4C BD 7A | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BEA
; Address: $D6FA59
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BEA:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A68            ; 4C 68 7A | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    TSX                  ; BA | Transfer stack pointer to X register
    PLY                  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BEB
; Address: $D6FA68
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BEB:
    JSL $CB7AC1          ; 22 C1 7A CB | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7A77            ; 4C 77 7A | Jump to address
    BCC $06              ; 90 06 | Branch if carry clear
    JMP $7ABA            ; 4C BA 7A | Jump to address
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A88            ; 4C 88 7A | Jump to address
    BCC $06              ; 90 06 | Branch if carry clear
    JMP $7ABA            ; 4C BA 7A | Jump to address
    LDA $362B            ; AD 2B 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7A99            ; 4C 99 7A | Jump to address
    STX $4C06            ; 8E 06 4C | Store X register to absolute address
    TSX                  ; BA | Transfer stack pointer to X register
    PLY                  ; 7A | Pull Y register from stack
    STY $0006            ; 8C 06 00 | Store Y register to absolute address
    STA $2206            ; 8D 06 22 | Store accumulator to absolute address
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $7AB4            ; 4C B4 7A | Jump to address
    STX $A906            ; 8E 06 A9 | Store X register to absolute address
    ORA ($00,X)          ; 01 00 | Logical OR with accumulator ((zero page,X))
    JMP $7ABA            ; 4C BA 7A | Jump to address
    STA $9C4C06          ; 8F 06 4C 9C | Store accumulator to absolute long address
    PLY                  ; 7A | Pull Y register from stack
    JMP $7AC0            ; 4C C0 7A | Jump to address
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$04             ; 29 04 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7ADB            ; 4C DB 7A | Jump to address
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7ADB            ; 4C DB 7A | Jump to address
    SEC                  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BEC
; Address: $D6FAD8
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BEC:
    JMP $7ADC            ; 4C DC 7A | Jump to address
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BED
; Address: $D6FADD
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BED:
    JSL $CC8F87          ; 22 87 8F CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7AFD            ; 4C FD 7A | Jump to address
    LDA $354A            ; AD 4A 35 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7AF7            ; 4C F7 7A | Jump to address
    CMP ($06),Y          ; D1 06 | Compare accumulator ((zero page),Y)
    JMP $7AFA            ; 4C FA 7A | Jump to address
    BNE $06              ; D0 06 | Branch if not equal
    JMP $7B48            ; 4C 48 7B | Jump to address
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7B45            ; 4C 45 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BEE
; Address: $D6FB08
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BEE:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B2B            ; 4C 2B 7B | Jump to address
    ASL $AD              ; 06 AD | Arithmetic shift left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7B25            ; 4C 25 7B | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PLP                  ; 28 | Pull processor status from stack
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    WDM #$7B             ; 42 7B | Reserved instruction
    TXA                  ; 8A | Transfer X register to accumulator
    ASL $AD              ; 06 AD | Arithmetic shift left (zero page)
    LSR                  ; 4A | Logical shift right (accumulator)
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7B3F            ; 4C 3F 7B | Jump to address
    PHB                  ; 8B | Push data bank register to stack
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    WDM #$7B             ; 42 7B | Reserved instruction
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    PHA                  ; 48 | Push accumulator to stack
    BPL $06              ; 10 06 | Branch if positive
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BEF
; Address: $D6FB49
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BEF:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7B6D            ; 4C 6D 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BF0
; Address: $D6FB54
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BF0:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B63            ; 4C 63 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BF1
; Address: $D6FB5F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BF1:
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ROR $7B              ; 66 7B | Rotate right (zero page)
    BIT #$06             ; 89 06 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BF4
; Address: $D6FB72
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BF4:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7B92            ; 4C 92 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BF5
; Address: $D6FB7D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BF5:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7B8C            ; 4C 8C 7B | Jump to address
    ADC $06              ; 65 06 | Add with carry (zero page)
    JMP $7B8F            ; 4C 8F 7B | Jump to address
    TAY                  ; A8 | Transfer accumulator to Y register
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ORA ($06),Y          ; 11 06 | Logical OR with accumulator ((zero page),Y)
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BF6
; Address: $D6FB96
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BF6:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7BB6            ; 4C B6 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BF7
; Address: $D6FBA1
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BF7:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7BB0            ; 4C B0 7B | Jump to address
    ROR $06              ; 66 06 | Rotate right (zero page)
    JMP $7BB3            ; 4C B3 7B | Jump to address
    LDA #$06             ; A9 06 | Load immediate value into accumulator
    JMP $7BB9            ; 4C B9 7B | Jump to address
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7BC9            ; 4C C9 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BF9
; Address: $D6FBCA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BF9:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7BEA            ; 4C EA 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BFA
; Address: $D6FBD5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BFA:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7BE4            ; 4C E4 7B | Jump to address
    ADC #$06             ; 69 06 | Add with carry (immediate)
    JMP $7BE7            ; 4C E7 7B | Jump to address
    PLB                  ; AB | Pull data bank register from stack
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    SBC $007B            ; ED 7B 00 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BFB
; Address: $D6FBEC
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BFB:
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7BFD            ; 4C FD 7B | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BFD
; Address: $D6FBFE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BFD:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7C1E            ; 4C 1E 7C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_BFE
; Address: $D6FC09
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_BFE:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C18            ; 4C 18 7C | Jump to address
    ROR                  ; 6A | Rotate right (accumulator)
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    LDY $4C06            ; AC 06 4C | Load from absolute address into Y register
    AND ($7C,X)          ; 21 7C | Logical AND with accumulator ((zero page,X))
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7C31            ; 4C 31 7C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C00
; Address: $D6FC32
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C00:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7C52            ; 4C 52 7C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C01
; Address: $D6FC3D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C01:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C4C            ; 4C 4C 7C | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C03
; Address: $D6FC4E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C03:
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7C76            ; 4C 76 7C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C04
; Address: $D6FC61
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C04:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C70            ; 4C 70 7C | Jump to address
    ADC $4C06            ; 6D 06 4C | Add with carry (absolute)
    LDX $4C06            ; AE 06 4C | Load from absolute address into X register
    ADC $007C,Y          ; 79 7C 00 | Add with carry (absolute,Y)
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C06
; Address: $D6FC85
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C06:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7C98            ; 4C 98 7C | Jump to address
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    STA                  ; 9F 7C 00 67 | Store accumulator to absolute long,X
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    LDX $7C              ; A6 7C | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C08
; Address: $D6FCA7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C08:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7CCF            ; 4C CF 7C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C09
; Address: $D6FCB2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C09:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7CC5            ; 4C C5 7C | Jump to address
    PLA                  ; 68 | Pull accumulator from stack
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    CPY $007C            ; CC 7C 00 | Compare Y register (absolute)
    TAX                  ; AA | Transfer accumulator to X register
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C0B
; Address: $D6FCD4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C0B:
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7CF4            ; 4C F4 7C | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C0C
; Address: $D6FCDF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C0C:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7CEE            ; 4C EE 7C | Jump to address
    JMP ($4C06)          ; 6C 06 4C | Jump to address (absolute indirect)
    SBC ($7C),Y          ; F1 7C | Subtract with carry ((zero page),Y)
    LDA $4C06            ; AD 06 4C | Load from absolute address into accumulator
    ASL $6B              ; 06 6B | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C0D
; Address: $D6FCF8
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C0D:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D07            ; 4C 07 7D | Jump to address
    ROR $4C06            ; 6E 06 4C | Rotate right (absolute)
    ASL                  ; 0A | Arithmetic shift left (accumulator)
    ADC $6E00,X          ; 7D 00 6E | Add with carry (absolute,X)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $7D2C            ; 4C 2C 7D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C0E
; Address: $D6FD13
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C0E:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D22            ; 4C 22 7D | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    AND $7D              ; 25 7D | Logical AND with accumulator (zero page)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $4CCD            ; AC CD 4C | Load from absolute address into Y register
    ADC $6422,X          ; 7D 22 64 | Add with carry (absolute,X)
    PLY                  ; 7A | Pull Y register from stack
    CPY $03B0            ; CC B0 03 | Compare Y register (absolute)
    JMP $7D3B            ; 4C 3B 7D | Jump to address
    BVS $06              ; 70 06 | Branch if overflow set
    JMP $7D3E            ; 4C 3E 7D | Jump to address
    LDA $662206          ; AF 06 22 66 | Load from absolute long address into accumulator
    LDY $B0CD            ; AC CD B0 | Load from absolute address into Y register
    JMP $7DD9            ; 4C D9 7D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C0F
; Address: $D6FD47
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C0F:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7D56            ; 4C 56 7D | Jump to address
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    EOR $007D,Y          ; 59 7D 00 | Exclusive OR with accumulator (absolute,Y)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    LDA $CDC5,Y          ; B9 C5 CD | Load from absolute,Y into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C11
; Address: $D6FD65
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C11:
    JSL $CC9ADF          ; 22 DF 9A CC | Jump to subroutine long
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    LDA #$04             ; A9 04 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$08             ; A9 08 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$02             ; A9 02 | Load immediate value into accumulator
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7D9E            ; 4C 9E 7D | Jump to address
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    LDA #$80             ; A9 80 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$10             ; A9 10 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C14
; Address: $D6FDCB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C14:
    JSL $C7701E          ; 22 1E 70 C7 | Jump to subroutine long
    LDA #$1A             ; A9 1A | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $7DF5            ; 4C F5 7D | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C15
; Address: $D6FDD9
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C15:
    JSL $CC7A64          ; 22 64 7A CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7DEB            ; 4C EB 7D | Jump to address
    ADC ($06),Y          ; 71 06 | Add with carry ((zero page),Y)
    ASL $4C              ; 06 4C | Arithmetic shift left (zero page)
    SBC ($7D),Y          ; F1 7D | Subtract with carry ((zero page),Y)
    ADC ($06),Y          ; 71 06 | Add with carry ((zero page),Y)
    ASL $22              ; 06 22 | Arithmetic shift left (zero page)
    LDY $6BCD            ; AC CD 6B | Load from absolute address into Y register
    LDA $354F            ; AD 4F 35 | Load from absolute address into accumulator
    AND #$02             ; 29 02 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7E93            ; 4C 93 7E | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$40             ; 29 40 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7E13            ; 4C 13 7E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C16
; Address: $D6FE0C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C16:
    JSL $CB72E0          ; 22 E0 72 CB | Jump to subroutine long
    JMP $7E90            ; 4C 90 7E | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7E25            ; 4C 25 7E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C17
; Address: $D6FE1E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C17:
    JSL $CB7E98          ; 22 98 7E CB | Jump to subroutine long
    JMP $7E90            ; 4C 90 7E | Jump to address
    LDA $362A            ; AD 2A 36 | Load from absolute address into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator (immediate)
    BNE $03              ; D0 03 | Branch if not equal
    JMP $7E8C            ; 4C 8C 7E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C1C
; Address: $D6FE43
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C1C:
    JSL $C753DF          ; 22 DF 53 C7 | Jump to subroutine long
    LDA $3434            ; AD 34 34 | Load from absolute address into accumulator
    CMP #$D0             ; C9 D0 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7E5A            ; 4C 5A 7E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C24
; Address: $D6FE75
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C24:
    JSL $CCD383          ; 22 83 D3 CC | Jump to subroutine long
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$01             ; A9 01 | Load immediate value into accumulator
    ORA $2236,Y          ; 19 36 22 | Logical OR with accumulator (absolute,Y)
    TYA                  ; 98 | Transfer Y register to accumulator
    ROR $4CCB,X          ; 7E CB 4C | Rotate right (absolute,X)
    BCC $7E              ; 90 7E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C27
; Address: $D6FE98
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C27:
    LDA $3619            ; AD 19 36 | Load from absolute address into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator (immediate)
    BEQ $03              ; F0 03 | Branch if equal
    JMP $7EAC            ; 4C AC 7E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C29
; Address: $D6FEA8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C29:
    JSL $CCD400          ; 22 00 D4 CC | Jump to subroutine long
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $9C11            ; 8D 11 9C | Store accumulator to absolute address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $9C13            ; 8D 13 9C | Store accumulator to absolute address
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    STA $9C15            ; 8D 15 9C | Store accumulator to absolute address
    LDA #$19             ; A9 19 | Load immediate value into accumulator
    STA $9C17            ; 8D 17 9C | Store accumulator to absolute address
    LDX #$00             ; A2 00 | Load immediate value into X register
    LDY #$00             ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C2A
; Address: $D6FECA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C2A:
    JSL $C736D0          ; 22 D0 36 C7 | Jump to subroutine long
    LDA $361A            ; AD 1A 36 | Load from absolute address into accumulator
    CMP #$E8             ; C9 E8 | Compare accumulator (immediate)
    BCC $03              ; 90 03 | Branch if carry clear
    JMP $7EE0            ; 4C E0 7E | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C2C
; Address: $D6FEE0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C2C:
    JSL $C737BE          ; 22 BE 37 C7 | Jump to subroutine long
    STZ $2206,X          ; 9E 06 22 | Store zero to absolute,X
    ROR $AC              ; 66 AC | Rotate right (zero page)
    CMP $03B0            ; CD B0 03 | Compare accumulator (absolute)
    JMP $7F15            ; 4C 15 7F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C31
; Address: $D6FEFF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C31:
    LDA #$40             ; A9 40 | Load immediate value into accumulator
    ROL                  ; 2A | Rotate left (accumulator)
    LDA #$20             ; A9 20 | Load immediate value into accumulator
    LDA #$18             ; A9 18 | Load immediate value into accumulator
    ORA ($22,X)          ; 01 22 | Logical OR with accumulator ((zero page,X))
    LSR $C731,X          ; 5E 31 C7 | Logical shift right (absolute,X)
    JMP $7F22            ; 4C 22 7F | Jump to address

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C32
; Address: $D6FF15
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C32:
    JSL $CDACE0          ; 22 E0 AC CD | Jump to subroutine long
    LDA #$00             ; A9 00 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    JMP $7ECE            ; 4C CE 7E | Jump to address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C33
; Address: $D6FF23
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C33:
    JSL $CC803E          ; 22 3E 80 CC | Jump to subroutine long
    BCS $03              ; B0 03 | Branch if carry set
    JMP $7F32            ; 4C 32 7F | Jump to address
    LDA #$E8             ; A9 E8 | Load immediate value into accumulator
    STA $361A            ; 8D 1A 36 | Store accumulator to absolute address
    RTL                  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C34
; Address: $D6FF33
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C34:
    JSL $CCD392          ; 22 92 D3 CC | Jump to subroutine long
    LDX #$14             ; A2 14 | Load immediate value into X register
    LDA #$26             ; A9 26 | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C3F
; Address: $D6FF72
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C3F:
    JSL $CDAEE1          ; 22 E1 AE CD | Jump to subroutine long
    LDX #$18             ; A2 18 | Load immediate value into X register
    LDA #$1D             ; A9 1D | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C42
; Address: $D6FF84
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C42:
    JSL $CCD88A          ; 22 8A D8 CC | Jump to subroutine long
    STZ $2206            ; 9C 06 22 | Store zero to absolute
    LDY $22CD            ; AC CD 22 | Load from absolute address into Y register
    STA ($D8,X)          ; 81 D8 | Store accumulator to (zero page,X)
    CPY $14A2            ; CC A2 14 | Compare Y register (absolute)
    LDA #$1F             ; A9 1F | Load immediate value into accumulator

;------------------------------------------------------------------------------
; Bank2C_DmaFunction_C51
; Address: $D6FFDC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank2C_DmaFunction_C51:
    JSL $CCD91C          ; 22 1C D9 CC | Jump to subroutine long
    LDX #$1A             ; A2 1A | Load immediate value into X register
    LDA #$29             ; A9 29 | Load immediate value into accumulator
