;==============================================================================
; Dragon Quest III - Audio 05
;==============================================================================
; File: audio_05.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Audio System (Bank $05)
; Comprehensive code extraction


.segment "AUDIO_CODE"

;==============================================================================
; GeneralPurpose_000
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_000:
    ORA $83              ; 01 83 | Logical OR with accumulator
    ORA $68              ; 01 68 | Logical OR with accumulator
    JSR $8008            ; 20 08 80 | Call local function
    RTS                  ; 60 | Return from local function
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    RTS                  ; 60 | Return from local function
    LDA #$3C             ; A9 3C | Load value into accumulator
    ORA $20              ; 01 20 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_001
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_001:
    PHP                  ; 08 | Push processor status to stack
    BRA $8074            ; 80 60 | Unknown operation
    LDA #$3D             ; A9 3D | Load value into accumulator
    ORA $20              ; 01 20 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_002
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_002:
    PHP                  ; 08 | Push processor status to stack
    BRA $807B            ; 80 60 | Unknown operation
    LDA #$3E             ; A9 3E | Load value into accumulator
    ORA $20              ; 01 20 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_003
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_003:
    PHP                  ; 08 | Push processor status to stack
    BRA $8082            ; 80 60 | Unknown operation
    LDA #$3F             ; A9 3F | Load value into accumulator
    ORA $20              ; 01 20 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_004
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_004:
    PHP                  ; 08 | Push processor status to stack
    BRA $8089            ; 80 60 | Unknown operation
    JSR $7B52            ; 20 52 7B | Call local function
    JSR $7B93            ; 20 93 7B | Call local function
    JSL $C270E1          ; 22 E1 70 C2 | Call external function
    CMP #$02             ; C9 02 | Compare with accumulator
    BRK $B0              ; 00 B0 | Software interrupt
    ORA $A9              ; 07 A9 | Logical OR with accumulator
    RTI                  ; 40 | Unknown operation
    BRK $8D              ; 00 8D | Software interrupt
    INC $23              ; E6 23 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$03             ; A9 03 | Load value into accumulator
    ORA $20              ; 01 20 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_005
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_005:
    PHP                  ; 08 | Push processor status to stack
    BRA $80A6            ; 80 60 | Unknown operation
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    AND #$03             ; 29 03 | Logical AND with accumulator
    BRK $0A              ; 00 0A | Software interrupt
    TAX                  ; AA | Transfer accumulator to X
    LDA $C28089,X        ; BF 89 80 C2 | Load value into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SBC $2200,X          ; FD 00 22 | Unknown operation
    CMP $12              ; D1 12 | Compare with accumulator
    CPY #$29             ; C0 29 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C28091,X        ; BF 91 80 C2 | Load value into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    INC $2200,X          ; FE 00 22 | Unknown operation
    CMP $12              ; D1 12 | Compare with accumulator
    CPY #$29             ; C0 29 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C28099,X        ; BF 99 80 C2 | Load value into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SBC $EA6000,X        ; FF 00 60 EA | Unknown operation
    COP $EB              ; 02 EB | Unknown operation
    COP $EC              ; 02 EC | Unknown operation
    COP $ED              ; 02 ED | Unknown operation
    COP $EE              ; 02 EE | Unknown operation
    COP $EF              ; 02 EF | Unknown operation
    COP $F0              ; 02 F0 | Unknown operation
    COP $F1              ; 02 F1 | Unknown operation
    COP $F2              ; 02 F2 | Unknown operation
    COP $F3              ; 02 F3 | Unknown operation
    COP $F4              ; 02 F4 | Unknown operation
    COP $F5              ; 02 F5 | Unknown operation
    COP $22              ; 02 22 | Unknown operation
    ADC $A8              ; 67 A8 | Unknown operation
    CMP $F7              ; C1 F7 | Compare with accumulator
    BRK $22              ; 00 22 | Software interrupt
    ADC $A8              ; 67 A8 | Unknown operation
    CMP $F8              ; C1 F8 | Compare with accumulator
    BRK $60              ; 00 60 | Software interrupt
    LDA #$F7             ; A9 F7 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    


;==============================================================================
; GeneralPurpose_006
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_006:
    PHP                  ; 08 | Push processor status to stack
    BRA $8115            ; 80 60 | Unknown operation
    JSL $C1E32E          ; 22 2E E3 C1 | Call external function
    EOR #$00             ; 49 00 | Unknown operation
    JSL $C1E59C          ; 22 9C E5 C1 | Call external function
    EOR #$00             ; 49 00 | Unknown operation
    BCS $80C9            ; B0 06 | Branch if carry set
    JSL $C028B4          ; 22 B4 28 C0 | Call external function
    BRA $80BB            ; 80 F2 | Unknown operation
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    ORA $00              ; 01 00 | Logical OR with accumulator
    JSR $7B52            ; 20 52 7B | Call local function
    JSR $7B93            ; 20 93 7B | Call local function
    JSL $C270E1          ; 22 E1 70 C2 | Call external function
    JSL $C0133E          ; 22 3E 13 C0 | Call external function
    BEQ $80F3            ; F0 14 | Branch if equal (zero flag set)
    LDX #$00             ; A2 00 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    ORA $14              ; 07 14 | Logical OR with accumulator
    CPY #$90             ; C0 90 | Unknown operation
    PHD                  ; 0B | Unknown operation
    STA $23E6            ; 8D E6 23 | Store accumulator to memory
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    LDA #$F4             ; A9 F4 | Load value into accumulator
    BRK $80              ; 00 80 | Software interrupt
    ORA #$A9             ; 09 A9 | Logical OR with accumulator
    RTI                  ; 40 | Unknown operation
    BRK $8D              ; 00 8D | Software interrupt
    INC $23              ; E6 23 | Unknown operation
    LDA #$F5             ; A9 F5 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    


;==============================================================================
; GeneralPurpose_007
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_007:
    PHP                  ; 08 | Push processor status to stack
    BRA $8160            ; 80 60 | Unknown operation
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SBC $D12200          ; EF 00 22 D1 | Unknown operation
    ORA $C0              ; 12 C0 | Logical OR with accumulator
    LSR                  ; 4A | Unknown operation
    BCC $8113            ; 90 06 | Branch if carry clear
    LDA #$D6             ; A9 D6 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    DEC $75              ; C6 75 | Unknown operation
    RTS                  ; 60 | Return from local function
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    LSR                  ; 4A | Unknown operation
    BCS $814F            ; B0 34 | Branch if carry set
    LDY $23E4            ; AC E4 23 | Load Y register
    CPY $23E6            ; CC E6 23 | Unknown operation
    BEQ $814F            ; F0 2C | Branch if equal (zero flag set)
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $22              ; 00 22 | Software interrupt
    ADC $C2CB,Y          ; 79 CB C2 | Unknown operation
    EOR $20              ; 52 20 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    LDA $23E6            ; AD E6 23 | Load value into accumulator
    JSL $C2CB79          ; 22 79 CB C2 | Call external function
    MVN $1F20            ; 54 20 1F | Unknown operation
    BRK $A9              ; 00 A9 | Software interrupt
    ASL $00              ; 06 00 | Arithmetic shift left
    JSL $C2CB79          ; 22 79 CB C2 | Call external function
    EOR $20              ; 53 20 | Unknown operation
    BEQ $8144            ; F0 00 | Branch if equal (zero flag set)
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C2BB7A,X        ; BF 7A BB C2 | Load value into accumulator
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    RTS                  ; 60 | Return from local function
    LDA #$40             ; A9 40 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    INC $23              ; E6 23 | Unknown operation
    LDY $23E4            ; AC E4 23 | Load Y register
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $22              ; 00 22 | Software interrupt
    ADC $C2CB,Y          ; 79 CB C2 | Unknown operation
    EOR $20              ; 52 20 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    LDA $23E4            ; AD E4 23 | Load value into accumulator
    JSL $C2CB79          ; 22 79 CB C2 | Call external function
    MVN $1F20            ; 54 20 1F | Unknown operation
    BRK $A9              ; 00 A9 | Software interrupt
    


;==============================================================================
; GeneralPurpose_008
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_008:
    PHP                  ; 08 | Push processor status to stack
    BRK $22              ; 00 22 | Software interrupt
    ADC $C2CB,Y          ; 79 CB C2 | Unknown operation
    EOR $20              ; 53 20 | Unknown operation
    BEQ $8179            ; F0 00 | Branch if equal (zero flag set)
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C2BB7A,X        ; BF 7A BB C2 | Load value into accumulator
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    RTS                  ; 60 | Return from local function
    JSL $C2C739          ; 22 39 C7 C2 | Call external function
    


;==============================================================================
; GeneralPurpose_009
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_009:
    PHP                  ; 08 | Push processor status to stack
    JSL $C2C766          ; 22 66 C7 C2 | Call external function
    BRK $22              ; 00 22 | Software interrupt
    DEC $C7              ; C6 C7 | Unknown operation
    


