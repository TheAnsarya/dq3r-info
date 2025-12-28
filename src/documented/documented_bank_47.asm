;==============================================================================
; Dragon Quest III - Bank 47
;==============================================================================
; File: bank_47.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Bank $47 Code
; Ultra-aggressive code extraction


.segment "BANK_47_CODE"


;==============================================================================
; GeneralPurpose_00
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00:
    SBC $C0              ; F2 C0 | Unknown operation
    LDA $84              ; B2 84 | Load value into accumulator
    BIT $08,X            ; 34 08 | Unknown operation
    PLA                  ; 68 | Pull accumulator from stack
    BVC $7FD9            ; 50 D0 | Unknown operation
    BRK $80              ; 00 80 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $1E              ; 00 1E | Software interrupt
    CPX $E81E            ; EC 1E E8 | Unknown operation
    TRB $18E0            ; 1C E0 18 | Unknown operation
    CPX #$90             ; E0 90 | Unknown operation
    CPY #$80             ; C0 80 | Unknown operation
    BRA $801D            ; 80 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $03              ; 03 03 | Logical OR with accumulator
    TSB $300D            ; 0C 0D 30 | Unknown operation
    AND $4E40,X          ; 3D 40 4E | Logical AND with accumulator
    BRA $8023            ; 80 F6 | Unknown operation
    BRK $FA              ; 00 FA | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $0F              ; 00 0F | Software interrupt
    ORA $3F              ; 03 3F | Logical OR with accumulator
    ORA $FF3F7F          ; 0F 7F 3F FF | Logical OR with accumulator
    ADC $FFFFFF,X        ; 7F FF FF FF | Unknown operation
    SBC $00FFFF,X        ; FF FF FF 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    CPY #$60             ; C0 60 | Unknown operation
    RTS                  ; 60 | Return from local function
    BMI $7FFE            ; 30 B0 | Unknown operation
    BCS $80C0            ; B0 70 | Branch if carry set
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BPL $8076            ; 10 00 | Unknown operation
    SEC                  ; 38 | Set carry flag
    BRK $38              ; 00 38 | Software interrupt
    BPL $80F3            ; 10 78 | Unknown operation
    BPL $8075            ; 10 F8 | Unknown operation
    JSR $00F8            ; 20 F8 00 | Call local function
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    ORA $02              ; 01 02 | Logical OR with accumulator
    ORA $04              ; 03 04 | Logical OR with accumulator

    ORA $04              ; 03 04
    BRK $04              ; 00 04
    ORA $04              ; 03 04
    SBC $E4              ; E3 E4
    BCC $8122            ; 90 74
    PHD                  ; 0B
    STZ $0307            ; 9C 07 03
    ORA $03              ; 07 03
    ORA $070F07          ; 0F 07 0F 07
    ORA $E7EF07          ; 0F 07 EF E7
    ORA $FF0FF7,X        ; 1F F7 0F FF
    BIT $CD00,X          ; 3C 00 CD
    ORA $F7              ; 01 F7
    ORA $7C              ; 01 7C
    TSB $92              ; 04 92
    COP $F9              ; 02 F9
    ORA $0565,Y          ; 19 65 05
    STA $12              ; 92 12
    SBC $FFFEFF,X        ; FF FF FE FF
    INC $FBFF,X          ; FE FF FB
    SBC $E6FFFD,X        ; FF FD FF E6
    SBC $EDFFFA,X        ; FF FA FF ED
    SBC $D93CD9,X        ; FF D9 3C D9
    TYX                  ; BB
    LDY $7C7E,X          ; BC 7E 7C
    INC $FF7D,X          ; FE 7D FF
    LSR $2CFE            ; 4E FE 2C
    JSR ($DCEC,X)        ; FC EC DC
    SBC $F4              ; E7 F4
    SBC $FE              ; E7 FE
    CMP $F6              ; C3 F6
    STA $E2              ; 83 E2
    STA $83              ; 83 83
    BCS $80B0            ; B0 B4
    BNE $80CE            ; D0 D0
    BMI $8138            ; 30 38

