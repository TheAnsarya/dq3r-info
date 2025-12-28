;==============================================================================
; Dragon Quest III - Bank 0A
;==============================================================================
; File: bank_0A.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Bank $0A Code
; Ultra-aggressive code extraction


.segment "BANK_0A_CODE"


;==============================================================================
; GeneralPurpose_00
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00:
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    BRK $DA              ; 00 DA | Software interrupt
    BRK $B2              ; 00 B2 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STY $0601            ; 8C 01 06 | Store Y register
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $01              ; 92 01 | Store accumulator to memory
    LDY #$00             ; A0 00 | Load Y register
    BRK $00              ; 00 00 | Software interrupt
    BRK $32              ; 00 32 | Software interrupt
    COP $0F              ; 02 0F | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    EOR $02              ; 41 02 | Unknown operation
    WDM $00              ; 42 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $83              ; 00 83 | Software interrupt
    COP $04              ; 02 04 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $02              ; 87 02 | Store accumulator to memory
    PHP                  ; 08 | Push processor status to stack
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $000502          ; 8F 02 05 00 | Store accumulator to memory
    BRK $00              ; 00 00 | Software interrupt
    BRK $94              ; 00 94 | Software interrupt
    COP $B2              ; 02 B2 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    LSR $03              ; 46 03 | Unknown operation
    CMP $00              ; C7 00 | Compare with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $0D              ; 00 0D | Software interrupt
    TSB $3B              ; 04 3B | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    PHA                  ; 48 | Push accumulator to stack
    TSB $18              ; 04 18 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    RTS                  ; 60 | Return from local function
    TSB $3C              ; 04 3C | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STZ $0704            ; 9C 04 07 | Unknown operation

    STZ $0704            ; 9C 04 07
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA $04              ; A3 04
    INC $0000,X          ; FE 00 00
    BRK $00              ; 00 00
    LDA $05              ; A1 05
    CMP $00              ; C3 00
    BRK $00              ; 00 00
    BRK $64              ; 00 64
    ASL $04              ; 06 04
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLA                  ; 68
    ASL $02              ; 06 02
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROR                  ; 6A
    ASL $28              ; 06 28
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $06              ; 92 06
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BRK $96              ; 00 96
    ASL $05              ; 06 05
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TXY                  ; 9B
    ASL $0E              ; 06 0E
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA #$06             ; A9 06
    ADC $00              ; 61 00
    BRK $00              ; 00 00
    BRK $0A              ; 00 0A
    ORA $15              ; 07 15
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ORA $2C              ; 05 2C
    ORA $F4              ; 03 F4
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL $20              ; 06 20
    TSB $60              ; 04 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $80              ; 07 80
    TSB $64              ; 04 64
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    PHP                  ; 08
    CPX $05              ; E4 05
    JMP ($0000,X)        ; 7C 00 00
    BRK $00              ; 00 00
    ORA #$60             ; 09 60
    ASL $E0              ; 06 E0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL                  ; 0A
    RTI                  ; 40
    ORA $10              ; 07 10
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PHD                  ; 0B
    BVC $0125            ; 50 07
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    TSB $0770            ; 0C 70 07
    BPL $0128            ; 10 00
    BRK $00              ; 00 00
    BRK $0D              ; 00 0D
    BRA $0135            ; 80 07
    PEA $0000            ; F4 00 00
    BRK $00              ; 00 00
    ASL $0874            ; 0E 74 08
    BCC $0139            ; 90 01
    BRK $00              ; 00 00
    BRK $0F              ; 00 0F
    TSB $0A              ; 04 0A
    CLV                  ; B8
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BPL $0101            ; 10 BC
    ASL                  ; 0A
    MVP $0002            ; 44 02 00
    BRK $00              ; 00 00
    ORA $00              ; 11 00
    ORA $00A4            ; 0D A4 00
    BRK $00              ; 00 00
    BRK $12              ; 00 12
    LDY $0D              ; A4 0D
    JSR $0000            ; 20 00 00
    BRK $00              ; 00 00
    ORA $C4              ; 13 C4
    ORA $0164            ; 0D 64 01
    BRK $00              ; 00 00
    BRK $14              ; 00 14
    PLP                  ; 28
    ORA $0001A0          ; 0F A0 01 00
    BRK $00              ; 00 00
    ORA $C8,X            ; 15 C8
    BPL $0183            ; 10 14
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ASL $DC,X            ; 16 DC
    BPL $017F            ; 10 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $E4              ; 17 E4
    BPL $010B            ; 10 8C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CLC                  ; 18
    BVS $0197            ; 70 11
    TRB $0000            ; 1C 00 00
    BRK $00              ; 00 00
    ORA $118C,Y          ; 19 8C 11
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    INC                  ; 1A
    STY $11,X            ; 94 11
    PLP                  ; 28
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TCS                  ; 1B
    LDY $0411,X          ; BC 11 04
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    TRB $12C0            ; 1C C0 12
    DEY                  ; 88
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA #$02             ; 09 02
    BRK $CB              ; 00 CB
    ROR $ED,X            ; 76 ED
    TSB $0106            ; 0C 06 01
    ORA #$02             ; 09 02
    BRK $02              ; 00 02
    ADC $ED              ; 77 ED
    ORA #$09             ; 09 09
    COP $09              ; 02 09
    COP $00              ; 02 00
    ROL $ED77            ; 2E 77 ED
    PHD                  ; 0B
    ORA $020602          ; 0F 02 06 02
    BRK $70              ; 00 70
    ADC $ED              ; 77 ED
    PHD                  ; 0B
    ASL                  ; 0A
    COP $07              ; 02 07
    COP $00              ; 02 00
    SBC $77              ; E7 77
    SBC $090C            ; ED 0C 09
    ORA $09              ; 01 09
    COP $00              ; 02 00
    ROL $ED78,X          ; 3E 78 ED
    PHD                  ; 0B
    ORA $0701            ; 0D 01 07

;==============================================================================
; GeneralPurpose_02
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02:
    COP $00              ; 02 00 | Unknown operation
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    SBC $100C            ; ED 0C 10 | Unknown operation
    COP $07              ; 02 07 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    SBC #$78             ; E9 78 | Unknown operation
    SBC $120A            ; ED 0A 12 | Unknown operation
    COP $04              ; 02 04 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    EOR $0BED79,X        ; 5F 79 ED 0B | Unknown operation
    ORA $02              ; 12 02 | Logical OR with accumulator
    TSB $02              ; 04 02 | Unknown operation
    BRK $D3              ; 00 D3 | Software interrupt
    ADC $0BED,Y          ; 79 ED 0B | Unknown operation
    TRB $02              ; 14 02 | Unknown operation
    ORA $02              ; 03 02 | Logical OR with accumulator
    BRK $46              ; 00 46 | Software interrupt
    PLY                  ; 7A | Pull Y register from stack
    SBC $0F0C            ; ED 0C 0F | Unknown operation
    COP $05              ; 02 05 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    PEI $7A              ; D4 7A | Unknown operation
    SBC $0809            ; ED 09 08 | Unknown operation
    COP $08              ; 02 08 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    LSR $ED7B            ; 4E 7B ED | Unknown operation
    PHD                  ; 0B | Unknown operation
    ORA $02              ; 13 02 | Logical OR with accumulator
    ORA $02              ; 03 02 | Logical OR with accumulator
    BRK $86              ; 00 86 | Software interrupt
    TDC                  ; 7B | Unknown operation
    SBC $150C            ; ED 0C 15 | Unknown operation
    COP $02              ; 02 02 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    PHP                  ; 08 | Push processor status to stack
    JMP ($0BED,X)        ; 7C ED 0B | Unknown operation
    ORA $020602          ; 0F 02 06 02 | Logical OR with accumulator
    BRK $BD              ; 00 BD | Software interrupt
    JMP ($08ED,X)        ; 7C ED 08 | Unknown operation
    ASL $02              ; 06 02 | Arithmetic shift left
    ORA #$02             ; 09 02 | Logical OR with accumulator
    BRK $2E              ; 00 2E | Software interrupt
    ADC $0BED,X          ; 7D ED 0B | Unknown operation
    ORA $02              ; 05 02 | Logical OR with accumulator
    ORA #$02             ; 09 02 | Logical OR with accumulator
    BRK $5C              ; 00 5C | Software interrupt
    ADC $1EED,X          ; 7D ED 1E | Unknown operation
    ORA $01              ; 07 01 | Logical OR with accumulator

    ORA $01              ; 07 01
    PHD                  ; 0B
    COP $00              ; 02 00
    STA $14ED7D          ; 8F 7D ED 14
    TSB $0606            ; 0C 06 06
    COP $00              ; 02 00
    LDA $7D              ; B3 7D
    SBC $0C14            ; ED 14 0C
    ASL $06              ; 06 06
    COP $00              ; 02 00
    ROL $7E,X            ; 36 7E
    SBC $0311            ; ED 11 03
    PHP                  ; 08
    ORA #$02             ; 09 02
    BRK $AF              ; 00 AF
    ROR $01ED,X          ; 7E ED 01
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $E6              ; 00 E6
    ROR $01ED,X          ; 7E ED 01
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $E9              ; 00 E9
    ROR $01ED,X          ; 7E ED 01
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $EC              ; 00 EC
    ROR $01ED,X          ; 7E ED 01
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $EF              ; 00 EF
    ROR $01ED,X          ; 7E ED 01
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $F2              ; 00 F2
    ROR $02ED,X          ; 7E ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $F5              ; 00 F5
    ROR $02ED,X          ; 7E ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $FA              ; 00 FA
    ROR $02ED,X          ; 7E ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $FF              ; 00 FF
    ROR $02ED,X          ; 7E ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $04              ; 00 04
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ORA #$7F             ; 09 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ASL $ED7F            ; 0E 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ORA $7F              ; 13 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CLC                  ; 18
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ORA $ED7F,X          ; 1D 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    JSL $02ED7F          ; 22 7F ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $27              ; 00 27
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BIT $ED7F            ; 2C 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    AND $7F              ; 31 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ROL $7F,X            ; 36 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    TSC                  ; 3B
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    RTI                  ; 40
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    EOR $7F              ; 45 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LSR                  ; 4A
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    EOR $02ED7F          ; 4F 7F ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $54              ; 00 54
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    EOR $ED7F,Y          ; 59 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LSR $ED7F,X          ; 5E 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $7F              ; 63 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    PLA                  ; 68
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $ED7F            ; 6D 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $7F              ; 72 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $7F              ; 77 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    JMP ($ED7F,X)        ; 7C 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STA $7F              ; 81 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STX $7F              ; 86 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    PHB                  ; 8B
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BCC $0457            ; 90 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STA $7F,X            ; 95 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    TXS                  ; 9A
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STA $02ED7F,X        ; 9F 7F ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $A4              ; 00 A4
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDA #$7F             ; A9 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDX $ED7F            ; AE 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDA $7F              ; B3 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CLV                  ; B8
    ADC $0101ED,X        ; 7F ED 01 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDA $ED7F,X          ; BD 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CPY #$7F             ; C0 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CMP $7F              ; C5 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    DEX                  ; CA
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CMP $02ED7F          ; CF 7F ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $D4              ; 00 D4
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CMP $ED7F,Y          ; D9 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    DEC $ED7F,X          ; DE 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    SBC $7F              ; E3 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    INX                  ; E8
    ADC $0102ED,X        ; 7F ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    SBC $ED7F            ; ED 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    SBC $7F              ; F2 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    SBC $7F              ; F7 7F
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    JSR ($ED7F,X)        ; FC 7F ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ORA $80              ; 01 80
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ASL $80              ; 06 80
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    PHD                  ; 0B
    BRA $04A7            ; 80 ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BPL $0442            ; 10 80
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ORA $80,X            ; 15 80
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    INC                  ; 1A
    BRA $04C2            ; 80 ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ORA $02ED80,X        ; 1F 80 ED 02
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $24              ; 00 24
    BRA $04D4            ; 80 ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    AND #$80             ; 29 80
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ROL $ED80            ; 2E 80 ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    AND $80              ; 33 80
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    SEC                  ; 38
    BRA $04F8            ; 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    AND $ED80,X          ; 3D 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    MVP $ED80            ; 44 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    PHK                  ; 4B
    BRA $0513            ; 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    EOR $80              ; 52 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    EOR $ED80,Y          ; 59 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    RTS                  ; 60
    BRA $052E            ; 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $80              ; 67 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ROR $ED80            ; 6E 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $80,X            ; 75 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    JMP ($ED80,X)        ; 7C 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STA $80              ; 83 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    TXA                  ; 8A
    BRA $0564            ; 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STA $80              ; 91 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    TYA                  ; 98
    BRA $0576            ; 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STA $03ED80,X        ; 9F 80 ED 03
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $A6              ; 00 A6
    BRA $0588            ; 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDA $ED80            ; AD 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDY $80,X            ; B4 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    TYX                  ; BB
    BRA $05A3            ; 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    REP #$80             ; C2 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CMP #$80             ; C9 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BNE $0550            ; D0 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CMP $80              ; D7 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    DEC $ED80,X          ; DE 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    SBC $80              ; E5 80
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    CPX $ED80            ; EC 80 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    SBC $80              ; F3 80
    SBC $0103            ; ED 03 01

