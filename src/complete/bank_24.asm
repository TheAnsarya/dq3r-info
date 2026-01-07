;==============================================================================
; Dragon Quest III - Bank $24
; Type: Audio
; Purpose: Audio processing and sound management
; Address Range: $D20000-$D27FFF
; Instructions: 12481
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_24"

;------------------------------------------------------------------------------
; Bank24_AudioFunction_000
; Address: $D28020
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_000:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1F00,Y		  ; 19 00 1F | Logical OR with accumulator (absolute,Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ROL $4400,X		  ; 3E 00 44 | Rotate left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	BVC $00			  ; 50 00 | Branch if overflow clear
	JMP $006100		  ; 5C 00 61 00 | Jump to address long
	ADC $7300			; 6D 00 73 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8300,X		  ; 7E 00 83 | Rotate right (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STX $9300			; 8E 00 93 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $A200,X		  ; 9D 00 A2 | Audio system operation
	PLB				  ; AB | Pull data bank register from stack
	BCS $00			  ; B0 00 | Branch if carry set
	LDA $BD00,Y		  ; B9 00 BD | Audio system operation
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CMP $D100			; CD 00 D1 | Compare accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	DEC $E100,X		  ; DE 00 E1 | Decrement (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	NOP				  ; EA | No operation
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	PEA #$F600		   ; F4 00 F6 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	PEA #$F300		   ; F4 00 F3 | Push effective address to stack
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	INC $EC00			; EE 00 EC | Increment (absolute)
	NOP				  ; EA | No operation
	CPX $00			  ; E4 00 | Compare X register (zero page)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	DEC $DB00,X		  ; DE 00 DB | Decrement (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	CMP $C900			; CD 00 C9 | Compare accumulator (absolute)
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_001
; Address: $D280DA
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_001:
	LDA $B900,X		  ; BD 00 B9 | Audio system operation
	BCS $00			  ; B0 00 | Branch if carry set
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STA $9800,X		  ; 9D 00 98 | Audio system operation
	STX $8800			; 8E 00 88 | Store X register to absolute address
	ROR $7800,X		  ; 7E 00 78 | Rotate right (absolute,X)
	ADC $6700			; 6D 00 67 | Add with carry (absolute)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	JMP $005600		  ; 5C 00 56 00 | Jump to address long
	BVC $00			  ; 50 00 | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL $3800,X		  ; 3E 00 38 | Rotate left (absolute,X)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ORA $1200,Y		  ; 19 00 12 | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack
	PEA #$EEFF		   ; F4 FF EE | Push effective address to stack
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	INY				  ; C8 | Increment Y register
	REP #$FF			 ; C2 FF | Reset processor status bits
	LDY $B6FF,X		  ; BC FF B6 | Load from absolute,X into Y register
	BCS $FF			  ; B0 FF | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	STA				  ; 9F FF 99 FF | Store accumulator to absolute long,X
	STA $88FF			; 8D FF 88 | Audio system operation
	ADC $78FF,X		  ; 7D FF 78 | Add with carry (absolute,X)
	ADC $68FF			; 6D FF 68 | Add with carry (absolute)
	LSR $59FF,X		  ; 5E FF 59 | Logical shift right (absolute,X)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BIT $28FF			; 2C FF 28 | Test bits in accumulator (absolute)
	AND $FF			  ; 25 FF | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_002
; Address: $D28174
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_002:
	JSL $FF1FFF		  ; 22 FF 1F FF | Jump to subroutine long
	ORA $16FF,Y		  ; 19 FF 16 | Logical OR with accumulator (absolute,Y)
	ORA $0CFF			; 0D FF 0C | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_004
; Address: $D281C8
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_004:
	JSL $FF25FF		  ; 22 FF 25 FF | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	BIT $2FFF			; 2C FF 2F | Test bits in accumulator (absolute)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	EOR $5EFF,Y		  ; 59 FF 5E | Exclusive OR with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $72FF			; 6D FF 72 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $82FF,X		  ; 7D FF 82 | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STA $93FF			; 8D FF 93 | Audio system operation
	STA $9FFF,Y		  ; 99 FF 9F | Audio system operation
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	TAX				  ; AA | Transfer accumulator to X register
	BCS $FF			  ; B0 FF | Branch if carry set
	LDY $C2FF,X		  ; BC FF C2 | Load from absolute,X into Y register
	INY				  ; C8 | Increment Y register
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	INC $F4FF			; EE FF F4 | Increment (absolute)
	PLX				  ; FA | Pull X register from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $1F00,Y		  ; 19 00 1F | Logical OR with accumulator (absolute,Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ROL $4400,X		  ; 3E 00 44 | Rotate left (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	BVC $00			  ; 50 00 | Branch if overflow clear
	JMP $006100		  ; 5C 00 61 00 | Jump to address long
	ADC $7300			; 6D 00 73 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8300,X		  ; 7E 00 83 | Rotate right (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STX $9300			; 8E 00 93 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $A200,X		  ; 9D 00 A2 | Audio system operation
	PLB				  ; AB | Pull data bank register from stack
	BCS $00			  ; B0 00 | Branch if carry set
	LDA $BD00,Y		  ; B9 00 BD | Audio system operation
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CMP $D100			; CD 00 D1 | Compare accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	DEC $E100,X		  ; DE 00 E1 | Decrement (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	NOP				  ; EA | No operation
	CPX $EE00			; EC 00 EE | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_005
; Address: $D28282
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_005:
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	PEA #$F600		   ; F4 00 F6 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	SEP #$10			 ; E2 10 | Set processor status bits
	ORA $DAAA			; 0D AA DA | Logical OR with accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL $1033			; 0E 33 10 | Arithmetic shift left (absolute)
	STA $40			  ; 85 40 | Audio system operation
	ASL $14F0			; 0E F0 14 | Arithmetic shift left (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $11			  ; B0 11 | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	BPL $4A			  ; 10 4A | Branch if positive
	ROR $40			  ; 66 40 | Rotate right (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F6			  ; 90 F6 | Branch if carry clear
	REP #$30			 ; C2 30 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLB				  ; AB | Pull data bank register from stack
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA #$A5			 ; 09 A5 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	LDA $40			  ; A5 40 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_006
; Address: $D282E9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_006:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_007
; Address: $D282EF
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_007:
	PHY				  ; 5A | Push Y register to stack
	PHX				  ; DA | Push X register to stack
	SEP #$10			 ; E2 10 | Set processor status bits
	STA $40			  ; 85 40 | Audio system operation
	ORA $DAAA			; 0D AA DA | Logical OR with accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	ASL $11F0			; 0E F0 11 | Arithmetic shift left (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $4E			  ; B0 4E | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$00			 ; A9 00 | Audio system operation
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $F6			  ; 90 F6 | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40			  ; A5 40 | Audio system operation
	ASL $4085			; 0E 85 40 | Arithmetic shift left (absolute)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ASL $FF49			; 0E 49 FF | Arithmetic shift left (absolute)
	BPL $05			  ; 10 05 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BPL $E2			  ; 10 E2 | Branch if positive

;------------------------------------------------------------------------------
; Bank24_AudioFunction_008
; Address: $D28326
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_008:
	JSR $4286			; 20 86 42 | Hardware register operation
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	BPL $05			  ; 10 05 | Branch if positive
	WDM #$93			 ; 42 93 | Reserved instruction
	BPL $C2			  ; 10 C2 | Branch if positive
	BMI $FA			  ; 30 FA | Branch if negative
	PLY				  ; 7A | Pull Y register from stack
	PLB				  ; AB | Pull data bank register from stack
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA #$A3			 ; 09 A3 | Logical OR with accumulator (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_009
; Address: $D2834F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_009:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BRA $BF			  ; 80 BF | Branch always
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_00A
; Address: $D28358
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_00A:
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $40			  ; 85 40 | Audio system operation
	ORA $40A2			; 0D A2 40 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_00B
; Address: $D28363
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_00B:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	ASL $6518			; 0E 18 65 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	ADC $42			  ; 65 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $0000,X		  ; BD 00 00 | Audio system operation
	STA $40			  ; 85 40 | Audio system operation
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA #$A3			 ; 09 A3 | Logical OR with accumulator (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	LDA $40			  ; A5 40 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_00C
; Address: $D28395
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_00C:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	LDA $40			  ; A5 40 | Audio system operation
	PHA				  ; 48 | Push accumulator to stack
	STA $40			  ; 85 40 | Audio system operation
	ASL $20E2			; 0E E2 20 | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	XBA				  ; EB | Exchange accumulator bytes
	LDX #$40			 ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_00D
; Address: $D283AD
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_00D:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	BPL $18			  ; 10 18 | Branch if positive
	ADC $40			  ; 65 40 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	AND #$EF			 ; 29 EF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_00E
; Address: $D283C0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_00E:
	PLP				  ; 28 | Pull processor status from stack
	ASL $9D			  ; 06 9D | Arithmetic shift left (zero page)
	REP #$30			 ; C2 30 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	STA $40			  ; 85 40 | Audio system operation
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA #$A3			 ; 09 A3 | Logical OR with accumulator (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_00F
; Address: $D283E2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_00F:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STY $40			  ; 84 40 | Store Y register to zero page
	BRA $0A			  ; 80 0A | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STX $40			  ; 86 40 | Store X register to zero page
	SEP #$30			 ; E2 30 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$D0			 ; 09 D0 | Logical OR with accumulator (immediate)
	LSR $C2			  ; 46 C2 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_010
; Address: $D28405
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_010:
	JSR $02A0			; 20 A0 02 | Jump to subroutine
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank24_AudioFunction_011
; Address: $D2840C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_011:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA #$90			 ; 09 90 | Logical OR with accumulator (immediate)
	INC $42			  ; E6 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC $40			  ; 65 40 | Add with carry (zero page)
	REP #$10			 ; C2 10 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_012
; Address: $D28422
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_012:
	TAX				  ; AA | Transfer accumulator to X register
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $42			  ; E6 42 | Hardware register operation
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $42			  ; 65 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDA $0000,X		  ; BD 00 00 | Audio system operation
	STA $40			  ; 85 40 | Audio system operation
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	LDA $40			  ; A5 40 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_014
; Address: $D2844C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_014:
	JSR $045D			; 20 5D 04 | Jump to subroutine
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $40			  ; 65 40 | Add with carry (zero page)
	STA $40			  ; 85 40 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	BRA $DB			  ; 80 DB | Branch always
	LDA $40			  ; A5 40 | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	STA $40			  ; 85 40 | Audio system operation
	INY				  ; C8 | Increment Y register
	STA $41			  ; 85 41 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	TAX				  ; AA | Transfer accumulator to X register
	RTI				  ; 40 | Return from interrupt
	STA $40			  ; 85 40 | Audio system operation
	TXA				  ; 8A | Transfer X register to accumulator
	STA $42			  ; 85 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_015
; Address: $D2847A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_015:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_016
; Address: $D28481
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_016:
	PHY				  ; 5A | Push Y register to stack
	STY $40			  ; 84 40 | Store Y register to zero page
	BRA $0A			  ; 80 0A | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STX $40			  ; 86 40 | Store X register to zero page
	SEP #$30			 ; E2 30 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$D0			 ; 09 D0 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank24_AudioFunction_017
; Address: $D284A4
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_017:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA #$90			 ; 09 90 | Logical OR with accumulator (immediate)
	INC $42			  ; E6 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC $40			  ; 65 40 | Add with carry (zero page)
	REP #$10			 ; C2 10 | Reset processor status bits
	TAX				  ; AA | Transfer accumulator to X register
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $42			  ; E6 42 | Hardware register operation
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $42			  ; 65 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	PHP				  ; 08 | Push processor status to stack
	AND #$EF			 ; 29 EF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $9D			  ; 05 9D | Logical OR with accumulator (zero page)
	REP #$30			 ; C2 30 | Reset processor status bits
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_018
; Address: $D284E3
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_018:
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_01A
; Address: $D284E8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_01A:
	JSR $045D			; 20 5D 04 | Jump to subroutine
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $40			  ; 65 40 | Add with carry (zero page)
	STA $40			  ; 85 40 | Audio system operation
	SEP #$20			 ; E2 20 | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $87			  ; 05 87 | Logical OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	BRA $D5			  ; 80 D5 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STY $40			  ; 84 40 | Store Y register to zero page
	BRA $0A			  ; 80 0A | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STX $40			  ; 86 40 | Store X register to zero page
	SEP #$30			 ; E2 30 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$D0			 ; 09 D0 | Logical OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank24_AudioFunction_01B
; Address: $D2852B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_01B:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $40			  ; 65 40 | Add with carry (zero page)
	STA $40			  ; 85 40 | Audio system operation
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	ORA #$65			 ; 09 65 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_01C
; Address: $D2853D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_01C:
	WDM #$85			 ; 42 85 | Reserved instruction
	WDM #$A0			 ; 42 A0 | Reserved instruction
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	LDA $40			  ; A5 40 | Audio system operation
	LDA $41			  ; A5 41 | Audio system operation
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	BMI $A3			  ; 30 A3 | Branch if negative
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_01E
; Address: $D2855F
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_01E:
	JSR $045D			; 20 5D 04 | Jump to subroutine
	SEP #$10			 ; E2 10 | Set processor status bits
	BRA $DA			  ; 80 DA | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STY $40			  ; 84 40 | Store Y register to zero page
	BRA $0A			  ; 80 0A | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STX $40			  ; 86 40 | Store X register to zero page
	SEP #$30			 ; E2 30 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	STA $00			  ; 85 00 | Audio system operation
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank24_AudioFunction_01F
; Address: $D28593
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_01F:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_020
; Address: $D2859F
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_020:
	ORA #$90			 ; 09 90 | Logical OR with accumulator (immediate)
	INC $42			  ; E6 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC $40			  ; 65 40 | Add with carry (zero page)
	STA $40			  ; 85 40 | Audio system operation
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $42			  ; E6 42 | Hardware register operation
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $42			  ; 65 42 | Hardware register operation
	STA $42			  ; 85 42 | Hardware register operation
	REP #$30			 ; C2 30 | Reset processor status bits
	RTI				  ; 40 | Return from interrupt
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	STA $41			  ; 85 41 | Audio system operation
	TXA				  ; 8A | Transfer X register to accumulator
	STA $40			  ; 85 40 | Audio system operation
	LDY #$0A			 ; A0 0A | Load immediate value into Y register
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	BNE $14			  ; D0 14 | Branch if not equal
	LDA $40			  ; A5 40 | Audio system operation
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_021
; Address: $D285DD
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_021:
	JSL $1FB04A		  ; 22 4A B0 1F | Jump to subroutine long
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	BRA $F9			  ; 80 F9 | Branch always
	LDA $41			  ; A5 41 | Audio system operation
	LDY #$0A			 ; A0 0A | Load immediate value into Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	EOR ($A5,X)		  ; 41 A5 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA #$4A			 ; 09 4A | Logical OR with accumulator (immediate)
	BCS $06			  ; B0 06 | Branch if carry set
	LSR $42			  ; 46 42 | Hardware register operation
	ROR $40			  ; 66 40 | Rotate right (zero page)
	BRA $F7			  ; 80 F7 | Branch always
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$0B			 ; 69 0B | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_022
; Address: $D2860C
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_022:
	PLP				  ; 28 | Pull processor status from stack
	LDA $40			  ; A5 40 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_024
; Address: $D28612
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_024:
	JSR $045D			; 20 5D 04 | Jump to subroutine
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $40			  ; 65 40 | Add with carry (zero page)
	STA $40			  ; 85 40 | Audio system operation
	BRA $99			  ; 80 99 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STY $40			  ; 84 40 | Store Y register to zero page
	BRA $0A			  ; 80 0A | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STX $40			  ; 86 40 | Store X register to zero page
	SEP #$30			 ; E2 30 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	LDX $C200,Y		  ; BE 00 C2 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_025
; Address: $D28647
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_025:
	JSR $02A0			; 20 A0 02 | Jump to subroutine
	ORA #$A2			 ; 09 A2 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank24_AudioFunction_026
; Address: $D2864E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_026:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA #$90			 ; 09 90 | Logical OR with accumulator (immediate)
	INC $42			  ; E6 42 | Hardware register operation
	CLC				  ; 18 | Clear carry flag
	ADC $40			  ; 65 40 | Add with carry (zero page)
	STA $40			  ; 85 40 | Audio system operation
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $42			  ; E6 42 | Hardware register operation
	SEP #$20			 ; E2 20 | Set processor status bits
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_027
; Address: $D2866F
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_027:
	ADC $42			  ; 65 42 | Hardware register operation
	STA $42			  ; 85 42 | Hardware register operation
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$49			 ; 09 49 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	ORA #$49			 ; 09 49 | Logical OR with accumulator (immediate)
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$0A			 ; A0 0A | Load immediate value into Y register
	ORA #$29			 ; 09 29 | Logical OR with accumulator (immediate)
	BNE $1A			  ; D0 1A | Branch if not equal
	REP #$10			 ; C2 10 | Reset processor status bits
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	INY				  ; C8 | Increment Y register
	BRA $FA			  ; 80 FA | Branch always
	ORA $88			  ; 05 88 | Logical OR with accumulator (zero page)
	BEQ $41			  ; F0 41 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BRA $FA			  ; 80 FA | Branch always
	REP #$10			 ; C2 10 | Reset processor status bits
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$A0			 ; 09 A0 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $03			  ; B0 03 | Branch if carry set
	INY				  ; C8 | Increment Y register
	BRA $FA			  ; 80 FA | Branch always
	LDA $40			  ; A5 40 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	STZ $40			  ; 64 40 | Store zero to zero page
	ORA $C0			  ; 05 C0 | Logical OR with accumulator (zero page)
	BEQ $06			  ; F0 06 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $40			  ; 26 40 | Rotate left (zero page)
	DEY				  ; 88 | Decrement Y register
	BNE $FA			  ; D0 FA | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	LDA $40			  ; A5 40 | Audio system operation
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STX $40			  ; 86 40 | Store X register to zero page
	PHA				  ; 48 | Push accumulator to stack
	LDY #$0B			 ; A0 0B | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_028
; Address: $D286DE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_028:
	ORA $FF29			; 0D 29 FF | Logical OR with accumulator (absolute)
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$0B			 ; 69 0B | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_02A
; Address: $D28706
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_02A:
	JSR $045D			; 20 5D 04 | Jump to subroutine
	SEP #$10			 ; E2 10 | Set processor status bits
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC $40			  ; 65 40 | Add with carry (zero page)
	STA $40			  ; 85 40 | Audio system operation
	LSR $08FF,X		  ; 5E FF 08 | Logical shift right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	BPL $C2			  ; 10 C2 | Branch if positive

;------------------------------------------------------------------------------
; Bank24_AudioFunction_02B
; Address: $D28733
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_02B:
	JSR $2248			; 20 48 22 | Jump to subroutine
	STZ $C902,X		  ; 9E 02 C9 | Store zero to absolute,X
	PLX				  ; FA | Pull X register from stack
	ORA #$A3			 ; 09 A3 | Logical OR with accumulator (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	LDA $40			  ; A5 40 | Audio system operation
	PLP				  ; 28 | Pull processor status from stack
	LDA $40			  ; A5 40 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_02D
; Address: $D28750
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_02D:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	ORA $FF29			; 0D 29 FF | Logical OR with accumulator (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	ORA $E248			; 0D 48 E2 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_02E
; Address: $D28764
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_02E:
	JSR $02B5			; 20 B5 02 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	REP #$20			 ; C2 20 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	SBC #$02			 ; E9 02 | Subtract with carry (immediate)
	CMP #$FA			 ; C9 FA | Compare accumulator (immediate)
	ORA $83			  ; 05 83 | Logical OR with accumulator (zero page)
	ORA #$A3			 ; 09 A3 | Logical OR with accumulator (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_02F
; Address: $D28789
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_02F:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	EOR ($A0,X)		  ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $0000,X		  ; BD 00 00 | Audio system operation
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	STA $0000,X		  ; 9D 00 00 | Audio system operation
	LDA $0001,X		  ; BD 01 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_030
; Address: $D287B9
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_030:
	ORA $41			  ; 05 41 | Logical OR with accumulator (zero page)
	STA $0001,X		  ; 9D 01 00 | Audio system operation
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_031
; Address: $D287CC
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_031:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$49			 ; 09 49 | Logical OR with accumulator (immediate)
	STA $40			  ; 85 40 | Audio system operation
	INY				  ; C8 | Increment Y register
	ORA #$49			 ; 09 49 | Logical OR with accumulator (immediate)
	STA $41			  ; 85 41 | Audio system operation
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $0000,X		  ; BD 00 00 | Audio system operation
	AND $40			  ; 25 40 | Logical AND with accumulator (zero page)
	STA $0000,X		  ; 9D 00 00 | Audio system operation
	LDA $0001,X		  ; BD 01 00 | Audio system operation
	AND $41			  ; 25 41 | Logical AND with accumulator (zero page)
	STA $0001,X		  ; 9D 01 00 | Audio system operation
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_032
; Address: $D28815
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_032:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_033
; Address: $D28819
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_033:
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	EOR ($A0,X)		  ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $0000,X		  ; BD 00 00 | Audio system operation
	EOR $40			  ; 45 40 | Exclusive OR with accumulator (zero page)
	STA $0000,X		  ; 9D 00 00 | Audio system operation
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $0002,X		  ; BD 02 00 | Audio system operation
	EOR $42			  ; 45 42 | Hardware register operation
	STA $0002,X		  ; 9D 02 00 | Audio system operation
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_034
; Address: $D2885C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_034:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank24_AudioFunction_035
; Address: $D28870
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_035:
	INY				  ; C8 | Increment Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	EOR ($A0,X)		  ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	LDA $0000,X		  ; BD 00 00 | Audio system operation
	AND $40			  ; 25 40 | Logical AND with accumulator (zero page)
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA $0001,X		  ; BD 01 00 | Audio system operation
	AND $41			  ; 25 41 | Logical AND with accumulator (zero page)
	BNE $06			  ; D0 06 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_036
; Address: $D2889E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_036:
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_037
; Address: $D288A4
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_037:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	INY				  ; C8 | Increment Y register
	ORA #$85			 ; 09 85 | Logical OR with accumulator (immediate)
	EOR ($A0,X)		  ; 41 A0 | Exclusive OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_038
; Address: $D288C5
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_038:
	ORA #$48			 ; 09 48 | Logical OR with accumulator (immediate)
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	LDA $0000,X		  ; BD 00 00 | Audio system operation
	AND $40			  ; 25 40 | Logical AND with accumulator (zero page)
	CMP $40			  ; C5 40 | Compare accumulator (zero page)
	BNE $0F			  ; D0 0F | Branch if not equal
	LDA $0001,X		  ; BD 01 00 | Audio system operation
	AND $41			  ; 25 41 | Logical AND with accumulator (zero page)
	CMP $41			  ; C5 41 | Compare accumulator (zero page)
	BNE $06			  ; D0 06 | Branch if not equal
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_039
; Address: $D288EA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_039:
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_03A
; Address: $D288F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_03A:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_03B
; Address: $D288F8
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_03B:
	JSL $C4279F		  ; 22 9F 27 C4 | Jump to subroutine long
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $40B5			; AD B5 40 | Audio system operation
	STA $4A			  ; 85 4A | Audio system operation
	LDA $40B6			; AD B6 40 | Audio system operation
	STA $4B			  ; 85 4B | Audio system operation
	LDA $40B8			; AD B8 40 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_03C
; Address: $D28918
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_03C:
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_03D
; Address: $D28927
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_03D:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank24_AudioFunction_03E
; Address: $D28931
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_03E:
	JSR $4000			; 20 00 40 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_03F
; Address: $D2893F
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_03F:
	JSL $C4279F		  ; 22 9F 27 C4 | Jump to subroutine long
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $40B5			; AD B5 40 | Audio system operation
	STA $4A			  ; 85 4A | Audio system operation
	LDA $40B6			; AD B6 40 | Audio system operation
	STA $4B			  ; 85 4B | Audio system operation
	LDA $40B8			; AD B8 40 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BRA $B7			  ; 80 B7 | Branch always
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	LDA				  ; BF FF 7F FF | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_040
; Address: $D2897D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_040:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_041
; Address: $D28982
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_041:
	JSL $C4279F		  ; 22 9F 27 C4 | Jump to subroutine long
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $40B5			; AD B5 40 | Audio system operation
	STA $4A			  ; 85 4A | Audio system operation
	LDA $40B6			; AD B6 40 | Audio system operation
	STA $4B			  ; 85 4B | Audio system operation
	LDA $40B8			; AD B8 40 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_042
; Address: $D289B7
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_042:
	JSL $C4279F		  ; 22 9F 27 C4 | Jump to subroutine long
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $40B5			; AD B5 40 | Audio system operation
	STA $4A			  ; 85 4A | Audio system operation
	LDA $40B6			; AD B6 40 | Audio system operation
	STA $4B			  ; 85 4B | Audio system operation
	LDA $40B8			; AD B8 40 | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_043
; Address: $D289D7
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_043:
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,Y		  ; B9 00 00 | Audio system operation
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	STA $0000,Y		  ; 99 00 00 | Audio system operation
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_044
; Address: $D28A15
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_044:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_045
; Address: $D28A26
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_045:
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,Y		  ; B9 00 00 | Audio system operation
	ROR				  ; 6A | Rotate right (accumulator)
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	STA $0000,Y		  ; 99 00 00 | Audio system operation
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_046
; Address: $D28A40
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_046:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,Y		  ; B9 00 00 | Audio system operation
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	STA $0000,Y		  ; 99 00 00 | Audio system operation
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_047
; Address: $D28A6B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_047:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_048
; Address: $D28A71
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_048:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0000,Y		  ; B9 00 00 | Audio system operation
	ORA #$C9			 ; 09 C9 | Logical OR with accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_049
; Address: $D28A96
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_049:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_04A
; Address: $D28A9D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_04A:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_04B
; Address: $D28AA5
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_04B:
	JSL $C427DB		  ; 22 DB 27 C4 | Jump to subroutine long
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $40B9			; AD B9 40 | Audio system operation
	STA $40			  ; 85 40 | Audio system operation
	LDX #$40			 ; A2 40 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_04C
; Address: $D28AB8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_04C:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDA $40BB			; AD BB 40 | Audio system operation
	STA $44			  ; 85 44 | Audio system operation
	LDX #$44			 ; A2 44 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_04D
; Address: $D28AC5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_04D:
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	LSR $11			  ; 46 11 | Logical shift right (zero page)
	CPY #$AD			 ; C0 AD | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $40			  ; A5 40 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $40B5			; 6D B5 40 | Add with carry (absolute)
	STA $40			  ; 85 40 | Audio system operation
	LDA $42			  ; A5 42 | Hardware register operation
	ADC $40B7			; 6D B7 40 | Add with carry (absolute)
	STA $42			  ; 85 42 | Hardware register operation
	LDA $40			  ; A5 40 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $44			  ; 65 44 | Add with carry (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $42			  ; A5 42 | Hardware register operation
	ADC $46			  ; 65 46 | Add with carry (zero page)
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_04E
; Address: $D28AF7
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_04E:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX $23EE			; AE EE 23 | Load from absolute address into X register
	LDY $23E4			; AC E4 23 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_050
; Address: $D28B0D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_050:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCC $30			  ; 90 30 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Audio system operation
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_051
; Address: $D28B19
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_051:
	JSL $C2CC25		  ; 22 25 CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_052
; Address: $D28B22
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_052:
	JSL $C2CCF8		  ; 22 F8 CC C2 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_053
; Address: $D28B30
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_053:
	JSL $C2CCF8		  ; 22 F8 CC C2 | Jump to subroutine long
	LSR $3B			  ; 46 3B | Logical shift right (zero page)
	BEQ $3F			  ; F0 3F | Branch if equal
	BRA $2E			  ; 80 2E | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$FF			 ; A9 FF | Audio system operation
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_054
; Address: $D28B49
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_054:
	JSL $C2CC25		  ; 22 25 CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_055
; Address: $D28B52
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_055:
	JSL $C2CCF8		  ; 22 F8 CC C2 | Jump to subroutine long
	EOR $3B			  ; 45 3B | Exclusive OR with accumulator (zero page)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_057
; Address: $D28B68
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_057:
	JSR $0B75			; 20 75 0B | Jump to subroutine
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_058
; Address: $D28B75
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_058:
	PHX				  ; DA | Push X register to stack
	SEC				  ; 38 | Set carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_059
; Address: $D28B84
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_059:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $00			  ; A5 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_05B
; Address: $D28B95
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_05B:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDX #$04			 ; A2 04 | Load immediate value into X register
	LDA #$64			 ; A9 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_05C
; Address: $D28B9F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_05C:
	JSL $C01243		  ; 22 43 12 C0 | Jump to subroutine long
	LDA $02			  ; A5 02 | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_05D
; Address: $D28BA8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_05D:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$64			 ; A9 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_05E
; Address: $D28BB2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_05E:
	JSL $C01243		  ; 22 43 12 C0 | Jump to subroutine long
	LDX $00			  ; A6 00 | Load from zero page into X register
	LDA $04			  ; A5 04 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_05F
; Address: $D28BBA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_05F:
	JSR $0B75			; 20 75 0B | Jump to subroutine
	STA $00			  ; 85 00 | Audio system operation
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_060
; Address: $D28BC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_060:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_061
; Address: $D28BD2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_061:
	JSL $C2CC25		  ; 22 25 CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_063
; Address: $D28BE4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_063:
	JSL $C2CCF8		  ; 22 F8 CC C2 | Jump to subroutine long
	LSR $3B			  ; 46 3B | Logical shift right (zero page)
	BEQ $3F			  ; F0 3F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Audio system operation
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_065
; Address: $D28C02
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_065:
	LDA $33D6			; AD D6 33 | Audio system operation
	CMP $3394			; CD 94 33 | Compare accumulator (absolute)
	BCC $32			  ; 90 32 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_066
; Address: $D28C0D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_066:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_067
; Address: $D28C21
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_067:
	JSL $C3AEE8		  ; 22 E8 AE C3 | Jump to subroutine long
	BCC $0F			  ; 90 0F | Branch if carry clear
	INX				  ; E8 | Increment X register
	CPX $3394			; EC 94 33 | Compare X register (absolute)
	BCC $E0			  ; 90 E0 | Game work RAM access
	LDA #$00			 ; A9 00 | Audio system operation
	STA $BE7D			; 8D 7D BE | Audio system operation
	JMP $0CE5			; 4C E5 0C | Jump to address
	STX $BE7D			; 8E 7D BE | Store X register to absolute address
	JMP $0C58			; 4C 58 0C | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_068
; Address: $D28C3C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_068:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $58			  ; D0 58 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $5B			  ; D0 5B | Branch if not equal
	LDA $33D6			; AD D6 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_069
; Address: $D28C52
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_069:
	JSL $C3AEE8		  ; 22 E8 AE C3 | Jump to subroutine long
	BCS $5B			  ; B0 5B | Branch if carry set
	LDA $33DA			; AD DA 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_06A
; Address: $D28C5B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_06A:
	JSL $C45267		  ; 22 67 52 C4 | Jump to subroutine long
	STA $33E0			; 8D E0 33 | Audio system operation
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $0D0A			; 4C 0A 0D | Jump to address
	LDA $33DA			; AD DA 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_06B
; Address: $D28C6D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_06B:
	JSL $C45254		  ; 22 54 52 C4 | Jump to subroutine long
	STA $33DE			; 8D DE 33 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_06C
; Address: $D28C75
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_06C:
	JSL $C2CC2C		  ; 22 2C CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $3A			  ; F0 3A | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_06D
; Address: $D28C85
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_06D:
	BEQ $35			  ; F0 35 | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $30			  ; F0 30 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_06E
; Address: $D28C8C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_06E:
	JSL $C2CC2C		  ; 22 2C CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $68			  ; D0 68 | Branch if not equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_06F
; Address: $D28C99
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_06F:
	JSR $0D10			; 20 10 0D | Jump to subroutine
	BCC $66			  ; 90 66 | Branch if carry clear
	JMP $0D45			; 4C 45 0D | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_072
; Address: $D28CB3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_072:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	JMP $0D41			; 4C 41 0D | Jump to address
	TAX				  ; AA | Transfer accumulator to X register
	LDA $33D6			; AD D6 33 | Audio system operation
	CMP $3394			; CD 94 33 | Compare accumulator (absolute)
	BCC $3F			  ; 90 3F | Branch if carry clear
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_073
; Address: $D28CCA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_073:
	JSL $C2CC2C		  ; 22 2C CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA $33D6			; AD D6 33 | Audio system operation
	JMP $0D04			; 4C 04 0D | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_074
; Address: $D28CDD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_074:
	JSR $0D10			; 20 10 0D | Jump to subroutine
	BCS $63			  ; B0 63 | Branch if carry set
	STA $BE7D			; 8D 7D BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_075
; Address: $D28CE5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_075:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $AF			  ; D0 AF | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $B2			  ; D0 B2 | Branch if not equal
	LDA $BE7D			; AD 7D BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_076
; Address: $D28CFB
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_076:
	JSL $C3AEE8		  ; 22 E8 AE C3 | Jump to subroutine long
	BCS $B2			  ; B0 B2 | Branch if carry set
	LDA $BE7D			; AD 7D BE | Audio system operation
	STA $33D8			; 8D D8 33 | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDA $33E0			; AD E0 33 | Audio system operation
	JMP $0D7D			; 4C 7D 0D | Jump to address
	LDA $33DA			; AD DA 33 | Audio system operation
	CMP #$B8			 ; C9 B8 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_077
; Address: $D28D16
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_077:
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP #$85			 ; C9 85 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_07A
; Address: $D28D29
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_07A:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LSR $AE60,X		  ; 5E 60 AE | Logical shift right (absolute,X)
	LDY $33DA			; AC DA 33 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_07D
; Address: $D28D41
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_07D:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_07F
; Address: $D28D4A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_07F:
	JSL $C2CC2C		  ; 22 2C CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $15			  ; D0 15 | Branch if not equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_080
; Address: $D28D57
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_080:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_081
; Address: $D28D62
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_081:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	BCS $DC			  ; B0 DC | Branch if carry set
	JMP $0D6F			; 4C 6F 0D | Jump to address
	LDA $33D6			; AD D6 33 | Audio system operation
	STA $33D8			; 8D D8 33 | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_082
; Address: $D28D75
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_082:
	JSL $C2CC2C		  ; 22 2C CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLY				  ; 7A | Pull Y register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA				  ; BF 33 0B C3 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA				  ; BF 31 0B C3 | Load from absolute long,X into accumulator
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_085
; Address: $D28D9F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_085:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_087
; Address: $D28DB1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_087:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_088
; Address: $D28DBD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_088:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LDY $2000,X		  ; BC 00 20 | Load from absolute,X into Y register
	AND #$0E			 ; 29 0E | Logical AND with accumulator (immediate)
	BCS $3E			  ; B0 3E | Branch if carry set
	LDA $33D8			; AD D8 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_089
; Address: $D28DCB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_089:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $22			  ; 70 22 | Branch if overflow set
	AND ($C4),Y		  ; 31 C4 | Logical AND with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP $70			  ; C5 70 | Compare accumulator (zero page)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_08A
; Address: $D28DDD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_08A:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_08C
; Address: $D28DEC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_08C:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	DEC $2233,X		  ; DE 33 22 | Decrement (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	CMP #$AE			 ; C9 AE | Compare accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_08F
; Address: $D28E06
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_08F:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_090
; Address: $D28E0C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_090:
	LDX $33D6			; AE D6 33 | Load from absolute address into X register
	CPX $3394			; EC 94 33 | Compare X register (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDY $33DC			; AC DC 33 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_091
; Address: $D28E17
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_091:
	JSL $C44927		  ; 22 27 49 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $6040,X		  ; FD 40 60 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_093
; Address: $D28E23
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_093:
	JSL $C4559E		  ; 22 9E 55 C4 | Jump to subroutine long
	SBC $AD60,X		  ; FD 60 AD | Subtract with carry (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_094
; Address: $D28E2C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_094:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_095
; Address: $D28E38
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_095:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_097
; Address: $D28E42
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_097:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LDY $2000,X		  ; BC 00 20 | Load from absolute,X into Y register
	AND #$0E			 ; 29 0E | Logical AND with accumulator (immediate)
	BCS $0E			  ; B0 0E | Branch if carry set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_09B
; Address: $D28E5B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_09B:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_09C
; Address: $D28E61
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_09C:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LDY $2000,X		  ; BC 00 20 | Load from absolute,X into Y register
	AND #$0E			 ; 29 0E | Logical AND with accumulator (immediate)
	BCS $0E			  ; B0 0E | Branch if carry set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0A0
; Address: $D28E7A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0A0:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0A1
; Address: $D28E80
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0A1:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDY $B0			  ; A4 B0 | Load from zero page into Y register
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0A3
; Address: $D28E8E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0A3:
	JSL $C1D13B		  ; 22 3B D1 C1 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $33			  ; F0 33 | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $13			  ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0A6
; Address: $D28EA8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0A6:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0AB
; Address: $D28EC1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0AB:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	JMP $C90EDA		  ; 5C DA 0E C9 | Jump to address long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0AE
; Address: $D28ED1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0AE:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	JMP $C1D182		  ; 5C 82 D1 C1 | Jump to address long
	SEP #$20			 ; E2 20 | Set processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0AF
; Address: $D28EE1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0AF:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0B0
; Address: $D28EED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0B0:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	LDA $33D8			; AD D8 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0B1
; Address: $D28EF6
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0B1:
	JSL $C43231		  ; 22 31 32 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $22			  ; 70 22 | Branch if overflow set
	ORA $33			  ; 05 33 | Logical OR with accumulator (zero page)
	CPY $01			  ; C4 01 | Compare Y register (zero page)
	CMP $70			  ; C5 70 | Compare accumulator (zero page)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0B2
; Address: $D28F08
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0B2:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LDX $33DE			; AE DE 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0B4
; Address: $D28F1B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0B4:
	JSL $C43376		  ; 22 76 33 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STZ $BE82			; 9C 82 BE | Store zero to absolute
	STA $BE81			; 8D 81 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0BA
; Address: $D28F3F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0BA:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0BB
; Address: $D28F45
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0BB:
	LDA $BE7D			; AD 7D BE | Audio system operation
	CMP $BE7F			; CD 7F BE | Compare accumulator (absolute)
	BEQ $0C			  ; F0 0C | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0BC
; Address: $D28F4D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0BC:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $0D200D		  ; 8F 0D 20 0D | Audio system operation
	JMP $0F65			; 4C 65 0F | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0BE
; Address: $D28F5F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0BE:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2000			; 4D 00 20 | Exclusive OR with accumulator (absolute)
	ASL $F722			; 0E 22 F7 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0C0
; Address: $D28F74
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0C0:
	JSL $C43414		  ; 22 14 34 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0C1
; Address: $D28F80
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0C1:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	STZ $AD0F			; 9C 0F AD | Store zero to absolute
	SEP #$33			 ; E2 33 | Set processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0C5
; Address: $D28F9C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0C5:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0C9
; Address: $D28FAF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0C9:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LDA $6000,X		  ; BD 00 60 | Audio system operation
	LDX $33DE			; AE DE 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0CB
; Address: $D28FC0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0CB:
	STA $BE81			; 8D 81 BE | Audio system operation
	STA $33E2			; 8D E2 33 | Audio system operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0CD
; Address: $D28FCD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0CD:
	JSL $C43808		  ; 22 08 38 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0CE
; Address: $D28FD9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0CE:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	LDA $33E2			; AD E2 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0D2
; Address: $D28FF5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0D2:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0D4
; Address: $D29001
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0D4:
	JSL $C43672		  ; 22 72 36 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCC $0F			  ; 90 0F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0D6
; Address: $D29013
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0D6:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	BPL $AD			  ; 10 AD | Branch if positive
	SEP #$33			 ; E2 33 | Set processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0D9
; Address: $D2902C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0D9:
	JSR $105C			; 20 5C 10 | Jump to subroutine
	BCC $19			  ; 90 19 | Branch if carry clear
	LDX $33D8			; AE D8 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0DA
; Address: $D29034
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0DA:
	JSL $C43644		  ; 22 44 36 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCS $16			  ; B0 16 | Branch if carry set
	ASL $BE81			; 0E 81 BE | Arithmetic shift left (absolute)
	SEP #$20			 ; E2 20 | Set processor status bits
	ROL $BE83			; 2E 83 BE | Rotate left (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0DE
; Address: $D29056
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0DE:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E0
; Address: $D29062
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E0:
	JSR $1088			; 20 88 10 | Jump to subroutine
	BCS $20			  ; B0 20 | Branch if carry set
	LDY #$01			 ; A0 01 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E1
; Address: $D2906A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E1:
	JSR $1088			; 20 88 10 | Jump to subroutine
	BCS $18			  ; B0 18 | Branch if carry set
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E2
; Address: $D29072
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E2:
	JSR $1088			; 20 88 10 | Jump to subroutine
	BCS $10			  ; B0 10 | Branch if carry set
	LDY #$03			 ; A0 03 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E3
; Address: $D2907A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E3:
	JSR $1088			; 20 88 10 | Jump to subroutine
	BCS $08			  ; B0 08 | Branch if carry set
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E4
; Address: $D29082
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E4:
	JSR $1088			; 20 88 10 | Jump to subroutine
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E6
; Address: $D29089
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E6:
	JSL $C44A03		  ; 22 03 4A C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC $B0FF,X		  ; FD FF B0 | Subtract with carry (absolute,X)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E7
; Address: $D2909A
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E7:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0E9
; Address: $D290A3
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0E9:
	JSL $C43929		  ; 22 29 39 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCC $0F			  ; 90 0F | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0EB
; Address: $D290B5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0EB:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	BPL $AD			  ; 10 AD | Branch if positive
	SEP #$33			 ; E2 33 | Set processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0F0
; Address: $D290D9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0F0:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	DEC $2200			; CE 00 22 | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0F2
; Address: $D290EB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0F2:
	JSL $C4355D		  ; 22 5D 35 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0F3
; Address: $D290F7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0F3:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	ORA ($AD),Y		  ; 11 AD | Logical OR with accumulator ((zero page),Y)
	SEP #$33			 ; E2 33 | Set processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0F7
; Address: $D29113
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0F7:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0F9
; Address: $D2911F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0F9:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$E7			 ; C9 E7 | Compare accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0FA
; Address: $D2912B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0FA:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $4C00			; 4D 00 4C | Exclusive OR with accumulator (absolute)
	ORA ($AD),Y		  ; 11 AD | Logical OR with accumulator ((zero page),Y)
	SEP #$33			 ; E2 33 | Set processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0FD
; Address: $D29141
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0FD:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	CPY $2200			; CC 00 22 | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_0FF
; Address: $D29153
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_0FF:
	JSL $C43231		  ; 22 31 32 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$E7			 ; C9 E7 | Compare accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_104
; Address: $D29175
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_104:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	CMP $2200			; CD 00 22 | Compare accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_105
; Address: $D29181
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_105:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDY $B0			  ; A4 B0 | Load from zero page into Y register
	AND $2048			; 2D 48 20 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_107
; Address: $D29191
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_107:
	JSL $C1D13B		  ; 22 3B D1 C1 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $0E9C			; 4C 9C 0E | Jump to address
	JMP $0EAF			; 4C AF 0E | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_10A
; Address: $D291AC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_10A:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	JMP $C1D182		  ; 5C 82 D1 C1 | Jump to address long
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_10B
; Address: $D291B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_10B:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_10E
; Address: $D291C6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_10E:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_112
; Address: $D291DD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_112:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_114
; Address: $D291E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_114:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_117
; Address: $D291FD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_117:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_118
; Address: $D29206
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_118:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_11A
; Address: $D2920F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_11A:
	JSL $C433BA		  ; 22 BA 33 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_11F
; Address: $D2922A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_11F:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $AD00,Y		  ; 19 00 AD | Logical OR with accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_120
; Address: $D29233
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_120:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $22			  ; 70 22 | Branch if overflow set
	AND ($C4),Y		  ; 31 C4 | Logical AND with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP $70			  ; C5 70 | Compare accumulator (zero page)
	BEQ $2D			  ; F0 2D | Branch if equal
	LDX $33DA			; AE DA 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_121
; Address: $D29248
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_121:
	JSL $C90B3A		  ; 22 3A 0B C9 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	LDX $33D8			; AE D8 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_122
; Address: $D29254
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_122:
	JSL $C43193		  ; 22 93 31 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	JMP $126F			; 4C 6F 12 | Jump to address
	LDX $33D8			; AE D8 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_126
; Address: $D29272
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_126:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_128
; Address: $D2927B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_128:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_12F
; Address: $D2929E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_12F:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_130
; Address: $D292A4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_130:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	STZ $72			  ; 64 72 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank24_AudioFunction_131
; Address: $D292AC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_131:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $35			  ; D0 35 | Branch if not equal
	LDA $72			  ; A5 72 | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_133
; Address: $D292C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_133:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $AE00,Y		  ; 19 00 AE | Logical OR with accumulator (absolute,Y)
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_134
; Address: $D292CC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_134:
	JSL $C90B3A		  ; 22 3A 0B C9 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_135
; Address: $D292D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_135:
	JSL $C43193		  ; 22 93 31 C4 | Jump to subroutine long
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	JMP $12ED			; 4C ED 12 | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_137
; Address: $D292E6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_137:
	JSL $C43154		  ; 22 54 31 C4 | Jump to subroutine long
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	INC $72			  ; E6 72 | Increment (zero page)
	DEC $70			  ; C6 70 | Decrement (zero page)
	BNE $B9			  ; D0 B9 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_13D
; Address: $D29307
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_13D:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_13F
; Address: $D29310
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_13F:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_142
; Address: $D29328
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_142:
	JSL $C3BD64		  ; 22 64 BD C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_143
; Address: $D2932E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_143:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $1800			; 4D 00 18 | Exclusive OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_145
; Address: $D2933C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_145:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_147
; Address: $D2934D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_147:
	JSR $1209			; 20 09 12 | Jump to subroutine
	LDY $33D8			; AC D8 33 | Load from absolute address into Y register
	LDX $33DA			; AE DA 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_14A
; Address: $D29362
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_14A:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_14F
; Address: $D29387
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_14F:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_152
; Address: $D29396
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_152:
	JSR $0E29			; 20 29 0E | Jump to subroutine
	BCS $16			  ; B0 16 | Branch if carry set
	LDA #$01			 ; A9 01 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_155
; Address: $D293A8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_155:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $2000,X		  ; 1D 00 20 | Logical OR with accumulator (absolute,X)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_156
; Address: $D293B1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_156:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_158
; Address: $D293BA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_158:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_159
; Address: $D293C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_159:
	JSL $C440B0		  ; 22 B0 40 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_15A
; Address: $D293CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_15A:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $1800			; 4D 00 18 | Exclusive OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_15C
; Address: $D293D9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_15C:
	JSR $0E29			; 20 29 0E | Jump to subroutine
	BCS $16			  ; B0 16 | Branch if carry set
	LDA #$02			 ; A9 02 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_161
; Address: $D293F4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_161:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_163
; Address: $D293FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_163:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_164
; Address: $D29409
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_164:
	JSL $C44129		  ; 22 29 41 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_16B
; Address: $D29431
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_16B:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_16C
; Address: $D29437
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_16C:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROR				  ; 6A | Rotate right (accumulator)
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_172
; Address: $D2945D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_172:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_177
; Address: $D2947B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_177:
	JSR $0E29			; 20 29 0E | Jump to subroutine
	BCS $2C			  ; B0 2C | Branch if carry set
	LDX $33D8			; AE D8 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_178
; Address: $D29483
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_178:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_17C
; Address: $D2949E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_17C:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	JMP $14AC			; 4C AC 14 | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_17D
; Address: $D294A6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_17D:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_17E
; Address: $D294B2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_17E:
	JSL $CCA27E		  ; 22 7E A2 CC | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_180
; Address: $D294BE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_180:
	JSL $CCA29F		  ; 22 9F A2 CC | Jump to subroutine long
	BCC $F6			  ; 90 F6 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_181
; Address: $D294C6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_181:
	JSL $CCA3B8		  ; 22 B8 A3 CC | Jump to subroutine long
	BCC $EE			  ; 90 EE | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_182
; Address: $D294CE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_182:
	JSL $CCA304		  ; 22 04 A3 CC | Jump to subroutine long
	BCC $E6			  ; 90 E6 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_183
; Address: $D294D6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_183:
	JSL $CCA331		  ; 22 31 A3 CC | Jump to subroutine long
	BCC $DE			  ; 90 DE | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_184
; Address: $D294DE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_184:
	JSL $CCA2D7		  ; 22 D7 A2 CC | Jump to subroutine long
	BCC $D6			  ; 90 D6 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_185
; Address: $D294E6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_185:
	JSL $CCA38B		  ; 22 8B A3 CC | Jump to subroutine long
	BCC $CE			  ; 90 CE | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_186
; Address: $D294EE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_186:
	JSL $CCA35E		  ; 22 5E A3 CC | Jump to subroutine long
	BCC $C6			  ; 90 C6 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_187
; Address: $D294F6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_187:
	JSL $CADBF5		  ; 22 F5 DB CA | Jump to subroutine long
	BCC $BE			  ; 90 BE | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_188
; Address: $D294FE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_188:
	JSL $CADC28		  ; 22 28 DC CA | Jump to subroutine long
	BCC $B6			  ; 90 B6 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_189
; Address: $D29506
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_189:
	JSL $CCA3E5		  ; 22 E5 A3 CC | Jump to subroutine long
	BCC $AE			  ; 90 AE | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_18A
; Address: $D2950E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_18A:
	JSL $CCA414		  ; 22 14 A4 CC | Jump to subroutine long
	BCC $A6			  ; 90 A6 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_18B
; Address: $D29516
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_18B:
	JSL $CCA456		  ; 22 56 A4 CC | Jump to subroutine long
	BCC $9E			  ; 90 9E | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_18C
; Address: $D2951E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_18C:
	JSL $CCA475		  ; 22 75 A4 CC | Jump to subroutine long
	BCC $96			  ; 90 96 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_18D
; Address: $D29526
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_18D:
	JSL $CCA49A		  ; 22 9A A4 CC | Jump to subroutine long
	BCC $8E			  ; 90 8E | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_190
; Address: $D29536
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_190:
	JSL $C1D2EE		  ; 22 EE D2 C1 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $1B			  ; F0 1B | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	JMP $0E9C			; 4C 9C 0E | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_192
; Address: $D2954E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_192:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LSR $2200			; 4E 00 22 | Logical shift right (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_196
; Address: $D29565
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_196:
	JSL $C1D32F		  ; 22 2F D3 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_19B
; Address: $D2957C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_19B:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1A1
; Address: $D29599
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1A1:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1A4
; Address: $D295A8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1A4:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $1599			; 4C 99 15 | Jump to address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1A5
; Address: $D295B6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1A5:
	JSL $C44824		  ; 22 24 48 C4 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	STA $BE79			; 8D 79 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1A6
; Address: $D295BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1A6:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	JMP $1599			; 4C 99 15 | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1A7
; Address: $D295C8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1A7:
	JSL $C45B1A		  ; 22 1A 5B C4 | Jump to subroutine long
	SBC $10E2,Y		  ; F9 E2 10 | Subtract with carry (absolute,Y)
	STY $BE83			; 8C 83 BE | Store Y register to absolute address
	REP #$10			 ; C2 10 | Reset processor status bits
	STA $BE81			; 8D 81 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1A8
; Address: $D295D7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1A8:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	JMP $1599			; 4C 99 15 | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1AA
; Address: $D295E3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1AA:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	BVC $01			  ; 50 01 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1AD
; Address: $D295F5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1AD:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDA #$6C			 ; A9 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1B3
; Address: $D2961B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1B3:
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1B7
; Address: $D2962A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1B7:
	JSL $C1D5B3		  ; 22 B3 D5 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1BE
; Address: $D2964A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1BE:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1BF
; Address: $D2965D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1BF:
	LDA $2216,X		  ; BD 16 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($41,X)		  ; C1 41 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1C3
; Address: $D29675
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1C3:
	PEA #$3538		   ; F4 38 35 | Push effective address to stack
	PEA #$003F		   ; F4 3F 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1C4
; Address: $D2967E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1C4:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1C5
; Address: $D29684
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1C5:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ORA #$C3			 ; 09 C3 | Logical OR with accumulator (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$0078		   ; F4 78 00 | Push effective address to stack
	PEA #$007F		   ; F4 7F 00 | Push effective address to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1C6
; Address: $D29698
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1C6:
	JSL $C90717		  ; 22 17 07 C9 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF B3 16 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1CC
; Address: $D296B5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1CC:
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1D4
; Address: $D296DE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1D4:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	AND $2200,X		  ; 3D 00 22 | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1D5
; Address: $D296EA
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1D5:
	JSR $1209			; 20 09 12 | Jump to subroutine
	LDA $C161			; AD 61 C1 | Audio system operation
	STA $BE77			; 8D 77 BE | Audio system operation
	STZ $BE82			; 9C 82 BE | Store zero to absolute
	LDA $C165			; AD 65 C1 | Audio system operation
	BMI $0C			  ; 30 0C | Branch if negative
	STA $BE81			; 8D 81 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1D6
; Address: $D296FE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1D6:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	JMP $16E4			; 4C E4 16 | Jump to address
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $BE81			; 8D 81 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1D7
; Address: $D2970E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1D7:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	JMP $16E4			; 4C E4 16 | Jump to address
	LDA #$33			 ; A9 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1DC
; Address: $D2972E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1DC:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1DD
; Address: $D29734
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1DD:
	STZ $BE82			; 9C 82 BE | Store zero to absolute
	LDA $C167			; AD 67 C1 | Audio system operation
	STA $BE81			; 8D 81 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1DF
; Address: $D29742
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1DF:
	JSR $1209			; 20 09 12 | Jump to subroutine
	LDA $C16B			; AD 6B C1 | Audio system operation
	BMI $09			  ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1E1
; Address: $D29753
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1E1:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STZ $BE82			; 9C 82 BE | Store zero to absolute
	LDA $C169			; AD 69 C1 | Audio system operation
	STA $BE81			; 8D 81 BE | Audio system operation
	LDA $C16D			; AD 6D C1 | Audio system operation
	BMI $09			  ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1E3
; Address: $D29770
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1E3:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	JMP $172E			; 4C 2E 17 | Jump to address
	LDA #$06			 ; A9 06 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1E6
; Address: $D29784
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1E6:
	JSL $C1D7F2		  ; 22 F2 D7 C1 | Jump to subroutine long
	BCC $19			  ; 90 19 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1E7
; Address: $D2978B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1E7:
	JSR $1209			; 20 09 12 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	STZ $BE82			; 9C 82 BE | Store zero to absolute
	STA $BE81			; 8D 81 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1EB
; Address: $D297B2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1EB:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1EF
; Address: $D297C6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1EF:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1F1
; Address: $D297D8
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1F1:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$04			 ; A9 04 | Audio system operation
	JMP $17E6			; 4C E6 17 | Jump to address
	LDA #$00			 ; A9 00 | Audio system operation
	LDX $C187			; AE 87 C1 | Load from absolute address into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $07			  ; D0 07 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	JMP $1801			; 4C 01 18 | Jump to address
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	INC				  ; 1A | Increment accumulator
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 0E 18 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1F2
; Address: $D29807
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1F2:
	JSL $C1A900		  ; 22 00 A9 C1 | Jump to subroutine long
	JMP $17CC			; 4C CC 17 | Jump to address
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1F4
; Address: $D29824
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1F4:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1F5
; Address: $D2982D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1F5:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $0F			  ; D0 0F | Branch if not equal
	STY $BE7F			; 8C 7F BE | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1F7
; Address: $D29842
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1F7:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	BNE $E1			  ; D0 E1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1F8
; Address: $D2984C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1F8:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1F9
; Address: $D29852
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1F9:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($AD,X)		  ; 01 AD | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1FB
; Address: $D29861
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1FB:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_1FC
; Address: $D29867
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_1FC:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C1E3			; 2E E3 C1 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_202
; Address: $D2988F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_202:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_20A
; Address: $D298C1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_20A:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_20F
; Address: $D298DA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_20F:
	JSL $C1D6B6		  ; 22 B6 D6 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_212
; Address: $D298EE
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_212:
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_213
; Address: $D298F2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_213:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LDA $AD00,X		  ; BD 00 AD | Audio system operation
	PHX				  ; DA | Push X register to stack
	CMP #$AB			 ; C9 AB | Compare accumulator (immediate)
	BEQ $33			  ; F0 33 | Branch if equal
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_216
; Address: $D29911
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_216:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	JMP $18EC			; 4C EC 18 | Jump to address
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_21B
; Address: $D29933
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_21B:
	JSL $C31452		  ; 22 52 14 C3 | Jump to subroutine long
	JMP $1909			; 4C 09 19 | Jump to address
	LDA #$08			 ; A9 08 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_220
; Address: $D2994E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_220:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_225
; Address: $D29963
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_225:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_228
; Address: $D29971
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_228:
	JSL $C1D5D4		  ; 22 D4 D5 C1 | Jump to subroutine long
	BCS $04			  ; B0 04 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_22D
; Address: $D29986
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_22D:
	JSL $C1D5E3		  ; 22 E3 D5 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_22E
; Address: $D2998C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_22E:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_22F
; Address: $D29992
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_22F:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STX $220D			; 8E 0D 22 | Store X register to absolute address
	BVS $14			  ; 70 14 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_231
; Address: $D2999F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_231:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_232
; Address: $D299A5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_232:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	TXS				  ; 9A | Transfer X register to stack pointer
	BCS $0C			  ; B0 0C | Branch if carry set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_234
; Address: $D299B7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_234:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_235
; Address: $D299BD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_235:
	STZ $BE82			; 9C 82 BE | Store zero to absolute
	LDA $C169			; AD 69 C1 | Audio system operation
	STA $BE81			; 8D 81 BE | Audio system operation
	ORA $C167			; 0D 67 C1 | Logical OR with accumulator (absolute)
	BEQ $E6			  ; F0 E6 | Branch if equal
	LDA $C16D			; AD 6D C1 | Audio system operation
	BMI $09			  ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank24_AudioFunction_236
; Address: $D299D0
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_236:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ORA $D422,Y		  ; 19 22 D4 | Logical OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($0B,X)		  ; C1 0B | Compare accumulator ((zero page,X))
	ORA ($9C,X)		  ; 01 9C | Logical OR with accumulator ((zero page,X))
	LDX $67AD,Y		  ; BE AD 67 | Load from absolute,Y into X register
	CMP ($8D,X)		  ; C1 8D | Compare accumulator ((zero page,X))
	STA ($BE,X)		  ; 81 BE | Audio system operation
	LDA $C16B			; AD 6B C1 | Audio system operation
	BMI $09			  ; 30 09 | Branch if negative

;------------------------------------------------------------------------------
; Bank24_AudioFunction_237
; Address: $D299ED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_237:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	JMP $19B7			; 4C B7 19 | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_239
; Address: $D299FB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_239:
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	ORA $D422,Y		  ; 19 22 D4 | Logical OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($0D,X)		  ; C1 0D | Compare accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	BCS $0C			  ; B0 0C | Branch if carry set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_23B
; Address: $D29A11
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_23B:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ASL $2201			; 0E 01 22 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_23F
; Address: $D29A28
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_23F:
	JSL $C1D80C		  ; 22 0C D8 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_240
; Address: $D29A2E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_240:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_244
; Address: $D29A3F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_244:
	JSL $C1D812		  ; 22 12 D8 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_248
; Address: $D29A50
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_248:
	JSL $C1D818		  ; 22 18 D8 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_249
; Address: $D29A56
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_249:
	JSL $C33075		  ; 22 75 30 C3 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	LDA #$0F			 ; A9 0F | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_251
; Address: $D29A83
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_251:
	JSL $B00DC3		  ; 22 C3 0D B0 | Jump to subroutine long
	STZ $BE43			; 9C 43 BE | Store zero to absolute
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_254
; Address: $D29A94
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_254:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200,Y		  ; 59 00 22 | Exclusive OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_25B
; Address: $D29AB9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_25B:
	JSL $C1D4C8		  ; 22 C8 D4 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_25C
; Address: $D29ABF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_25C:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_25D
; Address: $D29AC5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_25D:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_264
; Address: $D29AEA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_264:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_26C
; Address: $D29B18
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_26C:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_26D
; Address: $D29B24
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_26D:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_26E
; Address: $D29B30
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_26E:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	BRA $0D			  ; 80 0D | Branch always
	LDA $BE7D			; AD 7D BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_26F
; Address: $D29B39
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_26F:
	JSL $C46951		  ; 22 51 69 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_270
; Address: $D29B45
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_270:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA ($0D,X)		  ; 81 0D | Audio system operation
	JMP $1B78			; 4C 78 1B | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_271
; Address: $D29B4E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_271:
	JSL $C45AB0		  ; 22 B0 5A C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	XBA				  ; EB | Exchange accumulator bytes
	STA $BE82			; 8D 82 BE | Audio system operation
	STY $BE81			; 8C 81 BE | Store Y register to absolute address
	LDA $BE7D			; AD 7D BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_272
; Address: $D29B5D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_272:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_274
; Address: $D29B72
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_274:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_276
; Address: $D29B81
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_276:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	JMP $C90D99		  ; 5C 99 0D C9 | Jump to address long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_27B
; Address: $D29BA0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_27B:
	JSL $C42DA1		  ; 22 A1 2D C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BCS $04			  ; B0 04 | Branch if carry set
	JMP $C90D99		  ; 5C 99 0D C9 | Jump to address long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_27D
; Address: $D29BB3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_27D:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_27F
; Address: $D29BBF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_27F:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_280
; Address: $D29BCB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_280:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_282
; Address: $D29BDD
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_282:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_284
; Address: $D29BE6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_284:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	JMP $C90D99		  ; 5C 99 0D C9 | Jump to address long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_286
; Address: $D29BFC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_286:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_288
; Address: $D29C0B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_288:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	JMP $C90D99		  ; 5C 99 0D C9 | Jump to address long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_28B
; Address: $D29C21
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_28B:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHB				  ; 8B | Push data bank register to stack
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_28C
; Address: $D29C2D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_28C:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STY $220D			; 8C 0D 22 | Store Y register to absolute address
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_28D
; Address: $D29C39
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_28D:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_28E
; Address: $D29C45
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_28E:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_28F
; Address: $D29C51
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_28F:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_291
; Address: $D29C63
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_291:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $6A22			; 0D 22 6A | Logical OR with accumulator (absolute)
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_293
; Address: $D29C75
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_293:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_295
; Address: $D29C87
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_295:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $6A22			; 0D 22 6A | Logical OR with accumulator (absolute)
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_297
; Address: $D29C99
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_297:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $7C22			; 0D 22 7C | Logical OR with accumulator (absolute)
	AND #$C4			 ; 29 C4 | Logical AND with accumulator (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_299
; Address: $D29CA8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_299:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	STA $72			  ; 85 72 | Audio system operation
	STA $74			  ; 85 74 | Audio system operation
	LDA $74			  ; A5 74 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_29A
; Address: $D29CB2
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_29A:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $13			  ; F0 13 | Branch if equal
	INC $74			  ; E6 74 | Increment (zero page)
	LDA $74			  ; A5 74 | Audio system operation
	CMP $72			  ; C5 72 | Compare accumulator (zero page)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP $70			  ; C5 70 | Compare accumulator (zero page)
	BCC $DF			  ; 90 DF | Branch if carry clear
	STZ $74			  ; 64 74 | Store zero to zero page
	JMP $1CB0			; 4C B0 1C | Jump to address
	STZ $74			  ; 64 74 | Store zero to zero page
	LDA $74			  ; A5 74 | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_29B
; Address: $D29CDD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_29B:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_29C
; Address: $D29CE9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_29C:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $F84C			; 0D 4C F8 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_29D
; Address: $D29CF2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_29D:
	JSL $C1A92E		  ; 22 2E A9 C1 | Jump to subroutine long
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($99,X)		  ; C1 99 | Compare accumulator ((zero page,X))
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_29E
; Address: $D29D04
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_29E:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($9B,X)		  ; C1 9B | Compare accumulator ((zero page,X))
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2A0
; Address: $D29D1A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2A0:
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($9C,X)		  ; C1 9C | Compare accumulator ((zero page,X))
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2A2
; Address: $D29D2D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2A2:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A9,X)		  ; C1 A9 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $59B0			; 0E B0 59 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2A3
; Address: $D29D41
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2A3:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($AA,X)		  ; C1 AA | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $45B0			; 0E B0 45 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2A4
; Address: $D29D55
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2A4:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($AB,X)		  ; C1 AB | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $31B0			; 0E B0 31 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2A5
; Address: $D29D69
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2A5:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($AC,X)		  ; C1 AC | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $1DB0			; 0E B0 1D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2A6
; Address: $D29D7D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2A6:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($9E,X)		  ; C1 9E | Compare accumulator ((zero page,X))
	ORA $7FAD			; 0D AD 7F | Logical OR with accumulator (absolute)
	LDX $DAAE,Y		  ; BE AE DA | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2A7
; Address: $D29D8F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2A7:
	JSL $C452E3		  ; 22 E3 52 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $2040,X		  ; FE 40 20 | Increment (absolute,X)
	ASL $F722			; 0E 22 F7 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2AA
; Address: $D29DA5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2AA:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($9F,X)		  ; C1 9F | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $E1B0			; 0E B0 E1 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2AB
; Address: $D29DB9
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2AB:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $CDB0			; 0E B0 CD | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2AC
; Address: $D29DCD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2AC:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A3,X)		  ; C1 A3 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $B9B0			; 0E B0 B9 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2AD
; Address: $D29DE1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2AD:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A4,X)		  ; C1 A4 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $A5B0			; 0E B0 A5 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2AE
; Address: $D29DF5
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2AE:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A5,X)		  ; C1 A5 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $91B0			; 0E B0 91 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2AF
; Address: $D29E09
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2AF:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A8,X)		  ; C1 A8 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $2920,X		  ; 1D 20 29 | Logical OR with accumulator (absolute,X)
	ASL $24B0			; 0E B0 24 | Arithmetic shift left (absolute)
	LDA $BE7F			; AD 7F BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B0
; Address: $D29E20
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B0:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B1
; Address: $D29E2C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B1:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A0,X)		  ; C1 A0 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $D422,X		  ; 1D 22 D4 | Logical OR with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A1,X)		  ; C1 A1 | Compare accumulator ((zero page,X))
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B2
; Address: $D29E47
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B2:
	JSR $0E29			; 20 29 0E | Jump to subroutine
	BCS $24			  ; B0 24 | Branch if carry set
	LDA $BE7F			; AD 7F BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B3
; Address: $D29E4F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B3:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B4
; Address: $D29E5B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B4:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $220D,X		  ; 9D 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A6,X)		  ; C1 A6 | Compare accumulator ((zero page,X))
	ORA $894C			; 0D 4C 89 | Logical OR with accumulator (absolute)
	ORA $D422,X		  ; 1D 22 D4 | Logical OR with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($A7,X)		  ; C1 A7 | Compare accumulator ((zero page,X))
	ORA $F722			; 0D 22 F7 | Logical OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B6
; Address: $D29E7B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B6:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	STA $AD0D,X		  ; 9D 0D AD | Audio system operation
	LDX $1922,Y		  ; BE 22 19 | Load from absolute,Y into X register
	ROL $01C4			; 2E C4 01 | Rotate left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B7
; Address: $D29E93
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B7:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CLV				  ; B8 | Clear overflow flag
	ASL $894C,X		  ; 1E 4C 89 | Arithmetic shift left (absolute,X)
	ORA $04A9,X		  ; 1D A9 04 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B8
; Address: $D29EA2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B8:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDX $4C1E			; AE 1E 4C | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2B9
; Address: $D29EAC
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2B9:
	BIT #$1D			 ; 89 1D | Test bits in accumulator (immediate)
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CMP $DA1E			; CD 1E DA | Compare accumulator (absolute)
	ASL $1EE1,X		  ; 1E E1 1E | Arithmetic shift left (absolute,X)
	INC $F51E			; EE 1E F5 | Increment (absolute)
	ASL $1F02,X		  ; 1E 02 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2BA
; Address: $D29EC0
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2BA:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LDA $220D			; AD 0D 22 | Audio system operation
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($AE,X)		  ; C1 AE | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B0,X)		  ; C1 B0 | Compare accumulator ((zero page,X))
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B1,X)		  ; C1 B1 | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B2,X)		  ; C1 B2 | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B4,X)		  ; C1 B4 | Compare accumulator ((zero page,X))
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B5,X)		  ; C1 B5 | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B7,X)		  ; C1 B7 | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($AD,X)		  ; C1 AD | Compare accumulator ((zero page,X))
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($AF,X)		  ; C1 AF | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B0,X)		  ; C1 B0 | Compare accumulator ((zero page,X))
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($AF,X)		  ; C1 AF | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B3,X)		  ; C1 B3 | Compare accumulator ((zero page,X))
	ORA $2260			; 0D 60 22 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B4,X)		  ; C1 B4 | Compare accumulator ((zero page,X))
	ORA $D422			; 0D 22 D4 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP ($B6,X)		  ; C1 B6 | Compare accumulator ((zero page,X))
	ORA $5C60			; 0D 60 5C | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C1
; Address: $D29F3B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C1:
	JSR $21AC			; 20 AC 21 | PPU graphics register access
	BCS $F6			  ; B0 F6 | Branch if carry set
	LDA $2BBA			; AD BA 2B | Audio system operation
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C2
; Address: $D29F45
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C2:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C3
; Address: $D29F50
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C3:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHY				  ; 5A | Push Y register to stack
	JMP $1F4B			; 4C 4B 1F | Jump to address
	STZ $2BBA			; 9C BA 2B | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C4
; Address: $D29F5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C4:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $2BB2			; 8D B2 2B | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2BB4			; 8D B4 2B | Audio system operation
	LDX #$28			 ; A2 28 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C5
; Address: $D29F6C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C5:
	JSR $24ED			; 20 ED 24 | Jump to subroutine
	STA $2BCA			; 8D CA 2B | Audio system operation
	LDX #$2B			 ; A2 2B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C6
; Address: $D29F75
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C6:
	JSR $24ED			; 20 ED 24 | Jump to subroutine
	STA $2BCC			; 8D CC 2B | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $2BB6			; 9C B6 2B | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C7
; Address: $D29F81
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C7:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$00			 ; A9 00 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $0C			  ; 80 0C | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA #$00			 ; A9 00 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C8
; Address: $D29F9F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C8:
	JSR $0009			; 20 09 00 | Jump to subroutine
	BRA $0C			  ; 80 0C | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2C9
; Address: $D29FAA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2C9:
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$00			 ; A9 00 | Audio system operation
	BPL $0C			  ; 10 0C | Branch if positive
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2CA
; Address: $D29FB3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2CA:
	JSL $C3AEE8		  ; 22 E8 AE C3 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA #$00			 ; A9 00 | Audio system operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $0C			  ; 80 0C | Branch always

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2CB
; Address: $D29FC2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2CB:
	JSL $C455FD		  ; 22 FD 55 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA #$1F			 ; A9 1F | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2CC
; Address: $D29FCB
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2CC:
	JSR $203D			; 20 3D 20 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$04			 ; A9 04 | Audio system operation
	LDA #$22			 ; A9 22 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2CD
; Address: $D29FD9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2CD:
	JSR $203D			; 20 3D 20 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$08			 ; A9 08 | Audio system operation
	LDA #$25			 ; A9 25 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2CE
; Address: $D29FE7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2CE:
	JSR $203D			; 20 3D 20 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$10			 ; A9 10 | Audio system operation
	LDA #$28			 ; A9 28 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2CF
; Address: $D29FF5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2CF:
	JSR $203D			; 20 3D 20 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$20			 ; A9 20 | Audio system operation
	LDA #$2B			 ; A9 2B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2D0
; Address: $D2A003
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2D0:
	JSR $203D			; 20 3D 20 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$40			 ; A9 40 | Audio system operation
	LDA #$46			 ; A9 46 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2D1
; Address: $D2A011
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2D1:
	JSR $203D			; 20 3D 20 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$02			 ; A9 02 | Audio system operation
	LDA #$47			 ; A9 47 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2D2
; Address: $D2A01F
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2D2:
	JSR $203D			; 20 3D 20 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$01			 ; A9 01 | Audio system operation
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $2BB6			; AD B6 2B | Audio system operation
	STA $2BE8,Y		  ; 99 E8 2B | Audio system operation
	INX				  ; E8 | Increment X register
	CPX $2BB2			; EC B2 2B | Compare X register (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $1F7E			; 4C 7E 1F | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2D4
; Address: $D2A040
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2D4:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $07			  ; 30 07 | Branch if negative
	CMP $40F7,Y		  ; D9 F7 40 | Compare accumulator (absolute,Y)
	BNE $F7			  ; D0 F7 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2D6
; Address: $D2A04D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2D6:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2D7
; Address: $D2A055
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2D7:
	JSR $62F0			; 20 F0 62 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $7A			  ; 85 7A | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDX $2BB4			; AE B4 2B | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BMI $54			  ; 30 54 | Branch if negative
	LDA $2BE8,X		  ; BD E8 2B | Audio system operation
	BMI $F7			  ; 30 F7 | Branch if negative
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $F2			  ; F0 F2 | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $78			  ; 85 78 | Audio system operation
	STA $BE7D			; 8D 7D BE | Audio system operation
	LDA #$47			 ; A9 47 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2DC
; Address: $D2A091
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2DC:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Audio system operation
	RTI				  ; 40 | Return from interrupt
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND $2BE8,Y		  ; 39 E8 2B | Logical AND with accumulator (absolute,Y)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$00			 ; A9 00 | Audio system operation
	BRA $4C			  ; 80 4C | Branch always
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2DF
; Address: $D2A0B4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2DF:
	STA $2BE8,Y		  ; 99 E8 2B | Audio system operation
	INC $2BBA			; EE BA 2B | Increment (absolute)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $2BB4			; CC B4 2B | Compare Y register (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2050			; 4C 50 20 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2E0
; Address: $D2A0C5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2E0:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX $78			  ; A6 78 | Load from zero page into X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2E4
; Address: $D2A0D9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2E4:
	JSL $C433BA		  ; 22 BA 33 C4 | Jump to subroutine long
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2E5
; Address: $D2A0E4
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2E5:
	LDA $2BB2			; AD B2 2B | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $2BB6			; 8D B6 2B | Audio system operation
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $F0			  ; 10 F0 | Branch if positive
	LSR $4A98			; 4E 98 4A | Logical shift right (absolute)
	STA $7A			  ; 85 7A | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDX $2BB4			; AE B4 2B | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BMI $40			  ; 30 40 | Branch if negative
	LDA $2BE8,X		  ; BD E8 2B | Audio system operation
	BMI $F7			  ; 30 F7 | Branch if negative
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $F2			  ; F0 F2 | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $78			  ; 85 78 | Audio system operation
	STA $BE7D			; 8D 7D BE | Audio system operation
	LDA #$46			 ; A9 46 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2EB
; Address: $D2A12F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2EB:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA $A900,X		  ; 1D 00 A9 | Logical OR with accumulator (absolute,X)
	BPL $49			  ; 10 49 | Branch if positive
	AND $2BE8,Y		  ; 39 E8 2B | Logical AND with accumulator (absolute,Y)
	STA $2BE8,Y		  ; 99 E8 2B | Audio system operation
	INC $2BBA			; EE BA 2B | Increment (absolute)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $2BB4			; CC B4 2B | Compare Y register (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $20EE			; 4C EE 20 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2EC
; Address: $D2A14F
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2EC:
	STZ $2BB6			; 9C B6 2B | Store zero to absolute
	LDY $2BB4			; AC B4 2B | Load from absolute address into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $4A			  ; 30 4A | Branch if negative
	LDA #$00			 ; A9 00 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2BE8,Y		  ; 39 E8 2B | Logical AND with accumulator (absolute,Y)
	STA $2BE8,Y		  ; 99 E8 2B | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $EB			  ; D0 EB | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2ED
; Address: $D2A16D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2ED:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $A9			  ; 70 A9 | Branch if overflow set
	ORA ($A2,X)		  ; 01 A2 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2EF
; Address: $D2A17F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2EF:
	JSL $C43115		  ; 22 15 31 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP $71			  ; C5 71 | Compare accumulator (zero page)
	BCS $CB			  ; B0 CB | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	LDA $71			  ; A5 71 | Audio system operation
	SEC				  ; 38 | Set carry flag
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	DEC $682B			; CE 2B 68 | Decrement (absolute)
	LDA #$00			 ; A9 00 | Audio system operation
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2F0
; Address: $D2A197
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2F0:
	ORA $2BE8,Y		  ; 19 E8 2B | Logical OR with accumulator (absolute,Y)
	STA $2BE8,Y		  ; 99 E8 2B | Audio system operation
	INC $2BB6			; EE B6 2B | Increment (absolute)
	JMP $2155			; 4C 55 21 | PPU graphics register access
	LDA $2BB6			; AD B6 2B | Audio system operation
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2F4
; Address: $D2A1B2
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2F4:
	JSR $2342			; 20 42 23 | Jump to subroutine
	LDA $2BBE			; AD BE 2B | Audio system operation
	BMI $0D			  ; 30 0D | Branch if negative
	CMP $2BBC			; CD BC 2B | Compare accumulator (absolute)
	BCS $08			  ; B0 08 | Branch if carry set
	CMP $2BC0			; CD C0 2B | Compare accumulator (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $223C			; 4C 3C 22 | Jump to address
	LDA $2BBC			; AD BC 2B | Audio system operation
	BMI $0A			  ; 30 0A | Branch if negative
	CMP $2BC0			; CD C0 2B | Compare accumulator (absolute)
	BEQ $05			  ; F0 05 | Branch if equal
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $2252			; 4C 52 22 | Jump to address
	LDA $2BC0			; AD C0 2B | Audio system operation
	BPL $02			  ; 10 02 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2F5
; Address: $D2A1DD
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2F5:
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $4B			  ; D0 4B | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $45			  ; F0 45 | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BNE $1D			  ; D0 1D | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BEQ $33			  ; F0 33 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2F7
; Address: $D2A207
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2F7:
	JSR $2456			; 20 56 24 | Jump to subroutine
	BCC $28			  ; 90 28 | Branch if carry clear
	LDA #$25			 ; A9 25 | Audio system operation
	JMP $2231			; 4C 31 22 | Jump to address
	LDA #$04			 ; A9 04 | Audio system operation
	LDX #$1F			 ; A2 1F | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2F8
; Address: $D2A218
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2F8:
	JSR $2456			; 20 56 24 | Jump to subroutine
	BCC $17			  ; 90 17 | Branch if carry clear
	LDA #$1F			 ; A9 1F | Audio system operation
	JMP $2231			; 4C 31 22 | Jump to address
	LDA #$08			 ; A9 08 | Audio system operation
	LDX #$22			 ; A2 22 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2F9
; Address: $D2A229
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2F9:
	JSR $2456			; 20 56 24 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$22			 ; A9 22 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2FA
; Address: $D2A231
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2FA:
	JSR $2481			; 20 81 24 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $2BB4			; CC B4 2B | Compare Y register (absolute)
	BCC $A5			  ; 90 A5 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2FB
; Address: $D2A23C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2FB:
	LDA $2BC4			; AD C4 2B | Audio system operation
	STA $BE7D			; 8D 7D BE | Audio system operation
	LDX $2BC8			; AE C8 2B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2FC
; Address: $D2A245
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2FC:
	JSL $C433BA		  ; 22 BA 33 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $2BA0,X		  ; FE A0 2B | Increment (absolute,X)
	JMP $2265			; 4C 65 22 | Jump to address
	LDA $2BC2			; AD C2 2B | Audio system operation
	STA $BE7D			; 8D 7D BE | Audio system operation
	LDX $2BC6			; AE C6 2B | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_2FD
; Address: $D2A25B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_2FD:
	JSL $C433BA		  ; 22 BA 33 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $28A0,X		  ; FE A0 28 | Increment (absolute,X)
	STY $33DA			; 8C DA 33 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_302
; Address: $D2A27D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_302:
	JSL $C912A4		  ; 22 A4 12 C9 | Jump to subroutine long
	INC $2BBA			; EE BA 2B | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_304
; Address: $D2A28C
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_304:
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BMI $54			  ; 30 54 | Branch if negative
	LDA $2BE8,X		  ; BD E8 2B | Audio system operation
	BMI $F7			  ; 30 F7 | Branch if negative
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $F2			  ; F0 F2 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $2BC2			; 8D C2 2B | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$28			 ; A0 28 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_305
; Address: $D2A2A4
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_305:
	JSL $C2B44A		  ; 22 4A B4 C2 | Jump to subroutine long
	STA $2BC6			; 8D C6 2B | Audio system operation
	PLX				  ; FA | Pull X register from stack
	BCC $DE			  ; 90 DE | Branch if carry clear
	LDY $2BB4			; AC B4 2B | Load from absolute address into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $2F			  ; 30 2F | Branch if negative
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $F4			  ; D0 F4 | Branch if not equal
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $EC			  ; F0 EC | Branch if equal
	PHX				  ; DA | Push X register to stack
	LDA $2BCE,Y		  ; B9 CE 2B | Audio system operation
	STZ $70			  ; 64 70 | Store zero to zero page
	STA $71			  ; 85 71 | Audio system operation
	LDA $2BCA			; AD CA 2B | Audio system operation
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_306
; Address: $D2A2D3
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_306:
	JSL $C01295		  ; 22 95 12 C0 | Jump to subroutine long
	LDA $70			  ; A5 70 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $2BBC			; 6D BC 2B | Add with carry (absolute)
	STA $2BBC			; 8D BC 2B | Audio system operation
	PLX				  ; FA | Pull X register from stack
	JMP $22B1			; 4C B1 22 | Jump to address
	LDA $2BBC			; AD BC 2B | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	DEC $2BBC			; CE BC 2B | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_307
; Address: $D2A2ED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_307:
	STZ $2BBE			; 9C BE 2B | Store zero to absolute
	LDX $2BB4			; AE B4 2B | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_308
; Address: $D2A2F5
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_308:
	BMI $42			  ; 30 42 | Hardware register operation
	LDA $2BE8,X		  ; BD E8 2B | Audio system operation
	BMI $F7			  ; 30 F7 | Branch if negative
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $F2			  ; F0 F2 | Branch if equal
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $2BC4			; 8D C4 2B | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$2B			 ; A0 2B | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_309
; Address: $D2A30B
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_309:
	JSL $C2B44A		  ; 22 4A B4 C2 | Jump to subroutine long
	STA $2BC8			; 8D C8 2B | Audio system operation
	PLX				  ; FA | Pull X register from stack
	BCC $DE			  ; 90 DE | Branch if carry clear
	LDY $2BB4			; AC B4 2B | Load from absolute address into Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BMI $1D			  ; 30 1D | Branch if negative
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $F4			  ; D0 F4 | Branch if not equal
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $EC			  ; F0 EC | Branch if equal
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC $2BBE			; 6D BE 2B | Add with carry (absolute)
	STA $2BBE			; 8D BE 2B | Audio system operation
	JMP $2318			; 4C 18 23 | Jump to address
	LDA $2BBE			; AD BE 2B | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	DEC $2BBE			; CE BE 2B | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_30A
; Address: $D2A342
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_30A:
	STZ $2BC0			; 9C C0 2B | Store zero to absolute
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA #$80			 ; A9 80 | Audio system operation
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $2BE8,Y		  ; 39 E8 2B | Logical AND with accumulator (absolute,Y)
	STA $2BE8,Y		  ; 99 E8 2B | Audio system operation
	TAX				  ; AA | Transfer accumulator to X register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BNE $60			  ; D0 60 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_30B
; Address: $D2A363
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_30B:
	PHP				  ; 08 | Push processor status to stack
	BEQ $5A			  ; F0 5A | Branch if equal
	LDA #$FF			 ; A9 FF | Audio system operation
	STA $2BB8			; 8D B8 2B | Audio system operation
	STZ $2BD6			; 9C D6 2B | Store zero to absolute
	LDX $2BB4			; AE B4 2B | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BMI $35			  ; 30 35 | Branch if negative
	LDA $2BE8,X		  ; BD E8 2B | Audio system operation
	BMI $F7			  ; 30 F7 | Branch if negative
	STA $2BB6			; 8D B6 2B | Audio system operation
	LDA #$04			 ; A9 04 | Audio system operation
	AND $2BB6			; 2D B6 2B | Logical AND with accumulator (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$1F			 ; A9 1F | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_30C
; Address: $D2A389
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_30C:
	JSR $23D3			; 20 D3 23 | Jump to subroutine
	LDA #$08			 ; A9 08 | Audio system operation
	AND $2BB6			; 2D B6 2B | Logical AND with accumulator (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$22			 ; A9 22 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_30D
; Address: $D2A397
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_30D:
	JSR $23D3			; 20 D3 23 | Jump to subroutine
	LDA #$10			 ; A9 10 | Audio system operation
	AND $2BB6			; 2D B6 2B | Logical AND with accumulator (absolute)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$25			 ; A9 25 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_30E
; Address: $D2A3A5
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_30E:
	JSR $23D3			; 20 D3 23 | Jump to subroutine
	JMP $2372			; 4C 72 23 | Jump to address
	LDA $2BB8			; AD B8 2B | Audio system operation
	BMI $10			  ; 30 10 | Branch if negative
	CLC				  ; 18 | Clear carry flag
	ADC $2BC0			; 6D C0 2B | Add with carry (absolute)
	STA $2BC0			; 8D C0 2B | Audio system operation
	LDA $2BE8,Y		  ; B9 E8 2B | Audio system operation
	ORA $2BD6			; 0D D6 2B | Logical OR with accumulator (absolute)
	STA $2BE8,Y		  ; 99 E8 2B | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $2BB4			; CC B4 2B | Compare Y register (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $2348			; 4C 48 23 | Jump to address
	LDA $2BC0			; AD C0 2B | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	DEC $2BC0			; CE C0 2B | Decrement (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_30F
; Address: $D2A3D3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_30F:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $2BCE,Y		  ; B9 CE 2B | Audio system operation
	STZ $70			  ; 64 70 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank24_AudioFunction_311
; Address: $D2A3E0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_311:
	JSR $24ED			; 20 ED 24 | Jump to subroutine
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	LDX #$70			 ; A2 70 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_312
; Address: $D2A3F1
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_312:
	JSL $C01295		  ; 22 95 12 C0 | Jump to subroutine long
	LDA $70			  ; A5 70 | Audio system operation
	LDX $2BB8			; AE B8 2B | Load from absolute address into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $2BB8			; CD B8 2B | Compare accumulator (absolute)
	BCC $49			  ; 90 49 | Branch if carry clear
	BEQ $47			  ; F0 47 | Branch if equal
	JMP $2413			; 4C 13 24 | Jump to address
	CMP $2BB8			; CD B8 2B | Compare accumulator (absolute)
	BCS $3F			  ; B0 3F | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	ORA $4A			  ; 05 4A | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_313
; Address: $D2A41B
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_313:
	JSL $C2B44A		  ; 22 4A B4 C2 | Jump to subroutine long
	BCC $30			  ; 90 30 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	STA $2BB8			; 8D B8 2B | Audio system operation
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA #$80			 ; A9 80 | Audio system operation
	STA $2BD6			; 8D D6 2B | Audio system operation
	JMP $2452			; 4C 52 24 | Jump to address
	CMP #$22			 ; C9 22 | Compare accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA #$00			 ; A9 00 | Audio system operation
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	JMP $2452			; 4C 52 24 | Jump to address
	CMP #$25			 ; C9 25 | Compare accumulator (immediate)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA #$00			 ; A9 00 | Audio system operation
	STA $2BD6			; 8D D6 2B | Audio system operation
	JMP $2452			; 4C 52 24 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_314
; Address: $D2A456
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_314:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX $2BB4			; AE B4 2B | Load from absolute address into X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BMI $1C			  ; 30 1C | Branch if negative
	LDA $2BE8,X		  ; BD E8 2B | Audio system operation
	BMI $F7			  ; 30 F7 | Branch if negative
	ORA $F0			  ; 05 F0 | Logical OR with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_315
; Address: $D2A470
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_315:
	JSL $C2B44A		  ; 22 4A B4 C2 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	BCC $E5			  ; 90 E5 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_316
; Address: $D2A47C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_316:
	PLY				  ; 7A | Pull Y register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_317
; Address: $D2A481
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_317:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $BE7F			; 8D 7F BE | Audio system operation
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STX $BE7D			; 8E 7D BE | Store X register to absolute address
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_320
; Address: $D2A4BF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_320:
	JSL $C90B3A		  ; 22 3A 0B C9 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	LDX $BE7F			; AE 7F BE | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_321
; Address: $D2A4CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_321:
	JSL $C43193		  ; 22 93 31 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	JMP $24E6			; 4C E6 24 | Jump to address
	LDX $BE7F			; AE 7F BE | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_323
; Address: $D2A4DF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_323:
	JSL $C43154		  ; 22 54 31 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $2BBA			; EE BA 2B | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_325
; Address: $D2A4EE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_325:
	JSL $C2CC25		  ; 22 25 CC C2 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_326
; Address: $D2A4F7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_326:
	JSL $C2CCF8		  ; 22 F8 CC C2 | Jump to subroutine long
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$FF			 ; A9 FF | Audio system operation
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_328
; Address: $D2A50C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_328:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_329
; Address: $D2A518
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_329:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	CLV				  ; B8 | Clear overflow flag
	ORA $AD6B			; 0D 6B AD | Logical OR with accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_32A
; Address: $D2A523
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_32A:
	JSL $C44EA6		  ; 22 A6 4E C4 | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	STY $33E2			; 8C E2 33 | Store Y register to absolute address
	STX $33E4			; 8E E4 33 | Store X register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	STA $BE82			; 8D 82 BE | Audio system operation
	STY $BE81			; 8C 81 BE | Store Y register to absolute address
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_32B
; Address: $D2A538
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_32B:
	JSL $C4527C		  ; 22 7C 52 C4 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLY				  ; 7A | Pull Y register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA				  ; BF 68 0C C3 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA				  ; BF 66 0C C3 | Load from absolute long,X into accumulator
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA $33D6			; AD D6 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_32C
; Address: $D2A558
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_32C:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STA $33E8			; 8D E8 33 | Audio system operation
	LDA				  ; BF 6D 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_32E
; Address: $D2A56D
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_32E:
	TSX				  ; BA | Transfer stack pointer to X register
	ORA $0DBA			; 0D BA 0D | Logical OR with accumulator (absolute)
	ORA $0E3C			; 0D 3C 0E | Logical OR with accumulator (absolute)
	LDY $3D0D,X		  ; BC 0D 3D | Load from absolute,X into Y register
	ASL $0DBD			; 0E BD 0D | Arithmetic shift left (absolute)
	ROL $BE0E,X		  ; 3E 0E BE | Rotate left (absolute,X)
	ORA $0E3F			; 0D 3F 0E | Logical OR with accumulator (absolute)
	LDA				  ; BF 0D 40 0E | Load from absolute long,X into accumulator
	CPY #$0D			 ; C0 0D | Compare Y register (immediate)
	EOR ($0E,X)		  ; 41 0E | Exclusive OR with accumulator ((zero page,X))
	CMP ($0D,X)		  ; C1 0D | Compare accumulator ((zero page,X))
	WDM #$0E			 ; 42 0E | Reserved instruction
	REP #$0D			 ; C2 0D | Reset processor status bits
	ASL $0DC3			; 0E C3 0D | Arithmetic shift left (absolute)
	ASL $0DC4			; 0E C4 0D | Arithmetic shift left (absolute)
	EOR $0E			  ; 45 0E | Exclusive OR with accumulator (zero page)
	CMP $0D			  ; C5 0D | Compare accumulator (zero page)
	LSR $0E			  ; 46 0E | Logical shift right (zero page)
	ORA $0E48			; 0D 48 0E | Logical OR with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	ORA $0E49			; 0D 49 0E | Logical OR with accumulator (absolute)
	CMP #$0D			 ; C9 0D | Compare accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $0DCA			; 0E CA 0D | Arithmetic shift left (absolute)
	ASL $0DCB			; 0E CB 0D | Arithmetic shift left (absolute)
	JMP $CC0E			; 4C 0E CC | Jump to address
	ORA $0E4D			; 0D 4D 0E | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_32F
; Address: $D2A5B5
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_32F:
	CMP $4E0D			; CD 0D 4E | Compare accumulator (absolute)
	ASL $0DCE			; 0E CE 0D | Arithmetic shift left (absolute)
	ASL $0E10			; 0E 10 0E | Arithmetic shift left (absolute)
	STA ($0E),Y		  ; 91 0E | Audio system operation
	ORA ($0E),Y		  ; 11 0E | Logical OR with accumulator ((zero page),Y)
	ASL $0E12			; 0E 12 0E | Arithmetic shift left (absolute)
	ASL $0E13			; 0E 13 0E | Arithmetic shift left (absolute)
	ASL $0E14			; 0E 14 0E | Arithmetic shift left (absolute)
	ASL $0E15			; 0E 15 0E | Arithmetic shift left (absolute)
	ASL $0E16			; 0E 16 0E | Arithmetic shift left (absolute)
	ASL $0E17			; 0E 17 0E | Arithmetic shift left (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $0E1A			; 0E 1A 0E | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	STA $0E			  ; 85 0E | Audio system operation
	ASL $0E9C			; 0E 9C 0E | Arithmetic shift left (absolute)
	ASL $0E9D			; 0E 9D 0E | Arithmetic shift left (absolute)
	ORA $9E0E,X		  ; 1D 0E 9E | Logical OR with accumulator (absolute,X)
	ASL $0E1F			; 0E 1F 0E | Arithmetic shift left (absolute)
	STA				  ; 9F 0E 20 0E | Store accumulator to absolute long,X
	LDY #$0E			 ; A0 0E | Load immediate value into Y register
	AND ($0E,X)		  ; 21 0E | Logical AND with accumulator ((zero page,X))
	LDA ($0E,X)		  ; A1 0E | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_330
; Address: $D2A5FD
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_330:
	JSL $0EA20E		  ; 22 0E A2 0E | Jump to subroutine long
	ASL $3B0E,X		  ; 1E 0E 3B | Arithmetic shift left (absolute,X)
	ASL $0DF9			; 0E F9 0D | Arithmetic shift left (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ASL $0DE5			; 0E E5 0D | Arithmetic shift left (absolute)
	STZ $0E			  ; 64 0E | Store zero to zero page
	ASL $8F0E			; 0E 0E 8F | Arithmetic shift left (absolute)
	ASL $0E0F			; 0E 0F 0E | Arithmetic shift left (absolute)
	BCC $0E			  ; 90 0E | Branch if carry clear
	SBC $7E0D,X		  ; FD 0D 7E | Subtract with carry (absolute,X)
	ASL $0DE2			; 0E E2 0D | Arithmetic shift left (absolute)
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	ORA $0E62			; 0D 62 0E | Logical OR with accumulator (absolute)
	ASL $0E8D			; 0E 8D 0E | Arithmetic shift left (absolute)
	DEC $5D0D,X		  ; DE 0D 5D | Decrement (absolute,X)
	ASL $0DDD			; 0E DD 0D | Arithmetic shift left (absolute)
	JMP $0DFF0E		  ; 5C 0E FF 0D | Jump to address long
	BRA $0E			  ; 80 0E | Branch always
	CLC				  ; 18 | Clear carry flag
	ASL $0E99			; 0E 99 0E | Arithmetic shift left (absolute)
	INC $7F0D,X		  ; FE 0D 7F | Increment (absolute,X)
	ASL $0DFA			; 0E FA 0D | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	STA ($0E,X)		  ; 81 0E | Audio system operation
	ORA $0E5E			; 0D 5E 0E | Logical OR with accumulator (absolute)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $0E19			; 0E 19 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_331
; Address: $D2A64B
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_331:
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $0E02			; 0E 02 0E | Arithmetic shift left (absolute)
	ASL $0E03			; 0E 03 0E | Arithmetic shift left (absolute)
	STY $0E			  ; 84 0E | Store Y register to zero page
	ORA $0E5B			; 0D 5B 0E | Logical OR with accumulator (absolute)
	ORA $0E7D			; 0D 7D 0E | Logical OR with accumulator (absolute)
	INC $0D			  ; E6 0D | Increment (zero page)
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	ORA $0E7C			; 0D 7C 0E | Logical OR with accumulator (absolute)
	CPX $0D			  ; E4 0D | Compare X register (zero page)
	ASL $0E0B			; 0E 0B 0E | Arithmetic shift left (absolute)
	STY $050E			; 8C 0E 05 | Store Y register to absolute address
	ASL $0E86			; 0E 86 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E8B			; 0E 8B 0E | Arithmetic shift left (absolute)
	ORA $8E0E			; 0D 0E 8E | Logical OR with accumulator (absolute)
	ASL $0DE0			; 0E E0 0D | Arithmetic shift left (absolute)
	ASL $0E07			; 0E 07 0E | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	ASL $0E08			; 0E 08 0E | Arithmetic shift left (absolute)
	BIT #$0E			 ; 89 0E | Test bits in accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $0E06			; 0E 06 0E | Arithmetic shift left (absolute)
	ASL $0E23			; 0E 23 0E | Arithmetic shift left (absolute)
	ASL $0DD0			; 0E D0 0D | Arithmetic shift left (absolute)
	EOR ($0E),Y		  ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
	ORA $0E50			; 0D 50 0E | Logical OR with accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	ORA $0E59			; 0D 59 0E | Logical OR with accumulator (absolute)
	CMP $580D,Y		  ; D9 0D 58 | Compare accumulator (absolute,Y)
	ASL $0DE1			; 0E E1 0D | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_332
; Address: $D2A6A4
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_332:
	ASL $0DD6			; 0E D6 0D | Arithmetic shift left (absolute)
	ASL $0DD3			; 0E D3 0D | Arithmetic shift left (absolute)
	ASL $0DD5			; 0E D5 0D | Arithmetic shift left (absolute)
	ASL $0DD2			; 0E D2 0D | Arithmetic shift left (absolute)
	ASL $0E2B			; 0E 2B 0E | Arithmetic shift left (absolute)
	PLB				  ; AB | Pull data bank register from stack
	ASL $0DD4			; 0E D4 0D | Arithmetic shift left (absolute)
	ASL $0DD1			; 0E D1 0D | Arithmetic shift left (absolute)
	ASL $0DD7			; 0E D7 0D | Arithmetic shift left (absolute)
	ADC #$0E			 ; 69 0E | Add with carry (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	ORA $0E6A			; 0D 6A 0E | Logical OR with accumulator (absolute)
	CPX $6D0D			; EC 0D 6D | Compare X register (absolute)
	ASL $0DF1			; 0E F1 0D | Arithmetic shift left (absolute)
	ASL $0DF7			; 0E F7 0D | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $0DF5			; 0E F5 0D | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_333
; Address: $D2A6D8
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_333:
	ASL $0DF6			; 0E F6 0D | Arithmetic shift left (absolute)
	ASL $0DF4			; 0E F4 0D | Arithmetic shift left (absolute)
	ASL $0DF3			; 0E F3 0D | Arithmetic shift left (absolute)
	ASL $0DF2			; 0E F2 0D | Arithmetic shift left (absolute)
	ASL $0DF0			; 0E F0 0D | Arithmetic shift left (absolute)
	ADC ($0E),Y		  ; 71 0E | Add with carry ((zero page),Y)
	ORA $0E70			; 0D 70 0E | Logical OR with accumulator (absolute)
	INC $6F0D			; EE 0D 6F | Increment (absolute)
	ASL $0DED			; 0E ED 0D | Arithmetic shift left (absolute)
	ROR $EB0E			; 6E 0E EB | Rotate right (absolute)
	ORA $0E6C			; 0D 6C 0E | Logical OR with accumulator (absolute)
	NOP				  ; EA | No operation
	ORA $0E6B			; 0D 6B 0E | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA $0E79			; 0D 79 0E | Logical OR with accumulator (absolute)
	SBC #$0D			 ; E9 0D | Subtract with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $0DE8			; 0E E8 0D | Arithmetic shift left (absolute)
	ASL $0DE7			; 0E E7 0D | Arithmetic shift left (absolute)
	ROR $0E			  ; 66 0E | Rotate right (zero page)
	ROL $AE0E			; 2E 0E AE | Rotate left (absolute)
	ASL $0E2F			; 0E 2F 0E | Arithmetic shift left (absolute)
	LDA $0E360E		  ; AF 0E 36 0E | Audio system operation
	ASL $0E32			; 0E 32 0E | Arithmetic shift left (absolute)
	ASL $0E31			; 0E 31 0E | Arithmetic shift left (absolute)
	LDA ($0E),Y		  ; B1 0E | Audio system operation
	AND $AD0E			; 2D 0E AD | Logical AND with accumulator (absolute)
	ASL $0E27			; 0E 27 0E | Arithmetic shift left (absolute)
	ASL $0E25			; 0E 25 0E | Arithmetic shift left (absolute)
	LDA $0E			  ; A5 0E | Audio system operation
	SEC				  ; 38 | Set carry flag
	ASL $0EB8			; 0E B8 0E | Arithmetic shift left (absolute)
	BMI $0E			  ; 30 0E | Branch if negative
	BCS $0E			  ; B0 0E | Branch if carry set
	AND $B90E,Y		  ; 39 0E B9 | Logical AND with accumulator (absolute,Y)
	ASL $0E29			; 0E 29 0E | Arithmetic shift left (absolute)
	LDA #$0E			 ; A9 0E | Audio system operation
	ROL $0E			  ; 26 0E | Rotate left (zero page)
	LDX $0E			  ; A6 0E | Load from zero page into X register
	ASL $0EB4			; 0E B4 0E | Arithmetic shift left (absolute)
	BIT $AC0E			; 2C 0E AC | Test bits in accumulator (absolute)
	ASL $0E3A			; 0E 3A 0E | Arithmetic shift left (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	ASL $0E24			; 0E 24 0E | Arithmetic shift left (absolute)
	LDY $0E			  ; A4 0E | Load from zero page into Y register
	ROL				  ; 2A | Rotate left (accumulator)
	ASL $0EAA			; 0E AA 0E | Arithmetic shift left (absolute)
	ASL $0EB3			; 0E B3 0E | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	ASL $0EA8			; 0E A8 0E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_334
; Address: $D2A762
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_334:
	ASL $0EB5			; 0E B5 0E | Arithmetic shift left (absolute)
	ASL $0EB7			; 0E B7 0E | Arithmetic shift left (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_33B
; Address: $D2A784
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_33B:
	JSL $C44F00		  ; 22 00 4F C4 | Jump to subroutine long
	BCS $14			  ; B0 14 | Branch if carry set
	BVC $09			  ; 50 09 | Branch if overflow clear
	LDA				  ; BF B1 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_342
; Address: $D2A7AB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_342:
	JSL $C4508A		  ; 22 8A 50 C4 | Jump to subroutine long
	BCC $09			  ; 90 09 | Branch if carry clear
	LDA				  ; BF A9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_346
; Address: $D2A7C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_346:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $33DA			; AD DA 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_347
; Address: $D2A7D1
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_347:
	JSL $C44A72		  ; 22 72 4A C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCS $06			  ; B0 06 | Branch if carry set
	TXA				  ; 8A | Transfer X register to accumulator
	STA $2BB2,Y		  ; 99 B2 2B | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	DEC $78			  ; C6 78 | Decrement (zero page)
	BNE $E7			  ; D0 E7 | Branch if not equal
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank24_AudioFunction_348
; Address: $D2A7F0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_348:
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	LDX $33E8			; AE E8 33 | Load from absolute address into X register
	LDA				  ; BF E5 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_34A
; Address: $D2A801
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_34A:
	LDX $33E8			; AE E8 33 | Load from absolute address into X register
	LDA $2BB2			; AD B2 2B | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDA				  ; BF E9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_34C
; Address: $D2A813
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_34C:
	LDX $33E8			; AE E8 33 | Load from absolute address into X register
	LDA $2BB2			; AD B2 2B | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDA $2BB4			; AD B4 2B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_34D
; Address: $D2A81F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_34D:
	JSL $C42F5E		  ; 22 5E 2F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $BE77			; 8D 77 BE | Audio system operation
	LDA				  ; BF ED 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_34F
; Address: $D2A832
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_34F:
	LDA $BE7D			; AD 7D BE | Audio system operation
	PHA				  ; 48 | Push accumulator to stack
	LDX $33E8			; AE E8 33 | Load from absolute address into X register
	LDA				  ; BF 01 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_350
; Address: $D2A83D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_350:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	LDA $2BB2			; AD B2 2B | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDA $2BB4			; AD B4 2B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_351
; Address: $D2A84A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_351:
	JSL $C42F5E		  ; 22 5E 2F C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $BE77			; 8D 77 BE | Audio system operation
	LDA $2BB6			; AD B6 2B | Audio system operation
	STA $BE7D			; 8D 7D BE | Audio system operation
	LDA				  ; BF F1 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_352
; Address: $D2A85E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_352:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $BE7D			; 8D 7D BE | Audio system operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_353
; Address: $D2A867
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_353:
	LDA $BE7D			; AD 7D BE | Audio system operation
	PHA				  ; 48 | Push accumulator to stack
	LDX $33E8			; AE E8 33 | Load from absolute address into X register
	LDA				  ; BF 01 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_354
; Address: $D2A872
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_354:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	LDA $2BB2			; AD B2 2B | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDA $2BB4			; AD B4 2B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_356
; Address: $D2A883
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_356:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA $BE77			; 8D 77 BE | Audio system operation
	LDA $2BB6			; AD B6 2B | Audio system operation
	STA $BE7D			; 8D 7D BE | Audio system operation
	LDA				  ; BF F9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_357
; Address: $D2A893
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_357:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	LDA $2BB8			; AD B8 2B | Audio system operation
	STA $BE7F			; 8D 7F BE | Audio system operation
	LDA				  ; BF FD 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_358
; Address: $D2A8A1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_358:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $BE7D			; 8D 7D BE | Audio system operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_35A
; Address: $D2A8AE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_35A:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C5 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_35B
; Address: $D2A8B9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_35B:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_35D
; Address: $D2A8CC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_35D:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF CD 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_35E
; Address: $D2A8D7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_35E:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF D1 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_35F
; Address: $D2A8E2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_35F:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF D5 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_360
; Address: $D2A8ED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_360:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF D9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_361
; Address: $D2A8F8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_361:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_364
; Address: $D2A90F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_364:
	JSR $27C4			; 20 C4 27 | Jump to subroutine
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_365
; Address: $D2A919
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_365:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2907			; 4C 07 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_366
; Address: $D2A924
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_366:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2954			; 4C 54 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_369
; Address: $D2A93A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_369:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2907			; 4C 07 29 | Jump to address
	LDA				  ; BF 81 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_36A
; Address: $D2A945
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_36A:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2907			; 4C 07 29 | Jump to address
	LDA				  ; BF 81 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_36E
; Address: $D2A963
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_36E:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 81 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_372
; Address: $D2A981
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_372:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_375
; Address: $D2A99C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_375:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_377
; Address: $D2A9AF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_377:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2998			; 4C 98 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_379
; Address: $D2A9C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_379:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_37A
; Address: $D2A9CD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_37A:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $29BE			; 4C BE 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_37C
; Address: $D2A9E0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_37C:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_37F
; Address: $D2A9F3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_37F:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_381
; Address: $D2AA06
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_381:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_383
; Address: $D2AA19
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_383:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_385
; Address: $D2AA2C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_385:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_387
; Address: $D2AA3F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_387:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_389
; Address: $D2AA52
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_389:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_38B
; Address: $D2AA65
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_38B:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_38D
; Address: $D2AA78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_38D:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 7D 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_38F
; Address: $D2AA8B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_38F:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_395
; Address: $D2AAB9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_395:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_397
; Address: $D2AACC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_397:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_399
; Address: $D2AADF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_399:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $295C			; 4C 5C 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_39D
; Address: $D2AAFD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_39D:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3A1
; Address: $D2AB1B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3A1:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3A3
; Address: $D2AB2E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3A3:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3A5
; Address: $D2AB41
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3A5:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3A7
; Address: $D2AB54
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3A7:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3AD
; Address: $D2AB82
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3AD:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $297A			; 4C 7A 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3AF
; Address: $D2AB95
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3AF:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $297A			; 4C 7A 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3B1
; Address: $D2ABA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3B1:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $295C			; 4C 5C 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3B3
; Address: $D2ABBB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3B3:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $295C			; 4C 5C 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3B5
; Address: $D2ABCE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3B5:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF BD 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3B6
; Address: $D2ABD9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3B6:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3B9
; Address: $D2ABF4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3B9:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3BC
; Address: $D2AC0F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3BC:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3BF
; Address: $D2AC2A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3BF:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3C2
; Address: $D2AC45
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3C2:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3C4
; Address: $D2AC58
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3C4:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3C6
; Address: $D2AC6B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3C6:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3C8
; Address: $D2AC7E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3C8:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2998			; 4C 98 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3CA
; Address: $D2AC91
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3CA:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3CC
; Address: $D2ACA4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3CC:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3CE
; Address: $D2ACB7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3CE:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2998			; 4C 98 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3D0
; Address: $D2ACCA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3D0:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $29BE			; 4C BE 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3D2
; Address: $D2ACDD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3D2:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2998			; 4C 98 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3D4
; Address: $D2ACF0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3D4:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2998			; 4C 98 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3D6
; Address: $D2AD03
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3D6:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2998			; 4C 98 29 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3D8
; Address: $D2AD16
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3D8:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3DA
; Address: $D2AD29
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3DA:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3DC
; Address: $D2AD3C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3DC:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3DE
; Address: $D2AD4F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3DE:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 71 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3DF
; Address: $D2AD5A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3DF:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 31 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3E0
; Address: $D2AD65
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3E0:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 49 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3E1
; Address: $D2AD70
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3E1:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 05 27 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3E2
; Address: $D2AD7B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3E2:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3E4
; Address: $D2AD8E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3E4:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3E9
; Address: $D2ADB4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3E9:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3EB
; Address: $D2ADC7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3EB:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 71 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3ED
; Address: $D2ADDA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3ED:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3EF
; Address: $D2ADED
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3EF:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3F1
; Address: $D2AE00
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3F1:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 89 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3F2
; Address: $D2AE0B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3F2:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3F5
; Address: $D2AE26
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3F5:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 75 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3F8
; Address: $D2AE41
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3F8:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $295C			; 4C 5C 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3F9
; Address: $D2AE4C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3F9:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2A15			; 4C 15 2A | Jump to address
	LDA				  ; BF 85 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3FE
; Address: $D2AE72
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3FE:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF 81 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_3FF
; Address: $D2AE7D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_3FF:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2A15			; 4C 15 2A | Jump to address
	LDA				  ; BF 7D 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_400
; Address: $D2AE88
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_400:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2A15			; 4C 15 2A | Jump to address
	LDA				  ; BF 7D 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_402
; Address: $D2AE9B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_402:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 79 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_403
; Address: $D2AEA6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_403:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2A15			; 4C 15 2A | Jump to address
	LDA				  ; BF 7D 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_405
; Address: $D2AEB9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_405:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF 7D 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_406
; Address: $D2AEC4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_406:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2A61			; 4C 61 2A | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_408
; Address: $D2AED7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_408:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_40A
; Address: $D2AEEA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_40A:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_40C
; Address: $D2AEFD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_40C:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_40E
; Address: $D2AF10
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_40E:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_411
; Address: $D2AF23
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_411:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_413
; Address: $D2AF36
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_413:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_415
; Address: $D2AF49
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_415:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_417
; Address: $D2AF5C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_417:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_419
; Address: $D2AF6F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_419:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_41B
; Address: $D2AF82
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_41B:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_41D
; Address: $D2AF95
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_41D:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_41F
; Address: $D2AFA8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_41F:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2772			; 4C 72 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_423
; Address: $D2AFCB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_423:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $277A			; 4C 7A 27 | Jump to address
	LDA				  ; BF C1 26 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_425
; Address: $D2AFDE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_425:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $2FBF			; 4C BF 2F | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_428
; Address: $D2AFF9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_428:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_42B
; Address: $D2B014
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_42B:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_42E
; Address: $D2B02F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_42E:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_431
; Address: $D2B04A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_431:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_434
; Address: $D2B065
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_434:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_436
; Address: $D2B078
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_436:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_438
; Address: $D2B08B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_438:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_43A
; Address: $D2B09E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_43A:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_43C
; Address: $D2B0B1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_43C:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_43E
; Address: $D2B0C4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_43E:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_440
; Address: $D2B0D7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_440:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_442
; Address: $D2B0EA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_442:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_444
; Address: $D2B0FD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_444:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $290F			; 4C 0F 29 | Jump to address
	LDA				  ; BF B9 25 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_446
; Address: $D2B110
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_446:
	JSL $C1A95A		  ; 22 5A A9 C1 | Jump to subroutine long
	JMP $295C			; 4C 5C 29 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_448
; Address: $D2B12A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_448:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	LSR $220B,X		  ; 5E 0B 22 | Logical shift right (absolute,X)
	EOR $C3			  ; 45 C3 | Exclusive OR with accumulator (zero page)
	LDA #$18			 ; A9 18 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_44C
; Address: $D2B146
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_44C:
	JSL $C3C759		  ; 22 59 C7 C3 | Jump to subroutine long
	LDA #$34			 ; A9 34 | Audio system operation
	JMP $3153			; 4C 53 31 | Jump to address
	LDA #$0C			 ; A9 0C | Audio system operation
	STA $33BA			; 8D BA 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_44F
; Address: $D2B161
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_44F:
	JSL $C908F0		  ; 22 F0 08 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $001B,X		  ; 7E 1B 00 | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_451
; Address: $D2B171
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_451:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	PEA #$3688		   ; F4 88 36 | Push effective address to stack
	PEA #$000F		   ; F4 0F 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_453
; Address: $D2B187
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_453:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	ROL $E9B0,X		  ; 3E B0 E9 | Rotate left (absolute,X)
	PEA #$3688		   ; F4 88 36 | Push effective address to stack
	PEA #$000F		   ; F4 0F 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_457
; Address: $D2B1A9
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_457:
	PLA				  ; 68 | Pull accumulator from stack
	STZ $BE83			; 9C 83 BE | Store zero to absolute
	STA $BE81			; 8D 81 BE | Audio system operation
	INC $BE81			; EE 81 BE | Increment (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PEA #$3688		   ; F4 88 36 | Push effective address to stack
	PEA #$01F0		   ; F4 F0 01 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_458
; Address: $D2B1BE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_458:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	STA $33BA			; 8D BA 33 | Audio system operation
	LDA				  ; BF 8B 32 C9 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_459
; Address: $D2B1C9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_459:
	JSL $C3165B		  ; 22 5B 16 C3 | Jump to subroutine long
	BCS $E6			  ; B0 E6 | Branch if carry set
	PEA #$3688		   ; F4 88 36 | Push effective address to stack
	PEA #$01F0		   ; F4 F0 01 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_45B
; Address: $D2B1DC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_45B:
	STZ $BE87			; 9C 87 BE | Store zero to absolute
	STA $BE85			; 8D 85 BE | Audio system operation
	INC $BE85			; EE 85 BE | Increment (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_45C
; Address: $D2B1E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_45C:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	LDA #$21			 ; A9 21 | PPU graphics register access
	STA $BE77			; 8D 77 BE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_45D
; Address: $D2B1EF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_45D:
	JSL $C1BA53		  ; 22 53 BA C1 | Jump to subroutine long
	STA $362E			; 8D 2E 36 | Audio system operation
	DEC				  ; 3A | Decrement accumulator
	PHA				  ; 48 | Push accumulator to stack
	LDA #$0B			 ; A9 0B | Audio system operation
	SEC				  ; 38 | Set carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	STA $3630			; 8D 30 36 | Audio system operation
	PHX				  ; DA | Push X register to stack
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_45E
; Address: $D2B209
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_45E:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BPL $F2			  ; 10 F2 | Branch if positive
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_463
; Address: $D2B23A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_463:
	JSL $C1A988		  ; 22 88 A9 C1 | Jump to subroutine long
	ADC ($0B,X)		  ; 61 0B | Add with carry ((zero page,X))
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $BE85			; AD 85 BE | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	LDA $BE81			; AD 81 BE | Audio system operation
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank24_AudioFunction_465
; Address: $D2B24F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_465:
	JSL $C93311		  ; 22 11 33 C9 | Jump to subroutine long
	STA $BE77			; 8D 77 BE | Audio system operation
	LDA #$03			 ; A9 03 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_468
; Address: $D2B264
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_468:
	JSL $C322C6		  ; 22 C6 22 C3 | Jump to subroutine long
	BCS $1D			  ; B0 1D | Branch if carry set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $18			  ; D0 18 | Branch if not equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_46B
; Address: $D2B27C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_46B:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_46C
; Address: $D2B288
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_46C:
	JMP $3123			; 4C 23 31 | Jump to address
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $7C			  ; 85 7C | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $7E			  ; 85 7E | Audio system operation
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCS $46			  ; B0 46 | Branch if carry set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_46D
; Address: $D2B2C5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_46D:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $7C			  ; C5 7C | Compare accumulator (zero page)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDY #$03			 ; A0 03 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $7E			  ; C5 7E | Compare accumulator (zero page)
	BCC $18			  ; 90 18 | Branch if carry clear
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_46E
; Address: $D2B2EC
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_46E:
	SEI				  ; 78 | Set interrupt disable flag
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $7C			  ; C5 7C | Compare accumulator (zero page)
	BNE $CB			  ; D0 CB | Branch if not equal
	LDY #$05			 ; A0 05 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP $7E			  ; C5 7E | Compare accumulator (zero page)
	BCC $BF			  ; 90 BF | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $AB			  ; 06 AB | Arithmetic shift left (zero page)
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_46F
; Address: $D2B30B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_46F:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	JMP $3300			; 4C 00 33 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_470
; Address: $D2B31E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_470:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	ASL $AB			  ; 06 AB | Arithmetic shift left (zero page)
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_472
; Address: $D2B33B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_472:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_473
; Address: $D2B343
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_473:
	LDA $33D4			; AD D4 33 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_474
; Address: $D2B34B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_474:
	LDA #$00			 ; A9 00 | Audio system operation
	STA $33D6			; 8D D6 33 | Audio system operation
	LDA #$1B			 ; A9 1B | Audio system operation
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	STA $33CE			; 8D CE 33 | Audio system operation
	JMP $3365			; 4C 65 33 | Jump to address
	STZ $33D6			; 9C D6 33 | Store zero to absolute
	LDA #$02			 ; A9 02 | Audio system operation
	STA $33CE			; 8D CE 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_476
; Address: $D2B369
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_476:
	JSL $C9724B		  ; 22 4B 72 C9 | Jump to subroutine long
	LDA #$26			 ; A9 26 | Audio system operation
	STA $33D0			; 8D D0 33 | Audio system operation
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	LDA $33D4			; AD D4 33 | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $30			  ; F0 30 | Branch if equal
	LDA $7FBA			; AD BA 7F | Audio system operation
	STA $33C2			; 8D C2 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$33			 ; 09 33 | Logical OR with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Audio system operation
	LDA $7FBC			; AD BC 7F | Audio system operation
	STA $33C4			; 8D C4 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$33			 ; 09 33 | Logical OR with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Audio system operation
	LDA $7FBE			; AD BE 7F | Audio system operation
	STA $33C6			; 8D C6 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Audio system operation
	JMP $33DB			; 4C DB 33 | Jump to address
	LDA $7FBA			; AD BA 7F | Audio system operation
	STA $33C2			; 8D C2 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Audio system operation
	LDA $7FBC			; AD BC 7F | Audio system operation
	STA $33C4			; 8D C4 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Audio system operation
	LDA $7FBE			; AD BE 7F | Audio system operation
	STA $33C6			; 8D C6 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Audio system operation
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_477
; Address: $D2B3DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_477:
	SBC $65A9			; ED A9 65 | Subtract with carry (absolute)
	INC $7322			; EE 22 73 | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_478
; Address: $D2B3E7
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_478:
	LDA $33C2			; AD C2 33 | Audio system operation
	STA $7FBA			; 8D BA 7F | Audio system operation
	LDA $33C4			; AD C4 33 | Audio system operation
	STA $7FBC			; 8D BC 7F | Audio system operation
	LDA $33C6			; AD C6 33 | Audio system operation
	STA $7FBE			; 8D BE 7F | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_479
; Address: $D2B3FA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_479:
	DEC $33D0			; CE D0 33 | Decrement (absolute)
	BPL $07			  ; 10 07 | Branch if positive
	LDA #$01			 ; A9 01 | Audio system operation
	STA $33C0			; 8D C0 33 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_47A
; Address: $D2B406
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_47A:
	LDA $33D4			; AD D4 33 | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $65			  ; F0 65 | Branch if equal
	LDX #$9E			 ; A2 9E | Load immediate value into X register
	ORA ($BD,X)		  ; 01 BD | Logical OR with accumulator ((zero page,X))
	ADC $EE			  ; 65 EE | Add with carry (zero page)
	STA $EE85,X		  ; 9D 85 EE | Audio system operation
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCS $F3			  ; B0 F3 | Branch if carry set
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA $EE65,X		  ; BD 65 EE | Audio system operation
	STA $EE45,X		  ; 9D 45 EE | Audio system operation
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA $33CE			; AD CE 33 | Audio system operation
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_47B
; Address: $D2B434
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_47B:
	JSL $C010B4		  ; 22 B4 10 C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA				  ; BF 9F B3 C9 | Load from absolute long,X into accumulator
	STA $EF35,Y		  ; 99 35 EF | Audio system operation
	STA $EF45,Y		  ; 99 45 EF | Audio system operation
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_47C
; Address: $D2B452
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_47C:
	LDA				  ; BF 9F B3 C9 | Load from absolute long,X into accumulator
	STA $EF25,Y		  ; 99 25 EF | Audio system operation
	STA $EF55,Y		  ; 99 55 EF | Audio system operation
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	LDA $33CE			; AD CE 33 | Audio system operation
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	BPL $03			  ; 10 03 | Branch if positive
	LDA #$00			 ; A9 00 | Audio system operation
	STA $33CE			; 8D CE 33 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_47D
; Address: $D2B473
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_47D:
	LDX #$CE			 ; A2 CE | Load immediate value into X register
	LDA $EE65,X		  ; BD 65 EE | Audio system operation
	STA $EE75,X		  ; 9D 75 EE | Audio system operation
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F6			  ; 10 F6 | Branch if positive
	LDX #$F0			 ; A2 F0 | Load immediate value into X register
	LDA $EE65,X		  ; BD 65 EE | Audio system operation
	STA $EE55,X		  ; 9D 55 EE | Audio system operation
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA $33CE			; AD CE 33 | Audio system operation
	LDX #$10			 ; A2 10 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_47E
; Address: $D2B496
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_47E:
	JSL $C010B4		  ; 22 B4 10 C0 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA				  ; BF 9F B3 C9 | Load from absolute long,X into accumulator
	STA $EE65,Y		  ; 99 65 EE | Audio system operation
	STA $F013,Y		  ; 99 13 F0 | Audio system operation
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	LDA $33CE			; AD CE 33 | Audio system operation
	INC				  ; 1A | Increment accumulator
	CMP #$1B			 ; C9 1B | Compare accumulator (immediate)
	BCC $04			  ; 90 04 | Branch if carry clear
	LDA #$1B			 ; A9 1B | Audio system operation
	DEC				  ; 3A | Decrement accumulator
	STA $33CE			; 8D CE 33 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_480
; Address: $D2B4C2
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_480:
	LDX $6F7C			; AE 7C 6F | Load from absolute address into X register
	CMP #$6F			 ; C9 6F | Compare accumulator (immediate)
	LDA $630E			; AD 0E 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $35B4			; 4C B4 35 | Jump to address
	LDA $640D			; AD 0D 64 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $650D			; AD 0D 65 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B0F			; AD 0F 6B | Audio system operation
	LDY $698E			; AC 8E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_481
; Address: $D2B4E0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_481:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E0E			; AD 0E 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C8E			; AD 8E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_482
; Address: $D2B4F0
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_482:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $640C			; AD 0C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $660C			; 6D 0C 66 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $640C			; 8D 0C 64 | Audio system operation
	LDA $640E			; AD 0E 64 | Audio system operation
	ADC $660E			; 6D 0E 66 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $640E			; 8D 0E 64 | Audio system operation
	LDA $650C			; AD 0C 65 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $670C			; 6D 0C 67 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $650C			; 8D 0C 65 | Audio system operation
	LDA $650E			; AD 0E 65 | Audio system operation
	ADC $670E			; 6D 0E 67 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $650E			; 8D 0E 65 | Audio system operation
	LDA $698E			; AD 8E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A0E			; 6D 0E 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $630E			; 9C 0E 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $353B			; 4C 3B 35 | Jump to address
	STA $698E			; 8D 8E 69 | Audio system operation
	LDA $6B0E			; AD 0E 6B | Audio system operation
	ADC $6B8E			; 6D 8E 6B | Add with carry (absolute)
	STA $6B0E			; 8D 0E 6B | Audio system operation
	LDA $6C8E			; AD 8E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_483
; Address: $D2B547
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_483:
	CLC				  ; 18 | Clear carry flag
	ADC $6D0E			; 6D 0E 6D | Add with carry (absolute)
	STA $6C8E			; 8D 8E 6C | Audio system operation
	LDA $6E0E			; AD 0E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E8E			; 6D 8E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F0E			; 9C 0E 6F | Store zero to absolute
	STZ $6E8E			; 9C 8E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3567			; 4C 67 35 | Jump to address
	STA $6E0E			; 8D 0E 6E | Audio system operation
	LDA $660C			; AD 0C 66 | Audio system operation
	ADC $680C			; 6D 0C 68 | Add with carry (absolute)
	STA $660C			; 8D 0C 66 | Audio system operation
	LDA $660E			; AD 0E 66 | Audio system operation
	ADC $680E			; 6D 0E 68 | Add with carry (absolute)
	STA $660E			; 8D 0E 66 | Audio system operation
	LDA $670C			; AD 0C 67 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $690C			; 6D 0C 69 | Add with carry (absolute)
	STA $670C			; 8D 0C 67 | Audio system operation
	LDA $670E			; AD 0E 67 | Audio system operation
	ADC $690E			; 6D 0E 69 | Add with carry (absolute)
	STA $670E			; 8D 0E 67 | Audio system operation
	LDA $6A0E			; AD 0E 6A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A8E			; 6D 8E 6A | Add with carry (absolute)
	STA $6A0E			; 8D 0E 6A | Audio system operation
	LDA $6B8E			; AD 8E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C0E			; 6D 0E 6C | Add with carry (absolute)
	STA $6B8E			; 8D 8E 6B | Audio system operation
	LDA $6D0E			; AD 0E 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D8E			; 6D 8E 6D | Add with carry (absolute)
	STA $6D0E			; 8D 0E 6D | Audio system operation
	LDA $6E8E			; AD 8E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F0E			; 6D 0E 6F | Add with carry (absolute)
	STA $6E8E			; 8D 8E 6E | Audio system operation
	LDA $630C			; AD 0C 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $36A0			; 4C A0 36 | Jump to address
	LDA $6409			; AD 09 64 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6509			; AD 09 65 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B0D			; AD 0D 6B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_485
; Address: $D2B5CC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_485:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E0C			; AD 0C 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C8C			; AD 8C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_486
; Address: $D2B5DC
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_486:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6408			; AD 08 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6608			; 6D 08 66 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6408			; 8D 08 64 | Audio system operation
	LDA $640A			; AD 0A 64 | Audio system operation
	ADC $660A			; 6D 0A 66 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $640A			; 8D 0A 64 | Audio system operation
	LDA $6508			; AD 08 65 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6708			; 6D 08 67 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6508			; 8D 08 65 | Audio system operation
	LDA $650A			; AD 0A 65 | Audio system operation
	ADC $670A			; 6D 0A 67 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $650A			; 8D 0A 65 | Audio system operation
	LDA $698C			; AD 8C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A0C			; 6D 0C 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $630C			; 9C 0C 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3627			; 4C 27 36 | Jump to address
	STA $698C			; 8D 8C 69 | Audio system operation
	LDA $6B0C			; AD 0C 6B | Audio system operation
	ADC $6B8C			; 6D 8C 6B | Add with carry (absolute)
	STA $6B0C			; 8D 0C 6B | Audio system operation
	LDA $6C8C			; AD 8C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D0C			; 6D 0C 6D | Add with carry (absolute)
	STA $6C8C			; 8D 8C 6C | Audio system operation
	LDA $6E0C			; AD 0C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E8C			; 6D 8C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F0C			; 9C 0C 6F | Store zero to absolute
	STZ $6E8C			; 9C 8C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_487
; Address: $D2B64D
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_487:
	JMP $3653			; 4C 53 36 | Jump to address
	STA $6E0C			; 8D 0C 6E | Audio system operation
	LDA $6608			; AD 08 66 | Audio system operation
	ADC $6808			; 6D 08 68 | Add with carry (absolute)
	STA $6608			; 8D 08 66 | Audio system operation
	LDA $660A			; AD 0A 66 | Audio system operation
	ADC $680A			; 6D 0A 68 | Add with carry (absolute)
	STA $660A			; 8D 0A 66 | Audio system operation
	LDA $6708			; AD 08 67 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6908			; 6D 08 69 | Add with carry (absolute)
	STA $6708			; 8D 08 67 | Audio system operation
	LDA $670A			; AD 0A 67 | Audio system operation
	ADC $690A			; 6D 0A 69 | Add with carry (absolute)
	STA $670A			; 8D 0A 67 | Audio system operation
	LDA $6A0C			; AD 0C 6A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A8C			; 6D 8C 6A | Add with carry (absolute)
	STA $6A0C			; 8D 0C 6A | Audio system operation
	LDA $6B8C			; AD 8C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C0C			; 6D 0C 6C | Add with carry (absolute)
	STA $6B8C			; 8D 8C 6B | Audio system operation
	LDA $6D0C			; AD 0C 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D8C			; 6D 8C 6D | Add with carry (absolute)
	STA $6D0C			; 8D 0C 6D | Audio system operation
	LDA $6E8C			; AD 8C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F0C			; 6D 0C 6F | Add with carry (absolute)
	STA $6E8C			; 8D 8C 6E | Audio system operation
	LDA $630A			; AD 0A 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $378C			; 4C 8C 37 | Jump to address
	LDA $6405			; AD 05 64 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6505			; AD 05 65 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B0B			; AD 0B 6B | Audio system operation
	LDY $698A			; AC 8A 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_488
; Address: $D2B6B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_488:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E0A			; AD 0A 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C8A			; AD 8A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_489
; Address: $D2B6C8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_489:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6404			; AD 04 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6604			; 6D 04 66 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_48A
; Address: $D2B6D2
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_48A:
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6404			; 8D 04 64 | Audio system operation
	LDA $6406			; AD 06 64 | Audio system operation
	ADC $6606			; 6D 06 66 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6406			; 8D 06 64 | Audio system operation
	LDA $6504			; AD 04 65 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6704			; 6D 04 67 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6504			; 8D 04 65 | Audio system operation
	LDA $6506			; AD 06 65 | Audio system operation
	ADC $6706			; 6D 06 67 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6506			; 8D 06 65 | Audio system operation
	LDA $698A			; AD 8A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A0A			; 6D 0A 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $630A			; 9C 0A 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3713			; 4C 13 37 | Jump to address
	STA $698A			; 8D 8A 69 | Audio system operation
	LDA $6B0A			; AD 0A 6B | Audio system operation
	ADC $6B8A			; 6D 8A 6B | Add with carry (absolute)
	STA $6B0A			; 8D 0A 6B | Audio system operation
	LDA $6C8A			; AD 8A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D0A			; 6D 0A 6D | Add with carry (absolute)
	STA $6C8A			; 8D 8A 6C | Audio system operation
	LDA $6E0A			; AD 0A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E8A			; 6D 8A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F0A			; 9C 0A 6F | Store zero to absolute
	STZ $6E8A			; 9C 8A 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $373F			; 4C 3F 37 | Jump to address
	STA $6E0A			; 8D 0A 6E | Audio system operation
	LDA $6604			; AD 04 66 | Audio system operation
	ADC $6804			; 6D 04 68 | Add with carry (absolute)
	STA $6604			; 8D 04 66 | Audio system operation
	LDA $6606			; AD 06 66 | Audio system operation
	ADC $6806			; 6D 06 68 | Add with carry (absolute)
	STA $6606			; 8D 06 66 | Audio system operation
	LDA $6704			; AD 04 67 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6904			; 6D 04 69 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_48B
; Address: $D2B758
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_48B:
	STA $6704			; 8D 04 67 | Audio system operation
	LDA $6706			; AD 06 67 | Audio system operation
	ADC $6906			; 6D 06 69 | Add with carry (absolute)
	STA $6706			; 8D 06 67 | Audio system operation
	LDA $6A0A			; AD 0A 6A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A8A			; 6D 8A 6A | Add with carry (absolute)
	STA $6A0A			; 8D 0A 6A | Audio system operation
	LDA $6B8A			; AD 8A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C0A			; 6D 0A 6C | Add with carry (absolute)
	STA $6B8A			; 8D 8A 6B | Audio system operation
	LDA $6D0A			; AD 0A 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D8A			; 6D 8A 6D | Add with carry (absolute)
	STA $6D0A			; 8D 0A 6D | Audio system operation
	LDA $6E8A			; AD 8A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F0A			; 6D 0A 6F | Add with carry (absolute)
	STA $6E8A			; 8D 8A 6E | Audio system operation
	LDA $6308			; AD 08 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3878			; 4C 78 38 | Jump to address
	LDA $6401			; AD 01 64 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6501			; AD 01 65 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B09			; AD 09 6B | Audio system operation
	LDY $6988			; AC 88 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_48C
; Address: $D2B7A4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_48C:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E08			; AD 08 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C88			; AD 88 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_48D
; Address: $D2B7B4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_48D:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6400			; AD 00 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6600			; 6D 00 66 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6400			; 8D 00 64 | Audio system operation
	LDA $6402			; AD 02 64 | Audio system operation
	ADC $6602			; 6D 02 66 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6402			; 8D 02 64 | Audio system operation
	LDA $6500			; AD 00 65 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6700			; 6D 00 67 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6500			; 8D 00 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_48E
; Address: $D2B7DD
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_48E:
	LDA $6502			; AD 02 65 | Audio system operation
	ADC $6702			; 6D 02 67 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6502			; 8D 02 65 | Audio system operation
	LDA $6988			; AD 88 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A08			; 6D 08 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6308			; 9C 08 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $37FF			; 4C FF 37 | Jump to address
	STA $6988			; 8D 88 69 | Audio system operation
	LDA $6B08			; AD 08 6B | Audio system operation
	ADC $6B88			; 6D 88 6B | Add with carry (absolute)
	STA $6B08			; 8D 08 6B | Audio system operation
	LDA $6C88			; AD 88 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D08			; 6D 08 6D | Add with carry (absolute)
	STA $6C88			; 8D 88 6C | Audio system operation
	LDA $6E08			; AD 08 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E88			; 6D 88 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F08			; 9C 08 6F | Store zero to absolute
	STZ $6E88			; 9C 88 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $382B			; 4C 2B 38 | Jump to address
	STA $6E08			; 8D 08 6E | Audio system operation
	LDA $6600			; AD 00 66 | Audio system operation
	ADC $6800			; 6D 00 68 | Add with carry (absolute)
	STA $6600			; 8D 00 66 | Audio system operation
	LDA $6602			; AD 02 66 | Audio system operation
	ADC $6802			; 6D 02 68 | Add with carry (absolute)
	STA $6602			; 8D 02 66 | Audio system operation
	LDA $6700			; AD 00 67 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6900			; 6D 00 69 | Add with carry (absolute)
	STA $6700			; 8D 00 67 | Audio system operation
	LDA $6702			; AD 02 67 | Audio system operation
	ADC $6902			; 6D 02 69 | Add with carry (absolute)
	STA $6702			; 8D 02 67 | Audio system operation
	LDA $6A08			; AD 08 6A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A88			; 6D 88 6A | Add with carry (absolute)
	STA $6A08			; 8D 08 6A | Audio system operation
	LDA $6B88			; AD 88 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C08			; 6D 08 6C | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_48F
; Address: $D2B861
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_48F:
	STA $6B88			; 8D 88 6B | Audio system operation
	LDA $6D08			; AD 08 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D88			; 6D 88 6D | Add with carry (absolute)
	STA $6D08			; 8D 08 6D | Audio system operation
	LDA $6E88			; AD 88 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F08			; 6D 08 6F | Add with carry (absolute)
	STA $6E88			; 8D 88 6E | Audio system operation
	LDA $6306			; AD 06 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3964			; 4C 64 39 | Jump to address
	LDA $63FD			; AD FD 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64FD			; AD FD 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B07			; AD 07 6B | Audio system operation
	LDY $6986			; AC 86 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_490
; Address: $D2B890
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_490:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E06			; AD 06 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C86			; AD 86 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_491
; Address: $D2B8A0
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_491:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63FC			; AD FC 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65FC			; 6D FC 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63FC			; 8D FC 63 | Audio system operation
	LDA $63FE			; AD FE 63 | Audio system operation
	ADC $65FE			; 6D FE 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63FE			; 8D FE 63 | Audio system operation
	LDA $64FC			; AD FC 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66FC			; 6D FC 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64FC			; 8D FC 64 | Audio system operation
	LDA $64FE			; AD FE 64 | Audio system operation
	ADC $66FE			; 6D FE 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64FE			; 8D FE 64 | Audio system operation
	LDA $6986			; AD 86 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A06			; 6D 06 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6306			; 9C 06 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_492
; Address: $D2B8E5
; Size: 131 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_492:
	JMP $38EB			; 4C EB 38 | Jump to address
	STA $6986			; 8D 86 69 | Audio system operation
	LDA $6B06			; AD 06 6B | Audio system operation
	ADC $6B86			; 6D 86 6B | Add with carry (absolute)
	STA $6B06			; 8D 06 6B | Audio system operation
	LDA $6C86			; AD 86 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D06			; 6D 06 6D | Add with carry (absolute)
	STA $6C86			; 8D 86 6C | Audio system operation
	LDA $6E06			; AD 06 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E86			; 6D 86 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F06			; 9C 06 6F | Store zero to absolute
	STZ $6E86			; 9C 86 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3917			; 4C 17 39 | Jump to address
	STA $6E06			; 8D 06 6E | Audio system operation
	LDA $65FC			; AD FC 65 | Audio system operation
	ADC $67FC			; 6D FC 67 | Add with carry (absolute)
	STA $65FC			; 8D FC 65 | Audio system operation
	LDA $65FE			; AD FE 65 | Audio system operation
	ADC $67FE			; 6D FE 67 | Add with carry (absolute)
	STA $65FE			; 8D FE 65 | Audio system operation
	LDA $66FC			; AD FC 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68FC			; 6D FC 68 | Add with carry (absolute)
	STA $66FC			; 8D FC 66 | Audio system operation
	LDA $66FE			; AD FE 66 | Audio system operation
	ADC $68FE			; 6D FE 68 | Add with carry (absolute)
	STA $66FE			; 8D FE 66 | Audio system operation
	LDA $6A06			; AD 06 6A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A86			; 6D 86 6A | Add with carry (absolute)
	STA $6A06			; 8D 06 6A | Audio system operation
	LDA $6B86			; AD 86 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C06			; 6D 06 6C | Add with carry (absolute)
	STA $6B86			; 8D 86 6B | Audio system operation
	LDA $6D06			; AD 06 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D86			; 6D 86 6D | Add with carry (absolute)
	STA $6D06			; 8D 06 6D | Audio system operation
	LDA $6E86			; AD 86 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F06			; 6D 06 6F | Add with carry (absolute)
	STA $6E86			; 8D 86 6E | Audio system operation
	LDA $6304			; AD 04 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_493
; Address: $D2B969
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_493:
	JMP $3A50			; 4C 50 3A | Jump to address
	LDA $63F9			; AD F9 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64F9			; AD F9 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B05			; AD 05 6B | Audio system operation
	LDY $6984			; AC 84 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_494
; Address: $D2B97C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_494:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E04			; AD 04 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C84			; AD 84 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_495
; Address: $D2B98C
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_495:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63F8			; AD F8 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65F8			; 6D F8 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63F8			; 8D F8 63 | Audio system operation
	LDA $63FA			; AD FA 63 | Audio system operation
	ADC $65FA			; 6D FA 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63FA			; 8D FA 63 | Audio system operation
	LDA $64F8			; AD F8 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66F8			; 6D F8 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64F8			; 8D F8 64 | Audio system operation
	LDA $64FA			; AD FA 64 | Audio system operation
	ADC $66FA			; 6D FA 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64FA			; 8D FA 64 | Audio system operation
	LDA $6984			; AD 84 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A04			; 6D 04 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6304			; 9C 04 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $39D7			; 4C D7 39 | Jump to address
	STA $6984			; 8D 84 69 | Audio system operation
	LDA $6B04			; AD 04 6B | Audio system operation
	ADC $6B84			; 6D 84 6B | Add with carry (absolute)
	STA $6B04			; 8D 04 6B | Audio system operation
	LDA $6C84			; AD 84 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D04			; 6D 04 6D | Add with carry (absolute)
	STA $6C84			; 8D 84 6C | Audio system operation
	LDA $6E04			; AD 04 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_496
; Address: $D2B9EE
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_496:
	ADC $6E84			; 6D 84 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F04			; 9C 04 6F | Store zero to absolute
	STZ $6E84			; 9C 84 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3A03			; 4C 03 3A | Jump to address
	STA $6E04			; 8D 04 6E | Audio system operation
	LDA $65F8			; AD F8 65 | Audio system operation
	ADC $67F8			; 6D F8 67 | Add with carry (absolute)
	STA $65F8			; 8D F8 65 | Audio system operation
	LDA $65FA			; AD FA 65 | Audio system operation
	ADC $67FA			; 6D FA 67 | Add with carry (absolute)
	STA $65FA			; 8D FA 65 | Audio system operation
	LDA $66F8			; AD F8 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68F8			; 6D F8 68 | Add with carry (absolute)
	STA $66F8			; 8D F8 66 | Audio system operation
	LDA $66FA			; AD FA 66 | Audio system operation
	ADC $68FA			; 6D FA 68 | Add with carry (absolute)
	STA $66FA			; 8D FA 66 | Audio system operation
	LDA $6A04			; AD 04 6A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A84			; 6D 84 6A | Add with carry (absolute)
	STA $6A04			; 8D 04 6A | Audio system operation
	LDA $6B84			; AD 84 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C04			; 6D 04 6C | Add with carry (absolute)
	STA $6B84			; 8D 84 6B | Audio system operation
	LDA $6D04			; AD 04 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D84			; 6D 84 6D | Add with carry (absolute)
	STA $6D04			; 8D 04 6D | Audio system operation
	LDA $6E84			; AD 84 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F04			; 6D 04 6F | Add with carry (absolute)
	STA $6E84			; 8D 84 6E | Audio system operation
	LDA $6302			; AD 02 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3B3C			; 4C 3C 3B | Jump to address
	LDA $63F5			; AD F5 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64F5			; AD F5 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B03			; AD 03 6B | Audio system operation
	LDY $6982			; AC 82 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_497
; Address: $D2BA68
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_497:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E02			; AD 02 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_499
; Address: $D2BA78
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_499:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63F4			; AD F4 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65F4			; 6D F4 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63F4			; 8D F4 63 | Audio system operation
	LDA $63F6			; AD F6 63 | Audio system operation
	ADC $65F6			; 6D F6 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63F6			; 8D F6 63 | Audio system operation
	LDA $64F4			; AD F4 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66F4			; 6D F4 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64F4			; 8D F4 64 | Audio system operation
	LDA $64F6			; AD F6 64 | Audio system operation
	ADC $66F6			; 6D F6 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64F6			; 8D F6 64 | Audio system operation
	LDA $6982			; AD 82 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A02			; 6D 02 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6302			; 9C 02 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3AC3			; 4C C3 3A | Jump to address
	STA $6982			; 8D 82 69 | Audio system operation
	LDA $6B02			; AD 02 6B | Audio system operation
	ADC $6B82			; 6D 82 6B | Add with carry (absolute)
	STA $6B02			; 8D 02 6B | Audio system operation
	LDA $6C82			; AD 82 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D02			; 6D 02 6D | Add with carry (absolute)
	STA $6C82			; 8D 82 6C | Audio system operation
	LDA $6E02			; AD 02 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E82			; 6D 82 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F02			; 9C 02 6F | Store zero to absolute
	STZ $6E82			; 9C 82 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3AEF			; 4C EF 3A | Jump to address
	STA $6E02			; 8D 02 6E | Audio system operation
	LDA $65F4			; AD F4 65 | Audio system operation
	ADC $67F4			; 6D F4 67 | Add with carry (absolute)
	STA $65F4			; 8D F4 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_49A
; Address: $D2BAF8
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_49A:
	LDA $65F6			; AD F6 65 | Audio system operation
	ADC $67F6			; 6D F6 67 | Add with carry (absolute)
	STA $65F6			; 8D F6 65 | Audio system operation
	LDA $66F4			; AD F4 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68F4			; 6D F4 68 | Add with carry (absolute)
	STA $66F4			; 8D F4 66 | Audio system operation
	LDA $66F6			; AD F6 66 | Audio system operation
	ADC $68F6			; 6D F6 68 | Add with carry (absolute)
	STA $66F6			; 8D F6 66 | Audio system operation
	LDA $6A02			; AD 02 6A | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A82			; 6D 82 6A | Add with carry (absolute)
	STA $6A02			; 8D 02 6A | Audio system operation
	LDA $6B82			; AD 82 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C02			; 6D 02 6C | Add with carry (absolute)
	STA $6B82			; 8D 82 6B | Audio system operation
	LDA $6D02			; AD 02 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D82			; 6D 82 6D | Add with carry (absolute)
	STA $6D02			; 8D 02 6D | Audio system operation
	LDA $6E82			; AD 82 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F02			; 6D 02 6F | Add with carry (absolute)
	STA $6E82			; 8D 82 6E | Audio system operation
	LDA $6300			; AD 00 63 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3C28			; 4C 28 3C | Jump to address
	LDA $63F1			; AD F1 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64F1			; AD F1 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6B01			; AD 01 6B | Audio system operation
	LDY $6980			; AC 80 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_49B
; Address: $D2BB54
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_49B:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6E00			; AD 00 6E | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C80			; AD 80 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_49C
; Address: $D2BB64
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_49C:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63F0			; AD F0 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65F0			; 6D F0 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63F0			; 8D F0 63 | Audio system operation
	LDA $63F2			; AD F2 63 | Audio system operation
	ADC $65F2			; 6D F2 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_49D
; Address: $D2BB7D
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_49D:
	STA $63F2			; 8D F2 63 | Audio system operation
	LDA $64F0			; AD F0 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66F0			; 6D F0 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64F0			; 8D F0 64 | Audio system operation
	LDA $64F2			; AD F2 64 | Audio system operation
	ADC $66F2			; 6D F2 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64F2			; 8D F2 64 | Audio system operation
	LDA $6980			; AD 80 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A00			; 6D 00 6A | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6300			; 9C 00 63 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3BAF			; 4C AF 3B | Jump to address
	STA $6980			; 8D 80 69 | Audio system operation
	LDA $6B00			; AD 00 6B | Audio system operation
	ADC $6B80			; 6D 80 6B | Add with carry (absolute)
	STA $6B00			; 8D 00 6B | Audio system operation
	LDA $6C80			; AD 80 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D00			; 6D 00 6D | Add with carry (absolute)
	STA $6C80			; 8D 80 6C | Audio system operation
	LDA $6E00			; AD 00 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E80			; 6D 80 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6F00			; 9C 00 6F | Store zero to absolute
	STZ $6E80			; 9C 80 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3BDB			; 4C DB 3B | Jump to address
	STA $6E00			; 8D 00 6E | Audio system operation
	LDA $65F0			; AD F0 65 | Audio system operation
	ADC $67F0			; 6D F0 67 | Add with carry (absolute)
	STA $65F0			; 8D F0 65 | Audio system operation
	LDA $65F2			; AD F2 65 | Audio system operation
	ADC $67F2			; 6D F2 67 | Add with carry (absolute)
	STA $65F2			; 8D F2 65 | Audio system operation
	LDA $66F0			; AD F0 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68F0			; 6D F0 68 | Add with carry (absolute)
	STA $66F0			; 8D F0 66 | Audio system operation
	LDA $66F2			; AD F2 66 | Audio system operation
	ADC $68F2			; 6D F2 68 | Add with carry (absolute)
	STA $66F2			; 8D F2 66 | Audio system operation
	LDA $6A00			; AD 00 6A | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_49E
; Address: $D2BC03
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_49E:
	CLC				  ; 18 | Clear carry flag
	ADC $6A80			; 6D 80 6A | Add with carry (absolute)
	STA $6A00			; 8D 00 6A | Audio system operation
	LDA $6B80			; AD 80 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C00			; 6D 00 6C | Add with carry (absolute)
	STA $6B80			; 8D 80 6B | Audio system operation
	LDA $6D00			; AD 00 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D80			; 6D 80 6D | Add with carry (absolute)
	STA $6D00			; 8D 00 6D | Audio system operation
	LDA $6E80			; AD 80 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6F00			; 6D 00 6F | Add with carry (absolute)
	STA $6E80			; 8D 80 6E | Audio system operation
	LDA $62FE			; AD FE 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3D14			; 4C 14 3D | Jump to address
	LDA $63ED			; AD ED 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64ED			; AD ED 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AFF			; AD FF 6A | Audio system operation
	LDY $697E			; AC 7E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_49F
; Address: $D2BC40
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_49F:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DFE			; AD FE 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C7E			; AD 7E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A0
; Address: $D2BC50
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A0:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63EC			; AD EC 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65EC			; 6D EC 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63EC			; 8D EC 63 | Audio system operation
	LDA $63EE			; AD EE 63 | Audio system operation
	ADC $65EE			; 6D EE 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63EE			; 8D EE 63 | Audio system operation
	LDA $64EC			; AD EC 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66EC			; 6D EC 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64EC			; 8D EC 64 | Audio system operation
	LDA $64EE			; AD EE 64 | Audio system operation
	ADC $66EE			; 6D EE 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64EE			; 8D EE 64 | Audio system operation
	LDA $697E			; AD 7E 69 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A1
; Address: $D2BC88
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A1:
	CLC				  ; 18 | Clear carry flag
	ADC $69FE			; 6D FE 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62FE			; 9C FE 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3C9B			; 4C 9B 3C | Jump to address
	STA $697E			; 8D 7E 69 | Audio system operation
	LDA $6AFE			; AD FE 6A | Audio system operation
	ADC $6B7E			; 6D 7E 6B | Add with carry (absolute)
	STA $6AFE			; 8D FE 6A | Audio system operation
	LDA $6C7E			; AD 7E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CFE			; 6D FE 6C | Add with carry (absolute)
	STA $6C7E			; 8D 7E 6C | Audio system operation
	LDA $6DFE			; AD FE 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E7E			; 6D 7E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EFE			; 9C FE 6E | Store zero to absolute
	STZ $6E7E			; 9C 7E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3CC7			; 4C C7 3C | Jump to address
	STA $6DFE			; 8D FE 6D | Audio system operation
	LDA $65EC			; AD EC 65 | Audio system operation
	ADC $67EC			; 6D EC 67 | Add with carry (absolute)
	STA $65EC			; 8D EC 65 | Audio system operation
	LDA $65EE			; AD EE 65 | Audio system operation
	ADC $67EE			; 6D EE 67 | Add with carry (absolute)
	STA $65EE			; 8D EE 65 | Audio system operation
	LDA $66EC			; AD EC 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68EC			; 6D EC 68 | Add with carry (absolute)
	STA $66EC			; 8D EC 66 | Audio system operation
	LDA $66EE			; AD EE 66 | Audio system operation
	ADC $68EE			; 6D EE 68 | Add with carry (absolute)
	STA $66EE			; 8D EE 66 | Audio system operation
	LDA $69FE			; AD FE 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A7E			; 6D 7E 6A | Add with carry (absolute)
	STA $69FE			; 8D FE 69 | Audio system operation
	LDA $6B7E			; AD 7E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BFE			; 6D FE 6B | Add with carry (absolute)
	STA $6B7E			; 8D 7E 6B | Audio system operation
	LDA $6CFE			; AD FE 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D7E			; 6D 7E 6D | Add with carry (absolute)
	STA $6CFE			; 8D FE 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A2
; Address: $D2BD0A
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A2:
	LDA $6E7E			; AD 7E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EFE			; 6D FE 6E | Add with carry (absolute)
	STA $6E7E			; 8D 7E 6E | Audio system operation
	LDA $62FC			; AD FC 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3E00			; 4C 00 3E | Jump to address
	LDA $63E9			; AD E9 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64E9			; AD E9 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AFD			; AD FD 6A | Audio system operation
	LDY $697C			; AC 7C 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A3
; Address: $D2BD2C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A3:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DFC			; AD FC 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C7C			; AD 7C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A4
; Address: $D2BD3C
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A4:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63E8			; AD E8 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65E8			; 6D E8 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63E8			; 8D E8 63 | Audio system operation
	LDA $63EA			; AD EA 63 | Audio system operation
	ADC $65EA			; 6D EA 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63EA			; 8D EA 63 | Audio system operation
	LDA $64E8			; AD E8 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66E8			; 6D E8 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64E8			; 8D E8 64 | Audio system operation
	LDA $64EA			; AD EA 64 | Audio system operation
	ADC $66EA			; 6D EA 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64EA			; 8D EA 64 | Audio system operation
	LDA $697C			; AD 7C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69FC			; 6D FC 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62FC			; 9C FC 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3D87			; 4C 87 3D | Jump to address
	STA $697C			; 8D 7C 69 | Audio system operation
	LDA $6AFC			; AD FC 6A | Audio system operation
	ADC $6B7C			; 6D 7C 6B | Add with carry (absolute)
	STA $6AFC			; 8D FC 6A | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A5
; Address: $D2BD90
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A5:
	LDA $6C7C			; AD 7C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CFC			; 6D FC 6C | Add with carry (absolute)
	STA $6C7C			; 8D 7C 6C | Audio system operation
	LDA $6DFC			; AD FC 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E7C			; 6D 7C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EFC			; 9C FC 6E | Store zero to absolute
	STZ $6E7C			; 9C 7C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3DB3			; 4C B3 3D | Jump to address
	STA $6DFC			; 8D FC 6D | Audio system operation
	LDA $65E8			; AD E8 65 | Audio system operation
	ADC $67E8			; 6D E8 67 | Add with carry (absolute)
	STA $65E8			; 8D E8 65 | Audio system operation
	LDA $65EA			; AD EA 65 | Audio system operation
	ADC $67EA			; 6D EA 67 | Add with carry (absolute)
	STA $65EA			; 8D EA 65 | Audio system operation
	LDA $66E8			; AD E8 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68E8			; 6D E8 68 | Add with carry (absolute)
	STA $66E8			; 8D E8 66 | Audio system operation
	LDA $66EA			; AD EA 66 | Audio system operation
	ADC $68EA			; 6D EA 68 | Add with carry (absolute)
	STA $66EA			; 8D EA 66 | Audio system operation
	LDA $69FC			; AD FC 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A7C			; 6D 7C 6A | Add with carry (absolute)
	STA $69FC			; 8D FC 69 | Audio system operation
	LDA $6B7C			; AD 7C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BFC			; 6D FC 6B | Add with carry (absolute)
	STA $6B7C			; 8D 7C 6B | Audio system operation
	LDA $6CFC			; AD FC 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D7C			; 6D 7C 6D | Add with carry (absolute)
	STA $6CFC			; 8D FC 6C | Audio system operation
	LDA $6E7C			; AD 7C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EFC			; 6D FC 6E | Add with carry (absolute)
	STA $6E7C			; 8D 7C 6E | Audio system operation
	LDA $62FA			; AD FA 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3EEC			; 4C EC 3E | Jump to address
	LDA $63E5			; AD E5 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64E5			; AD E5 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A7
; Address: $D2BE18
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A7:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DFA			; AD FA 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C7A			; AD 7A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A8
; Address: $D2BE28
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A8:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63E4			; AD E4 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65E4			; 6D E4 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63E4			; 8D E4 63 | Audio system operation
	LDA $63E6			; AD E6 63 | Audio system operation
	ADC $65E6			; 6D E6 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63E6			; 8D E6 63 | Audio system operation
	LDA $64E4			; AD E4 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66E4			; 6D E4 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64E4			; 8D E4 64 | Audio system operation
	LDA $64E6			; AD E6 64 | Audio system operation
	ADC $66E6			; 6D E6 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64E6			; 8D E6 64 | Audio system operation
	LDA $697A			; AD 7A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69FA			; 6D FA 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62FA			; 9C FA 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3E73			; 4C 73 3E | Jump to address
	STA $697A			; 8D 7A 69 | Audio system operation
	LDA $6AFA			; AD FA 6A | Audio system operation
	ADC $6B7A			; 6D 7A 6B | Add with carry (absolute)
	STA $6AFA			; 8D FA 6A | Audio system operation
	LDA $6C7A			; AD 7A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CFA			; 6D FA 6C | Add with carry (absolute)
	STA $6C7A			; 8D 7A 6C | Audio system operation
	LDA $6DFA			; AD FA 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E7A			; 6D 7A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EFA			; 9C FA 6E | Store zero to absolute
	STZ $6E7A			; 9C 7A 6E | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4A9
; Address: $D2BE98
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4A9:
	CLC				  ; 18 | Clear carry flag
	JMP $3E9F			; 4C 9F 3E | Jump to address
	STA $6DFA			; 8D FA 6D | Audio system operation
	LDA $65E4			; AD E4 65 | Audio system operation
	ADC $67E4			; 6D E4 67 | Add with carry (absolute)
	STA $65E4			; 8D E4 65 | Audio system operation
	LDA $65E6			; AD E6 65 | Audio system operation
	ADC $67E6			; 6D E6 67 | Add with carry (absolute)
	STA $65E6			; 8D E6 65 | Audio system operation
	LDA $66E4			; AD E4 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68E4			; 6D E4 68 | Add with carry (absolute)
	STA $66E4			; 8D E4 66 | Audio system operation
	LDA $66E6			; AD E6 66 | Audio system operation
	ADC $68E6			; 6D E6 68 | Add with carry (absolute)
	STA $66E6			; 8D E6 66 | Audio system operation
	LDA $69FA			; AD FA 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A7A			; 6D 7A 6A | Add with carry (absolute)
	STA $69FA			; 8D FA 69 | Audio system operation
	LDA $6B7A			; AD 7A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BFA			; 6D FA 6B | Add with carry (absolute)
	STA $6B7A			; 8D 7A 6B | Audio system operation
	LDA $6CFA			; AD FA 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D7A			; 6D 7A 6D | Add with carry (absolute)
	STA $6CFA			; 8D FA 6C | Audio system operation
	LDA $6E7A			; AD 7A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EFA			; 6D FA 6E | Add with carry (absolute)
	STA $6E7A			; 8D 7A 6E | Audio system operation
	LDA $62F8			; AD F8 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $3FD8			; 4C D8 3F | Jump to address
	LDA $63E1			; AD E1 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64E1			; AD E1 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AF9			; AD F9 6A | Audio system operation
	LDY $6978			; AC 78 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4AA
; Address: $D2BF04
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4AA:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DF8			; AD F8 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C78			; AD 78 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4AB
; Address: $D2BF14
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4AB:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63E0			; AD E0 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4AC
; Address: $D2BF1B
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4AC:
	ADC $65E0			; 6D E0 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63E0			; 8D E0 63 | Audio system operation
	LDA $63E2			; AD E2 63 | Audio system operation
	ADC $65E2			; 6D E2 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63E2			; 8D E2 63 | Audio system operation
	LDA $64E0			; AD E0 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66E0			; 6D E0 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64E0			; 8D E0 64 | Audio system operation
	LDA $64E2			; AD E2 64 | Audio system operation
	ADC $66E2			; 6D E2 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64E2			; 8D E2 64 | Audio system operation
	LDA $6978			; AD 78 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69F8			; 6D F8 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62F8			; 9C F8 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3F5F			; 4C 5F 3F | Jump to address
	STA $6978			; 8D 78 69 | Audio system operation
	LDA $6AF8			; AD F8 6A | Audio system operation
	ADC $6B78			; 6D 78 6B | Add with carry (absolute)
	STA $6AF8			; 8D F8 6A | Audio system operation
	LDA $6C78			; AD 78 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CF8			; 6D F8 6C | Add with carry (absolute)
	STA $6C78			; 8D 78 6C | Audio system operation
	LDA $6DF8			; AD F8 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E78			; 6D 78 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EF8			; 9C F8 6E | Store zero to absolute
	STZ $6E78			; 9C 78 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $3F8B			; 4C 8B 3F | Jump to address
	STA $6DF8			; 8D F8 6D | Audio system operation
	LDA $65E0			; AD E0 65 | Audio system operation
	ADC $67E0			; 6D E0 67 | Add with carry (absolute)
	STA $65E0			; 8D E0 65 | Audio system operation
	LDA $65E2			; AD E2 65 | Audio system operation
	ADC $67E2			; 6D E2 67 | Add with carry (absolute)
	STA $65E2			; 8D E2 65 | Audio system operation
	LDA $66E0			; AD E0 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4AD
; Address: $D2BFA1
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4AD:
	ADC $68E0			; 6D E0 68 | Add with carry (absolute)
	STA $66E0			; 8D E0 66 | Audio system operation
	LDA $66E2			; AD E2 66 | Audio system operation
	ADC $68E2			; 6D E2 68 | Add with carry (absolute)
	STA $66E2			; 8D E2 66 | Audio system operation
	LDA $69F8			; AD F8 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A78			; 6D 78 6A | Add with carry (absolute)
	STA $69F8			; 8D F8 69 | Audio system operation
	LDA $6B78			; AD 78 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BF8			; 6D F8 6B | Add with carry (absolute)
	STA $6B78			; 8D 78 6B | Audio system operation
	LDA $6CF8			; AD F8 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D78			; 6D 78 6D | Add with carry (absolute)
	STA $6CF8			; 8D F8 6C | Audio system operation
	LDA $6E78			; AD 78 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EF8			; 6D F8 6E | Add with carry (absolute)
	STA $6E78			; 8D 78 6E | Audio system operation
	LDA $62F6			; AD F6 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $40C4			; 4C C4 40 | Jump to address
	LDA $63DD			; AD DD 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64DD			; AD DD 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AF7			; AD F7 6A | Audio system operation
	LDY $6976			; AC 76 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4AE
; Address: $D2BFF0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4AE:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DF6			; AD F6 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C76			; AD 76 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4AF
; Address: $D2C000
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4AF:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63DC			; AD DC 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65DC			; 6D DC 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63DC			; 8D DC 63 | Audio system operation
	LDA $63DE			; AD DE 63 | Audio system operation
	ADC $65DE			; 6D DE 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63DE			; 8D DE 63 | Audio system operation
	LDA $64DC			; AD DC 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66DC			; 6D DC 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B0
; Address: $D2C026
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B0:
	STA $64DC			; 8D DC 64 | Audio system operation
	LDA $64DE			; AD DE 64 | Audio system operation
	ADC $66DE			; 6D DE 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64DE			; 8D DE 64 | Audio system operation
	LDA $6976			; AD 76 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69F6			; 6D F6 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62F6			; 9C F6 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $404B			; 4C 4B 40 | Jump to address
	STA $6976			; 8D 76 69 | Audio system operation
	LDA $6AF6			; AD F6 6A | Audio system operation
	ADC $6B76			; 6D 76 6B | Add with carry (absolute)
	STA $6AF6			; 8D F6 6A | Audio system operation
	LDA $6C76			; AD 76 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CF6			; 6D F6 6C | Add with carry (absolute)
	STA $6C76			; 8D 76 6C | Audio system operation
	LDA $6DF6			; AD F6 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E76			; 6D 76 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EF6			; 9C F6 6E | Store zero to absolute
	STZ $6E76			; 9C 76 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4077			; 4C 77 40 | Jump to address
	STA $6DF6			; 8D F6 6D | Audio system operation
	LDA $65DC			; AD DC 65 | Audio system operation
	ADC $67DC			; 6D DC 67 | Add with carry (absolute)
	STA $65DC			; 8D DC 65 | Audio system operation
	LDA $65DE			; AD DE 65 | Audio system operation
	ADC $67DE			; 6D DE 67 | Add with carry (absolute)
	STA $65DE			; 8D DE 65 | Audio system operation
	LDA $66DC			; AD DC 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68DC			; 6D DC 68 | Add with carry (absolute)
	STA $66DC			; 8D DC 66 | Audio system operation
	LDA $66DE			; AD DE 66 | Audio system operation
	ADC $68DE			; 6D DE 68 | Add with carry (absolute)
	STA $66DE			; 8D DE 66 | Audio system operation
	LDA $69F6			; AD F6 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A76			; 6D 76 6A | Add with carry (absolute)
	STA $69F6			; 8D F6 69 | Audio system operation
	LDA $6B76			; AD 76 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B1
; Address: $D2C0AA
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B1:
	ADC $6BF6			; 6D F6 6B | Add with carry (absolute)
	STA $6B76			; 8D 76 6B | Audio system operation
	LDA $6CF6			; AD F6 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D76			; 6D 76 6D | Add with carry (absolute)
	STA $6CF6			; 8D F6 6C | Audio system operation
	LDA $6E76			; AD 76 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EF6			; 6D F6 6E | Add with carry (absolute)
	STA $6E76			; 8D 76 6E | Audio system operation
	LDA $62F4			; AD F4 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $41B0			; 4C B0 41 | Jump to address
	LDA $63D9			; AD D9 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64D9			; AD D9 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AF5			; AD F5 6A | Audio system operation
	LDY $6974			; AC 74 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B2
; Address: $D2C0DC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B2:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DF4			; AD F4 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C74			; AD 74 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B3
; Address: $D2C0EC
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B3:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63D8			; AD D8 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65D8			; 6D D8 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63D8			; 8D D8 63 | Audio system operation
	LDA $63DA			; AD DA 63 | Audio system operation
	ADC $65DA			; 6D DA 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63DA			; 8D DA 63 | Audio system operation
	LDA $64D8			; AD D8 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66D8			; 6D D8 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64D8			; 8D D8 64 | Audio system operation
	LDA $64DA			; AD DA 64 | Audio system operation
	ADC $66DA			; 6D DA 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64DA			; 8D DA 64 | Audio system operation
	LDA $6974			; AD 74 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69F4			; 6D F4 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62F4			; 9C F4 62 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B4
; Address: $D2C130
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B4:
	CLC				  ; 18 | Clear carry flag
	JMP $4137			; 4C 37 41 | Jump to address
	STA $6974			; 8D 74 69 | Audio system operation
	LDA $6AF4			; AD F4 6A | Audio system operation
	ADC $6B74			; 6D 74 6B | Add with carry (absolute)
	STA $6AF4			; 8D F4 6A | Audio system operation
	LDA $6C74			; AD 74 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CF4			; 6D F4 6C | Add with carry (absolute)
	STA $6C74			; 8D 74 6C | Audio system operation
	LDA $6DF4			; AD F4 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E74			; 6D 74 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EF4			; 9C F4 6E | Store zero to absolute
	STZ $6E74			; 9C 74 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4163			; 4C 63 41 | Jump to address
	STA $6DF4			; 8D F4 6D | Audio system operation
	LDA $65D8			; AD D8 65 | Audio system operation
	ADC $67D8			; 6D D8 67 | Add with carry (absolute)
	STA $65D8			; 8D D8 65 | Audio system operation
	LDA $65DA			; AD DA 65 | Audio system operation
	ADC $67DA			; 6D DA 67 | Add with carry (absolute)
	STA $65DA			; 8D DA 65 | Audio system operation
	LDA $66D8			; AD D8 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68D8			; 6D D8 68 | Add with carry (absolute)
	STA $66D8			; 8D D8 66 | Audio system operation
	LDA $66DA			; AD DA 66 | Audio system operation
	ADC $68DA			; 6D DA 68 | Add with carry (absolute)
	STA $66DA			; 8D DA 66 | Audio system operation
	LDA $69F4			; AD F4 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A74			; 6D 74 6A | Add with carry (absolute)
	STA $69F4			; 8D F4 69 | Audio system operation
	LDA $6B74			; AD 74 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BF4			; 6D F4 6B | Add with carry (absolute)
	STA $6B74			; 8D 74 6B | Audio system operation
	LDA $6CF4			; AD F4 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D74			; 6D 74 6D | Add with carry (absolute)
	STA $6CF4			; 8D F4 6C | Audio system operation
	LDA $6E74			; AD 74 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EF4			; 6D F4 6E | Add with carry (absolute)
	STA $6E74			; 8D 74 6E | Audio system operation
	LDA $62F2			; AD F2 62 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B5
; Address: $D2C1B3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B5:
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $429C			; 4C 9C 42 | Hardware register operation
	LDA $63D5			; AD D5 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64D5			; AD D5 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AF3			; AD F3 6A | Audio system operation
	LDY $6972			; AC 72 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B6
; Address: $D2C1C8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B6:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DF2			; AD F2 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C72			; AD 72 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B7
; Address: $D2C1D8
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B7:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63D4			; AD D4 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65D4			; 6D D4 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63D4			; 8D D4 63 | Audio system operation
	LDA $63D6			; AD D6 63 | Audio system operation
	ADC $65D6			; 6D D6 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63D6			; 8D D6 63 | Audio system operation
	LDA $64D4			; AD D4 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66D4			; 6D D4 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64D4			; 8D D4 64 | Audio system operation
	LDA $64D6			; AD D6 64 | Audio system operation
	ADC $66D6			; 6D D6 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64D6			; 8D D6 64 | Audio system operation
	LDA $6972			; AD 72 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69F2			; 6D F2 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62F2			; 9C F2 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4223			; 4C 23 42 | Hardware register operation
	STA $6972			; 8D 72 69 | Audio system operation
	LDA $6AF2			; AD F2 6A | Audio system operation
	ADC $6B72			; 6D 72 6B | Add with carry (absolute)
	STA $6AF2			; 8D F2 6A | Audio system operation
	LDA $6C72			; AD 72 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CF2			; 6D F2 6C | Add with carry (absolute)
	STA $6C72			; 8D 72 6C | Audio system operation
	LDA $6DF2			; AD F2 6D | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B8
; Address: $D2C239
; Size: 122 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B8:
	CLC				  ; 18 | Clear carry flag
	ADC $6E72			; 6D 72 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EF2			; 9C F2 6E | Store zero to absolute
	STZ $6E72			; 9C 72 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $424F			; 4C 4F 42 | Hardware register operation
	STA $6DF2			; 8D F2 6D | Audio system operation
	LDA $65D4			; AD D4 65 | Audio system operation
	ADC $67D4			; 6D D4 67 | Add with carry (absolute)
	STA $65D4			; 8D D4 65 | Audio system operation
	LDA $65D6			; AD D6 65 | Audio system operation
	ADC $67D6			; 6D D6 67 | Add with carry (absolute)
	STA $65D6			; 8D D6 65 | Audio system operation
	LDA $66D4			; AD D4 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68D4			; 6D D4 68 | Add with carry (absolute)
	STA $66D4			; 8D D4 66 | Audio system operation
	LDA $66D6			; AD D6 66 | Audio system operation
	ADC $68D6			; 6D D6 68 | Add with carry (absolute)
	STA $66D6			; 8D D6 66 | Audio system operation
	LDA $69F2			; AD F2 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A72			; 6D 72 6A | Add with carry (absolute)
	STA $69F2			; 8D F2 69 | Audio system operation
	LDA $6B72			; AD 72 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BF2			; 6D F2 6B | Add with carry (absolute)
	STA $6B72			; 8D 72 6B | Audio system operation
	LDA $6CF2			; AD F2 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D72			; 6D 72 6D | Add with carry (absolute)
	STA $6CF2			; 8D F2 6C | Audio system operation
	LDA $6E72			; AD 72 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EF2			; 6D F2 6E | Add with carry (absolute)
	STA $6E72			; 8D 72 6E | Audio system operation
	LDA $62F0			; AD F0 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4388			; 4C 88 43 | Jump to address
	LDA $63D1			; AD D1 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64D1			; AD D1 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AF1			; AD F1 6A | Audio system operation
	LDY $6970			; AC 70 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4B9
; Address: $D2C2B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4B9:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DF0			; AD F0 6D | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4BA
; Address: $D2C2BC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4BA:
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C70			; AD 70 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4BB
; Address: $D2C2C4
; Size: 123 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4BB:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63D0			; AD D0 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65D0			; 6D D0 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63D0			; 8D D0 63 | Audio system operation
	LDA $63D2			; AD D2 63 | Audio system operation
	ADC $65D2			; 6D D2 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63D2			; 8D D2 63 | Audio system operation
	LDA $64D0			; AD D0 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66D0			; 6D D0 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64D0			; 8D D0 64 | Audio system operation
	LDA $64D2			; AD D2 64 | Audio system operation
	ADC $66D2			; 6D D2 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64D2			; 8D D2 64 | Audio system operation
	LDA $6970			; AD 70 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69F0			; 6D F0 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62F0			; 9C F0 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $430F			; 4C 0F 43 | Jump to address
	STA $6970			; 8D 70 69 | Audio system operation
	LDA $6AF0			; AD F0 6A | Audio system operation
	ADC $6B70			; 6D 70 6B | Add with carry (absolute)
	STA $6AF0			; 8D F0 6A | Audio system operation
	LDA $6C70			; AD 70 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CF0			; 6D F0 6C | Add with carry (absolute)
	STA $6C70			; 8D 70 6C | Audio system operation
	LDA $6DF0			; AD F0 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E70			; 6D 70 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EF0			; 9C F0 6E | Store zero to absolute
	STZ $6E70			; 9C 70 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $433B			; 4C 3B 43 | Jump to address
	STA $6DF0			; 8D F0 6D | Audio system operation
	LDA $65D0			; AD D0 65 | Audio system operation
	ADC $67D0			; 6D D0 67 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4BC
; Address: $D2C341
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4BC:
	STA $65D0			; 8D D0 65 | Audio system operation
	LDA $65D2			; AD D2 65 | Audio system operation
	ADC $67D2			; 6D D2 67 | Add with carry (absolute)
	STA $65D2			; 8D D2 65 | Audio system operation
	LDA $66D0			; AD D0 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68D0			; 6D D0 68 | Add with carry (absolute)
	STA $66D0			; 8D D0 66 | Audio system operation
	LDA $66D2			; AD D2 66 | Audio system operation
	ADC $68D2			; 6D D2 68 | Add with carry (absolute)
	STA $66D2			; 8D D2 66 | Audio system operation
	LDA $69F0			; AD F0 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A70			; 6D 70 6A | Add with carry (absolute)
	STA $69F0			; 8D F0 69 | Audio system operation
	LDA $6B70			; AD 70 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BF0			; 6D F0 6B | Add with carry (absolute)
	STA $6B70			; 8D 70 6B | Audio system operation
	LDA $6CF0			; AD F0 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D70			; 6D 70 6D | Add with carry (absolute)
	STA $6CF0			; 8D F0 6C | Audio system operation
	LDA $6E70			; AD 70 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EF0			; 6D F0 6E | Add with carry (absolute)
	STA $6E70			; 8D 70 6E | Audio system operation
	LDA $62EE			; AD EE 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4474			; 4C 74 44 | Jump to address
	LDA $63CD			; AD CD 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64CD			; AD CD 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AEF			; AD EF 6A | Audio system operation
	LDY $696E			; AC 6E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4BD
; Address: $D2C3A0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4BD:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DEE			; AD EE 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C6E			; AD 6E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4BE
; Address: $D2C3B0
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4BE:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63CC			; AD CC 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65CC			; 6D CC 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63CC			; 8D CC 63 | Audio system operation
	LDA $63CE			; AD CE 63 | Audio system operation
	ADC $65CE			; 6D CE 65 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4BF
; Address: $D2C3C6
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4BF:
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63CE			; 8D CE 63 | Audio system operation
	LDA $64CC			; AD CC 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66CC			; 6D CC 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64CC			; 8D CC 64 | Audio system operation
	LDA $64CE			; AD CE 64 | Audio system operation
	ADC $66CE			; 6D CE 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64CE			; 8D CE 64 | Audio system operation
	LDA $696E			; AD 6E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69EE			; 6D EE 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62EE			; 9C EE 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $43FB			; 4C FB 43 | Jump to address
	STA $696E			; 8D 6E 69 | Audio system operation
	LDA $6AEE			; AD EE 6A | Audio system operation
	ADC $6B6E			; 6D 6E 6B | Add with carry (absolute)
	STA $6AEE			; 8D EE 6A | Audio system operation
	LDA $6C6E			; AD 6E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CEE			; 6D EE 6C | Add with carry (absolute)
	STA $6C6E			; 8D 6E 6C | Audio system operation
	LDA $6DEE			; AD EE 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E6E			; 6D 6E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EEE			; 9C EE 6E | Store zero to absolute
	STZ $6E6E			; 9C 6E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4427			; 4C 27 44 | Jump to address
	STA $6DEE			; 8D EE 6D | Audio system operation
	LDA $65CC			; AD CC 65 | Audio system operation
	ADC $67CC			; 6D CC 67 | Add with carry (absolute)
	STA $65CC			; 8D CC 65 | Audio system operation
	LDA $65CE			; AD CE 65 | Audio system operation
	ADC $67CE			; 6D CE 67 | Add with carry (absolute)
	STA $65CE			; 8D CE 65 | Audio system operation
	LDA $66CC			; AD CC 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68CC			; 6D CC 68 | Add with carry (absolute)
	STA $66CC			; 8D CC 66 | Audio system operation
	LDA $66CE			; AD CE 66 | Audio system operation
	ADC $68CE			; 6D CE 68 | Add with carry (absolute)
	STA $66CE			; 8D CE 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C0
; Address: $D2C44C
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C0:
	LDA $69EE			; AD EE 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A6E			; 6D 6E 6A | Add with carry (absolute)
	STA $69EE			; 8D EE 69 | Audio system operation
	LDA $6B6E			; AD 6E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BEE			; 6D EE 6B | Add with carry (absolute)
	STA $6B6E			; 8D 6E 6B | Audio system operation
	LDA $6CEE			; AD EE 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D6E			; 6D 6E 6D | Add with carry (absolute)
	STA $6CEE			; 8D EE 6C | Audio system operation
	LDA $6E6E			; AD 6E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EEE			; 6D EE 6E | Add with carry (absolute)
	STA $6E6E			; 8D 6E 6E | Audio system operation
	LDA $62EC			; AD EC 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4560			; 4C 60 45 | Jump to address
	LDA $63C9			; AD C9 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64C9			; AD C9 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AED			; AD ED 6A | Audio system operation
	LDY $696C			; AC 6C 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C1
; Address: $D2C48C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C1:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DEC			; AD EC 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C6C			; AD 6C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C2
; Address: $D2C49C
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C2:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63C8			; AD C8 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65C8			; 6D C8 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63C8			; 8D C8 63 | Audio system operation
	LDA $63CA			; AD CA 63 | Audio system operation
	ADC $65CA			; 6D CA 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63CA			; 8D CA 63 | Audio system operation
	LDA $64C8			; AD C8 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66C8			; 6D C8 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64C8			; 8D C8 64 | Audio system operation
	LDA $64CA			; AD CA 64 | Audio system operation
	ADC $66CA			; 6D CA 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64CA			; 8D CA 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C3
; Address: $D2C4D1
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C3:
	LDA $696C			; AD 6C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69EC			; 6D EC 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62EC			; 9C EC 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $44E7			; 4C E7 44 | Jump to address
	STA $696C			; 8D 6C 69 | Audio system operation
	LDA $6AEC			; AD EC 6A | Audio system operation
	ADC $6B6C			; 6D 6C 6B | Add with carry (absolute)
	STA $6AEC			; 8D EC 6A | Audio system operation
	LDA $6C6C			; AD 6C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CEC			; 6D EC 6C | Add with carry (absolute)
	STA $6C6C			; 8D 6C 6C | Audio system operation
	LDA $6DEC			; AD EC 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E6C			; 6D 6C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EEC			; 9C EC 6E | Store zero to absolute
	STZ $6E6C			; 9C 6C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4513			; 4C 13 45 | Jump to address
	STA $6DEC			; 8D EC 6D | Audio system operation
	LDA $65C8			; AD C8 65 | Audio system operation
	ADC $67C8			; 6D C8 67 | Add with carry (absolute)
	STA $65C8			; 8D C8 65 | Audio system operation
	LDA $65CA			; AD CA 65 | Audio system operation
	ADC $67CA			; 6D CA 67 | Add with carry (absolute)
	STA $65CA			; 8D CA 65 | Audio system operation
	LDA $66C8			; AD C8 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68C8			; 6D C8 68 | Add with carry (absolute)
	STA $66C8			; 8D C8 66 | Audio system operation
	LDA $66CA			; AD CA 66 | Audio system operation
	ADC $68CA			; 6D CA 68 | Add with carry (absolute)
	STA $66CA			; 8D CA 66 | Audio system operation
	LDA $69EC			; AD EC 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A6C			; 6D 6C 6A | Add with carry (absolute)
	STA $69EC			; 8D EC 69 | Audio system operation
	LDA $6B6C			; AD 6C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BEC			; 6D EC 6B | Add with carry (absolute)
	STA $6B6C			; 8D 6C 6B | Audio system operation
	LDA $6CEC			; AD EC 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D6C			; 6D 6C 6D | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C4
; Address: $D2C553
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C4:
	STA $6CEC			; 8D EC 6C | Audio system operation
	LDA $6E6C			; AD 6C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EEC			; 6D EC 6E | Add with carry (absolute)
	STA $6E6C			; 8D 6C 6E | Audio system operation
	LDA $62EA			; AD EA 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $464C			; 4C 4C 46 | Jump to address
	LDA $63C5			; AD C5 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64C5			; AD C5 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AEB			; AD EB 6A | Audio system operation
	LDY $696A			; AC 6A 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C5
; Address: $D2C578
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C5:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DEA			; AD EA 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C6A			; AD 6A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C6
; Address: $D2C588
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C6:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63C4			; AD C4 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65C4			; 6D C4 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63C4			; 8D C4 63 | Audio system operation
	LDA $63C6			; AD C6 63 | Audio system operation
	ADC $65C6			; 6D C6 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63C6			; 8D C6 63 | Audio system operation
	LDA $64C4			; AD C4 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66C4			; 6D C4 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64C4			; 8D C4 64 | Audio system operation
	LDA $64C6			; AD C6 64 | Audio system operation
	ADC $66C6			; 6D C6 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64C6			; 8D C6 64 | Audio system operation
	LDA $696A			; AD 6A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69EA			; 6D EA 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62EA			; 9C EA 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $45D3			; 4C D3 45 | Jump to address
	STA $696A			; 8D 6A 69 | Audio system operation
	LDA $6AEA			; AD EA 6A | Audio system operation
	ADC $6B6A			; 6D 6A 6B | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C7
; Address: $D2C5D9
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C7:
	STA $6AEA			; 8D EA 6A | Audio system operation
	LDA $6C6A			; AD 6A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CEA			; 6D EA 6C | Add with carry (absolute)
	STA $6C6A			; 8D 6A 6C | Audio system operation
	LDA $6DEA			; AD EA 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E6A			; 6D 6A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EEA			; 9C EA 6E | Store zero to absolute
	STZ $6E6A			; 9C 6A 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $45FF			; 4C FF 45 | Jump to address
	STA $6DEA			; 8D EA 6D | Audio system operation
	LDA $65C4			; AD C4 65 | Audio system operation
	ADC $67C4			; 6D C4 67 | Add with carry (absolute)
	STA $65C4			; 8D C4 65 | Audio system operation
	LDA $65C6			; AD C6 65 | Audio system operation
	ADC $67C6			; 6D C6 67 | Add with carry (absolute)
	STA $65C6			; 8D C6 65 | Audio system operation
	LDA $66C4			; AD C4 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68C4			; 6D C4 68 | Add with carry (absolute)
	STA $66C4			; 8D C4 66 | Audio system operation
	LDA $66C6			; AD C6 66 | Audio system operation
	ADC $68C6			; 6D C6 68 | Add with carry (absolute)
	STA $66C6			; 8D C6 66 | Audio system operation
	LDA $69EA			; AD EA 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A6A			; 6D 6A 6A | Add with carry (absolute)
	STA $69EA			; 8D EA 69 | Audio system operation
	LDA $6B6A			; AD 6A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BEA			; 6D EA 6B | Add with carry (absolute)
	STA $6B6A			; 8D 6A 6B | Audio system operation
	LDA $6CEA			; AD EA 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D6A			; 6D 6A 6D | Add with carry (absolute)
	STA $6CEA			; 8D EA 6C | Audio system operation
	LDA $6E6A			; AD 6A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EEA			; 6D EA 6E | Add with carry (absolute)
	STA $6E6A			; 8D 6A 6E | Audio system operation
	LDA $62E8			; AD E8 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4738			; 4C 38 47 | Jump to address
	LDA $63C1			; AD C1 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64C1			; AD C1 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C8
; Address: $D2C65C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C8:
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AE9			; AD E9 6A | Audio system operation
	LDY $6968			; AC 68 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4C9
; Address: $D2C664
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4C9:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DE8			; AD E8 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C68			; AD 68 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4CA
; Address: $D2C674
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4CA:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63C0			; AD C0 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65C0			; 6D C0 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63C0			; 8D C0 63 | Audio system operation
	LDA $63C2			; AD C2 63 | Audio system operation
	ADC $65C2			; 6D C2 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63C2			; 8D C2 63 | Audio system operation
	LDA $64C0			; AD C0 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66C0			; 6D C0 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64C0			; 8D C0 64 | Audio system operation
	LDA $64C2			; AD C2 64 | Audio system operation
	ADC $66C2			; 6D C2 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64C2			; 8D C2 64 | Audio system operation
	LDA $6968			; AD 68 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69E8			; 6D E8 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62E8			; 9C E8 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $46BF			; 4C BF 46 | Jump to address
	STA $6968			; 8D 68 69 | Audio system operation
	LDA $6AE8			; AD E8 6A | Audio system operation
	ADC $6B68			; 6D 68 6B | Add with carry (absolute)
	STA $6AE8			; 8D E8 6A | Audio system operation
	LDA $6C68			; AD 68 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CE8			; 6D E8 6C | Add with carry (absolute)
	STA $6C68			; 8D 68 6C | Audio system operation
	LDA $6DE8			; AD E8 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E68			; 6D 68 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EE8			; 9C E8 6E | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4CB
; Address: $D2C6E1
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4CB:
	STZ $6E68			; 9C 68 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $46EB			; 4C EB 46 | Jump to address
	STA $6DE8			; 8D E8 6D | Audio system operation
	LDA $65C0			; AD C0 65 | Audio system operation
	ADC $67C0			; 6D C0 67 | Add with carry (absolute)
	STA $65C0			; 8D C0 65 | Audio system operation
	LDA $65C2			; AD C2 65 | Audio system operation
	ADC $67C2			; 6D C2 67 | Add with carry (absolute)
	STA $65C2			; 8D C2 65 | Audio system operation
	LDA $66C0			; AD C0 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68C0			; 6D C0 68 | Add with carry (absolute)
	STA $66C0			; 8D C0 66 | Audio system operation
	LDA $66C2			; AD C2 66 | Audio system operation
	ADC $68C2			; 6D C2 68 | Add with carry (absolute)
	STA $66C2			; 8D C2 66 | Audio system operation
	LDA $69E8			; AD E8 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A68			; 6D 68 6A | Add with carry (absolute)
	STA $69E8			; 8D E8 69 | Audio system operation
	LDA $6B68			; AD 68 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BE8			; 6D E8 6B | Add with carry (absolute)
	STA $6B68			; 8D 68 6B | Audio system operation
	LDA $6CE8			; AD E8 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D68			; 6D 68 6D | Add with carry (absolute)
	STA $6CE8			; 8D E8 6C | Audio system operation
	LDA $6E68			; AD 68 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EE8			; 6D E8 6E | Add with carry (absolute)
	STA $6E68			; 8D 68 6E | Audio system operation
	LDA $62E6			; AD E6 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4824			; 4C 24 48 | Jump to address
	LDA $63BD			; AD BD 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64BD			; AD BD 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AE7			; AD E7 6A | Audio system operation
	LDY $6966			; AC 66 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4CC
; Address: $D2C750
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4CC:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DE6			; AD E6 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C66			; AD 66 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4CE
; Address: $D2C766
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4CE:
	CLC				  ; 18 | Clear carry flag
	ADC $65BC			; 6D BC 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63BC			; 8D BC 63 | Audio system operation
	LDA $63BE			; AD BE 63 | Audio system operation
	ADC $65BE			; 6D BE 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63BE			; 8D BE 63 | Audio system operation
	LDA $64BC			; AD BC 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66BC			; 6D BC 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64BC			; 8D BC 64 | Audio system operation
	LDA $64BE			; AD BE 64 | Audio system operation
	ADC $66BE			; 6D BE 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64BE			; 8D BE 64 | Audio system operation
	LDA $6966			; AD 66 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69E6			; 6D E6 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62E6			; 9C E6 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $47AB			; 4C AB 47 | Jump to address
	STA $6966			; 8D 66 69 | Audio system operation
	LDA $6AE6			; AD E6 6A | Audio system operation
	ADC $6B66			; 6D 66 6B | Add with carry (absolute)
	STA $6AE6			; 8D E6 6A | Audio system operation
	LDA $6C66			; AD 66 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CE6			; 6D E6 6C | Add with carry (absolute)
	STA $6C66			; 8D 66 6C | Audio system operation
	LDA $6DE6			; AD E6 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E66			; 6D 66 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EE6			; 9C E6 6E | Store zero to absolute
	STZ $6E66			; 9C 66 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $47D7			; 4C D7 47 | Jump to address
	STA $6DE6			; 8D E6 6D | Audio system operation
	LDA $65BC			; AD BC 65 | Audio system operation
	ADC $67BC			; 6D BC 67 | Add with carry (absolute)
	STA $65BC			; 8D BC 65 | Audio system operation
	LDA $65BE			; AD BE 65 | Audio system operation
	ADC $67BE			; 6D BE 67 | Add with carry (absolute)
	STA $65BE			; 8D BE 65 | Audio system operation
	LDA $66BC			; AD BC 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4CF
; Address: $D2C7EC
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4CF:
	CLC				  ; 18 | Clear carry flag
	ADC $68BC			; 6D BC 68 | Add with carry (absolute)
	STA $66BC			; 8D BC 66 | Audio system operation
	LDA $66BE			; AD BE 66 | Audio system operation
	ADC $68BE			; 6D BE 68 | Add with carry (absolute)
	STA $66BE			; 8D BE 66 | Audio system operation
	LDA $69E6			; AD E6 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A66			; 6D 66 6A | Add with carry (absolute)
	STA $69E6			; 8D E6 69 | Audio system operation
	LDA $6B66			; AD 66 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BE6			; 6D E6 6B | Add with carry (absolute)
	STA $6B66			; 8D 66 6B | Audio system operation
	LDA $6CE6			; AD E6 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D66			; 6D 66 6D | Add with carry (absolute)
	STA $6CE6			; 8D E6 6C | Audio system operation
	LDA $6E66			; AD 66 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EE6			; 6D E6 6E | Add with carry (absolute)
	STA $6E66			; 8D 66 6E | Audio system operation
	LDA $62E4			; AD E4 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4910			; 4C 10 49 | Jump to address
	LDA $63B9			; AD B9 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64B9			; AD B9 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AE5			; AD E5 6A | Audio system operation
	LDY $6964			; AC 64 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D0
; Address: $D2C83C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D0:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DE4			; AD E4 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C64			; AD 64 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D1
; Address: $D2C84C
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D1:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63B8			; AD B8 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65B8			; 6D B8 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63B8			; 8D B8 63 | Audio system operation
	LDA $63BA			; AD BA 63 | Audio system operation
	ADC $65BA			; 6D BA 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63BA			; 8D BA 63 | Audio system operation
	LDA $64B8			; AD B8 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66B8			; 6D B8 66 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D2
; Address: $D2C86F
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D2:
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64B8			; 8D B8 64 | Audio system operation
	LDA $64BA			; AD BA 64 | Audio system operation
	ADC $66BA			; 6D BA 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64BA			; 8D BA 64 | Audio system operation
	LDA $6964			; AD 64 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69E4			; 6D E4 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62E4			; 9C E4 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4897			; 4C 97 48 | Jump to address
	STA $6964			; 8D 64 69 | Audio system operation
	LDA $6AE4			; AD E4 6A | Audio system operation
	ADC $6B64			; 6D 64 6B | Add with carry (absolute)
	STA $6AE4			; 8D E4 6A | Audio system operation
	LDA $6C64			; AD 64 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CE4			; 6D E4 6C | Add with carry (absolute)
	STA $6C64			; 8D 64 6C | Audio system operation
	LDA $6DE4			; AD E4 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E64			; 6D 64 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EE4			; 9C E4 6E | Store zero to absolute
	STZ $6E64			; 9C 64 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $48C3			; 4C C3 48 | Jump to address
	STA $6DE4			; 8D E4 6D | Audio system operation
	LDA $65B8			; AD B8 65 | Audio system operation
	ADC $67B8			; 6D B8 67 | Add with carry (absolute)
	STA $65B8			; 8D B8 65 | Audio system operation
	LDA $65BA			; AD BA 65 | Audio system operation
	ADC $67BA			; 6D BA 67 | Add with carry (absolute)
	STA $65BA			; 8D BA 65 | Audio system operation
	LDA $66B8			; AD B8 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68B8			; 6D B8 68 | Add with carry (absolute)
	STA $66B8			; 8D B8 66 | Audio system operation
	LDA $66BA			; AD BA 66 | Audio system operation
	ADC $68BA			; 6D BA 68 | Add with carry (absolute)
	STA $66BA			; 8D BA 66 | Audio system operation
	LDA $69E4			; AD E4 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A64			; 6D 64 6A | Add with carry (absolute)
	STA $69E4			; 8D E4 69 | Audio system operation
	LDA $6B64			; AD 64 6B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D3
; Address: $D2C8F5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D3:
	CLC				  ; 18 | Clear carry flag
	ADC $6BE4			; 6D E4 6B | Add with carry (absolute)
	STA $6B64			; 8D 64 6B | Audio system operation
	LDA $6CE4			; AD E4 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D64			; 6D 64 6D | Add with carry (absolute)
	STA $6CE4			; 8D E4 6C | Audio system operation
	LDA $6E64			; AD 64 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EE4			; 6D E4 6E | Add with carry (absolute)
	STA $6E64			; 8D 64 6E | Audio system operation
	LDA $62E2			; AD E2 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $49FC			; 4C FC 49 | Jump to address
	LDA $63B5			; AD B5 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64B5			; AD B5 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AE3			; AD E3 6A | Audio system operation
	LDY $6962			; AC 62 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D4
; Address: $D2C928
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D4:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DE2			; AD E2 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C62			; AD 62 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D5
; Address: $D2C938
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D5:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63B4			; AD B4 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65B4			; 6D B4 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63B4			; 8D B4 63 | Audio system operation
	LDA $63B6			; AD B6 63 | Audio system operation
	ADC $65B6			; 6D B6 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63B6			; 8D B6 63 | Audio system operation
	LDA $64B4			; AD B4 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66B4			; 6D B4 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64B4			; 8D B4 64 | Audio system operation
	LDA $64B6			; AD B6 64 | Audio system operation
	ADC $66B6			; 6D B6 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64B6			; 8D B6 64 | Audio system operation
	LDA $6962			; AD 62 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69E2			; 6D E2 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D6
; Address: $D2C979
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D6:
	STZ $62E2			; 9C E2 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4983			; 4C 83 49 | Jump to address
	STA $6962			; 8D 62 69 | Audio system operation
	LDA $6AE2			; AD E2 6A | Audio system operation
	ADC $6B62			; 6D 62 6B | Add with carry (absolute)
	STA $6AE2			; 8D E2 6A | Audio system operation
	LDA $6C62			; AD 62 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CE2			; 6D E2 6C | Add with carry (absolute)
	STA $6C62			; 8D 62 6C | Audio system operation
	LDA $6DE2			; AD E2 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E62			; 6D 62 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EE2			; 9C E2 6E | Store zero to absolute
	STZ $6E62			; 9C 62 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $49AF			; 4C AF 49 | Jump to address
	STA $6DE2			; 8D E2 6D | Audio system operation
	LDA $65B4			; AD B4 65 | Audio system operation
	ADC $67B4			; 6D B4 67 | Add with carry (absolute)
	STA $65B4			; 8D B4 65 | Audio system operation
	LDA $65B6			; AD B6 65 | Audio system operation
	ADC $67B6			; 6D B6 67 | Add with carry (absolute)
	STA $65B6			; 8D B6 65 | Audio system operation
	LDA $66B4			; AD B4 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68B4			; 6D B4 68 | Add with carry (absolute)
	STA $66B4			; 8D B4 66 | Audio system operation
	LDA $66B6			; AD B6 66 | Audio system operation
	ADC $68B6			; 6D B6 68 | Add with carry (absolute)
	STA $66B6			; 8D B6 66 | Audio system operation
	LDA $69E2			; AD E2 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A62			; 6D 62 6A | Add with carry (absolute)
	STA $69E2			; 8D E2 69 | Audio system operation
	LDA $6B62			; AD 62 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BE2			; 6D E2 6B | Add with carry (absolute)
	STA $6B62			; 8D 62 6B | Audio system operation
	LDA $6CE2			; AD E2 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D62			; 6D 62 6D | Add with carry (absolute)
	STA $6CE2			; 8D E2 6C | Audio system operation
	LDA $6E62			; AD 62 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EE2			; 6D E2 6E | Add with carry (absolute)
	STA $6E62			; 8D 62 6E | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D7
; Address: $D2C9FC
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D7:
	LDA $62E0			; AD E0 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4AE8			; 4C E8 4A | Jump to address
	LDA $63B1			; AD B1 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64B1			; AD B1 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AE1			; AD E1 6A | Audio system operation
	LDY $6960			; AC 60 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D8
; Address: $D2CA14
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D8:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DE0			; AD E0 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C60			; AD 60 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4D9
; Address: $D2CA24
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4D9:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63B0			; AD B0 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65B0			; 6D B0 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63B0			; 8D B0 63 | Audio system operation
	LDA $63B2			; AD B2 63 | Audio system operation
	ADC $65B2			; 6D B2 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63B2			; 8D B2 63 | Audio system operation
	LDA $64B0			; AD B0 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66B0			; 6D B0 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64B0			; 8D B0 64 | Audio system operation
	LDA $64B2			; AD B2 64 | Audio system operation
	ADC $66B2			; 6D B2 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64B2			; 8D B2 64 | Audio system operation
	LDA $6960			; AD 60 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69E0			; 6D E0 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62E0			; 9C E0 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4A6F			; 4C 6F 4A | Jump to address
	STA $6960			; 8D 60 69 | Audio system operation
	LDA $6AE0			; AD E0 6A | Audio system operation
	ADC $6B60			; 6D 60 6B | Add with carry (absolute)
	STA $6AE0			; 8D E0 6A | Audio system operation
	LDA $6C60			; AD 60 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CE0			; 6D E0 6C | Add with carry (absolute)
	STA $6C60			; 8D 60 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4DA
; Address: $D2CA82
; Size: 125 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4DA:
	LDA $6DE0			; AD E0 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E60			; 6D 60 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EE0			; 9C E0 6E | Store zero to absolute
	STZ $6E60			; 9C 60 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4A9B			; 4C 9B 4A | Jump to address
	STA $6DE0			; 8D E0 6D | Audio system operation
	LDA $65B0			; AD B0 65 | Audio system operation
	ADC $67B0			; 6D B0 67 | Add with carry (absolute)
	STA $65B0			; 8D B0 65 | Audio system operation
	LDA $65B2			; AD B2 65 | Audio system operation
	ADC $67B2			; 6D B2 67 | Add with carry (absolute)
	STA $65B2			; 8D B2 65 | Audio system operation
	LDA $66B0			; AD B0 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68B0			; 6D B0 68 | Add with carry (absolute)
	STA $66B0			; 8D B0 66 | Audio system operation
	LDA $66B2			; AD B2 66 | Audio system operation
	ADC $68B2			; 6D B2 68 | Add with carry (absolute)
	STA $66B2			; 8D B2 66 | Audio system operation
	LDA $69E0			; AD E0 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A60			; 6D 60 6A | Add with carry (absolute)
	STA $69E0			; 8D E0 69 | Audio system operation
	LDA $6B60			; AD 60 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BE0			; 6D E0 6B | Add with carry (absolute)
	STA $6B60			; 8D 60 6B | Audio system operation
	LDA $6CE0			; AD E0 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D60			; 6D 60 6D | Add with carry (absolute)
	STA $6CE0			; 8D E0 6C | Audio system operation
	LDA $6E60			; AD 60 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EE0			; 6D E0 6E | Add with carry (absolute)
	STA $6E60			; 8D 60 6E | Audio system operation
	LDA $62DE			; AD DE 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4BD4			; 4C D4 4B | Jump to address
	LDA $63AD			; AD AD 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64AD			; AD AD 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ADF			; AD DF 6A | Audio system operation
	LDY $695E			; AC 5E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4DC
; Address: $D2CB05
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4DC:
	LDA $6DDE			; AD DE 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C5E			; AD 5E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4DD
; Address: $D2CB10
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4DD:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63AC			; AD AC 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65AC			; 6D AC 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63AC			; 8D AC 63 | Audio system operation
	LDA $63AE			; AD AE 63 | Audio system operation
	ADC $65AE			; 6D AE 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63AE			; 8D AE 63 | Audio system operation
	LDA $64AC			; AD AC 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66AC			; 6D AC 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64AC			; 8D AC 64 | Audio system operation
	LDA $64AE			; AD AE 64 | Audio system operation
	ADC $66AE			; 6D AE 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64AE			; 8D AE 64 | Audio system operation
	LDA $695E			; AD 5E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69DE			; 6D DE 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62DE			; 9C DE 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4B5B			; 4C 5B 4B | Jump to address
	STA $695E			; 8D 5E 69 | Audio system operation
	LDA $6ADE			; AD DE 6A | Audio system operation
	ADC $6B5E			; 6D 5E 6B | Add with carry (absolute)
	STA $6ADE			; 8D DE 6A | Audio system operation
	LDA $6C5E			; AD 5E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CDE			; 6D DE 6C | Add with carry (absolute)
	STA $6C5E			; 8D 5E 6C | Audio system operation
	LDA $6DDE			; AD DE 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E5E			; 6D 5E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EDE			; 9C DE 6E | Store zero to absolute
	STZ $6E5E			; 9C 5E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4B87			; 4C 87 4B | Jump to address
	STA $6DDE			; 8D DE 6D | Audio system operation
	LDA $65AC			; AD AC 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4DE
; Address: $D2CB8A
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4DE:
	ADC $67AC			; 6D AC 67 | Add with carry (absolute)
	STA $65AC			; 8D AC 65 | Audio system operation
	LDA $65AE			; AD AE 65 | Audio system operation
	ADC $67AE			; 6D AE 67 | Add with carry (absolute)
	STA $65AE			; 8D AE 65 | Audio system operation
	LDA $66AC			; AD AC 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68AC			; 6D AC 68 | Add with carry (absolute)
	STA $66AC			; 8D AC 66 | Audio system operation
	LDA $66AE			; AD AE 66 | Audio system operation
	ADC $68AE			; 6D AE 68 | Add with carry (absolute)
	STA $66AE			; 8D AE 66 | Audio system operation
	LDA $69DE			; AD DE 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A5E			; 6D 5E 6A | Add with carry (absolute)
	STA $69DE			; 8D DE 69 | Audio system operation
	LDA $6B5E			; AD 5E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BDE			; 6D DE 6B | Add with carry (absolute)
	STA $6B5E			; 8D 5E 6B | Audio system operation
	LDA $6CDE			; AD DE 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D5E			; 6D 5E 6D | Add with carry (absolute)
	STA $6CDE			; 8D DE 6C | Audio system operation
	LDA $6E5E			; AD 5E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EDE			; 6D DE 6E | Add with carry (absolute)
	STA $6E5E			; 8D 5E 6E | Audio system operation
	LDA $62DC			; AD DC 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4CC0			; 4C C0 4C | Jump to address
	LDA $63A9			; AD A9 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64A9			; AD A9 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ADD			; AD DD 6A | Audio system operation
	LDY $695C			; AC 5C 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4DF
; Address: $D2CBEC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4DF:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DDC			; AD DC 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C5C			; AD 5C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E0
; Address: $D2CBFC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E0:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63A8			; AD A8 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65A8			; 6D A8 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63A8			; 8D A8 63 | Audio system operation
	LDA $63AA			; AD AA 63 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E1
; Address: $D2CC0F
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E1:
	ADC $65AA			; 6D AA 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63AA			; 8D AA 63 | Audio system operation
	LDA $64A8			; AD A8 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66A8			; 6D A8 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64A8			; 8D A8 64 | Audio system operation
	LDA $64AA			; AD AA 64 | Audio system operation
	ADC $66AA			; 6D AA 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64AA			; 8D AA 64 | Audio system operation
	LDA $695C			; AD 5C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69DC			; 6D DC 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62DC			; 9C DC 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4C47			; 4C 47 4C | Jump to address
	STA $695C			; 8D 5C 69 | Audio system operation
	LDA $6ADC			; AD DC 6A | Audio system operation
	ADC $6B5C			; 6D 5C 6B | Add with carry (absolute)
	STA $6ADC			; 8D DC 6A | Audio system operation
	LDA $6C5C			; AD 5C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CDC			; 6D DC 6C | Add with carry (absolute)
	STA $6C5C			; 8D 5C 6C | Audio system operation
	LDA $6DDC			; AD DC 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E5C			; 6D 5C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EDC			; 9C DC 6E | Store zero to absolute
	STZ $6E5C			; 9C 5C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4C73			; 4C 73 4C | Jump to address
	STA $6DDC			; 8D DC 6D | Audio system operation
	LDA $65A8			; AD A8 65 | Audio system operation
	ADC $67A8			; 6D A8 67 | Add with carry (absolute)
	STA $65A8			; 8D A8 65 | Audio system operation
	LDA $65AA			; AD AA 65 | Audio system operation
	ADC $67AA			; 6D AA 67 | Add with carry (absolute)
	STA $65AA			; 8D AA 65 | Audio system operation
	LDA $66A8			; AD A8 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68A8			; 6D A8 68 | Add with carry (absolute)
	STA $66A8			; 8D A8 66 | Audio system operation
	LDA $66AA			; AD AA 66 | Audio system operation
	ADC $68AA			; 6D AA 68 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E2
; Address: $D2CC95
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E2:
	STA $66AA			; 8D AA 66 | Audio system operation
	LDA $69DC			; AD DC 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A5C			; 6D 5C 6A | Add with carry (absolute)
	STA $69DC			; 8D DC 69 | Audio system operation
	LDA $6B5C			; AD 5C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BDC			; 6D DC 6B | Add with carry (absolute)
	STA $6B5C			; 8D 5C 6B | Audio system operation
	LDA $6CDC			; AD DC 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D5C			; 6D 5C 6D | Add with carry (absolute)
	STA $6CDC			; 8D DC 6C | Audio system operation
	LDA $6E5C			; AD 5C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EDC			; 6D DC 6E | Add with carry (absolute)
	STA $6E5C			; 8D 5C 6E | Audio system operation
	LDA $62DA			; AD DA 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4DAC			; 4C AC 4D | Jump to address
	LDA $63A5			; AD A5 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64A5			; AD A5 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ADB			; AD DB 6A | Audio system operation
	LDY $695A			; AC 5A 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E3
; Address: $D2CCD8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E3:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DDA			; AD DA 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C5A			; AD 5A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E4
; Address: $D2CCE8
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E4:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63A4			; AD A4 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65A4			; 6D A4 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63A4			; 8D A4 63 | Audio system operation
	LDA $63A6			; AD A6 63 | Audio system operation
	ADC $65A6			; 6D A6 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63A6			; 8D A6 63 | Audio system operation
	LDA $64A4			; AD A4 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66A4			; 6D A4 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64A4			; 8D A4 64 | Audio system operation
	LDA $64A6			; AD A6 64 | Audio system operation
	ADC $66A6			; 6D A6 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E5
; Address: $D2CD1A
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E5:
	STA $64A6			; 8D A6 64 | Audio system operation
	LDA $695A			; AD 5A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69DA			; 6D DA 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62DA			; 9C DA 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4D33			; 4C 33 4D | Jump to address
	STA $695A			; 8D 5A 69 | Audio system operation
	LDA $6ADA			; AD DA 6A | Audio system operation
	ADC $6B5A			; 6D 5A 6B | Add with carry (absolute)
	STA $6ADA			; 8D DA 6A | Audio system operation
	LDA $6C5A			; AD 5A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CDA			; 6D DA 6C | Add with carry (absolute)
	STA $6C5A			; 8D 5A 6C | Audio system operation
	LDA $6DDA			; AD DA 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E5A			; 6D 5A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EDA			; 9C DA 6E | Store zero to absolute
	STZ $6E5A			; 9C 5A 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4D5F			; 4C 5F 4D | Jump to address
	STA $6DDA			; 8D DA 6D | Audio system operation
	LDA $65A4			; AD A4 65 | Audio system operation
	ADC $67A4			; 6D A4 67 | Add with carry (absolute)
	STA $65A4			; 8D A4 65 | Audio system operation
	LDA $65A6			; AD A6 65 | Audio system operation
	ADC $67A6			; 6D A6 67 | Add with carry (absolute)
	STA $65A6			; 8D A6 65 | Audio system operation
	LDA $66A4			; AD A4 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68A4			; 6D A4 68 | Add with carry (absolute)
	STA $66A4			; 8D A4 66 | Audio system operation
	LDA $66A6			; AD A6 66 | Audio system operation
	ADC $68A6			; 6D A6 68 | Add with carry (absolute)
	STA $66A6			; 8D A6 66 | Audio system operation
	LDA $69DA			; AD DA 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A5A			; 6D 5A 6A | Add with carry (absolute)
	STA $69DA			; 8D DA 69 | Audio system operation
	LDA $6B5A			; AD 5A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BDA			; 6D DA 6B | Add with carry (absolute)
	STA $6B5A			; 8D 5A 6B | Audio system operation
	LDA $6CDA			; AD DA 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E6
; Address: $D2CD9C
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E6:
	ADC $6D5A			; 6D 5A 6D | Add with carry (absolute)
	STA $6CDA			; 8D DA 6C | Audio system operation
	LDA $6E5A			; AD 5A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EDA			; 6D DA 6E | Add with carry (absolute)
	STA $6E5A			; 8D 5A 6E | Audio system operation
	LDA $62D8			; AD D8 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4E98			; 4C 98 4E | Jump to address
	LDA $63A1			; AD A1 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $64A1			; AD A1 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AD9			; AD D9 6A | Audio system operation
	LDY $6958			; AC 58 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E7
; Address: $D2CDC4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E7:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DD8			; AD D8 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C58			; AD 58 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E8
; Address: $D2CDD4
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E8:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $63A0			; AD A0 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $65A0			; 6D A0 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $63A0			; 8D A0 63 | Audio system operation
	LDA $63A2			; AD A2 63 | Audio system operation
	ADC $65A2			; 6D A2 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $63A2			; 8D A2 63 | Audio system operation
	LDA $64A0			; AD A0 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $66A0			; 6D A0 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $64A0			; 8D A0 64 | Audio system operation
	LDA $64A2			; AD A2 64 | Audio system operation
	ADC $66A2			; 6D A2 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $64A2			; 8D A2 64 | Audio system operation
	LDA $6958			; AD 58 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69D8			; 6D D8 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62D8			; 9C D8 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4E1F			; 4C 1F 4E | Jump to address
	STA $6958			; 8D 58 69 | Audio system operation
	LDA $6AD8			; AD D8 6A | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4E9
; Address: $D2CE22
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4E9:
	ADC $6B58			; 6D 58 6B | Add with carry (absolute)
	STA $6AD8			; 8D D8 6A | Audio system operation
	LDA $6C58			; AD 58 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CD8			; 6D D8 6C | Add with carry (absolute)
	STA $6C58			; 8D 58 6C | Audio system operation
	LDA $6DD8			; AD D8 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E58			; 6D 58 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6ED8			; 9C D8 6E | Store zero to absolute
	STZ $6E58			; 9C 58 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4E4B			; 4C 4B 4E | Jump to address
	STA $6DD8			; 8D D8 6D | Audio system operation
	LDA $65A0			; AD A0 65 | Audio system operation
	ADC $67A0			; 6D A0 67 | Add with carry (absolute)
	STA $65A0			; 8D A0 65 | Audio system operation
	LDA $65A2			; AD A2 65 | Audio system operation
	ADC $67A2			; 6D A2 67 | Add with carry (absolute)
	STA $65A2			; 8D A2 65 | Audio system operation
	LDA $66A0			; AD A0 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $68A0			; 6D A0 68 | Add with carry (absolute)
	STA $66A0			; 8D A0 66 | Audio system operation
	LDA $66A2			; AD A2 66 | Audio system operation
	ADC $68A2			; 6D A2 68 | Add with carry (absolute)
	STA $66A2			; 8D A2 66 | Audio system operation
	LDA $69D8			; AD D8 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A58			; 6D 58 6A | Add with carry (absolute)
	STA $69D8			; 8D D8 69 | Audio system operation
	LDA $6B58			; AD 58 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BD8			; 6D D8 6B | Add with carry (absolute)
	STA $6B58			; 8D 58 6B | Audio system operation
	LDA $6CD8			; AD D8 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D58			; 6D 58 6D | Add with carry (absolute)
	STA $6CD8			; 8D D8 6C | Audio system operation
	LDA $6E58			; AD 58 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ED8			; 6D D8 6E | Add with carry (absolute)
	STA $6E58			; 8D 58 6E | Audio system operation
	LDA $62D6			; AD D6 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $4F84			; 4C 84 4F | Jump to address
	LDA $639D			; AD 9D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4EA
; Address: $D2CEA5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4EA:
	LDA $649D			; AD 9D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AD7			; AD D7 6A | Audio system operation
	LDY $6956			; AC 56 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4EB
; Address: $D2CEB0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4EB:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DD6			; AD D6 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C56			; AD 56 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4EC
; Address: $D2CEC0
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4EC:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $639C			; AD 9C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $659C			; 6D 9C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $639C			; 8D 9C 63 | Audio system operation
	LDA $639E			; AD 9E 63 | Audio system operation
	ADC $659E			; 6D 9E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $639E			; 8D 9E 63 | Audio system operation
	LDA $649C			; AD 9C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $669C			; 6D 9C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $649C			; 8D 9C 64 | Audio system operation
	LDA $649E			; AD 9E 64 | Audio system operation
	ADC $669E			; 6D 9E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $649E			; 8D 9E 64 | Audio system operation
	LDA $6956			; AD 56 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69D6			; 6D D6 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62D6			; 9C D6 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4F0B			; 4C 0B 4F | Jump to address
	STA $6956			; 8D 56 69 | Audio system operation
	LDA $6AD6			; AD D6 6A | Audio system operation
	ADC $6B56			; 6D 56 6B | Add with carry (absolute)
	STA $6AD6			; 8D D6 6A | Audio system operation
	LDA $6C56			; AD 56 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CD6			; 6D D6 6C | Add with carry (absolute)
	STA $6C56			; 8D 56 6C | Audio system operation
	LDA $6DD6			; AD D6 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E56			; 6D 56 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4ED
; Address: $D2CF2A
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4ED:
	STZ $6ED6			; 9C D6 6E | Store zero to absolute
	STZ $6E56			; 9C 56 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4F37			; 4C 37 4F | Jump to address
	STA $6DD6			; 8D D6 6D | Audio system operation
	LDA $659C			; AD 9C 65 | Audio system operation
	ADC $679C			; 6D 9C 67 | Add with carry (absolute)
	STA $659C			; 8D 9C 65 | Audio system operation
	LDA $659E			; AD 9E 65 | Audio system operation
	ADC $679E			; 6D 9E 67 | Add with carry (absolute)
	STA $659E			; 8D 9E 65 | Audio system operation
	LDA $669C			; AD 9C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $689C			; 6D 9C 68 | Add with carry (absolute)
	STA $669C			; 8D 9C 66 | Audio system operation
	LDA $669E			; AD 9E 66 | Audio system operation
	ADC $689E			; 6D 9E 68 | Add with carry (absolute)
	STA $669E			; 8D 9E 66 | Audio system operation
	LDA $69D6			; AD D6 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A56			; 6D 56 6A | Add with carry (absolute)
	STA $69D6			; 8D D6 69 | Audio system operation
	LDA $6B56			; AD 56 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BD6			; 6D D6 6B | Add with carry (absolute)
	STA $6B56			; 8D 56 6B | Audio system operation
	LDA $6CD6			; AD D6 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D56			; 6D 56 6D | Add with carry (absolute)
	STA $6CD6			; 8D D6 6C | Audio system operation
	LDA $6E56			; AD 56 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ED6			; 6D D6 6E | Add with carry (absolute)
	STA $6E56			; 8D 56 6E | Audio system operation
	LDA $62D4			; AD D4 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5070			; 4C 70 50 | Jump to address
	LDA $6399			; AD 99 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6499			; AD 99 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AD5			; AD D5 6A | Audio system operation
	LDY $6954			; AC 54 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4EE
; Address: $D2CF9C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4EE:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DD4			; AD D4 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C54			; AD 54 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F0
; Address: $D2CFAF
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F0:
	LDA $6398			; AD 98 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6598			; 6D 98 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6398			; 8D 98 63 | Audio system operation
	LDA $639A			; AD 9A 63 | Audio system operation
	ADC $659A			; 6D 9A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $639A			; 8D 9A 63 | Audio system operation
	LDA $6498			; AD 98 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6698			; 6D 98 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6498			; 8D 98 64 | Audio system operation
	LDA $649A			; AD 9A 64 | Audio system operation
	ADC $669A			; 6D 9A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $649A			; 8D 9A 64 | Audio system operation
	LDA $6954			; AD 54 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69D4			; 6D D4 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62D4			; 9C D4 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $4FF7			; 4C F7 4F | Jump to address
	STA $6954			; 8D 54 69 | Audio system operation
	LDA $6AD4			; AD D4 6A | Audio system operation
	ADC $6B54			; 6D 54 6B | Add with carry (absolute)
	STA $6AD4			; 8D D4 6A | Audio system operation
	LDA $6C54			; AD 54 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CD4			; 6D D4 6C | Add with carry (absolute)
	STA $6C54			; 8D 54 6C | Audio system operation
	LDA $6DD4			; AD D4 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E54			; 6D 54 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6ED4			; 9C D4 6E | Store zero to absolute
	STZ $6E54			; 9C 54 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5023			; 4C 23 50 | Jump to address
	STA $6DD4			; 8D D4 6D | Audio system operation
	LDA $6598			; AD 98 65 | Audio system operation
	ADC $6798			; 6D 98 67 | Add with carry (absolute)
	STA $6598			; 8D 98 65 | Audio system operation
	LDA $659A			; AD 9A 65 | Audio system operation
	ADC $679A			; 6D 9A 67 | Add with carry (absolute)
	STA $659A			; 8D 9A 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F1
; Address: $D2D035
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F1:
	LDA $6698			; AD 98 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6898			; 6D 98 68 | Add with carry (absolute)
	STA $6698			; 8D 98 66 | Audio system operation
	LDA $669A			; AD 9A 66 | Audio system operation
	ADC $689A			; 6D 9A 68 | Add with carry (absolute)
	STA $669A			; 8D 9A 66 | Audio system operation
	LDA $69D4			; AD D4 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A54			; 6D 54 6A | Add with carry (absolute)
	STA $69D4			; 8D D4 69 | Audio system operation
	LDA $6B54			; AD 54 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BD4			; 6D D4 6B | Add with carry (absolute)
	STA $6B54			; 8D 54 6B | Audio system operation
	LDA $6CD4			; AD D4 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D54			; 6D 54 6D | Add with carry (absolute)
	STA $6CD4			; 8D D4 6C | Audio system operation
	LDA $6E54			; AD 54 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ED4			; 6D D4 6E | Add with carry (absolute)
	STA $6E54			; 8D 54 6E | Audio system operation
	LDA $62D2			; AD D2 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $515C			; 4C 5C 51 | Jump to address
	LDA $6395			; AD 95 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6495			; AD 95 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AD3			; AD D3 6A | Audio system operation
	LDY $6952			; AC 52 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F2
; Address: $D2D088
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F2:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DD2			; AD D2 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C52			; AD 52 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F3
; Address: $D2D098
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F3:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6394			; AD 94 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6594			; 6D 94 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6394			; 8D 94 63 | Audio system operation
	LDA $6396			; AD 96 63 | Audio system operation
	ADC $6596			; 6D 96 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6396			; 8D 96 63 | Audio system operation
	LDA $6494			; AD 94 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F4
; Address: $D2D0B8
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F4:
	ADC $6694			; 6D 94 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6494			; 8D 94 64 | Audio system operation
	LDA $6496			; AD 96 64 | Audio system operation
	ADC $6696			; 6D 96 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6496			; 8D 96 64 | Audio system operation
	LDA $6952			; AD 52 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69D2			; 6D D2 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62D2			; 9C D2 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $50E3			; 4C E3 50 | Jump to address
	STA $6952			; 8D 52 69 | Audio system operation
	LDA $6AD2			; AD D2 6A | Audio system operation
	ADC $6B52			; 6D 52 6B | Add with carry (absolute)
	STA $6AD2			; 8D D2 6A | Audio system operation
	LDA $6C52			; AD 52 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CD2			; 6D D2 6C | Add with carry (absolute)
	STA $6C52			; 8D 52 6C | Audio system operation
	LDA $6DD2			; AD D2 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E52			; 6D 52 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6ED2			; 9C D2 6E | Store zero to absolute
	STZ $6E52			; 9C 52 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $510F			; 4C 0F 51 | Jump to address
	STA $6DD2			; 8D D2 6D | Audio system operation
	LDA $6594			; AD 94 65 | Audio system operation
	ADC $6794			; 6D 94 67 | Add with carry (absolute)
	STA $6594			; 8D 94 65 | Audio system operation
	LDA $6596			; AD 96 65 | Audio system operation
	ADC $6796			; 6D 96 67 | Add with carry (absolute)
	STA $6596			; 8D 96 65 | Audio system operation
	LDA $6694			; AD 94 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6894			; 6D 94 68 | Add with carry (absolute)
	STA $6694			; 8D 94 66 | Audio system operation
	LDA $6696			; AD 96 66 | Audio system operation
	ADC $6896			; 6D 96 68 | Add with carry (absolute)
	STA $6696			; 8D 96 66 | Audio system operation
	LDA $69D2			; AD D2 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A52			; 6D 52 6A | Add with carry (absolute)
	STA $69D2			; 8D D2 69 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F5
; Address: $D2D13E
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F5:
	LDA $6B52			; AD 52 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BD2			; 6D D2 6B | Add with carry (absolute)
	STA $6B52			; 8D 52 6B | Audio system operation
	LDA $6CD2			; AD D2 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D52			; 6D 52 6D | Add with carry (absolute)
	STA $6CD2			; 8D D2 6C | Audio system operation
	LDA $6E52			; AD 52 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ED2			; 6D D2 6E | Add with carry (absolute)
	STA $6E52			; 8D 52 6E | Audio system operation
	LDA $62D0			; AD D0 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5248			; 4C 48 52 | Jump to address
	LDA $6391			; AD 91 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6491			; AD 91 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AD1			; AD D1 6A | Audio system operation
	LDY $6950			; AC 50 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F6
; Address: $D2D174
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F6:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DD0			; AD D0 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C50			; AD 50 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F7
; Address: $D2D184
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F7:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6390			; AD 90 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6590			; 6D 90 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6390			; 8D 90 63 | Audio system operation
	LDA $6392			; AD 92 63 | Audio system operation
	ADC $6592			; 6D 92 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6392			; 8D 92 63 | Audio system operation
	LDA $6490			; AD 90 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6690			; 6D 90 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6490			; 8D 90 64 | Audio system operation
	LDA $6492			; AD 92 64 | Audio system operation
	ADC $6692			; 6D 92 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6492			; 8D 92 64 | Audio system operation
	LDA $6950			; AD 50 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69D0			; 6D D0 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F8
; Address: $D2D1C3
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F8:
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62D0			; 9C D0 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $51CF			; 4C CF 51 | Jump to address
	STA $6950			; 8D 50 69 | Audio system operation
	LDA $6AD0			; AD D0 6A | Audio system operation
	ADC $6B50			; 6D 50 6B | Add with carry (absolute)
	STA $6AD0			; 8D D0 6A | Audio system operation
	LDA $6C50			; AD 50 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CD0			; 6D D0 6C | Add with carry (absolute)
	STA $6C50			; 8D 50 6C | Audio system operation
	LDA $6DD0			; AD D0 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E50			; 6D 50 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6ED0			; 9C D0 6E | Store zero to absolute
	STZ $6E50			; 9C 50 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $51FB			; 4C FB 51 | Jump to address
	STA $6DD0			; 8D D0 6D | Audio system operation
	LDA $6590			; AD 90 65 | Audio system operation
	ADC $6790			; 6D 90 67 | Add with carry (absolute)
	STA $6590			; 8D 90 65 | Audio system operation
	LDA $6592			; AD 92 65 | Audio system operation
	ADC $6792			; 6D 92 67 | Add with carry (absolute)
	STA $6592			; 8D 92 65 | Audio system operation
	LDA $6690			; AD 90 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6890			; 6D 90 68 | Add with carry (absolute)
	STA $6690			; 8D 90 66 | Audio system operation
	LDA $6692			; AD 92 66 | Audio system operation
	ADC $6892			; 6D 92 68 | Add with carry (absolute)
	STA $6692			; 8D 92 66 | Audio system operation
	LDA $69D0			; AD D0 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A50			; 6D 50 6A | Add with carry (absolute)
	STA $69D0			; 8D D0 69 | Audio system operation
	LDA $6B50			; AD 50 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BD0			; 6D D0 6B | Add with carry (absolute)
	STA $6B50			; 8D 50 6B | Audio system operation
	LDA $6CD0			; AD D0 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D50			; 6D 50 6D | Add with carry (absolute)
	STA $6CD0			; 8D D0 6C | Audio system operation
	LDA $6E50			; AD 50 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ED0			; 6D D0 6E | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4F9
; Address: $D2D245
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4F9:
	STA $6E50			; 8D 50 6E | Audio system operation
	LDA $62CE			; AD CE 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5334			; 4C 34 53 | Jump to address
	LDA $638D			; AD 8D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $648D			; AD 8D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ACF			; AD CF 6A | Audio system operation
	LDY $694E			; AC 4E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4FA
; Address: $D2D260
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4FA:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DCE			; AD CE 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C4E			; AD 4E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4FB
; Address: $D2D270
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4FB:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $638C			; AD 8C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $658C			; 6D 8C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $638C			; 8D 8C 63 | Audio system operation
	LDA $638E			; AD 8E 63 | Audio system operation
	ADC $658E			; 6D 8E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $638E			; 8D 8E 63 | Audio system operation
	LDA $648C			; AD 8C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $668C			; 6D 8C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $648C			; 8D 8C 64 | Audio system operation
	LDA $648E			; AD 8E 64 | Audio system operation
	ADC $668E			; 6D 8E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $648E			; 8D 8E 64 | Audio system operation
	LDA $694E			; AD 4E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69CE			; 6D CE 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62CE			; 9C CE 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $52BB			; 4C BB 52 | Jump to address
	STA $694E			; 8D 4E 69 | Audio system operation
	LDA $6ACE			; AD CE 6A | Audio system operation
	ADC $6B4E			; 6D 4E 6B | Add with carry (absolute)
	STA $6ACE			; 8D CE 6A | Audio system operation
	LDA $6C4E			; AD 4E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CCE			; 6D CE 6C | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4FC
; Address: $D2D2CB
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4FC:
	STA $6C4E			; 8D 4E 6C | Audio system operation
	LDA $6DCE			; AD CE 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E4E			; 6D 4E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6ECE			; 9C CE 6E | Store zero to absolute
	STZ $6E4E			; 9C 4E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $52E7			; 4C E7 52 | Jump to address
	STA $6DCE			; 8D CE 6D | Audio system operation
	LDA $658C			; AD 8C 65 | Audio system operation
	ADC $678C			; 6D 8C 67 | Add with carry (absolute)
	STA $658C			; 8D 8C 65 | Audio system operation
	LDA $658E			; AD 8E 65 | Audio system operation
	ADC $678E			; 6D 8E 67 | Add with carry (absolute)
	STA $658E			; 8D 8E 65 | Audio system operation
	LDA $668C			; AD 8C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $688C			; 6D 8C 68 | Add with carry (absolute)
	STA $668C			; 8D 8C 66 | Audio system operation
	LDA $668E			; AD 8E 66 | Audio system operation
	ADC $688E			; 6D 8E 68 | Add with carry (absolute)
	STA $668E			; 8D 8E 66 | Audio system operation
	LDA $69CE			; AD CE 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A4E			; 6D 4E 6A | Add with carry (absolute)
	STA $69CE			; 8D CE 69 | Audio system operation
	LDA $6B4E			; AD 4E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BCE			; 6D CE 6B | Add with carry (absolute)
	STA $6B4E			; 8D 4E 6B | Audio system operation
	LDA $6CCE			; AD CE 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D4E			; 6D 4E 6D | Add with carry (absolute)
	STA $6CCE			; 8D CE 6C | Audio system operation
	LDA $6E4E			; AD 4E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ECE			; 6D CE 6E | Add with carry (absolute)
	STA $6E4E			; 8D 4E 6E | Audio system operation
	LDA $62CC			; AD CC 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5420			; 4C 20 54 | Jump to address
	LDA $6389			; AD 89 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6489			; AD 89 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ACD			; AD CD 6A | Audio system operation
	LDY $694C			; AC 4C 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4FE
; Address: $D2D34F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4FE:
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DCC			; AD CC 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C4C			; AD 4C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_4FF
; Address: $D2D35C
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_4FF:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6388			; AD 88 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6588			; 6D 88 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6388			; 8D 88 63 | Audio system operation
	LDA $638A			; AD 8A 63 | Audio system operation
	ADC $658A			; 6D 8A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $638A			; 8D 8A 63 | Audio system operation
	LDA $6488			; AD 88 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6688			; 6D 88 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6488			; 8D 88 64 | Audio system operation
	LDA $648A			; AD 8A 64 | Audio system operation
	ADC $668A			; 6D 8A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $648A			; 8D 8A 64 | Audio system operation
	LDA $694C			; AD 4C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69CC			; 6D CC 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62CC			; 9C CC 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $53A7			; 4C A7 53 | Jump to address
	STA $694C			; 8D 4C 69 | Audio system operation
	LDA $6ACC			; AD CC 6A | Audio system operation
	ADC $6B4C			; 6D 4C 6B | Add with carry (absolute)
	STA $6ACC			; 8D CC 6A | Audio system operation
	LDA $6C4C			; AD 4C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CCC			; 6D CC 6C | Add with carry (absolute)
	STA $6C4C			; 8D 4C 6C | Audio system operation
	LDA $6DCC			; AD CC 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E4C			; 6D 4C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6ECC			; 9C CC 6E | Store zero to absolute
	STZ $6E4C			; 9C 4C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $53D3			; 4C D3 53 | Jump to address
	STA $6DCC			; 8D CC 6D | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_500
; Address: $D2D3D3
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_500:
	LDA $6588			; AD 88 65 | Audio system operation
	ADC $6788			; 6D 88 67 | Add with carry (absolute)
	STA $6588			; 8D 88 65 | Audio system operation
	LDA $658A			; AD 8A 65 | Audio system operation
	ADC $678A			; 6D 8A 67 | Add with carry (absolute)
	STA $658A			; 8D 8A 65 | Audio system operation
	LDA $6688			; AD 88 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6888			; 6D 88 68 | Add with carry (absolute)
	STA $6688			; 8D 88 66 | Audio system operation
	LDA $668A			; AD 8A 66 | Audio system operation
	ADC $688A			; 6D 8A 68 | Add with carry (absolute)
	STA $668A			; 8D 8A 66 | Audio system operation
	LDA $69CC			; AD CC 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A4C			; 6D 4C 6A | Add with carry (absolute)
	STA $69CC			; 8D CC 69 | Audio system operation
	LDA $6B4C			; AD 4C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BCC			; 6D CC 6B | Add with carry (absolute)
	STA $6B4C			; 8D 4C 6B | Audio system operation
	LDA $6CCC			; AD CC 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D4C			; 6D 4C 6D | Add with carry (absolute)
	STA $6CCC			; 8D CC 6C | Audio system operation
	LDA $6E4C			; AD 4C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ECC			; 6D CC 6E | Add with carry (absolute)
	STA $6E4C			; 8D 4C 6E | Audio system operation
	LDA $62CA			; AD CA 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $550C			; 4C 0C 55 | Jump to address
	LDA $6385			; AD 85 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6485			; AD 85 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ACB			; AD CB 6A | Audio system operation
	LDY $694A			; AC 4A 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_501
; Address: $D2D438
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_501:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DCA			; AD CA 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C4A			; AD 4A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_502
; Address: $D2D448
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_502:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6384			; AD 84 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6584			; 6D 84 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6384			; 8D 84 63 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_503
; Address: $D2D458
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_503:
	LDA $6386			; AD 86 63 | Audio system operation
	ADC $6586			; 6D 86 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6386			; 8D 86 63 | Audio system operation
	LDA $6484			; AD 84 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6684			; 6D 84 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6484			; 8D 84 64 | Audio system operation
	LDA $6486			; AD 86 64 | Audio system operation
	ADC $6686			; 6D 86 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6486			; 8D 86 64 | Audio system operation
	LDA $694A			; AD 4A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69CA			; 6D CA 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62CA			; 9C CA 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5493			; 4C 93 54 | Jump to address
	STA $694A			; 8D 4A 69 | Audio system operation
	LDA $6ACA			; AD CA 6A | Audio system operation
	ADC $6B4A			; 6D 4A 6B | Add with carry (absolute)
	STA $6ACA			; 8D CA 6A | Audio system operation
	LDA $6C4A			; AD 4A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CCA			; 6D CA 6C | Add with carry (absolute)
	STA $6C4A			; 8D 4A 6C | Audio system operation
	LDA $6DCA			; AD CA 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E4A			; 6D 4A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6ECA			; 9C CA 6E | Store zero to absolute
	STZ $6E4A			; 9C 4A 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $54BF			; 4C BF 54 | Jump to address
	STA $6DCA			; 8D CA 6D | Audio system operation
	LDA $6584			; AD 84 65 | Audio system operation
	ADC $6784			; 6D 84 67 | Add with carry (absolute)
	STA $6584			; 8D 84 65 | Audio system operation
	LDA $6586			; AD 86 65 | Audio system operation
	ADC $6786			; 6D 86 67 | Add with carry (absolute)
	STA $6586			; 8D 86 65 | Audio system operation
	LDA $6684			; AD 84 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6884			; 6D 84 68 | Add with carry (absolute)
	STA $6684			; 8D 84 66 | Audio system operation
	LDA $6686			; AD 86 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_504
; Address: $D2D4DE
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_504:
	ADC $6886			; 6D 86 68 | Add with carry (absolute)
	STA $6686			; 8D 86 66 | Audio system operation
	LDA $69CA			; AD CA 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A4A			; 6D 4A 6A | Add with carry (absolute)
	STA $69CA			; 8D CA 69 | Audio system operation
	LDA $6B4A			; AD 4A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BCA			; 6D CA 6B | Add with carry (absolute)
	STA $6B4A			; 8D 4A 6B | Audio system operation
	LDA $6CCA			; AD CA 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D4A			; 6D 4A 6D | Add with carry (absolute)
	STA $6CCA			; 8D CA 6C | Audio system operation
	LDA $6E4A			; AD 4A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6ECA			; 6D CA 6E | Add with carry (absolute)
	STA $6E4A			; 8D 4A 6E | Audio system operation
	LDA $62C8			; AD C8 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $55F8			; 4C F8 55 | Jump to address
	LDA $6381			; AD 81 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6481			; AD 81 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AC9			; AD C9 6A | Audio system operation
	LDY $6948			; AC 48 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_505
; Address: $D2D524
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_505:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DC8			; AD C8 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C48			; AD 48 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_506
; Address: $D2D534
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_506:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6380			; AD 80 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6580			; 6D 80 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6380			; 8D 80 63 | Audio system operation
	LDA $6382			; AD 82 63 | Audio system operation
	ADC $6582			; 6D 82 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6382			; 8D 82 63 | Audio system operation
	LDA $6480			; AD 80 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6680			; 6D 80 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6480			; 8D 80 64 | Audio system operation
	LDA $6482			; AD 82 64 | Audio system operation
	ADC $6682			; 6D 82 66 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_507
; Address: $D2D563
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_507:
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6482			; 8D 82 64 | Audio system operation
	LDA $6948			; AD 48 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69C8			; 6D C8 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62C8			; 9C C8 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $557F			; 4C 7F 55 | Jump to address
	STA $6948			; 8D 48 69 | Audio system operation
	LDA $6AC8			; AD C8 6A | Audio system operation
	ADC $6B48			; 6D 48 6B | Add with carry (absolute)
	STA $6AC8			; 8D C8 6A | Audio system operation
	LDA $6C48			; AD 48 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CC8			; 6D C8 6C | Add with carry (absolute)
	STA $6C48			; 8D 48 6C | Audio system operation
	LDA $6DC8			; AD C8 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E48			; 6D 48 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EC8			; 9C C8 6E | Store zero to absolute
	STZ $6E48			; 9C 48 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $55AB			; 4C AB 55 | Jump to address
	STA $6DC8			; 8D C8 6D | Audio system operation
	LDA $6580			; AD 80 65 | Audio system operation
	ADC $6780			; 6D 80 67 | Add with carry (absolute)
	STA $6580			; 8D 80 65 | Audio system operation
	LDA $6582			; AD 82 65 | Audio system operation
	ADC $6782			; 6D 82 67 | Add with carry (absolute)
	STA $6582			; 8D 82 65 | Audio system operation
	LDA $6680			; AD 80 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6880			; 6D 80 68 | Add with carry (absolute)
	STA $6680			; 8D 80 66 | Audio system operation
	LDA $6682			; AD 82 66 | Audio system operation
	ADC $6882			; 6D 82 68 | Add with carry (absolute)
	STA $6682			; 8D 82 66 | Audio system operation
	LDA $69C8			; AD C8 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A48			; 6D 48 6A | Add with carry (absolute)
	STA $69C8			; 8D C8 69 | Audio system operation
	LDA $6B48			; AD 48 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BC8			; 6D C8 6B | Add with carry (absolute)
	STA $6B48			; 8D 48 6B | Audio system operation
	LDA $6CC8			; AD C8 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_508
; Address: $D2D5E7
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_508:
	CLC				  ; 18 | Clear carry flag
	ADC $6D48			; 6D 48 6D | Add with carry (absolute)
	STA $6CC8			; 8D C8 6C | Audio system operation
	LDA $6E48			; AD 48 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EC8			; 6D C8 6E | Add with carry (absolute)
	STA $6E48			; 8D 48 6E | Audio system operation
	LDA $62C6			; AD C6 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $56E4			; 4C E4 56 | Jump to address
	LDA $637D			; AD 7D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $647D			; AD 7D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AC7			; AD C7 6A | Audio system operation
	LDY $6946			; AC 46 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_509
; Address: $D2D610
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_509:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DC6			; AD C6 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C46			; AD 46 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_50A
; Address: $D2D620
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_50A:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $637C			; AD 7C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $657C			; 6D 7C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $637C			; 8D 7C 63 | Audio system operation
	LDA $637E			; AD 7E 63 | Audio system operation
	ADC $657E			; 6D 7E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $637E			; 8D 7E 63 | Audio system operation
	LDA $647C			; AD 7C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $667C			; 6D 7C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $647C			; 8D 7C 64 | Audio system operation
	LDA $647E			; AD 7E 64 | Audio system operation
	ADC $667E			; 6D 7E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $647E			; 8D 7E 64 | Audio system operation
	LDA $6946			; AD 46 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69C6			; 6D C6 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62C6			; 9C C6 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $566B			; 4C 6B 56 | Jump to address
	STA $6946			; 8D 46 69 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_50B
; Address: $D2D66B
; Size: 131 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_50B:
	LDA $6AC6			; AD C6 6A | Audio system operation
	ADC $6B46			; 6D 46 6B | Add with carry (absolute)
	STA $6AC6			; 8D C6 6A | Audio system operation
	LDA $6C46			; AD 46 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CC6			; 6D C6 6C | Add with carry (absolute)
	STA $6C46			; 8D 46 6C | Audio system operation
	LDA $6DC6			; AD C6 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E46			; 6D 46 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EC6			; 9C C6 6E | Store zero to absolute
	STZ $6E46			; 9C 46 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5697			; 4C 97 56 | Jump to address
	STA $6DC6			; 8D C6 6D | Audio system operation
	LDA $657C			; AD 7C 65 | Audio system operation
	ADC $677C			; 6D 7C 67 | Add with carry (absolute)
	STA $657C			; 8D 7C 65 | Audio system operation
	LDA $657E			; AD 7E 65 | Audio system operation
	ADC $677E			; 6D 7E 67 | Add with carry (absolute)
	STA $657E			; 8D 7E 65 | Audio system operation
	LDA $667C			; AD 7C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $687C			; 6D 7C 68 | Add with carry (absolute)
	STA $667C			; 8D 7C 66 | Audio system operation
	LDA $667E			; AD 7E 66 | Audio system operation
	ADC $687E			; 6D 7E 68 | Add with carry (absolute)
	STA $667E			; 8D 7E 66 | Audio system operation
	LDA $69C6			; AD C6 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A46			; 6D 46 6A | Add with carry (absolute)
	STA $69C6			; 8D C6 69 | Audio system operation
	LDA $6B46			; AD 46 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BC6			; 6D C6 6B | Add with carry (absolute)
	STA $6B46			; 8D 46 6B | Audio system operation
	LDA $6CC6			; AD C6 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D46			; 6D 46 6D | Add with carry (absolute)
	STA $6CC6			; 8D C6 6C | Audio system operation
	LDA $6E46			; AD 46 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EC6			; 6D C6 6E | Add with carry (absolute)
	STA $6E46			; 8D 46 6E | Audio system operation
	LDA $62C4			; AD C4 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $57D0			; 4C D0 57 | Jump to address
	LDA $6379			; AD 79 63 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_50C
; Address: $D2D6EF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_50C:
	STA $70			  ; 85 70 | Audio system operation
	LDA $6479			; AD 79 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AC5			; AD C5 6A | Audio system operation
	LDY $6944			; AC 44 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_50D
; Address: $D2D6FC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_50D:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DC4			; AD C4 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C44			; AD 44 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_50E
; Address: $D2D70C
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_50E:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6378			; AD 78 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6578			; 6D 78 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6378			; 8D 78 63 | Audio system operation
	LDA $637A			; AD 7A 63 | Audio system operation
	ADC $657A			; 6D 7A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $637A			; 8D 7A 63 | Audio system operation
	LDA $6478			; AD 78 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6678			; 6D 78 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6478			; 8D 78 64 | Audio system operation
	LDA $647A			; AD 7A 64 | Audio system operation
	ADC $667A			; 6D 7A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $647A			; 8D 7A 64 | Audio system operation
	LDA $6944			; AD 44 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69C4			; 6D C4 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62C4			; 9C C4 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5757			; 4C 57 57 | Jump to address
	STA $6944			; 8D 44 69 | Audio system operation
	LDA $6AC4			; AD C4 6A | Audio system operation
	ADC $6B44			; 6D 44 6B | Add with carry (absolute)
	STA $6AC4			; 8D C4 6A | Audio system operation
	LDA $6C44			; AD 44 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CC4			; 6D C4 6C | Add with carry (absolute)
	STA $6C44			; 8D 44 6C | Audio system operation
	LDA $6DC4			; AD C4 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E44			; 6D 44 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_50F
; Address: $D2D774
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_50F:
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EC4			; 9C C4 6E | Store zero to absolute
	STZ $6E44			; 9C 44 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5783			; 4C 83 57 | Jump to address
	STA $6DC4			; 8D C4 6D | Audio system operation
	LDA $6578			; AD 78 65 | Audio system operation
	ADC $6778			; 6D 78 67 | Add with carry (absolute)
	STA $6578			; 8D 78 65 | Audio system operation
	LDA $657A			; AD 7A 65 | Audio system operation
	ADC $677A			; 6D 7A 67 | Add with carry (absolute)
	STA $657A			; 8D 7A 65 | Audio system operation
	LDA $6678			; AD 78 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6878			; 6D 78 68 | Add with carry (absolute)
	STA $6678			; 8D 78 66 | Audio system operation
	LDA $667A			; AD 7A 66 | Audio system operation
	ADC $687A			; 6D 7A 68 | Add with carry (absolute)
	STA $667A			; 8D 7A 66 | Audio system operation
	LDA $69C4			; AD C4 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A44			; 6D 44 6A | Add with carry (absolute)
	STA $69C4			; 8D C4 69 | Audio system operation
	LDA $6B44			; AD 44 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BC4			; 6D C4 6B | Add with carry (absolute)
	STA $6B44			; 8D 44 6B | Audio system operation
	LDA $6CC4			; AD C4 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D44			; 6D 44 6D | Add with carry (absolute)
	STA $6CC4			; 8D C4 6C | Audio system operation
	LDA $6E44			; AD 44 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EC4			; 6D C4 6E | Add with carry (absolute)
	STA $6E44			; 8D 44 6E | Audio system operation
	LDA $62C2			; AD C2 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $58BC			; 4C BC 58 | Jump to address
	LDA $6375			; AD 75 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6475			; AD 75 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AC3			; AD C3 6A | Audio system operation
	LDY $6942			; AC 42 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_510
; Address: $D2D7E8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_510:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DC2			; AD C2 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C42			; AD 42 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_511
; Address: $D2D7F8
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_511:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6374			; AD 74 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6574			; 6D 74 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6374			; 8D 74 63 | Audio system operation
	LDA $6376			; AD 76 63 | Audio system operation
	ADC $6576			; 6D 76 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6376			; 8D 76 63 | Audio system operation
	LDA $6474			; AD 74 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6674			; 6D 74 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6474			; 8D 74 64 | Audio system operation
	LDA $6476			; AD 76 64 | Audio system operation
	ADC $6676			; 6D 76 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6476			; 8D 76 64 | Audio system operation
	LDA $6942			; AD 42 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69C2			; 6D C2 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62C2			; 9C C2 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5843			; 4C 43 58 | Jump to address
	STA $6942			; 8D 42 69 | Audio system operation
	LDA $6AC2			; AD C2 6A | Audio system operation
	ADC $6B42			; 6D 42 6B | Add with carry (absolute)
	STA $6AC2			; 8D C2 6A | Audio system operation
	LDA $6C42			; AD 42 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CC2			; 6D C2 6C | Add with carry (absolute)
	STA $6C42			; 8D 42 6C | Audio system operation
	LDA $6DC2			; AD C2 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E42			; 6D 42 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EC2			; 9C C2 6E | Store zero to absolute
	STZ $6E42			; 9C 42 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $586F			; 4C 6F 58 | Jump to address
	STA $6DC2			; 8D C2 6D | Audio system operation
	LDA $6574			; AD 74 65 | Audio system operation
	ADC $6774			; 6D 74 67 | Add with carry (absolute)
	STA $6574			; 8D 74 65 | Audio system operation
	LDA $6576			; AD 76 65 | Audio system operation
	ADC $6776			; 6D 76 67 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_512
; Address: $D2D87E
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_512:
	STA $6576			; 8D 76 65 | Audio system operation
	LDA $6674			; AD 74 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6874			; 6D 74 68 | Add with carry (absolute)
	STA $6674			; 8D 74 66 | Audio system operation
	LDA $6676			; AD 76 66 | Audio system operation
	ADC $6876			; 6D 76 68 | Add with carry (absolute)
	STA $6676			; 8D 76 66 | Audio system operation
	LDA $69C2			; AD C2 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A42			; 6D 42 6A | Add with carry (absolute)
	STA $69C2			; 8D C2 69 | Audio system operation
	LDA $6B42			; AD 42 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BC2			; 6D C2 6B | Add with carry (absolute)
	STA $6B42			; 8D 42 6B | Audio system operation
	LDA $6CC2			; AD C2 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D42			; 6D 42 6D | Add with carry (absolute)
	STA $6CC2			; 8D C2 6C | Audio system operation
	LDA $6E42			; AD 42 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EC2			; 6D C2 6E | Add with carry (absolute)
	STA $6E42			; 8D 42 6E | Audio system operation
	LDA $62C0			; AD C0 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $59A8			; 4C A8 59 | Jump to address
	LDA $6371			; AD 71 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6471			; AD 71 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AC1			; AD C1 6A | Audio system operation
	LDY $6940			; AC 40 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_513
; Address: $D2D8D4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_513:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DC0			; AD C0 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C40			; AD 40 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_514
; Address: $D2D8E4
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_514:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6370			; AD 70 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6570			; 6D 70 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6370			; 8D 70 63 | Audio system operation
	LDA $6372			; AD 72 63 | Audio system operation
	ADC $6572			; 6D 72 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6372			; 8D 72 63 | Audio system operation
	LDA $6470			; AD 70 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_515
; Address: $D2D903
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_515:
	CLC				  ; 18 | Clear carry flag
	ADC $6670			; 6D 70 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6470			; 8D 70 64 | Audio system operation
	LDA $6472			; AD 72 64 | Audio system operation
	ADC $6672			; 6D 72 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6472			; 8D 72 64 | Audio system operation
	LDA $6940			; AD 40 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69C0			; 6D C0 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62C0			; 9C C0 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $592F			; 4C 2F 59 | Jump to address
	STA $6940			; 8D 40 69 | Audio system operation
	LDA $6AC0			; AD C0 6A | Audio system operation
	ADC $6B40			; 6D 40 6B | Add with carry (absolute)
	STA $6AC0			; 8D C0 6A | Audio system operation
	LDA $6C40			; AD 40 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CC0			; 6D C0 6C | Add with carry (absolute)
	STA $6C40			; 8D 40 6C | Audio system operation
	LDA $6DC0			; AD C0 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E40			; 6D 40 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EC0			; 9C C0 6E | Store zero to absolute
	STZ $6E40			; 9C 40 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $595B			; 4C 5B 59 | Jump to address
	STA $6DC0			; 8D C0 6D | Audio system operation
	LDA $6570			; AD 70 65 | Audio system operation
	ADC $6770			; 6D 70 67 | Add with carry (absolute)
	STA $6570			; 8D 70 65 | Audio system operation
	LDA $6572			; AD 72 65 | Audio system operation
	ADC $6772			; 6D 72 67 | Add with carry (absolute)
	STA $6572			; 8D 72 65 | Audio system operation
	LDA $6670			; AD 70 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6870			; 6D 70 68 | Add with carry (absolute)
	STA $6670			; 8D 70 66 | Audio system operation
	LDA $6672			; AD 72 66 | Audio system operation
	ADC $6872			; 6D 72 68 | Add with carry (absolute)
	STA $6672			; 8D 72 66 | Audio system operation
	LDA $69C0			; AD C0 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A40			; 6D 40 6A | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_516
; Address: $D2D987
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_516:
	STA $69C0			; 8D C0 69 | Audio system operation
	LDA $6B40			; AD 40 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BC0			; 6D C0 6B | Add with carry (absolute)
	STA $6B40			; 8D 40 6B | Audio system operation
	LDA $6CC0			; AD C0 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D40			; 6D 40 6D | Add with carry (absolute)
	STA $6CC0			; 8D C0 6C | Audio system operation
	LDA $6E40			; AD 40 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EC0			; 6D C0 6E | Add with carry (absolute)
	STA $6E40			; 8D 40 6E | Audio system operation
	LDA $62BE			; AD BE 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5A94			; 4C 94 5A | Jump to address
	LDA $636D			; AD 6D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $646D			; AD 6D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ABF			; AD BF 6A | Audio system operation
	LDY $693E			; AC 3E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_517
; Address: $D2D9C0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_517:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DBE			; AD BE 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C3E			; AD 3E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_518
; Address: $D2D9D0
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_518:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $636C			; AD 6C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $656C			; 6D 6C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $636C			; 8D 6C 63 | Audio system operation
	LDA $636E			; AD 6E 63 | Audio system operation
	ADC $656E			; 6D 6E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $636E			; 8D 6E 63 | Audio system operation
	LDA $646C			; AD 6C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $666C			; 6D 6C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $646C			; 8D 6C 64 | Audio system operation
	LDA $646E			; AD 6E 64 | Audio system operation
	ADC $666E			; 6D 6E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $646E			; 8D 6E 64 | Audio system operation
	LDA $693E			; AD 3E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69BE			; 6D BE 69 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_519
; Address: $D2DA0C
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_519:
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62BE			; 9C BE 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5A1B			; 4C 1B 5A | Jump to address
	STA $693E			; 8D 3E 69 | Audio system operation
	LDA $6ABE			; AD BE 6A | Audio system operation
	ADC $6B3E			; 6D 3E 6B | Add with carry (absolute)
	STA $6ABE			; 8D BE 6A | Audio system operation
	LDA $6C3E			; AD 3E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CBE			; 6D BE 6C | Add with carry (absolute)
	STA $6C3E			; 8D 3E 6C | Audio system operation
	LDA $6DBE			; AD BE 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E3E			; 6D 3E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EBE			; 9C BE 6E | Store zero to absolute
	STZ $6E3E			; 9C 3E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5A47			; 4C 47 5A | Jump to address
	STA $6DBE			; 8D BE 6D | Audio system operation
	LDA $656C			; AD 6C 65 | Audio system operation
	ADC $676C			; 6D 6C 67 | Add with carry (absolute)
	STA $656C			; 8D 6C 65 | Audio system operation
	LDA $656E			; AD 6E 65 | Audio system operation
	ADC $676E			; 6D 6E 67 | Add with carry (absolute)
	STA $656E			; 8D 6E 65 | Audio system operation
	LDA $666C			; AD 6C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $686C			; 6D 6C 68 | Add with carry (absolute)
	STA $666C			; 8D 6C 66 | Audio system operation
	LDA $666E			; AD 6E 66 | Audio system operation
	ADC $686E			; 6D 6E 68 | Add with carry (absolute)
	STA $666E			; 8D 6E 66 | Audio system operation
	LDA $69BE			; AD BE 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A3E			; 6D 3E 6A | Add with carry (absolute)
	STA $69BE			; 8D BE 69 | Audio system operation
	LDA $6B3E			; AD 3E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BBE			; 6D BE 6B | Add with carry (absolute)
	STA $6B3E			; 8D 3E 6B | Audio system operation
	LDA $6CBE			; AD BE 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D3E			; 6D 3E 6D | Add with carry (absolute)
	STA $6CBE			; 8D BE 6C | Audio system operation
	LDA $6E3E			; AD 3E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_51A
; Address: $D2DA8E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_51A:
	ADC $6EBE			; 6D BE 6E | Add with carry (absolute)
	STA $6E3E			; 8D 3E 6E | Audio system operation
	LDA $62BC			; AD BC 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5B80			; 4C 80 5B | Jump to address
	LDA $6369			; AD 69 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6469			; AD 69 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ABD			; AD BD 6A | Audio system operation
	LDY $693C			; AC 3C 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_51B
; Address: $D2DAAC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_51B:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DBC			; AD BC 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C3C			; AD 3C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_51C
; Address: $D2DABC
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_51C:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6368			; AD 68 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6568			; 6D 68 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6368			; 8D 68 63 | Audio system operation
	LDA $636A			; AD 6A 63 | Audio system operation
	ADC $656A			; 6D 6A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $636A			; 8D 6A 63 | Audio system operation
	LDA $6468			; AD 68 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6668			; 6D 68 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6468			; 8D 68 64 | Audio system operation
	LDA $646A			; AD 6A 64 | Audio system operation
	ADC $666A			; 6D 6A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $646A			; 8D 6A 64 | Audio system operation
	LDA $693C			; AD 3C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69BC			; 6D BC 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62BC			; 9C BC 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5B07			; 4C 07 5B | Jump to address
	STA $693C			; 8D 3C 69 | Audio system operation
	LDA $6ABC			; AD BC 6A | Audio system operation
	ADC $6B3C			; 6D 3C 6B | Add with carry (absolute)
	STA $6ABC			; 8D BC 6A | Audio system operation
	LDA $6C3C			; AD 3C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_51D
; Address: $D2DB14
; Size: 131 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_51D:
	ADC $6CBC			; 6D BC 6C | Add with carry (absolute)
	STA $6C3C			; 8D 3C 6C | Audio system operation
	LDA $6DBC			; AD BC 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E3C			; 6D 3C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EBC			; 9C BC 6E | Store zero to absolute
	STZ $6E3C			; 9C 3C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5B33			; 4C 33 5B | Jump to address
	STA $6DBC			; 8D BC 6D | Audio system operation
	LDA $6568			; AD 68 65 | Audio system operation
	ADC $6768			; 6D 68 67 | Add with carry (absolute)
	STA $6568			; 8D 68 65 | Audio system operation
	LDA $656A			; AD 6A 65 | Audio system operation
	ADC $676A			; 6D 6A 67 | Add with carry (absolute)
	STA $656A			; 8D 6A 65 | Audio system operation
	LDA $6668			; AD 68 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6868			; 6D 68 68 | Add with carry (absolute)
	STA $6668			; 8D 68 66 | Audio system operation
	LDA $666A			; AD 6A 66 | Audio system operation
	ADC $686A			; 6D 6A 68 | Add with carry (absolute)
	STA $666A			; 8D 6A 66 | Audio system operation
	LDA $69BC			; AD BC 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A3C			; 6D 3C 6A | Add with carry (absolute)
	STA $69BC			; 8D BC 69 | Audio system operation
	LDA $6B3C			; AD 3C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BBC			; 6D BC 6B | Add with carry (absolute)
	STA $6B3C			; 8D 3C 6B | Audio system operation
	LDA $6CBC			; AD BC 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D3C			; 6D 3C 6D | Add with carry (absolute)
	STA $6CBC			; 8D BC 6C | Audio system operation
	LDA $6E3C			; AD 3C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EBC			; 6D BC 6E | Add with carry (absolute)
	STA $6E3C			; 8D 3C 6E | Audio system operation
	LDA $62BA			; AD BA 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5C6C			; 4C 6C 5C | Jump to address
	LDA $6365			; AD 65 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6465			; AD 65 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6ABB			; AD BB 6A | Audio system operation
	LDY $693A			; AC 3A 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_51E
; Address: $D2DB98
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_51E:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DBA			; AD BA 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C3A			; AD 3A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_51F
; Address: $D2DBA8
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_51F:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6364			; AD 64 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6564			; 6D 64 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6364			; 8D 64 63 | Audio system operation
	LDA $6366			; AD 66 63 | Audio system operation
	ADC $6566			; 6D 66 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6366			; 8D 66 63 | Audio system operation
	LDA $6464			; AD 64 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6664			; 6D 64 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6464			; 8D 64 64 | Audio system operation
	LDA $6466			; AD 66 64 | Audio system operation
	ADC $6666			; 6D 66 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6466			; 8D 66 64 | Audio system operation
	LDA $693A			; AD 3A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69BA			; 6D BA 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62BA			; 9C BA 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5BF3			; 4C F3 5B | Jump to address
	STA $693A			; 8D 3A 69 | Audio system operation
	LDA $6ABA			; AD BA 6A | Audio system operation
	ADC $6B3A			; 6D 3A 6B | Add with carry (absolute)
	STA $6ABA			; 8D BA 6A | Audio system operation
	LDA $6C3A			; AD 3A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CBA			; 6D BA 6C | Add with carry (absolute)
	STA $6C3A			; 8D 3A 6C | Audio system operation
	LDA $6DBA			; AD BA 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E3A			; 6D 3A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EBA			; 9C BA 6E | Store zero to absolute
	STZ $6E3A			; 9C 3A 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5C1F			; 4C 1F 5C | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_520
; Address: $D2DC1C
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_520:
	STA $6DBA			; 8D BA 6D | Audio system operation
	LDA $6564			; AD 64 65 | Audio system operation
	ADC $6764			; 6D 64 67 | Add with carry (absolute)
	STA $6564			; 8D 64 65 | Audio system operation
	LDA $6566			; AD 66 65 | Audio system operation
	ADC $6766			; 6D 66 67 | Add with carry (absolute)
	STA $6566			; 8D 66 65 | Audio system operation
	LDA $6664			; AD 64 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6864			; 6D 64 68 | Add with carry (absolute)
	STA $6664			; 8D 64 66 | Audio system operation
	LDA $6666			; AD 66 66 | Audio system operation
	ADC $6866			; 6D 66 68 | Add with carry (absolute)
	STA $6666			; 8D 66 66 | Audio system operation
	LDA $69BA			; AD BA 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A3A			; 6D 3A 6A | Add with carry (absolute)
	STA $69BA			; 8D BA 69 | Audio system operation
	LDA $6B3A			; AD 3A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BBA			; 6D BA 6B | Add with carry (absolute)
	STA $6B3A			; 8D 3A 6B | Audio system operation
	LDA $6CBA			; AD BA 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D3A			; 6D 3A 6D | Add with carry (absolute)
	STA $6CBA			; 8D BA 6C | Audio system operation
	LDA $6E3A			; AD 3A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EBA			; 6D BA 6E | Add with carry (absolute)
	STA $6E3A			; 8D 3A 6E | Audio system operation
	LDA $62B8			; AD B8 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5D58			; 4C 58 5D | Jump to address
	LDA $6361			; AD 61 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6461			; AD 61 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AB9			; AD B9 6A | Audio system operation
	LDY $6938			; AC 38 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_521
; Address: $D2DC84
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_521:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DB8			; AD B8 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C38			; AD 38 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_522
; Address: $D2DC94
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_522:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6360			; AD 60 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6560			; 6D 60 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_523
; Address: $D2DCA1
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_523:
	STA $6360			; 8D 60 63 | Audio system operation
	LDA $6362			; AD 62 63 | Audio system operation
	ADC $6562			; 6D 62 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6362			; 8D 62 63 | Audio system operation
	LDA $6460			; AD 60 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6660			; 6D 60 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6460			; 8D 60 64 | Audio system operation
	LDA $6462			; AD 62 64 | Audio system operation
	ADC $6662			; 6D 62 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6462			; 8D 62 64 | Audio system operation
	LDA $6938			; AD 38 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69B8			; 6D B8 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62B8			; 9C B8 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5CDF			; 4C DF 5C | Jump to address
	STA $6938			; 8D 38 69 | Audio system operation
	LDA $6AB8			; AD B8 6A | Audio system operation
	ADC $6B38			; 6D 38 6B | Add with carry (absolute)
	STA $6AB8			; 8D B8 6A | Audio system operation
	LDA $6C38			; AD 38 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CB8			; 6D B8 6C | Add with carry (absolute)
	STA $6C38			; 8D 38 6C | Audio system operation
	LDA $6DB8			; AD B8 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E38			; 6D 38 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EB8			; 9C B8 6E | Store zero to absolute
	STZ $6E38			; 9C 38 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5D0B			; 4C 0B 5D | Jump to address
	STA $6DB8			; 8D B8 6D | Audio system operation
	LDA $6560			; AD 60 65 | Audio system operation
	ADC $6760			; 6D 60 67 | Add with carry (absolute)
	STA $6560			; 8D 60 65 | Audio system operation
	LDA $6562			; AD 62 65 | Audio system operation
	ADC $6762			; 6D 62 67 | Add with carry (absolute)
	STA $6562			; 8D 62 65 | Audio system operation
	LDA $6660			; AD 60 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6860			; 6D 60 68 | Add with carry (absolute)
	STA $6660			; 8D 60 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_524
; Address: $D2DD27
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_524:
	LDA $6662			; AD 62 66 | Audio system operation
	ADC $6862			; 6D 62 68 | Add with carry (absolute)
	STA $6662			; 8D 62 66 | Audio system operation
	LDA $69B8			; AD B8 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A38			; 6D 38 6A | Add with carry (absolute)
	STA $69B8			; 8D B8 69 | Audio system operation
	LDA $6B38			; AD 38 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BB8			; 6D B8 6B | Add with carry (absolute)
	STA $6B38			; 8D 38 6B | Audio system operation
	LDA $6CB8			; AD B8 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D38			; 6D 38 6D | Add with carry (absolute)
	STA $6CB8			; 8D B8 6C | Audio system operation
	LDA $6E38			; AD 38 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EB8			; 6D B8 6E | Add with carry (absolute)
	STA $6E38			; 8D 38 6E | Audio system operation
	LDA $62B6			; AD B6 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5E44			; 4C 44 5E | Jump to address
	LDA $635D			; AD 5D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $645D			; AD 5D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AB7			; AD B7 6A | Audio system operation
	LDY $6936			; AC 36 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_525
; Address: $D2DD70
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_525:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DB6			; AD B6 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C36			; AD 36 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_526
; Address: $D2DD80
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_526:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $635C			; AD 5C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $655C			; 6D 5C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $635C			; 8D 5C 63 | Audio system operation
	LDA $635E			; AD 5E 63 | Audio system operation
	ADC $655E			; 6D 5E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $635E			; 8D 5E 63 | Audio system operation
	LDA $645C			; AD 5C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $665C			; 6D 5C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $645C			; 8D 5C 64 | Audio system operation
	LDA $645E			; AD 5E 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_527
; Address: $D2DDAC
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_527:
	ADC $665E			; 6D 5E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $645E			; 8D 5E 64 | Audio system operation
	LDA $6936			; AD 36 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69B6			; 6D B6 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62B6			; 9C B6 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5DCB			; 4C CB 5D | Jump to address
	STA $6936			; 8D 36 69 | Audio system operation
	LDA $6AB6			; AD B6 6A | Audio system operation
	ADC $6B36			; 6D 36 6B | Add with carry (absolute)
	STA $6AB6			; 8D B6 6A | Audio system operation
	LDA $6C36			; AD 36 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CB6			; 6D B6 6C | Add with carry (absolute)
	STA $6C36			; 8D 36 6C | Audio system operation
	LDA $6DB6			; AD B6 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E36			; 6D 36 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EB6			; 9C B6 6E | Store zero to absolute
	STZ $6E36			; 9C 36 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5DF7			; 4C F7 5D | Jump to address
	STA $6DB6			; 8D B6 6D | Audio system operation
	LDA $655C			; AD 5C 65 | Audio system operation
	ADC $675C			; 6D 5C 67 | Add with carry (absolute)
	STA $655C			; 8D 5C 65 | Audio system operation
	LDA $655E			; AD 5E 65 | Audio system operation
	ADC $675E			; 6D 5E 67 | Add with carry (absolute)
	STA $655E			; 8D 5E 65 | Audio system operation
	LDA $665C			; AD 5C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $685C			; 6D 5C 68 | Add with carry (absolute)
	STA $665C			; 8D 5C 66 | Audio system operation
	LDA $665E			; AD 5E 66 | Audio system operation
	ADC $685E			; 6D 5E 68 | Add with carry (absolute)
	STA $665E			; 8D 5E 66 | Audio system operation
	LDA $69B6			; AD B6 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A36			; 6D 36 6A | Add with carry (absolute)
	STA $69B6			; 8D B6 69 | Audio system operation
	LDA $6B36			; AD 36 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BB6			; 6D B6 6B | Add with carry (absolute)
	STA $6B36			; 8D 36 6B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_528
; Address: $D2DE30
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_528:
	LDA $6CB6			; AD B6 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D36			; 6D 36 6D | Add with carry (absolute)
	STA $6CB6			; 8D B6 6C | Audio system operation
	LDA $6E36			; AD 36 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EB6			; 6D B6 6E | Add with carry (absolute)
	STA $6E36			; 8D 36 6E | Audio system operation
	LDA $62B4			; AD B4 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $5F30			; 4C 30 5F | Jump to address
	LDA $6359			; AD 59 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6459			; AD 59 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AB5			; AD B5 6A | Audio system operation
	LDY $6934			; AC 34 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_529
; Address: $D2DE5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_529:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DB4			; AD B4 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C34			; AD 34 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_52A
; Address: $D2DE6C
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_52A:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6358			; AD 58 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6558			; 6D 58 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6358			; 8D 58 63 | Audio system operation
	LDA $635A			; AD 5A 63 | Audio system operation
	ADC $655A			; 6D 5A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $635A			; 8D 5A 63 | Audio system operation
	LDA $6458			; AD 58 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6658			; 6D 58 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6458			; 8D 58 64 | Audio system operation
	LDA $645A			; AD 5A 64 | Audio system operation
	ADC $665A			; 6D 5A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $645A			; 8D 5A 64 | Audio system operation
	LDA $6934			; AD 34 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69B4			; 6D B4 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62B4			; 9C B4 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5EB7			; 4C B7 5E | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_52B
; Address: $D2DEB4
; Size: 131 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_52B:
	STA $6934			; 8D 34 69 | Audio system operation
	LDA $6AB4			; AD B4 6A | Audio system operation
	ADC $6B34			; 6D 34 6B | Add with carry (absolute)
	STA $6AB4			; 8D B4 6A | Audio system operation
	LDA $6C34			; AD 34 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CB4			; 6D B4 6C | Add with carry (absolute)
	STA $6C34			; 8D 34 6C | Audio system operation
	LDA $6DB4			; AD B4 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E34			; 6D 34 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EB4			; 9C B4 6E | Store zero to absolute
	STZ $6E34			; 9C 34 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5EE3			; 4C E3 5E | Jump to address
	STA $6DB4			; 8D B4 6D | Audio system operation
	LDA $6558			; AD 58 65 | Audio system operation
	ADC $6758			; 6D 58 67 | Add with carry (absolute)
	STA $6558			; 8D 58 65 | Audio system operation
	LDA $655A			; AD 5A 65 | Audio system operation
	ADC $675A			; 6D 5A 67 | Add with carry (absolute)
	STA $655A			; 8D 5A 65 | Audio system operation
	LDA $6658			; AD 58 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6858			; 6D 58 68 | Add with carry (absolute)
	STA $6658			; 8D 58 66 | Audio system operation
	LDA $665A			; AD 5A 66 | Audio system operation
	ADC $685A			; 6D 5A 68 | Add with carry (absolute)
	STA $665A			; 8D 5A 66 | Audio system operation
	LDA $69B4			; AD B4 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A34			; 6D 34 6A | Add with carry (absolute)
	STA $69B4			; 8D B4 69 | Audio system operation
	LDA $6B34			; AD 34 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BB4			; 6D B4 6B | Add with carry (absolute)
	STA $6B34			; 8D 34 6B | Audio system operation
	LDA $6CB4			; AD B4 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D34			; 6D 34 6D | Add with carry (absolute)
	STA $6CB4			; 8D B4 6C | Audio system operation
	LDA $6E34			; AD 34 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EB4			; 6D B4 6E | Add with carry (absolute)
	STA $6E34			; 8D 34 6E | Audio system operation
	LDA $62B2			; AD B2 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $601C			; 4C 1C 60 | Jump to address

;------------------------------------------------------------------------------
; Bank24_AudioFunction_52C
; Address: $D2DF38
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_52C:
	LDA $6355			; AD 55 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6455			; AD 55 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AB3			; AD B3 6A | Audio system operation
	LDY $6932			; AC 32 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_52D
; Address: $D2DF48
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_52D:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DB2			; AD B2 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C32			; AD 32 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_52E
; Address: $D2DF58
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_52E:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6354			; AD 54 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6554			; 6D 54 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6354			; 8D 54 63 | Audio system operation
	LDA $6356			; AD 56 63 | Audio system operation
	ADC $6556			; 6D 56 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6356			; 8D 56 63 | Audio system operation
	LDA $6454			; AD 54 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6654			; 6D 54 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6454			; 8D 54 64 | Audio system operation
	LDA $6456			; AD 56 64 | Audio system operation
	ADC $6656			; 6D 56 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6456			; 8D 56 64 | Audio system operation
	LDA $6932			; AD 32 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69B2			; 6D B2 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62B2			; 9C B2 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5FA3			; 4C A3 5F | Jump to address
	STA $6932			; 8D 32 69 | Audio system operation
	LDA $6AB2			; AD B2 6A | Audio system operation
	ADC $6B32			; 6D 32 6B | Add with carry (absolute)
	STA $6AB2			; 8D B2 6A | Audio system operation
	LDA $6C32			; AD 32 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CB2			; 6D B2 6C | Add with carry (absolute)
	STA $6C32			; 8D 32 6C | Audio system operation
	LDA $6DB2			; AD B2 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E32			; 6D 32 6E | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_52F
; Address: $D2DFBD
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_52F:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EB2			; 9C B2 6E | Store zero to absolute
	STZ $6E32			; 9C 32 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $5FCF			; 4C CF 5F | Jump to address
	STA $6DB2			; 8D B2 6D | Audio system operation
	LDA $6554			; AD 54 65 | Audio system operation
	ADC $6754			; 6D 54 67 | Add with carry (absolute)
	STA $6554			; 8D 54 65 | Audio system operation
	LDA $6556			; AD 56 65 | Audio system operation
	ADC $6756			; 6D 56 67 | Add with carry (absolute)
	STA $6556			; 8D 56 65 | Audio system operation
	LDA $6654			; AD 54 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6854			; 6D 54 68 | Add with carry (absolute)
	STA $6654			; 8D 54 66 | Audio system operation
	LDA $6656			; AD 56 66 | Audio system operation
	ADC $6856			; 6D 56 68 | Add with carry (absolute)
	STA $6656			; 8D 56 66 | Audio system operation
	LDA $69B2			; AD B2 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A32			; 6D 32 6A | Add with carry (absolute)
	STA $69B2			; 8D B2 69 | Audio system operation
	LDA $6B32			; AD 32 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BB2			; 6D B2 6B | Add with carry (absolute)
	STA $6B32			; 8D 32 6B | Audio system operation
	LDA $6CB2			; AD B2 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D32			; 6D 32 6D | Add with carry (absolute)
	STA $6CB2			; 8D B2 6C | Audio system operation
	LDA $6E32			; AD 32 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EB2			; 6D B2 6E | Add with carry (absolute)
	STA $6E32			; 8D 32 6E | Audio system operation
	LDA $62B0			; AD B0 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6108			; 4C 08 61 | Jump to address
	LDA $6351			; AD 51 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6451			; AD 51 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AB1			; AD B1 6A | Audio system operation
	LDY $6930			; AC 30 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_530
; Address: $D2E034
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_530:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DB0			; AD B0 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_532
; Address: $D2E044
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_532:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6350			; AD 50 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6550			; 6D 50 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6350			; 8D 50 63 | Audio system operation
	LDA $6352			; AD 52 63 | Audio system operation
	ADC $6552			; 6D 52 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6352			; 8D 52 63 | Audio system operation
	LDA $6450			; AD 50 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6650			; 6D 50 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6450			; 8D 50 64 | Audio system operation
	LDA $6452			; AD 52 64 | Audio system operation
	ADC $6652			; 6D 52 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6452			; 8D 52 64 | Audio system operation
	LDA $6930			; AD 30 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69B0			; 6D B0 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62B0			; 9C B0 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $608F			; 4C 8F 60 | Jump to address
	STA $6930			; 8D 30 69 | Audio system operation
	LDA $6AB0			; AD B0 6A | Audio system operation
	ADC $6B30			; 6D 30 6B | Add with carry (absolute)
	STA $6AB0			; 8D B0 6A | Audio system operation
	LDA $6C30			; AD 30 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CB0			; 6D B0 6C | Add with carry (absolute)
	STA $6C30			; 8D 30 6C | Audio system operation
	LDA $6DB0			; AD B0 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E30			; 6D 30 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EB0			; 9C B0 6E | Store zero to absolute
	STZ $6E30			; 9C 30 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $60BB			; 4C BB 60 | Jump to address
	STA $6DB0			; 8D B0 6D | Audio system operation
	LDA $6550			; AD 50 65 | Audio system operation
	ADC $6750			; 6D 50 67 | Add with carry (absolute)
	STA $6550			; 8D 50 65 | Audio system operation
	LDA $6552			; AD 52 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_533
; Address: $D2E0C7
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_533:
	ADC $6752			; 6D 52 67 | Add with carry (absolute)
	STA $6552			; 8D 52 65 | Audio system operation
	LDA $6650			; AD 50 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6850			; 6D 50 68 | Add with carry (absolute)
	STA $6650			; 8D 50 66 | Audio system operation
	LDA $6652			; AD 52 66 | Audio system operation
	ADC $6852			; 6D 52 68 | Add with carry (absolute)
	STA $6652			; 8D 52 66 | Audio system operation
	LDA $69B0			; AD B0 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A30			; 6D 30 6A | Add with carry (absolute)
	STA $69B0			; 8D B0 69 | Audio system operation
	LDA $6B30			; AD 30 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BB0			; 6D B0 6B | Add with carry (absolute)
	STA $6B30			; 8D 30 6B | Audio system operation
	LDA $6CB0			; AD B0 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D30			; 6D 30 6D | Add with carry (absolute)
	STA $6CB0			; 8D B0 6C | Audio system operation
	LDA $6E30			; AD 30 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EB0			; 6D B0 6E | Add with carry (absolute)
	STA $6E30			; 8D 30 6E | Audio system operation
	LDA $62AE			; AD AE 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $61F4			; 4C F4 61 | Jump to address
	LDA $634D			; AD 4D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $644D			; AD 4D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AAF			; AD AF 6A | Audio system operation
	LDY $692E			; AC 2E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_534
; Address: $D2E120
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_534:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DAE			; AD AE 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C2E			; AD 2E 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_535
; Address: $D2E130
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_535:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $634C			; AD 4C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $654C			; 6D 4C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $634C			; 8D 4C 63 | Audio system operation
	LDA $634E			; AD 4E 63 | Audio system operation
	ADC $654E			; 6D 4E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $634E			; 8D 4E 63 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_536
; Address: $D2E14C
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_536:
	LDA $644C			; AD 4C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $664C			; 6D 4C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $644C			; 8D 4C 64 | Audio system operation
	LDA $644E			; AD 4E 64 | Audio system operation
	ADC $664E			; 6D 4E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $644E			; 8D 4E 64 | Audio system operation
	LDA $692E			; AD 2E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69AE			; 6D AE 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62AE			; 9C AE 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $617B			; 4C 7B 61 | Jump to address
	STA $692E			; 8D 2E 69 | Audio system operation
	LDA $6AAE			; AD AE 6A | Audio system operation
	ADC $6B2E			; 6D 2E 6B | Add with carry (absolute)
	STA $6AAE			; 8D AE 6A | Audio system operation
	LDA $6C2E			; AD 2E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CAE			; 6D AE 6C | Add with carry (absolute)
	STA $6C2E			; 8D 2E 6C | Audio system operation
	LDA $6DAE			; AD AE 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E2E			; 6D 2E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EAE			; 9C AE 6E | Store zero to absolute
	STZ $6E2E			; 9C 2E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $61A7			; 4C A7 61 | Jump to address
	STA $6DAE			; 8D AE 6D | Audio system operation
	LDA $654C			; AD 4C 65 | Audio system operation
	ADC $674C			; 6D 4C 67 | Add with carry (absolute)
	STA $654C			; 8D 4C 65 | Audio system operation
	LDA $654E			; AD 4E 65 | Audio system operation
	ADC $674E			; 6D 4E 67 | Add with carry (absolute)
	STA $654E			; 8D 4E 65 | Audio system operation
	LDA $664C			; AD 4C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $684C			; 6D 4C 68 | Add with carry (absolute)
	STA $664C			; 8D 4C 66 | Audio system operation
	LDA $664E			; AD 4E 66 | Audio system operation
	ADC $684E			; 6D 4E 68 | Add with carry (absolute)
	STA $664E			; 8D 4E 66 | Audio system operation
	LDA $69AE			; AD AE 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_537
; Address: $D2E1D0
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_537:
	ADC $6A2E			; 6D 2E 6A | Add with carry (absolute)
	STA $69AE			; 8D AE 69 | Audio system operation
	LDA $6B2E			; AD 2E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BAE			; 6D AE 6B | Add with carry (absolute)
	STA $6B2E			; 8D 2E 6B | Audio system operation
	LDA $6CAE			; AD AE 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D2E			; 6D 2E 6D | Add with carry (absolute)
	STA $6CAE			; 8D AE 6C | Audio system operation
	LDA $6E2E			; AD 2E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EAE			; 6D AE 6E | Add with carry (absolute)
	STA $6E2E			; 8D 2E 6E | Audio system operation
	LDA $62AC			; AD AC 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $62E0			; 4C E0 62 | Jump to address
	LDA $6349			; AD 49 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6449			; AD 49 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AAD			; AD AD 6A | Audio system operation
	LDY $692C			; AC 2C 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_538
; Address: $D2E20C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_538:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DAC			; AD AC 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C2C			; AD 2C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_539
; Address: $D2E21C
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_539:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6348			; AD 48 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6548			; 6D 48 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6348			; 8D 48 63 | Audio system operation
	LDA $634A			; AD 4A 63 | Audio system operation
	ADC $654A			; 6D 4A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $634A			; 8D 4A 63 | Audio system operation
	LDA $6448			; AD 48 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6648			; 6D 48 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6448			; 8D 48 64 | Audio system operation
	LDA $644A			; AD 4A 64 | Audio system operation
	ADC $664A			; 6D 4A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $644A			; 8D 4A 64 | Audio system operation
	LDA $692C			; AD 2C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_53A
; Address: $D2E255
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_53A:
	ADC $69AC			; 6D AC 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62AC			; 9C AC 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6267			; 4C 67 62 | Jump to address
	STA $692C			; 8D 2C 69 | Audio system operation
	LDA $6AAC			; AD AC 6A | Audio system operation
	ADC $6B2C			; 6D 2C 6B | Add with carry (absolute)
	STA $6AAC			; 8D AC 6A | Audio system operation
	LDA $6C2C			; AD 2C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CAC			; 6D AC 6C | Add with carry (absolute)
	STA $6C2C			; 8D 2C 6C | Audio system operation
	LDA $6DAC			; AD AC 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E2C			; 6D 2C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EAC			; 9C AC 6E | Store zero to absolute
	STZ $6E2C			; 9C 2C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6293			; 4C 93 62 | Jump to address
	STA $6DAC			; 8D AC 6D | Audio system operation
	LDA $6548			; AD 48 65 | Audio system operation
	ADC $6748			; 6D 48 67 | Add with carry (absolute)
	STA $6548			; 8D 48 65 | Audio system operation
	LDA $654A			; AD 4A 65 | Audio system operation
	ADC $674A			; 6D 4A 67 | Add with carry (absolute)
	STA $654A			; 8D 4A 65 | Audio system operation
	LDA $6648			; AD 48 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6848			; 6D 48 68 | Add with carry (absolute)
	STA $6648			; 8D 48 66 | Audio system operation
	LDA $664A			; AD 4A 66 | Audio system operation
	ADC $684A			; 6D 4A 68 | Add with carry (absolute)
	STA $664A			; 8D 4A 66 | Audio system operation
	LDA $69AC			; AD AC 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A2C			; 6D 2C 6A | Add with carry (absolute)
	STA $69AC			; 8D AC 69 | Audio system operation
	LDA $6B2C			; AD 2C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BAC			; 6D AC 6B | Add with carry (absolute)
	STA $6B2C			; 8D 2C 6B | Audio system operation
	LDA $6CAC			; AD AC 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D2C			; 6D 2C 6D | Add with carry (absolute)
	STA $6CAC			; 8D AC 6C | Audio system operation
	LDA $6E2C			; AD 2C 6E | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_53B
; Address: $D2E2D9
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_53B:
	CLC				  ; 18 | Clear carry flag
	ADC $6EAC			; 6D AC 6E | Add with carry (absolute)
	STA $6E2C			; 8D 2C 6E | Audio system operation
	LDA $62AA			; AD AA 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $63CC			; 4C CC 63 | Jump to address
	LDA $6345			; AD 45 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6445			; AD 45 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AAB			; AD AB 6A | Audio system operation
	LDY $692A			; AC 2A 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_53C
; Address: $D2E2F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_53C:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DAA			; AD AA 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C2A			; AD 2A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_53D
; Address: $D2E308
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_53D:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6344			; AD 44 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6544			; 6D 44 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6344			; 8D 44 63 | Audio system operation
	LDA $6346			; AD 46 63 | Audio system operation
	ADC $6546			; 6D 46 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6346			; 8D 46 63 | Audio system operation
	LDA $6444			; AD 44 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6644			; 6D 44 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6444			; 8D 44 64 | Audio system operation
	LDA $6446			; AD 46 64 | Audio system operation
	ADC $6646			; 6D 46 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6446			; 8D 46 64 | Audio system operation
	LDA $692A			; AD 2A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69AA			; 6D AA 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62AA			; 9C AA 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6353			; 4C 53 63 | Jump to address
	STA $692A			; 8D 2A 69 | Audio system operation
	LDA $6AAA			; AD AA 6A | Audio system operation
	ADC $6B2A			; 6D 2A 6B | Add with carry (absolute)
	STA $6AAA			; 8D AA 6A | Audio system operation
	LDA $6C2A			; AD 2A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_53E
; Address: $D2E35F
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_53E:
	CLC				  ; 18 | Clear carry flag
	ADC $6CAA			; 6D AA 6C | Add with carry (absolute)
	STA $6C2A			; 8D 2A 6C | Audio system operation
	LDA $6DAA			; AD AA 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E2A			; 6D 2A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EAA			; 9C AA 6E | Store zero to absolute
	STZ $6E2A			; 9C 2A 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $637F			; 4C 7F 63 | Jump to address
	STA $6DAA			; 8D AA 6D | Audio system operation
	LDA $6544			; AD 44 65 | Audio system operation
	ADC $6744			; 6D 44 67 | Add with carry (absolute)
	STA $6544			; 8D 44 65 | Audio system operation
	LDA $6546			; AD 46 65 | Audio system operation
	ADC $6746			; 6D 46 67 | Add with carry (absolute)
	STA $6546			; 8D 46 65 | Audio system operation
	LDA $6644			; AD 44 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6844			; 6D 44 68 | Add with carry (absolute)
	STA $6644			; 8D 44 66 | Audio system operation
	LDA $6646			; AD 46 66 | Audio system operation
	ADC $6846			; 6D 46 68 | Add with carry (absolute)
	STA $6646			; 8D 46 66 | Audio system operation
	LDA $69AA			; AD AA 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A2A			; 6D 2A 6A | Add with carry (absolute)
	STA $69AA			; 8D AA 69 | Audio system operation
	LDA $6B2A			; AD 2A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BAA			; 6D AA 6B | Add with carry (absolute)
	STA $6B2A			; 8D 2A 6B | Audio system operation
	LDA $6CAA			; AD AA 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D2A			; 6D 2A 6D | Add with carry (absolute)
	STA $6CAA			; 8D AA 6C | Audio system operation
	LDA $6E2A			; AD 2A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EAA			; 6D AA 6E | Add with carry (absolute)
	STA $6E2A			; 8D 2A 6E | Audio system operation
	LDA $62A8			; AD A8 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $64B8			; 4C B8 64 | Jump to address
	LDA $6341			; AD 41 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6441			; AD 41 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AA9			; AD A9 6A | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_540
; Address: $D2E3E4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_540:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DA8			; AD A8 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C28			; AD 28 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_541
; Address: $D2E3F4
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_541:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6340			; AD 40 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6540			; 6D 40 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6340			; 8D 40 63 | Audio system operation
	LDA $6342			; AD 42 63 | Audio system operation
	ADC $6542			; 6D 42 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6342			; 8D 42 63 | Audio system operation
	LDA $6440			; AD 40 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6640			; 6D 40 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6440			; 8D 40 64 | Audio system operation
	LDA $6442			; AD 42 64 | Audio system operation
	ADC $6642			; 6D 42 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6442			; 8D 42 64 | Audio system operation
	LDA $6928			; AD 28 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69A8			; 6D A8 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62A8			; 9C A8 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $643F			; 4C 3F 64 | Jump to address
	STA $6928			; 8D 28 69 | Audio system operation
	LDA $6AA8			; AD A8 6A | Audio system operation
	ADC $6B28			; 6D 28 6B | Add with carry (absolute)
	STA $6AA8			; 8D A8 6A | Audio system operation
	LDA $6C28			; AD 28 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CA8			; 6D A8 6C | Add with carry (absolute)
	STA $6C28			; 8D 28 6C | Audio system operation
	LDA $6DA8			; AD A8 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E28			; 6D 28 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EA8			; 9C A8 6E | Store zero to absolute
	STZ $6E28			; 9C 28 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_542
; Address: $D2E465
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_542:
	JMP $646B			; 4C 6B 64 | Jump to address
	STA $6DA8			; 8D A8 6D | Audio system operation
	LDA $6540			; AD 40 65 | Audio system operation
	ADC $6740			; 6D 40 67 | Add with carry (absolute)
	STA $6540			; 8D 40 65 | Audio system operation
	LDA $6542			; AD 42 65 | Audio system operation
	ADC $6742			; 6D 42 67 | Add with carry (absolute)
	STA $6542			; 8D 42 65 | Audio system operation
	LDA $6640			; AD 40 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6840			; 6D 40 68 | Add with carry (absolute)
	STA $6640			; 8D 40 66 | Audio system operation
	LDA $6642			; AD 42 66 | Audio system operation
	ADC $6842			; 6D 42 68 | Add with carry (absolute)
	STA $6642			; 8D 42 66 | Audio system operation
	LDA $69A8			; AD A8 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A28			; 6D 28 6A | Add with carry (absolute)
	STA $69A8			; 8D A8 69 | Audio system operation
	LDA $6B28			; AD 28 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BA8			; 6D A8 6B | Add with carry (absolute)
	STA $6B28			; 8D 28 6B | Audio system operation
	LDA $6CA8			; AD A8 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D28			; 6D 28 6D | Add with carry (absolute)
	STA $6CA8			; 8D A8 6C | Audio system operation
	LDA $6E28			; AD 28 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EA8			; 6D A8 6E | Add with carry (absolute)
	STA $6E28			; 8D 28 6E | Audio system operation
	LDA $62A6			; AD A6 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $65A4			; 4C A4 65 | Jump to address
	LDA $633D			; AD 3D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $643D			; AD 3D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AA7			; AD A7 6A | Audio system operation
	LDY $6926			; AC 26 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_543
; Address: $D2E4D0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_543:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DA6			; AD A6 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C26			; AD 26 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_544
; Address: $D2E4E0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_544:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $633C			; AD 3C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $653C			; 6D 3C 65 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_545
; Address: $D2E4EA
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_545:
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $633C			; 8D 3C 63 | Audio system operation
	LDA $633E			; AD 3E 63 | Audio system operation
	ADC $653E			; 6D 3E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $633E			; 8D 3E 63 | Audio system operation
	LDA $643C			; AD 3C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $663C			; 6D 3C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $643C			; 8D 3C 64 | Audio system operation
	LDA $643E			; AD 3E 64 | Audio system operation
	ADC $663E			; 6D 3E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $643E			; 8D 3E 64 | Audio system operation
	LDA $6926			; AD 26 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69A6			; 6D A6 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62A6			; 9C A6 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $652B			; 4C 2B 65 | Jump to address
	STA $6926			; 8D 26 69 | Audio system operation
	LDA $6AA6			; AD A6 6A | Audio system operation
	ADC $6B26			; 6D 26 6B | Add with carry (absolute)
	STA $6AA6			; 8D A6 6A | Audio system operation
	LDA $6C26			; AD 26 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CA6			; 6D A6 6C | Add with carry (absolute)
	STA $6C26			; 8D 26 6C | Audio system operation
	LDA $6DA6			; AD A6 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E26			; 6D 26 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EA6			; 9C A6 6E | Store zero to absolute
	STZ $6E26			; 9C 26 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6557			; 4C 57 65 | Jump to address
	STA $6DA6			; 8D A6 6D | Audio system operation
	LDA $653C			; AD 3C 65 | Audio system operation
	ADC $673C			; 6D 3C 67 | Add with carry (absolute)
	STA $653C			; 8D 3C 65 | Audio system operation
	LDA $653E			; AD 3E 65 | Audio system operation
	ADC $673E			; 6D 3E 67 | Add with carry (absolute)
	STA $653E			; 8D 3E 65 | Audio system operation
	LDA $663C			; AD 3C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $683C			; 6D 3C 68 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_546
; Address: $D2E570
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_546:
	STA $663C			; 8D 3C 66 | Audio system operation
	LDA $663E			; AD 3E 66 | Audio system operation
	ADC $683E			; 6D 3E 68 | Add with carry (absolute)
	STA $663E			; 8D 3E 66 | Audio system operation
	LDA $69A6			; AD A6 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A26			; 6D 26 6A | Add with carry (absolute)
	STA $69A6			; 8D A6 69 | Audio system operation
	LDA $6B26			; AD 26 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BA6			; 6D A6 6B | Add with carry (absolute)
	STA $6B26			; 8D 26 6B | Audio system operation
	LDA $6CA6			; AD A6 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D26			; 6D 26 6D | Add with carry (absolute)
	STA $6CA6			; 8D A6 6C | Audio system operation
	LDA $6E26			; AD 26 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EA6			; 6D A6 6E | Add with carry (absolute)
	STA $6E26			; 8D 26 6E | Audio system operation
	LDA $62A4			; AD A4 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6690			; 4C 90 66 | Jump to address
	LDA $6339			; AD 39 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6439			; AD 39 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AA5			; AD A5 6A | Audio system operation
	LDY $6924			; AC 24 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_547
; Address: $D2E5BC
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_547:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DA4			; AD A4 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C24			; AD 24 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_548
; Address: $D2E5CC
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_548:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6338			; AD 38 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6538			; 6D 38 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6338			; 8D 38 63 | Audio system operation
	LDA $633A			; AD 3A 63 | Audio system operation
	ADC $653A			; 6D 3A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $633A			; 8D 3A 63 | Audio system operation
	LDA $6438			; AD 38 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6638			; 6D 38 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6438			; 8D 38 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_549
; Address: $D2E5F5
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_549:
	LDA $643A			; AD 3A 64 | Audio system operation
	ADC $663A			; 6D 3A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $643A			; 8D 3A 64 | Audio system operation
	LDA $6924			; AD 24 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69A4			; 6D A4 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62A4			; 9C A4 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6617			; 4C 17 66 | Jump to address
	STA $6924			; 8D 24 69 | Audio system operation
	LDA $6AA4			; AD A4 6A | Audio system operation
	ADC $6B24			; 6D 24 6B | Add with carry (absolute)
	STA $6AA4			; 8D A4 6A | Audio system operation
	LDA $6C24			; AD 24 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CA4			; 6D A4 6C | Add with carry (absolute)
	STA $6C24			; 8D 24 6C | Audio system operation
	LDA $6DA4			; AD A4 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E24			; 6D 24 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EA4			; 9C A4 6E | Store zero to absolute
	STZ $6E24			; 9C 24 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6643			; 4C 43 66 | Jump to address
	STA $6DA4			; 8D A4 6D | Audio system operation
	LDA $6538			; AD 38 65 | Audio system operation
	ADC $6738			; 6D 38 67 | Add with carry (absolute)
	STA $6538			; 8D 38 65 | Audio system operation
	LDA $653A			; AD 3A 65 | Audio system operation
	ADC $673A			; 6D 3A 67 | Add with carry (absolute)
	STA $653A			; 8D 3A 65 | Audio system operation
	LDA $6638			; AD 38 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6838			; 6D 38 68 | Add with carry (absolute)
	STA $6638			; 8D 38 66 | Audio system operation
	LDA $663A			; AD 3A 66 | Audio system operation
	ADC $683A			; 6D 3A 68 | Add with carry (absolute)
	STA $663A			; 8D 3A 66 | Audio system operation
	LDA $69A4			; AD A4 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A24			; 6D 24 6A | Add with carry (absolute)
	STA $69A4			; 8D A4 69 | Audio system operation
	LDA $6B24			; AD 24 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BA4			; 6D A4 6B | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_54A
; Address: $D2E679
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_54A:
	STA $6B24			; 8D 24 6B | Audio system operation
	LDA $6CA4			; AD A4 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D24			; 6D 24 6D | Add with carry (absolute)
	STA $6CA4			; 8D A4 6C | Audio system operation
	LDA $6E24			; AD 24 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EA4			; 6D A4 6E | Add with carry (absolute)
	STA $6E24			; 8D 24 6E | Audio system operation
	LDA $62A2			; AD A2 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $677C			; 4C 7C 67 | Jump to address
	LDA $6335			; AD 35 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6435			; AD 35 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AA3			; AD A3 6A | Audio system operation
	LDY $6922			; AC 22 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_54B
; Address: $D2E6A8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_54B:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DA2			; AD A2 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C22			; AD 22 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_54C
; Address: $D2E6B8
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_54C:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6334			; AD 34 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6534			; 6D 34 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6334			; 8D 34 63 | Audio system operation
	LDA $6336			; AD 36 63 | Audio system operation
	ADC $6536			; 6D 36 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6336			; 8D 36 63 | Audio system operation
	LDA $6434			; AD 34 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6634			; 6D 34 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6434			; 8D 34 64 | Audio system operation
	LDA $6436			; AD 36 64 | Audio system operation
	ADC $6636			; 6D 36 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6436			; 8D 36 64 | Audio system operation
	LDA $6922			; AD 22 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69A2			; 6D A2 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62A2			; 9C A2 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_54D
; Address: $D2E6FD
; Size: 131 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_54D:
	JMP $6703			; 4C 03 67 | Jump to address
	STA $6922			; 8D 22 69 | Audio system operation
	LDA $6AA2			; AD A2 6A | Audio system operation
	ADC $6B22			; 6D 22 6B | Add with carry (absolute)
	STA $6AA2			; 8D A2 6A | Audio system operation
	LDA $6C22			; AD 22 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CA2			; 6D A2 6C | Add with carry (absolute)
	STA $6C22			; 8D 22 6C | Audio system operation
	LDA $6DA2			; AD A2 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E22			; 6D 22 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EA2			; 9C A2 6E | Store zero to absolute
	STZ $6E22			; 9C 22 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $672F			; 4C 2F 67 | Jump to address
	STA $6DA2			; 8D A2 6D | Audio system operation
	LDA $6534			; AD 34 65 | Audio system operation
	ADC $6734			; 6D 34 67 | Add with carry (absolute)
	STA $6534			; 8D 34 65 | Audio system operation
	LDA $6536			; AD 36 65 | Audio system operation
	ADC $6736			; 6D 36 67 | Add with carry (absolute)
	STA $6536			; 8D 36 65 | Audio system operation
	LDA $6634			; AD 34 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6834			; 6D 34 68 | Add with carry (absolute)
	STA $6634			; 8D 34 66 | Audio system operation
	LDA $6636			; AD 36 66 | Audio system operation
	ADC $6836			; 6D 36 68 | Add with carry (absolute)
	STA $6636			; 8D 36 66 | Audio system operation
	LDA $69A2			; AD A2 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A22			; 6D 22 6A | Add with carry (absolute)
	STA $69A2			; 8D A2 69 | Audio system operation
	LDA $6B22			; AD 22 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BA2			; 6D A2 6B | Add with carry (absolute)
	STA $6B22			; 8D 22 6B | Audio system operation
	LDA $6CA2			; AD A2 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D22			; 6D 22 6D | Add with carry (absolute)
	STA $6CA2			; 8D A2 6C | Audio system operation
	LDA $6E22			; AD 22 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EA2			; 6D A2 6E | Add with carry (absolute)
	STA $6E22			; 8D 22 6E | Audio system operation
	LDA $62A0			; AD A0 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_54E
; Address: $D2E781
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_54E:
	JMP $6868			; 4C 68 68 | Jump to address
	LDA $6331			; AD 31 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6431			; AD 31 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6AA1			; AD A1 6A | Audio system operation
	LDY $6920			; AC 20 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_54F
; Address: $D2E794
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_54F:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6DA0			; AD A0 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C20			; AD 20 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_550
; Address: $D2E7A4
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_550:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6330			; AD 30 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6530			; 6D 30 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6330			; 8D 30 63 | Audio system operation
	LDA $6332			; AD 32 63 | Audio system operation
	ADC $6532			; 6D 32 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6332			; 8D 32 63 | Audio system operation
	LDA $6430			; AD 30 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6630			; 6D 30 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6430			; 8D 30 64 | Audio system operation
	LDA $6432			; AD 32 64 | Audio system operation
	ADC $6632			; 6D 32 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6432			; 8D 32 64 | Audio system operation
	LDA $6920			; AD 20 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $69A0			; 6D A0 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $62A0			; 9C A0 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $67EF			; 4C EF 67 | Jump to address
	STA $6920			; 8D 20 69 | Audio system operation
	LDA $6AA0			; AD A0 6A | Audio system operation
	ADC $6B20			; 6D 20 6B | Add with carry (absolute)
	STA $6AA0			; 8D A0 6A | Audio system operation
	LDA $6C20			; AD 20 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6CA0			; 6D A0 6C | Add with carry (absolute)
	STA $6C20			; 8D 20 6C | Audio system operation
	LDA $6DA0			; AD A0 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_551
; Address: $D2E806
; Size: 121 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_551:
	ADC $6E20			; 6D 20 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6EA0			; 9C A0 6E | Store zero to absolute
	STZ $6E20			; 9C 20 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $681B			; 4C 1B 68 | Jump to address
	STA $6DA0			; 8D A0 6D | Audio system operation
	LDA $6530			; AD 30 65 | Audio system operation
	ADC $6730			; 6D 30 67 | Add with carry (absolute)
	STA $6530			; 8D 30 65 | Audio system operation
	LDA $6532			; AD 32 65 | Audio system operation
	ADC $6732			; 6D 32 67 | Add with carry (absolute)
	STA $6532			; 8D 32 65 | Audio system operation
	LDA $6630			; AD 30 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6830			; 6D 30 68 | Add with carry (absolute)
	STA $6630			; 8D 30 66 | Audio system operation
	LDA $6632			; AD 32 66 | Audio system operation
	ADC $6832			; 6D 32 68 | Add with carry (absolute)
	STA $6632			; 8D 32 66 | Audio system operation
	LDA $69A0			; AD A0 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A20			; 6D 20 6A | Add with carry (absolute)
	STA $69A0			; 8D A0 69 | Audio system operation
	LDA $6B20			; AD 20 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6BA0			; 6D A0 6B | Add with carry (absolute)
	STA $6B20			; 8D 20 6B | Audio system operation
	LDA $6CA0			; AD A0 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D20			; 6D 20 6D | Add with carry (absolute)
	STA $6CA0			; 8D A0 6C | Audio system operation
	LDA $6E20			; AD 20 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6EA0			; 6D A0 6E | Add with carry (absolute)
	STA $6E20			; 8D 20 6E | Audio system operation
	LDA $629E			; AD 9E 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6954			; 4C 54 69 | Jump to address
	LDA $632D			; AD 2D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $642D			; AD 2D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6A9F			; AD 9F 6A | Audio system operation
	LDY $691E			; AC 1E 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_552
; Address: $D2E880
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_552:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D9E			; AD 9E 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_554
; Address: $D2E890
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_554:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $632C			; AD 2C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $652C			; 6D 2C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $632C			; 8D 2C 63 | Audio system operation
	LDA $632E			; AD 2E 63 | Audio system operation
	ADC $652E			; 6D 2E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $632E			; 8D 2E 63 | Audio system operation
	LDA $642C			; AD 2C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $662C			; 6D 2C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $642C			; 8D 2C 64 | Audio system operation
	LDA $642E			; AD 2E 64 | Audio system operation
	ADC $662E			; 6D 2E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $642E			; 8D 2E 64 | Audio system operation
	LDA $691E			; AD 1E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $699E			; 6D 9E 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $629E			; 9C 9E 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $68DB			; 4C DB 68 | Jump to address
	STA $691E			; 8D 1E 69 | Audio system operation
	LDA $6A9E			; AD 9E 6A | Audio system operation
	ADC $6B1E			; 6D 1E 6B | Add with carry (absolute)
	STA $6A9E			; 8D 9E 6A | Audio system operation
	LDA $6C1E			; AD 1E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C9E			; 6D 9E 6C | Add with carry (absolute)
	STA $6C1E			; 8D 1E 6C | Audio system operation
	LDA $6D9E			; AD 9E 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E1E			; 6D 1E 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E9E			; 9C 9E 6E | Store zero to absolute
	STZ $6E1E			; 9C 1E 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6907			; 4C 07 69 | Jump to address
	STA $6D9E			; 8D 9E 6D | Audio system operation
	LDA $652C			; AD 2C 65 | Audio system operation
	ADC $672C			; 6D 2C 67 | Add with carry (absolute)
	STA $652C			; 8D 2C 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_555
; Address: $D2E910
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_555:
	LDA $652E			; AD 2E 65 | Audio system operation
	ADC $672E			; 6D 2E 67 | Add with carry (absolute)
	STA $652E			; 8D 2E 65 | Audio system operation
	LDA $662C			; AD 2C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $682C			; 6D 2C 68 | Add with carry (absolute)
	STA $662C			; 8D 2C 66 | Audio system operation
	LDA $662E			; AD 2E 66 | Audio system operation
	ADC $682E			; 6D 2E 68 | Add with carry (absolute)
	STA $662E			; 8D 2E 66 | Audio system operation
	LDA $699E			; AD 9E 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A1E			; 6D 1E 6A | Add with carry (absolute)
	STA $699E			; 8D 9E 69 | Audio system operation
	LDA $6B1E			; AD 1E 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6B9E			; 6D 9E 6B | Add with carry (absolute)
	STA $6B1E			; 8D 1E 6B | Audio system operation
	LDA $6C9E			; AD 9E 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D1E			; 6D 1E 6D | Add with carry (absolute)
	STA $6C9E			; 8D 9E 6C | Audio system operation
	LDA $6E1E			; AD 1E 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E9E			; 6D 9E 6E | Add with carry (absolute)
	STA $6E1E			; 8D 1E 6E | Audio system operation
	LDA $629C			; AD 9C 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6A40			; 4C 40 6A | Jump to address
	LDA $6329			; AD 29 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6429			; AD 29 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6A9D			; AD 9D 6A | Audio system operation
	LDY $691C			; AC 1C 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_556
; Address: $D2E96C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_556:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D9C			; AD 9C 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C1C			; AD 1C 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_557
; Address: $D2E97C
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_557:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6328			; AD 28 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6528			; 6D 28 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6328			; 8D 28 63 | Audio system operation
	LDA $632A			; AD 2A 63 | Audio system operation
	ADC $652A			; 6D 2A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_558
; Address: $D2E995
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_558:
	STA $632A			; 8D 2A 63 | Audio system operation
	LDA $6428			; AD 28 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6628			; 6D 28 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6428			; 8D 28 64 | Audio system operation
	LDA $642A			; AD 2A 64 | Audio system operation
	ADC $662A			; 6D 2A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $642A			; 8D 2A 64 | Audio system operation
	LDA $691C			; AD 1C 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $699C			; 6D 9C 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $629C			; 9C 9C 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $69C7			; 4C C7 69 | Jump to address
	STA $691C			; 8D 1C 69 | Audio system operation
	LDA $6A9C			; AD 9C 6A | Audio system operation
	ADC $6B1C			; 6D 1C 6B | Add with carry (absolute)
	STA $6A9C			; 8D 9C 6A | Audio system operation
	LDA $6C1C			; AD 1C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C9C			; 6D 9C 6C | Add with carry (absolute)
	STA $6C1C			; 8D 1C 6C | Audio system operation
	LDA $6D9C			; AD 9C 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E1C			; 6D 1C 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E9C			; 9C 9C 6E | Store zero to absolute
	STZ $6E1C			; 9C 1C 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $69F3			; 4C F3 69 | Jump to address
	STA $6D9C			; 8D 9C 6D | Audio system operation
	LDA $6528			; AD 28 65 | Audio system operation
	ADC $6728			; 6D 28 67 | Add with carry (absolute)
	STA $6528			; 8D 28 65 | Audio system operation
	LDA $652A			; AD 2A 65 | Audio system operation
	ADC $672A			; 6D 2A 67 | Add with carry (absolute)
	STA $652A			; 8D 2A 65 | Audio system operation
	LDA $6628			; AD 28 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6828			; 6D 28 68 | Add with carry (absolute)
	STA $6628			; 8D 28 66 | Audio system operation
	LDA $662A			; AD 2A 66 | Audio system operation
	ADC $682A			; 6D 2A 68 | Add with carry (absolute)
	STA $662A			; 8D 2A 66 | Audio system operation
	LDA $699C			; AD 9C 69 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_559
; Address: $D2EA1B
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_559:
	CLC				  ; 18 | Clear carry flag
	ADC $6A1C			; 6D 1C 6A | Add with carry (absolute)
	STA $699C			; 8D 9C 69 | Audio system operation
	LDA $6B1C			; AD 1C 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6B9C			; 6D 9C 6B | Add with carry (absolute)
	STA $6B1C			; 8D 1C 6B | Audio system operation
	LDA $6C9C			; AD 9C 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D1C			; 6D 1C 6D | Add with carry (absolute)
	STA $6C9C			; 8D 9C 6C | Audio system operation
	LDA $6E1C			; AD 1C 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E9C			; 6D 9C 6E | Add with carry (absolute)
	STA $6E1C			; 8D 1C 6E | Audio system operation
	LDA $629A			; AD 9A 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6B2C			; 4C 2C 6B | Jump to address
	LDA $6325			; AD 25 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6425			; AD 25 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6A9B			; AD 9B 6A | Audio system operation
	LDY $691A			; AC 1A 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_55A
; Address: $D2EA58
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_55A:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D9A			; AD 9A 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C1A			; AD 1A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_55B
; Address: $D2EA68
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_55B:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6324			; AD 24 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6524			; 6D 24 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6324			; 8D 24 63 | Audio system operation
	LDA $6326			; AD 26 63 | Audio system operation
	ADC $6526			; 6D 26 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6326			; 8D 26 63 | Audio system operation
	LDA $6424			; AD 24 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6624			; 6D 24 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6424			; 8D 24 64 | Audio system operation
	LDA $6426			; AD 26 64 | Audio system operation
	ADC $6626			; 6D 26 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6426			; 8D 26 64 | Audio system operation
	LDA $691A			; AD 1A 69 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_55C
; Address: $D2EAA0
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_55C:
	CLC				  ; 18 | Clear carry flag
	ADC $699A			; 6D 9A 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $629A			; 9C 9A 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6AB3			; 4C B3 6A | Jump to address
	STA $691A			; 8D 1A 69 | Audio system operation
	LDA $6A9A			; AD 9A 6A | Audio system operation
	ADC $6B1A			; 6D 1A 6B | Add with carry (absolute)
	STA $6A9A			; 8D 9A 6A | Audio system operation
	LDA $6C1A			; AD 1A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C9A			; 6D 9A 6C | Add with carry (absolute)
	STA $6C1A			; 8D 1A 6C | Audio system operation
	LDA $6D9A			; AD 9A 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E1A			; 6D 1A 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E9A			; 9C 9A 6E | Store zero to absolute
	STZ $6E1A			; 9C 1A 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6ADF			; 4C DF 6A | Jump to address
	STA $6D9A			; 8D 9A 6D | Audio system operation
	LDA $6524			; AD 24 65 | Audio system operation
	ADC $6724			; 6D 24 67 | Add with carry (absolute)
	STA $6524			; 8D 24 65 | Audio system operation
	LDA $6526			; AD 26 65 | Audio system operation
	ADC $6726			; 6D 26 67 | Add with carry (absolute)
	STA $6526			; 8D 26 65 | Audio system operation
	LDA $6624			; AD 24 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6824			; 6D 24 68 | Add with carry (absolute)
	STA $6624			; 8D 24 66 | Audio system operation
	LDA $6626			; AD 26 66 | Audio system operation
	ADC $6826			; 6D 26 68 | Add with carry (absolute)
	STA $6626			; 8D 26 66 | Audio system operation
	LDA $699A			; AD 9A 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A1A			; 6D 1A 6A | Add with carry (absolute)
	STA $699A			; 8D 9A 69 | Audio system operation
	LDA $6B1A			; AD 1A 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6B9A			; 6D 9A 6B | Add with carry (absolute)
	STA $6B1A			; 8D 1A 6B | Audio system operation
	LDA $6C9A			; AD 9A 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D1A			; 6D 1A 6D | Add with carry (absolute)
	STA $6C9A			; 8D 9A 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_55D
; Address: $D2EB22
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_55D:
	LDA $6E1A			; AD 1A 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E9A			; 6D 9A 6E | Add with carry (absolute)
	STA $6E1A			; 8D 1A 6E | Audio system operation
	LDA $6298			; AD 98 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6C18			; 4C 18 6C | Jump to address
	LDA $6321			; AD 21 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6421			; AD 21 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6A99			; AD 99 6A | Audio system operation
	LDY $6918			; AC 18 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_55E
; Address: $D2EB44
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_55E:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D98			; AD 98 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C18			; AD 18 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_55F
; Address: $D2EB54
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_55F:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6320			; AD 20 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6520			; 6D 20 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6320			; 8D 20 63 | Audio system operation
	LDA $6322			; AD 22 63 | Audio system operation
	ADC $6522			; 6D 22 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6322			; 8D 22 63 | Audio system operation
	LDA $6420			; AD 20 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6620			; 6D 20 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6420			; 8D 20 64 | Audio system operation
	LDA $6422			; AD 22 64 | Audio system operation
	ADC $6622			; 6D 22 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6422			; 8D 22 64 | Audio system operation
	LDA $6918			; AD 18 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6998			; 6D 98 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6298			; 9C 98 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6B9F			; 4C 9F 6B | Jump to address
	STA $6918			; 8D 18 69 | Audio system operation
	LDA $6A98			; AD 98 6A | Audio system operation
	ADC $6B18			; 6D 18 6B | Add with carry (absolute)
	STA $6A98			; 8D 98 6A | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_560
; Address: $D2EBA8
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_560:
	LDA $6C18			; AD 18 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C98			; 6D 98 6C | Add with carry (absolute)
	STA $6C18			; 8D 18 6C | Audio system operation
	LDA $6D98			; AD 98 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E18			; 6D 18 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E98			; 9C 98 6E | Store zero to absolute
	STZ $6E18			; 9C 18 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6BCB			; 4C CB 6B | Jump to address
	STA $6D98			; 8D 98 6D | Audio system operation
	LDA $6520			; AD 20 65 | Audio system operation
	ADC $6720			; 6D 20 67 | Add with carry (absolute)
	STA $6520			; 8D 20 65 | Audio system operation
	LDA $6522			; AD 22 65 | Audio system operation
	ADC $6722			; 6D 22 67 | Add with carry (absolute)
	STA $6522			; 8D 22 65 | Audio system operation
	LDA $6620			; AD 20 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6820			; 6D 20 68 | Add with carry (absolute)
	STA $6620			; 8D 20 66 | Audio system operation
	LDA $6622			; AD 22 66 | Audio system operation
	ADC $6822			; 6D 22 68 | Add with carry (absolute)
	STA $6622			; 8D 22 66 | Audio system operation
	LDA $6998			; AD 98 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A18			; 6D 18 6A | Add with carry (absolute)
	STA $6998			; 8D 98 69 | Audio system operation
	LDA $6B18			; AD 18 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6B98			; 6D 98 6B | Add with carry (absolute)
	STA $6B18			; 8D 18 6B | Audio system operation
	LDA $6C98			; AD 98 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D18			; 6D 18 6D | Add with carry (absolute)
	STA $6C98			; 8D 98 6C | Audio system operation
	LDA $6E18			; AD 18 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E98			; 6D 98 6E | Add with carry (absolute)
	STA $6E18			; 8D 18 6E | Audio system operation
	LDA $6296			; AD 96 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6D04			; 4C 04 6D | Jump to address
	LDA $631D			; AD 1D 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $641D			; AD 1D 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_562
; Address: $D2EC30
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_562:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D96			; AD 96 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C16			; AD 16 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_563
; Address: $D2EC40
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_563:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $631C			; AD 1C 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $651C			; 6D 1C 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $631C			; 8D 1C 63 | Audio system operation
	LDA $631E			; AD 1E 63 | Audio system operation
	ADC $651E			; 6D 1E 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $631E			; 8D 1E 63 | Audio system operation
	LDA $641C			; AD 1C 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $661C			; 6D 1C 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $641C			; 8D 1C 64 | Audio system operation
	LDA $641E			; AD 1E 64 | Audio system operation
	ADC $661E			; 6D 1E 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $641E			; 8D 1E 64 | Audio system operation
	LDA $6916			; AD 16 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6996			; 6D 96 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6296			; 9C 96 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6C8B			; 4C 8B 6C | Jump to address
	STA $6916			; 8D 16 69 | Audio system operation
	LDA $6A96			; AD 96 6A | Audio system operation
	ADC $6B16			; 6D 16 6B | Add with carry (absolute)
	STA $6A96			; 8D 96 6A | Audio system operation
	LDA $6C16			; AD 16 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C96			; 6D 96 6C | Add with carry (absolute)
	STA $6C16			; 8D 16 6C | Audio system operation
	LDA $6D96			; AD 96 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E16			; 6D 16 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E96			; 9C 96 6E | Store zero to absolute
	STZ $6E16			; 9C 16 6E | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_564
; Address: $D2ECB0
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_564:
	CLC				  ; 18 | Clear carry flag
	JMP $6CB7			; 4C B7 6C | Jump to address
	STA $6D96			; 8D 96 6D | Audio system operation
	LDA $651C			; AD 1C 65 | Audio system operation
	ADC $671C			; 6D 1C 67 | Add with carry (absolute)
	STA $651C			; 8D 1C 65 | Audio system operation
	LDA $651E			; AD 1E 65 | Audio system operation
	ADC $671E			; 6D 1E 67 | Add with carry (absolute)
	STA $651E			; 8D 1E 65 | Audio system operation
	LDA $661C			; AD 1C 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $681C			; 6D 1C 68 | Add with carry (absolute)
	STA $661C			; 8D 1C 66 | Audio system operation
	LDA $661E			; AD 1E 66 | Audio system operation
	ADC $681E			; 6D 1E 68 | Add with carry (absolute)
	STA $661E			; 8D 1E 66 | Audio system operation
	LDA $6996			; AD 96 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A16			; 6D 16 6A | Add with carry (absolute)
	STA $6996			; 8D 96 69 | Audio system operation
	LDA $6B16			; AD 16 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6B96			; 6D 96 6B | Add with carry (absolute)
	STA $6B16			; 8D 16 6B | Audio system operation
	LDA $6C96			; AD 96 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D16			; 6D 16 6D | Add with carry (absolute)
	STA $6C96			; 8D 96 6C | Audio system operation
	LDA $6E16			; AD 16 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E96			; 6D 96 6E | Add with carry (absolute)
	STA $6E16			; 8D 16 6E | Audio system operation
	LDA $6294			; AD 94 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6DF0			; 4C F0 6D | Jump to address
	LDA $6319			; AD 19 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6419			; AD 19 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6A95			; AD 95 6A | Audio system operation
	LDY $6914			; AC 14 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_565
; Address: $D2ED1C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_565:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D94			; AD 94 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C14			; AD 14 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_566
; Address: $D2ED2C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_566:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6318			; AD 18 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_567
; Address: $D2ED33
; Size: 132 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_567:
	ADC $6518			; 6D 18 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6318			; 8D 18 63 | Audio system operation
	LDA $631A			; AD 1A 63 | Audio system operation
	ADC $651A			; 6D 1A 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $631A			; 8D 1A 63 | Audio system operation
	LDA $6418			; AD 18 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6618			; 6D 18 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6418			; 8D 18 64 | Audio system operation
	LDA $641A			; AD 1A 64 | Audio system operation
	ADC $661A			; 6D 1A 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $641A			; 8D 1A 64 | Audio system operation
	LDA $6914			; AD 14 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6994			; 6D 94 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6294			; 9C 94 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6D77			; 4C 77 6D | Jump to address
	STA $6914			; 8D 14 69 | Audio system operation
	LDA $6A94			; AD 94 6A | Audio system operation
	ADC $6B14			; 6D 14 6B | Add with carry (absolute)
	STA $6A94			; 8D 94 6A | Audio system operation
	LDA $6C14			; AD 14 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C94			; 6D 94 6C | Add with carry (absolute)
	STA $6C14			; 8D 14 6C | Audio system operation
	LDA $6D94			; AD 94 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E14			; 6D 14 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E94			; 9C 94 6E | Store zero to absolute
	STZ $6E14			; 9C 14 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6DA3			; 4C A3 6D | Jump to address
	STA $6D94			; 8D 94 6D | Audio system operation
	LDA $6518			; AD 18 65 | Audio system operation
	ADC $6718			; 6D 18 67 | Add with carry (absolute)
	STA $6518			; 8D 18 65 | Audio system operation
	LDA $651A			; AD 1A 65 | Audio system operation
	ADC $671A			; 6D 1A 67 | Add with carry (absolute)
	STA $651A			; 8D 1A 65 | Audio system operation
	LDA $6618			; AD 18 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_568
; Address: $D2EDB9
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_568:
	ADC $6818			; 6D 18 68 | Add with carry (absolute)
	STA $6618			; 8D 18 66 | Audio system operation
	LDA $661A			; AD 1A 66 | Audio system operation
	ADC $681A			; 6D 1A 68 | Add with carry (absolute)
	STA $661A			; 8D 1A 66 | Audio system operation
	LDA $6994			; AD 94 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A14			; 6D 14 6A | Add with carry (absolute)
	STA $6994			; 8D 94 69 | Audio system operation
	LDA $6B14			; AD 14 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6B94			; 6D 94 6B | Add with carry (absolute)
	STA $6B14			; 8D 14 6B | Audio system operation
	LDA $6C94			; AD 94 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D14			; 6D 14 6D | Add with carry (absolute)
	STA $6C94			; 8D 94 6C | Audio system operation
	LDA $6E14			; AD 14 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E94			; 6D 94 6E | Add with carry (absolute)
	STA $6E14			; 8D 14 6E | Audio system operation
	LDA $6292			; AD 92 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6EDC			; 4C DC 6E | Jump to address
	LDA $6315			; AD 15 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6415			; AD 15 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6A93			; AD 93 6A | Audio system operation
	LDY $6912			; AC 12 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_569
; Address: $D2EE08
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_569:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D92			; AD 92 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C12			; AD 12 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_56A
; Address: $D2EE18
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_56A:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6314			; AD 14 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6514			; 6D 14 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6314			; 8D 14 63 | Audio system operation
	LDA $6316			; AD 16 63 | Audio system operation
	ADC $6516			; 6D 16 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6316			; 8D 16 63 | Audio system operation
	LDA $6414			; AD 14 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6614			; 6D 14 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_56B
; Address: $D2EE3E
; Size: 130 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_56B:
	STA $6414			; 8D 14 64 | Audio system operation
	LDA $6416			; AD 16 64 | Audio system operation
	ADC $6616			; 6D 16 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6416			; 8D 16 64 | Audio system operation
	LDA $6912			; AD 12 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6992			; 6D 92 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6292			; 9C 92 62 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6E63			; 4C 63 6E | Jump to address
	STA $6912			; 8D 12 69 | Audio system operation
	LDA $6A92			; AD 92 6A | Audio system operation
	ADC $6B12			; 6D 12 6B | Add with carry (absolute)
	STA $6A92			; 8D 92 6A | Audio system operation
	LDA $6C12			; AD 12 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C92			; 6D 92 6C | Add with carry (absolute)
	STA $6C12			; 8D 12 6C | Audio system operation
	LDA $6D92			; AD 92 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E12			; 6D 12 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E92			; 9C 92 6E | Store zero to absolute
	STZ $6E12			; 9C 12 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6E8F			; 4C 8F 6E | Jump to address
	STA $6D92			; 8D 92 6D | Audio system operation
	LDA $6514			; AD 14 65 | Audio system operation
	ADC $6714			; 6D 14 67 | Add with carry (absolute)
	STA $6514			; 8D 14 65 | Audio system operation
	LDA $6516			; AD 16 65 | Audio system operation
	ADC $6716			; 6D 16 67 | Add with carry (absolute)
	STA $6516			; 8D 16 65 | Audio system operation
	LDA $6614			; AD 14 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6814			; 6D 14 68 | Add with carry (absolute)
	STA $6614			; 8D 14 66 | Audio system operation
	LDA $6616			; AD 16 66 | Audio system operation
	ADC $6816			; 6D 16 68 | Add with carry (absolute)
	STA $6616			; 8D 16 66 | Audio system operation
	LDA $6992			; AD 92 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A12			; 6D 12 6A | Add with carry (absolute)
	STA $6992			; 8D 92 69 | Audio system operation
	LDA $6B12			; AD 12 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_56C
; Address: $D2EEC2
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_56C:
	ADC $6B92			; 6D 92 6B | Add with carry (absolute)
	STA $6B12			; 8D 12 6B | Audio system operation
	LDA $6C92			; AD 92 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D12			; 6D 12 6D | Add with carry (absolute)
	STA $6C92			; 8D 92 6C | Audio system operation
	LDA $6E12			; AD 12 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E92			; 6D 92 6E | Add with carry (absolute)
	STA $6E12			; 8D 12 6E | Audio system operation
	LDA $6290			; AD 90 62 | Audio system operation
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $6FC8			; 4C C8 6F | Jump to address
	LDA $6311			; AD 11 63 | Audio system operation
	STA $70			  ; 85 70 | Audio system operation
	LDA $6411			; AD 11 64 | Audio system operation
	STA $72			  ; 85 72 | Audio system operation
	LDA $6A91			; AD 91 6A | Audio system operation
	LDY $6910			; AC 10 69 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_56D
; Address: $D2EEF4
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_56D:
	JSR $7A2F			; 20 2F 7A | Jump to subroutine
	BCS $0E			  ; B0 0E | Branch if carry set
	LDA $6D90			; AD 90 6D | Audio system operation
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	LDA $6C10			; AD 10 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_56E
; Address: $D2EF04
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_56E:
	JSR $7BC2			; 20 C2 7B | Jump to subroutine
	LDA $6310			; AD 10 63 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6510			; 6D 10 65 | Add with carry (absolute)
	AND $6F14			; 2D 14 6F | Logical AND with accumulator (absolute)
	STA $6310			; 8D 10 63 | Audio system operation
	LDA $6312			; AD 12 63 | Audio system operation
	ADC $6512			; 6D 12 65 | Add with carry (absolute)
	AND $6F16			; 2D 16 6F | Logical AND with accumulator (absolute)
	STA $6312			; 8D 12 63 | Audio system operation
	LDA $6410			; AD 10 64 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6610			; 6D 10 66 | Add with carry (absolute)
	AND $6F18			; 2D 18 6F | Logical AND with accumulator (absolute)
	STA $6410			; 8D 10 64 | Audio system operation
	LDA $6412			; AD 12 64 | Audio system operation
	ADC $6612			; 6D 12 66 | Add with carry (absolute)
	AND $6F1A			; 2D 1A 6F | Logical AND with accumulator (absolute)
	STA $6412			; 8D 12 64 | Audio system operation
	LDA $6910			; AD 10 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6990			; 6D 90 69 | Add with carry (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	BCC $07			  ; 90 07 | Branch if carry clear
	STZ $6290			; 9C 90 62 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_56F
; Address: $D2EF48
; Size: 128 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_56F:
	CLC				  ; 18 | Clear carry flag
	JMP $6F4F			; 4C 4F 6F | Jump to address
	STA $6910			; 8D 10 69 | Audio system operation
	LDA $6A90			; AD 90 6A | Audio system operation
	ADC $6B10			; 6D 10 6B | Add with carry (absolute)
	STA $6A90			; 8D 90 6A | Audio system operation
	LDA $6C10			; AD 10 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6C90			; 6D 90 6C | Add with carry (absolute)
	STA $6C10			; 8D 10 6C | Audio system operation
	LDA $6D90			; AD 90 6D | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E10			; 6D 10 6E | Add with carry (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0A			  ; 90 0A | Branch if carry clear
	STZ $6E90			; 9C 90 6E | Store zero to absolute
	STZ $6E10			; 9C 10 6E | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	JMP $6F7B			; 4C 7B 6F | Jump to address
	STA $6D90			; 8D 90 6D | Audio system operation
	LDA $6510			; AD 10 65 | Audio system operation
	ADC $6710			; 6D 10 67 | Add with carry (absolute)
	STA $6510			; 8D 10 65 | Audio system operation
	LDA $6512			; AD 12 65 | Audio system operation
	ADC $6712			; 6D 12 67 | Add with carry (absolute)
	STA $6512			; 8D 12 65 | Audio system operation
	LDA $6610			; AD 10 66 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6810			; 6D 10 68 | Add with carry (absolute)
	STA $6610			; 8D 10 66 | Audio system operation
	LDA $6612			; AD 12 66 | Audio system operation
	ADC $6812			; 6D 12 68 | Add with carry (absolute)
	STA $6612			; 8D 12 66 | Audio system operation
	LDA $6990			; AD 90 69 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6A10			; 6D 10 6A | Add with carry (absolute)
	STA $6990			; 8D 90 69 | Audio system operation
	LDA $6B10			; AD 10 6B | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6B90			; 6D 90 6B | Add with carry (absolute)
	STA $6B10			; 8D 10 6B | Audio system operation
	LDA $6C90			; AD 90 6C | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6D10			; 6D 10 6D | Add with carry (absolute)
	STA $6C90			; 8D 90 6C | Audio system operation
	LDA $6E10			; AD 10 6E | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6E90			; 6D 90 6E | Add with carry (absolute)
	STA $6E10			; 8D 10 6E | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_570
; Address: $D2EFC9
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_570:
	INY				  ; C8 | Increment Y register
	ROR $6DF0			; 6E F0 6D | Rotate right (absolute)
	ADC $6C18			; 6D 18 6C | Add with carry (absolute)
	BIT $406B			; 2C 6B 40 | Test bits in accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BCC $66			  ; 90 66 | Branch if carry clear
	LDY $65			  ; A4 65 | Load from zero page into Y register
	CLV				  ; B8 | Clear overflow flag
	STZ $CC			  ; 64 CC | Store zero to zero page
	CPX #$62			 ; E0 62 | Compare X register (immediate)
	PEA #$0861		   ; F4 61 08 | Push effective address to stack
	ADC ($1C,X)		  ; 61 1C | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_571
; Address: $D2EFED
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_571:
	BMI $5F			  ; 30 5F | Branch if negative
	LSR $5D58,X		  ; 5E 58 5D | Logical shift right (absolute,X)
	JMP ($805C)		  ; 6C 5C 80 | Jump to address (absolute indirect)
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $58BC,Y		  ; 59 BC 58 | Exclusive OR with accumulator (absolute,Y)
	BNE $57			  ; D0 57 | Branch if not equal
	CPX $56			  ; E4 56 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_572
; Address: $D2F005
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_572:
	JSR $3454			; 20 54 34 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	JMP $507051		  ; 5C 51 70 50 | Jump to address long
	STY $4F			  ; 84 4F | Store Y register to zero page
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $4DAC			; 4E AC 4D | Logical shift right (absolute)
	CPY #$4C			 ; C0 4C | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$10			 ; 49 10 | Exclusive OR with accumulator (immediate)
	EOR #$24			 ; 49 24 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	JMP $6046			; 4C 46 60 | Jump to address
	EOR $74			  ; 45 74 | Exclusive OR with accumulator (zero page)
	DEY				  ; 88 | Decrement Y register
	STZ $B042			; 9C 42 B0 | Store zero to absolute
	EOR ($C4,X)		  ; 41 C4 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	CPX $003E			; EC 3E 00 | Compare X register (absolute)
	ROL $3D14,X		  ; 3E 14 3D | Rotate left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	BVC $3A			  ; 50 3A | Branch if overflow clear
	STZ $39			  ; 64 39 | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_573
; Address: $D2F042
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_573:
	SEC				  ; 38 | Set carry flag
	STY $A037			; 8C 37 A0 | Store Y register to absolute address
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STZ $6F7E			; 9C 7E 6F | Store zero to absolute
	LDA $6F10			; AD 10 6F | Audio system operation
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$3F			 ; A9 3F | Audio system operation
	STA $6F10			; 8D 10 6F | Audio system operation
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $6F7C			; 8D 7C 6F | Audio system operation
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_574
; Address: $D2F070
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_574:
	JSR $70AF			; 20 AF 70 | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $6F7C			; CC 7C 6F | Compare Y register (absolute)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $7070			; 4C 70 70 | Jump to address
	STZ $33D6			; 9C D6 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank24_AudioFunction_576
; Address: $D2F088
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_576:
	JSL $C9724B		  ; 22 4B 72 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_577
; Address: $D2F094
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_577:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_578
; Address: $D2F0A0
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_578:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_579
; Address: $D2F0A4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_579:
	JSR $70AF			; 20 AF 70 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_57B
; Address: $D2F0B5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_57B:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F1C			; 2D 1C 6F | Logical AND with accumulator (absolute)
	ORA $6F1E			; 0D 1E 6F | Logical OR with accumulator (absolute)
	STA $6310,X		  ; 9D 10 63 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_57C
; Address: $D2F0C1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_57C:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F34			; 2D 34 6F | Logical AND with accumulator (absolute)
	ORA $6F36			; 0D 36 6F | Logical OR with accumulator (absolute)
	STA $6312,X		  ; 9D 12 63 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_57D
; Address: $D2F0CD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_57D:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F20			; 2D 20 6F | Logical AND with accumulator (absolute)
	ORA $6F22			; 0D 22 6F | Logical OR with accumulator (absolute)
	STA $6410,X		  ; 9D 10 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_57E
; Address: $D2F0D9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_57E:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F38			; 2D 38 6F | Logical AND with accumulator (absolute)
	ORA $6F3A			; 0D 3A 6F | Logical OR with accumulator (absolute)
	STA $6412,X		  ; 9D 12 64 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_57F
; Address: $D2F0E5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_57F:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F24			; 2D 24 6F | Logical AND with accumulator (absolute)
	ORA $6F26			; 0D 26 6F | Logical OR with accumulator (absolute)
	STA $6510,X		  ; 9D 10 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_580
; Address: $D2F0F1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_580:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F3C			; 2D 3C 6F | Logical AND with accumulator (absolute)
	ORA $6F3E			; 0D 3E 6F | Logical OR with accumulator (absolute)
	STA $6512,X		  ; 9D 12 65 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_581
; Address: $D2F0FD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_581:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F28			; 2D 28 6F | Logical AND with accumulator (absolute)
	ORA $6F2A			; 0D 2A 6F | Logical OR with accumulator (absolute)
	STA $6610,X		  ; 9D 10 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_582
; Address: $D2F109
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_582:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F40			; 2D 40 6F | Logical AND with accumulator (absolute)
	ORA $6F42			; 0D 42 6F | Logical OR with accumulator (absolute)
	STA $6612,X		  ; 9D 12 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_583
; Address: $D2F115
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_583:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F2C			; 2D 2C 6F | Logical AND with accumulator (absolute)
	ORA $6F2E			; 0D 2E 6F | Logical OR with accumulator (absolute)
	STA $6710,X		  ; 9D 10 67 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_584
; Address: $D2F121
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_584:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F44			; 2D 44 6F | Logical AND with accumulator (absolute)
	ORA $6F46			; 0D 46 6F | Logical OR with accumulator (absolute)
	STA $6712,X		  ; 9D 12 67 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_585
; Address: $D2F12D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_585:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F30			; 2D 30 6F | Logical AND with accumulator (absolute)
	ORA $6F32			; 0D 32 6F | Logical OR with accumulator (absolute)
	STA $6810,X		  ; 9D 10 68 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_586
; Address: $D2F139
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_586:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F48			; 2D 48 6F | Logical AND with accumulator (absolute)
	ORA $6F4A			; 0D 4A 6F | Logical OR with accumulator (absolute)
	STA $6812,X		  ; 9D 12 68 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_587
; Address: $D2F145
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_587:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F4C			; 2D 4C 6F | Logical AND with accumulator (absolute)
	ORA $6F4E			; 0D 4E 6F | Logical OR with accumulator (absolute)
	STA $6910,Y		  ; 99 10 69 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_588
; Address: $D2F151
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_588:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F50			; 2D 50 6F | Logical AND with accumulator (absolute)
	ORA $6F52			; 0D 52 6F | Logical OR with accumulator (absolute)
	STA $6990,Y		  ; 99 90 69 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_589
; Address: $D2F15D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_589:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F54			; 2D 54 6F | Logical AND with accumulator (absolute)
	ORA $6F56			; 0D 56 6F | Logical OR with accumulator (absolute)
	STA $6A10,Y		  ; 99 10 6A | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_58A
; Address: $D2F169
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_58A:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F58			; 2D 58 6F | Logical AND with accumulator (absolute)
	ORA $6F5A			; 0D 5A 6F | Logical OR with accumulator (absolute)
	STA $6A90,Y		  ; 99 90 6A | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_58B
; Address: $D2F175
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_58B:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F5C			; 2D 5C 6F | Logical AND with accumulator (absolute)
	ORA $6F5E			; 0D 5E 6F | Logical OR with accumulator (absolute)
	STA $6B10,Y		  ; 99 10 6B | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_58C
; Address: $D2F181
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_58C:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F60			; 2D 60 6F | Logical AND with accumulator (absolute)
	ORA $6F62			; 0D 62 6F | Logical OR with accumulator (absolute)
	STA $6B90,Y		  ; 99 90 6B | Audio system operation
	LDA $6F12			; AD 12 6F | Audio system operation
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $2D			  ; F0 2D | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_58D
; Address: $D2F195
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_58D:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $25			  ; F0 25 | Branch if equal
	LDA $6510,X		  ; BD 10 65 | Audio system operation
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $6510,X		  ; 9D 10 65 | Audio system operation
	LDA $6512,X		  ; BD 12 65 | Audio system operation
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $6512,X		  ; 9D 12 65 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_58E
; Address: $D2F1B3
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_58E:
	ADC $6510,X		  ; 7D 10 65 | Add with carry (absolute,X)
	STA $6510,X		  ; 9D 10 65 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	ADC $6512,X		  ; 7D 12 65 | Add with carry (absolute,X)
	STA $6512,X		  ; 9D 12 65 | Audio system operation
	LDA $6F12			; AD 12 6F | Audio system operation
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $2D			  ; F0 2D | Branch if equal

;------------------------------------------------------------------------------
; Bank24_AudioFunction_58F
; Address: $D2F1CA
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_58F:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $25			  ; F0 25 | Branch if equal
	LDA $6610,X		  ; BD 10 66 | Audio system operation
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $6610,X		  ; 9D 10 66 | Audio system operation
	LDA $6612,X		  ; BD 12 66 | Audio system operation
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $6612,X		  ; 9D 12 66 | Audio system operation
	LDA #$01			 ; A9 01 | Audio system operation
	CLC				  ; 18 | Clear carry flag
	ADC $6610,X		  ; 7D 10 66 | Add with carry (absolute,X)
	STA $6610,X		  ; 9D 10 66 | Audio system operation
	LDA #$00			 ; A9 00 | Audio system operation
	ADC $6612,X		  ; 7D 12 66 | Add with carry (absolute,X)
	STA $6612,X		  ; 9D 12 66 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_590
; Address: $D2F1F7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_590:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F64			; 2D 64 6F | Logical AND with accumulator (absolute)
	ORA $6F66			; 0D 66 6F | Logical OR with accumulator (absolute)
	STA $6C10,Y		  ; 99 10 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_591
; Address: $D2F203
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_591:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F68			; 2D 68 6F | Logical AND with accumulator (absolute)
	ORA $6F6A			; 0D 6A 6F | Logical OR with accumulator (absolute)
	STA $6C90,Y		  ; 99 90 6C | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_592
; Address: $D2F20F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_592:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F6C			; 2D 6C 6F | Logical AND with accumulator (absolute)
	ORA $6F6E			; 0D 6E 6F | Logical OR with accumulator (absolute)
	STA $6D10,Y		  ; 99 10 6D | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_593
; Address: $D2F21B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_593:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F70			; 2D 70 6F | Logical AND with accumulator (absolute)
	ORA $6F72			; 0D 72 6F | Logical OR with accumulator (absolute)
	STA $6D90,Y		  ; 99 90 6D | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_594
; Address: $D2F227
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_594:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F74			; 2D 74 6F | Logical AND with accumulator (absolute)
	ORA $6F76			; 0D 76 6F | Logical OR with accumulator (absolute)
	STA $6E10,Y		  ; 99 10 6E | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_595
; Address: $D2F233
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_595:
	JSR $7240			; 20 40 72 | Jump to subroutine
	AND $6F78			; 2D 78 6F | Logical AND with accumulator (absolute)
	ORA $6F7A			; 0D 7A 6F | Logical OR with accumulator (absolute)
	STA $6E90,Y		  ; 99 90 6E | Audio system operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_597
; Address: $D2F244
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_597:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	INC				  ; 1A | Increment accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_598
; Address: $D2F24B
; Size: 138 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_598:
	LDA $F5D5			; AD D5 F5 | Audio system operation
	STA $EE65			; 8D 65 EE | Audio system operation
	LDA $F5D7			; AD D7 F5 | Audio system operation
	STA $EE67			; 8D 67 EE | Audio system operation
	LDA $F5D9			; AD D9 F5 | Audio system operation
	STA $EE69			; 8D 69 EE | Audio system operation
	LDA $F5DB			; AD DB F5 | Audio system operation
	STA $EE6B			; 8D 6B EE | Audio system operation
	LDA $F5DD			; AD DD F5 | Audio system operation
	STA $EE6D			; 8D 6D EE | Audio system operation
	LDA $F5DF			; AD DF F5 | Audio system operation
	STA $EE6F			; 8D 6F EE | Audio system operation
	LDA $F5E1			; AD E1 F5 | Audio system operation
	STA $EE71			; 8D 71 EE | Audio system operation
	LDA $F5E3			; AD E3 F5 | Audio system operation
	STA $EE73			; 8D 73 EE | Audio system operation
	LDA $F5E5			; AD E5 F5 | Audio system operation
	STA $EE75			; 8D 75 EE | Audio system operation
	LDA $F5E7			; AD E7 F5 | Audio system operation
	STA $EE77			; 8D 77 EE | Audio system operation
	LDA $F5E9			; AD E9 F5 | Audio system operation
	STA $EE79			; 8D 79 EE | Audio system operation
	LDA $F5EB			; AD EB F5 | Audio system operation
	STA $EE7B			; 8D 7B EE | Audio system operation
	LDA $F5ED			; AD ED F5 | Audio system operation
	STA $EE7D			; 8D 7D EE | Audio system operation
	LDA $F5EF			; AD EF F5 | Audio system operation
	STA $EE7F			; 8D 7F EE | Audio system operation
	LDA $F5F1			; AD F1 F5 | Audio system operation
	STA $EE81			; 8D 81 EE | Audio system operation
	LDA $F5F3			; AD F3 F5 | Audio system operation
	STA $EE83			; 8D 83 EE | Audio system operation
	LDA $F5F5			; AD F5 F5 | Audio system operation
	STA $EE85			; 8D 85 EE | Audio system operation
	LDA $F5F7			; AD F7 F5 | Audio system operation
	STA $EE87			; 8D 87 EE | Audio system operation
	LDA $F5F9			; AD F9 F5 | Audio system operation
	STA $EE89			; 8D 89 EE | Audio system operation
	LDA $F5FB			; AD FB F5 | Audio system operation
	STA $EE8B			; 8D 8B EE | Audio system operation
	LDA $F5FD			; AD FD F5 | Audio system operation
	STA $EE8D			; 8D 8D EE | Audio system operation
	LDA $F5FF			; AD FF F5 | Audio system operation
	STA $EE8F			; 8D 8F EE | Audio system operation
	LDA $F601			; AD 01 F6 | Audio system operation
	STA $EE91			; 8D 91 EE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_599
; Address: $D2F2D5
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_599:
	LDA $F603			; AD 03 F6 | Audio system operation
	STA $EE93			; 8D 93 EE | Audio system operation
	LDA $F605			; AD 05 F6 | Audio system operation
	STA $EE95			; 8D 95 EE | Audio system operation
	LDA $F607			; AD 07 F6 | Audio system operation
	STA $EE97			; 8D 97 EE | Audio system operation
	LDA $F609			; AD 09 F6 | Audio system operation
	STA $EE99			; 8D 99 EE | Audio system operation
	LDA $F60B			; AD 0B F6 | Audio system operation
	STA $EE9B			; 8D 9B EE | Audio system operation
	LDA $F60D			; AD 0D F6 | Audio system operation
	STA $EE9D			; 8D 9D EE | Audio system operation
	LDA $F60F			; AD 0F F6 | Audio system operation
	STA $EE9F			; 8D 9F EE | Audio system operation
	LDA $F611			; AD 11 F6 | Audio system operation
	STA $EEA1			; 8D A1 EE | Audio system operation
	LDA $F613			; AD 13 F6 | Audio system operation
	STA $EEA3			; 8D A3 EE | Audio system operation
	LDA $F615			; AD 15 F6 | Audio system operation
	STA $EEA5			; 8D A5 EE | Audio system operation
	LDA $F617			; AD 17 F6 | Audio system operation
	STA $EEA7			; 8D A7 EE | Audio system operation
	LDA $F619			; AD 19 F6 | Audio system operation
	STA $EEA9			; 8D A9 EE | Audio system operation
	LDA $F61B			; AD 1B F6 | Audio system operation
	STA $EEAB			; 8D AB EE | Audio system operation
	LDA $F61D			; AD 1D F6 | Audio system operation
	STA $EEAD			; 8D AD EE | Audio system operation
	LDA $F61F			; AD 1F F6 | Audio system operation
	STA $EEAF			; 8D AF EE | Audio system operation
	LDA $F621			; AD 21 F6 | Audio system operation
	STA $EEB1			; 8D B1 EE | Audio system operation
	LDA $F623			; AD 23 F6 | Audio system operation
	STA $EEB3			; 8D B3 EE | Audio system operation
	LDA $F625			; AD 25 F6 | Audio system operation
	STA $EEB5			; 8D B5 EE | Audio system operation
	LDA $F627			; AD 27 F6 | Audio system operation
	STA $EEB7			; 8D B7 EE | Audio system operation
	LDA $F629			; AD 29 F6 | Audio system operation
	STA $EEB9			; 8D B9 EE | Audio system operation
	LDA $F62B			; AD 2B F6 | Audio system operation
	STA $EEBB			; 8D BB EE | Audio system operation
	LDA $F62D			; AD 2D F6 | Audio system operation
	STA $EEBD			; 8D BD EE | Audio system operation
	LDA $F62F			; AD 2F F6 | Audio system operation
	STA $EEBF			; 8D BF EE | Audio system operation
	LDA $F631			; AD 31 F6 | Audio system operation
	STA $EEC1			; 8D C1 EE | Audio system operation
	LDA $F633			; AD 33 F6 | Audio system operation
	STA $EEC3			; 8D C3 EE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_59A
; Address: $D2F36B
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_59A:
	LDA $F635			; AD 35 F6 | Audio system operation
	STA $EEC5			; 8D C5 EE | Audio system operation
	LDA $F637			; AD 37 F6 | Audio system operation
	STA $EEC7			; 8D C7 EE | Audio system operation
	LDA $F639			; AD 39 F6 | Audio system operation
	STA $EEC9			; 8D C9 EE | Audio system operation
	LDA $F63B			; AD 3B F6 | Audio system operation
	STA $EECB			; 8D CB EE | Audio system operation
	LDA $F63D			; AD 3D F6 | Audio system operation
	STA $EECD			; 8D CD EE | Audio system operation
	LDA $F63F			; AD 3F F6 | Audio system operation
	STA $EECF			; 8D CF EE | Audio system operation
	LDA $F641			; AD 41 F6 | Audio system operation
	STA $EED1			; 8D D1 EE | Audio system operation
	LDA $F643			; AD 43 F6 | Audio system operation
	STA $EED3			; 8D D3 EE | Audio system operation
	LDA $F645			; AD 45 F6 | Audio system operation
	STA $EED5			; 8D D5 EE | Audio system operation
	LDA $F647			; AD 47 F6 | Audio system operation
	STA $EED7			; 8D D7 EE | Audio system operation
	LDA $F649			; AD 49 F6 | Audio system operation
	STA $EED9			; 8D D9 EE | Audio system operation
	LDA $F64B			; AD 4B F6 | Audio system operation
	STA $EEDB			; 8D DB EE | Audio system operation
	LDA $F64D			; AD 4D F6 | Audio system operation
	STA $EEDD			; 8D DD EE | Audio system operation
	LDA $F64F			; AD 4F F6 | Audio system operation
	STA $EEDF			; 8D DF EE | Audio system operation
	LDA $F651			; AD 51 F6 | Audio system operation
	STA $EEE1			; 8D E1 EE | Audio system operation
	LDA $F653			; AD 53 F6 | Audio system operation
	STA $EEE3			; 8D E3 EE | Audio system operation
	LDA $F655			; AD 55 F6 | Audio system operation
	STA $EEE5			; 8D E5 EE | Audio system operation
	LDA $F657			; AD 57 F6 | Audio system operation
	STA $EEE7			; 8D E7 EE | Audio system operation
	LDA $F659			; AD 59 F6 | Audio system operation
	STA $EEE9			; 8D E9 EE | Audio system operation
	LDA $F65B			; AD 5B F6 | Audio system operation
	STA $EEEB			; 8D EB EE | Audio system operation
	LDA $F65D			; AD 5D F6 | Audio system operation
	STA $EEED			; 8D ED EE | Audio system operation
	LDA $F65F			; AD 5F F6 | Audio system operation
	STA $EEEF			; 8D EF EE | Audio system operation
	LDA $F661			; AD 61 F6 | Audio system operation
	STA $EEF1			; 8D F1 EE | Audio system operation
	LDA $F663			; AD 63 F6 | Audio system operation
	STA $EEF3			; 8D F3 EE | Audio system operation
	LDA $F665			; AD 65 F6 | Audio system operation
	STA $EEF5			; 8D F5 EE | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_59B
; Address: $D2F401
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_59B:
	LDA $F667			; AD 67 F6 | Audio system operation
	STA $EEF7			; 8D F7 EE | Audio system operation
	LDA $F669			; AD 69 F6 | Audio system operation
	STA $EEF9			; 8D F9 EE | Audio system operation
	LDA $F66B			; AD 6B F6 | Audio system operation
	STA $EEFB			; 8D FB EE | Audio system operation
	LDA $F66D			; AD 6D F6 | Audio system operation
	STA $EEFD			; 8D FD EE | Audio system operation
	LDA $F66F			; AD 6F F6 | Audio system operation
	STA $EEFF			; 8D FF EE | Audio system operation
	LDA $F671			; AD 71 F6 | Audio system operation
	STA $EF01			; 8D 01 EF | Audio system operation
	LDA $F673			; AD 73 F6 | Audio system operation
	STA $EF03			; 8D 03 EF | Audio system operation
	LDA $F675			; AD 75 F6 | Audio system operation
	STA $EF05			; 8D 05 EF | Audio system operation
	LDA $F677			; AD 77 F6 | Audio system operation
	STA $EF07			; 8D 07 EF | Audio system operation
	LDA $F679			; AD 79 F6 | Audio system operation
	STA $EF09			; 8D 09 EF | Audio system operation
	LDA $F67B			; AD 7B F6 | Audio system operation
	STA $EF0B			; 8D 0B EF | Audio system operation
	LDA $F67D			; AD 7D F6 | Audio system operation
	STA $EF0D			; 8D 0D EF | Audio system operation
	LDA $F67F			; AD 7F F6 | Audio system operation
	STA $EF0F			; 8D 0F EF | Audio system operation
	LDA $F681			; AD 81 F6 | Audio system operation
	STA $EF11			; 8D 11 EF | Audio system operation
	LDA $F683			; AD 83 F6 | Audio system operation
	STA $EF13			; 8D 13 EF | Audio system operation
	LDA $F685			; AD 85 F6 | Audio system operation
	STA $EF15			; 8D 15 EF | Audio system operation
	LDA $F687			; AD 87 F6 | Audio system operation
	STA $EF17			; 8D 17 EF | Audio system operation
	LDA $F689			; AD 89 F6 | Audio system operation
	STA $EF19			; 8D 19 EF | Audio system operation
	LDA $F68B			; AD 8B F6 | Audio system operation
	STA $EF1B			; 8D 1B EF | Audio system operation
	LDA $F68D			; AD 8D F6 | Audio system operation
	STA $EF1D			; 8D 1D EF | Audio system operation
	LDA $F68F			; AD 8F F6 | Audio system operation
	STA $EF1F			; 8D 1F EF | Audio system operation
	LDA $F691			; AD 91 F6 | Audio system operation
	STA $EF21			; 8D 21 EF | Audio system operation
	LDA $F693			; AD 93 F6 | Audio system operation
	STA $EF23			; 8D 23 EF | Audio system operation
	LDA $F695			; AD 95 F6 | Audio system operation
	STA $EF25			; 8D 25 EF | Audio system operation
	LDA $F697			; AD 97 F6 | Audio system operation
	STA $EF27			; 8D 27 EF | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_59C
; Address: $D2F497
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_59C:
	LDA $F699			; AD 99 F6 | Audio system operation
	STA $EF29			; 8D 29 EF | Audio system operation
	LDA $F69B			; AD 9B F6 | Audio system operation
	STA $EF2B			; 8D 2B EF | Audio system operation
	LDA $F69D			; AD 9D F6 | Audio system operation
	STA $EF2D			; 8D 2D EF | Audio system operation
	LDA $F69F			; AD 9F F6 | Audio system operation
	STA $EF2F			; 8D 2F EF | Audio system operation
	LDA $F6A1			; AD A1 F6 | Audio system operation
	STA $EF31			; 8D 31 EF | Audio system operation
	LDA $F6A3			; AD A3 F6 | Audio system operation
	STA $EF33			; 8D 33 EF | Audio system operation
	LDA $F6A5			; AD A5 F6 | Audio system operation
	STA $EF35			; 8D 35 EF | Audio system operation
	LDA $F6A7			; AD A7 F6 | Audio system operation
	STA $EF37			; 8D 37 EF | Audio system operation
	LDA $F6A9			; AD A9 F6 | Audio system operation
	STA $EF39			; 8D 39 EF | Audio system operation
	LDA $F6AB			; AD AB F6 | Audio system operation
	STA $EF3B			; 8D 3B EF | Audio system operation
	LDA $F6AD			; AD AD F6 | Audio system operation
	STA $EF3D			; 8D 3D EF | Audio system operation
	LDA $F6AF			; AD AF F6 | Audio system operation
	STA $EF3F			; 8D 3F EF | Audio system operation
	LDA $F6B1			; AD B1 F6 | Audio system operation
	STA $EF41			; 8D 41 EF | Audio system operation
	LDA $F6B3			; AD B3 F6 | Audio system operation
	STA $EF43			; 8D 43 EF | Audio system operation
	LDA $F6B5			; AD B5 F6 | Audio system operation
	STA $EF45			; 8D 45 EF | Audio system operation
	LDA $F6B7			; AD B7 F6 | Audio system operation
	STA $EF47			; 8D 47 EF | Audio system operation
	LDA $F6B9			; AD B9 F6 | Audio system operation
	STA $EF49			; 8D 49 EF | Audio system operation
	LDA $F6BB			; AD BB F6 | Audio system operation
	STA $EF4B			; 8D 4B EF | Audio system operation
	LDA $F6BD			; AD BD F6 | Audio system operation
	STA $EF4D			; 8D 4D EF | Audio system operation
	LDA $F6BF			; AD BF F6 | Audio system operation
	STA $EF4F			; 8D 4F EF | Audio system operation
	LDA $F6C1			; AD C1 F6 | Audio system operation
	STA $EF51			; 8D 51 EF | Audio system operation
	LDA $F6C3			; AD C3 F6 | Audio system operation
	STA $EF53			; 8D 53 EF | Audio system operation
	LDA $F6C5			; AD C5 F6 | Audio system operation
	STA $EF55			; 8D 55 EF | Audio system operation
	LDA $F6C7			; AD C7 F6 | Audio system operation
	STA $EF57			; 8D 57 EF | Audio system operation
	LDA $F6C9			; AD C9 F6 | Audio system operation
	STA $EF59			; 8D 59 EF | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_59D
; Address: $D2F52D
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_59D:
	LDA $F6CB			; AD CB F6 | Audio system operation
	STA $EF5B			; 8D 5B EF | Audio system operation
	LDA $F6CD			; AD CD F6 | Audio system operation
	STA $EF5D			; 8D 5D EF | Audio system operation
	LDA $F6CF			; AD CF F6 | Audio system operation
	STA $EF5F			; 8D 5F EF | Audio system operation
	LDA $F6D1			; AD D1 F6 | Audio system operation
	STA $EF61			; 8D 61 EF | Audio system operation
	LDA $F6D3			; AD D3 F6 | Audio system operation
	STA $EF63			; 8D 63 EF | Audio system operation
	LDA $F6D5			; AD D5 F6 | Audio system operation
	STA $EF65			; 8D 65 EF | Audio system operation
	LDA $F6D7			; AD D7 F6 | Audio system operation
	STA $EF67			; 8D 67 EF | Audio system operation
	LDA $F6D9			; AD D9 F6 | Audio system operation
	STA $EF69			; 8D 69 EF | Audio system operation
	LDA $F6DB			; AD DB F6 | Audio system operation
	STA $EF6B			; 8D 6B EF | Audio system operation
	LDA $F6DD			; AD DD F6 | Audio system operation
	STA $EF6D			; 8D 6D EF | Audio system operation
	LDA $F6DF			; AD DF F6 | Audio system operation
	STA $EF6F			; 8D 6F EF | Audio system operation
	LDA $F6E1			; AD E1 F6 | Audio system operation
	STA $EF71			; 8D 71 EF | Audio system operation
	LDA $F6E3			; AD E3 F6 | Audio system operation
	STA $EF73			; 8D 73 EF | Audio system operation
	LDA $F6E5			; AD E5 F6 | Audio system operation
	STA $EF75			; 8D 75 EF | Audio system operation
	LDA $F6E7			; AD E7 F6 | Audio system operation
	STA $EF77			; 8D 77 EF | Audio system operation
	LDA $F6E9			; AD E9 F6 | Audio system operation
	STA $EF79			; 8D 79 EF | Audio system operation
	LDA $F6EB			; AD EB F6 | Audio system operation
	STA $EF7B			; 8D 7B EF | Audio system operation
	LDA $F6ED			; AD ED F6 | Audio system operation
	STA $EF7D			; 8D 7D EF | Audio system operation
	LDA $F6EF			; AD EF F6 | Audio system operation
	STA $EF7F			; 8D 7F EF | Audio system operation
	LDA $F6F1			; AD F1 F6 | Audio system operation
	STA $EF81			; 8D 81 EF | Audio system operation
	LDA $F6F3			; AD F3 F6 | Audio system operation
	STA $EF83			; 8D 83 EF | Audio system operation
	LDA $F6F5			; AD F5 F6 | Audio system operation
	STA $EF85			; 8D 85 EF | Audio system operation
	LDA $F6F7			; AD F7 F6 | Audio system operation
	STA $EF87			; 8D 87 EF | Audio system operation
	LDA $F6F9			; AD F9 F6 | Audio system operation
	STA $EF89			; 8D 89 EF | Audio system operation
	LDA $F6FB			; AD FB F6 | Audio system operation
	STA $EF8B			; 8D 8B EF | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_59E
; Address: $D2F5C3
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_59E:
	LDA $F6FD			; AD FD F6 | Audio system operation
	STA $EF8D			; 8D 8D EF | Audio system operation
	LDA $F6FF			; AD FF F6 | Audio system operation
	STA $EF8F			; 8D 8F EF | Audio system operation
	LDA $F701			; AD 01 F7 | Audio system operation
	STA $EF91			; 8D 91 EF | Audio system operation
	LDA $F703			; AD 03 F7 | Audio system operation
	STA $EF93			; 8D 93 EF | Audio system operation
	LDA $F705			; AD 05 F7 | Audio system operation
	STA $EF95			; 8D 95 EF | Audio system operation
	LDA $F707			; AD 07 F7 | Audio system operation
	STA $EF97			; 8D 97 EF | Audio system operation
	LDA $F709			; AD 09 F7 | Audio system operation
	STA $EF99			; 8D 99 EF | Audio system operation
	LDA $F70B			; AD 0B F7 | Audio system operation
	STA $EF9B			; 8D 9B EF | Audio system operation
	LDA $F70D			; AD 0D F7 | Audio system operation
	STA $EF9D			; 8D 9D EF | Audio system operation
	LDA $F70F			; AD 0F F7 | Audio system operation
	STA $EF9F			; 8D 9F EF | Audio system operation
	LDA $F711			; AD 11 F7 | Audio system operation
	STA $EFA1			; 8D A1 EF | Audio system operation
	LDA $F713			; AD 13 F7 | Audio system operation
	STA $EFA3			; 8D A3 EF | Audio system operation
	LDA $F715			; AD 15 F7 | Audio system operation
	STA $EFA5			; 8D A5 EF | Audio system operation
	LDA $F717			; AD 17 F7 | Audio system operation
	STA $EFA7			; 8D A7 EF | Audio system operation
	LDA $F719			; AD 19 F7 | Audio system operation
	STA $EFA9			; 8D A9 EF | Audio system operation
	LDA $F71B			; AD 1B F7 | Audio system operation
	STA $EFAB			; 8D AB EF | Audio system operation
	LDA $F71D			; AD 1D F7 | Audio system operation
	STA $EFAD			; 8D AD EF | Audio system operation
	LDA $F71F			; AD 1F F7 | Audio system operation
	STA $EFAF			; 8D AF EF | Audio system operation
	LDA $F721			; AD 21 F7 | Audio system operation
	STA $EFB1			; 8D B1 EF | Audio system operation
	LDA $F723			; AD 23 F7 | Audio system operation
	STA $EFB3			; 8D B3 EF | Audio system operation
	LDA $F725			; AD 25 F7 | Audio system operation
	STA $EFB5			; 8D B5 EF | Audio system operation
	LDA $F727			; AD 27 F7 | Audio system operation
	STA $EFB7			; 8D B7 EF | Audio system operation
	LDA $F729			; AD 29 F7 | Audio system operation
	STA $EFB9			; 8D B9 EF | Audio system operation
	LDA $F72B			; AD 2B F7 | Audio system operation
	STA $EFBB			; 8D BB EF | Audio system operation
	LDA $F72D			; AD 2D F7 | Audio system operation
	STA $EFBD			; 8D BD EF | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_59F
; Address: $D2F659
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_59F:
	LDA $F72F			; AD 2F F7 | Audio system operation
	STA $EFBF			; 8D BF EF | Audio system operation
	LDA $F731			; AD 31 F7 | Audio system operation
	STA $EFC1			; 8D C1 EF | Audio system operation
	LDA $F733			; AD 33 F7 | Audio system operation
	STA $EFC3			; 8D C3 EF | Audio system operation
	LDA $F735			; AD 35 F7 | Audio system operation
	STA $EFC5			; 8D C5 EF | Audio system operation
	LDA $F737			; AD 37 F7 | Audio system operation
	STA $EFC7			; 8D C7 EF | Audio system operation
	LDA $F739			; AD 39 F7 | Audio system operation
	STA $EFC9			; 8D C9 EF | Audio system operation
	LDA $F73B			; AD 3B F7 | Audio system operation
	STA $EFCB			; 8D CB EF | Audio system operation
	LDA $F73D			; AD 3D F7 | Audio system operation
	STA $EFCD			; 8D CD EF | Audio system operation
	LDA $F73F			; AD 3F F7 | Audio system operation
	STA $EFCF			; 8D CF EF | Audio system operation
	LDA $F741			; AD 41 F7 | Audio system operation
	STA $EFD1			; 8D D1 EF | Audio system operation
	LDA $F743			; AD 43 F7 | Audio system operation
	STA $EFD3			; 8D D3 EF | Audio system operation
	LDA $F745			; AD 45 F7 | Audio system operation
	STA $EFD5			; 8D D5 EF | Audio system operation
	LDA $F747			; AD 47 F7 | Audio system operation
	STA $EFD7			; 8D D7 EF | Audio system operation
	LDA $F749			; AD 49 F7 | Audio system operation
	STA $EFD9			; 8D D9 EF | Audio system operation
	LDA $F74B			; AD 4B F7 | Audio system operation
	STA $EFDB			; 8D DB EF | Audio system operation
	LDA $F74D			; AD 4D F7 | Audio system operation
	STA $EFDD			; 8D DD EF | Audio system operation
	LDA $F74F			; AD 4F F7 | Audio system operation
	STA $EFDF			; 8D DF EF | Audio system operation
	LDA $F751			; AD 51 F7 | Audio system operation
	STA $EFE1			; 8D E1 EF | Audio system operation
	LDA $F753			; AD 53 F7 | Audio system operation
	STA $EFE3			; 8D E3 EF | Audio system operation
	LDA $F755			; AD 55 F7 | Audio system operation
	STA $EFE5			; 8D E5 EF | Audio system operation
	LDA $F757			; AD 57 F7 | Audio system operation
	STA $EFE7			; 8D E7 EF | Audio system operation
	LDA $F759			; AD 59 F7 | Audio system operation
	STA $EFE9			; 8D E9 EF | Audio system operation
	LDA $F75B			; AD 5B F7 | Audio system operation
	STA $EFEB			; 8D EB EF | Audio system operation
	LDA $F75D			; AD 5D F7 | Audio system operation
	STA $EFED			; 8D ED EF | Audio system operation
	LDA $F75F			; AD 5F F7 | Audio system operation
	STA $EFEF			; 8D EF EF | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A0
; Address: $D2F6EF
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A0:
	LDA $F761			; AD 61 F7 | Audio system operation
	STA $EFF1			; 8D F1 EF | Audio system operation
	LDA $F763			; AD 63 F7 | Audio system operation
	STA $EFF3			; 8D F3 EF | Audio system operation
	LDA $F765			; AD 65 F7 | Audio system operation
	STA $EFF5			; 8D F5 EF | Audio system operation
	LDA $F767			; AD 67 F7 | Audio system operation
	STA $EFF7			; 8D F7 EF | Audio system operation
	LDA $F769			; AD 69 F7 | Audio system operation
	STA $EFF9			; 8D F9 EF | Audio system operation
	LDA $F76B			; AD 6B F7 | Audio system operation
	STA $EFFB			; 8D FB EF | Audio system operation
	LDA $F76D			; AD 6D F7 | Audio system operation
	STA $EFFD			; 8D FD EF | Audio system operation
	LDA $F76F			; AD 6F F7 | Audio system operation
	STA $EFFF			; 8D FF EF | Audio system operation
	LDA $F771			; AD 71 F7 | Audio system operation
	STA $F001			; 8D 01 F0 | Audio system operation
	LDA $F773			; AD 73 F7 | Audio system operation
	STA $F003			; 8D 03 F0 | Audio system operation
	LDA $F775			; AD 75 F7 | Audio system operation
	STA $F005			; 8D 05 F0 | Audio system operation
	LDA $F777			; AD 77 F7 | Audio system operation
	STA $F007			; 8D 07 F0 | Audio system operation
	LDA $F779			; AD 79 F7 | Audio system operation
	STA $F009			; 8D 09 F0 | Audio system operation
	LDA $F77B			; AD 7B F7 | Audio system operation
	STA $F00B			; 8D 0B F0 | Audio system operation
	LDA $F77D			; AD 7D F7 | Audio system operation
	STA $F00D			; 8D 0D F0 | Audio system operation
	LDA $F77F			; AD 7F F7 | Audio system operation
	STA $F00F			; 8D 0F F0 | Audio system operation
	LDA $F781			; AD 81 F7 | Audio system operation
	STA $F011			; 8D 11 F0 | Audio system operation
	LDA $F783			; AD 83 F7 | Audio system operation
	STA $F013			; 8D 13 F0 | Audio system operation
	LDA $F785			; AD 85 F7 | Audio system operation
	STA $F015			; 8D 15 F0 | Audio system operation
	LDA $F787			; AD 87 F7 | Audio system operation
	STA $F017			; 8D 17 F0 | Audio system operation
	LDA $F789			; AD 89 F7 | Audio system operation
	STA $F019			; 8D 19 F0 | Audio system operation
	LDA $F78B			; AD 8B F7 | Audio system operation
	STA $F01B			; 8D 1B F0 | Audio system operation
	LDA $F78D			; AD 8D F7 | Audio system operation
	STA $F01D			; 8D 1D F0 | Audio system operation
	LDA $F78F			; AD 8F F7 | Audio system operation
	STA $F01F			; 8D 1F F0 | Audio system operation
	LDA $F791			; AD 91 F7 | Audio system operation
	STA $F021			; 8D 21 F0 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A1
; Address: $D2F785
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A1:
	LDA $F793			; AD 93 F7 | Audio system operation
	STA $F023			; 8D 23 F0 | Audio system operation
	LDA $33D6			; AD D6 33 | Audio system operation
	STA $F5D5			; 8D D5 F5 | Audio system operation
	STA $F5D7			; 8D D7 F5 | Audio system operation
	STA $F5D9			; 8D D9 F5 | Audio system operation
	STA $F5DB			; 8D DB F5 | Audio system operation
	STA $F5DD			; 8D DD F5 | Audio system operation
	STA $F5DF			; 8D DF F5 | Audio system operation
	STA $F5E1			; 8D E1 F5 | Audio system operation
	STA $F5E3			; 8D E3 F5 | Audio system operation
	STA $F5E5			; 8D E5 F5 | Audio system operation
	STA $F5E7			; 8D E7 F5 | Audio system operation
	STA $F5E9			; 8D E9 F5 | Audio system operation
	STA $F5EB			; 8D EB F5 | Audio system operation
	STA $F5ED			; 8D ED F5 | Audio system operation
	STA $F5EF			; 8D EF F5 | Audio system operation
	STA $F5F1			; 8D F1 F5 | Audio system operation
	STA $F5F3			; 8D F3 F5 | Audio system operation
	STA $F5F5			; 8D F5 F5 | Audio system operation
	STA $F5F7			; 8D F7 F5 | Audio system operation
	STA $F5F9			; 8D F9 F5 | Audio system operation
	STA $F5FB			; 8D FB F5 | Audio system operation
	STA $F5FD			; 8D FD F5 | Audio system operation
	STA $F5FF			; 8D FF F5 | Audio system operation
	STA $F601			; 8D 01 F6 | Audio system operation
	STA $F603			; 8D 03 F6 | Audio system operation
	STA $F605			; 8D 05 F6 | Audio system operation
	STA $F607			; 8D 07 F6 | Audio system operation
	STA $F609			; 8D 09 F6 | Audio system operation
	STA $F60B			; 8D 0B F6 | Audio system operation
	STA $F60D			; 8D 0D F6 | Audio system operation
	STA $F60F			; 8D 0F F6 | Audio system operation
	STA $F611			; 8D 11 F6 | Audio system operation
	STA $F613			; 8D 13 F6 | Audio system operation
	STA $F615			; 8D 15 F6 | Audio system operation
	STA $F617			; 8D 17 F6 | Audio system operation
	STA $F619			; 8D 19 F6 | Audio system operation
	STA $F61B			; 8D 1B F6 | Audio system operation
	STA $F61D			; 8D 1D F6 | Audio system operation
	STA $F61F			; 8D 1F F6 | Audio system operation
	STA $F621			; 8D 21 F6 | Audio system operation
	STA $F623			; 8D 23 F6 | Audio system operation
	STA $F625			; 8D 25 F6 | Audio system operation
	STA $F627			; 8D 27 F6 | Audio system operation
	STA $F629			; 8D 29 F6 | Audio system operation
	STA $F62B			; 8D 2B F6 | Audio system operation
	STA $F62D			; 8D 2D F6 | Audio system operation
	STA $F62F			; 8D 2F F6 | Audio system operation
	STA $F631			; 8D 31 F6 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A2
; Address: $D2F81B
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A2:
	STA $F633			; 8D 33 F6 | Audio system operation
	STA $F635			; 8D 35 F6 | Audio system operation
	STA $F637			; 8D 37 F6 | Audio system operation
	STA $F639			; 8D 39 F6 | Audio system operation
	STA $F63B			; 8D 3B F6 | Audio system operation
	STA $F63D			; 8D 3D F6 | Audio system operation
	STA $F63F			; 8D 3F F6 | Audio system operation
	STA $F641			; 8D 41 F6 | Audio system operation
	STA $F643			; 8D 43 F6 | Audio system operation
	STA $F645			; 8D 45 F6 | Audio system operation
	STA $F647			; 8D 47 F6 | Audio system operation
	STA $F649			; 8D 49 F6 | Audio system operation
	STA $F64B			; 8D 4B F6 | Audio system operation
	STA $F64D			; 8D 4D F6 | Audio system operation
	STA $F64F			; 8D 4F F6 | Audio system operation
	STA $F651			; 8D 51 F6 | Audio system operation
	STA $F653			; 8D 53 F6 | Audio system operation
	STA $F655			; 8D 55 F6 | Audio system operation
	STA $F657			; 8D 57 F6 | Audio system operation
	STA $F659			; 8D 59 F6 | Audio system operation
	STA $F65B			; 8D 5B F6 | Audio system operation
	STA $F65D			; 8D 5D F6 | Audio system operation
	STA $F65F			; 8D 5F F6 | Audio system operation
	STA $F661			; 8D 61 F6 | Audio system operation
	STA $F663			; 8D 63 F6 | Audio system operation
	STA $F665			; 8D 65 F6 | Audio system operation
	STA $F667			; 8D 67 F6 | Audio system operation
	STA $F669			; 8D 69 F6 | Audio system operation
	STA $F66B			; 8D 6B F6 | Audio system operation
	STA $F66D			; 8D 6D F6 | Audio system operation
	STA $F66F			; 8D 6F F6 | Audio system operation
	STA $F671			; 8D 71 F6 | Audio system operation
	STA $F673			; 8D 73 F6 | Audio system operation
	STA $F675			; 8D 75 F6 | Audio system operation
	STA $F677			; 8D 77 F6 | Audio system operation
	STA $F679			; 8D 79 F6 | Audio system operation
	STA $F67B			; 8D 7B F6 | Audio system operation
	STA $F67D			; 8D 7D F6 | Audio system operation
	STA $F67F			; 8D 7F F6 | Audio system operation
	STA $F681			; 8D 81 F6 | Audio system operation
	STA $F683			; 8D 83 F6 | Audio system operation
	STA $F685			; 8D 85 F6 | Audio system operation
	STA $F687			; 8D 87 F6 | Audio system operation
	STA $F689			; 8D 89 F6 | Audio system operation
	STA $F68B			; 8D 8B F6 | Audio system operation
	STA $F68D			; 8D 8D F6 | Audio system operation
	STA $F68F			; 8D 8F F6 | Audio system operation
	STA $F691			; 8D 91 F6 | Audio system operation
	STA $F693			; 8D 93 F6 | Audio system operation
	STA $F695			; 8D 95 F6 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A3
; Address: $D2F8B1
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A3:
	STA $F697			; 8D 97 F6 | Audio system operation
	STA $F699			; 8D 99 F6 | Audio system operation
	STA $F69B			; 8D 9B F6 | Audio system operation
	STA $F69D			; 8D 9D F6 | Audio system operation
	STA $F69F			; 8D 9F F6 | Audio system operation
	STA $F6A1			; 8D A1 F6 | Audio system operation
	STA $F6A3			; 8D A3 F6 | Audio system operation
	STA $F6A5			; 8D A5 F6 | Audio system operation
	STA $F6A7			; 8D A7 F6 | Audio system operation
	STA $F6A9			; 8D A9 F6 | Audio system operation
	STA $F6AB			; 8D AB F6 | Audio system operation
	STA $F6AD			; 8D AD F6 | Audio system operation
	STA $F6AF			; 8D AF F6 | Audio system operation
	STA $F6B1			; 8D B1 F6 | Audio system operation
	STA $F6B3			; 8D B3 F6 | Audio system operation
	STA $F6B5			; 8D B5 F6 | Audio system operation
	STA $F6B7			; 8D B7 F6 | Audio system operation
	STA $F6B9			; 8D B9 F6 | Audio system operation
	STA $F6BB			; 8D BB F6 | Audio system operation
	STA $F6BD			; 8D BD F6 | Audio system operation
	STA $F6BF			; 8D BF F6 | Audio system operation
	STA $F6C1			; 8D C1 F6 | Audio system operation
	STA $F6C3			; 8D C3 F6 | Audio system operation
	STA $F6C5			; 8D C5 F6 | Audio system operation
	STA $F6C7			; 8D C7 F6 | Audio system operation
	STA $F6C9			; 8D C9 F6 | Audio system operation
	STA $F6CB			; 8D CB F6 | Audio system operation
	STA $F6CD			; 8D CD F6 | Audio system operation
	STA $F6CF			; 8D CF F6 | Audio system operation
	STA $F6D1			; 8D D1 F6 | Audio system operation
	STA $F6D3			; 8D D3 F6 | Audio system operation
	STA $F6D5			; 8D D5 F6 | Audio system operation
	STA $F6D7			; 8D D7 F6 | Audio system operation
	STA $F6D9			; 8D D9 F6 | Audio system operation
	STA $F6DB			; 8D DB F6 | Audio system operation
	STA $F6DD			; 8D DD F6 | Audio system operation
	STA $F6DF			; 8D DF F6 | Audio system operation
	STA $F6E1			; 8D E1 F6 | Audio system operation
	STA $F6E3			; 8D E3 F6 | Audio system operation
	STA $F6E5			; 8D E5 F6 | Audio system operation
	STA $F6E7			; 8D E7 F6 | Audio system operation
	STA $F6E9			; 8D E9 F6 | Audio system operation
	STA $F6EB			; 8D EB F6 | Audio system operation
	STA $F6ED			; 8D ED F6 | Audio system operation
	STA $F6EF			; 8D EF F6 | Audio system operation
	STA $F6F1			; 8D F1 F6 | Audio system operation
	STA $F6F3			; 8D F3 F6 | Audio system operation
	STA $F6F5			; 8D F5 F6 | Audio system operation
	STA $F6F7			; 8D F7 F6 | Audio system operation
	STA $F6F9			; 8D F9 F6 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A4
; Address: $D2F947
; Size: 150 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A4:
	STA $F6FB			; 8D FB F6 | Audio system operation
	STA $F6FD			; 8D FD F6 | Audio system operation
	STA $F6FF			; 8D FF F6 | Audio system operation
	STA $F701			; 8D 01 F7 | Audio system operation
	STA $F703			; 8D 03 F7 | Audio system operation
	STA $F705			; 8D 05 F7 | Audio system operation
	STA $F707			; 8D 07 F7 | Audio system operation
	STA $F709			; 8D 09 F7 | Audio system operation
	STA $F70B			; 8D 0B F7 | Audio system operation
	STA $F70D			; 8D 0D F7 | Audio system operation
	STA $F70F			; 8D 0F F7 | Audio system operation
	STA $F711			; 8D 11 F7 | Audio system operation
	STA $F713			; 8D 13 F7 | Audio system operation
	STA $F715			; 8D 15 F7 | Audio system operation
	STA $F717			; 8D 17 F7 | Audio system operation
	STA $F719			; 8D 19 F7 | Audio system operation
	STA $F71B			; 8D 1B F7 | Audio system operation
	STA $F71D			; 8D 1D F7 | Audio system operation
	STA $F71F			; 8D 1F F7 | Audio system operation
	STA $F721			; 8D 21 F7 | Audio system operation
	STA $F723			; 8D 23 F7 | Audio system operation
	STA $F725			; 8D 25 F7 | Audio system operation
	STA $F727			; 8D 27 F7 | Audio system operation
	STA $F729			; 8D 29 F7 | Audio system operation
	STA $F72B			; 8D 2B F7 | Audio system operation
	STA $F72D			; 8D 2D F7 | Audio system operation
	STA $F72F			; 8D 2F F7 | Audio system operation
	STA $F731			; 8D 31 F7 | Audio system operation
	STA $F733			; 8D 33 F7 | Audio system operation
	STA $F735			; 8D 35 F7 | Audio system operation
	STA $F737			; 8D 37 F7 | Audio system operation
	STA $F739			; 8D 39 F7 | Audio system operation
	STA $F73B			; 8D 3B F7 | Audio system operation
	STA $F73D			; 8D 3D F7 | Audio system operation
	STA $F73F			; 8D 3F F7 | Audio system operation
	STA $F741			; 8D 41 F7 | Audio system operation
	STA $F743			; 8D 43 F7 | Audio system operation
	STA $F745			; 8D 45 F7 | Audio system operation
	STA $F747			; 8D 47 F7 | Audio system operation
	STA $F749			; 8D 49 F7 | Audio system operation
	STA $F74B			; 8D 4B F7 | Audio system operation
	STA $F74D			; 8D 4D F7 | Audio system operation
	STA $F74F			; 8D 4F F7 | Audio system operation
	STA $F751			; 8D 51 F7 | Audio system operation
	STA $F753			; 8D 53 F7 | Audio system operation
	STA $F755			; 8D 55 F7 | Audio system operation
	STA $F757			; 8D 57 F7 | Audio system operation
	STA $F759			; 8D 59 F7 | Audio system operation
	STA $F75B			; 8D 5B F7 | Audio system operation
	STA $F75D			; 8D 5D F7 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A5
; Address: $D2F9DD
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A5:
	STA $F75F			; 8D 5F F7 | Audio system operation
	STA $F761			; 8D 61 F7 | Audio system operation
	STA $F763			; 8D 63 F7 | Audio system operation
	STA $F765			; 8D 65 F7 | Audio system operation
	STA $F767			; 8D 67 F7 | Audio system operation
	STA $F769			; 8D 69 F7 | Audio system operation
	STA $F76B			; 8D 6B F7 | Audio system operation
	STA $F76D			; 8D 6D F7 | Audio system operation
	STA $F76F			; 8D 6F F7 | Audio system operation
	STA $F771			; 8D 71 F7 | Audio system operation
	STA $F773			; 8D 73 F7 | Audio system operation
	STA $F775			; 8D 75 F7 | Audio system operation
	STA $F777			; 8D 77 F7 | Audio system operation
	STA $F779			; 8D 79 F7 | Audio system operation
	STA $F77B			; 8D 7B F7 | Audio system operation
	STA $F77D			; 8D 7D F7 | Audio system operation
	STA $F77F			; 8D 7F F7 | Audio system operation
	STA $F781			; 8D 81 F7 | Audio system operation
	STA $F783			; 8D 83 F7 | Audio system operation
	STA $F785			; 8D 85 F7 | Audio system operation
	STA $F787			; 8D 87 F7 | Audio system operation
	STA $F789			; 8D 89 F7 | Audio system operation
	STA $F78B			; 8D 8B F7 | Audio system operation
	STA $F78D			; 8D 8D F7 | Audio system operation
	STA $F78F			; 8D 8F F7 | Audio system operation
	STA $F791			; 8D 91 F7 | Audio system operation
	STA $F793			; 8D 93 F7 | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A6
; Address: $D2FA2F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A6:
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0E			 ; 29 0E | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	STA $74			  ; 85 74 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $7A			  ; 46 7A | Logical shift right (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ROR $A97A,X		  ; 7E 7A A9 | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A7
; Address: $D2FA5E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A7:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $68			  ; 70 68 | Branch if overflow set
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $72			  ; 65 72 | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A8
; Address: $D2FA7E
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A8:
	EOR #$3E			 ; 49 3E | Exclusive OR with accumulator (immediate)
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $72			  ; 65 72 | Add with carry (zero page)
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCS $13			  ; B0 13 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $C9			  ; 70 C9 | Branch if overflow set
	BEQ $60			  ; F0 60 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5A9
; Address: $D2FAA9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5A9:
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $72			  ; 65 72 | Add with carry (zero page)
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCS $17			  ; B0 17 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5AA
; Address: $D2FABF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5AA:
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $C9			  ; 70 C9 | Branch if overflow set
	BEQ $60			  ; F0 60 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5AB
; Address: $D2FAD5
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5AB:
	EOR #$3E			 ; 49 3E | Exclusive OR with accumulator (immediate)
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $68			  ; 70 68 | Branch if overflow set
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $72			  ; 65 72 | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5AC
; Address: $D2FB04
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5AC:
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $17			  ; B0 17 | Branch if carry set
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $68			  ; 70 68 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5AD
; Address: $D2FB21
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5AD:
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ADC $72			  ; 65 72 | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5AE
; Address: $D2FB34
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5AE:
	EOR #$3E			 ; 49 3E | Exclusive OR with accumulator (immediate)
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $72			  ; 65 72 | Add with carry (zero page)
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCS $17			  ; B0 17 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $C9			  ; 70 C9 | Branch if overflow set
	BEQ $60			  ; F0 60 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5AF
; Address: $D2FB67
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5AF:
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $72			  ; 65 72 | Add with carry (zero page)
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCS $13			  ; B0 13 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B0
; Address: $D2FB81
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B0:
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $C9			  ; 70 C9 | Branch if overflow set
	BEQ $60			  ; F0 60 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B1
; Address: $D2FB93
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B1:
	EOR #$3E			 ; 49 3E | Exclusive OR with accumulator (immediate)
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB 93 C6 | Load from absolute long,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	CMP #$F0			 ; C9 F0 | Compare accumulator (immediate)
	BCS $17			  ; B0 17 | Branch if carry set
	STA $70			  ; 85 70 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	BVS $68			  ; 70 68 | Branch if overflow set
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	ADC $72			  ; 65 72 | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $72			  ; 85 72 | Audio system operation
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B2
; Address: $D2FBC2
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B2:
	AND #$E0			 ; 29 E0 | Game work RAM access
	ADC $74			  ; 65 74 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF EB D3 C6 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $72			  ; 65 72 | Add with carry (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $F5D5,Y		  ; B9 D5 F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF ED D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B3
; Address: $D2FBDC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B3:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5D5,Y		  ; 99 D5 F5 | Audio system operation
	LDA $F5D7,Y		  ; B9 D7 F5 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B4
; Address: $D2FBE5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B4:
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF EF D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B5
; Address: $D2FBEE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B5:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5D7,Y		  ; 99 D7 F5 | Audio system operation
	LDA $F5D9,Y		  ; B9 D9 F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF F1 D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B6
; Address: $D2FC00
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B6:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5D9,Y		  ; 99 D9 F5 | Audio system operation
	LDA $F5DB,Y		  ; B9 DB F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF F3 D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B7
; Address: $D2FC12
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B7:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5DB,Y		  ; 99 DB F5 | Audio system operation
	LDA $F5DD,Y		  ; B9 DD F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF F5 D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B8
; Address: $D2FC24
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B8:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5DD,Y		  ; 99 DD F5 | Audio system operation
	LDA $F5DF,Y		  ; B9 DF F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF F7 D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5B9
; Address: $D2FC36
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5B9:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5DF,Y		  ; 99 DF F5 | Audio system operation
	LDA $F5E1,Y		  ; B9 E1 F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF F9 D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5BA
; Address: $D2FC48
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5BA:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5E1,Y		  ; 99 E1 F5 | Audio system operation
	LDA $F5E3,Y		  ; B9 E3 F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF FB D3 C6 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5BC
; Address: $D2FC5A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5BC:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5E3,Y		  ; 99 E3 F5 | Audio system operation
	LDA $F5E5,Y		  ; B9 E5 F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF FD D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5BD
; Address: $D2FC6C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5BD:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5E5,Y		  ; 99 E5 F5 | Audio system operation
	LDA $F5E7,Y		  ; B9 E7 F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF FF D3 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5BE
; Address: $D2FC7E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5BE:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5E7,Y		  ; 99 E7 F5 | Audio system operation
	LDA $F5E9,Y		  ; B9 E9 F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF 01 D4 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5BF
; Address: $D2FC90
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5BF:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5E9,Y		  ; 99 E9 F5 | Audio system operation
	LDA $F5EB,Y		  ; B9 EB F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF 03 D4 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C0
; Address: $D2FCA2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C0:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5EB,Y		  ; 99 EB F5 | Audio system operation
	LDA $F5ED,Y		  ; B9 ED F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF 05 D4 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C1
; Address: $D2FCB4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C1:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5ED,Y		  ; 99 ED F5 | Audio system operation
	LDA $F5EF,Y		  ; B9 EF F5 | Audio system operation
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA				  ; BF 07 D4 C6 | Load from absolute long,X into accumulator
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C2
; Address: $D2FCC6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C2:
	CLC				  ; 18 | Clear carry flag
	ADC $70			  ; 65 70 | Add with carry (zero page)
	STA $F5EF,Y		  ; 99 EF F5 | Audio system operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C3
; Address: $D2FCCD
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C3:
	JSL $C97CF6		  ; 22 F6 7C C9 | Jump to subroutine long
	LDA $33DA			; AD DA 33 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	PHA				  ; 48 | Push accumulator to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $6F1E			; 8D 1E 6F | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6F36			; 8D 36 6F | Audio system operation
	LDA $33DC			; AD DC 33 | Audio system operation
	XBA				  ; EB | Exchange accumulator bytes
	PHA				  ; 48 | Push accumulator to stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	STA $6F22			; 8D 22 6F | Audio system operation
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6F3A			; 8D 3A 6F | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C4
; Address: $D2FCF6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C4:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C5
; Address: $D2FD02
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C5:
	JSL $C97F71		  ; 22 71 7F C9 | Jump to subroutine long
	STA $78			  ; 85 78 | Audio system operation
	STX $7A			  ; 86 7A | Store X register to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F10			; 8D 10 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F12			; 8D 12 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F14			; 8D 14 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F16			; 8D 16 6F | Audio system operation
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C6
; Address: $D2FD28
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C6:
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F18			; 8D 18 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F1A			; 8D 1A 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F1C			; 8D 1C 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F34			; 8D 34 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F1E			; 8D 1E 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F36			; 8D 36 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F20			; 8D 20 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F38			; 8D 38 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F22			; 8D 22 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F3A			; 8D 3A 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F24			; 8D 24 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F3C			; 8D 3C 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C7
; Address: $D2FD7F
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C7:
	STA $6F26			; 8D 26 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F3E			; 8D 3E 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F28			; 8D 28 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F40			; 8D 40 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F2A			; 8D 2A 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F42			; 8D 42 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F2C			; 8D 2C 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F44			; 8D 44 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F2E			; 8D 2E 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F46			; 8D 46 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F30			; 8D 30 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F48			; 8D 48 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F32			; 8D 32 6F | Audio system operation
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C8
; Address: $D2FDD7
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C8:
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F4A			; 8D 4A 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F4C			; 8D 4C 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F4E			; 8D 4E 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F50			; 8D 50 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F52			; 8D 52 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F54			; 8D 54 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F56			; 8D 56 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F58			; 8D 58 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F5A			; 8D 5A 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F5C			; 8D 5C 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F5E			; 8D 5E 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F60			; 8D 60 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5C9
; Address: $D2FE2E
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5C9:
	STA $6F62			; 8D 62 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F64			; 8D 64 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F66			; 8D 66 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F68			; 8D 68 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F6A			; 8D 6A 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F6C			; 8D 6C 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F6E			; 8D 6E 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F70			; 8D 70 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F72			; 8D 72 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F74			; 8D 74 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F76			; 8D 76 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F78			; 8D 78 6F | Audio system operation
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6F7A			; 8D 7A 6F | Audio system operation
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5CA
; Address: $D2FE86
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5CA:
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5CB
; Address: $D2FE8D
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5CB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	STZ $6290,X		  ; 9E 90 62 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $F3			  ; D0 F3 | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5CC
; Address: $D2FEB1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5CC:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$01			 ; A9 01 | Audio system operation
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCS $08			  ; B0 08 | Branch if carry set
	STA $6290,X		  ; 9D 90 62 | Audio system operation
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5CD
; Address: $D2FECD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5CD:
	DEY				  ; 88 | Decrement Y register
	BNE $F3			  ; D0 F3 | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5CF
; Address: $D2FEDB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5CF:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5D0
; Address: $D2FEE3
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5D0:
	JSL $C9704B		  ; 22 4B 70 C9 | Jump to subroutine long
	LDA $7FBA			; AD BA 7F | Audio system operation
	STA $33C2			; 8D C2 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Audio system operation
	LDA $7FBC			; AD BC 7F | Audio system operation
	STA $33C4			; 8D C4 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Audio system operation
	LDA $7FBE			; AD BE 7F | Audio system operation
	STA $33C6			; 8D C6 33 | Audio system operation
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Audio system operation
	LDA $7FD0			; AD D0 7F | Audio system operation
	STA $33C8			; 8D C8 33 | Audio system operation
	LDA #$10			 ; A9 10 | Audio system operation
	STA $7FD0			; 8D D0 7F | Audio system operation
	LDA $7FD2			; AD D2 7F | Audio system operation
	STA $33CA			; 8D CA 33 | Audio system operation
	LDA #$17			 ; A9 17 | Audio system operation
	STA $7FD2			; 8D D2 7F | Audio system operation
	LDA $7FD4			; AD D4 7F | Audio system operation
	STA $33CC			; 8D CC 33 | Audio system operation
	LDA $33D8			; AD D8 33 | Audio system operation
	STA $7FD4			; 8D D4 7F | Audio system operation
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register
	SBC $65A9			; ED A9 65 | Subtract with carry (absolute)
	INC $7322			; EE 22 73 | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5D1
; Address: $D2FF3E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5D1:
	LDA $33C2			; AD C2 33 | Audio system operation
	STA $7FBA			; 8D BA 7F | Audio system operation
	LDA $33C4			; AD C4 33 | Audio system operation
	STA $7FBC			; 8D BC 7F | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5D2
; Address: $D2FF4A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5D2:
	LDA $33C6			; AD C6 33 | Audio system operation
	STA $7FBE			; 8D BE 7F | Audio system operation
	LDA $33C8			; AD C8 33 | Audio system operation
	STA $7FD0			; 8D D0 7F | Audio system operation
	LDA $33CA			; AD CA 33 | Audio system operation
	STA $7FD2			; 8D D2 7F | Audio system operation
	LDA $33CC			; AD CC 33 | Audio system operation
	STA $7FD4			; 8D D4 7F | Audio system operation
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5D3
; Address: $D2FF63
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5D3:
	JSL $C934C2		  ; 22 C2 34 C9 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5D6
; Address: $D2FF71
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5D6:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5D7
; Address: $D2FF7D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5D7:
	JSL $C08EB0		  ; 22 B0 8E C0 | Jump to subroutine long
	BCS $00			  ; B0 00 | Branch if carry set
	LDA $7DC8			; AD C8 7D | Audio system operation
	STA $33DE			; 8D DE 33 | Audio system operation
	LDA $7DCC			; AD CC 7D | Audio system operation
	STA $33E0			; 8D E0 33 | Audio system operation
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	BNE $EF			  ; D0 EF | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5D8
; Address: $D2FF9C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5D8:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $33DE			; AE DE 33 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5DA
; Address: $D2FFAF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5DA:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5DB
; Address: $D2FFB7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5DB:
	LDX #$C9			 ; A2 C9 | Load immediate value into X register
	LDA #$09			 ; A9 09 | Audio system operation
	BRA $22			  ; 80 22 | Branch always
	CMP $C97C			; CD 7C C9 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5DC
; Address: $D2FFC1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5DC:
	JSL $C9704B		  ; 22 4B 70 C9 | Jump to subroutine long
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	LDA #$65			 ; A9 65 | Audio system operation
	INC $7322			; EE 22 73 | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	LDA #$06			 ; A9 06 | Audio system operation

;------------------------------------------------------------------------------
; Bank24_AudioFunction_5DD
; Address: $D2FFD2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank24_AudioFunction_5DD:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA				  ; BF F9 7F C9 | Load from absolute long,X into accumulator
	AND $7F84			; 2D 84 7F | Logical AND with accumulator (absolute)
	STA $7F84			; 8D 84 7F | Audio system operation
	LDA #$20			 ; A9 20 | Audio system operation
	LDX $A97F,Y		  ; BE 7F A9 | Load from absolute,Y into X register
	TSX				  ; BA | Transfer stack pointer to X register
	LDA #$00			 ; A9 00 | Audio system operation
	PHP				  ; 08 | Push processor status to stack
	STA $7FC0			; 8D C0 7F | Audio system operation
