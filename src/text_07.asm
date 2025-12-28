;==============================================================================
; Dragon Quest III - Text System (Bank $07)
; Comprehensive code extraction
;==============================================================================

.include "hardware.inc"

.segment "TEXT_CODE"

Text_Function_000:
    EOR $C3,X            ; 55 C3
    JSL $C34B44          ; 22 44 4B C3
    LDX #$07             ; A2 07
    BRK $22              ; 00 22

Text_Function_001:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    EOR $4B              ; 51 4B
    CMP $A2              ; C3 A2
    ORA $00              ; 07 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    RTL                  ; 6B
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$D7             ; A9 D7
    LDA $22              ; A7 22
    ADC $2B              ; 61 2B
    CMP $A2              ; C3 A2
    COP $00              ; 02 00
    JSL $C32B70          ; 22 70 2B C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C351CC          ; 22 CC 51 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8055            ; D0 03
    JMP $8084            ; 4C 84 80
    JSL $C3554B          ; 22 4B 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    TAY                  ; A8
    EOR $C3              ; 47 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_002:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $56              ; 00 56
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    BCS $80AD            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    EOR $80,X            ; 55 80
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C347A8          ; 22 A8 47 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_003:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    JSL $A9C355          ; 22 55 C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34EFC          ; 22 FC 4E C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35512          ; 22 12 55 C3
    LDA #$52             ; A9 52
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35512          ; 22 12 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F43          ; 22 43 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C347A8          ; 22 A8 47 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_004:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    JSL $A9C355          ; 22 55 C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F06          ; 22 06 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35512          ; 22 12 55 C3
    LDA #$56             ; A9 56
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35512          ; 22 12 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F4D          ; 22 4D 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C35292          ; 22 92 52 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $817C            ; D0 03
    JMP $81BD            ; 4C BD 81
    JSL $C349B3          ; 22 B3 49 C3
    LDX #$07             ; A2 07
    BRK $22              ; 00 22

Text_Function_005:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $A9C32C          ; 0F 2C C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C349D5          ; 22 D5 49 C3
    LDX #$07             ; A2 07
    BRK $22              ; 00 22

Text_Function_006:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $81E6            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    JMP ($6B81,X)        ; 7C 81 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C357E5          ; 22 E5 57 C3
    JSL $C348CC          ; 22 CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_007:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    CPY $C348            ; CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_008:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    CPY $C348            ; CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_009:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22

Text_Function_00A:
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    CPY $C348            ; CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_00B:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    CPY $C348            ; CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_00C:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    CPY $C348            ; CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_00D:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    CPY $C348            ; CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_00E:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    CPY $C348            ; CC 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_00F:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $6B              ; C3 6B
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$68             ; A9 68
    LDA $22              ; A7 22
    ADC $2B              ; 61 2B
    CMP $A2              ; C3 A2
    TSB $00              ; 04 00
    JSL $C32B70          ; 22 70 2B C3
    JSL $C35522          ; 22 22 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    PHY                  ; 5A
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $82D7            ; 70 2B
    CMP $22              ; C3 22
    ORA #$55             ; 09 55
    CMP $A9              ; C3 A9
    BRK $00              ; 00 00
    JSL $C33D5C          ; 22 5C 3D C3
    LDA #$E4             ; A9 E4
    LDA $22              ; A7 22
    AND $2B              ; 21 2B
    CMP $A2              ; C3 A2
    ORA $00              ; 05 00
    JSL $C32B70          ; 22 70 2B C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    RTS                  ; 60
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $8309            ; 70 2B
    CMP $22              ; C3 22
    ORA #$55             ; 09 55
    CMP $A9              ; C3 A9
    BRK $00              ; 00 00
    JSL $C33D5C          ; 22 5C 3D C3
    LDA #$0A             ; A9 0A
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    PLA                  ; 68
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $833B            ; 70 2B
    CMP $22              ; C3 22
    ORA #$55             ; 09 55
    CMP $A9              ; C3 A9
    BRK $00              ; 00 00
    JSL $C33D5C          ; 22 5C 3D C3
    LDA #$72             ; A9 72
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $8354            ; 70 2B
    CMP $6B              ; C3 6B
    JSL $C351CC          ; 22 CC 51 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $833A            ; D0 03
    JMP $8442            ; 4C 42 84
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C3553D          ; 22 3D 55 C3
    JSL $C347A8          ; 22 A8 47 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_010:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    PLD                  ; 2B
    EOR $C3,X            ; 55 C3
    LDA #$98             ; A9 98
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34EFC          ; 22 FC 4E C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35481          ; 22 81 54 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35481          ; 22 81 54 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F43          ; 22 43 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35534          ; 22 34 55 C3
    LDA #$9D             ; A9 9D
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F06          ; 22 06 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35481          ; 22 81 54 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$08             ; A9 08
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35481          ; 22 81 54 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F4D          ; 22 4D 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35534          ; 22 34 55 C3
    LDA #$DD             ; A9 DD
    LDA $22              ; A7 22
    ADC $2B              ; 61 2B
    CMP $22              ; C3 22
    STA $54              ; 81 54
    CMP $22              ; C3 22
    TCD                  ; 5B
    LSR $C3,X            ; 56 C3

