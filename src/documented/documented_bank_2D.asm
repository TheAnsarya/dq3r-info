;==============================================================================
; Dragon Quest III - Bank 2D
;==============================================================================
; File: bank_2D.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Bank $2D Code
; Ultra-aggressive code extraction


.segment "BANK_2D_CODE"


;==============================================================================
; GeneralPurpose_00
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00:
    ORA $7B01,X          ; 1D 01 7B | Logical OR with accumulator
    ORA $EF              ; 03 EF | Logical OR with accumulator
    ORA $F87E7E          ; 0F 7E 7E F8 | Logical OR with accumulator
    SED                  ; F8 | Unknown operation
    CPY #$C0             ; C0 C0 | Unknown operation
    ORA $FFFF0F          ; 0F 0F FF FF | Logical OR with accumulator
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    INC $F9FF,X          ; FE FF F9 | Unknown operation
    SBC $FFFFCF,X        ; FF CF FF FF | Unknown operation
    SBC $84FEC2,X        ; FF C2 FE 84 | Unknown operation
    JSR ($F888,X)        ; FC 88 F8 | Call local function
    BPL $8058            ; 10 F0 | Unknown operation
    RTI                  ; 40 | Unknown operation
    CPY #$00             ; C0 00 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    ORA $0E              ; 01 0E | Logical OR with accumulator
    ASL $FFC3            ; 0E C3 FF | Arithmetic shift left
    STA $FF              ; 87 FF | Store accumulator to memory
    STA $FF1FFF          ; 8F FF 1F FF | Store accumulator to memory
    ADC $FFFFFF,X        ; 7F FF FF FF | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $01              ; 01 01 | Logical OR with accumulator
    ASL $06              ; 06 06 | Arithmetic shift left
    TRB $F01C            ; 1C 1C F0 | Unknown operation
    BEQ $809E            ; F0 0F | Branch if equal (zero flag set)
    ORA $FFFFFF          ; 0F FF FF FF | Logical OR with accumulator
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    BRK $8F              ; 00 8F | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $9F              ; 00 9F | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    INC $FF38,X          ; FE 38 FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    SED                  ; F8 | Unknown operation
    ORA $E0              ; 07 E0 | Logical OR with accumulator
    ORA $FC07F8,X        ; 1F F8 07 FC | Logical OR with accumulator
    ORA $FF              ; 03 FF | Logical OR with accumulator
    BRK $01              ; 00 01 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $F8              ; 00 F8 | Software interrupt

    BRK $F8              ; 00 F8
    BRK $E0              ; 00 E0
    BRK $F8              ; 00 F8
    BRK $0C              ; 00 0C
    BRK $07              ; 00 07
    BRK $DF              ; 00 DF
    JSR $0EF1            ; 20 F1 0E
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRA $816F            ; 80 7F
    CMP $00F100,X        ; DF 00 F1 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    BEQ $813B            ; F0 FF
    CMP $FF              ; C3 FF
    ORA $1F1FFF          ; 0F FF 1F 1F
    SBC $FFFCFF,X        ; FF FF FC FF
    SBC $FF              ; E7 FF
    TRB $60FC            ; 1C FC 60
    CPX #$00             ; E0 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    SBC $FCFFFF,X        ; FF FF FF FC
    SBC $1FFFE7,X        ; FF E7 FF 1F
    SBC $FFFF7F,X        ; FF 7F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $F0FFBF,X        ; FF BF FF F0
    BEQ $80E7            ; F0 80
    BRA $8169            ; 80 00
    BRK $01              ; 00 01
    ORA $06              ; 01 06
    ASL $5B              ; 06 5B
    CLI                  ; 58
    SBC $FFBFFF,X        ; FF FF BF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFEFF,X        ; FF FF FE FF
    ADC $61              ; 61 61
    ORA $F9F90F          ; 0F 0F F9 F9
    ASL $780E            ; 0E 0E 78
    SEI                  ; 78
    CPX #$E0             ; E0 E0
    RTI                  ; 40
    CPY #$80             ; C0 80
    BRA $81D0            ; 80 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $07FF07,X        ; FF 07 FF 07
    SBC $30FF07,X        ; FF 07 FF 30
    BNE $81E3            ; D0 C0
    RTI                  ; 40
    BRA $81A6            ; 80 80
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    AND $7139,Y          ; 39 39 71
    ADC $73              ; 71 73
    ADC $F3              ; 73 F3
    SBC $FF              ; F3 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $1DFFFF,X        ; FF FF FF 1D
    ORA $213F31,X        ; 1F 31 3F 21
    AND $881F00,X        ; 3F 00 1F 88
    STA $FEF3F0          ; 8F F0 F3 FE
    INC $7F7F,X          ; FE 7F 7F
    SBC $F1FF,X          ; FD FF F1
    SBC $E0FFE1,X        ; FF E1 FF E0
    SBC $FCFFF8,X        ; FF F8 FF FC
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $000000,X        ; FF 00 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $8309            ; 80 40
    CPY #$20             ; C0 20
    CPX #$08             ; E0 08
    SED                  ; F8
    CMP $FF              ; C3 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FF              ; E3 FF
    SBC $FF              ; E1 FF
    BEQ $82F9            ; F0 FF
    JSR ($FFFF,X)        ; FC FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0F              ; 00 0F
    BRK $7F              ; 00 7F
    BRK $07              ; 00 07
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $F9              ; 00 F9
    ORA $F0              ; 07 F0
    ORA $FFF30C          ; 0F 0C F3 FF
    BRK $E3              ; 00 E3
    TRB $0FF0            ; 1C F0 0F
    BRK $00              ; 00 00
    ORA $001800          ; 0F 00 18 00
    BEQ $8338            ; F0 00
    TSB $FF00            ; 0C 00 FF
    BRK $23              ; 00 23
    BRK $F0              ; 00 F0
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $B8              ; 00 B8
    CMP $00              ; C7 00
    SBC $FFFC03,X        ; FF 03 FC FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $38              ; 00 38
    BRK $00              ; 00 00
    BRK $03              ; 00 03
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $F3              ; 00 F3
    BRK $FF              ; 00 FF
    BRK $FB              ; 00 FB
    TSB $1E              ; 04 1E
    SBC $05FF67,X        ; FF 67 FF 05
    SBC $F01FE0,X        ; FF E0 1F F0
    ORA $0E00FF          ; 0F FF 00 0E
    BRK $7B              ; 00 7B
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $E0              ; 00 E0
    BRK $F0              ; 00 F0
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $3F              ; 03 3F
    SBC $FCFFFF,X        ; FF FF FF FC
    SBC $D8FF1C,X        ; FF 1C FF D8
    AND $E70001,X        ; 3F 01 00 E7
    BRK $FC              ; 00 FC
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $03              ; 00 03
    BRK $C3              ; 00 C3
    BRK $7B              ; 00 7B
    STA $7DFF6B          ; 8F 6B FF 7D
    SBC $79FFF9,X        ; FF F9 FF 79
    SBC $79FF79,X        ; FF 79 FF 79
    SBC $75FF7B,X        ; FF 7B FF 75
    ASL $0E05            ; 0E 05 0E
    ORA $0E              ; 03 0E
    ASL $0F              ; 06 0F
    ASL $0F              ; 06 0F
    STX $1F              ; 86 1F
    STA $1E              ; 87 1E
    STY $1F              ; 84 1F
    SBC $FFFFFB,X        ; FF FB FF FF
    STA $FFFF9F,X        ; 9F 9F FF FF
    STP                  ; DB
    CMP $DDDBDB,X        ; DF DB DB DD
    SBC $BC94,X          ; FD 94 BC
    STZ $9967            ; 9C 67 99
    ROR $19              ; 66 19
    INC $73              ; E6 73
    STY $2ED5            ; 8C D5 2E
    CMP $2E              ; D1 2E
    SBC $0A,X            ; F5 0A
    LDY $FF43,X          ; BC 43 FF
    SBC $F0CECC,X        ; FF CC CE F0
    PEA $ECE8            ; F4 E8 EC
    INY                  ; C8
    INY                  ; C8
    CLI                  ; 58
    CLI                  ; 58
    TYA                  ; 98
    TYA                  ; 98
    BCC $8380            ; 90 90
    ADC $31CE80,X        ; 7F 80 CE 31
    PEA $6C0B            ; F4 0B 6C
    STA $48              ; 93 48
    LDA $58              ; B7 58
    LDA $98              ; A7 98
    ADC $90              ; 67 90
    ADC $E1A781          ; 6F 81 A7 E1
    SBC $601F11,X        ; FF 11 1F 60
    ADC $000F00          ; 6F 00 0F 00
    ORA $000B00          ; 0F 00 0B 00
    ORA $FE58A6          ; 0F A6 58 FE
    BRK $1E              ; 00 1E
    CPX #$6E             ; E0 6E
    BCC $8428            ; 90 0F
    BEQ $842A            ; F0 0F
    BEQ $842C            ; F0 0F
    BEQ $842E            ; F0 0F
    BEQ $8460            ; F0 3F
    JMP $F3D1            ; DC D1 F3
    CMP $F3              ; D1 F3
    EOR $F3              ; 53 F3
    BRK $F1              ; 00 F1
    CMP $2C              ; C1 2C
    CPY #$2E             ; C0 2E
    CPY #$7F             ; C0 7F
    BIT $1000,X          ; 3C 00 10
    TSB $0C10            ; 0C 10 0C
    AND $0C              ; 32 0C
    BMI $8448            ; 30 0E
    SBC $AE12            ; ED 12 AE
    ORA $7F              ; 11 7F
    BRK $C0              ; 00 C0
    AND $32906F,X        ; 3F 6F 90 32
    CMP $FF81            ; CD 81 FF
    BMI $8449            ; 30 FF
    AND $DE              ; 21 DE
    BVS $849C            ; 70 4E
    ORA $F7              ; 07 F7
    CPY #$00             ; C0 00
    ADC $003E00          ; 6F 00 3E 00
    ASL $0E00            ; 0E 00 0E
    BRK $EF              ; 00 EF
    BRK $5F              ; 00 5F
    STA $FF              ; 81 FF
    ORA $FF00FF          ; 0F FF 00 FF
    BRK $F1              ; 00 F1
    ASL $1FE0            ; 0E E0 1F
    TSB $90FF            ; 0C FF 90
    SBC $00FF02,X        ; FF 02 FF 00
    SBC $FF00FC,X        ; FF FC 00 FF
    BRK $F1              ; 00 F1
    BRK $E0              ; 00 E0
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $03              ; 03 03
    ORA $01              ; 03 01
    ORA $00              ; 03 00
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    BRA $84A6            ; 80 FF
    CPY #$E0             ; C0 E0
    SBC $FF              ; E3 FF
    JSR ($7576,X)        ; FC 76 75
    ADC $00E06E          ; 6F 6E E0 00
    ORA $00              ; 01 00
    SEI                  ; 78
    BRK $5F              ; 00 5F
    BRA $8519            ; 80 60
    STZ $906F            ; 9C 6F 90
    STZ $98              ; 64 98
    ADC $00FF90          ; 6F 90 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    LDY $4E03,X          ; BC 03 4E
    CMP $5F              ; D1 5F
    CPY #$7F             ; C0 7F
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $C0              ; 00 C0
    BRK $9F              ; 00 9F
    BRK $9C              ; 00 9C
    RTI                  ; 40
    LSR $5320            ; 4E 20 53
    JSR $1FE0            ; 20 E0 1F
    SED                  ; F8
    TSB $F9              ; 04 F9
    ORA $F9              ; 05 F9
    ORA $F3              ; 05 F3
    ORA $13FF03          ; 0F 03 FF 13
    XBA                  ; EB
    ADC $8F              ; 77 8F
    SBC $00              ; E3 00
    CPX $03              ; E4 03
    ORA $02              ; 05 02
    ORA $F702,X          ; 1D 02 F7
    BRK $07              ; 00 07
    BRK $1B              ; 00 1B
    TSB $4F              ; 04 4F
    BRK $5B              ; 00 5B
    LDA $5C9F7B,X        ; BF 7B 9F 5C
    BIT $7838,X          ; 3C 38 78
    AND $F2              ; 32 F2
    ASL $385F,X          ; 1E 5F 38
    AND $7270,Y          ; 39 70 72
    CPY $1F              ; C4 1F
    LDA $1C              ; A7 1C
    RTI                  ; 40
    STA $90BF00,X        ; 9F 00 BF 90
    AND $29B847          ; 2F 47 B8 29
    DEC $53,X            ; D6 53
    LDY $E880            ; AC 80 E8
    BRK $60              ; 00 60
    BRK $E0              ; 00 E0
    BRK $E0              ; 00 E0
    BRK $C0              ; 00 C0
    BRK $83              ; 00 83
    BRK $C3              ; 00 C3
    BRK $5C              ; 00 5C
    INX                  ; E8
    ORA $60              ; 17 60
    STA $E01FE0,X        ; 9F E0 1F E0
    ORA $C33FC0,X        ; 1F C0 3F C3
    BIT $3CC3,X          ; 3C C3 3C
    CMP $909020,X        ; DF 20 90 90
    STY $84              ; 84 84
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    ORA $1E              ; 07 1E
    ADC $07              ; 77 07
    BCC $85C1            ; 90 6F
    STY $7B              ; 84 7B
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $07F900,X        ; FF 00 F9 07
    SBC $02007F,X        ; FF 7F 00 02
    BRK $17              ; 00 17
    BRK $00              ; 00 00
    ORA $FD              ; 01 FD
    ORA $6D39            ; 0D 39 6D
    CMP $BF7F63          ; CF 63 7F BF
    SBC $17F807,X        ; FF 07 F8 17
    INX                  ; E8
    ORA $F8              ; 07 F8
    INC $3701,X          ; FE 01 37
    CMP $E37FBD          ; CF BD 7F E3
    SBC $81FFBF,X        ; FF BF FF 81
    ADC $0D              ; 63 0D
    ORA #$37             ; 09 37
    AND $BF              ; 27 BF
    AND $FDFFFE,X        ; 3F FE FF FD
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $F7017E,X        ; FF 7E 01 F7
    ORA $FF3FDF          ; 0F DF 3F FF
    SBC $FDFFFE,X        ; FF FE FF FD
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $04FF00,X        ; FF 00 FF 04
    SED                  ; F8
    SBC $03              ; E3 03
    STY $F18F            ; 8C 8F F1
    SBC $004040,X        ; FF 40 40 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $07              ; 00 07
    ORA $FF              ; 03 FF
    SBC $F1FFFC,X        ; FF FC FF F1
    SBC $67FFFF,X        ; FF FF FF 67
    TXY                  ; 9B
    ADC $9B              ; 67 9B
    DEC $9A02,X          ; DE 02 9A
    COP $3C              ; 02 3C
    PHP                  ; 08
    ROR $ADFF,X          ; 7E FF AD
    SBC $F8              ; F2 F8
    SBC $060166,X        ; FF 66 01 06
    ORA $9A              ; 01 9A
    AND $02              ; 21 02
    ADC $F7              ; 65 F7
    SBC $A0FF7E,X        ; FF 7E FF A0
    SBC $C9FFF8,X        ; FF F8 FF C9
    INY                  ; C8
    INY                  ; C8
    INY                  ; C8
    STA $FC99,Y          ; 99 99 FC
    CPY #$E0             ; C0 E0
    SBC $FEF807,X        ; FF 07 F8 FE
    ORA $83              ; 01 83
    JSR ($36C8,X)        ; FC C8 36
    INY                  ; C8
    AND $98              ; 37 98
    ADC $3F              ; 67 3F
    SBC $00FFE0,X        ; FF E0 FF 00
    SBC $80FF00,X        ; FF 00 FF 80
    SBC $E540D7,X        ; FF D7 40 E5
    SBC $F8              ; E1 F8
    BRA $863A            ; 80 33
    AND $E778B8,X        ; 3F B8 78 E7
    CPX #$9F             ; E0 9F
    BRA $859D            ; 80 8E
    ROR $28C0,X          ; 7E C0 28
    CPX #$1B             ; E0 1B
    ADC $FFF3FF,X        ; 7F FF F3 FF
    AND $FFFFFF,X        ; 3F FF FF FF
    SBC $FF0FFF,X        ; FF FF 0F FF
    SBC $00C73F,X        ; FF 3F C7 00
    SBC $E0E0FF,X        ; FF FF E0 E0
    ADC $00FF00,X        ; 7F 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    STA $FEFE30          ; 8F 30 FE FE
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ADC $FFFF7F,X        ; 7F 7F FF FF
    CPX #$E0             ; E0 E0
    PHD                  ; 0B
    ORA $60              ; 03 60
    BRK $80              ; 00 80
    BRA $8683            ; 80 F6
    BEQ $86AE            ; F0 1F
    BRK $FF              ; 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFC,X        ; FF FC FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $C7FBFB,X        ; FF FB FB C7
    CMP $3F              ; C7 3F
    AND $9FFFFF,X        ; 3F FF FF 9F
    SBC $E3FF10,X        ; FF 10 FF E3
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $E3FF7D,X        ; FF 7D FF E3
    SBC $E3FF38,X        ; FF 38 FF E3
    SBC $CFFF87,X        ; FF 87 FF CF
    SBC $7F7F67,X        ; FF 67 7F 7F
    SBC $9FFFFB,X        ; FF FB FF 9F
    SBC $87F1F1,X        ; FF F1 F1 87
    STA $3F              ; 87 3F
    AND $E7DFDF,X        ; 3F DF DF E7
    SBC $FBFF7F,X        ; FF 7F FF FB
    SBC $FFFF9F,X        ; FF 9F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $1CFFFF,X        ; FF FF FF 1C
    SBC $C0              ; E3 C0
    SBC $319E9E,X        ; FF 9E 9E 31
    SBC $08              ; F1 08
    SED                  ; F8
    TSB $FC              ; 04 FC
    BRL $942D            ; 82 FE 0C
    JSR ($FF00,X)        ; FC 00 FF
    CPY #$FF             ; C0 FF
    SBC $FF3FFF,X        ; FF FF 3F FF
    ORA $FF07FF          ; 0F FF 07 FF
    STA $FF              ; 83 FF
    ORA $F077FF          ; 0F FF 77 F0
    ORA $FFE3FF,X        ; 1F FF E3 FF
    LDY $4EBF,X          ; BC BF 4E
    LSR $2727            ; 4E 27 27
    ADC $73              ; 73 73
    SBC $E7              ; E7 E7
    ADC $FF1FFF,X        ; 7F FF 1F FF
    SBC $FF              ; E3 FF
    JSR ($FFFF,X)        ; FC FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $F8FFFF,X        ; FF FF FF F8
    BRK $BF              ; 00 BF
    BRA $8756            ; 80 F1
    BEQ $8766            ; F0 FF
    SBC $C37F47,X        ; FF 47 7F C3
    CMP $F8              ; C3 F8
    SED                  ; F8
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00