;==============================================================================
; GeneralPurpose_01
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01:
    CPX #$C0             ; E0 C0 | Unknown operation
    BEQ $8094            ; F0 90 | Branch if equal (zero flag set)
    CPX #$20             ; E0 20 | Unknown operation
    CPY #$C0             ; C0 C0 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BPL $8141            ; 10 0F | Unknown operation
    BMI $8153            ; 30 1F | Unknown operation
    BMI $8155            ; 30 1F | Unknown operation
    ORA $0F0F1F,X        ; 1F 1F 0F 0F | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    ORA $00              ; 03 00 | Logical OR with accumulator
    TSB $9F              ; 04 9F | Unknown operation
    ORA $FF              ; 03 FF | Logical OR with accumulator
    ORA $FC              ; 03 FC | Logical OR with accumulator
    CMP $38              ; C7 38 | Compare with accumulator
    AND $E1DFC0,X        ; 3F C0 DF E1 | Logical AND with accumulator
    LDA $3E              ; A7 3E | Load value into accumulator
    CLD                  ; D8 | Unknown operation
    STA $03FF07,X        ; 9F 07 FF 03 | Store accumulator to memory
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $E1FFC0,X        ; FF C0 FF E1 | Unknown operation
    SBC $FF3FFE,X        ; FF FE 3F FF | Unknown operation
    ORA $3409E9,X        ; 1F E9 09 34 | Logical OR with accumulator
    CPY $CA              ; C4 CA | Unknown operation
    SBC $F5              ; F2 F5 | Unknown operation
    SBC $DCFA,Y          ; F9 FA DC | Unknown operation
    SBC $9E,X            ; F5 9E | Unknown operation
    NOP                  ; EA | Unknown operation
    AND $F6FF1B,X        ; 3F 1B FF F6 | Logical AND with accumulator
    SBC $FDFFFB,X        ; FF FB FF FD | Unknown operation
    SBC $DFFFFE,X        ; FF FE FF DF | Unknown operation
    SBC $3FFF9F,X        ; FF 9F FF 3F | Unknown operation
    SBC $E4FDF7,X        ; FF F7 FD E4 | Unknown operation
    TRB $6C              ; 14 6C | Unknown operation
    STZ $7898            ; 9C 98 78 | Unknown operation
    TYA                  ; 98 | Unknown operation
    SED                  ; F8 | Unknown operation
    BVS $817A            ; 70 F0 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDY #$E0             ; A0 E0 | Load Y register
    JSR $C0C0            ; 20 C0 C0 | Call local function
    SEI                  ; 78 | Unknown operation
    SEI                  ; 78 | Unknown operation
    BPL $81AC            ; 10 18 | Unknown operation

    BPL $81AC            ; 10 18
    JSR $2030            ; 20 30 20
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    ORA $03              ; 03 03
    ORA $03              ; 03 03
    ORA $01              ; 01 01
    ; Skipped 32 bytes of data
    TSB $84              ; 04 84
    JMP ($7C84,X)        ; 7C 84 7C
    STY $FD              ; 84 FD
    ORA $FF              ; 05 FF
    ORA $FF              ; 07 FF
    COP $FF              ; 02 FF
    COP $FF              ; 02 FF
    STY $7F              ; 84 7F
    STY $3F              ; 84 3F
    CPY $3F              ; C4 3F
    CPY $7F              ; C4 7F
    STY $E6              ; 84 E6
    CMP $76              ; C5 76
    ADC $5B              ; 65 5B
    PHY                  ; 5A
    TDC                  ; 7B
    ADC $6B              ; 73 6B
    EOR $A31B3F          ; 4F 3F 1B A3
    ORA $87              ; 12 87
    AND $FD              ; 37 FD
    WAI                  ; CB
    JSR ($F64B,X)        ; FC 4B F6
    EOR #$FD             ; 49 FD
    PER $67DC            ; 62 DC 67
    JMP $DF33            ; DC 33 DF
    AND $DD              ; 31 DD
    AND $02              ; 32 02
    ORA $02              ; 03 02
    ORA $02              ; 03 02
    ORA $05              ; 03 05
    ASL $05              ; 06 05
    ASL $05              ; 06 05
    ASL $0B              ; 06 0B
    ORA $020F0B          ; 0F 0B 0F 02
    ORA $02              ; 03 02
    ORA $02              ; 03 02
    ORA $04              ; 03 04
    ORA $04              ; 07 04
    ORA $04              ; 07 04
    ORA $0B              ; 07 0B
    ASL $0E0B            ; 0E 0B 0E
    XCE                  ; FB
    ORA #$FB             ; 09 FB
    ORA #$FB             ; 09 FB
    ORA $19FB,Y          ; 19 FB 19
    SBC $18FD18,X        ; FF 18 FD 18
    SBC $FE1C,X          ; FD 1C FE
    STZ $807F            ; 9C 7F 80
    ADC $807F80,X        ; 7F 80 7F 80
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $B58700,X        ; FF 00 87 B5
    BRL $03F7            ; 82 B2 81
    LDA $8B,X            ; B5 8B
    LDA $88              ; B3 88
    LDY $83,X            ; B4 83
    LDA $C5              ; B7 C5
    TXY                  ; 9B
    DEC $59              ; C6 59
    CMP $38DF32,X        ; DF 32 DF 38
    DEC $DF3D,X          ; DE 3D DF
    SEC                  ; 38
    CMP $3FDC3C,X        ; DF 3C DC 3F
    INC $EF1F            ; EE 1F EF
    ORA $000000,X        ; 1F 00 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $03              ; 07 03
    ORA $01              ; 03 01
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0B              ; 00 0B
    ASL $0407            ; 0E 07 04
    ORA $04              ; 07 04
    ORA $02              ; 03 02
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    INC $FFBC,X          ; FE BC FF
    LDY $FEFF,X          ; BC FF FE
    SBC $C1F3E7,X        ; FF E7 F3 C1
    BVS $832B            ; 70 7F
    CLC                  ; 18
    ORA $FF0101,X        ; 1F 01 01 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRA $832B            ; 80 70
    ADC $0F171E,X        ; 7F 1E 17 0F
    ORA $E1              ; 01 E1
    LSR $2760            ; 4E 60 27
    LDY $05,X            ; B4 05
    STP                  ; DB
    STA $FC              ; 83 FC
    CPX #$FF             ; E0 FF
    JMP ($C343,X)        ; 7C 43 C3
    BRA $8250            ; 80 80
    SBC $0F              ; F7 0F
    SBC $FE07,Y          ; F9 07 FE
    ORA $FF              ; 05 FF
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    CMP $80              ; C3 80
    BRA $82EC            ; 80 0B
    TSB $00              ; 04 00
    ORA $070B04          ; 0F 04 0B 07
    PHP                  ; 08
    ORA $04              ; 03 04
    BRK $03              ; 00 03
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSB $00              ; 04 00
    PHP                  ; 08
    BRK $08              ; 00 08
    BRK $08              ; 00 08
    BRK $04              ; 00 04
    BRK $03              ; 00 03
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRK $C0              ; 00 C0
    BRK $40              ; 00 40
    BRA $8309            ; 80 00
    BRA $830B            ; 80 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $00              ; 07 00
    ORA $00              ; 07 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    ORA $04              ; 03 04
    ORA $0C              ; 03 0C
    ORA $0C              ; 07 0C
    ORA $01              ; 07 01
    COP $01              ; 02 01
    COP $03              ; 02 03
    TSB $F0              ; 04 F0
    PEA $04F3            ; F4 F3 04
    ORA $E4              ; 13 E4
    BPL $82D2            ; 10 84
    PHD                  ; 0B
    STZ $0307            ; 9C 07 03
    ORA $03              ; 07 03
    ORA $F7FF07          ; 0F 07 FF F7
    ORA $F70FF7          ; 0F F7 0F F7
    ORA $FF0FF7          ; 0F F7 0F FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $02              ; 01 02
    ORA $04              ; 03 04
    BRK $04              ; 00 04
    ORA $04              ; 03 04
    ORA $04              ; 03 04
    BEQ $8382            ; F0 F4
    TCS                  ; 1B
    CPX $0307            ; EC 07 03
    ORA $03              ; 07 03
    ORA $070F07          ; 0F 07 0F 07
    ORA $070F07          ; 0F 07 0F 07
    SBC $FF0FF7,X        ; FF F7 0F FF
    ASL                  ; 0A
    ORA $0605            ; 0D 05 06
    COP $03              ; 02 03
    ORA $01              ; 01 01
    ORA $02              ; 03 02
    ORA $00              ; 03 00
    ORA $03              ; 03 03
    ORA $01              ; 01 01
    TSB $060F            ; 0C 0F 06
    ORA $03              ; 07 03
    ORA $01              ; 03 01
    ORA $03              ; 01 03
    COP $07              ; 02 07
    BRK $07              ; 00 07
    BRK $07              ; 00 07
    BRK $04              ; 00 04
    SBC $47FF03,X        ; FF 03 FF 47
    CLV                  ; B8
    LDA $615FC0,X        ; BF C0 5F 61
    STA $3EAF33,X        ; 9F 33 AF 3E
    BNE $836F            ; D0 9F
    ORA $FF              ; 07 FF
    ORA $FF              ; 03 FF
    BRA $83D5            ; 80 FF
    CPY #$FF             ; C0 FF
    SBC $7F              ; E1 7F
    SBC $3F              ; F3 3F
    INC $FF3F,X          ; FE 3F FF
    ORA $3409E9,X        ; 1F E9 09 34
    CPY $CA              ; C4 CA
    SBC $F5              ; F2 F5
    SBC $BCFA,Y          ; F9 FA BC
    SBC $9A3E            ; ED 3E 9A
    SBC $F6EF6B,X        ; FF 6B EF F6
    SBC $FDFFFB,X        ; FF FB FF FD
    SBC $BFFFFE,X        ; FF FE FF BF
    SBC $F7FF3F,X        ; FF 3F FF F7
    SBC $0EEDF7,X        ; FF F7 ED 0E
    ORA #$0C             ; 09 0C
    ORA $0E              ; 03 0E
    ORA $0F              ; 11 0F
    BPL $8420            ; 10 17
    CLC                  ; 18
    PHP                  ; 08
    ORA $000707          ; 0F 07 07 00
    BRK $08              ; 00 08
    ORA $300F10          ; 0F 10 0F 30
    ORA $181F30,X        ; 1F 30 1F 18
    ORA $070F0F,X        ; 1F 0F 0F 07
    ORA $00              ; 07 00
    BRK $0C              ; 00 0C
    STA $03              ; 97 03
    STA $83FC03,X        ; 9F 03 FC 83
    JMP ($18E7,X)        ; 7C E7 18
    AND $338FC0,X        ; 3F C0 8F 33
    EOR $1F              ; 53 1F
    ORA $FF              ; 07 FF
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    CPY #$FF             ; C0 FF
    SBC $3F              ; F3 3F
    SBC $09E91F,X        ; FF 1F E9 09
    BIT $C4,X            ; 34 C4
    DEX                  ; CA
    SBC $F5              ; F2 F5
    ADC $FCFA,Y          ; 79 FA FC
    SBC $DE,X            ; F5 DE
    NOP                  ; EA
    AND $F6FFDB,X        ; 3F DB FF F6
    SBC $FDFFFB,X        ; FF FB FF FD
    SBC $FFFF7E,X        ; FF 7E FF FF
    SBC $3FFFDF,X        ; FF DF FF 3F
    SBC $00FDF7,X        ; FF F7 FD 00
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    ; Skipped 32 bytes of data
    TXS                  ; 9A
    STZ $F4,X            ; 74 F4
    JMP $7C84            ; 4C 84 7C
    STY $FC              ; 84 FC
    TSB $FD              ; 04 FD
    ORA $FF              ; 05 FF
    ORA $FF              ; 07 FF
    COP $FF              ; 02 FF
    BRL $4917            ; 82 7F C4
    AND $C43FC4,X        ; 3F C4 3F C4
    ADC $847F84,X        ; 7F 84 7F 84
    INC $C5              ; E6 C5
    ROR $65,X            ; 76 65
    TCD                  ; 5B
    EOR $6B              ; 52 6B
    RTL                  ; 6B
    ADC #$4B             ; 69 4B
    AND $17              ; 25 17
    LDA $19              ; A1 19
    STA $3B              ; 83 3B
    SBC $FCCB,X          ; FD CB FC
    PHK                  ; 4B
    INC $FD41,X          ; FE 41 FD
    PER $63DE            ; 62 DE 63
    DEC $DF33,X          ; DE 33 DF
    SEC                  ; 38
    DEC $0039,X          ; DE 39 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    ; Skipped 32 bytes of data
    CMP $6CEEFE          ; CF FE EE 6C
    JMP ($E47C)          ; 6C 7C E4
    SBC $FF04,X          ; FD 04 FF
    ORA $FF03FF          ; 0F FF 03 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    COP $FF              ; 02 FF
    TSB $E47F            ; 0C 7F E4
    ADC $E52684,X        ; 7F 84 26 E5
    INC $E5,X            ; F6 E5
    TDC                  ; 7B
    ROR                  ; 6A
    TCD                  ; 5B
    EOR $7B              ; 53 7B
    ADC $3F              ; 77 3F
    TCS                  ; 1B
    LDA $05              ; A7 05
    STA $EBFD2F          ; 8F 2F FD EB
    JSR ($F6CB,X)        ; FC CB F6
    EOR #$FD             ; 49 FD
    WDM $FC              ; 42 FC
    ADC $DC              ; 67 DC
    AND $DF              ; 33 DF
    JSL $0225DA          ; 22 DA 25 02
    ORA $02              ; 03 02
    ORA $05              ; 03 05
    ASL $05              ; 06 05
    ASL $05              ; 06 05
    ASL $05              ; 06 05
    ASL $05              ; 06 05
    ASL $06              ; 06 06
    TSB $02              ; 04 02
    ORA $02              ; 03 02
    ORA $04              ; 03 04
    ORA $04              ; 07 04
    ORA $04              ; 07 04
    ORA $04              ; 07 04
    ORA $04              ; 07 04
    ORA $05              ; 07 05
    ASL $FB              ; 06 FB
    ORA #$F9             ; 09 F9
    PHP                  ; 08
    SBC $FD08,X          ; FD 08 FD
    PHP                  ; 08
    SBC $FE18,X          ; FD 18 FE
    TRB $1CFE            ; 1C FE 1C
    INC $7F3C,X          ; FE 3C 7F
    BRA $85D2            ; 80 7F
    BRA $8554            ; 80 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $83              ; 00 83
    TSX                  ; BA
    STA $B9              ; 81 B9
    BRA $8520            ; 80 BA
    CMP $9D              ; C1 9D
    REP #$1C             ; C2 1C
    CMP $1B              ; C1 1B
    CMP $1B              ; C1 1B
    SEP #$0D             ; E2 0D
    CMP $3CDF39,X        ; DF 39 DF 3C
    CMP $1CE73E,X        ; DF 3E E7 1C
    SBC $1E              ; E7 1E
    INC $EE1F            ; EE 1F EE
    ORA $020FF7,X        ; 1F F7 0F 02
    ORA $02              ; 03 02
    ORA $02              ; 03 02
    ORA $05              ; 03 05
    ASL $05              ; 06 05
    ASL $05              ; 06 05
    ASL $05              ; 06 05
    ASL $0B              ; 06 0B
    ASL $0302            ; 0E 02 03
    COP $03              ; 02 03
    COP $03              ; 02 03
    TSB $07              ; 04 07
    TSB $07              ; 04 07
    TSB $07              ; 04 07
    TSB $07              ; 04 07
    PHD                  ; 0B
    ASL $00F3            ; 0E F3 00
    SBC $01              ; F7 01
    SBC $11              ; F7 11
    SBC $11              ; F7 11
    SBC $11              ; F7 11
    XCE                  ; FB
    ORA $FB              ; 11 FB
    BPL $85AA            ; 10 FB
    BRA $8630            ; 80 7F
    BRA $8632            ; 80 7F
    BRA $8634            ; 80 7F
    BRA $85B6            ; 80 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $8F              ; 00 8F
    ROL                  ; 2A
    STA $35              ; 85 35
    BRL $8CF9            ; 82 32 07
    ADC $08              ; 77 08
    PLA                  ; 68
    ORA $6F              ; 07 6F
    ORA $6F              ; 17 6F
    PHB                  ; 8B
    AND $DF              ; 37 DF
    AND $DF              ; 25 DF
    BMI $85B2            ; 30 DD
    DEC                  ; 3A
    STA $78B770,X        ; 9F 70 B7 78
    CLV                  ; B8
    ADC $DC7FB8,X        ; 7F B8 7F DC
    AND $070407,X        ; 3F 07 04 07
    TSB $07              ; 04 07
    ASL $03              ; 06 03
    ORA $03              ; 03 03
    ORA $01              ; 03 01
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $05              ; 00 05
    ASL $07              ; 06 07
    TSB $07              ; 04 07
    TSB $03              ; 04 03
    COP $03              ; 02 03
    COP $01              ; 02 01
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    ROL $7FFF,X          ; 3E FF 7F
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $83E7FF,X        ; FF FF E7 83
    SBC $EE              ; F1 EE
    BIT $3F              ; 24 3F
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FE              ; E1 FE
    BIT $613B,X          ; 3C 3B 61
    ASL $07B0            ; 0E B0 07
    PEI $05              ; D4 05
    SBC $83              ; E3 83
    JSR ($FFE0,X)        ; FC E0 FF
    JSR ($C3C3,X)        ; FC C3 C3
    BRA $85B0            ; 80 80
    SBC $0F              ; F3 0F
    SBC $FE07,Y          ; F9 07 FE
    ORA $FF              ; 05 FF
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $C0              ; 03 C0
    BRA $864C            ; 80 0B
    ORA $0F0F0B          ; 0F 0B 0F 0F
    PHD                  ; 0B
    ORA $05              ; 05 05
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BMI $86AB            ; 30 3F
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $3F3CC0,X        ; FF C0 3C 3F
    ORA $000001          ; 0F 01 00 00
    STY $33              ; 84 33
    CMP $1C              ; C1 1C
    CPY #$0F             ; C0 0F
    PLA                  ; 68
    PHD                  ; 0B
    TYX                  ; BB
    ORA $FF              ; 03 FF
    BRK $C3              ; 00 C3
    CMP $00              ; C3 00
    BRK $DF              ; 00 DF
    AND $F31FEF,X        ; 3F EF 1F F3
    ORA $FF0BFC          ; 0F FC 0B FF
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    CMP $00              ; C3 00
    BRK $01              ; 00 01
    ORA $000202          ; 0F 02 02 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $1C              ; 00 1C
    TRB $1C1C            ; 1C 1C 1C
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSB $2F00            ; 0C 00 2F
    TRB $0C1B            ; 1C 1B 0C
    TRB $08              ; 14 08
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY #$C0             ; C0 C0
    BEQ $87AC            ; F0 F0
    CPX #$E0             ; E0 E0
    CPX #$E0             ; E0 E0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL $06              ; 06 06
    PHD                  ; 0B
    ORA #$0F             ; 09 0F
    CLC                  ; 18
    ORA $10              ; 07 10
    ORA $10              ; 17 10
    AND $000020,X        ; 3F 20 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL $00              ; 06 00
    ORA $00              ; 07 00
    ORA $000F00          ; 0F 00 0F 00
    ORA $000000,X        ; 1F 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY #$E0             ; C0 E0
    CPY #$10             ; C0 10
    BEQ $87F4            ; F0 08
    BEQ $87F2            ; F0 04
    CPX $000E            ; EC 0E 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $E0              ; 00 E0
    BRK $F0              ; 00 F0
    BRK $F8              ; 00 F8
    BRK $F0              ; 00 F0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $03              ; 01 03
    COP $0D              ; 02 0D
    TSB $101F            ; 0C 1F 10
    ORA $000020          ; 0F 20 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 03 00
    ORA $001F00          ; 0F 00 1F 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRA $87A8            ; 80 80
    CPY #$40             ; C0 40
    CPX #$30             ; E0 30
    BCC $8846            ; 90 18
    BEQ $884E            ; F0 1E
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    AND $003F00,X        ; 3F 00 3F 00
    STA $008F00,X        ; 9F 00 8F 00
    STX $8600            ; 8E 00 86
    BRK $84              ; 00 84
    BRK $C2              ; 00 C2
    ORA $07              ; 03 07
    ASL $25              ; 06 25
    ASL $D7              ; 06 D7
    CLC                  ; 18
    LDA $807FA0,X        ; BF A0 7F 80
    PER $449D            ; 62 9D 44
    LDX $00FC,Y          ; BE FC 00
    SED                  ; F8
    BRK $F8              ; 00 F8
    BRK $E0              ; 00 E0
    BRK $40              ; 00 40
    BRK $00              ; 00 00
    BRK $91              ; 00 91
    BRK $82              ; 00 82
    BRK $2F              ; 00 2F
    RTS                  ; 60
    ORA $70              ; 17 70
    ORA $280878,X        ; 1F 78 08 28
    COP $1B              ; 02 1B
    ORA $0B              ; 13 0B
    PHD                  ; 0B
    ORA $00              ; 07 00
    ORA $1F              ; 03 1F
    BRK $4F              ; 00 4F
    BRK $47              ; 00 47
    BRK $37              ; 00 37
    BRK $14              ; 00 14
    BRK $04              ; 00 04
    BRK $04              ; 00 04
    BRK $03              ; 00 03
    BRK $EE              ; 00 EE
    ORA $8133B2          ; 0F B2 33 81
    ROR $8A              ; 66 8A
    CPX $FC32            ; EC 32 FC
    TRB $00E0            ; 1C E0 00
    CPY #$00             ; C0 00
    BRK $F0              ; 00 F0
    BRK $CD              ; 00 CD
    BRK $98              ; 00 98
    BRK $54              ; 00 54
    BRK $84              ; 00 84
    BRK $20              ; 00 20
    BRK $C0              ; 00 C0
    BRK $00              ; 00 00
    BRK $3A              ; 00 3A
    XCE                  ; FB
    TSB $47              ; 04 47
    JSR $3867            ; 20 67 38
    ADC $1F3F1A,X        ; 7F 1A 3F 1F
    AND $3818,X          ; 3D 18 38
    ORA $32              ; 12 32
    TSB $00              ; 04 00
    AND $1B00,Y          ; 39 00 1B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    BRK $27              ; 00 27
    BRK $2D              ; 00 2D
    BRK $1C              ; 00 1C
    INC $F634,X          ; FE 34 F6
    SEI                  ; 78
    JSR ($FC00,X)        ; FC 00 FC
    BPL $88E2            ; 10 F8
    PLP                  ; 28
    BCS $8945            ; B0 58
    RTS                  ; 60
    BRK $78              ; 00 78
    COP $00              ; 02 00
    PHP                  ; 08
    BRK $04              ; 00 04
    BRK $04              ; 00 04
    BRK $08              ; 00 08
    BRK $40              ; 00 40
    BRK $A0              ; 00 A0
    BRK $E8              ; 00 E8
    BRK $14              ; 00 14
    ROL $28,X            ; 36 28
    ASL $1F08,X          ; 1E 08 1F
    ORA #$1E             ; 09 1E
    COP $0C              ; 02 0C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    AND #$00             ; 29 00
    ORA $00              ; 01 00
    BPL $8916            ; 10 00
    BPL $8918            ; 10 00
    TSB $0000            ; 0C 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $C0              ; 00 C0
    CLV                  ; B8
    PLP                  ; 28
    BEQ $8915            ; F0 F0
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $18              ; 00 18
    BRK $0E              ; 00 0E
    BRK $01              ; 00 01
    CLC                  ; 18
    BRK $0C              ; 00 0C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PHP                  ; 08
    BRK $00              ; 00 00
    PHP                  ; 08
    CLC                  ; 18
    TSB $0E              ; 04 0E
    BPL $8976            ; 10 19
    ASL $0C              ; 06 0C
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $28              ; 00 28
    BRK $14              ; 00 14
    BRK $30              ; 00 30
    TSB $80              ; 04 80
    BIT $00              ; 24 00
    BRK $00              ; 00 00
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    PHP                  ; 08
    PLP                  ; 28
    BPL $898F            ; 10 14
    PLA                  ; 68
    BIT $48,X            ; 34 48
    LDY $58              ; A4 58
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRA $89A6            ; 80 00
    ADC $00              ; 61 00
    DEC                  ; 3A
    BRK $44              ; 00 44
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    RTI                  ; 40
    ADC $88              ; 63 88
    STA $B622,X          ; 9D 22 B6
    BRK $10              ; 00 10
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0B              ; 00 0B
    TRB $02              ; 14 02
    ORA $0F00,X          ; 1D 00 0F
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TYA                  ; 98
    RTS                  ; 60
    SED                  ; F8
    BRK $F1              ; 00 F1
    BRK $E0              ; 00 E0
    BRK $C0              ; 00 C0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $39              ; 00 39
    BRK $4B              ; 00 4B
    BIT $20              ; 24 20
    TRB $020C            ; 1C 0C 02
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLX                  ; FA
    TSB $3C              ; 04 3C
    CPY #$78             ; C0 78
    BRK $F0              ; 00 F0
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $72              ; 00 72
    STY $04              ; 84 04
    INX                  ; E8
    RTS                  ; 60
    BRK $00              ; 00 00
    BVS $8AD9            ; 70 50
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $F6              ; 00 F6
    BRK $EC              ; 00 EC
    BRK $60              ; 00 60
    BRK $70              ; 00 70
    BRK $50              ; 00 50
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $42              ; 00 42
    BIT $0C30,X          ; 3C 30 0C
    TSB $03              ; 04 03
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ROR $FE04,X          ; 7E 04 FE
    TSB $7C              ; 04 7C
    BRK $00              ; 00 00
    BRK $0C              ; 00 0C
    BRK $1F              ; 00 1F
    TRB $0C00            ; 1C 00 0C
    BRK $2C              ; 00 2C
    ORA $24              ; 01 24
    BRK $47              ; 00 47
    BRK $07              ; 00 07