Text_Function_011:
    JSL $C35481          ; 22 81 54 C3
    JSL $C35534          ; 22 34 55 C3
    LDA #$7A             ; A9 7A
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35481          ; 22 81 54 C3
    JSL $C3566E          ; 22 6E 56 C3
    JSL $C35481          ; 22 81 54 C3
    JSL $C35534          ; 22 34 55 C3
    JSL $C35614          ; 22 14 56 C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C3573C          ; 22 3C 57 C3
    JSL $C35542          ; 22 42 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8442            ; B0 03
    JMP $833A            ; 4C 3A 83
    RTL                  ; 6B
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$E4             ; A9 E4
    LDA $22              ; A7 22
    ADC $2B              ; 61 2B
    CMP $A2              ; C3 A2
    COP $00              ; 02 00
    JSL $C32B70          ; 22 70 2B C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C351CC          ; 22 CC 51 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $846B            ; D0 03
    JMP $849A            ; 4C 9A 84
    JSL $C3554B          ; 22 4B 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    TAY                  ; A8
    EOR $C3              ; 47 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_012:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $56              ; 00 56
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    BCS $84C3            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    RTL                  ; 6B
    STY $6B              ; 84 6B
    JSL $C3529C          ; 22 9C 52 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $84AA            ; D0 03
    JMP $84F9            ; 4C F9 84
    JSL $C357F2          ; 22 F2 57 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    LSR $C34B,X          ; 5E 4B C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_013:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $56              ; 00 56
    CMP $A9              ; C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    LDA #$07             ; A9 07
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35028          ; 22 28 50 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $84F9            ; B0 03
    JMP $84AA            ; 4C AA 84
    RTL                  ; 6B
    JSL $C352A1          ; 22 A1 52 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8509            ; D0 03
    JMP $8551            ; 4C 51 85
    JSL $C35804          ; 22 04 58 C3
    JSL $C34B73          ; 22 73 4B C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_014:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $56              ; 00 56
    CMP $A9              ; C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    LDA #$07             ; A9 07
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35039          ; 22 39 50 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8551            ; B0 03
    JMP $8509            ; 4C 09 85
    RTL                  ; 6B
    JSL $C35816          ; 22 16 58 C3
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C34A2C          ; 22 2C 4A C3
    LDX #$0A             ; A2 0A
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C34C16          ; 22 16 4C C3
    LDX #$0A             ; A2 0A
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$80             ; A9 80
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C356C9          ; 22 C9 56 C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$52             ; A9 52
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34EFC          ; 22 FC 4E C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    LDA #$02             ; A9 02
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F43          ; 22 43 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$56             ; A9 56
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F06          ; 22 06 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    LDA #$02             ; A9 02
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F4D          ; 22 4D 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$87             ; A9 87
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34F61          ; 22 61 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $8648            ; 70 2B
    CMP $A9              ; C3 A9
    STA $6122AA          ; 8F AA 22 61
    PLD                  ; 2B
    CMP $A9              ; C3 A9
    ORA $00              ; 05 00
    JSL $C32B8D          ; 22 8D 2B C3
    JSL $C34F7F          ; 22 7F 4F C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C347BA          ; 22 BA 47 C3
    LDX #$0A             ; A2 0A
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35522          ; 22 22 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34A5A          ; 22 5A 4A C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_015:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $A9              ; C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    JSL $C34A7B          ; 22 7B 4A C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_016:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $A9              ; C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    JSL $C34A9C          ; 22 9C 4A C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_017:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $A9              ; C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    JSL $C34ABD          ; 22 BD 4A C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_018:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $A9              ; C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    JSL $C34ADE          ; 22 DE 4A C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_019:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $6B              ; C3 6B
    JSL $C3554B          ; 22 4B 55 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $8717            ; 70 2B
    CMP $A9              ; C3 A9
    STX $AA,Y            ; 96 AA
    JSL $C32B61          ; 22 61 2B C3
    LDX #$05             ; A2 05
    BRK $22              ; 00 22
    BVS $8725            ; 70 2B
    CMP $22              ; C3 22
    JSL $22C355          ; 22 55 C3 22
    LDX $52              ; A6 52
    CMP $22              ; C3 22
    BCS $8734            ; B0 2E
    CMP $A5              ; C3 A5
    TSB $D0              ; 04 D0
    ORA $4C              ; 03 4C
    AND $87,X            ; 35 87
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    DEY                  ; 88

