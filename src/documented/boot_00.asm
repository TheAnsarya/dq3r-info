;==============================================================================
; Dragon Quest III - Boot 00
;==============================================================================
; File: boot_00.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Boot System (Bank $00)
; Comprehensive code extraction


.segment "BOOT_CODE"

;==============================================================================
; GeneralPurpose_000
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_000:
    JSR $74A9            ; 20 A9 74 | Call local function
    BCC $FF0E            ; 90 09 | Branch if carry clear
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_001
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_001:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C0601F          ; 22 1F 60 C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_002
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_002:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_003
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_003:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_004
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_004:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_005
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_005:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STX $E086            ; 8E 86 E0 | Store to TempXCoordinate
    STY $E088            ; 8C 88 E0 | Store to TempYCoordinate
    TXA                  ; 8A | Transfer X to accumulator
    ORA $E088            ; 0D 88 E0 | Set bits in TempYCoordinate
    BEQ $FF7E            ; F0 41 | Branch if equal (zero flag set)
    


;==============================================================================
; GeneralPurpose_006
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_006:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E086            ; AD 86 E0 | Load TempXCoordinate
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E088            ; AD 88 E0 | Load TempYCoordinate
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_007
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_007:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCC $FF7E            ; 90 28 | Branch if carry clear
    LDX #$00             ; A2 00 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    SBC $5C              ; E1 5C | Unknown operation
    CPY #$90             ; C0 90 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    STZ $9075            ; 9C 75 90 | Unknown operation
    ORA #$AB             ; 09 AB | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_008
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_008:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C05F21          ; 22 21 5F C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_009
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_009:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_00A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00A:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_00B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00B:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_00C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00C:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STX $E086            ; 8E 86 E0 | Store to TempXCoordinate
    STY $E088            ; 8C 88 E0 | Store to TempYCoordinate
    TXA                  ; 8A | Transfer X to accumulator
    ORA $E088            ; 0D 88 E0 | Set bits in TempYCoordinate
    BEQ $FFE0            ; F0 41 | Branch if equal (zero flag set)
    


;==============================================================================
; GeneralPurpose_00D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00D:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E086            ; AD 86 E0 | Load TempXCoordinate
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E088            ; AD 88 E0 | Load TempYCoordinate
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_00E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00E:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCC $FFE0            ; 90 28 | Branch if carry clear
    LDX #$00             ; A2 00 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    LDA $5D              ; A1 5D | Load value into accumulator
    CPY #$90             ; C0 90 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    LDA #$02             ; A9 02 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    STZ $9075            ; 9C 75 90 | Unknown operation
    ORA #$AB             ; 09 AB | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_00F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00F:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C05FA0          ; 22 A0 5F C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_010
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_010:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_011
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_011:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_012
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_012:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_013
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_013:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STX $E086            ; 8E 86 E0 | Store to TempXCoordinate
    STY $E088            ; 8C 88 E0 | Store to TempYCoordinate
    TXA                  ; 8A | Transfer X to accumulator
    ORA $E088            ; 0D 88 E0 | Set bits in TempYCoordinate
    BEQ $0042            ; F0 41 | Branch if equal (zero flag set)
    


;==============================================================================
; GeneralPurpose_014
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_014:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E086            ; AD 86 E0 | Load TempXCoordinate
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E088            ; AD 88 E0 | Load TempYCoordinate
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_015
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_015:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCC $0042            ; 90 28 | Branch if carry clear
    LDX #$00             ; A2 00 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    ADC $5E              ; 61 5E | Unknown operation
    CPY #$90             ; C0 90 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    LDA #$04             ; A9 04 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    STZ $9075            ; 9C 75 90 | Unknown operation
    ORA #$AB             ; 09 AB | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_016
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_016:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C0601F          ; 22 1F 60 C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_017
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_017:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_018
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_018:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_019
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_019:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_01A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01A:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $0061            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $0064            ; 10 03 | Unknown operation
    JMP $71FB            ; 4C FB 71 | Unknown operation
    JSR $754E            ; 20 4E 75 | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    STX $E0,Y            ; 96 E0 | Store X register
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    TXS                  ; 9A | Unknown operation
    CPX #$E2             ; E0 E2 | Unknown operation
    JSR $96AD            ; 20 AD 96 | Call local function
    CPX #$EB             ; E0 EB | Unknown operation
    LDA $E09A            ; AD 9A E0 | Load CurrentMenuIndex
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_01B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01B:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_01C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01C:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    TSB $00              ; 04 00 | Unknown operation
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C05CE1          ; 22 E1 5C C0 | Call external function
    BCC $00FB            ; 90 18 | Branch if carry clear
    JSR $7563            ; 20 63 75 | Call local function
    LDA $AEA6            ; AD A6 AE | Load value into accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E08A            ; AD 8A E0 | Load TempCalculationResult
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_01D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01D:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_01E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01E:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    


;==============================================================================
; GeneralPurpose_01F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01F:
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_020
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_020:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_021
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_021:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_022
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_022:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $011A            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $011D            ; 10 03 | Unknown operation
    JMP $72B4            ; 4C B4 72 | Unknown operation
    JSR $754E            ; 20 4E 75 | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $50              ; 00 50 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $00              ; C5 00 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E096            ; 8D 96 E0 | Store to GameStateFlags
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $50              ; 00 50 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $01              ; C5 01 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E09A            ; 8D 9A E0 | Store to CurrentMenuIndex
    