;==============================================================================
; GeneralPurpose_0B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0B:
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $5503,Y          ; 19 03 55 | Logical OR with accumulator
    ADC $22FF,Y          ; 79 FF 22 | Unknown operation
    STA $1BF2,Y          ; 99 F2 1B | Store accumulator to memory
    COP $C9              ; 02 C9 | Unknown operation
    REP #$00             ; C2 00 | Clear processor status bits
    BRK $03              ; 00 03 | Software interrupt
    BRK $E0              ; 00 E0 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $07              ; 00 07 | Software interrupt
    BRK $05              ; 00 05 | Software interrupt
    BEQ $8AE6            ; F0 C7 | Branch if equal (zero flag set)
    SED                  ; F8 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $E0              ; 00 E0 | Software interrupt
    SEI                  ; 78 | Unknown operation
    TYA                  ; 98 | Unknown operation
    NOP                  ; EA | Unknown operation
    CLC                  ; 18 | Clear carry flag
    LDA $48              ; B3 48 | Load value into accumulator
    LDA $00005B          ; AF 5B 00 00 | Load value into accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRA $8B36            ; 80 00 | Unknown operation
    TYA                  ; 98 | Unknown operation
    RTS                  ; 60 | Return from local function
    TYA                  ; 98 | Unknown operation
    BRK $95              ; 00 95 | Software interrupt
    TSB $D4              ; 04 D4 | Unknown operation
    BRK $D2              ; 00 D2 | Software interrupt
    ORA $01              ; 07 01 | Logical OR with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $0D              ; 01 0D | Logical OR with accumulator
    ORA $1E10            ; 0D 10 1E | Logical OR with accumulator
    ASL $09              ; 06 09 | Arithmetic shift left
    LSR $FE19            ; 4E 19 FE | Unknown operation
    ORA $F2              ; 11 F2 | Logical OR with accumulator
    CMP $0002,Y          ; D9 02 00 | Compare with accumulator
    COP $00              ; 02 00 | Unknown operation
    ASL $1900            ; 0E 00 19 | Arithmetic shift left
    ASL $39              ; 06 39 | Arithmetic shift left
    JSR $00A9            ; 20 A9 00 | Call local function
    ORA #$20             ; 09 20 | Logical OR with accumulator
    EOR $38E0            ; 4D E0 38 | Unknown operation
    CPY #$37             ; C0 37 | Unknown operation
    LDY $869F,X          ; BC 9F 86 | Load Y register

    LDY $869F,X          ; BC 9F 86
    TYA                  ; 98
    BRA $8B13            ; 80 AA
    LSR $04FF,X          ; 5E FF 04
    CMP $4F0F,Y          ; D9 0F 4F
    LDA $041F00          ; AF 00 1F 04
    EOR $471F66,X        ; 5F 66 1F 47
    BRK $C1              ; 00 C1
    BRK $C0              ; 00 C0
    BRK $E0              ; 00 E0
    BRK $F0              ; 00 F0
    BRK $40              ; 00 40
    BRK $80              ; 00 80
    BRA $8B45            ; 80 C0
    BRK $10              ; 00 10
    PLP                  ; 28
    JMP $A09EF0          ; 5C F0 9E A0
    CMP $403EE0,X        ; DF E0 3E 40
    BRK $C0              ; 00 C0
    BRA $8B54            ; 80 C0
    BMI $8B56            ; 30 C0
    SED                  ; F8
    SEC                  ; 38
    BRK $30              ; 00 30
    RTI                  ; 40
    BIT $00              ; 24 00
    PER $4080            ; 62 80 40
    ADC $07FB01,X        ; 7F 01 FB 07
    ROL $3F04,X          ; 3E 04 3F
    BRK $5F              ; 00 5F
    BRK $1F              ; 00 1F
    BRK $07              ; 00 07
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    AND $01              ; 27 01
    ORA $00              ; 07 00
    ORA $00              ; 07 00
    ORA $00              ; 01 00
    PHP                  ; 08
    BRK $0C              ; 00 0C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    INC $E0              ; E6 E0
    NOP                  ; EA
    DEC                  ; 3A
    DEC $C1              ; C6 C1
    XCE                  ; FB
    ORA $3F              ; 07 3F
    ORA $E3              ; 07 E3
    WDM $01              ; 42 01
    ORA $00              ; 01 00
    BRK $F9              ; 00 F9
    INC $20              ; E6 20
    SBC $F0C8,X          ; FD C8 F0
    ASL $E0              ; 06 E0
    CPY $00              ; C4 00
    ORA $40              ; 03 40
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ADC $916759,X        ; 7F 59 67 91
    AND $A8              ; 37 A8
    ROR $2EE8,X          ; 7E E8 2E
    BCC $8B91            ; 90 A6
    RTS                  ; 60
    CPX #$00             ; E0 00
    BRK $00              ; 00 00
    BNE $8BF7            ; D0 05
    CLC                  ; 18
    ORA $78              ; 01 78
    BRK $38              ; 00 38
    TSB $51              ; 04 51
    TSB $F9              ; 04 F9
    CLC                  ; 18
    BRK $00              ; 00 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_0C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0C:
    BEQ $8B96            ; F0 94 | Branch if equal (zero flag set)
    CPY $86              ; C4 86 | Unknown operation
    LDA $17              ; A5 17 | Load value into accumulator
    RTL                  ; 6B | Return from external function
    ORA $73              ; 13 73 | Logical OR with accumulator
    PHD                  ; 0B | Unknown operation
    STZ $04              ; 64 04 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA #$82             ; 09 82 | Logical OR with accumulator
    AND $58A0,Y          ; 39 A0 58 | Logical AND with accumulator
    RTI                  ; 40 | Unknown operation
    TRB $8C20            ; 1C 20 8C | Unknown operation
    JSR $189F            ; 20 9F 18 | Call local function
    TSB $04              ; 04 04 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ADC $47              ; 67 47 | Unknown operation
    LDX $0CCC            ; AE CC 0C | Load X register
    INC $BF              ; E6 BF | Unknown operation
    STA $2C              ; 87 2C | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    EOR $C0              ; 47 C0 | Unknown operation
    BRA $8BAE            ; 80 80 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SED                  ; F8 | Unknown operation
    BRK $31              ; 00 31 | Software interrupt
    BRK $31              ; 00 31 | Software interrupt
    BRK $60              ; 00 60 | Software interrupt
    ORA $E3              ; 01 E3 | Logical OR with accumulator
    BRK $C0              ; 00 C0 | Software interrupt
    BRK $80              ; 00 80 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $7E              ; 00 7E | Software interrupt
    RTI                  ; 40 | Unknown operation
    SBC $80FC80,X        ; FF 80 FC 80 | Unknown operation
    JSR ($FA00,X)        ; FC 00 FA | Call local function
    BRK $F8              ; 00 F8 | Software interrupt
    BRK $E0              ; 00 E0 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $80              ; 00 80 | Software interrupt
    JMP $8000            ; 4C 00 80 | Unknown operation
    BRK $80              ; 00 80 | Software interrupt
    BRK $20              ; 00 20 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $30              ; 00 30 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    PHD                  ; 0B | Unknown operation
    TSB $0C0B            ; 0C 0B 0C | Unknown operation

    TSB $0C0B            ; 0C 0B 0C
    ORA $04              ; 03 04
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $0F0F0F          ; 0F 0F 0F 0F
    ORA $07              ; 07 07
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_0D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0D:
    PHD                  ; 0B | Unknown operation
    TSB $0C0B            ; 0C 0B 0C | Unknown operation
    COP $05              ; 02 05 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    COP $03              ; 02 03 | Unknown operation
    ORA $07              ; 05 07 | Logical OR with accumulator
    ORA #$0F             ; 09 0F | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $03              ; 03 03 | Logical OR with accumulator
    ORA $03              ; 03 03 | Logical OR with accumulator
    ORA $07              ; 07 07 | Logical OR with accumulator
    ORA $00000F          ; 0F 0F 00 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ORA $03              ; 03 03 | Logical OR with accumulator
    COP $03              ; 02 03 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    ORA $07              ; 07 07 | Logical OR with accumulator
    ORA $07              ; 07 07 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    


