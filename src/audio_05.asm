;==============================================================================
; Dragon Quest III - Audio System (Bank $05)
; Comprehensive code extraction
;==============================================================================

.include "hardware.inc"

.segment "AUDIO_CODE"

Audio_Function_000:
    ORA $83              ; 01 83
    ORA $68              ; 01 68
    JSR $8008            ; 20 08 80
    RTS                  ; 60
    JSL $C1A87A          ; 22 7A A8 C1
    RTS                  ; 60
    LDA #$3C             ; A9 3C
    ORA $20              ; 01 20

Audio_Function_001:
    PHP                  ; 08
    BRA $8074            ; 80 60
    LDA #$3D             ; A9 3D
    ORA $20              ; 01 20

Audio_Function_002:
    PHP                  ; 08
    BRA $807B            ; 80 60
    LDA #$3E             ; A9 3E
    ORA $20              ; 01 20

Audio_Function_003:
    PHP                  ; 08
    BRA $8082            ; 80 60
    LDA #$3F             ; A9 3F
    ORA $20              ; 01 20

Audio_Function_004:
    PHP                  ; 08
    BRA $8089            ; 80 60
    JSR $7B52            ; 20 52 7B
    JSR $7B93            ; 20 93 7B
    JSL $C270E1          ; 22 E1 70 C2
    CMP #$02             ; C9 02
    BRK $B0              ; 00 B0
    ORA $A9              ; 07 A9
    RTI                  ; 40
    BRK $8D              ; 00 8D
    INC $23              ; E6 23
    RTS                  ; 60
    LDA #$03             ; A9 03
    ORA $20              ; 01 20

Audio_Function_005:
    PHP                  ; 08
    BRA $80A6            ; 80 60
    JSL $C012D1          ; 22 D1 12 C0
    AND #$03             ; 29 03
    BRK $0A              ; 00 0A
    TAX                  ; AA
    LDA $C28089,X        ; BF 89 80 C2
    STA $BE77            ; 8D 77 BE
    JSL $C1A867          ; 22 67 A8 C1
    SBC $2200,X          ; FD 00 22
    CMP $12              ; D1 12
    CPY #$29             ; C0 29
    ORA $00              ; 03 00
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C28091,X        ; BF 91 80 C2
    STA $BE77            ; 8D 77 BE
    JSL $C1A867          ; 22 67 A8 C1
    INC $2200,X          ; FE 00 22
    CMP $12              ; D1 12
    CPY #$29             ; C0 29
    ORA $00              ; 03 00
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C28099,X        ; BF 99 80 C2
    STA $BE77            ; 8D 77 BE
    JSL $C1A867          ; 22 67 A8 C1
    SBC $EA6000,X        ; FF 00 60 EA
    COP $EB              ; 02 EB
    COP $EC              ; 02 EC
    COP $ED              ; 02 ED
    COP $EE              ; 02 EE
    COP $EF              ; 02 EF
    COP $F0              ; 02 F0
    COP $F1              ; 02 F1
    COP $F2              ; 02 F2
    COP $F3              ; 02 F3
    COP $F4              ; 02 F4
    COP $F5              ; 02 F5
    COP $22              ; 02 22
    ADC $A8              ; 67 A8
    CMP $F7              ; C1 F7
    BRK $22              ; 00 22
    ADC $A8              ; 67 A8
    CMP $F8              ; C1 F8
    BRK $60              ; 00 60
    LDA #$F7             ; A9 F7
    BRK $20              ; 00 20

Audio_Function_006:
    PHP                  ; 08
    BRA $8115            ; 80 60
    JSL $C1E32E          ; 22 2E E3 C1
    EOR #$00             ; 49 00
    JSL $C1E59C          ; 22 9C E5 C1
    EOR #$00             ; 49 00
    BCS $80C9            ; B0 06
    JSL $C028B4          ; 22 B4 28 C0
    BRA $80BB            ; 80 F2
    JSL $C1A867          ; 22 67 A8 C1
    ORA $00              ; 01 00
    JSR $7B52            ; 20 52 7B
    JSR $7B93            ; 20 93 7B
    JSL $C270E1          ; 22 E1 70 C2
    JSL $C0133E          ; 22 3E 13 C0
    BEQ $80F3            ; F0 14
    LDX #$00             ; A2 00
    BRK $22              ; 00 22
    ORA $14              ; 07 14
    CPY #$90             ; C0 90
    PHD                  ; 0B
    STA $23E6            ; 8D E6 23
    STA $23E8            ; 8D E8 23
    LDA #$F4             ; A9 F4
    BRK $80              ; 00 80
    ORA #$A9             ; 09 A9
    RTI                  ; 40
    BRK $8D              ; 00 8D
    INC $23              ; E6 23
    LDA #$F5             ; A9 F5
    BRK $20              ; 00 20

Audio_Function_007:
    PHP                  ; 08
    BRA $8160            ; 80 60
    JSL $C1A867          ; 22 67 A8 C1
    SBC $D12200          ; EF 00 22 D1
    ORA $C0              ; 12 C0
    LSR                  ; 4A
    BCC $8113            ; 90 06
    LDA #$D6             ; A9 D6
    BRK $20              ; 00 20
    DEC $75              ; C6 75
    RTS                  ; 60
    JSL $C012D1          ; 22 D1 12 C0
    LSR                  ; 4A
    BCS $814F            ; B0 34
    LDY $23E4            ; AC E4 23
    CPY $23E6            ; CC E6 23
    BEQ $814F            ; F0 2C
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    ADC $C2CB,Y          ; 79 CB C2
    EOR $20              ; 52 20
    COP $00              ; 02 00
    LDA $23E6            ; AD E6 23
    JSL $C2CB79          ; 22 79 CB C2
    MVN $1F20            ; 54 20 1F
    BRK $A9              ; 00 A9
    ASL $00              ; 06 00
    JSL $C2CB79          ; 22 79 CB C2
    EOR $20              ; 53 20
    BEQ $8144            ; F0 00
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C2BB7A,X        ; BF 7A BB C2
    JSL $C1A87A          ; 22 7A A8 C1
    RTS                  ; 60
    LDA #$40             ; A9 40
    BRK $8D              ; 00 8D
    INC $23              ; E6 23
    LDY $23E4            ; AC E4 23
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    ADC $C2CB,Y          ; 79 CB C2
    EOR $20              ; 52 20
    COP $00              ; 02 00
    LDA $23E4            ; AD E4 23
    JSL $C2CB79          ; 22 79 CB C2
    MVN $1F20            ; 54 20 1F
    BRK $A9              ; 00 A9

Audio_Function_008:
    PHP                  ; 08
    BRK $22              ; 00 22
    ADC $C2CB,Y          ; 79 CB C2
    EOR $20              ; 53 20
    BEQ $8179            ; F0 00
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C2BB7A,X        ; BF 7A BB C2
    JSL $C1A87A          ; 22 7A A8 C1
    RTS                  ; 60
    JSL $C2C739          ; 22 39 C7 C2

Audio_Function_009:
    PHP                  ; 08
    JSL $C2C766          ; 22 66 C7 C2
    BRK $22              ; 00 22
    DEC $C7              ; C6 C7

Audio_Function_00A:
    REP #$28             ; C2 28
    JSL $C2C7C6          ; 22 C6 C7 C2
    CLC                  ; 18
    JSL $C2C7C6          ; 22 C6 C7 C2
    TRB $22              ; 14 22
    DEC $C7              ; C6 C7