;==============================================================================
; GeneralPurpose_08
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08:
    LDA $D746,Y          ; B9 46 D7 | Load value into accumulator
    PLP                  ; 28 | Pull processor status from stack
    CMP $14EF20,X        ; DF 20 EF 14 | Compare with accumulator
    SBC $C07F92          ; EF 92 7F C0 | Unknown operation
    LDA $F74E,Y          ; B9 4E F7 | Load value into accumulator
    CLC                  ; 18 | Clear carry flag
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    LDA $00              ; A1 00 | Load value into accumulator
    EOR #$00             ; 49 00 | Unknown operation
    PHA                  ; 48 | Push accumulator to stack
    BRK $00              ; 00 00 | Software interrupt
    BRK $46              ; 00 46 | Software interrupt
    BRK $94              ; 00 94 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $D4              ; 00 D4 | Software interrupt
    SBC $5B              ; E3 5B | Unknown operation
    STZ $BA44,X          ; 9E 44 BA | Unknown operation
    ORA $23,X            ; 15 23 | Logical OR with accumulator
    PLP                  ; 28 | Pull processor status from stack
    TXY                  ; 9B | Unknown operation
    RTL                  ; 6B | Return from external function
    CLD                  ; D8 | Unknown operation
    SBC $1B              ; E3 1B | Unknown operation
    CMP $EE,X            ; D5 EE | Compare with accumulator
    TSB $2000            ; 0C 00 20 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    BRK $C8              ; 00 C8 | Software interrupt
    BRK $44              ; 00 44 | Software interrupt
    BRK $04              ; 00 04 | Software interrupt
    BRK $E4              ; 00 E4 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $98              ; 00 98 | Software interrupt
    SBC $A7              ; F7 A7 | Unknown operation
    CMP $4C              ; D1 4C | Compare with accumulator
    PHB                  ; 8B | Push data bank register
    ADC $3C              ; 73 3C | Unknown operation
    AND #$F4             ; 29 F4 | Logical AND with accumulator
    BCC $8899            ; 90 2D | Branch if carry clear
    AND $E7B6,Y          ; 39 B6 E7 | Logical AND with accumulator
    CLI                  ; 58 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    PHP                  ; 08 | Push processor status to stack
    BRK $30              ; 00 30 | Software interrupt
    BRK $82              ; 00 82 | Software interrupt
    BRK $02              ; 00 02 | Software interrupt
    BRK $42              ; 00 42 | Software interrupt
    BRK $40              ; 00 40 | Software interrupt
    BRK $06              ; 00 06 | Software interrupt

    BRK $06              ; 00 06
    BRK $67              ; 00 67
    CPY $04              ; C4 04
    LDA $1A              ; A7 1A
    SBC $D3              ; E1 D3
    AND $9B61            ; 2D 61 9B
    EOR $BB              ; 53 BB
    BIT $EA              ; 24 EA
    CMP $1806,X          ; DD 06 18
    BRK $58              ; 00 58
    BRK $04              ; 00 04
    BRK $C0              ; 00 C0
    BRK $24              ; 00 24
    BRK $04              ; 00 04
    BRK $11              ; 00 11
    BRK $20              ; 00 20
    BRK $73              ; 00 73
    LDX $78C2            ; AE C2 78
    AND $4D              ; 25 4D
    TAY                  ; A8
    CMP $6C              ; C5 6C
    STA $0D              ; 93 0D
    BCC $8833            ; 90 86
    EOR $69              ; 52 69
    STZ $0040,X          ; 9E 40 00
    STA $00              ; 85 00
    STA $00              ; 92 00
    ORA $00              ; 12 00
    BRK $00              ; 00 00
    PER $2900            ; 62 00 29
    BRK $00              ; 00 00
    BRK $F4              ; 00 F4
    CMP $93              ; C3 93
    JMP $157A84          ; 5C 84 7A 15
    AND $28              ; 23 28
    TXY                  ; 9B
    RTL                  ; 6B
    CLD                  ; D8
    SBC $1B              ; E3 1B
    EOR $000CE8,X        ; 5F E8 0C 00
    JSR $0100            ; 20 00 01
    BRK $C8              ; 00 C8
    BRK $44              ; 00 44
    BRK $04              ; 00 04
    BRK $64              ; 00 64
    BRK $00              ; 00 00
    BRK $F8              ; 00 F8
    INC $F0C0,X          ; FE C0 F0
    BRK $C1              ; 00 C1
    STA $0F              ; 83 0F
    ADC $03              ; 71 03
    TSB $00              ; 04 00
    BRA $88EE            ; 80 00
    CMP $0700            ; CD 00 07
    SED                  ; F8
    AND $00FFC0,X        ; 3F C0 FF 00
    SBC $807F00,X        ; FF 00 7F 80
    ORA $E8              ; 17 E8
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF

;==============================================================================
; GeneralPurpose_09
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_09:
    BRK $1C              ; 00 1C | Software interrupt
    ORA $00              ; 07 00 | Logical OR with accumulator
    BRK $E0              ; 00 E0 | Software interrupt
    BRK $F8              ; 00 F8 | Software interrupt
    STA $FE              ; 81 FE | Store accumulator to memory
    BPL $88CB            ; 10 BF | Unknown operation
    BRA $892D            ; 80 1F | Unknown operation
    BRK $02              ; 00 02 | Software interrupt
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $03FC00,X        ; FF 00 FC 03 | Unknown operation
    INC $FF01,X          ; FE 01 FF | Unknown operation
    BRK $BF              ; 00 BF | Software interrupt
    RTI                  ; 40 | Unknown operation
    ORA $BCBCE0,X        ; 1F E0 BC BC | Logical OR with accumulator
    AND $C0F9,Y          ; 39 F9 C0 | Logical AND with accumulator
    ORA $7F01F0,X        ; 1F F0 01 7F | Logical OR with accumulator
    BRK $88              ; 00 88 | Software interrupt
    BRK $24              ; 00 24 | Software interrupt
    STA $40              ; 81 40 | Store accumulator to memory
    BRA $8974            ; 80 43 | Unknown operation
    SBC $FF3FC6,X        ; FF C6 3F FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $7F              ; 00 7F | Software interrupt
    BRA $894A            ; 80 0F | Unknown operation
    BEQ $8984            ; F0 47 | Branch if equal (zero flag set)
    SEC                  ; 38 | Set carry flag
    ADC $0E              ; 71 0E | Unknown operation
    STA $FFC08F          ; 8F 8F C0 FF | Store accumulator to memory
    ORA $000180,X        ; 1F 80 01 00 | Logical OR with accumulator
    BRA $8986            ; 80 3C | Unknown operation
    RTS                  ; 60 | Return from local function
    ORA $078018          ; 0F 18 80 07 | Logical OR with accumulator
    BRK $70              ; 00 70 | Software interrupt
    SBC $FFC03F,X        ; FF 3F C0 FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    CPY #$0E             ; C0 0E | Unknown operation
    DEC $C100            ; CE 00 C1 | Unknown operation
    CMP $38              ; C7 38 | Compare with accumulator
    CPY #$17             ; C0 17 | Unknown operation
    AND $86              ; 31 86 | Logical AND with accumulator
    PHP                  ; 08 | Push processor status to stack
    SEP #$C0             ; E2 C0 | Set processor status bits
    BPL $89B0            ; 10 3F | Unknown operation
    SBC $3F3FF1,X        ; FF F1 3F 3F | Unknown operation

    SBC $3F3FF1,X        ; FF F1 3F 3F
    BRK $C7              ; 00 C7
    BRK $F8              ; 00 F8
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $650202,X        ; FF 02 02 65
    SBC $80              ; E5 80
    ORA $1C              ; 07 1C
    CPX #$09             ; E0 09
    INC $E3,X            ; F6 E3
    TRB $02FC            ; 1C FC 02
    BRK $FF              ; 00 FF
    SBC $9AFF,X          ; FD FF 9A
    ADC $0F00FF,X        ; 7F FF 00 0F
    BRK $00              ; 00 00
    BRK $E3              ; 00 E3
    BRK $FD              ; 00 FD
    BRK $FF              ; 00 FF
    SBC $C66664,X        ; FF 64 66 C6
    CMP $1CFFF7          ; CF F7 FF 1C
    SBC $81D729,X        ; FF 29 D7 81
    ROR $2F50,X          ; 7E 50 2F
    BRK $FF              ; 00 FF
    TXY                  ; 9B
    SBC $F03F,X          ; FD 3F F0
    SBC $00FF00,X        ; FF 00 FF 00
    AND $000100          ; 2F 00 01 00
    CPY #$00             ; C0 00
    SBC $7F7FFF,X        ; FF FF 7F 7F
    ADC $E3              ; 63 E3
    TSB $71FF            ; 0C FF 71
    SBC $0EFFFB,X        ; FF FB FF 0E
    ORA $00FB01,X        ; 1F 01 FB 00
    SBC $9CFF80,X        ; FF 80 FF 9C
    ADC $FF0CF3,X        ; 7F F3 0C FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $07              ; 00 07
    BRK $FF              ; 00 FF
    SBC $3CFFFF,X        ; FF FF FF 3C
    SBC $E0EFC8,X        ; FF C8 EF E0
    SBC $28FFEA,X        ; FF EA FF 28
    AND $00F8C0,X        ; 3F C0 F8 00
    SBC $C3FF00,X        ; FF 00 FF C3
    BIT $18F7,X          ; 3C F7 18
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00

