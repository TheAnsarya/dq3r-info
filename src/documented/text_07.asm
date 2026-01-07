;==============================================================================
; Dragon Quest III - Text 07
;==============================================================================
; File: text_07.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Text System (Bank $07)
; Comprehensive code extraction


.segment "TEXT_CODE"

;==============================================================================
; GeneralPurpose_000
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_000:
	EOR $C3,X			; 55 C3 | Unknown operation
	JSL $C34B44		  ; 22 44 4B C3 | Call external function
	LDX #$07			 ; A2 07 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_001
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_001:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	EOR $4B			  ; 51 4B | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA $00			  ; 07 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	RTL				  ; 6B | Return from external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$D7			 ; A9 D7 | Load value into accumulator
	LDA $22			  ; A7 22 | Load value into accumulator
	ADC $2B			  ; 61 2B | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	COP $00			  ; 02 00 | Unknown operation
	JSL $C32B70		  ; 22 70 2B C3 | Call external function
	JSL $C35522		  ; 22 22 55 C3 | Call external function
	JSL $C351CC		  ; 22 CC 51 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8055			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8084			; 4C 84 80 | Unknown operation
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	TAY				  ; A8 | Unknown operation
	EOR $C3			  ; 47 C3 | Unknown operation
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_002
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_002:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $56			  ; 00 56 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $80AD			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	EOR $80,X			; 55 80 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C347A8		  ; 22 A8 47 C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_003
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_003:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	JSL $A9C355		  ; 22 55 C3 A9 | Call external function
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34EFC		  ; 22 FC 4E C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35512		  ; 22 12 55 C3 | Call external function
	LDA #$52			 ; A9 52 | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C35512		  ; 22 12 55 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34F43		  ; 22 43 4F C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C347A8		  ; 22 A8 47 C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_004
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_004:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	JSL $A9C355		  ; 22 55 C3 A9 | Call external function
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34F06		  ; 22 06 4F C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35512		  ; 22 12 55 C3 | Call external function
	LDA #$56			 ; A9 56 | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C35512		  ; 22 12 55 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34F4D		  ; 22 4D 4F C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C35292		  ; 22 92 52 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $817C			; D0 03 | Branch if not equal (zero flag clear)
	JMP $81BD			; 4C BD 81 | Unknown operation
	JSL $C349B3		  ; 22 B3 49 C3 | Call external function
	LDX #$07			 ; A2 07 | Load X register
	BRK $22			  ; 00 22 | Software interrupt

	BRK $22			  ; 00 22

;==============================================================================
; GeneralPurpose_005
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_005:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $A9C32C		  ; 0F 2C C3 A9 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C349D5		  ; 22 D5 49 C3 | Call external function
	LDX #$07			 ; A2 07 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_006
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_006:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $81E6			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	JMP ($6B81,X)		; 7C 81 6B | Unknown operation
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C357E5		  ; 22 E5 57 C3 | Call external function
	JSL $C348CC		  ; 22 CC 48 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_007
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_007:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $C348			; CC 48 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_008
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_008:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $C348			; CC 48 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_009
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_009:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	


;==============================================================================
; GeneralPurpose_00A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00A:
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $C348			; CC 48 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_00B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00B:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $C348			; CC 48 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_00C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00C:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $C348			; CC 48 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_00D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00D:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $C348			; CC 48 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_00E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00E:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $C348			; CC 48 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_00F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00F:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $6B			  ; C3 6B | Compare with accumulator
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$68			 ; A9 68 | Load value into accumulator
	LDA $22			  ; A7 22 | Load value into accumulator
	ADC $2B			  ; 61 2B | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	TSB $00			  ; 04 00 | Unknown operation
	JSL $C32B70		  ; 22 70 2B C3 | Call external function
	JSL $C35522		  ; 22 22 55 C3 | Call external function
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	PHY				  ; 5A | Push Y register to stack
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $82D7			; 70 2B | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $A9			  ; C3 A9 | Compare with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	JSL $C33D5C		  ; 22 5C 3D C3 | Call external function
	LDA #$E4			 ; A9 E4 | Load value into accumulator
	LDA $22			  ; A7 22 | Load value into accumulator
	AND $2B			  ; 21 2B | Logical AND with accumulator
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA $00			  ; 05 00 | Logical OR with accumulator
	JSL $C32B70		  ; 22 70 2B C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	RTS				  ; 60 | Return from local function
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8309			; 70 2B | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator

	ORA #$55			 ; 09 55
	CMP $A9			  ; C3 A9
	BRK $00			  ; 00 00
	JSL $C33D5C		  ; 22 5C 3D C3
	LDA #$0A			 ; A9 0A
	TAX				  ; AA
	JSL $C32B21		  ; 22 21 2B C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35509		  ; 22 09 55 C3
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	PLA				  ; 68
	TAX				  ; AA
	JSL $C32B21		  ; 22 21 2B C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $833B			; 70 2B
	CMP $22			  ; C3 22
	ORA #$55			 ; 09 55
	CMP $A9			  ; C3 A9
	BRK $00			  ; 00 00
	JSL $C33D5C		  ; 22 5C 3D C3
	LDA #$72			 ; A9 72
	TAX				  ; AA
	JSL $C32B21		  ; 22 21 2B C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $8354			; 70 2B
	CMP $6B			  ; C3 6B
	JSL $C351CC		  ; 22 CC 51 C3
	JSL $C32EB0		  ; 22 B0 2E C3
	LDA $04			  ; A5 04
	BNE $833A			; D0 03
	JMP $8442			; 4C 42 84
	JSL $C3554B		  ; 22 4B 55 C3
	JSL $C3553D		  ; 22 3D 55 C3
	JSL $C347A8		  ; 22 A8 47 C3
	LDX #$04			 ; A2 04
	BRK $22			  ; 00 22

