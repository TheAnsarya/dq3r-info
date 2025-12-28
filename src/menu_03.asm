;==============================================================================
; Dragon Quest III - Menu System (Bank $03)
; Comprehensive code extraction
;==============================================================================

.include "hardware.inc"

.segment "MENU_CODE"

Menu_Function_000:
    ROL $88              ; 26 88
    STA $89              ; 81 89
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_001:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDA49C,X        ; BF 9C A4 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDAED9,X        ; BF D9 AE ED
    STA $FC50            ; 8D 50 FC
    LDA $EDB916,X        ; BF 16 B9 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDC353,X        ; BF 53 C3 ED
    STA $FC54            ; 8D 54 FC

Menu_Function_002:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($8049,X)        ; 7C 49 80
    EOR $5E80,Y          ; 59 80 5E
    BRA $80B9            ; 80 6B
    BRA $80C0            ; 80 70
    BRA $80CF            ; 80 7D
    BRA $7FD6            ; 80 82
    BRA $7FE5            ; 80 8F
    BRA $7FEC            ; 80 94
    BRA $8000            ; 80 A6
    TSB $4C              ; 04 4C
    CMP $80              ; D7 80
    LDX $04              ; A6 04
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $80EB            ; 4C EB 80
    LDX $04              ; A6 04
    JMP $80F7            ; 4C F7 80
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $810B            ; 4C 0B 81
    LDX $04              ; A6 04
    JMP $8117            ; 4C 17 81
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $812B            ; 4C 2B 81
    LDX $04              ; A6 04
    JMP $8137            ; 4C 37 81
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $814B            ; 4C 4B 81
    LDA $10              ; A5 10
    AND $26              ; 25 26
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_003:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDA49C,X        ; BF 9C A4 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDAED9,X        ; BF D9 AE ED
    STA $FC50            ; 8D 50 FC
    LDA $EDB916,X        ; BF 16 B9 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDC353,X        ; BF 53 C3 ED
    STA $FC54            ; 8D 54 FC

Menu_Function_004:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 73
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 53
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 33
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 13
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $815E            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $80A1            ; 4C A1 80
    RTS                  ; 60
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_005:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDA49C,X        ; BF 9C A4 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDAED9,X        ; BF D9 AE ED
    STA $FC50            ; 8D 50 FC
    LDA $EDB916,X        ; BF 16 B9 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDC353,X        ; BF 53 C3 ED
    STA $FC54            ; 8D 54 FC

Menu_Function_006:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($81A4,X)        ; 7C A4 81
    LDY $81,X            ; B4 81
    LDA $C681,Y          ; B9 81 C6
    STA $CB              ; 81 CB
    STA $D8              ; 81 D8
    STA $DD              ; 81 DD
    STA $EA              ; 81 EA
    STA $EF              ; 81 EF
    STA $A6              ; 81 A6
    TSB $4C              ; 04 4C
    AND $82              ; 32 82
    LDX $04              ; A6 04
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8246            ; 4C 46 82
    LDX $04              ; A6 04
    JMP $8252            ; 4C 52 82
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8266            ; 4C 66 82
    LDX $04              ; A6 04
    JMP $8272            ; 4C 72 82
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8286            ; 4C 86 82
    LDX $04              ; A6 04
    JMP $8292            ; 4C 92 82
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $82A6            ; 4C A6 82
    LDA $10              ; A5 10
    AND $26              ; 25 26

Menu_Function_007:
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_008:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDA49C,X        ; BF 9C A4 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDAED9,X        ; BF D9 AE ED
    STA $FC50            ; 8D 50 FC
    LDA $EDB916,X        ; BF 16 B9 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDC353,X        ; BF 53 C3 ED
    STA $FC54            ; 8D 54 FC

Menu_Function_009:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 73
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 53
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 33
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 13
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $82B9            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $81FC            ; 4C FC 81
    RTS                  ; 60
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_00A:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDCD90,X        ; BF 90 CD ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDD7CD,X        ; BF CD D7 ED
    STA $FC50            ; 8D 50 FC
    LDA $EDE20A,X        ; BF 0A E2 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDEC47,X        ; BF 47 EC ED
    STA $FC54            ; 8D 54 FC

