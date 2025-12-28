;==============================================================================
; Dragon Quest III - Engine 01
;==============================================================================
; File: engine_01.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Engine System (Bank $01)
; Comprehensive code extraction


.segment "ENGINE_CODE"

;==============================================================================
; GeneralPurpose_000
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_000:
    ORA $C9              ; 05 C9 | Logical OR with accumulator
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
    BRK $00              ; 00 00 | Software interrupt
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C067FD          ; 22 FD 67 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $8066            ; 90 2E | Branch if carry clear
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    


;==============================================================================
; GeneralPurpose_001
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_001:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    LDA #$0E             ; A9 0E | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    PLY                  ; 7A | Pull Y register from stack
    STY $AB              ; 84 AB | Store Y register
    


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
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    LDX $AE9A            ; AE 9A AE | Load X register
    JSL $C09052          ; 22 52 90 C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_003
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_003:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_004
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_004:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_005
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_005:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_006
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_006:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDA $E0              ; B2 E0 | Load value into accumulator
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    LDY $E0,X            ; B4 E0 | Load Y register
    ORA $E0B2            ; 0D B2 E0 | Logical OR with accumulator
    BNE $80AF            ; D0 03 | Branch if not equal (zero flag clear)
    JMP $8166            ; 4C 66 81 | Unknown operation
    


;==============================================================================
; GeneralPurpose_007
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_007:
    SEP #$20             ; E2 20 | Set processor status bits
    LDA $E0B2            ; AD B2 E0 | Load value into accumulator
    XBA                  ; EB | Exchange accumulator bytes
    LDA $E0B4            ; AD B4 E0 | Load value into accumulator
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_008
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_008:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0B6            ; 8D B6 E0 | Store to DMATransferControl
    ASL                  ; 0A | Arithmetic shift left
    JSL $C08FD7          ; 22 D7 8F C0 | Call external function
    BCS $80CB            ; B0 03 | Branch if carry set
    JMP $8166            ; 4C 66 81 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC46            ; 6D 46 FC | Unknown operation
    STA $FC46            ; 8D 46 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    SBC $0A0000,X        ; FF 00 00 0A | Unknown operation
    ADC $FC48            ; 6D 48 FC | Unknown operation
    STA $FC48            ; 8D 48 FC | Store accumulator to memory
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $DA0003,X        ; FF 03 00 DA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    JSR ($03FF,X)        ; FC FF 03 | Call local function
    STA $E0B8            ; 8D B8 E0 | Store to DMATransferStatus
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0689E          ; 22 9E 68 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $815F            ; 90 2E | Branch if carry clear
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation

    WDM $C5              ; 42 C5
    ASL $00              ; 06 00
    STA $00              ; 85 00
    JSL $C903EE          ; 22 EE 03 C9
    BRK $09              ; 00 09
    BRK $93              ; 00 93
    WDM $C5              ; 42 C5

;==============================================================================
; GeneralPurpose_009
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_009:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    LDA #$10             ; A9 10 | Load value into accumulator
    BRK $20              ; 00 20 | Software interrupt
    PLY                  ; 7A | Pull Y register from stack
    STY $AB              ; 84 AB | Store Y register
    


;==============================================================================
; GeneralPurpose_00A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00A:
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
; GeneralPurpose_00B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00B:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_00C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00C:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_00D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00D:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_00E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00E:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $8186            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $8189            ; 10 03 | Unknown operation
    JMP $8244            ; 4C 44 82 | Unknown operation
    JSR $8409            ; 20 09 84 | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $815B            ; 10 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    CPY $E0              ; C4 E0 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $816D            ; 10 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    INY                  ; C8 | Unknown operation
    CPX #$E2             ; E0 E2 | Unknown operation
    JSR $C4AD            ; 20 AD C4 | Call local function
    CPX #$EB             ; E0 EB | Unknown operation
    LDA $E0C8            ; AD C8 E0 | Load value into accumulator
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_00F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00F:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0B6            ; 8D B6 E0 | Store to DMATransferControl
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $8191            ; 10 C5 | Unknown operation
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $819F            ; 10 C5 | Unknown operation
    


;==============================================================================
; GeneralPurpose_010
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_010:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $81B0            ; 10 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    BPL $81C1            ; 10 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $DA0003,X        ; FF 03 00 DA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    BPL $81D2            ; 10 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    JSR ($03FF,X)        ; FC FF 03 | Call local function
    STA $E0B8            ; 8D B8 E0 | Store to DMATransferStatus
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    BPL $81E4            ; 10 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0675C          ; 22 5C 67 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $8244            ; 90 18 | Branch if carry clear
    JSR $8438            ; 20 38 84 | Call local function
    LDA $E0B8            ; AD B8 E0 | Load DMATransferStatus
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E0B6            ; AD B6 E0 | Load DMATransferControl
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_011
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_011:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
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
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_013
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_013:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_014
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_014:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_015
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_015:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $8264            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $8267            ; 10 03 | Unknown operation
    JMP $8322            ; 4C 22 83 | Unknown operation
    JSR $8409            ; 20 09 84 | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    CPY $E0              ; C4 E0 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    INY                  ; C8 | Unknown operation
    CPX #$E2             ; E0 E2 | Unknown operation
    JSR $C4AD            ; 20 AD C4 | Call local function
    CPX #$EB             ; E0 EB | Unknown operation
    LDA $E0C8            ; AD C8 E0 | Load value into accumulator
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_016
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_016:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0B6            ; 8D B6 E0 | Store to DMATransferControl
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    


;==============================================================================
; GeneralPurpose_017
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_017:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $D8              ; 00 D8 | Software interrupt
    EOR $C5              ; 41 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
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
    BRK $00              ; 00 00 | Software interrupt
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C067FD          ; 22 FD 67 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $8322            ; 90 18 | Branch if carry clear
    JSR $8438            ; 20 38 84 | Call local function
    LDA $E0B8            ; AD B8 E0 | Load DMATransferStatus
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E0B6            ; AD B6 E0 | Load DMATransferControl
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_018
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_018:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_019
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_019:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_01A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01A:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_01B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01B:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_01C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01C:
    PHB                  ; 8B | Push data bank register
    SEI                  ; 78 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA $E3E2,Y          ; B9 E2 E3 | Load value into accumulator
    BPL $8342            ; 10 05 | Unknown operation
    LDA $E4A2,Y          ; B9 A2 E4 | Load value into accumulator
    BPL $8345            ; 10 03 | Unknown operation
    JMP $8400            ; 4C 00 84 | Unknown operation
    JSR $8409            ; 20 09 84 | Call local function
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    CPY $E0              ; C4 E0 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    SBC $8D0000,X        ; FF 00 00 8D | Unknown operation
    INY                  ; C8 | Unknown operation
    CPX #$E2             ; E0 E2 | Unknown operation
    JSR $C4AD            ; 20 AD C4 | Call local function
    CPX #$EB             ; E0 EB | Unknown operation
    LDA $E0C8            ; AD C8 E0 | Load value into accumulator
    JSL $C01098          ; 22 98 10 C0 | Call external function
    


;==============================================================================
; GeneralPurpose_01D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01D:
    REP #$20             ; C2 20 | Clear processor status bits
    STA $E0B6            ; 8D B6 E0 | Store to DMATransferControl
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $00              ; 85 00 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    