;==============================================================================
; GeneralPurpose_010
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_010:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	PLD				  ; 2B | Unknown operation
	EOR $C3,X			; 55 C3 | Unknown operation
	LDA #$98			 ; A9 98 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34EFC		  ; 22 FC 4E C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35481		  ; 22 81 54 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C35481		  ; 22 81 54 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34F43		  ; 22 43 4F C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35534		  ; 22 34 55 C3 | Call external function
	LDA #$9D			 ; A9 9D | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34F06		  ; 22 06 4F C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35481		  ; 22 81 54 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$08			 ; A9 08 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt

	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$08			 ; A9 08
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$08			 ; A9 08
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35481		  ; 22 81 54 C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C34F4D		  ; 22 4D 4F C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35534		  ; 22 34 55 C3
	LDA #$DD			 ; A9 DD
	LDA $22			  ; A7 22
	ADC $2B			  ; 61 2B
	CMP $22			  ; C3 22
	STA $54			  ; 81 54
	CMP $22			  ; C3 22
	TCD				  ; 5B
	LSR $C3,X			; 56 C3

;==============================================================================
; GeneralPurpose_011
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_011:
	JSL $C35481		  ; 22 81 54 C3 | Call external function
	JSL $C35534		  ; 22 34 55 C3 | Call external function
	LDA #$7A			 ; A9 7A | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C35481		  ; 22 81 54 C3 | Call external function
	JSL $C3566E		  ; 22 6E 56 C3 | Call external function
	JSL $C35481		  ; 22 81 54 C3 | Call external function
	JSL $C35534		  ; 22 34 55 C3 | Call external function
	JSL $C35614		  ; 22 14 56 C3 | Call external function
	LDA #$05			 ; A9 05 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C3573C		  ; 22 3C 57 C3 | Call external function
	JSL $C35542		  ; 22 42 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8442			; B0 03 | Branch if carry set
	JMP $833A			; 4C 3A 83 | Unknown operation
	RTL				  ; 6B | Return from external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$E4			 ; A9 E4 | Load value into accumulator
	LDA $22			  ; A7 22 | Load value into accumulator
	ADC $2B			  ; 61 2B | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	COP $00			  ; 02 00 | Unknown operation
	JSL $C32B70		  ; 22 70 2B C3 | Call external function
	JSL $C35522		  ; 22 22 55 C3 | Call external function
	JSL $C351CC		  ; 22 CC 51 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $846B			; D0 03 | Branch if not equal (zero flag clear)
	JMP $849A			; 4C 9A 84 | Unknown operation
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	TAY				  ; A8 | Unknown operation
	EOR $C3			  ; 47 C3 | Unknown operation
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_012
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_012:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $56			  ; 00 56 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $84C3			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	RTL				  ; 6B | Return from external function
	STY $6B			  ; 84 6B | Store Y register
	JSL $C3529C		  ; 22 9C 52 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $84AA			; D0 03 | Branch if not equal (zero flag clear)
	JMP $84F9			; 4C F9 84 | Unknown operation
	JSL $C357F2		  ; 22 F2 57 C3 | Call external function
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	LSR $C34B,X		  ; 5E 4B C3 | Unknown operation
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_013
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_013:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $56			  ; 00 56 | Software interrupt
	CMP $A9			  ; C3 A9 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	LDA #$07			 ; A9 07 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$05			 ; A9 05 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C35028		  ; 22 28 50 C3 | Call external function
	LDX #$02			 ; A2 02 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $84F9			; B0 03 | Branch if carry set
	JMP $84AA			; 4C AA 84 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C352A1		  ; 22 A1 52 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8509			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8551			; 4C 51 85 | Unknown operation
	JSL $C35804		  ; 22 04 58 C3 | Call external function
	JSL $C34B73		  ; 22 73 4B C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_014
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_014:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $56			  ; 00 56 | Software interrupt
	CMP $A9			  ; C3 A9 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	LDA #$07			 ; A9 07 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$05			 ; A9 05 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C35039		  ; 22 39 50 C3 | Call external function
	LDX #$02			 ; A2 02 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8551			; B0 03 | Branch if carry set
	JMP $8509			; 4C 09 85 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C35816		  ; 22 16 58 C3 | Call external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C34A2C		  ; 22 2C 4A C3 | Call external function
	LDX #$0A			 ; A2 0A | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	AND $C32C			; 2D 2C C3 | Logical AND with accumulator
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C34C16		  ; 22 16 4C C3 | Call external function
	LDX #$0A			 ; A2 0A | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	AND $C32C			; 2D 2C C3 | Logical AND with accumulator
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$80			 ; A9 80 | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	LDA #$05			 ; A9 05 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C356C9		  ; 22 C9 56 C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	LDA #$52			 ; A9 52 | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X

	TAX				  ; AA
	JSL $C32B61		  ; 22 61 2B C3
	LDA #$05			 ; A9 05
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C34EFC		  ; 22 FC 4E C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	LDA #$02			 ; A9 02
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C34F43		  ; 22 43 4F C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35500		  ; 22 00 55 C3
	LDA #$56			 ; A9 56
	TAX				  ; AA
	JSL $C32B61		  ; 22 61 2B C3
	LDA #$05			 ; A9 05
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C34F06		  ; 22 06 4F C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	LDA #$02			 ; A9 02
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C34F4D		  ; 22 4D 4F C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35500		  ; 22 00 55 C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$87			 ; A9 87
	TAX				  ; AA
	JSL $C32B61		  ; 22 61 2B C3
	LDA #$05			 ; A9 05
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C34F61		  ; 22 61 4F C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35500		  ; 22 00 55 C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $8648			; 70 2B
	CMP $A9			  ; C3 A9
	STA $6122AA		  ; 8F AA 22 61
	PLD				  ; 2B
	CMP $A9			  ; C3 A9
	ORA $00			  ; 05 00
	JSL $C32B8D		  ; 22 8D 2B C3
	JSL $C34F7F		  ; 22 7F 4F C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	RTL				  ; 6B
	JSL $C3554B		  ; 22 4B 55 C3
	JSL $C347BA		  ; 22 BA 47 C3
	LDX #$0A			 ; A2 0A
	BRK $22			  ; 00 22
	AND $C32C			; 2D 2C C3
	JSL $C35522		  ; 22 22 55 C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C34A5A		  ; 22 5A 4A C3
	LDX #$09			 ; A2 09
	BRK $22			  ; 00 22