Menu_Function_00B:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($82FF,X)        ; 7C FF 82
    ORA $831483          ; 0F 83 14 83
    AND $83              ; 21 83
    ROL $83              ; 26 83
    AND $83              ; 33 83
    SEC                  ; 38
    STA $45              ; 83 45
    STA $4A              ; 83 4A
    STA $A6              ; 83 A6
    TSB $4C              ; 04 4C
    STA $A683            ; 8D 83 A6
    TSB $AD              ; 04 AD
    LSR $18FC            ; 4E FC 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $83A1            ; 4C A1 83
    LDX $04              ; A6 04
    JMP $83AD            ; 4C AD 83
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $83C1            ; 4C C1 83
    LDX $04              ; A6 04
    JMP $83CD            ; 4C CD 83
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $83E1            ; 4C E1 83
    LDX $04              ; A6 04
    JMP $83ED            ; 4C ED 83
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8401            ; 4C 01 84
    LDA $10              ; A5 10
    AND $26              ; 25 26
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_00C:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDCD90,X        ; BF 90 CD ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDD7CD,X        ; BF CD D7 ED
    STA $FC50            ; 8D 50 FC
    LDA $EDE20A,X        ; BF 0A E2 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDEC47,X        ; BF 47 EC ED
    STA $FC54            ; 8D 54 FC

Menu_Function_00D:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 73
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 53
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 33
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 13
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8414            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $8357            ; 4C 57 83
    RTS                  ; 60
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_00E:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDCD90,X        ; BF 90 CD ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDD7CD,X        ; BF CD D7 ED
    STA $FC50            ; 8D 50 FC
    LDA $EDE20A,X        ; BF 0A E2 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDEC47,X        ; BF 47 EC ED
    STA $FC54            ; 8D 54 FC

Menu_Function_00F:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($845A,X)        ; 7C 5A 84
    ROR                  ; 6A
    STY $6F              ; 84 6F
    STY $7C              ; 84 7C
    STY $81              ; 84 81
    STY $8E              ; 84 8E
    STY $93              ; 84 93
    STY $A0              ; 84 A0
    STY $A5              ; 84 A5
    STY $A6              ; 84 A6
    TSB $4C              ; 04 4C
    INX                  ; E8
    STY $A6              ; 84 A6
    TSB $AD              ; 04 AD
    LSR $18FC            ; 4E FC 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $84FC            ; 4C FC 84
    LDX $04              ; A6 04
    JMP $8508            ; 4C 08 85
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $851C            ; 4C 1C 85
    LDX $04              ; A6 04
    JMP $8528            ; 4C 28 85
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $853C            ; 4C 3C 85
    LDX $04              ; A6 04
    JMP $8548            ; 4C 48 85
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $855C            ; 4C 5C 85
    LDA $10              ; A5 10
    AND $26              ; 25 26
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_010:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDCD90,X        ; BF 90 CD ED
    STA $FC4E            ; 8D 4E FC
    LDA $EDD7CD,X        ; BF CD D7 ED
    STA $FC50            ; 8D 50 FC
    LDA $EDE20A,X        ; BF 0A E2 ED
    STA $FC52            ; 8D 52 FC
    LDA $EDEC47,X        ; BF 47 EC ED
    STA $FC54            ; 8D 54 FC

Menu_Function_011:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 73
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 53
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 33
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 13
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $856F            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $84B2            ; 4C B2 84
    RTS                  ; 60
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_012:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDF684,X        ; BF 84 F6 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EE00C1,X        ; BF C1 00 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE0AFE,X        ; BF FE 0A EE
    STA $FC52            ; 8D 52 FC
    LDA $EE153B,X        ; BF 3B 15 EE
    STA $FC54            ; 8D 54 FC

Menu_Function_013:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($85B5,X)        ; 7C B5 85
    CMP $85              ; C5 85
    DEX                  ; CA
    STA $D7              ; 85 D7
    STA $DC              ; 85 DC
    STA $E9              ; 85 E9
    STA $EE              ; 85 EE
    STA $FB              ; 85 FB
    STA $00              ; 85 00
    STX $A6              ; 86 A6
    TSB $4C              ; 04 4C
    EOR $86              ; 43 86
    LDX $04              ; A6 04
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8657            ; 4C 57 86
    LDX $04              ; A6 04
    JMP $8663            ; 4C 63 86
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8677            ; 4C 77 86
    LDX $04              ; A6 04
    JMP $8683            ; 4C 83 86
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8697            ; 4C 97 86
    LDX $04              ; A6 04
    JMP $86A3            ; 4C A3 86

Menu_Function_014:
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $86B7            ; 4C B7 86
    LDA $10              ; A5 10
    AND $26              ; 25 26
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_015:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDF684,X        ; BF 84 F6 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EE00C1,X        ; BF C1 00 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE0AFE,X        ; BF FE 0A EE
    STA $FC52            ; 8D 52 FC
    LDA $EE153B,X        ; BF 3B 15 EE
    STA $FC54            ; 8D 54 FC

