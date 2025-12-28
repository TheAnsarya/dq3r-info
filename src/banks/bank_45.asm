;==============================================================================
; Dragon Quest III - Bank $45 Code
; Ultra-aggressive code extraction
;==============================================================================

.include "../include/hardware.inc"

.segment "BANK_45_CODE"


Bank_45_Function_00:
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    JSR $4000            ; 20 00 40
    BRK $00              ; 00 00
    BRK $04              ; 00 04
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $20              ; 01 20
    JSR $6060            ; 20 60 60
    BRK $00              ; 00 00
    ASL $06              ; 06 06
    COP $02              ; 02 02
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BMI $8064            ; 30 00
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    CLD                  ; D8
    BRK $80              ; 00 80
    CMP $0001,Y          ; D9 01 00
    BRK $00              ; 00 00
    LSR $105E,X          ; 5E 5E 10
    BPL $8096            ; 10 01
    ORA $C1              ; 01 C1
    CMP $D8              ; C1 D8
    CLD                  ; D8
    CMP $01D9,Y          ; D9 D9 01
    ORA $00              ; 01 00
    BRK $20              ; 00 20
    BRK $08              ; 00 08
    BRK $80              ; 00 80
    TSB $80              ; 04 80
    BRA $80A9            ; 80 00
    BRK $80              ; 00 80
    BRK $80              ; 00 80
    BRK $10              ; 00 10
    BRK $20              ; 00 20
    JSR $0C0C            ; 20 0C 0C
    STY $84              ; 84 84
    BRA $8038            ; 80 80
    BRK $00              ; 00 00
    BRA $803C            ; 80 80
    BRA $803E            ; 80 80
    BPL $80D0            ; 10 10
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    RTI                  ; 40
    BRK $00              ; 00 00
    RTI                  ; 40
    ORA $00              ; 03 00
    ORA $02              ; 01 02
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $10              ; 00 10
    ROL $36,X            ; 36 36
    LDA $B2              ; B2 B2
    BRK $00              ; 00 00
    PHP                  ; 08
    PHP                  ; 08
    TSB $000C            ; 0C 0C 00
    BRK $18              ; 00 18
    CLC                  ; 18
    BPL $8110            ; 10 10

Bank_45_Function_01:
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    RTS                  ; 60
    RTS                  ; 60
    RTS                  ; 60
    BRK $00              ; 00 00
    BPL $8126            ; 10 10
    BRL $819B            ; 82 82 00
    BRK $00              ; 00 00
    BRK $20              ; 00 20
    JSR $6060            ; 20 60 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRA $8168            ; 80 40
    DEY                  ; 88
    BRK $00              ; 00 00
    PHP                  ; 08
    COP $00              ; 02 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BCC $80E2            ; 90 90
    CPY #$C0             ; C0 C0
    ORA $03              ; 03 03
    REP #$C2             ; C2 C2
    RTI                  ; 40
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BPL $8170            ; 10 10
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    RTI                  ; 40
    ORA #$41             ; 09 41
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $22              ; 00 22
    JSL $000000          ; 22 00 00 00
    BRK $00              ; 00 00
    BRK $49              ; 00 49
    EOR #$41             ; 49 41
    EOR $00              ; 41 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    TSB $0000            ; 0C 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSB $00              ; 04 00
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $04              ; 00 04
    BRK $00              ; 00 00
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BMI $820C            ; 30 30
    JSR $0420            ; 20 20 04
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    COP $00              ; 02 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BPL $827F            ; 10 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BPL $82AD            ; 10 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    JSR $1000            ; 20 00 10
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CLC                  ; 18
    CLC                  ; 18
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BMI $82EC            ; 30 30
    BPL $82CE            ; 10 10
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BPL $8315            ; 10 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    PHP                  ; 08
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    JSR $0020            ; 20 20 00
    TSB $00              ; 04 00
    BRK $40              ; 00 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    RTI                  ; 40
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CLC                  ; 18
    CLC                  ; 18
    BRK $00              ; 00 00
    PHP                  ; 08
    PHP                  ; 08
    BPL $8362            ; 10 00
    PHP                  ; 08
    BRK $80              ; 00 80
    COP $80              ; 02 80
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    CLC                  ; 18
    CLC                  ; 18
    PHP                  ; 08
    PHP                  ; 08
    BRL $43F9            ; 82 82 C0
    CPY #$00             ; C0 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    JSR $2200            ; 20 00 22
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BPL $83C4            ; 10 10
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    JSR $2220            ; 20 20 22
    JSL $000000          ; 22 00 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0C              ; 00 0C
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $01              ; 00 01
    BRA $83AB            ; 80 C0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    PHP                  ; 08
    TSB $000C            ; 0C 0C 00
    BRK $81              ; 00 81
    STA $C0              ; 81 C0
    CPY #$00             ; C0 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    COP $02              ; 02 02
    JSR $0020            ; 20 20 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $8441            ; 80 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BRK $00              ; 00 00
    BRA $8471            ; 80 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $81              ; 00 81
    STA $00              ; 81 00
    BRK $10              ; 00 10
    BPL $83FF            ; 10 80
    BRA $8481            ; 80 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    PHP                  ; 08
    TRB $0B              ; 14 0B
    TCS                  ; 1B
    TSB $0D1E            ; 0C 1E 0D
    ASL $1E1D            ; 0E 1D 1E
    ORA $1D0E            ; 0D 0E 1D
    BRK $00              ; 00 00
    ORA $00              ; 17 00
    BPL $84B6            ; 10 00
    BPL $84B8            ; 10 00
    BPL $84BA            ; 10 00
    BPL $84BC            ; 10 00
    BPL $84BE            ; 10 00
    BPL $84C0            ; 10 00
    BRK $00              ; 00 00
    CLC                  ; 18
    BPL $84ED            ; 10 28
    BNE $849F            ; D0 D8
    BMI $8531            ; 30 68
    LDY #$10             ; A0 10
    INY                  ; C8
    CLC                  ; 18
    CPY #$08             ; C0 08
    CPY #$00             ; C0 00
    BRK $E8              ; 00 E8
    BRK $08              ; 00 08
    BRK $08              ; 00 08
    BRK $18              ; 00 18
    BRK $38              ; 00 38
    BRK $38              ; 00 38
    BRK $38              ; 00 38
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $C0              ; 00 C0
    RTI                  ; 40
    JSR $20E0            ; 20 E0 20
    CPX #$E0             ; E0 E0
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $40              ; 00 40
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BRK $30              ; 00 30
    BRK $70              ; 00 70
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    SEC                  ; 38
    JMP ($3854)          ; 6C 54 38
    CLC                  ; 18
    BIT $30,X            ; 34 30
    BVC $8574            ; 50 08
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BPL $8592            ; 10 00
    ORA $00              ; 11 00
    ORA $00              ; 13 00
    ORA $00              ; 17 00
    ORA $001F00,X        ; 1F 00 1F 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $C8              ; 00 C8
    RTI                  ; 40
    PHA                  ; 48
    JSR $5028            ; 20 28 50
    CLC                  ; 18
    BMI $8572            ; 30 C8
    BPL $8594            ; 10 E8
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SEC                  ; 38
    BRK $B8              ; 00 B8
    BRK $D8              ; 00 D8
    BRK $E8              ; 00 E8
    BRK $F8              ; 00 F8
    BRK $F8              ; 00 F8
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $18              ; 00 18
    ASL                  ; 0A
    COP $12              ; 02 12
    ORA $08              ; 07 08
    BRK $06              ; 00 06
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BEQ $85F2            ; F0 00
    RTS                  ; 60
    BRK $80              ; 00 80
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $07              ; 00 07
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $60              ; 00 60
    RTS                  ; 60
    CPY #$E0             ; C0 E0
    BPL $8606            ; 10 E0
    CPX #$10             ; E0 10
    BRK $80              ; 00 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BCC $8632            ; 90 00
    BPL $8634            ; 10 00
    BPL $8636            ; 10 00
    BEQ $8638            ; F0 00
    BRA $863A            ; 80 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    AND $6D00            ; 2D 00 6D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $20              ; 00 20
    CPX #$70             ; E0 70
    BEQ $862B            ; F0 C0
    BEQ $8691            ; F0 24
    JMP ($3E3E)          ; 6C 3E 3E
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPX #$00             ; E0 00
    CLC                  ; 18
    BRK $0C              ; 00 0C
    BRK $0E              ; 00 0E
    BRK $92              ; 00 92
    BRK $C0              ; 00 C0
    BRK $2D              ; 00 2D
    AND $524C12,X        ; 3F 12 4C 52
    ADC $2D              ; 61 2D
    AND $4C40            ; 2D 40 4C
    COP $12              ; 02 12
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY #$00             ; C0 00
    LDA $00              ; A1 00
    BRA $86A2            ; 80 0C
    RTI                  ; 40
    ORA $B3              ; 12 B3
    BRK $4C              ; 00 4C
    AND $3B              ; 21 3B
    BRK $00              ; 00 00
    BRK $3C              ; 00 3C
    BIT $8A8A,X          ; 3C 8A 8A
    STX $86              ; 86 86
    TRB $1C              ; 14 1C
    BCC $869A            ; 90 F0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    REP #$00             ; C2 00
    BIT $40,X            ; 34 40
    ADC $E200,Y          ; 79 00 E2
    BRK $0C              ; 00 0C
    BRK $F0              ; 00 F0
    BRK $80              ; 00 80
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    COP $06              ; 02 06
    ORA #$15             ; 09 15
    BRK $17              ; 00 17
    PHP                  ; 08
    PLD                  ; 2B
    BVC $86EA            ; 50 1F
    BRK $3F              ; 00 3F
    BRK $37              ; 00 37
    PHP                  ; 08
    COP $01              ; 02 01
    ASL                  ; 0A
    TSB $0A              ; 04 0A
    BRK $38              ; 00 38
    ORA $3C              ; 03 3C
    ORA $70              ; 03 70
    ASL $1B60            ; 0E 60 1B
    PLP                  ; 28
    LSR $80,X            ; 56 80
    RTI                  ; 40
    RTS                  ; 60
    BCC $868D            ; 90 A8
    BPL $86CF            ; 10 E8
    TRB $D2              ; 14 D2
    PHP                  ; 08
    JSR ($FC02,X)        ; FC 02 FC
    COP $EE              ; 02 EE
    BPL $8731            ; 10 40
    BRA $8743            ; 80 50
    JSR $0040            ; 20 40 00
    CLC                  ; 18
    RTI                  ; 40
    BIT $0C40,X          ; 3C 40 0C
    BVS $8701            ; 70 04
    CLD                  ; D8
    TRB $E0              ; 14 E0