;==============================================================================
; GeneralPurpose_015
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_015:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $A9			  ; C3 A9 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	JSL $C34A7B		  ; 22 7B 4A C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_016
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_016:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $A9			  ; C3 A9 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	JSL $C34A9C		  ; 22 9C 4A C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_017
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_017:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $A9			  ; C3 A9 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	JSL $C34ABD		  ; 22 BD 4A C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_018
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_018:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $A9			  ; C3 A9 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	JSL $C34ADE		  ; 22 DE 4A C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_019
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_019:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $6B			  ; C3 6B | Compare with accumulator
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8717			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	STX $AA,Y			; 96 AA | Store X register
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	LDX #$05			 ; A2 05 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8725			; 70 2B | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	JSL $22C355		  ; 22 55 C3 22 | Call external function
	LDX $52			  ; A6 52 | Load X register
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8734			; B0 2E | Branch if carry set
	CMP $A5			  ; C3 A5 | Compare with accumulator
	TSB $D0			  ; 04 D0 | Unknown operation
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	AND $87,X			; 35 87 | Logical AND with accumulator
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	DEY				  ; 88 | Unknown operation
	


;==============================================================================
; GeneralPurpose_01A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01A:
	PHK				  ; 4B | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8735			; B0 03 | Branch if carry set
	JMP $870E			; 4C 0E 87 | Unknown operation
	JSL $C35FD5		  ; 22 D5 5F C3 | Call external function
	BCS $873E			; B0 03 | Branch if carry set
	JMP $8754			; 4C 54 87 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRA $8764			; 80 22 | Unknown operation
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	TXY				  ; 9B | Unknown operation
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $877D			; 70 2B | Unknown operation
	CMP $38			  ; C3 38 | Compare with accumulator
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $878A			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	LDY $AA			  ; A4 AA | Load Y register
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8798			; 70 2B | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	JSL $22C355		  ; 22 55 C3 22 | Call external function
	CMP $52			  ; C3 52 | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $87A7			; B0 2E | Branch if carry set
	CMP $A5			  ; C3 A5 | Compare with accumulator
	TSB $D0			  ; 04 D0 | Unknown operation
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	TAY				  ; A8 | Unknown operation
	STA $A9			  ; 87 A9 | Store accumulator to memory
	BRK $00			  ; 00 00 | Software interrupt
	JSL $C33D5C		  ; 22 5C 3D C3 | Call external function
	JSL $C34BBA		  ; 22 BA 4B C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt

	BRK $22			  ; 00 22

;==============================================================================
; GeneralPurpose_01B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01B:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $87D1			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	STA $87			  ; 81 87 | Store accumulator to memory
	JSL $C35FD5		  ; 22 D5 5F C3 | Call external function
	BCS $87B1			; B0 03 | Branch if carry set
	JMP $87C7			; 4C C7 87 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRA $87D7			; 80 22 | Unknown operation
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	TXY				  ; 9B | Unknown operation
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $87F0			; 70 2B | Unknown operation
	CMP $38			  ; C3 38 | Compare with accumulator
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $87FD			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	LDA #$AA			 ; A9 AA | Load value into accumulator
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	LDX #$05			 ; A2 05 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $880B			; 70 2B | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	JSL $22C355		  ; 22 55 C3 22 | Call external function
	CLD				  ; D8 | Unknown operation
	EOR $C3			  ; 52 C3 | Unknown operation
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $87F4			; D0 03 | Branch if not equal (zero flag clear)
	JMP $881B			; 4C 1B 88 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	CMP $4B			  ; D1 4B | Compare with accumulator
	CMP $A2			  ; C3 A2 | Compare with accumulator
	


;==============================================================================
; GeneralPurpose_01C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01C:
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $881B			; B0 03 | Branch if carry set
	JMP $87F4			; 4C F4 87 | Unknown operation
	JSL $C35FD5		  ; 22 D5 5F C3 | Call external function
	BCS $8824			; B0 03 | Branch if carry set
	JMP $883A			; 4C 3A 88 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRA $884A			; 80 22 | Unknown operation
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	TXY				  ; 9B | Unknown operation
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8863			; 70 2B | Unknown operation
	CMP $38			  ; C3 38 | Compare with accumulator
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8870			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	LDA $22AA			; AD AA 22 | Load value into accumulator
	ADC $2B			  ; 61 2B | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	TSB $00			  ; 04 00 | Unknown operation
	JSL $C32B70		  ; 22 70 2B C3 | Call external function
	JSL $C35522		  ; 22 22 55 C3 | Call external function
	JSL $C352ED		  ; 22 ED 52 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8867			; D0 03 | Branch if not equal (zero flag clear)
	JMP $888E			; 4C 8E 88 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	INX				  ; E8 | Unknown operation
	


