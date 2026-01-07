;==============================================================================
; Dragon Quest III - Menu 03
;==============================================================================
; File: menu_03.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Menu System (Bank $03)
; Comprehensive code extraction


.segment "MENU_CODE"

;==============================================================================
; GeneralPurpose_000
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_000:
	ROL $88			  ; 26 88 | Unknown operation
	STA $89			  ; 81 89 | Store accumulator to memory
	LDA $E3D0			; AD D0 E3 | Load value into accumulator
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Unknown operation
	LSR				  ; 4A | Unknown operation
	LSR				  ; 4A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	AND $26			  ; 25 26 | Logical AND with accumulator
	STA $10			  ; 85 10 | Store accumulator to memory
	TAY				  ; A8 | Unknown operation
	LDA $00			  ; B7 00 | Load value into accumulator
	TAX				  ; AA | Transfer accumulator to X
	


;==============================================================================
; GeneralPurpose_001
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_001:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDA49C,X		; BF 9C A4 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDAED9,X		; BF D9 AE ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDB916,X		; BF 16 B9 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDC353,X		; BF 53 C3 ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_002
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_002:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($8049,X)		; 7C 49 80 | Unknown operation
	EOR $5E80,Y		  ; 59 80 5E | Unknown operation
	BRA $80B9			; 80 6B | Unknown operation
	BRA $80C0			; 80 70 | Unknown operation
	BRA $80CF			; 80 7D | Unknown operation
	BRA $7FD6			; 80 82 | Unknown operation
	BRA $7FE5			; 80 8F | Unknown operation
	BRA $7FEC			; 80 94 | Unknown operation
	BRA $8000			; 80 A6 | Unknown operation
	TSB $4C			  ; 04 4C | Unknown operation
	CMP $80			  ; D7 80 | Compare with accumulator
	LDX $04			  ; A6 04 | Load X register
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $80EB			; 4C EB 80 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $80F7			; 4C F7 80 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $810B			; 4C 0B 81 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8117			; 4C 17 81 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $812B			; 4C 2B 81 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8137			; 4C 37 81 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation

	TAY				  ; A8
	JMP $814B			; 4C 4B 81
	LDA $10			  ; A5 10
	AND $26			  ; 25 26
	TAY				  ; A8
	LDA $00			  ; B7 00
	PHX				  ; DA
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_003
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_003:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDA49C,X		; BF 9C A4 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDAED9,X		; BF D9 AE ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDB916,X		; BF 16 B9 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDC353,X		; BF 53 C3 ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_004
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_004:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $815E			; F0 73 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $815E			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $815E			; F0 53 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $815E			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $815E			; F0 33 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $815E			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $815E			; F0 13
	LDA $B886,Y		  ; B9 86 B8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $815E			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $80A1			; 4C A1 80
	RTS				  ; 60
	LDA $E3D0			; AD D0 E3
	PHA				  ; 48
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	ASL				  ; 0A
	AND $26			  ; 25 26
	STA $10			  ; 85 10
	TAY				  ; A8
	LDA $00			  ; B7 00
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_005
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_005:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDA49C,X		; BF 9C A4 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDAED9,X		; BF D9 AE ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDB916,X		; BF 16 B9 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDC353,X		; BF 53 C3 ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_006
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_006:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($81A4,X)		; 7C A4 81 | Unknown operation
	LDY $81,X			; B4 81 | Load Y register
	LDA $C681,Y		  ; B9 81 C6 | Load value into accumulator
	STA $CB			  ; 81 CB | Store accumulator to memory
	STA $D8			  ; 81 D8 | Store accumulator to memory
	STA $DD			  ; 81 DD | Store accumulator to memory
	STA $EA			  ; 81 EA | Store accumulator to memory
	STA $EF			  ; 81 EF | Store accumulator to memory
	STA $A6			  ; 81 A6 | Store accumulator to memory
	TSB $4C			  ; 04 4C | Unknown operation
	AND $82			  ; 32 82 | Logical AND with accumulator
	LDX $04			  ; A6 04 | Load X register
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8246			; 4C 46 82 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8252			; 4C 52 82 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8266			; 4C 66 82 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8272			; 4C 72 82 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8286			; 4C 86 82 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8292			; 4C 92 82 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation

	TAY				  ; A8
	JMP $82A6			; 4C A6 82
	LDA $10			  ; A5 10
	AND $26			  ; 25 26

;==============================================================================
; GeneralPurpose_007
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_007:
	TAY				  ; A8 | Unknown operation
	LDA $00			  ; B7 00 | Load value into accumulator
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X
	