;==============================================================================
; GeneralPurpose_06
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06:
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    PLX                  ; FA | Pull X register from stack
    BRA $05F4            ; 80 ED | Unknown operation
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    ORA $81              ; 01 81 | Logical OR with accumulator
    SBC $0103            ; ED 03 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    PHP                  ; 08 | Push processor status to stack
    STA $ED              ; 81 ED | Store accumulator to memory
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    ORA $03ED81          ; 0F 81 ED 03 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $02              ; 00 02 | Software interrupt
    BRK $16              ; 00 16 | Software interrupt
    STA $ED              ; 81 ED | Store accumulator to memory
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    ORA $ED81,X          ; 1D 81 ED | Logical OR with accumulator
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    BIT $81              ; 24 81 | Unknown operation
    SBC $0103            ; ED 03 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    PLD                  ; 2B | Unknown operation
    STA $ED              ; 81 ED | Store accumulator to memory
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    AND $81              ; 32 81 | Logical AND with accumulator
    SBC $0103            ; ED 03 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    AND $ED81,Y          ; 39 81 ED | Logical AND with accumulator
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    RTI                  ; 40 | Unknown operation
    STA $ED              ; 81 ED | Store accumulator to memory
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt

    BRK $00              ; 00 00
    COP $00              ; 02 00
    EOR $81              ; 47 81
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LSR $ED81            ; 4E 81 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    EOR $81,X            ; 55 81
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    JMP $03ED81          ; 5C 81 ED 03
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $61              ; 00 61
    STA $ED              ; 81 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    PLA                  ; 68
    STA $ED              ; 81 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $03ED81          ; 6F 81 ED 03
    ORA $00              ; 01 00
    BRK $02              ; 00 02
    BRK $76              ; 00 76
    STA $ED              ; 81 ED
    COP $01              ; 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    ADC $ED81,X          ; 7D 81 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BRL $F43C            ; 82 81 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BIT #$81             ; 89 81
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    BCC $064D            ; 90 81
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STA $81              ; 97 81
    SBC $0102            ; ED 02 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    STZ $ED81,X          ; 9E 81 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDA $81              ; A3 81
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    TAX                  ; AA
    STA $ED              ; 81 ED
    ORA $01              ; 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LDA $81              ; B1 81
    SBC $0103            ; ED 03 01
    BRK $00              ; 00 00
    COP $00              ; 02 00

;==============================================================================
; GeneralPurpose_07
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07:
    CLV                  ; B8 | Unknown operation
    STA $ED              ; 81 ED | Store accumulator to memory
    COP $01              ; 02 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    LDA $03ED81,X        ; BF 81 ED 03 | Load value into accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $02              ; 00 02 | Software interrupt
    BRK $C4              ; 00 C4 | Software interrupt
    STA $ED              ; 81 ED | Store accumulator to memory
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    WAI                  ; CB | Unknown operation
    STA $ED              ; 81 ED | Store accumulator to memory
    ORA $01              ; 03 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    CMP $81              ; D2 81 | Compare with accumulator
    SBC $0103            ; ED 03 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    CMP $ED81,Y          ; D9 81 ED | Compare with accumulator
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    CPX #$81             ; E0 81 | Unknown operation
    SBC $0101            ; ED 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    SBC $81              ; E3 81 | Unknown operation
    SBC $0101            ; ED 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    INC $81              ; E6 81 | Unknown operation
    SBC $0101            ; ED 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    SBC #$81             ; E9 81 | Unknown operation
    SBC $0101            ; ED 01 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    CPX $ED81            ; EC 81 ED | Unknown operation
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    SBC $00ED81          ; EF 81 ED 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data

    ; Skipped 32 bytes of data
    INX                  ; E8
    ORA $03              ; 05 03
    PHD                  ; 0B
    PHD                  ; 0B
    COP $00              ; 02 00
    AND $39              ; 21 39
    INX                  ; E8
    ORA $08              ; 05 08
    ASL $0208            ; 0E 08 02
    BRK $3F              ; 00 3F
    AND $12E8,Y          ; 39 E8 12
    ASL $08,X            ; 16 08
    ORA $02              ; 07 02
    BRK $6F              ; 00 6F
    AND $13E8,Y          ; 39 E8 13
    PHP                  ; 08
    PHD                  ; 0B
    ORA #$02             ; 09 02
    BRK $C6              ; 00 C6
    AND $03E8,Y          ; 39 E8 03
    ORA $0B              ; 03 0B
    ASL $0002            ; 0E 02 00
    BPL $07F0            ; 10 3A
    INX                  ; E8
    ORA $09              ; 07 09
    ASL $020E            ; 0E 0E 02
    BRK $22              ; 00 22
    DEC                  ; 3A
    INX                  ; E8
    ORA $0B              ; 12 0B
    ASL                  ; 0A
    ORA $02              ; 07 02
    BRK $39              ; 00 39
    DEC                  ; 3A
    INX                  ; E8
    ORA $0A0517          ; 0F 17 05 0A
    COP $00              ; 02 00
    STA $0FE83A          ; 8F 3A E8 0F
    BIT $0D              ; 24 0D
    TSB $0002            ; 0C 02 00
    CPY #$3A             ; C0 3A
    INX                  ; E8
    ORA $03              ; 05 03
    ASL                  ; 0A
    ASL $0002            ; 0E 02 00
    SEC                  ; 38
    TSC                  ; 3B
    INX                  ; E8
    AND $24              ; 23 24
    ORA #$03             ; 09 03
    COP $00              ; 02 00
    EOR $3B              ; 53 3B
    INX                  ; E8
    TCS                  ; 1B
    ORA $0914            ; 0D 14 09
    COP $00              ; 02 00
    CMP $3B              ; D7 3B
    INX                  ; E8
    ORA $09              ; 05 09
    PHD                  ; 0B
    TSB $02              ; 04 02
    BRK $1F              ; 00 1F
    BIT $0FE8,X          ; 3C E8 0F