;==============================================================================
; GeneralPurpose_023
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_023:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E096            ; AD 96 E0 | Load GameStateFlags
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09A            ; AD 9A E0 | Load CurrentMenuIndex
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_024
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_024:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $50              ; 00 50 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $06              ; C5 06 | Compare with accumulator
    BRK $85              ; 00 85 | Software interrupt
    BRK $22              ; 00 22 | Software interrupt
    INC $C903            ; EE 03 C9 | Unknown operation
    BRK $09              ; 00 09 | Software interrupt
    BRK $50              ; 00 50 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $08              ; C5 08 | Compare with accumulator
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $50              ; 00 50 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $00              ; C5 00 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $0C              ; 85 0C | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $50              ; 00 50 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $04              ; C5 04 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    ORA $00              ; 03 00 | Logical OR with accumulator
    TAX                  ; AA | Transfer accumulator to X
    JSL $C05DA1          ; 22 A1 5D C0 | Call external function
    BCC $01B4            ; 90 18 | Branch if carry clear
    JSR $7563            ; 20 63 75 | Call local function
    LDA $AEA6            ; AD A6 AE | Load value into accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E08A            ; AD 8A E0 | Load TempCalculationResult
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_025
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_025:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_026
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_026:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_027
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_027:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_028
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_028:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_029
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_029:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $01D3            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $01D6            ; 10 03 | Unknown operation
    JMP $736D            ; 4C 6D 73 | Unknown operation
    JSR $754E            ; 20 4E 75 | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    STX $E0,Y            ; 96 E0 | Store X register
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    TXS                  ; 9A | Unknown operation
    CPX #$E2             ; E0 E2 | Unknown operation
    JSR $96AD            ; 20 AD 96 | Call local function
    CPX #$EB             ; E0 EB | Unknown operation
    LDA $E09A            ; AD 9A E0 | Load CurrentMenuIndex
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_02A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02A:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    


;==============================================================================
; GeneralPurpose_02B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02B:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    BRK $09              ; 00 09 | Software interrupt
    BRK $78              ; 00 78 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C05E61          ; 22 61 5E C0 | Call external function
    BCC $026D            ; 90 18 | Branch if carry clear
    JSR $7563            ; 20 63 75 | Call local function
    LDA $AEA6            ; AD A6 AE | Load value into accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E08A            ; AD 8A E0 | Load TempCalculationResult
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_02C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02C:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_02D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02D:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_02E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02E:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_02F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02F:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_030
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_030:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $290000,X        ; FF 00 00 29 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    STA $E096            ; 8D 96 E0 | Store to GameStateFlags
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $290000,X        ; FF 00 00 29 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    STA $E09A            ; 8D 9A E0 | Store to CurrentMenuIndex
    


;==============================================================================
; GeneralPurpose_031
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_031:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E096            ; AD 96 E0 | Load GameStateFlags
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09A            ; AD 9A E0 | Load CurrentMenuIndex
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_032
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_032:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_033
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_033:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    BRK $09              ; 00 09 | Software interrupt
    BRK $AB              ; 00 AB | Software interrupt
    ORA $C5              ; 01 C5 | Logical OR with accumulator
    TSB $00              ; 04 00 | Unknown operation
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C05CE1          ; 22 E1 5C C0 | Call external function
    BCC $0349            ; 90 45 | Branch if carry clear
    STZ $04              ; 64 04 | Unknown operation
    LDA $E096            ; AD 96 E0 | Load GameStateFlags
    STA $06              ; 85 06 | Store accumulator to memory
    STZ $08              ; 64 08 | Unknown operation
    LDA $E09A            ; AD 9A E0 | Load CurrentMenuIndex
    STA $0A              ; 85 0A | Store accumulator to memory
    LDA $E442,Y          ; B9 42 E4 | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Unknown operation
    INC                  ; 1A | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    STA $0E              ; 85 0E | Store accumulator to memory
    LDX #$18             ; A2 18 | Load X register
    BRK $85              ; 00 85 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    LDA $E090            ; AD 90 E0 | Load value into accumulator
    JSL $C010D6          ; 22 D6 10 C0 | Call external function
    LDA $E08C            ; AD 8C E0 | Load value into accumulator
    ASL                  ; 0A | Arithmetic shift left
    CLC                  ; 18 | Clear carry flag
    ADC $18              ; 65 18 | Unknown operation
    ADC $E412,Y          ; 79 12 E4 | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    LDA $AEA6            ; AD A6 AE | Load value into accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E08A            ; AD 8A E0 | Load TempCalculationResult
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_034
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_034:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_035
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_035:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_036
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_036:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_037
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_037:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_038
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_038:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STA $E096            ; 8D 96 E0 | Store to GameStateFlags
    STX $E09A            ; 8E 9A E0 | Store to CurrentMenuIndex
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $03A0            ; 10 36 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BMI $03A0            ; 30 31 | Unknown operation
    JSR $754E            ; 20 4E 75 | Call local function
    


;==============================================================================
; GeneralPurpose_039
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_039:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E096            ; AD 96 E0 | Load GameStateFlags
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09A            ; AD 9A E0 | Load CurrentMenuIndex
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_03A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03A:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E08A            ; 8D 8A E0 | Store to TempCalculationResult
    LDA $E096            ; AD 96 E0 | Load GameStateFlags
    STA $0C              ; 85 0C | Store accumulator to memory
    JSR $7563            ; 20 63 75 | Call local function
    STZ $00              ; 64 00 | Unknown operation
    STZ $2E              ; 64 2E | Unknown operation
    LDA $E08A            ; AD 8A E0 | Load TempCalculationResult
    JSL $C04C15          ; 22 15 4C C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_03B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03B:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_03C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03C:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    JSL $C05A71          ; 22 71 5A C0 | Call external function
    BCS $03B0            ; B0 01 | Branch if carry set
    RTS                  ; 60 | Return from local function
    JSR $74D0            ; 20 D0 74 | Call local function
    LDA $E412,Y          ; B9 12 E4 | Load value into accumulator
    TAX                  ; AA | Transfer accumulator to X
    LDA $E08A            ; AD 8A E0 | Load TempCalculationResult
    JSL $C04923          ; 22 23 49 C0 | Call external function
    TAY                  ; A8 | Unknown operation
    LDA $0000,X          ; BD 00 00 | Load value into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $AEA6            ; 6D A6 AE | Unknown operation
    STA $0000,X          ; 9D 00 00 | Store accumulator to memory
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    DEY                  ; 88 | Unknown operation
    BNE $03BF            ; D0 F1 | Branch if not equal (zero flag clear)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    STA $E3F2,Y          ; 99 F2 E3 | Store accumulator to memory
    LDA $AEA2            ; AD A2 AE | Load value into accumulator
    STA $E492,Y          ; 99 92 E4 | Store accumulator to memory
    LDA $FC4C            ; AD 4C FC | Load value into accumulator
    STA $E472,Y          ; 99 72 E4 | Store accumulator to memory
    LDA $FC4A            ; AD 4A FC | Load value into accumulator
    STA $E4B2,Y          ; 99 B2 E4 | Store accumulator to memory
    LDX $AE9A            ; AE 9A AE | Load X register
    TXA                  ; 8A | Transfer X to accumulator
    STA $E4A2,Y          ; 99 A2 E4 | Store accumulator to memory
    LDA $ADF4,X          ; BD F4 AD | Load value into accumulator
    STA $E412,Y          ; 99 12 E4 | Store accumulator to memory
    LDA #$7F             ; A9 7F | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    JSL $00A9E4          ; 22 E4 A9 00 | Call external function
    BRA $0395            ; 80 99 | Unknown operation
    