Text_Function_01A:
    PHK                  ; 4B
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8735            ; B0 03
    JMP $870E            ; 4C 0E 87
    JSL $C35FD5          ; 22 D5 5F C3
    BCS $873E            ; B0 03
    JMP $8754            ; 4C 54 87
    LDA #$00             ; A9 00
    BRA $8764            ; 80 22
    JMP $A9C33D          ; 5C 3D C3 A9
    TXY                  ; 9B
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $877D            ; 70 2B
    CMP $38              ; C3 38
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $878A            ; 70 2B
    CMP $A9              ; C3 A9
    LDY $AA              ; A4 AA
    JSL $C32B61          ; 22 61 2B C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $8798            ; 70 2B
    CMP $22              ; C3 22
    JSL $22C355          ; 22 55 C3 22
    CMP $52              ; C3 52
    CMP $22              ; C3 22
    BCS $87A7            ; B0 2E
    CMP $A5              ; C3 A5
    TSB $D0              ; 04 D0
    ORA $4C              ; 03 4C
    TAY                  ; A8
    STA $A9              ; 87 A9
    BRK $00              ; 00 00
    JSL $C33D5C          ; 22 5C 3D C3
    JSL $C34BBA          ; 22 BA 4B C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_01B:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    BCS $87D1            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    STA $87              ; 81 87
    JSL $C35FD5          ; 22 D5 5F C3
    BCS $87B1            ; B0 03
    JMP $87C7            ; 4C C7 87
    LDA #$00             ; A9 00
    BRA $87D7            ; 80 22
    JMP $A9C33D          ; 5C 3D C3 A9
    TXY                  ; 9B
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $87F0            ; 70 2B
    CMP $38              ; C3 38
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $87FD            ; 70 2B
    CMP $A9              ; C3 A9
    LDA #$AA             ; A9 AA
    JSL $C32B61          ; 22 61 2B C3
    LDX #$05             ; A2 05
    BRK $22              ; 00 22
    BVS $880B            ; 70 2B
    CMP $22              ; C3 22
    JSL $22C355          ; 22 55 C3 22
    CLD                  ; D8
    EOR $C3              ; 52 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $87F4            ; D0 03
    JMP $881B            ; 4C 1B 88
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    CMP $4B              ; D1 4B
    CMP $A2              ; C3 A2

Text_Function_01C:
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $881B            ; B0 03
    JMP $87F4            ; 4C F4 87
    JSL $C35FD5          ; 22 D5 5F C3
    BCS $8824            ; B0 03
    JMP $883A            ; 4C 3A 88
    LDA #$00             ; A9 00
    BRA $884A            ; 80 22
    JMP $A9C33D          ; 5C 3D C3 A9
    TXY                  ; 9B
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $8863            ; 70 2B
    CMP $38              ; C3 38
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $8870            ; 70 2B
    CMP $A9              ; C3 A9
    LDA $22AA            ; AD AA 22
    ADC $2B              ; 61 2B
    CMP $A2              ; C3 A2
    TSB $00              ; 04 00
    JSL $C32B70          ; 22 70 2B C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C352ED          ; 22 ED 52 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8867            ; D0 03
    JMP $888E            ; 4C 8E 88
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    INX                  ; E8