;==============================================================================
; GeneralPurpose_01D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01D:
	PHK				  ; 4B | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $888E			; B0 03 | Branch if carry set
	JMP $8867			; 4C 67 88 | Unknown operation
	JSL $C35FD5		  ; 22 D5 5F C3 | Call external function
	BCS $8897			; B0 03 | Branch if carry set
	JMP $88AD			; 4C AD 88 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRA $88BD			; 80 22 | Unknown operation
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	TXY				  ; 9B | Unknown operation
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $88D6			; 70 2B | Unknown operation
	CMP $38			  ; C3 38 | Compare with accumulator
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	LDX #$02			 ; A2 02 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $88E3			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	LDA $AA			  ; B3 AA | Load value into accumulator
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	LDX #$02			 ; A2 02 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $88F1			; 70 2B | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	JSL $22C355		  ; 22 55 C3 22 | Call external function
	COP $53			  ; 02 53 | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8900			; B0 2E | Branch if carry set
	CMP $A5			  ; C3 A5 | Compare with accumulator
	TSB $D0			  ; 04 D0 | Unknown operation
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	ORA $89			  ; 01 89 | Logical OR with accumulator
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	SBC $A2C34B,X		; FF 4B C3 A2 | Unknown operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function

	JSL $C32BC2		  ; 22 C2 2B C3
	JSL $C32BD2		  ; 22 D2 2B C3
	JSL $C32C0F		  ; 22 0F 2C C3
	JSL $C35500		  ; 22 00 55 C3
	JSL $C32FB0		  ; 22 B0 2F C3
	BCS $8901			; B0 03
	JMP $88DA			; 4C DA 88
	JSL $C35FD5		  ; 22 D5 5F C3
	BCS $890A			; B0 03
	JMP $8920			; 4C 20 89
	LDA #$00			 ; A9 00
	BRA $8930			; 80 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	TXY				  ; 9B
	TAX				  ; AA
	JSL $C32B21		  ; 22 21 2B C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	BVS $8949			; 70 2B
	CMP $38			  ; C3 38
	RTL				  ; 6B
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	LDY $22AA,X		  ; BC AA 22
	AND $2B			  ; 21 2B
	CMP $22			  ; C3 22
	BRK $55			  ; 00 55
	CMP $A9			  ; C3 A9
	BRK $00			  ; 00 00
	JSL $C33D5C		  ; 22 5C 3D C3
	LDA #$C3			 ; A9 C3
	TAX				  ; AA
	JSL $C32B21		  ; 22 21 2B C3
	JSL $C35500		  ; 22 00 55 C3
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	BCC $88F6			; 90 A7
	JSL $C32B21		  ; 22 21 2B C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $8984			; 70 2B
	CMP $22			  ; C3 22
	BRK $55			  ; 00 55
	CMP $6B			  ; C3 6B
	JSL $C35317		  ; 22 17 53 C3
	JSL $C32EB0		  ; 22 B0 2E C3
	LDA $04			  ; A5 04
	BNE $896E			; D0 03
	JMP $89C0			; 4C C0 89
	LDA #$40			 ; A9 40
	COP $22			  ; 02 22
	JMP $22C33D		  ; 5C 3D C3 22
	ROL				  ; 2A
	JMP $A2C3			; 4C C3 A2
	ORA #$00			 ; 09 00
	JSL $C32BC2		  ; 22 C2 2B C3
	JSL $C32BD2		  ; 22 D2 2B C3
	JSL $C32C0F		  ; 22 0F 2C C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C3504A		  ; 22 4A 50 C3
	LDX #$01			 ; A2 01
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	LDA #$15			 ; A9 15
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35055		  ; 22 55 50 C3
	LDX #$05			 ; A2 05
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3
	JSL $C32FB0		  ; 22 B0 2F C3
	BCS $89C0			; B0 03
	JMP $896E			; 4C 6E 89
	RTL				  ; 6B
	JSL $C35317		  ; 22 17 53 C3
	JSL $C32EB0		  ; 22 B0 2E C3
	LDA $04			  ; A5 04
	BNE $89D0			; D0 03
	JMP $8A09			; 4C 09 8A
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $22C33D		  ; 5C 3D C3 22
	ROL				  ; 2A
	JMP $A2C3			; 4C C3 A2
	ORA #$00			 ; 09 00
	JSL $C32BC2		  ; 22 C2 2B C3
	JSL $C32BD2		  ; 22 D2 2B C3
	JSL $C32C0F		  ; 22 0F 2C C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35055		  ; 22 55 50 C3
	LDX #$05			 ; A2 05
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3