;==============================================================================
; GeneralPurpose_0A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A:
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    JMP ($23FC,X)        ; 7C FC 23 | Unknown operation
    SBC $3F              ; E3 3F | Unknown operation
    SBC $C3FF13,X        ; FF 13 FF C3 | Unknown operation
    SBC $00FF79,X        ; FF 79 FF 00 | Unknown operation
    SBC $83FF00,X        ; FF 00 FF 83 | Unknown operation
    ADC $C03FDC,X        ; 7F DC 3F C0 | Unknown operation
    ORA $EC              ; 11 EC | Logical OR with accumulator
    BRK $FC              ; 00 FC | Software interrupt
    BRK $FE              ; 00 FE | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $7FFFFF,X        ; FF FF FF 7F | Unknown operation
    SBC $00DF1D,X        ; FF 1D DF 00 | Unknown operation
    SBC $38              ; E7 38 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $E27F80,X        ; FF 80 7F E2 | Unknown operation
    AND $18FF,X          ; 3D FF 18 | Logical AND with accumulator
    CMP $18              ; C7 18 | Compare with accumulator
    INC $FFFE,X          ; FE FE FF | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    ORA $00              ; 01 00 | Logical OR with accumulator
    ASL $00              ; 06 00 | Arithmetic shift left
    COP $00              ; 02 00 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    CPX $F800            ; EC 00 F8 | Unknown operation
    BRK $FC              ; 00 FC | Software interrupt
    BRK $FE              ; 00 FE | Software interrupt
    BRK $F9              ; 00 F9 | Software interrupt
    BRK $FD              ; 00 FD | Software interrupt
    BRK $FD              ; 00 FD | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    TSB $83              ; 04 83 | Unknown operation
    TSB $83              ; 04 83 | Unknown operation
    BRK $C7              ; 00 C7 | Software interrupt
    RTI                  ; 40 | Unknown operation
    LDA $C0              ; A7 C0 | Load value into accumulator
    AND $00              ; 23 00 | Logical AND with accumulator
    SBC $00              ; E1 00 | Unknown operation
    LDY #$00             ; A0 00 | Load Y register
    JSR $7800            ; 20 00 78 | Call local function
    BRK $78              ; 00 78 | Software interrupt
    BRK $38              ; 00 38 | Software interrupt
    BRK $18              ; 00 18 | Software interrupt
    BRK $1C              ; 00 1C | Software interrupt
    BRK $1E              ; 00 1E | Software interrupt

    BRK $1E              ; 00 1E
    BRK $5F              ; 00 5F
    BRK $DF              ; 00 DF
    ADC $007F80,X        ; 7F 80 7F 00
    AND $013E00,X        ; 3F 00 3E 01
    ASL $1E21,X          ; 1E 21 1E
    AND $1E              ; 21 1E
    AND $0C              ; 21 0C
    ORA $00              ; 13 00
    AND $00B600          ; 2F 00 B6 00
    CPX $00              ; E4 00
    BNE $8AB9            ; D0 00
    CPY $00              ; C4 00
    CPY #$00             ; C0 00
    CPY #$00             ; C0 00
    CPX #$DB             ; E0 DB
    AND $83              ; 27 83
    ADC $837F83,X        ; 7F 83 7F 83
    ADC $0EC701,X        ; 7F 01 C7 0E
    CMP $8D              ; D1 8D
    ORA $08              ; 13 08
    STA $00              ; 97 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $FF1FFF,X        ; 1F FF 1F FF
    ORA $C7              ; 07 C7
    TSC                  ; 3B
    CMP $037F33          ; CF 33 7F 03
    ADC $19              ; 67 19

;==============================================================================
; GeneralPurpose_0B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0B:
    INC $FE09,X          ; FE 09 FE | Unknown operation
    ADC $FEFF,X          ; 7D FF FE | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    SBC $F0FFF0,X        ; FF F0 FF F0 | Unknown operation
    SBC $FFFFF8,X        ; FF F8 FF FF | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    CPY #$8B             ; C0 8B | Unknown operation
    CPY #$AB             ; C0 AB | Unknown operation
    BRA $8B93            ; 80 13 | Unknown operation
    PLX                  ; FA | Pull X register from stack
    JSR ($FCFB,X)        ; FC FB FC | Call local function
    XCE                  ; FB | Unknown operation
    JSR ($FFF8,X)        ; FC F8 FF | Call local function
    BEQ $8B7D            ; F0 F3 | Branch if equal (zero flag set)
    PLX                  ; FA | Pull X register from stack
    SBC $EF              ; E5 EF | Unknown operation
    CPY #$F6             ; C0 F6 | Unknown operation
    STA $FD              ; 81 FD | Store accumulator to memory
    PLX                  ; FA | Pull X register from stack
    SED                  ; F8 | Unknown operation
    SBC $F8F8,Y          ; F9 F8 F8 | Unknown operation
    SED                  ; F8 | Unknown operation
    SED                  ; F8 | Unknown operation
    BEQ $8B96            ; F0 FC | Branch if equal (zero flag set)
    CPX #$F0             ; E0 F0 | Unknown operation
    BNE $8B6A            ; D0 CC | Branch if not equal (zero flag clear)
    DEY                  ; 88 | Unknown operation
    STX $80,Y            ; 96 80 | Store X register
    JMP ($1CE0,X)        ; 7C E0 1C | Unknown operation
    BCS $8BAE            ; B0 08 | Branch if carry set
    RTS                  ; 60 | Return from local function
    TXY                  ; 9B | Unknown operation
    ROR $99              ; 66 99 | Unknown operation
    JMP ($4C93)          ; 6C 93 4C | Unknown operation
    STA $9C              ; 91 9C | Store accumulator to memory
    RTI                  ; 40 | Unknown operation
    BRK $83              ; 00 83 | Software interrupt
    BRK $A3              ; 00 A3 | Software interrupt
    RTI                  ; 40 | Unknown operation
    AND $00              ; 27 00 | Logical AND with accumulator
    MVP $2400            ; 44 00 24 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $22              ; 00 22 | Software interrupt
    BRK $23              ; 00 23 | Software interrupt
    BRK $02              ; 00 02 | Software interrupt

    BRK $02              ; 00 02
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $20              ; 00 20
    BRK $04              ; 00 04
    BRK $04              ; 00 04
    RTI                  ; 40
    BIT $60              ; 24 60
    BPL $8C0F            ; 10 20
    BVC $8BF1            ; 50 00
    CMP $00DF00          ; CF 00 DF 00
    CMP $00FB00,X        ; DF 00 FB 00
    XCE                  ; FB
    BRK $9B              ; 00 9B
    BRK $8F              ; 00 8F
    BRK $8F              ; 00 8F

;==============================================================================
; GeneralPurpose_0C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0C:
    PHP                  ; 08 | Push processor status to stack
    ASL $00,X            ; 16 00 | Arithmetic shift left
    TSB $0C00            ; 0C 00 0C | Unknown operation
    BRK $04              ; 00 04 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $04              ; 00 04 | Software interrupt
    BRK $04              ; 00 04 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $E1              ; 00 E1 | Software interrupt
    BRK $F3              ; 00 F3 | Software interrupt
    BRK $F3              ; 00 F3 | Software interrupt
    BRK $FB              ; 00 FB | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FB              ; 00 FB | Software interrupt
    BRK $FB              ; 00 FB | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    CLC                  ; 18 | Clear carry flag
    STA $98              ; 87 98 | Store accumulator to memory
    ADC $9C              ; 67 9C | Unknown operation
    ADC $30              ; 63 30 | Unknown operation
    CMP $0FD827          ; CF 27 D8 0F | Compare with accumulator
    BEQ $8C34            ; F0 07 | Branch if equal (zero flag set)
    SED                  ; F8 | Unknown operation
    TSB $CB              ; 04 CB | Unknown operation
    BRK $60              ; 00 60 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $10              ; 00 10 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $02              ; 00 02 | Software interrupt
    BRK $06              ; 00 06 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $30              ; 00 30 | Software interrupt
    LDA $FBE7F3          ; AF F3 E7 FB | Load value into accumulator
    SBC $F9              ; F7 F9 | Unknown operation
    SBC $FE              ; F3 FE | Unknown operation
    TYX                  ; BB | Unknown operation
    ADC $3B7FBB,X        ; 7F BB 7F 3B | Unknown operation
    SBC $7FDF1F,X        ; FF 1F DF 7F | Unknown operation
    ORA $7F              ; 01 7F | Logical OR with accumulator
    ORA $3F              ; 01 3F | Logical OR with accumulator
    BRK $1E              ; 00 1E | Software interrupt
    ORA $1F              ; 01 1F | Logical OR with accumulator
    BRK $1F              ; 00 1F | Software interrupt
    BRK $0F              ; 00 0F | Software interrupt
    BRK $0F              ; 00 0F | Software interrupt
    JSR $F8FF            ; 20 FF F8 | Call local function
    SBC $67FFF6,X        ; FF F6 FF 67 | Unknown operation
    SBC $7FFF8F,X        ; FF 8F FF 7F | Unknown operation
    SBC $9FFF3F,X        ; FF 3F FF 9F | Unknown operation

    SBC $9FFF3F,X        ; FF 3F FF 9F
    SBC $FFFF8F,X        ; FF 8F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $BF7F7F,X        ; FF 7F 7F BF
    LDA $0FFF5F,X        ; BF 5F FF 0F
    SBC $F8FF07,X        ; FF 07 FF F8
    SBC $7CFFF8,X        ; FF F8 FF 7C
    SBC $00FF7A,X        ; FF 7A FF 00
    INC $FFF1,X          ; FE F1 FF
    SED                  ; F8
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    BRK $35              ; 00 35
    BRK $07              ; 00 07
    BRK $07              ; 00 07