;==============================================================================
; GeneralPurpose_03D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03D:
    SEP #$E3             ; E2 E3 | Set processor status bits
    TYA                  ; 98 | Unknown operation
    STA $E552            ; 8D 52 E5 | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    CMP $E4              ; D2 E4 | Compare with accumulator
    STA $E4E2,Y          ; 99 E2 E4 | Store accumulator to memory
    STA $E4F2,Y          ; 99 F2 E4 | Store accumulator to memory
    STA $E502,Y          ; 99 02 E5 | Store accumulator to memory
    STA $E512,Y          ; 99 12 E5 | Store accumulator to memory
    STA $E522,Y          ; 99 22 E5 | Store accumulator to memory
    STA $E532,Y          ; 99 32 E5 | Store accumulator to memory
    STA $E542,Y          ; 99 42 E5 | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    COP $E4              ; 02 E4 | Unknown operation
    LDA $E086            ; AD 86 E0 | Load TempXCoordinate
    AND #$FF             ; 29 FF | Logical AND with accumulator
    BRK $48              ; 00 48 | Software interrupt
    LDA $FC46            ; AD 46 FC | Load value into accumulator
    STA $E432,Y          ; 99 32 E4 | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC $01              ; 63 01 | Unknown operation
    DEC                  ; 3A | Unknown operation
    STA $E442,Y          ; 99 42 E4 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    LDA $E088            ; AD 88 E0 | Load TempYCoordinate
    AND #$FF             ; 29 FF | Logical AND with accumulator
    BRK $48              ; 00 48 | Software interrupt
    LDA $FC48            ; AD 48 FC | Load value into accumulator
    STA $E452,Y          ; 99 52 E4 | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC $01              ; 63 01 | Unknown operation
    DEC                  ; 3A | Unknown operation
    STA $E462,Y          ; 99 62 E4 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from local function
    LDA $7E967C          ; AF 7C 96 7E | Load value into accumulator
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    STA $E08C            ; 8D 8C E0 | Store accumulator to memory
    LDA $7E967E          ; AF 7E 96 7E | Load value into accumulator
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    STA $E090            ; 8D 90 E0 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    STZ $04              ; 64 04 | Unknown operation

    STZ $04              ; 64 04
    LDA $E096            ; AD 96 E0
    STA $06              ; 85 06
    STZ $08              ; 64 08
    LDA $E09A            ; AD 9A E0
    STA $0A              ; 85 0A
    LDA $E442,Y          ; B9 42 E4
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    INC                  ; 1A
    ASL                  ; 0A
    STA $0E              ; 85 0E
    LDX #$18             ; A2 18
    BRK $85              ; 00 85
    CLC                  ; 18
    LDA $E090            ; AD 90 E0
    SEC                  ; 38
    SBC $E452,Y          ; F9 52 E4
    JSL $C010D6          ; 22 D6 10 C0
    LDA $E08C            ; AD 8C E0
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    ASL                  ; 0A
    CLC                  ; 18
    ADC $18              ; 65 18
    ADC $E412,Y          ; 79 12 E4
    TAX                  ; AA
    RTS                  ; 60
    JSL $C05A71          ; 22 71 5A C0
    BCC $04B6            ; 90 14
    JSR $74D0            ; 20 D0 74
    LDA $AEA6            ; AD A6 AE
    STA $00              ; 85 00
    LDA $E412,Y          ; B9 12 E4
    TAX                  ; AA
    LDA $E08A            ; AD 8A E0
    JSL $C04A44          ; 22 44 4A C0
    SEC                  ; 38
    RTS                  ; 60

;==============================================================================
; GeneralPurpose_03E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03E:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_03F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03F:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_040
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_040:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    STZ $22E0            ; 9C E0 22 | Unknown operation
    ADC $05              ; 72 05 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator
    ROR $07              ; 66 07 | Unknown operation
    CMP $01              ; C5 01 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E09E            ; 8D 9E E0 | Store to BattleStateFlags
    ORA $E09C            ; 0D 9C E0 | Set bits in PlayerInputState
    BNE $04F0            ; D0 03 | Branch if not equal (zero flag clear)
    JMP $7693            ; 4C 93 76 | Unknown operation
    


;==============================================================================
; GeneralPurpose_041
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_041:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E09C            ; AD 9C E0 | Load PlayerInputState
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09E            ; AD 9E E0 | Load BattleStateFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_042
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_042:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCS $050C            ; B0 03 | Branch if carry set
    JMP $7693            ; 4C 93 76 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    COP $00              ; 02 00 | Unknown operation
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC46            ; 6D 46 FC | Unknown operation
    STA $FC46            ; 8D 46 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    ORA $00              ; 03 00 | Logical OR with accumulator
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC48            ; 6D 48 FC | Unknown operation
    STA $FC48            ; 8D 48 FC | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_043
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_043:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    TSB $00              ; 04 00 | Unknown operation
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0675C          ; 22 5C 67 C0 | Call external function
    BCC $058C            ; 90 1F | Branch if carry clear
    LDA #$06             ; A9 06 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    LDA $79              ; A1 79 | Load value into accumulator
    BCC $057E            ; 90 09 | Branch if carry clear
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_044
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_044:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $B750            ; AE 50 B7 | Load X register
    JSL $C06AE7          ; 22 E7 6A C0 | Call external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C05F21          ; 22 21 5F C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_045
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_045:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_046
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_046:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_047
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_047:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_048
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_048:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $00              ; C5 00 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E09C            ; 8D 9C E0 | Store to PlayerInputState
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $01              ; C5 01 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E09E            ; 8D 9E E0 | Store to BattleStateFlags
    ORA $E09C            ; 0D 9C E0 | Set bits in PlayerInputState
    BNE $05D5            ; D0 03 | Branch if not equal (zero flag clear)
    JMP $7778            ; 4C 78 77 | Unknown operation
    