;==============================================================================
; GeneralPurpose_01E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01E:
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8A09			; B0 03 | Branch if carry set
	JMP $89D0			; 4C D0 89 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C35317		  ; 22 17 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8A19			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8A40			; 4C 40 8A | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	ROL				  ; 2A | Unknown operation
	JMP $A2C3			; 4C C3 A2 | Unknown operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8A40			; B0 03 | Branch if carry set
	JMP $8A19			; 4C 19 8A | Unknown operation
	RTL				  ; 6B | Return from external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C358C3		  ; 22 C3 58 C3 | Call external function
	JSL $C35522		  ; 22 22 55 C3 | Call external function
	JSL $C351CC		  ; 22 CC 51 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8A6D			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8A9C			; 4C 9C 8A | Unknown operation
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C347BA		  ; 22 BA 47 C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_01F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01F:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $A9C32C		  ; 0F 2C C3 A9 | Logical OR with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	JSL $C35ADE		  ; 22 DE 5A C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8A9C			; B0 03 | Branch if carry set
	JMP $8A6D			; 4C 6D 8A | Unknown operation
	RTL				  ; 6B | Return from external function
	LDA #$CA			 ; A9 CA | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C36086		  ; 22 86 60 C3 | Call external function
	BCS $8AB1			; B0 03 | Branch if carry set
	JMP $8AC4			; 4C C4 8A | Unknown operation
	JSL $C351C9		  ; 22 C9 51 C3 | Call external function
	LDX #$02			 ; A2 02 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	LDA #$D1			 ; A9 D1 | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	SEC				  ; 38 | Set carry flag
	BCC $8AC9			; 90 03 | Branch if carry clear
	JMP $8AD0			; 4C D0 8A | Unknown operation
	LDA #$DB			 ; A9 DB | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	RTL				  ; 6B | Return from external function
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	CPX $AA			  ; E4 AA | Unknown operation
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $A9C33D		  ; 5C 3D C3 A9 | Unknown operation
	SBC $22AA			; ED AA 22 | Unknown operation
	AND $2B			  ; 21 2B | Logical AND with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $A9			  ; C3 A9 | Compare with accumulator
	BRK $00			  ; 00 00 | Software interrupt

	BRK $00			  ; 00 00
	JSL $C33D5C		  ; 22 5C 3D C3
	LDA #$F7			 ; A9 F7
	TAX				  ; AA
	JSL $C32B21		  ; 22 21 2B C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35500		  ; 22 00 55 C3
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	BCC $8ABF			; 90 A7
	JSL $C32B21		  ; 22 21 2B C3
	LDX #$04			 ; A2 04
	BRK $22			  ; 00 22
	BVS $8B4D			; 70 2B
	CMP $22			  ; C3 22
	BRK $55			  ; 00 55
	CMP $6B			  ; C3 6B
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	SBC $2122AA,X		; FF AA 22 21
	PLD				  ; 2B
	CMP $22			  ; C3 22
	BRK $55			  ; 00 55
	CMP $A9			  ; C3 A9
	BRK $00			  ; 00 00
	JSL $C33D5C		  ; 22 5C 3D C3
	LDA #$0B			 ; A9 0B
	PLB				  ; AB
	JSL $C32B21		  ; 22 21 2B C3
	JSL $C35500		  ; 22 00 55 C3
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	ASL $AB,X			; 16 AB
	JSL $C32B21		  ; 22 21 2B C3
	JSL $C35500		  ; 22 00 55 C3
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $A9C33D		  ; 5C 3D C3 A9
	BCC $8B0F			; 90 A7
	JSL $C32B21		  ; 22 21 2B C3
	JSL $C35500		  ; 22 00 55 C3
	RTL				  ; 6B
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$1F			 ; A9 1F
	PLB				  ; AB
	JSL $C32B61		  ; 22 61 2B C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35522		  ; 22 22 55 C3
	JSL $C353D0		  ; 22 D0 53 C3
	JSL $C32EB0		  ; 22 B0 2E C3
	LDA $04			  ; A5 04
	BNE $8B99			; D0 03
	JMP $8BC4			; 4C C4 8B
	JSL $C35D5F		  ; 22 5F 5D C3
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $22C33D		  ; 5C 3D C3 22
	PHA				  ; 48
	EOR $A2C3			; 4D C3 A2
	TSB $00			  ; 04 00
	JSL $C32BC2		  ; 22 C2 2B C3
	JSL $C32BD2		  ; 22 D2 2B C3
	JSL $C32C0F		  ; 22 0F 2C C3
	JSL $C35500		  ; 22 00 55 C3
	JSL $C32FB0		  ; 22 B0 2F C3
	BCS $8BC4			; B0 03
	JMP $8B99			; 4C 99 8B
	RTL				  ; 6B
	LDA #$25			 ; A9 25
	PLB				  ; AB
	JSL $C32B21		  ; 22 21 2B C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $8BFD			; 70 2B
	CMP $22			  ; C3 22
	STA $50			  ; 85 50
	CMP $A2			  ; C3 A2
	ORA $00			  ; 03 00
	JSL $C32C9E		  ; 22 9E 2C C3
	JSL $C35500		  ; 22 00 55 C3
	LDA #$2A			 ; A9 2A
	PLB				  ; AB
	JSL $C32B21		  ; 22 21 2B C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $8C1A			; 70 2B
	CMP $22			  ; C3 22

;==============================================================================
; GeneralPurpose_020
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_020:
	PHB				  ; 8B | Push data bank register
	BVC $8BB7			; 50 C3 | Unknown operation
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	LDA #$2F			 ; A9 2F | Load value into accumulator
	PLB				  ; AB | Pull data bank register
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	JSL $C35079		  ; 22 79 50 C3 | Call external function
	LDX #$05			 ; A2 05 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	LDA #$34			 ; A9 34 | Load value into accumulator
	PLB				  ; AB | Pull data bank register
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	JSL $C3507F		  ; 22 7F 50 C3 | Call external function
	LDX #$05			 ; A2 05 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	LDA #$39			 ; A9 39 | Load value into accumulator
	PLB				  ; AB | Pull data bank register
	JSL $C32B21		  ; 22 21 2B C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8C63			; 70 2B | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	STA $50			  ; 91 50 | Store accumulator to memory
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32C9E		  ; 22 9E 2C C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C35097		  ; 22 97 50 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	SEC				  ; 38 | Set carry flag
	ROL $22C3			; 2E C3 22 | Unknown operation
	BRK $55			  ; 00 55 | Software interrupt
	CMP $6B			  ; C3 6B | Compare with accumulator
	JSL $C35FE7		  ; 22 E7 5F C3 | Call external function
	BCS $8C61			; B0 03 | Branch if carry set
	JMP $8C9A			; 4C 9A 8C | Unknown operation
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C34C42		  ; 22 42 4C C3 | Call external function
	LDX #$0F			 ; A2 0F | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	AND $C32C			; 2D 2C C3 | Logical AND with accumulator

	AND $C32C			; 2D 2C C3
	JSL $C35522		  ; 22 22 55 C3
	JSL $C358D7		  ; 22 D7 58 C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C3604F		  ; 22 4F 60 C3
	BCS $8C88			; B0 03
	JMP $8C90			; 4C 90 8C
	LDA #$3E			 ; A9 3E
	PLB				  ; AB
	JSL $C32B61		  ; 22 61 2B C3
	SEC				  ; 38
	BCC $8C95			; 90 03
	JMP $8C99			; 4C 99 8C
	JSL $C35C00		  ; 22 00 5C C3
	SEC				  ; 38
	RTL				  ; 6B
	JSL $C35FE7		  ; 22 E7 5F C3
	BCS $8CA4			; B0 03
	JMP $8CCB			; 4C CB 8C
	JSL $C35CFA		  ; 22 FA 5C C3
	JSL $C3554B		  ; 22 4B 55 C3
	JSL $C34C54		  ; 22 54 4C C3
	LDX #$0F			 ; A2 0F
	BRK $22			  ; 00 22
	AND $C32C			; 2D 2C C3
	JSL $C35522		  ; 22 22 55 C3
	JSL $C35925		  ; 22 25 59 C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35BB3		  ; 22 B3 5B C3
	SEC				  ; 38
	JSL $C35FEE		  ; 22 EE 5F C3
	BCS $8CD4			; B0 03
	JMP $8CF0			; 4C F0 8C
	JSL $C35CFA		  ; 22 FA 5C C3
	JSL $C3554B		  ; 22 4B 55 C3
	JSL $C35522		  ; 22 22 55 C3
	JSL $C35D0F		  ; 22 0F 5D C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C35D23		  ; 22 23 5D C3
	SEC				  ; 38
	RTL				  ; 6B
	JSL $C3554B		  ; 22 4B 55 C3
	JSL $C3531B		  ; 22 1B 53 C3
	JSL $C32EB0		  ; 22 B0 2E C3
	LDA $04			  ; A5 04
	BNE $8D04			; D0 03
	JMP $8D4A			; 4C 4A 8D
	JSL $C34921		  ; 22 21 49 C3
	LDX #$09			 ; A2 09
	BRK $22			  ; 00 22