Audio_Function_00B:
    REP #$20             ; C2 20
    JSL $C270E1          ; 22 E1 70 C2
    CMP #$02             ; C9 02
    BRK $B0              ; 00 B0
    ORA $40A9            ; 0D A9 40
    BRK $8D              ; 00 8D
    INC $23              ; E6 23
    JSL $C1A867          ; 22 67 A8 C1
    SBC $00              ; E7 00
    RTS                  ; 60
    JSL $C012D1          ; 22 D1 12 C0
    LSR                  ; 4A
    BCS $81C6            ; B0 07
    JSL $C1A867          ; 22 67 A8 C1
    SBC $00              ; E5 00
    RTS                  ; 60
    LDA #$D3             ; A9 D3
    BRK $20              ; 00 20
    DEC $75              ; C6 75
    JSL $C1A867          ; 22 67 A8 C1
    INC $00              ; E6 00
    RTS                  ; 60
    LDA $23E4            ; AD E4 23
    STA $2428            ; 8D 28 24
    JSL $C2BE8A          ; 22 8A BE C2
    ROL $07B0            ; 2E B0 07
    JSL $C1A867          ; 22 67 A8 C1
    SBC $00              ; E1 00
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    SBC $00              ; E3 00
    RTS                  ; 60
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    ROL $C013,X          ; 3E 13 C0
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C28205,X        ; BF 05 82 C2
    STA $BE77            ; 8D 77 BE
    JSL $C1A867          ; 22 67 A8 C1
    BNE $8204            ; D0 00
    RTS                  ; 60
    EOR $01ED03          ; 4F 03 ED 01
    TRB $02              ; 14 02
    SBC #$02             ; E9 02
    ORA $6C02,X          ; 1D 02 6C
    BRK $AD              ; 00 AD
    CPX $23              ; E4 23
    STA $2428            ; 8D 28 24
    JSL $C2BE8A          ; 22 8A BE C2
    ROL $07B0            ; 2E B0 07
    JSL $C1A867          ; 22 67 A8 C1
    INY                  ; C8
    BRK $60              ; 00 60
    JSL $C1A867          ; 22 67 A8 C1
    CMP #$00             ; C9 00
    RTS                  ; 60
    JSL $C012D1          ; 22 D1 12 C0
    AND #$03             ; 29 03
    BRK $D0              ; 00 D0
    ORA $22              ; 07 22
    ADC $A8              ; 67 A8
    CMP $C0              ; C1 C0
    BRK $60              ; 00 60
    LDA #$C8             ; A9 C8
    BRK $20              ; 00 20
    DEC $75              ; C6 75
    JSL $C1A867          ; 22 67 A8 C1
    CPY $00              ; C4 00
    RTS                  ; 60
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    ROL $C013,X          ; 3E 13 C0
    INC                  ; 1A
    STA $BE81            ; 8D 81 BE
    STZ $BE82            ; 9C 82 BE
    JSL $C1A867          ; 22 67 A8 C1
    LDX $6000,Y          ; BE 00 60
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    ROL $C013,X          ; 3E 13 C0
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C28270,X        ; BF 70 82 C2
    JSL $C1A87A          ; 22 7A A8 C1
    RTS                  ; 60
    LDA $00              ; B1 00
    LDA $00,X            ; B5 00
    LDX $00,Y            ; B6 00
    LDA $00              ; B7 00
    CLV                  ; B8
    BRK $B9              ; 00 B9
    BRK $BA              ; 00 BA
    BRK $BB              ; 00 BB
    BRK $BC              ; 00 BC
    BRK $22              ; 00 22
    CMP $12              ; D1 12
    CPY #$29             ; C0 29
    ORA $00              ; 03 00
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C282B5,X        ; BF B5 82 C2
    STA $BE77            ; 8D 77 BE
    JSL $C1E32E          ; 22 2E E3 C1
    ADC $00              ; 65 00
    JSL $C1A867          ; 22 67 A8 C1
    LDY $2200            ; AC 00 22
    CMP $12              ; D1 12
    CPY #$29             ; C0 29
    ORA $00              ; 03 00
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C282BD,X        ; BF BD 82 C2
    STA $BE77            ; 8D 77 BE
    JSL $C1A867          ; 22 67 A8 C1
    LDA $6000            ; AD 00 60
    SBC $02              ; E1 02

Audio_Function_00C:
    SEP #$02             ; E2 02
    SBC $02              ; E3 02
    CPX $02              ; E4 02
    SBC $02              ; E5 02
    INC $02              ; E6 02
    SBC $02              ; E7 02
    INX                  ; E8
    COP $22              ; 02 22
    CMP $12              ; D1 12
    CPY #$4A             ; C0 4A
    BCC $82D3            ; 90 07
    LDA $23E4            ; AD E4 23
    STA $23E6            ; 8D E6 23
    SEC                  ; 38
    RTS                  ; 60
    LDA #$9C             ; A9 9C
    BRK $48              ; 00 48
    JSR $82C5            ; 20 C5 82
    BCC $82E2            ; 90 05
    LDA #$9D             ; A9 9D
    BRK $83              ; 00 83
    ORA $AD              ; 01 AD
    INC $23              ; E6 23
    STA $23E8            ; 8D E8 23
    PLA                  ; 68
    JSL $C1A87A          ; 22 7A A8 C1
    JSL $C1AE9F          ; 22 9F AE C1
    RTS                  ; 60
    JSL $C012D1          ; 22 D1 12 C0
    AND #$07             ; 29 07
    BRK $D0              ; 00 D0
    PHD                  ; 0B
    JSL $C1A867          ; 22 67 A8 C1
    STX $00,Y            ; 96 00
    JSL $C1AE9F          ; 22 9F AE C1
    RTS                  ; 60
    LDA #$40             ; A9 40
    BRK $8D              ; 00 8D
    INC $23              ; E6 23
    JSL $C1A867          ; 22 67 A8 C1
    STA $00              ; 97 00
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    ROR $00,X            ; 76 00
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    PLY                  ; 7A
    BRK $60              ; 00 60
    JSL $C1A867          ; 22 67 A8 C1
    AND $01              ; 31 01
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    AND $01              ; 32 01
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    AND $01              ; 33 01
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    BIT $01,X            ; 34 01
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    AND $01,X            ; 35 01
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    RTI                  ; 40
    ORA $60              ; 01 60
    JSL $C1A867          ; 22 67 A8 C1
    AND $01              ; 32 01
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    AND $01              ; 37 01
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    SEC                  ; 38
    ORA $60              ; 01 60
    JSL $C1A867          ; 22 67 A8 C1
    AND $6001,Y          ; 39 01 60
    JSL $C1A867          ; 22 67 A8 C1
    DEC                  ; 3A
    ORA $60              ; 01 60
    JSL $C1A867          ; 22 67 A8 C1
    TSC                  ; 3B
    ORA $60              ; 01 60

Audio_Function_00D:
    PHP                  ; 08

Audio_Function_00E:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Audio_Function_00F:
    PHB                  ; 8B
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDX #$16             ; A2 16
    BRK $A9              ; 00 A9
    SBC $3E9DFF,X        ; FF FF 9D 3E
    BIT $CA              ; 24 CA
    DEX                  ; CA
    BPL $8387            ; 10 F9
    STZ $00              ; 64 00
    STZ $2426            ; 9C 26 24
    JSR $83D2            ; 20 D2 83
    INC $2426            ; EE 26 24
    LDA $2426            ; AD 26 24
    CMP #$04             ; C9 04
    BRK $90              ; 00 90
    SBC $A9              ; F2 A9
    TSB $00              ; 04 00
    STA $2426            ; 8D 26 24
    JSR $83D2            ; 20 D2 83
    JSL $C2B9A6          ; 22 A6 B9 C2
    TAX                  ; AA
    LDY #$00             ; A0 00
    BRK $CA              ; 00 CA
    BMI $83CA            ; 30 15
    PHX                  ; DA
    JSL $C2AF66          ; 22 66 AF C2
    TXA                  ; 8A
    LDX $00              ; A6 00

Audio_Function_010:
    SEP #$20             ; E2 20
    STA $243E,X          ; 9D 3E 24

Audio_Function_011:
    REP #$20             ; C2 20
    PLX                  ; FA
    INC $00              ; E6 00
    INY                  ; C8
    BRA $83B2            ; 80 E8
    PLB                  ; AB

Audio_Function_012:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    RTL                  ; 6B
    LDX $00              ; A6 00
    LDY #$00             ; A0 00
    BRK $22              ; 00 22
    AND $CB              ; 32 CB

Audio_Function_013:
    REP #$50             ; C2 50
    JSR $0002            ; 20 02 00
    BEQ $83F7            ; F0 16
    JSL $C2CAE0          ; 22 E0 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $CD              ; 00 CD
    ROL $24              ; 26 24
    BNE $83F7            ; D0 09
    TYA                  ; 98

Audio_Function_014:
    SEP #$20             ; E2 20
    STA $243E,X          ; 9D 3E 24

Audio_Function_015:
    REP #$20             ; C2 20
    INX                  ; E8
    INY                  ; C8
    CPY #$18             ; C0 18
    BRK $90              ; 00 90
    PHX                  ; DA
    STX $00              ; 86 00
    RTS                  ; 60

Audio_Function_016:
    LDA $243E,Y          ; B9 3E 24
    AND #$FF             ; 29 FF
    BRK $C9              ; 00 C9
    CLC                  ; 18
    BRK $B0              ; 00 B0
    ORA $E88D,Y          ; 19 8D E8
    AND $22              ; 23 22
    TSB $CA              ; 04 CA

Audio_Function_017:
    REP #$A5             ; C2 A5
    BRK $2D              ; 00 2D
    NOP                  ; EA
    AND $85              ; 23 85
    BRK $A5              ; 00 A5
    COP $2D              ; 02 2D
    CPX $0523            ; EC 23 05
    BRK $F0              ; 00 F0
    COP $18              ; 02 18
    RTS                  ; 60
    SEC                  ; 38
    RTS                  ; 60
    PHY                  ; 5A
    LDX $23EE            ; AE EE 23
    LDY $23E8            ; AC E8 23
    STY $2428            ; 8C 28 24
    JSL $C2CB32          ; 22 32 CB C2
    BVC $8456            ; 50 20
    COP $00              ; 02 00
    BEQ $8464            ; F0 2A
    JSR $84DE            ; 20 DE 84
    BCS $8464            ; B0 25
    JSR $8467            ; 20 67 84
    BCS $8464            ; B0 20
    JSR $84BB            ; 20 BB 84
    JSR $848A            ; 20 8A 84
    JSR $8475            ; 20 75 84
    JSR $857E            ; 20 7E 85
    BCS $8464            ; B0 12
    JSR $85C5            ; 20 C5 85
    BCS $8430            ; B0 D9
    JSR $8690            ; 20 90 86
    BCS $8464            ; B0 08
    JSR $84F2            ; 20 F2 84
    BCS $8464            ; B0 03
    PLY                  ; 7A
    CLC                  ; 18
    RTS                  ; 60
    PLY                  ; 7A
    SEC                  ; 38
    RTS                  ; 60
    CPX #$CA             ; E0 CA
    BRK $F0              ; 00 F0
    COP $18              ; 02 18
    RTS                  ; 60
    CPY $23E4            ; CC E4 23
    BNE $846C            ; D0 F9
    SEC                  ; 38
    RTS                  ; 60
    JSL $C2CED4          ; 22 D4 CE C2
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDA $F423            ; AD 23 F4
    BPL $8482            ; 10 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    RTS                  ; 60
    PEA $23AD            ; F4 AD 23
    PEA $0008            ; F4 08 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BNE $84BA            ; D0 21
    JSL $C2CC25          ; 22 25 CC C2
    TDC                  ; 7B
    CLC                  ; 18
    COP $00              ; 02 00
    BEQ $84BA            ; F0 17
    JSR $7C03            ; 20 03 7C
    JSL $C1A87A          ; 22 7A A8 C1
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDA $F423            ; AD 23 F4