Menu_Function_016:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 73
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 53
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 33
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 13
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $86CA            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $860D            ; 4C 0D 86
    RTS                  ; 60
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_017:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDF684,X        ; BF 84 F6 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EE00C1,X        ; BF C1 00 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE0AFE,X        ; BF FE 0A EE
    STA $FC52            ; 8D 52 FC
    LDA $EE153B,X        ; BF 3B 15 EE
    STA $FC54            ; 8D 54 FC

Menu_Function_018:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($8710,X)        ; 7C 10 87
    JSR $2587            ; 20 87 25
    STA $32              ; 87 32
    STA $37              ; 87 37
    STA $44              ; 87 44
    STA $49              ; 87 49
    STA $56              ; 87 56
    STA $5B              ; 87 5B
    STA $A6              ; 87 A6
    TSB $4C              ; 04 4C
    STZ $A687,X          ; 9E 87 A6
    TSB $AD              ; 04 AD
    LSR $18FC            ; 4E FC 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $87B2            ; 4C B2 87
    LDX $04              ; A6 04
    JMP $87BE            ; 4C BE 87
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $87D2            ; 4C D2 87
    LDX $04              ; A6 04
    JMP $87DE            ; 4C DE 87
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $87F2            ; 4C F2 87
    LDX $04              ; A6 04
    JMP $87FE            ; 4C FE 87
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8812            ; 4C 12 88
    LDA $10              ; A5 10
    AND $26              ; 25 26
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_019:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EDF684,X        ; BF 84 F6 ED
    STA $FC4E            ; 8D 4E FC
    LDA $EE00C1,X        ; BF C1 00 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE0AFE,X        ; BF FE 0A EE
    STA $FC52            ; 8D 52 FC
    LDA $EE153B,X        ; BF 3B 15 EE
    STA $FC54            ; 8D 54 FC

Menu_Function_01A:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 73
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 53
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 33
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 13
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8825            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $8768            ; 4C 68 87
    RTS                  ; 60
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_01B:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EE1F78,X        ; BF 78 1F EE
    STA $FC4E            ; 8D 4E FC
    LDA $EE29B5,X        ; BF B5 29 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE33F2,X        ; BF F2 33 EE
    STA $FC52            ; 8D 52 FC
    LDA $EE3E2F,X        ; BF 2F 3E EE
    STA $FC54            ; 8D 54 FC

Menu_Function_01C:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($886B,X)        ; 7C 6B 88
    TDC                  ; 7B
    DEY                  ; 88
    BRA $87F7            ; 80 88
    STA $9288            ; 8D 88 92
    DEY                  ; 88
    STA $88A488,X        ; 9F 88 A4 88
    LDA $88              ; B1 88
    LDX $88,Y            ; B6 88
    LDX $04              ; A6 04
    JMP $88F9            ; 4C F9 88
    LDX $04              ; A6 04
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $890D            ; 4C 0D 89
    LDX $04              ; A6 04
    JMP $8919            ; 4C 19 89
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $892D            ; 4C 2D 89
    LDX $04              ; A6 04
    JMP $8939            ; 4C 39 89
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $894D            ; 4C 4D 89
    LDX $04              ; A6 04
    JMP $8959            ; 4C 59 89
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $896D            ; 4C 6D 89
    LDA $10              ; A5 10
    AND $26              ; 25 26
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_01D:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EE1F78,X        ; BF 78 1F EE
    STA $FC4E            ; 8D 4E FC
    LDA $EE29B5,X        ; BF B5 29 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE33F2,X        ; BF F2 33 EE
    STA $FC52            ; 8D 52 FC
    LDA $EE3E2F,X        ; BF 2F 3E EE
    STA $FC54            ; 8D 54 FC

Menu_Function_01E:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 73
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 53
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 33
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 13
    LDA $B886,Y          ; B9 86 B8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8980            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $88C3            ; 4C C3 88
    RTS                  ; 60
    LDA $E3D0            ; AD D0 E3
    PHA                  ; 48
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    AND $26              ; 25 26
    STA $10              ; 85 10
    TAY                  ; A8
    LDA $00              ; B7 00
    TAX                  ; AA

Menu_Function_01F:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EE1F78,X        ; BF 78 1F EE
    STA $FC4E            ; 8D 4E FC
    LDA $EE29B5,X        ; BF B5 29 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE33F2,X        ; BF F2 33 EE
    STA $FC52            ; 8D 52 FC
    LDA $EE3E2F,X        ; BF 2F 3E EE
    STA $FC54            ; 8D 54 FC