Text_Function_01D:
    PHK                  ; 4B
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $888E            ; B0 03
    JMP $8867            ; 4C 67 88
    JSL $C35FD5          ; 22 D5 5F C3
    BCS $8897            ; B0 03
    JMP $88AD            ; 4C AD 88
    LDA #$00             ; A9 00
    BRA $88BD            ; 80 22
    JMP $A9C33D          ; 5C 3D C3 A9
    TXY                  ; 9B
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $88D6            ; 70 2B
    CMP $38              ; C3 38
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $88E3            ; 70 2B
    CMP $A9              ; C3 A9
    LDA $AA              ; B3 AA
    JSL $C32B61          ; 22 61 2B C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $88F1            ; 70 2B
    CMP $22              ; C3 22
    JSL $22C355          ; 22 55 C3 22
    COP $53              ; 02 53
    CMP $22              ; C3 22
    BCS $8900            ; B0 2E
    CMP $A5              ; C3 A5
    TSB $D0              ; 04 D0
    ORA $4C              ; 03 4C
    ORA $89              ; 01 89
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    SBC $A2C34B,X        ; FF 4B C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8901            ; B0 03
    JMP $88DA            ; 4C DA 88
    JSL $C35FD5          ; 22 D5 5F C3
    BCS $890A            ; B0 03
    JMP $8920            ; 4C 20 89
    LDA #$00             ; A9 00
    BRA $8930            ; 80 22
    JMP $A9C33D          ; 5C 3D C3 A9
    TXY                  ; 9B
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $8949            ; 70 2B
    CMP $38              ; C3 38
    RTL                  ; 6B
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    LDY $22AA,X          ; BC AA 22
    AND $2B              ; 21 2B
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $A9              ; C3 A9
    BRK $00              ; 00 00
    JSL $C33D5C          ; 22 5C 3D C3
    LDA #$C3             ; A9 C3
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    BCC $88F6            ; 90 A7
    JSL $C32B21          ; 22 21 2B C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $8984            ; 70 2B
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $6B              ; C3 6B
    JSL $C35317          ; 22 17 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $896E            ; D0 03
    JMP $89C0            ; 4C C0 89
    LDA #$40             ; A9 40
    COP $22              ; 02 22
    JMP $22C33D          ; 5C 3D C3 22
    ROL                  ; 2A
    JMP $A2C3            ; 4C C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C3504A          ; 22 4A 50 C3
    LDX #$01             ; A2 01
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    LDA #$15             ; A9 15
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35055          ; 22 55 50 C3
    LDX #$05             ; A2 05
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $89C0            ; B0 03
    JMP $896E            ; 4C 6E 89
    RTL                  ; 6B
    JSL $C35317          ; 22 17 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $89D0            ; D0 03
    JMP $8A09            ; 4C 09 8A
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    ROL                  ; 2A
    JMP $A2C3            ; 4C C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35055          ; 22 55 50 C3
    LDX #$05             ; A2 05
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3