;==============================================================================
; GeneralPurpose_00A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00A:
    REP #$28             ; C2 28 | Clear processor status bits
    JSL $C2C7C6          ; 22 C6 C7 C2 | Call external function
    CLC                  ; 18 | Clear carry flag
    JSL $C2C7C6          ; 22 C6 C7 C2 | Call external function
    TRB $22              ; 14 22 | Unknown operation
    DEC $C7              ; C6 C7 | Unknown operation
    


;==============================================================================
; GeneralPurpose_00B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00B:
    REP #$20             ; C2 20 | Clear processor status bits
    JSL $C270E1          ; 22 E1 70 C2 | Call external function
    CMP #$02             ; C9 02 | Compare with accumulator
    BRK $B0              ; 00 B0 | Software interrupt
    ORA $40A9            ; 0D A9 40 | Logical OR with accumulator
    BRK $8D              ; 00 8D | Software interrupt
    INC $23              ; E6 23 | Unknown operation
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SBC $00              ; E7 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    LSR                  ; 4A | Unknown operation
    BCS $81C6            ; B0 07 | Branch if carry set
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SBC $00              ; E5 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$D3             ; A9 D3 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    DEC $75              ; C6 75 | Unknown operation
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    INC $00              ; E6 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA $23E4            ; AD E4 23 | Load value into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to memory
    JSL $C2BE8A          ; 22 8A BE C2 | Call external function
    ROL $07B0            ; 2E B0 07 | Unknown operation
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SBC $00              ; E1 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SBC $00              ; E3 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$05             ; A9 05 | Load value into accumulator
    BRK $22              ; 00 22 | Software interrupt
    ROL $C013,X          ; 3E 13 C0 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C28205,X        ; BF 05 82 C2 | Load value into accumulator
    STA $BE77            ; 8D 77 BE | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    BNE $8204            ; D0 00 | Branch if not equal (zero flag clear)
    RTS                  ; 60 | Return from local function
    EOR $01ED03          ; 4F 03 ED 01 | Unknown operation
    TRB $02              ; 14 02 | Unknown operation
    SBC #$02             ; E9 02 | Unknown operation
    ORA $6C02,X          ; 1D 02 6C | Logical OR with accumulator
    BRK $AD              ; 00 AD | Software interrupt
    CPX $23              ; E4 23 | Unknown operation
    STA $2428            ; 8D 28 24 | Store accumulator to memory

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

;==============================================================================
; GeneralPurpose_00C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00C:
    SEP #$02             ; E2 02 | Set processor status bits
    SBC $02              ; E3 02 | Unknown operation
    CPX $02              ; E4 02 | Unknown operation
    SBC $02              ; E5 02 | Unknown operation
    INC $02              ; E6 02 | Unknown operation
    SBC $02              ; E7 02 | Unknown operation
    INX                  ; E8 | Unknown operation
    COP $22              ; 02 22 | Unknown operation
    CMP $12              ; D1 12 | Compare with accumulator
    CPY #$4A             ; C0 4A | Unknown operation
    BCC $82D3            ; 90 07 | Branch if carry clear
    LDA $23E4            ; AD E4 23 | Load value into accumulator
    STA $23E6            ; 8D E6 23 | Store accumulator to memory
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    LDA #$9C             ; A9 9C | Load value into accumulator
    BRK $48              ; 00 48 | Software interrupt
    JSR $82C5            ; 20 C5 82 | Call local function
    BCC $82E2            ; 90 05 | Branch if carry clear
    LDA #$9D             ; A9 9D | Load value into accumulator
    BRK $83              ; 00 83 | Software interrupt
    ORA $AD              ; 01 AD | Logical OR with accumulator
    INC $23              ; E6 23 | Unknown operation
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    JSL $C1AE9F          ; 22 9F AE C1 | Call external function
    RTS                  ; 60 | Return from local function
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    AND #$07             ; 29 07 | Logical AND with accumulator
    BRK $D0              ; 00 D0 | Software interrupt
    PHD                  ; 0B | Unknown operation
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    STX $00,Y            ; 96 00 | Store X register
    JSL $C1AE9F          ; 22 9F AE C1 | Call external function
    RTS                  ; 60 | Return from local function
    LDA #$40             ; A9 40 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    INC $23              ; E6 23 | Unknown operation
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    STA $00              ; 97 00 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    ROR $00,X            ; 76 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    PLY                  ; 7A | Pull Y register from stack
    BRK $60              ; 00 60 | Software interrupt
    JSL $C1A867          ; 22 67 A8 C1 | Call external function

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

;==============================================================================
; GeneralPurpose_00D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00D:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_00E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00E:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_00F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00F:
    PHB                  ; 8B | Push data bank register
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDX #$16             ; A2 16 | Load X register
    BRK $A9              ; 00 A9 | Software interrupt
    SBC $3E9DFF,X        ; FF FF 9D 3E | Unknown operation
    BIT $CA              ; 24 CA | Unknown operation
    DEX                  ; CA | Unknown operation
    BPL $8387            ; 10 F9 | Unknown operation
    STZ $00              ; 64 00 | Unknown operation
    STZ $2426            ; 9C 26 24 | Unknown operation
    JSR $83D2            ; 20 D2 83 | Call local function
    INC $2426            ; EE 26 24 | Unknown operation
    LDA $2426            ; AD 26 24 | Load value into accumulator
    CMP #$04             ; C9 04 | Compare with accumulator
    BRK $90              ; 00 90 | Software interrupt
    SBC $A9              ; F2 A9 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    STA $2426            ; 8D 26 24 | Store accumulator to memory
    JSR $83D2            ; 20 D2 83 | Call local function
    JSL $C2B9A6          ; 22 A6 B9 C2 | Call external function
    TAX                  ; AA | Transfer accumulator to X
    LDY #$00             ; A0 00 | Load Y register
    BRK $CA              ; 00 CA | Software interrupt
    BMI $83CA            ; 30 15 | Unknown operation
    PHX                  ; DA | Push X register to stack
    JSL $C2AF66          ; 22 66 AF C2 | Call external function
    TXA                  ; 8A | Transfer X to accumulator
    LDX $00              ; A6 00 | Load X register
    


;==============================================================================
; GeneralPurpose_010
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_010:
    SEP #$20             ; E2 20 | Set processor status bits
    STA $243E,X          ; 9D 3E 24 | Store accumulator to memory
    


;==============================================================================
; GeneralPurpose_011
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_011:
    REP #$20             ; C2 20 | Clear processor status bits
    PLX                  ; FA | Pull X register from stack
    INC $00              ; E6 00 | Unknown operation
    INY                  ; C8 | Unknown operation
    BRA $83B2            ; 80 E8 | Unknown operation
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_012
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_012:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from external function
    LDX $00              ; A6 00 | Load X register
    LDY #$00             ; A0 00 | Load Y register
    BRK $22              ; 00 22 | Software interrupt
    AND $CB              ; 32 CB | Logical AND with accumulator
    


;==============================================================================
; GeneralPurpose_013
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_013:
    REP #$50             ; C2 50 | Clear processor status bits
    JSR $0002            ; 20 02 00 | Call local function
    BEQ $83F7            ; F0 16 | Branch if equal (zero flag set)
    JSL $C2CAE0          ; 22 E0 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $CD              ; 00 CD | Software interrupt
    ROL $24              ; 26 24 | Unknown operation
    BNE $83F7            ; D0 09 | Branch if not equal (zero flag clear)
    TYA                  ; 98 | Unknown operation
    


;==============================================================================
; GeneralPurpose_014
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_014:
    SEP #$20             ; E2 20 | Set processor status bits
    STA $243E,X          ; 9D 3E 24 | Store accumulator to memory
    


;==============================================================================
; GeneralPurpose_015
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_015:
    REP #$20             ; C2 20 | Clear processor status bits
    INX                  ; E8 | Unknown operation
    INY                  ; C8 | Unknown operation
    CPY #$18             ; C0 18 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    PHX                  ; DA | Push X register to stack
    STX $00              ; 86 00 | Store X register
    RTS                  ; 60 | Return from local function
    


;==============================================================================
; GeneralPurpose_016
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_016:
    LDA $243E,Y          ; B9 3E 24 | Load value into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator
    BRK $C9              ; 00 C9 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    BRK $B0              ; 00 B0 | Software interrupt
    ORA $E88D,Y          ; 19 8D E8 | Logical OR with accumulator
    AND $22              ; 23 22 | Logical AND with accumulator
    TSB $CA              ; 04 CA | Unknown operation
    