Audio_Function_018:
    PHP                  ; 08
    BRK $F4              ; 00 F4
    BRK $7E              ; 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    RTS                  ; 60
    PEA $23AD            ; F4 AD 23
    PEA $0002            ; F4 02 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BNE $84DD            ; D0 13
    INC $23DA            ; EE DA 23
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDA $F423            ; AD 23 F4
    COP $00              ; 02 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    RTS                  ; 60
    JSL $C2CC25          ; 22 25 CC C2
    TDC                  ; 7B
    CLC                  ; 18
    CPY #$00             ; C0 00
    CMP #$00             ; C9 00
    BRK $18              ; 00 18
    BNE $84F1            ; D0 05
    JSL $C2BE8A          ; 22 8A BE C2
    TRB $5A60            ; 1C 60 5A
    LDY $23E4            ; AC E4 23
    JSR $8525            ; 20 25 85
    BCC $8503            ; 90 08
    JSR $854B            ; 20 4B 85
    BCC $8503            ; 90 03
    PLY                  ; 7A
    CLC                  ; 18
    RTS                  ; 60
    PLY                  ; 7A
    JSL $C2B6D9          ; 22 D9 B6 C2
    LDA #$0E             ; A9 0E
    BRK $48              ; 00 48
    JSL $C2CAE0          ; 22 E0 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCS $851E            ; B0 05
    LDA #$0D             ; A9 0D
    BRK $83              ; 00 83
    ORA $68              ; 01 68
    JSL $C1A87A          ; 22 7A A8 C1
    SEC                  ; 38
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    BNE $8549            ; D0 1F
    JSL $C2CC47          ; 22 47 CC C2
    ADC $0218,Y          ; 79 18 02
    BRK $F0              ; 00 F0
    ORA $22,X            ; 15 22
    AND $CB              ; 32 CB

Audio_Function_019:
    REP #$51             ; C2 51
    JSR $0004            ; 20 04 00
    BEQ $8549            ; F0 0B
    JSL $C012D1          ; 22 D1 12 C0
    AND #$01             ; 29 01
    BRK $D0              ; 00 D0
    COP $18              ; 02 18
    RTS                  ; 60
    SEC                  ; 38
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    BNE $857C            ; D0 2C
    JSL $C2CC47          ; 22 47 CC C2
    PLY                  ; 7A
    CLC                  ; 18

Audio_Function_01A:
    PHP                  ; 08
    BRK $F0              ; 00 F0
    JSL $2428AD          ; 22 AD 28 24
    PHA                  ; 48
    STY $2428            ; 8C 28 24
    LDA #$10             ; A9 10
    BRK $8D              ; 00 8D
    BIT $2224            ; 2C 24 22
    PLY                  ; 7A
    CLV                  ; B8

Audio_Function_01B:
    REP #$68             ; C2 68
    STA $2428            ; 8D 28 24
    BVC $857C            ; 50 0B
    JSL $C012D1          ; 22 D1 12 C0
    AND #$07             ; 29 07
    BRK $D0              ; 00 D0
    COP $18              ; 02 18
    RTS                  ; 60
    SEC                  ; 38
    RTS                  ; 60
    JSL $C2CC47          ; 22 47 CC C2
    PLY                  ; 7A
    CLC                  ; 18
    TSB $00              ; 04 00
    CLC                  ; 18
    BEQ $85C4            ; F0 3B
    JSL $C2BE8A          ; 22 8A BE C2
    JSR $3490            ; 20 90 34
    PEA $23AE            ; F4 AE 23
    PEA $0008            ; F4 08 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BNE $85C3            ; D0 24
    LDA $23E8            ; AD E8 23
    PHA                  ; 48
    LDA $23E6            ; AD E6 23
    STA $23E8            ; 8D E8 23
    JSL $C1A867          ; 22 67 A8 C1
    ROR $6800            ; 6E 00 68
    STA $23E8            ; 8D E8 23
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDX $F423            ; AE 23 F4

Audio_Function_01C:
    PHP                  ; 08
    BRK $F4              ; 00 F4
    BRK $7E              ; 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    SEC                  ; 38
    RTS                  ; 60
    PEA $23AD            ; F4 AD 23
    PEA $0004            ; F4 04 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    CLC                  ; 18
    BNE $8604            ; D0 2F
    JSL $C2BE8A          ; 22 8A BE C2
    BRK $8D              ; 00 8D
    JMP ($2024,X)        ; 7C 24 20
    EOR $9086,Y          ; 59 86 90
    JSL $867B20          ; 22 20 7B 86
    BCC $8604            ; 90 1D
    JSR $8605            ; 20 05 86
    LDY $23E4            ; AC E4 23
    STY $2428            ; 8C 28 24
    STY $23E8            ; 8C E8 23
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDA $F423            ; AD 23 F4
    TSB $00              ; 04 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    SEC                  ; 38
    RTS                  ; 60
    PHX                  ; DA
    JSL $C2CAE0          ; 22 E0 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    ORA $00              ; 05 00
    BCC $861B            ; 90 08
    JSL $C1E32E          ; 22 2E E3 C1
    ADC $00              ; 71 00
    BRA $863C            ; 80 21
    LDX #$43             ; A2 43
    BRK $22              ; 00 22
    ORA $CC              ; 03 CC

Audio_Function_01D:
    REP #$6C             ; C2 6C
    CLC                  ; 18
    STA $4F4C            ; 8D 4C 4F
    LDA #$01             ; A9 01
    BRK $8D              ; 00 8D
    LSR $224F            ; 4E 4F 22
    CPX #$CA             ; E0 CA

Audio_Function_01E:
    REP #$3A             ; C2 3A
    JSR $00FF            ; 20 FF 00
    STA $4F50            ; 8D 50 4F
    JSL $C48D49          ; 22 49 8D C4
    LDA #$55             ; A9 55
    BRK $48              ; 00 48
    JSL $C2CAE0          ; 22 E0 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCC $8652            ; 90 05
    LDA #$56             ; A9 56
    BRK $83              ; 00 83
    ORA $68              ; 01 68
    JSL $C1A87A          ; 22 7A A8 C1
    PLX                  ; FA
    RTS                  ; 60
    CPX #$1A             ; E0 1A
    BRK $F0              ; 00 F0
    TSB $4722            ; 0C 22 47
    CPY $78C2            ; CC C2 78
    CLC                  ; 18
    BRA $8666            ; 80 00
    BNE $8679            ; D0 11
    CLC                  ; 18
    RTS                  ; 60
    PEA $23AD            ; F4 AD 23
    PEA $0040            ; F4 40 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BEQ $8668            ; F0 EF
    SEC                  ; 38
    RTS                  ; 60
    PHX                  ; DA
    JSL $C2CB32          ; 22 32 CB C2
    EOR $20              ; 51 20
    BPL $8684            ; 10 00
    CLC                  ; 18
    BEQ $868E            ; F0 07
    CPY $23E4            ; CC E4 23
    CLC                  ; 18
    BEQ $868E            ; F0 01
    SEC                  ; 38
    PLX                  ; FA
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    BNE $86CD            ; D0 38
    JSL $C2CC47          ; 22 47 CC C2
    ADC $1018,Y          ; 79 18 10
    BRK $F0              ; 00 F0
    ROL $7422            ; 2E 22 74
    LDA $C2              ; B7 C2
    CMP #$01             ; C9 01
    BRK $F0              ; 00 F0
    AND $22              ; 25 22
    TXA                  ; 8A
    LDX $16C2,Y          ; BE C2 16
    BCS $86CD            ; B0 1E
    JSL $C2CB32          ; 22 32 CB C2
    EOR $20              ; 47 20
    SBC $14D000,X        ; FF 00 D0 14
    JSR $86EC            ; 20 EC 86
    BCS $86CD            ; B0 0F
    JSR $873E            ; 20 3E 87
    BCC $86CF            ; 90 0C
    JSR $875F            ; 20 5F 87
    BCC $86CF            ; 90 07
    JSR $86DB            ; 20 DB 86
    BCC $86CF            ; 90 02
    CLC                  ; 18
    RTS                  ; 60
    JSL $C2B6D9          ; 22 D9 B6 C2
    JSL $C1A867          ; 22 67 A8 C1
    BPL $86D9            ; 10 00
    SEC                  ; 38
    RTS                  ; 60
    JSL $C2CAE0          ; 22 E0 CA C2
    EOR $20              ; 53 20
    TSB $3800            ; 0C 00 38
    BEQ $86EB            ; F0 05
    JSL $C012D1          ; 22 D1 12 C0
    LSR                  ; 4A
    RTS                  ; 60
    PHX                  ; DA
    PHY                  ; 5A
    LDA $2428            ; AD 28 24
    PHA                  ; 48
    LDA $23E4            ; AD E4 23
    STA $2428            ; 8D 28 24
    JSL $C2BE8A          ; 22 8A BE C2
    PLP                  ; 28
    BCC $8736            ; 90 37
    LDX $23E4            ; AE E4 23
    LDY $23E8            ; AC E8 23
    JSL $C2CAD9          ; 22 D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCS $8721            ; B0 0F
    JSL $C2CAE0          ; 22 E0 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCS $8736            ; B0 17
    BRA $872E            ; 80 0D
    JSL $C2CAE0          ; 22 E0 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCC $8736            ; 90 08
    PLA                  ; 68
    STA $2428            ; 8D 28 24
    PLY                  ; 7A
    PLX                  ; FA
    SEC                  ; 38
    RTS                  ; 60
    PLA                  ; 68
    STA $2428            ; 8D 28 24
    PLY                  ; 7A
    PLX                  ; FA
    CLC                  ; 18
    RTS                  ; 60
    JSL $C2C240          ; 22 40 C2 C2
    TSB $2248            ; 0C 48 22
    CPX #$CA             ; E0 CA