Bank_45_Function_07:
    ADC $02,X            ; 75 02
    EOR $1C              ; 43 1C
    PHA                  ; 48
    AND $25              ; 27 25
    ORA $35              ; 11 35
    ORA #$18             ; 09 18
    BRK $0C              ; 00 0C
    COP $03              ; 02 03
    BRK $2A              ; 00 2A
    TSB $2A              ; 04 2A
    RTI                  ; 40
    INC                  ; 1A
    RTI                  ; 40
    ORA $0602            ; 0D 02 06
    AND $04              ; 23 04
    ORA $01              ; 13 01
    PHP                  ; 08
    BRK $03              ; 00 03
    LDX $C240            ; AE 40 C2
    SEC                  ; 38
    ORA $E4              ; 12 E4
    LDY $88              ; A4 88
    LDY $0890            ; AC 90 08
    BPL $875D            ; 10 30
    RTI                  ; 40
    CPY #$00             ; C0 00
    MVN $5420            ; 54 20 54
    COP $58              ; 02 58
    COP $B0              ; 02 B0
    RTI                  ; 40
    CPX #$44             ; E0 44
    JSR $80C8            ; 20 C8 80
    BPL $873F            ; 10 00
    CPY #$00             ; C0 00
    BRK $08              ; 00 08
    PHP                  ; 08
    TRB $1C              ; 14 1C
    ROL $36,X            ; 36 36
    EOR $63              ; 41 63
    ROL $36,X            ; 36 36
    TRB $1C              ; 14 1C
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    BRK $1C              ; 00 1C
    BRK $3E              ; 00 3E
    BRK $7F              ; 00 7F
    BRK $3E              ; 00 3E
    BRK $1C              ; 00 1C
    BRK $08              ; 00 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PHP                  ; 08
    PHP                  ; 08
    TRB $1C              ; 14 1C
    JSL $1C1436          ; 22 36 14 1C
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    BRK $1C              ; 00 1C
    BRK $3E              ; 00 3E
    BRK $1C              ; 00 1C
    BRK $08              ; 00 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    TRB $36              ; 14 36
    JSL $C18036          ; 22 36 80 C1
    JSL $361436          ; 22 36 14 36
    BRK $08              ; 00 08
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    BRK $3E              ; 00 3E
    BRK $3E              ; 00 3E
    BRK $FF              ; 00 FF
    BRK $3E              ; 00 3E
    BRK $3E              ; 00 3E
    BRK $08              ; 00 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 07 00
    ROL $F906,X          ; 3E 06 F9
    ROL $F0CF,X          ; 3E CF F0
    ADC $9CF78F,X        ; 7F 8F F7 9C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $07              ; 07 07
    AND $C038,Y          ; 39 38 C0
    CMP $00              ; C1 00
    ORA $9C700F          ; 0F 0F 70 9C
    ADC $03              ; 63 03
    BRK $FF              ; 00 FF
    ORA $E4              ; 03 E4
    SBC $8F              ; E7 8F
    BEQ $87C8            ; F0 FF
    ORA $FF              ; 07 FF
    CMP $E03FFC,X        ; DF FC 3F E0
    SBC $FC0303,X        ; FF 03 03 FC
    JSR ($0018,X)        ; FC 18 00
    BRK $0F              ; 00 0F
    ORA $F8              ; 07 F8
    CMP $C13E20,X        ; DF 20 3E C1
    SBC $FE06,Y          ; F9 06 FE
    BRK $05              ; 00 05
    ASL $0D              ; 06 0D
    SBC $07F9,X          ; FD F9 07
    INC $9FF1,X          ; FE F1 9F
    JSR ($E27D,X)        ; FC 7D E2
    SBC $FE86,Y          ; F9 86 FE
    INC $01F9,X          ; FE F9 01
    COP $00              ; 02 00
    PHP                  ; 08
    SED                  ; F8
    INC $0E,X            ; F6 0E
    SBC $E503,X          ; FD 03 E5
    ORA $7898,X          ; 1D 98 78

Bank_45_Function_08:
    BRK $00              ; 00 00
    BRA $8804            ; 80 00
    RTI                  ; 40
    BRA $8827            ; 80 20
    BRK $30              ; 00 30
    JSR $9098            ; 20 98 90
    SBC $1210,Y          ; F9 10 12
    ORA $00              ; 01 00
    BRK $80              ; 00 80
    BRA $8855            ; 80 40
    RTI                  ; 40
    CPY #$00             ; C0 00
    CPY #$60             ; C0 60
    RTS                  ; 60
    BVS $881D            ; 70 00
    BPL $8820            ; 10 01
    BRK $0D              ; 00 0D
    TSB $06              ; 04 06
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $07              ; 00 07
    ORA $0E              ; 01 0E
    ORA $1B              ; 07 1B
    TSB $1837            ; 0C 37 18
    ADC $000033          ; 6F 33 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ASL $06              ; 06 06
    PHP                  ; 08
    PHP                  ; 08
    BPL $886F            ; 10 13
    JSR $4327            ; 20 27 43
    JMP $000F            ; 4C 0F 00
    ADC $7FF10F,X        ; 7F 0F F1 7F
    STZ $FFE1,X          ; 9E E1 FF
    ASL $7EFD            ; 0E FD 7E
    SBC $DF              ; F2 DF
    SBC $3C              ; E7 3C
    ORA $70700F          ; 0F 0F 70 70
    BRA $87F6            ; 80 80
    BRK $1E              ; 00 1E
    ORA $817FF1          ; 0F F1 7F 81
    DEC $3E20,X          ; DE 20 3E
    REP #$00             ; C2 00
    BRK $C0              ; 00 C0
    BRK $A0              ; 00 A0
    BRA $8837            ; 80 B0
    LDY #$58             ; A0 58
    BNE $8883            ; D0 F8
    BPL $881E            ; 10 91
    BRK $03              ; 00 03
    ORA $00              ; 01 00
    BRK $C0              ; 00 C0
    CPY #$40             ; C0 40
    BRK $40              ; 00 40
    JSR $3020            ; 20 20 30
    BRA $882C            ; 80 90
    BRK $00              ; 00 00
    COP $03              ; 02 03
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $00              ; 07 00
    ORA $1F7807,X        ; 1F 07 78 1F
    SBC $78              ; E7 78
    STA $9F7EE3,X        ; 9F E3 7E 9F
    SED                  ; F8
    SBC $00              ; E7 00
    BRK $07              ; 00 07
    ORA $18              ; 07 18
    CLC                  ; 18
    RTS                  ; 60
    RTS                  ; 60
    BRA $8861            ; 80 87
    ORA $1C              ; 03 1C
    ORA $18E760,X        ; 1F 60 E7 18
    JSR ($E300,X)        ; FC 00 E3
    CPX $0C              ; E4 0C
    JSR ($0CF4,X)        ; FC F4 0C
    PLX                  ; FA
    INC $9F,X            ; F6 9F
    BEQ $8921            ; F0 34
    INX                  ; E8
    PLA                  ; 68
    BNE $88ED            ; D0 FC
    JSR ($031B,X)        ; FC 1B 03
    ORA $00              ; 03 00
    ORA $F1              ; 03 F1
    SBC $FC09,Y          ; F9 09 FC
    TSB $10F0            ; 0C F0 10
    CPX #$20             ; E0 20

Bank_45_Function_09:
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRA $8906            ; 80 00
    CPY #$80             ; C0 80
    RTS                  ; 60
    RTI                  ; 40
    CPX #$40             ; E0 40
    EOR $00              ; 41 00
    COP $01              ; 02 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $88DA            ; 80 C0
    BRK $40              ; 00 40
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ASL $1F00            ; 0E 00 1F
    ASL $0F71            ; 0E 71 0F
    STY $0F              ; 84 0F
    LSR $4A0F            ; 4E 0F 4A
    TSC                  ; 3B
    LSR $343F,X          ; 5E 3F 34
    ORA $0E              ; 17 0E
    ASL $1111            ; 0E 11 11
    BVS $89A6            ; 70 70
    BEQ $88B8            ; F0 80
    BVS $897A            ; 70 40
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRK $40              ; 00 40
    BRA $8989            ; 80 40
    BRA $898B            ; 80 40
    BRA $88CD            ; 80 80
    BRK $80              ; 00 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $8997            ; 80 40
    RTI                  ; 40
    RTI                  ; 40
    RTI                  ; 40
    RTI                  ; 40
    RTI                  ; 40
    BRA $88DE            ; 80 80
    BRA $88E0            ; 80 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    XBA                  ; EB
    ADC $0066A6          ; 6F A6 66 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRA $8917            ; 80 80
    CPY #$DB             ; C0 DB
    XCE                  ; FB
    CPY #$C0             ; C0 C0
    BCC $891E            ; 90 80
    STA $DF80,Y          ; 99 80 DF
    ADC $B2              ; 71 B2
    SBC $41              ; E3 41
    CMP $81              ; C1 81
    BRA $892A            ; 80 81
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $71              ; 00 71
    STX $1CE3            ; 8E E3 1C
    CMP $32              ; C1 32
    BRA $89F9            ; 80 41
    BRK $81              ; 00 81
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $FF              ; 85 FF
    ORA $FF              ; 03 FF
    ASL $FF              ; 06 FF
    ORA $0DFF            ; 0D FF 0D
    SBC $66669F,X        ; FF 9F 66 66
    BRK $00              ; 00 00
    BRK $E7              ; 00 E7
    CLC                  ; 18
    STA $E01F70          ; 8F 70 1F E0
    AND $807FC0,X        ; 3F C0 7F 80
    ROR $99              ; 66 99
    BRK $67              ; 00 67
    BRK $02              ; 00 02
    SEP #$5C             ; E2 5C
    MVN $DEF8            ; 54 F8 DE
    CLV                  ; B8
    SBC $07F89E          ; EF 9E F8 07
    EOR $131C1C,X        ; 5F 1C 1C 13
    ORA $A2620F,X        ; 1F 0F 62 A2
    CPY $04              ; C4 04
    STX $46              ; 86 46
    STA $61              ; 81 61
    BRK $F8              ; 00 F8
    ORA $6C1CE3,X        ; 1F E3 1C 6C
    BPL $8A10            ; 10 10

Bank_45_Function_0A:
    COP $01              ; 02 01
    TSB $3103            ; 0C 03 31
    ORA $BE3FCB          ; 0F CB 3F BE
    ROR $FF7B,X          ; 7E 7B FF
    SBC $FF              ; F2 FF
    CPY #$FF             ; C0 FF
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    CPY #$C0             ; C0 C0
    STA $80              ; 81 80
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $05              ; 05 05
    COP $02              ; 02 02
    CMP $CCBE66,X        ; DF 66 BE CC
    JMP ($D9AC,X)        ; 7C AC D9
    PHA                  ; 48
    BIT #$08             ; 89 08
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    STX $99              ; 86 99
    TSB $2C33            ; 0C 33 2C
    EOR $48              ; 52 48
    LDA $08,X            ; B5 08
    CMP $00,X            ; D5 00
    BIT #$00             ; 89 00
    ORA $00              ; 01 00
    BRK $CC              ; 00 CC
    ADC $B77F99,X        ; 7F 99 7F B7
    ADC $F83F,X          ; 7D 3F F8
    TDC                  ; 7B
    CMP $71              ; D1 71
    CPY #$D6             ; C0 D6
    STA $88              ; 81 88
    ORA $5C              ; 01 5C
    LDY #$3C             ; A0 3C
    CPY #$3C             ; C0 3C
    REP #$F8             ; C2 F8
    ORA $D1              ; 07 D1
    ROL $3BC1            ; 2E C1 3B
    STX $56              ; 86 56
    ASL $B688            ; 0E 88 B6
    JSR $17D8            ; 20 D8 17
    CMP $26CA            ; CD CA 26
    CMP $F9              ; C5 F9
    TXY                  ; 9B
    TAX                  ; AA
    PHY                  ; 5A
    BCS $8A97            ; B0 09
    INC $83A9,X          ; FE A9 83
    LDA $E0              ; A3 E0
    BEQ $8ACA            ; F0 35
    AND $3038,X          ; 3D 38 30
    CPX $60              ; E4 60
    LDA $A0              ; A5 A0
    INC $B0,X            ; F6 B0
    TSB $04              ; 04 04
    TCS                  ; 1B
    ORA $1B26            ; 0D 26 1B
    EOR $2A5836          ; 4F 36 58 2A
    TXS                  ; 9A
    PER $50B0            ; 62 B0 50
    LDY #$40             ; A0 40
    BRA $8AF0            ; 80 40
    ORA $12              ; 11 12
    AND $24              ; 23 24
    LSR $49              ; 46 49
    LSR                  ; 4A
    EOR $82,X            ; 55 82
    STA $AA90,X          ; 9D 90 AA
    BRA $8A6E            ; 80 B0
    BRA $8A60            ; 80 A0
    SBC $8F              ; F2 8F
    SBC $1F              ; F1 1F
    AND $1F              ; 23 1F
    ROL $1F              ; 26 1F
    EOR $3B              ; 47 3B
    JMP $6A3E            ; 4C 3E 6A
    DEC                  ; 3A
    JSR $8F10            ; 20 10 8F
    BVS $8AEE            ; 70 1B
    CPX $17              ; E4 17
    INX                  ; E8
    ORA $38              ; 07 38
    PLD                  ; 2B
    MVN $512E            ; 54 2E 51
    DEC                  ; 3A
    EOR $10              ; 45 10
    ROL                  ; 2A
    CPX $D8              ; E4 D8
    STY $F8              ; 84 F8
    LSR $EFF8,X          ; 5E F8 EF
    DEC $87F8,X          ; DE F8 87
    ADC $135C1C,X        ; 7F 1C 5C 13
    ORA $24E40F,X        ; 1F 0F E4 24
    CPY $04              ; C4 04
    DEC $06              ; C6 06
    CMP $21              ; C1 21
    BRA $8B72            ; 80 78
    ORA $6C1CE3,X        ; 1F E3 1C 6C
    BPL $8B50            ; 10 50