;==============================================================================
; GeneralPurpose_0D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0D:
    TRB $C8C0            ; 1C C0 C8 | Unknown operation
    BIT $E0,X            ; 34 E0 | Unknown operation
    TRB $B840            ; 1C 40 B8 | Unknown operation
    RTI                  ; 40 | Unknown operation
    BCS $8D4B            ; B0 40 | Branch if carry set
    BCS $8D4D            ; B0 40 | Branch if carry set
    LDY #$00             ; A0 00 | Load Y register
    CPX #$00             ; E0 00 | Unknown operation
    AND $00              ; 23 00 | Logical AND with accumulator
    STA $00              ; 83 00 | Store accumulator to memory
    ORA $00              ; 03 00 | Logical OR with accumulator
    ORA $00              ; 07 00 | Logical OR with accumulator
    ORA $000F00          ; 0F 00 0F 00 | Logical OR with accumulator
    ORA $001F00,X        ; 1F 00 1F 00 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    ; Skipped 32 bytes of data
    CLC                  ; 18 | Clear carry flag
    BRK $08              ; 00 08 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $04              ; 00 04 | Software interrupt
    BRK $04              ; 00 04 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $CF              ; 00 CF | Software interrupt
    BRK $E7              ; 00 E7 | Software interrupt
    BRK $F7              ; 00 F7 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FB              ; 00 FB | Software interrupt
    BRK $FB              ; 00 FB | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    TSB $4B              ; 04 4B | Unknown operation
    BRK $0D              ; 00 0D | Software interrupt
    PHP                  ; 08 | Push processor status to stack
    ORA $00              ; 13 00 | Logical OR with accumulator
    INC                  ; 1A | Unknown operation
    BRK $1A              ; 00 1A | Software interrupt
    BRK $08              ; 00 08 | Software interrupt
    BRK $0A              ; 00 0A | Software interrupt
    BRK $08              ; 00 08 | Software interrupt
    BRK $B0              ; 00 B0 | Software interrupt
    BRK $F2              ; 00 F2 | Software interrupt
    BRK $E4              ; 00 E4 | Software interrupt
    BRK $E5              ; 00 E5 | Software interrupt
    BRK $E5              ; 00 E5 | Software interrupt
    BRK $F7              ; 00 F7 | Software interrupt
    BRK $F5              ; 00 F5 | Software interrupt
    BRK $F7              ; 00 F7 | Software interrupt
    ORA $DF1FDF,X        ; 1F DF 1F DF | Logical OR with accumulator

    ORA $DF1FDF,X        ; 1F DF 1F DF
    ORA $1F1F5F,X        ; 1F 5F 1F 1F
    ORA $0F0F1F,X        ; 1F 1F 0F 0F
    ORA $0F0F0F          ; 0F 0F 0F 0F
    ORA $200F20          ; 0F 20 0F 20
    ORA $E00FA0          ; 0F A0 0F E0
    ORA $F007E0          ; 0F E0 07 F0
    ORA $F0              ; 07 F0
    ORA $F0              ; 07 F0
    CMP $B7              ; C7 B7
    LDX $C9DF            ; AE DF C9
    PLX                  ; FA
    STA $FE9FFE          ; 8F FE 9F FE
    LDA $FF87FF,X        ; BF FF 87 FF
    SBC $FF              ; E7 FF
    SBC $0F              ; F7 0F
    SBC $05FA02,X        ; FF 02 FA 05
    INC $FE01,X          ; FE 01 FE
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $EF              ; 00 EF
    STA $570FC7,X        ; 9F C7 0F 57
    ORA $6B07BB          ; 0F BB 07 6B
    ORA $FD              ; 07 FD
    ORA $FD              ; 03 FD
    ORA $DA              ; 03 DA
    LDA $FF              ; A7 FF
    STA $AF47BF          ; 8F BF 47 AF
    EOR $4F              ; 57 4F
    LDA $97              ; B3 97
    RTL                  ; 6B
    AND $C9              ; 37 C9
    LDA $10EF51          ; AF 51 EF 10
    CLC                  ; 18
    CPX #$18             ; E0 18
    INC $3C              ; E6 3C
    REP #$38             ; C2 38
    DEC $F8              ; C6 F8
    ASL $F0              ; 06 F0
    ASL $0EF0            ; 0E F0 0E
    RTS                  ; 60
    STA $00              ; 93 00
    ORA $00              ; 07 00
    ORA $00              ; 01 00
    ORA #$00             ; 09 00
    ORA $00              ; 01 00
    EOR $00              ; 51 00
    SBC $00              ; E1 00
    ORA $00              ; 01 00
    TSB $6000            ; 0C 00 60
    BRK $30              ; 00 30
    BRK $10              ; 00 10
    BRK $10              ; 00 10
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $9F              ; 00 9F
    BRK $CF              ; 00 CF
    BRK $EF              ; 00 EF
    BRK $EF              ; 00 EF
    BRK $FF              ; 00 FF
    BRK $EF              ; 00 EF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FE              ; 00 FE
    BRK $FE              ; 00 FE
    BRK $FE              ; 00 FE
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FE              ; 00 FE
    BRK $FE              ; 00 FE
    BRK $FE              ; 00 FE
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $1F0F0F          ; 0F 0F 0F 1F
    ADC $3FCF9F          ; 6F 9F CF 3F
    AND $C7              ; 27 C7
    AND $C7              ; 27 C7
    EOR $A7              ; 47 A7
    ORA $77              ; 07 77
    ORA $E00FF0          ; 0F F0 0F E0
    ORA $00              ; 07 00
    ORA $00              ; 07 00
    ORA $18              ; 07 18
    ORA $18              ; 07 18
    ORA $18              ; 07 18
    ORA $88              ; 03 88
    SBC $FF              ; F1 FF
    SBC $FF              ; F7 FF
    SBC $FF,X            ; F5 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FDFEF8,X        ; FF F8 FE FD
    INC $EFFF,X          ; FE FF EF
    BPL $8ED1            ; 10 FE
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $FF7FFF,X        ; FF FF 7F FF
    AND $3FFF3F,X        ; 3F 3F FF 3F
    CMP $7FDF7F,X        ; DF 7F DF 7F
    CMP $FFFF5F,X        ; DF 5F FF FF
    ADC $FF3FFF,X        ; 7F FF 3F FF
    ORA $FF1FFF,X        ; 1F FF 1F FF
    ORA $FF0FFF          ; 0F FF 0F FF
    ORA $2007FF          ; 0F FF 07 20
    CMP $00              ; D2 00
    BCS $8F15            ; B0 10
    INY                  ; C8
    BRK $58              ; 00 58
    BRK $58              ; 00 58
    BRK $10              ; 00 10
    BRK $50              ; 00 50
    BRK $10              ; 00 10
    BRK $0D              ; 00 0D
    BRK $4F              ; 00 4F
    BRK $27              ; 00 27
    BRK $A7              ; 00 A7
    BRK $A7              ; 00 A7
    BRK $EF              ; 00 EF
    BRK $AF              ; 00 AF
    BRK $EF              ; 00 EF
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $03              ; 00 03
    BRK $03              ; 00 03
    BRK $02              ; 00 02
    TSB $1002            ; 0C 02 10
    TSB $3C00            ; 0C 00 3C
    BRK $FE              ; 00 FE
    BRK $FE              ; 00 FE
    BRK $FC              ; 00 FC
    BRK $FC              ; 00 FC
    BRK $FD              ; 00 FD
    BRK $F1              ; 00 F1
    BRK $E3              ; 00 E3
    BRK $C3              ; 00 C3
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0C              ; 00 0C
    TSB $1E02            ; 0C 02 1E
    ORA $1F              ; 01 1F
    BRK $0C              ; 00 0C
    ORA $04              ; 13 04
    PHD                  ; 0B
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $F3              ; 00 F3
    BRK $FD              ; 00 FD
    BRK $E8              ; 00 E8
    BRK $E0              ; 00 E0
    BRK $E4              ; 00 E4
    BRK $F0              ; 00 F0
    ORA $37              ; 07 37
    ORA $13              ; 03 13
    ORA $13              ; 03 13
    ORA $03              ; 03 03
    ORA $03              ; 03 03
    ORA $0B              ; 01 0B
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    ORA $C8              ; 03 C8
    ORA $EC              ; 03 EC
    ORA $EC              ; 03 EC
    ORA $FC              ; 03 FC
    ORA $FC              ; 01 FC
    BRK $F4              ; 00 F4
    BRK $FE              ; 00 FE
    BRK $FE              ; 00 FE
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $E1FFE3,X        ; FF E3 FF E1
    SBC $E0DFE0,X        ; FF E0 DF E0
    PEA $E4CB            ; F4 CB E4
    STP                  ; DB
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $08              ; F7 08
    SBC $0C              ; F3 0C
    XCE                  ; FB
    TSB $FC              ; 04 FC
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    BRK $6F              ; 00 6F
    SBC $CFF747,X        ; FF 47 F7 CF
    SBC $CFFBC3,X        ; FF C3 FB CF
    SBC $FCFDED,X        ; FF ED FD FC
    INC $FFFE,X          ; FE FE FF
    SBC $0FF707,X        ; FF 07 F7 0F
    SBC $07FB03,X        ; FF 03 FB 07
    SBC $03FD01,X        ; FF 01 FD 03
    INC $FF01,X          ; FE 01 FF
    BRK $FF              ; 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRA $8F89            ; 80 80
    RTI                  ; 40
    BRA $904C            ; 80 40
    BRK $40              ; 00 40
    BRK $C0              ; 00 C0
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    BRK $3F              ; 00 3F
    BRK $3F              ; 00 3F
    BRK $BF              ; 00 BF
    BRK $3F              ; 00 3F
    BRK $28              ; 00 28
    BRK $08              ; 00 08
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $20              ; 00 20
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $F8              ; 00 F8
    BRK $FC              ; 00 FC
    BRK $7E              ; 00 7E
    BRK $BA              ; 00 BA
    BRK $9F              ; 00 9F
    BRK $DF              ; 00 DF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRA $9062            ; 80 00
    CPY #$00             ; C0 00
    BRA $90A6            ; 80 40
    LDY #$50             ; A0 50
    JSR $00D0            ; 20 D0 00
    BEQ $906D            ; F0 00
    BVS $906F            ; 70 00
    SEC                  ; 38
    BRK $7F              ; 00 7F
    BRK $3F              ; 00 3F
    BRK $3F              ; 00 3F
    BRK $0F              ; 00 0F
    BRK $0F              ; 00 0F
    BRK $0F              ; 00 0F
    BRK $8F              ; 00 8F
    BRK $C7              ; 00 C7
    BRK $01              ; 00 01
    BRK $01              ; 00 01
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $0F0F4F          ; 0F 4F 0F 0F
    ORA $07070F          ; 0F 0F 07 07
    ORA $07              ; 07 07
    ORA $201F20,X        ; 1F 20 1F 20
    ORA $B00FA0          ; 0F A0 0F B0
    ORA $F007F0          ; 0F F0 07 F0
    ORA $F8              ; 07 F8
    ORA $F8              ; 07 F8
    INY                  ; C8
    SBC $98              ; F7 98
    SBC $B0              ; F7 B0
    SBC $E1FFB0,X        ; FF B0 FF E1
    SBC $FBFFE3,X        ; FF E3 FF FB
    SBC $FFFFFB,X        ; FF FB FF FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    LDA $DBBF7F,X        ; BF 7F BF DB
    AND $DC3FDD,X        ; 3F DD 3F DC
    AND $2CBF4C,X        ; 3F 4C BF 2C
    SBC $FFFF36,X        ; FF 36 FF FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    SBC $DFBFBF,X        ; FF BF BF DF
    CMP $FFFFFF,X        ; DF FF FF FF
    SBC $A77FFF,X        ; FF FF 7F A7
    ADC $FFFD0D,X        ; 7F 0D FD FF
    AND $DF5FBF,X        ; 3F BF 5F DF
    AND $FF1FFF,X        ; 3F FF 1F FF
    ORA $FF03FF          ; 0F FF 03 FF
    ORA $FD              ; 01 FD
    ORA $00              ; 03 00
    CPX #$00             ; E0 00
    RTI                  ; 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $912E            ; 80 00
    ORA $C7              ; 07 C7
    BRK $1F              ; 00 1F
    BRK $BF              ; 00 BF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    BRK $7F              ; 00 7F
    BRK $38              ; 00 38
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $40              ; 00 40
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CLC                  ; 18
    CLC                  ; 18
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $BF              ; 00 BF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $E7              ; 00 E7
    BRK $58              ; 00 58
    BRK $68              ; 00 68
    BRK $34              ; 00 34
    RTS                  ; 60
    ORA $60              ; 11 60
    CLC                  ; 18
    JSR $0054            ; 20 54 00
    AND $00              ; 32 00
    BMI $91D1            ; 30 00
    LDA $00              ; A7 00
    STA $00              ; 97 00
    WAI                  ; CB
    BRK $8E              ; 00 8E
    BRK $87              ; 00 87
    BRK $8B              ; 00 8B
    BRK $CD              ; 00 CD
    BRK $CF              ; 00 CF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    ORA $03              ; 03 03
    ; Skipped 32 bytes of data
    SBC $FF              ; F3 FF
    SBC $FF              ; F1 FF
    SBC $FCFF,Y          ; F9 FF FC
    SBC $FFFFFD,X        ; FF FD FF FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $7C              ; 00 7C
    SBC $58              ; F2 58
    SBC $64              ; E7 64
    SBC $77FF77,X        ; FF 77 FF 77
    SBC $FBFFF3,X        ; FF F3 FF FB
    SBC $FEFFF2,X        ; FF F2 FF FE
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $FF7F7F,X        ; FF 7F 7F FF
    SBC $BFBFBF,X        ; FF BF BF BF
    LDA $BFBFBF,X        ; BF BF BF BF
    LDA $FFBFBF,X        ; BF BF BF FF
    SBC $FFFF7F,X        ; FF 7F FF FF
    AND $BF7FBF,X        ; 3F BF 7F BF
    ADC $BF7FBF,X        ; 7F BF 7F BF
    ADC $1F7FBF,X        ; 7F BF 7F 1F
    EOR $000303,X        ; 5F 03 03 00
    BRK $00              ; 00 00
    BRK $07              ; 00 07
    ORA $1C              ; 07 1C
    TRB $FFFF            ; 1C FF FF
    BRK $00              ; 00 00
    BRK $A0              ; 00 A0
    BRK $FC              ; 00 FC
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $F8              ; 01 F8
    ORA $E3              ; 07 E3
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRA $9242            ; 80 80
    JMP ($387C,X)        ; 7C 7C 38
    SEC                  ; 38
    BRK $00              ; 00 00
    BMI $92FA            ; 30 30
    ORA $FFFF1F,X        ; 1F 1F FF FF
    ASL $001E,X          ; 1E 1E 00
    ADC $008300,X        ; 7F 00 83 00
    CMP $00              ; C7 00
    SBC $FCCFE0,X        ; FF E0 CF FC
    CPX #$E0             ; E0 E0
    BRK $00              ; 00 00
    SBC $A3              ; E1 A3
    LDA $0F              ; A3 0F
    ORA $050000          ; 0F 00 00 05
    ORA $00              ; 05 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $10              ; 00 10
    BPL $92F2            ; 10 01
    JMP $00F000          ; 5C 00 F0 00
    SBC $00FA00,X        ; FF 00 FA 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFEF00,X        ; FF 00 EF FF
    SBC $007878,X        ; FF 78 78 00
    BRK $80              ; 00 80
    BRA $9309            ; 80 00
    BRK $00              ; 00 00
    BRK $E7              ; 00 E7
    SBC $00              ; E7 00
    BRK $F0              ; 00 F0
    BRK $00              ; 00 00
    STA $00              ; 87 00
    SBC $007F00,X        ; FF 00 7F 00
    SBC $00FF00,X        ; FF 00 FF 00
    CLC                  ; 18
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ORA $01              ; 01 01
    ORA $07              ; 07 07
    SBC $FEFEFF,X        ; FF FF FE FE
    ORA $FF001F,X        ; 1F 1F 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FE              ; 00 FE
    ORA $F8              ; 01 F8
    ORA $00              ; 03 00
    ORA $E00001          ; 0F 01 00 E0
    ORA $11              ; 01 11
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRA $92C8            ; 80 80
    SBC $F1              ; F1 F1
    SBC $FDFDFF,X        ; FF FF FD FD
    LDA $EE00BF,X        ; BF BF 00 EE
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    BRK $0E              ; 00 0E
    CPX #$00             ; E0 00
    SBC $407E02,X        ; FF 02 7E 40
    CPY #$C0             ; C0 C0
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    ROL $FF3E,X          ; 3E 3E FF
    SBC $F3FFFF,X        ; FF FF FF F3
    SBC $C0              ; F3 C0
    CPY #$00             ; C0 00
    AND $00FF00,X        ; 3F 00 FF 00
    SBC $7CC100,X        ; FF 00 C1 7C
    BRK $3F              ; 00 3F
    BRK $FF              ; 00 FF
    TSB $3F3F            ; 0C 3F 3F
    TRB $001C            ; 1C 1C 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $F0              ; 00 F0
    BEQ $934B            ; F0 C0
    CPY #$FF             ; C0 FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $00              ; E3 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $000F00,X        ; FF 00 0F 00
    AND $FE00F8,X        ; 3F F8 00 FE
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $0F              ; 00 0F
    ORA $077F7F          ; 0F 7F 7F 07
    ORA $01              ; 07 01
    ORA $3F              ; 01 3F
    AND $00FF00,X        ; 3F 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    BEQ $93DC            ; F0 03
    BRA $93DB            ; 80 00
    SED                  ; F8
    BRK $FE              ; 00 FE
    BRK $C0              ; 00 C0
    SBC $3FDF9F,X        ; FF 9F DF 3F
    LDA $BFCF5F          ; AF 5F CF BF
    DEC $A8FE            ; CE FE A8
    TAY                  ; A8
    SBC $FFFFFF,X        ; FF FF FF FF
    ORA $000F00,X        ; 1F 00 0F 00
    BRK $00              ; 00 00
    ORA $00              ; 07 00
    CMP $57FF01          ; CF 01 FF 57
    ORA $00              ; 03 00
    ORA $00              ; 03 00