;==============================================================================
; GeneralPurpose_08
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08:
    ORA #$0A             ; 09 0A | Logical OR with accumulator
    ORA #$02             ; 09 02 | Logical OR with accumulator
    BRK $45              ; 00 45 | Software interrupt
    BIT $10E8,X          ; 3C E8 10 | Unknown operation
    ORA $02100C,X        ; 1F 0C 10 02 | Set bits in PPUBrightness
    BRK $65              ; 00 65 | Software interrupt
    BIT $15E8,X          ; 3C E8 15 | Unknown operation
    TSB $0609            ; 0C 09 06 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    LDA #$3C             ; A9 3C | Load value into accumulator
    INX                  ; E8 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    PHP                  ; 08 | Push processor status to stack
    ORA #$09             ; 09 09 | Logical OR with accumulator
    COP $00              ; 02 00 | Unknown operation
    SBC $3C,X            ; F5 3C | Unknown operation
    INX                  ; E8 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    TCS                  ; 1B | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    PHP                  ; 08 | Push processor status to stack
    COP $00              ; 02 00 | Unknown operation
    ORA $E83D,Y          ; 19 3D E8 | Logical OR with accumulator
    TRB $03              ; 14 03 | Unknown operation
    TSB $0206            ; 0C 06 02 | Unknown operation
    BRK $5F              ; 00 5F | Software interrupt
    AND $09E8,X          ; 3D E8 09 | Logical AND with accumulator
    ROL $18              ; 26 18 | Unknown operation
    ORA $02              ; 11 02 | Logical OR with accumulator
    BRK $7B              ; 00 7B | Software interrupt
    AND $22E8,X          ; 3D E8 22 | Logical AND with accumulator
    DEC                  ; 3A | Unknown operation
    BPL $084F            ; 10 0D | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    DEX                  ; CA | Unknown operation
    AND $06E8,X          ; 3D E8 06 | Logical AND with accumulator
    ORA $09              ; 03 09 | Logical OR with accumulator
    PHD                  ; 0B | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    PLY                  ; 7A | Pull Y register from stack
    ROL $03E8,X          ; 3E E8 03 | Unknown operation
    ORA $0A              ; 07 0A | Logical OR with accumulator
    ORA $02              ; 07 02 | Logical OR with accumulator
    BRK $92              ; 00 92 | Software interrupt
    ROL $04E8,X          ; 3E E8 04 | Unknown operation
    ORA $0C              ; 07 0C | Logical OR with accumulator
    ORA $02              ; 07 02 | Logical OR with accumulator
    BRK $AB              ; 00 AB | Software interrupt
    ROL $06E8,X          ; 3E E8 06 | Unknown operation

    ROL $06E8,X          ; 3E E8 06
    TRB $0C              ; 14 0C
    ORA $02              ; 07 02
    BRK $C3              ; 00 C3
    ROL $33E8,X          ; 3E E8 33
    PLP                  ; 28
    PHP                  ; 08
    PHP                  ; 08
    COP $00              ; 02 00
    CMP $E83E,X          ; DD 3E E8
    PHP                  ; 08
    TSB $0D              ; 04 0D
    PHP                  ; 08
    COP $00              ; 02 00
    STY $E83F            ; 8C 3F E8
    PLD                  ; 2B
    EOR #$0A             ; 49 0A
    ORA #$02             ; 09 02
    BRK $AA              ; 00 AA
    AND $030CE8,X        ; 3F E8 0C 03
    ORA $0A              ; 11 0A
    COP $00              ; 02 00
    LDX $E840,Y          ; BE 40 E8
    ORA $0E0F            ; 0D 0F 0E
    PHD                  ; 0B
    COP $00              ; 02 00
    PHX                  ; DA
    RTI                  ; 40
    INX                  ; E8
    TRB $0825            ; 1C 25 08
    ORA $02              ; 13 02
    BRK $F8              ; 00 F8
    RTI                  ; 40
    INX                  ; E8
    ASL $062D,X          ; 1E 2D 06
    ORA $02              ; 05 02
    BRK $5E              ; 00 5E
    EOR $E8              ; 41 E8
    COP $03              ; 02 03
    PHD                  ; 0B
    PHP                  ; 08
    COP $00              ; 02 00
    SBC $06E841          ; EF 41 E8 06
    ORA $0D              ; 03 0D
    TSB $0002            ; 0C 02 00
    SBC $E841,X          ; FD 41 E8
    ROL                  ; 2A
    INC                  ; 1A
    ORA #$05             ; 09 05
    COP $00              ; 02 00
    ORA $42              ; 12 42
    INX                  ; E8
    COP $03              ; 02 03
    ORA #$02             ; 09 02
    COP $00              ; 02 00
    BIT #$42             ; 89 42
    INX                  ; E8
    TSB $03              ; 04 03
    AND $08              ; 32 08
    COP $00              ; 02 00
    STA $42              ; 97 42
    INX                  ; E8
    ROL $18              ; 26 18
    ORA $11              ; 17 11
    COP $00              ; 02 00
    TAY                  ; A8
    WDM $E8              ; 42 E8
    AND $08              ; 21 08
    ORA #$0A             ; 09 0A
    COP $00              ; 02 00
    BRK $43              ; 00 43
    INX                  ; E8
    PHA                  ; 48
    ROL $0A,X            ; 36 0A
    ASL $02              ; 06 02
    BRK $30              ; 00 30
    EOR $E8              ; 43 E8
    ROL $2D,X            ; 36 2D
    PHD                  ; 0B
    ORA $02              ; 11 02
    BRK $69              ; 00 69
    MVP $02E8            ; 44 E8 02
    ORA $17              ; 03 17
    PHP                  ; 08
    COP $00              ; 02 00
    PHA                  ; 48
    EOR $E8              ; 45 E8
    JSL $0F0D2F          ; 22 2F 0D 0F
    COP $00              ; 02 00
    LSR $45,X            ; 56 45
    INX                  ; E8
    EOR $2C              ; 43 2C
    TSB $0207            ; 0C 07 02
    BRK $FF              ; 00 FF
    EOR $E8              ; 45 E8
    ASL $3B,X            ; 16 3B
    ORA $020B,Y          ; 19 0B 02
    BRK $1D              ; 00 1D
    EOR $E8              ; 47 E8
    ASL $1028            ; 0E 28 10
    ORA $02              ; 12 02
    BRK $A6              ; 00 A6
    EOR $E8              ; 47 E8
    BIT $0853            ; 2C 53 08
    PHP                  ; 08
    COP $00              ; 02 00
    XCE                  ; FB
    EOR $E8              ; 47 E8
    ORA $03              ; 11 03
    ASL                  ; 0A
    PHP                  ; 08
    COP $00              ; 02 00
    JMP $0DE849          ; 5C 49 E8 0D
    ORA $0F              ; 05 0F
    ASL $02              ; 06 02
    BRK $71              ; 00 71
    EOR #$E8             ; 49 E8
    ORA $15              ; 11 15
    PHD                  ; 0B
    ASL $02              ; 06 02
    BRK $91              ; 00 91
    EOR #$E8             ; 49 E8
    ASL $05,X            ; 16 05
    ROL $12              ; 26 12
    COP $00              ; 02 00
    CPY $49              ; C4 49
    INX                  ; E8
    ORA $14,X            ; 15 14
    TSB $0209            ; 0C 09 02
    BRK $E8              ; 00 E8
    EOR #$E8             ; 49 E8
    ORA $19,X            ; 15 19
    ASL $020F            ; 0E 0F 02
    BRK $32              ; 00 32
    LSR                  ; 4A
    INX                  ; E8
    ORA $37,X            ; 15 37
    ORA #$09             ; 09 09
    COP $00              ; 02 00
    STY $4A              ; 84 4A
    INX                  ; E8
    BIT $0D28            ; 2C 28 0D
    ASL                  ; 0A
    COP $00              ; 02 00
    ORA $4B              ; 05 4B
    INX                  ; E8
    AND $32              ; 23 32
    BPL $098A            ; 10 0D
    COP $00              ; 02 00
    STA $4B,X            ; 95 4B
    INX                  ; E8
    COP $03              ; 02 03
    ASL $0208            ; 0E 08 02
    BRK $43              ; 00 43
    JMP $0AE8            ; 4C E8 0A
    ORA $0C              ; 07 0C
    ORA $02              ; 07 02
    BRK $51              ; 00 51
    JMP $0CE8            ; 4C E8 0C
    PHP                  ; 08
    ASL                  ; 0A
    ORA $02              ; 07 02
    BRK $6E              ; 00 6E
    JMP $0EE8            ; 4C E8 0E
    ORA $09              ; 17 09
    ASL                  ; 0A
    COP $00              ; 02 00
    STA $4C              ; 92 4C
    INX                  ; E8
    PHD                  ; 0B
    ORA $0A0D,X          ; 1D 0D 0A
    COP $00              ; 02 00
    JSR ($E84C,X)        ; FC 4C E8
    ORA $0C1E            ; 0D 1E 0C
    ORA #$02             ; 09 02
    BRK $92              ; 00 92
    EOR $15E8            ; 4D E8 15
    PHD                  ; 0B
    PHD                  ; 0B
    ORA #$02             ; 09 02
    BRK $E6              ; 00 E6
    EOR $08E8            ; 4D E8 08
    TRB $10              ; 14 10
    PHP                  ; 08
    COP $00              ; 02 00
    ORA $4E              ; 11 4E
    INX                  ; E8
    BPL $09DC            ; 10 10
    BRK $00              ; 00 00
    COP $00              ; 02 00
    LSR $4E              ; 46 4E
    INX                  ; E8
    AND $22,X            ; 35 22
    ORA $0211            ; 0D 11 02
    BRK $60              ; 00 60
    LSR $0FE8            ; 4E E8 0F
    ASL                  ; 0A
    ORA $0A              ; 11 0A
    COP $00              ; 02 00
    ORA $4F              ; 17 4F
    INX                  ; E8
    ORA $23              ; 07 23
    ORA $0207,Y          ; 19 07 02
    BRK $3B              ; 00 3B
    EOR $030EE8          ; 4F E8 0E 03
    ASL $0204            ; 0E 04 02
    BRK $6E              ; 00 6E
    EOR $0910E8          ; 4F E8 10 09
    ORA $0204            ; 0D 04 02
    BRK $96              ; 00 96
    EOR $2113E8          ; 4F E8 13 21
    BPL $0A0B            ; 10 07
    COP $00              ; 02 00
    LDX $4F,Y            ; B6 4F
    INX                  ; E8
    ORA $0617,X          ; 1D 17 06
    ORA #$02             ; 09 02
    BRK $F8              ; 00 F8
    EOR $0502E8          ; 4F E8 02 05
    ORA #$0E             ; 09 0E
    ORA $00              ; 03 00
    DEC                  ; 3A
    BVC $0A03            ; 50 E8
    ORA $1C              ; 17 1C
    ORA $00030B          ; 0F 0B 03 00
    EOR $50              ; 43 50
    INX                  ; E8
    TSB $0B0A            ; 0C 0A 0B
    ASL $03              ; 06 03
    BRK $9F              ; 00 9F
    BVC $0A15            ; 50 E8
    TRB $1A              ; 14 1A
    ASL $0C,X            ; 16 0C
    ORA $00              ; 03 00
    TSX                  ; BA
    BVC $0A1E            ; 50 E8
    ORA $09              ; 01 09
    ORA #$0A             ; 09 0A
    ORA $00              ; 03 00
    ASL $51              ; 06 51
    INX                  ; E8
    TSB $06              ; 04 06
    ORA #$0A             ; 09 0A
    ORA $00              ; 03 00
    ASL $E851            ; 0E 51 E8
    ORA $02              ; 01 02
    TSB $030A            ; 0C 0A 03
    BRK $1C              ; 00 1C
    EOR $E8              ; 51 E8
    ASL $0B              ; 06 0B
    PHD                  ; 0B
    PHP                  ; 08
    ORA $00              ; 03 00
    AND $51              ; 21 51
    INX                  ; E8
    ASL                  ; 0A
    ASL $13              ; 06 13
    CLC                  ; 18
    ORA $00              ; 03 00
    DEC                  ; 3A
    EOR $E8              ; 51 E8
    TSB $03              ; 04 03
    TSB $030B            ; 0C 0B 03
    BRK $50              ; 00 50
    EOR $E8              ; 51 E8
    ORA $02              ; 01 02
    TSB $0318            ; 0C 18 03
    BRK $5C              ; 00 5C
    EOR $E8              ; 51 E8
    TSB $17              ; 04 17
    ORA $0B              ; 11 0B
    ORA $00              ; 03 00
    ADC $51              ; 61 51
    INX                  ; E8
    TRB $18              ; 14 18
    ORA $0C              ; 11 0C
    ORA $00              ; 03 00
    ROR $E851            ; 6E 51 E8
    AND $21              ; 27 21
    TSB $030C            ; 0C 0C 03
    BRK $97              ; 00 97
    EOR $E8              ; 51 E8
    PLP                  ; 28
    JSL $030C0B          ; 22 0B 0C 03
    BRK $0A              ; 00 0A
    EOR $E8              ; 52 E8
    ASL $0C              ; 06 0C
    PHD                  ; 0B
    ORA #$03             ; 09 03
    BRK $90              ; 00 90
    EOR $E8              ; 52 E8
    ORA $02              ; 01 02
    ORA $0309            ; 0D 09 03
    BRK $AC              ; 00 AC
    EOR $E8              ; 52 E8
    ORA $080A08          ; 0F 08 0A 08
    ORA $00              ; 03 00
    LDA $52              ; B1 52
    INX                  ; E8
    JSR $0620            ; 20 20 06
    ORA $03              ; 12 03
    BRK $15              ; 00 15
    EOR $E8              ; 53 E8
    ORA $06              ; 03 06
    TSB $030D            ; 0C 0D 03
    BRK $8B              ; 00 8B
    EOR $E8              ; 53 E8
    ORA $03              ; 01 03
    ORA #$0B             ; 09 0B
    ORA $00              ; 03 00
    STA $01E853,X        ; 9F 53 E8 01
    ORA $16              ; 01 16
    PHD                  ; 0B
    ORA $00              ; 03 00
    LDX $53              ; A6 53
    INX                  ; E8
    ASL $0901            ; 0E 01 09
    PHD                  ; 0B
    ORA $00              ; 03 00
    LDA #$53             ; A9 53
    INX                  ; E8
    ORA $01              ; 01 01
    ASL $0B,X            ; 16 0B
    ORA $00              ; 03 00
    LDA $E853            ; AD 53 E8
    ORA $01              ; 01 01
    ASL $0B,X            ; 16 0B
    ORA $00              ; 03 00
    BCS $0B45            ; B0 53
    INX                  ; E8
    ASL $19,X            ; 16 19
    BPL $0B06            ; 10 0F
    ORA $00              ; 03 00
    LDA $53              ; B3 53
    INX                  ; E8
    ORA $0B04            ; 0D 04 0B
    BPL $0B04            ; 10 03
    BRK $03              ; 00 03
    MVN $05E8            ; 54 E8 05
    ORA $0B0E            ; 0D 0E 0B
    ORA $00              ; 03 00
    INC                  ; 1A
    MVN $06E8            ; 54 E8 06
    COP $17              ; 02 17
    ROL $03              ; 26 03
    BRK $34              ; 00 34
    MVN $06E8            ; 54 E8 06
    COP $17              ; 02 17
    ROL $03              ; 26 03
    BRK $3D              ; 00 3D
    MVN $1FE8            ; 54 E8 1F
    AND $0808,Y          ; 39 08 08
    ORA $00              ; 03 00
    EOR $54              ; 43 54
    INX                  ; E8
    ORA $09              ; 05 09
    ASL                  ; 0A
    ORA $0003            ; 0D 03 00
    SBC $E854,X          ; FD 54 E8
    ORA $24              ; 12 24
    TRB $18              ; 14 18
    ORA $00              ; 03 00
    PHD                  ; 0B
    EOR $E8,X            ; 55 E8
    ORA $0A              ; 05 0A
    TSB $030A            ; 0C 0A 03
    BRK $50              ; 00 50
    EOR $E8,X            ; 55 E8
    ORA $04              ; 07 04
    ORA $0312            ; 0D 12 03
    BRK $63              ; 00 63
    EOR $E8,X            ; 55 E8
    ASL $1A,X            ; 16 1A
    ASL $030B,X          ; 1E 0B 03
    BRK $77              ; 00 77
    EOR $E8,X            ; 55 E8
    PHP                  ; 08
    ASL                  ; 0A
    ASL                  ; 0A
    ASL $03              ; 06 03
    BRK $AE              ; 00 AE
    EOR $E8,X            ; 55 E8
    TSB $03              ; 04 03
    ORA $00030B          ; 0F 0B 03 00
    DEC $55,X            ; D6 55
    INX                  ; E8
    ORA $07              ; 01 07
    ASL $031E,X          ; 1E 1E 03
    BRK $E5              ; 00 E5
    EOR $E8,X            ; 55 E8
    ORA $07              ; 01 07
    ASL $031E,X          ; 1E 1E 03
    BRK $EB              ; 00 EB
    EOR $E8,X            ; 55 E8
    ORA $0E29            ; 0D 29 0E
    ORA #$03             ; 09 03
    BRK $F1              ; 00 F1
    EOR $E8,X            ; 55 E8
    ORA $03              ; 01 03
    ASL $2F,X            ; 16 2F
    ORA $00              ; 03 00
    AND $E856            ; 2D 56 E8
    ORA $03              ; 01 03
    ASL $2F,X            ; 16 2F
    ORA $00              ; 03 00
    BIT $56,X            ; 34 56
    INX                  ; E8
    ORA $05              ; 07 05
    TSB $030A            ; 0C 0A 03
    BRK $38              ; 00 38
    LSR $E8,X            ; 56 E8
    PHD                  ; 0B
    ORA $0A1D,Y          ; 19 1D 0A
    ORA $00              ; 03 00
    MVP $E856            ; 44 56 E8
    ORA $08              ; 03 08
    ASL                  ; 0A
    ORA #$03             ; 09 03
    BRK $71              ; 00 71
    LSR $E8,X            ; 56 E8
    ORA $01              ; 01 01
    ORA #$09             ; 09 09
    ORA $00              ; 03 00
    BRL $F40F            ; 82 56 E8
    CLC                  ; 18
    PHD                  ; 0B
    PHD                  ; 0B
    ORA #$03             ; 09 03
    BRK $85              ; 00 85
    LSR $E8,X            ; 56 E8
    TSB $06              ; 04 06
    ORA $0308            ; 0D 08 03
    BRK $B8              ; 00 B8
    LSR $E8,X            ; 56 E8
    ORA $0A              ; 05 0A
    TSB $0307            ; 0C 07 03
    BRK $CB              ; 00 CB
    LSR $E8,X            ; 56 E8
    ORA $03              ; 05 03
    ASL $0309,X          ; 1E 09 03
    BRK $E2              ; 00 E2
    LSR $E8,X            ; 56 E8
    ORA $03              ; 05 03
    ASL $0309,X          ; 1E 09 03
    BRK $FD              ; 00 FD
    LSR $E8,X            ; 56 E8
    TCS                  ; 1B
    AND $0C              ; 25 0C
    ASL $03,X            ; 16 03
    BRK $07              ; 00 07
    EOR $E8              ; 57 E8
    ORA $07              ; 05 07
    ASL                  ; 0A
    ORA $5E0003          ; 0F 03 00 5E
    EOR $E8              ; 57 E8
    ORA $03              ; 05 03
    PHD                  ; 0B
    ASL $0003            ; 0E 03 00
    ROR                  ; 6A
    EOR $E8              ; 57 E8
    COP $01              ; 02 01
    TSB $030F            ; 0C 0F 03
    BRK $79              ; 00 79
    EOR $E8              ; 57 E8
    BPL $0C3E            ; 10 32
    TSB $030E            ; 0C 0E 03
    BRK $7E              ; 00 7E
    EOR $E8              ; 57 E8
    ORA $1F              ; 11 1F
    ASL                  ; 0A
    ASL                  ; 0A
    ORA $00              ; 03 00
    CMP #$57             ; C9 57
    INX                  ; E8
    ORA $03              ; 05 03
    ORA $02              ; 05 02
    ORA $00              ; 03 00
    ORA $58              ; 17 58
    INX                  ; E8
    ORA $12              ; 12 12
    PHP                  ; 08
    BPL $0C2D            ; 10 03
    BRK $26              ; 00 26
    CLI                  ; 58
    INX                  ; E8
    ORA $12              ; 12 12
    PHP                  ; 08
    BPL $0C36            ; 10 03
    BRK $50              ; 00 50
    CLI                  ; 58
    INX                  ; E8
    ORA $12              ; 13 12
    PHP                  ; 08
    BPL $0C3F            ; 10 03
    BRK $7A              ; 00 7A
    CLI                  ; 58
    INX                  ; E8
    COP $02              ; 02 02
    ROL $08              ; 26 08
    ORA $00              ; 03 00
    LDY $58              ; A4 58
    INX                  ; E8
    COP $01              ; 02 01
    ORA $00030C          ; 0F 0C 03 00
    LDA $E858            ; AD 58 E8
    ASL $21,X            ; 16 21
    TSB $0310            ; 0C 10 03
    BRK $B2              ; 00 B2
    CLI                  ; 58
    INX                  ; E8
    ORA $0B              ; 07 0B
    ORA $05              ; 07 05
    ORA $00              ; 03 00
    SBC $58              ; F7 58
    INX                  ; E8
    ORA $02              ; 07 02
    TRB $0A              ; 14 0A
    ORA $00              ; 03 00
    ORA $59              ; 13 59
    INX                  ; E8
    ORA $04              ; 01 04
    ORA $0309            ; 0D 09 03
    BRK $21              ; 00 21
    EOR $01E8,Y          ; 59 E8 01
    COP $0A              ; 02 0A
    ORA $0003            ; 0D 03 00
    ROL                  ; 2A
    EOR $24E8,Y          ; 59 E8 24
    AND $030D08          ; 2F 08 0D 03
    BRK $2F              ; 00 2F
    EOR $06E8,Y          ; 59 E8 06
    ASL                  ; 0A
    PHD                  ; 0B
    ORA #$03             ; 09 03
    BRK $73              ; 00 73
    PHY                  ; 5A
    INX                  ; E8
    ORA $03              ; 01 03
    TSB $0306            ; 0C 06 03
    BRK $88              ; 00 88
    PHY                  ; 5A
    INX                  ; E8
    ASL $15              ; 06 15
    ORA $0306            ; 0D 06 03
    BRK $8F              ; 00 8F
    PHY                  ; 5A
    INX                  ; E8
    ASL $03              ; 06 03
    TSB $0311            ; 0C 11 03
    BRK $C1              ; 00 C1
    PHY                  ; 5A
    INX                  ; E8
    ASL $0A              ; 06 0A
    PHD                  ; 0B
    ORA #$03             ; 09 03
    BRK $D0              ; 00 D0
    PHY                  ; 5A
    INX                  ; E8
    ORA $2B,X            ; 15 2B
    ORA $14              ; 05 14
    ORA $00              ; 03 00
    SBC $5A              ; E7 5A
    INX                  ; E8
    ASL $04              ; 06 04
    BPL $0CE0            ; 10 1E
    ORA $00              ; 03 00
    EOR $E85B            ; 4D 5B E8
    TSB $08              ; 04 08
    ORA $00030C          ; 0F 0C 03 00
    ADC $5B              ; 61 5B
    INX                  ; E8
    ORA $090A28,X        ; 1F 28 0A 09
    ORA $00              ; 03 00
    ADC $E85B,Y          ; 79 5B E8
    TSB $06              ; 04 06
    ASL                  ; 0A
    ORA $EE0003          ; 0F 03 00 EE
    TCD                  ; 5B
    INX                  ; E8
    ASL $0A              ; 06 0A
    PHD                  ; 0B
    ORA #$03             ; 09 03
    BRK $FA              ; 00 FA
    TCD                  ; 5B
    INX                  ; E8
    ORA $0A              ; 01 0A
    TSB $030A            ; 0C 0A 03
    BRK $10              ; 00 10
    JMP $0404E8          ; 5C E8 04 04
    ORA $20              ; 17 20
    ORA $00              ; 03 00
    AND $5C              ; 21 5C
    INX                  ; E8
    TSB $03              ; 04 03
    ORA $0E              ; 17 0E
    ORA $00              ; 03 00
    AND $5C,X            ; 35 5C
    INX                  ; E8
    BPL $0D19            ; 10 11
    ORA $17              ; 11 17
    ORA $00              ; 03 00
    MVP $E85C            ; 44 5C E8
    ORA $0818            ; 0D 18 08
    ORA $03              ; 11 03
    BRK $81              ; 00 81
    JMP $0F07E8          ; 5C E8 07 0F
    CLC                  ; 18
    ORA $0003            ; 0D 03 00
    CPY $5C              ; C4 5C
    INX                  ; E8
    ORA $1C,X            ; 15 1C
    ORA $0B              ; 07 0B
    ORA $00              ; 03 00
    SEP #$5C             ; E2 5C
    INX                  ; E8
    COP $04              ; 02 04
    BPL $0D34            ; 10 06
    ORA $00              ; 03 00
    PHA                  ; 48
    EOR $07E8,X          ; 5D E8 07
    ORA $030D18          ; 0F 18 0D 03
    BRK $5A              ; 00 5A
    EOR $07E8,X          ; 5D E8 07
    ORA $030D18          ; 0F 18 0D 03
    BRK $78              ; 00 78
    EOR $21E8,X          ; 5D E8 21
    TRB $080D            ; 1C 0D 08
    ORA $00              ; 03 00
    PHB                  ; 8B
    EOR $06E8,X          ; 5D E8 06
    ORA $0D              ; 03 0D
    TSB $0003            ; 0C 03 00
    DEC $5D,X            ; D6 5D
    INX                  ; E8
    AND $3D              ; 21 3D
    ORA $10              ; 11 10
    ORA $00              ; 03 00
    SBC $5D              ; E5 5D
    INX                  ; E8
    AND $44              ; 21 44
    ORA $09              ; 11 09
    ORA $00              ; 03 00
    LDA $5E              ; A1 5E
    INX                  ; E8
    TRB $2A              ; 14 2A
    ASL $0E,X            ; 16 0E
    ORA $00              ; 03 00
    PHB                  ; 8B
    EOR $0408E8,X        ; 5F E8 08 04
    ASL $0D,X            ; 16 0D
    ORA $00              ; 03 00
    AND $60              ; 25 60
    INX                  ; E8
    ORA $26              ; 11 26
    ORA $1A              ; 11 1A
    ORA $00              ; 03 00
    WDM $60              ; 42 60
    INX                  ; E8
    ORA $01              ; 01 01
    ASL $030A            ; 0E 0A 03
    BRK $7B              ; 00 7B
    RTS                  ; 60
    INX                  ; E8
    TRB $15              ; 14 15
    ORA $00030A          ; 0F 0A 03 00
    ROR $E860,X          ; 7E 60 E8
    TRB $071D            ; 1C 1D 07
    ORA $03              ; 17 03
    BRK $BB              ; 00 BB
    RTS                  ; 60
    INX                  ; E8
    ORA $03              ; 07 03
    ORA #$11             ; 09 11
    ORA $00              ; 03 00
    ASL $61,X            ; 16 61
    INX                  ; E8
    ORA $03              ; 01 03
    ASL $033D,X          ; 1E 3D 03
    BRK $25              ; 00 25
    ADC $E8              ; 61 E8
    ORA $03              ; 01 03
    ASL $033D,X          ; 1E 3D 03
    BRK $2C              ; 00 2C
    ADC $E8              ; 61 E8
    INC                  ; 1A
    ORA $03091E,X        ; 1F 1E 09 03
    BRK $30              ; 00 30
    ADC $E8              ; 61 E8
    ORA $03              ; 01 03
    ASL $0308            ; 0E 08 03
    BRK $72              ; 00 72
    ADC $E8              ; 61 E8
    ORA $03              ; 01 03
    BPL $0DDA            ; 10 0A
    ORA $00              ; 03 00
    ADC $E861,Y          ; 79 61 E8
    ORA $29              ; 13 29
    BPL $0DE8            ; 10 0F
    ORA $00              ; 03 00
    BRA $0E3E            ; 80 61
    INX                  ; E8
    TSB $0A04            ; 0C 04 0A
    ORA $F30003          ; 0F 03 00 F3
    ADC $E8              ; 61 E8
    TSB $02              ; 04 02
    ASL $031C            ; 0E 1C 03
    BRK $07              ; 00 07
    PER $01E8            ; 62 E8 01
    TSB $09              ; 04 09
    ASL                  ; 0A
    ORA $00              ; 03 00
    BPL $0E5A            ; 10 62
    INX                  ; E8
    ASL $1D,X            ; 16 1D
    ORA $15              ; 11 15
    ORA $00              ; 03 00
    ASL $62,X            ; 16 62
    INX                  ; E8
    TSB $03              ; 04 03
    ASL $0309,X          ; 1E 09 03
    BRK $9D              ; 00 9D
    PER $04E8            ; 62 E8 04
    ORA $1E              ; 03 1E
    ORA #$03             ; 09 03
    BRK $AC              ; 00 AC
    PER $01E8            ; 62 E8 01
    ORA $37              ; 01 37
    AND $03              ; 27 03
    BRK $B2              ; 00 B2
    PER $01E8            ; 62 E8 01
    ORA $37              ; 01 37
    AND $03              ; 27 03
    BRK $B5              ; 00 B5
    PER $01E8            ; 62 E8 01
    COP $1A              ; 02 1A
    ASL                  ; 0A
    ORA $00              ; 03 00
    CLV                  ; B8
    PER $05E8            ; 62 E8 05
    ORA #$16             ; 09 16
    ASL $03,X            ; 16 03
    BRK $BD              ; 00 BD
    PER $01E8            ; 62 E8 01
    ORA $0F              ; 01 0F
    ASL                  ; 0A
    ORA $00              ; 03 00
    JMP $E862            ; DC 62 E8
    ORA $04              ; 07 04
    TSB $0317            ; 0C 17 03
    BRK $DF              ; 00 DF
    PER $10E8            ; 62 E8 10
    BPL $0E58            ; 10 0B
    ASL $03              ; 06 03
    BRK $F3              ; 00 F3
    PER $0BE8            ; 62 E8 0B
    PHP                  ; 08
    ASL                  ; 0A
    TSB $0003            ; 0C 03 00
    ASL $63,X            ; 16 63
    INX                  ; E8
    ORA $0A14,Y          ; 19 14 0A
    ASL                  ; 0A
    ORA $00              ; 03 00
    TSC                  ; 3B
    ADC $E8              ; 63 E8
    ORA $0F              ; 05 0F
    PHD                  ; 0B
    PHD                  ; 0B
    ORA $00              ; 03 00
    ROR $63,X            ; 76 63
    INX                  ; E8
    JSR $0B04            ; 20 04 0B
    BPL $0E76            ; 10 03
    BRK $8D              ; 00 8D
    ADC $E8              ; 63 E8
    PLP                  ; 28
    SEC                  ; 38
    PHP                  ; 08
    BRK $03              ; 00 03
    BRK $B9              ; 00 B9
    ADC $E8              ; 63 E8
    ASL $18,X            ; 16 18
    ORA $0C              ; 11 0C
    ORA $00              ; 03 00
    PLA                  ; 68
    STZ $E8              ; 64 E8
    ORA $03              ; 01 03
    BRK $00              ; 00 00
    ORA $00              ; 03 00
    STX $E864            ; 8E 64 E8
    COP $03              ; 02 03
    BRK $00              ; 00 00
    ORA $00              ; 03 00
    STA $64,X            ; 95 64
    INX                  ; E8
    ASL $1A,X            ; 16 1A
    BPL $0EB6            ; 10 17
    ORA $00              ; 03 00
    LDA $64              ; A3 64
    INX                  ; E8
    TCS                  ; 1B
    AND $1F              ; 21 1F
    ASL $0003            ; 0E 03 00
    PHX                  ; DA
    STZ $E8              ; 64 E8
    BPL $0EEC            ; 10 3D
    ORA $09              ; 12 09
    ORA $00              ; 03 00
    ROL $65,X            ; 36 65
    INX                  ; E8
    ORA $1D2B            ; 0D 2B 1D
    TSB $0003            ; 0C 03 00
    LDA $65,X            ; B5 65
    INX                  ; E8
    ASL $04              ; 06 04
    ASL $0317,X          ; 1E 17 03
    BRK $07              ; 00 07
    ROR $E8              ; 66 E8
    TSB $04              ; 04 04
    BPL $0EE6            ; 10 1A
    ORA $00              ; 03 00
    TCS                  ; 1B
    ROR $E8              ; 66 E8
    ORA #$04             ; 09 04
    TSB $0308            ; 0C 08 03
    BRK $34              ; 00 34
    ROR $E8              ; 66 E8
    TSB $04              ; 04 04
    ORA $1A              ; 13 1A
    ORA $00              ; 03 00
    PHA                  ; 48
    ROR $E8              ; 66 E8
    TSB $0A0F            ; 0C 0F 0A
    ORA $03              ; 07 03
    BRK $61              ; 00 61
    ROR $E8              ; 66 E8
    TSB $0A1B            ; 0C 1B 0A
    ASL $03              ; 06 03
    BRK $93              ; 00 93
    ROR $E8              ; 66 E8
    BPL $0F07            ; 10 10
    BRK $00              ; 00 00
    TSB $00              ; 04 00
    TSX                  ; BA
    ROR $E8              ; 66 E8
    BPL $0F10            ; 10 10