Audio_Function_01F:
    REP #$3C             ; C2 3C
    JSR $00FF            ; 20 FF 00
    CMP #$04             ; C9 04
    BRK $A9              ; 00 A9
    AND $03B000,X        ; 3F 00 B0 03
    LDA #$2F             ; A9 2F
    BRK $22              ; 00 22
    ROL $C013,X          ; 3E 13 C0
    CMP $01              ; C3 01
    PLA                  ; 68
    RTS                  ; 60
    PHX                  ; DA
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    TAX                  ; AA
    CLV                  ; B8

Audio_Function_020:
    REP #$AD             ; C2 AD
    BIT $A224            ; 2C 24 A2

Audio_Function_021:
    PHP                  ; 08
    BRK $DF              ; 00 DF
    BIT #$87             ; 89 87

Audio_Function_022:
    REP #$F0             ; C2 F0

Audio_Function_023:
    PHP                  ; 08
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    BPL $876D            ; 10 F4
    BRA $8786            ; 80 0B
    LDA $C2878B,X        ; BF 8B 87 C2
    JSL $C0133E          ; 22 3E 13 C0
    CLC                  ; 18
    BEQ $8787            ; F0 01
    SEC                  ; 38
    PLX                  ; FA
    RTS                  ; 60
    MVP $0700            ; 44 00 07
    BRK $64              ; 00 64
    BRK $07              ; 00 07
    BRK $61              ; 00 61
    BRK $03              ; 00 03
    BRK $AE              ; 00 AE
    INX                  ; E8
    AND $22              ; 23 22
    CMP $C2CA,Y          ; D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCS $87AF            ; B0 0A
    LDA $23AE            ; AD AE 23
    AND #$7F             ; 29 7F
    SBC $23AE8D,X        ; FF 8D AE 23
    RTS                  ; 60
    LDA $23AE            ; AD AE 23
    ORA #$80             ; 09 80
    BRK $8D              ; 00 8D
    LDX $6023            ; AE 23 60
    PHY                  ; 5A
    PEA $2011            ; F4 11 20
    PEA $0020            ; F4 20 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    CLC                  ; 18
    BNE $8831            ; D0 67
    LDA $23F2            ; AD F2 23
    CLC                  ; 18
    BNE $8831            ; D0 61
    LDX $23EE            ; AE EE 23
    JSL $C2CC47          ; 22 47 CC C2
    PLY                  ; 7A
    CLC                  ; 18
    RTI                  ; 40
    BRK $18              ; 00 18
    BEQ $8831            ; F0 53
    LDA $23E4            ; AD E4 23
    STA $2428            ; 8D 28 24
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    TAX                  ; AA
    CLV                  ; B8

Audio_Function_024:
    REP #$AD             ; C2 AD
    BIT $C924            ; 2C 24 C9
    ORA #$00             ; 09 00
    BEQ $87F9            ; F0 06
    CMP #$31             ; C9 31
    BRK $18              ; 00 18
    BNE $8831            ; D0 38
    JSL $C012D1          ; 22 D1 12 C0
    AND #$0F             ; 29 0F
    BRK $18              ; 00 18
    BNE $8831            ; D0 2E
    LDA $23E8            ; AD E8 23
    STA $2428            ; 8D 28 24
    LDA #$FF             ; A9 FF
    SBC $220085,X        ; FF 85 00 22
    TXA                  ; 8A
    LDX $06C2,Y          ; BE C2 06
    JSL $C2B977          ; 22 77 B9 C2
    LDA $23EE            ; AD EE 23
    PHA                  ; 48
    LDA #$18             ; A9 18
    BRK $8D              ; 00 8D
    INC $2223            ; EE 23 22
    DEC $C2CF            ; CE CF C2
    PLA                  ; 68
    STA $23EE            ; 8D EE 23
    JSR $8833            ; 20 33 88
    JSL $C2B054          ; 22 54 B0 C2
    SEC                  ; 38
    PLY                  ; 7A
    RTS                  ; 60
    LDA $242C            ; AD 2C 24
    STA $BE79            ; 8D 79 BE
    JSL $C1A867          ; 22 67 A8 C1
    BVC $8840            ; 50 01
    LDA #$51             ; A9 51
    ORA $48              ; 01 48
    LDX $23E8            ; AE E8 23
    JSL $C2CAD9          ; 22 D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCC $8858            ; 90 05
    LDA #$52             ; A9 52
    ORA $83              ; 01 83
    ORA $68              ; 01 68
    JSL $C1A87A          ; 22 7A A8 C1
    RTS                  ; 60
    PHY                  ; 5A

Audio_Function_025:
    SEP #$20             ; E2 20
    LDA #$C2             ; A9 C2
    PHA                  ; 48

Audio_Function_026:
    REP #$20             ; C2 20
    LDA #$8E             ; A9 8E
    DEY                  ; 88
    DEC                  ; 3A
    PHA                  ; 48
    LDX $23EE            ; AE EE 23

Audio_Function_027:
    SEP #$20             ; E2 20
    JSL $C903EE          ; 22 EE 03 C9
    BRK $1D              ; 00 1D
    BRK $60              ; 00 60
    CLC                  ; 18

Audio_Function_028:
    REP #$08             ; C2 08
    BRK $48              ; 00 48

Audio_Function_029:
    REP #$20             ; C2 20
    JSL $C903EE          ; 22 EE 03 C9
    BRK $1D              ; 00 1D
    BRK $60              ; 00 60
    CLC                  ; 18

Audio_Function_02A:
    REP #$06             ; C2 06
    BRK $3A              ; 00 3A
    PHA                  ; 48
    RTL                  ; 6B
    BCC $88B1            ; 90 21
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDA $F423            ; AD 23 F4
    ORA $00              ; 01 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    PEA $23AE            ; F4 AE 23
    PEA $0002            ; F4 02 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    JSL $C2CF00          ; 22 00 CF C2
    PLY                  ; 7A
    RTS                  ; 60
    LDA $2458            ; AD 58 24
    STA $00              ; 85 00
    LDA $245A            ; AD 5A 24
    STA $02              ; 85 02
    LDA $23E8            ; AD E8 23
    JSL $C2CA46          ; 22 46 CA C2
    LDA $00              ; A5 00
    STA $2458            ; 8D 58 24
    LDA $02              ; A5 02
    STA $245A            ; 8D 5A 24
    RTS                  ; 60
    PHY                  ; 5A
    LDA $23FA            ; AD FA 23
    BEQ $88FC            ; F0 27
    LDY $23E8            ; AC E8 23
    STY $2428            ; 8C 28 24
    JSL $C2CB32          ; 22 32 CB C2
    BVC $8901            ; 50 20
    COP $00              ; 02 00
    BEQ $88FC            ; F0 17
    JSL $C2BE8A          ; 22 8A BE C2
    TRB $10B0            ; 1C B0 10
    LDX #$04             ; A2 04
    BRK $AD              ; 00 AD
    INC $DF23            ; EE 23 DF
    ORA $89              ; 03 89