;==============================================================================
; GeneralPurpose_0E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0E:
    RTI                  ; 40 | Unknown operation
    CPY #$60             ; C0 60 | Unknown operation
    CPX #$80             ; E0 80 | Unknown operation
    RTS                  ; 60 | Return from local function
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRA $8DD2            ; 80 80 | Unknown operation
    CPY #$C0             ; C0 C0 | Unknown operation
    CPX #$E0             ; E0 E0 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    TSB $0C              ; 04 0C | Unknown operation
    BIT $0C1C,X          ; 3C 1C 0C | Unknown operation
    TSB $0C0C            ; 0C 0C 0C | Unknown operation
    TSB $2D0C            ; 0C 0C 2D | Unknown operation
    ASL $0000,X          ; 1E 00 00 | Arithmetic shift left
    BRK $00              ; 00 00 | Software interrupt
    ROL $271C,X          ; 3E 1C 27 | Unknown operation
    PER $6326            ; 62 26 63 | Unknown operation
    ROL $471F,X          ; 3E 1F 47 | Unknown operation
    JSL $001C3A          ; 22 3A 1C 00 | Call external function
    BRK $00              ; 00 00 | Software interrupt
    BRK $3E              ; 00 3E | Software interrupt
    TRB $6336            ; 1C 36 63 | Unknown operation
    ADC $3E              ; 77 3E | Unknown operation
    ROL $63,X            ; 36 63 | Unknown operation
    ADC $63              ; 77 63 | Unknown operation
    ADC $3E              ; 77 3E | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ROL $711C            ; 2E 1C 71 | Unknown operation
    JSL $327C3E          ; 22 3E 7C 32 | Call external function
    ADC $72              ; 63 72 | Unknown operation
    AND $3E              ; 23 3E | Logical AND with accumulator
    TRB $0000            ; 1C 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BPL $8F0E            ; 10 08 | Unknown operation

    BPL $8F0E            ; 10 08
    TRB $1818            ; 1C 18 18
    BIT $2C2E,X          ; 3C 2E 2C
    BIT $C77E,X          ; 3C 7E C7
    LSR $00              ; 46 00
    BRK $00              ; 00 00
    BRK $F9              ; 00 F9
    ROR $3333,X          ; 7E 33 33
    AND $3E              ; 32 3E
    ROL $32,X            ; 36 32
    AND $33              ; 33 33
    ADC $00003E,X        ; 7F 3E 00 00
    BRK $00              ; 00 00
    ROL $611E,X          ; 3E 1E 61
    AND $60              ; 31 60
    RTS                  ; 60
    RTS                  ; 60
    RTS                  ; 60
    ADC $31              ; 61 31
    ROL $001E,X          ; 3E 1E 00
    BRK $00              ; 00 00
    BRK $BA              ; 00 BA
    JMP ($3237,X)        ; 7C 37 32
    AND $33              ; 33 33
    AND $33              ; 33 33
    AND $32              ; 37 32
    TSX                  ; BA
    JMP ($0000,X)        ; 7C 00 00
    BRK $00              ; 00 00
    LDX $307E,Y          ; BE 7E 30
    AND $30              ; 31 30
    BIT $3430,X          ; 3C 30 34
    BMI $8F7F            ; 30 31
    LDX $007E,Y          ; BE 7E 00
    BRK $00              ; 00 00
    BRK $BE              ; 00 BE
    ROR $3130,X          ; 7E 30 31
    BMI $8F96            ; 30 3C
    BMI $8F90            ; 30 34
    BMI $8F8E            ; 30 30
    SEI                  ; 78
    BMI $8F61            ; 30 00
    BRK $00              ; 00 00
    BRK $3E              ; 00 3E
    ASL $3161,X          ; 1E 61 31
    RTS                  ; 60
    RTS                  ; 60
    ADC $63              ; 67 63
    ADC $31              ; 63 31
    AND $00001F,X        ; 3F 1F 00 00
    BRK $00              ; 00 00
    ROR $66E7,X          ; 7E E7 66
    ROR $66              ; 66 66
    ROR $6666,X          ; 7E 66 66
    ROR $66              ; 66 66
    ROR $00E7,X          ; 7E E7 00
    BRK $00              ; 00 00
    BRK $0C              ; 00 0C
    ASL $0C0C,X          ; 1E 0C 0C
    TSB $0C0C            ; 0C 0C 0C
    TSB $0C0C            ; 0C 0C 0C
    TSB $001E            ; 0C 1E 00
    BRK $00              ; 00 00
    BRK $3C              ; 00 3C
    ASL $0C0C,X          ; 1E 0C 0C
    TSB $6C0C            ; 0C 0C 6C
    JMP ($6C6C)          ; 6C 6C 6C
    TRB $38              ; 14 38
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA $327B,X          ; BD 7B 32
    ROL $3C,X            ; 36 3C
    SEC                  ; 38
    BIT $3E38,X          ; 3C 38 3E
    BIT $B2,X            ; 34 B2
    ADC $00              ; 77 00
    BRK $00              ; 00 00
    BRK $B4              ; 00 B4
    SEI                  ; 78
    BMI $8FE8            ; 30 30
    BMI $8FEA            ; 30 30
    BMI $8FEC            ; 30 30
    BMI $8FEF            ; 30 31
    ROR $003E,X          ; 7E 3E 00
    BRK $00              ; 00 00
    BRK $61              ; 00 61
    SBC $77              ; E3 77
    ADC $77              ; 63 77
    ADC $7F              ; 77 7F
    TCD                  ; 5B
    PHK                  ; 4B
    TCD                  ; 5B
    STP                  ; DB
    EOR $00              ; 43 00
    BRK $00              ; 00 00
    BRK $43              ; 00 43
    SEP #$62             ; E2 62
    ADC $52              ; 72 52
    PLY                  ; 7A
    LSR                  ; 4A
    LSR $4E46,X          ; 5E 46 4E
    SEP #$46             ; E2 46
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROL                  ; 2A
    TRB $2277            ; 1C 77 22
    ADC $63              ; 63 63
    ADC $63              ; 63 63
    ADC $22              ; 77 22
    ROL                  ; 2A
    TRB $0000            ; 1C 00 00
    BRK $00              ; 00 00
    TSX                  ; BA
    JMP ($3332,X)        ; 7C 32 33
    AND $33              ; 32 33
    DEC                  ; 3A
    BIT $3030,X          ; 3C 30 30
    SEI                  ; 78
    BMI $9001            ; 30 00
    BRK $00              ; 00 00
    BRK $2A              ; 00 2A
    TRB $2277            ; 1C 77 22
    ADC $63              ; 63 63
    ADC $63              ; 63 63
    ADC $1B2E2E,X        ; 7F 2E 2E 1B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDX $327C,Y          ; BE 7C 32
    AND $36              ; 33 36
    AND $3A              ; 33 3A
    BIT $3636,X          ; 3C 36 36
    ROL $73,X            ; 36 73
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROL $1E,X            ; 36 1E
    AND $61              ; 33 61
    TRB $0F38            ; 1C 38 0F
    ASL $4366            ; 0E 66 43
    AND $00003E,X        ; 3F 3E 00 00
    BRK $00              ; 00 00
    SBC $18997E,X        ; FF 7E 99 18
    CLC                  ; 18
    CLC                  ; 18
    CLC                  ; 18
    CLC                  ; 18
    CLC                  ; 18
    CLC                  ; 18
    BIT $0018,X          ; 3C 18 00
    BRK $00              ; 00 00
    BRK $FB              ; 00 FB
    INC $62,X            ; F6 62
    PER $6262            ; 62 62 62
    PER $3462            ; 62 62 34
    PER $3C18            ; 62 18 3C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $F7              ; E3 F7
    ADC $62              ; 63 62
    ROR $34              ; 66 34
    BIT $3C34,X          ; 3C 34 3C
    CLC                  ; 18
    BPL $9078            ; 10 18
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CLC                  ; 18
    BIT $6664,X          ; 3C 64 66
    BIT $7C38,X          ; 3C 38 7C
    CLI                  ; 58
    CPY $F6CE            ; CC CE F6
    ROR                  ; 6A
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $E3,X            ; F5 E3
    ROL $72              ; 26 72
    TRB $3C              ; 14 3C
    SEC                  ; 38
    CLC                  ; 18
    ROR $2C,X            ; 76 2C
    RTL                  ; 6B
    DEC $00              ; C6 00
    BRK $00              ; 00 00
    BRK $DF              ; 00 DF
    SBC $E2              ; E7 E2
    ROR $6C              ; 66 6C
    BIT $38,X            ; 34 38
    CLC                  ; 18
    CLC                  ; 18
    CLC                  ; 18
    BIT $0018,X          ; 3C 18 00
    BRK $00              ; 00 00
    BRK $7E              ; 00 7E
    AND $18464C,X        ; 3F 4C 46 18
    TSB $1830            ; 0C 30 18
    RTS                  ; 60
    AND $FE              ; 31 FE
    ADC $000000,X        ; 7F 00 00 00
    BRK $C8              ; 00 C8
    CPY $66              ; C4 66
    CPY $6C6E            ; CC 6E 6C
    ADC $3F              ; 77 3F
    AND $33              ; 37 33
    AND $23              ; 32 23
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BEQ $90FE            ; F0 48
    JMP $D8D8            ; DC D8 D8
    LDY $A4AE,X          ; BC AE A4
    LDY $C77E,X          ; BC 7E C7
    LSR $00              ; 46 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $1C              ; 00 1C
    PHP                  ; 08
    TRB $1C08            ; 1C 08 1C
    PHP                  ; 08
    PHP                  ; 08
    PHP                  ; 08
    PHP                  ; 08
    BRK $1C              ; 00 1C
    PHP                  ; 08
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    CMP $C8              ; C5 C8
    ADC #$CD             ; 69 CD
    EOR $3F777D          ; 4F 7D 77 3F
    AND $32              ; 37 32
    AND $22              ; 31 22
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TAX                  ; AA
    STZ $A2F7            ; 9C F7 A2
    SBC $63              ; E3 63
    ADC $63              ; 63 63
    ADC $22              ; 77 22
    ROL                  ; 2A
    TRB $0000            ; 1C 00 00
    BRK $00              ; 00 00
    CMP $4E,X            ; D5 4E
    XCE                  ; FB
    CMP $F1              ; D1 F1
    LDA $B1              ; B1 B1
    LDA $BB              ; B1 BB
    ORA $95              ; 11 95
    ASL $0000            ; 0E 00 00
    BRK $00              ; 00 00
    LDX $B27C,Y          ; BE 7C B2
    AND $B6              ; 33 B6
    LDA $BA              ; B3 BA
    LDY $36B6,X          ; BC B6 36
    ROL $73,X            ; 36 73
    BRK $00              ; 00 00
    ROR $C33C,X          ; 7E 3C C3
    WDM $BD              ; 42 BD
    STA $A1A1,Y          ; 99 A1 A1
    LDA $C399,X          ; BD 99 C3
    WDM $7E              ; 42 7E
    BIT $0000,X          ; 3C 00 00
    BRK $00              ; 00 00
    AND $0D1F            ; 2D 1F 0D
    ORA $0D0D            ; 0D 0D 0D
    ORA $0D0D            ; 0D 0D 0D
    ORA $1F2D            ; 0D 2D 1F
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDY $F8,X            ; B4 F8
    BCS $9128            ; B0 B0
    ; Skipped 32 bytes of data
    TYA                  ; 98
    TYA                  ; 98
    TYA                  ; 98
    TYA                  ; 98
    TYA                  ; 98
    TYA                  ; 98
    TXS                  ; 9A
    JSR ($0000,X)        ; FC 00 00
    BRK $00              ; 00 00
    AND $0C1E            ; 2D 1E 0C
    TSB $0C0C            ; 0C 0C 0C
    TSB $0C0C            ; 0C 0C 0C
    TSB $1E2D            ; 0C 2D 1E
    ORA $03              ; 03 03
    ; Skipped 32 bytes of data
    ROL $AFC1,X          ; 3E C1 AF
    BNE $9205            ; D0 2E
    CMP $3E              ; D1 3E
    CMP $AE              ; C1 AE
    CMP $2E              ; D1 2E
    CMP $AE              ; D1 AE
    CMP $01              ; D1 01
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $09              ; 00 09
    BRK $01              ; 00 01
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    BRK $81              ; 00 81
    BRK $89              ; 00 89
    BRK $98              ; 00 98
    BRK $1B              ; 00 1B
    BRK $0A              ; 00 0A
    ORA $6E              ; 11 6E
    ORA $67              ; 11 67
    CLC                  ; 18
    SBC $1A              ; E5 1A