;==============================================================================
; GeneralPurpose_14
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_14:
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    JSR ($FCFF,X)        ; FC FF FC | Call local function
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    STA $9FFF8F,X        ; 9F 8F FF 9F | Store accumulator to memory
    SBC $FF00FF,X        ; FF FF 00 FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $37              ; 00 37 | Software interrupt
    SBC $87              ; F7 87 | Unknown operation
    ADC $0B              ; 77 0B | Unknown operation
    XCE                  ; FB | Unknown operation
    JSR ($FFFF,X)        ; FC FF FF | Call local function
    JSR ($C7FC,X)        ; FC FC C7 | Call local function
    SBC $C4BBC0,X        ; FF C0 BB C4 | Unknown operation
    SBC $0F              ; F7 0F | Unknown operation
    SBC $0F              ; F7 0F | Unknown operation
    XCE                  ; FB | Unknown operation
    ORA $FF              ; 07 FF | Logical OR with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $CF              ; 00 CF | Software interrupt
    BMI $943B            ; 30 DE | Unknown operation
    AND $FF              ; 21 FF | Logical AND with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $E7B7CF,X        ; FF CF B7 E7 | Unknown operation
    TSC                  ; 3B | Unknown operation
    BEQ $948B            ; F0 1F | Branch if equal (zero flag set)
    CPX #$1F             ; E0 1F | Unknown operation
    DEY                  ; 88 | Unknown operation
    ADC $FF              ; 77 FF | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    CPY #$FF             ; C0 FF | Unknown operation
    JSR ($FFFF,X)        ; FC FF FF | Call local function
    SBC $0000FF,X        ; FF FF 00 00 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    STA $83              ; 83 83 | Store accumulator to memory
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $1F1FFF,X        ; FF FF 1F 1F | Unknown operation
    ADC $73              ; 73 73 | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt

    BRK $FF              ; 00 FF
    BRK $7C              ; 00 7C
    BRK $00              ; 00 00
    CLC                  ; 18
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    CPX #$FF             ; E0 FF
    STY $0000            ; 8C 00 00
    ADC $FFFF7F,X        ; 7F 7F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $B9B9FF,X        ; FF FF B9 B9
    CPX $E0              ; E4 E0
    BRK $FF              ; 00 FF
    BRK $80              ; 00 80
    AND $00FF00,X        ; 3F 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $1FFF46,X        ; FF 46 FF 1F

;==============================================================================
; GeneralPurpose_15
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_15:
    SBC $0E0EFF,X        ; FF FF 0E 0E | Unknown operation
    SBC $FCFCFF,X        ; FF FF FC FC | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $3F3FFF,X        ; FF FF 3F 3F | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    BRK $F1              ; 00 F1 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    SED                  ; F8 | Unknown operation
    ORA $E0              ; 03 E0 | Logical OR with accumulator
    BRK $F8              ; 00 F8 | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    CPY #$FF             ; C0 FF | Unknown operation
    SBC $003F3F,X        ; FF 3F 3F 00 | Unknown operation
    BRK $38              ; 00 38 | Software interrupt
    SEC                  ; 38 | Set carry flag
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $007F1C,X        ; FF 1C 7F 00 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    BRK $1C              ; 00 1C | Software interrupt
    BRK $70              ; 00 70 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $CF              ; 00 CF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $F9              ; 00 F9 | Software interrupt
    SBC $FFFF,Y          ; F9 FF FF | Unknown operation
    CPX #$E0             ; E0 E0 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    CPY #$C0             ; C0 C0 | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $0680FF,X        ; FF FF 80 06 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $1F              ; 00 1F | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $3F              ; 00 3F | Software interrupt
    BRA $957C            ; 80 00 | Unknown operation
    BEQ $957E            ; F0 00 | Branch if equal (zero flag set)
    INC $FF00,X          ; FE 00 FF | Unknown operation
    SBC $1FFFFF,X        ; FF FF FF 1F | Unknown operation
    ORA $000000,X        ; 1F 00 00 00 | Logical OR with accumulator
    BRK $E0              ; 00 E0 | Software interrupt
    CPX #$0F             ; E0 0F | Unknown operation
    ORA $03FFFF          ; 0F FF FF 03 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    CPX #$00             ; E0 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation

    SBC $00FF00,X        ; FF 00 FF 00
    ORA $0FF000,X        ; 1F 00 F0 0F
    BRK $FF              ; 00 FF
    SBC $9BFFFF,X        ; FF FF FF 9B
    TXY                  ; 9B
    ORA $0F0F1F,X        ; 1F 1F 0F 0F
    SBC $FFFFEF          ; EF EF FF FF
    SBC $00C3FF,X        ; FF FF C3 00
    ORA $00              ; 03 00
    ORA $64              ; 01 64
    BRK $E0              ; 00 E0
    ORA $F0              ; 01 F0
    COP $10              ; 02 10
    ORA $00              ; 05 00
    SEP #$05             ; E2 05
    SBC $FFFFFF,X        ; FF FF FF FF
    SEP #$E2             ; E2 E2
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $FCFF20,X        ; FF 20 FF FC
    INC $F571,X          ; FE 71 F5
    ASL                  ; 0A
    TAX                  ; AA
    EOR $55,X            ; 55 55
    TAX                  ; AA
    TAX                  ; AA
    EOR $B3,X            ; 55 B3
    CPY $EDD2            ; CC D2 ED
    DEC $FD              ; C6 FD
    ADC $FFED7D          ; 6F 7D ED FF
    SBC $8BFF,X          ; FD FF 8B
    STA $FFFFFB          ; 8F FB FF FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRA $9618            ; 80 FF
    BRK $BF              ; 00 BF
    RTI                  ; 40
    ADC $50AFF0,X        ; 7F F0 AF 50
    CPX #$FF             ; E0 FF
    INX                  ; E8
    SBC $C4EBD4,X        ; FF D4 EB C4
    SBC $9FFCDF,X        ; FF DF FC 9F
    SBC $BCFFBF,X        ; FF BF FF BC
    JSR ($07FF,X)        ; FC FF 07
    SBC $07FF07,X        ; FF 07 FF 07
    SBC $03FF03,X        ; FF 03 FF 03
    SBC $01FF03,X        ; FF 03 FF 01
    SBC $7F03,X          ; FD 03 7F
    LDA $FF7FFF,X        ; BF FF 7F FF
    ADC $1FEF1F,X        ; 7F 1F EF 1F
    SBC $02F60F          ; EF 0F F6 02
    SBC $FF00,X          ; FD 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    JSR ($FCFB,X)        ; FC FB FC
    SBC $E2              ; E3 E2
    CMP $CCF3,X          ; DD F3 CC
    SBC $98E7C0,X        ; FF C0 E7 98
    SBC $0F              ; F7 0F
    SBC $0F              ; F3 0F
    SBC $0F              ; F7 0F
    AND $DF2FDF          ; 2F DF 2F DF
    EOR $FF7FFF,X        ; 5F FF 7F FF
    ADC $C33FFF,X        ; 7F FF 3F C3
    ADC $00FF80,X        ; 7F 80 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $FBFCFC,X        ; FF FC FC FB
    BEQ $96A7            ; F0 FF
    BEQ $9699            ; F0 EF
    CLD                  ; D8
    SBC $EB              ; F7 EB
    PEA $FEF3            ; F4 F3 FE
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $7FFFFF,X        ; FF FF FF 7F
    SBC $0FFF1F,X        ; FF 1F FF 0F
    SBC $01FF03,X        ; FF 03 FF 01
    SBC $FFFFFF,X        ; FF FF FF FF
    ADC $ED              ; 73 ED
    RTI                  ; 40
    LDA $1FF10F,X        ; BF 0F F1 1F
    SBC $FF3FFF          ; EF FF 3F FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    BRA $96F4            ; 80 FF
    BRK $7F              ; 00 7F
    BRA $96F8            ; 80 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    SBC $FFFF7F,X        ; FF 7F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFE,X        ; FF FE FF FF
    ORA $FF              ; 01 FF
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $FFFCFF,X        ; FF FF FC FF
    SBC $FC              ; F2 FC
    XCE                  ; FB
    SED                  ; F8
    STA $E0              ; 97 E0
    STA $10EF70,X        ; 9F 70 EF 10
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    ORA $FF              ; 03 FF
    ORA $FD              ; 01 FD
    ORA $FF              ; 03 FF
    CPY #$DF             ; C0 DF
    JSR $708F            ; 20 8F 70
    STZ $9C61,X          ; 9E 61 9C
    PER $F800            ; 62 00 F8
    BRK $F8              ; 00 F8
    TSB $FA              ; 04 FA
    SBC $FCFCFF,X        ; FF FF FC FC
    BEQ $97C9            ; F0 F3
    CPX #$EC             ; E0 EC
    CPY #$CD             ; C0 CD
    CPY #$C7             ; C0 C7
    CPY #$C7             ; C0 C7
    BRA $9761            ; 80 81
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FF7FFF,X        ; FF FF 7F FF
    AND $FFDFFF,X        ; 3F FF DF FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    CLD                  ; D8
    SBC $D8              ; F7 D8
    SBC $F8FFF8,X        ; FF F8 FF F8
    SBC $E8FFF8,X        ; FF F8 FF E8
    SBC $FCFFE8,X        ; FF E8 FF FC
    XCE                  ; FB
    SBC $0FFF0F,X        ; FF 0F FF 0F
    SBC $07FF07,X        ; FF 07 FF 07
    SBC $07FF07,X        ; FF 07 FF 07
    SBC $07FF07,X        ; FF 07 FF 07
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    ADC $03FF8F,X        ; 7F 8F FF 03
    SBC $01FE00,X        ; FF 00 FE 01
    CPX $1A              ; E4 1A
    CPY $39              ; C4 39
    SBC $00FF00,X        ; FF 00 FF 00
    ORA $60              ; 07 60
    BRK $BC              ; 00 BC
    BRK $F3              ; 00 F3
    BRK $E6              ; 00 E6
    BRK $01              ; 00 01
    BRK $02              ; 00 02
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    AND $9F7FC7,X        ; 3F C7 7F 9F
    ADC $FF3F9F,X        ; 7F 9F 3F FF
    ADC $BF7FBF,X        ; 7F BF 7F BF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    XCE                  ; FB
    BRK $F2              ; 00 F2
    ORA $30              ; 01 30
    CMP $708870          ; CF 70 88 70
    DEY                  ; 88
    SEC                  ; 38
    LSR $09              ; 46 09
    ROR $1E,X            ; 76 1E
    ADC $1C              ; 61 1C
    ADC $20              ; 63 20
    JMP $008080          ; 5C 80 80 00
    ORA $00              ; 07 00
    ADC $00              ; 67 00
    LDA $00              ; A1 00
    BRA $98FB            ; 80 00
    TYA                  ; 98
    BRK $80              ; 00 80
    BRK $83              ; 00 83

;==============================================================================
; GeneralPurpose_19
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_19:
    XCE                  ; FB | Unknown operation
    SBC $F7F7FB,X        ; FF FB F7 F7 | Unknown operation
    SBC $EBFFF3,X        ; FF F3 FF EB | Unknown operation
    SBC $EF              ; F7 EF | Unknown operation
    SBC $EFFFEF,X        ; FF EF FF EF | Unknown operation
    SBC $FF00FF,X        ; FF FF 00 FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FC              ; 00 FC | Software interrupt
    SBC $FFFCFF,X        ; FF FF FC FF | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    XCE                  ; FB | Unknown operation
    SBC $FDFE,Y          ; F9 FE FD | Unknown operation
    SBC $FD              ; F2 FD | Unknown operation
    SEP #$FC             ; E2 FC | Set processor status bits
    BRK $FC              ; 00 FC | Software interrupt
    COP $F8              ; 02 F8 | Unknown operation
    BRK $F8              ; 00 F8 | Software interrupt
    BRK $F8              ; 00 F8 | Software interrupt
    TSB $F0              ; 04 F0 | Unknown operation
    BRK $E0              ; 00 E0 | Software interrupt
    TSB $00E0            ; 0C E0 00 | Unknown operation
    CMP $3A              ; C5 3A | Compare with accumulator
    ORA $E01FE0,X        ; 1F E0 1F E0 | Logical OR with accumulator
    TDC                  ; 7B | Unknown operation
    STY $70              ; 84 70 | Store Y register
    STX $3E40            ; 8E 40 3E | Store X register
    BRK $D0              ; 00 D0 | Software interrupt
    RTS                  ; 60 | Return from local function
    STA $0000,X          ; 9D 00 00 | Store accumulator to memory
    BRK $04              ; 00 04 | Software interrupt
    BRK $18              ; 00 18 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    BRK $01              ; 00 01 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    BRK $2F              ; 00 2F | Software interrupt
    BRK $02              ; 00 02 | Software interrupt
    SBC $11              ; E1 11 | Unknown operation
    SBC $13              ; E1 13 | Unknown operation
    STA $61              ; 81 61 | Store accumulator to memory
    BRA $99E8            ; 80 60 | Unknown operation
    BRK $C0              ; 00 C0 | Software interrupt
    BRK $C3              ; 00 C3 | Software interrupt
    TSB $C2              ; 04 C2 | Unknown operation

    TSB $C2              ; 04 C2
    BRK $8E              ; 00 8E
    ORA $0E              ; 01 0E
    ORA $8C              ; 01 8C
    BRK $1E              ; 00 1E
    BRK $1F              ; 00 1F
    BRK $3F              ; 00 3F
    BRK $3C              ; 00 3C
    BRK $39              ; 00 39
    BRK $71              ; 00 71
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    INX                  ; E8
    PEA $FCE0            ; F4 E0 FC
    CPX #$FC             ; E0 FC
    CPY #$AC             ; C0 AC
    BRA $99B2            ; 80 E4
    LDY #$E4             ; A0 E4
    BEQ $99DD            ; F0 0B
    CPX #$03             ; E0 03
    CPX #$03             ; E0 03
    CPX #$03             ; E0 03
    CPX #$03             ; E0 03
    CPX #$13             ; E0 13
    CPX #$1B             ; E0 1B
    CPX #$1B             ; E0 1B
    JSR $005E            ; 20 5E 00
    JMP ($38C0,X)        ; 7C C0 38
    BRK $C2              ; 00 C2
    COP $A1              ; 02 A1
    ORA $80              ; 07 80
    ASL $41              ; 06 41
    TSB $83              ; 04 83
    BRK $81              ; 00 81
    BRK $83              ; 00 83
    BRK $87              ; 00 87
    BRK $3D              ; 00 3D
    BRK $5C              ; 00 5C
    BRK $78              ; 00 78
    BRK $B8              ; 00 B8
    BRK $78              ; 00 78