;==============================================================================
; GeneralPurpose_017
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_017:
    REP #$A5             ; C2 A5 | Clear processor status bits
    BRK $2D              ; 00 2D | Software interrupt
    NOP                  ; EA | Unknown operation
    AND $85              ; 23 85 | Logical AND with accumulator
    BRK $A5              ; 00 A5 | Software interrupt
    COP $2D              ; 02 2D | Unknown operation
    CPX $0523            ; EC 23 05 | Unknown operation
    BRK $F0              ; 00 F0 | Software interrupt
    COP $18              ; 02 18 | Unknown operation
    RTS                  ; 60 | Return from local function
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    PHY                  ; 5A | Push Y register to stack
    LDX $23EE            ; AE EE 23 | Load X register
    LDY $23E8            ; AC E8 23 | Load Y register
    STY $2428            ; 8C 28 24 | Store Y register
    JSL $C2CB32          ; 22 32 CB C2 | Call external function
    BVC $8456            ; 50 20 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    BEQ $8464            ; F0 2A | Branch if equal (zero flag set)
    JSR $84DE            ; 20 DE 84 | Call local function
    BCS $8464            ; B0 25 | Branch if carry set
    JSR $8467            ; 20 67 84 | Call local function
    BCS $8464            ; B0 20 | Branch if carry set
    JSR $84BB            ; 20 BB 84 | Call local function
    JSR $848A            ; 20 8A 84 | Call local function
    JSR $8475            ; 20 75 84 | Call local function
    JSR $857E            ; 20 7E 85 | Call local function
    BCS $8464            ; B0 12 | Branch if carry set
    JSR $85C5            ; 20 C5 85 | Call local function
    BCS $8430            ; B0 D9 | Branch if carry set
    JSR $8690            ; 20 90 86 | Call local function
    BCS $8464            ; B0 08 | Branch if carry set
    JSR $84F2            ; 20 F2 84 | Call local function
    BCS $8464            ; B0 03 | Branch if carry set
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from local function
    PLY                  ; 7A | Pull Y register from stack
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    CPX #$CA             ; E0 CA | Unknown operation
    BRK $F0              ; 00 F0 | Software interrupt
    COP $18              ; 02 18 | Unknown operation
    RTS                  ; 60 | Return from local function
    CPY $23E4            ; CC E4 23 | Unknown operation
    BNE $846C            ; D0 F9 | Branch if not equal (zero flag clear)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function

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

;==============================================================================
; GeneralPurpose_018
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_018:
    PHP                  ; 08 | Push processor status to stack
    BRK $F4              ; 00 F4 | Software interrupt
    BRK $7E              ; 00 7E | Software interrupt
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    RTS                  ; 60 | Return from local function
    PEA $23AD            ; F4 AD 23 | Push effective address
    PEA $0002            ; F4 02 00 | Push effective address
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C9029E          ; 22 9E 02 C9 | Call external function
    BNE $84DD            ; D0 13 | Branch if not equal (zero flag clear)
    INC $23DA            ; EE DA 23 | Unknown operation
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $F4              ; 00 F4 | Software interrupt
    LDA $F423            ; AD 23 F4 | Load value into accumulator
    COP $00              ; 02 00 | Unknown operation
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    RTS                  ; 60 | Return from local function
    JSL $C2CC25          ; 22 25 CC C2 | Call external function
    TDC                  ; 7B | Unknown operation
    CLC                  ; 18 | Clear carry flag
    CPY #$00             ; C0 00 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    BRK $18              ; 00 18 | Software interrupt
    BNE $84F1            ; D0 05 | Branch if not equal (zero flag clear)
    JSL $C2BE8A          ; 22 8A BE C2 | Call external function
    TRB $5A60            ; 1C 60 5A | Unknown operation
    LDY $23E4            ; AC E4 23 | Load Y register
    JSR $8525            ; 20 25 85 | Call local function
    BCC $8503            ; 90 08 | Branch if carry clear
    JSR $854B            ; 20 4B 85 | Call local function
    BCC $8503            ; 90 03 | Branch if carry clear
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from local function
    PLY                  ; 7A | Pull Y register from stack
    JSL $C2B6D9          ; 22 D9 B6 C2 | Call external function
    LDA #$0E             ; A9 0E | Load value into accumulator
    BRK $48              ; 00 48 | Software interrupt
    JSL $C2CAE0          ; 22 E0 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    TSB $00              ; 04 00 | Unknown operation
    BCS $851E            ; B0 05 | Branch if carry set
    LDA #$0D             ; A9 0D | Load value into accumulator
    BRK $83              ; 00 83 | Software interrupt
    ORA $68              ; 01 68 | Logical OR with accumulator
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    SEC                  ; 38 | Set carry flag

    SEC                  ; 38
    RTS                  ; 60
    LDA $23F2            ; AD F2 23
    BNE $8549            ; D0 1F
    JSL $C2CC47          ; 22 47 CC C2
    ADC $0218,Y          ; 79 18 02
    BRK $F0              ; 00 F0
    ORA $22,X            ; 15 22
    AND $CB              ; 32 CB

;==============================================================================
; GeneralPurpose_019
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_019:
    REP #$51             ; C2 51 | Clear processor status bits
    JSR $0004            ; 20 04 00 | Call local function
    BEQ $8549            ; F0 0B | Branch if equal (zero flag set)
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    AND #$01             ; 29 01 | Logical AND with accumulator
    BRK $D0              ; 00 D0 | Software interrupt
    COP $18              ; 02 18 | Unknown operation
    RTS                  ; 60 | Return from local function
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    LDA $23F2            ; AD F2 23 | Load value into accumulator
    BNE $857C            ; D0 2C | Branch if not equal (zero flag clear)
    JSL $C2CC47          ; 22 47 CC C2 | Call external function
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    


;==============================================================================
; GeneralPurpose_01A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01A:
    PHP                  ; 08 | Push processor status to stack
    BRK $F0              ; 00 F0 | Software interrupt
    JSL $2428AD          ; 22 AD 28 24 | Call external function
    PHA                  ; 48 | Push accumulator to stack
    STY $2428            ; 8C 28 24 | Store Y register
    LDA #$10             ; A9 10 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    BIT $2224            ; 2C 24 22 | Unknown operation
    PLY                  ; 7A | Pull Y register from stack
    CLV                  ; B8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_01B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01B:
    REP #$68             ; C2 68 | Clear processor status bits
    STA $2428            ; 8D 28 24 | Store accumulator to memory
    BVC $857C            ; 50 0B | Unknown operation
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    AND #$07             ; 29 07 | Logical AND with accumulator
    BRK $D0              ; 00 D0 | Software interrupt
    COP $18              ; 02 18 | Unknown operation
    RTS                  ; 60 | Return from local function
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    JSL $C2CC47          ; 22 47 CC C2 | Call external function
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag
    TSB $00              ; 04 00 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    BEQ $85C4            ; F0 3B | Branch if equal (zero flag set)
    JSL $C2BE8A          ; 22 8A BE C2 | Call external function
    JSR $3490            ; 20 90 34 | Call local function
    PEA $23AE            ; F4 AE 23 | Push effective address
    PEA $0008            ; F4 08 00 | Push effective address
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C9029E          ; 22 9E 02 C9 | Call external function
    BNE $85C3            ; D0 24 | Branch if not equal (zero flag clear)
    LDA $23E8            ; AD E8 23 | Load value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E6            ; AD E6 23 | Load value into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    ROR $6800            ; 6E 00 68 | Unknown operation
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $F4              ; 00 F4 | Software interrupt
    LDX $F423            ; AE 23 F4 | Load X register
    


;==============================================================================
; GeneralPurpose_01C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01C:
    PHP                  ; 08 | Push processor status to stack
    BRK $F4              ; 00 F4 | Software interrupt
    BRK $7E              ; 00 7E | Software interrupt
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    PEA $23AD            ; F4 AD 23 | Push effective address
    PEA $0004            ; F4 04 00 | Push effective address
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C9029E          ; 22 9E 02 C9 | Call external function
    CLC                  ; 18 | Clear carry flag
    BNE $8604            ; D0 2F | Branch if not equal (zero flag clear)
    JSL $C2BE8A          ; 22 8A BE C2 | Call external function
    BRK $8D              ; 00 8D | Software interrupt
    JMP ($2024,X)        ; 7C 24 20 | Unknown operation
    EOR $9086,Y          ; 59 86 90 | Unknown operation
    JSL $867B20          ; 22 20 7B 86 | Call external function
    BCC $8604            ; 90 1D | Branch if carry clear
    JSR $8605            ; 20 05 86 | Call local function
    LDY $23E4            ; AC E4 23 | Load Y register
    STY $2428            ; 8C 28 24 | Store Y register
    STY $23E8            ; 8C E8 23 | Store Y register
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $F4              ; 00 F4 | Software interrupt
    LDA $F423            ; AD 23 F4 | Load value into accumulator
    TSB $00              ; 04 00 | Unknown operation
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    PHX                  ; DA | Push X register to stack
    JSL $C2CAE0          ; 22 E0 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    ORA $00              ; 05 00 | Logical OR with accumulator
    BCC $861B            ; 90 08 | Branch if carry clear
    JSL $C1E32E          ; 22 2E E3 C1 | Call external function
    ADC $00              ; 71 00 | Unknown operation
    BRA $863C            ; 80 21 | Unknown operation
    LDX #$43             ; A2 43 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    ORA $CC              ; 03 CC | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_01D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01D:
    REP #$6C             ; C2 6C | Clear processor status bits
    CLC                  ; 18 | Clear carry flag
    STA $4F4C            ; 8D 4C 4F | Store accumulator to memory
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    LSR $224F            ; 4E 4F 22 | Unknown operation
    CPX #$CA             ; E0 CA | Unknown operation
    