;==============================================================================
; GeneralPurpose_0F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0F:
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 05 00 | Logical OR with accumulator
    JMP ($E867)          ; 6C 67 E8 | Unknown operation
    BPL $0F19            ; 10 10 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ASL $00              ; 06 00 | Arithmetic shift left
    ASL $68              ; 06 68 | Arithmetic shift left
    INX                  ; E8 | Unknown operation
    BPL $0F22            ; 10 10 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 07 00 | Logical OR with accumulator
    DEC $E868,X          ; DE 68 E8 | Unknown operation
    ORA $22              ; 11 22 | Logical OR with accumulator
    ORA $09              ; 07 09 | Logical OR with accumulator
    PHP                  ; 08 | Push processor status to stack
    BRK $63              ; 00 63 | Software interrupt
    ADC #$E8             ; 69 E8 | Unknown operation
    ORA $14              ; 03 14 | Logical OR with accumulator
    ASL $0809            ; 0E 09 08 | Arithmetic shift left
    BRK $54              ; 00 54 | Software interrupt
    ROR                  ; 6A | Unknown operation
    INX                  ; E8 | Unknown operation
    ASL $0722            ; 0E 22 07 | Arithmetic shift left
    ORA #$08             ; 09 08 | Logical OR with accumulator
    BRK $89              ; 00 89 | Software interrupt
    ROR                  ; 6A | Unknown operation
    INX                  ; E8 | Unknown operation
    ORA $22              ; 11 22 | Logical OR with accumulator
    ORA $09              ; 07 09 | Logical OR with accumulator
    PHP                  ; 08 | Push processor status to stack
    BRK $6F              ; 00 6F | Software interrupt
    RTL                  ; 6B | Return from external function
    INX                  ; E8 | Unknown operation
    PHD                  ; 0B | Unknown operation
    JSL $08090A          ; 22 0A 09 08 | Call external function
    BRK $61              ; 00 61 | Software interrupt
    JMP ($0CE8)          ; 6C E8 0C | Unknown operation
    JSL $080909          ; 22 09 09 08 | Call external function
    BRK $42              ; 00 42 | Software interrupt
    ADC $03E8            ; 6D E8 03 | Unknown operation
    TRB $0E              ; 14 0E | Unknown operation
    ORA #$08             ; 09 08 | Logical OR with accumulator
    BRK $06              ; 00 06 | Software interrupt
    ROR $10E8            ; 6E E8 10 | Unknown operation
    BPL $0F5B            ; 10 00 | Unknown operation
    BRK $09              ; 00 09 | Software interrupt
    BRK $3B              ; 00 3B | Software interrupt
    ROR $03E8            ; 6E E8 03 | Unknown operation
    ASL $0D              ; 06 0D | Arithmetic shift left

    ASL $0D              ; 06 0D
    TSB $0A              ; 04 0A
    BRK $54              ; 00 54
    ROR $04E8            ; 6E E8 04
    ORA $0C              ; 07 0C
    TSB $0A              ; 04 0A
    BRK $6F              ; 00 6F
    ROR $25E8            ; 6E E8 25
    ROL $0808            ; 2E 08 08
    PHD                  ; 0B
    BRK $84              ; 00 84
    ROR $10E8            ; 6E E8 10
    BPL $0F7F            ; 10 00
    BRK $0C              ; 00 0C
    BRK $92              ; 00 92
    ADC $8010E8          ; 6F E8 10 80
    BRK $00              ; 00 00
    ORA $4400            ; 0D 00 44
    BVS $0F76            ; 70 E8
    BPL $0FA0            ; 10 10
    BRK $00              ; 00 00
    ASL $3600            ; 0E 00 36
    ADC $E8              ; 72 E8
    BPL $0FA9            ; 10 10
    BRK $00              ; 00 00
    ASL $6800            ; 0E 00 68
    ADC $E8              ; 72 E8
    BPL $0FB2            ; 10 10
    BRK $00              ; 00 00
    ASL $8900            ; 0E 00 89
    ADC $E8              ; 72 E8
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ORA $72E000          ; 0F 00 E0 72
    INX                  ; E8
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ORA $730100          ; 0F 00 01 73
    INX                  ; E8
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ORA $732200          ; 0F 00 22 73
    INX                  ; E8
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ORA $734300          ; 0F 00 43 73
    INX                  ; E8
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ORA $736400          ; 0F 00 64 73
    INX                  ; E8
    TSB $04              ; 04 04
    BRK $00              ; 00 00
    ORA $738500          ; 0F 00 85 73
    INX                  ; E8
    ORA $04              ; 03 04
    BRK $00              ; 00 00
    ORA $73A600          ; 0F 00 A6 73
    INX                  ; E8
    ORA $04              ; 03 04
    BRK $00              ; 00 00
    ORA $73C100          ; 0F 00 C1 73
    INX                  ; E8
    ORA $04              ; 03 04
    BRK $00              ; 00 00
    ORA $73DC00          ; 0F 00 DC 73
    INX                  ; E8
    ORA $04              ; 03 04
    BRK $00              ; 00 00
    ORA $73F700          ; 0F 00 F7 73
    INX                  ; E8
    ORA $04              ; 03 04
    BRK $00              ; 00 00
    ORA $741200          ; 0F 00 12 74
    INX                  ; E8
    ORA $04              ; 03 04
    BRK $00              ; 00 00
    ORA $742D00          ; 0F 00 2D 74
    INX                  ; E8
    TSB $0206            ; 0C 06 02
    COP $10              ; 02 10
    BRK $48              ; 00 48
    STZ $E8,X            ; 74 E8
    BPL $1030            ; 10 10
    BRK $00              ; 00 00
    ORA $00              ; 11 00
    PLB                  ; AB
    STZ $E8,X            ; 74 E8
    BPL $1069            ; 10 40
    BRK $00              ; 00 00
    ORA $00              ; 12 00
    EOR #$75             ; 49 75
    INX                  ; E8
    RTI                  ; 40
    RTI                  ; 40
    BRK $00              ; 00 00
    ORA $00              ; 13 00
    ROR $76,X            ; 76 76
    INX                  ; E8
    JSR $0020            ; 20 20 00
    BRK $14              ; 00 14
    BRK $77              ; 00 77
    ADC $10E8,Y          ; 79 E8 10
    BPL $1045            ; 10 00
    BRK $15              ; 00 15
    BRK $C4              ; 00 C4
    ADC $0FE8,Y          ; 79 E8 0F
    PHP                  ; 08
    ORA $00              ; 01 00
    ASL $00,X            ; 16 00
    CMP $79              ; D7 79
    INX                  ; E8
    BPL $1066            ; 10 10
    BRK $00              ; 00 00
    ORA $00              ; 17 00
    EOR $7A              ; 45 7A
    INX                  ; E8
    BPL $106F            ; 10 10
    BRK $00              ; 00 00
    CLC                  ; 18
    BRK $64              ; 00 64
    PLY                  ; 7A
    INX                  ; E8
    ORA $03              ; 03 03
    ORA $10              ; 17 10
    ORA $7700,Y          ; 19 00 77
    PLY                  ; 7A
    INX                  ; E8
    CLC                  ; 18
    AND #$15             ; 29 15
    ASL $001A            ; 0E 1A 00
    STY $E87A            ; 8C 7A E8
    ORA $03              ; 03 03
    BRK $00              ; 00 00
    TCS                  ; 1B
    BRK $FA              ; 00 FA
    TDC                  ; 7B
    INX                  ; E8
    ORA $03              ; 03 03
    BRK $00              ; 00 00
    TCS                  ; 1B
    BRK $0F              ; 00 0F
    JMP ($1AE8,X)        ; 7C E8 1A
    TSC                  ; 3B
    TRB $00              ; 14 00
    TCS                  ; 1B
    BRK $24              ; 00 24
    JMP ($00E8,X)        ; 7C E8 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    STA $03              ; 91 03
    BRK $00              ; 00 00
    BRK $93              ; 00 93
    ORA $31              ; 03 31
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY $03              ; C4 03
    ADC $02              ; 71 02
    BRK $00              ; 00 00
    BRK $35              ; 00 35
    ASL $A5              ; 06 A5
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    PHX                  ; DA
    ORA $2A              ; 07 2A
    COP $00              ; 02 00
    BRK $00              ; 00 00
    TSB $0A              ; 04 0A
    PLD                  ; 2B
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    AND $00610B          ; 2F 0B 61 00
    BRK $00              ; 00 00
    BRK $90              ; 00 90
    PHD                  ; 0B
    ROR $01,X            ; 76 01
    BRK $00              ; 00 00
    BRK $06              ; 00 06
    ORA $00EA            ; 0D EA 00
    BRK $00              ; 00 00
    BRK $F0              ; 00 F0
    ORA $0181            ; 0D 81 01
    BRK $00              ; 00 00
    BRK $71              ; 00 71
    ORA $000129          ; 0F 29 01 00
    BRK $00              ; 00 00
    TXS                  ; 9A
    BPL $1131            ; 10 2D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP $10              ; C7 10
    SBC $0002,X          ; FD 02 00
    BRK $00              ; 00 00
    CPY $13              ; C4 13
    BRK $01              ; 00 01
    ASL $E51B,X          ; 1E 1B E5
    CPY $14              ; C4 14
    SBC $00              ; F2 00
    ASL $E51C,X          ; 1E 1C E5
    LDX $15,Y            ; B6 15
    ADC $00              ; 61 00
    BRK $00              ; 00 00
    BRK $17              ; 00 17
    ASL $50,X            ; 16 50
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ADC $17              ; 67 17
    BIT $01,X            ; 34 01
    BRK $00              ; 00 00
    BRK $9B              ; 00 9B
    CLC                  ; 18
    AND $00              ; 32 00
    BRK $00              ; 00 00
    BRK $CD              ; 00 CD
    CLC                  ; 18
    CMP $01              ; D3 01
    BRK $00              ; 00 00
    BRK $A0              ; 00 A0
    INC                  ; 1A
    ADC $02              ; 71 02
    BRK $00              ; 00 00
    BRK $11              ; 00 11
    ORA $019C,X          ; 1D 9C 01
    BRK $00              ; 00 00
    BRK $AD              ; 00 AD
    ASL $0222,X          ; 1E 22 02
    BRK $00              ; 00 00
    BRK $CF              ; 00 CF
    JSR $0299            ; 20 99 02
    BRK $00              ; 00 00
    BRK $68              ; 00 68
    AND $7F              ; 23 7F
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    SBC $24              ; E7 24
    STA $02              ; 83 02
    BRK $00              ; 00 00
    BRK $6A              ; 00 6A
    AND $B2              ; 27 B2
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TRB $4828            ; 1C 28 48
    COP $00              ; 02 00
    BRK $00              ; 00 00
    STZ $2A              ; 64 2A
    PEI $01              ; D4 01
    BRK $00              ; 00 00
    BRK $38              ; 00 38
    BIT $01F5            ; 2C F5 01
    BRK $00              ; 00 00
    BRK $2D              ; 00 2D
    ROL $02CE            ; 2E CE 02
    BRK $00              ; 00 00
    BRK $FB              ; 00 FB
    BMI $11CF            ; 30 3F
    COP $00              ; 02 00
    BRK $00              ; 00 00
    DEC                  ; 3A
    AND $15              ; 33 15
    COP $00              ; 02 00
    BRK $00              ; 00 00
    EOR $015935          ; 4F 35 59 01
    BRK $00              ; 00 00
    BRK $A8              ; 00 A8
    ROL $95,X            ; 36 95
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    AND $7338,X          ; 3D 38 73
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BCS $11EC            ; B0 3A
    EOR $01              ; 47 01
    BRK $00              ; 00 00
    BRK $F7              ; 00 F7
    TSC                  ; 3B
    PLY                  ; 7A
    COP $00              ; 02 00
    BRK $00              ; 00 00
    ADC $3E              ; 71 3E
    EOR $01              ; 45 01
    BRK $00              ; 00 00
    BRK $B6              ; 00 B6
    AND $000194,X        ; 3F 94 01 00
    BRK $00              ; 00 00
    LSR                  ; 4A
    EOR $46              ; 41 46
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BCC $1217            ; 90 42
    CMP #$01             ; C9 01
    BRK $00              ; 00 00
    BRK $59              ; 00 59
    MVP $0248            ; 44 48 02
    BRK $00              ; 00 00
    BRK $A1              ; 00 A1
    LSR $32              ; 46 32
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    CMP $47              ; D3 47
    CLD                  ; D8
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    PLB                  ; AB
    EOR #$76             ; 49 76
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    AND $4B              ; 21 4B
    CLD                  ; D8
    COP $00              ; 02 00
    BRK $00              ; 00 00
    SBC $384D,Y          ; F9 4D 38