Menu_Function_020:
    REP #$20             ; C2 20
    PLA                  ; 68
    AND #$07             ; 29 07
    BRK $0A              ; 00 0A
    TAX                  ; AA
    JMP ($89C6,X)        ; 7C C6 89
    DEC $89,X            ; D6 89
    STP                  ; DB
    BIT #$E8             ; 89 E8
    BIT #$ED             ; 89 ED
    BIT #$FA             ; 89 FA
    BIT #$FF             ; 89 FF
    BIT #$0C             ; 89 0C
    TXA                  ; 8A
    ORA $8A              ; 11 8A
    LDX $04              ; A6 04
    JMP $8A54            ; 4C 54 8A
    LDX $04              ; A6 04
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8A68            ; 4C 68 8A
    LDX $04              ; A6 04
    JMP $8A74            ; 4C 74 8A
    LDX $04              ; A6 04
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8A88            ; 4C 88 8A
    LDX $04              ; A6 04
    JMP $8A94            ; 4C 94 8A
    LDX $04              ; A6 04
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8AA8            ; 4C A8 8A
    LDX $04              ; A6 04
    JMP $8AB4            ; 4C B4 8A
    LDX $04              ; A6 04
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    JMP $8AC8            ; 4C C8 8A
    LDA $10              ; A5 10
    AND $26              ; 25 26
    TAY                  ; A8
    LDA $00              ; B7 00
    PHX                  ; DA
    TAX                  ; AA

Menu_Function_021:
    SEP #$20             ; E2 20
    STZ $FC4F            ; 9C 4F FC
    STZ $FC51            ; 9C 51 FC
    STZ $FC53            ; 9C 53 FC
    STZ $FC55            ; 9C 55 FC
    LDA $EE1F78,X        ; BF 78 1F EE
    STA $FC4E            ; 8D 4E FC
    LDA $EE29B5,X        ; BF B5 29 EE
    STA $FC50            ; 8D 50 FC
    LDA $EE33F2,X        ; BF F2 33 EE
    STA $FC52            ; 8D 52 FC
    LDA $EE3E2F,X        ; BF 2F 3E EE
    STA $FC54            ; 8D 54 FC

Menu_Function_022:
    REP #$20             ; C2 20
    PLX                  ; FA
    LDA $FC4E            ; AD 4E FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 73
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 67
    LDA $FC50            ; AD 50 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 53
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 47
    LDA $FC52            ; AD 52 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 33
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 27
    LDA $FC54            ; AD 54 FC
    CLC                  ; 18
    ADC $2A              ; 65 2A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 13
    LDA $C886,Y          ; B9 86 C8
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEC $24              ; C6 24
    BEQ $8ADB            ; F0 07
    INC $10              ; E6 10
    INC $10              ; E6 10
    JMP $8A1E            ; 4C 1E 8A
    RTS                  ; 60
    LDX $18              ; A6 18
    CPX #$08             ; E0 08
    BRK $D0              ; 00 D0
    ORA $60              ; 01 60
    INC $E34E,X          ; FE 4E E3
    LDA $14              ; A5 14
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    STA $E3C4            ; 8D C4 E3
    LDA $E376,X          ; BD 76 E3
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    STA $E3C6            ; 8D C6 E3
    LDA $C16F0E,X        ; BF 0E 6F C1
    STA $E3C8            ; 8D C8 E3
    LDA $E3B4            ; AD B4 E3
    INC                  ; 1A
    INC                  ; 1A
    STA $E5C0            ; 8D C0 E5
    LDX $18              ; A6 18
    LDA $E3E2            ; AD E2 E3
    BPL $8B21            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E472            ; CD 72 E4
    BNE $8B21            ; D0 0B
    LDA $E4B2            ; AD B2 E4
    BEQ $8B21            ; F0 06
    LDY #$00             ; A0 00
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_023:
    PHB                  ; 8B
    LDA $E3E4            ; AD E4 E3
    BPL $8B39            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E474            ; CD 74 E4
    BNE $8B39            ; D0 0B
    LDA $E4B4            ; AD B4 E4
    BEQ $8B39            ; F0 06
    LDY #$02             ; A0 02
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_024:
    PHB                  ; 8B
    LDA $E3E6            ; AD E6 E3
    BPL $8B51            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E476            ; CD 76 E4
    BNE $8B51            ; D0 0B
    LDA $E4B6            ; AD B6 E4
    BEQ $8B51            ; F0 06
    LDY #$04             ; A0 04
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_025:
    PHB                  ; 8B
    LDA $E3E8            ; AD E8 E3
    BPL $8B69            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E478            ; CD 78 E4
    BNE $8B69            ; D0 0B
    LDA $E4B8            ; AD B8 E4
    BEQ $8B69            ; F0 06
    LDY #$06             ; A0 06
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_026:
    PHB                  ; 8B
    LDA $E3EA            ; AD EA E3
    BPL $8B81            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E47A            ; CD 7A E4
    BNE $8B81            ; D0 0B
    LDA $E4BA            ; AD BA E4
    BEQ $8B81            ; F0 06
    LDY #$08             ; A0 08
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_027:
    PHB                  ; 8B
    LDA $E3EC            ; AD EC E3
    BPL $8B99            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E47C            ; CD 7C E4
    BNE $8B99            ; D0 0B
    LDA $E4BC            ; AD BC E4
    BEQ $8B99            ; F0 06
    LDY #$0A             ; A0 0A
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_028:
    PHB                  ; 8B
    LDA $E3EE            ; AD EE E3
    BPL $8BB1            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E47E            ; CD 7E E4
    BNE $8BB1            ; D0 0B
    LDA $E4BE            ; AD BE E4
    BEQ $8BB1            ; F0 06
    LDY #$0C             ; A0 0C
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_029:
    PHB                  ; 8B
    LDA $E3F0            ; AD F0 E3
    BPL $8BC9            ; 10 13
    LDA $18              ; A5 18
    LSR                  ; 4A
    CMP $E480            ; CD 80 E4
    BNE $8BC9            ; D0 0B
    LDA $E4C0            ; AD C0 E4
    BEQ $8BC9            ; F0 06
    LDY #$0E             ; A0 0E
    BRK $4C              ; 00 4C
    DEX                  ; CA