Text_Function_01E:
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8A09            ; B0 03
    JMP $89D0            ; 4C D0 89
    RTL                  ; 6B
    JSL $C35317          ; 22 17 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8A19            ; D0 03
    JMP $8A40            ; 4C 40 8A
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    ROL                  ; 2A
    JMP $A2C3            ; 4C C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8A40            ; B0 03
    JMP $8A19            ; 4C 19 8A
    RTL                  ; 6B
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C358C3          ; 22 C3 58 C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C351CC          ; 22 CC 51 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8A6D            ; D0 03
    JMP $8A9C            ; 4C 9C 8A
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C347BA          ; 22 BA 47 C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_01F:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $A9C32C          ; 0F 2C C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    JSL $C35ADE          ; 22 DE 5A C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8A9C            ; B0 03
    JMP $8A6D            ; 4C 6D 8A
    RTL                  ; 6B
    LDA #$CA             ; A9 CA
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C36086          ; 22 86 60 C3
    BCS $8AB1            ; B0 03
    JMP $8AC4            ; 4C C4 8A
    JSL $C351C9          ; 22 C9 51 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    LDA #$D1             ; A9 D1
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    SEC                  ; 38
    BCC $8AC9            ; 90 03
    JMP $8AD0            ; 4C D0 8A
    LDA #$DB             ; A9 DB
    TAX                  ; AA
    JSL $C32B61          ; 22 61 2B C3
    RTL                  ; 6B
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    CPX $AA              ; E4 AA
    JSL $C32B21          ; 22 21 2B C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    SBC $22AA            ; ED AA 22
    AND $2B              ; 21 2B
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $A9              ; C3 A9
    BRK $00              ; 00 00
    JSL $C33D5C          ; 22 5C 3D C3
    LDA #$F7             ; A9 F7
    TAX                  ; AA
    JSL $C32B21          ; 22 21 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    BCC $8ABF            ; 90 A7
    JSL $C32B21          ; 22 21 2B C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $8B4D            ; 70 2B
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $6B              ; C3 6B
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    SBC $2122AA,X        ; FF AA 22 21
    PLD                  ; 2B
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $A9              ; C3 A9
    BRK $00              ; 00 00
    JSL $C33D5C          ; 22 5C 3D C3
    LDA #$0B             ; A9 0B
    PLB                  ; AB
    JSL $C32B21          ; 22 21 2B C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    ASL $AB,X            ; 16 AB
    JSL $C32B21          ; 22 21 2B C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $A9C33D          ; 5C 3D C3 A9
    BCC $8B0F            ; 90 A7
    JSL $C32B21          ; 22 21 2B C3
    JSL $C35500          ; 22 00 55 C3
    RTL                  ; 6B
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$1F             ; A9 1F
    PLB                  ; AB
    JSL $C32B61          ; 22 61 2B C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C353D0          ; 22 D0 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8B99            ; D0 03
    JMP $8BC4            ; 4C C4 8B
    JSL $C35D5F          ; 22 5F 5D C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    PHA                  ; 48
    EOR $A2C3            ; 4D C3 A2
    TSB $00              ; 04 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8BC4            ; B0 03
    JMP $8B99            ; 4C 99 8B
    RTL                  ; 6B
    LDA #$25             ; A9 25
    PLB                  ; AB
    JSL $C32B21          ; 22 21 2B C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $8BFD            ; 70 2B
    CMP $22              ; C3 22
    STA $50              ; 85 50
    CMP $A2              ; C3 A2
    ORA $00              ; 03 00
    JSL $C32C9E          ; 22 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$2A             ; A9 2A
    PLB                  ; AB
    JSL $C32B21          ; 22 21 2B C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $8C1A            ; 70 2B
    CMP $22              ; C3 22

Text_Function_020:
    PHB                  ; 8B
    BVC $8BB7            ; 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$2F             ; A9 2F
    PLB                  ; AB
    JSL $C32B21          ; 22 21 2B C3
    JSL $C35079          ; 22 79 50 C3
    LDX #$05             ; A2 05
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$34             ; A9 34
    PLB                  ; AB
    JSL $C32B21          ; 22 21 2B C3
    JSL $C3507F          ; 22 7F 50 C3
    LDX #$05             ; A2 05
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$39             ; A9 39
    PLB                  ; AB
    JSL $C32B21          ; 22 21 2B C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22
    BVS $8C63            ; 70 2B
    CMP $22              ; C3 22
    STA $50              ; 91 50
    CMP $A2              ; C3 A2
    ORA $00              ; 01 00
    JSL $C32C9E          ; 22 9E 2C C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C35097          ; 22 97 50 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22
    SEC                  ; 38
    ROL $22C3            ; 2E C3 22
    BRK $55              ; 00 55
    CMP $6B              ; C3 6B
    JSL $C35FE7          ; 22 E7 5F C3
    BCS $8C61            ; B0 03
    JMP $8C9A            ; 4C 9A 8C
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C34C42          ; 22 42 4C C3
    LDX #$0F             ; A2 0F
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C358D7          ; 22 D7 58 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C3604F          ; 22 4F 60 C3
    BCS $8C88            ; B0 03
    JMP $8C90            ; 4C 90 8C
    LDA #$3E             ; A9 3E
    PLB                  ; AB
    JSL $C32B61          ; 22 61 2B C3
    SEC                  ; 38
    BCC $8C95            ; 90 03
    JMP $8C99            ; 4C 99 8C
    JSL $C35C00          ; 22 00 5C C3
    SEC                  ; 38
    RTL                  ; 6B
    JSL $C35FE7          ; 22 E7 5F C3
    BCS $8CA4            ; B0 03
    JMP $8CCB            ; 4C CB 8C
    JSL $C35CFA          ; 22 FA 5C C3
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C34C54          ; 22 54 4C C3
    LDX #$0F             ; A2 0F
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C35925          ; 22 25 59 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35BB3          ; 22 B3 5B C3
    SEC                  ; 38
    JSL $C35FEE          ; 22 EE 5F C3
    BCS $8CD4            ; B0 03
    JMP $8CF0            ; 4C F0 8C
    JSL $C35CFA          ; 22 FA 5C C3
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C35D0F          ; 22 0F 5D C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C35D23          ; 22 23 5D C3
    SEC                  ; 38
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C3531B          ; 22 1B 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8D04            ; D0 03
    JMP $8D4A            ; 4C 4A 8D
    JSL $C34921          ; 22 21 49 C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_021:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    AND $49              ; 21 49
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C34921          ; 22 21 49 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_022:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $8D73            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    TSB $8D              ; 04 8D
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C35345          ; 22 45 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8D5E            ; D0 03
    JMP $8DA4            ; 4C A4 8D
    JSL $C348FB          ; 22 FB 48 C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_023:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    XCE                  ; FB
    PHA                  ; 48
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C348FB          ; 22 FB 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_024:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $8DCD            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    LSR $6B8D,X          ; 5E 8D 6B
    JSL $C35D5F          ; 22 5F 5D C3
    JSL $C35351          ; 22 51 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8DB8            ; D0 03
    JMP $8DFE            ; 4C FE 8D
    JSL $C34921          ; 22 21 49 C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_025:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    AND $49              ; 21 49
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C34921          ; 22 21 49 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_026:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $8E27            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    CLV                  ; B8
    STA $226B            ; 8D 6B 22