;==============================================================================
; GeneralPurpose_021
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_021:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	AND $49			  ; 21 49 | Logical AND with accumulator
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C34921		  ; 22 21 49 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_022
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_022:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8D73			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	TSB $8D			  ; 04 8D | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C35345		  ; 22 45 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8D5E			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8DA4			; 4C A4 8D | Unknown operation
	JSL $C348FB		  ; 22 FB 48 C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_023
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_023:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	XCE				  ; FB | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C348FB		  ; 22 FB 48 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_024
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_024:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8DCD			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	LSR $6B8D,X		  ; 5E 8D 6B | Unknown operation
	JSL $C35D5F		  ; 22 5F 5D C3 | Call external function
	JSL $C35351		  ; 22 51 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8DB8			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8DFE			; 4C FE 8D | Unknown operation
	JSL $C34921		  ; 22 21 49 C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_025
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_025:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	AND $49			  ; 21 49 | Logical AND with accumulator
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C34921		  ; 22 21 49 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_026
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_026:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8E27			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	CLV				  ; B8 | Unknown operation
	STA $226B			; 8D 6B 22 | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_027
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_027:
	EOR $22C35D,X		; 5F 5D C3 22 | Unknown operation
	PHY				  ; 5A | Push Y register to stack
	EOR $C3			  ; 53 C3 | Unknown operation
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8E12			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8E58			; 4C 58 8E | Unknown operation
	JSL $C348FB		  ; 22 FB 48 C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_028
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_028:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	XCE				  ; FB | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C348FB		  ; 22 FB 48 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_029
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_029:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8E81			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	ORA $8E			  ; 12 8E | Logical OR with accumulator
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C35366		  ; 22 66 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8E6C			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8EA6			; 4C A6 8E | Unknown operation
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C3496E		  ; 22 6E 49 C3 | Call external function
	LDX #$07			 ; A2 07 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_02A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02A:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	STY $49,X			; 94 49 | Store Y register
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8EA6			; B0 03 | Branch if carry set
	JMP $8E6C			; 4C 6C 8E | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C35381		  ; 22 81 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8EBA			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8EE1			; 4C E1 8E | Unknown operation
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34947		  ; 22 47 49 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_02B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02B:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8F0A			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	TSX				  ; BA | Unknown operation
	STX $226B			; 8E 6B 22 | Store X register
	


;==============================================================================
; GeneralPurpose_02C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02C:
	PHK				  ; 4B | Unknown operation
	EOR $C3,X			; 55 C3 | Unknown operation
	JSL $C35390		  ; 22 90 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8EF5			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8F2F			; 4C 2F 8F | Unknown operation
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C3496E		  ; 22 6E 49 C3 | Call external function
	LDX #$07			 ; A2 07 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_02D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02D:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	STY $49,X			; 94 49 | Store Y register
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ASL $00			  ; 06 00 | Arithmetic shift left
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $8F2F			; B0 03 | Branch if carry set
	JMP $8EF5			; 4C F5 8E | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C353A1		  ; 22 A1 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $8F43			; D0 03 | Branch if not equal (zero flag clear)
	JMP $8F6A			; 4C 6A 8F | Unknown operation
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	JSL $C34947		  ; 22 47 49 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_02E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02E:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $8F93			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	EOR $8F			  ; 43 8F | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C35DA9		  ; 22 A9 5D C3 | Call external function
	JSL $C357DD		  ; 22 DD 57 C3 | Call external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C35DB9		  ; 22 B9 5D C3 | Call external function
	JSL $C35522		  ; 22 22 55 C3 | Call external function
	JSL $C3604F		  ; 22 4F 60 C3 | Call external function
	BCS $8F88			; B0 03 | Branch if carry set
	JMP $8FA2			; 4C A2 8F | Unknown operation
	LDA #$4B			 ; A9 4B | Load value into accumulator
	PLB				  ; AB | Pull data bank register
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	LDA #$54			 ; A9 54 | Load value into accumulator
	PLB				  ; AB | Pull data bank register
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $8FCB			; 70 2B | Unknown operation
	CMP $38			  ; C3 38 | Compare with accumulator
	BCC $8FA7			; 90 03 | Branch if carry clear
	JMP $8FC6			; 4C C6 8F | Unknown operation
	JSL $C36018		  ; 22 18 60 C3 | Call external function
	BCS $8FB0			; B0 03 | Branch if carry set
	JMP $8FB5			; 4C B5 8F | Unknown operation
	JSL $C35E12		  ; 22 12 5E C3 | Call external function
	SEC				  ; 38 | Set carry flag
	BCC $8FBA			; 90 03 | Branch if carry clear
	JMP $8FC6			; 4C C6 8F | Unknown operation
	JSL $C35AD8		  ; 22 D8 5A C3 | Call external function
	JSL $C35500		  ; 22 00 55 C3 | Call external function
	JSL $C35C6C		  ; 22 6C 5C C3 | Call external function
	RTL				  ; 6B | Return from external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$5A			 ; A9 5A | Load value into accumulator
	PLB				  ; AB | Pull data bank register

	PLB				  ; AB
	JSL $C32B61		  ; 22 61 2B C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	BVS $9006			; 70 2B
	CMP $22			  ; C3 22
	JSL $22C355		  ; 22 55 C3 22
	CPY $C351			; CC 51 C3
	JSL $C32EB0		  ; 22 B0 2E C3
	LDA $04			  ; A5 04
	BNE $8FEF			; D0 03
	JMP $901E			; 4C 1E 90
	JSL $C3554B		  ; 22 4B 55 C3
	LDA #$00			 ; A9 00
	BRK $22			  ; 00 22
	JMP $22C33D		  ; 5C 3D C3 22
	TAY				  ; A8
	EOR $C3			  ; 47 C3
	LDX #$04			 ; A2 04