;==============================================================================
; GeneralPurpose_008
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_008:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDA49C,X		; BF 9C A4 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDAED9,X		; BF D9 AE ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDB916,X		; BF 16 B9 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDC353,X		; BF 53 C3 ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_009
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_009:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $82B9			; F0 73 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $82B9			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $82B9			; F0 53 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $82B9			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $82B9			; F0 33 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $82B9			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $82B9			; F0 13
	LDA $C886,Y		  ; B9 86 C8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $82B9			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $81FC			; 4C FC 81
	RTS				  ; 60
	LDA $E3D0			; AD D0 E3
	PHA				  ; 48
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	ASL				  ; 0A
	AND $26			  ; 25 26
	STA $10			  ; 85 10
	TAY				  ; A8
	LDA $00			  ; B7 00
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_00A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00A:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDCD90,X		; BF 90 CD ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDD7CD,X		; BF CD D7 ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDE20A,X		; BF 0A E2 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDEC47,X		; BF 47 EC ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_00B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00B:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($82FF,X)		; 7C FF 82 | Unknown operation
	ORA $831483		  ; 0F 83 14 83 | Logical OR with accumulator
	AND $83			  ; 21 83 | Logical AND with accumulator
	ROL $83			  ; 26 83 | Unknown operation
	AND $83			  ; 33 83 | Logical AND with accumulator
	SEC				  ; 38 | Set carry flag
	STA $45			  ; 83 45 | Store accumulator to memory
	STA $4A			  ; 83 4A | Store accumulator to memory
	STA $A6			  ; 83 A6 | Store accumulator to memory
	TSB $4C			  ; 04 4C | Unknown operation
	STA $A683			; 8D 83 A6 | Store accumulator to memory
	TSB $AD			  ; 04 AD | Unknown operation
	LSR $18FC			; 4E FC 18 | Unknown operation
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $83A1			; 4C A1 83 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $83AD			; 4C AD 83 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $83C1			; 4C C1 83 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $83CD			; 4C CD 83 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $83E1			; 4C E1 83 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $83ED			; 4C ED 83 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8401			; 4C 01 84 | Unknown operation

	JMP $8401			; 4C 01 84
	LDA $10			  ; A5 10
	AND $26			  ; 25 26
	TAY				  ; A8
	LDA $00			  ; B7 00
	PHX				  ; DA
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_00C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00C:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDCD90,X		; BF 90 CD ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDD7CD,X		; BF CD D7 ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDE20A,X		; BF 0A E2 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDEC47,X		; BF 47 EC ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_00D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00D:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8414			; F0 73 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8414			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8414			; F0 53 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8414			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8414			; F0 33 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8414			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8414			; F0 13
	LDA $B886,Y		  ; B9 86 B8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8414			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $8357			; 4C 57 83
	RTS				  ; 60
	LDA $E3D0			; AD D0 E3
	PHA				  ; 48
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	ASL				  ; 0A
	AND $26			  ; 25 26
	STA $10			  ; 85 10
	TAY				  ; A8
	LDA $00			  ; B7 00
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_00E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00E:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDCD90,X		; BF 90 CD ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDD7CD,X		; BF CD D7 ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDE20A,X		; BF 0A E2 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDEC47,X		; BF 47 EC ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_00F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00F:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($845A,X)		; 7C 5A 84 | Unknown operation
	ROR				  ; 6A | Unknown operation
	STY $6F			  ; 84 6F | Store Y register
	STY $7C			  ; 84 7C | Store Y register
	STY $81			  ; 84 81 | Store Y register
	STY $8E			  ; 84 8E | Store Y register
	STY $93			  ; 84 93 | Store Y register
	STY $A0			  ; 84 A0 | Store Y register
	STY $A5			  ; 84 A5 | Store Y register
	STY $A6			  ; 84 A6 | Store Y register
	TSB $4C			  ; 04 4C | Unknown operation
	INX				  ; E8 | Unknown operation
	STY $A6			  ; 84 A6 | Store Y register
	TSB $AD			  ; 04 AD | Unknown operation
	LSR $18FC			; 4E FC 18 | Unknown operation
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $84FC			; 4C FC 84 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8508			; 4C 08 85 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $851C			; 4C 1C 85 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8528			; 4C 28 85 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $853C			; 4C 3C 85 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8548			; 4C 48 85 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left

	ASL				  ; 0A
	TAY				  ; A8
	JMP $855C			; 4C 5C 85
	LDA $10			  ; A5 10
	AND $26			  ; 25 26
	TAY				  ; A8
	LDA $00			  ; B7 00
	PHX				  ; DA
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_010
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_010:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDCD90,X		; BF 90 CD ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EDD7CD,X		; BF CD D7 ED | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EDE20A,X		; BF 0A E2 ED | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EDEC47,X		; BF 47 EC ED | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_011
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_011:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $856F			; F0 73 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $856F			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $856F			; F0 53 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $856F			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $856F			; F0 33 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $856F			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $856F			; F0 13
	LDA $C886,Y		  ; B9 86 C8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $856F			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $84B2			; 4C B2 84
	RTS				  ; 60
	LDA $E3D0			; AD D0 E3
	PHA				  ; 48
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	ASL				  ; 0A
	AND $26			  ; 25 26
	STA $10			  ; 85 10
	TAY				  ; A8
	LDA $00			  ; B7 00
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_012
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_012:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDF684,X		; BF 84 F6 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE00C1,X		; BF C1 00 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE0AFE,X		; BF FE 0A EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE153B,X		; BF 3B 15 EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_013
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_013:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($85B5,X)		; 7C B5 85 | Unknown operation
	CMP $85			  ; C5 85 | Compare with accumulator
	DEX				  ; CA | Unknown operation
	STA $D7			  ; 85 D7 | Store accumulator to memory
	STA $DC			  ; 85 DC | Store accumulator to memory
	STA $E9			  ; 85 E9 | Store accumulator to memory
	STA $EE			  ; 85 EE | Store accumulator to memory
	STA $FB			  ; 85 FB | Store accumulator to memory
	STA $00			  ; 85 00 | Store accumulator to memory
	STX $A6			  ; 86 A6 | Store X register
	TSB $4C			  ; 04 4C | Unknown operation
	EOR $86			  ; 43 86 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8657			; 4C 57 86 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8663			; 4C 63 86 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8677			; 4C 77 86 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8683			; 4C 83 86 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8697			; 4C 97 86 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $86A3			; 4C A3 86 | Unknown operation
	


;==============================================================================
; GeneralPurpose_014
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_014:
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $86B7			; 4C B7 86 | Unknown operation
	LDA $10			  ; A5 10 | Load value into accumulator
	AND $26			  ; 25 26 | Logical AND with accumulator
	TAY				  ; A8 | Unknown operation
	LDA $00			  ; B7 00 | Load value into accumulator
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X
	