;==============================================================================
; GeneralPurpose_01E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01E:
    PHP                  ; 08 | Push processor status to stack
    BRK $29              ; 00 29 | Software interrupt
    SBC $028500,X        ; FF 00 85 02 | Unknown operation
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $850000,X        ; FF 00 00 85 | Unknown operation
    TSB $7222            ; 0C 22 72 | Unknown operation
    ORA $C9              ; 05 C9 | Logical OR with accumulator
    BRK $09              ; 00 09 | Software interrupt
    BRK $93              ; 00 93 | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    SBC $DA0003,X        ; FF 03 00 DA | Unknown operation
    TAX                  ; AA | Transfer accumulator to X
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    ORA $00              ; 01 00 | Logical OR with accumulator
    JSR ($03FF,X)        ; FC FF 03 | Call local function
    STA $E0B8            ; 8D B8 E0 | Store to DMATransferStatus
    JSL $C90572          ; 22 72 05 C9 | Call external function
    BRK $04              ; 00 04 | Software interrupt
    BRK $9C              ; 00 9C | Software interrupt
    WDM $C5              ; 42 C5 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    SBC $AA0003,X        ; FF 03 00 AA | Unknown operation
    JSL $C0689E          ; 22 9E 68 C0 | Call external function
    PLX                  ; FA | Pull X register from stack
    BCC $8400            ; 90 18 | Branch if carry clear
    JSR $8438            ; 20 38 84 | Call local function
    LDA $E0B8            ; AD B8 E0 | Load DMATransferStatus
    STA $2E              ; 85 2E | Store accumulator to memory
    LDA $E0B6            ; AD B6 E0 | Load DMATransferControl
    JSL $C04A5B          ; 22 5B 4A C0 | Call external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_01F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01F:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_020
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_020:
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_021
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_021:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    LDA $E432,Y          ; B9 32 E4 | Load value into accumulator
    AND #$07             ; 29 07 | Logical AND with accumulator
    BRK $48              ; 00 48 | Software interrupt
    LDA $7E9686          ; AF 86 96 7E | Load value into accumulator
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    AND #$F8             ; 29 F8 | Logical AND with accumulator
    SBC $8D0103,X        ; FF 03 01 8D | Unknown operation
    TSX                  ; BA | Unknown operation
    CPX #$68             ; E0 68 | Unknown operation
    LDA $E452,Y          ; B9 52 E4 | Load value into accumulator
    AND #$08             ; 29 08 | Logical AND with accumulator
    BRK $48              ; 00 48 | Software interrupt
    LDA $7E9688          ; AF 88 96 7E | Load value into accumulator
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    AND #$F8             ; 29 F8 | Logical AND with accumulator
    SBC $8D0103,X        ; FF 03 01 8D | Unknown operation
    LDX $68E0,Y          ; BE E0 68 | Load X register
    RTS                  ; 60 | Return from local function
    STZ $04              ; 64 04 | Unknown operation
    LDA $E0C4            ; AD C4 E0 | Load value into accumulator
    STA $06              ; 85 06 | Store accumulator to memory
    STZ $08              ; 64 08 | Unknown operation
    LDA $E0C8            ; AD C8 E0 | Load value into accumulator
    STA $0A              ; 85 0A | Store accumulator to memory
    LDA $E442,Y          ; B9 42 E4 | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $E432,Y          ; F9 32 E4 | Unknown operation
    INC                  ; 1A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    ASL                  ; 0A | Arithmetic shift left
    STA $0E              ; 85 0E | Store accumulator to memory
    LDX #$18             ; A2 18 | Load X register
    BRK $85              ; 00 85 | Software interrupt
    CLC                  ; 18 | Clear carry flag
    LDA $E0BE            ; AD BE E0 | Load value into accumulator
    SEC                  ; 38 | Set carry flag

    SEC                  ; 38
    SBC $E452,Y          ; F9 52 E4
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    JSL $C010D6          ; 22 D6 10 C0
    LDA $E0BA            ; AD BA E0
    SEC                  ; 38
    SBC $E432,Y          ; F9 32 E4
    LSR                  ; 4A
    LSR                  ; 4A
    LSR                  ; 4A
    ASL                  ; 0A
    CLC                  ; 18
    ADC $18              ; 65 18
    ADC $E412,Y          ; 79 12 E4
    TAX                  ; AA
    RTS                  ; 60
    JSL $C05A71          ; 22 71 5A C0
    BCC $84A3            ; 90 23
    JSR $84A4            ; 20 A4 84
    LDA $E412,Y          ; B9 12 E4
    TAX                  ; AA
    LDA $E0B6            ; AD B6 E0
    JSL $C04923          ; 22 23 49 C0
    TAY                  ; A8
    LDA $E0B8            ; AD B8 E0
    STA $18              ; 85 18
    LDA $0000,X          ; BD 00 00
    CLC                  ; 18
    ADC $18              ; 65 18
    STA $0000,X          ; 9D 00 00
    INX                  ; E8
    INX                  ; E8
    DEY                  ; 88
    BNE $8494            ; D0 F2
    SEC                  ; 38
    RTS                  ; 60
    STA $E3F2,Y          ; 99 F2 E3
    LDA $FC4C            ; AD 4C FC
    STA $E472,Y          ; 99 72 E4
    LDA $FC4A            ; AD 4A FC
    STA $E4B2,Y          ; 99 B2 E4
    LDX $AE9A            ; AE 9A AE
    TXA                  ; 8A
    STA $E4A2,Y          ; 99 A2 E4
    LDA $ADF4,X          ; BD F4 AD
    STA $E412,Y          ; 99 12 E4
    LDA #$7F             ; A9 7F
    BRK $99              ; 00 99
    JSL $50ADE4          ; 22 E4 AD 50
    LDA $99              ; B7 99
    BRL $32B1            ; 82 E4 AD
    LDX #$AE             ; A2 AE
    STA $E492,Y          ; 99 92 E4
    LDA $B754            ; AD 54 B7
    STA $E4C2,Y          ; 99 C2 E4
    LDA #$00             ; A9 00
    BRA $8475            ; 80 99

;==============================================================================
; GeneralPurpose_022
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_022:
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
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    COP $E4              ; 02 E4 | Unknown operation
    LDA $E0B2            ; AD B2 E0 | Load value into accumulator
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    PHA                  ; 48 | Push accumulator to stack
    LDA $FC46            ; AD 46 FC | Load value into accumulator
    STA $E432,Y          ; 99 32 E4 | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC $01              ; 63 01 | Unknown operation
    DEC                  ; 3A | Unknown operation
    STA $E442,Y          ; 99 42 E4 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    LDA $E0B4            ; AD B4 E0 | Load value into accumulator
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
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
; GeneralPurpose_023
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_023:
    REP #$30             ; C2 30 | Clear processor status bits
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    TAX                  ; AA | Transfer accumulator to X
    CPX #$3C             ; E0 3C | Unknown operation
    COP $90              ; 02 90 | Unknown operation
    ORA $A2              ; 03 A2 | Logical OR with accumulator
    ORA $00              ; 01 00 | Logical OR with accumulator
    


;==============================================================================
; GeneralPurpose_024
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_024:
    SEP #$20             ; E2 20 | Set processor status bits
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    BRK $00              ; 00 00 | Software interrupt
    STA $7F8C            ; 8D 8C 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $00              ; 01 00 | Logical OR with accumulator
    STA $7F8A            ; 8D 8A 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    COP $00              ; 02 00 | Unknown operation
    STA $7F90            ; 8D 90 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $00              ; 03 00 | Logical OR with accumulator
    STA $7F92            ; 8D 92 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    TSB $00              ; 04 00 | Unknown operation
    STA $7F94            ; 8D 94 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $00              ; 05 00 | Logical OR with accumulator
    STA $7F96            ; 8D 96 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ASL $00              ; 06 00 | Arithmetic shift left
    STA $7F98            ; 8D 98 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $00              ; 07 00 | Logical OR with accumulator
    STA $7F9A            ; 8D 9A 7F | Store accumulator to memory

    STA $7F9A            ; 8D 9A 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0

;==============================================================================
; GeneralPurpose_025
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_025:
    PHP                  ; 08 | Push processor status to stack
    BRK $8D              ; 00 8D | Software interrupt
    


;==============================================================================
; GeneralPurpose_026
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_026:
    REP #$7F             ; C2 7F | Clear processor status bits
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA #$00             ; 09 00 | Logical OR with accumulator
    STA $7FC3            ; 8D C3 7F | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ASL                  ; 0A | Arithmetic shift left
    BRK $8D              ; 00 8D | Software interrupt
    TSX                  ; BA | Unknown operation
    ADC $03EE22,X        ; 7F 22 EE 03 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    BIT $00,X            ; 34 00 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    CPY #$0B             ; C0 0B | Unknown operation
    BRK $8D              ; 00 8D | Software interrupt
    LDY $227F,X          ; BC 7F 22 | Load Y register
    INC $C903            ; EE 03 C9 | Unknown operation
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    TSB $8D00            ; 0C 00 8D | Unknown operation
    LDX $227F,Y          ; BE 7F 22 | Load X register
    INC $C903            ; EE 03 C9 | Unknown operation
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $8D00            ; 0D 00 8D | Logical OR with accumulator
    INY                  ; C8 | Unknown operation
    ADC $03EE22,X        ; 7F 22 EE 03 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    BIT $00,X            ; 34 00 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator
    CPY #$0E             ; C0 0E | Unknown operation
    BRK $8D              ; 00 8D | Software interrupt
    CPY $227F            ; CC 7F 22 | Unknown operation
    INC $C903            ; EE 03 C9 | Unknown operation
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $CA8D00          ; 0F 00 8D CA | Logical OR with accumulator
    ADC $03EE22,X        ; 7F 22 EE 03 | Unknown operation
    CMP #$00             ; C9 00 | Compare with accumulator
    BIT $00,X            ; 34 00 | Unknown operation
    ORA $00              ; 03 00 | Logical OR with accumulator

    ORA $00              ; 03 00
    CPY #$10             ; C0 10
    BRK $8D              ; 00 8D
    DEC $227F            ; CE 7F 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 11 00
    STA $7FD0            ; 8D D0 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ORA $00              ; 12 00
    STA $7FD2            ; 8D D2 7F