;==============================================================================
; GeneralPurpose_12
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_12:
    COP $00              ; 02 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    AND $50              ; 31 50 | Logical AND with accumulator
    TAX                  ; AA | Transfer accumulator to X
    COP $00              ; 02 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    STP                  ; DB | Unknown operation
    EOR $81              ; 52 81 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    JMP $011C54          ; 5C 54 1C 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    EOR $81,X            ; 55 81 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $DA56,Y          ; F9 56 DA | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    CMP $59              ; D3 59 | Compare with accumulator
    SBC $01              ; F1 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $C4              ; 00 C4 | Software interrupt
    TCD                  ; 5B | Unknown operation
    MVP $0001            ; 44 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    PHP                  ; 08 | Push processor status to stack
    EOR $0209,X          ; 5D 09 02 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $11              ; 00 11 | Software interrupt
    EOR $00015D,X        ; 5F 5D 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    ROR $6660            ; 6E 60 66 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    PEI $61              ; D4 61 | Unknown operation
    EOR $0001,X          ; 5D 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    AND $63              ; 31 63 | Logical AND with accumulator
    STZ $01              ; 64 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $95              ; 00 95 | Software interrupt
    STZ $D3              ; 64 D3 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    PLA                  ; 68 | Pull accumulator from stack
    ADC $D0              ; 65 D0 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt

    BRK $00              ; 00 00
    SEC                  ; 38
    ROR $05              ; 66 05
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    AND $0766,X          ; 3D 66 07
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    MVP $0566            ; 44 66 05
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR #$66             ; 49 66
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BRK $4B              ; 00 4B
    ROR $03              ; 66 03
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LSR $2C66            ; 4E 66 2C
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLY                  ; 7A
    ROR $4D              ; 66 4D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CMP $66              ; C7 66
    ORA $0000,Y          ; 19 00 00
    BRK $00              ; 00 00
    CPX #$66             ; E0 66
    ORA $0000,Y          ; 19 00 00
    BRK $00              ; 00 00
    SBC $1966,Y          ; F9 66 19
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $67              ; 12 67
    ORA $0000,Y          ; 19 00 00
    BRK $00              ; 00 00
    PLD                  ; 2B
    ADC $19              ; 67 19
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    MVP $1367            ; 44 67 13
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $67              ; 57 67
    ASL $0000,X          ; 1E 00 00
    BRK $00              ; 00 00
    ADC $67,X            ; 75 67
    COP $00              ; 02 00
    BRK $00              ; 00 00
    BRK $77              ; 00 77
    ADC $03              ; 67 03
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PLY                  ; 7A
    ADC $04              ; 67 04
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROR $0667,X          ; 7E 67 06
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STY $67              ; 84 67
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    BRK $8A              ; 00 8A
    ADC $06              ; 67 06
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BCC $135B            ; 90 67
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    BRK $93              ; 00 93
    ADC $05              ; 67 05
    BRK $00              ; 00 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_13
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_13:
    TYA                  ; 98 | Unknown operation
    ADC $04              ; 67 04 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STZ $0767            ; 9C 67 07 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    LDA $67              ; A3 67 | Load value into accumulator
    TSB $00              ; 04 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $A7              ; 00 A7 | Software interrupt
    ADC $D0              ; 67 D0 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ADC $68              ; 77 68 | Unknown operation
    STZ $00              ; 64 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $DB              ; 00 DB | Software interrupt
    PLA                  ; 68 | Pull accumulator from stack
    INC $0000,X          ; FE 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    CMP $4D69,Y          ; D9 69 4D | Compare with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ROL $6B              ; 26 6B | Unknown operation
    SBC $00              ; F3 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $19              ; 00 19 | Software interrupt
    JMP ($013B)          ; 6C 3B 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $54              ; 00 54 | Software interrupt
    ADC $011F            ; 6D 1F 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $73              ; 00 73 | Software interrupt
    ROR $0107            ; 6E 07 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $7A              ; 00 7A | Software interrupt
    ADC $000165          ; 6F 65 01 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    CMP $00C070,X        ; DF 70 C0 00 | Compare with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $9F              ; 00 9F | Software interrupt
    ADC $D3              ; 71 D3 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ADC $72              ; 72 72 | Unknown operation
    EOR #$01             ; 49 01 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $BB              ; 00 BB | Software interrupt

    BRK $BB              ; 00 BB
    ADC $68              ; 73 68
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    AND $74              ; 23 74
    STA $00              ; 97 00
    BRK $00              ; 00 00
    BRK $BA              ; 00 BA
    STZ $41,X            ; 74 41
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    XCE                  ; FB
    ADC $9F,X            ; 75 9F
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TXS                  ; 9A
    ROR $CD,X            ; 76 CD
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ADC $77              ; 67 77
    SBC $0000,Y          ; F9 00 00
    BRK $00              ; 00 00
    RTS                  ; 60
    SEI                  ; 78
    ORA $01              ; 07 01
    BRK $00              ; 00 00
    BRK $67              ; 00 67
    ADC $015E,Y          ; 79 5E 01
    BRK $00              ; 00 00
    BRK $C5              ; 00 C5
    PLY                  ; 7A
    MVN $0001            ; 54 01 00
    BRK $00              ; 00 00
    ORA $9D7C,Y          ; 19 7C 9D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDX $7C,Y            ; B6 7C
    TRB $0001            ; 1C 01 00
    BRK $00              ; 00 00
    CMP $7D              ; D2 7D
    BCS $13BA            ; B0 00
    BRK $00              ; 00 00
    BRK $82              ; 00 82
    ROR $009F,X          ; 7E 9F 00
    BRK $00              ; 00 00
    BRK $21              ; 00 21
    ADC $000101,X        ; 7F 01 01 00
    BRK $00              ; 00 00
    JSL $000A80          ; 22 80 0A 00
    BRK $00              ; 00 00
    BRK $2C              ; 00 2C
    BRA $1359            ; 80 84
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BCS $135B            ; B0 80
    ORA $0000            ; 0D 00 00
    BRK $00              ; 00 00
    LDA $AA80,X          ; BD 80 AA
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ADC $81              ; 67 81
    AND $00,X            ; 35 00
    BRK $00              ; 00 00
    BRK $9C              ; 00 9C
    STA $8D              ; 81 8D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    AND #$82             ; 29 82
    SBC $00              ; E1 00
    BRK $00              ; 00 00
    BRK $0A              ; 00 0A
    STA $94              ; 83 94
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    STZ $AA84,X          ; 9E 84 AA
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PHA                  ; 48
    STA $21              ; 85 21
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ADC #$85             ; 69 85
    TAY                  ; A8
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $86              ; 11 86
    ADC $01,X            ; 75 01
    BRK $00              ; 00 00
    BRK $86              ; 00 86
    STA $AA              ; 87 AA
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BMI $13B0            ; 30 88
    DEY                  ; 88
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CLV                  ; B8
    DEY                  ; 88
    EOR $0000,Y          ; 59 00 00
    BRK $00              ; 00 00
    ORA $89              ; 11 89
    TSC                  ; 3B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    JMP $0789            ; 4C 89 07
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $89              ; 53 89
    RTS                  ; 60
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    LDA $89              ; B3 89
    ADC $00              ; 73 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $0F              ; 00 0F
    CPY $B405            ; CC 05 B4
    ORA $D8              ; 03 D8
    ROL $E8,X            ; 36 E8
    BPL $13FA            ; 10 80
    ORA #$C0             ; 09 C0
    COP $C5              ; 02 C5
    AND $E8              ; 37 E8
    ORA $40              ; 11 40
    TSB $01B0            ; 0C B0 01
    BRK $00              ; 00 00
    BRK $12              ; 00 12
    BEQ $1498            ; F0 0D
    BPL $148F            ; 10 02
    BRK $00              ; 00 00
    BRK $13              ; 00 13
    BRK $10              ; 00 10
    BVS $1497            ; 70 02
    BRK $00              ; 00 00
    BRK $14              ; 00 14
    BVS $14AD            ; 70 12
    BIT $0000,X          ; 3C 00 00
    BRK $00              ; 00 00
    ORA $AC,X            ; 15 AC
    ORA $C0              ; 12 C0
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    ASL $6C,X            ; 16 6C
    ORA $44              ; 17 44
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    ORA $B0              ; 17 B0
    TRB $03BC            ; 1C BC 03
    BRK $00              ; 00 00
    BRK $18              ; 00 18
    JMP ($B820)          ; 6C 20 B8
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    ORA $2724,Y          ; 19 24 27
    BIT $09,X            ; 34 09
    BRK $00              ; 00 00
    BRK $1A              ; 00 1A
    CLI                  ; 58
    BMI $14B8            ; 30 EC
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    TCS                  ; 1B
    MVP $6834            ; 44 34 68
    ORA #$00             ; 09 00
    BRK $00              ; 00 00
    TRB $3DAC            ; 1C AC 3D
    LDY $0002,X          ; BC 02 00
    BRK $00              ; 00 00
    ORA $4068,X          ; 1D 68 40
    CPX $08              ; E4 08
    BRK $00              ; 00 00
    BRK $1E              ; 00 1E
    JMP $E849            ; 4C 49 E8
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    ORA $744F34,X        ; 1F 34 4F 74
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    JSR $54A8            ; 20 A8 54
    CPY #$07             ; C0 07
    BRK $00              ; 00 00
    BRK $20              ; 00 20
    PLA                  ; 68
    JMP $0005EC          ; 5C EC 05 00
    BRK $00              ; 00 00
    JSR $6254            ; 20 54 62
    CPY $06              ; C4 06
    BRK $00              ; 00 00
    BRK $21              ; 00 21
    CLC                  ; 18
    ADC #$94             ; 69 94
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    AND $AC              ; 21 AC
    ADC $04A8            ; 6D A8 04
    BRK $00              ; 00 00
    BRK $22              ; 00 22
    MVN $7072            ; 54 72 70
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    AND $C4              ; 23 C4
    SEI                  ; 78
    PHP                  ; 08
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BIT $CC              ; 24 CC
    JMP ($052C,X)        ; 7C 2C 05
    BRK $00              ; 00 00
    BRK $25              ; 00 25
    SED                  ; F8
    STA $BC              ; 81 BC
    ORA #$00             ; 09 00
    BRK $00              ; 00 00
    AND $B4              ; 25 B4
    PHB                  ; 8B
    CPY $0004            ; CC 04 00
    BRK $00              ; 00 00
    ROL $80              ; 26 80
    BCC $1568            ; 90 1C
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    AND $9C              ; 27 9C
    STY $B4,X            ; 94 B4
    ORA $00              ; 07 00
    BRK $00              ; 00 00
    PLP                  ; 28
    BVC $14F7            ; 50 9C
    JMP ($0003)          ; 6C 03 00
    BRK $00              ; 00 00
    AND #$BC             ; 29 BC
    STA $00044C,X        ; 9F 4C 04 00
    BRK $00              ; 00 00
    ROL                  ; 2A
    PHP                  ; 08
    LDY $84              ; A4 84
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    PLD                  ; 2B
    STY $2CA7            ; 8C A7 2C
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    BIT $ADB8            ; 2C B8 AD
    MVN $000A            ; 54 0A 00
    BRK $00              ; 00 00
    AND $B80C            ; 2D 0C B8
    BIT $04,X            ; 34 04
    BRK $00              ; 00 00
    BRK $2E              ; 00 2E
    RTI                  ; 40
    LDY $05CC,X          ; BC CC 05
    BRK $00              ; 00 00
    BRK $2F              ; 00 2F
    TSB $A4C2            ; 0C C2 A4
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BMI $154A            ; 30 B0
    DEC $1C              ; C6 1C
    PHP                  ; 08
    BRK $00              ; 00 00
    BRK $31              ; 00 31
    CPY $48CE            ; CC CE 48
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    AND $14              ; 32 14
    CMP $70,X            ; D5 70
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    AND $84              ; 33 84
    STP                  ; DB
    DEY                  ; 88
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    BIT $0C,X            ; 34 0C
    CPX #$9C             ; E0 9C
    TSB $00              ; 04 00
    BRK $00              ; 00 00
    AND $A8,X            ; 35 A8
    CPX $90              ; E4 90
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    ROL $38,X            ; 36 38
    INX                  ; E8
    JMP $0009            ; 4C 09 00
    BRK $00              ; 00 00
    AND $84              ; 37 84
    SBC $E0              ; F1 E0
    ORA $00              ; 07 00
    BRK $00              ; 00 00
    SEC                  ; 38
    STZ $F9              ; 64 F9
    BMI $15E2            ; 30 05
    BRK $00              ; 00 00
    BRK $39              ; 00 39
    STY $FE,X            ; 94 FE
    STZ $07,X            ; 74 07
    BRK $00              ; 00 00
    BRK $3A              ; 00 3A
    PHP                  ; 08
    ASL $7D              ; 06 7D
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    TSC                  ; 3B
    STY $0B              ; 84 0B
    ADC $0006,X          ; 7D 06 00
    BRK $00              ; 00 00
    BIT $1200,X          ; 3C 00 12
    CMP $0002,X          ; DD 02 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_16
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_16:
    AND $14DC,X          ; 3D DC 14 | Logical AND with accumulator
    CMP $0002            ; CD 02 00 | Compare with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ROL $17A8,X          ; 3E A8 17 | Unknown operation
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $3F              ; 00 3F | Software interrupt
    TAY                  ; A8 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    ORA $01              ; 01 01 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $40              ; 00 40 | Software interrupt
    TAY                  ; A8 | Unknown operation
    ORA $000D,Y          ; 19 0D 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $41              ; 00 41 | Software interrupt
    LDY $19,X            ; B4 19 | Load Y register
    ORA $0000            ; 0D 00 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    WDM $C0              ; 42 C0 | Unknown operation
    ORA $0009,Y          ; 19 09 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $43              ; 00 43 | Software interrupt
    INY                  ; C8 | Unknown operation
    ORA $0009,Y          ; 19 09 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $44              ; 00 44 | Software interrupt
    BNE $1654            ; D0 19 | Branch if not equal (zero flag clear)
    ORA #$00             ; 09 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $45              ; 00 45 | Software interrupt
    CLD                  ; D8 | Unknown operation
    ORA $005D,Y          ; 19 5D 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $46              ; 00 46 | Software interrupt
    BIT $1A,X            ; 34 1A | Unknown operation
    LDA $0000            ; AD 00 00 | Load value into accumulator
    BRK $00              ; 00 00 | Software interrupt
    EOR $E0              ; 47 E0 | Unknown operation
    INC                  ; 1A | Unknown operation
    EOR $00              ; 45 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $48              ; 00 48 | Software interrupt
    BIT $1B              ; 24 1B | Unknown operation
    EOR $00              ; 45 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $49              ; 00 49 | Software interrupt
    PLA                  ; 68 | Pull accumulator from stack
    TCS                  ; 1B | Unknown operation

    TCS                  ; 1B
    EOR $00              ; 45 00
    BRK $00              ; 00 00
    BRK $4A              ; 00 4A
    LDY $451B            ; AC 1B 45
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    PHK                  ; 4B
    BEQ $168E            ; F0 1B
    EOR $00              ; 45 00
    BRK $00              ; 00 00
    BRK $4C              ; 00 4C
    BIT $1C,X            ; 34 1C
    AND $00,X            ; 35 00
    BRK $00              ; 00 00
    BRK $4D              ; 00 4D
    PLA                  ; 68
    TRB $0045            ; 1C 45 00
    BRK $00              ; 00 00
    BRK $4E              ; 00 4E
    LDY $091C            ; AC 1C 09
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $0D1CB4          ; 4F B4 1C 0D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BVC $165A            ; 50 C0
    TRB $000D            ; 1C 0D 00
    BRK $00              ; 00 00
    BRK $51              ; 00 51
    CPY $0D1C            ; CC 1C 0D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    EOR $D8              ; 52 D8
    TRB $000D            ; 1C 0D 00
    BRK $00              ; 00 00
    BRK $53              ; 00 53
    CPX $1C              ; E4 1C
    ORA $0000            ; 0D 00 00
    BRK $00              ; 00 00
    MVN $1CF0            ; 54 F0 1C
    ORA #$00             ; 09 00
    BRK $00              ; 00 00
    BRK $55              ; 00 55
    SED                  ; F8
    TRB $0009            ; 1C 09 00
    BRK $00              ; 00 00
    BRK $56              ; 00 56
    BRK $1D              ; 00 1D
    ORA $0000            ; 0D 00 00
    BRK $00              ; 00 00
    EOR $0C              ; 57 0C
    ORA $0015,X          ; 1D 15 00
    BRK $00              ; 00 00
    BRK $58              ; 00 58
    JSR $0D1D            ; 20 1D 0D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    TCD                  ; 5B
    BIT $811D            ; 2C 1D 81
    COP $00              ; 02 00
    BRK $00              ; 00 00
    JMP $011FAC          ; 5C AC 1F 01
    COP $00              ; 02 00
    BRK $00              ; 00 00
    EOR $21AC,X          ; 5D AC 21
    CMP $0001,Y          ; D9 01 00
    BRK $00              ; 00 00
    LSR $2384,X          ; 5E 84 23
    STA $0002            ; 8D 02 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_17
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_17:
    EOR $CD2610,X        ; 5F 10 26 CD | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    RTS                  ; 60 | Return from local function
    JMP $ED27            ; DC 27 ED | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ADC $C8              ; 61 C8 | Unknown operation
    AND #$01             ; 29 01 | Logical AND with accumulator
    COP $00              ; 02 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    PER $2BC8            ; 62 C8 2B | Unknown operation
    AND $0001,Y          ; 39 01 00 | Logical AND with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ADC $00              ; 63 00 | Unknown operation
    AND $0195            ; 2D 95 01 | Logical AND with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $64              ; 00 64 | Software interrupt
    STY $2E,X            ; 94 2E | Store Y register
    CMP $0001            ; CD 01 00 | Compare with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ADC $60              ; 65 60 | Unknown operation
    BMI $16F1            ; 30 BD | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ROR $1C              ; 66 1C | Unknown operation
    AND $21              ; 31 21 | Logical AND with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ADC $3C              ; 67 3C | Unknown operation
    AND $D1              ; 32 D1 | Logical AND with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    PLA                  ; 68 | Pull accumulator from stack
    TSB $2934            ; 0C 34 29 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ADC #$34             ; 69 34 | Unknown operation
    AND $8D,X            ; 35 8D | Logical AND with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ROR                  ; 6A | Unknown operation
    CPY #$36             ; C0 36 | Unknown operation
    STA $01              ; 85 01 | Store accumulator to memory
    BRK $00              ; 00 00 | Software interrupt
    BRK $6B              ; 00 6B | Software interrupt
    MVP $1938            ; 44 38 19 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt

    BRK $00              ; 00 00
    JMP ($3A5C)          ; 6C 5C 3A
    LDA $0001,X          ; BD 01 00
    BRK $00              ; 00 00
    ADC $3C18            ; 6D 18 3C
    BIT #$02             ; 89 02
    BRK $00              ; 00 00
    BRK $6E              ; 00 6E
    LDY #$3E             ; A0 3E
    EOR $01              ; 45 01
    BRK $00              ; 00 00
    BRK $6F              ; 00 6F
    CPX $3F              ; E4 3F
    ADC #$02             ; 69 02
    BRK $00              ; 00 00
    BRK $70              ; 00 70
    JMP $9142            ; 4C 42 91
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ADC $DC              ; 71 DC
    EOR $01              ; 43 01
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ADC $DC              ; 72 DC
    MVP $0105            ; 44 05 01
    BRK $00              ; 00 00
    BRK $73              ; 00 73
    CPX #$45             ; E0 45
    AND #$00             ; 29 00
    BRK $00              ; 00 00
    BRK $74              ; 00 74
    PHP                  ; 08
    LSR $C5              ; 46 C5
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ADC $CC,X            ; 75 CC
    EOR $15              ; 47 15
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROR $E0,X            ; 76 E0
    EOR $9D              ; 47 9D
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    ADC $7C              ; 77 7C
    EOR #$5D             ; 49 5D
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SEI                  ; 78
    CLD                  ; D8
    EOR #$A9             ; 49 A9
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ADC $4A80,Y          ; 79 80 4A
    EOR $03              ; 45 03
    BRK $00              ; 00 00
    BRK $7A              ; 00 7A
    CPY $4D              ; C4 4D
    ADC $02,X            ; 75 02
    BRK $00              ; 00 00
    BRK $7B              ; 00 7B
    SEC                  ; 38
    BVC $17E5            ; 50 01
    COP $00              ; 02 00
    BRK $00              ; 00 00
    JMP ($5238,X)        ; 7C 38 52
    EOR $00              ; 45 00
    BRK $00              ; 00 00
    BRK $7D              ; 00 7D
    JMP ($3952,X)        ; 7C 52 39
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    ROR $55B4,X          ; 7E B4 55
    STA $03,X            ; 95 03
    BRK $00              ; 00 00
    BRK $7F              ; 00 7F
    PHA                  ; 48
    EOR $01BD,Y          ; 59 BD 01
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    TSB $5B              ; 04 5B
    STA $02,X            ; 95 02
    BRK $00              ; 00 00
    BRK $81              ; 00 81
    TYA                  ; 98
    EOR $03C1,X          ; 5D C1 03
    BRK $00              ; 00 00
    BRK $82              ; 00 82
    CLI                  ; 58
    ADC $85              ; 61 85
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STA $DC              ; 83 DC
    ADC $15              ; 61 15
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    STY $F0              ; 84 F0
    ADC $41              ; 61 41
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    STY $30              ; 84 30
    ADC $49              ; 65 49
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    STY $78              ; 84 78
    RTL                  ; 6B
    EOR $07              ; 51 07
    BRK $00              ; 00 00
    BRK $84              ; 00 84
    INY                  ; C8
    ADC $31              ; 72 31
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    STA $F8              ; 85 F8
    SEI                  ; 78
    LDA $00              ; A5 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    PHY                  ; 5A
    BRK $26              ; 00 26
    STA $ED              ; 87 ED
    BPL $1886            ; 10 10
    PHP                  ; 08
    ASL $5A              ; 06 5A
    BRK $93              ; 00 93
    DEY                  ; 88
    SBC $0000            ; ED 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    ORA $00              ; 01 00
    BRK $01              ; 00 01
    BRK $E5              ; 00 E5
    JMP ($0AE8,X)        ; 7C E8 0A
    ORA $03              ; 03 03
    ORA #$02             ; 09 02
    BRK $E8              ; 00 E8
    JMP ($0FE8,X)        ; 7C E8 0F
    ASL $01              ; 06 01
    TSB $03              ; 04 03
    BRK $24              ; 00 24
    ADC $08E8,X          ; 7D E8 08
    ORA $04              ; 07 04
    ORA $03              ; 03 03
    BRK $9F              ; 00 9F
    ADC $08E8,X          ; 7D E8 08
    ORA $04              ; 07 04
    ORA $03              ; 03 03
    BRK $04              ; 00 04
    ROR $10E8,X          ; 7E E8 10
    BPL $18B6            ; 10 00
    BRK $03              ; 00 03
    BRK $6F              ; 00 6F
    ROR $10E8,X          ; 7E E8 10
    BPL $18BF            ; 10 00
    BRK $03              ; 00 03
    BRK $9C              ; 00 9C
    ADC $1014E8,X        ; 7F E8 14 10
    ASL $07              ; 06 07
    ASL $00              ; 06 00
    JSR $E881            ; 20 81 E8
    JSR $0020            ; 20 20 00
    BRK $06              ; 00 06
    BRK $74              ; 00 74
    STA $E8              ; 81 E8
    ASL $18,X            ; 16 18
    ASL $08              ; 06 08
    ASL $00              ; 06 00
    LDX $E882,Y          ; BE 82 E8
    ASL $18,X            ; 16 18
    ASL $08              ; 06 08
    ASL $00              ; 06 00
    ORA $84              ; 07 84
    INX                  ; E8
    ASL $090E            ; 0E 0E 09
    ORA #$07             ; 09 07
    BRK $71              ; 00 71
    STY $E8              ; 84 E8
    BPL $1904            ; 10 10
    BRK $00              ; 00 00
    ORA $00              ; 07 00
    ADC $85              ; 73 85
    INX                  ; E8
    JSR $0010            ; 20 10 00
    BRK $08              ; 00 08