;==============================================================================
; GeneralPurpose_015
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_015:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDF684,X		; BF 84 F6 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE00C1,X		; BF C1 00 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE0AFE,X		; BF FE 0A EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE153B,X		; BF 3B 15 EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_016
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_016:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $86CA			; F0 73 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $86CA			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $86CA			; F0 53 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $86CA			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $86CA			; F0 33 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $86CA			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $86CA			; F0 13
	LDA $B886,Y		  ; B9 86 B8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $86CA			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $860D			; 4C 0D 86
	RTS				  ; 60
	LDA $E3D0			; AD D0 E3
	PHA				  ; 48
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	ASL				  ; 0A
	AND $26			  ; 25 26
	STA $10			  ; 85 10
	TAY				  ; A8
	LDA $00			  ; B7 00
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_017
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_017:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDF684,X		; BF 84 F6 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE00C1,X		; BF C1 00 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE0AFE,X		; BF FE 0A EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE153B,X		; BF 3B 15 EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_018
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_018:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($8710,X)		; 7C 10 87 | Unknown operation
	JSR $2587			; 20 87 25 | Call local function
	STA $32			  ; 87 32 | Store accumulator to memory
	STA $37			  ; 87 37 | Store accumulator to memory
	STA $44			  ; 87 44 | Store accumulator to memory
	STA $49			  ; 87 49 | Store accumulator to memory
	STA $56			  ; 87 56 | Store accumulator to memory
	STA $5B			  ; 87 5B | Store accumulator to memory
	STA $A6			  ; 87 A6 | Store accumulator to memory
	TSB $4C			  ; 04 4C | Unknown operation
	STZ $A687,X		  ; 9E 87 A6 | Unknown operation
	TSB $AD			  ; 04 AD | Unknown operation
	LSR $18FC			; 4E FC 18 | Unknown operation
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $87B2			; 4C B2 87 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $87BE			; 4C BE 87 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $87D2			; 4C D2 87 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $87DE			; 4C DE 87 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $87F2			; 4C F2 87 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $87FE			; 4C FE 87 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8812			; 4C 12 88 | Unknown operation

	JMP $8812			; 4C 12 88
	LDA $10			  ; A5 10
	AND $26			  ; 25 26
	TAY				  ; A8
	LDA $00			  ; B7 00
	PHX				  ; DA
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_019
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_019:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EDF684,X		; BF 84 F6 ED | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE00C1,X		; BF C1 00 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE0AFE,X		; BF FE 0A EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE153B,X		; BF 3B 15 EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_01A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01A:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8825			; F0 73 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8825			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8825			; F0 53 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8825			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8825			; F0 33 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8825			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8825			; F0 13
	LDA $C886,Y		  ; B9 86 C8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8825			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $8768			; 4C 68 87
	RTS				  ; 60
	LDA $E3D0			; AD D0 E3
	PHA				  ; 48
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	ASL				  ; 0A
	AND $26			  ; 25 26
	STA $10			  ; 85 10
	TAY				  ; A8
	LDA $00			  ; B7 00
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_01B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01B:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EE1F78,X		; BF 78 1F EE | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE29B5,X		; BF B5 29 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE33F2,X		; BF F2 33 EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE3E2F,X		; BF 2F 3E EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_01C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01C:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($886B,X)		; 7C 6B 88 | Unknown operation
	TDC				  ; 7B | Unknown operation
	DEY				  ; 88 | Unknown operation
	BRA $87F7			; 80 88 | Unknown operation
	STA $9288			; 8D 88 92 | Store accumulator to memory
	DEY				  ; 88 | Unknown operation
	STA $88A488,X		; 9F 88 A4 88 | Store accumulator to memory
	LDA $88			  ; B1 88 | Load value into accumulator
	LDX $88,Y			; B6 88 | Load X register
	LDX $04			  ; A6 04 | Load X register
	JMP $88F9			; 4C F9 88 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $890D			; 4C 0D 89 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8919			; 4C 19 89 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $892D			; 4C 2D 89 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8939			; 4C 39 89 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $894D			; 4C 4D 89 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8959			; 4C 59 89 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation

	TAY				  ; A8
	JMP $896D			; 4C 6D 89
	LDA $10			  ; A5 10
	AND $26			  ; 25 26
	TAY				  ; A8
	LDA $00			  ; B7 00
	PHX				  ; DA
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_01D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01D:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EE1F78,X		; BF 78 1F EE | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE29B5,X		; BF B5 29 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE33F2,X		; BF F2 33 EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE3E2F,X		; BF 2F 3E EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_01E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01E:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8980			; F0 73 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8980			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8980			; F0 53 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8980			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $C086,Y		  ; B9 86 C0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8980			; F0 33 | Branch if equal (zero flag set)
	LDA $B886,Y		  ; B9 86 B8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8980			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8980			; F0 13
	LDA $B886,Y		  ; B9 86 B8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8980			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $88C3			; 4C C3 88
	RTS				  ; 60
	LDA $E3D0			; AD D0 E3
	PHA				  ; 48
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	ASL				  ; 0A
	AND $26			  ; 25 26
	STA $10			  ; 85 10
	TAY				  ; A8
	LDA $00			  ; B7 00
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_01F
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01F:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EE1F78,X		; BF 78 1F EE | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE29B5,X		; BF B5 29 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE33F2,X		; BF F2 33 EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE3E2F,X		; BF 2F 3E EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_020
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_020:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	TAX				  ; AA | Transfer accumulator to X
	JMP ($89C6,X)		; 7C C6 89 | Unknown operation
	DEC $89,X			; D6 89 | Unknown operation
	STP				  ; DB | Unknown operation
	BIT #$E8			 ; 89 E8 | Unknown operation
	BIT #$ED			 ; 89 ED | Unknown operation
	BIT #$FA			 ; 89 FA | Unknown operation
	BIT #$FF			 ; 89 FF | Unknown operation
	BIT #$0C			 ; 89 0C | Unknown operation
	TXA				  ; 8A | Transfer X to accumulator
	ORA $8A			  ; 11 8A | Logical OR with accumulator
	LDX $04			  ; A6 04 | Load X register
	JMP $8A54			; 4C 54 8A | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8A68			; 4C 68 8A | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8A74			; 4C 74 8A | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8A88			; 4C 88 8A | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8A94			; 4C 94 8A | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	JMP $8AA8			; 4C A8 8A | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JMP $8AB4			; 4C B4 8A | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	LDA $FC54			; AD 54 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left

	ASL				  ; 0A
	TAY				  ; A8
	JMP $8AC8			; 4C C8 8A
	LDA $10			  ; A5 10
	AND $26			  ; 25 26
	TAY				  ; A8
	LDA $00			  ; B7 00
	PHX				  ; DA
	TAX				  ; AA