;==============================================================================
; GeneralPurpose_049
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_049:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E09C            ; AD 9C E0 | Load PlayerInputState
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09E            ; AD 9E E0 | Load BattleStateFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_04A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04A:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCS $05F1            ; B0 03 | Branch if carry set
    JMP $7778            ; 4C 78 77 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $02              ; C5 02 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ASL                  ; 0A | Arithmetic shift left
    ADC $FC46            ; 6D 46 FC | Unknown operation
    STA $FC46            ; 8D 46 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $03              ; C5 03 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    ASL                  ; 0A | Arithmetic shift left
    ADC $FC48            ; 6D 48 FC | Unknown operation
    STA $FC48            ; 8D 48 FC | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $06              ; C5 06 | Compare with accumulator
    BRK $85              ; 00 85 | Software interrupt
    BRK $22              ; 00 22 | Software interrupt
    INC $C903            ; EE 03 C9 | Unknown operation
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $08              ; C5 08 | Compare with accumulator
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $04              ; C5 04 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    ORA $00              ; 03 00 | Logical OR with accumulator
    TAX                  ; AA | Transfer accumulator to X
    JSL $C067FD          ; 22 FD 67 C0 | Call external function

    JSL $C067FD          ; 22 FD 67 C0
    BCC $0671            ; 90 1F
    LDA #$08             ; A9 08
    BRK $20              ; 00 20
    LDA $79              ; A1 79
    BCC $0663            ; 90 09
    PLB                  ; AB

;==============================================================================
; GeneralPurpose_04B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04B:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $B750            ; AE 50 B7 | Load X register
    JSL $C06AE7          ; 22 E7 6A C0 | Call external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C05FA0          ; 22 A0 5F C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_04C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04C:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_04D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04D:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_04E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04E:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_04F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04F:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    STZ $22E0            ; 9C E0 22 | Unknown operation
    ADC $05              ; 72 05 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator
    STA $42              ; 81 42 | Store accumulator to memory
    CMP $01              ; C5 01 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E09E            ; 8D 9E E0 | Store to BattleStateFlags
    ORA $E09C            ; 0D 9C E0 | Set bits in PlayerInputState
    BNE $06BA            ; D0 03 | Branch if not equal (zero flag clear)
    JMP $785D            ; 4C 5D 78 | Unknown operation
    


;==============================================================================
; GeneralPurpose_050
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_050:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E09C            ; AD 9C E0 | Load PlayerInputState
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09E            ; AD 9E E0 | Load BattleStateFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_051
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_051:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCS $06D6            ; B0 03 | Branch if carry set
    JMP $785D            ; 4C 5D 78 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC46            ; 6D 46 FC | Unknown operation
    STA $FC46            ; 8D 46 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC48            ; 6D 48 FC | Unknown operation
    STA $FC48            ; 8D 48 FC | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    


;==============================================================================
; GeneralPurpose_052
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_052:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0689E          ; 22 9E 68 C0 | Call external function
    BCC $0756            ; 90 1F | Branch if carry clear
    LDA #$0A             ; A9 0A | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    LDA $79              ; A1 79 | Load value into accumulator
    BCC $0748            ; 90 09 | Branch if carry clear
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_053
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_053:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $B750            ; AE 50 B7 | Load X register
    JSL $C06AE7          ; 22 E7 6A C0 | Call external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C0601F          ; 22 1F 60 C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_054
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_054:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_055
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_055:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_056
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_056:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_057
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_057:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STX $E09C            ; 8E 9C E0 | Store to PlayerInputState
    STY $E09E            ; 8C 9E E0 | Store to BattleStateFlags
    TXA                  ; 8A | Transfer X to accumulator
    ORA $E09E            ; 0D 9E E0 | Set bits in BattleStateFlags
    BEQ $07C6            ; F0 48 | Branch if equal (zero flag set)
    


;==============================================================================
; GeneralPurpose_058
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_058:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E09C            ; AD 9C E0 | Load PlayerInputState
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09E            ; AD 9E E0 | Load BattleStateFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_059
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_059:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCC $07C6            ; 90 2F | Branch if carry clear
    LDX #$01             ; A2 01 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    JMP $90C067          ; 5C 67 C0 90 | Unknown operation
    ORA $0006A9,X        ; 1F A9 06 00 | Logical OR with accumulator
    JSR $79CF            ; 20 CF 79 | Call local function
    BCC $07B1            ; 90 09 | Branch if carry clear
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_05A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05A:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $B750            ; AE 50 B7 | Load X register
    JSL $C06AE7          ; 22 E7 6A C0 | Call external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C05F21          ; 22 21 5F C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_05B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05B:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_05C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05C:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_05D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05D:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_05E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05E:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STX $E09C            ; 8E 9C E0 | Store to PlayerInputState
    STY $E09E            ; 8C 9E E0 | Store to BattleStateFlags
    TXA                  ; 8A | Transfer X to accumulator
    ORA $E09E            ; 0D 9E E0 | Set bits in BattleStateFlags
    BEQ $082F            ; F0 48 | Branch if equal (zero flag set)
    


;==============================================================================
; GeneralPurpose_05F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05F:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E09C            ; AD 9C E0 | Load PlayerInputState
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09E            ; AD 9E E0 | Load BattleStateFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_060
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_060:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCC $082F            ; 90 2F | Branch if carry clear
    LDX #$01             ; A2 01 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    SBC $C067,X          ; FD 67 C0 | Unknown operation
    BCC $0828            ; 90 1F | Branch if carry clear
    LDA #$08             ; A9 08 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    CMP $099079          ; CF 79 90 09 | Compare with accumulator
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_061
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_061:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $B750            ; AE 50 B7 | Load X register
    JSL $C06AE7          ; 22 E7 6A C0 | Call external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C05FA0          ; 22 A0 5F C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_062
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_062:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_063
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_063:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_064
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_064:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_065
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_065:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STX $E09C            ; 8E 9C E0 | Store to PlayerInputState
    STY $E09E            ; 8C 9E E0 | Store to BattleStateFlags
    TXA                  ; 8A | Transfer X to accumulator
    ORA $E09E            ; 0D 9E E0 | Set bits in BattleStateFlags
    BEQ $0898            ; F0 48 | Branch if equal (zero flag set)
    