;==============================================================================
; GeneralPurpose_12
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_12:
    SBC $669F3C,X        ; FF 3C 9F 66 | Unknown operation
    AND $00FFCF,X        ; 3F CF FF 00 | Logical AND with accumulator
    ASL $01F1            ; 0E F1 01 | Arithmetic shift left
    INC $FF00,X          ; FE 00 FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    CPY #$3F             ; C0 3F | Unknown operation
    BEQ $9265            ; F0 4F | Branch if equal (zero flag set)
    JSR ($7F03,X)        ; FC 03 7F | Call local function
    BRA $91DA            ; 80 BF | Unknown operation
    JMP $F10F            ; 4C 0F F1 | Unknown operation
    ORA $FC03F0          ; 0F F0 03 FC | Logical OR with accumulator
    ORA $FC              ; 03 FC | Logical OR with accumulator
    ORA $E21FF1          ; 0F F1 1F E2 | Logical OR with accumulator
    JSR ($FE03,X)        ; FC 03 FE | Call local function
    ORA $F0FF,Y          ; 19 FF F0 | Logical OR with accumulator
    SBC $F0FFF3,X        ; FF F3 FF F0 | Unknown operation
    SBC $03FCF0,X        ; FF F0 FC 03 | Unknown operation
    ORA $F8              ; 07 F8 | Logical OR with accumulator
    ASL $18F1            ; 0E F1 18 | Arithmetic shift left
    SBC $F0              ; E7 F0 | Unknown operation
    ORA $033FC0          ; 0F C0 3F 03 | Logical OR with accumulator
    ORA $03              ; 03 03 | Logical OR with accumulator
    ORA $01              ; 03 01 | Logical OR with accumulator
    ORA $03              ; 01 03 | Logical OR with accumulator
    ORA $01              ; 03 01 | Logical OR with accumulator
    ORA $03              ; 01 03 | Logical OR with accumulator
    ORA $03              ; 03 03 | Logical OR with accumulator
    ORA $03              ; 03 03 | Logical OR with accumulator
    ORA $2E              ; 03 2E | Logical OR with accumulator
    CMP $AE              ; D1 AE | Compare with accumulator
    CMP $AE              ; D1 AE | Compare with accumulator
    CMP $86              ; D1 86 | Compare with accumulator
    SBC $D9A6,Y          ; F9 A6 D9 | Unknown operation
    STX $F9,Y            ; 96 F9 | Store X register
    STZ $96F1,X          ; 9E F1 96 | Unknown operation
    SBC $0000,Y          ; F9 00 00 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    ORA $17              ; 17 17 | Logical OR with accumulator
    EOR $BFB95F,X        ; 5F 5F B9 BF | Unknown operation
    ROR $AE71            ; 6E 71 AE | Unknown operation
    CMP $91              ; D1 91 | Compare with accumulator
    SBC $190019,X        ; FF 19 00 19 | Unknown operation
    BRK $35              ; 00 35 | Software interrupt
    PHP                  ; 08 | Push processor status to stack
    AND $18              ; 27 18 | Logical AND with accumulator
    AND $1A2518          ; 2F 18 25 1A | Logical AND with accumulator
    BIT $0B,X            ; 34 0B | Unknown operation

    BIT $0B,X            ; 34 0B
    ROL $E501,X          ; 3E 01 E5
    INC                  ; 1A
    SBC $BC02,X          ; FD 02 BC
    EOR $AC              ; 43 AC
    EOR $82              ; 53 82
    ADC $1B7F92,X        ; 7F 92 7F 1B
    SBC $00FF1F,X        ; FF 1F FF 00
    SBC $03FF00,X        ; FF 00 FF 03
    JSR ($708F,X)        ; FC 8F 70
    SBC $D8FF82,X        ; FF 82 FF D8
    SED                  ; F8
    SBC $F0              ; E7 F0
    STA $7CC33C          ; 8F 3C C3 7C
    STA $F0              ; 83 F0
    ORA $3E67F8          ; 0F F8 67 3E
    CMP $1F              ; C1 1F
    SBC $03              ; E1 03
    JSR ($F807,X)        ; FC 07 F8
    SED                  ; F8
    ORA $00              ; 07 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $C3FC03,X        ; FF 03 FC C3
    LDY $3FFF,X          ; BC FF 3F
    SBC $0FF00F,X        ; FF 0F F0 0F
    SBC $6C              ; F3 6C
    SBC $30FF30,X        ; FF 30 FF 30
    SBC $0C              ; F3 0C
    CMP $BC              ; C3 BC
    JSR ($F003,X)        ; FC 03 F0
    CMP $010101          ; CF 01 01 01
    ORA $03              ; 01 03
    ORA $03              ; 03 03
    ORA $01              ; 03 01
    ORA $03              ; 01 03
    ORA $01              ; 03 01
    ORA $01              ; 01 01
    ORA $94              ; 01 94
    XCE                  ; FB
    LDY $B7F3,X          ; BC F3 B7
    PLX                  ; FA
    LDX $FB,Y            ; B6 FB
    LDA $FF              ; B2 FF
    TSX                  ; BA
    SBC $B3              ; F7 B3
    SBC $3CDFD3,X        ; FF D3 DF 3C
    ORA $1C              ; 03 1C
    ORA $1C              ; 03 1C
    ORA $18              ; 03 18
    ORA $18              ; 07 18
    ORA $30              ; 07 30
    ORA $710F30          ; 0F 30 0F 71
    ORA $9FFF8F          ; 0F 8F FF 9F
    SBC $FFFF5F,X        ; FF 5F FF FF
    SBC $FFFFBF,X        ; FF BF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $E03FC0,X        ; FF C0 3F E0
    ORA $00FF00,X        ; 1F 00 FF 00
    SBC $F00FF0,X        ; FF F0 0F F0
    CMP $3EE33C          ; CF 3C E3 3E
    CMP $01              ; C1 01
    INC $FE01,X          ; FE 01 FE
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FC              ; 03 FC
    ORA $728FE0,X        ; 1F E0 8F 72
    CMP $3C              ; C3 3C
    SBC $1C              ; E3 1C
    ADC $986780,X        ; 7F 80 67 98
    CPY #$3F             ; C0 3F
    BRA $93BD            ; 80 7F
    STA $7E              ; 81 7E
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BNE $9377            ; D0 2F
    SBC $0CFF0C,X        ; FF 0C FF 0C
    BEQ $935D            ; F0 0F
    BEQ $935F            ; F0 0F
    ORA $01              ; 01 01
    ORA $01              ; 01 01
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ASL $0F01,X          ; 1E 01 0F
    BRK $07              ; 00 07
    BRK $01              ; 00 01
    BRK $FF              ; 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $1FFF7F,X        ; FF 7F FF 1F
    SBC $F07F81,X        ; FF 81 7F F0
    ORA $0F10EF          ; 0F EF 10 0F
    INC $0F,X            ; F6 0F
    BEQ $93D3            ; F0 3E
    CMP $3C              ; C1 3C
    CMP $F0              ; C3 F0
    ORA $C0CFF0,X        ; 1F F0 CF C0
    AND $FF1FE0,X        ; 3F E0 1F FF
    ASL $FF              ; 06 FF
    SBC $FF3CFF          ; EF FF 3C FF
    ROL $F00F,X          ; 3E 0F F0
    TRB $3CE3            ; 1C E3 3C
    CMP $38              ; C3 38
    CMP $C7              ; C7 C7
    SEC                  ; 38
    INC $FC01,X          ; FE 01 FC
    ADC $FC              ; 63 FC
    ORA $0F              ; 07 0F
    BEQ $93CA            ; F0 0F
    BEQ $93C0            ; F0 03
    JSR ($FC03,X)        ; FC 03 FC
    BIT $3CE3,X          ; 3C E3 3C
    CMP $3F              ; C3 3F
    DEC $807F            ; CE 7F 80
    BEQ $93D9            ; F0 0F
    CPY #$3F             ; C0 3F
    BEQ $93DD            ; F0 0F
    SED                  ; F8
    ORA $06              ; 07 06
    ASL $4E              ; 06 4E
    LSR $4646            ; 4E 46 46
    ORA $05              ; 05 05
    WDM $42              ; 42 42
    ASL $06              ; 06 06
    TSB $04              ; 04 04
    ORA $01              ; 01 01
    BIT $8F03,X          ; 3C 03 8F
    BRK $A1              ; 00 A1
    LSR $05              ; 46 05
    COP $02              ; 02 02
    BRK $34              ; 00 34
    PHP                  ; 08
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    EOR $45              ; 45 45
    TSB $04              ; 04 04
    TSB $04              ; 04 04
    ORA $01              ; 01 01
    ORA $05              ; 05 05
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    ORA $01              ; 01 01