Audio_Function_02B:
    REP #$F0             ; C2 F0
    ASL $CA              ; 06 CA
    DEX                  ; CA
    BPL $88F2            ; 10 F6
    PLY                  ; 7A
    RTS                  ; 60
    JSR ($8909,X)        ; FC 09 89
    PLY                  ; 7A
    RTS                  ; 60
    ORA $00              ; 03 00
    TSB $00              ; 04 00
    ORA $00              ; 05 00
    ORA $893E89          ; 0F 89 3E 89
    LSR $89,X            ; 56 89
    JSL $C2A406          ; 22 06 A4 C2
    BCC $893D            ; 90 28
    JSL $C2B5D8          ; 22 D8 B5 C2
    BCS $893D            ; B0 22
    JSL $C2B977          ; 22 77 B9 C2
    LDA #$41             ; A9 41
    BRK $48              ; 00 48
    LDY $23E8            ; AC E8 23
    JSL $C2CAE0          ; 22 E0 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCS $8938            ; B0 05
    LDA #$40             ; A9 40
    BRK $83              ; 00 83
    ORA $68              ; 01 68
    JSL $C1A87A          ; 22 7A A8 C1
    RTS                  ; 60
    JSL $C2A406          ; 22 06 A4 C2
    BCC $8955            ; 90 11
    JSL $C2BE8A          ; 22 8A BE C2
    TRB $B0              ; 14 B0
    ASL                  ; 0A
    JSL $C2B977          ; 22 77 B9 C2
    JSL $C1A867          ; 22 67 A8 C1
    JMP $6000            ; 4C 00 60
    JSL $C2A406          ; 22 06 A4 C2
    BCC $896C            ; 90 10
    JSL $C2B561          ; 22 61 B5 C2
    BCS $896C            ; B0 0A
    JSL $C2B977          ; 22 77 B9 C2
    JSL $C1A867          ; 22 67 A8 C1
    EOR #$00             ; 49 00
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    BNE $89C4            ; D0 52
    LDX $23EE            ; AE EE 23
    JSL $C2CC25          ; 22 25 CC C2
    ADC $0818,Y          ; 79 18 08
    BRK $F0              ; 00 F0
    EOR $AE              ; 45 AE
    CPX $23              ; E4 23
    STX $2428            ; 8E 28 24
    JSL $C2CB2B          ; 22 2B CB C2
    BVC $89AB            ; 50 20
    COP $00              ; 02 00
    BEQ $89C4            ; F0 35
    JSL $C2BE8A          ; 22 8A BE C2
    TRB $2EB0            ; 1C B0 2E
    LDA #$15             ; A9 15
    BRK $8D              ; 00 8D
    BIT $2224            ; 2C 24 22
    PLY                  ; 7A
    CLV                  ; B8

Audio_Function_02C:
    REP #$50             ; C2 50
    JSL $23FAAD          ; 22 AD FA 23
    BEQ $89C4            ; F0 1D
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    INC                  ; 1A
    STA $23FA            ; 8D FA 23
    LDA $23E8            ; AD E8 23
    PHA                  ; 48
    LDA $23E4            ; AD E4 23
    STA $23E8            ; 8D E8 23
    JSL $C29200          ; 22 00 92 C2
    PLA                  ; 68
    STA $23E8            ; 8D E8 23
    PLA                  ; 68
    STA $23FA            ; 8D FA 23
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    BNE $8A2B            ; D0 61
    LDX $23EE            ; AE EE 23
    JSL $C2CC47          ; 22 47 CC C2
    ADC $0818,Y          ; 79 18 08
    BRK $F0              ; 00 F0
    MVN $E4AE            ; 54 AE E4
    AND $8E              ; 23 8E
    PLP                  ; 28
    BIT $22              ; 24 22
    PLD                  ; 2B
    WAI                  ; CB

Audio_Function_02D:
    REP #$50             ; C2 50
    JSR $0002            ; 20 02 00
    BEQ $8A2B            ; F0 44
    JSL $C2BE8A          ; 22 8A BE C2
    TRB $3DB0            ; 1C B0 3D
    LDX $23E8            ; AE E8 23
    STX $2428            ; 8E 28 24
    JSL $C2CB2B          ; 22 2B CB C2
    BVC $8A1A            ; 50 20
    COP $00              ; 02 00
    BEQ $8A2B            ; F0 2D
    LDA #$53             ; A9 53

Audio_Function_02E:
    BRK $8D              ; 00 8D
    BIT $2224            ; 2C 24 22
    PLY                  ; 7A
    CLV                  ; B8

Audio_Function_02F:
    REP #$50             ; C2 50
    AND $AD              ; 21 AD
    PLX                  ; FA
    AND $F0              ; 23 F0
    TRB $4A48            ; 1C 48 4A
    INC                  ; 1A
    STA $23FA            ; 8D FA 23
    LDA $23E8            ; AD E8 23
    PHA                  ; 48
    LDA $23E4            ; AD E4 23
    STA $23E8            ; 8D E8 23
    JSL $C29200          ; 22 00 92 C2
    PLA                  ; 68
    STA $23E8            ; 8D E8 23
    PLA                  ; 68
    STA $23FA            ; 8D FA 23
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    BNE $8A95            ; D0 64
    LDA $23FA            ; AD FA 23
    BEQ $8A95            ; F0 5F
    LDX $23EE            ; AE EE 23
    JSL $C2CC47          ; 22 47 CC C2
    ADC $0818,Y          ; 79 18 08
    BRK $F0              ; 00 F0
    EOR $AE              ; 52 AE
    INX                  ; E8
    AND $8E              ; 23 8E
    PLP                  ; 28
    BIT $22              ; 24 22
    PLD                  ; 2B
    WAI                  ; CB

Audio_Function_030:
    REP #$50             ; C2 50
    JSR $0002            ; 20 02 00
    BEQ $8A95            ; F0 42
    LDA #$69             ; A9 69
    BRK $8D              ; 00 8D
    BIT $2224            ; 2C 24 22
    PLY                  ; 7A
    CLV                  ; B8

Audio_Function_031:
    REP #$50             ; C2 50
    ROL $AD,X            ; 36 AD
    INX                  ; E8
    AND $48              ; 23 48
    JSL $C2CAD9          ; 22 D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    TSB $00              ; 04 00
    BCS $8A77            ; B0 07
    JSL $C2C739          ; 22 39 C7 C2
    ASL $80              ; 06 80
    ORA $22              ; 05 22
    AND $C2C7,Y          ; 39 C7 C2

Audio_Function_032:
    PHP                  ; 08
    JSL $C2C766          ; 22 66 C7 C2
    BRK $A2              ; 00 A2
    BRK $00              ; 00 00
    JSL $C01407          ; 22 07 14 C0
    BCC $8A91            ; 90 07
    STA $23E8            ; 8D E8 23
    JSL $C29200          ; 22 00 92 C2
    PLA                  ; 68
    STA $23E8            ; 8D E8 23
    RTS                  ; 60
    LDX #$24             ; A2 24
    BRK $AD              ; 00 AD
    INC $DF23            ; EE 23 DF
    PLB                  ; AB
    TXA                  ; 8A

Audio_Function_033:
    REP #$F0             ; C2 F0
    ORA $CA              ; 05 CA
    DEX                  ; CA
    BPL $8A9C            ; 10 F6
    RTS                  ; 60
    JSR ($8AD1,X)        ; FC D1 8A
    RTS                  ; 60
    INC                  ; 1A
    BRK $42              ; 00 42
    BRK $44              ; 00 44
    BRK $4A              ; 00 4A
    BRK $4B              ; 00 4B
    BRK $4D              ; 00 4D
    BRK $86              ; 00 86
    BRK $54              ; 00 54
    BRK $60              ; 00 60
    BRK $61              ; 00 61
    BRK $62              ; 00 62
    BRK $63              ; 00 63
    BRK $64              ; 00 64
    BRK $65              ; 00 65
    BRK $67              ; 00 67
    BRK $6B              ; 00 6B
    BRK $50              ; 00 50
    BRK $51              ; 00 51
    BRK $34              ; 00 34
    BRK $6A              ; 00 6A

Audio_Function_034:
    PHB                  ; 8B
    LDA $8B              ; A7 8B
    DEX                  ; CA

Audio_Function_035:
    PHB                  ; 8B
    CMP $8B              ; D7 8B
    INC $158B,X          ; FE 8B 15
    STY $8AF7            ; 8C F7 8A
    JSL $8CA38C          ; 22 8C A3 8C
    SBC $8C              ; F1 8C
    SED                  ; F8
    STY $8CFF            ; 8C FF 8C
    ASL $8D              ; 06 8D
    ORA $4D8D            ; 0D 8D 4D
    STA $8D71            ; 8D 71 8D
    EOR $478B,X          ; 5D 8B 47