;==============================================================================
; GeneralPurpose_066
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_066:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E09C            ; AD 9C E0 | Load PlayerInputState
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E09E            ; AD 9E E0 | Load BattleStateFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_067
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_067:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCC $0898            ; 90 2F | Branch if carry clear
    LDX #$01             ; A2 01 | Load X register
    BRK $22              ; 00 22 | Software interrupt
    STZ $C068,X          ; 9E 68 C0 | Unknown operation
    BCC $0891            ; 90 1F | Branch if carry clear
    LDA #$0A             ; A9 0A | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    CMP $099079          ; CF 79 90 09 | Compare with accumulator
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_068
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_068:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $B750            ; AE 50 B7 | Load X register
    JSL $C06AE7          ; 22 E7 6A C0 | Call external function
    LDX $AEA2            ; AE A2 AE | Load X register
    JSL $C0601F          ; 22 1F 60 C0 | Call external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_069
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_069:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    JSL $C05A71          ; 22 71 5A C0 | Call external function
    BCC $08CE            ; 90 27 | Branch if carry clear
    JSR $79EE            ; 20 EE 79 | Call local function
    LDA $E412,Y          ; B9 12 E4 | Load value into accumulator
    TAX                  ; AA | Transfer accumulator to X
    LDA $E0A0            ; AD A0 E0 | Load FieldStateFlags
    JSL $C04923          ; 22 23 49 C0 | Call external function
    TAY                  ; A8 | Unknown operation
    LDA $B754            ; AD 54 B7 | Load value into accumulator
    ORA $7E99BB          ; 0F BB 99 7E | Logical OR with accumulator
    STA $18              ; 85 18 | Store accumulator to memory
    LDA $0000,X          ; BD 00 00 | Load value into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC $18              ; 65 18 | Unknown operation
    STA $0000,X          ; 9D 00 00 | Store accumulator to memory
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    DEY                  ; 88 | Unknown operation
    BNE $08BF            ; D0 F2 | Branch if not equal (zero flag clear)
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    JSL $C05A71          ; 22 71 5A C0 | Call external function
    BCC $08ED            ; 90 18 | Branch if carry clear
    JSR $79EE            ; 20 EE 79 | Call local function
    LDA $B754            ; AD 54 B7 | Load value into accumulator
    ORA $7E99BB          ; 0F BB 99 7E | Logical OR with accumulator
    STA $00              ; 85 00 | Store accumulator to memory
    LDA $E412,Y          ; B9 12 E4 | Load value into accumulator
    TAX                  ; AA | Transfer accumulator to X
    LDA $E0A0            ; AD A0 E0 | Load FieldStateFlags
    JSL $C04A44          ; 22 44 4A C0 | Call external function
    SEC                  ; 38 | Set carry flag
    RTS                  ; 60 | Return from local function
    STA $E3F2,Y          ; 99 F2 E3 | Store accumulator to memory
    LDA $FC4C            ; AD 4C FC | Load value into accumulator
    STA $E472,Y          ; 99 72 E4 | Store accumulator to memory
    LDA $FC4A            ; AD 4A FC | Load value into accumulator
    STA $E4B2,Y          ; 99 B2 E4 | Store accumulator to memory
    LDX $AE9A            ; AE 9A AE | Load X register
    


;==============================================================================
; GeneralPurpose_06A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06A:
    TXA                  ; 8A | Transfer X to accumulator
    STA $E4A2,Y          ; 99 A2 E4 | Store accumulator to memory
    LDA $ADF4,X          ; BD F4 AD | Load value into accumulator
    STA $E412,Y          ; 99 12 E4 | Store accumulator to memory
    LDA #$7F             ; A9 7F | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    JSL $50ADE4          ; 22 E4 AD 50 | Call external function
    LDA $99              ; B7 99 | Load value into accumulator
    BRL $B6FB            ; 82 E4 AD | Unknown operation
    LDX #$AE             ; A2 AE | Load X register
    STA $E492,Y          ; 99 92 E4 | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRA $08B9            ; 80 99 | Unknown operation
    


;==============================================================================
; GeneralPurpose_06B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06B:
    SEP #$E3             ; E2 E3 | Set processor status bits
    TYA                  ; 98 | Unknown operation
    STA $E552            ; 8D 52 E5 | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    CMP $E4              ; D2 E4 | Compare with accumulator
    STA $E4E2,Y          ; 99 E2 E4 | Store accumulator to memory
    STA $E4F2,Y          ; 99 F2 E4 | Store accumulator to memory
    STA $E502,Y          ; 99 02 E5 | Store accumulator to memory
    STA $E512,Y          ; 99 12 E5 | Store accumulator to memory
    STA $E522,Y          ; 99 22 E5 | Store accumulator to memory
    STA $E532,Y          ; 99 32 E5 | Store accumulator to memory
    STA $E542,Y          ; 99 42 E5 | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    COP $E4              ; 02 E4 | Unknown operation
    LDA $E09C            ; AD 9C E0 | Load PlayerInputState
    AND #$FF             ; 29 FF | Logical AND with accumulator
    BRK $0A              ; 00 0A | Software interrupt
    PHA                  ; 48 | Push accumulator to stack
    LDA $FC46            ; AD 46 FC | Load value into accumulator
    STA $E432,Y          ; 99 32 E4 | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC $01              ; 63 01 | Unknown operation
    DEC                  ; 3A | Unknown operation
    STA $E442,Y          ; 99 42 E4 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    LDA $E09E            ; AD 9E E0 | Load BattleStateFlags
    AND #$FF             ; 29 FF | Logical AND with accumulator
    BRK $0A              ; 00 0A | Software interrupt
    PHA                  ; 48 | Push accumulator to stack
    LDA $FC48            ; AD 48 FC | Load value into accumulator
    STA $E452,Y          ; 99 52 E4 | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC $01              ; 63 01 | Unknown operation
    DEC                  ; 3A | Unknown operation
    STA $E462,Y          ; 99 62 E4 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from local function
    