;==============================================================================
; GeneralPurpose_14
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_14:
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    EOR $41              ; 41 41 | Unknown operation
    AND $20              ; 21 20 | Logical AND with accumulator
    EOR $40              ; 43 40 | Unknown operation
    LDX $A1              ; A6 A1 | Load X register
    ROR $8069            ; 6E 69 80 | Unknown operation
    BRA $9453            ; 80 40 | Unknown operation
    RTI                  ; 40 | Unknown operation
    LDY #$A0             ; A0 A0 | Load Y register
    BVC $9468            ; 50 50 | Unknown operation
    RTS                  ; 60 | Return from local function
    CPX #$31             ; E0 31 | Unknown operation
    SBC $13              ; F1 13 | Unknown operation
    SBC $D3              ; F3 D3 | Unknown operation
    SBC $FB              ; F3 FB | Unknown operation
    SBC $FFE4,X          ; FD E4 FF | Unknown operation
    NOP                  ; EA | Unknown operation
    SBC $EAFFE4,X        ; FF E4 FF EA | Unknown operation
    SBC $E2FFE4,X        ; FF E4 FF E2 | Unknown operation
    SBC $B2FFE8,X        ; FF E8 FF B2 | Unknown operation
    SBC $70              ; F3 70 | Unknown operation
    SBC $F2              ; F3 F2 | Unknown operation
    SBC $F0              ; F3 F0 | Unknown operation
    SBC $F2              ; F3 F2 | Unknown operation
    SBC $F0              ; F3 F0 | Unknown operation
    SBC $F0              ; F3 F0 | Unknown operation
    SBC $F4              ; F3 F4 | Unknown operation
    SBC $E0              ; F7 E0 | Unknown operation
    SBC $E4FFE0,X        ; FF E0 FF E4 | Unknown operation
    SBC $E0FFE0,X        ; FF E0 FF E0 | Unknown operation
    SBC $E0FFE0,X        ; FF E0 FF E0 | Unknown operation
    SBC $F8FFE0,X        ; FF E0 FF F8 | Unknown operation
    XCE                  ; FB | Unknown operation
    PEA $F8F7            ; F4 F7 F8 | Push effective address
    XCE                  ; FB | Unknown operation
    PEA $E8F7            ; F4 F7 E8 | Push effective address
    XCE                  ; FB | Unknown operation
    PEA $ECF7            ; F4 F7 EC | Push effective address
    SBC $E0FFFC,X        ; FF FC FF E0 | Unknown operation
    SBC $E0FFE0,X        ; FF E0 FF E0 | Unknown operation
    SBC $E0FFE0,X        ; FF E0 FF E0 | Unknown operation
    SBC $E0FFE0,X        ; FF E0 FF E0 | Unknown operation
    SBC $ECFFE0,X        ; FF E0 FF EC | Unknown operation
    SBC $ECFFFC,X        ; FF FC FF EC | Unknown operation
    SBC $ECFFFC,X        ; FF FC FF EC | Unknown operation
    SBC $ECFFDC,X        ; FF DC FF EC | Unknown operation
    SBC $E0FFDC,X        ; FF DC FF E0 | Unknown operation

    SBC $E0FFDC,X        ; FF DC FF E0
    SBC $CFFCE3,X        ; FF E3 FC CF
    BEQ $9426            ; F0 9F
    CPX #$9F             ; E0 9F
    CPX #$1F             ; E0 1F
    CPX #$1F             ; E0 1F
    CPX #$1F             ; E0 1F
    CPX #$FC             ; E0 FC
    SBC $00FF0C,X        ; FF 0C FF 00
    SBC $02BF40,X        ; FF 40 BF 02
    SBC $ED12,X          ; FD 12 ED
    ORA $FC              ; 03 FC
    EOR $BC              ; 43 BC
    EOR $E01FA0,X        ; 5F A0 1F E0
    EOR $807FA0,X        ; 5F A0 7F 80
    LDA $E0DFC0,X        ; BF C0 DF E0
    SBC $F8              ; E7 F8
    SED                  ; F8
    SBC $17F40B,X        ; FF 0B F4 17
    INX                  ; E8
    LSR $B6B1            ; 4E B1 B6
    EOR #$5D             ; 49 5D
    LDA $FB              ; A3 FB
    ORA $E6              ; 07 E6
    ORA $00FF1D,X        ; 1F 1D FF 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $05              ; 01 05
    ORA $16              ; 05 16
    ORA $36              ; 17 36
    AND $6C              ; 37 6C
    ADC $007E6D,X        ; 7F 6D 7E 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BPL $950F            ; 10 34
    BIT $6C,X            ; 34 6C
    JMP ($6E5A,X)        ; 7C 5A 6E
    ORA $03              ; 03 03
    ASL $1C0F            ; 0E 0F 1C
    ORA $3C1F18,X        ; 1F 18 1F 3C
    AND $263F3C,X        ; 3F 3C 3F 26
    AND $007F62,X        ; 3F 62 7F 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $0E              ; 00 0E
    BRK $3F              ; 00 3F
    BRK $7F              ; 00 7F
    BRK $0E              ; 00 0E
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ADC $000000,X        ; 7F 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $04              ; 00 04
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $C5              ; 00 C5
    INC $ECD3,X          ; FE D3 EC
    TYX                  ; BB
    CPY $BB              ; C4 BB
    CPY $B1              ; C4 B1
    DEC $CFB0            ; CE B0 CF
    STA $FC              ; 83 FC
    INY                  ; C8
    SBC $C3              ; F7 C3
    SBC $B5EF91,X        ; FF 91 EF B5
    WAI                  ; CB
    LDA $BDC3,X          ; BD C3 BD
    CMP $99              ; C3 99
    SBC $5A              ; E7 5A
    ROR $3C              ; 66 3C
    BIT $7F63,X          ; 3C 63 7F
    ADC $7F677F,X        ; 7F 7F 67 7F
    ADC $617F,X          ; 7D 7F 61
    ADC $7F7F63,X        ; 7F 63 7F 7F
    ADC $007F73,X        ; 7F 73 7F 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $DF              ; 01 DF
    BRK $63              ; 00 63
    STZ $FE01            ; 9C 01 FE
    BRK $FF              ; 00 FF
    SEC                  ; 38
    CMP $79              ; C7 79
    STX $0C              ; 86 0C
    BEQ $9618            ; F0 65
    TYA                  ; 98
    SBC $E600,Y          ; F9 00 E6
    BRK $CE              ; 00 CE
    BRK $40              ; 00 40
    BRA $953D            ; 80 80
    BRK $98              ; 00 98
    BRK $E0              ; 00 E0
    BRK $F0              ; 00 F0
    BRK $F0              ; 00 F0
    BRK $E0              ; 00 E0
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $000000          ; 0F 00 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ADC $030000,X        ; 7F 00 00 03
    ORA $0F              ; 03 0F
    ORA $1F1D1F          ; 0F 1F 1D 1F
    ORA $393F,Y          ; 19 3F 39
    AND $313F3F,X        ; 3F 3F 3F 31
    ORA $1F1F0F          ; 0F 0F 1F 1F
    TSC                  ; 3B
    AND $3937,X          ; 3D 37 39
    AND $3F3F31,X        ; 3F 31 3F 3F
    ROL $363E,X          ; 3E 3E 36
    SEC                  ; 38
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 03 00
    ASL $0801            ; 0E 01 08
    ORA $33              ; 07 33
    ORA $541F67          ; 0F 67 1F 54
    AND $463FC0,X        ; 3F C0 3F 46
    AND $18E7,Y          ; 39 E7 18
    ORA $F807F0          ; 0F F0 07 F8
    STA $FC              ; 83 FC
    SBC $FC              ; F3 FC
    SBC $67FE,Y          ; F9 FE 67
    TYA                  ; 98
    STA $7C              ; 83 7C
    BRA $96D5            ; 80 7F
    STP                  ; DB
    BIT $F7              ; 24 F7
    PHP                  ; 08
    SBC $0C              ; F3 0C
    INC $8000,X          ; FE 00 80
    BRK $46              ; 00 46
    SEC                  ; 38
    STA $7F62,X          ; 9D 62 7F
    BRA $9666            ; 80 FF
    BRK $78              ; 00 78
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $37              ; 00 37
    AND $3937,Y          ; 39 37 39
    AND $3F              ; 31 3F
    AND $39373F,X        ; 3F 3F 37 39
    AND $39              ; 37 39
    AND $3F              ; 31 3F
    AND $0F0A3F,X        ; 3F 3F 0A 0F
    ORA $171A,X          ; 1D 1A 17
    CLC                  ; 18
    ORA $18              ; 17 18
    ORA $1C              ; 13 1C
    ORA #$0E             ; 09 0E
    BIT $37,X            ; 34 37
    TSC                  ; 3B
    BIT $3937,X          ; 3C 37 39
    AND $39373F,X        ; 3F 3F 37 39
    AND $3F              ; 31 3F
    AND $3F              ; 31 3F
    AND $3F3F3F,X        ; 3F 3F 3F 3F
    BRK $00              ; 00 00
    AND $39              ; 37 39
    AND $39              ; 37 39
    AND $3F              ; 31 3F
    AND $1F1F3F,X        ; 3F 3F 1F 1F
    ADC $7F              ; 61 7F
    ADC $00007F,X        ; 7F 7F 00 00
    AND $39              ; 37 39
    AND $39373F,X        ; 3F 3F 37 39
    AND $3F              ; 31 3F
    AND $3F              ; 31 3F
    ADC $7F7F7F,X        ; 7F 7F 7F 7F
    RTS                  ; 60
    ADC $5E3F78,X        ; 7F 78 3F 5E
    AND $1877,Y          ; 39 77 18
    AND $011E10          ; 2F 10 1E 01
    ORA $00              ; 07 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SEC                  ; 38
    SBC $02FE11,X        ; FF 11 FE 02
    JSR ($F00E,X)        ; FC 0E F0
    SED                  ; F8
    BRK $C0              ; 00 C0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRK $20              ; 00 20
    BRK $70              ; 00 70
    BRK $60              ; 00 60
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ASL                  ; 0A
    TRB $14              ; 14 14
    ASL                  ; 0A
    ASL                  ; 0A
    BRK $00              ; 00 00
    INC $E6              ; E6 E6
    LDA $DAFF,X          ; BD FF DA
    SBC $C0FBA4,X        ; FF A4 FB C0
    SBC $D0FFE0,X        ; FF E0 FF D0
    SBC $737F60,X        ; FF 60 7F 73
    ADC $AE              ; 73 AE
    SBC $00FF95,X        ; FF 95 FF 00
    SBC $036996,X        ; FF 96 69 03
    JSR ($DA25,X)        ; FC 25 DA
    COP $FD              ; 02 FD
    AND $39              ; 37 39
    AND $39              ; 37 39
    ORA $07              ; 05 07
    ORA $03              ; 03 03
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA $FC              ; A3 FC
    PEI $FF              ; D4 FF
    ROR                  ; 6A
    ADC $57BFBD,X        ; 7F BD BF 57
    EOR $2A              ; 57 2A
    ROL                  ; 2A
    ORA $15,X            ; 15 15
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BIT $F13F,X          ; 3C 3F F1
    SBC $C67F7C,X        ; FF 7C 7F C6
    SBC $3936,Y          ; F9 36 39
    SEI                  ; 78
    ADC $74FF42,X        ; 7F 42 FF 74
    TDC                  ; 7B
    BVS $9801            ; 70 7F
    PLA                  ; 68
    ADC $7E3F35,X        ; 7F 35 3F 7E
    ADC $173F3D,X        ; 7F 3D 3F 17
    ORA $1F2F2F,X        ; 1F 2F 2F 1F
    ORA $01FF00,X        ; 1F 00 FF 01
    INC $FF00,X          ; FE 00 FF
    LDY #$FF             ; A0 FF
    EOR $FF,X            ; 55 FF
    NOP                  ; EA
    SBC $FEFFB5,X        ; FF B5 FF FE
    SBC $000000,X        ; FF 00 00 00
    BRK $0A              ; 00 0A
    ASL                  ; 0A
    EOR $55,X            ; 55 55
    TAX                  ; AA
    TAX                  ; AA
    EOR $BFBA5F,X        ; 5F 5F BA BF
    STZ $7F,X            ; 74 7F
    TXA                  ; 8A
    TXA                  ; 8A
    COP $02              ; 02 02
    LDX #$A2             ; A2 A2
    WDM $42              ; 42 42
    INC $FEFE,X          ; FE FE FE
    INC $0000,X          ; FE 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    PHD                  ; 0B
    PHD                  ; 0B
    ORA $15,X            ; 15 15
    PHD                  ; 0B
    PHD                  ; 0B
    ORA $05              ; 05 05
    COP $02              ; 02 02
    ORA $05              ; 05 05
    BRK $00              ; 00 00
    COP $02              ; 02 02
    SBC $FFFFFF,X        ; FF FF FF FF
    ADC $FFFF7F,X        ; 7F 7F FF FF
    CMP $77DD,X          ; DD DD 77
    ADC $AA              ; 77 AA
    TAX                  ; AA
    EOR $55,X            ; 55 55