Menu_Function_02A:
    PHB                  ; 8B
    RTS                  ; 60
    TXA                  ; 8A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ADC #$62             ; 69 62
    JSR ($0885,X)        ; FC 85 08
    LDA $E3C4            ; AD C4 E3
    STA $0A              ; 85 0A
    LDA $E3C6            ; AD C6 E3
    STA $0C              ; 85 0C
    LDA $E3C8            ; AD C8 E3
    STA $04              ; 85 04
    LDA $E412,Y          ; B9 12 E4
    STA $00              ; 85 00
    LDA $E422,Y          ; B9 22 E4
    AND #$FF             ; 29 FF
    BRK $85              ; 00 85
    COP $20              ; 02 20
    ORA $A7              ; 03 A7
    LDA $E402,Y          ; B9 02 E4
    AND #$01             ; 29 01
    BRK $D0              ; 00 D0
    ORA $4C              ; 03 4C
    AND $8C              ; 33 8C
    LDA $E5B8            ; AD B8 E5
    DEC                  ; 3A
    STA $26              ; 85 26
    LDA $E5BA            ; AD BA E5
    DEC                  ; 3A
    STA $28              ; 85 28
    LDA $0A              ; A5 0A
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    AND $26              ; 25 26
    CLC                  ; 18
    ADC $E432,Y          ; 79 32 E4
    STA $0A              ; 85 0A
    LDA $0C              ; A5 0C
    SEC                  ; 38
    SBC $E452,Y          ; F9 52 E4
    AND $28              ; 25 28
    STA $E3D0            ; 8D D0 E3
    LDA $E5C0            ; AD C0 E5
    STA $24              ; 85 24
    LDA $E3F2,Y          ; B9 F2 E3
    TAX                  ; AA
    PHY                  ; 5A
    JSR ($A843,X)        ; FC 43 A8
    PLY                  ; 7A
    RTS                  ; 60
    LDA $0A              ; A5 0A
    CMP $E432,Y          ; D9 32 E4
    BCC $8C3D            ; 90 03
    JMP $8C7D            ; 4C 7D 8C
    LDA $E4D2,Y          ; B9 D2 E4
    STA $E3D6            ; 8D D6 E3
    CMP #$FF             ; C9 FF
    SBC $A705D0,X        ; FF D0 05 A7
    BRK $8D              ; 00 8D
    DEC $E3,X            ; D6 E3
    LDA $E502,Y          ; B9 02 E5
    STA $E3DA            ; 8D DA E3
    LDA $E522,Y          ; B9 22 E5
    STA $E3DE            ; 8D DE E3
    CMP #$FF             ; C9 FF
    SBC $2006D0,X        ; FF D0 06 20
    STY $8DA7            ; 8C A7 8D
    DEC $B9E3,X          ; DE E3 B9
    AND $E4              ; 32 E4
    SEC                  ; 38
    SBC $0A              ; E5 0A
    CMP #$21             ; C9 21
    BRK $90              ; 00 90
    ORA $4C              ; 03 4C
    ADC $258D,X          ; 7D 8D 25
    ASL $7918,X          ; 1E 18 79
    AND $E4              ; 32 E4
    STA $0A              ; 85 0A
    JMP $8CF8            ; 4C F8 8C
    LDA $E442,Y          ; B9 42 E4
    CMP $0A              ; C5 0A
    BCC $8CAF            ; 90 2B
    LDA $E4E2,Y          ; B9 E2 E4
    STA $E3D6            ; 8D D6 E3
    CMP #$FF             ; C9 FF
    SBC $2006D0,X        ; FF D0 06 20
    LDX #$A7             ; A2 A7
    STA $E3D6            ; 8D D6 E3
    LDA #$FF             ; A9 FF
    SBC $E3DA8D,X        ; FF 8D DA E3
    LDA $E532,Y          ; B9 32 E5
    STA $E3DE            ; 8D DE E3
    CMP #$FF             ; C9 FF
    SBC $2006D0,X        ; FF D0 06 20
    LDY $8DA7            ; AC A7 8D
    DEC $4CE3,X          ; DE E3 4C
    SED                  ; F8
    STY $F2B9            ; 8C B9 F2
    CPX $8D              ; E4 8D
    DEC $E3,X            ; D6 E3
    CMP #$FF             ; C9 FF
    SBC $5A0DD0,X        ; FF D0 0D 5A
    LDA $E5B4            ; AD B4 E5
    DEC                  ; 3A
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; B7 00
    STA $E3D6            ; 8D D6 E3
    PLY                  ; 7A
    LDA $E512,Y          ; B9 12 E5
    STA $E3DA            ; 8D DA E3
    LDA $E542,Y          ; B9 42 E5
    STA $E3DE            ; 8D DE E3
    CMP #$FF             ; C9 FF
    SBC $2006D0,X        ; FF D0 06 20
    ROR $A7,X            ; 76 A7
    STA $E3DE            ; 8D DE E3
    LDA $0A              ; A5 0A
    SEC                  ; 38
    SBC $E442,Y          ; F9 42 E4
    CMP #$21             ; C9 21
    BRK $90              ; 00 90
    ORA $4C              ; 03 4C
    ADC $258D,X          ; 7D 8D 25
    ASL $B948,X          ; 1E 48 B9
    WDM $E4              ; 42 E4
    SEC                  ; 38
    SBC $01              ; E3 01
    STA $0A              ; 85 0A
    PLA                  ; 68
    STZ $E3CA            ; 9C CA E3
    STZ $E3CC            ; 9C CC E3
    STZ $E3CE            ; 9C CE E3
    LDA $E5C0            ; AD C0 E5
    STA $20              ; 85 20
    LDA $0C              ; A5 0C
    CMP $E452,Y          ; D9 52 E4
    BCC $8D21            ; 90 14
    CMP $E462,Y          ; D9 62 E4
    BEQ $8D49            ; F0 37
    BCC $8D49            ; 90 35
    LDA $0C              ; A5 0C
    STA $E3D4            ; 8D D4 E3
    LDA $20              ; A5 20
    STA $E3CE            ; 8D CE E3
    JMP $8D74            ; 4C 74 8D
    LDA $0C              ; A5 0C
    STA $E3D0            ; 8D D0 E3
    LDA $E452,Y          ; B9 52 E4
    SEC                  ; 38
    SBC $0C              ; E5 0C
    STA $E3CA            ; 8D CA E3
    LDA $20              ; A5 20
    SEC                  ; 38
    SBC $E3CA            ; ED CA E3
    BCS $8D3F            ; B0 08
    LDA $20              ; A5 20
    STA $E3CA            ; 8D CA E3
    JMP $8D74            ; 4C 74 8D
    STA $20              ; 85 20
    LDA $0C              ; A5 0C
    CLC                  ; 18
    ADC $E3CA            ; 6D CA E3
    STA $0C              ; 85 0C
    LDA $0C              ; A5 0C
    STA $E3D2            ; 8D D2 E3
    LDA $E462,Y          ; B9 62 E4
    INC                  ; 1A
    SEC                  ; 38
    SBC $0C              ; E5 0C
    STA $E3CC            ; 8D CC E3
    LDA $20              ; A5 20
    SEC                  ; 38
    SBC $E3CC            ; ED CC E3
    BCS $8D68            ; B0 08
    LDA $20              ; A5 20
    STA $E3CC            ; 8D CC E3
    JMP $8D74            ; 4C 74 8D
    STA $20              ; 85 20
    LDA $0C              ; A5 0C
    CLC                  ; 18
    ADC $E3CC            ; 6D CC E3
    STA $0C              ; 85 0C
    BRA $8D14            ; 80 A0
    LDA $E3F2,Y          ; B9 F2 E3
    TAX                  ; AA
    PHY                  ; 5A
    JSR ($A831,X)        ; FC 31 A8
    PLY                  ; 7A
    RTS                  ; 60
    PHY                  ; 5A
    LDA $E3C6            ; AD C6 E3
    STA $0C              ; 85 0C
    LDA $0A              ; A5 0A
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    ASL                  ; 0A
    ADC $00              ; 65 00
    STA $00              ; 85 00
    BCC $8D93            ; 90 02
    INC $02              ; E6 02
    LDA $E5B4            ; AD B4 E5
    ASL                  ; 0A
    STA $0E              ; 85 0E
    LDA $E452,Y          ; B9 52 E4
    STA $E5C4            ; 8D C4 E5
    LDA $E3CA            ; AD CA E3
    BEQ $8DAC            ; F0 08
    STA $24              ; 85 24
    LDA $E3D6            ; AD D6 E3
    JSR $8E04            ; 20 04 8E
    LDA $E3CC            ; AD CC E3
    BEQ $8DF5            ; F0 44
    STA $24              ; 85 24
    LDA $E3DA            ; AD DA E3
    CMP #$FF             ; C9 FF
    SBC $2005F0,X        ; FF F0 05 20
    TSB $8E              ; 04 8E
    BRA $8DF5            ; 80 35
    LDA $E3D2            ; AD D2 E3
    SEC                  ; 38
    SBC $E5C4            ; ED C4 E5