;==============================================================================
; GeneralPurpose_1A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_1A:
    SBC $FFDFFF          ; EF FF DF FF | Unknown operation
    SBC $FFBFFF,X        ; FF FF BF FF | Unknown operation
    LDA $FFFFFF,X        ; BF FF FF FF | Load value into accumulator
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $FFFFFF,X        ; FF FF FF FF | Unknown operation
    ; Skipped 32 bytes of data
    CMP #$F0             ; C9 F0 | Compare with accumulator
    INY                  ; C8 | Unknown operation
    LDA $08              ; B3 08 | Load value into accumulator
    ADC $00              ; 72 00 | Unknown operation
    JMP $9901            ; 4C 01 99 | Unknown operation
    SBC $F7              ; E7 F7 | Unknown operation
    CPY #$00             ; C0 00 | Unknown operation
    CPY #$00             ; C0 00 | Unknown operation
    BRA $9A5C            ; 80 06 | Unknown operation
    BRK $04              ; 00 04 | Software interrupt
    BRK $85              ; 00 85 | Software interrupt
    BRK $B3              ; 00 B3 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    BRK $08              ; 00 08 | Software interrupt
    RTI                  ; 40 | Unknown operation
    LDA $40B840          ; AF 40 B8 40 | Load value into accumulator
    LDY #$00             ; A0 00 | Load Y register
    BRK $00              ; 00 00 | Software interrupt
    BRK $3C              ; 00 3C | Software interrupt
    BIT $FFFF,X          ; 3C FF FF | Unknown operation
    SBC $1000FF,X        ; FF FF 00 10 | Unknown operation
    BRK $07              ; 00 07 | Software interrupt
    BRK $1F              ; 00 1F | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $C3              ; 00 C3 | Software interrupt
    BRK $08              ; 00 08 | Software interrupt
    BRK $7F              ; 00 7F | Software interrupt
    BRK $08              ; 00 08 | Software interrupt
    ORA $3F3F0F          ; 0F 0F 3F 3F | Logical OR with accumulator
    ORA $F3              ; 03 F3 | Logical OR with accumulator
    BRK $E0              ; 00 E0 | Software interrupt
    ORA $87              ; 07 87 | Logical OR with accumulator
    JSR ($FFFC,X)        ; FC FC FF | Call local function
    SBC $00F700,X        ; FF 00 F7 00 | Unknown operation
    BEQ $9A96            ; F0 01 | Branch if equal (zero flag set)
    CPY #$00             ; C0 00 | Unknown operation
    TSB $1F00            ; 0C 00 1F | Unknown operation
    BRK $78              ; 00 78 | Software interrupt

    BRK $78              ; 00 78
    BRK $03              ; 00 03
    BRK $80              ; 00 80
    ORA $8F8F0F          ; 0F 0F 8F 8F
    SBC $FFFDFF,X        ; FF FF FD FF
    ORA #$09             ; 09 09
    ORA $7F7F0F          ; 0F 0F 7F 7F
    SBC $F007FF,X        ; FF FF 07 F0
    ORA $70              ; 07 70
    STA $000D00,X        ; 9F 00 0D 00
    PHP                  ; 08
    INC $09,X            ; F6 09
    BEQ $9ABD            ; F0 00
    BRA $9ABF            ; 80 00
    TSB $FFF1            ; 0C F1 FF
    SBC $FF              ; F7 FF
    SBC $FF,X            ; F5 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $F5F9FF,X        ; FF FF F9 F5
    INX                  ; E8
    PEA $00FF            ; F4 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00              ; F3 00
    SBC $02              ; E1 02
    CPX #$03             ; E0 03
    BRK $FF              ; 00 FF
    BRK $FE              ; 00 FE
    ORA $FF              ; 01 FF
    ORA $FF              ; 01 FF
    ORA $FF              ; 03 FF
    ORA $FD              ; 01 FD
    ORA $DD              ; 11 DD
    AND $FF              ; 33 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    INC $FEFF,X          ; FE FF FE
    SBC $FEFFFE,X        ; FF FE FF FE
    SBC $CCFFFE,X        ; FF FE FF CC
    SBC $40FF00,X        ; FF 00 FF 40
    ADC $F0DFD0,X        ; 7F D0 DF F0
    SBC $F8              ; F7 F8
    SBC $FCFFF8,X        ; FF F8 FF FC
    SBC $FFFBF8,X        ; FF F8 FB FF
    SBC $3FFFFF,X        ; FF FF FF 3F
    SBC $07FF0F,X        ; FF 0F FF 07
    SBC $07FF07,X        ; FF 07 FF 07
    SBC $80FF07,X        ; FF 07 FF 80
    BNE $9AB7            ; D0 94
    CMP $DFC2            ; CD C2 DF
    DEC $9EEF            ; CE EF 9E
    STZ $FFF1,X          ; 9E F1 FF
    BEQ $9B2A            ; F0 FC
    CPX #$F8             ; E0 F8
    CPY #$2F             ; C0 2F
    CPY #$22             ; C0 22
    CPY #$20             ; C0 20
    BRA $9B48            ; 80 10
    BRA $9B9B            ; 80 61
    BRK $00              ; 00 00
    BRK $33              ; 00 33
    BRK $67              ; 00 67
    BRK $04              ; 00 04
    BRK $1C              ; 00 1C
    BRK $18              ; 00 18
    BRK $30              ; 00 30
    BRK $30              ; 00 30
    CPY #$E0             ; C0 E0
    RTI                  ; 40
    RTI                  ; 40
    JMP ($007C,X)        ; 7C 7C 00
    XCE                  ; FB
    BRK $E3              ; 00 E3
    BRK $E7              ; 00 E7
    BRK $CF              ; 00 CF
    BRK $CF              ; 00 CF
    BRK $1F              ; 00 1F
    BRK $BF              ; 00 BF
    BRK $C3              ; 00 C3
    SBC $FEFE,X          ; FD FE FE
    SBC $F9FFFB,X        ; FF FB FF F9
    INC $FFFE,X          ; FE FE FF
    INC $FEFF,X          ; FE FF FE
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $E0              ; 00 E0
    SED                  ; F8
    SEP #$F1             ; E2 F1
    CPX $E0EE            ; EC EE E0
    BEQ $9B88            ; F0 FF
    SBC $FFCFCF,X        ; FF CF CF FF
    SBC $E0FFFF,X        ; FF FF FF E0
    ORA $E0              ; 07 E0
    TSB $11E0            ; 0C E0 11
    CPY #$0F             ; C0 0F
    CPY #$00             ; C0 00
    STA $30              ; 83 30
    BRK $00              ; 00 00
    STA $9F9F00          ; 8F 00 9F 9F
    STA $1F1F9F,X        ; 9F 9F 1F 1F
    ADC $87876F          ; 6F 6F 87 87
    SBC $FDFDFF,X        ; FF FF FD FD
    SBC $609FFF,X        ; FF FF 9F 60
    STA $E01F60,X        ; 9F 60 1F E0
    ORA $780490          ; 0F 90 04 78
    BRK $00              ; 00 00
    SEC                  ; 38
    COP $C0              ; 02 C0
    BRK $B3              ; 00 B3
    SBC $7F              ; F7 7F
    ADC $FFFBFB,X        ; 7F FB FB FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $1DFFFF,X        ; FF FF FF 1D
    ORA $FFCC,X          ; 1D CC FF
    CPY $FF              ; C4 FF
    TSB $FF              ; 04 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SEP #$FF             ; E2 FF
    INC $FDFF,X          ; FE FF FD
    SBC $FEFE,X          ; FD FE FE
    SBC $FFFFFF,X        ; FF FF FF FF
    STA $80DF,X          ; 9D DF 80
    SBC $38              ; E7 38
    SBC $03FF03,X        ; FF 03 FF 03
    SBC $00FF01,X        ; FF 01 FF 00
    SBC $62FF00,X        ; FF 00 FF 62
    LDA $987F,X          ; BD 7F 98
    CMP $18              ; C7 18