Bank_45_Function_0B:
    ORA $0E,X            ; 15 0E
    PHP                  ; 08
    ORA $09              ; 07 09
    ORA $07              ; 07 07
    ORA $06              ; 03 06
    ORA $06              ; 03 06
    ORA $05              ; 03 05
    ORA $03              ; 03 03
    ORA $11              ; 01 11
    ORA $08              ; 11 08
    PHP                  ; 08
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSB $04              ; 04 04
    TSB $04              ; 04 04
    COP $02              ; 02 02
    BRA $8B22            ; 80 00
    BRA $8B24            ; 80 00
    RTI                  ; 40
    BRA $8B67            ; 80 40
    BRA $8AC9            ; 80 A0
    CPY #$E0             ; C0 E0
    CPY #$20             ; C0 20
    BRK $10              ; 00 10
    JSR $8080            ; 20 80 80
    BRA $8AB4            ; 80 80
    RTI                  ; 40
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY #$00             ; C0 00
    CPY #$00             ; C0 00
    BRK $00              ; 00 00
    ORA $00              ; 03 00
    TSB $00              ; 04 00
    COP $01              ; 02 01
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    ORA $04              ; 07 04
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    STZ $869C            ; 9C 9C 86
    STY $00              ; 84 00
    BRK $0C              ; 00 0C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $04              ; 00 04
    ORA $0D              ; 03 0D
    ORA $8B              ; 05 8B
    BRK $C4              ; 00 C4
    BRA $8BB0            ; 80 21
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    TSB $04              ; 04 04
    COP $06              ; 02 06
    STY $84              ; 84 84
    RTI                  ; 40
    CPY #$81             ; C0 81
    STA $00              ; 81 00
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    SBC $B87FC6,X        ; FF C6 7F B8
    CMP $B7EFDE,X        ; DF DE EF B7
    RTL                  ; 6B
    PLB                  ; AB
    ADC $0000,X          ; 7D 00 00
    SBC $0000FF,X        ; FF FF 00 00
    INC $1F80,X          ; FE 80 1F
    JSR $100F            ; 20 0F 10
    TCS                  ; 1B
    TRB $8D              ; 14 8D
    BRL $8BC2            ; 82 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $01              ; 03 01
    ORA $02              ; 07 02
    ORA $0C1505          ; 0F 05 15 0C
    ORA $0808,X          ; 1D 08 08
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $02              ; 01 02
    COP $04              ; 02 04
    ORA $09              ; 05 09
    ASL                  ; 0A
    TRB $13              ; 14 13
    CLC                  ; 18
    ORA $00,X            ; 15 00
    PHP                  ; 08

Bank_45_Function_0C:
    SEI                  ; 78
    BRK $FC              ; 00 FC
    SEI                  ; 78
    PLY                  ; 7A
    TYA                  ; 98
    SBC $9E60,X          ; FD 60 9E
    PEA $F26B            ; F4 6B F2
    TDC                  ; 7B
    STA $B6              ; 97 B6
    PHD                  ; 0B
    SEI                  ; 78
    SEI                  ; 78
    BRA $8B94            ; 80 80
    TRB $64              ; 14 64
    ADC $CB9D,X          ; 7D 9D CB
    ORA $980FED          ; 0F ED 0F 98
    PLA                  ; 68
    BMI $8BD0            ; 30 B0
    ORA $01              ; 05 01
    ORA $03              ; 05 03
    ORA $03              ; 05 03
    COP $00              ; 02 00
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    ORA $00              ; 07 00
    ASL $0607            ; 0E 07 06
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $01              ; 01 01
    ORA $07              ; 01 07
    ORA $08              ; 07 08
    PHP                  ; 08
    SBC $70D6,Y          ; F9 D6 70
    EOR $B7CFFC          ; 4F FC CF B7
    WAI                  ; CB
    BIT $9BC1,X          ; 3C C1 9B
    STZ $DF              ; 64 DF
    ADC $EF              ; 65 EF
    STZ $2A,X            ; 74 2A
    PLP                  ; 28
    LDA $22              ; A3 22
    BRK $00              ; 00 00
    JSR $3220            ; 20 20 32
    BMI $8BEB            ; 30 90
    STA $11              ; 91 11
    BPL $8C61            ; 10 02
    BRK $80              ; 00 80
    RTI                  ; 40
    RTI                  ; 40
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $1D1F2F,X        ; 1F 2F 1F 1D
    ORA $0B0F10          ; 0F 10 0F 0B
    TSB $06              ; 04 06
    ORA $10              ; 01 10
    BPL $8CB3            ; 10 20
    JSR $2020            ; 20 20 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    COP $02              ; 02 02
    CMP $FF              ; C7 FF
    COP $FF              ; 02 FF
    BRK $FF              ; 00 FF
    CPY #$BF             ; C0 BF
    LDX $F7C1,Y          ; BE C1 F7
    SEI                  ; 78
    CMP #$3E             ; C9 3E
    ADC $0086,Y          ; 79 86 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $40              ; 00 40
    RTI                  ; 40
    ROL $873E,X          ; 3E 3E 87
    STA $C1              ; 87 C1
    CMP $79              ; C1 79
    ADC $0103,Y          ; 79 03 01
    COP $01              ; 02 01
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    LDX $6C,Y            ; B6 6C
    ADC $16              ; 67 16
    TDC                  ; 7B
    ASL                  ; 0A
    LDA $004052          ; AF 52 40 00
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BPL $8D09            ; 10 10
    BPL $8D23            ; 10 28
    JSR $3634            ; 20 34 36
    JSR $0122            ; 20 22 01
    BRK $07              ; 00 07
    ORA $1E              ; 01 1E
    ORA $3B              ; 07 3B
    ORA $366F,X          ; 1D 6F 36
    CMP $60              ; D3 60
    LDA $40              ; A1 40
    RTI                  ; 40
    BRK $01              ; 00 01
    ORA $06              ; 01 06
    ASL $18              ; 06 18
    CLC                  ; 18
    AND $22              ; 21 22
    LSR $49              ; 46 49
    BRA $8CBB            ; 80 9F
    LDY #$B3             ; A0 B3
    RTI                  ; 40
    EOR $3D              ; 41 3D
    PHD                  ; 0B
    ORA $08              ; 17 08
    ORA $09              ; 17 09
    ORA $0D1F0B,X        ; 1F 0B 1F 0D
    PHD                  ; 0B
    ORA $06              ; 07 06
    COP $03              ; 02 03
    BRK $10              ; 00 10
    BPL $8D35            ; 10 02
    ORA $01              ; 01 01
    COP $03              ; 02 03
    BRK $03              ; 00 03
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $5E              ; 00 5E
    SBC $A9              ; E1 A9
    CMP $2A7417,X        ; DF 17 74 2A
    SBC $BDD3,X          ; FD D3 BD
    CMP $FC83E0,X        ; DF E0 83 FC
    ORA $F8              ; 07 F8
    ASL $200E            ; 0E 0E 20
    LDY #$88             ; A0 88
    BRA $8D59            ; 80 02
    COP $42              ; 02 42
    WDM $1B              ; 42 1B
    TCS                  ; 1B
    ORA $01              ; 01 01
    ORA $05              ; 05 05
    SBC #$FE             ; E9 FE
    JMP ($FE8F,X)        ; 7C 8F FE
    EOR $CA              ; 53 CA
    WDM $A0              ; 42 A0
    BRA $8DD3            ; 80 68
    CPX #$30             ; E0 30
    CPY #$B0             ; C0 B0
    CPX #$0E             ; E0 0E
    ORA $6F              ; 01 6F
    BVS $8D48            ; 70 D3
    LDY $BDC2            ; AC C2 BD
    RTS                  ; 60
    ROL                  ; 2A
    CLC                  ; 18
    PHP                  ; 08
    BMI $8DAE            ; 30 30
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    COP $00              ; 02 00
    ORA $01              ; 03 01
    STA $00              ; 81 00
    LDA $00              ; A1 00
    CMP $20              ; D1 20
    ADC $80              ; 61 80
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 03 00
    COP $A0              ; 02 A0
    ORA $F0              ; 01 F0
    ORA $F8              ; 01 F8
    BRK $FC              ; 00 FC
    BRK $FC              ; 00 FC
    DEY                  ; 88
    BPL $8D3B            ; 10 98
    BEQ $8DF9            ; F0 54
    CLD                  ; D8
    JMP $88F8            ; 4C F8 88
    BVS $8E23            ; 70 78
    BRA $8DB5            ; 80 08
    BEQ $8DF3            ; F0 44
    SED                  ; F8
    INX                  ; E8
    BRK $08              ; 00 08
    BRK $24              ; 00 24
    BRK $04              ; 00 04
    BRK $88              ; 00 88
    BRK $78              ; 00 78
    BRK $08              ; 00 08
    BRK $04              ; 00 04
    BRK $5A              ; 00 5A
    ORA $3E,X            ; 15 3E
    TCS                  ; 1B
    ORA $0A              ; 17 0A
    AND $0A              ; 37 0A
    ROR $2D,X            ; 76 2D
    STA $261F76          ; 8F 76 1F 26
    SBC $42              ; E7 42
    RTL                  ; 6B
    PHK                  ; 4B
    JSR $1420            ; 20 20 14
    TRB $24              ; 14 24
    BIT $42              ; 24 42
    WDM $88              ; 42 88
    DEY                  ; 88
    CMP $C1              ; C1 C1
    BRK $40              ; 00 40
    TRB $120F            ; 1C 0F 12
    ORA $19              ; 07 19
    ASL $0F              ; 06 0F
    BRK $0F              ; 00 0F
    BRK $12              ; 00 12
    ORA $163D            ; 0D 3D 16
    ROR                  ; 6A
    PLP                  ; 28
    BPL $8E02            ; 10 10
    CLC                  ; 18
    BPL $8DFE            ; 10 09
    ORA #$06             ; 09 06
    ASL $09              ; 06 09
    ORA #$12             ; 09 12
    ORA $28              ; 12 28
    SEC                  ; 38
    MVN $ED74            ; 54 74 ED
    ADC $BA              ; 73 BA
    ADC $ED              ; 71 ED
    PLP                  ; 28
    CPX $20              ; E4 20
    PEI $30              ; D4 30
    LDX $10,Y            ; B6 10
    PLD                  ; 2B
    ASL $041D,X          ; 1E 1D 04
    BRA $8D92            ; 80 80
    BRA $8D94            ; 80 80
    BPL $8E16            ; 10 00
    TYA                  ; 98
    BRA $8DA1            ; 80 88
    BRA $8E23            ; 80 08
    BRK $00              ; 00 00
    BRK $0B              ; 00 0B
    ORA #$00             ; 09 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    BRK $06              ; 00 06
    ORA $8D              ; 03 8D
    ORA $CB              ; 05 CB
    BRA $8E54            ; 80 25
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $02              ; 03 02
    TSB $04              ; 04 04
    BRL $D2C3            ; 82 86 44
    CPY $85              ; C4 85
    STA $00              ; 85 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    WDM $18              ; 42 18
    CLC                  ; 18
    RTS                  ; 60
    RTS                  ; 60
    BRA $8DF6            ; 80 80
    BRA $8DF8            ; 80 80
    BRK $00              ; 00 00
    COP $02              ; 02 02
    LDY #$20             ; A0 20
    LDY $B4,X            ; B4 B4
    LDA $5FC2,X          ; BD C2 5F
    CPX #$0F             ; E0 0F
    BEQ $8E26            ; F0 9F
    RTS                  ; 60
    BEQ $8E8A            ; F0 00
    BRA $8E8C            ; 80 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    AND $35,X            ; 35 35
    TCS                  ; 1B
    TCS                  ; 1B
    ORA $10100F          ; 0F 0F 10 10
    BRA $8E1A            ; 80 80
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDX $58,Y            ; B6 58
    ROR                  ; 6A
    PLP                  ; 28
    SBC $EECC,X          ; FD CC EE
    RTI                  ; 40
    RTI                  ; 40
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    TSB $040E            ; 0C 0E 04
    TSB $00              ; 04 00
    PLP                  ; 28
    INY                  ; C8
    MVN $14A4            ; 54 A4 14
    STZ $2A              ; 64 2A
    EOR $02              ; 52 02
    DEC                  ; 3A
    COP $1A              ; 02 1A
    COP $0A              ; 02 0A
    BRK $04              ; 00 04