;==============================================================================
; GeneralPurpose_027
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_027:
    REP #$30             ; C2 30 | Clear processor status bits
    STX $99D9            ; 8E D9 99 | Store X register
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $00,X            ; 15 00 | Logical OR with accumulator
    STA $99F1            ; 8D F1 99 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $00              ; 17 00 | Logical OR with accumulator
    STA $99ED            ; 8D ED 99 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $8D00,Y          ; 19 00 8D | Logical OR with accumulator
    SBC $99              ; F3 99 | Unknown operation
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    TCS                  ; 1B | Unknown operation
    BRK $8D              ; 00 8D | Software interrupt
    SBC $EE2299          ; EF 99 22 EE | Unknown operation
    ORA $C9              ; 03 C9 | Logical OR with accumulator
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $8D00,X          ; 1D 00 8D | Logical OR with accumulator
    SBC $99,X            ; F5 99 | Unknown operation
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    ORA $718D00,X        ; 1F 00 8D 71 | Logical OR with accumulator
    LDY $22,X            ; B4 22 | Load Y register
    INC $C903            ; EE 03 C9 | Unknown operation
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt
    AND $00              ; 23 00 | Logical AND with accumulator
    STA $B475            ; 8D 75 B4 | Store accumulator to memory
    JSL $C903EE          ; 22 EE 03 C9 | Call external function
    BRK $34              ; 00 34 | Software interrupt
    BRK $03              ; 00 03 | Software interrupt
    BRK $C0              ; 00 C0 | Software interrupt

    BRK $C0              ; 00 C0
    ORA $00              ; 13 00
    STA $7FD4            ; 8D D4 7F
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    AND $00              ; 25 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    ADC $22B4,Y          ; 79 B4 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ROL $00              ; 26 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    TDC                  ; 7B
    LDY $22,X            ; B4 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    AND $00              ; 27 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    ADC $22B4,X          ; 7D B4 22
    INC $C903            ; EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    PLP                  ; 28
    BRK $29              ; 00 29
    SBC $7F8D00,X        ; FF 00 8D 7F
    LDY $8D,X            ; B4 8D
    STA $B4              ; 83 B4
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    AND #$00             ; 29 00
    AND #$FF             ; 29 FF
    BRK $8D              ; 00 8D
    STA $B4              ; 81 B4
    JSR $87DC            ; 20 DC 87
    LDA #$00             ; A9 00
    BRK $9C              ; 00 9C
    CPY #$7F             ; C0 7F
    STZ $7F8E            ; 9C 8E 7F
    STZ $7FC4            ; 9C C4 7F
    STZ $7FC6            ; 9C C6 7F
    LDA $7F8A            ; AD 8A 7F
    AND #$03             ; 29 03
    BRK $0A              ; 00 0A
    XBA                  ; EB
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    STA $99E3            ; 8D E3 99
    LDA $7F98            ; AD 98 7F
    AND #$0F             ; 29 0F
    BRK $EB              ; 00 EB
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    STA $99DB            ; 8D DB 99
    LDA $7F98            ; AD 98 7F
    AND #$F0             ; 29 F0
    BRK $EB              ; 00 EB
    STA $99DD            ; 8D DD 99
    LDA $7F9A            ; AD 9A 7F
    AND #$0F             ; 29 0F
    BRK $EB              ; 00 EB
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    STA $99DF            ; 8D DF 99
    LDA $7F9A            ; AD 9A 7F
    AND #$F0             ; 29 F0
    BRK $EB              ; 00 EB
    STA $99E1            ; 8D E1 99
    LDA $7F90            ; AD 90 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99E5            ; 8D E5 99
    LDA $7F92            ; AD 92 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99E7            ; 8D E7 99
    LDA $7F94            ; AD 94 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99E9            ; 8D E9 99
    LDA $7F96            ; AD 96 7F
    AND #$FC             ; 29 FC
    BRK $EB              ; 00 EB
    STA $99EB            ; 8D EB 99
    LDA $B471            ; AD 71 B4
    JSL $C014F2          ; 22 F2 14 C0
    STA $B473            ; 8D 73 B4
    LDA $B471            ; AD 71 B4
    ASL                  ; 0A
    TAX                  ; AA
    LDA $99E5,X          ; BD E5 99
    STA $B477            ; 8D 77 B4
    LDA $99D9            ; AD D9 99
    CMP #$0A             ; C9 0A
    BRK $F0              ; 00 F0
    ORA $20              ; 05 20
    JMP $8088            ; 4C 88 80
    ORA $20              ; 03 20

;==============================================================================
; GeneralPurpose_028
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_028:
    REP #$88             ; C2 88 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    RTL                  ; 6B | Return from external function
    LDA $B481            ; AD 81 B4 | Load value into accumulator
    JSR $8847            ; 20 47 88 | Call local function
    STA $B48D            ; 8D 8D B4 | Store accumulator to memory
    LDA $B47F            ; AD 7F B4 | Load value into accumulator
    JSR $8847            ; 20 47 88 | Call local function
    STA $B48F            ; 8D 8F B4 | Store accumulator to memory
    LDA $B471            ; AD 71 B4 | Load value into accumulator
    CMP #$02             ; C9 02 | Compare with accumulator
    BRK $F0              ; 00 F0 | Software interrupt
    AND $AD              ; 25 AD | Logical AND with accumulator
    ADC $20B4,Y          ; 79 B4 20 | Unknown operation
    RTI                  ; 40 | Unknown operation
    DEY                  ; 88 | Unknown operation
    STA $B485            ; 8D 85 B4 | Store accumulator to memory
    LDA $B47B            ; AD 7B B4 | Load value into accumulator
    JSR $8840            ; 20 40 88 | Call local function
    STA $B487            ; 8D 87 B4 | Store accumulator to memory
    LDA $B47D            ; AD 7D B4 | Load value into accumulator
    JSR $8840            ; 20 40 88 | Call local function
    STA $B489            ; 8D 89 B4 | Store accumulator to memory
    LDA $B47F            ; AD 7F B4 | Load value into accumulator
    JSR $8840            ; 20 40 88 | Call local function
    STA $B48B            ; 8D 8B B4 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    LDA $B479            ; AD 79 B4 | Load value into accumulator
    JSR $8847            ; 20 47 88 | Call local function
    STA $B485            ; 8D 85 B4 | Store accumulator to memory
    LDA $B47B            ; AD 7B B4 | Load value into accumulator
    JSR $8847            ; 20 47 88 | Call local function
    STA $B487            ; 8D 87 B4 | Store accumulator to memory
    LDA $B47D            ; AD 7D B4 | Load value into accumulator
    JSR $8847            ; 20 47 88 | Call local function
    STA $B489            ; 8D 89 B4 | Store accumulator to memory
    LDA $B47F            ; AD 7F B4 | Load value into accumulator
    JSR $8847            ; 20 47 88 | Call local function
    STA $B48B            ; 8D 8B B4 | Store accumulator to memory
    RTS                  ; 60 | Return from local function
    AND #$70             ; 29 70 | Logical AND with accumulator
    BRK $EB              ; 00 EB | Software interrupt
    LSR                  ; 4A | Unknown operation
    LSR                  ; 4A | Unknown operation
    RTS                  ; 60 | Return from local function
    AND #$1C             ; 29 1C | Logical AND with accumulator
    BRK $EB              ; 00 EB | Software interrupt

    BRK $EB              ; 00 EB
    RTS                  ; 60
    PEA $7F7F            ; F4 7F 7F
    PLB                  ; AB
    PLB                  ; AB
    LDA #$01             ; A9 01
    BRK $8D              ; 00 8D