Menu_Function_02B:
    SEP #$20             ; E2 20
    STA $004202          ; 8F 02 42 00
    LDA $0E              ; A5 0E
    STA $004203          ; 8F 03 42 00

Menu_Function_02C:
    REP #$20             ; C2 20
    LDA $00              ; A5 00
    CLC                  ; 18
    ADC $004216          ; 6F 16 42 00
    STA $00              ; 85 00
    LDA $00              ; A7 00
    STA $04              ; 92 04
    INC $04              ; E6 04
    INC $04              ; E6 04
    LDA $00              ; A5 00
    CLC                  ; 18
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    BCC $8DF1            ; 90 02
    INC $02              ; E6 02
    DEC $24              ; C6 24
    BNE $8DDE            ; D0 E9
    LDA $E3CE            ; AD CE E3
    BEQ $8E02            ; F0 08
    STA $24              ; 85 24
    LDA $E3DE            ; AD DE E3
    JSR $8E04            ; 20 04 8E
    PLY                  ; 7A
    RTS                  ; 60
    STA $04              ; 92 04
    INC $04              ; E6 04
    INC $04              ; E6 04
    DEC $24              ; C6 24
    BNE $8E04            ; D0 F6
    RTS                  ; 60
    LDA $E3C6            ; AD C6 E3
    STA $0C              ; 85 0C
    LDA $0A              ; A5 0A
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    LSR                  ; 4A
    ASL                  ; 0A
    ADC $00              ; 65 00
    STA $00              ; 85 00
    BCC $8E24            ; 90 02
    INC $02              ; E6 02
    LDA $E5B4            ; AD B4 E5
    ASL                  ; 0A
    STA $0E              ; 85 0E
    LDA $E452,Y          ; B9 52 E4
    STA $E5C4            ; 8D C4 E5
    LDA $0A              ; A5 0A
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    LSR                  ; 4A
    BCC $8E3C            ; 90 03
    JMP $937B            ; 4C 7B 93
    LDA $E3CA            ; AD CA E3
    BEQ $8E51            ; F0 10
    STA $24              ; 85 24
    LDA $E3D0            ; AD D0 E3
    SEC                  ; 38
    SBC $E5C4            ; ED C4 E5
    TAX                  ; AA
    LDA $E3D6            ; AD D6 E3
    JSR $9351            ; 20 51 93
    LDA $E3CC            ; AD CC E3
    BNE $8E59            ; D0 03
    JMP $8ED3            ; 4C D3 8E
    STA $24              ; 85 24
    LDA $E3D2            ; AD D2 E3
    SEC                  ; 38
    SBC $E5C4            ; ED C4 E5
    TAX                  ; AA
    LDA $E3DA            ; AD DA E3
    CMP #$FF             ; C9 FF
    SBC $AD09F0,X        ; FF F0 09 AD
    PHX                  ; DA
    SBC $20              ; E3 20
    EOR $93              ; 51 93
    JMP $8ED3            ; 4C D3 8E
    TXA                  ; 8A
    LSR                  ; 4A