;==============================================================================
; GeneralPurpose_021
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_021:
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Unknown operation
	STZ $FC51			; 9C 51 FC | Unknown operation
	STZ $FC53			; 9C 53 FC | Unknown operation
	STZ $FC55			; 9C 55 FC | Unknown operation
	LDA $EE1F78,X		; BF 78 1F EE | Load value into accumulator
	STA $FC4E			; 8D 4E FC | Store accumulator to memory
	LDA $EE29B5,X		; BF B5 29 EE | Load value into accumulator
	STA $FC50			; 8D 50 FC | Store accumulator to memory
	LDA $EE33F2,X		; BF F2 33 EE | Load value into accumulator
	STA $FC52			; 8D 52 FC | Store accumulator to memory
	LDA $EE3E2F,X		; BF 2F 3E EE | Load value into accumulator
	STA $FC54			; 8D 54 FC | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_022
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_022:
	REP #$20			 ; C2 20 | Clear processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8ADB			; F0 73 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8ADB			; F0 67 | Branch if equal (zero flag set)
	LDA $FC50			; AD 50 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8ADB			; F0 53 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8ADB			; F0 47 | Branch if equal (zero flag set)
	LDA $FC52			; AD 52 FC | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $D086,Y		  ; B9 86 D0 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory
	INX				  ; E8 | Unknown operation
	INX				  ; E8 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BEQ $8ADB			; F0 33 | Branch if equal (zero flag set)
	LDA $C886,Y		  ; B9 86 C8 | Load value into accumulator
	STA $0000,X		  ; 9D 00 00 | Store accumulator to memory

	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8ADB			; F0 27
	LDA $FC54			; AD 54 FC
	CLC				  ; 18
	ADC $2A			  ; 65 2A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8ADB			; F0 13
	LDA $C886,Y		  ; B9 86 C8
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	DEC $24			  ; C6 24
	BEQ $8ADB			; F0 07
	INC $10			  ; E6 10
	INC $10			  ; E6 10
	JMP $8A1E			; 4C 1E 8A
	RTS				  ; 60
	LDX $18			  ; A6 18
	CPX #$08			 ; E0 08
	BRK $D0			  ; 00 D0
	ORA $60			  ; 01 60
	INC $E34E,X		  ; FE 4E E3
	LDA $14			  ; A5 14
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	STA $E3C4			; 8D C4 E3
	LDA $E376,X		  ; BD 76 E3
	LSR				  ; 4A
	LSR				  ; 4A
	LSR				  ; 4A
	STA $E3C6			; 8D C6 E3
	LDA $C16F0E,X		; BF 0E 6F C1
	STA $E3C8			; 8D C8 E3
	LDA $E3B4			; AD B4 E3
	INC				  ; 1A
	INC				  ; 1A
	STA $E5C0			; 8D C0 E5
	LDX $18			  ; A6 18
	LDA $E3E2			; AD E2 E3
	BPL $8B21			; 10 13
	LDA $18			  ; A5 18
	LSR				  ; 4A
	CMP $E472			; CD 72 E4
	BNE $8B21			; D0 0B
	LDA $E4B2			; AD B2 E4
	BEQ $8B21			; F0 06
	LDY #$00			 ; A0 00
	BRK $4C			  ; 00 4C
	DEX				  ; CA

;==============================================================================
; GeneralPurpose_023
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_023:
	PHB				  ; 8B | Push data bank register
	LDA $E3E4			; AD E4 E3 | Load value into accumulator
	BPL $8B39			; 10 13 | Unknown operation
	LDA $18			  ; A5 18 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	CMP $E474			; CD 74 E4 | Compare with accumulator
	BNE $8B39			; D0 0B | Branch if not equal (zero flag clear)
	LDA $E4B4			; AD B4 E4 | Load value into accumulator
	BEQ $8B39			; F0 06 | Branch if equal (zero flag set)
	LDY #$02			 ; A0 02 | Load Y register
	BRK $4C			  ; 00 4C | Software interrupt
	DEX				  ; CA | Unknown operation
	


;==============================================================================
; GeneralPurpose_024
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_024:
	PHB				  ; 8B | Push data bank register
	LDA $E3E6			; AD E6 E3 | Load value into accumulator
	BPL $8B51			; 10 13 | Unknown operation
	LDA $18			  ; A5 18 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	CMP $E476			; CD 76 E4 | Compare with accumulator
	BNE $8B51			; D0 0B | Branch if not equal (zero flag clear)
	LDA $E4B6			; AD B6 E4 | Load value into accumulator
	BEQ $8B51			; F0 06 | Branch if equal (zero flag set)
	LDY #$04			 ; A0 04 | Load Y register
	BRK $4C			  ; 00 4C | Software interrupt
	DEX				  ; CA | Unknown operation
	


;==============================================================================
; GeneralPurpose_025
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_025:
	PHB				  ; 8B | Push data bank register
	LDA $E3E8			; AD E8 E3 | Load value into accumulator
	BPL $8B69			; 10 13 | Unknown operation
	LDA $18			  ; A5 18 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	CMP $E478			; CD 78 E4 | Compare with accumulator
	BNE $8B69			; D0 0B | Branch if not equal (zero flag clear)
	LDA $E4B8			; AD B8 E4 | Load value into accumulator
	BEQ $8B69			; F0 06 | Branch if equal (zero flag set)
	LDY #$06			 ; A0 06 | Load Y register
	BRK $4C			  ; 00 4C | Software interrupt
	DEX				  ; CA | Unknown operation
	