;==============================================================================
; GeneralPurpose_18
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_18:
    ORA $03              ; 03 03 | Logical OR with accumulator
    ORA $1F1D0F          ; 0F 0F 1D 1F | Logical OR with accumulator
    ORA $1D1B1D,X        ; 1F 1D 1B 1D | Logical OR with accumulator
    TCS                  ; 1B | Unknown operation
    ORA $1F19,X          ; 1D 19 1F | Logical OR with accumulator
    ORA $00001F,X        ; 1F 1F 00 00 | Logical OR with accumulator
    RTI                  ; 40 | Unknown operation
    RTI                  ; 40 | Unknown operation
    TAY                  ; A8 | Unknown operation
    TAY                  ; A8 | Unknown operation
    BVS $9888            ; 70 70 | Unknown operation
    LDY $F0AC            ; AC AC F0 | Load Y register
    BEQ $9816            ; F0 F9 | Branch if equal (zero flag set)
    SBC $FDE9,Y          ; F9 E9 FD | Unknown operation
    COP $02              ; 02 02 | Unknown operation
    ORA $01              ; 01 01 | Logical OR with accumulator
    COP $02              ; 02 02 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    CPY $59CC            ; CC CC 59 | Unknown operation
    EOR $BEBE,Y          ; 59 BE BE | Unknown operation
    ADC $67              ; 67 67 | Unknown operation
    TCS                  ; 1B | Unknown operation
    ORA $1D1B,X          ; 1D 1B 1D | Logical OR with accumulator
    ORA $1F1F,Y          ; 19 1F 1F | Logical OR with accumulator
    ORA $1B1D1B,X        ; 1F 1B 1D 1B | Logical OR with accumulator
    ORA $1F19,X          ; 1D 19 1F | Logical OR with accumulator
    ORA $00001F,X        ; 1F 1F 00 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ORA $03              ; 03 03 | Logical OR with accumulator
    ASL $381F,X          ; 1E 1F 38 | Arithmetic shift left
    AND $7C3F30,X        ; 3F 30 3F 7C | Logical AND with accumulator
    ADC $3C7F7E,X        ; 7F 7E 7F 3C | Unknown operation
    BIT $FFF3,X          ; 3C F3 FF | Unknown operation
    ORA $03              ; 03 03 | Logical OR with accumulator
    INC $F9              ; E6 F9 | Unknown operation
    ASL $3F09            ; 0E 09 3F | Arithmetic shift left
    AND $74FF43,X        ; 3F 43 FF 74 | Logical AND with accumulator
    TDC                  ; 7B | Unknown operation
    AND $692D            ; 2D 2D 69 | Logical AND with accumulator
    ADC #$52             ; 69 52 | Unknown operation
    EOR $76              ; 52 76 | Unknown operation
    ROR $25,X            ; 76 25 | Unknown operation
    AND $05              ; 25 05 | Logical AND with accumulator
    ORA $42              ; 05 42 | Logical OR with accumulator
    WDM $46              ; 42 46 | Unknown operation
    LSR $EC              ; 46 EC | Unknown operation
    CPX $EB2B            ; EC 2B EB | Unknown operation
    SEP #$F3             ; E2 F3 | Set processor status bits
    SBC $F1              ; F1 F1 | Unknown operation

    SBC $F1              ; F1 F1
    ADC $73              ; 73 73
    ORA $17              ; 17 17
    ROR                  ; 6A
    ROR                  ; 6A
    MVP $1B44            ; 44 44 1B
    ORA $1D1B,X          ; 1D 1B 1D
    ORA $1F1F,Y          ; 19 1F 1F
    ORA $3F3F31,X        ; 1F 31 3F 3F
    AND $001616,X        ; 3F 16 16 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $87FFE1,X        ; FF E1 FF 87
    SBC $89FFD1,X        ; FF D1 FF 89
    SBC $96FF83,X        ; FF 83 FF 96
    SBC $03FFFF,X        ; FF FF FF 03
    ORA $1F              ; 03 1F
    ORA $36F8E7,X        ; 1F E7 F8 36
    AND $7F40,Y          ; 39 40 7F
    ORA $0F0D1F,X        ; 1F 1F 0D 0F
    ORA $03              ; 03 03
    BIT $24              ; 24 24
    TSB $04              ; 04 04
    JSL $222222          ; 22 22 22 22
    BRK $00              ; 00 00
    COP $02              ; 02 02
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA $A5              ; A5 A5
    LDY $A4              ; A4 A4
    COP $02              ; 02 02
    BRL $D96B            ; 82 82 40
    RTI                  ; 40
    BRK $00              ; 00 00
    MVP $0444            ; 44 44 04
    TSB $03              ; 04 03
    ORA $05              ; 03 05
    ORA $02              ; 05 02
    COP $00              ; 02 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $9FFFC0,X        ; FF C0 FF 9F
    SBC $3FFF00,X        ; FF 00 FF 3F
    AND $3F3F3F,X        ; 3F 3F 3F 3F
    ; Skipped 32 bytes of data
    ADC $FFFFFF,X        ; 7F FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $01FFFF,X        ; FF FF FF 01
    ORA $01              ; 01 01
    ORA $01              ; 01 01
    ORA $01              ; 01 01
    ORA $03              ; 01 03
    ORA $03              ; 03 03
    ; Skipped 32 bytes of data
    ORA $1F1F1F,X        ; 1F 1F 1F 1F
    ORA $000000,X        ; 1F 00 00 00
    BRK $40              ; 00 40
    RTI                  ; 40
    INC                  ; 1A
    INC                  ; 1A
    RTI                  ; 40
    RTI                  ; 40
    BVC $99DC            ; 50 50
    EOR $51515F,X        ; 5F 5F 51 51
    LSR $025E,X          ; 5E 5E 02
    COP $1E              ; 02 1E
    ASL $FEF2,X          ; 1E F2 FE
    ASL $06              ; 06 06
    LDX $E8BE,Y          ; BE BE E8
    INC $7F7F,X          ; FE 7F 7F
    ADC $3C3C7F,X        ; 7F 7F 3C 3C
    BRK $00              ; 00 00
    BMI $99D8            ; 30 30
    ORA $07              ; 07 07
    BIT $E13F,X          ; 3C 3F E1
    INC $F08F,X          ; FE 8F F0
    RTS                  ; 60
    RTS                  ; 60
    JSR ($0FFC,X)        ; FC FC 0F
    ORA $83FFF8          ; 0F F8 FF 83
    JSR ($C03F,X)        ; FC 3F C0
    SBC $00FF00,X        ; FF 00 FF 00
    CPY #$C0             ; C0 C0
    ORA $FFE01F,X        ; 1F 1F E0 FF
    ORA $00FFF0          ; 0F F0 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $000000,X        ; FF 00 00 00
    SBC $FF00FF,X        ; FF FF 00 FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $03              ; 03 03
    ASL $07              ; 06 07
    ASL $180F            ; 0E 0F 18
    ORA $673C33,X        ; 1F 33 3C 67
    SEI                  ; 78
    CMP $E09FF0          ; CF F0 9F E0
    AND $807FC0,X        ; 3F C0 7F 80
    AND $00FFC0,X        ; 3F C0 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    STA $1D9D,X          ; 9D 9D 1D
    ORA $0808,X          ; 1D 08 08
    PHP                  ; 08
    PHP                  ; 08
    PHP                  ; 08
    PHP                  ; 08
    TCS                  ; 1B
    TCS                  ; 1B
    ORA $0C0C1F,X        ; 1F 1F 0C 0C
    SBC $7F7FFF,X        ; FF FF 7F 7F
    ADC $FFFF7F,X        ; 7F 7F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    ORA $03              ; 03 03
    ORA $03              ; 03 03
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SED                  ; F8
    SBC $7FF887,X        ; FF 87 F8 7F
    BRA $9A9E            ; 80 FF
    BRK $FF              ; 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $1FFFC0,X        ; FF C0 FF 1F
    CPX #$FF             ; E0 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $80FFFF,X        ; FF FF FF 80
    SBC $FF807F,X        ; FF 7F 80 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSB $4302            ; 0C 02 43
    PHD                  ; 0B
    STA $1E1F0F          ; 8F 0F 1F 1E
    AND $2C7E37,X        ; 3F 37 7E 2C
    ADC $030303,X        ; 7F 03 03 03
    ORA $07              ; 03 07
    ORA $07              ; 07 07
    ; Skipped 32 bytes of data
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $20              ; 00 20
    JSR $6060            ; 20 60 60
    CPX #$E0             ; E0 E0
    TAY                  ; A8
    INX                  ; E8
    TAY                  ; A8
    INX                  ; E8
    DEC                  ; 3A
    PLX                  ; FA
    ASL $8FFE,X          ; 1E FE 8F
    SBC $7BFE6D,X        ; FF 6D FE 7B
    JSR ($FCF3,X)        ; FC F3 FC
    SBC $FA,X            ; F5 FA
    SBC $F8              ; F7 F8
    JSR $23FF            ; 20 FF 23
    JSR ($FFC0,X)        ; FC C0 FF
    ASL $0D0F            ; 0E 0F 0D
    ASL $0E0D            ; 0E 0D 0E
    TCS                  ; 1B
    TRB $1C1B            ; 1C 1B 1C
    ORA $18              ; 17 18
    ORA $18              ; 17 18
    ORA $18              ; 17 18
    STZ $84EF,X          ; 9E EF 84
    SBC $4AEFD0,X        ; FF D0 EF 4A
    ADC $E9,X            ; 75 E9
    INC $71,X            ; F6 71
    INC $FFFC,X          ; FE FC FF
    LDA $FF              ; B7 FF
    XBA                  ; EB
    XBA                  ; EB
    LDA $3CFF,X          ; BD FF 3C
    SBC $03BD5A,X        ; FF 5A BD 03
    JSR ($48B7,X)        ; FC B7 48
    ADC $FFF2            ; 6D F2 FF
    SBC $733F39,X        ; FF 39 3F 73
    ADC $09              ; 73 09
    ORA #$07             ; 09 07
    ORA $00              ; 07 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $2D              ; 00 2D
    SBC $F3FFC3,X        ; FF C3 FF F3
    SBC $1C              ; F3 1C
    TRB $E2E2            ; 1C E2 E2
    CLC                  ; 18
    CLC                  ; 18
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    LDA $000F00,X        ; BF 00 0F 00
    SBC $0FF000,X        ; FF 00 F0 0F
    SBC $000000,X        ; FF 00 00 00
    ORA $00FF00          ; 0F 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $00FF00,X        ; FF 00 FF 00
    JSR ($FF03,X)        ; FC 03 FF
    BRK $00              ; 00 00
    SBC $0000FF,X        ; FF FF 00 00
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $00              ; 00 00
    SBC $C0FF00,X        ; FF 00 FF C0
    AND $00FF00,X        ; 3F 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $0000FF,X        ; FF FF 00 00
    SBC $00FF0F,X        ; FF 0F FF 00
    SBC $FFFF0F,X        ; FF 0F FF FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFFC3,X        ; FF C3 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $3FFFFF,X        ; FF FF FF 3F
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FCFFFF,X        ; FF FF FF FC
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FF00FF,X        ; FF FF 00 FF
    BRK $00              ; 00 00
    SBC $00FC03,X        ; FF 03 FC 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    BRK $FF              ; 00 FF
    BRK $1F              ; 00 1F
    CPX #$FF             ; E0 FF
    BRK $00              ; 00 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $0FFFFF,X        ; FF FF FF 0F
    BRK $FF              ; 00 FF
    BRK $80              ; 00 80
    ADC $0007F8,X        ; 7F F8 07 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF7F,X        ; FF 7F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $FF              ; 00 FF
    BRK $07              ; 00 07
    SED                  ; F8
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    CPX #$FF             ; E0 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00FF00          ; 0F 00 FF 00
    ORA $000100          ; 0F 00 01 00
    BRK $00              ; 00 00
    ASL $0000            ; 0E 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $FF01FE,X        ; FF FE 01 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $FCFF00,X        ; FF 00 FF FC
    ORA $00              ; 03 00
    SBC $0000FF,X        ; FF FF 00 00
    BRK $00              ; 00 00
    SBC $010FF0,X        ; FF F0 0F 01
    SBC $00FF0F,X        ; FF 0F FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $0F              ; 00 0F
    BRK $00              ; 00 00
    SBC $C0FF00,X        ; FF 00 FF C0
    SBC $00FFFC,X        ; FF FC FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $FFFF03,X        ; FF 03 FF FF
    SBC $00FF0F,X        ; FF 0F FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $0F0FF0,X        ; FF F0 0F 0F
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $FFFFF0,X        ; FF F0 FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $FEFF00,X        ; FF 00 FF FE
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $00FF1F,X        ; FF 1F FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF7F,X        ; FF 7F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FFFF,X        ; FF FF FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $FF0FF0,X        ; FF F0 0F FF
    BRK $00              ; 00 00
    BRK $07              ; 00 07
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $3F00FF,X        ; FF FF 00 3F
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $C0FF00,X        ; FF 00 FF C0
    AND $FF00FF,X        ; 3F FF 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $3FFFFF,X        ; FF FF FF 3F
    SBC $00FF0F,X        ; FF 0F FF 00
    SBC $FF0FF0,X        ; FF F0 0F FF
    BRK $C0              ; 00 C0
    AND $FFFFFF,X        ; 3F FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $00FF0F,X        ; FF 0F FF 00
    SBC $03FF00,X        ; FF 00 FF 03
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $00FF1F,X        ; FF 1F FF 00
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FE              ; 00 FE
    ORA $0F              ; 01 0F
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $0F              ; 00 0F
    BRK $FE              ; 00 FE
    ORA $F0              ; 01 F0
    ORA $FFFF00          ; 0F 00 FF FF
    BRK $00              ; 00 00
    BRK $C0              ; 00 C0
    AND $F0FF03,X        ; 3F 03 FF F0
    ORA $00FF00          ; 0F 00 FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $0FFF00,X        ; FF 00 FF 0F
    SBC $F0FF00,X        ; FF 00 FF F0
    ORA $FF00FF          ; 0F FF 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFF0F,X        ; FF 0F FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $FF07F8,X        ; FF F8 07 FF
    SBC $F0FFFF,X        ; FF FF FF F0
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFE,X        ; FF FE FF FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $07              ; 00 07
    SED                  ; F8
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $FF00FF,X        ; FF FF 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $00FF00,X        ; FF 00 FF 00
    ORA $00FFE0,X        ; 1F E0 FF 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $000F00,X        ; FF 00 0F 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $0FF000,X        ; FF 00 F0 0F
    BRK $FF              ; 00 FF
    CPY #$3F             ; C0 3F
    SBC $00FF00,X        ; FF 00 FF 00
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    SBC $FC0300,X        ; FF 00 03 FC
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $00F000,X        ; FF 00 F0 00
    BRK $00              ; 00 00
    BEQ $9F92            ; F0 00
    SBC $FF0000,X        ; FF 00 00 FF
    SBC $F00F00,X        ; FF 00 0F F0
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BEQ $9FA4            ; F0 00
    SBC $00FF00,X        ; FF 00 FF 00
    JSR ($FF00,X)        ; FC 00 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $F0              ; 00 F0
    BRK $FF              ; 00 FF
    BRK $0F              ; 00 0F
    BEQ $A022            ; F0 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $FF              ; 07 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $0F              ; 00 0F
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $00FF0F,X        ; FF 0F FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $00FFF0,X        ; FF F0 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $0000FF,X        ; FF FF 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $0FFC03,X        ; FF 03 FC 0F
    BEQ $A09A            ; F0 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $3FFF00,X        ; FF 00 FF 3F
    SBC $000000,X        ; FF 00 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $000000,X        ; FF 00 00 00
    BRK $FC              ; 00 FC
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $F8FF00,X        ; FF 00 FF F8
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $FF              ; 00 FF
    BRK $07              ; 00 07
    SED                  ; F8
    SBC $FF0000,X        ; FF 00 00 FF
    BRK $FF              ; 00 FF
    SBC $FFC0FF,X        ; FF FF C0 FF
    BEQ $A172            ; F0 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    ORA $C03FF0          ; 0F F0 3F C0
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    ORA $FC              ; 03 FC
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BEQ $A196            ; F0 00
    SBC $00E000,X        ; FF 00 E0 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $000000          ; 0F 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY #$00             ; C0 00
    BRK $00              ; 00 00
    SBC $000000,X        ; FF 00 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    SBC $FF00FF,X        ; FF FF 00 FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $FF00FF,X        ; FF FF 00 FF
    STA $00FF70          ; 8F 70 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_22
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_22:
    BEQ $A201            ; F0 FF | Branch if equal (zero flag set)
    AND $00FFC0,X        ; 3F C0 FF 00 | Logical AND with accumulator
    SBC $00F000,X        ; FF 00 F0 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    SBC $00F000,X        ; FF 00 F0 00 | Unknown operation
    SBC $000000,X        ; FF 00 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    SBC $00F000,X        ; FF 00 F0 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    SBC $FFF0FF,X        ; FF FF F0 FF | Unknown operation
    SBC $FFE0FF,X        ; FF FF E0 FF | Unknown operation
    SBC $FF80FF,X        ; FF FF 80 FF | Unknown operation
    JSR ($FFFF,X)        ; FC FF FF | Call local function
    SBC $00FFFF,X        ; FF FF FF 00 | Unknown operation
    SBC $00FFE0,X        ; FF E0 FF 00 | Unknown operation
    SBC $0FFFF0,X        ; FF F0 FF 0F | Unknown operation
    BEQ $A263            ; F0 00 | Branch if equal (zero flag set)
    SBC $F8FF00,X        ; FF 00 FF F8 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $1F00FF,X        ; FF FF 00 1F | Unknown operation
    CPX #$7F             ; E0 7F | Unknown operation
    BRA $A277            ; 80 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $FF00FF,X        ; FF FF 00 FF | Unknown operation
    BRK $C0              ; 00 C0 | Software interrupt
    AND $00FF00,X        ; 3F 00 FF 00 | Logical AND with accumulator
    SBC $FFFF00,X        ; FF 00 FF FF | Unknown operation
    SBC $F0FF00,X        ; FF 00 FF F0 | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $7E              ; 00 7E | Software interrupt
    STA $00              ; 81 00 | Store accumulator to memory
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FFFF,X        ; FF FF FF 00 | Unknown operation
    SBC $FF0000,X        ; FF 00 00 FF | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00F00F,X        ; FF 0F F0 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    SBC $FFFF00,X        ; FF 00 FF FF | Unknown operation

    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $E0              ; 00 E0
    BRK $FF              ; 00 FF
    BRK $1F              ; 00 1F
    CPX #$FF             ; E0 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $F8              ; 00 F8
    ORA $FF              ; 07 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $000000,X        ; FF 00 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    INC $00FF,X          ; FE FF 00
    SBC $FF0000,X        ; FF 00 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BEQ $A2F6            ; F0 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $000000,X        ; FF 00 00 00
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BEQ $A31A            ; F0 00
    SBC $000000,X        ; FF 00 00 00
    BEQ $A320            ; F0 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $FF00FF,X        ; FF FF 00 FF
    BRK $FF              ; 00 FF
    SBC $FFF0FF,X        ; FF FF F0 FF
    BRK $FF              ; 00 FF
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $FF00FF,X        ; FF FF 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FE              ; 01 FE
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFF0FF,X        ; FF FF F0 FF
    BRK $FF              ; 00 FF
    ORA $807FF0          ; 0F F0 7F 80
    SBC $000000,X        ; FF 00 00 00
    SBC $FFBC00,X        ; FF 00 BC FF
    BRK $FF              ; 00 FF
    SBC $000000,X        ; FF 00 00 00
    SBC $0000,X          ; FD 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $F0FF00,X        ; FF 00 FF F0
    ORA $0000FF          ; 0F FF 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0F              ; 00 0F
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $FF              ; 00 FF
    BRK $03              ; 00 03
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    SBC $00FFFC,X        ; FF FC FF 00
    SBC $F800FF,X        ; FF FF 00 F8
    ORA $FF              ; 07 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $3FFF00,X        ; FF 00 FF 3F
    CPY #$FF             ; C0 FF
    BRK $00              ; 00 00
    SBC $FFFF00,X        ; FF 00 FF FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FF0FF0,X        ; FF F0 0F FF
    BRK $03              ; 00 03
    JSR ($00FF,X)        ; FC FF 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_24
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_24:
    BRK $FF              ; 00 FF | Software interrupt
    ORA $FF00F0          ; 0F F0 00 FF | Logical OR with accumulator
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $000000,X        ; FF 00 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SED                  ; F8 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $80              ; 00 80 | Software interrupt
    BRK $F0              ; 00 F0 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $F0              ; 00 F0 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $E0              ; 00 E0 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $E0              ; 00 E0 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $F0              ; 00 F0 | Software interrupt
    ORA $0000FF          ; 0F FF 00 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    SBC $07FF00,X        ; FF 00 FF 07 | Unknown operation
    SBC $00FFFF,X        ; FF FF FF 00 | Unknown operation
    SBC $000000,X        ; FF 00 00 00 | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $00FFFF,X        ; FF FF FF 00 | Unknown operation
    SBC $000000,X        ; FF 00 00 00 | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt

    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $FCFF00,X        ; FF 00 FF FC
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $F8              ; 00 F8
    ORA $07              ; 07 07
    SED                  ; F8
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $FF0000,X        ; FF 00 00 FF
    BRK $FF              ; 00 FF
    ORA $FC              ; 03 FC
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BEQ $A4F8            ; F0 00
    ORA $FE01F0          ; 0F F0 01 FE
    SBC $000000,X        ; FF 00 00 00