Bank_45_Function_0F:
    CLC                  ; 18
    BRK $78              ; 00 78
    BPL $8EFD            ; 10 F8
    BVS $8ED7            ; 70 D0
    CPX #$10             ; E0 10
    CPX #$20             ; E0 20
    CPY #$40             ; C0 40
    BRA $8E8F            ; 80 80
    BRK $18              ; 00 18
    CLC                  ; 18
    PLA                  ; 68
    PLA                  ; 68
    BCC $8E9E            ; 90 88
    RTS                  ; 60
    BPL $8E99            ; 10 80
    BVS $8F1B            ; 70 00
    CPX #$80             ; E0 80
    RTI                  ; 40
    BRK $80              ; 00 80
    ROR $38,X            ; 76 38
    EOR $3E              ; 53 3E
    JSL $053C1B          ; 22 1B 3C 05
    EOR $6CDB21,X        ; 5F 21 DB 6C
    LDA $14,X            ; B5 14
    INC $0066,X          ; FE 66 00
    BRK $00              ; 00 00
    BRK $04              ; 00 04
    BRK $1A              ; 00 1A
    INC                  ; 1A
    CLC                  ; 18
    ORA $0000,Y          ; 19 00 00
    LSR                  ; 4A
    COP $01              ; 02 01
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    BRK $E0              ; 00 E0
    BRK $F8              ; 00 F8
    CPX #$5E             ; E0 5E
    SED                  ; F8
    ORA $FE              ; 17 FE
    STY $FE              ; 84 FE
    CPY #$FF             ; C0 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPX #$E0             ; E0 E0
    CLC                  ; 18
    CLC                  ; 18
    DEC $06              ; C6 06
    AND $C1              ; 31 C1
    CMP $E230            ; CD 30 E2
    TRB $0889            ; 1C 89 08
    TSC                  ; 3B
    SBC $9E              ; F1 9E
    COP $31              ; 02 31
    ORA $E0              ; 03 E0
    AND $60              ; 21 60
    RTS                  ; 60
    CPY #$C0             ; C0 C0
    ORA $01              ; 01 01
    ORA #$F4             ; 09 F4
    PLX                  ; FA
    BRK $05              ; 00 05
    CPX #$1C             ; E0 1C
    JMP $FEDE            ; DC DE FE
    STA $FF3FFF,X        ; 9F FF 3F FF
    INC $84FF,X          ; FE FF 84
    SEI                  ; 78
    TAY                  ; A8
    BNE $8F7D            ; D0 F8
    CPY #$F0             ; C0 F0
    CPY #$90             ; C0 90
    CPX #$50             ; E0 50
    LDY #$D0             ; A0 D0
    JSR $00E0            ; 20 E0 00
    BRA $8F92            ; 80 00
    JSR $3000            ; 20 00 30
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    BRK $40              ; 00 40
    BRK $C0              ; 00 C0
    BRK $C0              ; 00 C0
    BRK $06              ; 00 06
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $07              ; 07 07
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BPL $901B            ; 10 10
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $09              ; 00 09
    PHD                  ; 0B
    BRK $00              ; 00 00
    RTS                  ; 60
    RTI                  ; 40
    JMP $004A            ; 4C 4A 00
    BPL $901B            ; 10 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    ORA $07              ; 01 07
    ORA $0D              ; 03 0D
    TSB $07              ; 04 07
    ORA $03              ; 01 03
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $02              ; 01 02
    COP $04              ; 02 04
    ASL $0B              ; 06 0B
    ORA $020706          ; 0F 06 07 02
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    BRK $FA              ; 00 FA
    TSB $34              ; 04 34
    INY                  ; C8
    CLD                  ; D8
    RTS                  ; 60
    CPX #$C0             ; E0 C0
    RTI                  ; 40
    BRK $80              ; 00 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $88              ; 00 88
    DEY                  ; 88
    BMI $9084            ; 30 30
    BRA $8FD6            ; 80 80
    BRK $00              ; 00 00
    BRA $8FDA            ; 80 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    COP $01              ; 02 01
    ORA $01              ; 13 01
    BPL $906B            ; 10 03
    BIT $13              ; 24 13
    ROL $03,X            ; 36 03
    ROL                  ; 2A
    ORA $0B              ; 17 0B
    AND $00              ; 37 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $08              ; 00 08
    BRK $08              ; 00 08
    BRK $0F              ; 00 0F
    PHD                  ; 0B
    PHA                  ; 48
    PHP                  ; 08
    TAY                  ; A8
    PLP                  ; 28
    ORA $8C8F90,X        ; 1F 90 8F 8C
    EOR $87              ; 47 87
    EOR $81              ; 41 81
    JSR $04C0            ; 20 C0 04
    AND $403F00,X        ; 3F 00 3F 40
    ADC $737F6F,X        ; 7F 6F 7F 73
    ADC $7E3F78,X        ; 7F 78 3F 7E
    AND $F01F3F,X        ; 3F 3F 1F F0
    BNE $90F3            ; D0 10
    BPL $90FB            ; 10 16
    TRB $FB              ; 14 FB
    ASL                  ; 0A
    SBC $30              ; F1 30
    SBC $E0              ; E1 E0
    STA $80              ; 81 80
    ORA $00              ; 01 00
    JSR $00FC            ; 20 FC 00
    JSR ($FC00,X)        ; FC 00 FC
    PEA $CFFE            ; F4 FE CF
    SBC $7FFF1F,X        ; FF 1F FF 7F
    SBC $77FFFF,X        ; FF FF FF 77
    JSR $0020            ; 20 20 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    CPX #$40             ; E0 40
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $F1              ; 00 F1
    ASL $9B64            ; 0E 64 9B
    RTI                  ; 40
    LDX $40              ; A6 40
    LDY #$00             ; A0 00
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    AND $22              ; 23 22
    AND $32              ; 33 32
    AND $3C3F3E,X        ; 3F 3E 3F 3C
    ADC $787E70,X        ; 7F 70 7E 78
    ROR $FE78,X          ; 7E 78 FE
    SBC $CDFFDD,X        ; FF DD FF CD
    SBC $C2FFC1,X        ; FF C1 FF C2
    INC $FE8E,X          ; FE 8E FE
    STY $FC              ; 84 FC
    STY $FC              ; 84 FC
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $0E3F01          ; 0F 01 3F 0E
    ADC $4DFE32          ; 6F 32 FE 4D
    SBC $5B13,X          ; FD 13 5B
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    ORA $0E              ; 01 0E
    ASL $3130            ; 0E 30 31
    WDM $4D              ; 42 4D
    STA $93B2            ; 8D B2 93
    CPX $5A01            ; EC 01 5A
    BRK $00              ; 00 00
    SED                  ; F8
    BRK $FC              ; 00 FC
    SED                  ; F8
    INC $FA0C,X          ; FE 0C FA
    BEQ $9208            ; F0 7D
    CPX #$DE             ; E0 DE
    PEA $32EB            ; F4 EB 32
    BRK $00              ; 00 00
    SED                  ; F8
    SED                  ; F8
    TSB $04              ; 04 04
    BRK $F0              ; 00 F0
    PEA $FD0C            ; F4 0C FD
    ORA $0FCB,X          ; 1D CB 0F
    AND $00CF            ; 2D CF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $07              ; 00 07
    BRK $0F              ; 00 0F
    ORA $95              ; 07 95
    ASL $8BDB            ; 0E DB 8B
    AND $41              ; 37 41
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $07              ; 07 07
    PHP                  ; 08
    PHP                  ; 08
    STA $91              ; 91 91
    MVP $88CC            ; 44 CC 88
    DEY                  ; 88
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SEI                  ; 78
    LDA $77FF9E,X        ; BF 9E FF 77
    LDX $DFB9,Y          ; BE B9 DF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $0000FF,X        ; FF FF 00 00
    AND $00FF40,X        ; 3F 40 FF 00
    ROR $3F41,X          ; 7E 41 3F
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SEC                  ; 38
    BPL $923F            ; 10 38
    BPL $9281            ; 10 78
    BMI $91DB            ; 30 D0
    RTS                  ; 60
    BNE $91EE            ; D0 E0
    BCC $9200            ; 90 F0
    BRK $00              ; 00 00
    BPL $9224            ; 10 10
    PLP                  ; 28
    PLP                  ; 28
    PLP                  ; 28
    PLP                  ; 28
    BVC $9262            ; 50 48
    LDY #$90             ; A0 90
    RTI                  ; 40
    BMI $91CF            ; 30 B0
    RTI                  ; 40
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    CLI                  ; 58
    AND $56              ; 37 56
    AND $176D,X          ; 3D 6D 17
    AND $0F3707,X        ; 3F 07 37 0F
    PHD                  ; 0B
    ORA $04              ; 07 04
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $00              ; 03 00
    ORA $000700          ; 0F 00 07 00
    ORA $01              ; 07 01
    ASL $06              ; 06 06
    ORA $F0              ; 01 F0
    BPL $929B            ; 10 F8
    PHP                  ; 08
    INC $1100            ; EE 00 11
    CPX #$01             ; E0 01
    BEQ $9274            ; F0 C9
    BEQ $92BA            ; F0 0D
    PHP                  ; 08
    ORA $00              ; 01 00
    SBC $0F071F          ; EF 1F 07 0F
    ORA $F1              ; 01 F1
    BRK $F8              ; 00 F8
    JSR $F0F8            ; 20 F8 F0
    TSB $F008            ; 0C 08 F0
    BRK $FC              ; 00 FC
    ORA $00              ; 03 00
    ORA $02              ; 05 02
    TCS                  ; 1B
    ASL $37              ; 06 37
    ASL $1EE7            ; 0E E7 1E
    DEC $3C              ; C6 3C
    STX $7C              ; 86 7C
    LDX $7C              ; A6 7C
    INC $FCFC,X          ; FE FC FC
    SED                  ; F8
    SED                  ; F8
    CPX #$F1             ; E0 F1
    CPY #$E1             ; C0 E1
    BRK $C2              ; 00 C2
    BRK $82              ; 00 82
    BRK $82              ; 00 82
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $0F              ; 00 0F
    ORA $1C              ; 03 1C
    ORA $6F1C33          ; 0F 33 1C 6F
    AND $DF              ; 33 DF
    ROR $D9BE            ; 6E BE D9
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    TSB $100C            ; 0C 0C 10
    BPL $9319            ; 10 20
    AND $43              ; 23 43
    JMP $918E            ; 4C 8E 91
    ORA $3F26,Y          ; 19 26 3F
    BRK $F8              ; 00 F8
    AND $FFC3,Y          ; 39 C3 FF
    AND $FEC3,X          ; 3D C3 FE
    ORA $FCE7,X          ; 1D E7 FC
    STA $1A7A            ; 8D 7A 1A
    PEA $3F3F            ; F4 3F 3F
    DEC $C0              ; C6 C0
    BRK $00              ; 00 00
    BRK $3C              ; 00 3C
    ASL $FFE2,X          ; 1E E2 FF
    ORA $7C              ; 03 7C
    STY $F8              ; 84 F8
    PHP                  ; 08
    BRK $00              ; 00 00
    BRA $9324            ; 80 00
    RTI                  ; 40
    BRK $60              ; 00 60
    RTI                  ; 40
    BCS $92CA            ; B0 A0
    BEQ $934C            ; F0 20
    JSR $0100            ; 20 00 01
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $92B5            ; 80 80
    BRK $80              ; 00 80
    RTI                  ; 40
    RTI                  ; 40
    RTS                  ; 60
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TSC                  ; 3B
    ORA $36              ; 17 36
    PHD                  ; 0B
    PHY                  ; 5A
    ORA $3E,X            ; 15 3E
    TCS                  ; 1B
    ORA $0A              ; 17 0A
    AND $0A              ; 37 0A
    ROR $2D,X            ; 76 2D
    STA $281876          ; 8F 76 18 28
    BMI $9384            ; 30 30
    RTL                  ; 6B
    PHK                  ; 4B
    JSR $1420            ; 20 20 14
    TRB $24              ; 14 24
    BIT $42              ; 24 42
    WDM $88              ; 42 88
    DEY                  ; 88
    LSR $ABE1,X          ; 5E E1 AB
    CMP $267C1F,X        ; DF 1F 7C 26
    SBC $93,X            ; F5 93
    SBC $D0EF,X          ; FD EF D0
    TXY                  ; 9B
    CPX $07              ; E4 07
    SED                  ; F8
    ASL $200E            ; 0E 0E 20
    LDY #$82             ; A0 82
    BRL $9582            ; 82 0A 02
    COP $02              ; 02 02
    PLD                  ; 2B
    PLD                  ; 2B
    ORA $0519,Y          ; 19 19 05
    ORA $EE              ; 05 EE
    SBC $BF              ; F3 BF
    CMP $FD              ; C1 FD
    ORA $60F0,Y          ; 19 F0 60
    BRA $930A            ; 80 80
    PLA                  ; 68
    CPX #$30             ; E0 30
    CPY #$B0             ; C0 B0
    CPX #$03             ; E0 03
    TSB $3E31            ; 0C 31 3E
    CMP $E0E6,Y          ; D9 E6 E0
    STA $7000,X          ; 9D 00 70
    CLC                  ; 18
    PHP                  ; 08
    BMI $93CE            ; 30 30
    BRK $00              ; 00 00
    XCE                  ; FB
    PHD                  ; 0B
    JSR ($F0F7,X)        ; FC F7 F0
    LDA $FEFE83,X        ; BF 83 FE FE
    BEQ $93C7            ; F0 1C
    SED                  ; F8
    CLD                  ; D8
    RTS                  ; 60
    JSR $F700            ; 20 00 F7
    BEQ $93B9            ; F0 06
    ORA #$3D             ; 09 3D
    WDM $FE              ; 42 FE
    ORA $F0              ; 01 F0
    ASL $04F8            ; 0E F8 04
    RTS                  ; 60
    TYA                  ; 98
    BRK $60              ; 00 60
    JSR $40E0            ; 20 E0 40
    BRA $9345            ; 80 80
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    XCE                  ; FB
    CMP $BF              ; D7 BF
    SBC $DC              ; E3 DC
    LDA $F00FC0,X        ; BF C0 0F F0
    ORA #$09             ; 09 09
    ROL $A6              ; 26 A6
    STA $81              ; 81 81
    TSB $00              ; 04 00
    RTI                  ; 40
    RTI                  ; 40
    AND $23              ; 23 23
    BIT $0D3C,X          ; 3C 3C 0D
    ORA $00C0            ; 0D C0 00
    AND $FFCFC0,X        ; 3F C0 CF FF
    ADC $DFB6E1,X        ; 7F E1 B6 DF
    TDC                  ; 7B
    ORA $04AC            ; 0D AC 04
    BCC $93D0            ; 90 C0
    CPY #$C0             ; C0 C0
    AND $00003F,X        ; 3F 3F 00 00
    ORA $1E              ; 11 1E
    AND $F20D20,X        ; 3F 20 0D F2
    STY $FB              ; 84 FB
    BPL $945C            ; 10 3C
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    TSB $00              ; 04 00
    TSB $00              ; 04 00
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $02              ; 07 02
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $F0              ; 00 F0
    BRK $E0              ; 00 E0
    BRK $C0              ; 00 C0
    ORA $00              ; 01 00
    ORA $00              ; 03 00
    COP $01              ; 02 01
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    LDX $F44C,Y          ; BE 4C F4
    PHP                  ; 08
    STY $68,X            ; 94 68
    TSB $F8              ; 04 F8
    PEA $FCF8            ; F4 F8 FC
    CLC                  ; 18
    JSR ($F408,X)        ; FC 08 F4
    BRK $32              ; 00 32
    BRK $74              ; 00 74
    BRK $10              ; 00 10
    BRK $F0              ; 00 F0
    BRK $F8              ; 00 F8
    BRK $18              ; 00 18
    CPX #$08             ; E0 08
    BEQ $949F            ; F0 00
    SED                  ; F8
    COP $01              ; 02 01
    TSB $03              ; 04 03
    ORA $02              ; 05 02
    ORA #$06             ; 09 06
    PHD                  ; 0B
    ORA $0A              ; 05 0A
    TSB $08              ; 04 08
    TSB $04              ; 04 04
    BRK $02              ; 00 02
    COP $04              ; 02 04
    TSB $04              ; 04 04
    ORA $08              ; 05 08
    ORA #$09             ; 09 09
    ASL                  ; 0A
    PHP                  ; 08
    PHD                  ; 0B
    PHP                  ; 08
    ASL                  ; 0A
    TSB $04              ; 04 04
    ROR $D4B3,X          ; 7E B3 D4
    ADC $A4              ; 63 A4
    LDA $A8              ; A3 A8
    AND $09              ; 27 09
    ORA $0D              ; 07 0D
    ORA $04              ; 07 04
    COP $02              ; 02 02
    BRK $33              ; 00 33
    JMP $9D62            ; 4C 62 9D
    LDY #$57             ; A0 57
    AND $CA              ; 25 CA
    ORA $AA              ; 05 AA
    ORA $08              ; 07 08
    COP $05              ; 02 05
    BRK $02              ; 00 02
    ADC $21F6,Y          ; 79 F6 21
    INC $FE57,X          ; FE 57 FE
    XCE                  ; FB
    SBC $FE              ; F7 FE
    ADC $9F              ; 61 9F
    CMP $57              ; C7 57
    MVP $0206            ; 44 06 02
    SBC $7109,Y          ; F9 09 71
    STA $F1              ; 81 F1
    ORA $F0              ; 01 F0
    PHP                  ; 08
    RTS                  ; 60
    STZ $38C7,X          ; 9E C7 38
    EOR $9B              ; 47 9B
    ORA $54              ; 05 54