;==============================================================================
; GeneralPurpose_01E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01E:
    REP #$3A             ; C2 3A | Clear processor status bits
    JSR $00FF            ; 20 FF 00 | Call local function
    STA $4F50            ; 8D 50 4F | Store accumulator to memory
    JSL $C48D49          ; 22 49 8D C4 | Call external function
    LDA #$55             ; A9 55 | Load value into accumulator
    BRK $48              ; 00 48 | Software interrupt
    JSL $C2CAE0          ; 22 E0 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    TSB $00              ; 04 00 | Unknown operation
    BCC $8652            ; 90 05 | Branch if carry clear
    LDA #$56             ; A9 56 | Load value into accumulator
    BRK $83              ; 00 83 | Software interrupt
    ORA $68              ; 01 68 | Logical OR with accumulator
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from local function
    CPX #$1A             ; E0 1A | Unknown operation
    BRK $F0              ; 00 F0 | Software interrupt
    TSB $4722            ; 0C 22 47 | Unknown operation
    CPY $78C2            ; CC C2 78 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    BRA $8666            ; 80 00 | Unknown operation
    BNE $8679            ; D0 11 | Branch if not equal (zero flag clear)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from local function
    PEA $23AD            ; F4 AD 23 | Push effective address
    PEA $0040            ; F4 40 00 | Push effective address
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C9029E          ; 22 9E 02 C9 | Call external function
    BEQ $8668            ; F0 EF | Branch if equal (zero flag set)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    PHX                  ; DA | Push X register to stack
    JSL $C2CB32          ; 22 32 CB C2 | Call external function
    EOR $20              ; 51 20 | Unknown operation
    BPL $8684            ; 10 00 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    BEQ $868E            ; F0 07 | Branch if equal (zero flag set)
    CPY $23E4            ; CC E4 23 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    BEQ $868E            ; F0 01 | Branch if equal (zero flag set)
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from local function
    LDA $23F2            ; AD F2 23 | Load value into accumulator
    BNE $86CD            ; D0 38 | Branch if not equal (zero flag clear)
    JSL $C2CC47          ; 22 47 CC C2 | Call external function
    ADC $1018,Y          ; 79 18 10 | Unknown operation

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

;==============================================================================
; GeneralPurpose_01F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01F:
    REP #$3C             ; C2 3C | Clear processor status bits
    JSR $00FF            ; 20 FF 00 | Call local function
    CMP #$04             ; C9 04 | Compare with accumulator
    BRK $A9              ; 00 A9 | Software interrupt
    AND $03B000,X        ; 3F 00 B0 03 | Logical AND with accumulator
    LDA #$2F             ; A9 2F | Load value into accumulator
    BRK $22              ; 00 22 | Software interrupt
    ROL $C013,X          ; 3E 13 C0 | Unknown operation
    CMP $01              ; C3 01 | Compare with accumulator
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from local function
    PHX                  ; DA | Push X register to stack
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $22              ; 00 22 | Software interrupt
    TAX                  ; AA | Transfer accumulator to X
    CLV                  ; B8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_020
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_020:
    REP #$AD             ; C2 AD | Clear processor status bits
    BIT $A224            ; 2C 24 A2 | Unknown operation
    


;==============================================================================
; GeneralPurpose_021
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_021:
    PHP                  ; 08 | Push processor status to stack
    BRK $DF              ; 00 DF | Software interrupt
    BIT #$87             ; 89 87 | Unknown operation
    


;==============================================================================
; GeneralPurpose_022
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_022:
    REP #$F0             ; C2 F0 | Clear processor status bits
    


;==============================================================================
; GeneralPurpose_023
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_023:
    PHP                  ; 08 | Push processor status to stack
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    BPL $876D            ; 10 F4 | Unknown operation
    BRA $8786            ; 80 0B | Unknown operation
    LDA $C2878B,X        ; BF 8B 87 C2 | Load value into accumulator
    JSL $C0133E          ; 22 3E 13 C0 | Call external function
    CLC                  ; 18 | Clear carry flag
    BEQ $8787            ; F0 01 | Branch if equal (zero flag set)
    SEC                  ; 38 | Set carry flag
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from local function
    MVP $0700            ; 44 00 07 | Unknown operation
    BRK $64              ; 00 64 | Software interrupt
    BRK $07              ; 00 07 | Software interrupt
    BRK $61              ; 00 61 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $AE              ; 00 AE | Software interrupt
    INX                  ; E8 | Unknown operation
    AND $22              ; 23 22 | Logical AND with accumulator
    CMP $C2CA,Y          ; D9 CA C2 | Compare with accumulator
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    TSB $00              ; 04 00 | Unknown operation
    BCS $87AF            ; B0 0A | Branch if carry set
    LDA $23AE            ; AD AE 23 | Load value into accumulator
    AND #$7F             ; 29 7F | Logical AND with accumulator
    SBC $23AE8D,X        ; FF 8D AE 23 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA $23AE            ; AD AE 23 | Load value into accumulator
    ORA #$80             ; 09 80 | Logical OR with accumulator
    BRK $8D              ; 00 8D | Software interrupt
    LDX $6023            ; AE 23 60 | Load X register
    PHY                  ; 5A | Push Y register to stack
    PEA $2011            ; F4 11 20 | Push effective address
    PEA $0020            ; F4 20 00 | Push effective address
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C9029E          ; 22 9E 02 C9 | Call external function
    CLC                  ; 18 | Clear carry flag
    BNE $8831            ; D0 67 | Branch if not equal (zero flag clear)
    LDA $23F2            ; AD F2 23 | Load value into accumulator
    CLC                  ; 18 | Clear carry flag
    BNE $8831            ; D0 61 | Branch if not equal (zero flag clear)
    LDX $23EE            ; AE EE 23 | Load X register
    JSL $C2CC47          ; 22 47 CC C2 | Call external function
    PLY                  ; 7A | Pull Y register from stack
    CLC                  ; 18 | Clear carry flag

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

;==============================================================================
; GeneralPurpose_024
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_024:
    REP #$AD             ; C2 AD | Clear processor status bits
    BIT $C924            ; 2C 24 C9 | Unknown operation
    ORA #$00             ; 09 00 | Logical OR with accumulator
    BEQ $87F9            ; F0 06 | Branch if equal (zero flag set)
    CMP #$31             ; C9 31 | Compare with accumulator
    BRK $18              ; 00 18 | Software interrupt
    BNE $8831            ; D0 38 | Branch if not equal (zero flag clear)
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    AND #$0F             ; 29 0F | Logical AND with accumulator
    BRK $18              ; 00 18 | Software interrupt
    BNE $8831            ; D0 2E | Branch if not equal (zero flag clear)
    LDA $23E8            ; AD E8 23 | Load value into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to memory
    LDA #$FF             ; A9 FF | Load value into accumulator
    SBC $220085,X        ; FF 85 00 22 | Unknown operation
    TXA                  ; 8A | Transfer X to accumulator
    LDX $06C2,Y          ; BE C2 06 | Load X register
    JSL $C2B977          ; 22 77 B9 C2 | Call external function
    LDA $23EE            ; AD EE 23 | Load value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA #$18             ; A9 18 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    INC $2223            ; EE 23 22 | Unknown operation
    DEC $C2CF            ; CE CF C2 | Unknown operation
    PLA                  ; 68 | Pull accumulator from stack
    STA $23EE            ; 8D EE 23 | Store accumulator to memory
    JSR $8833            ; 20 33 88 | Call local function
    JSL $C2B054          ; 22 54 B0 C2 | Call external function
    SEC                  ; 38 | Set carry flag
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from local function
    LDA $242C            ; AD 2C 24 | Load value into accumulator
    STA $BE79            ; 8D 79 BE | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    BVC $8840            ; 50 01 | Unknown operation
    LDA #$51             ; A9 51 | Load value into accumulator
    ORA $48              ; 01 48 | Logical OR with accumulator
    LDX $23E8            ; AE E8 23 | Load X register
    JSL $C2CAD9          ; 22 D9 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    TSB $00              ; 04 00 | Unknown operation
    BCC $8858            ; 90 05 | Branch if carry clear
    LDA #$52             ; A9 52 | Load value into accumulator
    ORA $83              ; 01 83 | Logical OR with accumulator
    ORA $68              ; 01 68 | Logical OR with accumulator
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    RTS                  ; 60 | Return from local function
    PHY                  ; 5A | Push Y register to stack

    PHY                  ; 5A