Text_Function_027:
    EOR $22C35D,X        ; 5F 5D C3 22
    PHY                  ; 5A
    EOR $C3              ; 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8E12            ; D0 03
    JMP $8E58            ; 4C 58 8E
    JSL $C348FB          ; 22 FB 48 C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_028:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    XCE                  ; FB
    PHA                  ; 48
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C348FB          ; 22 FB 48 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_029:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $8E81            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    ORA $8E              ; 12 8E
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C35366          ; 22 66 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8E6C            ; D0 03
    JMP $8EA6            ; 4C A6 8E
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C3496E          ; 22 6E 49 C3
    LDX #$07             ; A2 07
    BRK $22              ; 00 22

Text_Function_02A:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    STY $49,X            ; 94 49
    CMP $A2              ; C3 A2
    ASL $00              ; 06 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8EA6            ; B0 03
    JMP $8E6C            ; 4C 6C 8E
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C35381          ; 22 81 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8EBA            ; D0 03
    JMP $8EE1            ; 4C E1 8E
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34947          ; 22 47 49 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_02B:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $8F0A            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    TSX                  ; BA
    STX $226B            ; 8E 6B 22

Text_Function_02C:
    PHK                  ; 4B
    EOR $C3,X            ; 55 C3
    JSL $C35390          ; 22 90 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8EF5            ; D0 03
    JMP $8F2F            ; 4C 2F 8F
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C3496E          ; 22 6E 49 C3
    LDX #$07             ; A2 07
    BRK $22              ; 00 22

Text_Function_02D:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    STY $49,X            ; 94 49
    CMP $A2              ; C3 A2
    ASL $00              ; 06 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $8F2F            ; B0 03
    JMP $8EF5            ; 4C F5 8E
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C353A1          ; 22 A1 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8F43            ; D0 03
    JMP $8F6A            ; 4C 6A 8F
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C34947          ; 22 47 49 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_02E:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $8F93            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    EOR $8F              ; 43 8F
    RTL                  ; 6B
    JSL $C35DA9          ; 22 A9 5D C3
    JSL $C357DD          ; 22 DD 57 C3
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C35DB9          ; 22 B9 5D C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C3604F          ; 22 4F 60 C3
    BCS $8F88            ; B0 03
    JMP $8FA2            ; 4C A2 8F
    LDA #$4B             ; A9 4B
    PLB                  ; AB
    JSL $C32B61          ; 22 61 2B C3
    JSL $C35500          ; 22 00 55 C3
    LDA #$54             ; A9 54
    PLB                  ; AB
    JSL $C32B61          ; 22 61 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $8FCB            ; 70 2B
    CMP $38              ; C3 38
    BCC $8FA7            ; 90 03
    JMP $8FC6            ; 4C C6 8F
    JSL $C36018          ; 22 18 60 C3
    BCS $8FB0            ; B0 03
    JMP $8FB5            ; 4C B5 8F
    JSL $C35E12          ; 22 12 5E C3
    SEC                  ; 38
    BCC $8FBA            ; 90 03
    JMP $8FC6            ; 4C C6 8F
    JSL $C35AD8          ; 22 D8 5A C3
    JSL $C35500          ; 22 00 55 C3
    JSL $C35C6C          ; 22 6C 5C C3
    RTL                  ; 6B
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$5A             ; A9 5A
    PLB                  ; AB
    JSL $C32B61          ; 22 61 2B C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $9006            ; 70 2B
    CMP $22              ; C3 22
    JSL $22C355          ; 22 55 C3 22
    CPY $C351            ; CC 51 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $8FEF            ; D0 03
    JMP $901E            ; 4C 1E 90
    JSL $C3554B          ; 22 4B 55 C3
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    TAY                  ; A8
    EOR $C3              ; 47 C3
    LDX #$04             ; A2 04