;==============================================================================
; GeneralPurpose_1C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_1C:
    BRK $38              ; 00 38 | Software interrupt
    CPX #$00             ; E0 00 | Unknown operation
    BRK $07              ; 00 07 | Software interrupt
    BRK $1F              ; 00 1F | Software interrupt
    STA $7F              ; 81 7F | Store accumulator to memory
    PHP                  ; 08 | Push processor status to stack
    SBC $F801,X          ; FD 01 F8 | Unknown operation
    BRK $40              ; 00 40 | Software interrupt
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $C03F00,X        ; FF 00 3F C0 | Unknown operation
    ADC $00FF80,X        ; 7F 80 FF 00 | Unknown operation
    SBC $F802,X          ; FD 02 F8 | Unknown operation
    ORA $1F              ; 07 1F | Logical OR with accumulator
    ADC $000F03,X        ; 7F 03 0F 00 | Unknown operation
    STA $C1              ; 83 C1 | Store accumulator to memory
    BEQ $9BB7            ; F0 8E | Branch if equal (zero flag set)
    CPY #$20             ; C0 20 | Unknown operation
    BRK $01              ; 00 01 | Software interrupt
    BRK $B3              ; 00 B3 | Software interrupt
    BRK $E0              ; 00 E0 | Software interrupt
    ORA $FF03FC,X        ; 1F FC 03 FF | Logical OR with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FE              ; 00 FE | Software interrupt
    ORA $E8              ; 01 E8 | Logical OR with accumulator
    ORA $00              ; 17 00 | Logical OR with accumulator
    SBC $FFFF00,X        ; FF 00 FF FF | Unknown operation
    SBC $C8F5F4,X        ; FF F4 F5 C8 | Unknown operation
    WAI                  ; CB | Unknown operation
    PER $0407            ; 62 07 04 | Unknown operation
    ASL $7F19,X          ; 1E 19 7F | Arithmetic shift left
    ORA $0DB8,Y          ; 19 B8 0D | Logical OR with accumulator
    BRL $9B52            ; 82 00 FF | Unknown operation
    PHD                  ; 0B | Unknown operation
    JSR ($F837,X)        ; FC 37 F8 | Call local function
    SBC $C0FFF8,X        ; FF F8 FF C0 | Unknown operation
    SBC $00FF80,X        ; FF 80 FF 00 | Unknown operation
    SBC $FF00,X          ; FD 00 FF | Unknown operation
    SBC $119F1C,X        ; FF 1C 9F 11 | Unknown operation
    JSR ($7033,X)        ; FC 33 70 | Call local function
    INC $6CE0            ; EE E0 6C | Unknown operation
    BPL $9C9D            ; 10 30 | Unknown operation
    CPY #$80             ; C0 80 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $EF7CE3,X        ; FF E3 7C EF | Unknown operation
    BPL $9C76            ; 10 FF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $EF              ; 00 EF | Software interrupt
    BRK $3F              ; 00 3F | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt

    BRK $FF              ; 00 FF
    BRK $01              ; 00 01
    BRK $71              ; 00 71
    BRK $F2              ; 00 F2
    ORA $EC              ; 01 EC
    ORA $F0              ; 03 F0
    ORA $E0              ; 01 E0
    BRK $35              ; 00 35
    CPY #$1A             ; C0 1A
    CPX #$FF             ; E0 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $7FFFFF,X        ; FF FF FF 7F
    SBC $BFFF3F,X        ; FF 3F FF BF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFF8,X        ; FF F8 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $27FFFF,X        ; FF FF FF 27
    ORA $C3078B,X        ; 1F 8B 07 C3
    ORA $C3              ; 07 C3
    ORA $87              ; 07 87
    ORA $110F87          ; 0F 87 0F 11
    ORA $FF1320          ; 0F 20 13 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $40FF00,X        ; FF 00 FF 40
    SBC $FFFFF8,X        ; FF F8 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFFC,X        ; FF FC FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FCFFFF,X        ; FF FF FF FC
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $E0FFC0,X        ; FF C0 FF E0
    SBC $FEFFFE,X        ; FF FE FF FE
    SBC $FFFF03,X        ; FF 03 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $F0FFFF,X        ; FF FF FF F0
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFF3F,X        ; FF 3F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $10FFF0,X        ; FF F0 FF 10
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $F3FF04,X        ; FF 04 FF F3
    JSR ($807F,X)        ; FC 7F 80
    SBC $00FF00,X        ; FF 00 FF 00
    CPX #$1F             ; E0 1F
    ORA $FF              ; 07 FF
    SBC $FFFCFF,X        ; FF FF FC FF
    CPX #$FF             ; E0 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 07 FF
    ORA $FF              ; 07 FF
    RTS                  ; 60
    SBC $80FF00,X        ; FF 00 FF 80
    ADC $FFFF38,X        ; 7F 38 FF FF
    SBC $FFFFF8,X        ; FF F8 FF FF
    SBC $7FFF7F,X        ; FF 7F FF 7F
    SBC $3FFF3F,X        ; FF 3F FF 3F
    SBC $1FFF3F,X        ; FF 3F FF 1F
    SBC $EFFF7F,X        ; FF 7F FF EF
    SBC $7CFFF1,X        ; FF F1 FF 7C
    SBC $00FF1C,X        ; FF 1C FF 00
    SBC $38FF0E,X        ; FF 0E FF 38
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $B8C3BC,X        ; FF BC C3 B8
    CPY #$60             ; C0 60
    BRA $A0C5            ; 80 3C
    BRK $00              ; 00 00
    BRK $E0              ; 00 E0
    BRK $E7              ; 00 E7
    BRK $FF              ; 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FCFFF0,X        ; FF F0 FF FC
    SBC $F8FFFF,X        ; FF FF FF F8
    ORA $FF              ; 07 FF
    BRK $3F              ; 00 3F
    CPY #$FF             ; C0 FF
    BRK $FC              ; 00 FC
    ORA $30              ; 03 30
    CMP $80FF07          ; CF 07 FF 80
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $F0FF00,X        ; FF 00 FF F0
    ORA $0006F9          ; 0F F9 06 00
    SBC $7FFF01,X        ; FF 01 FF 7F
    SBC $1FFFFE,X        ; FF FE FF 1F
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $03FF00,X        ; FF 00 FF 03
    SBC $03FF3F,X        ; FF 3F FF 03
    SBC $03FFFF,X        ; FF FF FF 03
    SBC $027F83,X        ; FF 83 7F 02
    SBC $FEFFE6,X        ; FF E6 FF FE
    SBC $83DC23,X        ; FF 23 DC 83
    JSR ($FF03,X)        ; FC 03 FF
    ORA $FF              ; 03 FF
    ORA $FF              ; 03 FF
    ORA $FF              ; 03 FF
    ORA $FF              ; 03 FF
    SBC $FF              ; E7 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    CPY #$FF             ; C0 FF
    BEQ $A143            ; F0 FF
    INC $3FFF,X          ; FE FF 3F
    SBC $D8FF1F,X        ; FF 1F FF D8
    AND $EF01FE,X        ; 3F FE 01 EF
    ORA $FFFFFF,X        ; 1F FF FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FFFFEF,X        ; FF EF FF FF
    SBC $F9FFFF,X        ; FF FF FF F9
    SBC $07FF1F,X        ; FF 1F FF 07
    SBC $FFFF20,X        ; FF 20 FF FF
    SBC $0FFFFF,X        ; FF FF FF 0F
    SBC $FFFF01,X        ; FF 01 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $7FFFFF,X        ; FF FF FF 7F
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FCFFFF,X        ; FF FF FF FC
    SBC $F8FE01,X        ; FF 01 FE F8
    SBC $F0FFFF,X        ; FF FF FF F0
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FCFFFF,X        ; FF FF FF FC
    SBC $011FE7,X        ; FF E7 1F 01
    SBC $FFFF7F,X        ; FF 7F FF FF
    SBC $CFFFFF,X        ; FF FF FF CF
    SBC $C1FF7F,X        ; FF 7F FF C1
    SBC $FFFFFE,X        ; FF FE FF FF
    SBC $E0FFFF,X        ; FF FF FF E0
    SBC $00FF06,X        ; FF 06 FF 00
    SBC $FFFFCF,X        ; FF CF FF FF
    SBC $F8FFE0,X        ; FF E0 FF F8
    SBC $E3FFFC,X        ; FF FC FF E3
    SBC $FFFF80,X        ; FF 80 FF FF
    SBC $80FFFF,X        ; FF FF FF 80
    SBC $80FF00,X        ; FF 00 FF 80
    SBC $00FFF8,X        ; FF F8 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF9F,X        ; FF 9F FF FF
    SBC $03FF7E,X        ; FF 7E FF 03
    SBC $C1FF00,X        ; FF 00 FF C1
    SBC $FFFF9F,X        ; FF 9F FF FF
    SBC $3CFF9F,X        ; FF 9F FF 3C
    CMP $0F              ; C3 0F
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FCFF80,X        ; FF 80 FF FC
    SBC $3DFFFF,X        ; FF FF FF 3D
    INC $FFFE,X          ; FE FE FF
    ASL $FF              ; 06 FF
    CMP $FFFFFF          ; CF FF FF FF
    BEQ $A2CB            ; F0 FF
    STA $807FE0,X        ; 9F E0 7F 80
    SBC $FF07FF,X        ; FF FF 07 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    ORA $FF              ; 07 FF
    ADC $FF7FFF,X        ; 7F FF 7F FF
    SBC $6F96FF,X        ; FF FF 96 6F
    ORA $FF              ; 07 FF
    SBC $8FFF,Y          ; F9 FF 8F
    SBC $0CFFC0,X        ; FF C0 FF 0C
    SBC $C0              ; F3 C0
    AND $FF1FE0,X        ; 3F E0 1F FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $FFFFF8,X        ; FF F8 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $3FFFFF,X        ; FF FF FF 3F
    SBC $FFFF07,X        ; FF 07 FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $5FFF31,X        ; FF 31 FF 5F
    SBC $FFFF71,X        ; FF 71 FF FF
    SBC $7FFFFF,X        ; FF FF FF 7F
    SBC $FFFF7F,X        ; FF 7F FF FF
    SBC $CFFFCF,X        ; FF CF FF CF
    SBC $F8FF8E,X        ; FF 8E FF F8
    SBC $80FFF0,X        ; FF F0 FF 80
    SBC $00FF01,X        ; FF 01 FF 00
    SBC $E0FFFC,X        ; FF FC FF E0
    SBC $F8FF39,X        ; FF 39 FF F8
    SBC $80FFF0,X        ; FF F0 FF 80
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF20,X        ; FF 20 FF 00
    SBC $7FFF00,X        ; FF 00 FF 7F
    SBC $3FFF3F,X        ; FF 3F FF 3F
    SBC $7FFFC3,X        ; FF C3 FF 7F
    SBC $18FF1F,X        ; FF 1F FF 18
    SBC $7FFFFE,X        ; FF FE FF 7F
    SBC $3FFF3F,X        ; FF 3F FF 3F
    SBC $3FFF7F,X        ; FF 7F FF 3F
    SBC $1FFF1F,X        ; FF 1F FF 1F
    SBC $FFFF1F,X        ; FF 1F FF FF
    SBC $F8FFFE,X        ; FF FE FF F8
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $38FFFF,X        ; FF FF FF 38
    SBC $FFFE01,X        ; FF 01 FE FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $EAFFFF,X        ; FF FF FF EA
    SBC $0F              ; F1 0F
    BEQ $A443            ; F0 7E
    STA $00              ; 81 00
    SBC $E0FF00,X        ; FF 00 FF E0
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    TRB $FFFF            ; 1C FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FF00FF,X        ; FF FF 00 FF
    SBC #$F6             ; E9 F6
    ORA $FC              ; 03 FC
    ORA $00FFE0,X        ; 1F E0 FF 00
    SEI                  ; 78
    BRK $03              ; 00 03
    BRK $1F              ; 00 1F
    BRK $FF              ; 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FCFFFF,X        ; FF FF FF FC
    BRK $C0              ; 00 C0
    BRK $C0              ; 00 C0
    BRK $07              ; 00 07
    BRK $03              ; 00 03
    BRK $1E              ; 00 1E
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    TRB $FFFF            ; 1C FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FF0FFF,X        ; FF FF 0F FF
    SBC $FFFFFF,X        ; FF FF FF FF
    JSR ($01FF,X)        ; FC FF 01
    INC $00FC,X          ; FE FC 00
    BPL $A4EE            ; 10 E0
    SBC $F8,X            ; F5 F8
    BRK $FF              ; 00 FF
    CPY #$FF             ; C0 FF
    ORA $FF              ; 07 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $FF00FF,X        ; FF FF 00 FF
    CPX #$1F             ; E0 1F
    SBC $01FE00,X        ; FF 00 FE 01
    CMP $00              ; C7 00
    ORA $00              ; 01 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    BIT $FF03,X          ; 3C 03 FF
    BRK $40              ; 00 40
    BRK $AB              ; 00 AB
    BRK $F7              ; 00 F7
    BRK $1F              ; 00 1F
    BRK $20              ; 00 20
    CPY #$FE             ; C0 FE
    BRK $FF              ; 00 FF
    SBC $BFFFFF,X        ; FF FF FF BF
    LDA $0F5555,X        ; BF 55 55 0F
    ORA $FFFFFF          ; 0F FF FF FF
    SBC $F3FFFF,X        ; FF FF FF F3
    ORA $FE              ; 03 FE
    ORA $7F              ; 07 7F
    AND $F8FF00,X        ; 3F 00 FF F8
    ORA $F3              ; 07 F3
    BRK $07              ; 00 07
    BRK $29              ; 00 29
    BPL $A5F0            ; 10 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    SBC $063F3F,X        ; FF 3F 3F 06
    ASL $E0              ; 06 E0
    CPX #$00             ; E0 00
    BRK $AA              ; 00 AA
    BRK $55              ; 00 55
    BRK $FC              ; 00 FC
    BRK $70              ; 00 70
    BRA $A632            ; 80 07
    BRK $E7              ; 00 E7
    CLC                  ; 18
    ADC $FF00,X          ; 7D 00 FF
    SBC $AA5555,X        ; FF 55 55 AA
    TAX                  ; AA
    SBC $FFFFFF,X        ; FF FF FF FF
    SED                  ; F8
    SED                  ; F8
    CLC                  ; 18
    CLC                  ; 18
    INC $00FE,X          ; FE FE 00
    BRK $AA              ; 00 AA
    BRK $55              ; 00 55
    BRK $A7              ; 00 A7
    BRK $1F              ; 00 1F
    BRK $C0              ; 00 C0
    BRK $F9              ; 00 F9
    ASL $60              ; 06 60
    ORA $55FFFF,X        ; 1F FF FF 55
    EOR $AB,X            ; 55 AB
    PLB                  ; AB
    EOR $FFFF5F,X        ; 5F 5F FF FF
    AND $06063F,X        ; 3F 3F 06 06
    SBC $0000FF,X        ; FF FF 00 00
    TAX                  ; AA
    BRK $D5              ; 00 D5
    BRK $AA              ; 00 AA
    BRK $C0              ; 00 C0
    BRK $0F              ; 00 0F
    ORA $003FF1          ; 0F F1 3F 00
    SBC $55FFFF,X        ; FF FF FF 55
    EOR $AA,X            ; 55 AA
    TAX                  ; AA
    CMP $D5,X            ; D5 D5
    SBC $FFFFFF,X        ; FF FF FF FF
    AND $FFFF3F,X        ; 3F 3F FF FF
    JSR $803F            ; 20 3F 80
    ADC $8F7F7C,X        ; 7F 7C 7F 8F
    ADC $FFFF7E,X        ; 7F 7E FF FF
    SBC $0EFFC0,X        ; FF C0 FF 0E
    SBC $C0              ; F1 C0
    SBC $C07F00,X        ; FF 00 7F C0
    SBC $077F00,X        ; FF 00 7F 07
    SBC $FFFF1F,X        ; FF 1F FF FF
    SBC $01FFFF,X        ; FF FF FF 01
    BRK $0A              ; 00 0A
    CPX #$15             ; E0 15
    CPX #$EA             ; E0 EA
    CPX #$0D             ; E0 0D
    SBC $FF              ; F2 FF
    SBC $00FFFF,X        ; FF FF FF 00
    SBC $35FFFF,X        ; FF FF FF 35
    SBC $0A,X            ; F5 0A
    NOP                  ; EA
    ORA $F5,X            ; 15 F5
    BEQ $A6AC            ; F0 F2
    STY $FF              ; 84 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    BIT #$07             ; 89 07
    PLB                  ; AB
    BRK $55              ; 00 55
    BRK $AA              ; 00 AA
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $CF              ; 00 CF
    LDY #$CA             ; A0 CA
    SBC $FF              ; F1 FF
    SBC $AA5757,X        ; FF 57 57 AA
    TAX                  ; AA
    EOR $55,X            ; 55 55
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BCS $A68E            ; B0 B0
    SBC $C0B2FF,X        ; FF FF B2 C0
    TAX                  ; AA
    BRK $55              ; 00 55
    BRK $AA              ; 00 AA
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $5F              ; 00 5F
    BRA $A6F0            ; 80 FF
    SBC $AAD5D5,X        ; FF D5 D5 AA
    TAX                  ; AA
    EOR $55,X            ; 55 55
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPX #$E0             ; E0 E0