Audio_Function_036:
    PHB                  ; 8B
    SBC $8A              ; F7 8A
    LDX #$00             ; A2 00
    BRK $F4              ; 00 F4
    ORA $20              ; 11 20
    PEA $0080            ; F4 80 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BNE $8B38            ; D0 2F
    JSL $C1D13B          ; 22 3B D1 C1
    BNE $8B36            ; D0 27
    LDA #$08             ; A9 08
    BRK $F4              ; 00 F4
    PLB                  ; AB
    AND $F4              ; 23 F4
    ORA $00F400          ; 0F 00 F4 00
    ROR $E922,X          ; 7E 22 E9
    COP $C9              ; 02 C9
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDX $F423            ; AE 23 F4
    COP $00              ; 02 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    JSL $C1E32E          ; 22 2E E3 C1
    MVN $6000            ; 54 00 60
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C28B41,X        ; BF 41 8B C2
    JSL $C1A87A          ; 22 7A A8 C1
    RTS                  ; 60
    EOR $01              ; 41 01
    EOR $00              ; 57 00
    CLI                  ; 58
    BRK $F4              ; 00 F4
    LDX $F423            ; AE 23 F4
    COP $00              ; 02 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BNE $8B5C            ; D0 06
    JSL $C1A867          ; 22 67 A8 C1
    EOR $01              ; 41 01
    RTS                  ; 60
    LDA $23E6            ; AD E6 23
    STA $23E8            ; 8D E8 23
    JSL $C1A867          ; 22 67 A8 C1
    SEI                  ; 78
    BRK $60              ; 00 60
    JSR $8B71            ; 20 71 8B
    JSR $8BA6            ; 20 A6 8B
    RTS                  ; 60
    PEA $23AE            ; F4 AE 23
    PEA $0004            ; F4 04 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BEQ $8BA5            ; F0 25
    LDA $23E4            ; AD E4 23
    STA $2428            ; 8D 28 24
    LDA #$FF             ; A9 FF
    SBC $220085,X        ; FF 85 00 22
    TXA                  ; 8A
    LDX $06C2,Y          ; BE C2 06
    BCC $8BA5            ; 90 13
    JSL $C2B977          ; 22 77 B9 C2
    JSL $C2D0C2          ; 22 C2 D0 C2
    LDA #$15             ; A9 15
    BRK $22              ; 00 22
    PLY                  ; 7A
    TAY                  ; A8
    CMP $22              ; C1 22
    MVN $C2B0            ; 54 B0 C2
    RTS                  ; 60
    RTS                  ; 60
    LDA #$03             ; A9 03
    BRK $F4              ; 00 F4
    LDY $F423            ; AC 23 F4
    CLC                  ; 18
    BRK $F4              ; 00 F4
    BRK $7E              ; 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    LDA $23E6            ; AD E6 23
    STA $23E8            ; 8D E8 23
    JSL $C1E32E          ; 22 2E E3 C1
    INX                  ; E8
    BRK $22              ; 00 22
    ADC $A8              ; 67 A8
    CMP $6D              ; C1 6D
    BRK $60              ; 00 60
    LDA $23E6            ; AD E6 23
    STA $23E8            ; 8D E8 23
    JSL $C1A867          ; 22 67 A8 C1
    RTL                  ; 6B
    BRK $60              ; 00 60
    LDA $23E4            ; AD E4 23
    PEA $23AA            ; F4 AA 23
    PEA $00FF            ; F4 FF 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    LDA #$04             ; A9 04
    BRK $F4              ; 00 F4
    LDY $F423            ; AC 23 F4
    ORA $00              ; 07 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    JSL $C1A867          ; 22 67 A8 C1
    STZ $00,X            ; 74 00
    RTS                  ; 60
    LDA #$01             ; A9 01

Audio_Function_037:
    BRK $F4              ; 00 F4
    LDX $F423            ; AE 23 F4
    RTI                  ; 40
    BRK $F4              ; 00 F4
    BRK $7E              ; 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    JSL $C1A867          ; 22 67 A8 C1
    ADC $00,X            ; 75 00
    RTS                  ; 60
    LDA $23E6            ; AD E6 23
    STA $23E8            ; 8D E8 23
    JSL $C1A867          ; 22 67 A8 C1
    ADC $00              ; 77 00
    RTS                  ; 60
    LDA #$00             ; A9 00
    BRK $8D              ; 00 8D
    STY $24              ; 84 24
    STA $2486            ; 8D 86 24
    STA $2488            ; 8D 88 24
    STA $248A            ; 8D 8A 24
    STA $4054            ; 8D 54 40
    INC                  ; 1A
    STA $4056            ; 8D 56 40
    INC                  ; 1A
    STA $4058            ; 8D 58 40
    INC                  ; 1A
    STA $405A            ; 8D 5A 40
    JSL $C4297C          ; 22 7C 29 C4
    ORA $FE              ; 01 FE
    DEX                  ; CA
    BMI $8C58            ; 30 0F
    TXA                  ; 8A
    ASL                  ; 0A
    TAY                  ; A8
    JSL $C43115          ; 22 15 31 C4
    ORA $FE              ; 01 FE
    SBC $248499,X        ; FF 99 84 24
    BRA $8C46            ; 80 EE
    LDX #$00             ; A2 00
    BRK $9B              ; 00 9B
    LDA $2484,X          ; BD 84 24
    CMP $2486,Y          ; D9 86 24
    BCS $8C80            ; B0 1C
    LDA $2484,X          ; BD 84 24
    PHA                  ; 48
    LDA $2486,Y          ; B9 86 24
    STA $2484,X          ; 9D 84 24
    PLA                  ; 68
    STA $2486,Y          ; 99 86 24
    LDA $4054,X          ; BD 54 40
    PHA                  ; 48
    LDA $4056,Y          ; B9 56 40
    STA $4054,X          ; 9D 54 40
    PLA                  ; 68
    STA $4056,Y          ; 99 56 40
    INY                  ; C8
    INY                  ; C8
    CPY #$06             ; C0 06
    BRK $90              ; 00 90
    CMP $E8,X            ; D5 E8
    INX                  ; E8
    CPX #$06             ; E0 06
    BRK $90              ; 00 90
    CMP $6A22            ; CD 22 6A
    PLD                  ; 2B
    CPY $22              ; C4 22
    ADC $B9              ; 77 B9