;==============================================================================
; GeneralPurpose_026
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_026:
	PHB				  ; 8B | Push data bank register
	LDA $E3EA			; AD EA E3 | Load value into accumulator
	BPL $8B81			; 10 13 | Unknown operation
	LDA $18			  ; A5 18 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	CMP $E47A			; CD 7A E4 | Compare with accumulator
	BNE $8B81			; D0 0B | Branch if not equal (zero flag clear)
	LDA $E4BA			; AD BA E4 | Load value into accumulator
	BEQ $8B81			; F0 06 | Branch if equal (zero flag set)
	LDY #$08			 ; A0 08 | Load Y register
	BRK $4C			  ; 00 4C | Software interrupt
	DEX				  ; CA | Unknown operation
	


;==============================================================================
; GeneralPurpose_027
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_027:
	PHB				  ; 8B | Push data bank register
	LDA $E3EC			; AD EC E3 | Load value into accumulator
	BPL $8B99			; 10 13 | Unknown operation
	LDA $18			  ; A5 18 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	CMP $E47C			; CD 7C E4 | Compare with accumulator
	BNE $8B99			; D0 0B | Branch if not equal (zero flag clear)
	LDA $E4BC			; AD BC E4 | Load value into accumulator
	BEQ $8B99			; F0 06 | Branch if equal (zero flag set)
	LDY #$0A			 ; A0 0A | Load Y register
	BRK $4C			  ; 00 4C | Software interrupt
	DEX				  ; CA | Unknown operation
	


;==============================================================================
; GeneralPurpose_028
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_028:
	PHB				  ; 8B | Push data bank register
	LDA $E3EE			; AD EE E3 | Load value into accumulator
	BPL $8BB1			; 10 13 | Unknown operation
	LDA $18			  ; A5 18 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	CMP $E47E			; CD 7E E4 | Compare with accumulator
	BNE $8BB1			; D0 0B | Branch if not equal (zero flag clear)
	LDA $E4BE			; AD BE E4 | Load value into accumulator
	BEQ $8BB1			; F0 06 | Branch if equal (zero flag set)
	LDY #$0C			 ; A0 0C | Load Y register
	BRK $4C			  ; 00 4C | Software interrupt
	DEX				  ; CA | Unknown operation
	


;==============================================================================
; GeneralPurpose_029
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_029:
	PHB				  ; 8B | Push data bank register
	LDA $E3F0			; AD F0 E3 | Load value into accumulator
	BPL $8BC9			; 10 13 | Unknown operation
	LDA $18			  ; A5 18 | Load value into accumulator
	LSR				  ; 4A | Unknown operation
	CMP $E480			; CD 80 E4 | Compare with accumulator
	BNE $8BC9			; D0 0B | Branch if not equal (zero flag clear)
	LDA $E4C0			; AD C0 E4 | Load value into accumulator
	BEQ $8BC9			; F0 06 | Branch if equal (zero flag set)
	LDY #$0E			 ; A0 0E | Load Y register
	BRK $4C			  ; 00 4C | Software interrupt
	DEX				  ; CA | Unknown operation
	