;==============================================================================
; GeneralPurpose_25
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_25:
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    CPY $0000            ; CC 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $07              ; 00 07 | Software interrupt
    SED                  ; F8 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    SBC $000000,X        ; FF 00 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    BRA $A699            ; 80 7F | Unknown operation
    INC $FF01,X          ; FE 01 FF | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    SBC $FFF00F,X        ; FF 0F F0 FF | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $0F              ; 00 0F | Software interrupt
    BRK $00              ; 00 00 | Software interrupt

    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SEC                  ; 38
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL $1A0E            ; 0E 0E 1A
    ASL $1A14,X          ; 1E 14 1A
    ASL                  ; 0A
    ASL $0000            ; 0E 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $FC              ; F3 FC
    BRA $A6D1            ; 80 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $F8              ; 07 F8
    STA $00FF70          ; 8F 70 FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $FF3FFF,X        ; FF FF 3F FF
    ORA $FF06FF,X        ; 1F FF 06 FF
    BRA $A76B            ; 80 7F
    CPX #$1F             ; E0 1F
    SBC $FC06,Y          ; F9 06 FC
    SBC $F8FFFC,X        ; FF FC FF F8
    SBC $00FFC0,X        ; FF C0 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $013CC3,X        ; FF C3 3C 01
    INC $FE01,X          ; FE 01 FE
    ORA $FE              ; 01 FE
    ORA $FE              ; 01 FE
    ORA $FC              ; 03 FC
    ORA $FC              ; 03 FC
    SBC $00FF00,X        ; FF 00 FF 00
    BRA $A712            ; 80 00
    BRA $A714            ; 80 00
    BRA $A716            ; 80 00
    BRA $A718            ; 80 00
    BRA $A71A            ; 80 00
    BRA $A71C            ; 80 00
    CPY #$00             ; C0 00
    BRA $A720            ; 80 00
    BVS $A731            ; 70 0F
    BVS $A733            ; 70 0F
    BVS $A735            ; 70 0F
    SED                  ; F8
    ORA $7F              ; 07 7F
    BRK $71              ; 00 71
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $C0              ; 00 C0
    SBC $60FFC0,X        ; FF C0 FF 60
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $C13FC0,X        ; FF C0 3F C1
    ROL $007F,X          ; 3E 7F 00
    ADC $FF7FFF,X        ; 7F FF 7F FF
    ADC $FFFFFF,X        ; 7F FF FF FF
    SEI                  ; 78
    SBC $07FF00,X        ; FF 00 FF 07
    SED                  ; F8
    SBC $FFFF00,X        ; FF 00 FF FF
    JSR ($F0FF,X)        ; FC FF F0
    SBC $00FFF0,X        ; FF F0 FF 00
    SBC $03FF00,X        ; FF 00 FF 03
    JSR ($7887,X)        ; FC 87 78
    BRA $A761            ; 80 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    CPY #$3F             ; C0 3F
    ORA $FF03FF,X        ; 1F FF 03 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $FF3FFF,X        ; FF FF 3F FF
    ORA $FF1FFF,X        ; 1F FF 1F FF
    ORA $FF0FFF,X        ; 1F FF 0F FF
    ORA $FF0FFF          ; 0F FF 0F FF
    XCE                  ; FB
    JSR ($FFF8,X)        ; FC F8 FF
    SED                  ; F8
    SBC $80FFC0,X        ; FF C0 FF 80
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $F0F00F,X        ; FF 0F F0 F0
    ORA $200FF0          ; 0F F0 0F 20
    CMP $01FF00,X        ; DF 00 FF 01
    INC $F807,X          ; FE 07 F8
    ORA $00FEF0          ; 0F F0 FE 00
    SBC $807F00,X        ; FF 00 7F 80
    BVS $A736            ; 70 80
    CPX #$00             ; E0 00
    CPY #$00             ; C0 00
    BRA $A7BC            ; 80 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SEI                  ; 78
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    ORA $05              ; 01 05
    ORA $17              ; 03 17
    ORA $000000          ; 0F 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $61              ; 00 61
    STX $FFFF            ; 8E FF FF
    SBC $0000FF,X        ; FF FF 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $0702            ; 0D 02 07
    BRK $07              ; 00 07
    BRK $07              ; 00 07
    BRK $03              ; 00 03
    BRK $00              ; 00 00
    SBC $8CFB04,X        ; FF 04 FB 8C
    ADC $F8              ; 73 F8
    ORA $F8              ; 07 F8
    ORA $F0              ; 07 F0
    ORA $F30FF0          ; 0F F0 0F F3
    TSB $FF1F            ; 0C 1F FF
    AND $FF3FFF,X        ; 3F FF 3F FF
    ORA $FF19FF,X        ; 1F FF 19 FF
    BRK $FF              ; 00 FF
    PHP                  ; 08
    SBC $FFFF0C,X        ; FF 0C FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    BRK $E0              ; 00 E0
    BRK $40              ; 00 40
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $80              ; 00 80
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $20              ; 00 20
    ORA $FF7F3F,X        ; 1F 3F 7F FF
    SBC $00FFFE,X        ; FF FE FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0F              ; 00 0F
    BRK $C8              ; 00 C8
    ORA $91              ; 07 91
    SBC $FFFF7F          ; EF 7F FF FF
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $81              ; 00 81
    BRK $86              ; 00 86
    ORA $1F              ; 01 1F
    STA $4F              ; 81 4F
    LDA $6FFF9F,X        ; BF 9F FF 6F
    ORA $DF1F6F,X        ; 1F 6F 1F DF
    AND $3F3FDF,X        ; 3F DF 3F 3F
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $00FFFE,X        ; FF FE FF 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $08              ; 00 08
    ORA $08              ; 07 08
    ORA $08              ; 07 08
    ORA $B3              ; 07 B3
    ORA $000000          ; 0F 00 00 00
    BRK $40              ; 00 40
    BRK $30              ; 00 30
    CPY #$10             ; C0 10
    CPX #$D0             ; E0 D0
    CPX #$D0             ; E0 D0
    CPX #$80             ; E0 80
    JSR ($0001,X)        ; FC 01 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ASL $0FFF            ; 0E FF 0F
    SBC $0C7F8E,X        ; FF 8E 7F 0C
    SBC $F83FC0,X        ; FF C0 3F F8
    ORA $00              ; 07 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $01FF00,X        ; FF 00 FF 01
    INC $FC03,X          ; FE 03 FC
    ORA $F8              ; 07 F8
    ROR $0780,X          ; 7E 80 07
    BRK $1C              ; 00 1C
    ORA $7C              ; 03 7C
    ORA $CC              ; 03 CC
    AND $80              ; 33 80
;==============================================================================
; Function Index (12 functions)
;==============================================================================
; GeneralPurpose_00
; GeneralPurpose_01
; GeneralPurpose_0B
; GeneralPurpose_0C
; GeneralPurpose_0D
; GeneralPurpose_0E
; GeneralPurpose_12
; GeneralPurpose_14
; GeneralPurpose_18
; GeneralPurpose_22
; GeneralPurpose_24
; GeneralPurpose_25
;==============================================================================