;==============================================================================
; GeneralPurpose_06C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06C:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_06D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06D:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_06E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06E:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $098B            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $098E            ; 10 03 | Unknown operation
    JMP $7B2B            ; 4C 2B 7B | Unknown operation
    JSR $7DAB            ; 20 AB 7D | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDY $22E0            ; AC E0 22 | Load Y register
    ADC $05              ; 72 05 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator
    ROR $07              ; 66 07 | Unknown operation
    CMP $01              ; C5 01 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E0B0            ; 8D B0 E0 | Store to SystemStatusFlags
    


;==============================================================================
; GeneralPurpose_06F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06F:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E0AC            ; AD AC E0 | Load value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E0B0            ; AD B0 E0 | Load SystemStatusFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_070
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_070:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_071
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_071:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    TSB $00              ; 04 00 | Unknown operation
    SBC $DA0003,X        ; FF 03 00 DA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    JSL $C0675C          ; 22 5C 67 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $0A2B            ; 90 1C | Branch if carry clear
    JSR $7DDA            ; 20 DA 7D | Call local function
    LDA $B754            ; AD 54 B7 | Load value into accumulator
    ORA $7E9684          ; 0F 84 96 7E | Logical OR with accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E0A0            ; AD A0 E0 | Load FieldStateFlags
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_072
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_072:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_073
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_073:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_074
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_074:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_075
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_075:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_076
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_076:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $0A4B            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $0A4E            ; 10 03 | Unknown operation
    JMP $7BEB            ; 4C EB 7B | Unknown operation
    JSR $7DAB            ; 20 AB 7D | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $00              ; C5 00 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E0AC            ; 8D AC E0 | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $01              ; C5 01 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E0B0            ; 8D B0 E0 | Store to SystemStatusFlags
    


;==============================================================================
; GeneralPurpose_077
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_077:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E0AC            ; AD AC E0 | Load value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E0B0            ; AD B0 E0 | Load SystemStatusFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_078
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_078:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $06              ; C5 06 | Compare with accumulator
    BRK $85              ; 00 85 | Software interrupt
    BRK $22              ; 00 22 | Software interrupt
    INC $C903            ; EE 03 C9 | Unknown operation
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $08              ; C5 08 | Compare with accumulator
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $00              ; C5 00 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $0C              ; 85 0C | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $04              ; C5 04 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    ORA $00              ; 03 00 | Logical OR with accumulator
    PHX                  ; DA | Push X register to stack
    TAX                  ; AA | Transfer accumulator to X
    JSL $C067FD          ; 22 FD 67 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $0AEB            ; 90 1C | Branch if carry clear
    JSR $7DDA            ; 20 DA 7D | Call local function
    LDA $B754            ; AD 54 B7 | Load value into accumulator
    ORA $7E9684          ; 0F 84 96 7E | Logical OR with accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E0A0            ; AD A0 E0 | Load FieldStateFlags
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_079
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_079:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_07A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07A:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_07B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07B:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_07C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07C:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_07D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07D:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_07E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07E:
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $0B0B            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $0B0E            ; 10 03 | Unknown operation
    JMP $7CAB            ; 4C AB 7C | Unknown operation
    JSR $7DAB            ; 20 AB 7D | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDY $22E0            ; AC E0 22 | Load Y register
    ADC $05              ; 72 05 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    ORA #$00             ; 09 00 | Logical OR with accumulator
    STA $42              ; 81 42 | Store accumulator to memory
    CMP $01              ; C5 01 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $E0B0            ; 8D B0 E0 | Store to SystemStatusFlags
    


;==============================================================================
; GeneralPurpose_07F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07F:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E0AC            ; AD AC E0 | Load value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E0B0            ; AD B0 E0 | Load SystemStatusFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_080
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_080:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    


;==============================================================================
; GeneralPurpose_081
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_081:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $DA0003,X        ; FF 03 00 DA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    JSL $C0689E          ; 22 9E 68 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $0BAB            ; 90 1C | Branch if carry clear
    JSR $7DDA            ; 20 DA 7D | Call local function
    LDA $B754            ; AD 54 B7 | Load value into accumulator
    ORA $7E9684          ; 0F 84 96 7E | Logical OR with accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E0A0            ; AD A0 E0 | Load FieldStateFlags
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_082
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_082:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_083
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_083:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_084
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_084:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_085
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_085:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_086
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_086:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STA $E0AC            ; 8D AC E0 | Store accumulator to memory
    STX $E0B0            ; 8E B0 E0 | Store to SystemStatusFlags
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $0C06            ; 10 3A | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BMI $0C06            ; 30 35 | Unknown operation
    JSR $7DAB            ; 20 AB 7D | Call local function
    