;==============================================================================
; GeneralPurpose_02A
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02A:
	PHB				  ; 8B | Push data bank register
	RTS				  ; 60 | Return from local function
	TXA				  ; 8A | Transfer X to accumulator
	ASL				  ; 0A | Arithmetic shift left
	ASL				  ; 0A | Arithmetic shift left
	ASL				  ; 0A | Arithmetic shift left
	ASL				  ; 0A | Arithmetic shift left
	ASL				  ; 0A | Arithmetic shift left
	ADC #$62			 ; 69 62 | Unknown operation
	JSR ($0885,X)		; FC 85 08 | Call local function
	LDA $E3C4			; AD C4 E3 | Load value into accumulator
	STA $0A			  ; 85 0A | Store accumulator to memory
	LDA $E3C6			; AD C6 E3 | Load value into accumulator
	STA $0C			  ; 85 0C | Store accumulator to memory
	LDA $E3C8			; AD C8 E3 | Load value into accumulator
	STA $04			  ; 85 04 | Store accumulator to memory
	LDA $E412,Y		  ; B9 12 E4 | Load value into accumulator
	STA $00			  ; 85 00 | Store accumulator to memory
	LDA $E422,Y		  ; B9 22 E4 | Load value into accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator
	BRK $85			  ; 00 85 | Software interrupt
	COP $20			  ; 02 20 | Unknown operation
	ORA $A7			  ; 03 A7 | Logical OR with accumulator
	LDA $E402,Y		  ; B9 02 E4 | Load value into accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator
	BRK $D0			  ; 00 D0 | Software interrupt
	ORA $4C			  ; 03 4C | Logical OR with accumulator
	AND $8C			  ; 33 8C | Logical AND with accumulator
	LDA $E5B8			; AD B8 E5 | Load value into accumulator
	DEC				  ; 3A | Unknown operation
	STA $26			  ; 85 26 | Store accumulator to memory
	LDA $E5BA			; AD BA E5 | Load value into accumulator
	DEC				  ; 3A | Unknown operation
	STA $28			  ; 85 28 | Store accumulator to memory
	LDA $0A			  ; A5 0A | Load value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Unknown operation
	AND $26			  ; 25 26 | Logical AND with accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $E432,Y		  ; 79 32 E4 | Unknown operation
	STA $0A			  ; 85 0A | Store accumulator to memory
	LDA $0C			  ; A5 0C | Load value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Unknown operation
	AND $28			  ; 25 28 | Logical AND with accumulator
	STA $E3D0			; 8D D0 E3 | Store accumulator to memory
	LDA $E5C0			; AD C0 E5 | Load value into accumulator
	STA $24			  ; 85 24 | Store accumulator to memory
	LDA $E3F2,Y		  ; B9 F2 E3 | Load value into accumulator

	LDA $E3F2,Y		  ; B9 F2 E3
	TAX				  ; AA
	PHY				  ; 5A
	JSR ($A843,X)		; FC 43 A8
	PLY				  ; 7A
	RTS				  ; 60
	LDA $0A			  ; A5 0A
	CMP $E432,Y		  ; D9 32 E4
	BCC $8C3D			; 90 03
	JMP $8C7D			; 4C 7D 8C
	LDA $E4D2,Y		  ; B9 D2 E4
	STA $E3D6			; 8D D6 E3
	CMP #$FF			 ; C9 FF
	SBC $A705D0,X		; FF D0 05 A7
	BRK $8D			  ; 00 8D
	DEC $E3,X			; D6 E3
	LDA $E502,Y		  ; B9 02 E5
	STA $E3DA			; 8D DA E3
	LDA $E522,Y		  ; B9 22 E5
	STA $E3DE			; 8D DE E3
	CMP #$FF			 ; C9 FF
	SBC $2006D0,X		; FF D0 06 20
	STY $8DA7			; 8C A7 8D
	DEC $B9E3,X		  ; DE E3 B9
	AND $E4			  ; 32 E4
	SEC				  ; 38
	SBC $0A			  ; E5 0A
	CMP #$21			 ; C9 21
	BRK $90			  ; 00 90
	ORA $4C			  ; 03 4C
	ADC $258D,X		  ; 7D 8D 25
	ASL $7918,X		  ; 1E 18 79
	AND $E4			  ; 32 E4
	STA $0A			  ; 85 0A
	JMP $8CF8			; 4C F8 8C
	LDA $E442,Y		  ; B9 42 E4
	CMP $0A			  ; C5 0A
	BCC $8CAF			; 90 2B
	LDA $E4E2,Y		  ; B9 E2 E4
	STA $E3D6			; 8D D6 E3
	CMP #$FF			 ; C9 FF
	SBC $2006D0,X		; FF D0 06 20
	LDX #$A7			 ; A2 A7
	STA $E3D6			; 8D D6 E3
	LDA #$FF			 ; A9 FF
	SBC $E3DA8D,X		; FF 8D DA E3
	LDA $E532,Y		  ; B9 32 E5
	STA $E3DE			; 8D DE E3
	CMP #$FF			 ; C9 FF
	SBC $2006D0,X		; FF D0 06 20
	LDY $8DA7			; AC A7 8D
	DEC $4CE3,X		  ; DE E3 4C
	SED				  ; F8
	STY $F2B9			; 8C B9 F2
	CPX $8D			  ; E4 8D
	DEC $E3,X			; D6 E3
	CMP #$FF			 ; C9 FF
	SBC $5A0DD0,X		; FF D0 0D 5A
	LDA $E5B4			; AD B4 E5
	DEC				  ; 3A
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; B7 00
	STA $E3D6			; 8D D6 E3
	PLY				  ; 7A
	LDA $E512,Y		  ; B9 12 E5
	STA $E3DA			; 8D DA E3
	LDA $E542,Y		  ; B9 42 E5
	STA $E3DE			; 8D DE E3
	CMP #$FF			 ; C9 FF
	SBC $2006D0,X		; FF D0 06 20
	ROR $A7,X			; 76 A7
	STA $E3DE			; 8D DE E3
	LDA $0A			  ; A5 0A
	SEC				  ; 38
	SBC $E442,Y		  ; F9 42 E4
	CMP #$21			 ; C9 21
	BRK $90			  ; 00 90
	ORA $4C			  ; 03 4C
	ADC $258D,X		  ; 7D 8D 25
	ASL $B948,X		  ; 1E 48 B9
	WDM $E4			  ; 42 E4
	SEC				  ; 38
	SBC $01			  ; E3 01
	STA $0A			  ; 85 0A
	PLA				  ; 68
	STZ $E3CA			; 9C CA E3
	STZ $E3CC			; 9C CC E3
	STZ $E3CE			; 9C CE E3
	LDA $E5C0			; AD C0 E5
	STA $20			  ; 85 20
	LDA $0C			  ; A5 0C
	CMP $E452,Y		  ; D9 52 E4
	BCC $8D21			; 90 14
	CMP $E462,Y		  ; D9 62 E4
	BEQ $8D49			; F0 37
	BCC $8D49			; 90 35
	LDA $0C			  ; A5 0C
	STA $E3D4			; 8D D4 E3
	LDA $20			  ; A5 20
	STA $E3CE			; 8D CE E3
	JMP $8D74			; 4C 74 8D
	LDA $0C			  ; A5 0C
	STA $E3D0			; 8D D0 E3
	LDA $E452,Y		  ; B9 52 E4
	SEC				  ; 38
	SBC $0C			  ; E5 0C
	STA $E3CA			; 8D CA E3
	LDA $20			  ; A5 20
	SEC				  ; 38
	SBC $E3CA			; ED CA E3
	BCS $8D3F			; B0 08
	LDA $20			  ; A5 20
	STA $E3CA			; 8D CA E3
	JMP $8D74			; 4C 74 8D
	STA $20			  ; 85 20
	LDA $0C			  ; A5 0C
	CLC				  ; 18
	ADC $E3CA			; 6D CA E3
	STA $0C			  ; 85 0C
	LDA $0C			  ; A5 0C
	STA $E3D2			; 8D D2 E3
	LDA $E462,Y		  ; B9 62 E4
	INC				  ; 1A
	SEC				  ; 38
	SBC $0C			  ; E5 0C
	STA $E3CC			; 8D CC E3
	LDA $20			  ; A5 20
	SEC				  ; 38
	SBC $E3CC			; ED CC E3
	BCS $8D68			; B0 08
	LDA $20			  ; A5 20
	STA $E3CC			; 8D CC E3
	JMP $8D74			; 4C 74 8D
	STA $20			  ; 85 20
	LDA $0C			  ; A5 0C
	CLC				  ; 18
	ADC $E3CC			; 6D CC E3
	STA $0C			  ; 85 0C
	BRA $8D14			; 80 A0
	LDA $E3F2,Y		  ; B9 F2 E3
	TAX				  ; AA
	PHY				  ; 5A
	JSR ($A831,X)		; FC 31 A8
	PLY				  ; 7A
	RTS				  ; 60
	PHY				  ; 5A
	LDA $E3C6			; AD C6 E3
	STA $0C			  ; 85 0C
	LDA $0A			  ; A5 0A
	SEC				  ; 38
	SBC $E432,Y		  ; F9 32 E4
	ASL				  ; 0A
	ADC $00			  ; 65 00
	STA $00			  ; 85 00
	BCC $8D93			; 90 02
	INC $02			  ; E6 02
	LDA $E5B4			; AD B4 E5
	ASL				  ; 0A
	STA $0E			  ; 85 0E
	LDA $E452,Y		  ; B9 52 E4
	STA $E5C4			; 8D C4 E5
	LDA $E3CA			; AD CA E3
	BEQ $8DAC			; F0 08
	STA $24			  ; 85 24
	LDA $E3D6			; AD D6 E3
	JSR $8E04			; 20 04 8E
	LDA $E3CC			; AD CC E3
	BEQ $8DF5			; F0 44
	STA $24			  ; 85 24
	LDA $E3DA			; AD DA E3
	CMP #$FF			 ; C9 FF
	SBC $2005F0,X		; FF F0 05 20
	TSB $8E			  ; 04 8E
	BRA $8DF5			; 80 35
	LDA $E3D2			; AD D2 E3
	SEC				  ; 38
	SBC $E5C4			; ED C4 E5