;==============================================================================
; GeneralPurpose_029
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_029:
    REP #$E3             ; C2 E3 | Clear processor status bits
    LDA #$20             ; A9 20 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    LDA $E3              ; B2 E3 | Load value into accumulator
    LDA #$F8             ; A9 F8 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    LDX $E3,Y            ; B6 E3 | Load X register
    LDA #$1B             ; A9 1B | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    LDY $E3,X            ; B4 E3 | Load Y register
    LDA #$D8             ; A9 D8 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    CLV                  ; B8 | Unknown operation
    SBC $A9              ; E3 A9 | Unknown operation
    SBC $BA8D00,X        ; FF 00 8D BA | Unknown operation
    SBC $A9              ; E3 A9 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    STA $E3BC            ; 8D BC E3 | Store accumulator to memory
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    STA $E3BE            ; 8D BE E3 | Store accumulator to memory
    LDA #$08             ; A9 08 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    CPY #$E3             ; C0 E3 | Unknown operation
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA #$78             ; A9 78 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STX $A996            ; 8E 96 A9 | Store X register
    RTS                  ; 60 | Return from local function
    BRK $8D              ; 00 8D | Software interrupt
    BCC $882D            ; 90 96 | Branch if carry clear
    LDA #$70             ; A9 70 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STA $96              ; 92 96 | Store accumulator to memory
    LDA #$58             ; A9 58 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STY $96,X            ; 94 96 | Store Y register
    LDA #$78             ; A9 78 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STX $96,Y            ; 96 96 | Store X register
    LDA #$70             ; A9 70 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    TYA                  ; 98 | Unknown operation
    STX $A9,Y            ; 96 A9 | Store X register
    BEQ $88B2            ; F0 00 | Branch if equal (zero flag set)
    STA $969A            ; 8D 9A 96 | Store accumulator to memory
    LDA #$D0             ; A9 D0 | Load value into accumulator

    LDA #$D0             ; A9 D0
    BRK $8D              ; 00 8D
    STZ $A996            ; 9C 96 A9

;==============================================================================
; GeneralPurpose_02A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02A:
    PHP                  ; 08 | Push processor status to stack
    BRK $8D              ; 00 8D | Software interrupt
    STZ $6096,X          ; 9E 96 60 | Unknown operation
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA #$01             ; A9 01 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    


;==============================================================================
; GeneralPurpose_02B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02B:
    REP #$E3             ; C2 E3 | Clear processor status bits
    LDA #$80             ; A9 80 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    LDA $E3              ; B2 E3 | Load value into accumulator
    LDA #$78             ; A9 78 | Load value into accumulator
    COP $8D              ; 02 8D | Unknown operation
    LDX $E3,Y            ; B6 E3 | Load X register
    LDA #$80             ; A9 80 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    LDY $E3,X            ; B4 E3 | Load Y register
    LDA #$78             ; A9 78 | Load value into accumulator
    COP $8D              ; 02 8D | Unknown operation
    CLV                  ; B8 | Unknown operation
    SBC $A9              ; E3 A9 | Unknown operation
    SBC $BA8D03,X        ; FF 03 8D BA | Unknown operation
    SBC $A9              ; E3 A9 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    STA $E3BC            ; 8D BC E3 | Store accumulator to memory
    ASL                  ; 0A | Arithmetic shift left
    ASL                  ; 0A | Arithmetic shift left
    STA $E3BE            ; 8D BE E3 | Store accumulator to memory
    LDA #$08             ; A9 08 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    CPY #$E3             ; C0 E3 | Unknown operation
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA #$78             ; A9 78 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STX $A996            ; 8E 96 A9 | Store X register
    RTS                  ; 60 | Return from local function
    BRK $8D              ; 00 8D | Software interrupt
    BCC $88A3            ; 90 96 | Branch if carry clear
    LDA #$70             ; A9 70 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STA $96              ; 92 96 | Store accumulator to memory
    LDA #$58             ; A9 58 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STY $96,X            ; 94 96 | Store Y register
    LDA #$78             ; A9 78 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    STX $96,Y            ; 96 96 | Store X register
    LDA #$70             ; A9 70 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    TYA                  ; 98 | Unknown operation
    STX $A9,Y            ; 96 A9 | Store X register
    BEQ $8928            ; F0 00 | Branch if equal (zero flag set)
    STA $969A            ; 8D 9A 96 | Store accumulator to memory
    LDA #$D0             ; A9 D0 | Load value into accumulator

    LDA #$D0             ; A9 D0
    BRK $8D              ; 00 8D
    STZ $A996            ; 9C 96 A9

;==============================================================================
; GeneralPurpose_02C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02C:
    PHP                  ; 08 | Push processor status to stack
    BRK $8D              ; 00 8D | Software interrupt
    STZ $6096,X          ; 9E 96 60 | Unknown operation
    


;==============================================================================
; GeneralPurpose_02D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02D:
    REP #$30             ; C2 30 | Clear processor status bits
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDX $B475            ; AE 75 B4 | Load X register
    JSR ($8949,X)        ; FC 49 89 | Call local function
    JSR $8951            ; 20 51 89 | Call local function
    RTL                  ; 6B | Return from external function
    ADC $89,X            ; 75 89 | Unknown operation
    ROR $89,X            ; 76 89 | Unknown operation
    LDA $89              ; A5 89 | Load value into accumulator
    SBC #$89             ; E9 89 | Unknown operation
    LDA #$81             ; A9 81 | Load value into accumulator
    ADC $8D              ; 61 8D | Unknown operation
    BVS $88ED            ; 70 96 | Unknown operation
    LDA #$C5             ; A9 C5 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    ADC $96              ; 72 96 | Unknown operation
    LDA $99EF            ; AD EF 99 | Load value into accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$00             ; 69 00 | Unknown operation
    ORA $8D              ; 07 8D | Logical OR with accumulator
    STZ $96,X            ; 74 96 | Unknown operation
    LDA #$70             ; A9 70 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    ROR $96,X            ; 76 96 | Unknown operation
    LDX #$70             ; A2 70 | Load X register
    STX $22,Y            ; 96 22 | Store X register
    STA $25              ; 87 25 | Store accumulator to memory
    CPY #$60             ; C0 60 | Unknown operation
    RTS                  ; 60 | Return from local function
    LDA #$00             ; A9 00 | Load value into accumulator
    BPL $899A            ; 10 20 | Unknown operation
    LDY $AC8A,X          ; BC 8A AC | Load Y register
    RTI                  ; 40 | Unknown operation
    TYA                  ; 98 | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRK $E2              ; 00 E2 | Software interrupt
    JSR $81BF            ; 20 BF 81 | Call local function
    EOR $C5              ; 51 C5 | Unknown operation
    PHA                  ; 48 | Push accumulator to stack
    LDA $C55182,X        ; BF 82 51 C5 | Load value into accumulator
    AND $01              ; 23 01 | Logical AND with accumulator
    STA $0001,Y          ; 99 01 00 | Store accumulator to memory
    PLA                  ; 68 | Pull accumulator from stack
    STA $0000,Y          ; 99 00 00 | Store accumulator to memory
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    INY                  ; C8 | Unknown operation

    INY                  ; C8
    INY                  ; C8
    CPX #$00             ; E0 00
    BPL $892E            ; 10 90
    SBC $C2              ; E5 C2
    JSR $C120            ; 20 20 C1
    BIT #$60             ; 89 60
    LDA #$00             ; A9 00
    BPL $89C9            ; 10 20
    LDY $AC8A,X          ; BC 8A AC
    RTI                  ; 40
    TYA                  ; 98
    LDX #$00             ; A2 00
    BRK $BF              ; 00 BF
    STA $51              ; 81 51
    CMP $99              ; C5 99
    BRK $00              ; 00 00
    INX                  ; E8
    INX                  ; E8
    INY                  ; C8
    INY                  ; C8
    CPX #$00             ; E0 00
    BPL $8950            ; 10 90
    BEQ $896E            ; F0 AC
    LDX $AD93            ; AE 93 AD
    RTI                  ; 40
    TYA                  ; 98
    STA $8BAE,Y          ; 99 AE 8B
    LDA #$7E             ; A9 7E
    BRK $99              ; 00 99
    LDX $AD8D            ; AE 8D AD
    SBC $9999            ; ED 99 99
    LDX $AD8F            ; AE 8F AD
    WDM $98              ; 42 98
    STA $91AE,Y          ; 99 AE 91
    INY                  ; C8
    INY                  ; C8
    STY $93AE            ; 8C AE 93
    JSL $C02892          ; 22 92 28 C0
    JSR $8AD2            ; 20 D2 8A
    RTS                  ; 60
    LDA #$00             ; A9 00
    BPL $8A0D            ; 10 20
    LDY $AC8A,X          ; BC 8A AC
    RTI                  ; 40
    TYA                  ; 98
    LDX #$00             ; A2 00
    BRK $20              ; 00 20
    EOR $8A              ; 51 8A
    LDY $93AE            ; AC AE 93
    LDA $9840            ; AD 40 98
    STA $8BAE,Y          ; 99 AE 8B
    LDA #$7E             ; A9 7E
    BRK $99              ; 00 99
    LDX $AD8D            ; AE 8D AD
    SBC $9999            ; ED 99 99
    LDX $AD8F            ; AE 8F AD
    WDM $98              ; 42 98
    STA $91AE,Y          ; 99 AE 91
    INY                  ; C8
    INY                  ; C8
    STY $93AE            ; 8C AE 93
    JSL $C02892          ; 22 92 28 C0
    LDY $9840            ; AC 40 98
    LDX #$00             ; A2 00