;==============================================================================
; GeneralPurpose_19
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_19:
    BRK $14              ; 00 14 | Software interrupt
    STX $E8              ; 86 E8 | Store X register
    BMI $1914            ; 30 0E | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    PHP                  ; 08 | Push processor status to stack
    BRK $30              ; 00 30 | Software interrupt
    STA $E8              ; 87 E8 | Store accumulator to memory
    JSR $0809            ; 20 09 08 | Call local function
    BIT $000A            ; 2C 0A 00 | Unknown operation
    STA $E888,X          ; 9D 88 E8 | Store accumulator to memory
    ASL $4C,X            ; 16 4C | Arithmetic shift left
    TSB $00              ; 04 00 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    BRK $9E              ; 00 9E | Software interrupt
    BIT #$E8             ; 89 E8 | Unknown operation
    PHD                  ; 0B | Unknown operation
    TSB $1401            ; 0C 01 14 | Unknown operation
    PHD                  ; 0B | Unknown operation
    BRK $A0              ; 00 A0 | Software interrupt
    STA $10E8            ; 8D E8 10 | Store accumulator to memory
    ORA $00              ; 13 00 | Logical OR with accumulator
    TSB $0B              ; 04 0B | Unknown operation

    TSB $0B              ; 04 0B
;==============================================================================
; Function Index (11 functions)
;==============================================================================
; GeneralPurpose_00
; GeneralPurpose_02
; GeneralPurpose_06
; GeneralPurpose_07
; GeneralPurpose_08
; GeneralPurpose_0F
; GeneralPurpose_12
; GeneralPurpose_13
; GeneralPurpose_16
; GeneralPurpose_17
; GeneralPurpose_19
;==============================================================================