;==============================================================================
; GeneralPurpose_02F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02F:
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_030
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_030:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	BRK $56			  ; 00 56 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $9047			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	SBC $32228F		  ; EF 8F 22 32 | Unknown operation
	CLI				  ; 58 | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	BRK $80			  ; 00 80 | Software interrupt
	JSL $C33D5C		  ; 22 5C 3D C3 | Call external function
	JSL $C34E23		  ; 22 23 4E C3 | Call external function
	LDX #$04			 ; A2 04 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_031
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_031:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $6BC32C		  ; 0F 2C C3 6B | Logical OR with accumulator
	JSL $C35FE7		  ; 22 E7 5F C3 | Call external function
	BCS $9046			; B0 03 | Branch if carry set
	JMP $906E			; 4C 6E 90 | Unknown operation
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C34C63		  ; 22 63 4C C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_032
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_032:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	JSL $22C355		  ; 22 55 C3 22 | Call external function
	AND $59			  ; 25 59 | Logical AND with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BRK $55			  ; 00 55 | Software interrupt
	CMP $22			  ; C3 22 | Compare with accumulator
	DEC $C35A,X		  ; DE 5A C3 | Unknown operation
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from external function
	JSL $C35D31		  ; 22 31 5D C3 | Call external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C351D6		  ; 22 D6 51 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $9086			; D0 03 | Branch if not equal (zero flag clear)
	JMP $90B5			; 4C B5 90 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	INY				  ; C8 | Unknown operation
	EOR $C3			  ; 47 C3 | Unknown operation
	LDX #$0A			 ; A2 0A | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_033
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_033:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	STA $56			  ; 81 56 | Store accumulator to memory
	CMP $22			  ; C3 22 | Compare with accumulator
	LDA $58			  ; B3 58 | Load value into accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $90DE			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	STX $90			  ; 86 90 | Store X register
	RTL				  ; 6B | Return from external function
	JSL $C3521B		  ; 22 1B 52 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $90C5			; D0 03 | Branch if not equal (zero flag clear)
	JMP $90F0			; 4C F0 90 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	LSR				  ; 4A | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ASL				  ; 0A | Arithmetic shift left
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_034
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_034:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	RTL				  ; 6B | Return from external function
	CLI				  ; 58 | Unknown operation
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $9119			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	CMP $90			  ; C5 90 | Compare with accumulator
	JSL $C35FA9		  ; 22 A9 5F C3 | Call external function
	RTL				  ; 6B | Return from external function
	JSL $C35212		  ; 22 12 52 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $9104			; D0 03 | Branch if not equal (zero flag clear)
	JMP $913A			; 4C 3A 91 | Unknown operation
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	JMP $22C33D		  ; 5C 3D C3 22 | Unknown operation
	LSR				  ; 4A | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ASL				  ; 0A | Arithmetic shift left
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_035
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_035:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	RTL				  ; 6B | Return from external function
	CLI				  ; 58 | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	ORA $00			  ; 01 00 | Logical OR with accumulator
	JSL $C32B8D		  ; 22 8D 2B C3 | Call external function
	JSL $C35844		  ; 22 44 58 C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	JSL $C32FB0		  ; 22 B0 2F C3 | Call external function
	BCS $913A			; B0 03 | Branch if carry set
	JMP $9104			; 4C 04 91 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C353C8		  ; 22 C8 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $914E			; D0 03 | Branch if not equal (zero flag clear)
	JMP $9194			; 4C 94 91 | Unknown operation
	JSL $C349B3		  ; 22 B3 49 C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_036
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_036:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	CMP $49,X			; D5 49 | Compare with accumulator
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C349D5		  ; 22 D5 49 C3 | Call external function
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_037
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_037:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $91BD			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	LSR $2291			; 4E 91 22 | Unknown operation
	EOR $5D			  ; 43 5D | Unknown operation
	CMP $6B			  ; C3 6B | Compare with accumulator
	JSL $C3554B		  ; 22 4B 55 C3 | Call external function
	JSL $C353CC		  ; 22 CC 53 C3 | Call external function
	JSL $C32EB0		  ; 22 B0 2E C3 | Call external function
	LDA $04			  ; A5 04 | Load value into accumulator
	BNE $91AC			; D0 03 | Branch if not equal (zero flag clear)
	JMP $91F2			; 4C F2 91 | Unknown operation
	JSL $C349DB		  ; 22 DB 49 C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_038
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_038:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	INC $C349,X		  ; FE 49 C3 | Unknown operation
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_039
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_039:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	INC $C349,X		  ; FE 49 C3 | Unknown operation
	LDX #$08			 ; A2 08 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_03A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03A:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	BCS $921B			; B0 2F | Branch if carry set
	CMP $B0			  ; C3 B0 | Compare with accumulator
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	LDY $2291			; AC 91 22 | Load Y register
	EOR $5D			  ; 51 5D | Unknown operation
	CMP $6B			  ; C3 6B | Compare with accumulator
	JSL $C35D5F		  ; 22 5F 5D C3 | Call external function
	JSL $C34D5A		  ; 22 5A 4D C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	AND $C32C			; 2D 2C C3 | Logical AND with accumulator
	JSL $C35522		  ; 22 22 55 C3 | Call external function
	JSL $C34C75		  ; 22 75 4C C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	AND $C32C			; 2D 2C C3 | Logical AND with accumulator
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	JSL $C34D68		  ; 22 68 4D C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	AND $C32C			; 2D 2C C3 | Logical AND with accumulator
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$32			 ; A9 32 | Load value into accumulator
	TAY				  ; A8 | Unknown operation
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C35D6C		  ; 22 6C 5D C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$3A			 ; A9 3A | Load value into accumulator
	TAY				  ; A8 | Unknown operation
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C3510A		  ; 22 0A 51 C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	RTL				  ; 6B | Return from external function
	JSL $C35D5F		  ; 22 5F 5D C3 | Call external function

	JSL $C35D5F		  ; 22 5F 5D C3
	JSL $C34CA3		  ; 22 A3 4C C3
	LDX #$09			 ; A2 09
	BRK $22			  ; 00 22