;==============================================================================
; GeneralPurpose_02E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02E:
    PHP                  ; 08 | Push processor status to stack
    JSR $8A51            ; 20 51 8A | Call local function
    LDY $93AE            ; AC AE 93 | Load Y register
    LDA $9840            ; AD 40 98 | Load value into accumulator
    STA $8BAE,Y          ; 99 AE 8B | Store accumulator to memory
    LDA #$7E             ; A9 7E | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    LDX $AD8D            ; AE 8D AD | Load X register
    SBC $1899            ; ED 99 18 | Unknown operation
    ADC #$00             ; 69 00 | Unknown operation
    


;==============================================================================
; GeneralPurpose_02F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02F:
    PHP                  ; 08 | Push processor status to stack
    STA $8FAE,Y          ; 99 AE 8F | Store accumulator to memory
    LDA $9842            ; AD 42 98 | Load value into accumulator
    STA $91AE,Y          ; 99 AE 91 | Store accumulator to memory
    INY                  ; C8 | Unknown operation
    INY                  ; C8 | Unknown operation
    STY $93AE            ; 8C AE 93 | Store Y register
    JSL $C02892          ; 22 92 28 C0 | Call external function
    JSR $8AD2            ; 20 D2 8A | Call local function
    RTS                  ; 60 | Return from local function
    LDA #$80             ; A9 80 | Load value into accumulator
    BRK $8D              ; 00 8D | Software interrupt
    MVP $BF98            ; 44 98 BF | Unknown operation
    STA $51              ; 81 51 | Store accumulator to memory
    CMP $99              ; C5 99 | Compare with accumulator
    BRK $00              ; 00 00 | Software interrupt
    LDA $C55183,X        ; BF 83 51 C5 | Load value into accumulator
    STA $0002,Y          ; 99 02 00 | Store accumulator to memory
    LDA $C55185,X        ; BF 85 51 C5 | Load value into accumulator
    STA $0004,Y          ; 99 04 00 | Store accumulator to memory
    LDA $C55187,X        ; BF 87 51 C5 | Load value into accumulator
    STA $0006,Y          ; 99 06 00 | Store accumulator to memory
    LDA $C55189,X        ; BF 89 51 C5 | Load value into accumulator
    STA $0008,Y          ; 99 08 00 | Store accumulator to memory
    LDA $C5518B,X        ; BF 8B 51 C5 | Load value into accumulator
    STA $000A,Y          ; 99 0A 00 | Store accumulator to memory
    LDA $C5518D,X        ; BF 8D 51 C5 | Load value into accumulator
    STA $000C,Y          ; 99 0C 00 | Store accumulator to memory
    LDA $C5518F,X        ; BF 8F 51 C5 | Load value into accumulator
    STA $000E,Y          ; 99 0E 00 | Store accumulator to memory
    LDA #$FF             ; A9 FF | Load value into accumulator
    SBC $001099,X        ; FF 99 10 00 | Unknown operation
    STA $0012,Y          ; 99 12 00 | Store accumulator to memory
    STA $0014,Y          ; 99 14 00 | Store accumulator to memory
    STA $0016,Y          ; 99 16 00 | Store accumulator to memory
    STA $0018,Y          ; 99 18 00 | Store accumulator to memory
    STA $001A,Y          ; 99 1A 00 | Store accumulator to memory
    STA $001C,Y          ; 99 1C 00 | Store accumulator to memory
    STA $001E,Y          ; 99 1E 00 | Store accumulator to memory
    TXA                  ; 8A | Transfer X to accumulator
    CLC                  ; 18 | Clear carry flag
    ADC #$10             ; 69 10 | Unknown operation
    BRK $AA              ; 00 AA | Software interrupt
    TYA                  ; 98 | Unknown operation
    CLC                  ; 18 | Clear carry flag
    ADC #$20             ; 69 20 | Unknown operation
    BRK $A8              ; 00 A8 | Software interrupt
    DEC $9844            ; CE 44 98 | Unknown operation
    BNE $8A57            ; D0 9C | Branch if not equal (zero flag clear)

    BNE $8A57            ; D0 9C
    RTS                  ; 60
    STA $9842            ; 8D 42 98
    JSL $C08DA0          ; 22 A0 8D C0
    BCS $8AC5            ; B0 00
    LDA $7DC8            ; AD C8 7D
    STA $983E            ; 8D 3E 98
    LDA $7DCC            ; AD CC 7D
    STA $9840            ; 8D 40 98
    RTS                  ; 60
    LDX $983E            ; AE 3E 98
    JSL $C08E1B          ; 22 1B 8E C0
    RTS                  ; 60