;==============================================================================
; GeneralPurpose_087
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_087:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E0AC            ; AD AC E0 | Load value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E0B0            ; AD B0 E0 | Load SystemStatusFlags
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_088
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_088:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0A0            ; 8D A0 E0 | Store to FieldStateFlags
    LDA $E0AC            ; AD AC E0 | Load value into accumulator
    STA $0C              ; 85 0C | Store accumulator to memory
    JSR $7DDA            ; 20 DA 7D | Call local function
    STZ $00              ; 64 00 | Unknown operation
    LDA $7E9684          ; AF 84 96 7E | Load value into accumulator
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E0A0            ; AD A0 E0 | Load FieldStateFlags
    JSL $C04C15          ; 22 15 4C C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_089
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_089:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_08A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08A:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_08B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08B:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_08C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08C:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_08D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08D:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $66              ; 00 66 | Software interrupt
    ORA $C5              ; 07 C5 | Logical OR with accumulator
    TSB $00              ; 04 00 | Unknown operation
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0675C          ; 22 5C 67 C0 | Call external function
    BCC $0C3A            ; 90 09 | Branch if carry clear
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_08E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08E:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_08F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_08F:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_090
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_090:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_091
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_091:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_092
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_092:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $7D              ; 00 7D | Software interrupt
    CLC                  ; 18 | Clear carry flag
    CMP $04              ; C5 04 | Compare with accumulator
    BRK $FF              ; 00 FF | Software interrupt
    ORA $00              ; 03 00 | Logical OR with accumulator
    TAX                  ; AA | Transfer accumulator to X
    JSL $C067FD          ; 22 FD 67 C0 | Call external function
    BCC $0C6E            ; 90 09 | Branch if carry clear
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_093
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_093:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_094
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_094:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_095
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_095:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_096
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_096:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_097
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_097:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $81              ; 00 81 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0689E          ; 22 9E 68 C0 | Call external function
    BCC $0CA2            ; 90 09 | Branch if carry clear
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_098
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_098:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_099
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_099:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    LDA $E432,Y          ; B9 32 E4 | Load value into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator
    BRK $48              ; 00 48 | Software interrupt
    LDA $7E9680          ; AF 80 96 7E | Load value into accumulator
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    AND #$FE             ; 29 FE | Logical AND with accumulator
    SBC $8D0103,X        ; FF 03 01 8D | Unknown operation
    LDX #$E0             ; A2 E0 | Load X register
    PLA                  ; 68 | Pull accumulator from stack
    LDA $E452,Y          ; B9 52 E4 | Load value into accumulator
    AND #$01             ; 29 01 | Logical AND with accumulator
    BRK $48              ; 00 48 | Software interrupt
    LDA $7E9682          ; AF 82 96 7E | Load value into accumulator
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    AND #$FE             ; 29 FE | Logical AND with accumulator
    SBC $8D0103,X        ; FF 03 01 8D | Unknown operation
    LDX $E0              ; A6 E0 | Load X register
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from local function
    STZ $04              ; 64 04 | Unknown operation
    LDA $E0AC            ; AD AC E0 | Load value into accumulator
    STA $06              ; 85 06 | Store accumulator to memory
    STZ $08              ; 64 08 | Unknown operation
    LDA $E0B0            ; AD B0 E0 | Load SystemStatusFlags
    STA $0A              ; 85 0A | Store accumulator to memory
    LDA $E442,Y          ; B9 42 E4 | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Unknown operation
    INC                  ; 1A | Unknown operation
    STA $0E              ; 85 0E | Store accumulator to memory
    LDX #$18             ; A2 18 | Load X register
    BRK $85              ; 00 85 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    LDA $E0A6            ; AD A6 E0 | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,Y          ; F9 52 E4 | Unknown operation
    LSR                  ; 4A | Unknown operation
    JSL $C010D6          ; 22 D6 10 C0 | Call external function

    JSL $C010D6          ; 22 D6 10 C0
    LDA $E0A2            ; AD A2 E0
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    AND #$FE             ; 29 FE
    SBC $186518,X        ; FF 18 65 18
    ADC $E412,Y          ; 79 12 E4
    TAX                  ; AA
    RTS                  ; 60

;==============================================================================
; GeneralPurpose_09A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_09A:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_09B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_09B:
    REP #$30             ; C2 30 | Clear processor status bits
    


;==============================================================================
; GeneralPurpose_09C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_09C:
    PHB                  ; 8B | Push data bank register
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    JSR $7E47            ; 20 47 7E | Call local function
    LDA $0000,Y          ; B9 00 00 | Load value into accumulator
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLB                  ; AB | Pull data bank register
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_09D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_09D:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_09E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_09E:
    REP #$30             ; C2 30 | Clear processor status bits
    


;==============================================================================
; GeneralPurpose_09F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_09F:
    PHB                  ; 8B | Push data bank register
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    JSR $7E47            ; 20 47 7E | Call local function
    LDA $05              ; A3 05 | Load value into accumulator
    STA $0000,Y          ; 99 00 00 | Store accumulator to memory
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLB                  ; AB | Pull data bank register
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from external function
    LDA $1A              ; A5 1A | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E452,X          ; FD 52 E4 | Unknown operation
    LSR                  ; 4A | Unknown operation
    PHA                  ; 48 | Push accumulator to stack
    LDA $E442,X          ; BD 42 E4 | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E432,X          ; FD 32 E4 | Unknown operation
    INC                  ; 1A | Unknown operation
    LSR                  ; 4A | Unknown operation
    


;==============================================================================
; GeneralPurpose_0A0
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A0:
    SEP #$20             ; E2 20 | Set processor status bits
    STA $004202          ; 8F 02 42 00 | Store accumulator to memory
    LDA $01              ; A3 01 | Load value into accumulator
    STA $004203          ; 8F 03 42 00 | Store accumulator to memory
    NOP                  ; EA | Unknown operation
    NOP                  ; EA | Unknown operation
    NOP                  ; EA | Unknown operation
    NOP                  ; EA | Unknown operation
    


;==============================================================================
; GeneralPurpose_0A1
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A1:
    REP #$20             ; C2 20 | Clear processor status bits
    LDA $004216          ; AF 16 42 00 | Load value into accumulator
    STA $01              ; 83 01 | Store accumulator to memory
    LDA $18              ; A5 18 | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E432,X          ; FD 32 E4 | Unknown operation
    LSR                  ; 4A | Unknown operation
    CLC                  ; 18 | Clear carry flag
    ADC $01              ; 63 01 | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    STA $01              ; 83 01 | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC $E412,X          ; 7D 12 E4 | Unknown operation
    TAY                  ; A8 | Unknown operation
    PLA                  ; 68 | Pull accumulator from stack
    RTS                  ; 60 | Return from local function
    


;==============================================================================
; GeneralPurpose_0A2
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A2:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_0A3
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A3:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_0A4
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A4:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $0D60            ; 10 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDA $E0              ; B2 E0 | Load value into accumulator
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $0D72            ; 10 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDY $E0,X            ; B4 E0 | Load Y register
    ORA $E0B2            ; 0D B2 E0 | Logical OR with accumulator
    BNE $0DBD            ; D0 03 | Branch if not equal (zero flag clear)
    JMP $7F74            ; 4C 74 7F | Unknown operation
    