;==============================================================================
; GeneralPurpose_025
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_025:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA #$C2             ; A9 C2 | Load value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    


;==============================================================================
; GeneralPurpose_026
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_026:
    REP #$20             ; C2 20 | Clear processor status bits
    LDA #$8E             ; A9 8E | Load value into accumulator
    DEY                  ; 88 | Unknown operation
    DEC                  ; 3A | Unknown operation
    PHA                  ; 48 | Push accumulator to stack
    LDX $23EE            ; AE EE 23 | Load X register
    


;==============================================================================
; GeneralPurpose_027
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_027:
    SEP #$20             ; E2 20 | Set processor status bits
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $1D              ; 00 1D | Software interrupt
    BRK $60              ; 00 60 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    


;==============================================================================
; GeneralPurpose_028
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_028:
    REP #$08             ; C2 08 | Clear processor status bits
    BRK $48              ; 00 48 | Software interrupt
    


;==============================================================================
; GeneralPurpose_029
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_029:
    REP #$20             ; C2 20 | Clear processor status bits
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $1D              ; 00 1D | Software interrupt
    BRK $60              ; 00 60 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    


;==============================================================================
; GeneralPurpose_02A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02A:
    REP #$06             ; C2 06 | Clear processor status bits
    BRK $3A              ; 00 3A | Software interrupt
    PHA                  ; 48 | Push accumulator to stack
    RTL                  ; 6B | Return from external function
    BCC $88B1            ; 90 21 | Branch if carry clear
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $F4              ; 00 F4 | Software interrupt
    LDA $F423            ; AD 23 F4 | Load value into accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    PEA $23AE            ; F4 AE 23 | Push effective address
    PEA $0002            ; F4 02 00 | Push effective address
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    JSL $C2CF00          ; 22 00 CF C2 | Call external function
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from local function
    LDA $2458            ; AD 58 24 | Load value into accumulator
    STA $00              ; 85 00 | Store accumulator to memory
    LDA $245A            ; AD 5A 24 | Load value into accumulator
    STA $02              ; 85 02 | Store accumulator to memory
    LDA $23E8            ; AD E8 23 | Load value into accumulator
    JSL $C2CA46          ; 22 46 CA C2 | Call external function
    LDA $00              ; A5 00 | Load value into accumulator
    STA $2458            ; 8D 58 24 | Store accumulator to memory
    LDA $02              ; A5 02 | Load value into accumulator
    STA $245A            ; 8D 5A 24 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    PHY                  ; 5A | Push Y register to stack
    LDA $23FA            ; AD FA 23 | Load value into accumulator
    BEQ $88FC            ; F0 27 | Branch if equal (zero flag set)
    LDY $23E8            ; AC E8 23 | Load Y register
    STY $2428            ; 8C 28 24 | Store Y register
    JSL $C2CB32          ; 22 32 CB C2 | Call external function
    BVC $8901            ; 50 20 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    BEQ $88FC            ; F0 17 | Branch if equal (zero flag set)
    JSL $C2BE8A          ; 22 8A BE C2 | Call external function
    TRB $10B0            ; 1C B0 10 | Unknown operation
    LDX #$04             ; A2 04 | Load X register
    BRK $AD              ; 00 AD | Software interrupt
    INC $DF23            ; EE 23 DF | Unknown operation
    ORA $89              ; 03 89 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_02B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02B:
    REP #$F0             ; C2 F0 | Clear processor status bits
    ASL $CA              ; 06 CA | Arithmetic shift left
    DEX                  ; CA | Unknown operation
    BPL $88F2            ; 10 F6 | Unknown operation
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from local function
    JSR ($8909,X)        ; FC 09 89 | Call local function
    PLY                  ; 7A | Pull Y register from stack
    RTS                  ; 60 | Return from local function
    ORA $00              ; 03 00 | Logical OR with accumulator
    TSB $00              ; 04 00 | Unknown operation
    ORA $00              ; 05 00 | Logical OR with accumulator
    ORA $893E89          ; 0F 89 3E 89 | Logical OR with accumulator
    LSR $89,X            ; 56 89 | Unknown operation
    JSL $C2A406          ; 22 06 A4 C2 | Call external function
    BCC $893D            ; 90 28 | Branch if carry clear
    JSL $C2B5D8          ; 22 D8 B5 C2 | Call external function
    BCS $893D            ; B0 22 | Branch if carry set
    JSL $C2B977          ; 22 77 B9 C2 | Call external function
    LDA #$41             ; A9 41 | Load value into accumulator
    BRK $48              ; 00 48 | Software interrupt
    LDY $23E8            ; AC E8 23 | Load Y register
    JSL $C2CAE0          ; 22 E0 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    TSB $00              ; 04 00 | Unknown operation
    BCS $8938            ; B0 05 | Branch if carry set
    LDA #$40             ; A9 40 | Load value into accumulator
    BRK $83              ; 00 83 | Software interrupt
    ORA $68              ; 01 68 | Logical OR with accumulator
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    RTS                  ; 60 | Return from local function
    JSL $C2A406          ; 22 06 A4 C2 | Call external function
    BCC $8955            ; 90 11 | Branch if carry clear
    JSL $C2BE8A          ; 22 8A BE C2 | Call external function
    TRB $B0              ; 14 B0 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    JSL $C2B977          ; 22 77 B9 C2 | Call external function
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    JMP $6000            ; 4C 00 60 | Unknown operation
    JSL $C2A406          ; 22 06 A4 C2 | Call external function
    BCC $896C            ; 90 10 | Branch if carry clear
    JSL $C2B561          ; 22 61 B5 C2 | Call external function
    BCS $896C            ; B0 0A | Branch if carry set
    JSL $C2B977          ; 22 77 B9 C2 | Call external function
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    EOR #$00             ; 49 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA $23F2            ; AD F2 23 | Load value into accumulator

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

;==============================================================================
; GeneralPurpose_02C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02C:
    REP #$50             ; C2 50 | Clear processor status bits
    JSL $23FAAD          ; 22 AD FA 23 | Call external function
    BEQ $89C4            ; F0 1D | Branch if equal (zero flag set)
    PHA                  ; 48 | Push accumulator to stack
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    INC                  ; 1A | Unknown operation
    STA $23FA            ; 8D FA 23 | Store accumulator to memory
    LDA $23E8            ; AD E8 23 | Load value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E4            ; AD E4 23 | Load value into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    JSL $C29200          ; 22 00 92 C2 | Call external function
    PLA                  ; 68 | Pull accumulator from stack
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    STA $23FA            ; 8D FA 23 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    LDA $23F2            ; AD F2 23 | Load value into accumulator
    BNE $8A2B            ; D0 61 | Branch if not equal (zero flag clear)
    LDX $23EE            ; AE EE 23 | Load X register
    JSL $C2CC47          ; 22 47 CC C2 | Call external function
    ADC $0818,Y          ; 79 18 08 | Unknown operation
    BRK $F0              ; 00 F0 | Software interrupt
    MVN $E4AE            ; 54 AE E4 | Unknown operation
    AND $8E              ; 23 8E | Logical AND with accumulator
    PLP                  ; 28 | Pull processor status from stack
    BIT $22              ; 24 22 | Unknown operation
    PLD                  ; 2B | Unknown operation
    WAI                  ; CB | Unknown operation
    


;==============================================================================
; GeneralPurpose_02D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02D:
    REP #$50             ; C2 50 | Clear processor status bits
    JSR $0002            ; 20 02 00 | Call local function
    BEQ $8A2B            ; F0 44 | Branch if equal (zero flag set)
    JSL $C2BE8A          ; 22 8A BE C2 | Call external function
    TRB $3DB0            ; 1C B0 3D | Unknown operation
    LDX $23E8            ; AE E8 23 | Load X register
    STX $2428            ; 8E 28 24 | Store X register
    JSL $C2CB2B          ; 22 2B CB C2 | Call external function
    BVC $8A1A            ; 50 20 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    BEQ $8A2B            ; F0 2D | Branch if equal (zero flag set)
    LDA #$53             ; A9 53 | Load value into accumulator
    