;==============================================================================
; GeneralPurpose_030
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_030:
    REP #$30             ; C2 30 | Clear processor status bits
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    LDA $B479            ; AD 79 B4 | Load value into accumulator
    JSR $8B66            ; 20 66 8B | Call local function
    LDA #$DE             ; A9 DE | Load value into accumulator
    ADC $99              ; 77 99 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    LDA #$C6             ; A9 C6 | Load value into accumulator
    TRB $99              ; 14 99 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    LDA #$DE             ; A9 DE | Load value into accumulator
    ADC $99              ; 77 99 | Unknown operation
    TSB $00              ; 04 00 | Unknown operation
    LDA $B47B            ; AD 7B B4 | Load value into accumulator
    JSR $8B66            ; 20 66 8B | Call local function
    LDA #$DE             ; A9 DE | Load value into accumulator
    ADC $99              ; 77 99 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    LDA #$C6             ; A9 C6 | Load value into accumulator
    TRB $99              ; 14 99 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    LDA #$5F             ; A9 5F | Load value into accumulator
    AND $000499,X        ; 3F 99 04 00 | Logical AND with accumulator
    LDA $B47D            ; AD 7D B4 | Load value into accumulator
    JSR $8B66            ; 20 66 8B | Call local function
    LDA #$DE             ; A9 DE | Load value into accumulator
    ADC $99              ; 77 99 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    LDA #$C6             ; A9 C6 | Load value into accumulator
    TRB $99              ; 14 99 | Unknown operation
    COP $00              ; 02 00 | Unknown operation
    LDA #$9F             ; A9 9F | Load value into accumulator
    PHY                  ; 5A | Push Y register to stack
    STA $0004,Y          ; 99 04 00 | Store accumulator to memory
    LDA $B47F            ; AD 7F B4 | Load value into accumulator
    JSR $8B66            ; 20 66 8B | Call local function
    LDA #$73             ; A9 73 | Load value into accumulator
    LSR                  ; 4A | Unknown operation
    STA $0000,Y          ; 99 00 00 | Store accumulator to memory
    LDA #$84             ; A9 84 | Load value into accumulator
    TSB $0299            ; 0C 99 02 | Unknown operation
    BRK $A9              ; 00 A9 | Software interrupt
    ADC $4A              ; 73 4A | Unknown operation
    STA $0004,Y          ; 99 04 00 | Store accumulator to memory

    STA $0004,Y          ; 99 04 00
    LDA $B479            ; AD 79 B4
    JSR $8B66            ; 20 66 8B
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    BRK $00              ; 00 00
    LDA #$C6             ; A9 C6
    TRB $99              ; 14 99
    COP $00              ; 02 00
    LDA #$DE             ; A9 DE
    ADC $99              ; 77 99
    TSB $00              ; 04 00
    PLY                  ; 7A
    LDA #$00             ; A9 00
    BRK $99              ; 00 99
    SEC                  ; 38
    BRK $FA              ; 00 FA
    PLA                  ; 68
    RTL                  ; 6B
    ASL                  ; 0A
    ADC $03              ; 63 03
    TAY                  ; A8
    RTS                  ; 60
    LDA #$06             ; A9 06
    BRK $22              ; 00 22
    TRB $C8              ; 14 C8
    CPY #$22             ; C0 22
    ASL $8D              ; 06 8D
    CPY #$22             ; C0 22
    STZ $C08B            ; 9C 8B C0
    JSL $C028B4          ; 22 B4 28 C0
    RTL                  ; 6B
    LDA #$06             ; A9 06
    BRK $22              ; 00 22
    TRB $C8              ; 14 C8
    CPY #$22             ; C0 22
    ASL $8D              ; 06 8D
    CPY #$22             ; C0 22
    STZ $C08B            ; 9C 8B C0
    RTL                  ; 6B
    JSL $C08D3C          ; 22 3C 8D C0
    JSL $C08B9C          ; 22 9C 8B C0
    JSL $C028B4          ; 22 B4 28 C0
    RTL                  ; 6B
    LDA #$71             ; A9 71
    LDA $77AE            ; AD AE 77
    LDY $A0,X            ; B4 A0
    BRK $07              ; 00 07
    JSL $C02627          ; 22 27 26 C0
    LDA #$01             ; A9 01
    BRK $8D              ; 00 8D
    INX                  ; E8
    ADC $DA486B,X        ; 7F 6B 48 DA
    PHY                  ; 5A
    CPX #$00             ; E0 00
    ORA $B0              ; 07 B0
    INC $F2BD,X          ; FE BD F2
    PLD                  ; 2B
    STA $AD71,X          ; 9D 71 AD
    PHX                  ; DA
    TXA                  ; 8A
    LSR                  ; 4A
    CLC                  ; 18
    ADC $B477            ; 6D 77 B4
    TAX                  ; AA
    LDY #$02             ; A0 02
    BRK $68              ; 00 68
    CLC                  ; 18
    ADC #$71             ; 69 71
    LDA $2722            ; AD 22 27
    ROL $C0              ; 26 C0
    JSL $C028B4          ; 22 B4 28 C0
    PLY                  ; 7A
    PLX                  ; FA
    PLA                  ; 68
    RTL                  ; 6B
    LDA #$00             ; A9 00
    BRK $8D              ; 00 8D
    STA $B4              ; 93 B4
    LDA #$1B             ; A9 1B
    BRK $8D              ; 00 8D
    STA $B4,X            ; 95 B4
    JMP $C08C06          ; 5C 06 8C C0
    LDA $B493            ; AD 93 B4
    CMP $B495            ; CD 95 B4
    BEQ $8C02            ; F0 10
    BCC $8C02            ; 90 0E
    LDA $B493            ; AD 93 B4
    PHA                  ; 48
    LDA $B495            ; AD 95 B4
    STA $B493            ; 8D 93 B4
    PLA                  ; 68
    STA $B495            ; 8D 95 B4
    JMP $C08C06          ; 5C 06 8C C0
    JSL $C08D06          ; 22 06 8D C0
    LDA $B493            ; AD 93 B4
    AND #$FE             ; 29 FE
    SBC $978D0A,X        ; FF 0A 8D 97
    LDY $AD,X            ; B4 AD
    STA $B4,X            ; 95 B4
    AND #$FE             ; 29 FE
    SBC $998D0A,X        ; FF 0A 8D 99
    LDY $9C,X            ; B4 9C
    TXY                  ; 9B
    LDY $AE,X            ; B4 AE
    STA $ADB4,Y          ; 99 B4 AD
    STA $F0B4,X          ; 9D B4 F0
    TRB $BD              ; 14 BD
    AND $F0C0,Y          ; 39 C0 F0
    ORA $20              ; 03 20
    LDY $8C              ; A4 8C
    LDA $C03B,X          ; BD 3B C0
    BEQ $8C3D            ; F0 07
    PHX                  ; DA
    INX                  ; E8
    INX                  ; E8
    JSR $8CA4            ; 20 A4 8C
    PLX                  ; FA
    LDA $F59D,X          ; BD 9D F5
    CMP #$FF             ; C9 FF
    BRK $F0              ; 00 F0
    ORA $20              ; 05 20
    STZ $8C,X            ; 74 8C
    BRA $8C55            ; 80 0B
    LDA $F59F,X          ; BD 9F F5
    CMP #$FF             ; C9 FF
    BRK $F0              ; 00 F0
    ORA $20              ; 03 20
    STZ $8C,X            ; 74 8C
    LDA $B49B            ; AD 9B B4
    BEQ $8C5E            ; F0 04
    JSL $C028B4          ; 22 B4 28 C0
    LDX $B499            ; AE 99 B4
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    DEX                  ; CA
    STX $B499            ; 8E 99 B4
    BMI $8C6F            ; 30 05
    CPX $B497            ; EC 97 B4
    BCS $8C1E            ; B0 AF
    JSL $C0CBA0          ; 22 A0 CB C0
    RTL                  ; 6B
    PHX                  ; DA
    JSL $C0CBF9          ; 22 F9 CB C0
    INX                  ; E8
    INX                  ; E8
    JSL $C0CBF9          ; 22 F9 CB C0
    INC $7FE6            ; EE E6 7F
    LDA $B499            ; AD 99 B4
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ADC $B477            ; 6D 77 B4
    TAX                  ; AA
    LDA $B499            ; AD 99 B4
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ASL                  ; 0A
    ADC #$71             ; 69 71
    LDA $80A0            ; AD A0 80
    BRK $22              ; 00 22
    AND $26              ; 27 26
    CPY #$EE             ; C0 EE
    TXY                  ; 9B
    LDY $FA,X            ; B4 FA
    RTS                  ; 60
    PHX                  ; DA
    PHY                  ; 5A
    STZ $BE43            ; 9C 43 BE
    STZ $C039,X          ; 9E 39 C0
    TXA                  ; 8A
    LSR                  ; 4A
    ADC $03              ; 63 03
    TAY                  ; A8
    LDX $99D9            ; AE D9 99
    JSL $C903EE          ; 22 EE 03 C9
    BRK $34              ; 00 34
    BRK $03              ; 00 03
    BRK $C0              ; 00 C0
    ROL                  ; 2A
    BRK $29              ; 00 29
    SBC $AA0A00,X        ; FF 00 0A AA
    JSR ($8CCE,X)        ; FC CE 8C
    INC $B49B            ; EE 9B B4
    PLY                  ; 7A
    PLX                  ; FA
    RTS                  ; 60
    PEI $8C              ; D4 8C
    PEI $8C              ; D4 8C
    SBC $A98C,Y          ; F9 8C A9
    AND $2A99EE,X        ; 3F EE 99 2A
    XBA                  ; EB
    LDA #$4F             ; A9 4F
    INC $8A99            ; EE 99 8A
    XBA                  ; EB
    LDA #$55             ; A9 55
    INC $EA99            ; EE 99 EA
    XBA                  ; EB
    LDA #$59             ; A9 59
    INC $4A99            ; EE 99 4A
    CPX $5DA9            ; EC A9 5D
    INC $AA99            ; EE 99 AA
    CPX $5FA9            ; EC A9 5F
    INC $0A99            ; EE 99 0A
    SBC $A960            ; ED 60 A9
    AND $2A99EE,X        ; 3F EE 99 2A
    XBA                  ; EB
    LDA #$4B             ; A9 4B
    INC $8A99            ; EE 99 8A
    XBA                  ; EB
    RTS                  ; 60
    LDA $B491            ; AD 91 B4
    BEQ $8D28            ; F0 1D
    JSL $C05668          ; 22 68 56 C0
    LDA $B471            ; AD 71 B4
    ASL                  ; 0A
    TAX                  ; AA
    LDA #$C6             ; A9 C6
    SBC $F4              ; E5 F4
    ADC $ABAB7F,X        ; 7F 7F AB AB
    JSL $C0533E          ; 22 3E 53 C0
    PEA $7E7E            ; F4 7E 7E
    PLB                  ; AB
    PLB                  ; AB
    STZ $B491            ; 9C 91 B4
    LDX #$FE             ; A2 FE
    ASL $BD              ; 06 BD
    SBC $2B              ; F2 2B
    BNE $8D34            ; D0 04
    LDA $7FE5C6,X        ; BF C6 E5 7F
    STA $AD71,X          ; 9D 71 AD
    DEX                  ; CA
    DEX                  ; CA
    BPL $8D2B            ; 10 F0
    RTL                  ; 6B
    LDX #$FE             ; A2 FE
    ASL $BD              ; 06 BD
    SBC $2B              ; F2 2B
    BEQ $8D47            ; F0 03
    STA $AD71,X          ; 9D 71 AD
    DEX                  ; CA
    DEX                  ; CA
    BPL $8D3F            ; 10 F4
    RTL                  ; 6B
    PHA                  ; 48
    PHX                  ; DA
    LDX #$00             ; A2 00
    BRK $9E              ; 00 9E
    AND $E8C0,Y          ; 39 C0 E8
    INX                  ; E8
    CPX #$40             ; E0 40
    BRK $90              ; 00 90
    INC $FA,X            ; F6 FA
    PLA                  ; 68
    RTL                  ; 6B