;==============================================================================
; GeneralPurpose_0A5
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A5:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E0B2            ; AD B2 E0 | Load value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E0B4            ; AD B4 E0 | Load value into accumulator
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_0A6
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A6:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0B6            ; 8D B6 E0 | Store to DMATransferControl
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCS $0DD9            ; B0 03 | Branch if carry set
    JMP $7F74            ; 4C 74 7F | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $0DA8            ; 10 C5 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC46            ; 6D 46 FC | Unknown operation
    STA $FC46            ; 8D 46 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $0DBE            ; 10 C5 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC48            ; 6D 48 FC | Unknown operation
    STA $FC48            ; 8D 48 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $0DD4            ; 10 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $DA0003,X        ; FF 03 00 DA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    BPL $0DE5            ; 10 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    JSR ($03FF,X)        ; FC FF 03 | Call local function
    STA $E0B8            ; 8D B8 E0 | Store to DMATransferStatus
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    BPL $0DF7            ; 10 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0675C          ; 22 5C 67 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $0E6D            ; 90 2E | Branch if carry clear
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $0E0E            ; 10 C5 | Unknown operation

    BPL $0E0E            ; 10 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    BPL $0E1C            ; 10 C5

;==============================================================================
; GeneralPurpose_0A7
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A7:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    LDA #$0C             ; A9 0C | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    PLY                  ; 7A | Pull Y register from stack
    STY $AB              ; 84 AB | Store Y register
    


;==============================================================================
; GeneralPurpose_0A8
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A8:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_0A9
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0A9:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_0AA
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0AA:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_0AB
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0AB:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_0AC
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0AC:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDA $E0              ; B2 E0 | Load value into accumulator
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDY $E0,X            ; B4 E0 | Load Y register
    ORA $E0B2            ; 0D B2 E0 | Logical OR with accumulator
    BNE $0EB6            ; D0 03 | Branch if not equal (zero flag clear)
    JMP $806D            ; 4C 6D 80 | Unknown operation
    


;==============================================================================
; GeneralPurpose_0AD
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0AD:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E0B2            ; AD B2 E0 | Load value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E0B4            ; AD B4 E0 | Load value into accumulator
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_0AE
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0AE:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0B6            ; 8D B6 E0 | Store to DMATransferControl
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCS $0ED2            ; B0 03 | Branch if carry set
    JMP $806D            ; 4C 6D 80 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC46            ; 6D 46 FC | Unknown operation
    STA $FC46            ; 8D 46 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC48            ; 6D 48 FC | Unknown operation
    STA $FC48            ; 8D 48 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $DA0003,X        ; FF 03 00 DA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $32              ; 00 32 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    JSR ($03FF,X)        ; FC FF 03 | Call local function
    STA $E0B8            ; 8D B8 E0 | Store to DMATransferStatus
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $32              ; 00 32 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation

    WDM $C5              ; 42 C5
;==============================================================================
; Function Index (175 functions)
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
; GeneralPurpose_045
; GeneralPurpose_046
; GeneralPurpose_047
; GeneralPurpose_048
; GeneralPurpose_049
; GeneralPurpose_04A
; GeneralPurpose_04B
; GeneralPurpose_04C
; GeneralPurpose_04D
; GeneralPurpose_04E
; GeneralPurpose_04F
; GeneralPurpose_050
; GeneralPurpose_051
; GeneralPurpose_052
; GeneralPurpose_053
; GeneralPurpose_054
; GeneralPurpose_055
; GeneralPurpose_056
; GeneralPurpose_057
; GeneralPurpose_058
; GeneralPurpose_059
; GeneralPurpose_05A
; GeneralPurpose_05B
; GeneralPurpose_05C
; GeneralPurpose_05D
; GeneralPurpose_05E
; GeneralPurpose_05F
; GeneralPurpose_060
; GeneralPurpose_061
; GeneralPurpose_062
; GeneralPurpose_063
; GeneralPurpose_064
; GeneralPurpose_065
; GeneralPurpose_066
; GeneralPurpose_067
; GeneralPurpose_068
; GeneralPurpose_069
; GeneralPurpose_06A
; GeneralPurpose_06B
; GeneralPurpose_06C
; GeneralPurpose_06D
; GeneralPurpose_06E
; GeneralPurpose_06F
; GeneralPurpose_070
; GeneralPurpose_071
; GeneralPurpose_072
; GeneralPurpose_073
; GeneralPurpose_074
; GeneralPurpose_075
; GeneralPurpose_076
; GeneralPurpose_077
; GeneralPurpose_078
; GeneralPurpose_079
; GeneralPurpose_07A
; GeneralPurpose_07B
; GeneralPurpose_07C
; GeneralPurpose_07D
; GeneralPurpose_07E
; GeneralPurpose_07F
; GeneralPurpose_080
; GeneralPurpose_081
; GeneralPurpose_082
; GeneralPurpose_083
; GeneralPurpose_084
; GeneralPurpose_085
; GeneralPurpose_086
; GeneralPurpose_087
; GeneralPurpose_088
; GeneralPurpose_089
; GeneralPurpose_08A
; GeneralPurpose_08B
; GeneralPurpose_08C
; GeneralPurpose_08D
; GeneralPurpose_08E
; GeneralPurpose_08F
; GeneralPurpose_090
; GeneralPurpose_091
; GeneralPurpose_092
; GeneralPurpose_093
; GeneralPurpose_094
; GeneralPurpose_095
; GeneralPurpose_096
; GeneralPurpose_097
; GeneralPurpose_098
; GeneralPurpose_099
; GeneralPurpose_09A
; GeneralPurpose_09B
; GeneralPurpose_09C
; GeneralPurpose_09D
; GeneralPurpose_09E
; GeneralPurpose_09F
; GeneralPurpose_0A0
; GeneralPurpose_0A1
; GeneralPurpose_0A2
; GeneralPurpose_0A3
; GeneralPurpose_0A4
; GeneralPurpose_0A5
; GeneralPurpose_0A6
; GeneralPurpose_0A7
; GeneralPurpose_0A8
; GeneralPurpose_0A9
; GeneralPurpose_0AA
; GeneralPurpose_0AB
; GeneralPurpose_0AC
; GeneralPurpose_0AD
; GeneralPurpose_0AE
;==============================================================================