;==============================================================================
; GeneralPurpose_02E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02E:
    BRK $8D              ; 00 8D | Software interrupt
    BIT $2224            ; 2C 24 22 | Unknown operation
    PLY                  ; 7A | Pull Y register from stack
    CLV                  ; B8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_02F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02F:
    REP #$50             ; C2 50 | Clear processor status bits
    AND $AD              ; 21 AD | Logical AND with accumulator
    PLX                  ; FA | Pull X register from stack
    AND $F0              ; 23 F0 | Logical AND with accumulator
    TRB $4A48            ; 1C 48 4A | Unknown operation
    INC                  ; 1A | Unknown operation
    STA $23FA            ; 8D FA 23 | Store accumulator to memory
    LDA $23E8            ; AD E8 23 | Load value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $23E4            ; AD E4 23 | Load value into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    JSL $C29200          ; 22 00 92 C2 | Call external function
    PLA                  ; 68 | Pull accumulator from stack
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    STA $23FA            ; 8D FA 23 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    LDA $23F2            ; AD F2 23 | Load value into accumulator
    BNE $8A95            ; D0 64 | Branch if not equal (zero flag clear)
    LDA $23FA            ; AD FA 23 | Load value into accumulator
    BEQ $8A95            ; F0 5F | Branch if equal (zero flag set)
    LDX $23EE            ; AE EE 23 | Load X register
    JSL $C2CC47          ; 22 47 CC C2 | Call external function
    ADC $0818,Y          ; 79 18 08 | Unknown operation
    BRK $F0              ; 00 F0 | Software interrupt
    EOR $AE              ; 52 AE | Unknown operation
    INX                  ; E8 | Unknown operation
    AND $8E              ; 23 8E | Logical AND with accumulator
    PLP                  ; 28 | Pull processor status from stack
    BIT $22              ; 24 22 | Unknown operation
    PLD                  ; 2B | Unknown operation
    WAI                  ; CB | Unknown operation
    


;==============================================================================
; GeneralPurpose_030
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_030:
    REP #$50             ; C2 50 | Clear processor status bits
    JSR $0002            ; 20 02 00 | Call local function
    BEQ $8A95            ; F0 42 | Branch if equal (zero flag set)
    LDA #$69             ; A9 69 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    BIT $2224            ; 2C 24 22 | Unknown operation
    PLY                  ; 7A | Pull Y register from stack
    CLV                  ; B8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_031
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_031:
    REP #$50             ; C2 50 | Clear processor status bits
    ROL $AD,X            ; 36 AD | Unknown operation
    INX                  ; E8 | Unknown operation
    AND $48              ; 23 48 | Logical AND with accumulator
    JSL $C2CAD9          ; 22 D9 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    TSB $00              ; 04 00 | Unknown operation
    BCS $8A77            ; B0 07 | Branch if carry set
    JSL $C2C739          ; 22 39 C7 C2 | Call external function
    ASL $80              ; 06 80 | Arithmetic shift left
    ORA $22              ; 05 22 | Logical OR with accumulator
    AND $C2C7,Y          ; 39 C7 C2 | Logical AND with accumulator
    


;==============================================================================
; GeneralPurpose_032
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_032:
    PHP                  ; 08 | Push processor status to stack
    JSL $C2C766          ; 22 66 C7 C2 | Call external function
    BRK $A2              ; 00 A2 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    JSL $C01407          ; 22 07 14 C0 | Call external function
    BCC $8A91            ; 90 07 | Branch if carry clear
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    JSL $C29200          ; 22 00 92 C2 | Call external function
    PLA                  ; 68 | Pull accumulator from stack
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    LDX #$24             ; A2 24 | Load X register
    BRK $AD              ; 00 AD | Software interrupt
    INC $DF23            ; EE 23 DF | Unknown operation
    PLB                  ; AB | Pull data bank register
    TXA                  ; 8A | Transfer X to accumulator
    


;==============================================================================
; GeneralPurpose_033
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_033:
    REP #$F0             ; C2 F0 | Clear processor status bits
    ORA $CA              ; 05 CA | Logical OR with accumulator
    DEX                  ; CA | Unknown operation
    BPL $8A9C            ; 10 F6 | Unknown operation
    RTS                  ; 60 | Return from local function
    JSR ($8AD1,X)        ; FC D1 8A | Call local function
    RTS                  ; 60 | Return from local function
    INC                  ; 1A | Unknown operation
    BRK $42              ; 00 42 | Software interrupt
    BRK $44              ; 00 44 | Software interrupt
    BRK $4A              ; 00 4A | Software interrupt
    BRK $4B              ; 00 4B | Software interrupt
    BRK $4D              ; 00 4D | Software interrupt
    BRK $86              ; 00 86 | Software interrupt
    BRK $54              ; 00 54 | Software interrupt
    BRK $60              ; 00 60 | Software interrupt
    BRK $61              ; 00 61 | Software interrupt
    BRK $62              ; 00 62 | Software interrupt
    BRK $63              ; 00 63 | Software interrupt
    BRK $64              ; 00 64 | Software interrupt
    BRK $65              ; 00 65 | Software interrupt
    BRK $67              ; 00 67 | Software interrupt
    BRK $6B              ; 00 6B | Software interrupt
    BRK $50              ; 00 50 | Software interrupt
    BRK $51              ; 00 51 | Software interrupt
    BRK $34              ; 00 34 | Software interrupt
    BRK $6A              ; 00 6A | Software interrupt
    


;==============================================================================
; GeneralPurpose_034
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_034:
    PHB                  ; 8B | Push data bank register
    LDA $8B              ; A7 8B | Load value into accumulator
    DEX                  ; CA | Unknown operation
    


;==============================================================================
; GeneralPurpose_035
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_035:
    PHB                  ; 8B | Push data bank register
    CMP $8B              ; D7 8B | Compare with accumulator
    INC $158B,X          ; FE 8B 15 | Unknown operation
    STY $8AF7            ; 8C F7 8A | Store Y register
    JSL $8CA38C          ; 22 8C A3 8C | Call external function
    SBC $8C              ; F1 8C | Unknown operation
    SED                  ; F8 | Unknown operation
    STY $8CFF            ; 8C FF 8C | Store Y register
    ASL $8D              ; 06 8D | Arithmetic shift left
    ORA $4D8D            ; 0D 8D 4D | Logical OR with accumulator
    STA $8D71            ; 8D 71 8D | Store accumulator to memory
    EOR $478B,X          ; 5D 8B 47 | Unknown operation
    


;==============================================================================
; GeneralPurpose_036
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_036:
    PHB                  ; 8B | Push data bank register
    SBC $8A              ; F7 8A | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRK $F4              ; 00 F4 | Software interrupt
    ORA $20              ; 11 20 | Logical OR with accumulator
    PEA $0080            ; F4 80 00 | Push effective address
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C9029E          ; 22 9E 02 C9 | Call external function
    BNE $8B38            ; D0 2F | Branch if not equal (zero flag clear)
    JSL $C1D13B          ; 22 3B D1 C1 | Call external function
    BNE $8B36            ; D0 27 | Branch if not equal (zero flag clear)
    LDA #$08             ; A9 08 | Load value into accumulator
    BRK $F4              ; 00 F4 | Software interrupt
    PLB                  ; AB | Pull data bank register
    AND $F4              ; 23 F4 | Logical AND with accumulator
    ORA $00F400          ; 0F 00 F4 00 | Logical OR with accumulator
    ROR $E922,X          ; 7E 22 E9 | Unknown operation
    COP $C9              ; 02 C9 | Unknown operation
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $F4              ; 00 F4 | Software interrupt
    LDX $F423            ; AE 23 F4 | Load X register
    COP $00              ; 02 00 | Unknown operation
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    JSL $C1E32E          ; 22 2E E3 C1 | Call external function
    MVN $6000            ; 54 00 60 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C28B41,X        ; BF 41 8B C2 | Load value into accumulator
    JSL $C1A87A          ; 22 7A A8 C1 | Call external function
    RTS                  ; 60 | Return from local function
    EOR $01              ; 41 01 | Unknown operation
    EOR $00              ; 57 00 | Unknown operation
    CLI                  ; 58 | Unknown operation
    BRK $F4              ; 00 F4 | Software interrupt
    LDX $F423            ; AE 23 F4 | Load X register
    COP $00              ; 02 00 | Unknown operation
    PEA $7E00            ; F4 00 7E | Push effective address
    JSL $C9029E          ; 22 9E 02 C9 | Call external function
    BNE $8B5C            ; D0 06 | Branch if not equal (zero flag clear)
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    EOR $01              ; 41 01 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA $23E6            ; AD E6 23 | Load value into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    SEI                  ; 78 | Unknown operation
    BRK $60              ; 00 60 | Software interrupt
    JSR $8B71            ; 20 71 8B | Call local function

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