;==============================================================================
; GeneralPurpose_031
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_031:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_032
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_032:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_033
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_033:
    PHB                  ; 8B | Push data bank register
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDX #$00             ; A2 00 | Load X register
    BRK $9E              ; 00 9E | Software interrupt
    WDM $7C              ; 42 7C | Unknown operation
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$40             ; E0 40 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    INC $A2,X            ; F6 A2 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    STZ $7D02,X          ; 9E 02 7D | Unknown operation
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$42             ; E0 42 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    INC $A9,X            ; F6 A9 | Unknown operation
    BRK $51              ; 00 51 | Software interrupt
    STA $7D44            ; 8D 44 7D | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC #$40             ; 69 40 | Unknown operation
    ORA $868D3A,X        ; 1F 3A 8D 86 | Logical OR with accumulator
    ADC $00A9,X          ; 7D A9 00 | Unknown operation
    BRA $8D23            ; 80 8D | Unknown operation
    COP $7D              ; 02 7D | Unknown operation
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
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_035
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_035:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_036
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_036:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_037
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_037:
    PHB                  ; 8B | Push data bank register
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STA $7DCA            ; 8D CA 7D | Store accumulator to memory
    LDX #$00             ; A2 00 | Load X register
    BRK $BD              ; 00 BD | Software interrupt
    COP $7D              ; 02 7D | Unknown operation
    BPL $8DC4            ; 10 0D | Unknown operation
    LDA $7D86,X          ; BD 86 7D | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $7D44,X          ; FD 44 7D | Unknown operation
    INC                  ; 1A | Unknown operation
    CMP $7DCA            ; CD CA 7D | Compare with accumulator
    BCS $8DCE            ; B0 0A | Branch if carry set
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$42             ; E0 42 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    SBC $4C              ; E7 4C | Unknown operation
    ORA $8E              ; 12 8E | Logical OR with accumulator
    LDY #$00             ; A0 00 | Load Y register
    BRK $B9              ; 00 B9 | Software interrupt
    WDM $7C              ; 42 7C | Unknown operation
    BPL $8DE0            ; 10 0A | Unknown operation
    INY                  ; C8 | Unknown operation
    INY                  ; C8 | Unknown operation
    CPY #$40             ; C0 40 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    PEA $124C            ; F4 4C 12 | Push effective address
    STX $44BD            ; 8E BD 44 | Store X register
    ADC $8299,X          ; 7D 99 82 | Unknown operation
    JMP ($6D18,X)        ; 7C 18 6D | Unknown operation
    DEX                  ; CA | Unknown operation
    ADC $993A,X          ; 7D 3A 99 | Unknown operation
    


;==============================================================================
; GeneralPurpose_038
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_038:
    REP #$7C             ; C2 7C | Clear processor status bits
    INC                  ; 1A | Unknown operation
    STA $7D44,X          ; 9D 44 7D | Store accumulator to memory
    CMP $7D86,X          ; DD 86 7D | Compare with accumulator
    BCC $8DFA            ; 90 03 | Branch if carry clear
    JSR $8F77            ; 20 77 8F | Call local function
    LDA #$00             ; A9 00 | Load value into accumulator
    BRA $8D97            ; 80 99 | Unknown operation
    WDM $7C              ; 42 7C | Unknown operation
    


;==============================================================================
; GeneralPurpose_039
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_039:
    STY $7DC8            ; 8C C8 7D | Store Y register
    LDA $7C82,Y          ; B9 82 7C | Load value into accumulator
    STA $7DCC            ; 8D CC 7D | Store accumulator to memory
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_03A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03A:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
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
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_03C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03C:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_03D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03D:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_03E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03E:
    PHB                  ; 8B | Push data bank register
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TXY                  ; 9B | Unknown operation
    LDA $7C42,Y          ; B9 42 7C | Load value into accumulator
    BPL $8EA8            ; 10 7B | Unknown operation
    LDA $7C82,Y          ; B9 82 7C | Load value into accumulator
    STA $7DCC            ; 8D CC 7D | Store accumulator to memory
    LDA $7CC2,Y          ; B9 C2 7C | Load value into accumulator
    STA $7DCE            ; 8D CE 7D | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    WDM $7C              ; 42 7C | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRK $BD              ; 00 BD | Software interrupt
    COP $7D              ; 02 7D | Unknown operation
    BPL $8E4F            ; 10 08 | Unknown operation
    LDA $7D44,X          ; BD 44 7D | Load value into accumulator
    CMP $7DCC            ; CD CC 7D | Compare with accumulator
    BCS $8E73            ; B0 24 | Branch if carry set
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$42             ; E0 42 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    CPX $40A2            ; EC A2 40 | Unknown operation
    BRK $BD              ; 00 BD | Software interrupt
    COP $7D              ; 02 7D | Unknown operation
    BPL $8E6C            ; 10 0E | Unknown operation
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$42             ; E0 42 | Unknown operation
    BRK $B0              ; 00 B0 | Software interrupt
    EOR $BD              ; 43 BD | Unknown operation
    COP $7D              ; 02 7D | Unknown operation
    BPL $8E73            ; 10 09 | Unknown operation
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    BPL $8E59            ; 10 E9 | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRK $9B              ; 00 9B | Software interrupt
    DEY                  ; 88 | Unknown operation
    DEY                  ; 88 | Unknown operation
    BMI $8E81            ; 30 09 | Unknown operation
    LDA $7D86,Y          ; B9 86 7D | Load value into accumulator
    INC                  ; 1A | Unknown operation
    CMP $7DCC            ; CD CC 7D | Compare with accumulator

    CMP $7DCC            ; CD CC 7D
    BEQ $8E86            ; F0 05
    JSR $8F41            ; 20 41 8F
    BRA $8E8D            ; 80 07
    LDA $7DCE            ; AD CE 7D
    STA $7D86,Y          ; 99 86 7D
    TYX                  ; BB
    TXY                  ; 9B
    INY                  ; C8
    INY                  ; C8
    CPY #$42             ; C0 42
    BRK $B0              ; 00 B0
    ORA $AD              ; 13 AD
    DEC $1A7D            ; CE 7D 1A
    CMP $7D44,Y          ; D9 44 7D
    BNE $8EA8            ; D0 0A
    LDA $7D86,Y          ; B9 86 7D
    STA $7D86,X          ; 9D 86 7D
    TYX                  ; BB
    JSR $8F77            ; 20 77 8F
    PLB                  ; AB

;==============================================================================
; GeneralPurpose_03F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03F:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_040
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_040:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_041
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_041:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_042
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_042:
    PHB                  ; 8B | Push data bank register
    PEA $7E7E            ; F4 7E 7E | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    LDA #$10             ; A9 10 | Load value into accumulator
    ASL $CA8D            ; 0E 8D CA | Arithmetic shift left
    ADC $00A9,X          ; 7D A9 00 | Unknown operation
    EOR $18              ; 51 18 | Unknown operation
    ADC #$40             ; 69 40 | Unknown operation
    ORA $CE8D3A,X        ; 1F 3A 8D CE | Logical OR with accumulator
    ADC $00A2,X          ; 7D A2 00 | Unknown operation
    BRK $BD              ; 00 BD | Software interrupt
    COP $7D              ; 02 7D | Unknown operation
    BPL $8EE7            ; 10 12 | Unknown operation
    LDA $7D86,X          ; BD 86 7D | Load value into accumulator
    CMP $7DCE            ; CD CE 7D | Compare with accumulator
    BNE $8EE7            ; D0 0A | Branch if not equal (zero flag clear)
    SEC                  ; 38 | Set carry flag
    SBC $7D44,X          ; FD 44 7D | Unknown operation
    INC                  ; 1A | Unknown operation
    CMP $7DCA            ; CD CA 7D | Compare with accumulator
    BCS $8EF1            ; B0 0A | Branch if carry set
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$42             ; E0 42 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    