Audio_Function_038:
    REP #$A9             ; C2 A9
    WDM $00              ; 42 00
    STA $23E8            ; 8D E8 23
    JSL $C1A867          ; 22 67 A8 C1
    ADC $6000,Y          ; 79 00 60
    LDX $23E4            ; AE E4 23
    JSL $C2CAD9          ; 22 D9 CA C2
    BVC $8CCC            ; 50 20
    ORA $00              ; 01 00
    BNE $8CEA            ; D0 3A
    STA $241E            ; 8D 1E 24
    STA $2422            ; 8D 22 24
    JSL $C2CA5B          ; 22 5B CA C2
    EOR #$20             ; 49 20
    STA $2420            ; 8D 20 24
    STA $2424            ; 8D 24 24
    JSL $C2CAD9          ; 22 D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $8D              ; 00 8D
    ROL $24              ; 26 24
    JSL $C2AB00          ; 22 00 AB C2
    LDA $2428            ; AD 28 24
    CMP #$FF             ; C9 FF
    SBC $8D11F0,X        ; FF F0 11 8D
    INX                  ; E8
    AND $22              ; 23 22
    ADC $A8              ; 67 A8
    CMP $8F              ; C1 8F
    BRK $AE              ; 00 AE
    PLP                  ; 28
    BIT $22              ; 24 22
    AND $C2B5            ; 2D B5 C2
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    BCC $8CF0            ; 90 00
    RTS                  ; 60
    LDA #$0A             ; A9 0A
    BRK $20              ; 00 20
    TRB $8D              ; 14 8D
    RTS                  ; 60
    LDA #$77             ; A9 77
    BRK $20              ; 00 20
    TRB $8D              ; 14 8D
    RTS                  ; 60
    LDA #$48             ; A9 48
    BRK $20              ; 00 20
    TRB $8D              ; 14 8D
    RTS                  ; 60
    LDA #$57             ; A9 57
    BRK $20              ; 00 20
    TRB $8D              ; 14 8D
    RTS                  ; 60
    LDA #$5A             ; A9 5A
    BRK $20              ; 00 20
    TRB $8D              ; 14 8D
    RTS                  ; 60
    STA $2420            ; 8D 20 24
    STA $2424            ; 8D 24 24
    LDA #$00             ; A9 00
    BRK $8D              ; 00 8D
    ASL $8D24,X          ; 1E 24 8D
    JSL $ED2224          ; 22 24 22 ED
    LDA $C2              ; B7 C2
    BCS $8D46            ; B0 1D
    JSL $C2AB00          ; 22 00 AB C2
    LDA $2428            ; AD 28 24
    CMP #$FF             ; C9 FF
    SBC $8D11F0,X        ; FF F0 11 8D
    INX                  ; E8
    AND $22              ; 23 22
    ADC $A8              ; 67 A8
    CMP $8F              ; C1 8F
    BRK $AE              ; 00 AE
    PLP                  ; 28
    BIT $22              ; 24 22
    AND $C2B5            ; 2D B5 C2
    RTS                  ; 60
    JSL $C1A867          ; 22 67 A8 C1
    BCC $8D4C            ; 90 00
    RTS                  ; 60
    LDA #$00             ; A9 00
    BRK $F4              ; 00 F4
    LDX $F423            ; AE 23 F4
    RTI                  ; 40
    BRK $F4              ; 00 F4
    BRK $7E              ; 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    PEA $23AC            ; F4 AC 23
    PEA $0018            ; F4 18 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    JSL $C1A867          ; 22 67 A8 C1
    DEY                  ; 88
    BRK $60              ; 00 60
    JSL $C1A867          ; 22 67 A8 C1
    EOR $01              ; 41 01
    RTS                  ; 60
    LDA $23F6            ; AD F6 23
    BEQ $8DA6            ; F0 29
    PEA $23AE            ; F4 AE 23
    PEA $0002            ; F4 02 00
    PEA $7E00            ; F4 00 7E
    JSL $C9029E          ; 22 9E 02 C9
    BEQ $8DA6            ; F0 1A
    LDA $23F8            ; AD F8 23
    STA $242E            ; 8D 2E 24
    JSL $C2B8D7          ; 22 D7 B8 C2
    BCC $8DA6            ; 90 0E
    LDA $242C            ; AD 2C 24
    CMP #$85             ; C9 85
    BRK $D0              ; 00 D0
    ASL $22              ; 06 22
    ADC $A8              ; 67 A8
    CMP $4B              ; C1 4B
    ORA $60              ; 01 60
    CLC                  ; 18
    RTL                  ; 6B
    JSR $8DB0            ; 20 B0 8D
    JSR $8E70            ; 20 70 8E
    RTL                  ; 6B
    LDX $23E4            ; AE E4 23
    LDY $23E8            ; AC E8 23
    JSL $C2CA62          ; 22 62 CA C2
    EOR $20              ; 41 20
    LSR                  ; 4A
    PHA                  ; 48
    JSL $C2CA5B          ; 22 5B CA C2
    AND $028520,X        ; 3F 20 85 02
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    STA $04              ; 85 04
    PLA                  ; 68
    SEC                  ; 38
    SBC $01              ; E3 01
    STA $00              ; 85 00
    PLA                  ; 68
    JSL $C2CAD9          ; 22 D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    ORA $00              ; 05 00
    BCS $8DE4            ; B0 04
    JSR $8E0E            ; 20 0E 8E
    RTS                  ; 60
    JSR $8DEB            ; 20 EB 8D
    JSR $8E4A            ; 20 4A 8E
    RTS                  ; 60
    LDA $00              ; A5 00
    BMI $8E04            ; 30 15
    CMP #$02             ; C9 02
    BRK $90              ; 00 90
    BPL $8E17            ; 10 22
    ADC $14              ; 72 14
    CPY #$A2             ; C0 A2
    BRK $00              ; 00 00
    JSL $C010D6          ; 22 D6 10 C0
    LDA $01              ; A5 01
    STA $00              ; 85 00
    RTS                  ; 60
    JSL $C012D1          ; 22 D1 12 C0
    AND #$01             ; 29 01
    BRK $85              ; 00 85
    BRK $60              ; 00 60
    LDA $00              ; A5 00
    BMI $8E18            ; 30 06
    LDA $04              ; A5 04
    CMP $00              ; C5 00
    BCC $8E33            ; 90 1B
    LDA $02              ; A5 02
    CMP #$10             ; C9 10
    BRK $B0              ; 00 B0
    ASL                  ; 0A
    JSL $C012D1          ; 22 D1 12 C0
    AND #$01             ; 29 01
    BRK $85              ; 00 85
    BRK $60              ; 00 60
    LDA $04              ; A5 04
    DEC                  ; 3A
    JSL $C0133E          ; 22 3E 13 C0
    STA $00              ; 85 00
    RTS                  ; 60
    LDA $02              ; A5 02
    CMP #$08             ; C9 08
    BRK $90              ; 00 90
    SBC $22              ; E5 22
    ADC $14              ; 72 14
    CPY #$A2             ; C0 A2
    BRK $00              ; 00 00
    JSL $C010D6          ; 22 D6 10 C0
    LDA $01              ; A5 01
    STA $00              ; 85 00
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    CMP #$01             ; C9 01
    BRK $D0              ; 00 D0
    ORA $46              ; 13 46
    BRK $46              ; 00 46
    BRK $46              ; 00 46
    BRK $A9              ; 00 A9
    COP $00              ; 02 00
    JSL $C0133E          ; 22 3E 13 C0
    INC                  ; 1A
    CLC                  ; 18
    ADC $00              ; 65 00
    STA $00              ; 85 00
    RTS                  ; 60
    JSL $C90AF7          ; 22 F7 0A C9
    STA $00              ; 85 00
    JSR $8E70            ; 20 70 8E
    RTL                  ; 6B
    LDA #$00             ; A9 00
    BRK $F4              ; 00 F4
    LDX $F423            ; AE 23 F4
    BPL $8E79            ; 10 00
    PEA $7E00            ; F4 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    JSL $C28E92          ; 22 92 8E C2
    JSL $C28EFB          ; 22 FB 8E C2
    LDA $00              ; A5 00
    STA $23FA            ; 8D FA 23
    JSL $C29200          ; 22 00 92 C2
    RTS                  ; 60

Audio_Function_039:
    PHP                  ; 08

Audio_Function_03A:
    REP #$30             ; C2 30
    PHA                  ; 48
    PHX                  ; DA
    PHY                  ; 5A

Audio_Function_03B:
    PHB                  ; 8B
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDA $23E4            ; AD E4 23
    STA $2428            ; 8D 28 24
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    TAX                  ; AA
    CLV                  ; B8

Audio_Function_03C:
    REP #$AD             ; C2 AD
    BIT $8D24            ; 2C 24 8D
    JMP $00A224          ; 5C 24 A2 00
    BRK $AD              ; 00 AD
    INC $DF23            ; EE 23 DF

Audio_Function_03D:
    PHB                  ; 8B
    STA $07F0C2          ; 8F C2 F0 07
    DEX                  ; CA
    DEX                  ; CA
    BPL $8EB7            ; 10 F6
    LDX #$00             ; A2 00
    BRA $8E53            ; 80 8E
    LSR $AD24,X          ; 5E 24 AD
    INC $0A23            ; EE 23 0A
    TAX                  ; AA
    LDA $C2376A,X        ; BF 6A 37 C2
    TAX                  ; AA
    LDA $C2187A,X        ; BF 7A 18 C2
    AND #$10             ; 29 10
    BRK $F0              ; 00 F0
    ORA $A2              ; 13 A2
    COP $00              ; 02 00
    LDA $245C            ; AD 5C 24
    AND #$FF             ; 29 FF
    BRK $DF              ; 00 DF
    STA $C28F,Y          ; 99 8F C2
    BEQ $8EF0            ; F0 07
    DEX                  ; CA
    DEX                  ; CA
    BPL $8EE3            ; 10 F6
    LDX #$00             ; A2 00
    BRA $8E7F            ; 80 8E
    RTS                  ; 60
    BIT $AB              ; 24 AB

Audio_Function_03E:
    REP #$30             ; C2 30
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    PLP                  ; 28
    RTL                  ; 6B

Audio_Function_03F:
    PHP                  ; 08

Audio_Function_040:
    PHB                  ; 8B

Audio_Function_041:
    REP #$30             ; C2 30
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    LDA $23E8            ; AD E8 23
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C2CBD3,X        ; BF D3 CB C2
    STA $0A              ; 85 0A
    TAX                  ; AA
    LDA $2049,X          ; BD 49 20
    STA $2420            ; 8D 20 24
    LDA $2050,X          ; BD 50 20
    AND #$01             ; 29 01
    BRK $8D              ; 00 8D
    ASL $AD24,X          ; 1E 24 AD
    INC $0A23            ; EE 23 0A
    TAX                  ; AA
    LDA $C2376A,X        ; BF 6A 37 C2
    STA $08              ; 85 08
    JSR $8F4B            ; 20 4B 8F
    JSR $8F82            ; 20 82 8F
    JSR $9015            ; 20 15 90
    JSR $903E            ; 20 3E 90
    JSR $8F90            ; 20 90 8F
    JSR $913E            ; 20 3E 91
    JSR $9179            ; 20 79 91
    JSR $919B            ; 20 9B 91
    JSR $91A8            ; 20 A8 91
    JSR $91DF            ; 20 DF 91
    PLB                  ; AB
    PLP                  ; 28
    RTL                  ; 6B
    LDA $23EE            ; AD EE 23
    CMP #$AC             ; C9 AC
    BRK $F0              ; 00 F0
    ORA $C9              ; 05 C9
    LDA $D000            ; AD 00 D0
    ORA $DAAD,X          ; 1D AD DA
    AND $3A              ; 23 3A
    CMP #$05             ; C9 05
    BRK $90              ; 00 90
    ORA $A9              ; 03 A9
    ORA $00              ; 05 00
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C28F76,X        ; BF 76 8F C2
    LDX #$00             ; A2 00
    BRK $22              ; 00 22
    LSR $11              ; 46 11
    CPY #$A5             ; C0 A5
    ORA $85              ; 01 85
    BRK $60              ; 00 60
    BRK $01              ; 00 01
    CMP $B300            ; CD 00 B3
    BRK $80              ; 00 80
    BRK $4D              ; 00 4D
    BRK $33              ; 00 33
    BRK $AE              ; 00 AE
    LSR $3024,X          ; 5E 24 30
    ORA $FC              ; 03 FC
    STA $608F            ; 8D 8F 60
    BRK $00              ; 00 00
    STA $AE608F          ; 8F 8F 60 AE
    RTS                  ; 60
    BIT $30              ; 24 30
    ORA $FC              ; 03 FC
    STA $608F,X          ; 9D 8F 60
    JSR $1800            ; 20 00 18
    BRK $A1              ; 00 A1
    STA $AD8FCE          ; 8F CE 8F AD
    ASL $D024,X          ; 1E 24 D0
    ASL $20AD,X          ; 1E AD 20
    BIT $0A              ; 24 0A
    TAX                  ; AA
    LDA $C21720,X        ; BF 20 17 C2
    TAX                  ; AA
    LDA $C20002,X        ; BF 02 00 C2
    AND #$40             ; 29 40
    BRK $F0              ; 00 F0
    PHD                  ; 0B
    LDA $23AE            ; AD AE 23
    AND #$10             ; 29 10
    BRK $D0              ; 00 D0
    TSB $20              ; 04 20
    TSB $90              ; 04 90
    RTS                  ; 60
    LDA #$18             ; A9 18
    BRK $18              ; 00 18
    ADC $00              ; 65 00
    STA $00              ; 85 00
    RTS                  ; 60
    LDA $23EE            ; AD EE 23
    PHA                  ; 48
    LDA #$1B             ; A9 1B
    BRK $8D              ; 00 8D
    INC $AD23            ; EE 23 AD
    LDX $2923            ; AE 23 29
    BPL $8FDE            ; 10 00
    BNE $8FED            ; D0 0D
    JSR $A3EB            ; 20 EB A3
    BCC $8FE8            ; 90 03
    JSR $9004            ; 20 04 90
    PLA                  ; 68
    STA $23EE            ; 8D EE 23
    RTS                  ; 60
    LDA $00              ; A5 00
    PHA                  ; 48
    LDA #$18             ; A9 18
    BRK $85              ; 00 85
    BRK $20              ; 00 20
    DEC $A5A3            ; CE A3 A5
    BRK $18              ; 00 18
    ADC $01              ; 63 01
    STA $01              ; 83 01
    PLA                  ; 68