Text_Function_02F:
    BRK $22              ; 00 22

Text_Function_030:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    BRK $56              ; 00 56
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    BCS $9047            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    SBC $32228F          ; EF 8F 22 32
    CLI                  ; 58
    CMP $A9              ; C3 A9
    BRK $80              ; 00 80
    JSL $C33D5C          ; 22 5C 3D C3
    JSL $C34E23          ; 22 23 4E C3
    LDX #$04             ; A2 04
    BRK $22              ; 00 22

Text_Function_031:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $6BC32C          ; 0F 2C C3 6B
    JSL $C35FE7          ; 22 E7 5F C3
    BCS $9046            ; B0 03
    JMP $906E            ; 4C 6E 90
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C34C63          ; 22 63 4C C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_032:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    JSL $22C355          ; 22 55 C3 22
    AND $59              ; 25 59
    CMP $22              ; C3 22
    BRK $55              ; 00 55
    CMP $22              ; C3 22
    DEC $C35A,X          ; DE 5A C3
    SEC                  ; 38
    RTL                  ; 6B
    JSL $C35D31          ; 22 31 5D C3
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C351D6          ; 22 D6 51 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $9086            ; D0 03
    JMP $90B5            ; 4C B5 90
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    INY                  ; C8
    EOR $C3              ; 47 C3
    LDX #$0A             ; A2 0A
    BRK $22              ; 00 22

Text_Function_033:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    STA $56              ; 81 56
    CMP $22              ; C3 22
    LDA $58              ; B3 58
    CMP $22              ; C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $90DE            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    STX $90              ; 86 90
    RTL                  ; 6B
    JSL $C3521B          ; 22 1B 52 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $90C5            ; D0 03
    JMP $90F0            ; 4C F0 90
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    LSR                  ; 4A
    PHA                  ; 48
    CMP $A2              ; C3 A2
    ASL                  ; 0A
    BRK $22              ; 00 22

Text_Function_034:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    RTL                  ; 6B
    CLI                  ; 58
    CMP $22              ; C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $9119            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    CMP $90              ; C5 90
    JSL $C35FA9          ; 22 A9 5F C3
    RTL                  ; 6B
    JSL $C35212          ; 22 12 52 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $9104            ; D0 03
    JMP $913A            ; 4C 3A 91
    LDA #$00             ; A9 00
    BRK $22              ; 00 22
    JMP $22C33D          ; 5C 3D C3 22
    LSR                  ; 4A
    PHA                  ; 48
    CMP $A2              ; C3 A2
    ASL                  ; 0A
    BRK $22              ; 00 22

Text_Function_035:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    RTL                  ; 6B
    CLI                  ; 58
    CMP $A9              ; C3 A9
    ORA $00              ; 01 00
    JSL $C32B8D          ; 22 8D 2B C3
    JSL $C35844          ; 22 44 58 C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C32FB0          ; 22 B0 2F C3
    BCS $913A            ; B0 03
    JMP $9104            ; 4C 04 91
    RTL                  ; 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C353C8          ; 22 C8 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $914E            ; D0 03
    JMP $9194            ; 4C 94 91
    JSL $C349B3          ; 22 B3 49 C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_036:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    CMP $49,X            ; D5 49
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C349D5          ; 22 D5 49 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_037:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $91BD            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    LSR $2291            ; 4E 91 22
    EOR $5D              ; 43 5D
    CMP $6B              ; C3 6B
    JSL $C3554B          ; 22 4B 55 C3
    JSL $C353CC          ; 22 CC 53 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $91AC            ; D0 03
    JMP $91F2            ; 4C F2 91
    JSL $C349DB          ; 22 DB 49 C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_038:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    INC $C349,X          ; FE 49 C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_039:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    INC $C349,X          ; FE 49 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22