;==============================================================================
; GeneralPurpose_02B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02B:
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Store accumulator to memory
	LDA $0E			  ; A5 0E | Load value into accumulator
	STA $004203		  ; 8F 03 42 00 | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_02C
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02C:
	REP #$20			 ; C2 20 | Clear processor status bits
	LDA $00			  ; A5 00 | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $004216		  ; 6F 16 42 00 | Unknown operation
	STA $00			  ; 85 00 | Store accumulator to memory
	LDA $00			  ; A7 00 | Load value into accumulator
	STA $04			  ; 92 04 | Store accumulator to memory
	INC $04			  ; E6 04 | Unknown operation
	INC $04			  ; E6 04 | Unknown operation
	LDA $00			  ; A5 00 | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Unknown operation
	STA $00			  ; 85 00 | Store accumulator to memory
	BCC $8DF1			; 90 02 | Branch if carry clear
	INC $02			  ; E6 02 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BNE $8DDE			; D0 E9 | Branch if not equal (zero flag clear)
	LDA $E3CE			; AD CE E3 | Load value into accumulator
	BEQ $8E02			; F0 08 | Branch if equal (zero flag set)
	STA $24			  ; 85 24 | Store accumulator to memory
	LDA $E3DE			; AD DE E3 | Load value into accumulator
	JSR $8E04			; 20 04 8E | Call local function
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from local function
	STA $04			  ; 92 04 | Store accumulator to memory
	INC $04			  ; E6 04 | Unknown operation
	INC $04			  ; E6 04 | Unknown operation
	DEC $24			  ; C6 24 | Unknown operation
	BNE $8E04			; D0 F6 | Branch if not equal (zero flag clear)
	RTS				  ; 60 | Return from local function
	LDA $E3C6			; AD C6 E3 | Load value into accumulator
	STA $0C			  ; 85 0C | Store accumulator to memory
	LDA $0A			  ; A5 0A | Load value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Unknown operation
	LSR				  ; 4A | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	ADC $00			  ; 65 00 | Unknown operation
	STA $00			  ; 85 00 | Store accumulator to memory
	BCC $8E24			; 90 02 | Branch if carry clear
	INC $02			  ; E6 02 | Unknown operation
	LDA $E5B4			; AD B4 E5 | Load value into accumulator
	ASL				  ; 0A | Arithmetic shift left
	STA $0E			  ; 85 0E | Store accumulator to memory
	LDA $E452,Y		  ; B9 52 E4 | Load value into accumulator
	STA $E5C4			; 8D C4 E5 | Store accumulator to memory
	LDA $0A			  ; A5 0A | Load value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Unknown operation

	SBC $E432,Y		  ; F9 32 E4
	LSR				  ; 4A
	BCC $8E3C			; 90 03
	JMP $937B			; 4C 7B 93
	LDA $E3CA			; AD CA E3
	BEQ $8E51			; F0 10
	STA $24			  ; 85 24
	LDA $E3D0			; AD D0 E3
	SEC				  ; 38
	SBC $E5C4			; ED C4 E5
	TAX				  ; AA
	LDA $E3D6			; AD D6 E3
	JSR $9351			; 20 51 93
	LDA $E3CC			; AD CC E3
	BNE $8E59			; D0 03
	JMP $8ED3			; 4C D3 8E
	STA $24			  ; 85 24
	LDA $E3D2			; AD D2 E3
	SEC				  ; 38
	SBC $E5C4			; ED C4 E5
	TAX				  ; AA
	LDA $E3DA			; AD DA E3
	CMP #$FF			 ; C9 FF
	SBC $AD09F0,X		; FF F0 09 AD
	PHX				  ; DA
	SBC $20			  ; E3 20
	EOR $93			  ; 51 93
	JMP $8ED3			; 4C D3 8E
	TXA				  ; 8A
	LSR				  ; 4A

;==============================================================================
; GeneralPurpose_02D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02D:
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Store accumulator to memory
	LDA $0E			  ; A5 0E | Load value into accumulator
	STA $004203		  ; 8F 03 42 00 | Store accumulator to memory
	