;==============================================================================
; GeneralPurpose_27
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_27:
    TRB $0000            ; 1C 00 00 | Unknown operation
    BRK $55              ; 00 55 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    ORA $FF0778          ; 0F 78 07 FF | Logical OR with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    SBC $AAFFFF,X        ; FF FF FF AA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    ADC $FFFF7F,X        ; 7F 7F FF FF | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $00              ; 07 00 | Logical OR with accumulator
    CMP $0F713F,X        ; DF 3F 71 0F | Compare with accumulator
    SBC $F8              ; E5 F8 | Unknown operation
    CPX #$00             ; E0 00 | Unknown operation
    CPX #$00             ; E0 00 | Unknown operation
    SBC $00FF00,X        ; FF 00 FF 00 | Unknown operation
    SBC $FFFCFF,X        ; FF FF FC FF | Unknown operation
    LDA $FFFFBF,X        ; BF BF FF FF | Load value into accumulator
    SBC $1F1FFF,X        ; FF FF 1F 1F | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ORA $FFC0E0,X        ; 1F E0 C0 FF | Logical OR with accumulator
    SBC $F768FF,X        ; FF FF 68 F7 | Unknown operation
    ORA $004100,X        ; 1F 00 41 00 | Logical OR with accumulator
    SBC $00FE00,X        ; FF 00 FE 00 | Unknown operation
    SBC $FF7FFF,X        ; FF FF 7F FF | Unknown operation
    ASL $FF              ; 06 FF | Arithmetic shift left
    STA $E0E0FF,X        ; 9F FF E0 E0 | Store accumulator to memory
    LDX $00BE,Y          ; BE BE 00 | Load X register
    BRK $01              ; 00 01 | Software interrupt
    ORA $08              ; 01 08 | Logical OR with accumulator
    ORA $3F              ; 07 3F | Logical OR with accumulator
    SBC $7FFFFF,X        ; FF FF FF 7F | Unknown operation
    SBC $FF01A0,X        ; FF A0 01 FF | Unknown operation
    BRK $E3              ; 00 E3 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    BRK $FF              ; 00 FF | Software interrupt
    SBC $C0FFF8,X        ; FF F8 FF C0 | Unknown operation
    SBC $5FFF80,X        ; FF 80 FF 5F | Unknown operation
    EOR $1C0000,X        ; 5F 00 00 1C | Unknown operation
    TRB $7F7F            ; 1C 7F 7F | Unknown operation
    TRB $FFE3            ; 1C E3 FF | Unknown operation
    SBC $FBFFFF,X        ; FF FF FF FB | Unknown operation
    SBC $DFC130,X        ; FF 30 C1 DF | Unknown operation
    BRK $FF              ; 00 FF | Software interrupt
    BRK $7F              ; 00 7F | Software interrupt

    BRK $7F              ; 00 7F
    BRK $FF              ; 00 FF
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFFFC,X        ; FF FC FF FF
    SBC $002020,X        ; FF 20 20 00
    BRK $80              ; 00 80
    BRA $A799            ; 80 F8
    BRK $EF              ; 00 EF
    BRK $FF              ; 00 FF
    JSR ($FF3F,X)        ; FC 3F FF
    ORA $FF              ; 03 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $07              ; 07 07
    BEQ $A7A4            ; F0 F0
    ASL $FE              ; 06 FE
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $008800,X        ; FF 00 88 00
    SBC $9F00,X          ; FD 00 9F
    STA $F8              ; 87 F8
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FFFF00,X        ; FF 00 FF FF
    SBC $037F7F,X        ; FF 7F 7F 03
    ORA $78              ; 03 78
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FF003C,X        ; FF 3C 00 FF
    BRK $FE              ; 00 FE
    BRK $F8              ; 00 F8
    SBC $00FF0F,X        ; FF 0F FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00C3C3,X        ; FF C3 C3 00
    BRK $F1              ; 00 F1
    SBC $1F              ; F1 1F
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $710003,X        ; FF 03 00 71
    BRK $1F              ; 00 1F
    BRK $7F              ; 00 7F
    STA $00FFC0          ; 8F C0 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $FEFCFC,X        ; FF FC FC FE
    INC $E0E0,X          ; FE E0 E0
    JSR ($00FF,X)        ; FC FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $8EFF00,X        ; FF 00 FF 8E
    BRK $F9              ; 00 F9
    BRK $FF              ; 00 FF
    BRK $C7              ; 00 C7
    BRA $A860            ; 80 37
    SBC $01FF00,X        ; FF 00 FF 01
    SBC $7FFF00,X        ; FF 00 FF 7F
    ADC $000606,X        ; 7F 06 06 00
    BRK $F8              ; 00 F8
    SED                  ; F8
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    STP                  ; DB
    BRK $3C              ; 00 3C
    BRK $FF              ; 00 FF
    BRK $F9              ; 00 F9
    COP $8F              ; 02 8F
    BRK $7E              ; 00 7E
    SED                  ; F8
    SBC $FFBFE0,X        ; FF E0 BF FF
    SBC $E7              ; E7 E7
    CMP $C3              ; C3 C3
    BRK $00              ; 00 00
    ORA $07              ; 07 07
    SBC $FF1FFF,X        ; FF FF 1F FF
    SBC $FF00FF,X        ; FF FF 00 FF
    SBC $007800,X        ; FF 00 78 00
    STA $00              ; 81 00
    ADC $00C300,X        ; 7F 00 C3 00
    SBC $008000,X        ; FF 00 80 00
    SBC $FFFFC7          ; EF C7 FF FF
    SBC $7E7EFF,X        ; FF FF 7E 7E
    BRA $A7F8            ; 80 80
    JSR ($00FC,X)        ; FC FC 00
    BRK $FF              ; 00 FF
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $7F              ; 00 7F
    BRK $F3              ; 00 F3
    BRK $FF              ; 00 FF
    SBC $00FFFF,X        ; FF FF FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $80              ; 00 80
    BRA $A89B            ; 80 FC
    JSR ($00F7,X)        ; FC F7 00
    CPY $FF00            ; CC 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    SBC $003333,X        ; FF 33 33 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $000707,X        ; FF 07 07 00
    BRK $70              ; 00 70
    BVS $A8DF            ; 70 00
    BRK $FF              ; 00 FF
    BRK $17              ; 00 17
    BRK $F8              ; 00 F8
    BRK $FE              ; 00 FE
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $E8              ; 00 E8
    INX                  ; E8
    SBC $FFFFFF,X        ; FF FF FF FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SBC $0000FF,X        ; FF FF 00 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00BF00,X        ; FF 00 BF 00
    BVS $A92A            ; 70 00
    ORA $00              ; 07 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    CPY #$C0             ; C0 C0
    SBC $F8F8FF,X        ; FF FF F8 F8
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SED                  ; F8
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $E5              ; 00 E5
    BRK $7F              ; 00 7F
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $07              ; 00 07
    ORA $00              ; 07 00
    BRK $00              ; 00 00
    BRK $1A              ; 00 1A
    INC                  ; 1A
    BRA $A8DA            ; 80 80
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 01 FF
    TSB $8FF8            ; 0C F8 8F
    BRK $7E              ; 00 7E
    SBC $B8              ; E1 B8
    BRA $A991            ; 80 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $0FFF01,X        ; FF 01 FF 0F
    SBC $3FFFFF,X        ; FF FF FF 3F
    SBC $00C7C7,X        ; FF C7 C7 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $77000E,X        ; FF 0E 00 77
    BRK $8C              ; 00 8C
    BVS $AA2C            ; 70 7F
    BRA $A9BE            ; 80 0F
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $F8F1F1,X        ; FF F1 F1 F8
    SED                  ; F8
    SBC $FFFFFF,X        ; FF FF FF FF
    BEQ $A9B0            ; F0 F0
    BRK $FF              ; 00 FF
    ORA $FE              ; 07 FE
    CLC                  ; 18
    BEQ $AA36            ; F0 6F
    BRK $FF              ; 00 FF
    BRK $F3              ; 00 F3
    BRK $1F              ; 00 1F
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    SBC $1FFF01,X        ; FF 01 FF 1F
    SBC $00F0F0,X        ; FF F0 F0 00
    BRK $0C              ; 00 0C
    TSB $E0E0            ; 0C E0 E0
    BRK $00              ; 00 00
    TSB $8BF8            ; 0C F8 8B
    BRK $FF              ; 00 FF
    BRK $FC              ; 00 FC
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $07              ; 00 07
    SBC $00F4F4,X        ; FF F4 F4 00
    BRK $03              ; 00 03
    ORA $00              ; 03 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $CF              ; 00 CF
    BRK $BC              ; 00 BC
    BRK $02              ; 00 02
    BRK $F9              ; 00 F9
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    BRK $3C              ; 00 3C
    BIT $7F7F,X          ; 3C 7F 7F
    SBC $0606FF,X        ; FF FF 06 06
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    SBC $00FF00,X        ; FF 00 FF 00
    ADC $001300,X        ; 7F 00 13 00
    AND $00FF00,X        ; 3F 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRA $A9B6            ; 80 80
    CPX $C0EC            ; EC EC C0
    CPY #$00             ; C0 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FF              ; 03 FF
    ORA $FF              ; 07 FF
    ORA $FE              ; 07 FE
    ADC $00FFFB,X        ; 7F FB FF 00
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
    BRK $7C              ; 00 7C
    CMP $FF              ; C7 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FE              ; 00 FE
    BRK $E3              ; 00 E3
    BRK $44              ; 00 44
    CMP $00              ; C7 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $A0              ; 00 A0
    LDY #$00             ; A0 00
    BRK $FF              ; 00 FF
    BRK $F5              ; 00 F5
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FC              ; 00 FC
    BRK $F0              ; 00 F0
    BRK $FF              ; 00 FF
    BRK $B1              ; 00 B1
    BRK $00              ; 00 00
    BRK $0E              ; 00 0E
    ASL $0000            ; 0E 00 00
    BRK $00              ; 00 00
    ORA $03              ; 03 03
    ORA $00000F          ; 0F 0F 00 00
    LSR $FF4E            ; 4E 4E FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    ORA $FE              ; 07 FE
    ORA $003FFC          ; 0F FC 3F 00
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
    BRK $9F              ; 00 9F
    JSR ($40FF,X)        ; FC FF 40
    SBC $07FF83,X        ; FF 83 FF 07
    SBC $E0FF3F,X        ; FF 3F FF E0
    SBC $38FF00,X        ; FF 00 FF 38
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
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
    SBC $20FF00,X        ; FF 00 FF 20
    SBC $0FFF00,X        ; FF 00 FF 0F
    SBC $F0FFFE,X        ; FF FE FF F0
    SBC $3CFF00,X        ; FF 00 FF 3C
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
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
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $03FF00,X        ; FF 00 FF 03
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    SEC                  ; 38
    BRK $1C              ; 00 1C
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $9F              ; 00 9F
    SBC $78FF07,X        ; FF 07 FF 78
    STA $06              ; 87 06
    SBC $FFE0,Y          ; F9 E0 FF
    INC $FFFF            ; EE FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $0E              ; 00 0E
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    SBC $00FFE0,X        ; FF E0 FF 00
    SBC $0FFF00,X        ; FF 00 FF 0F
    SBC $7FFF3F,X        ; FF 3F FF 7F
    SED                  ; F8
    JSR ($0007,X)        ; FC 07 00
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
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    AND $FFCE,X          ; 3D CE FF
    STA $FF              ; 87 FF
    ORA $FCFFF8          ; 0F F8 FF FC
    SBC $000000,X        ; FF 00 00 00
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
    SBC $FFF0FF,X        ; FF FF F0 FF
    INY                  ; C8
    SBC $00              ; F7 00
    SBC $DEFF00,X        ; FF 00 FF DE
    AND $1F              ; 21 1F
    BRK $F1              ; 00 F1
    ASL $FFFF            ; 0E FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    SBC $FFFFFF,X        ; FF FF FF FF
    ; Skipped 32 bytes of data
    TRB $7800            ; 1C 00 78
    BRK $F0              ; 00 F0
    BRK $E0              ; 00 E0
    JMP ($D930,X)        ; 7C 30 D9
    CPY #$7F             ; C0 7F
    ORA $BF              ; 01 BF
    ORA $FF              ; 07 FF
    ASL $1DFB            ; 0E FB 1D
    SBC $6F              ; F7 6F
    PEA $0003            ; F4 03 00
    ASL $00              ; 06 00
    BRK $00              ; 00 00
    RTI                  ; 40
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $00              ; 00 00
    BRK $FF              ; 00 FF
    CPY #$FF             ; C0 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
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
    BRK $FF              ; 00 FF
    BRK $FF              ; 00 FF
    TSB $F9FF            ; 0C FF F9
    SBC $18FFD6,X        ; FF D6 FF 18
    SBC $C0FF20,X        ; FF 20 FF C0
    SBC $000080,X        ; FF 80 00 00
    BRK $00              ; 00 00
    ; Skipped 32 bytes of data
    BRK $FF              ; 00 FF
    JSR ($FFFF,X)        ; FC FF FF
    SBC $042020,X        ; FF 20 20 04
    TSB $98              ; 04 98
    TYA                  ; 98
    STA $FFFF7F,X        ; 9F 7F FF FF
    SBC $FFFFFF,X        ; FF FF FF FF
    ORA $EF              ; 13 EF
    LDA $00FF00          ; AF 00 FF 00
    SBC $00              ; F1 00
    JSR ($00FF,X)        ; FC FF 00
    SBC $00FF00,X        ; FF 00 FF 00
    SBC $71FFFC,X        ; FF FC FF 71
    ADC $00              ; 71 00
    BRK $0E              ; 00 0E
    ASL $1F00            ; 0E 00 1F
    ORA $3F              ; 01 3F
    COP $7F              ; 02 7F
    ORA $7F              ; 01 7F
    ORA $FF              ; 01 FF
    ORA $FF              ; 03 FF
;==============================================================================
; Function Index (13 functions)
;==============================================================================
; GeneralPurpose_00
; GeneralPurpose_08
; GeneralPurpose_09
; GeneralPurpose_0A
; GeneralPurpose_0B
; GeneralPurpose_0C
; GeneralPurpose_0D
; GeneralPurpose_14
; GeneralPurpose_15
; GeneralPurpose_19
; GeneralPurpose_1A
; GeneralPurpose_1C
; GeneralPurpose_27
;==============================================================================