Bank_45_Function_15:
    EOR $01              ; 41 01
    ROR $40              ; 66 40
    CLV                  ; B8
    ROL $9D              ; 26 9D
    STA $5B              ; 92 5B
    STA $37F7,X          ; 9D F7 37
    PHX                  ; DA
    DEC                  ; 3A
    REP #$32             ; C2 32
    BRK $01              ; 00 01
    ORA $41              ; 01 41
    CMP $E1              ; C1 E1
    ADC $627D            ; 6D 7D 62
    PER $C0C8            ; 62 C8 C0
    STA $80              ; 85 80
    STA $1F80            ; 8D 80 1F
    ROL $E7              ; 26 E7
    WDM $45              ; 42 45
    ORA $0E              ; 03 0E
    ORA $07              ; 07 07
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $C1              ; 00 C1
    CMP $00              ; C1 00
    RTI                  ; 40
    TSB $04              ; 04 04
    PHP                  ; 08
    ASL                  ; 0A
    ORA $05              ; 05 05
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    EOR $C3              ; 43 C3
    STY $008C            ; 8C 8C 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $06              ; 00 06
    COP $8D              ; 02 8D
    ORA $D5              ; 05 D5
    STX $4B3B            ; 8E 3B 4B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    ORA $04              ; 05 04
    TXA                  ; 8A
    DEY                  ; 88
    EOR $D1              ; 51 D1
    STY $8C              ; 84 8C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPX #$00             ; E0 00
    BVS $960A            ; 70 60
    SEI                  ; 78
    BCS $95A9            ; B0 FC
    PHA                  ; 48
    ROR $00B4,X          ; 7E B4 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $E0              ; 00 E0
    CPX #$90             ; E0 90
    BPL $95C3            ; 10 08
    PHA                  ; 48
    MVP $72B4            ; 44 B4 72
    LSR                  ; 4A
    BRK $00              ; 00 00
    ORA $00              ; 03 00
    TSB $03              ; 04 03
    ORA $0B05            ; 0D 05 0B
    BRK $84              ; 00 84
    BRK $C0              ; 00 C0
    BRA $95EF            ; 80 20
    RTI                  ; 40
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    TSB $04              ; 04 04
    COP $06              ; 02 06
    TSB $04              ; 04 04
    BRA $955C            ; 80 80
    RTI                  ; 40
    CPY #$80             ; C0 80
    BRA $95D9            ; 80 F8
    BRK $7F              ; 00 7F
    SED                  ; F8
    STA $7F              ; 87 7F
    DEC $B1FF            ; CE FF B1
    SBC $6E7FDC,X        ; FF DC 7F 6E
    AND $F87BF7,X        ; 3F F7 7B F8
    SED                  ; F8
    ORA $07              ; 07 07
    BRA $9576            ; 80 80
    ROR $3F00,X          ; 7E 00 3F
    BRK $1D              ; 00 1D
    COP $5E              ; 02 5E
    EOR $9B              ; 41 9B
    STY $01              ; 84 01
    BRK $07              ; 00 07
    ORA $0A              ; 01 0A
    ORA $0A              ; 03 0A
    ORA $85              ; 05 85
    BRK $C1              ; 00 C1
    BRA $95AE            ; 80 A1
    CPY #$5F             ; C0 5F
    SBC $01              ; E1 01
    ORA $06              ; 01 06
    ASL $0C              ; 06 0C
    TSB $0E0A            ; 0C 0A 0E
    STA $85              ; 85 85
    RTI                  ; 40
    CPY #$01             ; C0 01
    STA $0E              ; 81 0E
    ASL $00F0            ; 0E F0 00
    JSR ($0FF0,X)        ; FC F0 0F
    JSR ($FE9A,X)        ; FC 9A FE
    ADC $FF              ; 67 FF
    SBC $FF              ; F3 FF
    CMP $6EBF,Y          ; D9 BF 6E
    LDA $F0,X            ; B5 F0
    BEQ $963F            ; F0 0C
    TSB $0303            ; 0C 03 03
    SBC $7E00,Y          ; F9 00 7E
    BRK $7B              ; 00 7B
    TSB $3F              ; 04 3F
    RTI                  ; 40
    AND $4A,X            ; 35 4A
    EOR $2A,X            ; 55 2A
    AND $1E              ; 21 1E
    INC                  ; 1A
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SEC                  ; 38
    INC $44              ; E6 44
    DEC $04              ; C6 04
    DEC $04              ; C6 04
    BRK $FE              ; 00 FE
    BRK $FC              ; 00 FC
    BRK $7C              ; 00 7C
    BRK $7C              ; 00 7C
    SEC                  ; 38
    CPY #$64             ; C0 64
    CLC                  ; 18
    MVP $4438            ; 44 38 44
    SEC                  ; 38
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $4C              ; 00 4C
    JMP $E0A0            ; 4C A0 E0
    BVC $9686            ; 50 D0
    CPY #$E0             ; C0 E0
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    TSB $04              ; 04 04
    COP $02              ; 02 02
    ASL $06              ; 06 06
    JMP ($FA11,X)        ; 7C 11 FA
    EOR $F1              ; 45 F1
    ASL $97F0,X          ; 1E F0 97
    ADC $99              ; 61 99
    LSR $6BA5,X          ; 5E A5 6B
    LDY $2B,X            ; B4 2B
    PEI $CA              ; D4 CA
    PHA                  ; 48
    STZ $469C            ; 9C 9C 46
    LSR $08              ; 46 08
    BRK $46              ; 00 46
    RTI                  ; 40
    PHA                  ; 48
    PHA                  ; 48
    WDM $40              ; 42 40
    JSR $0021            ; 20 21 00
    BRK $07              ; 00 07
    BRK $3F              ; 00 3F
    ORA $77              ; 07 77
    SEC                  ; 38
    LDA $0B7E40,X        ; BF 40 7E 0B
    ORA $0707            ; 0D 07 07
    COP $00              ; 02 00
    BRK $07              ; 00 07
    ORA $38              ; 07 38
    SEC                  ; 38
    RTI                  ; 40
    EOR $80              ; 47 80
    LDA $07744B,X        ; BF 4B 74 07
    PHP                  ; 08
    COP $05              ; 02 05
    BRK $00              ; 00 00
    SED                  ; F8
    BRK $FC              ; 00 FC
    SED                  ; F8
    INC $FA0C,X          ; FE 0C FA
    BVS $97A8            ; 70 7D
    CPY #$DE             ; C0 DE
    BIT $6B,X            ; 34 6B
    AND $00              ; 32 00
    BRK $F8              ; 00 F8
    SED                  ; F8
    TSB $04              ; 04 04
    BRK $F0              ; 00 F0
    STZ $8C,X            ; 74 8C
    CMP $0B3D,X          ; DD 3D 0B
    CMP $594F2D          ; CF 2D 4F 59
    SBC $AC              ; E7 AC
    STP                  ; DB
    ASL $2B7F,X          ; 1E 7F 2B
    XCE                  ; FB
    CMP $BE              ; D1 BE
    SBC $D8              ; E7 D8
    STA $F807E0,X        ; 9F E0 07 F8
    PHP                  ; 08
    PHP                  ; 08
    BIT $A4              ; 24 A4
    BRA $96D6            ; 80 80
    TSB $00              ; 04 00
    EOR $41              ; 41 41
    AND $27              ; 27 27
    ORA $0519,Y          ; 19 19 05
    ORA $F9              ; 05 F9
    STA $2DE5DB          ; 8F DB E5 2D
    JSR ($887C,X)        ; FC 7C 88
    TYA                  ; 98
    BRK $68              ; 00 68
    CPX #$30             ; E0 30
    CPY #$B0             ; C0 B0
    CPX #$6F             ; E0 6F
    BVS $9788            ; 70 15
    INC                  ; 1A
    TSB $7803            ; 0C 03 78
    ADC $C0,X            ; 75 C0
    LDY $1808,X          ; BC 08 18
    BMI $97AE            ; 30 30
    BRK $00              ; 00 00
    LSR $ABE1,X          ; 5E E1 AB
    CMP $2A7417,X        ; DF 17 74 2A
    SBC $BDD3,X          ; FD D3 BD
    CMP $FC83E0,X        ; DF E0 83 FC
    ORA $F8              ; 07 F8
    ASL $200E            ; 0E 0E 20
    LDY #$8A             ; A0 8A
    BRL $999A            ; 82 02 02
    WDM $42              ; 42 42
    TCS                  ; 1B
    TCS                  ; 1B
    ORA $01              ; 01 01
    ORA $05              ; 05 05
    SBC $CFBBF6          ; EF F6 BB CF
    SBC $FE1F,X          ; FD 1F FE
    TCD                  ; 5B
    LDA $8D              ; B7 8D
    TCD                  ; 5B
    CPY $C422            ; CC 22 C4
    BCS $9790            ; B0 E0
    ORA $09              ; 05 09
    ROL $DF30,X          ; 3E 30 DF
    CPX #$DB             ; E0 DB
    LDY $0D              ; A4 0D
    ADC $0C              ; 72 0C
    AND $24              ; 33 24
    TSC                  ; 3B
    BRK $06              ; 00 06
    EOR $DFAEE0,X        ; 5F E0 AE DF
    ORA $74              ; 17 74
    JSL $B3DDFD          ; 22 FD DD B3
    STP                  ; DB
    CPX $83              ; E4 83
    JSR ($F807,X)        ; FC 07 F8
    ORA $A0200F          ; 0F 0F 20 A0
    DEY                  ; 88
    BRA $97D9            ; 80 02
    COP $48              ; 02 48
    PHA                  ; 48
    TCS                  ; 1B
    TCS                  ; 1B
    ORA $01              ; 01 01
    ORA $05              ; 05 05
    TCD                  ; 5B
    SBC $9F79            ; ED 79 9F
    SBC $46,X            ; F5 46
    CMP $44,X            ; D5 44
    LDY #$80             ; A0 80
    PLA                  ; 68
    CPX #$30             ; E0 30
    CPY #$B0             ; C0 B0
    CPX #$0D             ; E0 0D
    ORA $5F              ; 12 5F
    RTS                  ; 60
    LSR $B9              ; 46 B9
    CPY $BB              ; C4 BB
    RTS                  ; 60
    BIT $18,X            ; 34 18
    PHP                  ; 08
    BMI $982E            ; 30 30
    BRK $00              ; 00 00