;==============================================================================
; GeneralPurpose_043
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_043:
    SEP #$4C             ; E2 4C | Set processor status bits
    SEC                  ; 38 | Set carry flag
    STA $0000A0          ; 8F A0 00 00 | Store accumulator to memory
    LDA $7C42,Y          ; B9 42 7C | Load value into accumulator
    BPL $8F03            ; 10 0A | Unknown operation
    INY                  ; C8 | Unknown operation
    INY                  ; C8 | Unknown operation
    CPY #$40             ; C0 40 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    PEA $384C            ; F4 4C 38 | Push effective address
    STA $7D86BD          ; 8F BD 86 7D | Store accumulator to memory
    STA $7CC2,Y          ; 99 C2 7C | Store accumulator to memory
    SEC                  ; 38 | Set carry flag
    SBC $7DCA            ; ED CA 7D | Unknown operation
    INC                  ; 1A | Unknown operation
    STA $7C82,Y          ; 99 82 7C | Store accumulator to memory
    DEC                  ; 3A | Unknown operation
    STA $7D86,X          ; 9D 86 7D | Store accumulator to memory
    LDA $7D44,X          ; BD 44 7D | Load value into accumulator
    CMP $7D86,X          ; DD 86 7D | Compare with accumulator
    BCC $8F20            ; 90 03 | Branch if carry clear
    JSR $8F77            ; 20 77 8F | Call local function
    LDA #$00             ; A9 00 | Load value into accumulator
    BRA $8EBD            ; 80 99 | Unknown operation
    WDM $7C              ; 42 7C | Unknown operation
    STY $7DC8            ; 8C C8 7D | Store Y register
    LDA $7C82,Y          ; B9 82 7C | Load value into accumulator
    STA $7DCC            ; 8D CC 7D | Store accumulator to memory
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
    PHX                  ; DA | Push X register to stack
    LDX #$3E             ; A2 3E | Load X register
    BRK $BD              ; 00 BD | Software interrupt
    COP $7D              ; 02 7D | Unknown operation
    STA $7D04,X          ; 9D 04 7D | Store accumulator to memory
    LDA $7D44,X          ; BD 44 7D | Load value into accumulator
    STA $7D46,X          ; 9D 46 7D | Store accumulator to memory
    LDA $7D86,X          ; BD 86 7D | Load value into accumulator
    STA $7D88,X          ; 9D 88 7D | Store accumulator to memory
    TXA                  ; 8A | Transfer X to accumulator
    CMP $01              ; C3 01 | Compare with accumulator
    BEQ $8F60            ; F0 04 | Branch if equal (zero flag set)
    DEX                  ; CA | Unknown operation
    DEX                  ; CA | Unknown operation
    BPL $8F45            ; 10 E5 | Unknown operation
    LDA $01              ; A3 01 | Load value into accumulator
    TAX                  ; AA | Transfer accumulator to X
    LDA #$00             ; A9 00 | Load value into accumulator
    BRA $8F04            ; 80 9D | Unknown operation
    COP $7D              ; 02 7D | Unknown operation
    LDA $7DCC            ; AD CC 7D | Load value into accumulator
    STA $7D44,X          ; 9D 44 7D | Store accumulator to memory
    LDA $7DCE            ; AD CE 7D | Load value into accumulator
    STA $7D86,X          ; 9D 86 7D | Store accumulator to memory
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from local function
    PHX                  ; DA | Push X register to stack
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$42             ; E0 42 | Unknown operation
    BRK $B0              ; 00 B0 | Software interrupt
    TRB $BD              ; 14 BD | Unknown operation
    COP $7D              ; 02 7D | Unknown operation
    STA $7D00,X          ; 9D 00 7D | Store accumulator to memory
    LDA $7D44,X          ; BD 44 7D | Load value into accumulator
    STA $7D42,X          ; 9D 42 7D | Store accumulator to memory
    LDA $7D86,X          ; BD 86 7D | Load value into accumulator
    STA $7D84,X          ; 9D 84 7D | Store accumulator to memory
    BRA $8F78            ; 80 E5 | Unknown operation
    PLX                  ; FA | Pull X register from stack
    RTS                  ; 60 | Return from local function
    


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
    LDX #$00             ; A2 00 | Load X register
    BRK $9E              ; 00 9E | Software interrupt
    PEI $AD              ; D4 AD | Unknown operation
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$20             ; E0 20 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    INC $A2,X            ; F6 A2 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    STZ $AE34,X          ; 9E 34 AE | Unknown operation
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$22             ; E0 22 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    INC $A9,X            ; F6 A9 | Unknown operation
    BRK $00              ; 00 00 | Software interrupt
    STA $AE56            ; 8D 56 AE | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC #$D4             ; 69 D4 | Unknown operation
    LDA $8D3A            ; AD 3A 8D | Load value into accumulator
    SEI                  ; 78 | Unknown operation
    LDX $00A9            ; AE A9 00 | Load X register
    BRA $8F5A            ; 80 8D | Unknown operation
    BIT $AE,X            ; 34 AE | Unknown operation
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_049
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_049:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_04A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04A:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_04B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04B:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_04C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04C:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    STA $AE9C            ; 8D 9C AE | Store accumulator to memory
    LDX #$00             ; A2 00 | Load X register
    BRK $BD              ; 00 BD | Software interrupt
    BIT $AE,X            ; 34 AE | Unknown operation
    BPL $8FFB            ; 10 0D | Unknown operation
    LDA $AE78,X          ; BD 78 AE | Load value into accumulator
    SEC                  ; 38 | Set carry flag
    SBC $AE56,X          ; FD 56 AE | Unknown operation
    INC                  ; 1A | Unknown operation
    CMP $AE9C            ; CD 9C AE | Compare with accumulator
    BCS $9005            ; B0 0A | Branch if carry set
    INX                  ; E8 | Unknown operation
    INX                  ; E8 | Unknown operation
    CPX #$22             ; E0 22 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    SBC $4C              ; E7 4C | Unknown operation
    EOR #$90             ; 49 90 | Unknown operation
    LDY #$00             ; A0 00 | Load Y register
    BRK $B9              ; 00 B9 | Software interrupt
    PEI $AD              ; D4 AD | Unknown operation
    BPL $9017            ; 10 0A | Unknown operation
    INY                  ; C8 | Unknown operation
    INY                  ; C8 | Unknown operation
    CPY #$20             ; C0 20 | Unknown operation
    BRK $90              ; 00 90 | Software interrupt
    PEA $494C            ; F4 4C 49 | Push effective address
    BCC $8FD5            ; 90 BD | Branch if carry clear
    LSR $AE,X            ; 56 AE | Unknown operation
    STA $ADF4,Y          ; 99 F4 AD | Store accumulator to memory
    CLC                  ; 18 | Clear carry flag
    ADC $AE9C            ; 6D 9C AE | Unknown operation
    DEC                  ; 3A | Unknown operation
    STA $AE14,Y          ; 99 14 AE | Store accumulator to memory
    INC                  ; 1A | Unknown operation
    STA $AE56,X          ; 9D 56 AE | Store accumulator to memory
    CMP $AE78,X          ; DD 78 AE | Compare with accumulator
    BCC $9031            ; 90 03 | Branch if carry clear
    JSR $9103            ; 20 03 91 | Call local function
    LDA #$00             ; A9 00 | Load value into accumulator
    BRA $8FCE            ; 80 99 | Unknown operation
    PEI $AD              ; D4 AD | Unknown operation
    STY $AE9A            ; 8C 9A AE | Store Y register
    LDA $ADF4,Y          ; B9 F4 AD | Load value into accumulator
    STA $AE9E            ; 8D 9E AE | Store accumulator to memory
    PLB                  ; AB | Pull data bank register

    PLB                  ; AB

;==============================================================================
; GeneralPurpose_04D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04D:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    SEC                  ; 38 | Set carry flag
    RTL                  ; 6B | Return from external function
    PLB                  ; AB | Pull data bank register
    


;==============================================================================
; GeneralPurpose_04E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04E:
    REP #$30             ; C2 30 | Clear processor status bits
    PLY                  ; 7A | Pull Y register from stack
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    CLC                  ; 18 | Clear carry flag
    RTL                  ; 6B | Return from external function
    


;==============================================================================
; GeneralPurpose_04F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04F:
    PHP                  ; 08 | Push processor status to stack
    


;==============================================================================
; GeneralPurpose_050
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_050:
    REP #$30             ; C2 30 | Clear processor status bits
    PHA                  ; 48 | Push accumulator to stack
    PHX                  ; DA | Push X register to stack
    PHY                  ; 5A | Push Y register to stack
    


;==============================================================================
; GeneralPurpose_051
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_051:
    PHB                  ; 8B | Push data bank register
    PEA $7F7F            ; F4 7F 7F | Push effective address
    PLB                  ; AB | Pull data bank register
    PLB                  ; AB | Pull data bank register
    TXY                  ; 9B | Unknown operation
    LDA $ADD4,Y          ; B9 D4 AD | Load value into accumulator
    BPL $90C5            ; 10 61 | Unknown operation
    LDA $ADF4,Y          ; B9 F4 AD | Load value into accumulator
    STA $AE9E            ; 8D 9E AE | Store accumulator to memory
    LDA $AE14,Y          ; B9 14 AE | Load value into accumulator
    STA $AEA0            ; 8D A0 AE | Store accumulator to memory
    LDA #$00             ; A9 00 | Load value into accumulator
    BRK $99              ; 00 99 | Software interrupt
    PEI $AD              ; D4 AD | Unknown operation
    LDX #$00             ; A2 00 | Load X register
    BRK $BD              ; 00 BD | Software interrupt
    BIT $AE,X            ; 34 AE | Unknown operation
    BPL $9086            ; 10 08 | Unknown operation

    BPL $9086            ; 10 08
;==============================================================================
; Function Index (82 functions)
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
;==============================================================================