;==============================================================================
; GeneralPurpose_03B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03B:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	CPY $4C			  ; C4 4C | Unknown operation
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	JSL $C34CE5		  ; 22 E5 4C C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_03C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03C:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $22C32C		  ; 0F 2C C3 22 | Logical OR with accumulator
	ORA #$55			 ; 09 55 | Logical OR with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ASL $4D			  ; 06 4D | Arithmetic shift left
	CMP $A2			  ; C3 A2 | Compare with accumulator
	ORA #$00			 ; 09 00 | Logical OR with accumulator
	JSL $C32BC2		  ; 22 C2 2B C3 | Call external function
	JSL $C32BD2		  ; 22 D2 2B C3 | Call external function
	JSL $C32C0F		  ; 22 0F 2C C3 | Call external function
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	JSL $C34D27		  ; 22 27 4D C3 | Call external function
	LDX #$09			 ; A2 09 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	


;==============================================================================
; GeneralPurpose_03D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03D:
	REP #$2B			 ; C2 2B | Clear processor status bits
	CMP $22			  ; C3 22 | Compare with accumulator
	CMP $2B			  ; D2 2B | Compare with accumulator
	CMP $22			  ; C3 22 | Compare with accumulator
	ORA $6BC32C		  ; 0F 2C C3 6B | Logical OR with accumulator
	JSL $C35D5F		  ; 22 5F 5D C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $9301			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	EOR $A8			  ; 41 A8 | Unknown operation
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C350F6		  ; 22 F6 50 C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	LDX #$02			 ; A2 02 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $931E			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	EOR $A8			  ; 47 A8 | Unknown operation
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C350EC		  ; 22 EC 50 C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	LDA #$01			 ; A9 01 | Load value into accumulator
	BRK $22			  ; 00 22 | Software interrupt
	STA $C32B			; 8D 2B C3 | Store accumulator to memory
	LDA #$4F			 ; A9 4F | Load value into accumulator
	TAY				  ; A8 | Unknown operation
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C350BA		  ; 22 BA 50 C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation
	JSL $C35509		  ; 22 09 55 C3 | Call external function
	LDX #$02			 ; A2 02 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	BVS $9358			; 70 2B | Unknown operation
	CMP $A9			  ; C3 A9 | Compare with accumulator
	EOR $A8			  ; 57 A8 | Unknown operation
	JSL $C32B61		  ; 22 61 2B C3 | Call external function
	JSL $C350A4		  ; 22 A4 50 C3 | Call external function
	LDX #$03			 ; A2 03 | Load X register
	BRK $22			  ; 00 22 | Software interrupt
	STZ $C32C,X		  ; 9E 2C C3 | Unknown operation

	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$5E			 ; A9 5E
	TAY				  ; A8
	JSL $C32B61		  ; 22 61 2B C3
	JSL $C350D8		  ; 22 D8 50 C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3
	LDA #$66			 ; A9 66
	TAY				  ; A8
	JSL $C32B61		  ; 22 61 2B C3
	JSL $C350C4		  ; 22 C4 50 C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3
	LDA #$70			 ; A9 70
	TAY				  ; A8
	JSL $C32B61		  ; 22 61 2B C3
	JSL $C350CE		  ; 22 CE 50 C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$7A			 ; A9 7A
	TAY				  ; A8
	JSL $C32B61		  ; 22 61 2B C3
	JSL $C350E2		  ; 22 E2 50 C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $93DB			; 70 2B
	CMP $A9			  ; C3 A9
	STA $A8			  ; 83 A8
	JSL $C32B61		  ; 22 61 2B C3
	JSL $C35100		  ; 22 00 51 C3
	LDX #$03			 ; A2 03
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	JSL $C35509		  ; 22 09 55 C3
	LDA #$06			 ; A9 06
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$05			 ; A9 05
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	JSL $C350AE		  ; 22 AE 50 C3
	LDX #$08			 ; A2 08
	BRK $22			  ; 00 22
	STZ $C32C,X		  ; 9E 2C C3
	RTL				  ; 6B
	LDA #$01			 ; A9 01
	BRK $22			  ; 00 22
	STA $C32B			; 8D 2B C3
	LDA #$1F			 ; A9 1F
	PLB				  ; AB
	JSL $C32B61		  ; 22 61 2B C3
	LDX #$02			 ; A2 02
	BRK $22			  ; 00 22
	BVS $9420			; 70 2B
	CMP $22			  ; C3 22
	JSL $22C355		  ; 22 55 C3 22
	CPY $C351			; CC 51 C3
	JSL $C32EB0		  ; 22 B0 2E C3
	LDA $04			  ; A5 04
	BNE $9409			; D0 03
;==============================================================================
; Function Index (62 functions)
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
;==============================================================================