Bank_45_Function_18:
    STZ $0FEF,X          ; 9E EF 0F
    ADC #$25             ; 69 25
    TCD                  ; 5B
    PHX                  ; DA
    CPX $86              ; E4 86
    SBC $78B7,Y          ; F9 B7 78
    ROL $71A0,X          ; 3E A0 71
    INC $9010            ; EE 10 90
    STA $84,X            ; 95 84
    LDY $A4              ; A4 A4
    TCS                  ; 1B
    INC                  ; 1A
    TSB $04              ; 04 04
    STA $83              ; 83 83
    MVN $1114            ; 54 14 11
    ORA $E5              ; 11 E5
    SEI                  ; 78
    DEC $1C,X            ; D6 1C
    BIT $C808,X          ; 3C 08 C8
    BRA $97E9            ; 80 C0
    BRA $97AB            ; 80 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $78              ; 00 78
    STA $1C              ; 85 1C
    SEP #$E8             ; E2 E8
    BIT $40,X            ; 34 40
    PHA                  ; 48
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    INC $06              ; E6 06
    CMP $6E21,Y          ; D9 21 6E
    BCC $97E1            ; 90 80
    BRK $00              ; 00 00
    BRK $40              ; 00 40
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BMI $98C9            ; 30 40
    JSR $2050            ; 20 50 20
    JSR $0000            ; 20 00 00
    BRK $11              ; 00 11
    ASL $20,X            ; 16 20
    AND $20              ; 27 20
    AND $4840            ; 2D 40 48
    RTI                  ; 40
    BVC $98EB            ; 50 50
    BVC $98BD            ; 50 20
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $01              ; 03 01
    ORA $02              ; 07 02
    ORA $0D1A05          ; 0F 05 1A 0D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    COP $02              ; 02 02
    TSB $05              ; 04 05
    ORA #$0A             ; 09 0A
    ORA $12              ; 11 12
    ORA $3906,X          ; 1D 06 39
    ASL $1E37,X          ; 1E 37 1E
    EOR $3E753E          ; 4F 3E 75 3E
    EOR $2F16,Y          ; 59 16 2F
    BPL $990D            ; 10 3E
    ORA $18              ; 01 18
    CLC                  ; 18
    JSR $2120            ; 20 20 21
    AND $41              ; 21 41
    EOR $41              ; 41 41
    EOR $68              ; 41 68
    PHA                  ; 48
    AND $222D            ; 2D 2D 22
    JSL $DFC5BF          ; 22 BF C5 DF
    CPX $FD              ; E4 FD
    SBC $9B              ; E3 9B
    STA $89              ; 81 89
    BCC $9943            ; 90 58
    BNE $98C5            ; D0 D8
    BVC $98A7            ; 50 B8
    BVS $9902            ; 70 11
    BPL $98F5            ; 10 02
    BRK $08              ; 00 08
    PHP                  ; 08
    RTS                  ; 60
    BRK $60              ; 00 60
    BRK $20              ; 00 20
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    BRK $02              ; 00 02
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $DC              ; 00 DC
    BNE $991D            ; D0 F6
    STZ $BF,X            ; 74 BF
    DEC $EFD7,X          ; DE D7 EF
    PLB                  ; AB
    ADC $C0FFE9,X        ; 7F E9 FF C0
    CPY #$F0             ; C0 F0
    BMI $9961            ; 30 2C
    TSB $82EA            ; 0C EA 82
    ORA $0C21,Y          ; 19 21 0C
    BPL $98CB            ; 10 8E
    BRA $994E            ; 80 0F
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    STA $FE4FFC          ; 8F FC 4F FE
    ADC $AA              ; 67 AA
    LDA $57              ; A5 57
    DEC $35,X            ; D6 35
    REP #$B1             ; C2 B1
    SEP #$01             ; E2 01
    BRK $6F              ; 00 6F
    BVS $9942            ; 70 CF
    BCS $995C            ; B0 E7
    TYA                  ; 98
    AND $5A              ; 25 5A
    ASL $29              ; 06 29
    AND $3D              ; 32 3D
    COP $05              ; 02 05
    BRK $03              ; 00 03
    CPX #$C0             ; E0 C0
    CPX #$C0             ; E0 C0
    CPX #$C0             ; E0 C0
    CPX #$C0             ; E0 C0
    BVS $996A            ; 70 E0
    BVS $996C            ; 70 E0
    BVS $996E            ; 70 E0
    SEC                  ; 38
    BEQ $9931            ; F0 A0
    JSR $20A0            ; 20 A0 20
    LDY #$20             ; A0 20
    LDY #$20             ; A0 20
    BNE $99AA            ; D0 10
    BNE $99AC            ; D0 10
    BVC $992E            ; 50 90
    INX                  ; E8
    PHP                  ; 08
    LDA $78              ; B7 78
    LDA $EE7130          ; AF 30 71 EE
    ADC $EF              ; 77 EF
    BRA $9A29            ; 80 7F
    SBC $01DE00,X        ; FF 00 DE 01
    ORA $838300,X        ; 1F 00 83 83
    CPY #$80             ; C0 80
    ORA $11              ; 11 11
    BPL $99C8            ; 10 10
    BRA $993A            ; 80 80
    CMP $0202DF,X        ; DF DF 02 02
    TSB $E00C            ; 0C 0C E0
    BRK $80              ; 00 80
    BRK $C0              ; 00 C0
    BRK $30              ; 00 30
    CPY #$E8             ; C0 E8
    CPX #$48             ; E0 48
    CPY #$78             ; C0 78
    BEQ $99BF            ; F0 F0
    BRK $C0              ; 00 C0
    CPY #$00             ; C0 00
    BRK $C0              ; 00 C0
    CPY #$30             ; C0 30
    BMI $99F1            ; 30 18
    PHP                  ; 08
    SEC                  ; 38
    PHP                  ; 08
    PHP                  ; 08
    PHP                  ; 08
    BVS $9A50            ; 70 70
    LDA $7F              ; A3 7F
    CMP $3F              ; C1 3F
    ROR $7F01,X          ; 7E 01 7F
    BRK $D7              ; 00 D7
    ADC $50ED,Y          ; 79 ED 50
    LSR                  ; 4A
    TRB $DA              ; 14 DA
    RTI                  ; 40
    BRA $9972            ; 80 80
    RTI                  ; 40
    RTI                  ; 40
    ASL $710E            ; 0E 0E 71
    ADC $06              ; 71 06
    ASL $88              ; 06 88
    INY                  ; C8
    PLA                  ; 68
    PLA                  ; 68
    LDY $F4,X            ; B4 F4