Menu_Function_02D:
    SEP #$20             ; E2 20
    STA $004202          ; 8F 02 42 00
    LDA $0E              ; A5 0E
    STA $004203          ; 8F 03 42 00

Menu_Function_02E:
    REP #$20             ; C2 20
    LDA $00              ; A5 00
    CLC                  ; 18
    ADC $004216          ; 6F 16 42 00
    STA $00              ; 85 00
    TXA                  ; 8A
    LSR                  ; 4A
    BCC $8EB9            ; 90 28
    LDA $24              ; A5 24
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C18EE9,X        ; BF E9 8E C1
    STA $001D9A          ; 8F 9A 1D 00
    LDA #$C1             ; A9 C1
    BRK $8F              ; 00 8F
    STZ $001D            ; 9C 1D 00
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDX $04              ; A6 04
    JSR $A80A            ; 20 0A A8
    BRA $8ED1            ; 80 18
    LDA $24              ; A5 24
    ASL                  ; 0A
    TAX                  ; AA
    LDA $C18F2D,X        ; BF 2D 8F C1
    STA $001D9A          ; 8F 9A 1D 00
    LDA #$C1             ; A9 C1
    BRK $8F              ; 00 8F
    STZ $001D            ; 9C 1D 00
    LDX $04              ; A6 04
    JSR $A80A            ; 20 0A A8
    STX $04              ; 86 04
    LDA $E3CE            ; AD CE E3
    BEQ $8EE8            ; F0 10
    STA $24              ; 85 24
    LDA $E3D4            ; AD D4 E3
    SEC                  ; 38
    SBC $E5C4            ; ED C4 E5
    TAX                  ; AA
    LDA $E3DE            ; AD DE E3
    JSR $9351            ; 20 51 93
    RTS                  ; 60
    BVC $8E7E            ; 50 93
    EOR $91              ; 51 91
    AND $93              ; 32 93
    AND $91              ; 33 91
    TRB $93              ; 14 93
    ORA $91,X            ; 15 91
    INC $92,X            ; F6 92
    SBC $90              ; F7 90
    CLD                  ; D8
    STA $D9              ; 92 D9
    BCC $8EB8            ; 90 BA
    STA $BB              ; 92 BB
    BCC $8E9E            ; 90 9C
    STA $9D              ; 92 9D
    BCC $8F84            ; 90 7E
    STA $7F              ; 92 7F
    BCC $8F6A            ; 90 60
    STA $61              ; 92 61
    BCC $8F50            ; 90 42
    STA $43              ; 92 43
    BCC $8F36            ; 90 24
    STA $25              ; 92 25
    BCC $8F1C            ; 90 06
    STA $07              ; 92 07
    BCC $8F02            ; 90 E8
    STA $E9              ; 91 E9
    STA $CB91CA          ; 8F CA 91 CB
    STA $AD91AC          ; 8F AC 91 AD
    STA $8F918E          ; 8F 8E 91 8F
    STA $719170          ; 8F 70 91 71
    STA $3A9159          ; 8F 59 91 3A
    STA $3B              ; 93 3B
    STA $1C              ; 91 1C
    STA $1D              ; 93 1D
    STA $FE              ; 91 FE
    STA $FF              ; 92 FF
    BCC $8F1C            ; 90 E0
    STA $E1              ; 92 E1
    BCC $8F02            ; 90 C2
    STA $C3              ; 92 C3
    BCC $8EE8            ; 90 A4
    STA $A5              ; 92 A5
    BCC $8ECE            ; 90 86
    STA $87              ; 92 87
    BCC $8FB4            ; 90 68
    STA $69              ; 92 69
    BCC $8F9A            ; 90 4A
    STA $4B              ; 92 4B
    BCC $8F80            ; 90 2C
    STA $2D              ; 92 2D
    BCC $8F66            ; 90 0E
    STA $0F              ; 92 0F
    BCC $8F4C            ; 90 F0
    STA $F1              ; 91 F1
    STA $D391D2          ; 8F D2 91 D3
    STA $B591B4          ; 8F B4 91 B5
    STA $979196          ; 8F 96 91 97
    STA $799178          ; 8F 78 91 79
    STA $B9915A          ; 8F 5A 91 B9
    STX $D0              ; 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
    ASL                  ; 0A
    TAY                  ; A8
    LDA $00              ; A5 00
    ADC $0E              ; 65 0E
    STA $00              ; 85 00
    LDA $C086,Y          ; B9 86 C0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $D086,Y          ; B9 86 D0
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    LDA $00              ; A7 00
    JSL $7FFDA2          ; 22 A2 FD 7F