;==============================================================================
; GeneralPurpose_02E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_02E:
	REP #$20			 ; C2 20 | Clear processor status bits
	LDA $00			  ; A5 00 | Load value into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $004216		  ; 6F 16 42 00 | Unknown operation
	STA $00			  ; 85 00 | Store accumulator to memory
	TXA				  ; 8A | Transfer X to accumulator
	LSR				  ; 4A | Unknown operation
	BCC $8EB9			; 90 28 | Branch if carry clear
	LDA $24			  ; A5 24 | Load value into accumulator
	ASL				  ; 0A | Arithmetic shift left
	TAX				  ; AA | Transfer accumulator to X
	LDA $C18EE9,X		; BF E9 8E C1 | Load value into accumulator
	STA $001D9A		  ; 8F 9A 1D 00 | Store accumulator to memory
	LDA #$C1			 ; A9 C1 | Load value into accumulator
	BRK $8F			  ; 00 8F | Software interrupt
	STZ $001D			; 9C 1D 00 | Unknown operation
	LDA $00			  ; A7 00 | Load value into accumulator
	JSL $7FFDA2		  ; 22 A2 FD 7F | Call external function
	ASL				  ; 0A | Arithmetic shift left
	TAY				  ; A8 | Unknown operation
	LDA $00			  ; A5 00 | Load value into accumulator
	ADC $0E			  ; 65 0E | Unknown operation
	STA $00			  ; 85 00 | Store accumulator to memory
	LDX $04			  ; A6 04 | Load X register
	JSR $A80A			; 20 0A A8 | Call local function
	BRA $8ED1			; 80 18 | Unknown operation
	LDA $24			  ; A5 24 | Load value into accumulator
	ASL				  ; 0A | Arithmetic shift left
	TAX				  ; AA | Transfer accumulator to X
	LDA $C18F2D,X		; BF 2D 8F C1 | Load value into accumulator
	STA $001D9A		  ; 8F 9A 1D 00 | Store accumulator to memory
	LDA #$C1			 ; A9 C1 | Load value into accumulator
	BRK $8F			  ; 00 8F | Software interrupt
	STZ $001D			; 9C 1D 00 | Unknown operation
	LDX $04			  ; A6 04 | Load X register
	JSR $A80A			; 20 0A A8 | Call local function
	STX $04			  ; 86 04 | Store X register
	LDA $E3CE			; AD CE E3 | Load value into accumulator
	BEQ $8EE8			; F0 10 | Branch if equal (zero flag set)
	STA $24			  ; 85 24 | Store accumulator to memory
	LDA $E3D4			; AD D4 E3 | Load value into accumulator
	SEC				  ; 38 | Set carry flag
	SBC $E5C4			; ED C4 E5 | Unknown operation
	TAX				  ; AA | Transfer accumulator to X
	LDA $E3DE			; AD DE E3 | Load value into accumulator
	JSR $9351			; 20 51 93 | Call local function
	RTS				  ; 60 | Return from local function
	BVC $8E7E			; 50 93 | Unknown operation
	EOR $91			  ; 51 91 | Unknown operation

	EOR $91			  ; 51 91
	AND $93			  ; 32 93
	AND $91			  ; 33 91
	TRB $93			  ; 14 93
	ORA $91,X			; 15 91
	INC $92,X			; F6 92
	SBC $90			  ; F7 90
	CLD				  ; D8
	STA $D9			  ; 92 D9
	BCC $8EB8			; 90 BA
	STA $BB			  ; 92 BB
	BCC $8E9E			; 90 9C
	STA $9D			  ; 92 9D
	BCC $8F84			; 90 7E
	STA $7F			  ; 92 7F
	BCC $8F6A			; 90 60
	STA $61			  ; 92 61
	BCC $8F50			; 90 42
	STA $43			  ; 92 43
	BCC $8F36			; 90 24
	STA $25			  ; 92 25
	BCC $8F1C			; 90 06
	STA $07			  ; 92 07
	BCC $8F02			; 90 E8
	STA $E9			  ; 91 E9
	STA $CB91CA		  ; 8F CA 91 CB
	STA $AD91AC		  ; 8F AC 91 AD
	STA $8F918E		  ; 8F 8E 91 8F
	STA $719170		  ; 8F 70 91 71
	STA $3A9159		  ; 8F 59 91 3A
	STA $3B			  ; 93 3B
	STA $1C			  ; 91 1C
	STA $1D			  ; 93 1D
	STA $FE			  ; 91 FE
	STA $FF			  ; 92 FF
	BCC $8F1C			; 90 E0
	STA $E1			  ; 92 E1
	BCC $8F02			; 90 C2
	STA $C3			  ; 92 C3
	BCC $8EE8			; 90 A4
	STA $A5			  ; 92 A5
	BCC $8ECE			; 90 86
	STA $87			  ; 92 87
	BCC $8FB4			; 90 68
	STA $69			  ; 92 69
	BCC $8F9A			; 90 4A
	STA $4B			  ; 92 4B
	BCC $8F80			; 90 2C
	STA $2D			  ; 92 2D
	BCC $8F66			; 90 0E
	STA $0F			  ; 92 0F
	BCC $8F4C			; 90 F0
	STA $F1			  ; 91 F1
	STA $D391D2		  ; 8F D2 91 D3
	STA $B591B4		  ; 8F B4 91 B5
	STA $979196		  ; 8F 96 91 97
	STA $799178		  ; 8F 78 91 79
	STA $B9915A		  ; 8F 5A 91 B9
	STX $D0			  ; 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
	ASL				  ; 0A
	TAY				  ; A8
	LDA $00			  ; A5 00
	ADC $0E			  ; 65 0E
	STA $00			  ; 85 00
	LDA $C086,Y		  ; B9 86 C0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $D086,Y		  ; B9 86 D0
	STA $0000,X		  ; 9D 00 00
	INX				  ; E8
	INX				  ; E8
	LDA $00			  ; A7 00
	JSL $7FFDA2		  ; 22 A2 FD 7F
;==============================================================================
; Function Index (47 functions)
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
;==============================================================================