Bank_45_Function_1A:
    CPY #$00             ; C0 00
    LDY #$80             ; A0 80
    CPX #$C0             ; E0 C0
    JSR $30C0            ; 20 C0 30
    RTI                  ; 40
    SEC                  ; 38
    BEQ $99B9            ; F0 AC
    PHA                  ; 48
    SEI                  ; 78
    JSR $C0C0            ; 20 C0 C0
    RTS                  ; 60
    JSR $2020            ; 20 20 20
    BRK $00              ; 00 00
    BCS $9A4A            ; B0 30
    PHP                  ; 08
    CLC                  ; 18
    BIT $3C,X            ; 34 3C
    CLI                  ; 58
    SEI                  ; 78
    RTS                  ; 60
    AND $1E1E31,X        ; 3F 31 1E 1E
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    CMP $FD              ; C7 FD
    ORA $E75EF3          ; 0F F3 5E E7
    LDX $3ECD,Y          ; BE CD 3E
    ORA $07              ; 07 07
    SEC                  ; 38
    SEC                  ; 38
    CPY #$C7             ; C0 C7
    ORA $38              ; 07 38
    ORA $A15FF0          ; 0F F0 5F A1
    LDA $C13F41,X        ; BF 41 3F C1
    CPY #$00             ; C0 00
    BMI $9AA4            ; 30 40
    CLI                  ; 58
    BNE $99F3            ; D0 8C
    PHA                  ; 48
    SED                  ; F8
    BRK $81              ; 00 81
    BRK $91              ; 00 91
    ORA $FA              ; 01 FA
    BCC $9A31            ; 90 C0
    CPY #$B0             ; C0 B0
    BMI $9A95            ; 30 20
    BMI $9A27            ; 30 B0
    CLV                  ; B8
    CPY #$C0             ; C0 C0
    BRK $00              ; 00 00
    BRA $99FF            ; 80 81
    EOR $51              ; 41 51
    BRK $00              ; 00 00
    ORA $00              ; 03 00
    ASL $1B03            ; 0E 03 1B
    TSB $152F            ; 0C 2F 15
    ROR $BD2B,X          ; 7E 2B BD
    EOR $B3              ; 57 B3
    ROR $00              ; 66 00
    BRK $03              ; 00 03
    ORA $0C              ; 03 0C
    TSB $1310            ; 0C 10 13
    AND $2A              ; 25 2A
    PHK                  ; 4B
    MVN $A897            ; 54 97 A8
    LDX $99              ; A6 99
    CPX #$00             ; E0 00
    CLD                  ; D8
    CPY #$CC             ; C0 CC
    PLP                  ; 28
    SBC $61C0,Y          ; F9 C0 61
    STA $DA              ; 81 DA
    BCS $9AEA            ; B0 3D
    NOP                  ; EA
    NOP                  ; EA
    STA $E0              ; 91 E0
    CPX #$38             ; E0 38
    CLC                  ; 18
    TRB $CC              ; 14 CC
    SBC $21              ; E1 21
    CPY #$41             ; C0 41
    WAI                  ; CB
    TCD                  ; 5B
    STA $19              ; 91 19
    STX $406A            ; 8E 6A 40
    BRK $E0              ; 00 E0
    RTI                  ; 40
    JMP ($6F20,X)        ; 7C 20 6F
    TRB $073B            ; 1C 3B 07
    AND $0F1B18,X        ; 3F 18 1B 0F
    ORA $404004          ; 0F 04 40 40
    LDY #$A0             ; A0 A0
    TRB $035C            ; 1C 5C 03
    ADC $00              ; 63 00
    SEC                  ; 38
    CLC                  ; 18
    AND $0F              ; 27 0F
    BPL $9AE3            ; 10 04
    PHD                  ; 0B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRA $9AE8            ; 80 00
    JSR ($FF80,X)        ; FC 80 FF
    ROR $34DE,X          ; 7E DE 34
    XBA                  ; EB
    EOR $00              ; 52 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $9B71            ; 80 78
    SEI                  ; 78
    ORA $83              ; 01 83
    PHD                  ; 0B
    CMP $07AF4D          ; CF 4D AF 07
    BRK $0B              ; 00 0B
    ORA $1B              ; 07 1B
    ORA $F217BD          ; 0F BD 17 F2
    STA $5F              ; 83 5F
    COP $B3              ; 02 B3
    CMP $521F,X          ; DD 1F 52
    ORA $07              ; 07 07
    PHP                  ; 08
    PHP                  ; 08
    ORA $00              ; 03 00
    LDA $B0              ; A1 B0
    ADC $F0              ; 71 F0
    STZ $239D            ; 9C 9D 23
    LDX #$A2             ; A2 A2
    STA $00              ; 85 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    JMP ($166B,X)        ; 7C 6B 16
    EOR $02,X            ; 55 02
    TSX                  ; BA
    JSR $0064            ; 20 64 00
    BRK $00              ; 00 00
    TRB $001C            ; 1C 1C 00
    BRK $80              ; 00 80
    CPY #$40             ; C0 40
    RTI                  ; 40
    JSR $C620            ; 20 20 C6
    INC $64              ; E6 64
    STZ $00              ; 64 00
    BRK $70              ; 00 70
    CPX #$08             ; E0 08
    BCC $9B73            ; 90 EE
    CLC                  ; 18
    PLD                  ; 2B
    ORA $16              ; 12 16
    BRK $1C              ; 00 1C
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $68              ; 00 68
    PHP                  ; 08
    ROR $66              ; 66 66
    ORA $0E0F            ; 0D 0F 0E
    ASL $1C14            ; 0E 14 1C
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    STZ $00,X            ; 74 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $00              ; 05 00
    PHD                  ; 0B
    TSB $06              ; 04 06
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $00              ; 05 00
    ORA $001F00          ; 0F 00 1F 00
    AND $CB3F00,X        ; 3F 00 3F CB
    ROR $FC9B,X          ; 7E 9B FC
    TXY                  ; 9B
    INX                  ; E8
    RTI                  ; 40
    JSR $0023            ; 20 23 00
    TSB $00              ; 04 00
    COP $01              ; 02 01
    COP $01              ; 02 01
    LSR $DCA1,X          ; 5E A1 DC
    AND $C8              ; 23 C8
    AND $20              ; 37 20
    LSR                  ; 4A
    ORA $23              ; 03 23
    ORA $04              ; 07 04
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $9E4A            ; ED 4A 9E
    ADC $CBF9            ; 6D F9 CB
    SBC $0E              ; F2 0E
    CMP $0D,X            ; D5 0D
    PHY                  ; 5A
    SBC $8EB9,Y          ; F9 B9 8E
    CMP $B5EE,X          ; DD EE B5
    LDA $9010,X          ; BD 10 90
    PEA $F130            ; F4 30 F1
    BEQ $9C2B            ; F0 F2
    BNE $9C3F            ; D0 04
    BRK $52              ; 00 52
    ORA $01              ; 12 01
    ORA $CA              ; 01 CA
    ASL $0C              ; 06 0C
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ROL $7C              ; 26 7C
    AND $2E              ; 37 2E
    ORA $25              ; 13 25
    INC                  ; 1A
    SBC $0B              ; F7 0B
    DEC                  ; 3A
    CLD                  ; D8
    INC                  ; 1A
    CLC                  ; 18
    CPY #$80             ; C0 80
    PHY                  ; 5A
    LSR                  ; 4A
    RTI                  ; 40
    RTI                  ; 40
    PLP                  ; 28
    PLP                  ; 28
    BIT $25              ; 24 25
    SBC $E4              ; E5 E4
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    PHY                  ; 5A
    ORA $3E,X            ; 15 3E
    TCS                  ; 1B
    ORA $0A              ; 17 0A
    AND $0A              ; 37 0A
    ROR $2D,X            ; 76 2D
    STA $C83876          ; 8F 76 38 C8
    BMI $9CE4            ; 30 30
    RTL                  ; 6B
    PHK                  ; 4B
    JSR $1420            ; 20 20 14
    TRB $24              ; 14 24
    BIT $42              ; 24 42
    WDM $88              ; 42 88
    DEY                  ; 88
    LDX $EC,Y            ; B6 EC
    PLB                  ; AB
    DEC $1D,X            ; D6 1D
    INC $3E              ; E6 3E
    LDY #$E6             ; A0 E6
    CLD                  ; D8
    CMP $027E7E          ; CF 7E 7E 02
    CLC                  ; 18
    ORA $02              ; 07 02
    STA $29              ; 83 29
    AND #$00             ; 29 00
    BRK $4C              ; 00 4C
    TSB $2626            ; 0C 26 26
    STA $81              ; 81 81
    AND $083C,X          ; 3D 3C 08
    PHP                  ; 08
    ORA $01              ; 03 01
    ASL $02              ; 06 02
    ORA $00              ; 05 00
    BRL $5CE9            ; 82 00 C0
    BRA $9CAB            ; 80 C0
    BRA $9D1D            ; 80 30
    RTI                  ; 40
    EOR $0100F0          ; 4F F0 00 01
    ORA $03              ; 01 03
    COP $02              ; 02 02
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRK $80              ; 00 80
    BRA $9C7E            ; 80 80
    ORA $07              ; 07 07