Audio_Function_042:
    STA $00              ; 85 00
    BRA $8FE8            ; 80 E4
    LDA #$10             ; A9 10
    BRK $22              ; 00 22
    ROL $C013,X          ; 3E 13 C0
    CLC                  ; 18
    ADC #$10             ; 69 10
    BRK $18              ; 00 18
    ADC $00              ; 65 00
    STA $00              ; 85 00
    RTS                  ; 60
    LDX $08              ; A6 08
    LDA $C21879,X        ; BF 79 18 C2
    AND #$20             ; 29 20
    BRK $F0              ; 00 F0
    ORA $E4AD,X          ; 1D AD E4
    AND $0A              ; 23 0A
    TAX                  ; AA
    LDA $C2CBD3,X        ; BF D3 CB C2
    TAX                  ; AA
    LDA $2051,X          ; BD 51 20
    AND #$08             ; 29 08
    BRK $F0              ; 00 F0
    PHD                  ; 0B
    LDA $23DA            ; AD DA 23
    DEC                  ; 3A
    ORA $23D8            ; 0D D8 23
    BNE $903D            ; D0 02
    ASL $00              ; 06 00
    RTS                  ; 60
    LDA $23AE            ; AD AE 23
    AND #$10             ; 29 10
    BRK $D0              ; 00 D0
    JSR $7422            ; 20 22 74
    LDA $C2              ; B7 C2
    CMP #$01             ; C9 01
    BRK $F0              ; 00 F0
    TRB $C9              ; 14 C9
    COP $00              ; 02 00
    BEQ $9066            ; F0 12
    JSR $90A7            ; 20 A7 90
    BCS $9063            ; B0 0A
    JSR $90D1            ; 20 D1 90
    BCS $9063            ; B0 05
    JSR $9067            ; 20 67 90
    BCS $9066            ; B0 03
    JSR $90E9            ; 20 E9 90
    RTS                  ; 60
    LDX $23E4            ; AE E4 23
    STX $2428            ; 8E 28 24
    JSL $C2CAD9          ; 22 D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    ORA $00              ; 05 00
    BCC $90A5            ; 90 2B
    JSL $C2BE8A          ; 22 8A BE C2
    BIT $B0              ; 24 B0
    CLC                  ; 18
    CMP #$01             ; C9 01
    BRK $D0              ; 00 D0
    ORA $22              ; 13 22
    RTI                  ; 40

Audio_Function_043:
    REP #$C2             ; C2 C2
    ASL                  ; 0A
    CMP #$05             ; C9 05
    BRK $90              ; 00 90
    ORA #$48             ; 09 48
    JSL $C012D1          ; 22 D1 12 C0
    CMP $01              ; C3 01
    PLA                  ; 68
    RTS                  ; 60
    JSL $C012D1          ; 22 D1 12 C0
    AND #$3F             ; 29 3F
    BRK $38              ; 00 38
    BNE $90A5            ; D0 02
    CLC                  ; 18
    RTS                  ; 60
    SEC                  ; 38
    RTS                  ; 60
    LDX #$00             ; A2 00
    BRK $AD              ; 00 AD
    JMP $FF2924          ; 5C 24 29 FF
    BRK $C9              ; 00 C9
    BPL $90B3            ; 10 00
    BEQ $90BD            ; F0 08
    INX                  ; E8
    CMP #$14             ; C9 14
    BRK $F0              ; 00 F0
    COP $18              ; 02 18
    RTS                  ; 60
    LDA $C290CF,X        ; BF CF 90 C2
    AND #$FF             ; 29 FF
    BRK $22              ; 00 22
    ROL $C013,X          ; 3E 13 C0
    CMP #$00             ; C9 00
    BRK $D0              ; 00 D0
    INC $6038            ; EE 38 60
    ORA $0F              ; 07 0F
    LDA $23EE            ; AD EE 23
    CMP #$02             ; C9 02
    BRK $D0              ; 00 D0
    ASL $07A9            ; 0E A9 07
    BRK $22              ; 00 22
    ROL $C013,X          ; 3E 13 C0
    CMP #$00             ; C9 00
    BRK $D0              ; 00 D0
    COP $38              ; 02 38
    RTS                  ; 60
    CLC                  ; 18
    RTS                  ; 60
    JSL $C1E32E          ; 22 2E E3 C1
    EOR $09A900,X        ; 5F 00 A9 09
    BRK $48              ; 00 48
    LDX $23E4            ; AE E4 23
    JSL $C2CAD9          ; 22 D9 CA C2
    BIT $FF20,X          ; 3C 20 FF
    BRK $C9              ; 00 C9
    ORA $00              ; 05 00
    BCS $9108            ; B0 05
    LDA #$0A             ; A9 0A
    BRK $83              ; 00 83
    ORA $68              ; 01 68
    JSL $C1A87A          ; 22 7A A8 C1
    LDA #$01             ; A9 01
    BRK $F4              ; 00 F4
    LDA $F423            ; AD 23 F4
    JSR $F400            ; 20 00 F4
    BRK $7E              ; 00 7E
    JSL $C902E9          ; 22 E9 02 C9
    LDX $23E4            ; AE E4 23
    JSL $C2CA5B          ; 22 5B CA C2
    AND $008520,X        ; 3F 20 85 00
    LSR                  ; 4A
    PHA                  ; 48
    JSL $C014A3          ; 22 A3 14 C0
    LDX #$00             ; A2 00
    BRK $22              ; 00 22
    DEC $10,X            ; D6 10
    CPY #$A5             ; C0 A5
    ORA $18              ; 01 18
    ADC $01              ; 63 01
    STA $00              ; 85 00
    PLA                  ; 68
    RTS                  ; 60
    LDA $23E8            ; AD E8 23
    STA $2428            ; 8D 28 24
    JSL $C2BE8A          ; 22 8A BE C2
    JSL $A82DB0          ; 22 B0 2D A8
    LDA $23EE            ; AD EE 23
    STA $242A            ; 8D 2A 24
    LDA $00              ; A5 00
    JSL $C2BBD5          ; 22 D5 BB C2
    STA $00              ; 85 00
    LDA $23F2            ; AD F2 23
    BNE $9178            ; D0 19
    LDX $08              ; A6 08
    LDA $C21879,X        ; BF 79 18 C2
    AND #$08             ; 29 08
    BRK $F0              ; 00 F0
    ASL $69A9            ; 0E A9 69
    BRK $8D              ; 00 8D
    BIT $2224            ; 2C 24 22
    PLY                  ; 7A
    CLV                  ; B8

Audio_Function_044:
    REP #$50             ; C2 50
    COP $46              ; 02 46
    BRK $60              ; 00 60
    LDX $08              ; A6 08
    LDA $C21879,X        ; BF 79 18 C2
    AND #$01             ; 29 01
    BRK $F0              ; 00 F0
    ASL $A6,X            ; 16 A6
    ASL                  ; 0A
    LDA $2051,X          ; BD 51 20
    AND #$20             ; 29 20
    BRK $F0              ; 00 F0
    TSB $0006            ; 0C 06 00
    LDX #$00             ; A2 00
    BRK $A9              ; 00 A9
    ORA $00              ; 03 00
    JSL $C0121C          ; 22 1C 12 C0
    RTS                  ; 60
    LDX $0A              ; A6 0A
    LDA $2050,X          ; BD 50 20
    AND #$80             ; 29 80
    BRK $F0              ; 00 F0
    COP $46              ; 02 46