Text_Function_03A:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    BCS $921B            ; B0 2F
    CMP $B0              ; C3 B0
    ORA $4C              ; 03 4C
    LDY $2291            ; AC 91 22
    EOR $5D              ; 51 5D
    CMP $6B              ; C3 6B
    JSL $C35D5F          ; 22 5F 5D C3
    JSL $C34D5A          ; 22 5A 4D C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35522          ; 22 22 55 C3
    JSL $C34C75          ; 22 75 4C C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C34D68          ; 22 68 4D C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22
    AND $C32C            ; 2D 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$32             ; A9 32
    TAY                  ; A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C35D6C          ; 22 6C 5D C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$3A             ; A9 3A
    TAY                  ; A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C3510A          ; 22 0A 51 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    RTL                  ; 6B
    JSL $C35D5F          ; 22 5F 5D C3
    JSL $C34CA3          ; 22 A3 4C C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_03B:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    CPY $4C              ; C4 4C
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C34CE5          ; 22 E5 4C C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_03C:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $22C32C          ; 0F 2C C3 22
    ORA #$55             ; 09 55
    CMP $22              ; C3 22
    ASL $4D              ; 06 4D
    CMP $A2              ; C3 A2
    ORA #$00             ; 09 00
    JSL $C32BC2          ; 22 C2 2B C3
    JSL $C32BD2          ; 22 D2 2B C3
    JSL $C32C0F          ; 22 0F 2C C3
    JSL $C35509          ; 22 09 55 C3
    JSL $C34D27          ; 22 27 4D C3
    LDX #$09             ; A2 09
    BRK $22              ; 00 22

Text_Function_03D:
    REP #$2B             ; C2 2B
    CMP $22              ; C3 22
    CMP $2B              ; D2 2B
    CMP $22              ; C3 22
    ORA $6BC32C          ; 0F 2C C3 6B
    JSL $C35D5F          ; 22 5F 5D C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    BVS $9301            ; 70 2B
    CMP $A9              ; C3 A9
    EOR $A8              ; 41 A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350F6          ; 22 F6 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $931E            ; 70 2B
    CMP $A9              ; C3 A9
    EOR $A8              ; 47 A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350EC          ; 22 EC 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$4F             ; A9 4F
    TAY                  ; A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350BA          ; 22 BA 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $9358            ; 70 2B
    CMP $A9              ; C3 A9
    EOR $A8              ; 57 A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350A4          ; 22 A4 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$5E             ; A9 5E
    TAY                  ; A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350D8          ; 22 D8 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$66             ; A9 66
    TAY                  ; A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350C4          ; 22 C4 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$70             ; A9 70
    TAY                  ; A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350CE          ; 22 CE 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$7A             ; A9 7A
    TAY                  ; A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C350E2          ; 22 E2 50 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $93DB            ; 70 2B
    CMP $A9              ; C3 A9
    STA $A8              ; 83 A8
    JSL $C32B61          ; 22 61 2B C3
    JSL $C35100          ; 22 00 51 C3
    LDX #$03             ; A2 03
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    JSL $C35509          ; 22 09 55 C3
    LDA #$06             ; A9 06
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$05             ; A9 05
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    JSL $C350AE          ; 22 AE 50 C3
    LDX #$08             ; A2 08
    BRK $22              ; 00 22
    STZ $C32C,X          ; 9E 2C C3
    RTL                  ; 6B
    LDA #$01             ; A9 01
    BRK $22              ; 00 22
    STA $C32B            ; 8D 2B C3
    LDA #$1F             ; A9 1F
    PLB                  ; AB
    JSL $C32B61          ; 22 61 2B C3
    LDX #$02             ; A2 02
    BRK $22              ; 00 22
    BVS $9420            ; 70 2B
    CMP $22              ; C3 22
    JSL $22C355          ; 22 55 C3 22
    CPY $C351            ; CC 51 C3
    JSL $C32EB0          ; 22 B0 2E C3
    LDA $04              ; A5 04
    BNE $9409            ; D0 03