Bank_45_Function_1D:
    CMP $FF              ; C3 FF
    INX                  ; E8
    ADC $3F3FF6,X        ; 7F F6 3F 3F
    ORA $160F19,X        ; 1F 19 0F 16
    ORA $2F              ; 07 2F
    ORA $1DFB,X          ; 1D FB 1D
    ORA $808F00,X        ; 1F 00 8F 80
    ORA $00              ; 07 00
    ORA $00              ; 07 00
    ORA $00              ; 03 00
    PHD                  ; 0B
    BRK $21              ; 00 21
    JSL $1EE2E1          ; 22 E1 E2 1E
    SED                  ; F8
    ADC $FE              ; 67 FE
    ORA $86FF,Y          ; 19 FF 86
    SBC $E0FFC1,X        ; FF C1 FF E0
    SBC $3BBF70,X        ; FF 70 BF 3B
    JMP $0606            ; DC 06 06
    SBC $01              ; E1 01
    SED                  ; F8
    BRK $BE              ; 00 BE
    RTI                  ; 40
    SBC $0CF310          ; EF 10 F3 0C
    LDA $DC46,Y          ; B9 46 DC
    AND $00              ; 23 00
    BRK $80              ; 00 80
    BRK $C0              ; 00 C0
    BRA $9DA7            ; 80 60
    CPY #$90             ; C0 90
    CPY #$C8             ; C0 C8
    CPX #$64             ; E0 64
    BCS $9D85            ; B0 36
    JMP $0000            ; DC 00 00
    BRA $9CD4            ; 80 80
    RTI                  ; 40
    RTI                  ; 40
    JSR $B020            ; 20 20 B0
    BPL $9D33            ; 10 D8
    PHP                  ; 08
    LDY $D244            ; AC 44 D2
    JSL $E00000          ; 22 00 00 E0
    BRK $3F              ; 00 3F
    JSR $3CDC            ; 20 DC 3C
    SBC $FF3EC0,X        ; FF C0 3E FF
    STA $FF              ; 83 FF
    SBC $00001C,X        ; FF 1C 00 00
    CPX #$E0             ; E0 E0
    CMP $C0031F,X        ; DF 1F 03 C0
    CPY #$3F             ; C0 3F
    SBC $00FF00,X        ; FF 00 FF 00
    TRB $0CE3            ; 1C E3 0C
    ORA $0F              ; 05 0F
    ORA $0A              ; 07 0A
    ORA $04              ; 07 04
    ORA $09              ; 03 09
    ORA $16              ; 07 16
    ORA $251F2E          ; 0F 2E 1F 25
    INC                  ; 1A
    ASL                  ; 0A
    BRK $08              ; 00 08
    BRK $08              ; 00 08
    BRK $04              ; 00 04
    BRK $08              ; 00 08
    BRK $10              ; 00 10
    BRK $00              ; 00 00
    BRK $04              ; 00 04
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BPL $9DDF            ; 10 1C
    ORA $241029          ; 0F 29 10 24
    CLC                  ; 18
    ORA $00E000,X        ; 1F 00 E0 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BPL $9E01            ; 10 2F
    ORA $072000,X        ; 1F 00 20 07
    JSR $1F03            ; 20 03 1F
    ORA $FFFFFF,X        ; 1F FF FF FF
    SBC $08FFFF,X        ; FF FF FF 08
    PHP                  ; 08
    BIT $362C            ; 2C 2C 36
    ROL $FFE1,X          ; 3E E1 FF
    LSR $7E,X            ; 56 7E
    DEC                  ; 3A
    DEC                  ; 3A
    PHP                  ; 08
    PHP                  ; 08
    BRK $00              ; 00 00
    PHP                  ; 08
    BRK $2C              ; 00 2C
    BRK $3E              ; 00 3E
    BRK $FF              ; 00 FF
    PHP                  ; 08
    ROR $3A00,X          ; 7E 00 3A
    BRK $08              ; 00 08
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $07              ; 00 07
    ORA $08              ; 03 08
    ORA $0E              ; 03 0E
    ORA $05              ; 07 05
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    ORA $04              ; 03 04
    TSB $0C              ; 04 0C
    PHP                  ; 08
    PHP                  ; 08
    PHP                  ; 08
    ORA $05              ; 05 05
    EOR $936D,Y          ; 59 6D 93
    JMP ($74AB)          ; 6C AB 74
    TDC                  ; 7B
    LDA $55,X            ; B5 55
    TYX                  ; BB
    ADC $A065A9          ; 6F A9 65 A0
    PEI $30              ; D4 30
    STA $10              ; 92 10
    STA $90              ; 91 90
    DEY                  ; 88
    BIT #$09             ; 89 09
    PHP                  ; 08
    MVP $5044            ; 44 44 50
    RTI                  ; 40
    CLI                  ; 58
    RTI                  ; 40
    PHA                  ; 48
    RTI                  ; 40
    ORA $00              ; 01 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ORA $00              ; 01 00
    ORA $01              ; 03 01
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    COP $03              ; 02 03
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP $C437E9,X        ; DF E9 37 C4
    PLX                  ; FA
    PHP                  ; 08
    SBC $08              ; F2 08
    LDA $A746            ; AD 46 A7
    ORA $4B              ; 03 4B
    TSB $0B              ; 04 0B
    COP $10              ; 02 10
    BPL $9E9D            ; 10 2A
    JSL $A64246          ; 22 46 42 A6
    LDX #$81             ; A2 81
    STA $44              ; 81 44
    EOR $09              ; 45 09
    ORA #$04             ; 09 04
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BRK $40              ; 00 40
    BRK $E0              ; 00 E0
    RTI                  ; 40
    BVS $9EAA            ; 70 20
    JMP ($3F10,X)        ; 7C 10 3F
    TSB $031F            ; 0C 1F 03
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    RTI                  ; 40
    RTI                  ; 40
    LDY #$A0             ; A0 A0
    BPL $9EEA            ; 10 50
    TSB $036C            ; 0C 6C 03
    AND $00              ; 33 00
    TRB $0000            ; 1C 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    LSR                  ; 4A
    AND $F9              ; 31 F9
    BVC $9F19            ; 50 50
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $38              ; 00 38
    SEC                  ; 38
    COP $02              ; 02 02
    ASL                  ; 0A
    ASL                  ; 0A
    AND $61              ; 21 61
    RTI                  ; 40
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $CBBAE7,X        ; 9F E7 BA CB
    ORA $76              ; 07 76
    AND $FE              ; 25 FE
    CMP $5C23A8          ; CF A8 23 5C
    CPY $C1F3            ; CC F3 C1
    INC $9818,X          ; FE 18 98
    BIT $B0,X            ; 34 B0
    BIT #$81             ; 89 81
    BRK $00              ; 00 00
    EOR $C5,X            ; 55 C5
    LDA $A1              ; A1 A1
    TSB $010C            ; 0C 0C 01
    ORA $0F              ; 01 0F
    SBC $3F              ; F3 3F
    CMP $FE              ; C1 FE
    CLC                  ; 18
    TSX                  ; BA
    PHA                  ; 48
    JMP ($19E0)          ; 6C E0 19
    SED                  ; F8
    DEC $C63C,X          ; DE 3C C6
    SEC                  ; 38
    PHD                  ; 0B
    TSB $3E31            ; 0C 31 3E
    CLC                  ; 18
    AND $B8              ; 27 B8
    LDX $1C,Y            ; B6 1C
    ASL $0107            ; 0E 07 01
    REP #$C2             ; C2 C2
    LSR $46              ; 46 46
    STZ $9EE8            ; 9C E8 9E
    CPX $745E            ; EC 5E 74
    LSR $0C54,X          ; 5E 54 0C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $E8              ; 00 E8
    TRB $CC              ; 14 CC
    AND $74              ; 32 74
    TXA                  ; 8A
    MVN $00AA            ; 54 AA 00
    JMP $000800          ; 5C 00 08 00
    BRK $00              ; 00 00
    BRK $3E              ; 00 3E
    MVN $5E5B            ; 54 5B 5E
    ORA $06070A          ; 0F 0A 07 06
    ORA $02              ; 03 02
    ORA $02              ; 01 02
    COP $00              ; 02 00
    BRK $00              ; 00 00
    EOR $AA              ; 52 AA
    EOR $09A1,Y          ; 59 A1 09
    EOR $05,X            ; 55 05
    ORA #$01             ; 09 01
    ORA $01              ; 05 01
    ORA $02              ; 05 02
    COP $00              ; 02 00
    BRK $07              ; 00 07
    ORA $02              ; 03 02
    ORA $07              ; 03 07
    ORA $03              ; 03 03
    ORA $01              ; 01 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    TRB $0403            ; 1C 03 04
    ORA $04              ; 03 04
    ORA $02              ; 01 02
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR                  ; 4A
    BIT $24,X            ; 34 24
    CLC                  ; 18
    CLC                  ; 18
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $03              ; 00 03
    ORA $08              ; 01 08
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $08              ; 00 08
    BRK $84              ; 00 84
    BRK $48              ; 00 48
    BRK $10              ; 00 10
    BRK $00              ; 00 00
    BRK $24              ; 00 24
    BRK $80              ; 00 80
    BRA $9F83            ; 80 C0
    RTI                  ; 40
    DEC $FC4E            ; CE 4E FC
    JMP ($BC7C,X)        ; 7C 7C BC
    JSR ($FE0C,X)        ; FC 0C FE
    ASL $1E7E,X          ; 1E 7E 1E
    ADC $FFBFFF,X        ; 7F FF BF FF
    LDA $FF              ; B1 FF
    STA $FF              ; 83 FF
    EOR $7F              ; 43 7F
    ADC $7F              ; 73 7F
    AND $3F              ; 21 3F
    AND $3F              ; 21 3F
    PLP                  ; 28
    PLP                  ; 28
    BIT $2C              ; 24 2C
    PHY                  ; 5A
    PLY                  ; 7A
    CMP $DF,X            ; D5 DF
    ADC $7F              ; 63 7F
    MVN $227C            ; 54 7C 22
    ROL                  ; 2A
    PHP                  ; 08
    PHP                  ; 08
    PLP                  ; 28
    BRK $2C              ; 00 2C
    BRK $7A              ; 00 7A
    BRK $DF              ; 00 DF
    BRK $7F              ; 00 7F
    PHP                  ; 08
    JMP ($2A08,X)        ; 7C 08 2A
    BRK $08              ; 00 08
    BRK $07              ; 00 07
    BRK $19              ; 00 19
    ASL $37              ; 06 37
    ASL $1A,X            ; 16 1A
    PHP                  ; 08
    TSB $0000            ; 0C 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $04              ; 00 04
    TSB $19              ; 04 19
    ORA $3828,Y          ; 19 28 38
    TRB $1C              ; 14 1C
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ASL $02,X            ; 16 02
    ORA $03              ; 01 03
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $050F0C,X        ; 1F 0C 0F 05
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $0A              ; 17 0A
    AND $0A              ; 37 0A
    ROR $2D,X            ; 76 2D
    STA $F80876          ; 8F 76 08 F8
    BCS $A104            ; B0 70
    RTL                  ; 6B
    WAI                  ; CB
    JSR $14E0            ; 20 E0 14
    TRB $24              ; 14 24
    BIT $42              ; 24 42
    WDM $88              ; 42 88
    DEY                  ; 88
    BRA $A0A2            ; 80 00
    CPX #$80             ; E0 80
    SED                  ; F8
    CPX #$7C             ; E0 7C
    SED                  ; F8
    TXS                  ; 9A
    SED                  ; F8
    EOR $FC              ; 45 FC
    LDA $F3              ; A7 F3
    AND $63              ; 37 63
    BRA $A032            ; 80 80
    RTS                  ; 60
    RTS                  ; 60
    TYA                  ; 98
    CLC                  ; 18
    CPX $04              ; E4 04
    INC $EF02,X          ; FE 02 EF
    ORA $F2              ; 11 F2
    TSB $9462            ; 0C 62 94
    STA $FC              ; 83 FC
    TYX                  ; BB
    JMP ($5CDB,X)        ; 7C DB 5C
    AND $E778B0          ; 2F B0 78 E7
    XCE                  ; FB
    ADC $A0              ; 67 A0
    ADC $012FD0,X        ; 7F D0 2F 01
    ORA $80              ; 01 80
    BRA $A076            ; 80 A1
    STA $48              ; 81 48
    PHP                  ; 08
    CLC                  ; 18
    CLC                  ; 18
    TYA                  ; 98
    TYA                  ; 98
    BRA $A05E            ; 80 80
    BVC $A130            ; 50 50
    INC $3C              ; E6 3C
    PEA $F808            ; F4 08 F8
    BRK $E0              ; 00 E0
    BRK $60              ; 00 60
    BRA $A0C3            ; 80 D8
    CPX #$FE             ; E0 FE
    SED                  ; F8
    AND $40FC,X          ; 3D FC 40
    RTI                  ; 40
    BEQ $A0E4            ; F0 F0
    CPX #$E0             ; E0 E0
    BRK $00              ; 00 00
    RTS                  ; 60
    RTS                  ; 60
    CLC                  ; 18
    CLC                  ; 18
    ASL $06              ; 06 06
    ORA $01              ; 03 01

Bank_45_Function_21:
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BIT $18              ; 24 18
    STZ $18              ; 64 18