;==============================================================================
; GeneralPurpose_037
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_037:
    BRK $F4              ; 00 F4 | Software interrupt
    LDX $F423            ; AE 23 F4 | Load X register
    RTI                  ; 40 | Unknown operation
    BRK $F4              ; 00 F4 | Software interrupt
    BRK $7E              ; 00 7E | Software interrupt
    JSL $C902E9          ; 22 E9 02 C9 | Call external function
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    ADC $00,X            ; 75 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA $23E6            ; AD E6 23 | Load value into accumulator
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    ADC $00              ; 77 00 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STY $24              ; 84 24 | Store Y register
    STA $2486            ; 8D 86 24 | Store accumulator to memory
    STA $2488            ; 8D 88 24 | Store accumulator to memory
    STA $248A            ; 8D 8A 24 | Store accumulator to memory
    STA $4054            ; 8D 54 40 | Store to CustomRegister1
    INC                  ; 1A | Unknown operation
    STA $4056            ; 8D 56 40 | Store to CustomRegister2
    INC                  ; 1A | Unknown operation
    STA $4058            ; 8D 58 40 | Store accumulator to memory
    INC                  ; 1A | Unknown operation
    STA $405A            ; 8D 5A 40 | Store accumulator to memory
    JSL $C4297C          ; 22 7C 29 C4 | Call external function
    ORA $FE              ; 01 FE | Logical OR with accumulator
    DEX                  ; CA | Unknown operation
    BMI $8C58            ; 30 0F | Unknown operation
    TXA                  ; 8A | Transfer X to accumulator
    ASL                  ; 0A | Arithmetic shift left
    TAY                  ; A8 | Unknown operation
    JSL $C43115          ; 22 15 31 C4 | Call external function
    ORA $FE              ; 01 FE | Logical OR with accumulator
    SBC $248499,X        ; FF 99 84 24 | Unknown operation
    BRA $8C46            ; 80 EE | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRK $9B              ; 00 9B | Software interrupt
    LDA $2484,X          ; BD 84 24 | Load value into accumulator
    CMP $2486,Y          ; D9 86 24 | Compare with accumulator
    BCS $8C80            ; B0 1C | Branch if carry set
    LDA $2484,X          ; BD 84 24 | Load value into accumulator
    PHA                  ; 48 | Push accumulator to stack
    LDA $2486,Y          ; B9 86 24 | Load value into accumulator
    STA $2484,X          ; 9D 84 24 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    STA $2486,Y          ; 99 86 24 | Store accumulator to memory

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

;==============================================================================
; GeneralPurpose_038
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_038:
    REP #$A9             ; C2 A9 | Clear processor status bits
    WDM $00              ; 42 00 | Unknown operation
    STA $23E8            ; 8D E8 23 | Store accumulator to memory
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    ADC $6000,Y          ; 79 00 60 | Unknown operation
    LDX $23E4            ; AE E4 23 | Load X register
    JSL $C2CAD9          ; 22 D9 CA C2 | Call external function
    BVC $8CCC            ; 50 20 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    BNE $8CEA            ; D0 3A | Branch if not equal (zero flag clear)
    STA $241E            ; 8D 1E 24 | Store accumulator to memory
    STA $2422            ; 8D 22 24 | Store accumulator to memory
    JSL $C2CA5B          ; 22 5B CA C2 | Call external function
    EOR #$20             ; 49 20 | Unknown operation
    STA $2420            ; 8D 20 24 | Store accumulator to memory
    STA $2424            ; 8D 24 24 | Store accumulator to memory
    JSL $C2CAD9          ; 22 D9 CA C2 | Call external function
    BIT $FF20,X          ; 3C 20 FF | Unknown operation
    BRK $8D              ; 00 8D | Software interrupt
    ROL $24              ; 26 24 | Unknown operation
    JSL $C2AB00          ; 22 00 AB C2 | Call external function
    LDA $2428            ; AD 28 24 | Load value into accumulator
    CMP #$FF             ; C9 FF | Compare with accumulator
    SBC $8D11F0,X        ; FF F0 11 8D | Unknown operation
    INX                  ; E8 | Unknown operation
    AND $22              ; 23 22 | Logical AND with accumulator
    ADC $A8              ; 67 A8 | Unknown operation
    CMP $8F              ; C1 8F | Compare with accumulator
    BRK $AE              ; 00 AE | Software interrupt
    PLP                  ; 28 | Pull processor status from stack
    BIT $22              ; 24 22 | Unknown operation
    AND $C2B5            ; 2D B5 C2 | Logical AND with accumulator
    RTS                  ; 60 | Return from local function
    JSL $C1A867          ; 22 67 A8 C1 | Call external function
    BCC $8CF0            ; 90 00 | Branch if carry clear
    RTS                  ; 60 | Return from local function
    LDA #$0A             ; A9 0A | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    TRB $8D              ; 14 8D | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$77             ; A9 77 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    TRB $8D              ; 14 8D | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$48             ; A9 48 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    TRB $8D              ; 14 8D | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$57             ; A9 57 | Load value into accumulator

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

;==============================================================================
; GeneralPurpose_039
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_039:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_03A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03A:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_03B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03B:
    PHB                  ; 8B | Push data bank register
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $23E4            ; AD E4 23 | Load value into accumulator
    STA $2428            ; 8D 28 24 | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $22              ; 00 22 | Software interrupt
    TAX                  ; AA | Transfer accumulator to X
    CLV                  ; B8 | Unknown operation
    


;==============================================================================
; GeneralPurpose_03C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03C:
    REP #$AD             ; C2 AD | Clear processor status bits
    BIT $8D24            ; 2C 24 8D | Unknown operation
    JMP $00A224          ; 5C 24 A2 00 | Unknown operation
    BRK $AD              ; 00 AD | Software interrupt
    INC $DF23            ; EE 23 DF | Unknown operation
    


;==============================================================================
; GeneralPurpose_03D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03D:
    PHB                  ; 8B | Push data bank register
    STA $07F0C2          ; 8F C2 F0 07 | Store accumulator to memory
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    BPL $8EB7            ; 10 F6 | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRA $8E53            ; 80 8E | Unknown operation
    LSR $AD24,X          ; 5E 24 AD | Unknown operation
    INC $0A23            ; EE 23 0A | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    LDA $C2376A,X        ; BF 6A 37 C2 | Load value into accumulator
    TAX                  ; AA | Transfer accumulator to X
    LDA $C2187A,X        ; BF 7A 18 C2 | Load value into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    ORA $A2              ; 13 A2 | Logical OR with accumulator
    COP $00              ; 02 00 | Unknown operation
    LDA $245C            ; AD 5C 24 | Load value into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator
    BRK $DF              ; 00 DF | Software interrupt
    STA $C28F,Y          ; 99 8F C2 | Store accumulator to memory
    BEQ $8EF0            ; F0 07 | Branch if equal (zero flag set)
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    BPL $8EE3            ; 10 F6 | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRA $8E7F            ; 80 8E | Unknown operation
    RTS                  ; 60 | Return from local function
    BIT $AB              ; 24 AB | Unknown operation
    


;==============================================================================
; GeneralPurpose_03E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03E:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_03F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03F:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_040
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_040:
    PHB                  ; 8B | Push data bank register
    


;==============================================================================
; GeneralPurpose_041
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_041:
    REP #$30             ; C2 30 | Clear processor status bits
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $23E8            ; AD E8 23 | Load value into accumulator
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C2CBD3,X        ; BF D3 CB C2 | Load value into accumulator
    STA $0A              ; 85 0A | Store accumulator to memory
    TAX                  ; AA | Transfer accumulator to X
    LDA $2049,X          ; BD 49 20 | Load value into accumulator
    STA $2420            ; 8D 20 24 | Store accumulator to memory
    LDA $2050,X          ; BD 50 20 | Load value into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator
    BRK $8D              ; 00 8D | Software interrupt
    ASL $AD24,X          ; 1E 24 AD | Arithmetic shift left
    INC $0A23            ; EE 23 0A | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    LDA $C2376A,X        ; BF 6A 37 C2 | Load value into accumulator
    STA $08              ; 85 08 | Store accumulator to memory
    JSR $8F4B            ; 20 4B 8F | Call local function
    JSR $8F82            ; 20 82 8F | Call local function
    JSR $9015            ; 20 15 90 | Call local function
    JSR $903E            ; 20 3E 90 | Call local function
    JSR $8F90            ; 20 90 8F | Call local function
    JSR $913E            ; 20 3E 91 | Call local function
    JSR $9179            ; 20 79 91 | Call local function
    JSR $919B            ; 20 9B 91 | Call local function
    JSR $91A8            ; 20 A8 91 | Call local function
    JSR $91DF            ; 20 DF 91 | Call local function
    PLB                  ; AB | Pull data bank register
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from external function
    LDA $23EE            ; AD EE 23 | Load value into accumulator
    CMP #$AC             ; C9 AC | Compare with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    LDA $D000            ; AD 00 D0 | Load value into accumulator
    ORA $DAAD,X          ; 1D AD DA | Logical OR with accumulator
    AND $3A              ; 23 3A | Logical AND with accumulator
    CMP #$05             ; C9 05 | Compare with accumulator
    BRK $90              ; 00 90 | Software interrupt
    ORA $A9              ; 03 A9 | Logical OR with accumulator
    ORA $00              ; 05 00 | Logical OR with accumulator
    ASL                  ; 0A | Arithmetic shift left
    TAX                  ; AA | Transfer accumulator to X
    LDA $C28F76,X        ; BF 76 8F C2 | Load value into accumulator
    LDX #$00             ; A2 00 | Load X register
    BRK $22              ; 00 22 | Software interrupt

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

;==============================================================================
; GeneralPurpose_042
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_042:
    STA $00              ; 85 00 | Store accumulator to memory
    BRA $8FE8            ; 80 E4 | Unknown operation
    LDA #$10             ; A9 10 | Load value into accumulator
    BRK $22              ; 00 22 | Software interrupt
    ROL $C013,X          ; 3E 13 C0 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    ADC #$10             ; 69 10 | Unknown operation
    BRK $18              ; 00 18 | Software interrupt
    ADC $00              ; 65 00 | Unknown operation
    STA $00              ; 85 00 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    LDX $08              ; A6 08 | Load X register
    LDA $C21879,X        ; BF 79 18 C2 | Load value into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    ORA $E4AD,X          ; 1D AD E4 | Logical OR with accumulator
    AND $0A              ; 23 0A | Logical AND with accumulator
    TAX                  ; AA | Transfer accumulator to X
    LDA $C2CBD3,X        ; BF D3 CB C2 | Load value into accumulator
    TAX                  ; AA | Transfer accumulator to X
    LDA $2051,X          ; BD 51 20 | Load value into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    PHD                  ; 0B | Unknown operation
    LDA $23DA            ; AD DA 23 | Load value into accumulator
    DEC                  ; 3A | Unknown operation
    ORA $23D8            ; 0D D8 23 | Logical OR with accumulator
    BNE $903D            ; D0 02 | Branch if not equal (zero flag clear)
    ASL $00              ; 06 00 | Arithmetic shift left
    RTS                  ; 60 | Return from local function
    LDA $23AE            ; AD AE 23 | Load value into accumulator
    AND #$10             ; 29 10 | Logical AND with accumulator
    BRK $D0              ; 00 D0 | Software interrupt
    JSR $7422            ; 20 22 74 | Call local function
    LDA $C2              ; B7 C2 | Load value into accumulator
    CMP #$01             ; C9 01 | Compare with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    TRB $C9              ; 14 C9 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    BEQ $9066            ; F0 12 | Branch if equal (zero flag set)
    JSR $90A7            ; 20 A7 90 | Call local function
    BCS $9063            ; B0 0A | Branch if carry set
    JSR $90D1            ; 20 D1 90 | Call local function
    BCS $9063            ; B0 05 | Branch if carry set
    JSR $9067            ; 20 67 90 | Call local function
    BCS $9066            ; B0 03 | Branch if carry set
    JSR $90E9            ; 20 E9 90 | Call local function
    RTS                  ; 60 | Return from local function
    LDX $23E4            ; AE E4 23 | Load X register

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

;==============================================================================
; GeneralPurpose_043
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_043:
    REP #$C2             ; C2 C2 | Clear processor status bits
    ASL                  ; 0A | Arithmetic shift left
    CMP #$05             ; C9 05 | Compare with accumulator
    BRK $90              ; 00 90 | Software interrupt
    ORA #$48             ; 09 48 | Logical OR with accumulator
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    CMP $01              ; C3 01 | Compare with accumulator
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from local function
    JSL $C012D1          ; 22 D1 12 C0 | Call external function
    AND #$3F             ; 29 3F | Logical AND with accumulator
    BRK $38              ; 00 38 | Software interrupt
    BNE $90A5            ; D0 02 | Branch if not equal (zero flag clear)
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from local function
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    LDX #$00             ; A2 00 | Load X register
    BRK $AD              ; 00 AD | Software interrupt
    JMP $FF2924          ; 5C 24 29 FF | Unknown operation
    BRK $C9              ; 00 C9 | Software interrupt
    BPL $90B3            ; 10 00 | Unknown operation
    BEQ $90BD            ; F0 08 | Branch if equal (zero flag set)
    INX                  ; E8 | Unknown operation
    CMP #$14             ; C9 14 | Compare with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    COP $18              ; 02 18 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA $C290CF,X        ; BF CF 90 C2 | Load value into accumulator
    AND #$FF             ; 29 FF | Logical AND with accumulator
    BRK $22              ; 00 22 | Software interrupt
    ROL $C013,X          ; 3E 13 C0 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    BRK $D0              ; 00 D0 | Software interrupt
    INC $6038            ; EE 38 60 | Unknown operation
    ORA $0F              ; 07 0F | Logical OR with accumulator
    LDA $23EE            ; AD EE 23 | Load value into accumulator
    CMP #$02             ; C9 02 | Compare with accumulator
    BRK $D0              ; 00 D0 | Software interrupt
    ASL $07A9            ; 0E A9 07 | Arithmetic shift left
    BRK $22              ; 00 22 | Software interrupt
    ROL $C013,X          ; 3E 13 C0 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    BRK $D0              ; 00 D0 | Software interrupt
    COP $38              ; 02 38 | Unknown operation
    RTS                  ; 60 | Return from local function
    CLC                  ; 18 | Clear carry flag
    RTS                  ; 60 | Return from local function
    JSL $C1E32E          ; 22 2E E3 C1 | Call external function

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

;==============================================================================
; GeneralPurpose_044
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_044:
    REP #$50             ; C2 50 | Clear processor status bits
    COP $46              ; 02 46 | Unknown operation
    BRK $60              ; 00 60 | Software interrupt
    LDX $08              ; A6 08 | Load X register
    LDA $C21879,X        ; BF 79 18 C2 | Load value into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    ASL $A6,X            ; 16 A6 | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    LDA $2051,X          ; BD 51 20 | Load value into accumulator
    AND #$20             ; 29 20 | Logical AND with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    TSB $0006            ; 0C 06 00 | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRK $A9              ; 00 A9 | Software interrupt
    ORA $00              ; 03 00 | Logical OR with accumulator
    JSL $C0121C          ; 22 1C 12 C0 | Call external function
    RTS                  ; 60 | Return from local function
    LDX $0A              ; A6 0A | Load X register
    LDA $2050,X          ; BD 50 20 | Load value into accumulator
    AND #$80             ; 29 80 | Logical AND with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    COP $46              ; 02 46 | Unknown operation

    COP $46              ; 02 46
;==============================================================================
; Function Index (69 functions)
;==============================================================================
; GeneralPurpose_000
; GeneralPurpose_001
; GeneralPurpose_002
; GeneralPurpose_003
; GeneralPurpose_004
; GeneralPurpose_005
; GeneralPurpose_006
; GeneralPurpose_007
; GeneralPurpose_008
; GeneralPurpose_009
; GeneralPurpose_00A
; GeneralPurpose_00B
; GeneralPurpose_00C
; GeneralPurpose_00D
; GeneralPurpose_00E
; GeneralPurpose_00F
; GeneralPurpose_010
; GeneralPurpose_011
; GeneralPurpose_012
; GeneralPurpose_013
; GeneralPurpose_014
; GeneralPurpose_015
; GeneralPurpose_016
; GeneralPurpose_017
; GeneralPurpose_018
; GeneralPurpose_019
; GeneralPurpose_01A
; GeneralPurpose_01B
; GeneralPurpose_01C
; GeneralPurpose_01D
; GeneralPurpose_01E
; GeneralPurpose_01F
; GeneralPurpose_020
; GeneralPurpose_021
; GeneralPurpose_022
; GeneralPurpose_023
; GeneralPurpose_024
; GeneralPurpose_025
; GeneralPurpose_026
; GeneralPurpose_027
; GeneralPurpose_028
; GeneralPurpose_029
; GeneralPurpose_02A
; GeneralPurpose_02B
; GeneralPurpose_02C
; GeneralPurpose_02D
; GeneralPurpose_02E
; GeneralPurpose_02F
; GeneralPurpose_030
; GeneralPurpose_031
; GeneralPurpose_032
; GeneralPurpose_033
; GeneralPurpose_034
; GeneralPurpose_035
; GeneralPurpose_036
; GeneralPurpose_037
; GeneralPurpose_038
; GeneralPurpose_039
; GeneralPurpose_03A
; GeneralPurpose_03B
; GeneralPurpose_03C
; GeneralPurpose_03D
; GeneralPurpose_03E
; GeneralPurpose_03F
; GeneralPurpose_040
; GeneralPurpose_041
; GeneralPurpose_042
; GeneralPurpose_043
; GeneralPurpose_044
;==============================================================================